Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C845C872CD4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 03:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D494112E23;
	Wed,  6 Mar 2024 02:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MZr+N44x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32514112E1E;
 Wed,  6 Mar 2024 02:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709692854;
 bh=mgOhO0IDZgLwsPvXZt6ogw3x+b9+CWMm5P2F9Ag7u7o=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=MZr+N44xWgYx/KeDYYxby6i5AzGFwBKGEf04A7jZxAjv/oiqSPM+Iac/PrkzORUkH
 A1WXgZKX3mcU8AvNMeimSYpUq9t+Juc6tBMXKanpqny19+fjNt1wAbIolq2ednOBDw
 tanlqsaUCXZnB1wseZjvY1ci9HHDWh3b5k5xvDYaV1PxT0tMOW9DklPtS7+xuMdDdG
 OjxOq2VbGWANCyPIMv2jX4XA0pChfI+Awtt/4eJr+aZkeUYEHzXwriZbtWCFwW466B
 MAgE7dgS0n1Wqkcs5dR+rnPHEJ1gCpsR2axSkhPy+RRHhGjmInK6oQcXWqffprHr2V
 nCXUY3ZHF6V3g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0AC53780624;
 Wed,  6 Mar 2024 02:40:51 +0000 (UTC)
Message-ID: <ea5d08ef-a9bb-5102-4357-21dbae3462cd@collabora.com>
Date: Wed, 6 Mar 2024 08:10:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 9/9] drm/ci: uprev IGT and update testlist
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-10-vignesh.raman@collabora.com>
 <26f6426d-dcb6-4b14-b031-368b2248e9e7@igalia.com>
 <799653a3-e079-4e17-9d68-c0e384a216b0@igalia.com>
 <e1f56317-b70d-0b81-75f0-fef50616e026@collabora.com>
In-Reply-To: <e1f56317-b70d-0b81-75f0-fef50616e026@collabora.com>
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

Hi Maíra,

On 19/02/24 14:22, Vignesh Raman wrote:
> Hi Maíra,
> 
> On 10/02/24 23:50, Maíra Canal wrote:
>> On 2/10/24 15:17, Maíra Canal wrote:
>>> On 1/30/24 12:03, Vignesh Raman wrote:
>>>> Uprev IGT and add amd, v3d, vc4 and vgem specific
>>>> tests to testlist. Have testlist.txt per driver
>>>> and include a base testlist so that the driver
>>>> specific tests will run only on those hardware.
>>>>
>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>> ---
>>>>
>>>> v3:
>>>>    - New patch in series to uprev IGT and update testlist.
>>>>
>>>> ---
>>>>   drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>>>>   drivers/gpu/drm/ci/igt_runner.sh              |  12 +-
>>>>   drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 
>>>> ++++++++++++++++++
>>>>   drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
>>>>   drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
>>>>   drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
>>>>   drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
>>>>   drivers/gpu/drm/ci/testlist.txt               | 100 ++++--------
>>>>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  24 ++-
>>>>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   9 +-
>>>>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  10 +-
>>>>   11 files changed, 427 insertions(+), 70 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
>>>>
>>>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml 
>>>> b/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> index bc8cb3420476..e2b021616a8e 100644
>>>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> @@ -5,7 +5,7 @@ variables:
>>>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>>>     TARGET_BRANCH: drm-next
>>>> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>>>> +  IGT_VERSION: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610
>>>>     DEQP_RUNNER_GIT_URL: 
>>>> https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>>>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>>>> b/drivers/gpu/drm/ci/igt_runner.sh
>>>> index f001e015d135..2fd09b9b7cf6 100755
>>>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>>>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>>>> @@ -64,10 +64,20 @@ if ! grep -q "core_getversion" 
>>>> /install/testlist.txt; then
>>>>   fi
>>>>   set +e
>>>> +if [ "$DRIVER_NAME" = "amdgpu" ]; then
>>>> +    TEST_LIST="/install/testlist-amdgpu.txt"
>>>> +elif [ "$DRIVER_NAME" = "msm" ]; then
>>>> +    TEST_LIST="/install/testlist-msm.txt"
>>>> +elif [ "$DRIVER_NAME" = "panfrost" ]; then
>>>> +    TEST_LIST="/install/testlist-panfrost.txt"
>>>> +else
>>>> +    TEST_LIST="/install/testlist.txt"
>>>> +fi
>>>> +
>>>
>>> Isn't V3D and VC4 testlists missing?
> 
> Yes. We need to add ci jobs to test v3d/vc4. The initial idea was just 
> to split the testlist per driver and add vc4/v3d tests so that it can be 
> used in future. I will add the jobs as part of v4.

To include RPi jobs, we need to tweak mesa-ci to pass kernel and dtb and 
update mesa-ci in drm-ci. So will send this as a seperate patch/series.

Regards,
Vignesh
