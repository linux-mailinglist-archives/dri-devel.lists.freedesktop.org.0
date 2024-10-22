Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A689A9EF7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3FC10E648;
	Tue, 22 Oct 2024 09:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OItmUG7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE5010E647;
 Tue, 22 Oct 2024 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729590361;
 bh=zRu04J1zS0vKaLEgYmvdCC8mwi/AOPZWEzLfldNwN5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OItmUG7QFJANjEZAr12qqOphTEfwTF/rhvmGc1+qSpDXK0wPPGVHvhzHfkOpmHcNK
 sLSo0qpZZ1a9PsuWJycfRk8n+4bS9r3maea2qc2FPzgkW+1qP6QWHU4yLEDMouvhQ7
 3vzBmhqajc03qL2gitQgXQx9GZRYx2n3fWUEjmtfZmqoompdhTnnEkXEmRjRQLthw7
 w1BlaC6wNtHtXp/mzh97cLBVNdfjTVuchm3ykq4MEEZejwj28epbkpCYUr58fohh5Q
 AOMw63RST0Z/r5K4rvTBpaBdS/SD4QmE2If18QEgSYKtZHm/NoGBoDwpZAUHXTz3dA
 KoznVZrrXLcaw==
Received: from localhost.localdomain (unknown [171.76.81.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DF7317E14D5;
 Tue, 22 Oct 2024 11:45:58 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/ci: add sm8350-hdk
Date: Tue, 22 Oct 2024 15:15:05 +0530
Message-ID: <20241022094509.85510-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022094509.85510-1-vignesh.raman@collabora.com>
References: <20241022094509.85510-1-vignesh.raman@collabora.com>
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

Add job that executes the IGT test suite for sm8350-hdk.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
   - Add gitlab issue link for flake tests.

---
 drivers/gpu/drm/ci/arm64.config               |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/test.yml                   |  16 ++
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
 .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
 6 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 66e70ced796f..a8fca079921b 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -90,7 +90,12 @@ CONFIG_QCOM_GPI_DMA=y
 CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
-
+CONFIG_REGULATOR_QCOM_REFGEN=y
+CONFIG_TYPEC_MUX_FSA4480=y
+CONFIG_QCOM_PMIC_GLINK=y
+CONFIG_UCSI_PMIC_GLINK=y
+CONFIG_QRTR=y
+CONFIG_QRTR_SMD=y
 
 # db410c ethernet
 CONFIG_USB_RTL8152=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 5a3bdcffae32..139b81db6312 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -30,6 +30,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
 elif [[ "$KERNEL_ARCH" = "arm" ]]; then
     GCC_ARCH="arm-linux-gnueabihf"
     DEBIAN_ARCH="armhf"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d0bfe6aab58a..f0ef60c8f56d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -162,6 +162,22 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
+msm:sm8350-hdk:
+  extends:
+    - .lava-igt:arm64
+  stage: msm
+  parallel: 4
+  variables:
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: sm8350-hdk
+    DRIVER_NAME: msm
+    DTB: ${DEVICE_TYPE}
+    FARM: collabora
+    GPU_VERSION: ${DEVICE_TYPE}
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-sm8350-hdk
+
 .rockchip-device:
   variables:
     DTB: ${DEVICE_TYPE}
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
new file mode 100644
index 000000000000..4892c0c70a6d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
@@ -0,0 +1,15 @@
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_lease@lease-uevent,Fail
+kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@alpha-basic,Fail
+kms_plane_alpha_blend@alpha-opaque-fb,Fail
+kms_plane_alpha_blend@alpha-transparent-fb,Fail
+kms_plane_alpha_blend@constant-alpha-max,Fail
+msm/msm_recovery@gpu-fault-parallel,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
new file mode 100644
index 000000000000..c1859d9b165f
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: sm8350-hdk
+# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.12.0-rc1
+msm/msm_recovery@gpu-fault
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
new file mode 100644
index 000000000000..329770c520d9
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
@@ -0,0 +1,211 @@
+# Skip driver specific tests
+^amdgpu.*
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
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
+
+# Kernel panic
+msm/msm_mapping@ring
+# DEBUG - Begin test msm/msm_mapping@ring
+# [  200.874157] [IGT] msm_mapping: executing
+# [  200.880236] [IGT] msm_mapping: starting subtest ring
+# [  200.895243] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=PERMISSION source=CP (0,0,0,1)
+# [  200.906885] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.917625] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.928353] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.939084] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.949815] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.950227] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 25 timed out waiting for response
+# [  200.960467] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.960500] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  200.995966] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  201.006702] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  204.213387] platform 3d6a000.gmu: GMU watchdog expired
+# [  205.909103] adreno_fault_handler: 224274 callbacks suppressed
+# [  205.909108] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.925794] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.936529] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.947263] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.957997] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.968731] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.979465] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  205.990199] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  206.000932] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  206.011666] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.925090] adreno_fault_handler: 224511 callbacks suppressed
+# [  210.925096] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.941781] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.952517] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.963250] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.973985] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.984719] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  210.995452] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  211.006186] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  211.016921] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  211.027655] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.937100] adreno_fault_handler: 223760 callbacks suppressed
+# [  215.937106] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.953824] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.964573] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.975321] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.986067] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  215.996815] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  216.007563] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  216.018310] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  216.029057] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  216.039805] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  220.945182] adreno_fault_handler: 222822 callbacks suppressed
+# [  220.945188] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  220.961897] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  220.972645] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  220.983392] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  220.994140] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  221.004889] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  221.015636] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  221.026383] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  221.037130] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  221.047879] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  225.953179] adreno_fault_handler: 223373 callbacks suppressed
+# [  225.953184] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  225.969883] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  225.980617] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  225.991350] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.002084] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.012818] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.023551] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.034285] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.045019] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  226.055753] *** gpu fault: ttbr0=00000001160d6000 iova=0001000000001000 dir=WRITE type=UNKNOWN source=CP (0,0,0,1)
+# [  228.001087] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
+# [  228.007412] rcu: 	0-....: (524 ticks this GP) idle=4ffc/1/0x4000000000000000 softirq=9367/9368 fqs=29
+# [  228.017097] rcu: 	(detected by 1, t=6504 jiffies, g=29837, q=6 ncpus=8)
+# [  228.023959] Sending NMI from CPU 1 to CPUs 0:
+# [  228.161164] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [gpu-worker:150]
+# [  228.173169] Modules linked in:
+# [  228.176361] irq event stamp: 2809595
+# [  228.180083] hardirqs last  enabled at (2809594): [<ffffd3bc52cb91ac>] exit_to_kernel_mode+0x38/0x130
+# [  228.189547] hardirqs last disabled at (2809595): [<ffffd3bc52cb92c8>] el1_interrupt+0x24/0x64
+# [  228.198377] softirqs last  enabled at (1669060): [<ffffd3bc51936f98>] handle_softirqs+0x4a4/0x4bc
+# [  228.207565] softirqs last disabled at (1669063): [<ffffd3bc518905a4>] __do_softirq+0x14/0x20
+# [  228.216316] CPU: 0 UID: 0 PID: 150 Comm: gpu-worker Not tainted 6.12.0-rc1-g685d530dc83a #1
+# [  228.224966] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
+# [  228.231730] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
+# [  228.238948] pc : tcp_fastretrans_alert+0x0/0x884
+# [  228.243751] lr : tcp_ack+0x9d4/0x1238
+# [  228.247562] sp : ffff8000800036d0
+# [  228.251011] x29: ffff8000800036d0 x28: 000000000000000c x27: 0000000000000001
+# [  228.258421] x26: ffff704683cd8000 x25: 0000000000000403 x24: ffff70468b7e7c00
+# [  228.265829] x23: 0000000000000000 x22: 0000000000000004 x21: 000000000000140f
+# [  228.273237] x20: 00000000f1de79f7 x19: 00000000f1de7a5f x18: 0000000000000001
+# [  228.280644] x17: 00000000302d6762 x16: 632d6b64682d3035 x15: ffff704683c39000
+# [  228.288051] x14: 00000000000e2000 x13: ffff704683df6000 x12: 0000000000000000
+# [  228.295458] x11: 00000000000000a0 x10: 0000000000000000 x9 : ffffd3bc551a9a20
+# [  228.302865] x8 : ffff800080003640 x7 : 0000000000040faa x6 : 00000000ffff9634
+# [  228.310271] x5 : 00000000000005a8 x4 : ffff800080003788 x3 : ffff80008000377c
+# [  228.317679] x2 : 0000000000000000 x1 : 00000000f1de79f7 x0 : ffff704683cd8000
+# [  228.325087] Call trace:
+# [  228.327640]  tcp_fastretrans_alert+0x0/0x884
+# [  228.332082]  tcp_rcv_established+0x7c4/0x8bc
+# [  228.336523]  tcp_v4_do_rcv+0x244/0x31c
+# [  228.340429]  tcp_v4_rcv+0xcc4/0x1084
+# [  228.344155]  ip_protocol_deliver_rcu+0x64/0x218
+# [  228.348862]  ip_local_deliver_finish+0xb8/0x1ac
+# [  228.353566]  ip_local_deliver+0x84/0x254
+# [  228.357651]  ip_sublist_rcv_finish+0x84/0xb8
+# [  228.362092]  ip_sublist_rcv+0x11c/0x2f0
+# [  228.366081]  ip_list_rcv+0xfc/0x190
+# [  228.369711]  __netif_receive_skb_list_core+0x174/0x208
+# [  228.375050]  netif_receive_skb_list_internal+0x204/0x3ac
+# [  228.380564]  napi_complete_done+0x64/0x1d0
+# [  228.384826]  lan78xx_poll+0x71c/0x9cc
+# [  228.388638]  __napi_poll.constprop.0+0x3c/0x254
+# [  228.393341]  net_rx_action+0x164/0x2d4
+# [  228.397244]  handle_softirqs+0x128/0x4bc
+# [  228.401329]  __do_softirq+0x14/0x20
+# [  228.404958]  ____do_softirq+0x10/0x1c
+# [  228.408769]  call_on_irq_stack+0x24/0x4c
+# [  228.412854]  do_softirq_own_stack+0x1c/0x28
+# [  228.417199]  __irq_exit_rcu+0x124/0x164
+# [  228.421188]  irq_exit_rcu+0x10/0x38
+# [  228.424819]  el1_interrupt+0x38/0x64
+# [  228.428546]  el1h_64_irq_handler+0x18/0x24
+# [  228.432807]  el1h_64_irq+0x64/0x68
+# [  228.436354]  lock_acquire+0x214/0x32c
+# [  228.440166]  __mutex_lock+0x98/0x3d0
+# [  228.443893]  mutex_lock_nested+0x24/0x30
+# [  228.447978]  fault_worker+0x58/0x184
+# [  228.451704]  kthread_worker_fn+0xf4/0x320
+# [  228.455873]  kthread+0x114/0x118
+# [  228.459243]  ret_from_fork+0x10/0x20
+# [  228.462970] Kernel panic - not syncing: softlockup: hung tasks
+# [  228.469018] CPU: 0 UID: 0 PID: 150 Comm: gpu-worker Tainted: G             L     6.12.0-rc1-g685d530dc83a #1
+# [  228.479190] Tainted: [L]=SOFTLOCKUP
+# [  228.482815] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
+# [  228.489574] Call trace:
+# [  228.492125]  dump_backtrace+0x98/0xf0
+# [  228.495931]  show_stack+0x18/0x24
+# [  228.499380]  dump_stack_lvl+0x38/0xd0
+# [  228.503189]  dump_stack+0x18/0x24
+# [  228.506639]  panic+0x3bc/0x41c
+# [  228.509826]  watchdog_timer_fn+0x254/0x2e4
+# [  228.514087]  __hrtimer_run_queues+0x3b0/0x40c
+# [  228.518612]  hrtimer_interrupt+0xe8/0x248
+# [  228.522777]  arch_timer_handler_virt+0x2c/0x44
+# [  228.527399]  handle_percpu_devid_irq+0xa8/0x2c4
+# [  228.532103]  generic_handle_domain_irq+0x2c/0x44
+# [  228.536902]  gic_handle_irq+0x4c/0x11c
+# [  228.540802]  do_interrupt_handler+0x50/0x84
+# [  228.545146]  el1_interrupt+0x34/0x64
+# [  228.548870]  el1h_64_irq_handler+0x18/0x24
+# [  228.553128]  el1h_64_irq+0x64/0x68
+# [  228.556672]  tcp_fastretrans_alert+0x0/0x884
+# [  228.561110]  tcp_rcv_established+0x7c4/0x8bc
+# [  228.565548]  tcp_v4_do_rcv+0x244/0x31c
+# [  228.569449]  tcp_v4_rcv+0xcc4/0x1084
+# [  228.573171]  ip_protocol_deliver_rcu+0x64/0x218
+# [  228.577873]  ip_local_deliver_finish+0xb8/0x1ac
+# [  228.582574]  ip_local_deliver+0x84/0x254
+# [  228.586655]  ip_sublist_rcv_finish+0x84/0xb8
+# [  228.591092]  ip_sublist_rcv+0x11c/0x2f0
+# [  228.595079]  ip_list_rcv+0xfc/0x190
+# [  228.598706]  __netif_receive_skb_list_core+0x174/0x208
+# [  228.604039]  netif_receive_skb_list_internal+0x204/0x3ac
+# [  228.609549]  napi_complete_done+0x64/0x1d0
+# [  228.613808]  lan78xx_poll+0x71c/0x9cc
+# [  228.617614]  __napi_poll.constprop.0+0x3c/0x254
+# [  228.622314]  net_rx_action+0x164/0x2d4
+# [  228.626214]  handle_softirqs+0x128/0x4bc
+# [  228.630297]  __do_softirq+0x14/0x20
+# [  228.633923]  ____do_softirq+0x10/0x1c
+# [  228.637729]  call_on_irq_stack+0x24/0x4c
+# [  228.641811]  do_softirq_own_stack+0x1c/0x28
+# [  228.646152]  __irq_exit_rcu+0x124/0x164
+# [  228.650139]  irq_exit_rcu+0x10/0x38
+# [  228.653768]  el1_interrupt+0x38/0x64
+# [  228.657491]  el1h_64_irq_handler+0x18/0x24
+# [  228.661750]  el1h_64_irq+0x64/0x68
+# [  228.665293]  lock_acquire+0x214/0x32c
+# [  228.669098]  __mutex_lock+0x98/0x3d0
+# [  228.672821]  mutex_lock_nested+0x24/0x30
+# [  228.676903]  fault_worker+0x58/0x184
+# [  228.680626]  kthread_worker_fn+0xf4/0x320
+# [  228.684790]  kthread+0x114/0x118
+# [  228.688156]  ret_from_fork+0x10/0x20
+# [  228.691882] SMP: stopping secondary CPUs
+# [  229.736843] SMP: failed to stop secondary CPUs 1,4
+# [  229.741827] Kernel Offset: 0x53bbd1880000 from 0xffff800080000000
+# [  229.748159] PHYS_OFFSET: 0xfff08fba80000000
+# [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
+# [  229.758095] Memory Limit: none
+# [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
-- 
2.43.0

