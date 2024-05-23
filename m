Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45268CCC0E
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 08:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2471810E438;
	Thu, 23 May 2024 06:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="coShTuf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDE710EC5F;
 Thu, 23 May 2024 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716444457;
 bh=ous1oe/kRPBiEhDvboed42vXxlkNgqhP3ypAKRJeMQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=coShTuf2hYo7TRLfb7IfCR4Zujw4PpdPG/DQ3NeLkqe74gGerapIkIcVEgSnRTEdu
 iOlykt96+WfRFsm4hkM0sokeNs/qFailldaa+TvEqawT9IqysUGEFIomjMQ0oZ89W8
 abpgCL8RunDK5HZKJmbOM/zlXZMAaHlbb5d0T5BertoWrBqCyjfkyVoCfCQ+KNHYBi
 ZwR4PFk8JEyOe44RHUQtaYpgxxES0m4vpV6y45qmXnufBqR0eluXBefdpqyTFNgmu0
 r/ZWUUGsW01BBxSm2uF2EbAXIVUcnL0IjG1GlADRP0rMZvgtnTUbnHj4cy3ivwp3V1
 Z8oTMTKl/pE1g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 119D137820E5;
 Thu, 23 May 2024 06:07:33 +0000 (UTC)
Message-ID: <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
Date: Thu, 23 May 2024 11:37:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
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
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
 <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
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

On 20/05/24 16:13, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
>> zlib.net is not allowing tarball download anymore and results
>> in below error in kernel+rootfs_arm32 container build,
>> urllib.error.HTTPError: HTTP Error 403: Forbidden
>> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
>>
>> Uprev mesa to latest version which includes a fix for this issue.
>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
>>
>> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
>> mesa-rootfs, update the variables accordingly. Also copy helper scripts
>> to install, so that the ci jobs can use these scripts for logging.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Uprev to recent version and use id_tokens for JWT authentication
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>>   drivers/gpu/drm/ci/build.sh       |  6 +++--
>>   drivers/gpu/drm/ci/container.yml  | 12 +++------
>>   drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>>   drivers/gpu/drm/ci/image-tags.yml |  2 +-
>>   drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>>   drivers/gpu/drm/ci/test.yml       |  2 ++
>>   7 files changed, 44 insertions(+), 28 deletions(-)
>>
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 8bc63912fddb..612c9ede3507 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -150,6 +150,8 @@ msm:sdm845:
>>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>>       GPU_VERSION: sdm845
>>       RUNNER_TAG: google-freedreno-cheza
>> +    DEVICE_TYPE: sdm845-cheza-r3
>> +    FARM: google
> 
> I see that this is the only user of the FARM: tag. Is it correct?

No, we need to add FARM variable for other jobs as well.

> Also we miss DEVICE_TYPE for several other boards. Should we be adding
> them?

Yes, device type needs to be added for msm:apq8016, msm:apq8096, virtio_gpu.

I will add this. Thanks.

Regards,
Vignesh

> 
>>     script:
>>       - ./install/bare-metal/cros-servo.sh
>>   
>> -- 
>> 2.40.1
>>
> 
