Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D7B0A134
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AF010E962;
	Fri, 18 Jul 2025 10:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qTl+/PNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D7310E96F;
 Fri, 18 Jul 2025 10:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752836086;
 bh=zAFyDkIf9qCUhBZe8gnx6U8C2dwmN1Ikbn0/wkc7YvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qTl+/PNwgT4pQnJiv0dRTS0wCfOw5K0VqkHPHmswV3uS26vgK96Bl2lt7jN4pdurW
 +lLQcQ4vUxqBodZrP5pFnHjF60LbRTLo0qHUH1yzwa7wdalGQXMUig7sS559dhO7fY
 /UakIWIXeP0TxDWU7o0/AFU6cJ6nYFq6lF1NoxGRMfZTQXXSc4YvwqEz/9Mnz9lfx+
 a39eRszxJAvOcbWHUeNeHgoMzErBxD/mGCBRtPwEW5VOtkusmUEqKk5oMHiCIkPAPY
 I7PFLsY82pI+QjSoMMUeCv1nbc8WiFZZU7/G5ej+ZLnrxnLm3hemaFMS5rmj/UQ+pk
 2EKYvXymLrxcQ==
Received: from debian.. (unknown [171.76.80.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3538517E1560;
 Fri, 18 Jul 2025 12:54:43 +0200 (CEST)
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
Subject: [PATCH v1 7/7] drm/ci: add mt8192
Date: Fri, 18 Jul 2025 16:23:59 +0530
Message-ID: <20250718105407.32878-8-vignesh.raman@collabora.com>
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

Add job that executes the IGT test suite for mt8192-asurada-spherion-r0.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  4 +++
 drivers/gpu/drm/ci/test.yml                   | 13 +++++--
 .../drm/ci/xfails/mediatek-mt8192-fails.txt   | 34 +++++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8192-skips.txt   | 14 ++++++++
 .../drm/ci/xfails/panfrost-mt8192-fails.txt   |  9 +++++
 .../drm/ci/xfails/panfrost-mt8192-skips.txt   | 20 +++++++++++
 6 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 7cd6d9d612fc..bae0175df556 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -213,3 +213,7 @@ CONFIG_PWM_TEGRA=y
 CONFIG_DRM_PANTHOR=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
 CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
+
+# For Mediatek mt8192
+CONFIG_SPMI_MTK_PMIF=y
+CONFIG_REGULATOR_MT6315=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index dbd582442776..3d871c4bb5b9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -451,8 +451,7 @@ panfrost:mt8183:
     - .mt8183
     - .panfrost-gpu
 
-# drm-mtk doesn't even probe yet in mainline for mt8192
-.mediatek:mt8192:
+.mt8192:
   extends:
     - .mediatek-device
   parallel: 3
@@ -461,6 +460,16 @@ panfrost:mt8183:
     GPU_VERSION: mt8192
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
 
+mediatek:mt8192:
+  extends:
+    - .mt8192
+    - .mediatek-display
+
+panfrost:mt8192:
+  extends:
+    - .mt8192
+    - .panfrost-gpu
+
 .meson-device:
   extends:
     - .lava-igt:arm64
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
new file mode 100644
index 000000000000..4b4f1b594c23
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-fails.txt
@@ -0,0 +1,34 @@
+core_setmaster@master-drop-set-user,Fail
+dumb_buffer@create-clear,Crash
+kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_flip@basic-plain-flip,Fail
+kms_flip@dpms-off-confusion,Fail
+kms_flip@dpms-off-confusion-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
+kms_flip@flip-vs-expired-vblank,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
+kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
new file mode 100644
index 000000000000..a165fccd8a93
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8192-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^panfrost.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+kms_dp_link_training.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
new file mode 100644
index 000000000000..6589d194323f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-fails.txt
@@ -0,0 +1,9 @@
+core_hotunplug@hotreplug,Fail
+core_hotunplug@hotreplug-lateclose,Fail
+core_hotunplug@hotunplug-rescan,Fail
+core_hotunplug@unplug-rescan,Fail
+core_setmaster@master-drop-set-user,Fail
+panfrost/panfrost_prime@gem-prime-import,Fail
+panfrost/panfrost_submit@pan-reset,Fail
+panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
+panfrost/panfrost_submit@pan-unhandled-pagefault,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt
new file mode 100644
index 000000000000..b724cf04e3b3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8192-skips.txt
@@ -0,0 +1,20 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+kms_dp_link_training.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
-- 
2.47.2

