Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E978A48F0C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 04:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FE010E179;
	Fri, 28 Feb 2025 03:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="op4mOU0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AF710E179
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 03:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740712734;
 bh=fC4XySks2OrtI2BeNQrnGvm03KhQ8Zp0VSzwI/DVunQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=op4mOU0P5ExOI1miPRWPl+bw9lwVxDscJVXPeW75Q03ckRuDQON72jXoUv9/mWNCB
 QxHSDVZNLf6zE02BZkdOEpXVD/O9mNc8g57laJos6LLzNQLiO9GLd2YStauYabWKh5
 a0YQ6xTqdmysY5Hv5ksrdtxZ2R3bO0KJ3IkHEMZmsTmOIoHZ1ipl1zya8mCdjH7h/P
 kgWUsg0vCu/6SQAoep8W6Lj2mOXu1doS7GDjGOPCtx/AZ5OgYglEWUGt6EIxoyWi1G
 QQ4T/YB6JebF1DV5EeROw66LCexvfuQ8xODRnbfV3/qyPsxAORHeo26P/flhQeXDEz
 EzzPcNbsgUE5g==
Received: from [192.168.50.250] (unknown [171.76.85.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E58EA17E0663;
 Fri, 28 Feb 2025 04:18:51 +0100 (CET)
Message-ID: <b7c1ca07-e59e-4819-b81a-d4c53c11f830@collabora.com>
Date: Fri, 28 Feb 2025 08:48:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: remove CI_PRE_CLONE_SCRIPT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 linux-kernel@vger.kernel.org
References: <20250227043640.411696-1-vignesh.raman@collabora.com>
 <ukzyfymij2yilyy7ofyi3hj4urlrxxbx5rre3f7qg4zgkc65u5@vbutj63ucctc>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ukzyfymij2yilyy7ofyi3hj4urlrxxbx5rre3f7qg4zgkc65u5@vbutj63ucctc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Dmitry,

On 27/02/25 11:21, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 10:06:24AM +0530, Vignesh Raman wrote:
>> If we are not caching the git archive, do not
>> set CI_PRE_CLONE_SCRIPT. Setting it makes CI
>> try to download the cache first, and if it is
>> missing, it tries to clone the repo within a
>> time limit, which can cause build failures.
> 
> Please wrap the commit message according to the guidelines. 47 chars in
> a line is way too short.
> 
> BTW: this didn't help with the python-artifacts issue. It still times
> out.

The issue was with shallow cloning, and I have posted another patch.
https://lore.kernel.org/dri-devel/20250228031501.483475-1-vignesh.raman@collabora.com/T/#u

The commit message is wrapped according to the guidelines in this patch.

Thanks.

Regards,
Vignesh

> 
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/gitlab-ci.yml | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index f4e324e156db..0bc4ac344757 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -13,12 +13,6 @@ variables:
>>     FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
>>     MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
>>     DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
>> -  CI_PRE_CLONE_SCRIPT: |-
>> -          set -o xtrace
>> -          curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${DRM_CI_PROJECT_URL}/-/raw/${DRM_CI_COMMIT_SHA}/.gitlab-ci/download-git-cache.sh -o download-git-cache.sh
>> -          bash download-git-cache.sh
>> -          rm download-git-cache.sh
>> -          set +o xtrace
>>     S3_JWT_FILE: /s3_jwt
>>     S3_JWT_FILE_SCRIPT: |-
>>         echo -n '${S3_JWT}' > '${S3_JWT_FILE}' &&
>> -- 
>> 2.47.2
>>
> 

