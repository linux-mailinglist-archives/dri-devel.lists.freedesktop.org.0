Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB2249C61
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599A16E2A0;
	Wed, 19 Aug 2020 11:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AD26E255
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F55A22B47;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=u0SAc3SH13vR4eBd1vApi6vyWOf1AwO+c6A+C0+sG2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4bHTBOM5bEaEXkIrVKwLAidbnDTuuDGSoec7AR6plBGwDz4343f8GKno1yPBHdsr
 e071+nMO9+EV3PSpKXLUTGuymPc7+mqEBHO/ko0VI1ZJvxvBK/cvC2WOUn9RBgoxto
 vgNyDNRn1lF4VjN++5lqWwLBjVVVjAgBZ1iKDgz4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Eubc-Re; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 36/49] staging: hikey9xx/gpu: solve most coding style issues
Date: Wed, 19 Aug 2020 13:46:04 +0200
Message-Id: <dc1ba17759f5467642146dac047eea53287264c9.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are lots of coding style issues on this driver, as
reported by checkpatch.

Address most of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin960_dpe_reg.h   |  340 +++--
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   | 1199 ++++++++---------
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |  285 ++--
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |    4 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   |    2 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.h   |    4 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   |   62 +-
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c |  116 +-
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |  226 ++--
 .../staging/hikey9xx/gpu/kirin9xx_fb_panel.h  |   18 +-
 drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c   |   26 +-
 11 files changed, 1140 insertions(+), 1142 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index 131bb80d9bd1..651b3b172033 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -28,11 +28,11 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_crtc.h>
 
-#define FB_ACCEL_HI62xx 	0x1
-#define FB_ACCEL_HI363x 	0x2
-#define FB_ACCEL_HI365x 	0x4
-#define FB_ACCEL_HI625x 	0x8
-#define FB_ACCEL_HI366x 	0x10
+#define FB_ACCEL_HI62xx	0x1
+#define FB_ACCEL_HI363x	0x2
+#define FB_ACCEL_HI365x	0x4
+#define FB_ACCEL_HI625x	0x8
+#define FB_ACCEL_HI366x	0x10
 #define FB_ACCEL_KIRIN970_ES  0x20
 #define FB_ACCEL_KIRIN970  0x40
 #define FB_ACCEL_KIRIN660  0x80
@@ -40,9 +40,9 @@
 #define FB_ACCEL_KIRIN980  0x200
 #define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
 #define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
-/*******************************************************************************
-**
-*/
+
+/******************************************************************************/
+
 enum dss_chn_idx {
 	DSS_RCHN_NONE = -1,
 	DSS_RCHN_D2 = 0,
@@ -104,32 +104,32 @@ enum dss_ovl_idx {
 #define DSS_WCH_MAX  (2)
 
 typedef struct dss_img {
-	uint32_t format;
-	uint32_t width;
-	uint32_t height;
-	uint32_t bpp;		/* bytes per pixel */
-	uint32_t buf_size;
-	uint32_t stride;
-	uint32_t stride_plane1;
-	uint32_t stride_plane2;
-	uint64_t phy_addr;
-	uint64_t vir_addr;
-	uint32_t offset_plane1;
-	uint32_t offset_plane2;
+	u32 format;
+	u32 width;
+	u32 height;
+	u32 bpp;		/* bytes per pixel */
+	u32 buf_size;
+	u32 stride;
+	u32 stride_plane1;
+	u32 stride_plane2;
+	u64 phy_addr;
+	u64 vir_addr;
+	u32 offset_plane1;
+	u32 offset_plane2;
 
-	uint64_t afbc_header_addr;
-	uint64_t afbc_payload_addr;
-	uint32_t afbc_header_stride;
-	uint32_t afbc_payload_stride;
-	uint32_t afbc_scramble_mode;
-	uint32_t mmbuf_base;
-	uint32_t mmbuf_size;
+	u64 afbc_header_addr;
+	u64 afbc_payload_addr;
+	u32 afbc_header_stride;
+	u32 afbc_payload_stride;
+	u32 afbc_scramble_mode;
+	u32 mmbuf_base;
+	u32 mmbuf_size;
 
-	uint32_t mmu_enable;
-	uint32_t csc_mode;
-	uint32_t secure_mode;
-	int32_t shared_fd;
-	uint32_t reserved0;
+	u32 mmu_enable;
+	u32 csc_mode;
+	u32 secure_mode;
+	s32 shared_fd;
+	u32 reserved0;
 } dss_img_t;
 
 typedef struct drm_dss_layer {
@@ -137,20 +137,18 @@ typedef struct drm_dss_layer {
 	dss_rect_t src_rect;
 	dss_rect_t src_rect_mask;
 	dss_rect_t dst_rect;
-	uint32_t transform;
-	int32_t blending;
-	uint32_t glb_alpha;
-	uint32_t color;		/* background color or dim color */
-	int32_t layer_idx;
-	int32_t chn_idx;
-	uint32_t need_cap;
-	int32_t acquire_fence;
+	u32 transform;
+	s32 blending;
+	u32 glb_alpha;
+	u32 color;		/* background color or dim color */
+	s32 layer_idx;
+	s32 chn_idx;
+	u32 need_cap;
+	s32 acquire_fence;
 } drm_dss_layer_t;
 
+/******************************************************************************/
 
-/*******************************************************************************
-**
-*/
 #define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
 #define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
 
@@ -178,9 +176,8 @@ typedef struct drm_dss_layer {
 #define GPIO_PG_SEL_B (76)
 #define GPIO_TX_RX_B (78)
 
-/*******************************************************************************
- **
- */
+/******************************************************************************/
+
 #define CRGPERI_PLL0_CLK_RATE	(1600000000UL)
 #define CRGPERI_PLL2_CLK_RATE	(960000000UL)
 #define CRGPERI_PLL3_CLK_RATE	(1600000000UL)
@@ -195,10 +192,10 @@ typedef struct drm_dss_layer {
 #define DSS_MAX_PXL0_CLK_288M (288000000UL)
 
 /*dss clk power off */
-#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF   	(277000000UL)
-#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(277000000UL)
-#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(238000000UL)
-#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF 	(238000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF	(277000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(277000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(238000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF	(238000000UL)
 
 #define MMBUF_SIZE_MAX	(288 * 1024)
 #define HISI_DSS_CMDLIST_MAX	(16)
@@ -234,7 +231,7 @@ typedef struct drm_dss_layer {
 #define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
 #define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
 
-#define KIRIN970_VCO_MIN_FREQ_OUPUT         1000000 /*Boston: 1000 * 1000*/
+#define KIRIN970_VCO_MIN_FREQ_OUTPUT         1000000 /*Boston: 1000 * 1000*/
 #define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
 
 #define MIDIA_PPLL7_CTRL0	0x50c
@@ -249,7 +246,7 @@ typedef struct drm_dss_layer {
 
 /*
  * DSS Registers
-*/
+ */
 
 /* MACROS */
 #define DSS_WIDTH(width)	((width) - 1)
@@ -470,9 +467,7 @@ enum dss_rdma_idx {
 	DSS_RDMA_MAX,
 };
 
-/*******************************************************************************
- **
- */
+/*****************************************************************************/
 
 #define PEREN0	(0x000)
 #define PERDIS0	(0x004)
@@ -539,9 +534,8 @@ enum dss_rdma_idx {
 #define PCTRL_DPHYTX_CTRL1	BIT(1)
 #define PCTRL_DPHYTX_CTRL0	BIT(0)
 
-/*******************************************************************************
- **
- */
+/*****************************************************************************/
+
 #define BIT_DSS_GLB_INTS	BIT(30)
 #define BIT_MMU_IRPT_S	BIT(29)
 #define BIT_MMU_IRPT_NS	BIT(28)
@@ -706,8 +700,8 @@ enum dss_rdma_idx {
 #define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
 #define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
 
-/*******************************************************************************
- ** MODULE BASE ADDRESS
+/*
+ * MODULE BASE ADDRESS
  */
 
 #define DSS_MIPI_DSI0_OFFSET	(0x00001000)
@@ -884,8 +878,8 @@ enum dss_rdma_idx {
 #define DSS_DSC_OFFSET	(0x7DC00)
 #define DSS_LDI1_OFFSET	(0x7E000)
 
-/*******************************************************************************
- ** GLB
+/*
+ * GLB
  */
 #define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
 
@@ -947,8 +941,8 @@ enum dss_rdma_idx {
 #define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
 #define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
 
-/*******************************************************************************
- ** DBG
+/*
+ * DBG
  */
 #define DBG_CRC_DBG_OV0	(0x0000)
 #define DBG_CRC_DBG_OV1	(0x0004)
@@ -991,8 +985,8 @@ enum dss_rdma_idx {
 #define DBG_RCH8_INTS	(0x02A4)
 #define DBG_RCH8_INT_MSK	(0x02A8)
 
-/*******************************************************************************
- ** CMDLIST
+/*
+ * CMDLIST
  */
 
 #define CMDLIST_CH0_PENDING_CLR	(0x0000)
@@ -1054,8 +1048,8 @@ enum dss_rdma_idx {
 #define BIT_CMDLIST_CH1_INTS	BIT(1)
 #define BIT_CMDLIST_CH0_INTS	BIT(0)
 
-/*******************************************************************************
- ** AIF
+/*
+ * AIF
  */
 #define AIF0_CH0_OFFSET	(DSS_VBIF0_AIF + 0x00)
 #define AIF0_CH0_ADD_OFFSET	(DSS_VBIF0_AIF + 0x04)
@@ -1178,8 +1172,8 @@ typedef struct dss_aif_bw {
 	u8 is_used;
 } dss_aif_bw_t;
 
-/*******************************************************************************
- ** MIF
+/*
+ * MIF
  */
 #define MIF_ENABLE	(0x0000)
 #define MIF_MEM_CTRL	(0x0004)
@@ -1227,8 +1221,8 @@ typedef struct dss_mif {
 } dss_mif_t;
 
 /*
- ** stretch blt, linear/tile, rotation, pixel format
- ** 0 0 000
+ * stretch blt, linear/tile, rotation, pixel format
+ * 0 0 000
  */
 enum dss_mmu_tlb_tag_org {
 	MMU_TLB_TAG_ORG_0x0 = 0x0,
@@ -1260,8 +1254,8 @@ enum dss_mmu_tlb_tag_org {
 	MMU_TLB_TAG_ORG_0x1F = 0x1F,
 };
 
-/*******************************************************************************
- **SMMU
+/*
+ * SMMU
  */
 #define SMMU_SCR	(0x0000)
 #define SMMU_MEMCTRL	(0x0004)
@@ -1383,8 +1377,8 @@ typedef struct dss_smmu {
 	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
 } dss_smmu_t;
 
-/*******************************************************************************
- ** RDMA
+/*
+ * RDMA
  */
 
 #define DMA_OFT_X0	(0x0000)
@@ -1447,8 +1441,8 @@ typedef struct dss_smmu {
 #define CH_CLK_SEL	(0x00E0)
 #define CH_CLK_EN	(0x00E4)
 
-/*******************************************************************************
- ** DFC
+/*
+ * DFC
  */
 #define DFC_DISP_SIZE	(0x0000)
 #define DFC_PIX_IN_NUM	(0x0004)
@@ -1473,8 +1467,8 @@ typedef struct dss_dfc {
 	u32 padding_ctl;
 } dss_dfc_t;
 
-/*******************************************************************************
- ** SCF
+/*
+ * SCF
  */
 #define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
 #define DSS_SCF_Y_COEF_OFFSET	(0x2000)
@@ -1506,7 +1500,7 @@ typedef struct dss_dfc {
 #define SCF_CLK_SEL	(0x00F8)
 #define SCF_CLK_EN	(0x00FC)
 #define WCH_SCF_COEF_MEM_CTRL (0x0218)
-#define WCH_SCF_LB_MEM_CTRL 	(0x290)
+#define WCH_SCF_LB_MEM_CTRL	(0x290)
 
 /* MACROS */
 #define SCF_MIN_INPUT	(16)
@@ -1514,7 +1508,7 @@ typedef struct dss_dfc {
 
 /* Threshold for SCF Stretch and SCF filter */
 #define RDMA_STRETCH_THRESHOLD	(2)
-#define SCF_INC_FACTOR	(1 << 18)
+#define SCF_INC_FACTOR	BIT(18)
 #define SCF_UPSCALE_MAX	(60)
 #define SCF_DOWNSCALE_MAX	  (60)
 #define SCF_EDGE_FACTOR (3)
@@ -1630,8 +1624,8 @@ typedef struct dss_arsr2p {
 	u32 ivbottom1;
 } dss_arsr2p_t;
 
-/*******************************************************************************
- ** POST_CLIP  v g
+/*
+ * POST_CLIP  v g
  */
 #define POST_CLIP_DISP_SIZE	(0x0000)
 #define POST_CLIP_CTL_HRZ	(0x0010)
@@ -1645,8 +1639,8 @@ typedef struct dss_post_clip {
 	u32 ctl_clip_en;
 } dss_post_clip_t;
 
-/*******************************************************************************
- ** PCSC v
+/*
+ * PCSC v
  */
 #define PCSC_IDC0	(0x0000)
 #define PCSC_IDC2	(0x0004)
@@ -1664,9 +1658,10 @@ typedef struct dss_pcsc {
 	u32 pcsc_idc0;
 } dss_pcsc_t;
 
-/*******************************************************************************
- ** CSC
+/*
+ * CSC
  */
+
 #define CSC_IDC0	(0x0000)
 #define CSC_IDC2	(0x0004)
 #define CSC_ODC0	(0x0008)
@@ -1693,19 +1688,19 @@ typedef struct dss_csc {
 	u32 mprec;
 } dss_csc_t;
 
-/*******************************************************************************
- **channel DEBUG
+/*
+ * channel DEBUG
  */
 #define CH_DEBUG_SEL (0x600)
 
-/*******************************************************************************
- ** VPP
+/*
+ * VPP
  */
 #define VPP_CTRL (0x700)
 #define VPP_MEM_CTRL (0x704)
 
-/*******************************************************************************
- **DMA BUF
+/*
+ * DMA BUF
  */
 #define DMA_BUF_CTRL	(0x800)
 #define DMA_BUF_SIZE  (0x850)
@@ -1733,15 +1728,15 @@ typedef struct dss_csc {
 #define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
 #define AFBCD_MONITOR_REG3_OFFSET	(0x950)
 #define AFBCD_DEBUG_REG0_OFFSET	(0x954)
-#define AFBCD_CREG_FBCD_CTRL_MODE  	(0x960)
-#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
-#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1	 	(0x970)
-#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
-#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1 		(0x970)
+#define AFBCD_CREG_FBCD_CTRL_MODE	(0x960)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
 #define AFBCD_BLOCK_TYPE				(0x974)
 #define AFBCD_MM_BASE_1				(0x978)
 #define AFBCD_MM_BASE_2				(0x97C)
@@ -1763,12 +1758,12 @@ typedef struct dss_csc {
 #define AFBCE_THRESHOLD	(0x92C)
 #define AFBCE_SCRAMBLE_MODE	(0x930)
 #define AFBCE_HEADER_POINTER_OFFSET	(0x934)
-#define AFBCE_CREG_FBCE_CTRL_MODE  	(0x950)
-#define AFBCE_HREG_HDR_PTR_L1 		(0x954)
-#define AFBCE_HREG_PLD_PTR_L1 		(0x958)
-#define AFBCE_HEADER_SRTIDE_1 			(0x95C)
-#define AFBCE_PAYLOAD_SRTIDE_1 		(0x960)
-#define AFBCE_MEM_CTRL_1 				(0x968)
+#define AFBCE_CREG_FBCE_CTRL_MODE	(0x950)
+#define AFBCE_HREG_HDR_PTR_L1		(0x954)
+#define AFBCE_HREG_PLD_PTR_L1		(0x958)
+#define AFBCE_HEADER_SRTIDE_1			(0x95C)
+#define AFBCE_PAYLOAD_SRTIDE_1		(0x960)
+#define AFBCE_MEM_CTRL_1				(0x968)
 #define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
 
 #define ROT_FIRST_LNS	(0x530)
@@ -1954,8 +1949,8 @@ typedef struct dss_wdma {
 	u8 rot_used;
 } dss_wdma_t;
 
-/*******************************************************************************
- ** MCTL  MUTEX0 1 2 3 4 5
+/*
+ * MCTL  MUTEX0 1 2 3 4 5
  */
 #define MCTL_CTL_EN	(0x0000)
 #define MCTL_CTL_MUTEX	(0x0004)
@@ -1990,8 +1985,8 @@ typedef struct dss_wdma {
 #define MCTL_CTL_CLK_EN	(0x0084)
 #define MCTL_CTL_DBG	(0x00E0)
 
-/*******************************************************************************
- ** MCTL  SYS
+/*
+ * MCTL  SYS
  */
 #define MCTL_CTL_SECU_CFG	(0x0000)
 #define MCTL_PAY_SECU_FLUSH_EN  (0x0018)
@@ -2157,8 +2152,8 @@ typedef struct dss_mctl_sys {
 	u8 wch_ov_sel_used[DSS_WCH_MAX];
 } dss_mctl_sys_t;
 
-/*******************************************************************************
- ** OVL
+/*
+ * OVL
  */
 #define OVL_SIZE	(0x0000)
 #define OVL_BG_COLOR	(0x4)
@@ -2320,45 +2315,45 @@ typedef struct dss_mctl_sys {
 #define OVL_6LAYER_NUM		(6)
 #define OVL_2LAYER_NUM		(2)
 
-/*******************************************************************************
-** OVL
-*/
+/*
+ * OVL
+ */
 #define OV_SIZE						(0x000)
-#define OV_BG_COLOR_RGB 			(0x004)
-#define OV_BG_COLOR_A 				(0x008)
-#define OV_DST_STARTPOS 			(0x00C)
-#define OV_DST_ENDPOS 				(0x010)
-#define OV_GCFG 					(0x014)
-#define OV_LAYER0_POS 				(0x030)
-#define OV_LAYER0_SIZE 				(0x034)
+#define OV_BG_COLOR_RGB			(0x004)
+#define OV_BG_COLOR_A				(0x008)
+#define OV_DST_STARTPOS			(0x00C)
+#define OV_DST_ENDPOS				(0x010)
+#define OV_GCFG					(0x014)
+#define OV_LAYER0_POS				(0x030)
+#define OV_LAYER0_SIZE				(0x034)
 #define OV_LAYER0_SRCLOKEY		(0x038)
-#define OV_LAYER0_SRCHIKEY 		(0x03C)
-#define OV_LAYER0_DSTLOKEY 		(0x040)
-#define OV_LAYER0_DSTHIKEY 		(0x044)
-#define OV_LAYER0_PATTERN_RGB 	(0x048)
-#define OV_LAYER0_PATTERN_A 		(0x04C)
-#define OV_LAYER0_ALPHA_MODE 		(0x050)
-#define OV_LAYER0_ALPHA_A 			(0x054)
-#define OV_LAYER0_CFG 				(0x058)
-#define OV_LAYER0_PSPOS 			(0x05C)
-#define OV_LAYER0_PEPOS 			(0x060)
-#define OV_LAYER0_INFO_ALPHA 		(0x064)
-#define OV_LAYER0_INFO_SRCCOLOR 	(0x068)
-#define OV_LAYER0_DBG_INFO 		(0x06C)
+#define OV_LAYER0_SRCHIKEY		(0x03C)
+#define OV_LAYER0_DSTLOKEY		(0x040)
+#define OV_LAYER0_DSTHIKEY		(0x044)
+#define OV_LAYER0_PATTERN_RGB	(0x048)
+#define OV_LAYER0_PATTERN_A		(0x04C)
+#define OV_LAYER0_ALPHA_MODE		(0x050)
+#define OV_LAYER0_ALPHA_A			(0x054)
+#define OV_LAYER0_CFG				(0x058)
+#define OV_LAYER0_PSPOS			(0x05C)
+#define OV_LAYER0_PEPOS			(0x060)
+#define OV_LAYER0_INFO_ALPHA		(0x064)
+#define OV_LAYER0_INFO_SRCCOLOR	(0x068)
+#define OV_LAYER0_DBG_INFO		(0x06C)
 #define OV8_BASE_DBG_INFO			(0x340)
 #define OV8_RD_SHADOW_SEL			(0x344)
 #define OV8_CLK_SEL					(0x348)
-#define OV8_CLK_EN 					(0x34C)
-#define OV8_BLOCK_SIZE 				(0x350)
-#define OV8_BLOCK_DBG 				(0x354)
-#define OV8_REG_DEFAULT 			(0x358)
+#define OV8_CLK_EN					(0x34C)
+#define OV8_BLOCK_SIZE				(0x350)
+#define OV8_BLOCK_DBG				(0x354)
+#define OV8_REG_DEFAULT			(0x358)
 #define OV2_BASE_DBG_INFO			(0x200)
 #define OV2_RD_SHADOW_SEL			(0x204)
 #define OV2_CLK_SEL					(0x208)
-#define OV2_CLK_EN 					(0x20C)
-#define OV2_BLOCK_SIZE 				(0x210)
-#define OV2_BLOCK_DBG 				(0x214)
-#define OV2_REG_DEFAULT 			(0x218)
+#define OV2_CLK_EN					(0x20C)
+#define OV2_BLOCK_SIZE				(0x210)
+#define OV2_BLOCK_DBG				(0x214)
+#define OV2_REG_DEFAULT			(0x218)
 
 #define OV_8LAYER_NUM				(8)
 typedef struct dss_ovl_layer {
@@ -2405,8 +2400,8 @@ typedef struct dss_ovl_alpha {
 	u32 fix_mode;
 } dss_ovl_alpha_t;
 
-/*******************************************************************************
- ** DBUF
+/*
+ * DBUF
  */
 #define DBUF_FRM_SIZE	(0x0000)
 #define DBUF_FRM_HSIZE	(0x0004)
@@ -2440,8 +2435,8 @@ typedef struct dss_ovl_alpha {
 #define DBUF_DFS_RAM_MANAGE  (0x00A8)
 #define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
 
-/*******************************************************************************
- ** DPP
+/*
+ * DPP
  */
 #define DPP_RD_SHADOW_SEL	(0x000)
 #define DPP_DEFAULT	(0x004)
@@ -2576,11 +2571,11 @@ typedef struct dss_ovl_alpha {
 #define ACE_Y_EXT	(0x03C)
 #define ACE_U_EXT	(0x040)
 #define ACE_V_EXT	(0x044)
-#define ACE_Y_ATTENU 	(0x048)
+#define ACE_Y_ATTENU	(0x048)
 #define ACE_U_ATTENU	(0x04C)
 #define ACE_V_ATTENU	(0x050)
 #define ACE_ROTA	(0x054)
-#define ACE_ROTB 	(0x058)
+#define ACE_ROTB	(0x058)
 #define ACE_Y_CORE	(0x05C)
 #define ACE_U_CORE	(0x060)
 #define ACE_V_CORE	(0x064)
@@ -2683,8 +2678,8 @@ typedef struct dss_arsr1p {
 #define ARSR1P_LSC_CFG3		(0x080)
 #define ARSR1P_FORCE_CLK_ON_CFG		(0x084)
 
-/*******************************************************************************
- ** BIT EXT
+/*
+ * BIT EXT
  */
 #define BIT_EXT0_CTL (0x000)
 
@@ -2768,8 +2763,8 @@ typedef struct dss_arsr1p {
 #define HIACE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
 #define HIACE_LHIST_RAM_CFG_PM_CTRL (0x0148)
 
-/*******************************************************************************
- ** IFBC
+/*
+ * IFBC
  */
 #define IFBC_SIZE	(0x0000)
 #define IFBC_CTRL	(0x0004)
@@ -2793,8 +2788,8 @@ typedef struct dss_arsr1p {
 #define IFBC_PAD	(0x004C)
 #define IFBC_REG_DEFAULT	(0x0050)
 
-/*******************************************************************************
- ** DSC
+/*
+ * DSC
  */
 #define DSC_VERSION	(0x0000)
 #define DSC_PPS_IDENTIFIER	(0x0004)
@@ -2844,8 +2839,8 @@ typedef struct dss_arsr1p {
 #define DSC_RD_SHADOW_SEL	(0x00B4)
 #define DSC_REG_DEFAULT	(0x00B8)
 
-/*******************************************************************************
- ** LDI
+/*
+ * LDI
  */
 #define LDI_DPI0_HRZ_CTRL0	(0x0000)
 #define LDI_DPI0_HRZ_CTRL1	(0x0004)
@@ -2902,8 +2897,8 @@ typedef struct dss_arsr1p {
 #define LDI_MODULE_CLK_SEL (0x0258)
 #define LDI_MODULE_CLK_EN (0x025C)
 
-/*******************************************************************************
- ** MIPI DSI
+/*
+ * MIPI DSI
  */
 #define MIPIDSI_VERSION_OFFSET	(0x0000)
 #define MIPIDSI_PWR_UP_OFFSET	(0x0004)
@@ -2986,8 +2981,8 @@ typedef struct dss_arsr1p {
 #define VID_VACTIVE_LINES_ACT	(0x0160)
 #define SDF_3D_ACT	(0x0190)
 
-/*******************************************************************************
- ** MMBUF
+/*
+ * MMBUF
  */
 #define SMC_LOCK	(0x0000)
 #define SMC_MEM_LP	(0x0004)
@@ -3094,12 +3089,12 @@ struct dss_hw_ctx {
 };
 
 typedef struct dss_clk_rate {
-	uint64_t dss_pri_clk_rate;
-	uint64_t dss_pclk_dss_rate;
-	uint64_t dss_pclk_pctrl_rate;
-	uint64_t dss_mmbuf_rate;
-	uint32_t dss_voltage_value; //0:0.7v, 2:0.8v
-	uint32_t reserved;
+	u64 dss_pri_clk_rate;
+	u64 dss_pclk_dss_rate;
+	u64 dss_pclk_pctrl_rate;
+	u64 dss_mmbuf_rate;
+	u32 dss_voltage_value; //0:0.7v, 2:0.8v
+	u32 reserved;
 } dss_clk_rate_t;
 
 struct dss_crtc {
@@ -3221,9 +3216,8 @@ typedef struct mipi_ifbc_division {
 	u32 pxl0_dsi_gt_en;
 } mipi_ifbc_division_t;
 
-/*******************************************************************************
-**
-*/
+/*****************************************************************************/
+
 #define outp32(addr, val) writel(val, addr)
 #define outp16(addr, val) writew(val, addr)
 #define outp8(addr, val) writeb(val, addr)
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 00bbad95ee3d..9c5009389f00 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -28,11 +28,11 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_crtc.h>
 
-#define FB_ACCEL_HI62xx 	0x1
-#define FB_ACCEL_HI363x 	0x2
-#define FB_ACCEL_HI365x 	0x4
-#define FB_ACCEL_HI625x 	0x8
-#define FB_ACCEL_HI366x 	0x10
+#define FB_ACCEL_HI62xx	0x1
+#define FB_ACCEL_HI363x	0x2
+#define FB_ACCEL_HI365x	0x4
+#define FB_ACCEL_HI625x	0x8
+#define FB_ACCEL_HI366x	0x10
 #define FB_ACCEL_KIRIN970_ES  0x20
 #define FB_ACCEL_KIRIN970  0x40
 #define FB_ACCEL_KIRIN660  0x80
@@ -44,9 +44,8 @@
 /* vcc name */
 #define REGULATOR_PDP_NAME	"ldo3"
 
-/*******************************************************************************
-**
-*/
+/*****************************************************************************/
+
 enum dss_chn_idx {
 	DSS_RCHN_NONE = -1,
 	DSS_RCHN_D2 = 0,
@@ -116,13 +115,13 @@ typedef struct dss_img {
 	u32 stride;
 	u32 stride_plane1;
 	u32 stride_plane2;
-	uint64_t phy_addr;
-	uint64_t vir_addr;
+	u64 phy_addr;
+	u64 vir_addr;
 	u32 offset_plane1;
 	u32 offset_plane2;
 
-	uint64_t afbc_header_addr;
-	uint64_t afbc_payload_addr;
+	u64 afbc_header_addr;
+	u64 afbc_payload_addr;
 	u32 afbc_header_stride;
 	u32 afbc_payload_stride;
 	u32 afbc_scramble_mode;
@@ -132,7 +131,7 @@ typedef struct dss_img {
 	u32 mmu_enable;
 	u32 csc_mode;
 	u32 secure_mode;
-	int32_t shared_fd;
+	s32 shared_fd;
 	u32 reserved0;
 } dss_img_t;
 
@@ -142,19 +141,17 @@ typedef struct drm_dss_layer {
 	dss_rect_t src_rect_mask;
 	dss_rect_t dst_rect;
 	u32 transform;
-	int32_t blending;
+	s32 blending;
 	u32 glb_alpha;
 	u32 color;		/* background color or dim color */
-	int32_t layer_idx;
-	int32_t chn_idx;
+	s32 layer_idx;
+	s32 chn_idx;
 	u32 need_cap;
-	int32_t acquire_fence;
+	s32 acquire_fence;
 } drm_dss_layer_t;
 
+/*****************************************************************************/
 
-/*******************************************************************************
-**
-*/
 #define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
 #define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
 
@@ -182,10 +179,8 @@ typedef struct drm_dss_layer {
 #define GPIO_PG_SEL_B (76)
 #define GPIO_TX_RX_B (78)
 
+/*****************************************************************************/
 
-/*******************************************************************************
-**
-*/
 #define CRGPERI_PLL0_CLK_RATE	(1660000000UL)
 #define CRGPERI_PLL2_CLK_RATE	(1920000000UL)
 #define CRGPERI_PLL3_CLK_RATE	(1200000000UL)
@@ -204,7 +199,7 @@ typedef struct drm_dss_layer {
 #define DEFAULT_DSS_PXL0_CLK_RATE_L1	(300000000UL)
 
 /*mmbuf_clk: 0.65v-237.14M, 0.75-332M, 0.8-480M*/
-#define DEFAULT_DSS_MMBUF_CLK_RATE_L3 	(480000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L3	(480000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_L2	(332000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
 
@@ -219,10 +214,10 @@ typedef struct drm_dss_layer {
 #define DEFAULT_MDC_CORE_CLK_RATE_L1	(240000000UL)
 
 /*dss clk power off */
-#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF   	(277000000UL)
-#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(238000000UL)
-#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(208000000UL)
-#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF 	(238000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF	(277000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(238000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(208000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF	(238000000UL)
 
 #define DEFAULT_PCLK_DSS_RATE	(114000000UL)
 #define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
@@ -265,7 +260,7 @@ typedef struct drm_dss_layer {
 #define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
 #define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
 
-#define KIRIN970_VCO_MIN_FREQ_OUPUT         1000000 /*Boston: 1000 * 1000*/
+#define KIRIN970_VCO_MIN_FREQ_OUTPUT         1000000 /*Boston: 1000 * 1000*/
 #define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
 
 #define MIDIA_PPLL7_CTRL0	0x50c
@@ -280,7 +275,7 @@ typedef struct drm_dss_layer {
 
 /*
  * DSS Registers
-*/
+ */
 
 /* MACROS */
 #define DSS_WIDTH(width)	((width) - 1)
@@ -298,6 +293,7 @@ typedef struct drm_dss_layer {
 #define DFC_MAX_CLIP_NUM	(31)
 
 /* for DFS */
+
 /* 1480 * 144bits */
 #define DFS_TIME	(80)
 #define DFS_TIME_MIN	(50)
@@ -502,9 +498,7 @@ enum dss_rdma_idx {
 	DSS_RDMA_MAX,
 };
 
-/*******************************************************************************
- **
- */
+/*****************************************************************************/
 
 #define PEREN0	(0x000)
 #define PERDIS0	(0x004)
@@ -556,18 +550,17 @@ enum dss_rdma_idx {
 #define NOC_POWER_IDLE	(0x388)
 
 //SYSCTRL
-#define SCISODIS 	(0x044)
+#define SCISODIS	(0x044)
 #define SCPERCLKEN1 (0x048)
-#define SCPWREN 	(0x060)
-#define SCPEREN1 	(0x170)
-#define SCPERDIS1  	(0x174)
-#define SCPEREN4 	(0x1B0)
-#define SCPERDIS4  	(0x1B4)
+#define SCPWREN	(0x060)
+#define SCPEREN1	(0x170)
+#define SCPERDIS1	(0x174)
+#define SCPEREN4	(0x1B0)
+#define SCPERDIS4	(0x1B4)
 #define SCPERRSTDIS1	(0x210)
 #define SCCLKDIV2	(0x258)
 #define SCCLKDIV4	(0x260)
 
-
 //PCTRL
 #define PERI_CTRL23	(0x060)
 #define PERI_CTRL29	(0x078)
@@ -584,9 +577,8 @@ enum dss_rdma_idx {
 #define PCTRL_DPHYTX_CTRL1	BIT(1)
 #define PCTRL_DPHYTX_CTRL0	BIT(0)
 
-/*******************************************************************************
- **
- */
+/*****************************************************************************/
+
 #define BIT_DSS_GLB_INTS	BIT(30)
 #define BIT_MMU_IRPT_S	BIT(29)
 #define BIT_MMU_IRPT_NS	BIT(28)
@@ -618,7 +610,6 @@ enum dss_rdma_idx {
 #define BIT_CMDLIST1	BIT(2)
 #define BIT_CMDLIST0	BIT(1)
 
-
 // CPU_SDP_INTS		0x22C
 // CPU_SDP_INT_MSK	0x230
 #define BIT_SDP_DSS_GLB_INTS	BIT(29)
@@ -652,7 +643,6 @@ enum dss_rdma_idx {
 #define BIT_SDP_CMDLIST0	BIT(1)
 #define BIT_SDP_RCH_CE_INTS	BIT(0)
 
-
 // CPU_OFF_INTS	0x234
 // CPU_OFF_INT_MASK	0x238
 #define BIT_OFF_DSS_GLB_INTS	BIT(31)
@@ -757,9 +747,10 @@ enum dss_rdma_idx {
 #define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
 #define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
 
-/*******************************************************************************
-** MODULE BASE ADDRESS
-*/
+/*
+ * MODULE BASE ADDRESS
+ */
+
 //DSI0 DSI1
 #define DSS_MIPI_DSI0_OFFSET	(0x00001000)
 #define DSS_MIPI_DSI1_OFFSET	(0x00001400)
@@ -794,7 +785,7 @@ enum dss_rdma_idx {
 
 // RCH_V
 #define DSS_RCH_VG0_DMA_OFFSET			(0x20000)
-#define DSS_RCH_VG0_DFC_OFFSET 			(0x20100)
+#define DSS_RCH_VG0_DFC_OFFSET			(0x20100)
 #define DSS_RCH_VG0_SCL_OFFSET			(0x20200)
 #define DSS_RCH_VG0_ARSR_OFFSET			(0x20300)
 #define DSS_RCH_VG0_POST_CLIP_OFFSET_ES	(0x203A0)
@@ -810,7 +801,7 @@ enum dss_rdma_idx {
 #define DSS_RCH_VG0_ARSR_LUT_OFFSET		(0x25000)
 
 #define DSS_RCH_VG1_DMA_OFFSET			(0x28000)
-#define DSS_RCH_VG1_DFC_OFFSET 			(0x28100)
+#define DSS_RCH_VG1_DFC_OFFSET			(0x28100)
 #define DSS_RCH_VG1_SCL_OFFSET			(0x28200)
 #define DSS_RCH_VG1_POST_CLIP_OFFSET_ES	(0x283A0)
 #define DSS_RCH_VG1_POST_CLIP_OFFSET	(0x28480)
@@ -823,7 +814,7 @@ enum dss_rdma_idx {
 #define DSS_RCH_VG1_SCL_LUT_OFFSET		(0x29000)
 
 #define DSS_RCH_VG2_DMA_OFFSET			(0x30000)
-#define DSS_RCH_VG2_DFC_OFFSET 			(0x30100)
+#define DSS_RCH_VG2_DFC_OFFSET			(0x30100)
 #define DSS_RCH_VG2_SCL_OFFSET			(0x30200)
 #define DSS_RCH_VG2_POST_CLIP_OFFSET_ES	(0x303A0)
 #define DSS_RCH_VG2_POST_CLIP_OFFSET	(0x30480)
@@ -839,23 +830,23 @@ enum dss_rdma_idx {
 #define DSS_RCH_G0_DFC_OFFSET				(0x38100)
 #define DSS_RCH_G0_SCL_OFFSET				(0x38200)
 #define DSS_RCH_G0_POST_CLIP_OFFSET_ES		(0x383A0)
-#define DSS_RCH_G0_POST_CLIP_OFFSET 		(0x38480)
-#define DSS_RCH_G0_CSC_OFFSET 			(0x38500)
-#define DSS_RCH_G0_DEBUG_OFFSET 			(0x38600)
-#define DSS_RCH_G0_DMA_BUF_OFFSET 		(0x38800)
-#define DSS_RCH_G0_AFBCD_OFFSET 			(0x38900)
-#define DSS_RCH_G0_REG_DEFAULT_OFFSET 	(0x38A00)
+#define DSS_RCH_G0_POST_CLIP_OFFSET		(0x38480)
+#define DSS_RCH_G0_CSC_OFFSET			(0x38500)
+#define DSS_RCH_G0_DEBUG_OFFSET			(0x38600)
+#define DSS_RCH_G0_DMA_BUF_OFFSET		(0x38800)
+#define DSS_RCH_G0_AFBCD_OFFSET			(0x38900)
+#define DSS_RCH_G0_REG_DEFAULT_OFFSET	(0x38A00)
 
 #define DSS_RCH_G1_DMA_OFFSET				(0x40000)
 #define DSS_RCH_G1_DFC_OFFSET				(0x40100)
 #define DSS_RCH_G1_SCL_OFFSET				(0x40200)
 #define DSS_RCH_G1_POST_CLIP_OFFSET_ES	(0x403A0)
 #define DSS_RCH_G1_POST_CLIP_OFFSET		(0x40480)
-#define DSS_RCH_G1_CSC_OFFSET 			(0x40500)
-#define DSS_RCH_G1_DEBUG_OFFSET 			(0x40600)
-#define DSS_RCH_G1_DMA_BUF_OFFSET 		(0x40800)
-#define DSS_RCH_G1_AFBCD_OFFSET 			(0x40900)
-#define DSS_RCH_G1_REG_DEFAULT_OFFSET 	(0x40A00)
+#define DSS_RCH_G1_CSC_OFFSET			(0x40500)
+#define DSS_RCH_G1_DEBUG_OFFSET			(0x40600)
+#define DSS_RCH_G1_DMA_BUF_OFFSET		(0x40800)
+#define DSS_RCH_G1_AFBCD_OFFSET			(0x40900)
+#define DSS_RCH_G1_REG_DEFAULT_OFFSET	(0x40A00)
 
 // RCH_D
 #define DSS_RCH_D2_DMA_OFFSET			(0x50000)
@@ -886,7 +877,7 @@ enum dss_rdma_idx {
 // WCH
 #define DSS_WCH0_DMA_OFFSET			(0x5A000)
 #define DSS_WCH0_DFC_OFFSET			(0x5A100)
-#define DSS_WCH0_BITEXT_OFFSET 		(0x5A140)
+#define DSS_WCH0_BITEXT_OFFSET		(0x5A140)
 #define DSS_WCH0_DITHER_OFFSET            (0x5A1D0)
 #define DSS_WCH0_PCSC_OFFSET			(0x5A400)
 #define DSS_WCH0_CSC_OFFSET			(0x5A500)
@@ -898,16 +889,16 @@ enum dss_rdma_idx {
 
 #define DSS_WCH1_DMA_OFFSET			(0x5C000)
 #define DSS_WCH1_DFC_OFFSET			(0x5C100)
-#define DSS_WCH1_BITEXT_OFFSET 		(0x5C140)
+#define DSS_WCH1_BITEXT_OFFSET		(0x5C140)
 #define DSS_WCH1_DITHER_OFFSET            (0x5C1D0)
-#define DSS_WCH1_SCL_OFFSET          		(0x5C200)
+#define DSS_WCH1_SCL_OFFSET			(0x5C200)
 #define DSS_WCH1_PCSC_OFFSET			(0x5C400)
 #define DSS_WCH1_CSC_OFFSET			(0x5C500)
 #define DSS_WCH1_ROT_OFFSET			(0x5C530)
 #define DSS_WCH1_DEBUG_OFFSET		(0x5C600)
 #define DSS_WCH1_DMA_BUFFER_OFFSET	(0x5C800)
 #define DSS_WCH1_AFBCE_OFFSET			(0x5C900)
-#define DSS_WCH1_FBCE_CREG_CTRL_GATE 	(0x5C964)
+#define DSS_WCH1_FBCE_CREG_CTRL_GATE	(0x5C964)
 
 #define DSS_WCH2_DMA_OFFSET			(0x5E000)
 #define DSS_WCH2_DFC_OFFSET			(0x5E100)
@@ -917,8 +908,6 @@ enum dss_rdma_idx {
 #define DSS_WCH2_DMA_BUFFER_OFFSET	(0x5E800)
 #define DSS_WCH2_AFBCE_OFFSET			(0x5E900)
 
-
-
 // OVL
 #define DSS_OVL0_OFFSET	(0x60000)
 #define DSS_OVL1_OFFSET	(0x60400)
@@ -977,9 +966,10 @@ enum dss_rdma_idx {
 #define DSS_DSC_OFFSET	(0x7DC00)
 #define DSS_LDI1_OFFSET	(0x7E000)
 
-/*******************************************************************************
-** GLB
-*/
+/*
+ * GLB
+ */
+
 #define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
 //APB
 #define GLB_APB_CTL	 (DSS_GLB0_OFFSET + 0x0004)
@@ -1042,9 +1032,8 @@ enum dss_rdma_idx {
 #define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
 #define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
 
-/*******************************************************************************
-** DBG
-*/
+/*****************************************************************************/
+
 #define DBG_CRC_DBG_OV0	(0x0000)
 #define DBG_CRC_DBG_OV1	(0x0004)
 #define DBG_CRC_DBG_SUM	(0x0008)
@@ -1086,9 +1075,9 @@ enum dss_rdma_idx {
 #define DBG_RCH8_INTS	(0x02A4)
 #define DBG_RCH8_INT_MSK	(0x02A8)
 
-/*******************************************************************************
-** CMDLIST
-*/
+/*
+ * CMDLIST
+ */
 //DSS_CMD_OFFSET +  CMDLIST_CH0_* + 0x40 * i
 #define CMDLIST_CH0_PENDING_CLR	(0x0000)
 #define CMDLIST_CH0_CTRL	(0x0004)
@@ -1150,9 +1139,9 @@ enum dss_rdma_idx {
 #define BIT_CMDLIST_CH1_INTS	BIT(1)
 #define BIT_CMDLIST_CH0_INTS	BIT(0)
 
-/*******************************************************************************
-** AIF
-*/
+/*
+ * AIF
+ */
 #define AIF0_CH0_OFFSET		(DSS_VBIF0_AIF + 0x00)
 #define AIF0_CH1_OFFSET		(DSS_VBIF0_AIF + 0x20)
 #define AIF0_CH2_OFFSET		(DSS_VBIF0_AIF + 0x40)
@@ -1185,11 +1174,11 @@ enum dss_rdma_idx {
 //(0x0000+0x20*n)
 #define AIF_CH_CTL	(0x0000)
 //(0x0004+0x20*n)  //ES
-#define AIF_CH_CTL_ADD 	(0x0004)
+#define AIF_CH_CTL_ADD	(0x0004)
 //(0x0004+0x20*n)
-#define AIF_CH_HS 	(0x0004)
+#define AIF_CH_HS	(0x0004)
 //(0x0008+0x20*n)
-#define AIF_CH_LS 	(0x0008)
+#define AIF_CH_LS	(0x0008)
 
 /* aif common */
 #define AXI0_RID_MSK0	(0x0800)
@@ -1241,22 +1230,22 @@ enum dss_rdma_idx {
 #define AIF_MODULE_CLK_EN	(0x0A08)
 
 typedef struct dss_aif {
-	uint32_t aif_ch_ctl;
-	uint32_t aif_ch_ctl_add;  //ES
-	uint32_t aif_ch_hs;
-	uint32_t aif_ch_ls;
+	u32 aif_ch_ctl;
+	u32 aif_ch_ctl_add;  //ES
+	u32 aif_ch_hs;
+	u32 aif_ch_ls;
 } dss_aif_t;
 
 typedef struct dss_aif_bw {
-	uint64_t bw;
-	uint8_t chn_idx;
-	int8_t axi_sel;
-	uint8_t is_used;
+	u64 bw;
+	u8 chn_idx;
+	s8 axi_sel;
+	u8 is_used;
 } dss_aif_bw_t;
 
-/*******************************************************************************
-** MIF
-*/
+/*
+ * MIF
+ */
 #define MIF_ENABLE	(0x0000)
 #define MIF_MEM_CTRL	(0x0004)
 
@@ -1277,30 +1266,29 @@ typedef struct dss_aif_bw {
 #define MIF_STAT2	(0x0608)
 
 #define MIF_CTRL_OFFSET	(0x20)
-#define MIF_CH0_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*1)
-#define MIF_CH1_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*2)
-#define MIF_CH2_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*3)
-#define MIF_CH3_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*4)
-#define MIF_CH4_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*5)
-#define MIF_CH5_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*6)
-#define MIF_CH6_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*7)
-#define MIF_CH7_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*8)
-#define MIF_CH8_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*9)
-#define MIF_CH9_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*10)
-#define MIF_CH10_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*11)
-#define MIF_CH11_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*12)
+#define MIF_CH0_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 1)
+#define MIF_CH1_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 2)
+#define MIF_CH2_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 3)
+#define MIF_CH3_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 4)
+#define MIF_CH4_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 5)
+#define MIF_CH5_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 6)
+#define MIF_CH6_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 7)
+#define MIF_CH7_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 8)
+#define MIF_CH8_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 9)
+#define MIF_CH9_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 10)
+#define MIF_CH10_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 11)
+#define MIF_CH11_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 12)
 #define MIF_CTRL_NUM	(12)
 
-
 #define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
 #define MIF_STRIDE_UNIT (4 * 1024)
 
 typedef struct dss_mif {
-	uint32_t mif_ctrl1;
-	uint32_t mif_ctrl2;
-	uint32_t mif_ctrl3;
-	uint32_t mif_ctrl4;
-	uint32_t mif_ctrl5;
+	u32 mif_ctrl1;
+	u32 mif_ctrl2;
+	u32 mif_ctrl3;
+	u32 mif_ctrl4;
+	u32 mif_ctrl5;
 } dss_mif_t;
 
 /*
@@ -1337,9 +1325,9 @@ enum dss_mmu_tlb_tag_org {
 	MMU_TLB_TAG_ORG_0x1F = 0x1F,
 };
 
-/*******************************************************************************
-**SMMU
-*/
+/*
+ * SMMU
+ */
 #define SMMU_SCR	(0x0000)
 #define SMMU_MEMCTRL	(0x0004)
 #define SMMU_LP_CTRL	(0x0008)
@@ -1415,68 +1403,68 @@ enum dss_mmu_tlb_tag_org {
 #define SMMU_SID_NUM	(64)
 
 typedef struct dss_smmu {
-	uint32_t smmu_scr;
-	uint32_t smmu_memctrl;
-	uint32_t smmu_lp_ctrl;
-	uint32_t smmu_press_remap;
-	uint32_t smmu_intmask_ns;
-	uint32_t smmu_intraw_ns;
-	uint32_t smmu_intstat_ns;
-	uint32_t smmu_intclr_ns;
-	uint32_t smmu_smrx_ns[SMMU_SID_NUM];
-	uint32_t smmu_rld_en0_ns;
-	uint32_t smmu_rld_en1_ns;
-	uint32_t smmu_rld_en2_ns;
-	uint32_t smmu_cb_sctrl;
-	uint32_t smmu_cb_ttbr0;
-	uint32_t smmu_cb_ttbr1;
-	uint32_t smmu_cb_ttbcr;
-	uint32_t smmu_offset_addr_ns;
-	uint32_t smmu_scachei_all;
-	uint32_t smmu_scachei_l1;
-	uint32_t smmu_scachei_l2l3;
-	uint32_t smmu_fama_ctrl0_ns;
-	uint32_t smmu_fama_ctrl1_ns;
-	uint32_t smmu_addr_msb;
-	uint32_t smmu_err_rdaddr;
-	uint32_t smmu_err_wraddr;
-	uint32_t smmu_fault_addr_tcu;
-	uint32_t smmu_fault_id_tcu;
-	uint32_t smmu_fault_addr_tbux;
-	uint32_t smmu_fault_id_tbux;
-	uint32_t smmu_fault_infox;
-	uint32_t smmu_dbgrptr_tlb;
-	uint32_t smmu_dbgrdata_tlb;
-	uint32_t smmu_dbgrptr_cache;
-	uint32_t smmu_dbgrdata0_cache;
-	uint32_t smmu_dbgrdata1_cache;
-	uint32_t smmu_dbgaxi_ctrl;
-	uint32_t smmu_ova_addr;
-	uint32_t smmu_opa_addr;
-	uint32_t smmu_ova_ctrl;
-	uint32_t smmu_opref_addr;
-	uint32_t smmu_opref_ctrl;
-	uint32_t smmu_opref_cnt;
-	uint32_t smmu_smrx_s[SMMU_SID_NUM];
-	uint32_t smmu_rld_en0_s;
-	uint32_t smmu_rld_en1_s;
-	uint32_t smmu_rld_en2_s;
-	uint32_t smmu_intmas_s;
-	uint32_t smmu_intraw_s;
-	uint32_t smmu_intstat_s;
-	uint32_t smmu_intclr_s;
-	uint32_t smmu_scr_s;
-	uint32_t smmu_scb_sctrl;
-	uint32_t smmu_scb_ttbr;
-	uint32_t smmu_scb_ttbcr;
-	uint32_t smmu_offset_addr_s;
+	u32 smmu_scr;
+	u32 smmu_memctrl;
+	u32 smmu_lp_ctrl;
+	u32 smmu_press_remap;
+	u32 smmu_intmask_ns;
+	u32 smmu_intraw_ns;
+	u32 smmu_intstat_ns;
+	u32 smmu_intclr_ns;
+	u32 smmu_smrx_ns[SMMU_SID_NUM];
+	u32 smmu_rld_en0_ns;
+	u32 smmu_rld_en1_ns;
+	u32 smmu_rld_en2_ns;
+	u32 smmu_cb_sctrl;
+	u32 smmu_cb_ttbr0;
+	u32 smmu_cb_ttbr1;
+	u32 smmu_cb_ttbcr;
+	u32 smmu_offset_addr_ns;
+	u32 smmu_scachei_all;
+	u32 smmu_scachei_l1;
+	u32 smmu_scachei_l2l3;
+	u32 smmu_fama_ctrl0_ns;
+	u32 smmu_fama_ctrl1_ns;
+	u32 smmu_addr_msb;
+	u32 smmu_err_rdaddr;
+	u32 smmu_err_wraddr;
+	u32 smmu_fault_addr_tcu;
+	u32 smmu_fault_id_tcu;
+	u32 smmu_fault_addr_tbux;
+	u32 smmu_fault_id_tbux;
+	u32 smmu_fault_infox;
+	u32 smmu_dbgrptr_tlb;
+	u32 smmu_dbgrdata_tlb;
+	u32 smmu_dbgrptr_cache;
+	u32 smmu_dbgrdata0_cache;
+	u32 smmu_dbgrdata1_cache;
+	u32 smmu_dbgaxi_ctrl;
+	u32 smmu_ova_addr;
+	u32 smmu_opa_addr;
+	u32 smmu_ova_ctrl;
+	u32 smmu_opref_addr;
+	u32 smmu_opref_ctrl;
+	u32 smmu_opref_cnt;
+	u32 smmu_smrx_s[SMMU_SID_NUM];
+	u32 smmu_rld_en0_s;
+	u32 smmu_rld_en1_s;
+	u32 smmu_rld_en2_s;
+	u32 smmu_intmas_s;
+	u32 smmu_intraw_s;
+	u32 smmu_intstat_s;
+	u32 smmu_intclr_s;
+	u32 smmu_scr_s;
+	u32 smmu_scb_sctrl;
+	u32 smmu_scb_ttbr;
+	u32 smmu_scb_ttbcr;
+	u32 smmu_offset_addr_s;
 
-	uint8_t smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
+	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
 } dss_smmu_t;
 
-/*******************************************************************************
-** RDMA
-*/
+/*
+ * RDMA
+ */
 
 //DMA_CMN
 #define DMA_OFT_X0	(0x0000)
@@ -1544,9 +1532,9 @@ typedef struct dss_smmu {
 #define CH_CLK_SEL	(0x00E0)
 #define CH_CLK_EN	(0x00E4)
 
-/*******************************************************************************
-** DFC
-*/
+/*
+ * DFC
+ */
 #define DFC_DISP_SIZE		(0x0000)
 #define DFC_PIX_IN_NUM		(0x0004)
 #define DFC_GLB_ALPHA01		(0x0008)
@@ -1562,21 +1550,21 @@ typedef struct dss_smmu {
 #define DFC_DITHER_CTL1      (0x00D0)
 
 typedef struct dss_dfc {
-	uint32_t disp_size;
-	uint32_t pix_in_num;
-	uint32_t disp_fmt;
-	uint32_t clip_ctl_hrz;
-	uint32_t clip_ctl_vrz;
-	uint32_t ctl_clip_en;
-	uint32_t icg_module;
-	uint32_t dither_enable;
-	uint32_t padding_ctl;
-	uint32_t bitext_ctl;
+	u32 disp_size;
+	u32 pix_in_num;
+	u32 disp_fmt;
+	u32 clip_ctl_hrz;
+	u32 clip_ctl_vrz;
+	u32 ctl_clip_en;
+	u32 icg_module;
+	u32 dither_enable;
+	u32 padding_ctl;
+	u32 bitext_ctl;
 } dss_dfc_t;
 
-/*******************************************************************************
-** SCF
-*/
+/*
+ * SCF
+ */
 #define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
 #define DSS_SCF_Y_COEF_OFFSET	(0x2000)
 #define DSS_SCF_UV_COEF_OFFSET	(0x2800)
@@ -1607,7 +1595,7 @@ typedef struct dss_dfc {
 #define SCF_CLK_SEL	(0x00F8)
 #define SCF_CLK_EN	(0x00FC)
 #define WCH_SCF_COEF_MEM_CTRL (0x0218)
-#define WCH_SCF_LB_MEM_CTRL 	(0x290)
+#define WCH_SCF_LB_MEM_CTRL	(0x290)
 
 /* MACROS */
 #define SCF_MIN_INPUT	(16) //SCF min input pix 16x16
@@ -1615,26 +1603,26 @@ typedef struct dss_dfc {
 
 /* Threshold for SCF Stretch and SCF filter */
 #define RDMA_STRETCH_THRESHOLD	(2)
-#define SCF_INC_FACTOR	(1 << 18) //(262144)
+#define SCF_INC_FACTOR	BIT(18) //(262144)
 #define SCF_UPSCALE_MAX	(60)
 #define SCF_DOWNSCALE_MAX	  (60)
 #define SCF_EDGE_FACTOR (3)
 #define ARSR2P_INC_FACTOR (65536)
 
 typedef struct dss_scl {
-	uint32_t en_hscl_str;
-	uint32_t en_vscl_str;
-	uint32_t h_v_order;
-	uint32_t input_width_height;
-	uint32_t output_width_height;
-	uint32_t en_hscl;
-	uint32_t en_vscl;
-	uint32_t acc_hscl;
-	uint32_t inc_hscl;
-	uint32_t inc_vscl;
-	uint32_t en_mmp;
-	uint32_t scf_ch_core_gt;
-	uint32_t fmt;
+	u32 en_hscl_str;
+	u32 en_vscl_str;
+	u32 h_v_order;
+	u32 input_width_height;
+	u32 output_width_height;
+	u32 en_hscl;
+	u32 en_vscl;
+	u32 acc_hscl;
+	u32 inc_hscl;
+	u32 inc_vscl;
+	u32 en_mmp;
+	u32 scf_ch_core_gt;
+	u32 fmt;
 } dss_scl_t;
 
 enum scl_coef_lut_idx {
@@ -1644,9 +1632,9 @@ enum scl_coef_lut_idx {
 	SCL_COEF_IDX_MAX = 2,
 };
 
-/*******************************************************************************
-** ARSR2P ES  v0
-*/
+/*
+ * ARSR2P ES  v0
+ */
 #define ARSR2P_INPUT_WIDTH_HEIGHT_ES	(0x000)
 #define ARSR2P_OUTPUT_WIDTH_HEIGHT_ES	(0x004)
 #define ARSR2P_IHLEFT_ES	(0x008)
@@ -1692,10 +1680,9 @@ enum scl_coef_lut_idx {
 #define ARSR2P_LUT_COEFUV_V_OFFSET_ES	(0x0600)
 #define ARSR2P_LUT_COEFUV_H_OFFSET_ES	(0x0700)
 
-
-/*******************************************************************************
-** ARSR2P  v0
-*/
+/*
+ * ARSR2P  v0
+ */
 #define ARSR2P_INPUT_WIDTH_HEIGHT (0x000)
 #define ARSR2P_OUTPUT_WIDTH_HEIGHT (0x004)
 #define ARSR2P_IHLEFT (0x008)
@@ -1745,9 +1732,9 @@ enum scl_coef_lut_idx {
 #define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
 #define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
 
-/*******************************************************************************
-** POST_CLIP  v g
-*/
+/*
+ * POST_CLIP  v g
+ */
 #define POST_CLIP_DISP_SIZE			(0x0000)
 #define POST_CLIP_CTL_HRZ			(0x0004)
 #define POST_CLIP_CTL_VRZ			(0x0008)
@@ -1758,16 +1745,16 @@ enum scl_coef_lut_idx {
 #define POST_CLIP_CTL_VRZ_ES		(0x0014)
 #define POST_CLIP_EN_ES			(0x0018)
 
-typedef struct dss_post_clip{
-	uint32_t disp_size;
-	uint32_t clip_ctl_hrz;
-	uint32_t clip_ctl_vrz;
-	uint32_t ctl_clip_en;
+typedef struct dss_post_clip {
+	u32 disp_size;
+	u32 clip_ctl_hrz;
+	u32 clip_ctl_vrz;
+	u32 ctl_clip_en;
 } dss_post_clip_t;
 
-/*******************************************************************************
-** PCSC v
-*/
+/*
+ * PCSC v
+ */
 #define PCSC_IDC0	(0x0000)
 #define PCSC_IDC2	(0x0004)
 #define PCSC_ODC0	(0x0008)
@@ -1780,13 +1767,13 @@ typedef struct dss_post_clip{
 #define PCSC_ICG_MODULE	(0x0024)
 #define PCSC_MPREC	(0x0028)
 
-typedef struct dss_pcsc{
-	uint32_t pcsc_idc0;
+typedef struct dss_pcsc {
+	u32 pcsc_idc0;
 } dss_pcsc_t;
 
-/*******************************************************************************
-** CSC
-*/
+/*
+ * CSC
+ */
 #define CSC_IDC0			(0x0000)
 #define CSC_IDC2			(0x0004)
 #define CSC_ODC0			(0x0008)
@@ -1810,50 +1797,49 @@ typedef struct dss_pcsc{
 #define CSC_ICG_MODULE		(0x0034)
 
 typedef struct dss_csc {
-	uint32_t idc0;
-	uint32_t idc2;
-	uint32_t odc0;
-	uint32_t odc2;
-	uint32_t p0;
-	uint32_t p1;
-	uint32_t p2;
-	uint32_t p3;
-	uint32_t p4;
-	uint32_t icg_module_es;
-	uint32_t mprec;
-	uint32_t p00;
-	uint32_t p01;
-	uint32_t p02;
-	uint32_t p10;
-	uint32_t p11;
-	uint32_t p12;
-	uint32_t p20;
-	uint32_t p21;
-	uint32_t p22;
-	uint32_t icg_module;
+	u32 idc0;
+	u32 idc2;
+	u32 odc0;
+	u32 odc2;
+	u32 p0;
+	u32 p1;
+	u32 p2;
+	u32 p3;
+	u32 p4;
+	u32 icg_module_es;
+	u32 mprec;
+	u32 p00;
+	u32 p01;
+	u32 p02;
+	u32 p10;
+	u32 p11;
+	u32 p12;
+	u32 p20;
+	u32 p21;
+	u32 p22;
+	u32 icg_module;
 } dss_csc_t;
 
-/*******************************************************************************
-**channel DEBUG
-*/
+/*
+ * channel DEBUG
+ */
 #define CH_DEBUG_SEL (0x600)
 
-/*******************************************************************************
-** VPP
-*/
+/*
+ * VPP
+ */
 #define VPP_CTRL (0x700)
 #define VPP_MEM_CTRL (0x704)
 
-/*******************************************************************************
-**DMA BUF
-*/
+/*
+ * DMA BUF
+ */
 #define DMA_BUF_CTRL	(0x800)
 #define DMA_BUF_SIZE  (0x850)
 #define DMA_BUF_MEM_CTRL	(0x854)
 #define DMA_BUF_DBG0 (0x0838)
 #define DMA_BUF_DBG1 (0x083c)
 
-
 //AFBCD
 #define AFBCD_HREG_HDR_PTR_LO		(0x900)
 #define AFBCD_HREG_PIC_WIDTH			(0x904)
@@ -1875,15 +1861,15 @@ typedef struct dss_csc {
 #define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
 #define AFBCD_MONITOR_REG3_OFFSET	(0x950)
 #define AFBCD_DEBUG_REG0_OFFSET		(0x954)
-#define AFBCD_CREG_FBCD_CTRL_MODE  	(0x960)
-#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
-#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1	 	(0x970)
-#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
-#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1 		(0x970)
+#define AFBCD_CREG_FBCD_CTRL_MODE	(0x960)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
 #define AFBCD_BLOCK_TYPE				(0x974)
 #define AFBCD_MM_BASE_1				(0x978)
 #define AFBCD_MM_BASE_2				(0x97C)
@@ -1894,8 +1880,8 @@ typedef struct dss_csc {
 //AFBCE
 #define AFBCE_HREG_PIC_BLKS			(0x900)
 #define AFBCE_HREG_FORMAT				(0x904)
-#define AFBCE_HREG_HDR_PTR_L0 		(0x908)
-#define AFBCE_HREG_PLD_PTR_L0 		(0x90C)
+#define AFBCE_HREG_HDR_PTR_L0		(0x908)
+#define AFBCE_HREG_PLD_PTR_L0		(0x90C)
 #define AFBCE_PICTURE_SIZE				(0x910)
 #define AFBCE_CTL						(0x914)
 #define AFBCE_HEADER_SRTIDE			(0x918)
@@ -1906,19 +1892,19 @@ typedef struct dss_csc {
 #define AFBCE_THRESHOLD				(0x92C)
 #define AFBCE_SCRAMBLE_MODE			(0x930)
 #define AFBCE_HEADER_POINTER_OFFSET	(0x934)
-#define AFBCE_CREG_FBCE_CTRL_MODE  	(0x950)
-#define AFBCE_HREG_HDR_PTR_L1 		(0x954)
-#define AFBCE_HREG_PLD_PTR_L1 		(0x958)
-#define AFBCE_HEADER_SRTIDE_1 			(0x95C)
-#define AFBCE_PAYLOAD_SRTIDE_1 		(0x960)
-#define AFBCE_MEM_CTRL_1 				(0x968)
+#define AFBCE_CREG_FBCE_CTRL_MODE	(0x950)
+#define AFBCE_HREG_HDR_PTR_L1		(0x954)
+#define AFBCE_HREG_PLD_PTR_L1		(0x958)
+#define AFBCE_HEADER_SRTIDE_1			(0x95C)
+#define AFBCE_PAYLOAD_SRTIDE_1		(0x960)
+#define AFBCE_MEM_CTRL_1				(0x968)
 #define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
 
 //ROT
 #define ROT_FIRST_LNS			(0x530)
 #define ROT_STATE				(0x534)
 #define ROT_MEM_CTRL_ES		(0x538)
-#define ROT_SIZE_ES 			(0x53C)
+#define ROT_SIZE_ES			(0x53C)
 #define ROT_CPU_CTL0			(0x540)
 #define ROT_CPU_START0			(0x544)
 #define ROT_CPU_ADDR0			(0x548)
@@ -1934,8 +1920,8 @@ typedef struct dss_csc {
 #define ROT_CPU_WDATA2		(0x570)
 #define ROT_CPU_WDATA3		(0x574)
 
-#define ROT_MEM_CTRL		   	(0x588)
-#define ROT_SIZE 				(0x58C)
+#define ROT_MEM_CTRL			(0x588)
+#define ROT_SIZE				(0x58C)
 #define ROT_422_MODE			(0x590)
 
 //REG_DEFAULT
@@ -1955,7 +1941,6 @@ typedef struct dss_csc {
 #define DMA_IN_WIDTH_MAX	(2048)
 #define DMA_IN_HEIGHT_MAX	(8192)
 
-
 #define AFBC_PIC_WIDTH_MIN	(16)
 #define AFBC_PIC_WIDTH_MAX	(8192)
 #define AFBC_PIC_HEIGHT_MIN	(16)
@@ -1999,7 +1984,7 @@ typedef struct dss_csc {
 #define HFBC_PIC_HEIGHT_ROT_MIN	(32)
 #define HFBC_PIC_HEIGHT_MAX	(8196)
 #define HFBC_PIC_HEIGHT_ROT_MAX	(2160)
-#define HFBC_BLOCK0_WIDTH_ALIGN 	(64)
+#define HFBC_BLOCK0_WIDTH_ALIGN	(64)
 #define HFBC_BLOCK0_HEIGHT_ALIGN     (8)
 #define HFBC_BLOCK1_WIDTH_ALIGN	 (32)
 #define HFBC_BLOCK1_HEIGHT_ALIGN   (16)
@@ -2022,154 +2007,154 @@ enum DSS_AFBC_HALF_BLOCK_MODE {
 };
 
 typedef struct dss_rdma {
-	uint32_t oft_x0;
-	uint32_t oft_y0;
-	uint32_t oft_x1;
-	uint32_t oft_y1;
-	uint32_t mask0;
-	uint32_t mask1;
-	uint32_t stretch_size_vrt;
-	uint32_t ctrl;
-	uint32_t tile_scram;
+	u32 oft_x0;
+	u32 oft_y0;
+	u32 oft_x1;
+	u32 oft_y1;
+	u32 mask0;
+	u32 mask1;
+	u32 stretch_size_vrt;
+	u32 ctrl;
+	u32 tile_scram;
 
-	uint32_t data_addr0;
-	uint32_t stride0;
-	uint32_t stretch_stride0;
-	uint32_t data_num0;
+	u32 data_addr0;
+	u32 stride0;
+	u32 stretch_stride0;
+	u32 data_num0;
 
-	uint32_t data_addr1;
-	uint32_t stride1;
-	uint32_t stretch_stride1;
-	uint32_t data_num1;
+	u32 data_addr1;
+	u32 stride1;
+	u32 stretch_stride1;
+	u32 data_num1;
 
-	uint32_t data_addr2;
-	uint32_t stride2;
-	uint32_t stretch_stride2;
-	uint32_t data_num2;
+	u32 data_addr2;
+	u32 stride2;
+	u32 stretch_stride2;
+	u32 data_num2;
 
-	uint32_t ch_rd_shadow;
-	uint32_t ch_ctl;
+	u32 ch_rd_shadow;
+	u32 ch_ctl;
 
-	uint32_t dma_buf_ctrl;
+	u32 dma_buf_ctrl;
 
-	uint32_t vpp_ctrl;
-	uint32_t vpp_mem_ctrl;
+	u32 vpp_ctrl;
+	u32 vpp_mem_ctrl;
 
-	uint32_t afbcd_hreg_hdr_ptr_lo;
-	uint32_t afbcd_hreg_pic_width;
-	uint32_t afbcd_hreg_pic_height;
-	uint32_t afbcd_hreg_format;
-	uint32_t afbcd_ctl;
-	uint32_t afbcd_str;
-	uint32_t afbcd_line_crop;
-	uint32_t afbcd_input_header_stride;
-	uint32_t afbcd_payload_stride;
-	uint32_t afbcd_mm_base_0;
+	u32 afbcd_hreg_hdr_ptr_lo;
+	u32 afbcd_hreg_pic_width;
+	u32 afbcd_hreg_pic_height;
+	u32 afbcd_hreg_format;
+	u32 afbcd_ctl;
+	u32 afbcd_str;
+	u32 afbcd_line_crop;
+	u32 afbcd_input_header_stride;
+	u32 afbcd_payload_stride;
+	u32 afbcd_mm_base_0;
 	//uint32_t afbcd_mm_base_1;
-	uint32_t afbcd_afbcd_payload_pointer;
-	uint32_t afbcd_height_bf_str;
-	uint32_t afbcd_os_cfg;
-	uint32_t afbcd_mem_ctrl;
-	uint32_t afbcd_scramble_mode;
-	uint32_t afbcd_header_pointer_offset;
+	u32 afbcd_afbcd_payload_pointer;
+	u32 afbcd_height_bf_str;
+	u32 afbcd_os_cfg;
+	u32 afbcd_mem_ctrl;
+	u32 afbcd_scramble_mode;
+	u32 afbcd_header_pointer_offset;
 
-	uint32_t hfbcd_hreg_hdr_ptr_l0;
-	uint32_t hfbcd_hreg_pic_width;
-	uint32_t hfbcd_hreg_pic_height;
-	uint32_t hfbcd_line_crop;
-	uint32_t hfbcd_input_header_stride0;
-	uint32_t hfbcd_payload_stride0;
-	uint32_t hfbcd_payload_pointer; //hfbcd_hreg_pld_ptr_l0;
-	uint32_t hfbcd_scramble_mode;
-	uint32_t hfbcd_creg_fbcd_ctrl_mode;
-	uint32_t hfbcd_hreg_hdr_ptr_l1;
-	uint32_t hfbcd_hreg_pld_ptr_l1;
-	uint32_t hfbcd_header_stride1;
-	uint32_t hfbcd_payload_stride1;
-	uint32_t hfbcd_block_type;
-	uint32_t hfbcd_mm_base0_y8;
-	uint32_t hfbcd_mm_base1_c8;
-	uint32_t hfbcd_mm_base2_y2;
-	uint32_t hfbcd_mm_base3_c2;
+	u32 hfbcd_hreg_hdr_ptr_l0;
+	u32 hfbcd_hreg_pic_width;
+	u32 hfbcd_hreg_pic_height;
+	u32 hfbcd_line_crop;
+	u32 hfbcd_input_header_stride0;
+	u32 hfbcd_payload_stride0;
+	u32 hfbcd_payload_pointer; //hfbcd_hreg_pld_ptr_l0;
+	u32 hfbcd_scramble_mode;
+	u32 hfbcd_creg_fbcd_ctrl_mode;
+	u32 hfbcd_hreg_hdr_ptr_l1;
+	u32 hfbcd_hreg_pld_ptr_l1;
+	u32 hfbcd_header_stride1;
+	u32 hfbcd_payload_stride1;
+	u32 hfbcd_block_type;
+	u32 hfbcd_mm_base0_y8;
+	u32 hfbcd_mm_base1_c8;
+	u32 hfbcd_mm_base2_y2;
+	u32 hfbcd_mm_base3_c2;
 
-	uint8_t vpp_used;
-	uint8_t afbc_used;
-	uint8_t hfbcd_used;
+	u8 vpp_used;
+	u8 afbc_used;
+	u8 hfbcd_used;
 } dss_rdma_t;
 
 typedef struct dss_wdma {
-	uint32_t oft_x0;
-	uint32_t oft_y0;
-	uint32_t oft_x1;
-	uint32_t oft_y1;
+	u32 oft_x0;
+	u32 oft_y0;
+	u32 oft_x1;
+	u32 oft_y1;
 
-	uint32_t mask0;
-	uint32_t mask1;
-	uint32_t stretch_size_vrt;
-	uint32_t ctrl;
-	uint32_t tile_scram;
+	u32 mask0;
+	u32 mask1;
+	u32 stretch_size_vrt;
+	u32 ctrl;
+	u32 tile_scram;
 
-	uint32_t sw_mask_en;
-	uint32_t start_mask0;
-	uint32_t end_mask0;
-	uint32_t start_mask1;
-	uint32_t end_mask1;
+	u32 sw_mask_en;
+	u32 start_mask0;
+	u32 end_mask0;
+	u32 start_mask1;
+	u32 end_mask1;
 
-	uint32_t data_addr;
-	uint32_t stride0;
-	uint32_t data1_addr;
-	uint32_t stride1;
+	u32 data_addr;
+	u32 stride0;
+	u32 data1_addr;
+	u32 stride1;
 
-	uint32_t stretch_stride;
-	uint32_t data_num;
+	u32 stretch_stride;
+	u32 data_num;
 
-	uint32_t ch_rd_shadow;
-	uint32_t ch_ctl;
-	uint32_t ch_secu_en;
-	uint32_t ch_sw_end_req;
+	u32 ch_rd_shadow;
+	u32 ch_ctl;
+	u32 ch_secu_en;
+	u32 ch_sw_end_req;
 
-	uint32_t dma_buf_ctrl;
-	uint32_t dma_buf_size;
+	u32 dma_buf_ctrl;
+	u32 dma_buf_size;
 
-	uint32_t rot_size;
+	u32 rot_size;
 
-	uint32_t afbce_hreg_pic_blks;
-	uint32_t afbce_hreg_format;
-	uint32_t afbce_hreg_hdr_ptr_l0;
-	uint32_t afbce_hreg_pld_ptr_l0;
-	uint32_t afbce_picture_size;
-	uint32_t afbce_ctl;
-	uint32_t afbce_header_srtide;
-	uint32_t afbce_payload_stride;
-	uint32_t afbce_enc_os_cfg;
-	uint32_t afbce_mem_ctrl;
-	uint32_t afbce_qos_cfg;
-	uint32_t afbce_threshold;
-	uint32_t afbce_scramble_mode;
-	uint32_t afbce_header_pointer_offset;
+	u32 afbce_hreg_pic_blks;
+	u32 afbce_hreg_format;
+	u32 afbce_hreg_hdr_ptr_l0;
+	u32 afbce_hreg_pld_ptr_l0;
+	u32 afbce_picture_size;
+	u32 afbce_ctl;
+	u32 afbce_header_srtide;
+	u32 afbce_payload_stride;
+	u32 afbce_enc_os_cfg;
+	u32 afbce_mem_ctrl;
+	u32 afbce_qos_cfg;
+	u32 afbce_threshold;
+	u32 afbce_scramble_mode;
+	u32 afbce_header_pointer_offset;
 
-	uint32_t hfbce_hreg_pic_blks;
-	uint32_t hfbce_hreg_hdr_ptr_l0;
-	uint32_t hfbce_hreg_pld_ptr_l0;
-	uint32_t hfbce_picture_size;
-	uint32_t hfbce_scramble_mode;
-	uint32_t hfbce_header_stride0;
-	uint32_t hfbce_payload_stride0;
-	uint32_t hfbce_header_pointer_offset;
-	uint32_t fbce_creg_fbce_ctrl_mode;
-	uint32_t hfbce_hreg_hdr_ptr_l1;
-	uint32_t hfbce_hreg_pld_ptr_l1;
-	uint32_t hfbce_header_stride1;
-	uint32_t hfbce_payload_stride1;
+	u32 hfbce_hreg_pic_blks;
+	u32 hfbce_hreg_hdr_ptr_l0;
+	u32 hfbce_hreg_pld_ptr_l0;
+	u32 hfbce_picture_size;
+	u32 hfbce_scramble_mode;
+	u32 hfbce_header_stride0;
+	u32 hfbce_payload_stride0;
+	u32 hfbce_header_pointer_offset;
+	u32 fbce_creg_fbce_ctrl_mode;
+	u32 hfbce_hreg_hdr_ptr_l1;
+	u32 hfbce_hreg_pld_ptr_l1;
+	u32 hfbce_header_stride1;
+	u32 hfbce_payload_stride1;
 
-	uint8_t afbc_used;
-	uint8_t hfbce_used;
-	uint8_t rot_used;
+	u8 afbc_used;
+	u8 hfbce_used;
+	u8 rot_used;
 } dss_wdma_t;
 
-/*******************************************************************************
-** MCTL  MUTEX0 1 2 3 4 5
-*/
+/*
+ * MCTL  MUTEX0 1 2 3 4 5
+ */
 #define MCTL_CTL_EN	(0x0000)
 #define MCTL_CTL_MUTEX	(0x0004)
 #define MCTL_CTL_MUTEX_STATUS	(0x0008)
@@ -2203,12 +2188,12 @@ typedef struct dss_wdma {
 #define MCTL_CTL_CLK_EN	(0x0084)
 #define MCTL_CTL_DBG	(0x00E0)
 
-/*******************************************************************************
-** MCTL  SYS
-*/
+/*
+ * MCTL  SYS
+ */
 //SECU
 #define MCTL_CTL_SECU_CFG			(0x0000)
-#define MCTL_PAY_SECU_FLUSH_EN  	(0x0018)
+#define MCTL_PAY_SECU_FLUSH_EN	(0x0018)
 #define MCTL_CTL_SECU_GATE0    (0x0080)
 #define MCTL_CTL_SECU_GATE1    (0x0084)
 #define MCTL_CTL_SECU_GATE2    (0x0088)
@@ -2361,33 +2346,33 @@ enum dss_mctl_idx {
 };
 
 typedef struct dss_mctl {
-	uint32_t ctl_mutex_itf;
-	uint32_t ctl_mutex_dbuf;
-	uint32_t ctl_mutex_scf;
-	uint32_t ctl_mutex_ov;
+	u32 ctl_mutex_itf;
+	u32 ctl_mutex_dbuf;
+	u32 ctl_mutex_scf;
+	u32 ctl_mutex_ov;
 } dss_mctl_t;
 
 typedef struct dss_mctl_ch {
-	uint32_t chn_mutex;
-	uint32_t chn_flush_en;
-	uint32_t chn_ov_oen;
-	uint32_t chn_starty;
-	uint32_t chn_mod_dbg;
+	u32 chn_mutex;
+	u32 chn_flush_en;
+	u32 chn_ov_oen;
+	u32 chn_starty;
+	u32 chn_mod_dbg;
 } dss_mctl_ch_t;
 
 typedef struct dss_mctl_sys {
-	uint32_t ov_flush_en[DSS_OVL_IDX_MAX];
-	uint32_t chn_ov_sel[DSS_OVL_IDX_MAX];
-	uint32_t chn_ov_sel1[DSS_OVL_IDX_MAX];
-	uint32_t wchn_ov_sel[DSS_WCH_MAX];
-	uint8_t ov_flush_en_used[DSS_OVL_IDX_MAX];
-	uint8_t chn_ov_sel_used[DSS_OVL_IDX_MAX];
-	uint8_t wch_ov_sel_used[DSS_WCH_MAX];
+	u32 ov_flush_en[DSS_OVL_IDX_MAX];
+	u32 chn_ov_sel[DSS_OVL_IDX_MAX];
+	u32 chn_ov_sel1[DSS_OVL_IDX_MAX];
+	u32 wchn_ov_sel[DSS_WCH_MAX];
+	u8 ov_flush_en_used[DSS_OVL_IDX_MAX];
+	u8 chn_ov_sel_used[DSS_OVL_IDX_MAX];
+	u8 wch_ov_sel_used[DSS_WCH_MAX];
 } dss_mctl_sys_t;
 
-/*******************************************************************************
-** OVL ES
-*/
+/*
+ * OVL ES
+ */
 #define OVL_SIZE	(0x0000)
 #define OVL_BG_COLOR	(0x4)
 #define OVL_DST_STARTPOS	(0x8)
@@ -2534,7 +2519,6 @@ typedef struct dss_mctl_sys {
 #define OVL2_BLOCK_DBG	(0xB4)
 #define OVL2_REG_DEFAULT	(0xB8)
 
-
 /* LAYER0_CFG */
 #define BIT_OVL_LAYER_SRC_CFG	BIT(8)
 #define BIT_OVL_LAYER_ENABLE	BIT(0)
@@ -2546,101 +2530,99 @@ typedef struct dss_mctl_sys {
 /* LAYER0_INFO_SRCCOLOR */
 #define BIT_OVL_LAYER_SRCCOLOR_FLAG	BIT(0)
 
-
 #define OVL_6LAYER_NUM		(6)
 #define OVL_2LAYER_NUM		(2)
 
-/*******************************************************************************
-** OVL
-*/
+/*
+ * OVL
+ */
 #define OV_SIZE						(0x000)
-#define OV_BG_COLOR_RGB 			(0x004)
-#define OV_BG_COLOR_A 				(0x008)
-#define OV_DST_STARTPOS 			(0x00C)
-#define OV_DST_ENDPOS 				(0x010)
-#define OV_GCFG 					(0x014)
-#define OV_LAYER0_POS 				(0x030)
-#define OV_LAYER0_SIZE 				(0x034)
+#define OV_BG_COLOR_RGB			(0x004)
+#define OV_BG_COLOR_A				(0x008)
+#define OV_DST_STARTPOS			(0x00C)
+#define OV_DST_ENDPOS				(0x010)
+#define OV_GCFG					(0x014)
+#define OV_LAYER0_POS				(0x030)
+#define OV_LAYER0_SIZE				(0x034)
 #define OV_LAYER0_SRCLOKEY		(0x038)
-#define OV_LAYER0_SRCHIKEY 		(0x03C)
-#define OV_LAYER0_DSTLOKEY 		(0x040)
-#define OV_LAYER0_DSTHIKEY 		(0x044)
-#define OV_LAYER0_PATTERN_RGB 	(0x048)
-#define OV_LAYER0_PATTERN_A 		(0x04C)
-#define OV_LAYER0_ALPHA_MODE 		(0x050)
-#define OV_LAYER0_ALPHA_A 			(0x054)
-#define OV_LAYER0_CFG 				(0x058)
-#define OV_LAYER0_PSPOS 			(0x05C)
-#define OV_LAYER0_PEPOS 			(0x060)
-#define OV_LAYER0_INFO_ALPHA 		(0x064)
-#define OV_LAYER0_INFO_SRCCOLOR 	(0x068)
-#define OV_LAYER0_DBG_INFO 		(0x06C)
+#define OV_LAYER0_SRCHIKEY		(0x03C)
+#define OV_LAYER0_DSTLOKEY		(0x040)
+#define OV_LAYER0_DSTHIKEY		(0x044)
+#define OV_LAYER0_PATTERN_RGB	(0x048)
+#define OV_LAYER0_PATTERN_A		(0x04C)
+#define OV_LAYER0_ALPHA_MODE		(0x050)
+#define OV_LAYER0_ALPHA_A			(0x054)
+#define OV_LAYER0_CFG				(0x058)
+#define OV_LAYER0_PSPOS			(0x05C)
+#define OV_LAYER0_PEPOS			(0x060)
+#define OV_LAYER0_INFO_ALPHA		(0x064)
+#define OV_LAYER0_INFO_SRCCOLOR	(0x068)
+#define OV_LAYER0_DBG_INFO		(0x06C)
 #define OV8_BASE_DBG_INFO			(0x340)
 #define OV8_RD_SHADOW_SEL			(0x344)
 #define OV8_CLK_SEL					(0x348)
-#define OV8_CLK_EN 					(0x34C)
-#define OV8_BLOCK_SIZE 				(0x350)
-#define OV8_BLOCK_DBG 				(0x354)
-#define OV8_REG_DEFAULT 			(0x358)
+#define OV8_CLK_EN					(0x34C)
+#define OV8_BLOCK_SIZE				(0x350)
+#define OV8_BLOCK_DBG				(0x354)
+#define OV8_REG_DEFAULT			(0x358)
 #define OV2_BASE_DBG_INFO			(0x200)
 #define OV2_RD_SHADOW_SEL			(0x204)
 #define OV2_CLK_SEL					(0x208)
-#define OV2_CLK_EN 					(0x20C)
-#define OV2_BLOCK_SIZE 				(0x210)
-#define OV2_BLOCK_DBG 				(0x214)
-#define OV2_REG_DEFAULT 			(0x218)
+#define OV2_CLK_EN					(0x20C)
+#define OV2_BLOCK_SIZE				(0x210)
+#define OV2_BLOCK_DBG				(0x214)
+#define OV2_REG_DEFAULT			(0x218)
 
 #define OV_8LAYER_NUM				(8)
 
 typedef struct dss_ovl_layer {
-	uint32_t layer_pos;
-	uint32_t layer_size;
-	uint32_t layer_pattern;
-	uint32_t layer_pattern_alpha;
-	uint32_t layer_alpha_a;
-	uint32_t layer_alpha;
-	uint32_t layer_cfg;
+	u32 layer_pos;
+	u32 layer_size;
+	u32 layer_pattern;
+	u32 layer_pattern_alpha;
+	u32 layer_alpha_a;
+	u32 layer_alpha;
+	u32 layer_cfg;
 } dss_ovl_layer_t;
 
 typedef struct dss_ovl_layer_pos {
-	uint32_t layer_pspos;
-	uint32_t layer_pepos;
+	u32 layer_pspos;
+	u32 layer_pepos;
 } dss_ovl_layer_pos_t;
 
 typedef struct dss_ovl {
-	uint32_t ovl_size;
-	uint32_t ovl_bg_color;
-	uint32_t ovl_bg_color_alpha;
-	uint32_t ovl_dst_startpos;
-	uint32_t ovl_dst_endpos;
-	uint32_t ovl_gcfg;
-	uint32_t ovl_block_size;
+	u32 ovl_size;
+	u32 ovl_bg_color;
+	u32 ovl_bg_color_alpha;
+	u32 ovl_dst_startpos;
+	u32 ovl_dst_endpos;
+	u32 ovl_gcfg;
+	u32 ovl_block_size;
 	dss_ovl_layer_t ovl_layer[OV_8LAYER_NUM];
 	dss_ovl_layer_pos_t ovl_layer_pos[OV_8LAYER_NUM];
-	uint8_t ovl_layer_used[OV_8LAYER_NUM];
+	u8 ovl_layer_used[OV_8LAYER_NUM];
 } dss_ovl_t;
 
 typedef struct dss_ovl_alpha {
-	uint32_t src_amode;
-	uint32_t src_gmode;
-	uint32_t alpha_offsrc;
-	uint32_t src_lmode;
-	uint32_t src_pmode;
+	u32 src_amode;
+	u32 src_gmode;
+	u32 alpha_offsrc;
+	u32 src_lmode;
+	u32 src_pmode;
 
-	uint32_t alpha_smode;
+	u32 alpha_smode;
 
-	uint32_t dst_amode;
-	uint32_t dst_gmode;
-	uint32_t alpha_offdst;
-	uint32_t dst_pmode;
+	u32 dst_amode;
+	u32 dst_gmode;
+	u32 alpha_offdst;
+	u32 dst_pmode;
 
-	uint32_t fix_mode;
+	u32 fix_mode;
 } dss_ovl_alpha_t;
 
-
-/*******************************************************************************
-** DBUF
-*/
+/*
+ * DBUF
+ */
 #define DBUF_FRM_SIZE	(0x0000)
 #define DBUF_FRM_HSIZE	(0x0004)
 #define DBUF_SRAM_VALID_NUM	(0x0008)
@@ -2665,7 +2647,7 @@ typedef struct dss_ovl_alpha {
 #define DBUF_MEM_CTRL	(0x0054)
 #define DBUF_PM_CTRL	(0x0058)
 #define DBUF_CLK_SEL	(0x005C)
-#define DBUF_CLK_EN  	(0x0060)
+#define DBUF_CLK_EN	(0x0060)
 #define DBUF_THD_FLUX_REQ_AFT (0x0064)
 #define DBUF_THD_DFS_OK (0x0068)
 #define DBUF_FLUX_REQ_CTRL (0x006C)
@@ -2673,9 +2655,9 @@ typedef struct dss_ovl_alpha {
 #define DBUF_DFS_RAM_MANAGE  (0x00A8)
 #define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
 
-/*******************************************************************************
-** SBL
-*/
+/*
+ * SBL
+ */
 //SBL FOR ES
 #define SBL_REG_FRMT_MODE_ES                          (0x0000)
 #define SBL_REG_FRMT_DBUF_CTRL_ES                     (0x0008)
@@ -3008,9 +2990,9 @@ typedef struct dss_sbl {
 #define SBL_VC_ANTI_FLCKR_AL_ANTI_FLCKR_T_DURATION         (0x03a8)
 #define SBL_VC_ANTI_FLCKR_ALPHA                            (0x03ac)
 
-/*******************************************************************************
-** DPP
-*/
+/*
+ * DPP
+ */
 //DPP TOP
 #define DPP_RD_SHADOW_SEL	(0x000)
 #define DPP_DEFAULT	(0x004)
@@ -3034,7 +3016,6 @@ typedef struct dss_sbl {
 //#define DPP_ARSR1P	(0x048)
 #define DPP_DBG_CNT  DPP_DBG1_CNT
 
-
 //COLORBAR
 #define DPP_CLRBAR_CTRL (0x100)
 #define DPP_CLRBAR_1ST_CLR (0x104)
@@ -3120,8 +3101,6 @@ typedef struct dss_sbl {
 #define DITHER_DBG1_ES (0x034)
 #define DITHER_DBG2_ES (0x038)
 
-
-
 //CSC_RGB2YUV_10bits  CSC_YUV2RGB_10bits
 #define CSC10B_IDC0	(0x000)
 #define CSC10B_IDC1	(0x004)
@@ -3194,7 +3173,6 @@ typedef struct dss_sbl {
 #define ACM_DEBUG_CFG_ES     (0x0A8)
 #define ACM_DEBUG_W_ES       (0x0AC)
 
-
 //ACM
 #define ACM_EN	(0x000)
 #define ACM_SATA_OFFSET	(0x004)
@@ -3319,11 +3297,11 @@ typedef struct dss_sbl {
 #define ACE_Y_EXT	(0x03C)
 #define ACE_U_EXT	(0x040)
 #define ACE_V_EXT	(0x044)
-#define ACE_Y_ATTENU 	(0x048)
+#define ACE_Y_ATTENU	(0x048)
 #define ACE_U_ATTENU	(0x04C)
 #define ACE_V_ATTENU	(0x050)
 #define ACE_ROTA	(0x054)
-#define ACE_ROTB 	(0x058)
+#define ACE_ROTB	(0x058)
 #define ACE_Y_CORE	(0x05C)
 #define ACE_U_CORE	(0x060)
 #define ACE_V_CORE	(0x064)
@@ -3379,99 +3357,98 @@ typedef struct dss_sbl {
 #define GMP_DBG_R2 (0x018)
 
 //ARSR1P ES
-#define ARSR1P_IHLEFT_ES             	(0x000)
+#define ARSR1P_IHLEFT_ES		(0x000)
 #define ARSR1P_IHRIGHT_ES          (0x004)
 #define ARSR1P_IHLEFT1_ES          (0x008)
 #define ARSR1P_IHRIGHT1_ES         (0x00C)
 #define ARSR1P_IVTOP_ES            (0x010)
 #define ARSR1P_IVBOTTOM_ES         (0x014)
-#define ARSR1P_UV_OFFSET_ES          	(0x018)
+#define ARSR1P_UV_OFFSET_ES		(0x018)
 #define ARSR1P_IHINC_ES            (0x01C)
 #define ARSR1P_IVINC_ES            (0x020)
-#define ARSR1P_MODE_ES               	(0x024)
+#define ARSR1P_MODE_ES		(0x024)
 #define ARSR1P_FORMAT_ES           (0x028)
-#define ARSR1P_SKIN_THRES_Y_ES       	(0x02C)
-#define ARSR1P_SKIN_THRES_U_ES       	(0x030)
-#define ARSR1P_SKIN_THRES_V_ES       	(0x034)
+#define ARSR1P_SKIN_THRES_Y_ES	(0x02C)
+#define ARSR1P_SKIN_THRES_U_ES	(0x030)
+#define ARSR1P_SKIN_THRES_V_ES	(0x034)
 #define ARSR1P_SKIN_EXPECTED_ES    (0x038)
-#define ARSR1P_SKIN_CFG_ES           	(0x03C)
-#define ARSR1P_SHOOT_CFG1_ES         	(0x040)
-#define ARSR1P_SHOOT_CFG2_ES         	(0x044)
-#define ARSR1P_SHARP_CFG1_ES         	(0x048)
-#define ARSR1P_SHARP_CFG2_ES         	(0x04C)
-#define ARSR1P_SHARP_CFG3_ES         	(0x050)
-#define ARSR1P_SHARP_CFG4_ES         	(0x054)
-#define ARSR1P_SHARP_CFG5_ES         	(0x058)
-#define ARSR1P_SHARP_CFG6_ES         	(0x05C)
-#define ARSR1P_SHARP_CFG7_ES         	(0x060)
-#define ARSR1P_SHARP_CFG8_ES         	(0x064)
-#define ARSR1P_SHARP_CFG9_ES         	(0x068)
-#define ARSR1P_SHARP_CFG10_ES        	(0x06C)
-#define ARSR1P_SHARP_CFG11_ES        	(0x070)
-#define ARSR1P_DIFF_CTRL_ES          	(0x074)
+#define ARSR1P_SKIN_CFG_ES		(0x03C)
+#define ARSR1P_SHOOT_CFG1_ES		(0x040)
+#define ARSR1P_SHOOT_CFG2_ES		(0x044)
+#define ARSR1P_SHARP_CFG1_ES		(0x048)
+#define ARSR1P_SHARP_CFG2_ES		(0x04C)
+#define ARSR1P_SHARP_CFG3_ES		(0x050)
+#define ARSR1P_SHARP_CFG4_ES		(0x054)
+#define ARSR1P_SHARP_CFG5_ES		(0x058)
+#define ARSR1P_SHARP_CFG6_ES		(0x05C)
+#define ARSR1P_SHARP_CFG7_ES		(0x060)
+#define ARSR1P_SHARP_CFG8_ES		(0x064)
+#define ARSR1P_SHARP_CFG9_ES		(0x068)
+#define ARSR1P_SHARP_CFG10_ES		(0x06C)
+#define ARSR1P_SHARP_CFG11_ES		(0x070)
+#define ARSR1P_DIFF_CTRL_ES		(0x074)
 #define ARSR1P_LSC_CFG1_ES         (0x078)
 #define ARSR1P_LSC_CFG2_ES         (0x07C)
 #define ARSR1P_LSC_CFG3_ES         (0x080)
-#define ARSR1P_FORCE_CLK_ON_CFG_ES   	(0x084)
-
+#define ARSR1P_FORCE_CLK_ON_CFG_ES	(0x084)
 
 //ARSR1P
 typedef struct dss_arsr1p {
-	uint32_t ihleft;
-	uint32_t ihright;
-	uint32_t ihleft1;
-	uint32_t ihright1;
-	uint32_t ivtop;
-	uint32_t ivbottom;
-	uint32_t uv_offset;
-	uint32_t ihinc;
-	uint32_t ivinc;
-	uint32_t mode;
-	uint32_t format;
+	u32 ihleft;
+	u32 ihright;
+	u32 ihleft1;
+	u32 ihright1;
+	u32 ivtop;
+	u32 ivbottom;
+	u32 uv_offset;
+	u32 ihinc;
+	u32 ivinc;
+	u32 mode;
+	u32 format;
 
-	uint32_t skin_thres_y;
-	uint32_t skin_thres_u;
-	uint32_t skin_thres_v;
-	uint32_t skin_expected;
-	uint32_t skin_cfg;
-	uint32_t shoot_cfg1;
-	uint32_t shoot_cfg2;
-	uint32_t shoot_cfg3;
-	uint32_t sharp_cfg1_h;
-	uint32_t sharp_cfg1_l;
-	uint32_t sharp_cfg2_h;
-	uint32_t sharp_cfg2_l;
-	uint32_t sharp_cfg3;
-	uint32_t sharp_cfg4;
-	uint32_t sharp_cfg5;
-	uint32_t sharp_cfg6;
-	uint32_t sharp_cfg6_cut;
-	uint32_t sharp_cfg7;
-	uint32_t sharp_cfg7_ratio;
-	uint32_t sharp_cfg8;
-	uint32_t sharp_cfg9;
-	uint32_t sharp_cfg10;
-	uint32_t sharp_cfg11;
-	uint32_t diff_ctrl;
-	uint32_t skin_slop_y;
-	uint32_t skin_slop_u;
-	uint32_t skin_slop_v;
-	uint32_t force_clk_on_cfg;
+	u32 skin_thres_y;
+	u32 skin_thres_u;
+	u32 skin_thres_v;
+	u32 skin_expected;
+	u32 skin_cfg;
+	u32 shoot_cfg1;
+	u32 shoot_cfg2;
+	u32 shoot_cfg3;
+	u32 sharp_cfg1_h;
+	u32 sharp_cfg1_l;
+	u32 sharp_cfg2_h;
+	u32 sharp_cfg2_l;
+	u32 sharp_cfg3;
+	u32 sharp_cfg4;
+	u32 sharp_cfg5;
+	u32 sharp_cfg6;
+	u32 sharp_cfg6_cut;
+	u32 sharp_cfg7;
+	u32 sharp_cfg7_ratio;
+	u32 sharp_cfg8;
+	u32 sharp_cfg9;
+	u32 sharp_cfg10;
+	u32 sharp_cfg11;
+	u32 diff_ctrl;
+	u32 skin_slop_y;
+	u32 skin_slop_u;
+	u32 skin_slop_v;
+	u32 force_clk_on_cfg;
 
-	uint32_t dbuf_frm_size;
-	uint32_t dbuf_frm_hsize;
-	uint32_t dbuf_used;
+	u32 dbuf_frm_size;
+	u32 dbuf_frm_hsize;
+	u32 dbuf_used;
 
-	uint32_t dpp_img_size_bef_sr;
-	uint32_t dpp_img_size_aft_sr;
-	uint32_t dpp_used;
+	u32 dpp_img_size_bef_sr;
+	u32 dpp_img_size_aft_sr;
+	u32 dpp_used;
 
 	//for ES
-	uint32_t sharp_cfg1;
-	uint32_t sharp_cfg2;
-	uint32_t lsc_cfg1;
-	uint32_t lsc_cfg2;
-	uint32_t lsc_cfg3;
+	u32 sharp_cfg1;
+	u32 sharp_cfg2;
+	u32 lsc_cfg1;
+	u32 lsc_cfg2;
+	u32 lsc_cfg3;
 
 } dss_arsr1p_t;
 
@@ -3523,10 +3500,9 @@ typedef struct dss_arsr1p {
 #define ARSR_POST_DEBUG_RO_1 (0x0AC)
 #define ARSR_POST_DEBUG_RO_2 (0x0B0)
 
-
-/*******************************************************************************
-** BIT EXT
-*/
+/*
+ * BIT EXT
+ */
 //#define BIT_EXT0_CTL (0x000)
 
 //GAMA LUT
@@ -3750,10 +3726,9 @@ typedef struct dss_arsr1p {
 #define DPE_NR_RAM_A_CFG_MEM_CTRL (0x0498)
 #define DPE_NR_RAM_A_CFG_PM_CTRL (0x049c)
 
-
-/*******************************************************************************
-** IFBC
-*/
+/*
+ * IFBC
+ */
 #define IFBC_SIZE	(0x0000)
 #define IFBC_CTRL	(0x0004)
 #define IFBC_HIMAX_CTRL0	(0x0008)
@@ -3776,10 +3751,9 @@ typedef struct dss_arsr1p {
 #define IFBC_PAD	(0x004C)
 #define IFBC_REG_DEFAULT	(0x0050)
 
-
-/*******************************************************************************
-** DSC
-*/
+/*
+ * DSC
+ */
 #define DSC_VERSION	(0x0000)
 #define DSC_PPS_IDENTIFIER	(0x0004)
 #define DSC_EN	(0x0008)
@@ -3828,10 +3802,9 @@ typedef struct dss_arsr1p {
 #define DSC_RD_SHADOW_SEL	(0x00B4)
 #define DSC_REG_DEFAULT	(0x00B8)
 
-
-/*******************************************************************************
-** LDI
-*/
+/*
+ * LDI
+ */
 #define LDI_DPI0_HRZ_CTRL0	(0x0000)
 #define LDI_DPI0_HRZ_CTRL1	(0x0004)
 #define LDI_DPI0_HRZ_CTRL2	(0x0008)
@@ -3858,7 +3831,7 @@ typedef struct dss_arsr1p {
 #define LDI_CMD_EVENT_SEL	(0x0060)
 #define LDI_SRAM_LP_CTRL	(0x0064)
 #define LDI_ITF_RD_SHADOW	(0x006C)
-#define LDI_DP_DSI_SEL 		(0x0080)
+#define LDI_DP_DSI_SEL		(0x0080)
 #define LDI_DPI1_HRZ_CTRL0	(0x00F0)
 #define LDI_DPI1_HRZ_CTRL1	(0x00F4)
 #define LDI_DPI1_HRZ_CTRL2	(0x00F8)
@@ -3888,10 +3861,9 @@ typedef struct dss_arsr1p {
 #define LDI_MODULE_CLK_SEL (0x0258)
 #define LDI_MODULE_CLK_EN (0x025C)
 
-
-/*******************************************************************************
-** MIPI DSI
-*/
+/*
+ * MIPI DSI
+ */
 #define MIPIDSI_VERSION_OFFSET	(0x0000)
 #define MIPIDSI_PWR_UP_OFFSET	(0x0004)
 #define MIPIDSI_CLKMGR_CFG_OFFSET	(0x0008)
@@ -3955,9 +3927,9 @@ typedef struct dss_arsr1p {
 #define MIPIDSI_INT_MSK1_OFFSET	(0x00c8)
 #define INT_FORCE0	(0x00D8)
 #define INT_FORCE1	(0x00DC)
-#define AUTO_ULPS_MODE 	(0x00E0)
-#define AUTO_ULPS_ENTER_DELAY 	(0x00E4)
-#define AUTO_ULPS_WAKEUP_TIME 	(0x00E8)
+#define AUTO_ULPS_MODE	(0x00E0)
+#define AUTO_ULPS_ENTER_DELAY	(0x00E4)
+#define AUTO_ULPS_WAKEUP_TIME	(0x00E8)
 #define MIPIDSI_DSC_PARAMETER_OFFSET	(0x00F0)
 #define MIPIDSI_PHY_TMR_RD_CFG_OFFSET	(0x00F4)
 #define AUTO_ULPS_MIN_TIME  (0xF8)
@@ -3982,9 +3954,9 @@ typedef struct dss_arsr1p {
 #define DSI_PM_CTRL  (0x0198)
 #define DSI_DEBUG  (0x019C)
 
-/*******************************************************************************
-** MMBUF
-*/
+/*
+ * MMBUF
+ */
 #define SMC_LOCK	(0x0000)
 #define SMC_MEM_LP	(0x0004)
 #define SMC_GCLK_CS	(0x000C)
@@ -4106,12 +4078,12 @@ struct dss_hw_ctx {
 };
 
 typedef struct dss_clk_rate {
-	uint64_t dss_pri_clk_rate;
-	uint64_t dss_pclk_dss_rate;
-	uint64_t dss_pclk_pctrl_rate;
-	uint64_t dss_mmbuf_rate;
-	uint32_t dss_voltage_value; //0:0.7v, 2:0.8v
-	uint32_t reserved;
+	u64 dss_pri_clk_rate;
+	u64 dss_pclk_dss_rate;
+	u64 dss_pclk_pctrl_rate;
+	u64 dss_mmbuf_rate;
+	u32 dss_voltage_value; //0:0.7v, 2:0.8v
+	u32 reserved;
 } dss_clk_rate_t;
 
 struct dss_crtc {
@@ -4233,9 +4205,8 @@ typedef struct mipi_ifbc_division {
 	u32 pxl0_dsi_gt_en;
 } mipi_ifbc_division_t;
 
-/*******************************************************************************
-**
-*/
+/*****************************************************************************/
+
 #define outp32(addr, val) writel(val, addr)
 #define outp16(addr, val) writew(val, addr)
 #define outp8(addr, val) writeb(val, addr)
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index fa317be188e0..8f07fabeee8c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -17,79 +17,103 @@
 
 #include "kirin9xx_drm_dpe_utils.h"
 
-int g_debug_set_reg_val = 0;
+static int g_debug_set_reg_val;
 
 DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
 
-extern u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
-
-mipi_ifbc_division_t g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
+struct mipi_ifbc_division g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
 	/*single mipi*/
 	{
-		/*none*/
-		{XRES_DIV_1, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_0, PXL0_DSI_GT_EN_1},
-		/*orise2x*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*orise3x*/
-		{XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_1, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3},
-		/*himax2x*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_2, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*rsp2x*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_3, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*rsp3x  [NOTE]reality: xres_div = 1.5, yres_div = 2, amended in "mipi_ifbc_get_rect" function*/
-		{XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_4, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3},
-		/*vesa2x_1pipe*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*vesa3x_1pipe*/
-		{XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3},
-		/*vesa2x_2pipe*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*vesa3x_2pipe*/
-		{XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3}
-	},
+			/*none*/
+		{
+			XRES_DIV_1, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_0, PXL0_DSI_GT_EN_1
+		}, {
+			/*orise2x*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*orise3x*/
+			XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_1, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3
+		}, {
+			/*himax2x*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_2, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*rsp2x*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_3, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*
+			 * rsp3x
+			 * NOTE: in reality: xres_div = 1.5, yres_div = 2,
+			 * amended in "mipi_ifbc_get_rect" function
+			 */
+			XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_4, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa2x_1pipe*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa3x_1pipe*/
+			XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa2x_2pipe*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa3x_2pipe*/
+			XRES_DIV_3, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_2, PXL0_DSI_GT_EN_3
+		}
 
 	/*dual mipi*/
-	{
-		/*none*/
-		{XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3},
-		/*orise2x*/
-		{XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3},
-		/*orise3x*/
-		{XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_1, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3},
-		/*himax2x*/
-		{XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_2, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3},
-		/*rsp2x*/
-		{XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_3, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3},
-		/*rsp3x*/
-		{XRES_DIV_3, YRES_DIV_2, IFBC_COMP_MODE_4, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3},
-		/*vesa2x_1pipe*/
-		{XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3},
-		/*vesa3x_1pipe*/
-		{XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3},
-		/*vesa2x_2pipe*/
-		{XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3},
-		/*vesa3x_2pipe*/
-		{XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
-			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, 3} }
+	}, {
+		{
+			/*none*/
+			XRES_DIV_2, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_1, PXL0_DSI_GT_EN_3
+		}, {
+			/*orise2x*/
+			XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_0, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3
+		}, {
+			/*orise3x*/
+			XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_1, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3
+		}, {
+			/*himax2x*/
+			XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_2, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3
+		}, {
+			/*rsp2x*/
+			XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_3, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3
+		}, {
+			/*rsp3x*/
+			XRES_DIV_3, YRES_DIV_2, IFBC_COMP_MODE_4, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_OPEN, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa2x_1pipe*/
+			XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa3x_1pipe*/
+			XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_5, PXL0_DIV2_GT_EN_CLOSE,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa2x_2pipe*/
+			XRES_DIV_4, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_3, PXL0_DSI_GT_EN_3
+		}, {
+			/*vesa3x_2pipe*/
+			XRES_DIV_6, YRES_DIV_1, IFBC_COMP_MODE_6, PXL0_DIV2_GT_EN_OPEN,
+			PXL0_DIV4_GT_EN_CLOSE, PXL0_DIVCFG_5, 3
+		}
+	}
 };
 
 void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs)
@@ -104,14 +128,14 @@ void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs)
 
 	if (g_debug_set_reg_val) {
 		printk(KERN_INFO "writel: [%p] = 0x%x\n", addr,
-			     tmp | ((val & mask) << bs));
+		       tmp | ((val & mask) << bs));
 	}
 }
 
-uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs)
+u32 set_bits32(u32 old_val, uint32_t val, uint8_t bw, uint8_t bs)
 {
-	uint32_t mask = (1UL << bw) - 1UL;
-	uint32_t tmp = 0;
+	u32 mask = (1UL << bw) - 1UL;
+	u32 tmp = 0;
 
 	tmp = old_val;
 	tmp &= ~(mask << bs);
@@ -139,9 +163,10 @@ static int mipi_ifbc_get_rect(struct dss_rect *rect)
 		DRM_ERROR("yres(%d) is not division_v(%d) pixel aligned!\n", rect->h, yres_div);
 
 	/*
-	** [NOTE] rsp3x && single_mipi CMD mode amended xres_div = 1.5, yres_div = 2 ,
-	** VIDEO mode amended xres_div = 3, yres_div = 1
-	*/
+	 * NOTE: rsp3x && single_mipi CMD mode amended xres_div = 1.5,
+	 *  yres_div = 2,
+	 * VIDEO mode amended xres_div = 3, yres_div = 1
+	 */
 	rect->w /= xres_div;
 	rect->h /= yres_div;
 
@@ -225,7 +250,7 @@ void init_ldi(struct dss_crtc *acrtc)
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
-		return ;
+		return;
 	}
 
 	mode = &acrtc->base.state->mode;
@@ -249,16 +274,16 @@ void init_ldi(struct dss_crtc *acrtc)
 	init_ldi_pxl_div(acrtc);
 
 	outp32(ldi_base + LDI_DPI0_HRZ_CTRL0,
-		hfp | ((hbp + DSS_WIDTH(hsw)) << 16));
+	       hfp | ((hbp + DSS_WIDTH(hsw)) << 16));
 	outp32(ldi_base + LDI_DPI0_HRZ_CTRL1, 0);
 	outp32(ldi_base + LDI_DPI0_HRZ_CTRL2, DSS_WIDTH(rect.w));
 	outp32(ldi_base + LDI_VRT_CTRL0,
-		vfp | (vbp << 16));
+	       vfp | (vbp << 16));
 	outp32(ldi_base + LDI_VRT_CTRL1, DSS_HEIGHT(vsw));
 	outp32(ldi_base + LDI_VRT_CTRL2, DSS_HEIGHT(rect.h));
 
 	outp32(ldi_base + LDI_PLR_CTRL,
-		vsync_plr | (hsync_plr << 1) |
+	       vsync_plr | (hsync_plr << 1) |
 		(pixelclk_plr << 2) | (data_en_plr << 3));
 
 	/* bpp*/
@@ -292,7 +317,7 @@ void deinit_ldi(struct dss_crtc *acrtc)
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
-		return ;
+		return;
 	}
 
 	ldi_base = ctx->base + DSS_LDI0_OFFSET;
@@ -389,12 +414,12 @@ void init_dbuf(struct dss_crtc *acrtc)
 		mode->vdisplay);
 
 	/*
-	** int K = 0;
-	** int Tp = 1000000  / adj_mode->clock;
-	** K = (hsw + hbp + mode->hdisplay +
-	**	hfp) / mode->hdisplay;
-	** thd_cg_out = dfs_time / (Tp * K * 6);
-	*/
+	 * int K = 0;
+	 * int Tp = 1000000  / adj_mode->clock;
+	 * K = (hsw + hbp + mode->hdisplay +
+	 *	hfp) / mode->hdisplay;
+	 * thd_cg_out = dfs_time / (Tp * K * 6);
+	 */
 	thd_cg_out = (dfs_time * adj_mode->clock * 1000UL * mode->hdisplay) /
 		(((hsw + hbp + hfp) + mode->hdisplay) * 6 * 1000000UL);
 
@@ -457,9 +482,8 @@ void init_dbuf(struct dss_crtc *acrtc)
 	outp32(dbuf_base + DBUF_FLUX_REQ_CTRL, (dfs_ok_mask << 1) | thd_flux_req_sw_en);
 
 	outp32(dbuf_base + DBUF_DFS_LP_CTRL, 0x1);
-	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
 		outp32(dbuf_base + DBUF_DFS_RAM_MANAGE, dfs_ram);
-	}
 }
 
 void init_dpp(struct dss_crtc *acrtc)
@@ -483,9 +507,9 @@ void init_dpp(struct dss_crtc *acrtc)
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 
 	outp32(dpp_base + DPP_IMG_SIZE_BEF_SR,
-		(DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
+	       (DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
 	outp32(dpp_base + DPP_IMG_SIZE_AFT_SR,
-		(DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
+	       (DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
 }
 
 void enable_ldi(struct dss_crtc *acrtc)
@@ -577,7 +601,6 @@ void dpe_interrupt_unmask(struct dss_crtc *acrtc)
 	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_END | BIT_LDI_UNFLOW);
 
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, unmask);
-
 }
 
 void dpe_interrupt_mask(struct dss_crtc *acrtc)
@@ -589,7 +612,7 @@ void dpe_interrupt_mask(struct dss_crtc *acrtc)
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
-		return ;
+		return;
 	}
 
 	dss_base = ctx->base;
@@ -660,7 +683,7 @@ void dpe_check_itf_status(struct dss_crtc *acrtc)
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
-		return ;
+		return;
 	}
 
 	itf_idx = 0;
@@ -672,15 +695,13 @@ void dpe_check_itf_status(struct dss_crtc *acrtc)
 			is_timeout = (delay_count > 100) ? true : false;
 			delay_count = 0;
 			break;
-		} else {
-			mdelay(1);
-			++delay_count;
 		}
+		mdelay(1);
+		++delay_count;
 	}
 
-	if (is_timeout) {
+	if (is_timeout)
 		DRM_DEBUG_DRIVER("mctl_itf%d not in idle status,ints=0x%x !\n", itf_idx, tmp);
-	}
 }
 
 void dss_inner_clk_pdp_disable(struct dss_hw_ctx *ctx)
@@ -708,9 +729,9 @@ void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 {
 	char __iomem *dss_base;
 
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL Pointer!\n");
-		return ;
+		return;
 	}
 
 	dss_base = ctx->base;
@@ -815,7 +836,7 @@ int dpe_common_clk_enable(struct dss_hw_ctx *ctx)
 	int ret = 0;
 	struct clk *clk_tmp = NULL;
 
-	if (ctx == NULL) {
+	if (!ctx) {
 		DRM_ERROR("ctx is NULL point!\n");
 		return -EINVAL;
 	}
@@ -872,7 +893,7 @@ int dpe_common_clk_disable(struct dss_hw_ctx *ctx)
 {
 	struct clk *clk_tmp = NULL;
 
-	if (ctx == NULL) {
+	if (!ctx) {
 		DRM_ERROR("ctx is NULL point!\n");
 		return -EINVAL;
 	}
@@ -903,7 +924,7 @@ int dpe_inner_clk_enable(struct dss_hw_ctx *ctx)
 	int ret = 0;
 	struct clk *clk_tmp = NULL;
 
-	if (ctx == NULL) {
+	if (!ctx) {
 		DRM_ERROR("ctx is NULL point!\n");
 		return -EINVAL;
 	}
@@ -945,7 +966,7 @@ int dpe_inner_clk_disable(struct dss_hw_ctx *ctx)
 {
 	struct clk *clk_tmp = NULL;
 
-	if (ctx == NULL) {
+	if (!ctx) {
 		DRM_ERROR("ctx is NULL point!\n");
 		return -EINVAL;
 	}
@@ -970,7 +991,7 @@ int dpe_regulator_enable(struct dss_hw_ctx *ctx)
 	int ret = 0;
 
 	DRM_INFO("enabling DPE regulator\n");
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL ptr.\n");
 		return -EINVAL;
 	}
@@ -981,7 +1002,7 @@ int dpe_regulator_enable(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-	DRM_INFO("-. \n");
+	DRM_INFO("-.\n");
 
 	return ret;
 }
@@ -990,12 +1011,12 @@ int dpe_regulator_disable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
 
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL ptr.\n");
 		return -EINVAL;
 	}
 
-	#if defined (CONFIG_DRM_HISI_KIRIN970)
+	#if defined(CONFIG_DRM_HISI_KIRIN970)
 		dpe_set_pixel_clk_rate_on_pll0(ctx);
 		dpe_set_common_clk_rate_on_pll0(ctx);
 	#endif
@@ -1013,15 +1034,14 @@ int mediacrg_regulator_enable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
 
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL ptr.\n");
 		return -EINVAL;
 	}
 
 	//ret = regulator_enable(ctx->mediacrg_regulator);
-	if (ret) {
+	if (ret)
 		DRM_ERROR("mediacrg regulator_enable failed, error=%d!\n", ret);
-	}
 
 	return ret;
 }
@@ -1030,7 +1050,7 @@ int mediacrg_regulator_disable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
 
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL ptr.\n");
 		return -EINVAL;
 	}
@@ -1046,10 +1066,10 @@ int mediacrg_regulator_disable(struct dss_hw_ctx *ctx)
 
 int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 {
-	uint64_t clk_rate;
+	u64 clk_rate;
 	int ret = 0;
 
-	if (NULL == ctx) {
+	if (!ctx) {
 		DRM_ERROR("NULL Pointer!\n");
 		return -EINVAL;
 	}
@@ -1061,20 +1081,19 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n",
-		clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+		 clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
 
 #if 0 /* it will be set on dss_ldi_set_mode func */
 	ret = clk_set_rate(ctx->dss_pxl0_clk, pinfo->pxl_clk_rate);
 	if (ret < 0) {
 		DRM_ERROR("fb%d dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
-			ctx->index, pinfo->pxl_clk_rate, ret);
-		if (g_fpga_flag == 0) {
+			  ctx->index, pinfo->pxl_clk_rate, ret);
+		if (g_fpga_flag == 0)
 			return -EINVAL;
-		}
 	}
 
 	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n",
-			pinfo->pxl_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+		 pinfo->pxl_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 #endif
 
 	clk_rate = DEFAULT_DSS_MMBUF_CLK_RATE_L1;
@@ -1085,7 +1104,7 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 	}
 
 	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n",
-		clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
+		 clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
 
 	return ret;
 }
@@ -1093,10 +1112,10 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 {
 	int ret;
-	uint64_t clk_rate;
+	u64 clk_rate;
 
-	DRM_INFO("+. \n");
-	if (NULL == ctx) {
+	DRM_INFO("+.\n");
+	if (!ctx) {
 		DRM_ERROR("NULL Pointer!\n");
 		return -EINVAL;
 	}
@@ -1104,10 +1123,12 @@ int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 	clk_rate = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
 	ret = clk_set_rate(ctx->dss_pxl0_clk, clk_rate);
 	if (ret < 0) {
-		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
+			  clk_rate, ret);
 		return -EINVAL;
 	}
-	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n",
+		 clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 
 	return ret;
 }
@@ -1115,10 +1136,10 @@ int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 int dpe_set_common_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 {
 	int ret;
-	uint64_t clk_rate;
+	u64 clk_rate;
 
-	DRM_INFO("+. \n");
-	if (NULL == ctx) {
+	DRM_INFO("+.\n");
+	if (!ctx) {
 		DRM_ERROR("NULL Pointer!\n");
 		return -EINVAL;
 	}
@@ -1126,18 +1147,22 @@ int dpe_set_common_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 	clk_rate = DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF;
 	ret = clk_set_rate(ctx->dss_mmbuf_clk, clk_rate);
 	if (ret < 0) {
-		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n",
+			  clk_rate, ret);
 		return -EINVAL;
 	}
-	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
+	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n",
+		 clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
 
 	clk_rate = DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF;
 	ret = clk_set_rate(ctx->dss_pri_clk, clk_rate);
 	if (ret < 0) {
-		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n",
+			  clk_rate, ret);
 		return -EINVAL;
 	}
-	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n",
+		 clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
 
 	return ret;
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index e3681c26f7f4..1ab504d940a0 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -16,7 +16,7 @@
 #ifndef KIRIN_DRM_DPE_UTILS_H
 #define KIRIN_DRM_DPE_UTILS_H
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
 #include "kirin960_dpe_reg.h"
@@ -24,7 +24,7 @@
 #include "kirin9xx_drm_drv.h"
 
 void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs);
-uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs);
+u32 set_bits32(u32 old_val, uint32_t val, uint8_t bw, uint8_t bs);
 
 void init_dbuf(struct dss_crtc *acrtc);
 void init_dpp(struct dss_crtc *acrtc);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index 12668646c2d3..acb8420e332a 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -312,7 +312,7 @@ static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t
 
 	dc_ops = of_device_get_match_data(dev);
 
-	DRM_INFO("+. pdev->name is %s, m_message is %d \n", pdev->name, state.event);
+	DRM_INFO("+. pdev->name is %s, m_message is %d\n", pdev->name, state.event);
 	if (!dc_ops) {
 		DRM_ERROR("dc_ops is NULL\n");
 		return -EINVAL;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
index 8322abc0752c..232e88441bd1 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
@@ -48,9 +48,9 @@ struct kirin_fbdev {
 };
 
 extern const struct kirin_dc_ops dss_dc_ops;
-extern void dsi_set_output_client(struct drm_device *dev);
+void dsi_set_output_client(struct drm_device *dev);
 
 struct drm_framebuffer *kirin_framebuffer_init(struct drm_device *dev,
-		struct drm_mode_fb_cmd2 *mode_cmd);
+					       struct drm_mode_fb_cmd2 *mode_cmd);
 
 #endif /* __KIRIN_DRM_DRV_H__ */
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 10e62bdb9161..e3bb0a32dddf 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -40,7 +40,7 @@
 
 #include "kirin9xx_drm_drv.h"
 #include "kirin9xx_drm_dpe_utils.h"
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
 #include "kirin960_dpe_reg.h"
@@ -48,7 +48,7 @@
 
 //#define DSS_POWER_UP_ON_UEFI
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 #define DTS_COMP_DSS_NAME "hisilicon,kirin970-dpe"
 #else
 #define DTS_COMP_DSS_NAME "hisilicon,hi3660-dpe"
@@ -107,21 +107,20 @@ u32 dss_get_format(u32 pixel_format)
  **
  */
 
-int hdmi_ceil(uint64_t a, uint64_t b)
+int hdmi_ceil(u64 a, uint64_t b)
 {
 	if (b == 0)
 		return -1;
 
-	if (a%b != 0) {
-		return a/b + 1;
-	} else {
-		return a/b;
-	}
+	if (a % b != 0)
+		return a / b + 1;
+	else
+		return a / b;
 }
 
 int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, u64 pixel_clock)
 {
-	u64 vco_min_freq_output = KIRIN970_VCO_MIN_FREQ_OUPUT;
+	u64 vco_min_freq_output = KIRIN970_VCO_MIN_FREQ_OUTPUT;
 	u64 refdiv, fbdiv, frac, postdiv1 = 0, postdiv2 = 0;
 	u64 dss_pxl0_clk = 7 * 144000000UL;
 	u64 sys_clock_fref = KIRIN970_SYS_19M2;
@@ -323,7 +322,7 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 	int ret = 0;
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	mediacrg_regulator_enable(ctx);
 	dpe_common_clk_enable(ctx);
 	dpe_inner_clk_enable(ctx);
@@ -388,7 +387,7 @@ static void dss_power_down(struct dss_crtc *acrtc)
 	dpe_check_itf_status(acrtc);
 	dss_inner_clk_pdp_disable(ctx);
 
-	if (ctx->g_dss_version_tag & FB_ACCEL_KIRIN970 ) {
+	if (ctx->g_dss_version_tag & FB_ACCEL_KIRIN970) {
 		dpe_regulator_disable(ctx);
 		dpe_inner_clk_disable(ctx);
 		dpe_common_clk_disable(ctx);
@@ -609,7 +608,6 @@ static void dss_crtc_atomic_flush(struct drm_crtc *crtc,
 			drm_crtc_send_vblank_event(crtc, event);
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
-
 }
 
 static const struct drm_crtc_helper_funcs dss_crtc_helper_funcs = {
@@ -797,15 +795,15 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSS_NAME);
 	if (!np) {
 		DRM_ERROR("NOT FOUND device node %s!\n",
-			DTS_COMP_DSS_NAME);
+			  DTS_COMP_DSS_NAME);
 		return -ENXIO;
 	}
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	ret = of_property_read_u32(np, "dss_version_tag", &dss_version_tag);
-	if (ret) {
+	if (ret)
 		DRM_ERROR("failed to get dss_version_tag.\n");
-	}
+
 	ctx->g_dss_version_tag = dss_version_tag;
 	DRM_INFO("dss_version_tag=0x%x.\n", ctx->g_dss_version_tag);
 #else
@@ -815,52 +813,52 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 
 	ctx->base = of_iomap(np, 0);
 	if (!(ctx->base)) {
-		DRM_ERROR ("failed to get dss base resource.\n");
+		DRM_ERROR("failed to get dss base resource.\n");
 		return -ENXIO;
 	}
 
 	ctx->peri_crg_base  = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
-		DRM_ERROR ("failed to get dss peri_crg_base resource.\n");
+		DRM_ERROR("failed to get dss peri_crg_base resource.\n");
 		return -ENXIO;
 	}
 
 	ctx->sctrl_base  = of_iomap(np, 2);
 	if (!(ctx->sctrl_base)) {
-		DRM_ERROR ("failed to get dss sctrl_base resource.\n");
+		DRM_ERROR("failed to get dss sctrl_base resource.\n");
 		return -ENXIO;
 	}
 
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		ctx->pctrl_base = of_iomap(np, 3);
 		if (!(ctx->pctrl_base)) {
-			DRM_ERROR ("failed to get dss pctrl_base resource.\n");
+			DRM_ERROR("failed to get dss pctrl_base resource.\n");
 			return -ENXIO;
 		}
 	} else {
 		ctx->pmc_base = of_iomap(np, 3);
 		if (!(ctx->pmc_base)) {
-			DRM_ERROR ("failed to get dss pmc_base resource.\n");
+			DRM_ERROR("failed to get dss pmc_base resource.\n");
 			return -ENXIO;
 		}
 	}
 
 	ctx->noc_dss_base = of_iomap(np, 4);
 	if (!(ctx->noc_dss_base)) {
-		DRM_ERROR ("failed to get noc_dss_base resource.\n");
+		DRM_ERROR("failed to get noc_dss_base resource.\n");
 		return -ENXIO;
 	}
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	ctx->pmctrl_base = of_iomap(np, 5);
 	if (!(ctx->pmctrl_base)) {
-		DRM_ERROR ("failed to get dss pmctrl_base resource.\n");
+		DRM_ERROR("failed to get dss pmctrl_base resource.\n");
 		return -ENXIO;
 	}
 
 	ctx->media_crg_base = of_iomap(np, 6);
 	if (!(ctx->media_crg_base)) {
-		DRM_ERROR ("failed to get dss media_crg_base resource.\n");
+		DRM_ERROR("failed to get dss media_crg_base resource.\n");
 		return -ENXIO;
 	}
 #endif
@@ -872,9 +870,9 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		return -ENXIO;
 	}
 
-	DRM_INFO("dss irq = %d. \n", ctx->irq);
+	DRM_INFO("dss irq = %d.\n", ctx->irq);
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	ctx->dpe_regulator = devm_regulator_get(dev, REGULATOR_PDP_NAME);
 	if (!ctx->dpe_regulator) {
 		DRM_ERROR("failed to get dpe_regulator resource! ret=%d.\n", ret);
@@ -903,19 +901,19 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 	ctx->dss_pri_clk = devm_clk_get(dev, "clk_edc0");
 	if (!ctx->dss_pri_clk) {
 		DRM_ERROR("failed to parse dss_pri_clk\n");
-	    return -ENODEV;
+	return -ENODEV;
 	}
 
 	if (ctx->g_dss_version_tag != FB_ACCEL_KIRIN970) {
 		ret = clk_set_rate(ctx->dss_pri_clk, DEFAULT_DSS_CORE_CLK_07V_RATE);
 		if (ret < 0) {
 			DRM_ERROR("dss_pri_clk clk_set_rate(%lu) failed, error=%d!\n",
-				DEFAULT_DSS_CORE_CLK_07V_RATE, ret);
+				  DEFAULT_DSS_CORE_CLK_07V_RATE, ret);
 			return -EINVAL;
 		}
 
 		DRM_INFO("dss_pri_clk:[%lu]->[%llu].\n",
-			DEFAULT_DSS_CORE_CLK_07V_RATE, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+			 DEFAULT_DSS_CORE_CLK_07V_RATE, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
 	}
 
 	ctx->dss_pxl0_clk = devm_clk_get(dev, "clk_ldi0");
@@ -928,12 +926,12 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		ret = clk_set_rate(ctx->dss_pxl0_clk, DSS_MAX_PXL0_CLK_144M);
 		if (ret < 0) {
 			DRM_ERROR("dss_pxl0_clk clk_set_rate(%lu) failed, error=%d!\n",
-				DSS_MAX_PXL0_CLK_144M, ret);
+				  DSS_MAX_PXL0_CLK_144M, ret);
 			return -EINVAL;
 		}
 
 		DRM_INFO("dss_pxl0_clk:[%lu]->[%llu].\n",
-			DSS_MAX_PXL0_CLK_144M, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+			 DSS_MAX_PXL0_CLK_144M, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 	}
 
 	/* regulator enable */
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 128d63d74168..9113937478f5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -25,10 +25,12 @@
 #include "kirin9xx_drm_dpe_utils.h"
 #include "kirin9xx_drm_drv.h"
 
-static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
+static const int mid_array[DSS_CHN_MAX_DEFINE] = {
+	0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0
+};
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
-uint32_t g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
+#if defined(CONFIG_DRM_HISI_KIRIN970)
+static const u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
 	// D0
 	{
 	MIF_CH0_OFFSET,   //MODULE_MIF_CHN
@@ -293,7 +295,7 @@ uint32_t g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
 	},
 };
 
-uint32_t g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
+static const u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
 	{DSS_OVL0_OFFSET,
 	DSS_MCTRL_CTL0_OFFSET},
 
@@ -316,7 +318,7 @@ uint32_t g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
 //SCF_LUT_CHN coef_idx
 int g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
 
-uint32_t g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
+u32 g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
 	/* D2 */
 	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
 	/* D3 */
@@ -346,22 +348,22 @@ uint32_t g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
 };
 
 /* number of smrx idx for each channel */
-uint32_t g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
-    4, 1, 4, 4, 4, 4, 1, 1, 3, 4, 3, 3
+u32 g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
+	4, 1, 4, 4, 4, 4, 1, 1, 3, 4, 3, 3
 };
 
 /* start idx of each channel */
 /* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
-uint32_t g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
-    0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 36
+u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
+	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 36
 };
 #else
 /*
-** dss_chn_idx
-** DSS_RCHN_D2 = 0,	DSS_RCHN_D3,	DSS_RCHN_V0,	DSS_RCHN_G0,	DSS_RCHN_V1,
-** DSS_RCHN_G1,	DSS_RCHN_D0,	DSS_RCHN_D1,	DSS_WCHN_W0,	DSS_WCHN_W1,
-** DSS_RCHN_V2,   DSS_WCHN_W2,
-*/
+ * dss_chn_idx
+ * DSS_RCHN_D2 = 0,	DSS_RCHN_D3,	DSS_RCHN_V0,	DSS_RCHN_G0,	DSS_RCHN_V1,
+ * DSS_RCHN_G1,	DSS_RCHN_D0,	DSS_RCHN_D1,	DSS_WCHN_W0,	DSS_WCHN_W1,
+ * DSS_RCHN_V2,   DSS_WCHN_W2,
+ */
 u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
 	/* D0 */
 	{
@@ -676,6 +678,7 @@ u32 g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
 u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
 	0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 32
 };
+
 u32 g_dss_mif_sid_map[DSS_CHN_MAX] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 };
@@ -684,7 +687,7 @@ static int hisi_pixel_format_hal2dma(int format)
 {
 	int ret = 0;
 
-	switch(format) {
+	switch (format) {
 	case HISI_FB_PIXEL_FORMAT_RGB_565:
 	case HISI_FB_PIXEL_FORMAT_BGR_565:
 		ret = DMA_PIXEL_FORMAT_RGB_565;
@@ -902,11 +905,10 @@ static int hisi_dss_mif_config(struct dss_hw_ctx *ctx, int chn_idx, bool mmu_ena
 	mif_ch_base = ctx->base +
 		g_dss_module_base[chn_idx][MODULE_MIF_CHN];
 
-	if (!mmu_enable) {
+	if (!mmu_enable)
 		set_reg(mif_ch_base + MIF_CTRL1, 0x1, 1, 5);
-	} else  {
+	else
 		set_reg(mif_ch_base + MIF_CTRL1, 0x00080000, 32, 0);
-	}
 
 	return 0;
 }
@@ -992,11 +994,10 @@ static int hisi_dss_mctl_sys_config(struct dss_hw_ctx *ctx, int chn_idx)
 	set_reg(mctl_sys_base + mctl_rch_ov_oen_offset,
 		((1 << (layer_idx + 1)) | (0x100 << DSS_OVL0)), 32, 0);
 
-	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
 		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0xe, 4, 0);
-	} else {
+	else
 		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0x8, 4, 0);
-	}
 
 	set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, chn_idx, 4, (layer_idx + 1) * 4);
 
@@ -1007,7 +1008,7 @@ static int hisi_dss_mctl_sys_config(struct dss_hw_ctx *ctx, int chn_idx)
 }
 
 static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
-	const dss_rect_ltrb_t *rect, u32 display_addr, u32 hal_format,
+				const dss_rect_ltrb_t *rect, u32 display_addr, u32 hal_format,
 	u32 bpp, int chn_idx, bool afbcd, bool mmu_enable)
 {
 	void __iomem *rdma_base;
@@ -1036,13 +1037,12 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 		return -1;
 	}
 
-	if (bpp == 4) {
+	if (bpp == 4)
 		rdma_bpp = 0x5;
-	} else if (bpp == 2) {
+	else if (bpp == 2)
 		rdma_bpp = 0x0;
-	} else {
+	else
 		rdma_bpp = 0x0;
-	}
 
 	rdma_base = ctx->base +
 		g_dss_module_base[chn_idx][MODULE_DMA];
@@ -1066,18 +1066,16 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 		mm_base_1 = ALIGN_UP(mm_base_1, MMBUF_ADDR_ALIGN);
 
 		if ((((rect->right - rect->left) + 1) & (AFBC_HEADER_ADDR_ALIGN - 1)) ||
-				(((rect->bottom - rect->top) + 1) & (AFBC_BLOCK_ALIGN - 1))) {
-			DRM_ERROR("img width(%d) is not %d bytes aligned, or "
-					"img heigh(%d) is not %d bytes aligned!\n",
-					((rect->right - rect->left) + 1), AFBC_HEADER_ADDR_ALIGN,
-					((rect->bottom - rect->top) + 1), AFBC_BLOCK_ALIGN);
+		    (((rect->bottom - rect->top) + 1) & (AFBC_BLOCK_ALIGN - 1))) {
+			DRM_ERROR("img width(%d) is not %d bytes aligned, or img heigh(%d) is not %d bytes aligned!\n",
+				  ((rect->right - rect->left) + 1), AFBC_HEADER_ADDR_ALIGN,
+				  ((rect->bottom - rect->top) + 1), AFBC_BLOCK_ALIGN);
 		}
 
 		if ((mm_base_0 & (MMBUF_ADDR_ALIGN - 1)) || (mm_base_1 & (MMBUF_ADDR_ALIGN - 1))) {
-			DRM_ERROR("mm_base_0(0x%x) is not %d bytes aligned, or "
-					"mm_base_1(0x%x) is not %d bytes aligned!\n",
-					mm_base_0, MMBUF_ADDR_ALIGN,
-					mm_base_1, MMBUF_ADDR_ALIGN);
+			DRM_ERROR("mm_base_0(0x%x) is not %d bytes aligned, or mm_base_1(0x%x) is not %d bytes aligned!\n",
+				  mm_base_0, MMBUF_ADDR_ALIGN,
+				  mm_base_1, MMBUF_ADDR_ALIGN);
 		}
 		/*header*/
 		afbcd_header_stride = (((rect->right - rect->left) + 1) / AFBC_BLOCK_ALIGN) * AFBC_HEADER_STRIDE_BLOCK;
@@ -1148,7 +1146,8 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 }
 
 static int hisi_dss_rdfc_config(struct dss_hw_ctx *ctx,
-	const dss_rect_ltrb_t *rect, u32 hal_format, u32 bpp, int chn_idx)
+				const struct dss_rect_ltrb *rect,
+				u32 hal_format, u32 bpp, int chn_idx)
 {
 	void __iomem *rdfc_base;
 
@@ -1235,7 +1234,7 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 }
 
 static int hisi_dss_ovl_config(struct dss_hw_ctx *ctx,
-	const dss_rect_ltrb_t *rect, u32 xres, u32 yres)
+			       const dss_rect_ltrb_t *rect, u32 xres, u32 yres)
 {
 	void __iomem *ovl0_base;
 
@@ -1338,8 +1337,8 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 {
 	void __iomem *smmu_base;
 	struct iommu_domain_data *domain_data = NULL;
-	uint32_t phy_pgd_base = 0;
-	uint64_t fama_phy_pgd_base;
+	u32 phy_pgd_base = 0;
+	u64 fama_phy_pgd_base;
 
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
@@ -1444,9 +1443,8 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 	mctl_base = ctx->base +
 		g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
 
-	if (mctl_base) {
+	if (mctl_base)
 		set_reg(mctl_base + MCTL_CTL_CLEAR, 0x1, 1, 0);
-	}
 
 	while (1) {
 		mctl_status = inp32(mctl_base + MCTL_CTL_STATUS);
@@ -1454,15 +1452,14 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 			is_timeout = (delay_count > 100) ? true : false;
 			delay_count = 0;
 			break;
-		} else {
-			udelay(1);
-			++delay_count;
 		}
+
+		udelay(1);
+		++delay_count;
 	}
 
-	if (is_timeout) {
+	if (is_timeout)
 		DRM_ERROR("mctl_status =0x%x !\n", mctl_status);
-	}
 
 	enable_ldi(acrtc);
 	DRM_INFO("-.\n");
@@ -1479,7 +1476,7 @@ static int hisi_dss_wait_for_complete(struct dss_crtc *acrtc)
 
 REDO:
 	ret = wait_event_interruptible_timeout(ctx->vactive0_end_wq,
-		(prev_vactive0_end != ctx->vactive0_end_flag),
+					       (prev_vactive0_end != ctx->vactive0_end_flag),
 		msecs_to_jiffies(300));
 	if (ret == -ERESTARTSYS) {
 		if (times < 50) {
@@ -1549,13 +1546,12 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	rect.bottom = src_h - 1;
 	hal_fmt = HISI_FB_PIXEL_FORMAT_BGRA_8888;//dss_get_format(fb->pixel_format);
 
-	DRM_DEBUG_DRIVER("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),"
-		"fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
-		chn_idx, src_x, src_y, src_w, src_h,
-		crtc_x, crtc_y, crtc_w, crtc_h,
-		rect.left, rect.top, rect.right, rect.bottom,
-		fb->width, fb->height, hal_fmt,
-		stride, display_addr, bpp);
+	DRM_DEBUG_DRIVER("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
+			 chn_idx, src_x, src_y, src_w, src_h,
+			 crtc_x, crtc_y, crtc_w, crtc_h,
+			 rect.left, rect.top, rect.right, rect.bottom,
+			 fb->width, fb->height, hal_fmt,
+			 stride, display_addr, bpp);
 
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1582,7 +1578,8 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_wait_for_complete(acrtc);
 }
 
-void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, drm_dss_layer_t *layer)
+void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane,
+			  struct drm_dss_layer *layer)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_display_mode *mode;
@@ -1620,11 +1617,10 @@ void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, dr
 	rect.top = 0;
 	rect.bottom = src_h - 1;
 
-	DRM_DEBUG("channel%d: src:(%dx%d) rect(%d,%d,%d,%d),"
-		"pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
-		chn_idx, src_w, src_h,
-		rect.left, rect.top, rect.right, rect.bottom,
-		hal_fmt, stride, display_addr, bpp);
+	DRM_DEBUG("channel%d: src:(%dx%d) rect(%d,%d,%d,%d),pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
+		  chn_idx, src_w, src_h,
+		  rect.left, rect.top, rect.right, rect.bottom,
+		  hal_fmt, stride, display_addr, bpp);
 
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 0612ca149c4b..5411113f148c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -31,16 +31,15 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
-
 #include "kirin9xx_dw_dsi_reg.h"
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
 #include "kirin960_dpe_reg.h"
 #endif
 #include "kirin9xx_drm_drv.h"
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 #define DTS_COMP_DSI_NAME "hisilicon,kirin970-dsi"
 #else
 #define DTS_COMP_DSI_NAME "hisilicon,kirin960-dsi"
@@ -123,18 +122,18 @@ struct mipi_phy_params {
 	u32 load_command;
 
 	// for CDPHY
-	uint32_t rg_cphy_div;	//Q
-	uint32_t rg_div;		//M 0x4A[7:0]
-	uint32_t rg_pre_div;	//N 0x49[0]
-	uint32_t rg_320m;		//0x48[2]
-	uint32_t rg_2p5g;		//0x48[1]
-	uint32_t rg_0p8v;		//0x48[0]
-	uint32_t rg_lpf_r;		//0x46[5:4]
-	uint32_t rg_cp;			//0x46[3:0]
-	uint32_t t_prepare;
-	uint32_t t_lpx;
-	uint32_t t_prebegin;
-	uint32_t t_post;
+	u32 rg_cphy_div;	//Q
+	u32 rg_div;		//M 0x4A[7:0]
+	u32 rg_pre_div;	//N 0x49[0]
+	u32 rg_320m;		//0x48[2]
+	u32 rg_2p5g;		//0x48[1]
+	u32 rg_0p8v;		//0x48[0]
+	u32 rg_lpf_r;		//0x46[5:4]
+	u32 rg_cp;			//0x46[3:0]
+	u32 t_prepare;
+	u32 t_lpx;
+	u32 t_prebegin;
+	u32 t_post;
 };
 
 struct dsi_hw_ctx {
@@ -208,9 +207,9 @@ struct ldi_panel_info {
 	u32 h_pulse_width;
 
 	/*
-	** note: vbp > 8 if used overlay compose,
-	** also lcd vbp > 8 in lcd power on sequence
-	*/
+	 * note: vbp > 8 if used overlay compose,
+	 * also lcd vbp > 8 in lcd power on sequence
+	 */
 	u32 v_back_porch;
 	u32 v_front_porch;
 	u32 v_pulse_width;
@@ -328,7 +327,7 @@ void dsi_set_output_client(struct drm_device *dev)
 }
 EXPORT_SYMBOL(dsi_set_output_client);
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 			      struct mipi_phy_params *phy_ctrl, u32 id)
 {
@@ -374,9 +373,9 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 		return;
 
 	if (mode->clock > 80000)
-	    dsi->client[id].lanes = 4;
+		dsi->client[id].lanes = 4;
 	else
-	    dsi->client[id].lanes = 3;
+		dsi->client[id].lanes = 3;
 
 	if (dsi->client[id].phy_clock)
 		dphy_req_kHz = dsi->client[id].phy_clock;
@@ -390,14 +389,15 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	//chip spec :
 	//If the output data rate is below 320 Mbps, RG_BNAD_SEL should be set to 1.
 	//At this mode a post divider of 1/4 will be applied to VCO.
-	if ((320 <= lane_clock) && (lane_clock <= 2500)) {
+	if ((lane_clock >= 320) && (lane_clock <= 2500)) {
 		phy_ctrl->rg_band_sel = 0;
 		vco_div = 1;
-	} else if ((80 <= lane_clock) && (lane_clock < 320)) {
+	} else if ((lane_clock >= 80) && (lane_clock < 320)) {
 		phy_ctrl->rg_band_sel = 1;
 		vco_div = 4;
 	} else {
-		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n", lane_clock);
+		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n",
+			  lane_clock);
 	}
 
 	m_n_int = lane_clock * vco_div * 1000000UL / DEFAULT_MIPI_CLK_RATE;
@@ -408,13 +408,13 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	m_pll = (u32)(lane_clock * vco_div * n_pll * 1000000UL / DEFAULT_MIPI_CLK_RATE);
 
 	lane_clock = m_pll * (DEFAULT_MIPI_CLK_RATE / n_pll) / vco_div;
-	if (lane_clock > 750000000) {
+	if (lane_clock > 750000000)
 		phy_ctrl->rg_cp = 3;
-	} else if ((80000000 <= lane_clock) && (lane_clock <= 750000000)) {
+	else if ((lane_clock >= 80000000) && (lane_clock <= 750000000))
 		phy_ctrl->rg_cp = 1;
-	} else {
-		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n", lane_clock);
-	}
+	else
+		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n",
+			  lane_clock);
 
 	//chip spec :
 	phy_ctrl->rg_pre_div = n_pll - 1;
@@ -463,7 +463,7 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 
 	// D-PHY Specification : 40ns + 4*UI <= data_t_hs_prepare <= 85ns + 6*UI
 	// clocked by TXBYTECLKHS
-	data_t_hs_prepare = 400 * accuracy + 4*ui;
+	data_t_hs_prepare = 400 * accuracy + 4 * ui;
 	// D-PHY chip spec : clk_t_lpx + clk_t_hs_prepare > 200ns
 	// D-PHY Specification : clk_t_lpx >= 50ns
 	// clocked by TXBYTECLKHS
@@ -497,7 +497,7 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 
 	phy_ctrl->clk_post_delay = phy_ctrl->data_t_hs_trial + ROUND1(clk_post, unit_tx_byte_clk_hs);
 	phy_ctrl->data_pre_delay = phy_ctrl->clk_pre_delay + 2 + phy_ctrl->clk_t_lpx +
-		phy_ctrl->clk_t_hs_prepare + phy_ctrl->clk_t_hs_zero + 8 + ROUND1(clk_pre, unit_tx_byte_clk_hs) ;
+		phy_ctrl->clk_t_hs_prepare + phy_ctrl->clk_t_hs_zero + 8 + ROUND1(clk_pre, unit_tx_byte_clk_hs);
 
 	phy_ctrl->clk_lane_lp2hs_time = phy_ctrl->clk_pre_delay + phy_ctrl->clk_t_lpx + phy_ctrl->clk_t_hs_prepare +
 		phy_ctrl->clk_t_hs_zero + 5 + 7;
@@ -514,7 +514,7 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 		(uint32_t)(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk + 1) :
 		(uint32_t)(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk);
 
-	DRM_DEBUG("DPHY clock_lane and data_lane config : \n"
+	DRM_DEBUG("DPHY clock_lane and data_lane config :\n"
 		"lane_clock = %llu, n_pll=%d, m_pll=%d\n"
 		"rg_cp=%d\n"
 		"rg_band_sel=%d\n"
@@ -608,10 +608,12 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->client[id].format);
 	if (bpp < 0)
 		return;
+
 	if (mode->clock > 80000)
-	    dsi->client[id].lanes = 4;
+		dsi->client[id].lanes = 4;
 	else
-	    dsi->client[id].lanes = 3;
+		dsi->client[id].lanes = 3;
+
 	if (dsi->client[id].phy_clock)
 		dphy_req_kHz = dsi->client[id].phy_clock;
 	else
@@ -621,20 +623,22 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 	DRM_INFO("Expected : lane_clock = %llu M\n", lane_clock);
 
 	/************************  PLL parameters config  *********************/
-	/*chip spec :
-		If the output data rate is below 320 Mbps,
-		RG_BNAD_SEL should be set to 1.
-		At this mode a post divider of 1/4 will be applied to VCO.
-	*/
-	if ((320 <= lane_clock) && (lane_clock <= 2500)) {
+
+	/*
+	 * chip spec :
+	 *	If the output data rate is below 320 Mbps,
+	 *	RG_BNAD_SEL should be set to 1.
+	 *	At this mode a post divider of 1/4 will be applied to VCO.
+	 */
+	if ((lane_clock >= 320) && (lane_clock <= 2500)) {
 		phy_ctrl->rg_band_sel = 0;	/*0x1E[2]*/
 		vco_div = 1;
-	} else if ((80 <= lane_clock) && (lane_clock < 320)) {
+	} else if ((lane_clock >= 80) && (lane_clock < 320)) {
 		phy_ctrl->rg_band_sel = 1;
 		vco_div = 4;
 	} else {
 		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M\n",
-			lane_clock);
+			  lane_clock);
 	}
 
 	m_n_int = lane_clock * vco_div * 1000000UL / DEFAULT_MIPI_CLK_RATE;
@@ -824,7 +828,7 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 
 	phy_ctrl->clk_post_delay = phy_ctrl->data_t_hs_trial + ROUND1(clk_post, unit_tx_byte_clk_hs);
 	phy_ctrl->data_pre_delay = clk_pre_delay_reality + phy_ctrl->clk_t_lpx +
-		phy_ctrl->clk_t_hs_prepare + clk_t_hs_zero_reality + ROUND1(clk_pre, unit_tx_byte_clk_hs) ;
+		phy_ctrl->clk_t_hs_prepare + clk_t_hs_zero_reality + ROUND1(clk_pre, unit_tx_byte_clk_hs);
 
 	clk_post_delay_reality = phy_ctrl->clk_post_delay + 4;
 	data_pre_delay_reality = phy_ctrl->data_pre_delay + 2;
@@ -844,7 +848,7 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 		(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk + 1) :
 		(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk);
 
-	DRM_DEBUG("PHY clock_lane and data_lane config : \n"
+	DRM_DEBUG("PHY clock_lane and data_lane config :\n"
 		"rg_vrefsel_vcm=%u\n"
 		"clk_pre_delay=%u\n"
 		"clk_post_delay=%u\n"
@@ -949,8 +953,8 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi,
 					       char __iomem *mipi_dsi_base,
 					       u32 id)
 {
-	uint32_t i;
-	uint32_t addr = 0;
+	u32 i;
+	u32 addr = 0;
 	u32 lanes;
 
 	lanes =  dsi->client[id].lanes - 1;
@@ -979,7 +983,7 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi,
 	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_TRAIL, DSS_REDUCE(dsi->phy.clk_t_hs_trial));
 
 	for (i = 0; i <= 4; i++) {
-		if (lanes == 2 && i == 1) /*init mipi dsi 3 lanes shoud skip lane3*/
+		if (lanes == 2 && i == 1) /*init mipi dsi 3 lanes should skip lane3*/
 			i++;
 
 		if (i == 2) /* skip clock lane*/
@@ -1009,7 +1013,7 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi,
 		addr = MIPIDSI_PHY_TST_DATA_TRAIL + (i << 5);
 		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_t_hs_trial));
 
-		DRM_DEBUG("DPHY spec1v2 config : \n"
+		DRM_DEBUG("DPHY spec1v2 config :\n"
 			"addr=0x%x\n"
 			"clk_pre_delay=%u\n"
 			"clk_t_hs_trial=%u\n"
@@ -1039,15 +1043,14 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	dss_rect_t rect;
 	u32 cmp_stopstate_val = 0;
 	u32 lanes;
-#if !defined (CONFIG_DRM_HISI_KIRIN970)
+#if !defined(CONFIG_DRM_HISI_KIRIN970)
 	int i = 0;
 #endif
 
 	WARN_ON(!dsi);
 	WARN_ON(!mipi_dsi_base);
 
-	DRM_INFO("dsi_mipi_init, id=%d\n", id);
-
+	DRM_INFO("%s: id=%d\n", __func__, id);
 
 	mipi = &dsi->mipi;
 
@@ -1058,7 +1061,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	memset(&dsi->phy, 0, sizeof(struct mipi_phy_params));
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	get_dsi_dphy_ctrl(dsi, &dsi->phy, id);
 #else
 	get_dsi_phy_ctrl(dsi, &dsi->phy, id);
@@ -1081,7 +1084,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000001);
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000000);
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
 	//PLL configuration I
 	dsi_phy_tst_set(mipi_dsi_base, 0x0046, dsi->phy.rg_cp + (dsi->phy.rg_lpf_r << 4));
@@ -1113,7 +1116,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 #else
 	/* physical configuration PLL I*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x14,
-		(dsi->phy.rg_pll_fbd_s << 4) + (dsi->phy.rg_pll_enswc << 3) +
+			(dsi->phy.rg_pll_fbd_s << 4) + (dsi->phy.rg_pll_enswc << 3) +
 		(dsi->phy.rg_pll_enbwt << 2) + dsi->phy.rg_pll_chp);
 
 	/* physical configuration PLL II, M*/
@@ -1121,7 +1124,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	/* physical configuration PLL III*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x16,
-		(dsi->phy.rg_pll_cp << 5) + (dsi->phy.rg_pll_lpf_cs << 4) +
+			(dsi->phy.rg_pll_cp << 5) + (dsi->phy.rg_pll_lpf_cs << 4) +
 		dsi->phy.rg_pll_refsel);
 
 	/* physical configuration PLL IV, N*/
@@ -1132,7 +1135,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	/* MISC AFE Configuration*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x1E,
-		(dsi->phy.rg_pll_cp_p << 5) + (dsi->phy.reload_sel << 4) +
+			(dsi->phy.rg_pll_cp_p << 5) + (dsi->phy.reload_sel << 4) +
 		(dsi->phy.rg_phase_gen_en << 3) + (dsi->phy.rg_band_sel << 2) +
 		(dsi->phy.pll_power_down << 1) + dsi->phy.pll_register_override);
 
@@ -1205,7 +1208,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	if (!is_ready) {
 		DRM_INFO("phylock is not ready!MIPIDSI_PHY_STATUS_OFFSET=0x%x.\n",
-			tmp);
+			 tmp);
 	}
 
 	if (lanes >= DSI_4_LANES)
@@ -1229,19 +1232,20 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	if (!is_ready) {
 		DRM_INFO("phystopstateclklane is not ready! MIPIDSI_PHY_STATUS_OFFSET=0x%x.\n",
-			tmp);
+			 tmp);
 	}
 
 	/*************************Configure the DPHY end*************************/
 
-	/* phy_stop_wait_time*/
+	/* phy_stop_wait_time */
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_IF_CFG_OFFSET, dsi->phy.phy_stop_wait_time, 8, 8);
 
 	/*--------------configuring the DPI packet transmission----------------*/
+
 	/*
-	** 2. Configure the DPI Interface:
-	** This defines how the DPI interface interacts with the controller.
-	*/
+	 * 2. Configure the DPI Interface:
+	 * This defines how the DPI interface interacts with the controller.
+	 */
 	set_reg(mipi_dsi_base + MIPIDSI_DPI_VCID_OFFSET, mipi->vc, 2, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_DPI_COLOR_CODING_OFFSET, mipi->color_mode, 4, 0);
 
@@ -1252,10 +1256,10 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	set_reg(mipi_dsi_base + MIPIDSI_DPI_CFG_POL_OFFSET, 0x0, 1, 4);
 
 	/*
-	** 3. Select the Video Transmission Mode:
-	** This defines how the processor requires the video line to be
-	** transported through the DSI link.
-	*/
+	 * 3. Select the Video Transmission Mode:
+	 * This defines how the processor requires the video line to be
+	 * transported through the DSI link.
+	 */
 	/* video mode: low power mode*/
 	set_reg(mipi_dsi_base + MIPIDSI_VID_MODE_CFG_OFFSET, 0x3f, 6, 8);
 	/* set_reg(mipi_dsi_base + MIPIDSI_VID_MODE_CFG_OFFSET, 0x0, 1, 14); */
@@ -1273,12 +1277,12 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	set_reg(mipi_dsi_base + MIPIDSI_PCKHDL_CFG_OFFSET, 0x1, 1, 2);
 
 	/*
-	** 4. Define the DPI Horizontal timing configuration:
-	**
-	** Hsa_time = HSA*(PCLK period/Clk Lane Byte Period);
-	** Hbp_time = HBP*(PCLK period/Clk Lane Byte Period);
-	** Hline_time = (HSA+HBP+HACT+HFP)*(PCLK period/Clk Lane Byte Period);
-	*/
+	 * 4. Define the DPI Horizontal timing configuration:
+	 *
+	 * Hsa_time = HSA*(PCLK period/Clk Lane Byte Period);
+	 * Hbp_time = HBP*(PCLK period/Clk Lane Byte Period);
+	 * Hline_time = (HSA+HBP+HACT+HFP)*(PCLK period/Clk Lane Byte Period);
+	 */
 	pixel_clk = dsi->cur_mode.clock * 1000;
 	/*htot = dsi->cur_mode.htotal;*/
 	/*vtot = dsi->cur_mode.vtotal;*/
@@ -1298,29 +1302,39 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 		rect.w + dsi->ldi.h_front_porch) * dsi->phy.lane_byte_clk, pixel_clk);
 
 	DRM_INFO("hsa_time=%d, hbp_time=%d, hline_time=%d\n",
-	    hsa_time, hbp_time, hline_time);
+		 hsa_time, hbp_time, hline_time);
 	DRM_INFO("lane_byte_clk=%llu, pixel_clk=%llu\n",
-	    dsi->phy.lane_byte_clk, pixel_clk);
+		 dsi->phy.lane_byte_clk, pixel_clk);
 	set_reg(mipi_dsi_base + MIPIDSI_VID_HSA_TIME_OFFSET, hsa_time, 12, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_VID_HBP_TIME_OFFSET, hbp_time, 12, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_VID_HLINE_TIME_OFFSET, hline_time, 15, 0);
 
 	/* Define the Vertical line configuration*/
-	set_reg(mipi_dsi_base + MIPIDSI_VID_VSA_LINES_OFFSET, dsi->ldi.v_pulse_width, 10, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_VID_VBP_LINES_OFFSET, dsi->ldi.v_back_porch, 10, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_VID_VFP_LINES_OFFSET, dsi->ldi.v_front_porch, 10, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_VID_VACTIVE_LINES_OFFSET, rect.h, 14, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_TO_CNT_CFG_OFFSET, 0x7FF, 16, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_VID_VSA_LINES_OFFSET,
+		dsi->ldi.v_pulse_width, 10, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_VID_VBP_LINES_OFFSET,
+		dsi->ldi.v_back_porch, 10, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_VID_VFP_LINES_OFFSET,
+		dsi->ldi.v_front_porch, 10, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_VID_VACTIVE_LINES_OFFSET,
+		rect.h, 14, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_TO_CNT_CFG_OFFSET,
+		0x7FF, 16, 0);
 
 	/* Configure core's phy parameters*/
-	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET, dsi->phy.clk_lane_lp2hs_time, 10, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET, dsi->phy.clk_lane_hs2lp_time, 10, 16);
+	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET,
+		dsi->phy.clk_lane_lp2hs_time, 10, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET,
+		dsi->phy.clk_lane_hs2lp_time, 10, 16);
 
-	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_RD_CFG_OFFSET, 0x7FFF, 15, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_lp2hs_time, 10, 0);
-	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_hs2lp_time, 10, 16);
+	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_RD_CFG_OFFSET,
+		0x7FFF, 15, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET,
+		dsi->phy.data_lane_lp2hs_time, 10, 0);
+	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET,
+		dsi->phy.data_lane_hs2lp_time, 10, 16);
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	//16~19bit:pclk_en, pclk_sel, dpipclk_en, dpipclk_sel
 	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, 0x5, 4, 16);
 	//0:dphy
@@ -1368,7 +1382,7 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	dsi_mipi_init(dsi, mipi_dsi_base, id);
 
 	/* dsi memory init */
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	outp32(mipi_dsi_base + DSI_MEM_CTRL, 0x02600008);
 #endif
 
@@ -1388,6 +1402,7 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
 	u64 pctrl_dphytx_stopcnt = 0;
+
 	WARN_ON(!mipi_dsi_base);
 
 	/* switch to video mode */
@@ -1458,7 +1473,7 @@ static void dsi_encoder_enable(struct drm_encoder *encoder)
 }
 
 static enum drm_mode_status dsi_encoder_mode_valid(struct drm_encoder *encoder,
-					const struct drm_display_mode *mode)
+						   const struct drm_display_mode *mode)
 
 {
 	const struct drm_crtc_helper_funcs *crtc_funcs;
@@ -1675,7 +1690,7 @@ static int dsi_dcs_long_write(void __iomem *base,
 }
 
 static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
-				    const struct mipi_dsi_msg *msg)
+				 const struct mipi_dsi_msg *msg)
 {
 	struct dw_dsi *dsi = host_to_dsi(host);
 	struct dsi_hw_ctx *ctx = dsi->ctx;
@@ -1718,12 +1733,12 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
 	mipi->vc = 0;
 	mipi->color_mode = DSI_24BITS_1;
 	mipi->clk_post_adjust = 120;
-	mipi->clk_pre_adjust= 0;
-	mipi->clk_t_hs_prepare_adjust= 0;
-	mipi->clk_t_lpx_adjust= 0;
-	mipi->clk_t_hs_trial_adjust= 0;
-	mipi->clk_t_hs_exit_adjust= 0;
-	mipi->clk_t_hs_zero_adjust= 0;
+	mipi->clk_pre_adjust = 0;
+	mipi->clk_t_hs_prepare_adjust = 0;
+	mipi->clk_t_lpx_adjust = 0;
+	mipi->clk_t_hs_trial_adjust = 0;
+	mipi->clk_t_hs_exit_adjust = 0;
+	mipi->clk_t_hs_zero_adjust = 0;
 
 	dsi->ldi.data_en_plr = 0;
 	dsi->ldi.vsync_plr = 0;
@@ -1762,7 +1777,7 @@ dsi_connector_best_encoder(struct drm_connector *connector)
 	return &dsi->encoder;
 }
 
-static struct drm_connector_helper_funcs dsi_connector_helper_funcs = {
+static const struct drm_connector_helper_funcs dsi_connector_helper_funcs = {
 	.get_modes = dsi_connector_get_modes,
 	.mode_valid = dsi_connector_mode_valid,
 	.best_encoder = dsi_connector_best_encoder,
@@ -1825,6 +1840,7 @@ static int dsi_connector_init(struct drm_device *dev, struct dw_dsi *dsi)
 	DRM_INFO("connector init\n");
 	return 0;
 }
+
 static int dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct dsi_data *ddata = dev_get_drvdata(dev);
@@ -1964,26 +1980,26 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSI_NAME);
 	if (!np) {
 		DRM_ERROR("NOT FOUND device node %s!\n",
-				   DTS_COMP_DSI_NAME);
+			  DTS_COMP_DSI_NAME);
 		return -ENXIO;
 	}
 
 	ctx->base = of_iomap(np, 0);
 	if (!(ctx->base)) {
-		DRM_ERROR ("failed to get dsi base resource.\n");
+		DRM_ERROR("failed to get dsi base resource.\n");
 		return -ENXIO;
 	}
 
 	ctx->peri_crg_base = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
-		DRM_ERROR ("failed to get peri_crg_base resource.\n");
+		DRM_ERROR("failed to get peri_crg_base resource.\n");
 		return -ENXIO;
 	}
 
-#if defined (CONFIG_DRM_HISI_KIRIN970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	ctx->pctrl_base = of_iomap(np, 2);
 	if (!(ctx->pctrl_base)) {
-		DRM_ERROR ("failed to get dss pctrl_base resource.\n");
+		DRM_ERROR("failed to get dss pctrl_base resource.\n");
 		return -ENXIO;
 	}
 #endif
@@ -1996,7 +2012,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 	dsi->cur_client = OUT_PANEL;
 	dsi->attached_client = dsi->cur_client;
 
-	DRM_INFO("dsi  cur_client is %d  <0->hdmi;1->panel> \n", dsi->cur_client);
+	DRM_INFO("dsi  cur_client is %d  <0->hdmi;1->panel>\n", dsi->cur_client);
 	/*dis-reset*/
 	/*ip_reset_dis_dsi0, ip_reset_dis_dsi1*/
 	outp32(ctx->peri_crg_base + PERRSTDIS3, 0x30000000);
@@ -2010,12 +2026,12 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 	ret = clk_set_rate(ctx->dss_dphy0_ref_clk, DEFAULT_MIPI_CLK_RATE);
 	if (ret < 0) {
 		DRM_ERROR("dss_dphy0_ref_clk clk_set_rate(%lu) failed, error=%d!\n",
-			DEFAULT_MIPI_CLK_RATE, ret);
+			  DEFAULT_MIPI_CLK_RATE, ret);
 		return -EINVAL;
 	}
 
 	DRM_DEBUG("dss_dphy0_ref_clk:[%lu]->[%lu].\n",
-		DEFAULT_MIPI_CLK_RATE, clk_get_rate(ctx->dss_dphy0_ref_clk));
+		  DEFAULT_MIPI_CLK_RATE, clk_get_rate(ctx->dss_dphy0_ref_clk));
 
 	ctx->dss_dphy0_cfg_clk = devm_clk_get(&pdev->dev, "clk_txdphy0_cfg");
 	if (IS_ERR(ctx->dss_dphy0_cfg_clk)) {
@@ -2026,12 +2042,12 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 	ret = clk_set_rate(ctx->dss_dphy0_cfg_clk, DEFAULT_MIPI_CLK_RATE);
 	if (ret < 0) {
 		DRM_ERROR("dss_dphy0_cfg_clk clk_set_rate(%lu) failed, error=%d!\n",
-			DEFAULT_MIPI_CLK_RATE, ret);
+			  DEFAULT_MIPI_CLK_RATE, ret);
 		return -EINVAL;
 	}
 
 	DRM_DEBUG("dss_dphy0_cfg_clk:[%lu]->[%lu].\n",
-		DEFAULT_MIPI_CLK_RATE, clk_get_rate(ctx->dss_dphy0_cfg_clk));
+		  DEFAULT_MIPI_CLK_RATE, clk_get_rate(ctx->dss_dphy0_cfg_clk));
 
 	ctx->dss_pclk_dsi0_clk = devm_clk_get(&pdev->dev, "pclk_dsi0");
 	if (IS_ERR(ctx->dss_pclk_dsi0_clk)) {
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h b/drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h
index 69c7f1fd7ccf..2ebf4dd9f09e 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h
@@ -41,7 +41,6 @@
 /* vcc name */
 #define REGULATOR_PDP_NAME	"ldo3"
 
-
 /* irq name */
 #define IRQ_PDP_NAME	"irq_pdp"
 #define IRQ_SDP_NAME	"irq_sdp"
@@ -91,9 +90,9 @@ enum MIPI_LP11_MODE {
 
 /* resource desc */
 struct resource_desc {
-	uint32_t flag;
+	u32 flag;
 	char *name;
-	uint32_t *value;
+	u32 *value;
 };
 
 /* dtype for vcc */
@@ -136,6 +135,7 @@ struct pinctrl_data {
 	struct pinctrl_state *pinctrl_def;
 	struct pinctrl_state *pinctrl_idle;
 };
+
 struct pinctrl_cmd_desc {
 	int dtype;
 	struct pinctrl_data *pctrl_data;
@@ -156,7 +156,7 @@ struct gpio_desc {
 	int waittype;
 	int wait;
 	char *label;
-	uint32_t *gpio;
+	u32 *gpio;
 	int value;
 };
 
@@ -170,15 +170,15 @@ enum bl_control_mode {
 	COMMON_IC_MODE = 8,
 };
 
-/*******************************************************************************
-** FUNCTIONS PROTOTYPES
-*/
+/*
+ * FUNCTIONS PROTOTYPES
+ */
 #define MIPI_DPHY_NUM	(2)
 
-extern uint32_t g_dts_resouce_ready;
+extern u32 g_dts_resource_ready;
 
 int resource_cmds_tx(struct platform_device *pdev,
-	struct resource_desc *cmds, int cnt);
+		     struct resource_desc *cmds, int cnt);
 int vcc_cmds_tx(struct platform_device *pdev, struct vcc_desc *cmds, int cnt);
 int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds, int cnt);
 int gpio_cmds_tx(struct gpio_desc *cmds, int cnt);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
index f2b9cfe8fa54..519e8f0232de 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
@@ -66,7 +66,6 @@ static struct pinctrl_cmd_desc pwm_pinctrl_finit_cmds[] = {
 
 #define PWM_OUT_PRECISION	(800)
 
-
 int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds, int cnt)
 {
 	int ret = 0;
@@ -77,13 +76,13 @@ int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds,
 	cm = cmds;
 
 	for (i = 0; i < cnt; i++) {
-		if (cm == NULL) {
+		if (!cm) {
 			DRM_ERROR("cm is null! index=%d\n", i);
 			continue;
 		}
 
 		if (cm->dtype == DTYPE_PINCTRL_GET) {
-			if (NULL == pdev) {
+			if (!pdev) {
 				DRM_ERROR("pdev is NULL");
 				return -EINVAL;
 			}
@@ -158,7 +157,7 @@ int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds,
 int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level)
 {
 	char __iomem *pwm_base = NULL;
-	uint32_t bl_max = bl->props.max_brightness;
+	u32 bl_max = bl->props.max_brightness;
 
 	pwm_base = hisifd_pwm_base;
 	if (!pwm_base) {
@@ -173,9 +172,8 @@ int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level)
 		return -EINVAL;
 	}
 
-	if (bl_level > bl_max) {
+	if (bl_level > bl_max)
 		bl_level = bl_max;
-	}
 
 	bl_level = (bl_level * PWM_OUT_PRECISION) / bl_max;
 
@@ -232,11 +230,11 @@ int hisi_pwm_on(void)
 			return -EINVAL;
 		}
 
-		DRM_INFO("dss_pwm_clk clk_enable successed, ret=%d!\n", ret);
+		DRM_INFO("dss_pwm_clk clk_enable succeeded, ret=%d!\n", ret);
 	}
 
 	ret = pinctrl_cmds_tx(g_pwm_pdev, pwm_pinctrl_normal_cmds,
-		ARRAY_SIZE(pwm_pinctrl_normal_cmds));
+			      ARRAY_SIZE(pwm_pinctrl_normal_cmds));
 
 	//if enable PWM, please set IOMG_004 in IOC_AO module
 	//set IOMG_004: select PWM_OUT0
@@ -269,7 +267,7 @@ int hisi_pwm_off(void)
 		return 0;
 
 	ret = pinctrl_cmds_tx(g_pwm_pdev, pwm_pinctrl_lowpower_cmds,
-		ARRAY_SIZE(pwm_pinctrl_lowpower_cmds));
+			      ARRAY_SIZE(pwm_pinctrl_lowpower_cmds));
 
 	clk_tmp = g_pwm_clk;
 	if (clk_tmp) {
@@ -290,7 +288,7 @@ static int hisi_pwm_probe(struct platform_device *pdev)
 	struct device_node *np = NULL;
 	int ret = 0;
 
-	if (NULL == pdev) {
+	if (!pdev) {
 		DRM_ERROR("pdev is NULL");
 		return -EINVAL;
 	}
@@ -320,7 +318,7 @@ static int hisi_pwm_probe(struct platform_device *pdev)
 
 	/* pwm pinctrl init */
 	ret = pinctrl_cmds_tx(pdev, pwm_pinctrl_init_cmds,
-		ARRAY_SIZE(pwm_pinctrl_init_cmds));
+			      ARRAY_SIZE(pwm_pinctrl_init_cmds));
 	if (ret != 0) {
 		DRM_ERROR("Init pwm pinctrl failed! ret=%d.\n", ret);
 		goto err_return;
@@ -330,13 +328,13 @@ static int hisi_pwm_probe(struct platform_device *pdev)
 	g_pwm_clk = of_clk_get(np, 0);
 	if (IS_ERR(g_pwm_clk)) {
 		DRM_ERROR("%s clock not found: %d!\n",
-			np->name, (int)PTR_ERR(g_pwm_clk));
+			  np->name, (int)PTR_ERR(g_pwm_clk));
 		ret = -ENXIO;
 		goto err_return;
 	}
 
 	DRM_INFO("dss_pwm_clk:[%lu]->[%lu].\n",
-		DEFAULT_PWM_CLK_RATE, clk_get_rate(g_pwm_clk));
+		 DEFAULT_PWM_CLK_RATE, clk_get_rate(g_pwm_clk));
 
 	return 0;
 
@@ -350,7 +348,7 @@ static int hisi_pwm_remove(struct platform_device *pdev)
 	int ret = 0;
 
 	ret = pinctrl_cmds_tx(pdev, pwm_pinctrl_finit_cmds,
-		ARRAY_SIZE(pwm_pinctrl_finit_cmds));
+			      ARRAY_SIZE(pwm_pinctrl_finit_cmds));
 
 	clk_tmp = g_pwm_clk;
 	if (clk_tmp) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
