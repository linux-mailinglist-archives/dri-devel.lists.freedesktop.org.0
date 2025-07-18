Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26566B0A12E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6010E967;
	Fri, 18 Jul 2025 10:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PxeEmdrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFD610E966;
 Fri, 18 Jul 2025 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752836078;
 bh=kI8P5hvtk98ztVoZhOZIUxQpGWfVuMx8worHgvsOJqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PxeEmdrr7diYxLObonRuruRSEQmOMCJNzLR7N1bNtlMkwF+IoOIuu8H3HqHCAOj9X
 rna+f6pU+Px453/MTHZGPeytd9R7Neft1Ekavrvtua/7qcDsx4TTmR4NjUMQ1d524v
 vhvIAb9dtrAASKBSx2SESprzGP7SVegL6Le1jYMdH9NUfExtOEUduRBOoO4rQ+sIPT
 9utQET3wyyVFNEO5810c/rNkICsq/ahXmklwLwbg3AfKpMC64jzOv9+MScoswtZet/
 UOeiNgG13hM+njszzdX5C8cAQw0kfRMWtaH8t/zvFztXsxkaFdDfJHbNbWc4wZ92S6
 30hoMMa/gE2rA==
Received: from debian.. (unknown [171.76.80.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 49F3117E156C;
 Fri, 18 Jul 2025 12:54:35 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] drm/ci: uprev IGT
Date: Fri, 18 Jul 2025 16:23:57 +0530
Message-ID: <20250718105407.32878-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
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

Uprev IGT to the latest version and update expectation files.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   2 +
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  11 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   2 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +----
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  83 ++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  10 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   3 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   7 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   5 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |  73 +++++++++++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  12 +-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   9 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   4 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   3 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
 31 files changed, 416 insertions(+), 63 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2787d096d4b0..8f9767d27f90 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 129d5b10baaadea1d6cd6377341c4cb42e7ee6fd
+  IGT_VERSION: 26ddb59c1d5f8d68500f2d09263afe919c79a8d2
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index f44dbce3151a..32a5ff773431 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -15,9 +15,11 @@ amdgpu/amd_plane@mpo-scale-p010,Fail
 amdgpu/amd_plane@mpo-scale-rgb,Crash
 amdgpu/amd_plane@mpo-swizzle-toggle,Fail
 amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+core_setmaster@master-drop-set-user,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
+kms_async_flips@basic-modeset-with-all-modifiers-formats,Crash
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index adffb011298a..8b81af104b30 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@async-flip-with-page-flip-events-atomic
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 kms_async_flips@crc-atomic
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://gitlab.freedesktop.org/drm/amd/-/issues/4406
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_async_flips@alternate-sync-async-flip
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 8e2b5504004e..7e733ea7b769 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,18 +1,18 @@
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
 kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -27,17 +27,12 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
 kms_universal_plane@disable-primary-vs-flip,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 7353ab11e940..098185e8c12c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,7 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6fef7c1e56ea..c642527e602c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,4 +1,3 @@
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -8,9 +7,6 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
-kms_fb_coherency@memset-crc,Crash
 kms_flip@busy-flip,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
@@ -35,17 +31,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_lease@lease-uevent,Fail
-kms_pipe_stress@stress-xrgb8888-untiled,Fail
-kms_pipe_stress@stress-xrgb8888-ytiled,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
 kms_psr2_sf@cursor-plane-update-sf,Fail
 kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
 kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
@@ -53,17 +38,6 @@ kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
 kms_psr2_sf@plane-move-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_sf@psr2-cursor-plane-update-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-continuous-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-plane-move-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_su@page_flip-NV12,Fail
-kms_psr2_su@page_flip-P010,Fail
-kms_setmode@basic,Fail
-kms_universal_plane@disable-primary-vs-flip,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
@@ -72,3 +46,6 @@ sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
 sysfs_timeslice_duration@off,Timeout
+core_setmaster@master-drop-set-user,Fail
+kms_pm_rpm@basic-rte,Fail
+api_intel_bb@intel-bb-blit-none,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index 5343cc1c8696..5e5b9901a08e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@crc
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 gen9_exec_parse@unaligned-access
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14625
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf_pmu@most-busy-check-all
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 8adf5f0a6e80..63929e01d5a9 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -4,16 +4,20 @@ i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@drrs-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_flip@blocking-wf_vblank,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -28,13 +32,11 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
 kms_prop_blob@invalid-set-prop-any,Fail
 kms_properties@connector-properties-legacy,Timeout
 kms_rotation_crc@multiplane-rotation,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 2e4ef9f35654..633d925939bf 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -326,3 +326,86 @@ kms_lease.*
 
 # The test alternates between failing and timing out on reruns, causing the pipeline to fail
 gen9_exec_parse@unaligned-access
+
+kms_frontbuffer_tracking.*
+# DEBUG - Begin test kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu
+# Pass: 392, Fail: 2, UnexpectedImprovement: 6, ExpectedFail: 14, Skip: 29103, Timeout: 16, Duration: 1:22:45, Remaining: 9:07
+# [ 4297.883681] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# [ 4297.904667] RSP: 002b:00007ffeae886eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 4297.913141] RAX: ffffffffffffffda RBX: 00007ffeae887858 RCX: 00007fbc82201d1b
+# [ 4297.921135] RDX: 00007ffeae886f40 RSI: 00000000c06864a2 RDI: 0000000000000003
+# [ 4297.929123] RBP: 00007ffeae886f40 R08: 0000000000000000 R09: 00007ffeae887858
+# [ 4297.937111] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c06864a2
+# [ 4297.945097] R13: 0000000000000003 R14: 0000000000000000 R15: 00007ffeae887700
+# [ 4297.953093]  </TASK>
+# [ 4297.955550] irq event stamp: 0
+# [ 4297.958973] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# [ 4297.966005] hardirqs last disabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4297.975163] softirqs last  enabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4297.984330] softirqs last disabled at (0): [<0000000000000000>] 0x0
+# [ 4297.991354] ---[ end trace 0000000000000000 ]---
+# [ 4297.996610] ------------[ cut here ]------------
+# [ 4298.001797] i915 0000:00:02.0: [drm] plane 1A assertion failure (expected on, current off)
+# [ 4298.011099] WARNING: CPU: 1 PID: 2567 at drivers/gpu/drm/i915/display/intel_display.c:463 assert_plane+0x11b/0x130
+# [ 4298.022695] Modules linked in:
+# [ 4298.026124] CPU: 1 UID: 0 PID: 2567 Comm: kms_flip Tainted: G S      W           6.16.0-rc2-g0594d0b01a7c #1 PREEMPT(voluntary)
+# [ 4298.039094] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
+# [ 4298.044459] Hardware name: HP Bloog/Bloog, BIOS  09/19/2019
+# [ 4298.050697] RIP: 0010:assert_plane+0x11b/0x130
+# [ 4298.055676] Code: 50 48 85 ed 75 03 48 8b 2f e8 b1 be 12 00 4d 89 e9 4d 89 e0 48 89 d9 48 89 c6 48 89 ea 48 c7 c7 40 ac e1 b4 e8 f6 a3 6d ff 90 <0f> 0b 90 90 e9 2f ff ff ff e8 17 b0 7a 00 0f 1f 80 00 00 00 00 90
+# [ 4298.076695] RSP: 0018:ffffb1bb4087ba58 EFLAGS: 00010282
+# [ 4298.082558] RAX: 0000000000000000 RBX: ffff9052078df760 RCX: 00000000fffffa0c
+# [ 4298.090554] RDX: 0000000000000000 RSI: ffffb1bb4087b908 RDI: 0000000000000001
+# [ 4298.098536] RBP: ffff905201bb1740 R08: 000000000000823c R09: 00000000fffffa0c
+# [ 4298.106519] R10: 00000000fffffa0c R11: ffffffffb508eca0 R12: ffffffffb4eba9db
+# [ 4298.114524] R13: ffffffffb4e90a5f R14: ffff905201460800 R15: 0000000000000003
+# [ 4298.122512] FS:  00007fbc812516c0(0000) GS:ffff9052c60f9000(0000) knlGS:0000000000000000
+# [ 4298.131568] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# [ 4298.138009] CR2: 0000563771f3c5b8 CR3: 0000000102246000 CR4: 0000000000350ef0
+# [ 4298.146023] Call Trace:
+# [ 4298.148775]  <TASK>
+# [ 4298.151136]  intel_atomic_commit_tail+0x1684/0x1770
+# [ 4298.166393]  intel_atomic_commit+0x26e/0x2b0
+# [ 4298.171180]  drm_atomic_commit+0xab/0xe0
+# [ 4298.180878]  drm_atomic_helper_set_config+0x6f/0xb0
+# [ 4298.186349]  drm_mode_setcrtc+0x3ab/0x940
+# [ 4298.205833]  drm_ioctl_kernel+0xab/0x100
+# [ 4298.210241]  drm_ioctl+0x233/0x4b0
+# [ 4298.219164]  __x64_sys_ioctl+0x8e/0xe0
+# [ 4298.223373]  do_syscall_64+0xbb/0x370
+# [ 4298.227483]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# [ 4298.233142] RIP: 0033:0x7fbc82201d1b
+# [ 4298.237173] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# [ 4298.258178] RSP: 002b:00007ffeae886eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 4298.266653] RAX: ffffffffffffffda RBX: 00007ffeae887858 RCX: 00007fbc82201d1b
+# [ 4298.274663] RDX: 00007ffeae886f40 RSI: 00000000c06864a2 RDI: 0000000000000003
+# [ 4298.282664] RBP: 00007ffeae886f40 R08: 0000000000000000 R09: 00007ffeae887858
+# [ 4298.290650] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c06864a2
+# [ 4298.298634] R13: 0000000000000003 R14: 0000000000000000 R15: 00007ffeae887700
+# [ 4298.306650]  </TASK>
+# [ 4298.309103] irq event stamp: 0
+# [ 4298.312525] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# [ 4298.319543] hardirqs last disabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4298.328696] softirqs last  enabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4298.337872] softirqs last disabled at (0): [<0000000000000000>] 0x0
+# [ 4298.344892] ---[ end trace 0000000000000000 ]---
+
+sysfs_heartbeat_interval.*
+# [ 1219.376136] i915 0000:00:02.0: [drm] Resetting vecs0 for preemption time out
+# [ 1219.386448] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:8:277ffefe, in sysfs_heartbeat [1500]
+# [ 1219.395917] i915 0000:00:02.0: [drm] GPU error state saved to /sys/class/drm/card1/error
+# [ 1220.389661] [IGT] sysfs_heartbeat_interval: finished subtest vecs0, FAIL
+# [ 1220.397453] [IGT] sysfs_heartbeat_interval: starting dynamic subtest vcs0
+# [ 1220.405507] i915 0000:00:02.0: [drm] vcs0 heartbeat interval adjusted to a non-default value which may cause engine resets to target innocent contexts!
+# [ 1240.423786] Fence expiration time out i915-0000:00:02.0:0000:00:02.0:2!
+# [ 1240.433139] i915 0000:00:02.0: [drm] Resetting vcs0 for preemption time out
+# [ 1240.443200] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:4:a77ffefe, in sysfs_heartbeat [1500]
+# [ 1240.452664] i915 0000:00:02.0: [drm] GPU error state saved to /sys/class/drm/card1/error
+
+kms_busy@extended-pageflip-hang-newfb
+# DEBUG - Begin test kms_busy@extended-pageflip-hang-newfb
+# [  635.322871] [IGT] kms_busy: executing
+# [  635.376068] [IGT] kms_busy: starting subtest extended-pageflip-hang-newfb
+# [  635.387692] [IGT] kms_busy: starting dynamic subtest pipe-A
+# [  639.603625] i915 0000:00:02.0: [drm] Resetting rcs0 for preemption time out
+# [  639.611970] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:1:e757fefe, in kms_busy [821]
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
index 57453e340040..ea0da5dfaa27 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
@@ -1,20 +1,19 @@
+core_setmaster@master-drop-set-root,Fail
 drm_fdinfo@busy-check-all,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
 kms_flip@dpms-off-confusion,Fail
-kms_flip@nonexisting-fb,Fail
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,UnexpectedImprovement(Skip)
+kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -22,7 +21,6 @@ kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
@@ -37,9 +35,7 @@ kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
-perf_pmu@most-busy-idle-check-all,Fail
 perf_pmu@rc6,Crash
-prime_busy@before-wait,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index 117098bc95d9..2b1da50bac1c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -17,6 +18,8 @@ perf@i915-ref-count,Fail
 perf_pmu@busy-accuracy-50,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
+prime_busy@after-wait,Fail
+prime_busy@before,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 462c050a8b2d..102c4b3eef4d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,14 +1,14 @@
 api_intel_allocator@reopen,Timeout
 api_intel_bb@destroy-bb,Timeout
 core_hotunplug@hotrebind-lateclose,Timeout
+core_setmaster@master-drop-set-user,Fail
+drm_read@short-buffer-block,Timeout
 dumb_buffer@map-valid,Timeout
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rps@engine-order,Timeout
-i915_pm_rps@waitboost,Fail
 kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 perf@i915-ref-count,Fail
@@ -17,7 +17,6 @@ perf_pmu@enable-race,Timeout
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
 perf_pmu@semaphore-wait-idle,Timeout
-prime_busy@before,Fail
 prime_mmap@test_refcounting,Timeout
 sriov_basic@enable-vfs-bind-unbind-each-numvfs-all,Timeout
 syncobj_basic@illegal-fd-to-handle,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
new file mode 100644
index 000000000000..9738006e3759
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: acer-cp514-2h-1130g7-volteer
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14624
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf@gen12-unprivileged-single-ctx-counters
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 0f167cfd503c..233e127baf30 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -6,8 +6,8 @@ i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
@@ -29,7 +29,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
@@ -37,8 +36,6 @@ kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
 kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
 kms_prop_blob@invalid-set-prop-any,Fail
 kms_properties@connector-properties-legacy,Timeout
 kms_universal_plane@disable-primary-vs-flip,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 592d7d69e6fc..f3c023163de4 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
@@ -24,9 +25,9 @@ kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
 kms_flip@basic-plain-flip,Fail
 kms_flip@dpms-off-confusion,Fail
 kms_flip@dpms-off-confusion-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
index 443596d9e662..031828241b52 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -53,3 +53,122 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_flip@flip-vs-wf_vblank-interruptible
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/7559dd68-c9dd-410f-880f-201679e2dd54@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@blocking-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/953ab66e-9dda-4003-9b98-9e0d81e18a1f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@busy-flip
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/6ab7f59c-042e-4c7a-baaa-86c7d47ab308@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-rmfb
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com/
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_atomic_transition@plane-all-modeset-transition-internal-panels
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/4c9e1501-52cd-4659-a894-8a2ac58c3996@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@modeset-vs-vblank-race
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@nonexisting-fb
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@blocking-absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@dpms-vs-vblank-race
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-dpms
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-dpms-off-vs-modeset
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_atomic_transition@plane-toggle-modeset-transition
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@wf_vblank-ts-check
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-modeset
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 184d0cccc318..7f94244866b8 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -13,12 +13,9 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-toggle,Fail
 kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@basic-plain-flip,Fail
 kms_flip@dpms-off-confusion,Fail
 kms_flip@dpms-off-confusion-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
@@ -28,7 +25,6 @@ kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-interruptible,Fail
@@ -36,3 +32,6 @@ kms_flip@plain-flip-ts-check,Fail
 kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
+core_setmaster@master-drop-set-user,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index e4a8f8352cd6..9bf38c077f8e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -15,3 +15,4 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+core_setmaster@master-drop-set-user,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index e4a8f8352cd6..7441b363efae 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
index 8d26b23133aa..f387c73193c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
index 9450f2a002fd..84ffbe0981ea 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
@@ -210,3 +210,76 @@ msm/msm_mapping@ring
 # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
 # [  229.758095] Memory Limit: none
 # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
+
+msm/msm_recovery@gpu-fault
+# DEBUG - Begin test msm/msm_recovery@gpu-fault
+# [  153.288652] [IGT] msm_recovery: executing
+# [  153.295317] [IGT] msm_recovery: starting subtest gpu-fault
+# [  153.317588] adreno 3d00000.gpu: CP | opcode error | possible opcode=0xDEADDEAD
+# [  153.367412] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
+# [  153.383449] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
+# [  153.393296] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
+# [  153.436085] revision: 660 (6.6.0.1)
+# [  153.439702] rb 0: fence:    2063/2068
+# [  153.443659] rptr:     360
+# [  153.446389] rb wptr:  533
+# [  153.449103] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
+# [  153.455746] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
+# [  153.462387] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 2062
+# [  153.469293] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
+# [  153.475680] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
+# [  153.475919] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
+# [  153.475925] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
+# [  153.475928] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
+# [  153.475930] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 1
+# [  153.529587] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
+# [  153.539837] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
+# [  153.549597] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
+# [  153.566489] revision: 660 (6.6.0.1)
+# [  153.570099] rb 0: fence:    2064/2068
+# [  153.573878] rptr:     0
+# [  153.576411] rb wptr:  688
+# [  153.579134] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
+# [  153.585775] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
+# [  153.592410] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 0
+# [  153.597308] [IGT] msm_recovery: finished subtest gpu-fault, FAIL
+# [  153.599039] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
+# [  153.611856] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
+# [  153.618498] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
+# [  153.625132] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
+# [  153.631766] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 0
+# [  153.639162] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
+# [  153.648502] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
+# [  153.650144] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000020 dir=READ type=TRANSLATION source=CP (0,0,0,0)
+# [  153.650241] adreno 3d00000.gpu: CP illegal instruction error
+# [  153.671006] platform 3d6a000.gmu: [drm:a6xx_rpmh_start] *ERROR* Unable to power on the GPU RSC
+# [  153.687278] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
+# [  363.495437] INFO: task msm_recovery:876 blocked for more than 120 seconds.
+# [  363.503070]       Not tainted 6.16.0-rc2-g0594d0b01a7c #1
+# [  363.508838] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# [  363.517142] task:msm_recovery    state:D stack:0     pid:876   tgid:876   ppid:274    task_flags:0x400100 flags:0x00000009
+# [  363.528876] Call trace:
+# [  363.531554]  __switch_to+0xf8/0x1a8 (T)
+# [  363.535703]  __schedule+0x418/0xee0
+# [  363.539486]  schedule+0x4c/0x164
+# [  363.542986]  schedule_timeout+0x11c/0x128
+# [  363.547281]  dma_fence_default_wait+0x13c/0x234
+# [  363.552123]  dma_fence_wait_timeout+0x160/0x45c
+# [  363.556947]  dma_resv_wait_timeout+0x70/0x11c
+# [  363.561582]  msm_gem_close+0xac/0xe4
+# [  363.565405]  drm_gem_handle_delete+0x74/0xe8
+# [  363.569951]  drm_gem_close_ioctl+0x38/0x44
+# [  363.574297]  drm_ioctl_kernel+0xc4/0x134
+# [  363.578442]  drm_ioctl+0x224/0x4f0
+# [  363.582050]  __arm64_sys_ioctl+0xac/0x104
+# [  363.586292]  invoke_syscall+0x48/0x110
+# [  363.590254]  el0_svc_common.constprop.0+0x40/0xe0
+# [  363.595197]  do_el0_svc+0x1c/0x28
+# [  363.598705]  el0_svc+0x4c/0x158
+# [  363.602035]  el0t_64_sync_handler+0x10c/0x138
+# [  363.606601]  el0t_64_sync+0x198/0x19c
+# [  363.610465] Showing all locks held in the system:
+# [  363.620406]  #0: ffff0000840200a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x18/0x24
+# [  363.629412]  #1: ffff800080d7c2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x15c/0x57c
+# [  363.643169]  #0: ffffbd9c0475d920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x18/0x1c0
+# [  363.654158] =============================================
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
index 8330b934602a..8d0b7682e640 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Crash
 panfrost/panfrost_prime@gem-prime-import,Crash
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 61122ea7f008..5279c6808dbf 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -4,6 +4,16 @@ core_setmaster@master-drop-set-user,Crash
 core_setmaster_vs_auth,Crash
 dumb_buffer@create-clear,Crash
 fbdev@pan,Crash
-kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_crc@cursor-dpms,Crash
+kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_flip@basic-flip-vs-wf_vblank,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_flip@plain-flip-fb-recreate-interruptible,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_plane_cursor@overlay,Crash
+kms_plane_cursor@viewport,Crash
 kms_prop_blob@invalid-set-prop,Crash
 kms_prop_blob@invalid-set-prop-any,Crash
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
index cd0b27d8b636..34f43e95a51b 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -32,3 +32,24 @@ kms_flip@plain-flip-ts-check
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_cursor_crc@cursor-alpha-opaque
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/acfd5838-d861-4dd9-97c3-99fffc9bfa04@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/81e13fcc-d916-4eb8-91cd-f74f64f53f72@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-dpms-on-nop-interruptible
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/10c5abab-c8fe-4eff-8eed-009038436b49@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-fb-recreate
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 45dd8d493f6e..f24dd900e921 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,9 +1,10 @@
+core_setmaster@master-drop-set-user,Fail
 dumb_buffer@create-clear,Crash
 kms_atomic_transition@modeset-transition,Fail
 kms_atomic_transition@modeset-transition-fencing,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
+kms_cursor_crc@async-cursor-crc-framebuffer-change,Fail
+kms_cursor_crc@async-cursor-crc-position-change,Fail
 kms_cursor_crc@cursor-alpha-opaque,Fail
 kms_cursor_crc@cursor-alpha-transparent,Fail
 kms_cursor_crc@cursor-dpms,Fail
@@ -41,8 +42,11 @@ kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
+kms_flip@basic-flip-vs-dpms,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
@@ -51,7 +55,6 @@ kms_flip@modeset-vs-vblank-race,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index b467991d4094..918dd33c2092 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -144,3 +144,38 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_bw@linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/7b6e2e3b-2ea2-4cd7-92a5-68d23a63e426@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/e29c2892-08f2-423f-af72-e4d8b207fd1c@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@connected-linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/ad9ce463-c803-4502-ae89-381a6b6eb19f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@legacy-gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/59724e10-12ca-4481-b0e4-72d7b6e4dae0@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-ts-check-interruptible
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/d790db5f-a1ba-47f9-9af0-d3287ef3274c@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@linear-tiling-2-displays-3840x2160p
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 9749ddb75121..b72679519f4a 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -1,3 +1,5 @@
+drm_virtgpu@drm-virtgpu-context-init,Fail
+drm_virtgpu@drm-virtgpu-get-caps,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@size-max,Fail
@@ -143,6 +145,8 @@ kms_flip@dpms-vs-vblank-race-interruptible,Fail
 kms_flip@flip-vs-absolute-wf_vblank,Fail
 kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 6ebcc7d89fbd..1c6860b4a24f 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -1,3 +1,5 @@
+drm_virtgpu@drm-virtgpu-context-init,Fail
+drm_virtgpu@drm-virtgpu-get-caps,Fail
 kms_cursor_crc@cursor-rapid-movement-256x85,Fail
 kms_cursor_crc@cursor-rapid-movement-32x10,Fail
 kms_cursor_crc@cursor-rapid-movement-64x64,Fail
@@ -16,6 +18,7 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
+kms_plane@pixel-format,Timeout
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
index 716d2d4e452d..66227842e517 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -809,3 +809,6 @@ kms_dp_link_training.*
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
+
+# Hangs the machine and timeout occurs
+.*suspend.*
-- 
2.47.2

