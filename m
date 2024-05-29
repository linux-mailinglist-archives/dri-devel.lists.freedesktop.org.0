Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCE08D338F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C351110F1BE;
	Wed, 29 May 2024 09:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="McsTEN60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBF710E76D;
 Wed, 29 May 2024 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716976108;
 bh=qf6ymj3RFfkiiaCFpxQKjdAF3Bl843ub+B+34Y8z/as=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=McsTEN60Vjt8NdHBol50pxTr9PPR0mANAwkso+KggPtbLZ96gx6WFt39jPm6RaST2
 9WqjTcIfbEqEMhdoXNljZZnOeUD6j0Y4bb4lPy08ZQ3TCXVOmmqJSvKdPGkTUDWURP
 VXfmKfgIig01ItkT2gCBlOaVsCXhP8ScrJn91p4t5ICU3QWERtAcUqalqq35HiaG4h
 0q5we2lYK1Ihh8muJAvwG+jH9RT1I3ZRltKrUpY80G3rY4+t/ccXt201Zkg9R2Oz77
 FaIYlc7dSvWos34mvwzBQejHsnFwEeLUGa2WrJvFiFAgKvkFZSmJrJh+6Z7HPjYq7C
 Dvhq2jHBKWPTQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 86B76378205D;
 Wed, 29 May 2024 09:48:24 +0000 (UTC)
Message-ID: <12f14064-fd1c-4e9c-94ee-ba7d492a4056@collabora.com>
Date: Wed, 29 May 2024 15:18:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
 <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
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

On 29/05/24 13:39, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
>> test-list.txt and test-list-full.txt are not generated for
>> cross-builds and they are required by drm-ci for testing
>> arm32 targets. This is fixed in igt-gpu-tools. So uprev
>> IGT to include the commit which fixes this issue. Also
>> disable building xe driver tests for non-intel platforms.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Split IGT uprev to seperate patch.
>>
>> v3:
>>    - No changes.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
>> index b7d2a49a6db3..eddb5f782a5e 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>>                  -Dlibunwind=enabled                   \
>>                  -Dprefix=/igt"
>>   
>> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
>> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
>> +fi
>> +
>>   mkdir -p /igt
>>   meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 8f32de63d92e..1b29c3b6406b 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -5,7 +5,7 @@ variables:
>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>     TARGET_BRANCH: drm-next
>>   
>> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
> 
> Let's land this, then I'll ask to uprev to
> dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
> writeback tests on MSM devices.

Sure. Once this is merged, we can uprev to the latest IGT.

Regards,
Vignesh

> 
>>   
>>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>> -- 
>> 2.40.1
>>
> 
