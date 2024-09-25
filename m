Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE979854D1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 09:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755A10E1B2;
	Wed, 25 Sep 2024 07:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="WRHF8EuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9310E1B2;
 Wed, 25 Sep 2024 07:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727251188; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JlLlFinysElgLtPJ1ySTKMOI1lMmBnYy9h84owOX2FS/wke/NIAxO0LZHn52A9VITCOtN7U5UqqCHJRCl608fqK99QcZ3ypZhxUdodxBjgC9nE1fmxaDUzGQKwHdCx5UVyBiLJs74PCdkJsADQJlB73Nz7/hivB85C+tbnAMfYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727251188;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y6MsK/UhAJbCOjDo2HkvpZz1ZDxuq1EMeUfULMUnS0I=; 
 b=fc946r8OOyCsYcNmJ/f+PVsDcvKyDKMXWByqmK2abNo23lYnL7SjVceEw3gu6xME+PYd1OpjHx2IW8Vjeyiu28d7oKrvTcWHsBIbgHiBEzofYJ1SYgqgJKNtYjnfegftsrd5HrMz+E5uxFFQzUIT5vwRvaaPSJhPjzvJ/mztnao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727251188; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=y6MsK/UhAJbCOjDo2HkvpZz1ZDxuq1EMeUfULMUnS0I=;
 b=WRHF8EuUeLvZfTF2vTgi6mh/Qd0P1thHmdfmzIsxaHSI5G05zp6AH8w2CxHKXhs+
 D3FXwaDQX4+RLAjJ42YRyj9JLm2NpfTEVBFutiXJzculQg9QrO5zZM5op2TjZSoTHtb
 mi0z+905Wph5D6MuOjTUzSWAXlSEVkf34cOJOIUc=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1727251186834709.7928212172501;
 Wed, 25 Sep 2024 00:59:46 -0700 (PDT)
Date: Wed, 25 Sep 2024 04:59:46 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "linux-mediatek" <linux-mediatek@lists.infradead.org>,
 "linux-amlogic" <linux-amlogic@lists.infradead.org>,
 "linux-rockchip" <linux-rockchip@lists.infradead.org>,
 "amd-gfx" <amd-gfx@lists.freedesktop.org>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "virtualization" <virtualization@lists.linux.dev>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19228318469.adfeb096209317.6744453569978518355@collabora.com>
In-Reply-To: <20240910131927.161883-1-vignesh.raman@collabora.com>
References: <20240910131927.161883-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v2] drm/ci: uprev mesa, IGT and deqp-runner
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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






---- On Tue, 10 Sep 2024 10:19:24 -0300 Vignesh Raman  wrote ---

 > Uprev mesa, IGT to the latest version and deqp-runner 
 > to v0.20.0. Also update expectation files. 
 >  
 > Acked-by: Helen Koike helen.koike@collabora.com> 
 > Reviewed-by: Daniel Stone daniels@collabora.com> 
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 

Applied to drm-misc-next.

Thanks!
Helen

 > --- 
 >  
 > v1: 
 > - Flaky test report will be sent to maintainers after this 
 >  patch series is reviewed. 
 >  
 > v2: 
 > - Uprev mesa and rerun with latest drm-misc-next. 
 >  Updated flaky tests bug report link. 
 >  
 > --- 
 >  drivers/gpu/drm/ci/gitlab-ci.yml              | 14 +++-- 
 >  drivers/gpu/drm/ci/image-tags.yml             |  2 +- 
 >  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  2 +- 
 >  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  7 +++ 
 >  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  2 +- 
 >  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  7 +++ 
 >  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  1 - 
 >  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  7 +++ 
 >  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 10 ++-- 
 >  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt | 14 +++++ 
 >  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  1 + 
 >  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |  2 - 
 >  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  | 34 ++++++++++-- 
 >  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  9 ++-- 
 >  .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 11 +--- 
 >  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  6 --- 
 >  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  1 - 
 >  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 -- 
 >  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  5 -- 
 >  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 27 ---------- 
 >  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 27 ---------- 
 >  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  6 +-- 
 >  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 14 +++++ 
 >  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |  5 ++ 
 >  .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |  1 + 
 >  .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 + 
 >  .../drm/ci/xfails/panfrost-rk3288-fails.txt   |  1 + 
 >  .../drm/ci/xfails/panfrost-rk3399-fails.txt   |  1 + 
 >  .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 22 +++++--- 
 >  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  | 28 ++++++++++ 
 >  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  7 --- 
 >  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  | 28 ++++++++++ 
 >  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 21 -------- 
 >  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 53 +++++++++++++++++++ 
 >  34 files changed, 234 insertions(+), 148 deletions(-) 
 >  
 > diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml 
 > index eca47d4f816f..90bde9f00cc3 100644 
 > --- a/drivers/gpu/drm/ci/gitlab-ci.yml 
 > +++ b/drivers/gpu/drm/ci/gitlab-ci.yml 
 > @@ -1,14 +1,14 @@ 
 >  variables: 
 >  DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa 
 > -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha d9849ac46623797a9f56fb9d46dc52460ac477de 
 > +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha c6a9a9c3bce90923f7700219354e0b6e5a3c9ba6 
 >  
 >  UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git 
 >  TARGET_BRANCH: drm-next 
 >  
 > -  IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5 
 > +  IGT_VERSION: a73311079a5d8ac99eb25336a8369a2c3c6b519b 
 >  
 >  DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git 
 > -  DEQP_RUNNER_GIT_TAG: v0.15.0 
 > +  DEQP_RUNNER_GIT_TAG: v0.20.0 
 >  
 >  FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs 
 >  MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb 
 > @@ -153,6 +153,14 @@ stages: 
 >  # Pre-merge pipeline for Marge Bot 
 >  - if: &is-pre-merge-for-marge '$GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"' 
 >  when: on_success 
 > +    # Push to a branch on a fork 
 > +    - &is-fork-push '$CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"' 
 > + 
 > +# Rules applied to every job in the pipeline 
 > +.common-rules: 
 > +  rules: 
 > +    - if: *is-fork-push 
 > +      when: manual 
 >  
 >  .never-post-merge-rules: 
 >  rules: 
 > diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml 
 > index 2c340d063a96..8d8b9e71852e 100644 
 > --- a/drivers/gpu/drm/ci/image-tags.yml 
 > +++ b/drivers/gpu/drm/ci/image-tags.yml 
 > @@ -1,5 +1,5 @@ 
 >  variables: 
 > -   CONTAINER_TAG: "2024-08-07-mesa-uprev" 
 > +   CONTAINER_TAG: "2024-09-09-uprevs" 
 >  DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base" 
 >  DEBIAN_BASE_TAG: "${CONTAINER_TAG}" 
 >  
 > diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt 
 > index 8e2fed6d76a3..f44dbce3151a 100644 
 > --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt 
 > @@ -2,6 +2,7 @@ amdgpu/amd_abm@abm_enabled,Fail 
 >  amdgpu/amd_abm@abm_gradual,Fail 
 >  amdgpu/amd_abm@backlight_monotonic_abm,Fail 
 >  amdgpu/amd_abm@backlight_monotonic_basic,Fail 
 > +amdgpu/amd_abm@dpms_cycle,Fail 
 >  amdgpu/amd_assr@assr-links,Fail 
 >  amdgpu/amd_assr@assr-links-dpms,Fail 
 >  amdgpu/amd_mall@static-screen,Crash 
 > @@ -14,7 +15,6 @@ amdgpu/amd_plane@mpo-scale-p010,Fail 
 >  amdgpu/amd_plane@mpo-scale-rgb,Crash 
 >  amdgpu/amd_plane@mpo-swizzle-toggle,Fail 
 >  amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_addfb_basic@bad-pitch-65536,Fail 
 >  kms_addfb_basic@bo-too-small,Fail 
 >  kms_addfb_basic@too-high,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
 > index e4faa96fa000..e70bd9d447ca 100644 
 > --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
 > @@ -18,3 +18,10 @@ kms_async_flips@crc 
 >  # IGT Version: 1.28-g0df7b9b97 
 >  # Linux Version: 6.9.0-rc7 
 >  kms_plane@pixel-format-source-clamping 
 > + 
 > +# Board Name: hp-11A-G6-EE-grunt 
 > +# Bug Report: https://lore.kernel.org/amd-gfx/09ee1862-3a0e-4085-ac1b-262601b1122b@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_async_flips@async-flip-with-page-flip-events 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt 
 > index 9b84f68a5122..0907cb0f6d9e 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt 
 > @@ -1,3 +1,4 @@ 
 > +core_setmaster@master-drop-set-shared-fd,Fail 
 >  core_setmaster@master-drop-set-user,Fail 
 >  core_setmaster_vs_auth,Fail 
 >  i915_module_load@load,Fail 
 > @@ -6,7 +7,6 @@ i915_module_load@reload-no-display,Fail 
 >  i915_module_load@resize-bar,Fail 
 >  i915_pm_rpm@gem-execbuf-stress,Timeout 
 >  i915_pm_rpm@module-reload,Fail 
 > -kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout 
 >  kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout 
 >  kms_fb_coherency@memset-crc,Crash 
 >  kms_flip@busy-flip,Timeout 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt 
 > index 581f0da4d0f2..0207c9807bee 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt 
 > @@ -46,3 +46,10 @@ i915_hangman@engine-engine-hang 
 >  # IGT Version: 1.28-gf13702b8e 
 >  # Linux Version: 6.10.0-rc5 
 >  kms_pm_rpm@modeset-lpsp-stress 
 > + 
 > +# Board Name: asus-C433TA-AJ0005-rammus 
 > +# Bug Report: https://lore.kernel.org/intel-gfx/61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_pm_rpm@drm-resources-equal 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt 
 > index e612281149aa..64772fedaed5 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt 
 > @@ -8,7 +8,6 @@ kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail 
 > -kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail 
 >  kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt 
 > index 4663d4d13f35..e8bddda56737 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt 
 > @@ -4,3 +4,10 @@ 
 >  # IGT Version: 1.28-g0df7b9b97 
 >  # Linux Version: 6.9.0-rc7 
 >  kms_fb_coherency@memset-crc 
 > + 
 > +# Board Name: asus-C523NA-A20057-coral 
 > +# Bug Report: https://lore.kernel.org/intel-gfx/61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_universal_plane@cursor-fb-leak 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt 
 > index 2723e2832797..f352b719cf7d 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt 
 > @@ -1,5 +1,5 @@ 
 > +core_setmaster@master-drop-set-shared-fd,Fail 
 >  core_setmaster@master-drop-set-user,Fail 
 > -core_setmaster_vs_auth,Fail 
 >  i915_module_load@load,Fail 
 >  i915_module_load@reload,Fail 
 >  i915_module_load@reload-no-display,Fail 
 > @@ -9,10 +9,10 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail 
 >  i915_pm_rpm@gem-execbuf-stress,Timeout 
 >  i915_pm_rpm@module-reload,Fail 
 >  i915_pm_rpm@system-suspend-execbuf,Timeout 
 > -kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout 
 > +i915_pm_rps@engine-order,Fail 
 > +kms_big_fb@linear-16bpp-rotate-180,Timeout 
 >  kms_fb_coherency@memset-crc,Crash 
 >  kms_flip@busy-flip,Timeout 
 > -kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail 
 >  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail 
 > @@ -40,14 +40,11 @@ kms_plane_alpha_blend@alpha-basic,Fail 
 >  kms_plane_alpha_blend@alpha-opaque-fb,Fail 
 >  kms_plane_alpha_blend@alpha-transparent-fb,Fail 
 >  kms_plane_alpha_blend@constant-alpha-max,Fail 
 > -kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout 
 >  kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout 
 >  kms_pm_rpm@modeset-stress-extra-wait,Timeout 
 >  kms_pm_rpm@universal-planes,Timeout 
 >  kms_pm_rpm@universal-planes-dpms,Timeout 
 > -kms_prop_blob@invalid-set-prop,Fail 
 >  kms_psr2_sf@cursor-plane-update-sf,Fail 
 > -kms_psr2_sf@fbc-plane-move-sf-dmg-area,Timeout 
 >  kms_psr2_sf@overlay-plane-update-continuous-sf,Fail 
 >  kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail 
 >  kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail 
 > @@ -55,7 +52,6 @@ kms_psr2_sf@plane-move-sf-dmg-area,Fail 
 >  kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail 
 >  kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail 
 >  kms_psr2_su@page_flip-NV12,Fail 
 > -kms_psr2_su@page_flip-P010,Fail 
 >  kms_rotation_crc@primary-rotation-180,Timeout 
 >  kms_setmode@basic,Fail 
 >  kms_vblank@query-forked-hang,Timeout 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt 
 > index 58a6001abb28..d8401251e5f4 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt 
 > @@ -11,3 +11,17 @@ kms_plane_alpha_blend@constant-alpha-min 
 >  # IGT Version: 1.28-gf13702b8e 
 >  # Linux Version: 6.10.0-rc5 
 >  kms_atomic_transition@plane-all-modeset-transition-internal-panels 
 > + 
 > +# Board Name: asus-C436FA-Flip-hatch 
 > +# Bug Report: https://lore.kernel.org/intel-gfx/61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_plane_alpha_blend@constant-alpha-min 
 > + 
 > +# Board Name: asus-C436FA-Flip-hatch 
 > +# Bug Report: https://lore.kernel.org/intel-gfx/61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_async_flips@crc 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt 
 > index 4821c9adefd1..6eb64c672f7d 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt 
 > @@ -63,3 +63,4 @@ xe_module_load@load,Fail 
 >  xe_module_load@many-reload,Fail 
 >  xe_module_load@reload,Fail 
 >  xe_module_load@reload-no-display,Fail 
 > +core_setmaster@master-drop-set-shared-fd,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt 
 > index 1de04a3308c4..d4fba4f55ec1 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt 
 > @@ -17,12 +17,10 @@ perf@i915-ref-count,Fail 
 >  perf_pmu@busy-accuracy-50,Fail 
 >  perf_pmu@module-unload,Fail 
 >  perf_pmu@rc6,Crash 
 > -prime_busy@after,Fail 
 >  sysfs_heartbeat_interval@long,Timeout 
 >  sysfs_heartbeat_interval@off,Timeout 
 >  sysfs_preempt_timeout@off,Timeout 
 >  sysfs_timeslice_duration@off,Timeout 
 > -testdisplay,Timeout 
 >  xe_module_load@force-load,Fail 
 >  xe_module_load@load,Fail 
 >  xe_module_load@many-reload,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt 
 > index e728ccc62326..461ef69ef08a 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt 
 > @@ -1,40 +1,64 @@ 
 > +api_intel_allocator@fork-simple-stress-signal,Timeout 
 > +api_intel_allocator@open-vm,Timeout 
 >  api_intel_allocator@simple-allocator,Timeout 
 > +api_intel_bb@lot-of-buffers,Timeout 
 >  api_intel_bb@object-reloc-keep-cache,Timeout 
 >  api_intel_bb@offset-control,Timeout 
 > -core_auth@getclient-simple,Timeout 
 > -core_hotunplug@hotunbind-rebind,Timeout 
 > +api_intel_bb@render-ccs,Timeout 
 > +api_intel_bb@reset-bb,Timeout 
 > +core_auth@basic-auth,Timeout 
 > +core_hotunplug@hotrebind,Timeout 
 > +core_setmaster@master-drop-set-user,Fail 
 >  debugfs_test@read_all_entries_display_on,Timeout 
 > -drm_read@invalid-buffer,Timeout 
 > -drm_read@short-buffer-nonblock,Timeout 
 > +drm_read@empty-block,Timeout 
 > +dumb_buffer@create-clear,Timeout 
 > +dumb_buffer@invalid-bpp,Timeout 
 >  gen3_render_tiledx_blits,Timeout 
 >  gen7_exec_parse@basic-allocation,Timeout 
 > -gen7_exec_parse@batch-without-end,Timeout 
 >  gen9_exec_parse@batch-invalid-length,Timeout 
 >  gen9_exec_parse@bb-secure,Timeout 
 >  gen9_exec_parse@secure-batches,Timeout 
 >  gen9_exec_parse@shadow-peek,Timeout 
 >  gen9_exec_parse@unaligned-jump,Timeout 
 > +i915_getparams_basic@basic-subslice-total,Timeout 
 > +i915_hangman@gt-engine-hang,Timeout 
 >  i915_module_load@load,Fail 
 >  i915_module_load@reload,Fail 
 >  i915_module_load@reload-no-display,Fail 
 >  i915_module_load@resize-bar,Fail 
 > +i915_pciid,Timeout 
 > +i915_pipe_stress@stress-xrgb8888-ytiled,Timeout 
 > +i915_pm_rpm@gem-execbuf-stress,Timeout 
 > +i915_pm_rps@engine-order,Timeout 
 > +i915_pm_rps@thresholds-idle-park,Timeout 
 >  i915_query@engine-info,Timeout 
 >  i915_query@query-topology-kernel-writes,Timeout 
 >  i915_query@test-query-geometry-subslices,Timeout 
 >  kms_lease@lease-uevent,Fail 
 >  kms_rotation_crc@multiplane-rotation,Fail 
 >  perf@i915-ref-count,Fail 
 > +perf_pmu@busy,Timeout 
 >  perf_pmu@enable-race,Timeout 
 >  perf_pmu@event-wait,Timeout 
 > +perf_pmu@faulting-read,Timeout 
 >  perf_pmu@gt-awake,Timeout 
 >  perf_pmu@interrupts,Timeout 
 >  perf_pmu@module-unload,Fail 
 > +perf_pmu@most-busy-idle-check-all,Timeout 
 >  perf_pmu@rc6,Crash 
 > +perf_pmu@render-node-busy-idle,Fail 
 > +perf_pmu@semaphore-wait-idle,Timeout 
 > +prime_busy@after,Timeout 
 > +prime_mmap@test_aperture_limit,Timeout 
 >  prime_mmap@test_map_unmap,Timeout 
 >  prime_mmap@test_refcounting,Timeout 
 >  prime_self_import@basic-with_one_bo,Timeout 
 > +sriov_basic@enable-vfs-autoprobe-off,Timeout 
 > +syncobj_basic@bad-destroy,Timeout 
 >  syncobj_basic@bad-flags-fd-to-handle,Timeout 
 > +syncobj_basic@create-signaled,Timeout 
 >  syncobj_eventfd@invalid-bad-pad,Timeout 
 > +syncobj_eventfd@timeline-wait-before-signal,Timeout 
 >  syncobj_wait@invalid-multi-wait-unsubmitted-signaled,Timeout 
 >  syncobj_wait@invalid-signal-illegal-handle,Timeout 
 >  syncobj_wait@invalid-single-wait-all-unsubmitted,Timeout 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt 
 > index 2adae2175501..0ce240e3aa07 100644 
 > --- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt 
 > @@ -1,5 +1,5 @@ 
 > +core_setmaster@master-drop-set-shared-fd,Fail 
 >  core_setmaster@master-drop-set-user,Fail 
 > -core_setmaster_vs_auth,Fail 
 >  i915_module_load@load,Fail 
 >  i915_module_load@reload,Fail 
 >  i915_module_load@reload-no-display,Fail 
 > @@ -7,7 +7,8 @@ i915_module_load@resize-bar,Fail 
 >  i915_pm_rpm@gem-execbuf-stress,Timeout 
 >  i915_pm_rpm@module-reload,Fail 
 >  i915_pm_rpm@system-suspend-execbuf,Timeout 
 > -kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout 
 > +i915_pm_rps@engine-order,Fail 
 > +kms_big_fb@linear-16bpp-rotate-180,Timeout 
 >  kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout 
 >  kms_dirtyfb@default-dirtyfb-ioctl,Fail 
 >  kms_dirtyfb@fbc-dirtyfb-ioctl,Fail 
 > @@ -32,19 +33,17 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail 
 >  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail 
 >  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail 
 >  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail 
 > -kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu,Timeout 
 >  kms_frontbuffer_tracking@fbc-tiling-linear,Fail 
 > +kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt,Timeout 
 >  kms_lease@lease-uevent,Fail 
 >  kms_plane_alpha_blend@alpha-basic,Fail 
 >  kms_plane_alpha_blend@alpha-opaque-fb,Fail 
 >  kms_plane_alpha_blend@alpha-transparent-fb,Fail 
 >  kms_plane_alpha_blend@constant-alpha-max,Fail 
 > -kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout 
 >  kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout 
 >  kms_pm_rpm@modeset-stress-extra-wait,Timeout 
 >  kms_pm_rpm@universal-planes,Timeout 
 >  kms_pm_rpm@universal-planes-dpms,Timeout 
 > -kms_prop_blob@invalid-set-prop,Fail 
 >  kms_rotation_crc@primary-rotation-180,Timeout 
 >  kms_vblank@query-forked-hang,Timeout 
 >  perf@i915-ref-count,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt 
 > index a14349a1967f..8e0efc80d510 100644 
 > --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt 
 > @@ -1,8 +1,3 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  fbdev@eof,Fail 
 >  fbdev@read,Fail 
 >  kms_3d,Fail 
 > @@ -27,10 +22,6 @@ kms_cursor_legacy@cursor-vs-flip-atomic,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-legacy,Fail 
 >  kms_flip@flip-vs-modeset-vs-hang,Fail 
 >  kms_flip@flip-vs-panning-vs-hang,Fail 
 > -kms_flip@flip-vs-suspend,Fail 
 > -kms_flip@flip-vs-suspend-interruptible,Fail 
 >  kms_lease@lease-uevent,Fail 
 > -kms_properties@get_properties-sanity-atomic,Fail 
 > -kms_properties@plane-properties-atomic,Fail 
 > -kms_properties@plane-properties-legacy,Fail 
 >  kms_rmfb@close-fd,Fail 
 > +kms_flip@flip-vs-suspend-interruptible,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt 
 > index 8cb2cb67853d..845f852bb4a0 100644 
 > --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt 
 > @@ -1,10 +1,5 @@ 
 >  core_setmaster@master-drop-set-shared-fd,Fail 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 >  dumb_buffer@create-clear,Crash 
 > -dumb_buffer@invalid-bpp,Fail 
 >  fbdev@eof,Fail 
 >  fbdev@pan,Fail 
 >  fbdev@read,Fail 
 > @@ -18,5 +13,4 @@ kms_color@invalid-gamma-lut-sizes,Fail 
 >  kms_flip@flip-vs-panning-vs-hang,Fail 
 >  kms_flip@flip-vs-suspend,Fail 
 >  kms_lease@lease-uevent,Fail 
 > -kms_properties@plane-properties-atomic,Fail 
 >  kms_rmfb@close-fd,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt 
 > index 328967d3e23d..fc3745180683 100644 
 > --- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt 
 > @@ -1,4 +1,3 @@ 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_3d,Fail 
 >  kms_cursor_legacy@forked-bo,Fail 
 >  kms_cursor_legacy@forked-move,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt 
 > index 4ac46168eff3..066d24ee3e08 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt 
 > @@ -1,8 +1,3 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_3d,Fail 
 >  kms_cursor_legacy@torture-bo,Fail 
 >  kms_force_connector_basic@force-edid,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt 
 > index bd0653caf7a0..2893f98a6b97 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt 
 > @@ -1,7 +1,2 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_3d,Fail 
 >  kms_lease@lease-uevent,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt 
 > index d42004cd6977..6dbc2080347d 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt 
 > @@ -1,8 +1,3 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_color@ctm-0-25,Fail 
 >  kms_color@ctm-0-50,Fail 
 >  kms_color@ctm-0-75,Fail 
 > @@ -11,35 +6,13 @@ kms_color@ctm-green-to-red,Fail 
 >  kms_color@ctm-negative,Fail 
 >  kms_color@ctm-red-to-blue,Fail 
 >  kms_color@ctm-signed,Fail 
 > -kms_content_protection@atomic,Crash 
 > -kms_content_protection@atomic-dpms,Crash 
 > -kms_content_protection@content-type-change,Crash 
 > -kms_content_protection@lic-type-0,Crash 
 > -kms_content_protection@lic-type-1,Crash 
 > -kms_content_protection@srm,Crash 
 > -kms_content_protection@type1,Crash 
 > -kms_content_protection@uevent,Crash 
 > -kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail 
 > -kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail 
 > -kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail 
 > -kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail 
 > -kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail 
 > -kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail 
 > -kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail 
 > -kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-toggle,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail 
 > -kms_display_modes@extended-mode-basic,Fail 
 > -kms_flip@2x-flip-vs-modeset-vs-hang,Fail 
 > -kms_flip@2x-flip-vs-panning-vs-hang,Fail 
 >  kms_flip@flip-vs-modeset-vs-hang,Fail 
 >  kms_flip@flip-vs-panning-vs-hang,Fail 
 >  kms_lease@lease-uevent,Fail 
 > -kms_multipipe_modeset@basic-max-pipe-crc-check,Fail 
 >  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail 
 >  kms_plane_alpha_blend@alpha-7efc,Fail 
 >  kms_plane_alpha_blend@coverage-7efc,Fail 
 >  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail 
 > -kms_plane_lowres@tiling-none,Fail 
 >  kms_rmfb@close-fd,Fail 
 > -kms_vblank@ts-continuation-dpms-rpm,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt 
 > index d42004cd6977..6dbc2080347d 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt 
 > @@ -1,8 +1,3 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_color@ctm-0-25,Fail 
 >  kms_color@ctm-0-50,Fail 
 >  kms_color@ctm-0-75,Fail 
 > @@ -11,35 +6,13 @@ kms_color@ctm-green-to-red,Fail 
 >  kms_color@ctm-negative,Fail 
 >  kms_color@ctm-red-to-blue,Fail 
 >  kms_color@ctm-signed,Fail 
 > -kms_content_protection@atomic,Crash 
 > -kms_content_protection@atomic-dpms,Crash 
 > -kms_content_protection@content-type-change,Crash 
 > -kms_content_protection@lic-type-0,Crash 
 > -kms_content_protection@lic-type-1,Crash 
 > -kms_content_protection@srm,Crash 
 > -kms_content_protection@type1,Crash 
 > -kms_content_protection@uevent,Crash 
 > -kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail 
 > -kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail 
 > -kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail 
 > -kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail 
 > -kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail 
 > -kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail 
 > -kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail 
 > -kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-toggle,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail 
 > -kms_display_modes@extended-mode-basic,Fail 
 > -kms_flip@2x-flip-vs-modeset-vs-hang,Fail 
 > -kms_flip@2x-flip-vs-panning-vs-hang,Fail 
 >  kms_flip@flip-vs-modeset-vs-hang,Fail 
 >  kms_flip@flip-vs-panning-vs-hang,Fail 
 >  kms_lease@lease-uevent,Fail 
 > -kms_multipipe_modeset@basic-max-pipe-crc-check,Fail 
 >  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail 
 >  kms_plane_alpha_blend@alpha-7efc,Fail 
 >  kms_plane_alpha_blend@coverage-7efc,Fail 
 >  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail 
 > -kms_plane_lowres@tiling-none,Fail 
 >  kms_rmfb@close-fd,Fail 
 > -kms_vblank@ts-continuation-dpms-rpm,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt 
 > index 770a1c685fde..fa8c7e663858 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt 
 > @@ -1,8 +1,4 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 > +drm_read@invalid-buffer,Fail 
 >  kms_color@ctm-0-25,Fail 
 >  kms_color@ctm-0-50,Fail 
 >  kms_color@ctm-0-75,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt 
 > index 2aa96b1241c3..38ec0305c1f4 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt 
 > @@ -116,3 +116,17 @@ kms_cursor_legacy@flip-vs-cursor-toggle 
 >  # IGT Version: 1.28-gf13702b8e 
 >  # Linux Version: 6.10.0-rc5 
 >  msm/msm_shrink@copy-mmap-oom-8 
 > + 
 > +# Board Name: sdm845-cheza-r3 
 > +# Bug Report: https://lore.kernel.org/linux-arm-msm/64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_lease@page-flip-implicit-plane 
 > + 
 > +# Board Name: sdm845-cheza-r3 
 > +# Bug Report: https://lore.kernel.org/linux-arm-msm/64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc5 
 > +kms_flip@flip-vs-expired-vblank 
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt 
 > index 90651048ab61..94783cafc21a 100644 
 > --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt 
 > @@ -25,3 +25,8 @@ core_hotunplug.* 
 >  
 >  # Whole machine hangs 
 >  kms_cursor_crc.* 
 > + 
 > +# IGT test crash 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_content_protection@uevent 
 > diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt 
 > index fe8ce2ce33e6..abd1ccb71561 100644 
 > --- a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt 
 > @@ -1 +1,2 @@ 
 >  panfrost/panfrost_prime@gem-prime-import,Fail 
 > +panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt 
 > index fe8ce2ce33e6..abd1ccb71561 100644 
 > --- a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt 
 > @@ -1 +1,2 @@ 
 >  panfrost/panfrost_prime@gem-prime-import,Fail 
 > +panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt 
 > index 4a2f4b6b14c1..8330b934602a 100644 
 > --- a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt 
 > @@ -1 +1,2 @@ 
 >  panfrost/panfrost_prime@gem-prime-import,Crash 
 > +panfrost/panfrost_submit@pan-submit-error-bad-requirements,Crash 
 > diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt 
 > index fe8ce2ce33e6..abd1ccb71561 100644 
 > --- a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt 
 > @@ -1 +1,2 @@ 
 >  panfrost/panfrost_prime@gem-prime-import,Fail 
 > +panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt 
 > index ea7b2ceb95b9..90282dfa19f4 100644 
 > --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt 
 > @@ -1,18 +1,24 @@ 
 > -core_setmaster@master-drop-set-root,Crash 
 >  core_setmaster@master-drop-set-user,Crash 
 > -core_setmaster_vs_auth,Crash 
 > -device_reset@cold-reset-bound,Crash 
 > -device_reset@reset-bound,Crash 
 > -device_reset@unbind-cold-reset-rebind,Crash 
 > -device_reset@unbind-reset-rebind,Crash 
 >  dumb_buffer@create-clear,Crash 
 > -dumb_buffer@invalid-bpp,Crash 
 >  fbdev@pan,Crash 
 > +kms_bw@linear-tiling-2-displays-1920x1080p,Fail 
 >  kms_cursor_crc@cursor-onscreen-32x10,Crash 
 >  kms_cursor_crc@cursor-onscreen-32x32,Crash 
 > +kms_cursor_crc@cursor-onscreen-64x64,Crash 
 >  kms_cursor_crc@cursor-random-32x10,Crash 
 > +kms_cursor_crc@cursor-sliding-32x10,Crash 
 >  kms_cursor_crc@cursor-sliding-32x32,Crash 
 > +kms_cursor_crc@cursor-sliding-64x21,Crash 
 >  kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail 
 >  kms_cursor_legacy@cursor-vs-flip-legacy,Fail 
 > +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Crash 
 > +kms_flip@flip-vs-panning-vs-hang,Crash 
 > +kms_invalid_mode@int-max-clock,Crash 
 > +kms_lease@invalid-create-leases,Fail 
 > +kms_pipe_crc_basic@read-crc-frame-sequence,Crash 
 > +kms_plane@pixel-format,Crash 
 > +kms_plane@pixel-format-source-clamping,Crash 
 >  kms_prop_blob@invalid-set-prop,Crash 
 > -kms_prop_blob@invalid-set-prop-any,Crash 
 > +kms_properties@get_properties-sanity-atomic,Crash 
 > +kms_properties@get_properties-sanity-non-atomic,Crash 
 > +kms_rmfb@close-fd,Crash 
 > diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt 
 > index 7ede273aab20..cd0b27d8b636 100644 
 > --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt 
 > @@ -4,3 +4,31 @@ 
 >  # IGT Version: 1.28-gf13702b8e 
 >  # Linux Version: 6.10.0-rc5 
 >  kms_cursor_legacy@flip-vs-cursor-atomic 
 > + 
 > +# Board Name: rk3288-veyron-jaq 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_cursor_crc@cursor-offscreen-32x10 
 > + 
 > +# Board Name: rk3288-veyron-jaq 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_cursor_edge_walk@64x64-left-edge 
 > + 
 > +# Board Name: rk3288-veyron-jaq 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_flip@plain-flip-ts-check 
 > + 
 > +# Board Name: rk3288-veyron-jaq 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_cursor_crc@cursor-alpha-opaque 
 > diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt 
 > index 9309ff15e23a..83a38853b4af 100644 
 > --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt 
 > @@ -1,9 +1,4 @@ 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 >  dumb_buffer@create-clear,Crash 
 > -dumb_buffer@invalid-bpp,Fail 
 >  kms_atomic_transition@modeset-transition,Fail 
 >  kms_atomic_transition@modeset-transition-fencing,Fail 
 >  kms_atomic_transition@plane-toggle-modeset-transition,Fail 
 > @@ -46,7 +41,6 @@ kms_cursor_legacy@flip-vs-cursor-legacy,Fail 
 >  kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail 
 >  kms_flip@basic-flip-vs-wf_vblank,Fail 
 >  kms_flip@blocking-wf_vblank,Fail 
 > -kms_flip@dpms-vs-vblank-race,Fail 
 >  kms_flip@flip-vs-absolute-wf_vblank,Fail 
 >  kms_flip@flip-vs-blocking-wf-vblank,Fail 
 >  kms_flip@flip-vs-modeset-vs-hang,Fail 
 > @@ -59,7 +53,6 @@ kms_flip@plain-flip-fb-recreate,Fail 
 >  kms_flip@plain-flip-fb-recreate-interruptible,Fail 
 >  kms_flip@plain-flip-ts-check,Fail 
 >  kms_flip@plain-flip-ts-check-interruptible,Fail 
 > -kms_flip@wf_vblank-ts-check,Fail 
 >  kms_flip@wf_vblank-ts-check-interruptible,Fail 
 >  kms_invalid_mode@int-max-clock,Fail 
 >  kms_lease@lease-uevent,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
 > index d98f6a17343c..56f7d4f1ed15 100644 
 > --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
 > @@ -46,3 +46,31 @@ kms_setmode@basic 
 >  # IGT Version: 1.28-gf13702b8e 
 >  # Linux Version: 6.10.0-rc5 
 >  kms_bw@connected-linear-tiling-1-displays-2560x1440p 
 > + 
 > +# Board Name: rk3399-gru-kevin 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc2 
 > +kms_flip@wf_vblank-ts-check 
 > + 
 > +# Board Name: rk3399-gru-kevin 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc5 
 > +kms_flip@dpms-vs-vblank-race 
 > + 
 > +# Board Name: rk3399-gru-kevin 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc5 
 > +kms_bw@linear-tiling-2-displays-2160x1440p 
 > + 
 > +# Board Name: rk3399-gru-kevin 
 > +# Bug Report: https://lore.kernel.org/linux-rockchip/7505ac00-29ef-4ad9-8904-94b4c024c02b@collabora.com/T/#t 
 > +# Failure Rate: 50 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.11.0-rc5 
 > +kms_flip@flip-vs-expired-vblank 
 > diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt 
 > index 5408110f4c60..71c02104a683 100644 
 > --- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt 
 > @@ -1,24 +1,3 @@ 
 > -core_hotunplug@hotrebind,Fail 
 > -core_hotunplug@hotrebind-lateclose,Fail 
 > -core_hotunplug@hotreplug,Fail 
 > -core_hotunplug@hotreplug-lateclose,Fail 
 > -core_hotunplug@hotunbind-rebind,Fail 
 > -core_hotunplug@hotunplug-rescan,Fail 
 > -core_hotunplug@unbind-rebind,Fail 
 > -core_hotunplug@unplug-rescan,Fail 
 > -device_reset@cold-reset-bound,Fail 
 > -device_reset@reset-bound,Fail 
 > -device_reset@unbind-cold-reset-rebind,Fail 
 > -device_reset@unbind-reset-rebind,Fail 
 > -dumb_buffer@invalid-bpp,Fail 
 > -kms_content_protection@atomic,Crash 
 > -kms_content_protection@atomic-dpms,Crash 
 > -kms_content_protection@content-type-change,Crash 
 > -kms_content_protection@lic-type-0,Crash 
 > -kms_content_protection@lic-type-1,Crash 
 > -kms_content_protection@srm,Crash 
 > -kms_content_protection@type1,Crash 
 > -kms_content_protection@uevent,Crash 
 >  kms_cursor_crc@cursor-rapid-movement-128x128,Fail 
 >  kms_cursor_crc@cursor-rapid-movement-128x42,Fail 
 >  kms_cursor_crc@cursor-rapid-movement-256x256,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt 
 > index 5ccc771fbb36..b3d16e82e9a2 100644 
 > --- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt 
 > +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt 
 > @@ -205,6 +205,59 @@ kms_cursor_edge_walk@128x128-right-edge 
 >  # R10: ffffa2c181790000 R11: 0000000000000000 R12: ffffa2c1814fa810 
 >  # R13: 0000000000000031 R14: 0000000000000031 R15: 000000000000 
 >  
 > +kms_cursor_edge_walk@128x128-left-edge 
 > +# DEBUG - Begin test kms_cursor_edge_walk@128x128-left-edge 
 > +# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI 
 > +# CPU: 0 UID: 0 PID: 27 Comm: kworker/u8:1 Not tainted 6.11.0-rc5-g5d3429a7e9aa #1 
 > +# Hardware name: ChromiumOS crosvm, BIOS 0 
 > +# Workqueue: vkms_composer vkms_composer_worker [vkms] 
 > +# RIP: 0010:compose_active_planes+0x344/0x4e0 [vkms] 
 > +# Code: 6a 34 0f 8e 91 fe ff ff 44 89 ea 48 8d 7c 24 48 e8 71 f0 ff ff 4b 8b 04 fc 48 8b 4c 24 50 48 8b 7c 24 40 48 8b 80 48 01 00 00  63 70 18 8b 40 20 48 89 f2 48 c1 e6 03 29 d0 48 8b 54 24 48 48 
 > +# RSP: 0018:ffffa437800ebd58 EFLAGS: 00010282 
 > +# RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffa0e841904000 
 > +# RDX: 00000000000000ff RSI: ffffa0e841905ff8 RDI: ffffa0e841902000 
 > +# RBP: 0000000000000000 R08: ffffa0e84158a600 R09: 00000000000003ff 
 > +# R10: 0000000078b2bcd2 R11: 00000000278b2bcd R12: ffffa0e84870fc60 
 > +# R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000 
 > +# FS:  0000000000000000(0000) GS:ffffa0e86bc00000(0000) knlGS:0000000000000000 
 > +# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 
 > +# CR2: 0000000000000018 CR3: 0000000101710000 CR4: 0000000000350ef0 
 > +# Call Trace: 
 > +#   
 > +#  ? __die+0x1e/0x60 
 > +#  ? page_fault_oops+0x17b/0x4a0 
 > +#  ? exc_page_fault+0x6d/0x230 
 > +#  ? asm_exc_page_fault+0x26/0x30 
 > +#  ? compose_active_planes+0x344/0x4e0 [vkms] 
 > +#  ? compose_active_planes+0x32f/0x4e0 [vkms] 
 > +#  ? srso_return_thunk+0x5/0x5f 
 > +#  vkms_composer_worker+0x205/0x240 [vkms] 
 > +#  process_one_work+0x201/0x6c0 
 > +#  ? lock_is_held_type+0x9e/0x110 
 > +#  worker_thread+0x17e/0x310 
 > +#  ? __pfx_worker_thread+0x10/0x10 
 > +#  kthread+0xce/0x100 
 > +#  ? __pfx_kthread+0x10/0x10 
 > +#  ret_from_fork+0x2f/0x50 
 > +#  ? __pfx_kthread+0x10/0x10 
 > +#  ret_from_fork_asm+0x1a/0x30 
 > +#   
 > +# Modules linked in: vkms 
 > +# CR2: 0000000000000018 
 > +# ---[ end trace 0000000000000000 ]--- 
 > +# RIP: 0010:compose_active_planes+0x344/0x4e0 [vkms] 
 > +# Code: 6a 34 0f 8e 91 fe ff ff 44 89 ea 48 8d 7c 24 48 e8 71 f0 ff ff 4b 8b 04 fc 48 8b 4c 24 50 48 8b 7c 24 40 48 8b 80 48 01 00 00  63 70 18 8b 40 20 48 89 f2 48 c1 e6 03 29 d0 48 8b 54 24 48 48 
 > +# RSP: 0018:ffffa437800ebd58 EFLAGS: 00010282 
 > +# RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffa0e841904000 
 > +# RDX: 00000000000000ff RSI: ffffa0e841905ff8 RDI: ffffa0e841902000 
 > +# RBP: 0000000000000000 R08: ffffa0e84158a600 R09: 00000000000003ff 
 > +# R10: 0000000078b2bcd2 R11: 00000000278b2bcd R12: ffffa0e84870fc60 
 > +# R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000 
 > +# FS:  0000000000000000(0000) GS:ffffa0e86bc00000(0000) knlGS:0000000000000000 
 > +# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 
 > +# CR2: 0000000000000018 CR3: 0000000101710000 CR4: 0000000000350ef0 
 > +# vkms_vblank_simulate: vblank timer overrun 
 > + 
 >  # Skip driver specific tests 
 >  ^amdgpu.* 
 >  ^msm.* 
 > -- 
 > 2.43.0 
 >  
 > 
