Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE749A6969E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458C310E561;
	Wed, 19 Mar 2025 17:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QCO1IYyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AB410E561;
 Wed, 19 Mar 2025 17:35:37 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so10654260a12.3; 
 Wed, 19 Mar 2025 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742405736; x=1743010536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/uhGFqTyaOumMsYNHXIp6FUQP7Ag9xiRkyt2ORSh4E=;
 b=QCO1IYyr2KvzI90u2cCscAeF5fF7YblJhyveIQhVQf0B+PT+HIcFBDt9Cu34GI1Y+A
 SvSqtF3R1YLy49cfKjVyy0KS7jQlAx2r0YgSSzs/sSsy/9bZFQMBl1WkZjF7lNhe6wVT
 QS/rI8SfUMxs1dKxsuTsPn+e+qOvA7SbDK5mdJgrYN1ERF9kKJDZsPwCkbglLoyRM9H1
 /kxCYbr+7VyhHGIoohRdjGWI7KYe2jOXZkqm5zxi0McktHgvjSSlARft8p9XXusH0ZWv
 rQMF34pU90QPuEpFiodmxt8lPAu1O0FmSjXUlUW4CI8Vq8Tb2uIjsB1+dqiu+10Um7wk
 PLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742405736; x=1743010536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/uhGFqTyaOumMsYNHXIp6FUQP7Ag9xiRkyt2ORSh4E=;
 b=ki2KwX+442XGpqZqnqJCiX4XX6qfZazecop52xzDL/oOqz/rrlLpVx8mvgoZ5pxpRr
 37LdqXQDJCOzDOcbDyHRlPY39F1O0knywioSLMbHcaKRlpPfRuXz11PuGz1Q20nUvMC2
 TYSa5dlzILMJOT2uCtenkXk0eIPPQxR9wdbK1cM3ws6NxwgMWh21HFOcEJg7FYMgq/PB
 gFdShMcJsos0NPvharuqwoWOSTtmBDs6+qRwAIewmvdenW/tlQJuVjBvi5Tofgf3PWhA
 +6L+3HWUJVWhMSuWKTj6UUB8+YgYFnPmXF0iaWpTZO61GBLtwcIHdOZRWGDIV1+laaP1
 84TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOmeaVvIrgcjSnLnlcLkj4Frg1/7EF80oELcaw/b8fQ2g1GlfEyU3ndYiAuRbrumnTObBDRfed@lists.freedesktop.org,
 AJvYcCWciotDX3g9IvEp0GcCI9dDWGzQbQ9Dl+wrKpJnLphaKGiCKusNkcRhLRgTz7dEseSbEekrIl2FNJ67@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxMcVpRfCpxDug5eFxQvBZoPv2HaUoksfSqmbm83Ct5OEeJewI
 0IW2nKzFXUnuxCb9fX2HkOiotkFfTGEHV+siU5KCrPdyFP5LBD+ynKmeEZW0L46U4lxIoyyJnZ+
 yvcMAbUBxYdUay8STISQ/MMWs41k=
X-Gm-Gg: ASbGncumabiXemOiqUyjy3PqTSir8n/C2rcTtmCDubEjhIqpcXNVNhCM01BgmBUaCDM
 1HrfAhh+hWP9yhoEqCN+yxiZJOo3pLOORm4EHNR+V8OCAPFQHj6l5XMe3c9mpdv5CbyN1qbTHe4
 ek4Wmp/uK61VwETOR4naiDB4hjhrs=
X-Google-Smtp-Source: AGHT+IFbz4+7+hMScBL0MAtr6y9gv7RG1uU683pP/7O8uDto7IgKCQ3P/KRBJiqnwBPZ5t2oKebQOA+LaHoCcLUpIvk=
X-Received: by 2002:a05:6402:1d4a:b0:5e7:b081:aa7c with SMTP id
 4fb4d7f45d1cf-5eb9f3d21demr128324a12.12.1742405735283; Wed, 19 Mar 2025
 10:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-3-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-3-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 19 Mar 2025 14:35:23 -0300
X-Gm-Features: AQ5f1Jo7U7Au7U6G9Uzn8jLI6Qbx3uwGyL9KVZvEyOq_S4y-bz6bC0pjOuuS0Ho
Message-ID: <CAPW4XYbY9-24_iUMhTw9TqmVMhk9W2RzS06-DvOuw8ONoGa-Kg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/ci: uprev IGT
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Uprev IGT to the latest version and update expectation files.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

It feels that the xfails list is growing more instead of shrinking, well...

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks
Helen

> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   1 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  23 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  20 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  32 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  13 +-
>  drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   5 -
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   9 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  22 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   1 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  20 ++
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   1 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  28 +-
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  21 ++
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   1 +
>  .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   1 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 -
>  .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   1 +
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   1 +
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |   7 +
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   4 +
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   7 +
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   1 +
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   7 +
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 313 ++++++++++++++++++
>  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |   1 +
>  .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   1 +
>  .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   1 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   1 -
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   1 +
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  30 +-
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   1 +
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 +
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   1 +
>  .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  28 ++
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   2 +
>  49 files changed, 554 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> index 55b540c4cf92..65adcd97e06b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
>    TARGET_BRANCH: drm-next
>
> -  IGT_VERSION: 33adea9ebafd059ac88a5ccfec60536394f36c7c
> +  IGT_VERSION: 04bedb9238586b81d4d4ca62b02e584f6cfc77af
>
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.g=
it
>    DEQP_RUNNER_GIT_TAG: v0.20.0
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/=
gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> index 75374085f40f..f44dbce3151a 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> @@ -14,16 +14,10 @@ amdgpu/amd_plane@mpo-scale-nv12,Fail
>  amdgpu/amd_plane@mpo-scale-p010,Fail
>  amdgpu/amd_plane@mpo-scale-rgb,Crash
>  amdgpu/amd_plane@mpo-swizzle-toggle,Fail
> -amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Crash
> +amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
>  kms_addfb_basic@bad-pitch-65536,Fail
>  kms_addfb_basic@bo-too-small,Fail
>  kms_addfb_basic@too-high,Fail
> -kms_async_flips@alternate-sync-async-flip,Fail
> -kms_async_flips@alternate-sync-async-flip-atomic,Fail
> -kms_async_flips@test-cursor,Fail
> -kms_async_flips@test-cursor-atomic,Fail
> -kms_async_flips@test-time-stamp,Fail
> -kms_async_flips@test-time-stamp-atomic,Fail
>  kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
>  kms_atomic_transition@plane-all-transition,Fail
>  kms_atomic_transition@plane-all-transition-nonblocking,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/=
gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> index 3879c4812a22..902d54027506 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> @@ -14,6 +14,7 @@ gem_.*
>  i915_.*
>  xe_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/=
drm/ci/xfails/i915-amly-fails.txt
> index a29cea4f234c..8e2b5504004e 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> @@ -1,22 +1,18 @@
> -core_setmaster@master-drop-set-shared-fd,Fail
> +core_setmaster_vs_auth,Fail
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
>  i915_module_load@resize-bar,Fail
>  i915_pm_rpm@gem-execbuf-stress,Timeout
>  i915_pm_rpm@module-reload,Fail
> -kms_async_flips@test-time-stamp,Timeout
> -kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
> -kms_flip@dpms-off-confusion-interruptible,Timeout
> -kms_flip@wf_vblank-ts-check-interruptible,Fail
> +kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
> +kms_fb_coherency@memset-crc,Crash
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
> @@ -31,12 +27,18 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-d=
ownscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
>  kms_lease@lease-uevent,Fail
> -kms_lease@page-flip-implicit-plane,Timeout
>  kms_plane_alpha_blend@alpha-basic,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_plane_scaling@planes-upscale-factor-0-25,Timeout
> +kms_pm_backlight@brightness-with-dpms,Crash
> +kms_pm_backlight@fade,Crash
> +kms_prop_blob@invalid-set-prop-any,Fail
> +kms_properties@connector-properties-legacy,Timeout
> +kms_universal_plane@disable-primary-vs-flip,Timeout
>  perf@i915-ref-count,Fail
>  perf_pmu@module-unload,Fail
>  perf_pmu@rc6,Crash
> @@ -44,8 +46,3 @@ sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/=
drm/ci/xfails/i915-amly-skips.txt
> index 2ef1dc35a7fa..922327632eff 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> @@ -11,6 +11,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-apl-fails.txt
> index ee11999e3da1..7353ab11e940 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> @@ -1,4 +1,3 @@
> -core_setmaster@master-drop-set-user,Fail
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
> @@ -16,6 +15,7 @@ kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-u=
pscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> @@ -30,7 +30,6 @@ kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@constant-alpha-max,Fail
>  kms_pm_backlight@basic-brightness,Fail
> -kms_pm_backlight@brightness-with-dpms,Crash
>  kms_pm_backlight@fade,Fail
>  kms_pm_backlight@fade-with-dpms,Fail
>  kms_pm_rpm@modeset-stress-extra-wait,Timeout
> @@ -43,8 +42,3 @@ sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-apl-skips.txt
> index 4f50e0240ff4..80bf2741866c 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> @@ -13,6 +13,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-cml-fails.txt
> index 47b3f1d42bb6..6fef7c1e56ea 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> @@ -1,4 +1,4 @@
> -core_setmaster@master-drop-set-shared-fd,Fail
> +core_setmaster_vs_auth,Fail
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
> @@ -8,8 +8,9 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
>  i915_pm_rpm@gem-execbuf-stress,Timeout
>  i915_pm_rpm@module-reload,Fail
>  i915_pm_rpm@system-suspend-execbuf,Timeout
> -kms_async_flips@test-time-stamp,Timeout
> -kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
> +kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
> +kms_cursor_crc@cursor-suspend,Timeout
> +kms_fb_coherency@memset-crc,Crash
>  kms_flip@busy-flip,Timeout
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> @@ -34,17 +35,22 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-u=
pscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
>  kms_lease@lease-uevent,Fail
> -kms_lease@page-flip-implicit-plane,Timeout
> +kms_pipe_stress@stress-xrgb8888-untiled,Fail
> +kms_pipe_stress@stress-xrgb8888-ytiled,Fail
>  kms_plane_alpha_blend@alpha-basic,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_plane_scaling@planes-upscale-factor-0-25,Timeout
> +kms_pm_backlight@brightness-with-dpms,Crash
> +kms_pm_backlight@fade,Crash
> +kms_prop_blob@invalid-set-prop-any,Fail
> +kms_properties@connector-properties-legacy,Timeout
>  kms_psr2_sf@cursor-plane-update-sf,Fail
>  kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
>  kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
>  kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
>  kms_psr2_sf@plane-move-sf-dmg-area,Fail
> -kms_psr2_sf@pr-cursor-plane-update-sf,Timeout
>  kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
>  kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
>  kms_psr2_sf@psr2-cursor-plane-update-sf,Fail
> @@ -57,6 +63,7 @@ kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-f=
b,Fail
>  kms_psr2_su@page_flip-NV12,Fail
>  kms_psr2_su@page_flip-P010,Fail
>  kms_setmode@basic,Fail
> +kms_universal_plane@disable-primary-vs-flip,Timeout
>  perf@i915-ref-count,Fail
>  perf_pmu@module-unload,Fail
>  perf_pmu@rc6,Crash
> @@ -65,6 +72,3 @@ sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-cml-skips.txt
> index c87ff8b40e99..c393a138b8a6 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> @@ -9,6 +9,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> @@ -16,7 +17,6 @@ gem_.*
>  # Hangs the machine and timeout occurs
>  i915_pm_rc6_residency.*
>  i915_suspend.*
> -xe_module_load.*
>  api_intel_allocator.*
>  kms_cursor_legacy.*
>  i915_pm_rpm.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-glk-fails.txt
> index 843c363b42f5..8adf5f0a6e80 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> @@ -1,39 +1,47 @@
> -core_setmaster@master-drop-set-shared-fd,Fail
> -core_setmaster@master-drop-set-user,Fail
> +core_setmaster_vs_auth,Fail
>  gen9_exec_parse@unaligned-access,Fail
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
>  i915_module_load@resize-bar,Fail
> -kms_dirtyfb@default-dirtyfb-ioctl,Fail
>  kms_dirtyfb@drrs-dirtyfb-ioctl,Fail
> -kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
> +kms_flip@blocking-wf_vblank,Fail
> +kms_flip@wf_vblank-ts-check,Fail
>  kms_flip@wf_vblank-ts-check-interruptible,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
> -kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
> +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
> +kms_frontbuffer_tracking@fbc-tiling-linear,Fail
>  kms_lease@lease-uevent,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
> +kms_plane_scaling@planes-upscale-factor-0-25,Timeout
> +kms_pm_backlight@brightness-with-dpms,Crash
> +kms_pm_backlight@fade,Crash
> +kms_prop_blob@invalid-set-prop-any,Fail
> +kms_properties@connector-properties-legacy,Timeout
> +kms_rotation_crc@multiplane-rotation,Fail
>  kms_rotation_crc@multiplane-rotation-cropping-top,Fail
> +kms_universal_plane@disable-primary-vs-flip,Timeout
>  perf@non-zero-reason,Timeout
>  sysfs_heartbeat_interval@long,Timeout
> +sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-glk-skips.txt
> index 219ae839323a..2e4ef9f35654 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> @@ -12,6 +12,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-jsl-fails.txt
> index 0e08fff741aa..57453e340040 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
> @@ -3,12 +3,13 @@ i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
>  i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
>  kms_flip@dpms-off-confusion,Fail
> +kms_flip@nonexisting-fb,Fail
>  kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset,Fail
> -kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> -kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> +kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Unexpect=
edImprovement(Skip)
>  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
> @@ -28,7 +29,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-dow=
nscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
> -kms_frontbuffer_tracking@fbc-rgb565-draw-blt,Timeout
>  kms_lease@lease-uevent,Fail
>  kms_pm_rpm@modeset-stress-extra-wait,Timeout
>  kms_rotation_crc@bad-pixel-format,Fail
> @@ -37,13 +37,10 @@ kms_rotation_crc@multiplane-rotation-cropping-bottom,=
Fail
>  kms_rotation_crc@multiplane-rotation-cropping-top,Fail
>  perf@i915-ref-count,Fail
>  perf_pmu@module-unload,Fail
> +perf_pmu@most-busy-idle-check-all,Fail
>  perf_pmu@rc6,Crash
> +prime_busy@before-wait,Fail
>  sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-jsl-skips.txt
> index 1a3d87c0ca6e..8dec57da1bb3 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
> @@ -9,6 +9,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-kbl-fails.txt
> index d4fba4f55ec1..117098bc95d9 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> @@ -21,8 +21,3 @@ sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-kbl-skips.txt
> index dc722d6a774e..e287462a491a 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> @@ -12,6 +12,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-tgl-fails.txt
> index 93d42b146df9..462c050a8b2d 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> @@ -1,13 +1,14 @@
>  api_intel_allocator@reopen,Timeout
>  api_intel_bb@destroy-bb,Timeout
>  core_hotunplug@hotrebind-lateclose,Timeout
> -drm_read@short-buffer-block,Timeout
>  dumb_buffer@map-valid,Timeout
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
>  i915_module_load@resize-bar,Fail
> +i915_pm_rpm@gem-execbuf-stress,Timeout
>  i915_pm_rps@engine-order,Timeout
> +i915_pm_rps@waitboost,Fail
>  kms_lease@lease-uevent,Fail
>  kms_rotation_crc@multiplane-rotation,Fail
>  perf@i915-ref-count,Fail
> @@ -16,6 +17,7 @@ perf_pmu@enable-race,Timeout
>  perf_pmu@module-unload,Fail
>  perf_pmu@rc6,Crash
>  perf_pmu@semaphore-wait-idle,Timeout
> +prime_busy@before,Fail
>  prime_mmap@test_refcounting,Timeout
>  sriov_basic@enable-vfs-bind-unbind-each-numvfs-all,Timeout
>  syncobj_basic@illegal-fd-to-handle,Timeout
> @@ -26,8 +28,3 @@ syncobj_wait@multi-wait-all-submitted,Timeout
>  syncobj_wait@multi-wait-for-submit-submitted-signaled,Timeout
>  syncobj_wait@wait-any-complex,Timeout
>  syncobj_wait@wait-delayed-signal,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-tgl-skips.txt
> index 938377896841..429dc3c731df 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> @@ -18,6 +18,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-whl-fails.txt
> index 1cb6978c86dc..0f167cfd503c 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> @@ -1,4 +1,4 @@
> -core_setmaster@master-drop-set-shared-fd,Fail
> +core_setmaster_vs_auth,Fail
>  i915_module_load@load,Fail
>  i915_module_load@reload,Fail
>  i915_module_load@reload-no-display,Fail
> @@ -6,10 +6,9 @@ i915_module_load@resize-bar,Fail
>  i915_pm_rpm@gem-execbuf-stress,Timeout
>  i915_pm_rpm@module-reload,Fail
>  i915_pm_rpm@system-suspend-execbuf,Timeout
> -kms_async_flips@test-time-stamp,Timeout
> -kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
> -kms_dirtyfb@default-dirtyfb-ioctl,Fail
> -kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
> +kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
> +kms_cursor_crc@cursor-suspend,Timeout
> +kms_fb_coherency@memset-crc,Crash
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -30,13 +29,19 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-d=
ownscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
> +kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
>  kms_frontbuffer_tracking@fbc-tiling-linear,Fail
>  kms_lease@lease-uevent,Fail
> -kms_lease@page-flip-implicit-plane,Timeout
>  kms_plane_alpha_blend@alpha-basic,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_plane_scaling@planes-upscale-factor-0-25,Timeout
> +kms_pm_backlight@brightness-with-dpms,Crash
> +kms_pm_backlight@fade,Crash
> +kms_prop_blob@invalid-set-prop-any,Fail
> +kms_properties@connector-properties-legacy,Timeout
> +kms_universal_plane@disable-primary-vs-flip,Timeout
>  perf@i915-ref-count,Fail
>  perf_pmu@module-unload,Fail
>  perf_pmu@rc6,Crash
> @@ -45,8 +50,3 @@ sysfs_heartbeat_interval@long,Timeout
>  sysfs_heartbeat_interval@off,Timeout
>  sysfs_preempt_timeout@off,Timeout
>  sysfs_timeslice_duration@off,Timeout
> -xe_module_load@force-load,Fail
> -xe_module_load@load,Fail
> -xe_module_load@many-reload,Fail
> -xe_module_load@reload,Fail
> -xe_module_load@reload-no-display,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/d=
rm/ci/xfails/i915-whl-skips.txt
> index 29bff8922ae1..7e7374ebf3d1 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> @@ -9,6 +9,7 @@ nouveau_.*
>  ^v3d.*
>  ^vc4.*
>  ^vmwgfx*
> +^xe.*
>
>  # GEM tests takes ~1000 hours, so skip it
>  gem_.*
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/driver=
s/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> index 4f176c04ec4e..592d7d69e6fc 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> @@ -17,8 +17,28 @@ kms_bw@linear-tiling-2-displays-3840x2160p,Fail
>  kms_color@invalid-gamma-lut-sizes,Fail
>  kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>  kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-toggle,Fail
> +kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
> +kms_flip@basic-plain-flip,Fail
> +kms_flip@dpms-off-confusion,Fail
> +kms_flip@dpms-off-confusion-interruptible,Fail
> +kms_flip@flip-vs-absolute-wf_vblank,Fail
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
> +kms_flip@flip-vs-blocking-wf-vblank,Fail
> +kms_flip@flip-vs-expired-vblank,Fail
> +kms_flip@flip-vs-expired-vblank-interruptible,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning,Fail
> +kms_flip@flip-vs-panning-interruptible,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_flip@flip-vs-suspend,Fail
>  kms_flip@flip-vs-suspend-interruptible,Fail
> +kms_flip@plain-flip-fb-recreate,Fail
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
> +kms_flip@plain-flip-interruptible,Fail
> +kms_flip@plain-flip-ts-check,Fail
> +kms_flip@plain-flip-ts-check-interruptible,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail
>  kms_lease@lease-uevent,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drive=
rs/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> index 2956567c3048..443596d9e662 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -46,3 +46,10 @@ kms_prop_blob@invalid-set-prop
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_bw@connected-linear-tiling-1-displays-2160x1440p
> +
> +# Board Name: mt8173-elm-hana
> +# Bug Report: https://lore.kernel.org/linux-mediatek/d25442b9-0b6b-433c-=
8e23-997840fad305@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_flip@flip-vs-wf_vblank-interruptible
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/driver=
s/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> index d0db51874aef..b5ee7323a160 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> @@ -11,6 +11,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/driver=
s/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> index 5a063361d7f2..184d0cccc318 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> @@ -1,12 +1,38 @@
> -core_setmaster@master-drop-set-user,Fail
>  dumb_buffer@create-clear,Crash
>  kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
>  kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
>  kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
>  kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>  kms_bw@linear-tiling-1-displays-2160x1440p,Fail
>  kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_color@invalid-gamma-lut-sizes,Fail
>  kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-toggle,Fail
> +kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
> +kms_flip@basic-flip-vs-wf_vblank,Fail
> +kms_flip@basic-plain-flip,Fail
> +kms_flip@dpms-off-confusion,Fail
> +kms_flip@dpms-off-confusion-interruptible,Fail
> +kms_flip@flip-vs-absolute-wf_vblank,Fail
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
> +kms_flip@flip-vs-blocking-wf-vblank,Fail
> +kms_flip@flip-vs-expired-vblank,Fail
> +kms_flip@flip-vs-expired-vblank-interruptible,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning,Fail
> +kms_flip@flip-vs-panning-interruptible,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_flip@flip-vs-suspend,Fail
> +kms_flip@flip-vs-suspend-interruptible,Fail
> +kms_flip@flip-vs-wf_vblank-interruptible,Fail
> +kms_flip@plain-flip-fb-recreate,Fail
> +kms_flip@plain-flip-fb-recreate-interruptible,Fail
> +kms_flip@plain-flip-interruptible,Fail
> +kms_flip@plain-flip-ts-check,Fail
> +kms_flip@plain-flip-ts-check-interruptible,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail
>  kms_lease@lease-uevent,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drive=
rs/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> index df7e5ce7a036..0c67fec92450 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> @@ -18,3 +18,24 @@ kms_cursor_legacy@cursor-vs-flip-atomic-transitions
>  # IGT Version: 1.28-gf13702b8e
>  # Linux Version: 6.10.0-rc5
>  fbdev@write
> +
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
> +# Bug Report: https://lore.kernel.org/linux-mediatek/a520d1d6-95b3-4573-=
b8f2-689f05bc2230@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_flip@basic-flip-vs-modeset
> +
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
> +# Bug Report: https://lore.kernel.org/linux-mediatek/ca960a82-00fc-4183-=
b983-998f7ac2fbb5@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_atomic_transition@plane-all-modeset-transition-internal-panels
> +
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
> +# Bug Report: https://lore.kernel.org/linux-mediatek/da578eed-224f-4374-=
853a-1ff0aa20d03b@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_atomic_transition@plane-toggle-modeset-transition
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/driver=
s/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> index d0db51874aef..b5ee7323a160 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> @@ -11,6 +11,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu=
/drm/ci/xfails/meson-g12b-skips.txt
> index 8198e06344a3..9fd44a4b962a 100644
> --- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> @@ -11,6 +11,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gp=
u/drm/ci/xfails/msm-apq8016-fails.txt
> index 7752adff05c1..72c469021b66 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,8 +1,4 @@
>  kms_3d,Fail
> -kms_cursor_legacy@forked-bo,Fail
> -kms_cursor_legacy@forked-move,Fail
> -kms_cursor_legacy@single-bo,Fail
> -kms_cursor_legacy@torture-bo,Fail
>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail
>  kms_lease@lease-uevent,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gp=
u/drm/ci/xfails/msm-apq8016-skips.txt
> index 1674c8e214d6..87724413174c 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> @@ -10,6 +10,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gp=
u/drm/ci/xfails/msm-apq8096-skips.txt
> index 5550be5486ed..a4d2f2a7963a 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> @@ -13,6 +13,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flak=
es.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> index 8910afb6acf2..d270af1cca52 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> @@ -32,3 +32,10 @@ kms_lease@page-flip-implicit-plane
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_plane@plane-position-hole-dpms
> +
> +# Board Name: sc7180-trogdor-kingoftown
> +# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/73
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_plane@plane-position-covered
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skip=
s.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> index 478d7c161616..d4b8ba3a54a9 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> @@ -13,6 +13,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> @@ -28,3 +29,6 @@ kms_cursor_crc@cursor-random-max-size
>  # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
>  kms_display_modes@extended-mode-basic
>  kms_display_modes@mst-extended-mode-negative
> +
> +# It causes other tests to fail, so skip it.
> +kms_invalid_mode@overflow-vrefresh
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-=
flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fl=
akes.txt
> index cd3d3b0befe4..cafc802cecea 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.=
txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.=
txt
> @@ -11,3 +11,10 @@ msm/msm_mapping@shadow
>  # IGT Version: 1.28-gf13702b8e
>  # Linux Version: 6.10.0-rc5
>  kms_lease@page-flip-implicit-plane
> +
> +# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> +# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/74
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_cursor_crc@cursor-random-128x128
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-=
skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-ski=
ps.txt
> index ef9318afcd89..022db559cc7d 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.t=
xt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.t=
xt
> @@ -13,6 +13,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gp=
u/drm/ci/xfails/msm-sdm845-flakes.txt
> index 38ec0305c1f4..e32d73c6c98e 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> @@ -130,3 +130,10 @@ kms_lease@page-flip-implicit-plane
>  # IGT Version: 1.28-ga73311079
>  # Linux Version: 6.11.0-rc5
>  kms_flip@flip-vs-expired-vblank
> +
> +# Board Name: sdm845-cheza-r3
> +# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/75
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_flip@plain-flip-ts-check-interruptible
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu=
/drm/ci/xfails/msm-sdm845-skips.txt
> index 2ce7f7e23a01..6c86d1953e11 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> @@ -18,6 +18,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> @@ -35,3 +36,315 @@ kms_content_protection@uevent
>  # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
>  kms_display_modes@extended-mode-basic
>  kms_display_modes@mst-extended-mode-negative
> +
> +# Kernel panic
> +msm/msm_recovery@hangcheck
> +# DEBUG - Begin test msm/msm_recovery@hangcheck
> +# Console: switching to colour dummy device 80x25
> +# [  489.526286] [IGT] msm_recovery: executing
> +# [  489.531926] [IGT] msm_recovery: starting subtest hangcheck
> +# [  492.808574] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  492.820358] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  492.831154] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  493.832570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  493.844177] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  493.854971] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  494.824633] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  494.836237] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  494.847034] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  495.816570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  495.828170] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  495.838966] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  496.804643] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  496.816246] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  496.827041] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  497.832570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  497.844170] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  497.854963] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  498.820636] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  498.832232] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  498.843024] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  499.816568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  499.828163] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  499.838958] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  500.808570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  500.820165] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  500.830960] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  501.832570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  501.844175] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  501.854965] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  502.824568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  502.836171] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  502.846965] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  503.816570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  503.828176] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  503.838969] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  504.804640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  504.816237] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  504.827033] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  505.828643] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  505.840247] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  505.851043] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  506.820637] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  506.832233] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  506.843026] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  507.816567] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  507.828171] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  507.838965] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  508.808568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  508.820173] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  508.830969] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  509.832568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  509.844173] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  509.854967] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  510.824568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  510.836162] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  510.846954] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  511.816569] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  511.828173] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  511.838968] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  512.804641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  512.816246] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  512.827040] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  513.828641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  513.840239] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  513.851035] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  514.824568] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  514.836164] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  514.846959] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  515.812640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  515.824235] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  515.835030] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  515.912427] rcu: INFO: rcu_preempt self-detected stall on CPU
> +# [  515.918398] rcu:  0-....: (6452 ticks this GP) idle=3D6afc/1/0x4000=
000000000000 softirq=3D12492/12697 fqs=3D3179
> +# [  515.929296] rcu:  (t=3D6505 jiffies g=3D36205 q=3D58 ncpus=3D8)
> +# [  515.934709] CPU: 0 UID: 0 PID: 126 Comm: sugov:0 Tainted: G        =
W          6.14.0-rc4-gdddf15cff632 #1
> +# [  515.934727] Tainted: [W]=3DWARN
> +# [  515.934732] Hardware name: Google Cheza (rev3+) (DT)
> +# [  515.934739] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS B=
TYPE=3D--)
> +# [  515.934751] pc : rcu_core+0x59c/0xe68
> +# [  515.934769] lr : rcu_core+0x74/0xe68
> +# [  515.934781] sp : ffff800080003e50
> +# [  515.934785] x29: ffff800080003e50 x28: ffff225d038e9bc0 x27: 000000=
0000000002
> +# [  515.934805] x26: ffffc171a8ee6108 x25: ffffc171a85bc2c0 x24: ffff60=
ecd691e000
> +# [  515.934820] x23: ffffc171a85d15c0 x22: ffffc171a8f8d780 x21: ffff22=
5e7eeef5c0
> +# [  515.934835] x20: ffffc171a8ef0e80 x19: ffffc171a85d15d1 x18: ffffc1=
71a9461e70
> +# [  515.934850] x17: ffff60ecd691e000 x16: ffff800080000000 x15: 000000=
0000000000
> +# [  515.934866] x14: ffffc171a85d0780 x13: 0000000000000400 x12: 000000=
0000000000
> +# [  515.934880] x11: ffffc171a85ce900 x10: ffffc171a8ef5000 x9 : ffffc1=
71a8ef0000
> +# [  515.934894] x8 : ffff800080003d88 x7 : ffffc171a8ee6100 x6 : ffff80=
0080003de0
> +# [  515.934909] x5 : ffff800080003dc8 x4 : 0000000000000003 x3 : 000000=
0000000000
> +# [  515.934923] x2 : 0000000000000101 x1 : 0000000000000000 x0 : ffff22=
5d038e9bc0
> +# [  515.934939] Call trace:
> +# [  515.934945]  rcu_core+0x59c/0xe68 (P)
> +# [  515.934962]  rcu_core_si+0x10/0x1c
> +# [  515.934976]  handle_softirqs+0x118/0x4b8
> +# [  515.934994]  __do_softirq+0x14/0x20
> +# [  515.935007]  ____do_softirq+0x10/0x1c
> +# [  515.935021]  call_on_irq_stack+0x24/0x4c
> +# [  515.935034]  do_softirq_own_stack+0x1c/0x28
> +# [  515.935048]  __irq_exit_rcu+0x174/0x1b4
> +# [  515.935063]  irq_exit_rcu+0x10/0x38
> +# [  515.935077]  el1_interrupt+0x38/0x64
> +# [  515.935092]  el1h_64_irq_handler+0x18/0x24
> +# [  515.935104]  el1h_64_irq+0x6c/0x70
> +# [  515.935115]  lock_acquire+0x1e0/0x338 (P)
> +# [  515.935129]  __mutex_lock+0xa8/0x4b8
> +# [  515.935144]  mutex_lock_nested+0x24/0x30
> +# [  515.935159]  _find_opp_table_unlocked+0x40/0xfc
> +# [  515.935174]  _find_key+0x64/0x16c
> +# [  515.935184]  dev_pm_opp_find_freq_exact+0x4c/0x74
> +# [  515.935197]  qcom_cpufreq_hw_target_index+0xe8/0x128
> +# [  515.935211]  __cpufreq_driver_target+0x144/0x29c
> +# [  515.935227]  sugov_work+0x58/0x74
> +# [  515.935239]  kthread_worker_fn+0xf4/0x324
> +# [  515.935254]  kthread+0x12c/0x208
> +# [  515.935266]  ret_from_fork+0x10/0x20
> +# [  516.808569] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  516.820174] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  516.830968] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  517.828641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  517.840236] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  517.851032] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  518.820642] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  518.832237] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  518.843030] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  519.812636] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  519.824231] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  519.835026] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  520.808570] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  520.820165] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  520.830959] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  521.828643] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  521.840238] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  521.851033] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  522.820636] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  522.832232] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  522.843027] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  523.812639] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  523.824239] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  523.835034] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  524.804640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  524.816235] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  524.827026] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  525.828641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  525.840236] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  525.851031] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  526.820641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  526.832244] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  526.843041] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  527.812642] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  527.824242] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  527.835038] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  528.804639] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  528.816234] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  528.827027] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  529.832634] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  529.844231] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  529.855017] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  530.820646] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  530.832270] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  530.843065] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  531.812640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  531.824238] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  531.835030] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  532.804640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  532.816237] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  532.827031] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  533.828640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  533.840243] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  533.851037] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  534.820640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  534.832245] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  534.843038] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  535.812641] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  535.824238] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  535.835033] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  536.804639] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  536.816235] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  536.827030] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  537.828640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  537.840234] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  537.851020] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  538.820640] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  538.832235] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  538.843027] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  539.812644] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2: hangcheck detected gpu lockup rb 0!
> +# [  539.824247] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     completed fence: 45605
> +# [  539.835040] msm_dpu ae01000.display-controller: [drm:hangcheck_hand=
ler] *ERROR* 6.3.0.2:     submitted fence: 45611
> +# [  540.124426] watchdog: BUG: soft lockup - CPU#0 stuck for 49s! [sugo=
v:0:126]
> +# [  540.124439] Modules linked in:
> +# [  540.124448] irq event stamp: 9912389
> +# [  540.124453] hardirqs last  enabled at (9912388): [<ffffc171a767a24c=
>] exit_to_kernel_mode+0x38/0x130
> +# [  540.124473] hardirqs last disabled at (9912389): [<ffffc171a767a368=
>] el1_interrupt+0x24/0x64
> +# [  540.124486] softirqs last  enabled at (9898068): [<ffffc171a62bc290=
>] handle_softirqs+0x4a0/0x4b8
> +# [  540.124505] softirqs last disabled at (9898071): [<ffffc171a62105b0=
>] __do_softirq+0x14/0x20
> +# [  540.124525] CPU: 0 UID: 0 PID: 126 Comm: sugov:0 Tainted: G        =
W          6.14.0-rc4-gdddf15cff632 #1
> +# [  540.124540] Tainted: [W]=3DWARN
> +# [  540.124544] Hardware name: Google Cheza (rev3+) (DT)
> +# [  540.124549] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS B=
TYPE=3D--)
> +# [  540.124560] pc : xhci_urb_enqueue+0xbc/0x32c
> +# [  540.124573] lr : xhci_urb_enqueue+0xb4/0x32c
> +# [  540.124581] sp : ffff800080003c20
> +# [  540.124586] x29: ffff800080003c20 x28: 0000000000000000 x27: ffff22=
5d00b1e6a0
> +# [  540.124602] x26: ffff225d01c3d800 x25: 0000000000000001 x24: 000000=
0000000006
> +# [  540.124617] x23: ffff225d044dc000 x22: ffff225d044dc000 x21: 000000=
0000000001
> +# [  540.124632] x20: ffff225d002d7280 x19: ffff225d0573a780 x18: ffff22=
5e7eff0f50
> +# [  540.124647] x17: 000000000000cab0 x16: 0000000000000000 x15: ffff22=
5d0353a000
> +# [  540.124661] x14: 0000000000000000 x13: 0000000000000820 x12: 000000=
0000000000
> +# [  540.124674] x11: ffff800080003a30 x10: 0000000000000001 x9 : 000000=
0000000000
> +# [  540.124689] x8 : ffff225d002d7300 x7 : 0000000000000000 x6 : 000000=
000000003f
> +# [  540.124702] x5 : 00000000ffffffff x4 : 0000000000000920 x3 : 000000=
0000000080
> +# [  540.124716] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff22=
5d002d7280
> +# [  540.124731] Call trace:
> +# [  540.124736]  xhci_urb_enqueue+0xbc/0x32c (P)
> +# [  540.124751]  usb_hcd_submit_urb+0x98/0x7fc
> +# [  540.124766]  usb_submit_urb+0x294/0x560
> +# [  540.124780]  intr_callback+0x78/0x1fc
> +# [  540.124798]  __usb_hcd_giveback_urb+0x68/0x128
> +# [  540.124812]  usb_giveback_urb_bh+0xa8/0x140
> +# [  540.124825]  process_one_work+0x208/0x5e8
> +# [  540.124840]  bh_worker+0x1a8/0x20c
> +# [  540.124853]  workqueue_softirq_action+0x78/0x88
> +# [  540.124868]  tasklet_hi_action+0x14/0x3c
> +# [  540.124883]  handle_softirqs+0x118/0x4b8
> +# [  540.124897]  __do_softirq+0x14/0x20
> +# [  540.124908]  ____do_softirq+0x10/0x1c
> +# [  540.124922]  call_on_irq_stack+0x24/0x4c
> +# [  540.124934]  do_softirq_own_stack+0x1c/0x28
> +# [  540.124947]  __irq_exit_rcu+0x174/0x1b4
> +# [  540.124961]  irq_exit_rcu+0x10/0x38
> +# [  540.124976]  el1_interrupt+0x38/0x64
> +# [  540.124987]  el1h_64_irq_handler+0x18/0x24
> +# [  540.124998]  el1h_64_irq+0x6c/0x70
> +# [  540.125009]  lock_acquire+0x1e0/0x338 (P)
> +# [  540.125023]  __mutex_lock+0xa8/0x4b8
> +# [  540.125038]  mutex_lock_nested+0x24/0x30
> +# [  540.125052]  _find_opp_table_unlocked+0x40/0xfc
> +# [  540.125067]  _find_key+0x64/0x16c
> +# [  540.125078]  dev_pm_opp_find_freq_exact+0x4c/0x74
> +# [  540.125090]  qcom_cpufreq_hw_target_index+0xe8/0x128
> +# [  540.125105]  __cpufreq_driver_target+0x144/0x29c
> +# [  540.125121]  sugov_work+0x58/0x74
> +# [  540.125133]  kthread_worker_fn+0xf4/0x324
> +# [  540.125148]  kthread+0x12c/0x208
> +# [  540.125160]  ret_from_fork+0x10/0x20
> +# [  540.125176] Kernel panic - not syncing: softlockup: hung tasks
> +# [  540.423567] CPU: 0 UID: 0 PID: 126 Comm: sugov:0 Tainted: G        =
W    L     6.14.0-rc4-gdddf15cff632 #1
> +# [  540.433411] Tainted: [W]=3DWARN, [L]=3DSOFTLOCKUP
> +# [  540.437901] Hardware name: Google Cheza (rev3+) (DT)
> +# [  540.443022] Call trace:
> +# [  540.445559]  show_stack+0x18/0x24 (C)
> +# [  540.449357]  dump_stack_lvl+0x38/0xd0
> +# [  540.453157]  dump_stack+0x18/0x24
> +# [  540.456599]  panic+0x3bc/0x41c
> +# [  540.459767]  watchdog_timer_fn+0x254/0x2e4
> +# [  540.464005]  __hrtimer_run_queues+0x3c4/0x440
> +# [  540.468508]  hrtimer_interrupt+0xe4/0x244
> +# [  540.472662]  arch_timer_handler_phys+0x2c/0x44
> +# [  540.477256]  handle_percpu_devid_irq+0x90/0x1f0
> +# [  540.481943]  handle_irq_desc+0x40/0x58
> +# [  540.485829]  generic_handle_domain_irq+0x1c/0x28
> +# [  540.490604]  gic_handle_irq+0x4c/0x11c
> +# [  540.494483]  do_interrupt_handler+0x50/0x84
> +# [  540.498811]  el1_interrupt+0x34/0x64
> +# [  540.502518]  el1h_64_irq_handler+0x18/0x24
> +# [  540.506758]  el1h_64_irq+0x6c/0x70
> +# [  540.510279]  xhci_urb_enqueue+0xbc/0x32c (P)
> +# [  540.514693]  usb_hcd_submit_urb+0x98/0x7fc
> +# [  540.518932]  usb_submit_urb+0x294/0x560
> +# [  540.522901]  intr_callback+0x78/0x1fc
> +# [  540.526700]  __usb_hcd_giveback_urb+0x68/0x128
> +# [  540.531288]  usb_giveback_urb_bh+0xa8/0x140
> +# [  540.535614]  process_one_work+0x208/0x5e8
> +# [  540.539769]  bh_worker+0x1a8/0x20c
> +# [  540.543293]  workqueue_softirq_action+0x78/0x88
> +# [  540.547980]  tasklet_hi_action+0x14/0x3c
> +# [  540.552038]  handle_softirqs+0x118/0x4b8
> +# [  540.556096]  __do_softirq+0x14/0x20
> +# [  540.559705]  ____do_softirq+0x10/0x1c
> +# [  540.563500]  call_on_irq_stack+0x24/0x4c
> +# [  540.567554]  do_softirq_own_stack+0x1c/0x28
> +# [  540.571878]  __irq_exit_rcu+0x174/0x1b4
> +# [  540.575849]  irq_exit_rcu+0x10/0x38
> +# [  540.579462]  el1_interrupt+0x38/0x64
> +# [  540.583158]  el1h_64_irq_handler+0x18/0x24
> +# [  540.587397]  el1h_64_irq+0x6c/0x70
> +# [  540.590918]  lock_acquire+0x1e0/0x338 (P)
> +# [  540.595060]  __mutex_lock+0xa8/0x4b8
> +# [  540.598760]  mutex_lock_nested+0x24/0x30
> +# [  540.602818]  _find_opp_table_unlocked+0x40/0xfc
> +# [  540.607503]  _find_key+0x64/0x16c
> +# [  540.610940]  dev_pm_opp_find_freq_exact+0x4c/0x74
> +# [  540.615798]  qcom_cpufreq_hw_target_index+0xe8/0x128
> +# [  540.620924]  __cpufreq_driver_target+0x144/0x29c
> +# [  540.625698]  sugov_work+0x58/0x74
> +# [  540.629134]  kthread_worker_fn+0xf4/0x324
> +# [  540.633278]  kthread+0x12c/0x208
> +# [  540.636619]  ret_from_fork+0x10/0x20
> +# [  540.640321] SMP: stopping secondary CPUs
> +# [  540.644518] Kernel Offset: 0x417126200000 from 0xffff800080000000
> +# [  540.650848] PHYS_OFFSET: 0xfff0dda400000000
> +# [  540.655170] CPU features: 0x000,00000100,00901250,8200721b
> +# [  540.660829] Memory Limit: none
> +# [  540.663999] ---[ end Kernel panic - not syncing: softlockup: hung t=
asks ]---
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers=
/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> index 329770c520d9..9450f2a002fd 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> @@ -10,6 +10,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/=
gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> index 3c7e494857b5..198deea3faa9 100644
> --- a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> @@ -10,6 +10,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Panfrost is not a KMS driver, so skip the KMS tests
>  kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/driver=
s/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> index 3c7e494857b5..198deea3faa9 100644
> --- a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> @@ -10,6 +10,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Panfrost is not a KMS driver, so skip the KMS tests
>  kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt b/driver=
s/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> index feeed89b6c3f..af99ac54c3a5 100644
> --- a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> @@ -13,6 +13,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Panfrost is not a KMS driver, so skip the KMS tests
>  kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt b/driver=
s/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
> index feeed89b6c3f..af99ac54c3a5 100644
> --- a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
> @@ -13,6 +13,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Panfrost is not a KMS driver, so skip the KMS tests
>  kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/driver=
s/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> index ba9160d4d8eb..61122ea7f008 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> @@ -5,6 +5,5 @@ core_setmaster_vs_auth,Crash
>  dumb_buffer@create-clear,Crash
>  fbdev@pan,Crash
>  kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> -kms_flip@flip-vs-modeset-vs-hang,Crash
>  kms_prop_blob@invalid-set-prop,Crash
>  kms_prop_blob@invalid-set-prop-any,Crash
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/driver=
s/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> index eb16b29dee48..71418ea35a17 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> @@ -14,6 +14,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/driver=
s/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> index 2803d0d80192..45dd8d493f6e 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> @@ -2,7 +2,6 @@ dumb_buffer@create-clear,Crash
>  kms_atomic_transition@modeset-transition,Fail
>  kms_atomic_transition@modeset-transition-fencing,Fail
>  kms_atomic_transition@plane-toggle-modeset-transition,Fail
> -kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
>  kms_color@gamma,Fail
>  kms_color@legacy-gamma,Fail
>  kms_cursor_crc@cursor-alpha-opaque,Fail
> @@ -55,6 +54,7 @@ kms_flip@plain-flip-ts-check,Fail
>  kms_flip@plain-flip-ts-check-interruptible,Fail
>  kms_flip@wf_vblank-ts-check-interruptible,Fail
>  kms_invalid_mode@int-max-clock,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail
>  kms_lease@lease-uevent,Fail
>  kms_lease@page-flip-implicit-plane,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drive=
rs/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> index 348b4ce7eb4b..b467991d4094 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> @@ -75,58 +75,72 @@ kms_bw@linear-tiling-2-displays-2160x1440p
>  # Linux Version: 6.11.0-rc5
>  kms_flip@flip-vs-expired-vblank
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/f944dd08-c88c-49ae-aff0-=
274374550a93@collabora.com/T/#u
>  # Failure Rate: 40
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_bw@linear-tiling-1-displays-2160x1440p
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/afa2d3bf-29f2-488d-8cc9-=
f30d461444b0@collabora.com/T/#u
>  # Failure Rate: 80
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_plane_multiple@tiling-none
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/6fdaa97f-c1a5-4216-831f-=
dbb7c5f90498@collabora.com/T/#u
>  # Failure Rate: 100
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_bw@linear-tiling-1-displays-1920x1080p
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/616aa015-9574-4527-9d07-=
d8d698bbcc3c@collabora.com/T/#u
>  # Failure Rate: 100
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_plane@plane-position-hole-dpms
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/7a1b888f-d7db-4ed7-96cd-=
3975ace837fb@collabora.com/T/#u
>  # Failure Rate: 100
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_flip@flip-vs-absolute-wf_vblank
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/f17fffb6-abc4-464e-8465-=
395311b01f6a@collabora.com/T/#u
>  # Failure Rate: 100
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_flip@flip-vs-blocking-wf-vblank
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/9b590b26-1bf9-4951-b6a3-=
ef6c67e6a1c6@collabora.com/T/#u
>  # Failure Rate: 60
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_bw@linear-tiling-2-displays-1920x1080p
>
> -# Board Name: hp-11A-G6-EE-grunt
> +# Board Name: rk3399-gru-kevin
>  # Bug Report: https://lore.kernel.org/dri-devel/059545fa-65b1-4f5c-a13e-=
4d2898679f51@collabora.com/T/#u
>  # Failure Rate: 20
>  # IGT Version: 1.29-g33adea9eb
>  # Linux Version: 6.13.0-rc2
>  kms_flip@modeset-vs-vblank-race-interruptible
> +
> +# Board Name: rk3399-gru-kevin
> +# Bug Report: https://lore.kernel.org/dri-devel/eece9a80-42f3-41f4-86cc-=
69d8a51b976a@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_bw@connected-linear-tiling-1-displays-2160x1440p
> +
> +# Board Name: rk3399-gru-kevin
> +# Bug Report: https://lore.kernel.org/dri-devel/63dfd5b7-8a54-44a3-9530-=
f8dcd77a21d1@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_bw@linear-tiling-1-displays-3840x2160p
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/driver=
s/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> index e8e994d92557..b83ec75161b2 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> @@ -14,6 +14,7 @@ nouveau_.*
>  gem_.*
>  i915_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/driver=
s/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> index c72fee70e739..9749ddb75121 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> @@ -157,6 +157,7 @@ kms_flip@plain-flip-ts-check-interruptible,Fail
>  kms_flip@wf_vblank-ts-check,Fail
>  kms_flip@wf_vblank-ts-check-interruptible,Fail
>  kms_invalid_mode@int-max-clock,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail
>  kms_lease@cursor-implicit-plane,Fail
>  kms_lease@lease-uevent,Fail
>  kms_lease@page-flip-implicit-plane,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/driver=
s/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> index adbcdd0f28d2..28e37185bac0 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> @@ -19,6 +19,7 @@ gem_.*
>  i915_.*
>  xe_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # Currently fails and causes coverage loss for other tests
>  # since core_getversion also fails.
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu=
/drm/ci/xfails/vkms-none-flakes.txt
> index 62428f3c8f31..e3ca6da8cde7 100644
> --- a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> @@ -88,3 +88,31 @@ kms_flip@flip-vs-expired-vblank
>  # IGT Version: 1.28-gf13702b8e
>  # Linux Version: 6.10.0-rc5
>  kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> +
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/2364a6bf-e6bc-4741-8c78-=
cea8bdb06e03@collabora.com/T/#u
> +# Failure Rate: 20
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_flip@modeset-vs-vblank-race
> +
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/f7d72ed9-a783-46d7-b75d-=
54072bda32a3@collabora.com/T/#u
> +# Failure Rate: 100
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_pipe_crc_basic@suspend-read-crc
> +
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/98d3ba54-bcb9-41ab-adb1-=
a18ba61ee2e4@collabora.com/T/#u
> +# Failure Rate: 100
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_plane@plane-panning-bottom-right-suspend
> +
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/b58d15eb-094d-4ac2-aad3-=
83e518c2f55d@collabora.com/T/#u
> +# Failure Rate: 100
> +# IGT Version: 1.30-g04bedb923
> +# Linux Version: 6.14.0-rc4
> +kms_vblank@ts-continuation-dpms-suspend
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/=
drm/ci/xfails/vkms-none-skips.txt
> index 319789806271..716d2d4e452d 100644
> --- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> @@ -1,5 +1,6 @@
>  # keeps printing vkms_vblank_simulate: vblank timer overrun and never en=
ds
>  kms_invalid_mode@int-max-clock
> +kms_invalid_mode@overflow-vrefresh
>
>  # kernel panic seen with kms_cursor_crc tests
>  kms_cursor_crc.*
> @@ -802,6 +803,7 @@ gem_.*
>  i915_.*
>  xe_.*
>  tools_test.*
> +kms_dp_link_training.*
>
>  # IGT issue. is_joiner_mode() should return false for non-Intel hardware=
.
>  # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
> --
> 2.47.2
>


--=20
Helen Koike
