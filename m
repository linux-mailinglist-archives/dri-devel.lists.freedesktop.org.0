Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95682EC50
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3D10E45C;
	Tue, 16 Jan 2024 09:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313E610E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705398944;
 bh=Tn+C3n03tNhekIf30piUSEYf+ajiHEYTFZ4foDIQlaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WxalD3kgWx42Sccc2+7/LZt2Rz9iBn+AWmE4isthaTm2vMtAcgyoCt0USfvllXCzA
 fxQ0Z6T0O/fJDEhYg98iS42f7RSHMqwi5NlTXdczQGaIx0mg2oZJ/FZNBY/IgLKU0X
 oZaFBQRpyw20mx1oO8HEP3S5cH48NNSekxF0cpzjsjGUq36RiTkNMPSm1iJvNk2ydK
 JcA4MrkYVLmloru+zzpAN/6c89wxbMdDb+0tM4MukeXEPV29mY0lYfBZd2DunDtuka
 ZTFr+OADY7kRCHOGUJX+h1dy4VVFRvMshNl5pmukn/J71X1l1rBwgdpHqcEZO7XyeA
 P8n3hinMwCp6Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1F05A3782068;
 Tue, 16 Jan 2024 09:55:38 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/ci: mediatek: Rename exisitng job
Date: Tue, 16 Jan 2024 15:24:34 +0530
Message-Id: <20240116095439.107324-3-vignesh.raman@collabora.com>
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

For mediatek mt8173 and mt8183, the display driver is mediatek.
Currently, in drm-ci for mediatek, only the display driver is
tested. So rename the mediatek job to indicate that display
driver is tested.

Rename the name of xfail files for mediatek (mt8173 and mt8183),
to include information about the tested driver and update xfails
accordingly. Since the correct driver name is passed from the job to
test gpu and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
    script since it's now set by the job.

---
 drivers/gpu/drm/ci/igt_runner.sh              | 10 ---------
 drivers/gpu/drm/ci/test.yml                   | 21 ++++++++++++++-----
 ....txt => mediatek-mt8173-display-fails.txt} |  0
 .../xfails/mediatek-mt8173-display-flakes.txt | 13 ++++++++++++
 .../xfails/mediatek-mt8183-display-fails.txt  |  7 +++++++
 .../xfails/mediatek-mt8183-display-flakes.txt |  8 +++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 13 ------------
 7 files changed, 44 insertions(+), 28 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (100%)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..ce6e22369d4d 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
-        export IGT_FORCE_DRIVER="panfrost"
-        ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 355b794ef2b1..e3aaec06a65d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -279,29 +279,40 @@ amdgpu:stoney:
     - .lava-igt:arm64
   stage: mediatek
   variables:
-    DRIVER_NAME: mediatek
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
 
-mediatek:mt8173:
+.mt8173:
   extends:
     - .mediatek
   parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
-    GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
 
-mediatek:mt8183:
+.mt8183:
   extends:
     - .mediatek
   parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
-    GPU_VERSION: mt8183
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173-display:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mt8173-display
+    DRIVER_NAME: mediatek
+
+mediatek:mt8183-display:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mt8183-display
+    DRIVER_NAME: mediatek
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
rename to drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
new file mode 100644
index 000000000000..64b30c092c85
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: mt8173-elm-hana.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Below test shows inconsistency across multiple runs,
+# giving results of Pass and Timeout/Fail alternately
+kms_prop_blob@invalid-set-prop
+kms_prop_blob@invalid-set-prop-any
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
new file mode 100644
index 000000000000..bfa2f92c907a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
@@ -0,0 +1,7 @@
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_prop_blob@invalid-set-prop,Fail
+kms_prop_blob@invalid-set-prop-any,Fail
+kms_properties@get_properties-sanity-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
new file mode 100644
index 000000000000..5885a950fa72
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 100
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
deleted file mode 100644
index 67d690fc4037..000000000000
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ /dev/null
@@ -1,13 +0,0 @@
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
-- 
2.40.1

