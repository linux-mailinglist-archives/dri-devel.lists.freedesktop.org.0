Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F667AB621
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 18:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0E10E076;
	Fri, 22 Sep 2023 16:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FF610E076
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 16:36:19 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 07D7166072C1;
 Fri, 22 Sep 2023 17:36:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695400578;
 bh=StzjijuhgshkM93uzVvI9X0zOsS0vaEICTCqvv1AW6Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YLzGYijeq7dOen6ZKmdrS0orLODfS40iAVBGl01OQSxYXzqIDRsuYqk0KHP78on5o
 lSyooWiwt0qEvw7BSCcEh7p0iOHjOr1RQjRsLVLkiwdzgF1mAzWiKRMILJYGKY4MNx
 9aB2txvmW0d4RG5rVulZ2JtyALEGtab6m2xxMBcPWM5h3xJG2ho31YDxih4N2ICu14
 wet2oDaJGcKRdGcNezBpflp7Hqz5RKhkWsYTtgeIUxo3+iJ2+V+pLRVGhpaz9PoDvj
 +mqi49QuEWnBjcopvkJiFJg4GaXtiYs6cTbvBVXyK8oiV+R7vucn137CF0sh/Bk2JZ
 7SaWsky7yFosg==
Message-ID: <f8e0caab-32f4-bae4-ef0d-1511c48d67e2@collabora.com>
Date: Fri, 22 Sep 2023 13:36:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/7] drm: ci: Update xfails
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
 <20230914085426.883255-6-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230914085426.883255-6-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, david.heidelberg@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 gustavo.padovan@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi o/

On 14/09/2023 05:54, Vignesh Raman wrote:
> Update amdgpu-stoney-fails, mediatek-mt8173-flakes,
> mediatek-mt8173-fails, rockchip-rk3399-fails, rockchip-rk3399-flakes,
> rockchip-rk3288-flakes, i915-cml-fails, i915-cml-flakes,
> msm-apq8016-flakes files.
> 
> Add tests that fail sometimes into the *-flakes file and tests
> that are failing into the *-fails file.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
> 
> v4:
>    - No changes
> 
> ---
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
>   .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
>   .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
>   .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
>   .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
>   .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
>   10 files changed, 27 insertions(+), 6 deletions(-)

I found an error in the script that updates the flakes from a pipeline, 
it was adding errors in *-flakes.txt instead of *-fails.txt even when it 
was consistently failing.

I have a partial fix where it works if -flakes.txt is empty (otherwise 
it duplicates flakes and fails) 
https://gitlab.freedesktop.org/-/snippets/7655

Could you please regenerate these files with this new version of the script?
Btw, I'm improving the script and I'll submit a RFC proposing to include 
it as a handy tool in ci folder.

Thanks,
Helen


> 
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> index bd9392536e7c..58bfded8a3fc 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> @@ -1,7 +1,6 @@
>   kms_addfb_basic@bad-pitch-65536,Fail
>   kms_addfb_basic@bo-too-small,Fail
>   kms_async_flips@invalid-async-flip,Fail
> -kms_atomic@plane-immutable-zpos,Fail
>   kms_atomic_transition@plane-toggle-modeset-transition,Fail
>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> index 6139b410e767..5f513c638beb 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> @@ -1,4 +1,3 @@
> -kms_color@ctm-0-25,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>   kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> index 0514a7b3fdb0..f06f1a5b16f9 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> @@ -7,6 +7,8 @@ kms_bw@linear-tiling-3-displays-3840x2160p
>   kms_bw@linear-tiling-4-displays-1920x1080p
>   kms_bw@linear-tiling-4-displays-2560x1440p
>   kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_color@ctm-0-25
> +kms_cursor_legacy@torture-move
>   kms_draw_crc@draw-method-xrgb8888-render-xtiled
>   kms_flip@flip-vs-suspend
>   kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> index fc41d13a2d56..3aee1f11ee90 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> @@ -8,6 +8,7 @@ kms_bw@linear-tiling-3-displays-3840x2160p
>   kms_bw@linear-tiling-4-displays-1920x1080p
>   kms_bw@linear-tiling-4-displays-2560x1440p
>   kms_bw@linear-tiling-4-displays-3840x2160p
> +kms_cursor_legacy@torture-bo
>   kms_flip@blocking-wf_vblank
>   kms_flip@wf_vblank-ts-check
>   kms_flip@wf_vblank-ts-check-interruptible
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> index 671916067dba..c8e64bbfd480 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> @@ -1,5 +1,4 @@
>   kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
>   kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> @@ -11,7 +10,6 @@ kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>   kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
>   kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
> -kms_force_connector_basic@force-connector-state,Fail
>   kms_force_connector_basic@force-edid,Fail
>   kms_force_connector_basic@force-load-detect,Fail
>   kms_force_connector_basic@prune-stale-modes,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> index e69de29bb2d1..9ed6722df2c2 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -0,0 +1,16 @@
> +core_setmaster_vs_auth
> +kms_addfb_basic@addfb25-bad-modifier
> +kms_color@invalid-gamma-lut-sizes
> +kms_cursor_legacy@cursor-vs-flip-atomic
> +kms_cursor_legacy@cursor-vs-flip-legacy
> +kms_force_connector_basic@force-connector-state
> +kms_hdmi_inject@inject-4k
> +kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
> +kms_plane_scaling@plane-upscale-with-modifiers-20x20
> +kms_plane_scaling@plane-upscale-with-pixel-format-20x20
> +kms_plane_scaling@plane-upscale-with-rotation-20x20
> +kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
> +kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
> +kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> index 0e3b60d3fade..cd48a8c1d569 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -1,3 +1,5 @@
> +kms_cursor_legacy@forked-bo
> +kms_cursor_legacy@forked-move
>   kms_force_connector_basic@force-connector-state
>   kms_force_connector_basic@force-edid
>   kms_force_connector_basic@force-load-detect
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> index 45c54c75c899..081fe6f8d488 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> @@ -1,6 +1,7 @@
>   kms_addfb_basic@addfb25-bad-modifier
>   kms_cursor_crc@.*
>   kms_flip@basic-flip-vs-wf_vblank
> +kms_flip@blocking-wf_vblank
>   kms_invalid_mode@int-max-clock,Crash
>   kms_pipe_crc_basic@.*
>   kms_properties@connector-properties-atomic,Crash
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> index 6db08ba6b008..029a3be3164d 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> @@ -2,14 +2,13 @@ kms_color@legacy-gamma,Fail
>   kms_color@pipe-A-legacy-gamma,Fail
>   kms_color@pipe-B-legacy-gamma,Fail
>   kms_flip@basic-flip-vs-wf_vblank,Fail
> -kms_flip@blocking-wf_vblank,Fail
>   kms_flip@dpms-vs-vblank-race,Fail
>   kms_flip@flip-vs-absolute-wf_vblank,Fail
>   kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
>   kms_flip@flip-vs-blocking-wf-vblank,Fail
>   kms_flip@flip-vs-panning,Fail
>   kms_flip@flip-vs-panning-interruptible,Fail
> -kms_flip@flip-vs-wf_vblank-interruptible,Fail
> +kms_flip@modeset-vs-vblank-race,Fail
>   kms_flip@plain-flip-fb-recreate,Fail
>   kms_flip@plain-flip-fb-recreate-interruptible,Fail
>   kms_flip@plain-flip-ts-check,Fail
> @@ -35,3 +34,4 @@ kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
>   kms_plane_multiple@tiling-none,Fail
>   kms_prime@basic-crc,Fail
>   kms_rmfb@close-fd,Fail
> +kms_universal_plane@universal-plane-pipe-B-functional,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> index 4c0539b4beaf..869426a02cbd 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> @@ -1,7 +1,10 @@
>   
> +kms_color@gamma
>   kms_cursor_crc@.*
> +kms_flip@blocking-wf_vblank
>   kms_flip@dpms-vs-vblank-race-interruptible
>   kms_flip@flip-vs-expired-vblank
> +kms_flip@flip-vs-wf_vblank-interruptible
>   kms_flip@modeset-vs-vblank-race-interruptible
>   kms_pipe_crc_basic@.*
>   kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A
