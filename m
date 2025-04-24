Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195AA9A023
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 06:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12510E2D8;
	Thu, 24 Apr 2025 04:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L0bEFV6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C110E722
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 04:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745469222;
 bh=7L7H1m7WTMw2rrNFw2qugvrsnLMboVo2KxA6ogCXw+M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L0bEFV6UMB8hLMAI11I3XcynyhDIXwOYBFDn3Ib3gNHaNiLu1CQ0frBGYKjxXDtL3
 phsVMRmjr3s5VeQMi29pJ5hee225wT6AUZ0VO6a1NICs7gijN9OVklu2SExcyAxi3e
 MyYoYyjVCc3nrXplOLtJo7WkkQyax/J65JbL1YSweXMjWcF5LzSxL2KU1xqvr7buhc
 m80ySLYi2PfY+GZ+w3mqN7Cu9JSnYMaB59wQR265wQL+uT2dN3+fOk+7B1TmvccKdR
 2Q6X595nU8kiIX9W+UHVzR3Q/VIS7PHH/zlUgpgmMYq4shzKz7IFRvEA9Uzdez0xFt
 UATHXIdqU9mfA==
Received: from [192.168.8.5] (unknown [137.59.78.166])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A321517E088C;
 Thu, 24 Apr 2025 06:33:35 +0200 (CEST)
Message-ID: <f8e4932c-0bdd-44e0-9b1d-72c37024a400@collabora.com>
Date: Thu, 24 Apr 2025 10:03:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/ci: Add jobs to validate devicetrees
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
 <20250417030439.737924-2-vignesh.raman@collabora.com>
 <089fbd77-43ec-4ed5-8bcf-168a502c5270@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <089fbd77-43ec-4ed5-8bcf-168a502c5270@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 24/04/25 00:26, Helen Koike wrote:
> 
> 
> On 17/04/2025 00:04, Vignesh Raman wrote:
>> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
>> exit with a non-zero error code while configuring them as warning in
>> the GitLab CI pipeline.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>
>> v3:
>>    - Add dt-binding-check and dtbs-check jobs to the static-checks stage.
>>
>> v2:
>>    - Use LLVM/Clang instead of GCC to avoid architecture-specific
>>      toolchains for cross-compiling.
>>
>> ---
>>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>   4 files changed, 81 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>
>> diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/ 
>> drm/ci/check-devicetrees.yml
>> new file mode 100644
>> index 000000000000..75c9b009da1f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/check-devicetrees.yml
>> @@ -0,0 +1,44 @@
>> +.dt-check-base:
>> +  stage: static-checks
>> +  timeout: "30m"
>> +  variables:
>> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
>> +    SCHEMA: "display"
> 
> Shouldn't we also check for gpu ?

Yes, it would be good to check gpu as well. I will send v4 with these 
update.

Regards,
Vignesh

> 
> Regards,
> Helen
> 
>> +  before_script:
>> +    - apt-get update -qq
>> +    - apt-get install -y --no-install-recommends clang lld llvm 
>> python3-pip yamllint
>> +    - pip3 install dtschema
>> +  script:
>> +    - drivers/gpu/drm/ci/${SCRIPT_NAME}
>> +  artifacts:
>> +    when: on_failure
>> +    paths:
>> +      - ${ARTIFACT_FILE}
>> +  allow_failure:
>> +    exit_codes:
>> +      - 102
>> +
>> +dtbs-check:arm32:
>> +  extends:
>> +    - .build:arm32
>> +    - .dt-check-base
>> +  variables:
>> +    SCRIPT_NAME: "dtbs-check.sh"
>> +    ARTIFACT_FILE: "dtbs-check.log"
>> +
>> +dtbs-check:arm64:
>> +  extends:
>> +    - .build:arm64
>> +    - .dt-check-base
>> +  variables:
>> +    SCRIPT_NAME: "dtbs-check.sh"
>> +    ARTIFACT_FILE: "dtbs-check.log"
>> +
>> +dt-binding-check:
>> +  extends:
>> +    - .build
>> +    - .use-debian/x86_64_build
>> +    - .dt-check-base
>> +  variables:
>> +    SCRIPT_NAME: "dt-binding-check.sh"
>> +    ARTIFACT_FILE: "dt-binding-check.log"
>> diff --git a/drivers/gpu/drm/ci/dt-binding-check.sh b/drivers/gpu/drm/ 
>> ci/dt-binding-check.sh
>> new file mode 100755
>> index 000000000000..5e9a439c48a4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/dt-binding-check.sh
>> @@ -0,0 +1,16 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: MIT
>> +
>> +set -euxo pipefail
>> +
>> +if ! make -j"${FDO_CI_CONCURRENT:-4}" dt_binding_check \
>> +        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dt-binding-check.log; then
>> +    echo "ERROR: 'make dt_binding_check' failed. Please check dt- 
>> binding-check.log for details."
>> +    exit 1
>> +fi
>> +
>> +if [[ -s dt-binding-check.log ]]; then
>> +    echo "WARNING: dt_binding_check reported warnings. Please check 
>> dt-binding-check.log" \
>> +         "for details."
>> +    exit 102
>> +fi
>> diff --git a/drivers/gpu/drm/ci/dtbs-check.sh b/drivers/gpu/drm/ci/ 
>> dtbs-check.sh
>> new file mode 100755
>> index 000000000000..91212f19fb98
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/dtbs-check.sh
>> @@ -0,0 +1,19 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: MIT
>> +
>> +set -euxo pipefail
>> +
>> +: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
>> +
>> +make LLVM=1 ARCH="${KERNEL_ARCH}" defconfig
>> +
>> +if ! make -j"${FDO_CI_CONCURRENT:-4}" ARCH="${KERNEL_ARCH}" LLVM=1 
>> dtbs_check \
>> +        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dtbs-check.log; then
>> +    echo "ERROR: 'make dtbs_check' failed. Please check dtbs- 
>> check.log for details."
>> +    exit 1
>> +fi
>> +
>> +if [[ -s dtbs-check.log ]]; then
>> +    echo "WARNING: dtbs_check reported warnings. Please check dtbs- 
>> check.log for details."
>> +    exit 102
>> +fi
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/ 
>> gitlab-ci.yml
>> index 65adcd97e06b..ac2f498cfe5a 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -108,6 +108,7 @@ include:
>>     - drivers/gpu/drm/ci/static-checks.yml
>>     - drivers/gpu/drm/ci/build.yml
>>     - drivers/gpu/drm/ci/test.yml
>> +  - drivers/gpu/drm/ci/check-devicetrees.yml
>>     - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/ 
>> lab-status.yml'
>> @@ -117,6 +118,7 @@ stages:
>>     - git-archive
>>     - build-for-tests
>>     - build-only
>> +  - static-checks
>>     - code-validation
>>     - amdgpu
>>     - i915
> 

