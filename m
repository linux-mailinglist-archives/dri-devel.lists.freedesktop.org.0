Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE782EC4E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0410E465;
	Tue, 16 Jan 2024 09:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B90C10E465
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705398969;
 bh=ihrYlqcfJH2iTt+S6IZaRZeXbpV9xKed8vW0TK/5lH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DfavQs062G4Ep8YU6BJqBZXeJI3NrkgXDT5iAduCZFZmiX0D/0o8jar1EZfLpSQn2
 8vHSobAQNGXvocFQOGl5F5VMnSbxBTCa+o01o0fo4pByHXzw1XBr29j45VLWGajSGd
 NmGYXJLTQ5uQw7Wro/1+ll8OA6dxwTijwvtaRw35tf/eGFgezB7Xq8d0RRpT+8ovLg
 hHQNhbx4pDh1I7vI7ixSbJzFWInjWMm/DMqC2pwmn7REK0MaDs/UvOFEuGh8QNkm5r
 foDQwqEPgUK2aq980tWCarCeQGf8aPcuL/lcle9MuOjOw7KiMgV36zkDEu+TIO1Dk7
 lGKgZk5qqrftg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AE2B83782067;
 Tue, 16 Jan 2024 09:56:04 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/ci: rockchip: Add job to test panfrost GPU driver
Date: Tue, 16 Jan 2024 15:24:39 +0530
Message-Id: <20240116095439.107324-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116095439.107324-1-vignesh.raman@collabora.com>
References: <20240116095439.107324-1-vignesh.raman@collabora.com>
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
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 daniel@fooishbar.org, david.heidelberg@collabora.com,
 helen.koike@collabora.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For rockchip rk3288 and rk3399, the GPU driver is panfrost.
So add support in drm-ci to test panfrost driver for rockchip
SOC and update xfails.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for rockchip SOC with new xfails.

---
 drivers/gpu/drm/ci/test.yml                   | 14 ++++
 .../ci/xfails/panfrost-rk3288-gpu-fails.txt   | 54 +++++++++++++
 .../ci/xfails/panfrost-rk3288-gpu-skips.txt   | 52 +++++++++++++
 .../ci/xfails/panfrost-rk3399-gpu-fails.txt   | 75 +++++++++++++++++++
 .../ci/xfails/panfrost-rk3399-gpu-flakes.txt  |  7 ++
 .../ci/xfails/panfrost-rk3399-gpu-skips.txt   |  5 ++
 6 files changed, 207 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index c9ba58571882..4d44421ec510 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -175,6 +175,13 @@ msm:sdm845:
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288-gpu:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rk3288-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3288-display:
   extends:
     - .rk3288
@@ -182,6 +189,13 @@ rockchip:rk3288-display:
     GPU_VERSION: rk3288-display
     DRIVER_NAME: rockchip
 
+rockchip:rk3399-gpu:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rk3399-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3399-display:
   extends:
     - .rk3399
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
new file mode 100644
index 000000000000..90c63f519e9e
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
@@ -0,0 +1,54 @@
+kms_3d,Crash
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_flip@flip-vs-modeset-vs-hang,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_force_connector_basic@force-load-detect,Fail
+kms_invalid_mode@int-max-clock,Crash
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_plane@pixel-format,Crash
+kms_plane@pixel-format-source-clamping,Crash
+kms_plane@plane-position-hole,Crash
+kms_plane@plane-position-hole-dpms,Crash
+kms_plane_cursor@overlay,Crash
+kms_plane_cursor@pipe-A-overlay-size-128,Fail
+kms_plane_cursor@pipe-A-overlay-size-256,Fail
+kms_plane_cursor@pipe-A-overlay-size-64,Fail
+kms_plane_cursor@pipe-A-primary-size-128,Fail
+kms_plane_cursor@pipe-A-primary-size-256,Fail
+kms_plane_cursor@pipe-A-primary-size-64,Fail
+kms_plane_cursor@pipe-A-viewport-size-128,Fail
+kms_plane_cursor@pipe-A-viewport-size-256,Fail
+kms_plane_cursor@pipe-A-viewport-size-64,Fail
+kms_plane_cursor@pipe-B-overlay-size-128,Fail
+kms_plane_cursor@pipe-B-overlay-size-256,Fail
+kms_plane_cursor@pipe-B-overlay-size-64,Fail
+kms_plane_cursor@pipe-B-primary-size-128,Fail
+kms_plane_cursor@pipe-B-primary-size-256,Fail
+kms_plane_cursor@pipe-B-primary-size-64,Fail
+kms_plane_cursor@pipe-B-viewport-size-128,Fail
+kms_plane_cursor@pipe-B-viewport-size-256,Fail
+kms_plane_cursor@pipe-B-viewport-size-64,Fail
+kms_plane_cursor@primary,Crash
+kms_plane_cursor@viewport,Crash
+kms_plane_lowres@tiling-none,Fail
+kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
+kms_plane_scaling@upscale-with-modifier-20x20,Fail
+kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
+kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
+kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
+kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_prime@basic-crc,Fail
+kms_properties@connector-properties-atomic,Crash
+kms_properties@connector-properties-legacy,Crash
+kms_properties@get_properties-sanity-atomic,Crash
+kms_properties@get_properties-sanity-non-atomic,Crash
+kms_rmfb@close-fd,Crash
+kms_setmode@invalid-clone-single-crtc,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
new file mode 100644
index 000000000000..f20c3574b75a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
@@ -0,0 +1,52 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
+
+# Started hanging the machine on Linux 5.19-rc2:
+#
+# [IGT] kms_plane_lowres: executing
+# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
+# [IGT] kms_plane_lowres: exiting, ret=77
+# Console: switching to colour frame buffer device 170x48
+# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
+# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
+# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
+# 8<--- cut here ---
+# Unable to handle kernel paging request at virtual address 7812078e
+# [7812078e] *pgd=00000000
+# Internal error: Oops: 5 [#1] SMP ARM
+# Modules linked in:
+# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
+# Hardware name: Rockchip (Device Tree)
+# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
+#  spin_dump from do_raw_spin_lock+0xa4/0xe8
+#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
+#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
+#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
+#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
+#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
+#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
+#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
+#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
+#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
+#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
+#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
+#  drm_client_dev_restore from drm_release+0xf4/0x114
+#  drm_release from __fput+0x74/0x240
+#  __fput from task_work_run+0x84/0xb4
+#  task_work_run from do_exit+0x34c/0xa20
+#  do_exit from do_group_exit+0x34/0x98
+#  do_group_exit from __wake_up_parent+0x0/0x18
+# Code: e595c008 12843d19 03e00000 03093168 (15940508)
+# ---[ end trace 0000000000000000 ]---
+# note: kms_plane_lowre[482] exited with preempt_count 1
+# Fixing recursive fault but reboot is needed!
+kms_plane_lowres@pipe-F-tiling-y
+
+# Take too long, we have only two machines, and these are very flaky
+kms_cursor_crc.*
+
+# Machine is hanging in this test, so skip it
+kms_pipe_crc_basic@disable-crc-after-crtc
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
new file mode 100644
index 000000000000..d516d9c1d546
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
@@ -0,0 +1,75 @@
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
+kms_color@pipe-A-legacy-gamma,Fail
+kms_color@pipe-B-legacy-gamma,Fail
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@disable-crc-after-crtc,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_plane_cursor@overlay,Fail
+kms_plane_cursor@pipe-B-overlay-size-128,Fail
+kms_plane_cursor@pipe-B-overlay-size-256,Fail
+kms_plane_cursor@pipe-B-overlay-size-64,Fail
+kms_plane_cursor@pipe-B-primary-size-128,Fail
+kms_plane_cursor@pipe-B-primary-size-256,Fail
+kms_plane_cursor@pipe-B-primary-size-64,Fail
+kms_plane_cursor@pipe-B-viewport-size-128,Fail
+kms_plane_cursor@pipe-B-viewport-size-256,Fail
+kms_plane_cursor@pipe-B-viewport-size-64,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
+kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
+kms_plane_multiple@tiling-none,Fail
+kms_prime@basic-crc,Fail
+kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-pipe-B-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
new file mode 100644
index 000000000000..c9fdc623ab91
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
@@ -0,0 +1,7 @@
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_cursor_crc@cursor-offscreen-64x21
+kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@flip-vs-wf_vblank-interruptible
+kms_plane_cursor@overlay
+kms_plane_cursor@primary
+kms_plane_cursor@viewport
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
new file mode 100644
index 000000000000..10c3d81a919a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
@@ -0,0 +1,5 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
-- 
2.40.1

