Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E078A93A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 11:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618B10E26D;
	Mon, 28 Aug 2023 09:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43E10E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693216085; x=1724752085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pTMiGJjjV/H4Ggbz2r84h6k6qaLC9ebh9k5a5qubPlg=;
 b=bqOc6uniuwIeedL+i7xp8LrH+dafwhmeX1qOJA8Yr9AaBhQJa2UuSS0R
 JqGU1cyUA8O1a6bjl8jMFCQKB+o9cWzICnk4jBNFuMwYcYS0SeqA1toBV
 nc+9fGEzbag7tE6DF2S3bcWCBTLs8eYCLttSucA8SC/GWzvK2ZBp4YIZw
 Vd9zOmiRImDnh31J2DzCwn4fdWg/Hxk9CYmJCDCedwqsBDR4SN7TW1msT
 kaXh+sFX/4aqIS0hwK/vkMRfhmEUeEnpD151N7btyNv6qT5kV/lvBzSR3
 1L7VPR0E+jbjCyBaF8qSD+l+HqMGzWghxjk5laeAqoXSictQKDxGFDbjW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="377791739"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="377791739"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068972105"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="1068972105"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 02:48:01 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] accel/ivpu/37xx: Change register rename leftovers
Date: Mon, 28 Aug 2023 11:47:34 +0200
Message-Id: <20230828094736.4137092-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change remaining MTL_VPU_ register names to generation based names.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c     | 68 ++++++++++++-------------
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h | 72 +++++++++++++--------------
 2 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index bf3432b68879..edd4d860f135 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -352,10 +352,10 @@ static int ivpu_boot_noc_qdeny_check(struct ivpu_device *vdev, u32 exp_val)
 
 static int ivpu_boot_top_noc_qrenqn_check(struct ivpu_device *vdev, u32 exp_val)
 {
-	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QREQN);
+	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QREQN);
 
-	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, exp_val, val) ||
-	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, exp_val, val))
+	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, exp_val, val))
 		return -EIO;
 
 	return 0;
@@ -363,10 +363,10 @@ static int ivpu_boot_top_noc_qrenqn_check(struct ivpu_device *vdev, u32 exp_val)
 
 static int ivpu_boot_top_noc_qacceptn_check(struct ivpu_device *vdev, u32 exp_val)
 {
-	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QACCEPTN);
+	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN);
 
-	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
-	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
+	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
 		return -EIO;
 
 	return 0;
@@ -374,10 +374,10 @@ static int ivpu_boot_top_noc_qacceptn_check(struct ivpu_device *vdev, u32 exp_va
 
 static int ivpu_boot_top_noc_qdeny_check(struct ivpu_device *vdev, u32 exp_val)
 {
-	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QDENY);
+	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY);
 
-	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
-	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
+	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
 		return -EIO;
 
 	return 0;
@@ -430,15 +430,15 @@ static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable
 	int ret;
 	u32 val;
 
-	val = REGV_RD32(MTL_VPU_TOP_NOC_QREQN);
+	val = REGV_RD32(VPU_37XX_TOP_NOC_QREQN);
 	if (enable) {
-		val = REG_SET_FLD(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, val);
-		val = REG_SET_FLD(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
+		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
+		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
 	} else {
-		val = REG_CLR_FLD(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, val);
-		val = REG_CLR_FLD(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
+		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
+		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
 	}
-	REGV_WR32(MTL_VPU_TOP_NOC_QREQN, val);
+	REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val);
 
 	ret = ivpu_boot_top_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
 	if (ret) {
@@ -570,17 +570,17 @@ static void ivpu_boot_soc_cpu_boot(struct ivpu_device *vdev)
 {
 	u32 val;
 
-	val = REGV_RD32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC);
-	val = REG_SET_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTRUN0, val);
+	val = REGV_RD32(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC);
+	val = REG_SET_FLD(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTRUN0, val);
 
-	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTVEC, val);
-	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+	val = REG_CLR_FLD(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTVEC, val);
+	REGV_WR32(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
 
-	val = REG_SET_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
-	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+	val = REG_SET_FLD(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
+	REGV_WR32(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
 
-	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
-	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+	val = REG_CLR_FLD(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
+	REGV_WR32(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
 
 	val = vdev->fw->entry_point >> 9;
 	REGV_WR32(VPU_37XX_HOST_SS_LOADING_ADDRESS_LO, val);
@@ -784,17 +784,17 @@ static void ivpu_hw_37xx_wdt_disable(struct ivpu_device *vdev)
 	u32 val;
 
 	/* Enable writing and set non-zero WDT value */
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_WATCHDOG, TIM_WATCHDOG_RESET_VALUE);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_WATCHDOG, TIM_WATCHDOG_RESET_VALUE);
 
 	/* Enable writing and disable watchdog timer */
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_WDOG_EN, 0);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_WDOG_EN, 0);
 
 	/* Now clear the timeout interrupt */
-	val = REGV_RD32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG);
-	val = REG_CLR_FLD(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, WDOG_TO_INT_CLR, val);
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, val);
+	val = REGV_RD32(VPU_37XX_CPU_SS_TIM_GEN_CONFIG);
+	val = REG_CLR_FLD(VPU_37XX_CPU_SS_TIM_GEN_CONFIG, WDOG_TO_INT_CLR, val);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_GEN_CONFIG, val);
 }
 
 static u32 ivpu_hw_37xx_pll_to_freq(u32 ratio, u32 config)
@@ -841,10 +841,10 @@ static u32 ivpu_hw_37xx_reg_telemetry_enable_get(struct ivpu_device *vdev)
 
 static void ivpu_hw_37xx_reg_db_set(struct ivpu_device *vdev, u32 db_id)
 {
-	u32 reg_stride = MTL_VPU_CPU_SS_DOORBELL_1 - MTL_VPU_CPU_SS_DOORBELL_0;
-	u32 val = REG_FLD(MTL_VPU_CPU_SS_DOORBELL_0, SET);
+	u32 reg_stride = VPU_37XX_CPU_SS_DOORBELL_1 - VPU_37XX_CPU_SS_DOORBELL_0;
+	u32 val = REG_FLD(VPU_37XX_CPU_SS_DOORBELL_0, SET);
 
-	REGV_WR32I(MTL_VPU_CPU_SS_DOORBELL_0, reg_stride, db_id, val);
+	REGV_WR32I(VPU_37XX_CPU_SS_DOORBELL_0, reg_stride, db_id, val);
 }
 
 static u32 ivpu_hw_37xx_reg_ipc_rx_addr_get(struct ivpu_device *vdev)
@@ -861,7 +861,7 @@ static u32 ivpu_hw_37xx_reg_ipc_rx_count_get(struct ivpu_device *vdev)
 
 static void ivpu_hw_37xx_reg_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr)
 {
-	REGV_WR32(MTL_VPU_CPU_SS_TIM_IPC_FIFO, vpu_addr);
+	REGV_WR32(VPU_37XX_CPU_SS_TIM_IPC_FIFO, vpu_addr);
 }
 
 static void ivpu_hw_37xx_irq_clear(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
index 6e4e915948f9..0f106f192f7c 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2020-2023 Intel Corporation
  */
 
-#ifndef __IVPU_HW_MTL_REG_H__
-#define __IVPU_HW_MTL_REG_H__
+#ifndef __IVPU_HW_37XX_REG_H__
+#define __IVPU_HW_37XX_REG_H__
 
 #include <linux/bits.h>
 
@@ -113,17 +113,17 @@
 #define VPU_37XX_HOST_SS_NOC_QDENY					0x0000015cu
 #define VPU_37XX_HOST_SS_NOC_QDENY_TOP_SOCMMIO_MASK			BIT_MASK(0)
 
-#define MTL_VPU_TOP_NOC_QREQN						0x00000160u
-#define MTL_VPU_TOP_NOC_QREQN_CPU_CTRL_MASK				BIT_MASK(0)
-#define MTL_VPU_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
+#define VPU_37XX_TOP_NOC_QREQN						0x00000160u
+#define VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK				BIT_MASK(0)
+#define VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
 
-#define MTL_VPU_TOP_NOC_QACCEPTN					0x00000164u
-#define MTL_VPU_TOP_NOC_QACCEPTN_CPU_CTRL_MASK				BIT_MASK(0)
-#define MTL_VPU_TOP_NOC_QACCEPTN_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
+#define VPU_37XX_TOP_NOC_QACCEPTN					0x00000164u
+#define VPU_37XX_TOP_NOC_QACCEPTN_CPU_CTRL_MASK				BIT_MASK(0)
+#define VPU_37XX_TOP_NOC_QACCEPTN_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
 
-#define MTL_VPU_TOP_NOC_QDENY						0x00000168u
-#define MTL_VPU_TOP_NOC_QDENY_CPU_CTRL_MASK				BIT_MASK(0)
-#define MTL_VPU_TOP_NOC_QDENY_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
+#define VPU_37XX_TOP_NOC_QDENY						0x00000168u
+#define VPU_37XX_TOP_NOC_QDENY_CPU_CTRL_MASK				BIT_MASK(0)
+#define VPU_37XX_TOP_NOC_QDENY_HOSTIF_L2CACHE_MASK			BIT_MASK(1)
 
 #define VPU_37XX_HOST_SS_FW_SOC_IRQ_EN					0x00000170u
 #define VPU_37XX_HOST_SS_FW_SOC_IRQ_EN_CSS_ROM_CMX_MASK			BIT_MASK(0)
@@ -246,36 +246,36 @@
 #define VPU_37XX_HOST_IF_TBU_MMUSSIDV_TBU4_AWMMUSSIDV_MASK		BIT_MASK(8)
 #define VPU_37XX_HOST_IF_TBU_MMUSSIDV_TBU4_ARMMUSSIDV_MASK		BIT_MASK(9)
 
-#define MTL_VPU_CPU_SS_DSU_LEON_RT_BASE					0x04000000u
-#define MTL_VPU_CPU_SS_DSU_LEON_RT_DSU_CTRL				0x04000000u
-#define MTL_VPU_CPU_SS_DSU_LEON_RT_PC_REG				0x04400010u
-#define MTL_VPU_CPU_SS_DSU_LEON_RT_NPC_REG				0x04400014u
-#define MTL_VPU_CPU_SS_DSU_LEON_RT_DSU_TRAP_REG				0x04400020u
+#define VPU_37XX_CPU_SS_DSU_LEON_RT_BASE					0x04000000u
+#define VPU_37XX_CPU_SS_DSU_LEON_RT_DSU_CTRL				0x04000000u
+#define VPU_37XX_CPU_SS_DSU_LEON_RT_PC_REG				0x04400010u
+#define VPU_37XX_CPU_SS_DSU_LEON_RT_NPC_REG				0x04400014u
+#define VPU_37XX_CPU_SS_DSU_LEON_RT_DSU_TRAP_REG				0x04400020u
 
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_CLK_SET				0x06010004u
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_CLK_SET_CPU_DSU_MASK			BIT_MASK(1)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_CLK_SET				0x06010004u
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_CLK_SET_CPU_DSU_MASK			BIT_MASK(1)
 
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_RST_CLR				0x06010018u
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_RST_CLR_CPU_DSU_MASK			BIT_MASK(1)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_RST_CLR				0x06010018u
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_RST_CLR_CPU_DSU_MASK			BIT_MASK(1)
 
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC				0x06010040u
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_MASK		BIT_MASK(0)
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_MASK		BIT_MASK(1)
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_MASK		BIT_MASK(2)
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_MASK		BIT_MASK(3)
-#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_MASK		GENMASK(31, 4)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC				0x06010040u
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_MASK		BIT_MASK(0)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_MASK		BIT_MASK(1)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_MASK		BIT_MASK(2)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_MASK		BIT_MASK(3)
+#define VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_MASK		GENMASK(31, 4)
 
-#define MTL_VPU_CPU_SS_TIM_WATCHDOG					0x0602009cu
-#define MTL_VPU_CPU_SS_TIM_WDOG_EN					0x060200a4u
-#define MTL_VPU_CPU_SS_TIM_SAFE						0x060200a8u
-#define MTL_VPU_CPU_SS_TIM_IPC_FIFO					0x060200f0u
+#define VPU_37XX_CPU_SS_TIM_WATCHDOG					0x0602009cu
+#define VPU_37XX_CPU_SS_TIM_WDOG_EN					0x060200a4u
+#define VPU_37XX_CPU_SS_TIM_SAFE						0x060200a8u
+#define VPU_37XX_CPU_SS_TIM_IPC_FIFO					0x060200f0u
 
-#define MTL_VPU_CPU_SS_TIM_GEN_CONFIG					0x06021008u
-#define MTL_VPU_CPU_SS_TIM_GEN_CONFIG_WDOG_TO_INT_CLR_MASK		BIT_MASK(9)
+#define VPU_37XX_CPU_SS_TIM_GEN_CONFIG					0x06021008u
+#define VPU_37XX_CPU_SS_TIM_GEN_CONFIG_WDOG_TO_INT_CLR_MASK		BIT_MASK(9)
 
-#define MTL_VPU_CPU_SS_DOORBELL_0					0x06300000u
-#define MTL_VPU_CPU_SS_DOORBELL_0_SET_MASK				BIT_MASK(0)
+#define VPU_37XX_CPU_SS_DOORBELL_0					0x06300000u
+#define VPU_37XX_CPU_SS_DOORBELL_0_SET_MASK				BIT_MASK(0)
 
-#define MTL_VPU_CPU_SS_DOORBELL_1					0x06301000u
+#define VPU_37XX_CPU_SS_DOORBELL_1					0x06301000u
 
-#endif /* __IVPU_HW_MTL_REG_H__ */
+#endif /* __IVPU_HW_37XX_REG_H__ */
-- 
2.25.1

