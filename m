Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E89872D4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FFC112E4C;
	Wed,  6 Mar 2024 03:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C+1Sum/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F247112E4C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709694521;
 bh=3BkW4+8RNznPg6meUhhBDbwnnX1CBhl5Rcgu7Am9+s0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+1Sum/bqROLqploRnozFIM75LgacpvQGO0AnWA/NVqgehCj2MKL2c539iZAzkBaY
 dNikF6i1kqmzTaaMpNlyysoy2tR46okcjfot+svf0khLi4r0plPkI5jqq0XfHtDN2s
 3V4TpKkZ2FFLCIdpLghISk8vvG0P10orwDrmeODOAew/6ogtiBVQi42ACACHQOum8F
 7fNRWkd2nNE/Bv87yk6LkUHlQbgjA7MeCln2CugWAEXPR4yr5/X79YZUPiJfZHIxkG
 2WoCRl9uIfbb3br77ESJ7whP2fGSScRiNq4t5ev+/rbSeUySQj1Grm6xeRB+dn50op
 dtnAL/12QWZJA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 79AC33780624;
 Wed,  6 Mar 2024 03:08:37 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/11] drm/ci: add tests on vkms
Date: Wed,  6 Mar 2024 08:36:49 +0530
Message-Id: <20240306030649.60269-12-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
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

Add job that runs igt on top of vkms.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

v4:
  - New patch in the series.
    https://lore.kernel.org/lkml/20240201065346.801038-1-vignesh.raman@collabora.com/

---
 MAINTAINERS                                   |  2 ++
 drivers/gpu/drm/ci/build.sh                   |  1 -
 drivers/gpu/drm/ci/gitlab-ci.yml              |  3 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
 drivers/gpu/drm/ci/image-tags.yml             |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 24 +++++++++++++-
 drivers/gpu/drm/ci/x86_64.config              |  1 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  1 -
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 33 +++++++++++++++++++
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    | 20 +++++++++++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 16 +++++++++
 11 files changed, 101 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 264b23108847..c38d2555cedc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6964,6 +6964,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/vkms.rst
+F:	drivers/gpu/drm/ci/testlist.txt
+F:	drivers/gpu/drm/ci/xfails/vkms*
 F:	drivers/gpu/drm/vkms/
 
 DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 106f2d40d222..4342872de45f 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -155,7 +155,6 @@ fi
 
 mkdir -p artifacts/install/lib
 mv install/* artifacts/install/.
-rm -rf artifacts/install/modules
 ln -s common artifacts/install/ci-common
 cp .config artifacts/${CI_JOB_NAME}_config
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9dae74465ce1..b98e56170561 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -110,6 +110,7 @@ stages:
   - panfrost
   - powervr
   - virtio-gpu
+  - software-driver
 
 # YAML anchors for rule conditions
 # --------------------------------
@@ -264,4 +265,4 @@ sanity:
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
\ No newline at end of file
+  needs: []
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 711f32772e48..81f66f1687a4 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,10 +20,10 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    amdgpu)
+    amdgpu|vkms)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
-        mv /install/modules/lib/modules/* /lib/modules/.
-        modprobe amdgpu
+        mv /install/modules/lib/modules/* /lib/modules/. || true
+        modprobe --first-time $DRIVER_NAME
         ;;
 esac
 
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index cf07c3e09b8c..bf861ab8b9c2 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-08-config"
+   DEBIAN_BUILD_TAG: "2024-01-29-vkms"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
    PKG_REPO_REV: "67f2c46b"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index ac8e974723a5..f517f8ee248e 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -407,7 +407,7 @@ panfrost:g12b:
     DRIVER_NAME: panfrost
 
 virtio_gpu:none:
-  stage: virtio-gpu
+  stage: software-driver
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
@@ -427,3 +427,25 @@ virtio_gpu:none:
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
+
+vkms:none:
+  stage: software-driver
+  variables:
+    DRIVER_NAME: vkms
+    GPU_VERSION: none
+  extends:
+    - .test-gl
+    - .test-rules
+  tags:
+    - kvm
+  script:
+    - ln -sf $CI_PROJECT_DIR/install /install
+    - mv install/bzImage /lava-files/bzImage
+    - mkdir -p /lib/modules
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
+    - ./install/crosvm-runner.sh ./install/igt_runner.sh
+  needs:
+    - debian/x86_64_test-gl
+    - testing:x86_64
+    - igt:x86_64
diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
index 1cbd49a5b23a..8eaba388b141 100644
--- a/drivers/gpu/drm/ci/x86_64.config
+++ b/drivers/gpu/drm/ci/x86_64.config
@@ -24,6 +24,7 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_PWM_CROS_EC=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_DRM_VKMS=m
 
 # Strip out some stuff we don't need for graphics testing, to reduce
 # the build.
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 007f21e56d89..f82d437909b5 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -41,7 +41,6 @@ kms_flip@flip-vs-absolute-wf_vblank,Fail
 kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-expired-vblank,Fail
-kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-wf_vblank-interruptible,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
new file mode 100644
index 000000000000..ef6101d2c356
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -0,0 +1,33 @@
+kms_cursor_crc@cursor-rapid-movement-128x128,Fail
+kms_cursor_crc@cursor-rapid-movement-128x42,Fail
+kms_cursor_crc@cursor-rapid-movement-256x256,Fail
+kms_cursor_crc@cursor-rapid-movement-256x85,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-512x170,Fail
+kms_cursor_crc@cursor-rapid-movement-512x512,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@suspend-read-crc,Fail
+kms_plane@plane-panning-bottom-right-suspend,Fail
+kms_universal_plane@universal-plane-pipe-A-sanity,Fail
+kms_universal_plane@universal-plane-sanity,Fail
+kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
+kms_writeback@writeback-check-output,Fail
+kms_writeback@writeback-fb-id,Fail
+kms_writeback@writeback-invalid-parameters,Fail
+kms_writeback@writeback-pixel-formats,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
new file mode 100644
index 000000000000..7b52dab45457
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
@@ -0,0 +1,20 @@
+# Board Name: vkms
+# Bug Report: https://lore.kernel.org/dri-devel/005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com/T/#u
+# IGT Version: 1.28-gb0cc8160e
+# Linux Version: 6.7.0-rc3
+# Failure Rate: 50
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursorA-vs-flipA-legacy
+kms_cursor_legacy@cursorA-vs-flipA-varying-size
+kms_flip@flip-vs-expired-vblank-interruptible
+kms_flip@flip-vs-expired-vblank
+kms_flip@plain-flip-fb-recreate
+kms_flip@plain-flip-fb-recreate-interruptible
+kms_flip@plain-flip-ts-check-interruptible
+
+# The below test shows inconsistency across multiple runs,
+# giving results of Pass and Fail alternately.
+kms_cursor_legacy@cursorA-vs-flipA-toggle
+kms_pipe_crc_basic@nonblocking-crc
+kms_flip@plain-flip-ts-check
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
new file mode 100644
index 000000000000..524e7972c75a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -0,0 +1,16 @@
+# Hits:
+# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
+# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
+kms_prop_blob@invalid-get-prop
+
+# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
+kms_invalid_mode@int-max-clock
+
+# Suspend seems to be broken
+.*suspend.*
+
+# Hangs machine and timeout occurs
+kms_flip@flip-vs-absolute-wf_vblank-interruptible
+kms_invalid_mode@zero-hdisplay
+kms_invalid_mode@bad-vtotal
+kms_cursor_crc.*
-- 
2.40.1

