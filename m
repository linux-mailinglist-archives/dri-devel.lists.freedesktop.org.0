Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121757A8C0F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB3310E049;
	Wed, 20 Sep 2023 18:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFF10E049
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:53:33 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F8C16607243;
 Wed, 20 Sep 2023 19:53:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695236011;
 bh=7Q4vVoCNKb2ZuKq/7JZQGFXQTtW+hRNWnPCbB4BvOm0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PzQbb+1zRLPi+RpKj12St/dcSMzYw7iFrWNDcNeQhZ2fakfw6PNsNuYtS4fMwm3RA
 v/+XTN41cO8uIsLMRVmTaru+gWHqlFsDNdTVTkBc5pv3oOQD5ACR3QB8WfdngPIqft
 0MLUNCkAXIqEaXZ4bUVfHwbjindb2HXu3wA1jfM1gv4fIbOy6DFoO8C5H3Irar8ANK
 XdUZUKommI0IODPe4Tt+B/RC+zRhfAHURZuVJZYJlp0sWEecgJpQGqgCdkHlnmeNyy
 Fc641tCQJYmOmL92B4oaNG7LyKWn1jPxIZQzVnxu4AtygbYyOh3DrTTO2eGk/ETqTK
 UpH+6z4JfUETw==
Message-ID: <2ec320ca-d768-89ec-200f-695839e48538@collabora.com>
Date: Wed, 20 Sep 2023 15:53:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/ci: Uprev IGT to pull in fixes
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230920180526.137369-1-robdclark@gmail.com>
 <CAF6AEGvUOX-D+-vwov-FDp46rJdo8wq1Do-9Gj3k5v313wVJhA@mail.gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAF6AEGvUOX-D+-vwov-FDp46rJdo8wq1Do-9Gj3k5v313wVJhA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the patch.

On 20/09/2023 15:10, Rob Clark wrote:
> On Wed, Sep 20, 2023 at 11:06 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> There have been a few igt test fixes compared to the commit that we were
>> currently using.  Pull in a newer igt and update expectations.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---

Could you send here the url of a pipeline run with this change?

>>   drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
>>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |  4 ++--
>>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt   | 11 -----------
>>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt   |  2 +-
>>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt   |  1 -
>>   drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt | 18 +-----------------
>>   .../drm/ci/xfails/rockchip-rk3288-fails.txt    |  2 ++
>>   7 files changed, 7 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 2c4df53f5dfe..3ecb5879e80f 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -5,7 +5,7 @@ variables:
>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>     TARGET_BRANCH: drm-next
>>
>> -  IGT_VERSION: 471bfababd070e1dac0ebb87470ac4f2ae85e663
>> +  IGT_VERSION: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7
>>
>>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>> index bd9392536e7c..bab21930a0d4 100644
>> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>> @@ -1,7 +1,6 @@
>>   kms_addfb_basic@bad-pitch-65536,Fail
>>   kms_addfb_basic@bo-too-small,Fail
>>   kms_async_flips@invalid-async-flip,Fail
>> -kms_atomic@plane-immutable-zpos,Fail
>>   kms_atomic_transition@plane-toggle-modeset-transition,Fail
>>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-1-displays-3840x2160p,Fail
>> @@ -11,9 +10,10 @@ kms_color@degamma,Fail
>>   kms_cursor_crc@cursor-size-change,Fail
>>   kms_cursor_crc@pipe-A-cursor-size-change,Fail
>>   kms_cursor_crc@pipe-B-cursor-size-change,Fail
>> -kms_cursor_legacy@forked-move,Fail
>>   kms_hdr@bpc-switch,Fail
>>   kms_hdr@bpc-switch-dpms,Fail
>>   kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
>>   kms_rmfb@close-fd,Fail
>>   kms_rotation_crc@primary-rotation-180,Fail
>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>> +kms_flip@flip-vs-panning-vs-hang,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>> index 46397ce38d5a..2e3b7c5dac3c 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>> @@ -8,13 +8,6 @@ kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>>   kms_bw@linear-tiling-4-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-4-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-4-displays-3840x2160p,Fail
>> -kms_color@ctm-0-25,Fail
>> -kms_color@ctm-0-50,Fail
>> -kms_color@ctm-0-75,Fail
>> -kms_color@ctm-max,Fail
>> -kms_color@ctm-negative,Fail
>> -kms_color@ctm-red-to-blue,Fail
>> -kms_color@ctm-signed,Fail
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
>> @@ -38,8 +31,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
>>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
>>   kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
>> -kms_hdmi_inject@inject-4k,Timeout
>> -kms_plane@plane-position-hole,Timeout
>>   kms_plane_alpha_blend@alpha-basic,Fail
>>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>> @@ -53,6 +44,4 @@ kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
>>   kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
>>   kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
>>   kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
>> -kms_plane_multiple@tiling-y,Timeout
>> -kms_pwrite_crc,Timeout
>>   kms_sysfs_edid_timing,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>> index 6139b410e767..13c0a25fc627 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>> @@ -1,4 +1,3 @@
>> -kms_color@ctm-0-25,Fail
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
>> @@ -16,3 +15,4 @@ kms_plane_alpha_blend@alpha-basic,Fail
>>   kms_plane_alpha_blend@alpha-opaque-fb,Fail
>>   kms_plane_alpha_blend@alpha-transparent-fb,Fail
>>   kms_plane_alpha_blend@constant-alpha-max,Fail
>> +kms_async_flips@crc,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>> index a6da5544e198..27bfca1c6f2c 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>> @@ -8,7 +8,6 @@ kms_bw@linear-tiling-4-displays-3840x2160p,Fail
>>   kms_bw@linear-tiling-5-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-5-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-5-displays-3840x2160p,Fail
>> -kms_color@ctm-0-25,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Timeout
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>> index 410e0eeb3161..e59a2fddfde0 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
> 
> Side note, I noticed for sc7180-skips (and a lot of other boards) we have:
> 
> # Suspend to RAM seems to be broken on this machine
> .*suspend.*
> 
> Locally I've not had problems with the suspend tests, I'm guessing the
> actual issue is usb-ethernet vs nfsroot.  But maybe the filesys for
> igt jobs is small enough that we can do initramfs instead?  Someone
> should probably confirm what the root issue is and update the
> comments, so developers aren't thinking that suspend is something that
> needs to be debugged

Agreed.

Regards,
Helen

> 
> BR,
> -R
> 
> 
>> @@ -4,20 +4,4 @@
>>   # Test incorrectly assumes that CTM support implies gamma/degamma
>>   # LUT support.  None of the subtests handle the case of only having
>>   # CTM support
>> -kms_color.*
>> -
>> -# 4k@60 is not supported on this hw, but driver doesn't handle it
>> -# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
>> -kms_bw@linear-tiling-.*-displays-3840x2160p
>> -
>> -# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
>> -kms_bw@linear-tiling-2.*
>> -kms_bw@linear-tiling-3.*
>> -kms_bw@linear-tiling-4.*
>> -kms_bw@linear-tiling-5.*
>> -kms_bw@linear-tiling-6.*
>> -
>> -# igt fix posted: https://patchwork.freedesktop.org/patch/499926/
>> -# failure mode is flakey due to randomization but fails frequently
>> -# enough to be detected as a Crash or occasionally UnexpectedPass.
>> -kms_plane_multiple@atomic-pipe-A-tiling-none
>> +#kms_color.*
>> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>> index 2a1baa948e12..15ac861a58bf 100644
>> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>> @@ -46,3 +46,5 @@ kms_properties@connector-properties-legacy,Crash
>>   kms_properties@get_properties-sanity-atomic,Crash
>>   kms_properties@get_properties-sanity-non-atomic,Crash
>>   kms_setmode@invalid-clone-single-crtc,Crash
>> +kms_flip@flip-vs-modeset-vs-hang,Crash
>> +kms_flip@flip-vs-panning-vs-hang,Crash
>> --
>> 2.41.0
>>
