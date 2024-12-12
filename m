Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6859EDF34
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 07:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55310ECC2;
	Thu, 12 Dec 2024 06:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NpefOtj8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ED510E7A4;
 Thu, 12 Dec 2024 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733983599;
 bh=gQg/SM6BaV0O6607W1vHe3GKWdp7ZsBXFCJWNiK9SFw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NpefOtj8iRu+DwDxM1asoHnH6dziH2LfwLXKHmxJwjyTK2JN3w24yG15L61xz/p4E
 1Q1hNWZSfjRGmpsMMSTs9jLtwssefNOSG/RM9//dKBgGoAZsPgvidKcKcmYdqNDckT
 DvXj7srS8GjxNG82ITA2ZyObZDMr+FKJHnPXJ2eCGa/aPO9skbkJH1KUiy92L5TrrG
 xe21GkQQE1jht1xTcoxCHfDQkpM7JcmrU5YdJUw6tiO4zFjK2H8i7k5fb5KgqX2LQ0
 4RGQwkIzVXHI/rHmuP57LGp8g4Zw2YWtHmYQD+Vb8T5wcqhADpRO9HVMDW86ncn8wZ
 iSdqcwuU72+UQ==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8F6917E11E2;
 Thu, 12 Dec 2024 07:06:32 +0100 (CET)
Message-ID: <3e719a95-5b84-4530-9afe-c742e5c6eff7@collabora.com>
Date: Thu, 12 Dec 2024 11:36:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241211142806.1824961-1-vignesh.raman@collabora.com>
 <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
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

On 12/12/24 03:09, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 07:58:05PM +0530, Vignesh Raman wrote:
>> Uprev IGT to the latest version and update expectation files.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v1:
>>    - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>>      Will update the flake bug report link after v1 is reviewed.
>>
>> ---
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> index 066d24ee3e08..7752adff05c1 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>> @@ -1,4 +1,7 @@
>>   kms_3d,Fail
>> +kms_cursor_legacy@forked-bo,Fail
>> +kms_cursor_legacy@forked-move,Fail
>> +kms_cursor_legacy@single-bo,Fail
>>   kms_cursor_legacy@torture-bo,Fail
> 
> Interesting, DRM_MODE_CURSOR_BO tests fail
> 
>>   kms_force_connector_basic@force-edid,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> index 6dbc2080347d..581d0aa33b4f 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>>   kms_color@ctm-signed,Fail
>>   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> This is a bug in 5f7cde6a9878 ("tests/kms_display_modes: Skip test if
> joiner display is connected"), the driver unconditionally calls
> is_joiner_mode(), or in 88abc2d2c646 ("lib/igt_kms: Add is_joiner_mode
> function"), the is_joiner_mode() should return false for non-Intel
> hardware. Please fix it in the IGT instead.

Can we add this in skips mentioning the IGT gitab issue link?

> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>>   kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> index d74e04405e65..5122233b9941 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>> @@ -18,3 +18,10 @@ msm/msm_shrink@copy-gpu-oom-32
>>   # IGT Version: 1.28-g0df7b9b97
>>   # Linux Version: 6.9.0-rc7
>>   msm/msm_shrink@copy-gpu-oom-8
>> +
>> +# Board Name: sc7180-trogdor-kingoftown
>> +# Bug Report:
>> +# Failure Rate: 50
>> +# IGT Version: 1.29-g33adea9eb
>> +# Linux Version: 6.13.0-rc2
>> +kms_lease@page-flip-implicit-plane
> 
> Do you have a failure log?


https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68026461#L3262

Let me know if I can create a gitlab issue for this.

Regards,
Vginesh

> 
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> index 6dbc2080347d..581d0aa33b4f 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>>   kms_color@ctm-signed,Fail
>>   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>>   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> Again, the same IGT issue.
> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>>   kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> index fa8c7e663858..69076751af24 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>> @@ -1,4 +1,3 @@
>> -drm_read@invalid-buffer,Fail
>>   kms_color@ctm-0-25,Fail
>>   kms_color@ctm-0-50,Fail
>>   kms_color@ctm-0-75,Fail
>> @@ -19,6 +18,8 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
>>   kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
>>   kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
>>   kms_cursor_legacy@flip-vs-cursor-legacy,Fail
>> +kms_display_modes@extended-mode-basic,Fail
>> +kms_display_modes@mst-extended-mode-negative,Fail
> 
> The same IGT error
> 
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_lease@lease-uevent,Fail
>> @@ -28,4 +29,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_plane_cursor@overlay,Fail
>>   kms_plane_cursor@viewport,Fail
>> -kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> index 4892c0c70a6d..8d26b23133aa 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> @@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
>>   kms_cursor_legacy@torture-move,Fail
>>   kms_hdmi_inject@inject-4k,Fail
>>   kms_lease@lease-uevent,Fail
>> -kms_plane_alpha_blend@alpha-7efc,Fail
>> -kms_plane_alpha_blend@alpha-basic,Fail
>> -kms_plane_alpha_blend@alpha-opaque-fb,Fail
>> -kms_plane_alpha_blend@alpha-transparent-fb,Fail
>> -kms_plane_alpha_blend@constant-alpha-max,Fail
>>   msm/msm_recovery@gpu-fault-parallel,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>> deleted file mode 100644
>> index c1859d9b165f..000000000000
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -# Board Name: sm8350-hdk
>> -# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
>> -# Failure Rate: 100
>> -# IGT Version: 1.28-ga73311079
>> -# Linux Version: 6.12.0-rc1
>> -msm/msm_recovery@gpu-fault
> 
