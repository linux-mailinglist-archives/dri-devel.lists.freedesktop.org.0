Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702396D37E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 11:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EE110E846;
	Thu,  5 Sep 2024 09:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ky381ziQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C8710E839;
 Thu,  5 Sep 2024 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725529258;
 bh=mXMtl376RrIWU8CCwcatAIK+9QUJfuEuEkAF3+Q7Ll4=;
 h=From:To:Cc:Subject:Date:From;
 b=Ky381ziQ/khKagi1awfb5eAEqEHsXUABVrbjsWv5uDiOobDHBUYqXucQKJ11LH1c5
 506EKRbMTsGoPQXYNUY/E9NZ6bSkpcdyCij0sPpq9cNbf0Y/oh54kSCmt1LruYEvkR
 b0h1vWM/l5Bgzc69UaREEVmHnqVfcHy3rjrSVJ7jwSb8AnQLBhq8Sw80oB3c59MwGa
 3VWSnH6XRe91k+KvJT9qQAj6HxrMLug3fy0/exwkp8WjQA01VnMaO4fJ0ofhaGMJ2P
 jPJRpUfUAFx97kdE8unF75MHr4+pDEGf06eBbS1ClJvUHsGztmk+VF03KkWVPXVcv4
 CR3ifDtqoyffA==
Received: from localhost.localdomain (unknown [171.76.81.149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 17EF117E0FBB;
 Thu,  5 Sep 2024 11:40:54 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: uprev IGT and deqp-runner
Date: Thu,  5 Sep 2024 15:09:32 +0530
Message-ID: <20240905093935.2780632-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Uprev IGT to the latest version and deqp-runner
to v0.20.0. Also update expectation files.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
- Flaky test report will be sent to maintainers after this
  patch series is reviewed.

---
 drivers/gpu/drm/ci/gitlab-ci.yml              |  4 +-
 drivers/gpu/drm/ci/image-tags.yml             |  2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  2 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  7 +++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  2 +-
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  7 +++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  7 +++
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 10 +---
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt | 14 +++++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |  2 -
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  | 34 +++++++++--
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  9 ++-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 11 +---
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  6 --
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  1 -
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 --
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  5 --
 .../msm-sc7180-trogdor-kingoftown-fails.txt   | 27 ---------
 .../msm-sc7180-trogdor-kingoftown-skips.txt   | 60 +++++++++++++++++++
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 27 ---------
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  7 +--
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |  7 +++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 22 ++++---
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  | 28 +++++++++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  5 --
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  7 +++
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 21 -------
 29 files changed, 196 insertions(+), 145 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index eca47d4f816f..eba5aad4a012 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,10 +5,10 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
+  IGT_VERSION: a73311079a5d8ac99eb25336a8369a2c3c6b519b
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
-  DEQP_RUNNER_GIT_TAG: v0.15.0
+  DEQP_RUNNER_GIT_TAG: v0.20.0
 
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
   MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 2c340d063a96..4825a5cf813b 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2024-08-07-mesa-uprev"
+   CONTAINER_TAG: "2024-09-04-igt-deqp"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index 8e2fed6d76a3..f44dbce3151a 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -2,6 +2,7 @@ amdgpu/amd_abm@abm_enabled,Fail
 amdgpu/amd_abm@abm_gradual,Fail
 amdgpu/amd_abm@backlight_monotonic_abm,Fail
 amdgpu/amd_abm@backlight_monotonic_basic,Fail
+amdgpu/amd_abm@dpms_cycle,Fail
 amdgpu/amd_assr@assr-links,Fail
 amdgpu/amd_assr@assr-links-dpms,Fail
 amdgpu/amd_mall@static-screen,Crash
@@ -14,7 +15,6 @@ amdgpu/amd_plane@mpo-scale-p010,Fail
 amdgpu/amd_plane@mpo-scale-rgb,Crash
 amdgpu/amd_plane@mpo-swizzle-toggle,Fail
 amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
-dumb_buffer@invalid-bpp,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index e4faa96fa000..bcd4e320b1ea 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -18,3 +18,10 @@ kms_async_flips@crc
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 kms_plane@pixel-format-source-clamping
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_async_flips@async-flip-with-page-flip-events
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 9b84f68a5122..0907cb0f6d9e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-shared-fd,Fail
 core_setmaster@master-drop-set-user,Fail
 core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
@@ -6,7 +7,6 @@ i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
-kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
 kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout
 kms_fb_coherency@memset-crc,Crash
 kms_flip@busy-flip,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
index 581f0da4d0f2..e4a202630eba 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
@@ -46,3 +46,10 @@ i915_hangman@engine-engine-hang
 # IGT Version: 1.28-gf13702b8e
 # Linux Version: 6.10.0-rc5
 kms_pm_rpm@modeset-lpsp-stress
+
+# Board Name: asus-C433TA-AJ0005-rammus
+# Bug Report:
+# Failure Rate: 50
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_pm_rpm@drm-resources-equal
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index e612281149aa..64772fedaed5 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -8,7 +8,6 @@ kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
index 4663d4d13f35..91685b3401be 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
@@ -4,3 +4,10 @@
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 kms_fb_coherency@memset-crc
+
+# Board Name: asus-C523NA-A20057-coral
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_universal_plane@cursor-fb-leak
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 2723e2832797..f352b719cf7d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,5 +1,5 @@
+core_setmaster@master-drop-set-shared-fd,Fail
 core_setmaster@master-drop-set-user,Fail
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -9,10 +9,10 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
+i915_pm_rps@engine-order,Fail
+kms_big_fb@linear-16bpp-rotate-180,Timeout
 kms_fb_coherency@memset-crc,Crash
 kms_flip@busy-flip,Timeout
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -40,14 +40,11 @@ kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
 kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
 kms_pm_rpm@modeset-stress-extra-wait,Timeout
 kms_pm_rpm@universal-planes,Timeout
 kms_pm_rpm@universal-planes-dpms,Timeout
-kms_prop_blob@invalid-set-prop,Fail
 kms_psr2_sf@cursor-plane-update-sf,Fail
-kms_psr2_sf@fbc-plane-move-sf-dmg-area,Timeout
 kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
 kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
@@ -55,7 +52,6 @@ kms_psr2_sf@plane-move-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
 kms_psr2_su@page_flip-NV12,Fail
-kms_psr2_su@page_flip-P010,Fail
 kms_rotation_crc@primary-rotation-180,Timeout
 kms_setmode@basic,Fail
 kms_vblank@query-forked-hang,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index 58a6001abb28..9dac2b898f34 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -11,3 +11,17 @@ kms_plane_alpha_blend@constant-alpha-min
 # IGT Version: 1.28-gf13702b8e
 # Linux Version: 6.10.0-rc5
 kms_atomic_transition@plane-all-modeset-transition-internal-panels
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_plane_alpha_blend@constant-alpha-min
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report:
+# Failure Rate: 50
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_async_flips@crc
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 4821c9adefd1..6eb64c672f7d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -63,3 +63,4 @@ xe_module_load@load,Fail
 xe_module_load@many-reload,Fail
 xe_module_load@reload,Fail
 xe_module_load@reload-no-display,Fail
+core_setmaster@master-drop-set-shared-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index 1de04a3308c4..d4fba4f55ec1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -17,12 +17,10 @@ perf@i915-ref-count,Fail
 perf_pmu@busy-accuracy-50,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
-prime_busy@after,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
 sysfs_timeslice_duration@off,Timeout
-testdisplay,Timeout
 xe_module_load@force-load,Fail
 xe_module_load@load,Fail
 xe_module_load@many-reload,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index e728ccc62326..461ef69ef08a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,40 +1,64 @@
+api_intel_allocator@fork-simple-stress-signal,Timeout
+api_intel_allocator@open-vm,Timeout
 api_intel_allocator@simple-allocator,Timeout
+api_intel_bb@lot-of-buffers,Timeout
 api_intel_bb@object-reloc-keep-cache,Timeout
 api_intel_bb@offset-control,Timeout
-core_auth@getclient-simple,Timeout
-core_hotunplug@hotunbind-rebind,Timeout
+api_intel_bb@render-ccs,Timeout
+api_intel_bb@reset-bb,Timeout
+core_auth@basic-auth,Timeout
+core_hotunplug@hotrebind,Timeout
+core_setmaster@master-drop-set-user,Fail
 debugfs_test@read_all_entries_display_on,Timeout
-drm_read@invalid-buffer,Timeout
-drm_read@short-buffer-nonblock,Timeout
+drm_read@empty-block,Timeout
+dumb_buffer@create-clear,Timeout
+dumb_buffer@invalid-bpp,Timeout
 gen3_render_tiledx_blits,Timeout
 gen7_exec_parse@basic-allocation,Timeout
-gen7_exec_parse@batch-without-end,Timeout
 gen9_exec_parse@batch-invalid-length,Timeout
 gen9_exec_parse@bb-secure,Timeout
 gen9_exec_parse@secure-batches,Timeout
 gen9_exec_parse@shadow-peek,Timeout
 gen9_exec_parse@unaligned-jump,Timeout
+i915_getparams_basic@basic-subslice-total,Timeout
+i915_hangman@gt-engine-hang,Timeout
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
+i915_pciid,Timeout
+i915_pipe_stress@stress-xrgb8888-ytiled,Timeout
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rps@engine-order,Timeout
+i915_pm_rps@thresholds-idle-park,Timeout
 i915_query@engine-info,Timeout
 i915_query@query-topology-kernel-writes,Timeout
 i915_query@test-query-geometry-subslices,Timeout
 kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 perf@i915-ref-count,Fail
+perf_pmu@busy,Timeout
 perf_pmu@enable-race,Timeout
 perf_pmu@event-wait,Timeout
+perf_pmu@faulting-read,Timeout
 perf_pmu@gt-awake,Timeout
 perf_pmu@interrupts,Timeout
 perf_pmu@module-unload,Fail
+perf_pmu@most-busy-idle-check-all,Timeout
 perf_pmu@rc6,Crash
+perf_pmu@render-node-busy-idle,Fail
+perf_pmu@semaphore-wait-idle,Timeout
+prime_busy@after,Timeout
+prime_mmap@test_aperture_limit,Timeout
 prime_mmap@test_map_unmap,Timeout
 prime_mmap@test_refcounting,Timeout
 prime_self_import@basic-with_one_bo,Timeout
+sriov_basic@enable-vfs-autoprobe-off,Timeout
+syncobj_basic@bad-destroy,Timeout
 syncobj_basic@bad-flags-fd-to-handle,Timeout
+syncobj_basic@create-signaled,Timeout
 syncobj_eventfd@invalid-bad-pad,Timeout
+syncobj_eventfd@timeline-wait-before-signal,Timeout
 syncobj_wait@invalid-multi-wait-unsubmitted-signaled,Timeout
 syncobj_wait@invalid-signal-illegal-handle,Timeout
 syncobj_wait@invalid-single-wait-all-unsubmitted,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 2adae2175501..0ce240e3aa07 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -1,5 +1,5 @@
+core_setmaster@master-drop-set-shared-fd,Fail
 core_setmaster@master-drop-set-user,Fail
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -7,7 +7,8 @@ i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
+i915_pm_rps@engine-order,Fail
+kms_big_fb@linear-16bpp-rotate-180,Timeout
 kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout
 kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
@@ -32,19 +33,17 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu,Timeout
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt,Timeout
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
 kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
 kms_pm_rpm@modeset-stress-extra-wait,Timeout
 kms_pm_rpm@universal-planes,Timeout
 kms_pm_rpm@universal-planes-dpms,Timeout
-kms_prop_blob@invalid-set-prop,Fail
 kms_rotation_crc@primary-rotation-180,Timeout
 kms_vblank@query-forked-hang,Timeout
 perf@i915-ref-count,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index a14349a1967f..8e0efc80d510 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,8 +1,3 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
 fbdev@eof,Fail
 fbdev@read,Fail
 kms_3d,Fail
@@ -27,10 +22,6 @@ kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@flip-vs-suspend,Fail
-kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
-kms_properties@get_properties-sanity-atomic,Fail
-kms_properties@plane-properties-atomic,Fail
-kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 8cb2cb67853d..845f852bb4a0 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,10 +1,5 @@
 core_setmaster@master-drop-set-shared-fd,Fail
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
 dumb_buffer@create-clear,Crash
-dumb_buffer@invalid-bpp,Fail
 fbdev@eof,Fail
 fbdev@pan,Fail
 fbdev@read,Fail
@@ -18,5 +13,4 @@ kms_color@invalid-gamma-lut-sizes,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_lease@lease-uevent,Fail
-kms_properties@plane-properties-atomic,Fail
 kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 328967d3e23d..fc3745180683 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,4 +1,3 @@
-dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 4ac46168eff3..066d24ee3e08 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,8 +1,3 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_cursor_legacy@torture-bo,Fail
 kms_force_connector_basic@force-edid,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index bd0653caf7a0..2893f98a6b97 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,7 +1,2 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index d42004cd6977..6dbc2080347d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -1,8 +1,3 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -11,35 +6,13 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
-kms_content_protection@atomic,Crash
-kms_content_protection@atomic-dpms,Crash
-kms_content_protection@content-type-change,Crash
-kms_content_protection@lic-type-0,Crash
-kms_content_protection@lic-type-1,Crash
-kms_content_protection@srm,Crash
-kms_content_protection@type1,Crash
-kms_content_protection@uevent,Crash
-kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail
-kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail
-kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail
-kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_display_modes@extended-mode-basic,Fail
-kms_flip@2x-flip-vs-modeset-vs-hang,Fail
-kms_flip@2x-flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
-kms_multipipe_modeset@basic-max-pipe-crc-check,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane_lowres@tiling-none,Fail
 kms_rmfb@close-fd,Fail
-kms_vblank@ts-continuation-dpms-rpm,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index c2833eee1c4b..8f8d8da3068c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -23,3 +23,63 @@ kms_flip@2x-wf_vblank-ts-check
 
 # Hangs the machine
 kms_cursor_crc@cursor-random-max-size
+
+# Kernel panic
+kms_setmode@invalid-clone-single-crtc-stealing
+# [IGT] kms_setmode: executing
+# [IGT] kms_setmode: starting subtest invalid-clone-single-crtc-stealing
+# [IGT] kms_setmode: starting dynamic subtest pipe-A-eDP-1-DP-1
+# Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
+# Mem abort info:
+#   ESR = 0x0000000096000004
+#   EC = 0x25: DABT (current EL), IL = 32 bits
+#   SET = 0, FnV = 0
+#   EA = 0, S1PTW = 0
+#   FSC = 0x04: level 0 translation fault
+# Data abort info:
+#   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
+#   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
+#   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
+# user pgtable: 4k pages, 48-bit VAs, pgdp=000000024b2bb000
+# [0000000000000178] pgd=0000000000000000, p4d=0000000000000000
+# Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
+# Modules linked in:
+# CPU: 1 UID: 0 PID: 617 Comm: kms_setmode Not tainted 6.11.0-rc2-gee04e3109fb7 #1
+# Hardware name: Google Kingoftown (DT)
+# pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
+# pc : drm_mode_is_420_only+0x24/0x40
+# lr : drm_mode_is_420_only+0x20/0x40
+# sp : ffff80008730b830
+# x29: ffff80008730b830 x28: 0000000000000001 x27: ffff70b8c174b8b0
+# x26: ffffb111a6a5ec60 x25: ffffb111a70ed178 x24: 0000000000000028
+# x23: ffff70b8c4350480 x22: ffffb111a8e2c000 x21: ffff70b8c36eba80
+# x20: ffffb111a7ce0e30 x19: 0000000000000178 x18: 0000000000000003
+# x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
+# x14: 0000000000040000 x13: 0000000000000000 x12: 0000000000000000
+# x11: 0000000000000078 x10: 0000000000000000 x9 : ffffb111a8a23de8
+# x8 : ffff80008730b828 x7 : 0000000000000000 x6 : 0000000000244140
+# x5 : 00000000012e1fc0 x4 : 00000000000003e8 x3 : 0000000000000005
+# x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
+# Call trace:
+#  drm_mode_is_420_only+0x24/0x40
+#  dpu_encoder_get_drm_fmt+0x20/0x44
+#  dpu_encoder_phys_vid_enable+0x24/0x1f8
+#  dpu_encoder_virt_atomic_enable+0xd4/0x234
+#  drm_atomic_helper_commit_modeset_enables+0x188/0x26c
+#  msm_atomic_commit_tail+0x1d8/0x688
+#  commit_tail+0xa0/0x188
+#  drm_atomic_helper_commit+0x190/0x1a4
+#  drm_atomic_commit+0xb4/0xec
+#  drm_atomic_helper_set_config+0xdc/0x114
+#  drm_mode_setcrtc+0x420/0x808
+#  drm_ioctl_kernel+0xbc/0x12c
+#  drm_ioctl+0x230/0x4c0
+#  __arm64_sys_ioctl+0xac/0xf0
+#  invoke_syscall+0x48/0x110
+#  el0_svc_common.constprop.0+0x40/0xe0
+#  do_el0_svc+0x1c/0x28
+#  el0_svc+0x4c/0x120
+#  el0t_64_sync_handler+0x100/0x12c
+#  el0t_64_sync+0x190/0x194
+# Code: 91010273 aa0103e0 97ffad23 d3461c01 (f8617a61)
+# ---[ end trace 0000000000000000 ]---
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index d42004cd6977..6dbc2080347d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,8 +1,3 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -11,35 +6,13 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
-kms_content_protection@atomic,Crash
-kms_content_protection@atomic-dpms,Crash
-kms_content_protection@content-type-change,Crash
-kms_content_protection@lic-type-0,Crash
-kms_content_protection@lic-type-1,Crash
-kms_content_protection@srm,Crash
-kms_content_protection@type1,Crash
-kms_content_protection@uevent,Crash
-kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail
-kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail
-kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail
-kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_display_modes@extended-mode-basic,Fail
-kms_flip@2x-flip-vs-modeset-vs-hang,Fail
-kms_flip@2x-flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
-kms_multipipe_modeset@basic-max-pipe-crc-check,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane_lowres@tiling-none,Fail
 kms_rmfb@close-fd,Fail
-kms_vblank@ts-continuation-dpms-rpm,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index 770a1c685fde..f7539aef95f2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -1,8 +1,4 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
+drm_read@invalid-buffer,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -11,6 +7,7 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_content_protection@uevent,Crash
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
index 2aa96b1241c3..0052b2535bec 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
@@ -116,3 +116,10 @@ kms_cursor_legacy@flip-vs-cursor-toggle
 # IGT Version: 1.28-gf13702b8e
 # Linux Version: 6.10.0-rc5
 msm/msm_shrink@copy-mmap-oom-8
+
+# Board Name: sdm845-cheza-r3
+# Bug Report:
+# Failure Rate: 50
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_lease@page-flip-implicit-plane
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index ea7b2ceb95b9..90282dfa19f4 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -1,18 +1,24 @@
-core_setmaster@master-drop-set-root,Crash
 core_setmaster@master-drop-set-user,Crash
-core_setmaster_vs_auth,Crash
-device_reset@cold-reset-bound,Crash
-device_reset@reset-bound,Crash
-device_reset@unbind-cold-reset-rebind,Crash
-device_reset@unbind-reset-rebind,Crash
 dumb_buffer@create-clear,Crash
-dumb_buffer@invalid-bpp,Crash
 fbdev@pan,Crash
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_cursor_crc@cursor-onscreen-32x10,Crash
 kms_cursor_crc@cursor-onscreen-32x32,Crash
+kms_cursor_crc@cursor-onscreen-64x64,Crash
 kms_cursor_crc@cursor-random-32x10,Crash
+kms_cursor_crc@cursor-sliding-32x10,Crash
 kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_crc@cursor-sliding-64x21,Crash
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_invalid_mode@int-max-clock,Crash
+kms_lease@invalid-create-leases,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_plane@pixel-format,Crash
+kms_plane@pixel-format-source-clamping,Crash
 kms_prop_blob@invalid-set-prop,Crash
-kms_prop_blob@invalid-set-prop-any,Crash
+kms_properties@get_properties-sanity-atomic,Crash
+kms_properties@get_properties-sanity-non-atomic,Crash
+kms_rmfb@close-fd,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
index 7ede273aab20..7f731e4db250 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -4,3 +4,31 @@
 # IGT Version: 1.28-gf13702b8e
 # Linux Version: 6.10.0-rc5
 kms_cursor_legacy@flip-vs-cursor-atomic
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_cursor_crc@cursor-offscreen-32x10
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_cursor_edge_walk@64x64-left-edge
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_flip@plain-flip-ts-check
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report:
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_cursor_crc@cursor-alpha-opaque
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 9309ff15e23a..10c454e48b8d 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,9 +1,4 @@
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
 dumb_buffer@create-clear,Crash
-dumb_buffer@invalid-bpp,Fail
 kms_atomic_transition@modeset-transition,Fail
 kms_atomic_transition@modeset-transition-fencing,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index d98f6a17343c..85c18580372f 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -46,3 +46,10 @@ kms_setmode@basic
 # IGT Version: 1.28-gf13702b8e
 # Linux Version: 6.10.0-rc5
 kms_bw@connected-linear-tiling-1-displays-2560x1440p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report:
+# Failure Rate: 50
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.11.0-rc2
+kms_flip@wf_vblank-ts-check
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 5408110f4c60..71c02104a683 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -1,24 +1,3 @@
-core_hotunplug@hotrebind,Fail
-core_hotunplug@hotrebind-lateclose,Fail
-core_hotunplug@hotreplug,Fail
-core_hotunplug@hotreplug-lateclose,Fail
-core_hotunplug@hotunbind-rebind,Fail
-core_hotunplug@hotunplug-rescan,Fail
-core_hotunplug@unbind-rebind,Fail
-core_hotunplug@unplug-rescan,Fail
-device_reset@cold-reset-bound,Fail
-device_reset@reset-bound,Fail
-device_reset@unbind-cold-reset-rebind,Fail
-device_reset@unbind-reset-rebind,Fail
-dumb_buffer@invalid-bpp,Fail
-kms_content_protection@atomic,Crash
-kms_content_protection@atomic-dpms,Crash
-kms_content_protection@content-type-change,Crash
-kms_content_protection@lic-type-0,Crash
-kms_content_protection@lic-type-1,Crash
-kms_content_protection@srm,Crash
-kms_content_protection@type1,Crash
-kms_content_protection@uevent,Crash
 kms_cursor_crc@cursor-rapid-movement-128x128,Fail
 kms_cursor_crc@cursor-rapid-movement-128x42,Fail
 kms_cursor_crc@cursor-rapid-movement-256x256,Fail
-- 
2.43.0

