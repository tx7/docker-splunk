#!/bin/bash

# Copyright 2018 Splunk

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

IMAGE_VERSION_SHA=`cat /opt/splunk-etc/splunk.version | sha512sum`

if [[ -f "/opt/splunk/etc/splunk.version" ]]; then
	ETC_VERSION_SHA=`cat /opt/splunk/etc/splunk.version | sha512sum`
fi

if [[ "x${IMAGE_VERSION_SHA}" != "x${ETC_VERSION_SHA}" ]]; then
    echo Updating /opt/splunk/etc
    (cd /opt/splunk-etc; tar cf - *) | (cd /opt/splunk/etc; tar xf -)
fi
