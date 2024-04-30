Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D08B6DDE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 11:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E967410FA53;
	Tue, 30 Apr 2024 09:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lRwDorkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838D010FABE;
 Tue, 30 Apr 2024 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714468363;
 bh=7ZZNhk889JJWuT5jtgnWRtGN//3M/YNWqbpJTjWHcng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lRwDorkFixJyn3tyz3O7hc5iLgFokb/+DpBE5kWM1UQsvlp90XGlTNQ3NbVjKx9mg
 /Py44bSiRlVuptHAI2/UXxtoXOUfM0UxJHaSA5Py8ObN8SJ007eiQzurlnkoksdYKD
 99eDIvMGu4mTNeXQV85zpBzUsOi1UDg+AxLWAn5P2HlyXPxyAHzSlMO04j2g4iIZ8T
 4HJcZNpeE0a0Z32Br626NwSMDujWA240kzROoXvo6cBNHhOzWaFMwNAZgOCAPZT9vd
 aKCZjMu1MsZ48sQI0q06ZD3S+ur0SBwNI0C2A9uOCojGxH3te4MY39i7tnSSY2Zcp/
 x56+4w7g3TuiA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 24EAE3782167;
 Tue, 30 Apr 2024 09:12:37 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] drm/ci: update xfails for the new testlist
Date: Tue, 30 Apr 2024 14:41:21 +0530
Message-Id: <20240430091121.508099-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430091121.508099-1-vignesh.raman@collabora.com>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
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

Now the testlist is used from IGT build, so update
xfails with the new testlist.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 47 +++++++----
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  8 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt | 15 ++++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt | 22 ++++-
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  8 ++
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  8 ++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  | 45 +++++-----
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  5 ++
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  | 12 +++
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 26 +++++-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  6 ++
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |  8 ++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  | 28 +++++--
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 12 +++
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  | 39 ++++-----
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt | 10 ++-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 21 +++++
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  | 75 +++++++++--------
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  | 13 +++
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  | 46 +++++------
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |  8 ++
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 47 +++--------
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 17 +---
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  5 ++
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 20 +----
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |  5 ++
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   | 26 ++----
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  5 ++
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  5 +-
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |  5 ++
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   | 67 +++++++++++++++
 .../msm-sc7180-trogdor-kingoftown-fails.txt   | 34 ++++----
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  5 ++
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 34 ++++----
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  5 ++
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    | 75 ++++-------------
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 26 ++----
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 54 ------------
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 80 ++----------------
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  7 --
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 82 +++++++++++++------
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |  3 +
 42 files changed, 574 insertions(+), 495 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..a48df7880ec5 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,27 +1,46 @@
-kms_addfb_basic@bad-pitch-65536,Fail
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_assr@assr-links-dpms,Fail
+amdgpu/amd_deadlock@amdgpu-deadlock-compute,Timeout
+amdgpu/amd_ilr@ilr-policy,Fail
+amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple,Fail
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs,Fail
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo,Fail
+amdgpu/amd_plane@mpo-pan-nv12,Fail
+amdgpu/amd_plane@mpo-pan-p010,Fail
+amdgpu/amd_plane@mpo-pan-rgb,Crash
+amdgpu/amd_plane@mpo-scale-nv12,Fail
+amdgpu/amd_plane@mpo-scale-p010,Fail
+amdgpu/amd_plane@mpo-scale-rgb,Crash
+amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode,Fail
+amdgpu/amd_vm@amdgpu-vm-unaligned-map,Fail
+amdgpu/amd_vrr_range@freesync-parsing,Timeout
+device_reset@unbind-cold-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
 kms_async_flips@async-flip-with-page-flip-events,Fail
-kms_async_flips@crc,Fail
-kms_async_flips@invalid-async-flip,Fail
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
 kms_atomic_transition@plane-use-after-nonblocking-unbind,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-1-displays-3840x2160p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_color@degamma,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
-kms_cursor_crc@pipe-A-cursor-size-change,Fail
-kms_cursor_crc@pipe-B-cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_edge_walk@64x64-left-edge,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_hdr@bpc-switch,Fail
-kms_hdr@bpc-switch-dpms,Fail
+kms_lease@lease-uevent,Fail
 kms_plane@pixel-format,Fail
-kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
-kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
+perf@i915-ref-count,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index 6faf75e667d3..5eaf52f85922 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1 +1,7 @@
-kms_async_flips@async-flip-with-page-flip-events
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+device_reset@unbind-reset-rebind
+kms_async_flips@crc
+kms_plane@pixel-format-source-clamping
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index 70e2f925d06f..08675287a066 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -12,3 +12,18 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# GPU reset seen and it hangs the machine
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+
+# Hangs the machine and timeout occurs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+
+# Skip these tests as core_getrevision fails
+amdgpu/amd_module_load@reload
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 59438e4df86e..9929004eb7b8 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,3 +1,10 @@
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -7,8 +14,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -20,7 +25,20 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_pm_rpm@modeset-lpsp-stress,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@duration,Timeout
+sysfs_timeslice_duration@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
new file mode 100644
index 000000000000..92c0f8c1b78f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: asus-C433TA-AJ0005-rammus
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+i915_hangman@engine-engine-error
+i915_hangman@engine-engine-hang
+i915_hangman@gt-engine-error
+i915_hangman@gt-engine-hang
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index 59f8acfaa5ba..5663ed0420a7 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -14,3 +14,11 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+kms_scaling_modes.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 2e3b7c5dac3c..2f89f48326b8 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,13 +1,9 @@
-kms_3d,Timeout
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+core_setmaster@master-drop-set-root,Fail
+core_setmaster_vs_auth,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -26,22 +22,29 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_pm_backlight@basic-brightness,Fail
+kms_pm_backlight@fade,Fail
+kms_pm_backlight@fade-with-dpms,Crash
+kms_pm_rpm@legacy-planes,Timeout
+kms_pm_rpm@legacy-planes-dpms,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+kms_prop_blob@invalid-set-prop-any,Fail
 kms_sysfs_edid_timing,Fail
+perf@i915-ref-count,Fail
+perf@non-zero-reason,Timeout
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
new file mode 100644
index 000000000000..fd89e83cb43d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: asus-C523NA-A20057-coral
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+kms_fb_coherency@memset-crc
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
index d97bc038b63a..ab588e7a447c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
@@ -16,3 +16,15 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+i915_pm_rpm.*
+device_reset.*
+api_intel_allocator.*
+kms_frontbuffer_tracking.*
+kms_ccs.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 240ef8467c26..dc781acef8a1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,3 +1,13 @@
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pipe_stress@stress-xrgb8888-untiled,Fail
+i915_pipe_stress@stress-xrgb8888-ytiled,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@system-suspend-execbuf,Timeout
+kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -7,8 +17,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -20,11 +28,23 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@constant-alpha-min,Fail
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
 kms_psr2_su@page_flip-NV12,Fail
 kms_psr2_su@page_flip-P010,Fail
 kms_setmode@basic,Fail
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+perf_pmu@rc6-suspend,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@duration,Timeout
+sysfs_timeslice_duration@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
new file mode 100644
index 000000000000..772b1e1ca2ad
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+kms_async_flips@crc
+kms_plane_alpha_blend@constant-alpha-min
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 92c0ffee8283..e0041a528432 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -12,3 +12,11 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_frontbuffer_tracking.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 4596055d7e5e..48facfdfe3a8 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,5 +1,9 @@
-kms_fbcon_fbt@fbc,Fail
-kms_flip@blocking-wf_vblank,Fail
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
@@ -11,8 +15,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -25,12 +27,20 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
-kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_pm_rpm@legacy-planes,Timeout
+kms_pm_rpm@legacy-planes-dpms,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
 kms_rotation_crc@multiplane-rotation,Fail
 kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
-kms_setmode@basic,Fail
+kms_vblank@ts-continuation-modeset-hang,Timeout
+perf@non-zero-reason,Timeout
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@duration,Timeout
+sysfs_timeslice_duration@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index a168722caf13..b3226b2d9ba1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -15,3 +15,15 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+i915_pm_rpm.*
+kms_ccs.*
+kms_plane_multiple.*
+perf.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_plane_alpha_blend.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index dab202716909..edd47f4bf985 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -1,32 +1,25 @@
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+perf@i915-ref-count,Fail
+perf_pmu@busy-accuracy-50,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+prime_busy@after,Fail
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+testdisplay,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
index a12f888530dd..73824d27c456 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
@@ -1 +1,9 @@
-kms_async_flips@crc
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+core_setmaster@master-drop-set-root
+core_setmaster_vs_auth
+gen9_exec_parse@allowed-single
+i915_pm_rps@thresholds-park
+prime_busy@hang-wait
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index a168722caf13..cb37eaf022ea 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -15,3 +15,24 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_.*
+api_intel_bb.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_.*
+prime_mmap_coherency.*
+perf.*
+drm_read.*
+api_intel_allocator.*
+sysfs_preempt_timeout.*
+dumb_buffer.*
+gen9_exec_parse.*
+debugfs_test.*
+core_hotunplug.*
+
+# GPU hang
+sysfs_timeslice_.*
+sysfs_heartbeat_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 27bfca1c6f2c..ffa548604abb 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,36 +1,41 @@
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_bw@linear-tiling-5-displays-1920x1080p,Fail
-kms_bw@linear-tiling-5-displays-2560x1440p,Fail
-kms_bw@linear-tiling-5-displays-3840x2160p,Fail
-kms_flip@flip-vs-panning-vs-hang,Timeout
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_rotation_crc@bad-pixel-format,Fail
+api_intel_bb@blit-noreloc-keep-cache,Timeout
+api_intel_bb@offset-control,Timeout
+api_intel_bb@render-ccs,Timeout
+core_getclient,Timeout
+core_hotunplug@hotreplug-lateclose,Timeout
+drm_read@short-buffer-nonblock,Timeout
+dumb_buffer@map-uaf,Timeout
+gen3_render_tiledx_blits,Timeout
+gen7_exec_parse@basic-allocation,Timeout
+gen7_exec_parse@batch-without-end,Timeout
+gen9_exec_parse@batch-invalid-length,Timeout
+gen9_exec_parse@bb-secure,Timeout
+i915_hangman@gt-error-state-capture,Timeout
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pciid,Timeout
+i915_pm_rps@fence-order,Fail
+i915_query@engine-info,Timeout
+kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
+perf@i915-ref-count,Fail
+perf_pmu@busy,Timeout
+perf_pmu@enable-race,Timeout
+perf_pmu@event-wait,Timeout
+perf_pmu@gt-awake,Timeout
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+prime_busy@before-wait,Fail
+prime_mmap@test_map_unmap,Timeout
+prime_self_import@basic-with_one_bo,Timeout
+syncobj_basic@bad-destroy,Timeout
+syncobj_eventfd@invalid-bad-pad,Timeout
+syncobj_wait@invalid-multi-wait-unsubmitted-signaled,Timeout
+syncobj_wait@invalid-signal-illegal-handle,Timeout
+syncobj_wait@invalid-single-wait-all-unsubmitted,Timeout
+syncobj_wait@multi-wait-all-submitted,Timeout
+syncobj_wait@multi-wait-for-submit-submitted-signaled,Timeout
+syncobj_wait@wait-any-complex,Timeout
+syncobj_wait@wait-delayed-signal,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index d41344627261..3ceb4a9d3791 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -21,3 +21,16 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Kernel panic
+drm_fdinfo.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+sysfs_heartbeat_interval.*
+syncobj_timeline.*
+sysfs_timeslice_duration.*
+
+# Kernel panic and test hangs with multiple kms tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 967327ddc1ac..2bfb8fadb1cf 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -1,14 +1,12 @@
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_fbcon_fbt@fbc,Fail
-kms_fbcon_fbt@fbc-suspend,Fail
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@system-suspend-execbuf,Timeout
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -18,8 +16,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -31,18 +27,22 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_pm_rpm@modeset-lpsp-stress,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+perf_pmu@rc6-suspend,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@duration,Timeout
+sysfs_timeslice_duration@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
index 92c0ffee8283..20bd91525f45 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
@@ -12,3 +12,11 @@ panfrost_.*
 
 # GEM tests takes ~1000 hours, so skip it
 gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+kms_flip.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index ef0cb7c3698c..0028d9485c21 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,36 +1,13 @@
+core_hotunplug,Crash
+device_reset,Fail
+dumb_buffer,Fail
 kms_3d,Fail
-kms_bw@linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-1-displays-3840x2160p,Fail
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_color@invalid-gamma-lut-sizes,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
-kms_cursor_legacy@cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@cursor-vs-flip-legacy,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@flip-vs-suspend,Fail
-kms_flip@flip-vs-suspend-interruptible,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_force_connector_basic@force-load-detect,Fail
-kms_force_connector_basic@prune-stale-modes,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_properties@get_properties-sanity-atomic,Fail
-kms_properties@plane-properties-atomic,Fail
-kms_properties@plane-properties-legacy,Fail
-kms_rmfb@close-fd,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
+kms_atomic_transition,Timeout
+kms_bw,Fail
+kms_color,Fail
+kms_cursor_legacy,Timeout
+kms_flip,Timeout
+kms_lease,Fail
+kms_properties,Fail
+kms_rmfb,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 67d690fc4037..ca52e42f0b50 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,13 +1,4 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_rmfb@close-fd,Fail
+dumb_buffer,Fail
+panfrost_prime,Fail
+panfrost_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..2384f01bccd1
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+core_hotunplug
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 56a2ae7047b4..ca52e42f0b50 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,16 +1,4 @@
-kms_3d,Fail
-kms_cursor_legacy@forked-bo,Fail
-kms_cursor_legacy@forked-move,Fail
-kms_cursor_legacy@single-bo,Fail
-kms_cursor_legacy@single-move,Fail
-kms_cursor_legacy@torture-bo,Fail
-kms_cursor_legacy@torture-move,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_properties@connector-properties-atomic,Fail
-kms_properties@connector-properties-legacy,Fail
-kms_properties@get_properties-sanity-atomic,Fail
-kms_properties@get_properties-sanity-non-atomic,Fail
+dumb_buffer,Fail
+panfrost_prime,Fail
+panfrost_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
new file mode 100644
index 000000000000..10819305c997
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: meson-g12b-a311d-khadas-vim3
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+core_hotunplug
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 44a5c62dedad..96e9faf0e607 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,19 +1,9 @@
+core_setmaster_vs_auth,Fail
+device_reset,Fail
+dumb_buffer,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_cursor_legacy@all-pipes-forked-bo,Fail
-kms_cursor_legacy@all-pipes-forked-move,Fail
-kms_cursor_legacy@all-pipes-single-bo,Fail
-kms_cursor_legacy@all-pipes-single-move,Fail
-kms_cursor_legacy@all-pipes-torture-bo,Fail
-kms_cursor_legacy@all-pipes-torture-move,Fail
-kms_cursor_legacy@pipe-A-forked-bo,Fail
-kms_cursor_legacy@pipe-A-forked-move,Fail
-kms_cursor_legacy@pipe-A-single-bo,Fail
-kms_cursor_legacy@pipe-A-single-move,Fail
-kms_cursor_legacy@pipe-A-torture-bo,Fail
-kms_cursor_legacy@pipe-A-torture-move,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
-msm_mapping@ring,Fail
+kms_force_connector_basic,Fail
+kms_lease,Fail
+msm_mapping,Fail
+msm_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
new file mode 100644
index 000000000000..3cc361b3d3b3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: apq8016-sbc-usb-host
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+kms_cursor_legacy
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 88a1fc0a3b0d..468519a0fa4e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,3 @@
-kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
+core_setmaster,Fail
+device_reset,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
new file mode 100644
index 000000000000..10ed8cc1dd6d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: apq8096-db820c
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+core_hotunplug
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index 9ab2177df1ab..edf42f2b8150 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -12,3 +12,70 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Kernel soft lockup
+# [   80.170692] [IGT] msm_mapping: starting subtest shadow
+# [   80.177812] *** gpu fault: ttbr0=0000000101fd5000 iova=0000000001074000 dir=WRITE type=PERMISSION source=1f030000 (0,0,0,0)
+# [   83.848681] msm_mdp 901000.display-controller: RBBM | ME master split | status=0x701000B0
+# [  106.176640] rcu: INFO: rcu_preempt self-detected stall on CPU
+# [  106.176676] rcu: 	0-...!: (6500 ticks this GP) idle=f2b4/1/0x4000000000000000 softirq=10282/10282 fqs=0
+# [  106.181372] rcu: 	(t=6500 jiffies g=19853 q=464 ncpus=2)
+# [  106.190568] rcu: rcu_preempt kthread timer wakeup didn't happen for 6499 jiffies! g19853 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
+# [  106.196128] rcu: 	Possible timer handling issue on cpu=0 timer-softirq=4739
+# [  106.207322] rcu: rcu_preempt kthread starved for 6505 jiffies! g19853 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
+# [  106.214182] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
+# [  106.224597] rcu: RCU grace-period kthread stack dump:
+# [  106.233973] task:rcu_preempt     state:I stack:0     pid:15    tgid:15    ppid:2      flags:0x00000008
+# [  106.238922] Call trace:
+# [  106.248116]  __switch_to+0xe0/0x124
+# [  106.250462]  __schedule+0x358/0xbe8
+# [  106.253933]  schedule+0x4c/0x158
+# [  106.257405]  schedule_timeout+0x9c/0x110
+# [  106.260878]  rcu_gp_fqs_loop+0x19c/0x758
+# [  106.264785]  rcu_gp_kthread+0x230/0x2f4
+# [  106.268691]  kthread+0x114/0x118
+# [  106.272249]  ret_from_fork+0x10/0x20
+# [  106.275736] CPU: 0 PID: 10 Comm: kworker/u16:0 Tainted: G        W          6.9.0-rc4-gd846f438752d #1
+# [  106.279287] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
+# [  106.288400] Workqueue: ring0 drm_sched_run_job_work
+# [  106.294560] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
+# [  106.299335] pc : __do_softirq+0xe8/0x52c
+# [  106.306278] lr : __do_softirq+0xe4/0x52c
+# [  106.310444] sp : ffff800080003f20
+# [  106.314350] x29: ffff800080003f20 x28: ffff000080201b80 x27: ffff800082ab0da8
+# [  106.317564] x26: ffff80008222d008 x25: ffff000083117200 x24: ffff000080f6e8d0
+# [  106.324683] x23: 0000000060000005 x22: 0000000000000282 x21: ffff800080083ac0
+# [  106.331800] x20: ffff800080090178 x19: ffff800082242ec0 x18: 0000000000000006
+# [  106.338919] x17: ffff80007b883000 x16: ffff800080000000 x15: 0000000000000001
+# [  106.346037] x14: 0000000000480877 x13: 0000000000000004 x12: 0000000000000077
+# [  106.353154] x11: 0000000000000001 x10: 0000000000000077 x9 : ffff800082ab51c0
+# [  106.360272] x8 : 00000012aa9fa300 x7 : 7fffffffffffffff x6 : 0000000003a28b38
+# [  106.367391] x5 : 0000000000000000 x4 : ffff800080000000 x3 : 0000000000000000
+# [  106.374510] x2 : 0000000000000000 x1 : ffff800082ab3000 x0 : 0000000000000000
+# [  106.381629] Call trace:
+# [  106.388741]  __do_softirq+0xe8/0x52c
+# [  106.390999]  ____do_softirq+0x10/0x1c
+# [  106.394819]  call_on_irq_stack+0x24/0x4c
+# [  106.398379]  do_softirq_own_stack+0x1c/0x28
+# [  106.402371]  __irq_exit_rcu+0x154/0x178
+# [  106.406277]  irq_exit_rcu+0x10/0x38
+# [  106.410095]  el1_interrupt+0x38/0x64
+# [  106.413568]  el1h_64_irq_handler+0x18/0x24
+# [  106.417388]  el1h_64_irq+0x64/0x68
+# [  106.421293]  preempt_schedule_irq+0x38/0x9c
+# [  106.424679]  el1_interrupt+0x4c/0x64
+# [  106.428758]  el1h_64_irq_handler+0x18/0x24
+# [  106.432580]  el1h_64_irq+0x64/0x68
+# [  106.436485]  round_jiffies_up+0x0/0x7c
+# [  106.439870]  msm_gpu_submit+0x118/0x18c
+# [  106.443603]  msm_job_run+0xa4/0x120
+# [  106.447335]  drm_sched_run_job_work+0x278/0x4d0
+# [  106.450808]  process_one_work+0x218/0x620
+# [  106.455323]  worker_thread+0x1ac/0x37c
+# [  106.459489]  kthread+0x114/0x118
+# [  106.463134]  ret_from_fork+0x10/0x20
+# [  132.024633] watchdog: BUG: soft lockup - CPU#0 stuck for 48s! [kworker/u16:0:10]
+# Detected kernel soft lockup, abandoning run.
+# [  132.024670] Modules linked in:
+# [  132.031097] irq event stamp: 10088
+msm_mapping@*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index f0576aa629e8..25701e84bad2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -1,18 +1,16 @@
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-blue-to-red,Fail
-kms_color@ctm-green-to-red,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
-kms_cursor_legacy@cursor-vs-flip-toggle,Fail
-kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@coverage-7efc,Fail
-kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-sanity,Fail
+device_reset,Fail
+dumb_buffer,Fail
+kms_color,Timeout
+kms_cursor_crc,Timeout
+kms_cursor_edge_walk,Timeout
+kms_flip,Timeout
+kms_lease,Fail
+kms_pipe_crc_basic,Fail
+kms_plane,Fail
+kms_plane_alpha_blend,Fail
+kms_rmfb,Fail
+kms_universal_plane,Fail
+kms_vblank,Timeout
+msm_shrink,Timeout
+msm_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
new file mode 100644
index 000000000000..b99634e2c08c
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: sc7180-trogdor-kingoftown
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+kms_cursor_legacy
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index f0576aa629e8..25701e84bad2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,18 +1,16 @@
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-blue-to-red,Fail
-kms_color@ctm-green-to-red,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
-kms_cursor_legacy@cursor-vs-flip-toggle,Fail
-kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@coverage-7efc,Fail
-kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-sanity,Fail
+device_reset,Fail
+dumb_buffer,Fail
+kms_color,Timeout
+kms_cursor_crc,Timeout
+kms_cursor_edge_walk,Timeout
+kms_flip,Timeout
+kms_lease,Fail
+kms_pipe_crc_basic,Fail
+kms_plane,Fail
+kms_plane_alpha_blend,Fail
+kms_rmfb,Fail
+kms_universal_plane,Fail
+kms_vblank,Timeout
+msm_shrink,Timeout
+msm_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
new file mode 100644
index 000000000000..a832bb107312
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
+# Bug Report: TBD
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.9.0-rc4
+kms_cursor_legacy
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index e9043a00383e..a3d26adce3c7 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -1,60 +1,15 @@
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-blue-to-red,Fail
-kms_color@ctm-green-to-red,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
-kms_color@pipe-A-ctm-0-25,Fail
-kms_color@pipe-A-ctm-0-5,Fail
-kms_color@pipe-A-ctm-0-75,Fail
-kms_color@pipe-A-ctm-blue-to-red,Fail
-kms_color@pipe-A-ctm-green-to-red,Fail
-kms_color@pipe-A-ctm-max,Fail
-kms_color@pipe-A-ctm-negative,Fail
-kms_color@pipe-A-ctm-red-to-blue,Fail
-kms_color@pipe-A-legacy-gamma,Fail
-kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
-kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
-kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
-kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
-kms_cursor_legacy@cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
-kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size,Fail
-kms_cursor_legacy@cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@cursor-vs-flip-toggle,Fail
-kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_cursor_legacy@flip-vs-cursor-atomic,Fail
-kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
-kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
-kms_cursor_legacy@flip-vs-cursor-legacy,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@coverage-7efc,Fail
-kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
-kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
-kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@pipe-A-overlay-size-128,Fail
-kms_plane_cursor@pipe-A-overlay-size-256,Fail
-kms_plane_cursor@pipe-A-overlay-size-64,Fail
-kms_plane_cursor@pipe-A-viewport-size-128,Fail
-kms_plane_cursor@pipe-A-viewport-size-256,Fail
-kms_plane_cursor@pipe-A-viewport-size-64,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_scaling@downscale-with-pixel-format-factor-0-25,Timeout
-kms_plane_scaling@downscale-with-pixel-format-factor-0-5,Timeout
-kms_plane_scaling@downscale-with-pixel-format-factor-0-75,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75,Timeout
-kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats,Timeout
-kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling,Timeout
-kms_plane_scaling@planes-downscale-factor-0-25,Fail
-kms_plane_scaling@scaler-with-clipping-clamping,Timeout
-kms_plane_scaling@scaler-with-pixel-format-unity-scaling,Timeout
-kms_rmfb@close-fd,Fail
+device_reset,Fail
+dumb_buffer,Fail
+kms_atomic_transition,Timeout
+kms_color,Timeout
+kms_cursor_crc,Timeout
+kms_cursor_edge_walk,Timeout
+kms_flip,Timeout
+kms_lease,Fail
+kms_pipe_crc_basic,Fail
+kms_plane,Timeout
+kms_plane_alpha_blend,Fail
+kms_plane_cursor,Fail
+kms_rmfb,Fail
+msm_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
index 8a492f01eaa4..977a5cbe1fb3 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
@@ -1,22 +1,6 @@
-# Board Name: msm:sdm845
-# Bug Report: https://lore.kernel.org/dri-devel/46287831-edfa-78e8-6055-d7a08831c445@collabora.com/T/#u
-# Failure Rate: 50
+# Board Name: sdm845-cheza-r3
+# Bug Report: TBD
 # IGT Version: 1.28-gd2af13d9f
-# Linux Version: 6.7.0-rc3
-
-# Reported by deqp-runner
-kms_cursor_legacy@basic-flip-after-cursor-legacy
-kms_cursor_legacy@flip-vs-cursor-toggle
-kms_cursor_legacy@flip-vs-cursor-varying-size
-kms_cursor_legacy@short-flip-after-cursor-toggle
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
-msm_shrink@copy-gpu-32
-msm_shrink@copy-gpu-oom-32
-
-# The below test shows inconsistency across multiple runs, giving
-# results of Pass and Fail alternately.
-kms_cursor_legacy@basic-flip-before-cursor-varying-size
-kms_cursor_legacy@flip-vs-cursor-atomic-transitions
-kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
-kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
+# Linux Version: 6.9.0-rc4
+kms_cursor_legacy
+msm_shrink
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
deleted file mode 100644
index 90c63f519e9e..000000000000
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-kms_3d,Crash
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_flip@flip-vs-modeset-vs-hang,Crash
-kms_flip@flip-vs-panning-vs-hang,Crash
-kms_force_connector_basic@force-load-detect,Fail
-kms_invalid_mode@int-max-clock,Crash
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
-kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
-kms_pipe_crc_basic@read-crc-frame-sequence,Crash
-kms_plane@pixel-format,Crash
-kms_plane@pixel-format-source-clamping,Crash
-kms_plane@plane-position-hole,Crash
-kms_plane@plane-position-hole-dpms,Crash
-kms_plane_cursor@overlay,Crash
-kms_plane_cursor@pipe-A-overlay-size-128,Fail
-kms_plane_cursor@pipe-A-overlay-size-256,Fail
-kms_plane_cursor@pipe-A-overlay-size-64,Fail
-kms_plane_cursor@pipe-A-primary-size-128,Fail
-kms_plane_cursor@pipe-A-primary-size-256,Fail
-kms_plane_cursor@pipe-A-primary-size-64,Fail
-kms_plane_cursor@pipe-A-viewport-size-128,Fail
-kms_plane_cursor@pipe-A-viewport-size-256,Fail
-kms_plane_cursor@pipe-A-viewport-size-64,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
-kms_plane_cursor@primary,Crash
-kms_plane_cursor@viewport,Crash
-kms_plane_lowres@tiling-none,Fail
-kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_prime@basic-crc,Fail
-kms_properties@connector-properties-atomic,Crash
-kms_properties@connector-properties-legacy,Crash
-kms_properties@get_properties-sanity-atomic,Crash
-kms_properties@get_properties-sanity-non-atomic,Crash
-kms_rmfb@close-fd,Crash
-kms_setmode@invalid-clone-single-crtc,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index d516d9c1d546..7225a9be4ad3 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,75 +1,5 @@
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
-kms_color@pipe-A-legacy-gamma,Fail
-kms_color@pipe-B-legacy-gamma,Fail
-kms_cursor_crc@cursor-alpha-opaque,Fail
-kms_cursor_crc@cursor-alpha-transparent,Fail
-kms_cursor_crc@cursor-dpms,Fail
-kms_cursor_crc@cursor-offscreen-32x10,Fail
-kms_cursor_crc@cursor-offscreen-32x32,Fail
-kms_cursor_crc@cursor-offscreen-64x64,Fail
-kms_cursor_crc@cursor-onscreen-32x10,Fail
-kms_cursor_crc@cursor-onscreen-32x32,Fail
-kms_cursor_crc@cursor-onscreen-64x21,Fail
-kms_cursor_crc@cursor-onscreen-64x64,Fail
-kms_cursor_crc@cursor-random-32x10,Fail
-kms_cursor_crc@cursor-random-32x32,Fail
-kms_cursor_crc@cursor-random-64x21,Fail
-kms_cursor_crc@cursor-random-64x64,Fail
-kms_cursor_crc@cursor-rapid-movement-32x32,Fail
-kms_cursor_crc@cursor-rapid-movement-64x21,Fail
-kms_cursor_crc@cursor-rapid-movement-64x64,Fail
-kms_cursor_crc@cursor-size-change,Fail
-kms_cursor_crc@cursor-sliding-32x10,Fail
-kms_cursor_crc@cursor-sliding-32x32,Fail
-kms_cursor_crc@cursor-sliding-64x21,Fail
-kms_cursor_crc@cursor-sliding-64x64,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
-kms_flip@blocking-wf_vblank,Fail
-kms_flip@dpms-vs-vblank-race,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
-kms_flip@flip-vs-blocking-wf-vblank,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning,Fail
-kms_flip@flip-vs-panning-interruptible,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@modeset-vs-vblank-race,Fail
-kms_flip@plain-flip-fb-recreate,Fail
-kms_flip@plain-flip-fb-recreate-interruptible,Fail
-kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
-kms_invalid_mode@int-max-clock,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
-kms_pipe_crc_basic@disable-crc-after-crtc,Fail
-kms_pipe_crc_basic@nonblocking-crc,Fail
-kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
-kms_pipe_crc_basic@read-crc,Fail
-kms_pipe_crc_basic@read-crc-frame-sequence,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
-kms_plane@plane-panning-bottom-right,Fail
-kms_plane@plane-panning-top-left,Fail
-kms_plane@plane-position-covered,Fail
-kms_plane@plane-position-hole,Fail
-kms_plane@plane-position-hole-dpms,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
-kms_plane_multiple@tiling-none,Fail
-kms_prime@basic-crc,Fail
-kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-pipe-B-functional,Fail
+core_hotunplug,Fail
+dumb_buffer,Fail
+panfrost_prime,Fail
+panfrost_submit,Fail
+tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
deleted file mode 100644
index c9fdc623ab91..000000000000
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_cursor_crc@cursor-offscreen-64x21
-kms_flip@dpms-vs-vblank-race-interruptible
-kms_flip@flip-vs-wf_vblank-interruptible
-kms_plane_cursor@overlay
-kms_plane_cursor@primary
-kms_plane_cursor@viewport
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 007f21e56d89..e1cb47777053 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -1,4 +1,7 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@size-max,Fail
@@ -7,6 +10,27 @@ kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-10-displays-1920x1080p,Fail
+kms_bw@linear-tiling-10-displays-2560x1440p,Fail
+kms_bw@linear-tiling-10-displays-3840x2160p,Fail
+kms_bw@linear-tiling-11-displays-1920x1080p,Fail
+kms_bw@linear-tiling-11-displays-2560x1440p,Fail
+kms_bw@linear-tiling-11-displays-3840x2160p,Fail
+kms_bw@linear-tiling-12-displays-1920x1080p,Fail
+kms_bw@linear-tiling-12-displays-2560x1440p,Fail
+kms_bw@linear-tiling-12-displays-3840x2160p,Fail
+kms_bw@linear-tiling-13-displays-1920x1080p,Fail
+kms_bw@linear-tiling-13-displays-2560x1440p,Fail
+kms_bw@linear-tiling-13-displays-3840x2160p,Fail
+kms_bw@linear-tiling-14-displays-1920x1080p,Fail
+kms_bw@linear-tiling-14-displays-2560x1440p,Fail
+kms_bw@linear-tiling-14-displays-3840x2160p,Fail
+kms_bw@linear-tiling-15-displays-1920x1080p,Fail
+kms_bw@linear-tiling-15-displays-2560x1440p,Fail
+kms_bw@linear-tiling-15-displays-3840x2160p,Fail
+kms_bw@linear-tiling-16-displays-1920x1080p,Fail
+kms_bw@linear-tiling-16-displays-2560x1440p,Fail
+kms_bw@linear-tiling-16-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
@@ -28,6 +52,9 @@ kms_bw@linear-tiling-7-displays-3840x2160p,Fail
 kms_bw@linear-tiling-8-displays-1920x1080p,Fail
 kms_bw@linear-tiling-8-displays-2560x1440p,Fail
 kms_bw@linear-tiling-8-displays-3840x2160p,Fail
+kms_bw@linear-tiling-9-displays-1920x1080p,Fail
+kms_bw@linear-tiling-9-displays-2560x1440p,Fail
+kms_bw@linear-tiling-9-displays-3840x2160p,Fail
 kms_flip@absolute-wf_vblank,Fail
 kms_flip@absolute-wf_vblank-interruptible,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
@@ -54,31 +81,34 @@ kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
-kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
+kms_lease@cursor-implicit-plane,Fail
+kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Fail
+kms_lease@setcrtc-implicit-plane,Fail
+kms_lease@simple-lease,Fail
+kms_sequence@get-busy,Fail
+kms_sequence@get-forked,Fail
+kms_sequence@get-forked-busy,Fail
+kms_sequence@get-idle,Fail
+kms_sequence@queue-busy,Fail
+kms_sequence@queue-idle,Fail
 kms_setmode@basic,Fail
+kms_vblank@accuracy-idle,Fail
 kms_vblank@crtc-id,Fail
 kms_vblank@invalid,Fail
-kms_vblank@pipe-A-accuracy-idle,Fail
-kms_vblank@pipe-A-query-busy,Fail
-kms_vblank@pipe-A-query-forked,Fail
-kms_vblank@pipe-A-query-forked-busy,Fail
-kms_vblank@pipe-A-query-idle,Fail
-kms_vblank@pipe-A-ts-continuation-idle,Fail
-kms_vblank@pipe-A-ts-continuation-modeset,Fail
-kms_vblank@pipe-A-ts-continuation-suspend,Fail
-kms_vblank@pipe-A-wait-busy,Fail
-kms_vblank@pipe-A-wait-forked,Fail
-kms_vblank@pipe-A-wait-forked-busy,Fail
-kms_vblank@pipe-A-wait-idle,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-dpms-suspend,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@ts-continuation-suspend,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
+perf@i915-ref-count,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 6f00d3670530..4c9604301bab 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -17,3 +17,6 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Skip these tests as core_getrevision fails
+core_hotunplug.*
-- 
2.40.1

