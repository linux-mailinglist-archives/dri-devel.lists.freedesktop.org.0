Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4424AFAC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7B6E8DA;
	Thu, 20 Aug 2020 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBC06E239
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 964A222CB1;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837584;
 bh=fNW9N6AusheiFXmV7mWclIGD9getU9dPTI/XCu/3ROQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L6+ksVuJx+ejFohyXjN3dasK97Qo1BJckc+oV/R+IMpRVPU5jWhVdnEQy3J9Jrhqa
 IczT7pgxkjUeLfT7BxPUym/FsYFGSMXEOJYw3U3EqAHu7T5oFCBxsTC3jFWob2vAcV
 QQwfYhGL+3A0C6xGN9OTVtpOQ3Ob+WsdUC0vGGD0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Eubw-7P; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 42/49] staging: hikey9xx/gpu: place common definitions at
 kirin9xx_dpe.h
Date: Wed, 19 Aug 2020 13:46:10 +0200
Message-Id: <ede313c1341e1daf11316835f8c76c4f8171f87b.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
 Chen Feng <puck.chen@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Liuyao An <anliuyao@huawei.com>,
 Rongrong Zou <zourongrong@gmail.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are lots of things that are identical for both
Kirin 960 and Kirin 970. Place those identical ones on a
common file, removing unused structs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../gpu/drm/hisilicon/kirin/kirin9xx_dpe.h    | 2411 +++++++++++++
 .../staging/hikey9xx/gpu/kirin960_dpe_reg.h   | 3002 +---------------
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   | 3044 +----------------
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |   22 +-
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |  199 +-
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c |    6 +
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |   12 +-
 drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c   |    6 +
 8 files changed, 2653 insertions(+), 6049 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h b/drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h
new file mode 100644
index 000000000000..e35e8ebb53e1
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin9xx_dpe.h
@@ -0,0 +1,2411 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2016 Linaro Limited.
+ * Copyright (c) 2014-2016 Hisilicon Limited.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __KIRIN_DPE_H__
+#define __KIRIN_DPE_H__
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/wait.h>
+#include <linux/bug.h>
+#include <linux/iommu.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
+
+/* vcc name */
+#define REGULATOR_PDP_NAME	"ldo3"
+
+enum dss_chn_idx {
+	DSS_RCHN_NONE = -1,
+	DSS_RCHN_D2 = 0,
+	DSS_RCHN_D3,
+	DSS_RCHN_V0,
+	DSS_RCHN_G0,
+	DSS_RCHN_V1,
+	DSS_RCHN_G1,
+	DSS_RCHN_D0,
+	DSS_RCHN_D1,
+
+	DSS_WCHN_W0,
+	DSS_WCHN_W1,
+
+	DSS_CHN_MAX,
+
+	DSS_RCHN_V2 = DSS_CHN_MAX,  /*for copybit, only supported in chicago*/
+	DSS_WCHN_W2,
+
+	DSS_COPYBIT_MAX,
+};
+
+struct dss_rect_ltrb {
+	s32 left;
+	s32 top;
+	s32 right;
+	s32 bottom;
+};
+
+enum {
+	DSI_1_LANES = 0,
+	DSI_2_LANES,
+	DSI_3_LANES,
+	DSI_4_LANES,
+};
+
+enum dss_ovl_idx {
+	DSS_OVL0 = 0,
+	DSS_OVL1,
+	DSS_OVL2,
+	DSS_OVL3,
+	DSS_OVL_IDX_MAX,
+};
+
+enum lcd_orientation {
+	LCD_LANDSCAPE = 0,
+	LCD_PORTRAIT,
+};
+
+enum lcd_format {
+	LCD_RGB888 = 0,
+	LCD_RGB101010,
+	LCD_RGB565,
+};
+
+enum lcd_rgb_order {
+	LCD_RGB = 0,
+	LCD_BGR,
+};
+
+enum dss_addr {
+	DSS_ADDR_PLANE0 = 0,
+	DSS_ADDR_PLANE1,
+	DSS_ADDR_PLANE2,
+};
+
+enum dss_transform {
+	DSS_TRANSFORM_NOP = 0x0,
+	DSS_TRANSFORM_FLIP_H = 0x01,
+	DSS_TRANSFORM_FLIP_V = 0x02,
+	DSS_TRANSFORM_ROT = 0x04,
+};
+
+enum dss_dfc_format {
+	DFC_PIXEL_FORMAT_RGB_565 = 0,
+	DFC_PIXEL_FORMAT_XRGB_4444,
+	DFC_PIXEL_FORMAT_ARGB_4444,
+	DFC_PIXEL_FORMAT_XRGB_5551,
+	DFC_PIXEL_FORMAT_ARGB_5551,
+	DFC_PIXEL_FORMAT_XRGB_8888,
+	DFC_PIXEL_FORMAT_ARGB_8888,
+	DFC_PIXEL_FORMAT_BGR_565,
+	DFC_PIXEL_FORMAT_XBGR_4444,
+	DFC_PIXEL_FORMAT_ABGR_4444,
+	DFC_PIXEL_FORMAT_XBGR_5551,
+	DFC_PIXEL_FORMAT_ABGR_5551,
+	DFC_PIXEL_FORMAT_XBGR_8888,
+	DFC_PIXEL_FORMAT_ABGR_8888,
+
+	DFC_PIXEL_FORMAT_YUV444,
+	DFC_PIXEL_FORMAT_YVU444,
+	DFC_PIXEL_FORMAT_YUYV422,
+	DFC_PIXEL_FORMAT_YVYU422,
+	DFC_PIXEL_FORMAT_VYUY422,
+	DFC_PIXEL_FORMAT_UYVY422,
+};
+
+enum dss_dma_format {
+	DMA_PIXEL_FORMAT_RGB_565 = 0,
+	DMA_PIXEL_FORMAT_ARGB_4444,
+	DMA_PIXEL_FORMAT_XRGB_4444,
+	DMA_PIXEL_FORMAT_ARGB_5551,
+	DMA_PIXEL_FORMAT_XRGB_5551,
+	DMA_PIXEL_FORMAT_ARGB_8888,
+	DMA_PIXEL_FORMAT_XRGB_8888,
+
+	DMA_PIXEL_FORMAT_RESERVED0,
+
+	DMA_PIXEL_FORMAT_YUYV_422_Pkg,
+	DMA_PIXEL_FORMAT_YUV_420_SP_HP,
+	DMA_PIXEL_FORMAT_YUV_420_P_HP,
+	DMA_PIXEL_FORMAT_YUV_422_SP_HP,
+	DMA_PIXEL_FORMAT_YUV_422_P_HP,
+	DMA_PIXEL_FORMAT_AYUV_4444,
+};
+
+enum dss_buf_format {
+	DSS_BUF_LINEAR = 0,
+	DSS_BUF_TILE,
+};
+
+enum dss_blend_mode {
+	DSS_BLEND_CLEAR = 0,
+	DSS_BLEND_SRC,
+	DSS_BLEND_DST,
+	DSS_BLEND_SRC_OVER_DST,
+	DSS_BLEND_DST_OVER_SRC,
+	DSS_BLEND_SRC_IN_DST,
+	DSS_BLEND_DST_IN_SRC,
+	DSS_BLEND_SRC_OUT_DST,
+	DSS_BLEND_DST_OUT_SRC,
+	DSS_BLEND_SRC_ATOP_DST,
+	DSS_BLEND_DST_ATOP_SRC,
+	DSS_BLEND_SRC_XOR_DST,
+	DSS_BLEND_SRC_ADD_DST,
+	DSS_BLEND_FIX_OVER,
+	DSS_BLEND_FIX_PER0,
+	DSS_BLEND_FIX_PER1,
+	DSS_BLEND_FIX_PER2,
+	DSS_BLEND_FIX_PER3,
+	DSS_BLEND_FIX_PER4,
+	DSS_BLEND_FIX_PER5,
+	DSS_BLEND_FIX_PER6,
+	DSS_BLEND_FIX_PER7,
+	DSS_BLEND_FIX_PER8,
+	DSS_BLEND_FIX_PER9,
+	DSS_BLEND_FIX_PER10,
+	DSS_BLEND_FIX_PER11,
+	DSS_BLEND_FIX_PER12,
+	DSS_BLEND_FIX_PER13,
+	DSS_BLEND_FIX_PER14,
+	DSS_BLEND_FIX_PER15,
+	DSS_BLEND_FIX_PER16,
+	DSS_BLEND_FIX_PER17,
+
+	DSS_BLEND_MAX,
+};
+
+enum dss_chn_cap {
+	MODULE_CAP_ROT,
+	MODULE_CAP_SCL,
+	MODULE_CAP_CSC,
+	MODULE_CAP_SHARPNESS_1D,
+	MODULE_CAP_SHARPNESS_2D,
+	MODULE_CAP_CE,
+	MODULE_CAP_AFBCD,
+	MODULE_CAP_AFBCE,
+	MODULE_CAP_YUV_PLANAR,
+	MODULE_CAP_YUV_SEMI_PLANAR,
+	MODULE_CAP_YUV_PACKAGE,
+	MODULE_CAP_MAX,
+};
+
+enum dss_ovl_module {
+	MODULE_OVL_BASE,
+	MODULE_MCTL_BASE,
+	MODULE_OVL_MAX,
+};
+
+enum dss_axi_idx {
+	AXI_CHN0 = 0,
+	AXI_CHN1,
+	AXI_CHN_MAX,
+};
+
+
+
+enum dss_rdma_idx {
+	DSS_RDMA0 = 0,
+	DSS_RDMA1,
+	DSS_RDMA2,
+	DSS_RDMA3,
+	DSS_RDMA4,
+	DSS_RDMA_MAX,
+};
+
+/*****************************************************************************/
+
+#define FB_ACCEL_HI62xx	0x1
+#define FB_ACCEL_HI363x	0x2
+#define FB_ACCEL_HI365x	0x4
+#define FB_ACCEL_HI625x	0x8
+#define FB_ACCEL_HI366x	0x10
+#define FB_ACCEL_KIRIN970_ES  0x20
+#define FB_ACCEL_KIRIN970  0x40
+#define FB_ACCEL_KIRIN660  0x80
+#define FB_ACCEL_KIRIN980_ES  0x100
+#define FB_ACCEL_KIRIN980  0x200
+#define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
+#define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
+
+/******************************************************************************/
+
+#define DSS_WCH_MAX  (2)
+
+/******************************************************************************/
+
+#define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
+#define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
+
+#define DSS_MAX_PXL0_CLK_144M (144000000UL)
+
+#define DSS_ADDR  0xE8600000
+#define DSS_DSI_ADDR	(DSS_ADDR + 0x01000)
+#define DSS_LDI_ADDR	(DSS_ADDR + 0x7d000)
+#define PMC_BASE	(0xFFF31000)
+#define PERI_CRG_BASE	(0xFFF35000)
+#define SCTRL_BASE	(0xFFF0A000)
+#define PCTRL_BASE		(0xE8A09000)
+
+#define GPIO_LCD_POWER_1V2  (54)
+#define GPIO_LCD_STANDBY    (67)
+#define GPIO_LCD_RESETN     (65)
+#define GPIO_LCD_GATING     (60)
+#define GPIO_LCD_PCLK_GATING (58)
+#define GPIO_LCD_REFCLK_GATING (59)
+#define GPIO_LCD_SPICS         (168)
+#define GPIO_LCD_DRV_EN        (73)
+
+#define GPIO_PG_SEL_A (72)
+#define GPIO_TX_RX_A (74)
+#define GPIO_PG_SEL_B (76)
+#define GPIO_TX_RX_B (78)
+
+/******************************************************************************/
+
+#define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
+#define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_L1	(300000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
+
+#define DEFAULT_PCLK_DSS_RATE	(114000000UL)
+#define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
+#define DSS_MAX_PXL0_CLK_288M (288000000UL)
+
+/*dss clk power off */
+#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF	(277000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF	(238000000UL)
+
+#define MMBUF_SIZE_MAX	(288 * 1024)
+#define HISI_DSS_CMDLIST_MAX	(16)
+#define HISI_DSS_CMDLIST_IDXS_MAX (0xFFFF)
+#define HISI_DSS_COPYBIT_CMDLIST_IDXS	 (0xC000)
+#define HISI_DSS_DPP_MAX_SUPPORT_BIT (0x7ff)
+#define HISIFB_DSS_PLATFORM_TYPE  (FB_ACCEL_HI366x | FB_ACCEL_PLATFORM_TYPE_ASIC)
+
+#define DSS_MIF_SMMU_SMRX_IDX_STEP (16)
+#define CRG_PERI_DIS3_DEFAULT_VAL     (0x0002F000)
+#define SCF_LINE_BUF	(2560)
+#define DSS_GLB_MODULE_CLK_SEL_DEFAULT_VAL  (0xF0000008)
+#define DSS_LDI_CLK_SEL_DEFAULT_VAL    (0x00000004)
+#define DSS_DBUF_MEM_CTRL_DEFAULT_VAL  (0x00000008)
+#define DSS_SMMU_RLD_EN0_DEFAULT_VAL    (0xffffffff)
+#define DSS_SMMU_RLD_EN1_DEFAULT_VAL    (0xffffff8f)
+#define DSS_SMMU_OUTSTANDING_VAL		(0xf)
+#define DSS_MIF_CTRL2_INVAL_SEL3_STRIDE_MASK		(0xc)
+#define DSS_AFBCE_ENC_OS_CFG_DEFAULT_VAL			(0x7)
+#define TUI_SEC_RCH			(DSS_RCHN_V0)
+#define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
+
+/* perf stat */
+#define DSS_DEVMEM_PERF_BASE (0xFDF10000)
+#define CRG_PERIPH_APB_PERRSTSTAT0_REG (0x68)
+#define CRG_PERIPH_APB_IP_RST_PERF_STAT_BIT (18)
+#define PERF_SAMPSTOP_REG (0x10)
+#define DEVMEM_PERF_SIZE (0x100)
+
+/* dp clock used for hdmi */
+#define DEFAULT_AUXCLK_DPCTRL_RATE	16000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_ES	288000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
+#define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
+
+#define KIRIN970_VCO_MIN_FREQ_OUTPUT         1000000 /*Boston: 1000 * 1000*/
+#define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
+
+#define MIDIA_PPLL7_CTRL0	0x50c
+#define MIDIA_PPLL7_CTRL1	0x510
+
+#define MIDIA_PPLL7_FREQ_DEVIDER_MASK	GENMASK(25, 2)
+#define MIDIA_PPLL7_FRAC_MODE_MASK	GENMASK(25, 0)
+
+#define ACCESS_REGISTER_FN_MAIN_ID_HDCP           0xc500aa01
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_CTRL   (0x55bbccf1)
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_INT   (0x55bbccf2)
+
+/* DSS Registers */
+
+/* MACROS */
+#define DSS_WIDTH(width)	((width) - 1)
+#define DSS_HEIGHT(height)	((height) - 1)
+
+#define RES_540P	(960 * 540)
+#define RES_720P	(1280 * 720)
+#define RES_1080P	(1920 * 1080)
+#define RES_1200P	(1920 * 1200)
+#define RES_1440P	(2560 * 1440)
+#define RES_1600P	(2560 * 1600)
+#define RES_4K_PHONE	(3840 * 2160)
+#define RES_4K_PAD	(3840 * 2400)
+
+#define DFC_MAX_CLIP_NUM	(31)
+
+/* for DFS */
+/* 1480 * 144bits */
+#define DFS_TIME	(80)
+#define DFS_TIME_MIN	(50)
+#define DFS_TIME_MIN_4K	(10)
+#define DBUF0_DEPTH	(1408)
+#define DBUF1_DEPTH	(512)
+#define DBUF_WIDTH_BIT	(144)
+
+#define GET_THD_RQOS_IN(max_depth)	((max_depth) * 10 / 100)
+#define GET_THD_RQOS_OUT(max_depth)	((max_depth) * 30 / 100)
+#define GET_THD_WQOS_IN(max_depth)	((max_depth) * 95 / 100)
+#define GET_THD_WQOS_OUT(max_depth)	((max_depth) * 70 / 100)
+#define GET_THD_CG_IN(max_depth)	((max_depth) - 1)
+#define GET_THD_CG_OUT(max_depth)	((max_depth) * 70 / 100)
+#define GET_FLUX_REQ_IN(max_depth)	((max_depth) * 50 / 100)
+#define GET_FLUX_REQ_OUT(max_depth)	((max_depth) * 90 / 100)
+#define GET_THD_OTHER_DFS_CG_HOLD(max_depth)	(0x20)
+#define GET_THD_OTHER_WR_WAIT(max_depth)	((max_depth) * 90 / 100)
+
+#define GET_RDMA_ROT_HQOS_ASSERT_LEV(max_depth)	((max_depth) * 30 / 100)
+#define GET_RDMA_ROT_HQOS_REMOVE_LEV(max_depth)	((max_depth) * 60 / 100)
+
+#define AXI0_MAX_DSS_CHN_THRESHOLD	(3)
+#define AXI1_MAX_DSS_CHN_THRESHOLD	(3)
+
+#define DEFAULT_AXI_CLK_RATE0	(120 * 1000000)
+#define DEFAULT_AXI_CLK_RATE1	(240 * 1000000)
+#define DEFAULT_AXI_CLK_RATE2	(360 * 1000000)
+#define DEFAULT_AXI_CLK_RATE3	(480 * 1000000)
+#define DEFAULT_AXI_CLK_RATE4	(667 * 1000000)
+#define DEFAULT_AXI_CLK_RATE5	(800 * 1000000)
+
+/*****************************************************************************/
+
+#define PEREN0	(0x000)
+#define PERDIS0	(0x004)
+#define PEREN2	(0x020)
+#define PERDIS2	(0x024)
+#define PERCLKEN2	(0x028)
+#define PERSTAT2	(0x02C)
+#define PEREN3	(0x030)
+#define PERDIS3	(0x034)
+#define PERCLKEN3	(0x038)
+#define PERSTAT3	(0x03C)
+#define PEREN5	(0x050)
+#define PERDIS5	(0x054)
+#define PERCLKEN5	(0x058)
+#define PERSTAT5	(0x05C)
+#define PERRSTDIS0	(0x064)
+#define PERRSTEN2	(0x078)
+#define PERRSTDIS2	(0x07C)
+#define PERRSTEN3	(0x084)
+#define PERRSTDIS3	(0x088)
+#define PERRSTSTAT3 (0x08c)
+#define PERRSTEN4	(0x090)
+#define PERRSTDIS4	(0x094)
+#define PERRSTSTAT4 (0x098)
+#define CLKDIV3	(0x0B4)
+#define CLKDIV5	(0x0BC)
+#define CLKDIV10	(0x0D0)
+#define CLKDIV18	(0x0F0)
+#define CLKDIV20	(0x0F8)
+#define ISOEN	(0x144)
+#define ISODIS	(0x148)
+#define ISOSTAT	(0x14c)
+#define PERPWREN	(0x150)
+#define PERPWRDIS	(0x154)
+#define PERPWRSTAT (0x158)
+#define PERI_AUTODIV8	(0x380)
+#define PERI_AUTODIV9	(0x384)
+#define PERI_AUTODIV10	(0x388)
+
+#define NOC_POWER_IDLEREQ	(0x380)
+#define NOC_POWER_IDLEACK	(0x384)
+#define NOC_POWER_IDLE	(0x388)
+
+#define SCPERCLKEN1 (0x048)
+#define SCCLKDIV2	(0x258)
+#define SCCLKDIV4	(0x260)
+
+#define PERI_CTRL23	(0x060)
+#define PERI_CTRL29	(0x078)
+#define PERI_CTRL30	(0x07C)
+#define PERI_CTRL32	(0x084)
+#define PERI_STAT0	(0x094)
+#define PERI_STAT1	(0x098)
+#define PERI_STAT16	(0x0D4)
+
+#define PCTRL_DPHYTX_ULPSEXIT1	BIT(4)
+#define PCTRL_DPHYTX_ULPSEXIT0	BIT(3)
+
+#define PCTRL_DPHYTX_CTRL1	BIT(1)
+#define PCTRL_DPHYTX_CTRL0	BIT(0)
+
+/*****************************************************************************/
+
+#define BIT_DSS_GLB_INTS	BIT(30)
+#define BIT_MMU_IRPT_S	BIT(29)
+#define BIT_MMU_IRPT_NS	BIT(28)
+#define BIT_DBG_MCTL_INTS	BIT(27)
+#define BIT_DBG_WCH1_INTS	BIT(26)
+#define BIT_DBG_WCH0_INTS	BIT(25)
+#define BIT_DBG_RCH7_INTS	BIT(24)
+#define BIT_DBG_RCH6_INTS	BIT(23)
+#define BIT_DBG_RCH5_INTS	BIT(22)
+#define BIT_DBG_RCH4_INTS	BIT(21)
+#define BIT_DBG_RCH3_INTS	BIT(20)
+#define BIT_DBG_RCH2_INTS	BIT(19)
+#define BIT_DBG_RCH1_INTS	BIT(18)
+#define BIT_DBG_RCH0_INTS	BIT(17)
+#define BIT_ITF0_INTS	BIT(16)
+#define BIT_DPP_INTS	BIT(15)
+#define BIT_CMDLIST13	BIT(14)
+#define BIT_CMDLIST12	BIT(13)
+#define BIT_CMDLIST11	BIT(12)
+#define BIT_CMDLIST10	BIT(11)
+#define BIT_CMDLIST9	BIT(10)
+#define BIT_CMDLIST8	BIT(9)
+#define BIT_CMDLIST7	BIT(8)
+#define BIT_CMDLIST6	BIT(7)
+#define BIT_CMDLIST5	BIT(6)
+#define BIT_CMDLIST4	BIT(5)
+#define BIT_CMDLIST3	BIT(4)
+#define BIT_CMDLIST2	BIT(3)
+#define BIT_CMDLIST1	BIT(2)
+#define BIT_CMDLIST0	BIT(1)
+
+#define BIT_SDP_DSS_GLB_INTS	BIT(29)
+#define BIT_SDP_MMU_IRPT_S	BIT(28)
+#define BIT_SDP_MMU_IRPT_NS	BIT(27)
+#define BIT_SDP_DBG_MCTL_INTS	BIT(26)
+#define BIT_SDP_DBG_WCH1_INTS	BIT(25)
+#define BIT_SDP_DBG_WCH0_INTS	BIT(24)
+#define BIT_SDP_DBG_RCH7_INTS	BIT(23)
+#define BIT_SDP_DBG_RCH6_INTS	BIT(22)
+#define BIT_SDP_DBG_RCH5_INTS	BIT(21)
+#define BIT_SDP_DBG_RCH4_INTS	BIT(20)
+#define BIT_SDP_DBG_RCH3_INTS	BIT(19)
+#define BIT_SDP_DBG_RCH2_INTS	BIT(18)
+#define BIT_SDP_DBG_RCH1_INTS	BIT(17)
+#define BIT_SDP_DBG_RCH0_INTS	BIT(16)
+#define BIT_SDP_ITF1_INTS	BIT(15)
+#define BIT_SDP_CMDLIST13	BIT(14)
+#define BIT_SDP_CMDLIST12	BIT(13)
+#define BIT_SDP_CMDLIST11	BIT(12)
+#define BIT_SDP_CMDLIST10	BIT(11)
+#define BIT_SDP_CMDLIST9	BIT(10)
+#define BIT_SDP_CMDLIST8	BIT(9)
+#define BIT_SDP_CMDLIST7	BIT(8)
+#define BIT_SDP_CMDLIST6	BIT(7)
+#define BIT_SDP_CMDLIST5	BIT(6)
+#define BIT_SDP_CMDLIST4	BIT(5)
+#define BIT_SDP_CMDLIST3	BIT(4)
+#define BIT_SDP_SDP_CMDLIST2	BIT(3)
+#define BIT_SDP_CMDLIST1	BIT(2)
+#define BIT_SDP_CMDLIST0	BIT(1)
+#define BIT_SDP_RCH_CE_INTS	BIT(0)
+
+#define BIT_OFF_DSS_GLB_INTS	BIT(31)
+#define BIT_OFF_MMU_IRPT_S	BIT(30)
+#define BIT_OFF_MMU_IRPT_NS	BIT(29)
+#define BIT_OFF_DBG_MCTL_INTS	BIT(28)
+#define BIT_OFF_DBG_WCH1_INTS	BIT(27)
+#define BIT_OFF_DBG_WCH0_INTS	BIT(26)
+#define BIT_OFF_DBG_RCH7_INTS	BIT(25)
+#define BIT_OFF_DBG_RCH6_INTS	BIT(24)
+#define BIT_OFF_DBG_RCH5_INTS	BIT(23)
+#define BIT_OFF_DBG_RCH4_INTS	BIT(22)
+#define BIT_OFF_DBG_RCH3_INTS	BIT(21)
+#define BIT_OFF_DBG_RCH2_INTS	BIT(20)
+#define BIT_OFF_DBG_RCH1_INTS	BIT(19)
+#define BIT_OFF_DBG_RCH0_INTS	BIT(18)
+#define BIT_OFF_WCH1_INTS	BIT(17)
+#define BIT_OFF_WCH0_INTS	BIT(16)
+#define BIT_OFF_WCH0_WCH1_FRM_END_INT	BIT(15)
+#define BIT_OFF_CMDLIST13	BIT(14)
+#define BIT_OFF_CMDLIST12	BIT(13)
+#define BIT_OFF_CMDLIST11	BIT(12)
+#define BIT_OFF_CMDLIST10	BIT(11)
+#define BIT_OFF_CMDLIST9	BIT(10)
+#define BIT_OFF_CMDLIST8	BIT(9)
+#define BIT_OFF_CMDLIST7	BIT(8)
+#define BIT_OFF_CMDLIST6	BIT(7)
+#define BIT_OFF_CMDLIST5	BIT(6)
+#define BIT_OFF_CMDLIST4	BIT(5)
+#define BIT_OFF_CMDLIST3	BIT(4)
+#define BIT_OFF_CMDLIST2	BIT(3)
+#define BIT_OFF_CMDLIST1	BIT(2)
+#define BIT_OFF_CMDLIST0	BIT(1)
+#define BIT_OFF_RCH_CE_INTS	BIT(0)
+
+#define BIT_OFF_CAM_DBG_WCH2_INTS	BIT(4)
+#define BIT_OFF_CAM_DBG_RCH8_INTS	BIT(3)
+#define BIT_OFF_CAM_WCH2_FRMEND_INTS  BIT(2)
+#define BIT_OFF_CAM_CMDLIST15_INTS	BIT(1)
+#define BIT_OFF_CAM_CMDLIST14_INTS	BIT(0)
+
+#define BIT_VACTIVE_CNT	BIT(14)
+#define BIT_DSI_TE_TRI	BIT(13)
+#define BIT_LCD_TE0_PIN	BIT(12)
+#define BIT_LCD_TE1_PIN	BIT(11)
+#define BIT_VACTIVE1_END	BIT(10)
+#define BIT_VACTIVE1_START	BIT(9)
+#define BIT_VACTIVE0_END	BIT(8)
+#define BIT_VACTIVE0_START	BIT(7)
+#define BIT_VFRONTPORCH	BIT(6)
+#define BIT_VBACKPORCH	BIT(5)
+#define BIT_VSYNC	BIT(4)
+#define BIT_VFRONTPORCH_END	BIT(3)
+#define BIT_LDI_UNFLOW	BIT(2)
+#define BIT_FRM_END	BIT(1)
+#define BIT_FRM_START	BIT(0)
+
+#define BIT_CTL_FLUSH_EN	BIT(21)
+#define BIT_SCF_FLUSH_EN	BIT(19)
+#define BIT_DPP0_FLUSH_EN	BIT(18)
+#define BIT_DBUF1_FLUSH_EN	BIT(17)
+#define BIT_DBUF0_FLUSH_EN	BIT(16)
+#define BIT_OV3_FLUSH_EN	BIT(15)
+#define BIT_OV2_FLUSH_EN	BIT(14)
+#define BIT_OV1_FLUSH_EN	BIT(13)
+#define BIT_OV0_FLUSH_EN	BIT(12)
+#define BIT_WB1_FLUSH_EN	BIT(11)
+#define BIT_WB0_FLUSH_EN	BIT(10)
+#define BIT_DMA3_FLUSH_EN	BIT(9)
+#define BIT_DMA2_FLUSH_EN	BIT(8)
+#define BIT_DMA1_FLUSH_EN	BIT(7)
+#define BIT_DMA0_FLUSH_EN	BIT(6)
+#define BIT_RGB1_FLUSH_EN	BIT(4)
+#define BIT_RGB0_FLUSH_EN	BIT(3)
+#define BIT_VIG1_FLUSH_EN	BIT(1)
+#define BIT_VIG0_FLUSH_EN	BIT(0)
+
+#define BIT_BUS_DBG_INT	BIT(5)
+#define BIT_CRC_SUM_INT	BIT(4)
+#define BIT_CRC_ITF1_INT	BIT(3)
+#define BIT_CRC_ITF0_INT	BIT(2)
+#define BIT_CRC_OV1_INT	BIT(1)
+#define BIT_CRC_OV0_INT	BIT(0)
+
+#define BIT_SBL_SEND_FRAME_OUT	BIT(19)
+#define BIT_SBL_STOP_FRAME_OUT	BIT(18)
+#define BIT_SBL_BACKLIGHT_OUT	BIT(17)
+#define BIT_SBL_DARKENH_OUT		BIT(16)
+#define BIT_SBL_BRIGHTPTR_OUT	BIT(15)
+#define BIT_STRENGTH_INROI_OUT	BIT(14)
+#define BIT_STRENGTH_OUTROI_OUT	BIT(13)
+#define BIT_DONE_OUT			BIT(12)
+#define BIT_PPROC_DONE_OUT		BIT(11)
+
+#define BIT_HIACE_IND	BIT(8)
+#define BIT_STRENGTH_INTP	BIT(7)
+#define BIT_BACKLIGHT_INTP	BIT(6)
+#define BIT_CE_END_IND	BIT(5)
+#define BIT_CE_CANCEL_IND	BIT(4)
+#define BIT_CE_LUT1_RW_COLLIDE_IND	BIT(3)
+#define BIT_CE_LUT0_RW_COLLIDE_IND	BIT(2)
+#define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
+#define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
+
+/* MODULE BASE ADDRESS */
+
+#define DSS_MIPI_DSI0_OFFSET	(0x00001000)
+#define DSS_MIPI_DSI1_OFFSET	(0x00001400)
+
+#define DSS_GLB0_OFFSET	(0x12000)
+
+#define DSS_DBG_OFFSET	(0x11000)
+
+#define DSS_CMDLIST_OFFSET	(0x2000)
+
+#define DSS_VBIF0_AIF	(0x7000)
+#define DSS_VBIF1_AIF	(0x9000)
+
+#define DSS_MIF_OFFSET	(0xA000)
+
+#define DSS_MCTRL_SYS_OFFSET	(0x10000)
+
+#define DSS_MCTRL_CTL0_OFFSET	(0x10800)
+#define DSS_MCTRL_CTL1_OFFSET	(0x10900)
+#define DSS_MCTRL_CTL2_OFFSET	(0x10A00)
+#define DSS_MCTRL_CTL3_OFFSET	(0x10B00)
+#define DSS_MCTRL_CTL4_OFFSET	(0x10C00)
+#define DSS_MCTRL_CTL5_OFFSET	(0x10D00)
+
+#define DSS_RCH_VG0_DMA_OFFSET	(0x20000)
+#define DSS_RCH_VG0_DFC_OFFSET (0x20100)
+#define DSS_RCH_VG0_SCL_OFFSET	(0x20200)
+#define DSS_RCH_VG0_ARSR_OFFSET	(0x20300)
+#define DSS_RCH_VG0_PCSC_OFFSET	(0x20400)
+#define DSS_RCH_VG0_CSC_OFFSET	(0x20500)
+#define DSS_RCH_VG0_DEBUG_OFFSET	(0x20600)
+#define DSS_RCH_VG0_VPP_OFFSET	(0x20700)
+#define DSS_RCH_VG0_DMA_BUF_OFFSET	(0x20800)
+#define DSS_RCH_VG0_AFBCD_OFFSET	(0x20900)
+#define DSS_RCH_VG0_REG_DEFAULT_OFFSET	(0x20A00)
+#define DSS_RCH_VG0_SCL_LUT_OFFSET	(0x21000)
+#define DSS_RCH_VG0_ARSR_LUT_OFFSET	(0x25000)
+
+#define DSS_RCH_VG1_DMA_OFFSET	(0x28000)
+#define DSS_RCH_VG1_DFC_OFFSET (0x28100)
+#define DSS_RCH_VG1_SCL_OFFSET	(0x28200)
+#define DSS_RCH_VG1_CSC_OFFSET	(0x28500)
+#define DSS_RCH_VG1_DEBUG_OFFSET	(0x28600)
+#define DSS_RCH_VG1_VPP_OFFSET	(0x28700)
+#define DSS_RCH_VG1_DMA_BUF_OFFSET	(0x28800)
+#define DSS_RCH_VG1_AFBCD_OFFSET	(0x28900)
+#define DSS_RCH_VG1_REG_DEFAULT_OFFSET	(0x28A00)
+#define DSS_RCH_VG1_SCL_LUT_OFFSET	(0x29000)
+
+#define DSS_RCH_VG2_DMA_OFFSET	(0x30000)
+#define DSS_RCH_VG2_DFC_OFFSET (0x30100)
+#define DSS_RCH_VG2_SCL_OFFSET	(0x30200)
+#define DSS_RCH_VG2_CSC_OFFSET	(0x30500)
+#define DSS_RCH_VG2_DEBUG_OFFSET	(0x30600)
+#define DSS_RCH_VG2_VPP_OFFSET	(0x30700)
+#define DSS_RCH_VG2_DMA_BUF_OFFSET	(0x30800)
+#define DSS_RCH_VG2_REG_DEFAULT_OFFSET	(0x30A00)
+#define DSS_RCH_VG2_SCL_LUT_OFFSET	(0x31000)
+
+#define DSS_RCH_G0_DMA_OFFSET	(0x38000)
+#define DSS_RCH_G0_DFC_OFFSET	(0x38100)
+#define DSS_RCH_G0_SCL_OFFSET	(0x38200)
+#define DSS_RCH_G0_CSC_OFFSET (0x38500)
+#define DSS_RCH_G0_DEBUG_OFFSET (0x38600)
+#define DSS_RCH_G0_DMA_BUF_OFFSET (0x38800)
+#define DSS_RCH_G0_AFBCD_OFFSET (0x38900)
+#define DSS_RCH_G0_REG_DEFAULT_OFFSET (0x38A00)
+
+#define DSS_RCH_G1_DMA_OFFSET	(0x40000)
+#define DSS_RCH_G1_DFC_OFFSET	(0x40100)
+#define DSS_RCH_G1_SCL_OFFSET	(0x40200)
+#define DSS_RCH_G1_CSC_OFFSET (0x40500)
+#define DSS_RCH_G1_DEBUG_OFFSET (0x40600)
+#define DSS_RCH_G1_DMA_BUF_OFFSET (0x40800)
+#define DSS_RCH_G1_AFBCD_OFFSET (0x40900)
+#define DSS_RCH_G1_REG_DEFAULT_OFFSET (0x40A00)
+
+#define DSS_RCH_D2_DMA_OFFSET	(0x50000)
+#define DSS_RCH_D2_DFC_OFFSET	(0x50100)
+#define DSS_RCH_D2_CSC_OFFSET	(0x50500)
+#define DSS_RCH_D2_DEBUG_OFFSET	(0x50600)
+#define DSS_RCH_D2_DMA_BUF_OFFSET	(0x50800)
+
+#define DSS_RCH_D3_DMA_OFFSET	(0x51000)
+#define DSS_RCH_D3_DFC_OFFSET	(0x51100)
+#define DSS_RCH_D3_CSC_OFFSET	(0x51500)
+#define DSS_RCH_D3_DEBUG_OFFSET	(0x51600)
+#define DSS_RCH_D3_DMA_BUF_OFFSET	(0x51800)
+
+#define DSS_RCH_D0_DMA_OFFSET	(0x52000)
+#define DSS_RCH_D0_DFC_OFFSET	(0x52100)
+#define DSS_RCH_D0_CSC_OFFSET	(0x52500)
+#define DSS_RCH_D0_DEBUG_OFFSET	(0x52600)
+#define DSS_RCH_D0_DMA_BUF_OFFSET	(0x52800)
+#define DSS_RCH_D0_AFBCD_OFFSET	(0x52900)
+
+#define DSS_RCH_D1_DMA_OFFSET	(0x53000)
+#define DSS_RCH_D1_DFC_OFFSET	(0x53100)
+#define DSS_RCH_D1_CSC_OFFSET	(0x53500)
+#define DSS_RCH_D1_DEBUG_OFFSET	(0x53600)
+#define DSS_RCH_D1_DMA_BUF_OFFSET	(0x53800)
+
+#define DSS_WCH0_DMA_OFFSET	(0x5A000)
+#define DSS_WCH0_DFC_OFFSET	(0x5A100)
+#define DSS_WCH0_CSC_OFFSET	(0x5A500)
+#define DSS_WCH0_DEBUG_OFFSET	(0x5A600)
+#define DSS_WCH0_DMA_BUFFER_OFFSET	(0x5A800)
+#define DSS_WCH0_AFBCE_OFFSET	(0x5A900)
+
+#define DSS_WCH1_DMA_OFFSET	(0x5C000)
+#define DSS_WCH1_DFC_OFFSET	(0x5C100)
+#define DSS_WCH1_CSC_OFFSET	(0x5C500)
+#define DSS_WCH1_DEBUG_OFFSET	(0x5C600)
+#define DSS_WCH1_DMA_BUFFER_OFFSET	(0x5C800)
+#define DSS_WCH1_AFBCE_OFFSET	(0x5C900)
+
+#define DSS_WCH2_DMA_OFFSET	(0x5E000)
+#define DSS_WCH2_DFC_OFFSET	(0x5E100)
+#define DSS_WCH2_CSC_OFFSET	(0x5E500)
+#define DSS_WCH2_ROT_OFFSET	(0x5E500)
+#define DSS_WCH2_DEBUG_OFFSET	(0x5E600)
+#define DSS_WCH2_DMA_BUFFER_OFFSET	(0x5E800)
+#define DSS_WCH2_AFBCE_OFFSET	(0x5E900)
+
+#define DSS_OVL0_OFFSET	(0x60000)
+#define DSS_OVL1_OFFSET	(0x60400)
+#define DSS_OVL2_OFFSET	(0x60800)
+#define DSS_OVL3_OFFSET	(0x60C00)
+
+#define DSS_DBUF0_OFFSET	(0x6D000)
+#define DSS_DBUF1_OFFSET	(0x6E000)
+
+#define DSS_HI_ACE_OFFSET	(0x6F000)
+
+#define DSS_DPP_OFFSET	(0x70000)
+#define DSS_TOP_OFFSET	(0x70000)
+#define DSS_DPP_COLORBAR_OFFSET	(0x70100)
+#define DSS_DPP_DITHER_OFFSET	(0x70200)
+#define DSS_DPP_CSC_RGB2YUV10B_OFFSET	(0x70300)
+#define DSS_DPP_CSC_YUV2RGB10B_OFFSET	(0x70400)
+#define DSS_DPP_GAMA_OFFSET	(0x70600)
+#define DSS_DPP_ACM_OFFSET	(0x70700)
+#define DSS_DPP_ACE_OFFSET	(0x70800)
+#define DSS_DPP_GAMA_LUT_OFFSET	(0x71000)
+#define DSS_DPP_ACM_LUT_OFFSET	(0x72000)
+#define DSS_DPP_ACE_LUT_OFFSET	(0x79000)
+
+#define DSS_DPP_SBL_OFFSET	(0x7C000)
+#define DSS_LDI0_OFFSET	(0x7D000)
+#define DSS_IFBC_OFFSET	(0x7D800)
+#define DSS_DSC_OFFSET	(0x7DC00)
+#define DSS_LDI1_OFFSET	(0x7E000)
+
+/* GLB */
+#define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
+
+#define GLB_APB_CTL	 (DSS_GLB0_OFFSET + 0x0004)
+
+#define GLB_DSS_AXI_RST_EN	(DSS_GLB0_OFFSET + 0x0118)
+#define GLB_DSS_APB_RST_EN	(DSS_GLB0_OFFSET + 0x011C)
+#define GLB_DSS_CORE_RST_EN	(DSS_GLB0_OFFSET + 0x0120)
+#define GLB_PXL0_DIV2_RST_EN	(DSS_GLB0_OFFSET + 0x0124)
+#define GLB_PXL0_DIV4_RST_EN	(DSS_GLB0_OFFSET + 0x0128)
+#define GLB_PXL0_RST_EN	(DSS_GLB0_OFFSET + 0x012C)
+#define GLB_PXL0_DSI_RST_EN	(DSS_GLB0_OFFSET + 0x0130)
+#define GLB_DSS_PXL1_RST_EN	(DSS_GLB0_OFFSET + 0x0134)
+#define GLB_MM_AXI_CLK_RST_EN	(DSS_GLB0_OFFSET + 0x0138)
+#define GLB_AFBCD0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0140)
+#define GLB_AFBCD1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0144)
+#define GLB_AFBCD2_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0148)
+#define GLB_AFBCD3_IP_RST_EN	(DSS_GLB0_OFFSET + 0x014C)
+#define GLB_AFBCD4_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0150)
+#define GLB_AFBCD5_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0154)
+#define GLB_AFBCD6_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0158)
+#define GLB_AFBCD7_IP_RST_EN	(DSS_GLB0_OFFSET + 0x015C)
+#define GLB_AFBCE0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0160)
+#define GLB_AFBCE1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0164)
+
+#define GLB_MCU_PDP_INTS	(DSS_GLB0_OFFSET + 0x20C)
+#define GLB_MCU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x210)
+#define GLB_MCU_SDP_INTS	(DSS_GLB0_OFFSET + 0x214)
+#define GLB_MCU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x218)
+#define GLB_MCU_OFF_INTS	(DSS_GLB0_OFFSET + 0x21C)
+#define GLB_MCU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x220)
+#define GLB_MCU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2B4)
+#define GLB_MCU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B8)
+#define GLB_CPU_PDP_INTS	(DSS_GLB0_OFFSET + 0x224)
+#define GLB_CPU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x228)
+#define GLB_CPU_SDP_INTS	(DSS_GLB0_OFFSET + 0x22C)
+#define GLB_CPU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x230)
+#define GLB_CPU_OFF_INTS	(DSS_GLB0_OFFSET + 0x234)
+#define GLB_CPU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x238)
+#define GLB_CPU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2AC)
+#define GLB_CPU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B0)
+
+#define GLB_MODULE_CLK_SEL	(DSS_GLB0_OFFSET + 0x0300)
+#define GLB_MODULE_CLK_EN	(DSS_GLB0_OFFSET + 0x0304)
+
+#define GLB_GLB0_DBG_SEL	(DSS_GLB0_OFFSET + 0x310)
+#define GLB_GLB1_DBG_SEL	(DSS_GLB0_OFFSET + 0x314)
+#define GLB_DBG_IRQ_CPU	(DSS_GLB0_OFFSET + 0x320)
+#define GLB_DBG_IRQ_MCU	(DSS_GLB0_OFFSET + 0x324)
+
+#define GLB_TP_SEL	(DSS_GLB0_OFFSET + 0x0400)
+#define GLB_CRC_DBG_LDI0	(DSS_GLB0_OFFSET + 0x0404)
+#define GLB_CRC_DBG_LDI1	(DSS_GLB0_OFFSET + 0x0408)
+#define GLB_CRC_LDI0_EN	(DSS_GLB0_OFFSET + 0x040C)
+#define GLB_CRC_LDI0_FRM	(DSS_GLB0_OFFSET + 0x0410)
+#define GLB_CRC_LDI1_EN	(DSS_GLB0_OFFSET + 0x0414)
+#define GLB_CRC_LDI1_FRM	(DSS_GLB0_OFFSET + 0x0418)
+
+#define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
+#define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
+
+/* DBG */
+#define DBG_CRC_DBG_OV0	(0x0000)
+#define DBG_CRC_DBG_OV1	(0x0004)
+#define DBG_CRC_DBG_SUM	(0x0008)
+#define DBG_CRC_OV0_EN	(0x000C)
+#define DBG_DSS_GLB_DBG_O	(0x0010)
+#define DBG_DSS_GLB_DBG_I	(0x0014)
+#define DBG_CRC_OV0_FRM	(0x0018)
+#define DBG_CRC_OV1_EN	(0x001C)
+#define DBG_CRC_OV1_FRM	(0x0020)
+#define DBG_CRC_SUM_EN	(0x0024)
+#define DBG_CRC_SUM_FRM	(0x0028)
+
+#define DBG_MCTL_INTS	(0x023C)
+#define DBG_MCTL_INT_MSK	(0x0240)
+#define DBG_WCH0_INTS	(0x0244)
+#define DBG_WCH0_INT_MSK	(0x0248)
+#define DBG_WCH1_INTS	(0x024C)
+#define DBG_WCH1_INT_MSK	(0x0250)
+#define DBG_RCH0_INTS	(0x0254)
+#define DBG_RCH0_INT_MSK	(0x0258)
+#define DBG_RCH1_INTS	(0x025C)
+#define DBG_RCH1_INT_MSK	(0x0260)
+#define DBG_RCH2_INTS	(0x0264)
+#define DBG_RCH2_INT_MSK	(0x0268)
+#define DBG_RCH3_INTS	(0x026C)
+#define DBG_RCH3_INT_MSK	(0x0270)
+#define DBG_RCH4_INTS	(0x0274)
+#define DBG_RCH4_INT_MSK	(0x0278)
+#define DBG_RCH5_INTS	(0x027C)
+#define DBG_RCH5_INT_MSK	(0x0280)
+#define DBG_RCH6_INTS	(0x0284)
+#define DBG_RCH6_INT_MSK	(0x0288)
+#define DBG_RCH7_INTS	(0x028C)
+#define DBG_RCH7_INT_MSK	(0x0290)
+#define DBG_DSS_GLB_INTS	(0x0294)
+#define DBG_DSS_GLB_INT_MSK	(0x0298)
+#define DBG_WCH2_INTS	(0x029C)
+#define DBG_WCH2_INT_MSK	(0x02A0)
+#define DBG_RCH8_INTS	(0x02A4)
+#define DBG_RCH8_INT_MSK	(0x02A8)
+
+/* CMDLIST */
+
+#define CMDLIST_CH0_PENDING_CLR	(0x0000)
+#define CMDLIST_CH0_CTRL	(0x0004)
+#define CMDLIST_CH0_STATUS	(0x0008)
+#define CMDLIST_CH0_STAAD	(0x000C)
+#define CMDLIST_CH0_CURAD	(0x0010)
+#define CMDLIST_CH0_INTE	(0x0014)
+#define CMDLIST_CH0_INTC	(0x0018)
+#define CMDLIST_CH0_INTS	(0x001C)
+#define CMDLIST_CH0_SCENE	(0x0020)
+#define CMDLIST_CH0_DBG	(0x0028)
+
+#define CMDLIST_DBG	(0x0700)
+#define CMDLIST_BUF_DBG_EN	(0x0704)
+#define CMDLIST_BUF_DBG_CNT_CLR	(0x0708)
+#define CMDLIST_BUF_DBG_CNT	(0x070C)
+#define CMDLIST_TIMEOUT_TH	(0x0710)
+#define CMDLIST_START	(0x0714)
+#define CMDLIST_ADDR_MASK_EN	(0x0718)
+#define CMDLIST_ADDR_MASK_DIS	(0x071C)
+#define CMDLIST_ADDR_MASK_STATUS	(0x0720)
+#define CMDLIST_TASK_CONTINUE	(0x0724)
+#define CMDLIST_TASK_STATUS	(0x0728)
+#define CMDLIST_CTRL	(0x072C)
+#define CMDLIST_SECU	(0x0730)
+#define CMDLIST_INTS	(0x0734)
+#define CMDLIST_SWRST	(0x0738)
+#define CMD_MEM_CTRL	(0x073C)
+#define CMD_CLK_SEL		(0x0740)
+#define CMD_CLK_EN	(0x0744)
+
+#define HISI_DSS_MIN_ROT_AFBCE_BLOCK_SIZE (256)
+#define HISI_DSS_MAX_ROT_AFBCE_BLOCK_SIZE (480)
+
+#define BIT_CMDLIST_CH_TASKDONE_INTS	    BIT(7)
+#define BIT_CMDLIST_CH_TIMEOUT_INTS	    BIT(6)
+#define BIT_CMDLIST_CH_BADCMD_INTS	    BIT(5)
+#define BIT_CMDLIST_CH_START_INTS	           BIT(4)
+#define BIT_CMDLIST_CH_PENDING_INTS	    BIT(3)
+#define BIT_CMDLIST_CH_AXIERR_INTS	    BIT(2)
+#define BIT_CMDLIST_CH_ALLDONE_INTS	    BIT(1)
+#define BIT_CMDLIST_CH_ONEDONE_INTS	    BIT(0)
+
+#define BIT_CMDLIST_CH15_INTS	BIT(15)
+#define BIT_CMDLIST_CH14_INTS	BIT(14)
+#define BIT_CMDLIST_CH13_INTS	BIT(13)
+#define BIT_CMDLIST_CH12_INTS	BIT(12)
+#define BIT_CMDLIST_CH11_INTS	BIT(11)
+#define BIT_CMDLIST_CH10_INTS	BIT(10)
+#define BIT_CMDLIST_CH9_INTS	BIT(9)
+#define BIT_CMDLIST_CH8_INTS	BIT(8)
+#define BIT_CMDLIST_CH7_INTS	BIT(7)
+#define BIT_CMDLIST_CH6_INTS	BIT(6)
+#define BIT_CMDLIST_CH5_INTS	BIT(5)
+#define BIT_CMDLIST_CH4_INTS	BIT(4)
+#define BIT_CMDLIST_CH3_INTS	BIT(3)
+#define BIT_CMDLIST_CH2_INTS	BIT(2)
+#define BIT_CMDLIST_CH1_INTS	BIT(1)
+#define BIT_CMDLIST_CH0_INTS	BIT(0)
+
+/* AIF */
+#define AIF0_CH0_OFFSET	(DSS_VBIF0_AIF + 0x00)
+#define AIF0_CH1_OFFSET	(DSS_VBIF0_AIF + 0x20)
+#define AIF0_CH2_OFFSET	(DSS_VBIF0_AIF + 0x40)
+#define AIF0_CH3_OFFSET	(DSS_VBIF0_AIF + 0x60)
+#define AIF0_CH4_OFFSET	(DSS_VBIF0_AIF + 0x80)
+#define AIF0_CH5_OFFSET	(DSS_VBIF0_AIF + 0xA0)
+#define AIF0_CH6_OFFSET	(DSS_VBIF0_AIF + 0xC0)
+#define AIF0_CH7_OFFSET	(DSS_VBIF0_AIF + 0xE0)
+#define AIF0_CH8_OFFSET	(DSS_VBIF0_AIF + 0x100)
+#define AIF0_CH9_OFFSET	(DSS_VBIF0_AIF + 0x120)
+#define AIF0_CH10_OFFSET	(DSS_VBIF0_AIF + 0x140)
+#define AIF0_CH11_OFFSET	(DSS_VBIF0_AIF + 0x160)
+#define AIF0_CH12_OFFSET	(DSS_VBIF0_AIF + 0x180)
+
+#define AIF1_CH0_OFFSET	(DSS_VBIF1_AIF + 0x00)
+#define AIF1_CH1_OFFSET	(DSS_VBIF1_AIF + 0x20)
+#define AIF1_CH2_OFFSET	(DSS_VBIF1_AIF + 0x40)
+#define AIF1_CH3_OFFSET	(DSS_VBIF1_AIF + 0x60)
+#define AIF1_CH4_OFFSET	(DSS_VBIF1_AIF + 0x80)
+#define AIF1_CH5_OFFSET	(DSS_VBIF1_AIF + 0xA0)
+#define AIF1_CH6_OFFSET	(DSS_VBIF1_AIF + 0xC0)
+#define AIF1_CH7_OFFSET	(DSS_VBIF1_AIF + 0xE0)
+#define AIF1_CH8_OFFSET	(DSS_VBIF1_AIF + 0x100)
+#define AIF1_CH9_OFFSET	(DSS_VBIF1_AIF + 0x120)
+#define AIF1_CH10_OFFSET	(DSS_VBIF1_AIF + 0x140)
+#define AIF1_CH11_OFFSET	(DSS_VBIF1_AIF + 0x160)
+#define AIF1_CH12_OFFSET	(DSS_VBIF1_AIF + 0x180)
+
+/* aif dmax */
+
+#define AIF_CH_CTL	(0x0000)
+
+#define AIF_CH_CTL_ADD (0x0004)
+
+/* aif common */
+#define AXI0_RID_MSK0	(0x0800)
+#define AXI0_RID_MSK1	(0x0804)
+#define AXI0_WID_MSK	(0x0808)
+#define AXI0_R_QOS_MAP	(0x080c)
+#define AXI1_RID_MSK0	(0x0810)
+#define AXI1_RID_MSK1	(0x0814)
+#define AXI1_WID_MSK	(0x0818)
+#define AXI1_R_QOS_MAP	(0x081c)
+#define AIF_CLK_SEL0	(0x0820)
+#define AIF_CLK_SEL1	(0x0824)
+#define AIF_CLK_EN0	(0x0828)
+#define AIF_CLK_EN1	(0x082c)
+#define MONITOR_CTRL	(0x0830)
+#define MONITOR_TIMER_INI	(0x0834)
+#define DEBUG_BUF_BASE	(0x0838)
+#define DEBUG_CTRL	(0x083C)
+#define AIF_SHADOW_READ	(0x0840)
+#define AIF_MEM_CTRL	(0x0844)
+#define AIF_MONITOR_EN	(0x0848)
+#define AIF_MONITOR_CTRL	(0x084C)
+#define AIF_MONITOR_SAMPLE_MUN	(0x0850)
+#define AIF_MONITOR_SAMPLE_TIME	(0x0854)
+#define AIF_MONITOR_SAMPLE_FLOW	(0x0858)
+
+/* aif debug */
+#define AIF_MONITOR_READ_DATA	(0x0880)
+#define AIF_MONITOR_WRITE_DATA	(0x0884)
+#define AIF_MONITOR_WINDOW_CYCLE	(0x0888)
+#define AIF_MONITOR_WBURST_CNT	(0x088C)
+#define AIF_MONITOR_MIN_WR_CYCLE	(0x0890)
+#define AIF_MONITOR_MAX_WR_CYCLE	(0x0894)
+#define AIF_MONITOR_AVR_WR_CYCLE	(0x0898)
+#define AIF_MONITOR_MIN_WRW_CYCLE	(0x089C)
+#define AIF_MONITOR_MAX_WRW_CYCLE	(0x08A0)
+#define AIF_MONITOR_AVR_WRW_CYCLE	(0x08A4)
+#define AIF_MONITOR_RBURST_CNT	(0x08A8)
+#define AIF_MONITOR_MIN_RD_CYCLE	(0x08AC)
+#define AIF_MONITOR_MAX_RD_CYCLE	(0x08B0)
+#define AIF_MONITOR_AVR_RD_CYCLE	(0x08B4)
+#define AIF_MONITOR_MIN_RDW_CYCLE	(0x08B8)
+#define AIF_MONITOR_MAX_RDW_CYCLE	(0x08BC)
+#define AIF_MONITOR_AVR_RDW_CYCLE	(0x08C0)
+#define AIF_CH_STAT_0	(0x08C4)
+#define AIF_CH_STAT_1	(0x08C8)
+
+#define AIF_MODULE_CLK_SEL	(0x0A04)
+#define AIF_MODULE_CLK_EN	(0x0A08)
+
+/* MIF */
+
+/*
+ * stretch blt, linear/tile, rotation, pixel format
+ * 0 0 000
+ */
+enum dss_mmu_tlb_tag_org {
+	MMU_TLB_TAG_ORG_0x0 = 0x0,
+	MMU_TLB_TAG_ORG_0x1 = 0x1,
+	MMU_TLB_TAG_ORG_0x2 = 0x2,
+	MMU_TLB_TAG_ORG_0x3 = 0x3,
+	MMU_TLB_TAG_ORG_0x4 = 0x4,
+	MMU_TLB_TAG_ORG_0x7 = 0x7,
+
+	MMU_TLB_TAG_ORG_0x8 = 0x8,
+	MMU_TLB_TAG_ORG_0x9 = 0x9,
+	MMU_TLB_TAG_ORG_0xA = 0xA,
+	MMU_TLB_TAG_ORG_0xB = 0xB,
+	MMU_TLB_TAG_ORG_0xC = 0xC,
+	MMU_TLB_TAG_ORG_0xF = 0xF,
+
+	MMU_TLB_TAG_ORG_0x10 = 0x10,
+	MMU_TLB_TAG_ORG_0x11 = 0x11,
+	MMU_TLB_TAG_ORG_0x12 = 0x12,
+	MMU_TLB_TAG_ORG_0x13 = 0x13,
+	MMU_TLB_TAG_ORG_0x14 = 0x14,
+	MMU_TLB_TAG_ORG_0x17 = 0x17,
+
+	MMU_TLB_TAG_ORG_0x18 = 0x18,
+	MMU_TLB_TAG_ORG_0x19 = 0x19,
+	MMU_TLB_TAG_ORG_0x1A = 0x1A,
+	MMU_TLB_TAG_ORG_0x1B = 0x1B,
+	MMU_TLB_TAG_ORG_0x1C = 0x1C,
+	MMU_TLB_TAG_ORG_0x1F = 0x1F,
+};
+
+#define MIF_ENABLE	(0x0000)
+#define MIF_MEM_CTRL	(0x0004)
+
+#define MIF_CTRL0	(0x000)
+#define MIF_CTRL1	(0x004)
+#define MIF_CTRL2	(0x008)
+#define MIF_CTRL3	(0x00C)
+#define MIF_CTRL4	(0x010)
+#define MIF_CTRL5	(0x014)
+#define REG_DEFAULT (0x0500)
+#define MIF_SHADOW_READ	(0x0504)
+#define MIF_CLK_CTL	(0x0508)
+
+#define MIF_STAT0	(0x0600)
+
+#define MIF_STAT1	(0x0604)
+
+#define MIF_STAT2	(0x0608)
+
+#define MIF_CTRL_OFFSET	(0x20)
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
+#define MIF_CTRL_NUM	(12)
+
+#define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
+#define MIF_STRIDE_UNIT (4 * 1024)
+
+/* SMMU */
+#define SMMU_SCR	(0x0000)
+#define SMMU_MEMCTRL	(0x0004)
+#define SMMU_LP_CTRL	(0x0008)
+#define SMMU_PRESS_REMAP	(0x000C)
+#define SMMU_INTMASK_NS	(0x0010)
+#define SMMU_INTRAW_NS	(0x0014)
+#define SMMU_INTSTAT_NS	(0x0018)
+#define SMMU_INTCLR_NS	(0x001C)
+
+#define SMMU_SMRx_NS	(0x0020)
+#define SMMU_RLD_EN0_NS	(0x01F0)
+#define SMMU_RLD_EN1_NS	(0x01F4)
+#define SMMU_RLD_EN2_NS	(0x01F8)
+#define SMMU_CB_SCTRL	(0x0200)
+#define SMMU_CB_TTBR0	(0x0204)
+#define SMMU_CB_TTBR1	(0x0208)
+#define SMMU_CB_TTBCR	(0x020C)
+#define SMMU_OFFSET_ADDR_NS	(0x0210)
+#define SMMU_SCACHEI_ALL	(0x0214)
+#define SMMU_SCACHEI_L1	(0x0218)
+#define SMMU_SCACHEI_L2L3	(0x021C)
+#define SMMU_FAMA_CTRL0	(0x0220)
+#define SMMU_FAMA_CTRL1	(0x0224)
+#define SMMU_ADDR_MSB	(0x0300)
+#define SMMU_ERR_RDADDR	(0x0304)
+#define SMMU_ERR_WRADDR	(0x0308)
+#define SMMU_FAULT_ADDR_TCU (0x0310)
+#define SMMU_FAULT_ID_TCU	(0x0314)
+
+#define SMMU_FAULT_ADDR_TBUx	(0x0320)
+#define SMMU_FAULT_ID_TBUx	(0x0324)
+#define SMMU_FAULT_INFOx	(0x0328)
+#define SMMU_DBGRPTR_TLB	(0x0380)
+#define SMMU_DBGRDATA_TLB	(0x0380)
+#define SMMU_DBGRDATA0_CACHE	(0x038C)
+#define SMMU_DBGRDATA1_CACHE	(0x0390)
+#define SMMU_DBGAXI_CTRL	(0x0394)
+#define SMMU_OVA_ADDR	(0x0398)
+#define SMMU_OPA_ADDR	(0x039C)
+#define SMMU_OVA_CTRL	(0x03A0)
+#define SMMU_OPREF_ADDR	(0x03A4)
+#define SMMU_OPREF_CTRL	(0x03A8)
+#define SMMU_OPREF_CNT	(0x03AC)
+
+#define SMMU_SMRx_S	(0x0500)
+#define SMMU_RLD_EN0_S	(0x06F0)
+#define SMMU_RLD_EN1_S	(0x06F4)
+#define SMMU_RLD_EN2_S	(0x06F8)
+#define SMMU_INTMAS_S	(0x0700)
+#define SMMU_INTRAW_S	(0x0704)
+#define SMMU_INTSTAT_S	(0x0708)
+#define SMMU_INTCLR_S	(0x070C)
+#define SMMU_SCR_S	(0x0710)
+#define SMMU_SCB_SCTRL	(0x0714)
+#define SMMU_SCB_TTBR	(0x0718)
+#define SMMU_SCB_TTBCR	(0x071C)
+#define SMMU_OFFSET_ADDR_S	(0x0720)
+
+#define SMMU_SID_NUM	(64)
+
+/* RDMA */
+
+#define DMA_OFT_X0	(0x0000)
+#define DMA_OFT_Y0	(0x0004)
+#define DMA_OFT_X1	(0x0008)
+#define DMA_OFT_Y1	(0x000C)
+#define DMA_MASK0	(0x0010)
+#define DMA_MASK1	(0x0014)
+#define DMA_STRETCH_SIZE_VRT	(0x0018)
+#define DMA_CTRL	(0x001C)
+#define DMA_TILE_SCRAM	(0x0020)
+
+#define DMA_PULSE	(0x0028)
+#define DMA_CORE_GT	(0x002C)
+#define RWCH_CFG0	(0x0030)
+
+#define WDMA_DMA_SW_MASK_EN	(0x004C)
+#define WDMA_DMA_START_MASK0	(0x0050)
+#define WDMA_DMA_END_MASK0	(0x0054)
+#define WDMA_DMA_START_MASK1	(0x0058)
+#define WDMA_DMA_END_MASK1	(0x005C)
+
+#define DMA_DATA_ADDR0	(0x0060)
+#define DMA_STRIDE0	(0x0064)
+#define DMA_STRETCH_STRIDE0	(0x0068)
+#define DMA_DATA_NUM0	(0x006C)
+
+#define DMA_TEST0	(0x0070)
+#define DMA_TEST1	(0x0074)
+#define DMA_TEST3	(0x0078)
+#define DMA_TEST4	(0x007C)
+#define DMA_STATUS_Y	(0x0080)
+
+#define DMA_DATA_ADDR1	(0x0084)
+#define DMA_STRIDE1	(0x0088)
+#define DMA_STRETCH_STRIDE1	(0x008C)
+#define DMA_DATA_NUM1	(0x0090)
+
+#define DMA_TEST0_U	(0x0094)
+#define DMA_TEST1_U	(0x0098)
+#define DMA_TEST3_U	(0x009C)
+#define DMA_TEST4_U	(0x00A0)
+#define DMA_STATUS_U	(0x00A4)
+
+#define DMA_DATA_ADDR2	(0x00A8)
+#define DMA_STRIDE2	(0x00AC)
+#define DMA_STRETCH_STRIDE2	(0x00B0)
+#define DMA_DATA_NUM2	(0x00B4)
+
+#define DMA_TEST0_V	(0x00B8)
+#define DMA_TEST1_V	(0x00BC)
+#define DMA_TEST3_V	(0x00C0)
+#define DMA_TEST4_V	(0x00C4)
+#define DMA_STATUS_V	(0x00C8)
+
+#define CH_RD_SHADOW	(0x00D0)
+#define CH_CTL	(0x00D4)
+#define CH_SECU_EN	(0x00D8)
+#define CH_SW_END_REQ	(0x00DC)
+#define CH_CLK_SEL	(0x00E0)
+#define CH_CLK_EN	(0x00E4)
+
+/* DFC */
+#define DFC_DISP_SIZE	(0x0000)
+#define DFC_PIX_IN_NUM	(0x0004)
+#define DFC_DISP_FMT	(0x000C)
+#define DFC_CLIP_CTL_HRZ	(0x0010)
+#define DFC_CLIP_CTL_VRZ	(0x0014)
+#define DFC_CTL_CLIP_EN	(0x0018)
+#define DFC_ICG_MODULE	(0x001C)
+#define DFC_DITHER_ENABLE	(0x0020)
+#define DFC_PADDING_CTL	(0x0024)
+
+#define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
+#define DSS_SCF_Y_COEF_OFFSET	(0x2000)
+#define DSS_SCF_UV_COEF_OFFSET	(0x2800)
+
+#define SCF_EN_HSCL_STR	(0x0000)
+#define SCF_EN_VSCL_STR	(0x0004)
+#define SCF_H_V_ORDER	(0x0008)
+#define SCF_SCF_CORE_GT	(0x000C)
+#define SCF_INPUT_WIDTH_HEIGHT	(0x0010)
+#define SCF_OUTPUT_WIDTH_HEIGHT	(0x0014)
+#define SCF_COEF_MEM_CTRL  (0x0018)
+#define SCF_EN_HSCL	(0x001C)
+#define SCF_EN_VSCL	(0x0020)
+#define SCF_ACC_HSCL	(0x0024)
+#define SCF_ACC_HSCL1	(0x0028)
+#define SCF_INC_HSCL	(0x0034)
+#define SCF_ACC_VSCL	(0x0038)
+#define SCF_ACC_VSCL1	(0x003C)
+#define SCF_INC_VSCL	(0x0048)
+#define SCF_EN_NONLINEAR	(0x004C)
+#define SCF_EN_MMP	(0x007C)
+#define SCF_DB_H0	(0x0080)
+#define SCF_DB_H1	(0x0084)
+#define SCF_DB_V0	(0x0088)
+#define SCF_DB_V1	(0x008C)
+#define SCF_LB_MEM_CTRL	(0x0090)
+#define SCF_RD_SHADOW	(0x00F0)
+#define SCF_CLK_SEL	(0x00F8)
+#define SCF_CLK_EN	(0x00FC)
+#define WCH_SCF_COEF_MEM_CTRL (0x0218)
+#define WCH_SCF_LB_MEM_CTRL	(0x290)
+
+/* MACROS */
+#define SCF_MIN_INPUT	(16)
+#define SCF_MIN_OUTPUT	(16)
+
+/* SCF */
+
+enum scl_coef_lut_idx {
+	SCL_COEF_NONE_IDX = -1,
+	SCL_COEF_YUV_IDX = 0,
+	SCL_COEF_RGB_IDX = 1,
+	SCL_COEF_IDX_MAX = 2,
+};
+
+/* Threshold for SCF Stretch and SCF filter */
+#define RDMA_STRETCH_THRESHOLD	(2)
+#define SCF_INC_FACTOR	BIT(18)
+#define SCF_UPSCALE_MAX	(60)
+#define SCF_DOWNSCALE_MAX	  (60)
+#define SCF_EDGE_FACTOR (3)
+#define ARSR2P_INC_FACTOR (65536)
+
+/* ARSR2P v0 */
+#define ARSR2P_INPUT_WIDTH_HEIGHT		(0x000)
+#define ARSR2P_OUTPUT_WIDTH_HEIGHT		(0x004)
+#define ARSR2P_IHLEFT		(0x008)
+
+#define ARSR2P_LUT_COEFY_V_OFFSET (0x0000)
+#define ARSR2P_LUT_COEFY_H_OFFSET (0x0100)
+#define ARSR2P_LUT_COEFA_V_OFFSET (0x0300)
+#define ARSR2P_LUT_COEFA_H_OFFSET (0x0400)
+#define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
+#define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
+
+/* POST_CLIP  v g */
+#define POST_CLIP_DISP_SIZE	(0x0000)
+
+/* PCSC v */
+#define PCSC_IDC0	(0x0000)
+#define PCSC_IDC2	(0x0004)
+#define PCSC_ODC0	(0x0008)
+#define PCSC_ODC2	(0x000C)
+#define PCSC_P0	(0x0010)
+#define PCSC_P1	(0x0014)
+#define PCSC_P2	(0x0018)
+#define PCSC_P3	(0x001C)
+#define PCSC_P4	(0x0020)
+#define PCSC_ICG_MODULE	(0x0024)
+#define PCSC_MPREC	(0x0028)
+
+/* CSC */
+
+#define CSC_IDC0	(0x0000)
+#define CSC_IDC2	(0x0004)
+#define CSC_ODC0	(0x0008)
+#define CSC_ODC2	(0x000C)
+#define CSC_P0	(0x0010)
+#define CSC_P1	(0x0014)
+#define CSC_P2	(0x0018)
+#define CSC_P3	(0x001C)
+#define CSC_P4	(0x0020)
+#define CSC_MPREC	(0x0028)
+
+#define CH_DEBUG_SEL (0x600)
+
+/* VPP */
+#define VPP_CTRL (0x700)
+#define VPP_MEM_CTRL (0x704)
+
+/* DMA BUF */
+#define DMA_BUF_CTRL	(0x800)
+#define DMA_BUF_SIZE  (0x850)
+#define DMA_BUF_MEM_CTRL	(0x854)
+#define DMA_BUF_DBG0 (0x0838)
+#define DMA_BUF_DBG1 (0x083c)
+
+#define AFBCD_HREG_HDR_PTR_LO	(0x900)
+#define AFBCD_HREG_PIC_WIDTH	(0x904)
+#define AFBCD_HREG_PIC_HEIGHT	(0x90C)
+#define AFBCD_HREG_FORMAT	(0x910)
+#define AFBCD_CTL		(0x914)
+#define AFBCD_STR	(0x918)
+#define AFBCD_LINE_CROP	(0x91C)
+#define AFBCD_INPUT_HEADER_STRIDE	(0x920)
+#define AFBCD_PAYLOAD_STRIDE	(0x924)
+#define AFBCD_MM_BASE_0	(0x928)
+#define AFBCD_AFBCD_PAYLOAD_POINTER	(0x930)
+#define AFBCD_HEIGHT_BF_STR	(0x934)
+#define AFBCD_OS_CFG	(0x938)
+#define AFBCD_MEM_CTRL	(0x93C)
+#define AFBCD_SCRAMBLE_MODE	(0x940)
+#define AFBCD_HEADER_POINTER_OFFSET	(0x944)
+#define AFBCD_MONITOR_REG1_OFFSET	(0x948)
+#define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
+#define AFBCD_MONITOR_REG3_OFFSET	(0x950)
+#define AFBCD_DEBUG_REG0_OFFSET	(0x954)
+#define AFBCD_CREG_FBCD_CTRL_MODE	(0x960)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
+#define AFBCD_HREG_HDR_PTR_L1		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1		(0x968)
+#define AFBCD_HEADER_SRTIDE_1		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
+#define AFBCD_BLOCK_TYPE				(0x974)
+#define AFBCD_MM_BASE_1				(0x978)
+#define AFBCD_MM_BASE_2				(0x97C)
+#define AFBCD_MM_BASE_3				(0x980)
+#define HFBCD_MEM_CTRL				(0x984)
+#define HFBCD_MEM_CTRL_1				(0x988)
+
+#define AFBCE_HREG_PIC_BLKS	(0x900)
+#define AFBCE_HREG_FORMAT	(0x904)
+#define AFBCE_PICTURE_SIZE	(0x910)
+#define AFBCE_CTL	(0x914)
+#define AFBCE_HEADER_SRTIDE	(0x918)
+#define AFBCE_PAYLOAD_STRIDE	(0x91C)
+#define AFBCE_ENC_OS_CFG	(0x920)
+#define AFBCE_MEM_CTRL	(0x924)
+#define AFBCE_QOS_CFG	(0x928)
+#define AFBCE_THRESHOLD	(0x92C)
+#define AFBCE_SCRAMBLE_MODE	(0x930)
+#define AFBCE_HEADER_POINTER_OFFSET	(0x934)
+#define AFBCE_CREG_FBCE_CTRL_MODE	(0x950)
+#define AFBCE_HREG_HDR_PTR_L1		(0x954)
+#define AFBCE_HREG_PLD_PTR_L1		(0x958)
+#define AFBCE_HEADER_SRTIDE_1			(0x95C)
+#define AFBCE_PAYLOAD_SRTIDE_1		(0x960)
+#define AFBCE_MEM_CTRL_1				(0x968)
+#define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
+
+#define ROT_FIRST_LNS	(0x530)
+#define ROT_STATE	(0x534)
+#define ROT_CPU_CTL0	(0x540)
+#define ROT_CPU_START0	(0x544)
+#define ROT_CPU_ADDR0	(0x548)
+#define ROT_CPU_RDATA0	(0x54C)
+#define ROT_CPU_RDATA1	(0x550)
+#define ROT_CPU_WDATA0	(0x554)
+#define ROT_CPU_WDATA1	(0x558)
+#define ROT_CPU_CTL1	(0x55C)
+#define ROT_CPU_START1	(0x560)
+#define ROT_CPU_ADDR1	(0x564)
+#define ROT_CPU_RDATA2	(0x568)
+#define ROT_CPU_RDATA3	(0x56C)
+#define ROT_CPU_WDATA2	(0x570)
+#define ROT_CPU_WDATA3	(0x574)
+
+#define CH_REG_DEFAULT (0x0A00)
+
+/* MACROS */
+#define MIN_INTERLEAVE	(7)
+#define MAX_TILE_SURPORT_NUM	(6)
+
+/* DMA aligned limited:  128bits aligned */
+#define DMA_ALIGN_BYTES	(128 / BITS_PER_BYTE)
+#define DMA_ADDR_ALIGN	(128 / BITS_PER_BYTE)
+#define DMA_STRIDE_ALIGN	(128 / BITS_PER_BYTE)
+
+#define TILE_DMA_ADDR_ALIGN	(256 * 1024)
+
+#define DMA_IN_WIDTH_MAX	(2048)
+#define DMA_IN_HEIGHT_MAX	(8192)
+
+#define AFBC_PIC_WIDTH_MIN	(16)
+#define AFBC_PIC_WIDTH_MAX	(8192)
+#define AFBC_PIC_HEIGHT_MIN	(16)
+#define AFBC_PIC_HEIGHT_MAX	(4096)
+
+#define AFBCD_TOP_CROP_MAX	(15)
+#define AFBCD_BOTTOM_CROP_MAX	(15)
+
+#define AFBC_HEADER_STRIDE_BLOCK	(16)
+
+#define AFBC_PAYLOAD_STRIDE_BLOCK	(1024)
+
+#define AFBC_SUPER_GRAPH_HEADER_ADDR_ALIGN	(128)
+
+#define AFBC_PAYLOAD_ADDR_ALIGN_32	(1024)
+#define AFBC_PAYLOAD_STRIDE_ALIGN_32	(1024)
+#define AFBC_PAYLOAD_ADDR_ALIGN_16	(512)
+#define AFBC_PAYLOAD_STRIDE_ALIGN_16	(512)
+
+#define AFBC_BLOCK_ALIGN	(16)
+
+#define AFBCE_IN_WIDTH_MAX	(512)
+#define WROT_IN_WIDTH_MAX	(512)
+
+#define MMBUF_BASE	(0x40)
+#define MMBUF_LINE_NUM	(8)
+#define MMBUF_ADDR_ALIGN	(64)
+
+enum DSS_AFBC_HALF_BLOCK_MODE {
+	AFBC_HALF_BLOCK_UPPER_LOWER_ALL = 0,
+	AFBC_HALF_BLOCK_LOWER_UPPER_ALL,
+	AFBC_HALF_BLOCK_UPPER_ONLY,
+	AFBC_HALF_BLOCK_LOWER_ONLY,
+};
+
+/* MCTL  MUTEX0 1 2 3 4 5 */
+#define MCTL_CTL_EN	(0x0000)
+#define MCTL_CTL_MUTEX	(0x0004)
+#define MCTL_CTL_MUTEX_STATUS	(0x0008)
+#define MCTL_CTL_MUTEX_ITF	(0x000C)
+#define MCTL_CTL_MUTEX_DBUF	(0x0010)
+#define MCTL_CTL_MUTEX_SCF	(0x0014)
+#define MCTL_CTL_MUTEX_OV	(0x0018)
+#define MCTL_CTL_MUTEX_WCH0	(0x0020)
+#define MCTL_CTL_MUTEX_WCH1	(0x0024)
+#define MCTL_CTL_MUTEX_WCH2	(0x0028)
+#define MCTL_CTL_MUTEX_RCH8	(0x002C)
+#define MCTL_CTL_MUTEX_RCH0	(0x0030)
+#define MCTL_CTL_MUTEX_RCH1	(0x0034)
+#define MCTL_CTL_MUTEX_RCH2	(0x0038)
+#define MCTL_CTL_MUTEX_RCH3	(0x003C)
+#define MCTL_CTL_MUTEX_RCH4	(0x0040)
+#define MCTL_CTL_MUTEX_RCH5	(0x0044)
+#define MCTL_CTL_MUTEX_RCH6	(0x0048)
+#define MCTL_CTL_MUTEX_RCH7	(0x004C)
+#define MCTL_CTL_TOP	(0x0050)
+#define MCTL_CTL_FLUSH_STATUS	(0x0054)
+#define MCTL_CTL_CLEAR	(0x0058)
+#define MCTL_CTL_CACK_TOUT	(0x0060)
+#define MCTL_CTL_MUTEX_TOUT	(0x0064)
+#define MCTL_CTL_STATUS	(0x0068)
+#define MCTL_CTL_INTEN	(0x006C)
+#define MCTL_CTL_SW_ST	(0x0070)
+#define MCTL_CTL_ST_SEL	(0x0074)
+#define MCTL_CTL_END_SEL	(0x0078)
+#define MCTL_CTL_CLK_SEL	(0x0080)
+#define MCTL_CTL_CLK_EN	(0x0084)
+#define MCTL_CTL_DBG	(0x00E0)
+
+/* MCTL  SYS */
+
+enum dss_mctl_idx {
+	DSS_MCTL0 = 0,
+	DSS_MCTL1,
+	DSS_MCTL2,
+	DSS_MCTL3,
+	DSS_MCTL4,
+	DSS_MCTL5,
+	DSS_MCTL_IDX_MAX,
+};
+
+#define MCTL_CTL_SECU_CFG	(0x0000)
+#define MCTL_PAY_SECU_FLUSH_EN  (0x0018)
+#define MCTL_CTL_SECU_GATE0	(0x0080)
+#define MCTL_CTL_SECU_GATE1	(0x0084)
+#define MCTL_CTL_SECU_GATE2	(0x0088)
+#define MCTL_DSI0_SECU_CFG_EN	(0x00A0)
+#define MCTL_DSI1_SECU_CFG_EN	(0x00A4)
+
+#define MCTL_RCH0_FLUSH_EN	(0x0100)
+#define MCTL_RCH1_FLUSH_EN	(0x0104)
+#define MCTL_RCH2_FLUSH_EN	(0x0108)
+#define MCTL_RCH3_FLUSH_EN	(0x010C)
+#define MCTL_RCH4_FLUSH_EN	(0x0110)
+#define MCTL_RCH5_FLUSH_EN	(0x0114)
+#define MCTL_RCH6_FLUSH_EN	(0x0118)
+#define MCTL_RCH7_FLUSH_EN	(0x011C)
+#define MCTL_WCH0_FLUSH_EN	(0x0120)
+#define MCTL_WCH1_FLUSH_EN	(0x0124)
+#define MCTL_OV0_FLUSH_EN	(0x0128)
+#define MCTL_OV1_FLUSH_EN	(0x012C)
+#define MCTL_OV2_FLUSH_EN	(0x0130)
+#define MCTL_OV3_FLUSH_EN	(0x0134)
+#define MCTL_RCH8_FLUSH_EN	(0x0138)
+#define MCTL_WCH2_FLUSH_EN	(0x013C)
+
+#define MCTL_RCH0_OV_OEN	(0x0160)
+#define MCTL_RCH1_OV_OEN	(0x0164)
+#define MCTL_RCH2_OV_OEN	(0x0168)
+#define MCTL_RCH3_OV_OEN	(0x016C)
+#define MCTL_RCH4_OV_OEN	(0x0170)
+#define MCTL_RCH5_OV_OEN	(0x0174)
+#define MCTL_RCH6_OV_OEN	(0x0178)
+#define MCTL_RCH7_OV_OEN	(0x017C)
+
+#define MCTL_RCH_OV0_SEL	(0x0180)
+#define MCTL_RCH_OV1_SEL	(0x0184)
+#define MCTL_RCH_OV2_SEL	(0x0188)
+#define MCTL_RCH_OV3_SEL	(0x018C)
+
+#define MCTL_WCH0_OV_IEN   (0x01A0)
+#define MCTL_WCH1_OV_IEN   (0x01A4)
+
+#define MCTL_WCH_OV2_SEL   (0x01A8)
+#define MCTL_WCH_OV3_SEL   (0x01AC)
+
+#define MCTL_WB_ENC_SEL	(0x01B0)
+#define MCTL_DSI_MUX_SEL	(0x01B4)
+
+#define MCTL_RCH0_STARTY	(0x01C0)
+#define MCTL_RCH1_STARTY	(0x01C4)
+#define MCTL_RCH2_STARTY	(0x01C8)
+#define MCTL_RCH3_STARTY	(0x01CC)
+#define MCTL_RCH4_STARTY	(0x01D0)
+#define MCTL_RCH5_STARTY	(0x01D4)
+#define MCTL_RCH6_STARTY	(0x01D8)
+#define MCTL_RCH7_STARTY	(0x01DC)
+
+#define MCTL_MCTL_CLK_SEL	(0x01F0)
+#define MCTL_MCTL_CLK_EN	(0x01F4)
+#define MCTL_MOD_CLK_SEL	(0x01F8)
+#define MCTL_MOD_CLK_EN	(0x01FC)
+
+#define MCTL_MOD0_DBG	(0x0200)
+#define MCTL_MOD1_DBG	(0x0204)
+#define MCTL_MOD2_DBG	(0x0208)
+#define MCTL_MOD3_DBG	(0x020C)
+#define MCTL_MOD4_DBG	(0x0210)
+#define MCTL_MOD5_DBG	(0x0214)
+#define MCTL_MOD6_DBG	(0x0218)
+#define MCTL_MOD7_DBG	(0x021C)
+#define MCTL_MOD8_DBG	(0x0220)
+#define MCTL_MOD9_DBG	(0x0224)
+#define MCTL_MOD10_DBG	(0x0228)
+#define MCTL_MOD11_DBG	(0x022C)
+#define MCTL_MOD12_DBG	(0x0230)
+#define MCTL_MOD13_DBG	(0x0234)
+#define MCTL_MOD14_DBG	(0x0238)
+#define MCTL_MOD15_DBG	(0x023C)
+#define MCTL_MOD16_DBG	(0x0240)
+#define MCTL_MOD17_DBG	(0x0244)
+#define MCTL_MOD18_DBG	(0x0248)
+#define MCTL_MOD19_DBG	(0x024C)
+#define MCTL_MOD20_DBG	(0x0250)
+#define MCTL_MOD0_STATUS	(0x0280)
+#define MCTL_MOD1_STATUS	(0x0284)
+#define MCTL_MOD2_STATUS	(0x0288)
+#define MCTL_MOD3_STATUS	(0x028C)
+#define MCTL_MOD4_STATUS	(0x0290)
+#define MCTL_MOD5_STATUS	(0x0294)
+#define MCTL_MOD6_STATUS	(0x0298)
+#define MCTL_MOD7_STATUS	(0x029C)
+#define MCTL_MOD8_STATUS	(0x02A0)
+#define MCTL_MOD9_STATUS	(0x02A4)
+#define MCTL_MOD10_STATUS	(0x02A8)
+#define MCTL_MOD11_STATUS	(0x02AC)
+#define MCTL_MOD12_STATUS	(0x02B0)
+#define MCTL_MOD13_STATUS	(0x02B4)
+#define MCTL_MOD14_STATUS	(0x02B8)
+#define MCTL_MOD15_STATUS	(0x02BC)
+#define MCTL_MOD16_STATUS	(0x02C0)
+#define MCTL_MOD17_STATUS	(0x02C4)
+#define MCTL_MOD18_STATUS	(0x02C8)
+#define MCTL_MOD19_STATUS	(0x02CC)
+#define MCTL_MOD20_STATUS	(0x02D0)
+#define MCTL_SW_DBG	(0x0300)
+#define MCTL_SW0_STATUS0	(0x0304)
+#define MCTL_SW0_STATUS1	(0x0308)
+#define MCTL_SW0_STATUS2	(0x030C)
+#define MCTL_SW0_STATUS3	(0x0310)
+#define MCTL_SW0_STATUS4	(0x0314)
+#define MCTL_SW0_STATUS5	(0x0318)
+#define MCTL_SW0_STATUS6	(0x031C)
+#define MCTL_SW0_STATUS7	(0x0320)
+#define MCTL_SW1_STATUS	(0x0324)
+
+#define MCTL_MOD_DBG_CH_NUM (10)
+#define MCTL_MOD_DBG_OV_NUM (4)
+#define MCTL_MOD_DBG_DBUF_NUM (2)
+#define MCTL_MOD_DBG_SCF_NUM (1)
+#define MCTL_MOD_DBG_ITF_NUM (2)
+#define MCTL_MOD_DBG_ADD_CH_NUM (2)
+
+/* OVL */
+#define OVL_SIZE	(0x0000)
+#define OVL_BG_COLOR	(0x4)
+#define OVL_DST_STARTPOS	(0x8)
+#define OVL_DST_ENDPOS	(0xC)
+#define OVL_GCFG	(0x10)
+#define OVL_LAYER0_POS	(0x14)
+#define OVL_LAYER0_SIZE	(0x18)
+#define OVL_LAYER0_SRCLOKEY	(0x1C)
+#define OVL_LAYER0_SRCHIKEY	(0x20)
+#define OVL_LAYER0_DSTLOKEY	(0x24)
+#define OVL_LAYER0_DSTHIKEY	(0x28)
+#define OVL_LAYER0_PATTERN	(0x2C)
+#define OVL_LAYER0_ALPHA	(0x30)
+#define OVL_LAYER0_CFG	(0x34)
+#define OVL_LAYER0_INFO_ALPHA	(0x40)
+#define OVL_LAYER0_INFO_SRCCOLOR	(0x44)
+#define OVL_LAYER1_POS	(0x50)
+#define OVL_LAYER1_SIZE	(0x54)
+#define OVL_LAYER1_SRCLOKEY	(0x58)
+#define OVL_LAYER1_SRCHIKEY	(0x5C)
+#define OVL_LAYER1_DSTLOKEY	(0x60)
+#define OVL_LAYER1_DSTHIKEY	(0x64)
+#define OVL_LAYER1_PATTERN	(0x68)
+#define OVL_LAYER1_ALPHA	(0x6C)
+#define OVL_LAYER1_CFG	(0x70)
+#define OVL_LAYER1_INFO_ALPHA	(0x7C)
+#define OVL_LAYER1_INFO_SRCCOLOR	(0x80)
+#define OVL_LAYER2_POS	(0x8C)
+#define OVL_LAYER2_SIZE	(0x90)
+#define OVL_LAYER2_SRCLOKEY	(0x94)
+#define OVL_LAYER2_SRCHIKEY	(0x98)
+#define OVL_LAYER2_DSTLOKEY	(0x9C)
+#define OVL_LAYER2_DSTHIKEY	(0xA0)
+#define OVL_LAYER2_PATTERN	(0xA4)
+#define OVL_LAYER2_ALPHA	(0xA8)
+#define OVL_LAYER2_CFG	(0xAC)
+#define OVL_LAYER2_INFO_ALPHA	(0xB8)
+#define OVL_LAYER2_INFO_SRCCOLOR	(0xBC)
+#define OVL_LAYER3_POS	(0xC8)
+#define OVL_LAYER3_SIZE	(0xCC)
+#define OVL_LAYER3_SRCLOKEY	(0xD0)
+#define OVL_LAYER3_SRCHIKEY	(0xD4)
+#define OVL_LAYER3_DSTLOKEY	(0xD8)
+#define OVL_LAYER3_DSTHIKEY	(0xDC)
+#define OVL_LAYER3_PATTERN	(0xE0)
+#define OVL_LAYER3_ALPHA	(0xE4)
+#define OVL_LAYER3_CFG	(0xE8)
+#define OVL_LAYER3_INFO_ALPHA	(0xF4)
+#define OVL_LAYER3_INFO_SRCCOLOR	(0xF8)
+#define OVL_LAYER4_POS	(0x104)
+#define OVL_LAYER4_SIZE	(0x108)
+#define OVL_LAYER4_SRCLOKEY	(0x10C)
+#define OVL_LAYER4_SRCHIKEY	(0x110)
+#define OVL_LAYER4_DSTLOKEY	(0x114)
+#define OVL_LAYER4_DSTHIKEY	(0x118)
+#define OVL_LAYER4_PATTERN	(0x11C)
+#define OVL_LAYER4_ALPHA	(0x120)
+#define OVL_LAYER4_CFG	(0x124)
+#define OVL_LAYER4_INFO_ALPHA	(0x130)
+#define OVL_LAYER4_INFO_SRCCOLOR	(0x134)
+#define OVL_LAYER5_POS	(0x140)
+#define OVL_LAYER5_SIZE	(0x144)
+#define OVL_LAYER5_SRCLOKEY	(0x148)
+#define OVL_LAYER5_SRCHIKEY	(0x14C)
+#define OVL_LAYER5_DSTLOKEY	(0x150)
+#define OVL_LAYER5_DSTHIKEY	(0x154)
+#define OVL_LAYER5_PATTERN	(0x158)
+#define OVL_LAYER5_ALPHA	(0x15C)
+#define OVL_LAYER5_CFG	(0x160)
+#define OVL_LAYER5_INFO_ALPHA	(0x16C)
+#define OVL_LAYER5_INFO_SRCCOLOR	(0x170)
+#define OVL_LAYER6_POS	(0x14)
+#define OVL_LAYER6_SIZE	(0x18)
+#define OVL_LAYER6_SRCLOKEY	(0x1C)
+#define OVL_LAYER6_SRCHIKEY	(0x20)
+#define OVL_LAYER6_DSTLOKEY	(0x24)
+#define OVL_LAYER6_DSTHIKEY	(0x28)
+#define OVL_LAYER6_PATTERN	(0x2C)
+#define OVL_LAYER6_ALPHA	(0x30)
+#define OVL_LAYER6_CFG	(0x34)
+#define OVL_LAYER6_INFO_ALPHA	(0x40)
+#define OVL_LAYER6_INFO_SRCCOLOR	(0x44)
+#define OVL_LAYER7_POS	(0x50)
+#define OVL_LAYER7_SIZE	(0x54)
+#define OVL_LAYER7_SRCLOKEY	(0x58)
+#define OVL_LAYER7_SRCHIKEY	(0x5C)
+#define OVL_LAYER7_DSTLOKEY	(0x60)
+#define OVL_LAYER7_DSTHIKEY	(0x64)
+#define OVL_LAYER7_PATTERN	(0x68)
+#define OVL_LAYER7_ALPHA	(0x6C)
+#define OVL_LAYER7_CFG	(0x70)
+#define OVL_LAYER7_INFO_ALPHA	(0x7C)
+#define OVL_LAYER7_INFO_SRCCOLOR	(0x80)
+#define OVL_LAYER0_ST_INFO	(0x48)
+#define OVL_LAYER1_ST_INFO	(0x84)
+#define OVL_LAYER2_ST_INFO	(0xC0)
+#define OVL_LAYER3_ST_INFO	(0xFC)
+#define OVL_LAYER4_ST_INFO	(0x138)
+#define OVL_LAYER5_ST_INFO	(0x174)
+#define OVL_LAYER6_ST_INFO	(0x48)
+#define OVL_LAYER7_ST_INFO	(0x84)
+#define OVL_LAYER0_IST_INFO	(0x4C)
+#define OVL_LAYER1_IST_INFO	(0x88)
+#define OVL_LAYER2_IST_INFO	(0xC4)
+#define OVL_LAYER3_IST_INFO	(0x100)
+#define OVL_LAYER4_IST_INFO	(0x13C)
+#define OVL_LAYER5_IST_INFO	(0x178)
+#define OVL_LAYER6_IST_INFO	(0x4C)
+#define OVL_LAYER7_IST_INFO	(0x88)
+#define OVL_LAYER0_PSPOS	(0x38)
+#define OVL_LAYER0_PEPOS	(0x3C)
+#define OVL_LAYER1_PSPOS	(0x74)
+#define OVL_LAYER1_PEPOS	(0x78)
+#define OVL_LAYER2_PSPOS	(0xB0)
+#define OVL_LAYER2_PEPOS	(0xB4)
+#define OVL_LAYER3_PSPOS	(0xEC)
+#define OVL_LAYER3_PEPOS	(0xF0)
+#define OVL_LAYER4_PSPOS	(0x128)
+#define OVL_LAYER4_PEPOS	(0x12C)
+#define OVL_LAYER5_PSPOS	(0x164)
+#define OVL_LAYER5_PEPOS	(0x168)
+#define OVL_LAYER6_PSPOS	(0x38)
+#define OVL_LAYER6_PEPOS	(0x3C)
+#define OVL_LAYER7_PSPOS	(0x74)
+#define OVL_LAYER7_PEPOS	(0x78)
+
+#define OVL6_BASE_ST_INFO	(0x17C)
+#define OVL6_BASE_IST_INFO	(0x180)
+#define OVL6_GATE_CTRL	(0x184)
+#define OVL6_RD_SHADOW_SEL	(0x188)
+#define OVL6_OV_CLK_SEL	(0x18C)
+#define OVL6_OV_CLK_EN	(0x190)
+#define OVL6_BLOCK_SIZE	(0x1A0)
+#define OVL6_BLOCK_DBG	(0x1A4)
+#define OVL6_REG_DEFAULT (0x1A8)
+
+#define OVL2_BASE_ST_INFO	(0x8C)
+#define OVL2_BASE_IST_INFO	(0x90)
+#define OVL2_GATE_CTRL	(0x94)
+#define OVL2_OV_RD_SHADOW_SEL	(0x98)
+#define OVL2_OV_CLK_SEL	(0x9C)
+#define OVL2_OV_CLK_EN	(0xA0)
+#define OVL2_BLOCK_SIZE	(0xB0)
+#define OVL2_BLOCK_DBG	(0xB4)
+#define OVL2_REG_DEFAULT	(0xB8)
+
+/* LAYER0_CFG */
+#define BIT_OVL_LAYER_SRC_CFG	BIT(8)
+#define BIT_OVL_LAYER_ENABLE	BIT(0)
+
+/* LAYER0_INFO_ALPHA */
+#define BIT_OVL_LAYER_SRCALPHA_FLAG	BIT(3)
+#define BIT_OVL_LAYER_DSTALPHA_FLAG	BIT(2)
+
+/* LAYER0_INFO_SRCCOLOR */
+#define BIT_OVL_LAYER_SRCCOLOR_FLAG	BIT(0)
+
+#define OVL_6LAYER_NUM		(6)
+#define OVL_2LAYER_NUM		(2)
+
+/* OVL */
+#define OV_SIZE						(0x000)
+#define OV_BG_COLOR_RGB			(0x004)
+#define OV_BG_COLOR_A				(0x008)
+#define OV_DST_STARTPOS			(0x00C)
+#define OV_DST_ENDPOS				(0x010)
+#define OV_GCFG					(0x014)
+#define OV_LAYER0_POS				(0x030)
+#define OV_LAYER0_SIZE				(0x034)
+#define OV_LAYER0_SRCLOKEY		(0x038)
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
+#define OV8_BASE_DBG_INFO			(0x340)
+#define OV8_RD_SHADOW_SEL			(0x344)
+#define OV8_CLK_SEL					(0x348)
+#define OV8_CLK_EN					(0x34C)
+#define OV8_BLOCK_SIZE				(0x350)
+#define OV8_BLOCK_DBG				(0x354)
+#define OV8_REG_DEFAULT			(0x358)
+#define OV2_BASE_DBG_INFO			(0x200)
+#define OV2_RD_SHADOW_SEL			(0x204)
+#define OV2_CLK_SEL					(0x208)
+#define OV2_CLK_EN					(0x20C)
+#define OV2_BLOCK_SIZE				(0x210)
+#define OV2_BLOCK_DBG				(0x214)
+#define OV2_REG_DEFAULT			(0x218)
+
+#define OV_8LAYER_NUM				(8)
+
+/* DBUF */
+#define DBUF_FRM_SIZE	(0x0000)
+#define DBUF_FRM_HSIZE	(0x0004)
+#define DBUF_SRAM_VALID_NUM	(0x0008)
+#define DBUF_WBE_EN	(0x000C)
+#define DBUF_THD_FILL_LEV0	(0x0010)
+#define DBUF_DFS_FILL_LEV1	(0x0014)
+#define DBUF_THD_RQOS	(0x0018)
+#define DBUF_THD_WQOS	(0x001C)
+#define DBUF_THD_CG	(0x0020)
+#define DBUF_THD_OTHER	(0x0024)
+#define DBUF_FILL_LEV0_CNT	(0x0028)
+#define DBUF_FILL_LEV1_CNT	(0x002C)
+#define DBUF_FILL_LEV2_CNT	(0x0030)
+#define DBUF_FILL_LEV3_CNT	(0x0034)
+#define DBUF_FILL_LEV4_CNT	(0x0038)
+#define DBUF_ONLINE_FILL_LEVEL	(0x003C)
+#define DBUF_WB_FILL_LEVEL	(0x0040)
+#define DBUF_DFS_STATUS	(0x0044)
+#define DBUF_THD_FLUX_REQ_BEF	(0x0048)
+#define DBUF_DFS_LP_CTRL	(0x004C)
+#define DBUF_RD_SHADOW_SEL	(0x0050)
+#define DBUF_MEM_CTRL (0x0054)
+#define DBUF_PM_CTRL (0x0058)
+#define DBUF_CLK_SEL (0x005C)
+#define DBUF_CLK_EN (0x0060)
+#define DBUF_THD_FLUX_REQ_AFT (0x0064)
+#define DBUF_THD_DFS_OK (0x0068)
+#define DBUF_FLUX_REQ_CTRL (0x006C)
+#define DBUF_REG_DEFAULT  (0x00A4)
+#define DBUF_DFS_RAM_MANAGE  (0x00A8)
+#define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
+
+/* DPP */
+#define DPP_RD_SHADOW_SEL	(0x000)
+#define DPP_DEFAULT	(0x004)
+#define DPP_ID	(0x008)
+#define DPP_IMG_SIZE_BEF_SR	(0x00C)
+#define DPP_IMG_SIZE_AFT_SR	(0x010)
+#define DPP_SBL	(0x014)
+#define DPP_SBL_MEM_CTRL	(0x018)
+#define DPP_ARSR1P_MEM_CTRL	(0x01C)
+#define DPP_CLK_SEL	(0x020)
+#define DPP_CLK_EN	(0x024)
+#define DPP_DBG1_CNT	(0x028)
+#define DPP_DBG2_CNT	(0x02C)
+#define DPP_DBG1	(0x030)
+#define DPP_DBG2	(0x034)
+#define DPP_DBG3	(0x038)
+#define DPP_DBG4	(0x03C)
+#define DPP_INTS	(0x040)
+#define DPP_INT_MSK	(0x044)
+#define DPP_ARSR1P	(0x048)
+#define DPP_DBG_CNT  DPP_DBG1_CNT
+
+#define DPP_CLRBAR_CTRL (0x100)
+#define DPP_CLRBAR_1ST_CLR (0x104)
+#define DPP_CLRBAR_2ND_CLR (0x108)
+#define DPP_CLRBAR_3RD_CLR (0x10C)
+
+#define DPP_CLIP_TOP (0x180)
+#define DPP_CLIP_BOTTOM (0x184)
+#define DPP_CLIP_LEFT (0x188)
+#define DPP_CLIP_RIGHT (0x18C)
+#define DPP_CLIP_EN (0x190)
+#define DPP_CLIP_DBG (0x194)
+
+#define CSC10B_IDC0	(0x000)
+#define CSC10B_IDC1	(0x004)
+#define CSC10B_IDC2	(0x008)
+#define CSC10B_ODC0	(0x00C)
+#define CSC10B_ODC1	(0x010)
+#define CSC10B_ODC2	(0x014)
+#define CSC10B_P00	(0x018)
+#define CSC10B_P01	(0x01C)
+#define CSC10B_P02	(0x020)
+#define CSC10B_P10	(0x024)
+#define CSC10B_P11	(0x028)
+#define CSC10B_P12	(0x02C)
+#define CSC10B_P20	(0x030)
+#define CSC10B_P21	(0x034)
+#define CSC10B_P22	(0x038)
+#define CSC10B_MODULE_EN	(0x03C)
+#define CSC10B_MPREC	(0x040)
+
+#define GAMA_EN	(0x000)
+#define GAMA_MEM_CTRL	(0x004)
+
+#define ACM_EN	(0x000)
+#define ACM_SATA_OFFSET	(0x004)
+#define ACM_HUESEL	(0x008)
+#define ACM_CSC_IDC0	(0x00C)
+#define ACM_CSC_IDC1	(0x010)
+#define ACM_CSC_IDC2	(0x014)
+#define ACM_CSC_P00	(0x018)
+#define ACM_CSC_P01	(0x01C)
+#define ACM_CSC_P02	(0x020)
+#define ACM_CSC_P10	(0x024)
+#define ACM_CSC_P11	(0x028)
+#define ACM_CSC_P12	(0x02C)
+#define ACM_CSC_P20	(0x030)
+#define ACM_CSC_P21	(0x034)
+#define ACM_CSC_P22	(0x038)
+#define ACM_CSC_MRREC	(0x03C)
+#define ACM_R0_H	(0x040)
+#define ACM_R1_H	(0x044)
+#define ACM_R2_H	(0x048)
+#define ACM_R3_H	(0x04C)
+#define ACM_R4_H	(0x050)
+#define ACM_R5_H	(0x054)
+#define ACM_R6_H	(0x058)
+#define ACM_LUT_DIS0	(0x05C)
+#define ACM_LUT_DIS1	(0x060)
+#define ACM_LUT_DIS2	(0x064)
+#define ACM_LUT_DIS3	(0x068)
+#define ACM_LUT_DIS4	(0x06C)
+#define ACM_LUT_DIS5	(0x070)
+#define ACM_LUT_DIS6	(0x074)
+#define ACM_LUT_DIS7	(0x078)
+#define ACM_LUT_PARAM0	(0x07C)
+#define ACM_LUT_PARAM1	(0x080)
+#define ACM_LUT_PARAM2	(0x084)
+#define ACM_LUT_PARAM3	(0x088)
+#define ACM_LUT_PARAM4	(0x08C)
+#define ACM_LUT_PARAM5	(0x090)
+#define ACM_LUT_PARAM6	(0x094)
+#define ACM_LUT_PARAM7	(0x098)
+#define ACM_LUT_SEL	(0x09C)
+#define ACM_MEM_CTRL	(0x0A0)
+#define ACM_DEBUG_TOP	(0x0A4)
+#define ACM_DEBUG_CFG	(0x0A8)
+#define ACM_DEBUG_W	(0x0AC)
+
+#define ACE_EN	(0x000)
+#define ACE_SKIN_CFG	(0x004)
+#define ACE_LUT_SEL	(0x008)
+#define ACE_HIST_IND	(0x00C)
+#define ACE_ACTIVE	(0x010)
+#define ACE_DBG	(0x014)
+#define ACE_MEM_CTRL	(0x018)
+#define ACE_IN_SEL	(0x01C)
+#define ACE_R2Y	(0x020)
+#define ACE_G2Y	(0x024)
+#define ACE_B2Y	(0x028)
+#define ACE_Y_OFFSET	(0x02C)
+#define ACE_Y_CEN	(0x030)
+#define ACE_U_CEN	(0x034)
+#define ACE_V_CEN	(0x038)
+#define ACE_Y_EXT	(0x03C)
+#define ACE_U_EXT	(0x040)
+#define ACE_V_EXT	(0x044)
+#define ACE_Y_ATTENU	(0x048)
+#define ACE_U_ATTENU	(0x04C)
+#define ACE_V_ATTENU	(0x050)
+#define ACE_ROTA	(0x054)
+#define ACE_ROTB	(0x058)
+#define ACE_Y_CORE	(0x05C)
+#define ACE_U_CORE	(0x060)
+#define ACE_V_CORE	(0x064)
+
+#define LCP_XCC_COEF_00	(0x000)
+#define LCP_XCC_COEF_01	(0x004)
+#define LCP_XCC_COEF_02	(0x008)
+#define LCP_XCC_COEF_03	(0x00C)
+#define LCP_XCC_COEF_10	(0x010)
+#define LCP_XCC_COEF_11	(0x014)
+#define LCP_XCC_COEF_12	(0x018)
+#define LCP_XCC_COEF_13	(0x01C)
+#define LCP_XCC_COEF_20	(0x020)
+#define LCP_XCC_COEF_21	(0x024)
+#define LCP_XCC_COEF_22	(0x028)
+#define LCP_XCC_COEF_23	(0x02C)
+
+#define ARSR1P_INC_FACTOR (65536)
+
+/* BIT EXT */
+#define BIT_EXT0_CTL (0x000)
+
+#define U_GAMA_R_COEF	(0x000)
+#define U_GAMA_G_COEF	(0x400)
+#define U_GAMA_B_COEF	(0x800)
+#define U_GAMA_R_LAST_COEF (0x200)
+#define U_GAMA_G_LAST_COEF (0x600)
+#define U_GAMA_B_LAST_COEF (0xA00)
+
+#define ACM_U_H_COEF	(0x000)
+#define ACM_U_SATA_COEF	(0x200)
+#define ACM_U_SATR0_COEF	(0x300)
+#define ACM_U_SATR1_COEF	(0x340)
+#define ACM_U_SATR2_COEF	(0x380)
+#define ACM_U_SATR3_COEF	(0x3C0)
+#define ACM_U_SATR4_COEF	(0x400)
+#define ACM_U_SATR5_COEF	(0x440)
+#define ACM_U_SATR6_COEF	(0x480)
+#define ACM_U_SATR7_COEF	(0x4C0)
+
+#define LCP_U_DEGAMA_R_COEF	(0x5000)
+#define LCP_U_DEGAMA_G_COEF	(0x5400)
+#define LCP_U_DEGAMA_B_COEF	(0x5800)
+#define LCP_U_DEGAMA_R_LAST_COEF (0x5200)
+#define LCP_U_DEGAMA_G_LAST_COEF (0x5600)
+#define LCP_U_DEGAMA_B_LAST_COEF (0x5A00)
+
+#define ACE_HIST0	(0x000)
+#define ACE_HIST1	(0x400)
+#define ACE_LUT0	(0x800)
+#define ACE_LUT1	(0xA00)
+
+#define HIACE_INT_STAT (0x0000)
+#define HIACE_INT_UNMASK (0x0004)
+#define HIACE_BYPASS_ACE (0x0008)
+#define HIACE_BYPASS_ACE_STAT (0x000c)
+#define HIACE_UPDATE_LOCAL (0x0010)
+#define HIACE_LOCAL_VALID (0x0014)
+#define HIACE_GAMMA_AB_SHADOW (0x0018)
+#define HIACE_GAMMA_AB_WORK (0x001c)
+#define HIACE_GLOBAL_HIST_AB_SHADOW (0x0020)
+#define HIACE_GLOBAL_HIST_AB_WORK (0x0024)
+#define HIACE_IMAGE_INFO (0x0030)
+#define HIACE_HALF_BLOCK_H_W (0x0034)
+#define HIACE_XYWEIGHT (0x0038)
+#define HIACE_LHIST_SFT (0x003c)
+#define HIACE_HUE (0x0050)
+#define HIACE_SATURATION (0x0054)
+#define HIACE_VALUE (0x0058)
+#define HIACE_SKIN_GAIN (0x005c)
+#define HIACE_UP_LOW_TH (0x0060)
+#define HIACE_UP_CNT (0x0070)
+#define HIACE_LOW_CNT (0x0074)
+#define HIACE_GLOBAL_HIST_LUT_ADDR (0x0080)
+#define HIACE_LHIST_EN (0x0100)
+#define HIACE_LOCAL_HIST_VxHy_2z_2z1 (0x0104)
+#define HIACE_GAMMA_EN (0x0108)
+#define HIACE_GAMMA_VxHy_3z2_3z1_3z_W (0x010c)
+#define HIACE_GAMMA_EN_HV_R (0x0110)
+#define HIACE_GAMMA_VxHy_3z2_3z1_3z_R (0x0114)
+#define HIACE_INIT_GAMMA (0x0120)
+#define HIACE_MANUAL_RELOAD (0x0124)
+#define HIACE_RAMCLK_FUNC (0x0128)
+#define HIACE_CLK_GATE (0x012c)
+#define HIACE_GAMMA_RAM_A_CFG_MEM_CTRL (0x0130)
+#define HIACE_GAMMA_RAM_B_CFG_MEM_CTRL (0x0134)
+#define HIACE_LHIST_RAM_CFG_MEM_CTRL (0x0138)
+#define HIACE_GAMMA_RAM_A_CFG_PM_CTRL (0x0140)
+#define HIACE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
+#define HIACE_LHIST_RAM_CFG_PM_CTRL (0x0148)
+
+/* IFBC */
+#define IFBC_SIZE	(0x0000)
+#define IFBC_CTRL	(0x0004)
+#define IFBC_HIMAX_CTRL0	(0x0008)
+#define IFBC_HIMAX_CTRL1	(0x000C)
+#define IFBC_HIMAX_CTRL2	(0x0010)
+#define IFBC_HIMAX_CTRL3	(0x0014)
+#define IFBC_EN	(0x0018)
+#define IFBC_MEM_CTRL	(0x001C)
+#define IFBC_INSERT	(0x0020)
+#define IFBC_HIMAX_TEST_MODE	(0x0024)
+#define IFBC_CORE_GT	(0x0028)
+#define IFBC_PM_CTRL	(0x002C)
+#define IFBC_RD_SHADOW	(0x0030)
+#define IFBC_ORISE_CTL	(0x0034)
+#define IFBC_ORSISE_DEBUG0	(0x0038)
+#define IFBC_ORSISE_DEBUG1	(0x003C)
+#define IFBC_RSP_COMP_TEST	(0x0040)
+#define IFBC_CLK_SEL	(0x044)
+#define IFBC_CLK_EN	(0x048)
+#define IFBC_PAD	(0x004C)
+#define IFBC_REG_DEFAULT	(0x0050)
+
+/* DSC */
+#define DSC_VERSION	(0x0000)
+#define DSC_PPS_IDENTIFIER	(0x0004)
+#define DSC_EN	(0x0008)
+#define DSC_CTRL	(0x000C)
+#define DSC_PIC_SIZE	(0x0010)
+#define DSC_SLICE_SIZE	(0x0014)
+#define DSC_CHUNK_SIZE	(0x0018)
+#define DSC_INITIAL_DELAY	(0x001C)
+#define DSC_RC_PARAM0	(0x0020)
+#define DSC_RC_PARAM1	(0x0024)
+#define DSC_RC_PARAM2	(0x0028)
+#define DSC_RC_PARAM3	(0x002C)
+#define DSC_FLATNESS_QP_TH	(0x0030)
+#define DSC_RC_PARAM4	(0x0034)
+#define DSC_RC_PARAM5	(0x0038)
+#define DSC_RC_BUF_THRESH0	(0x003C)
+#define DSC_RC_BUF_THRESH1	(0x0040)
+#define DSC_RC_BUF_THRESH2	(0x0044)
+#define DSC_RC_BUF_THRESH3	(0x0048)
+#define DSC_RC_RANGE_PARAM0	(0x004C)
+#define DSC_RC_RANGE_PARAM1	(0x0050)
+#define DSC_RC_RANGE_PARAM2	(0x0054)
+#define DSC_RC_RANGE_PARAM3	(0x0058)
+#define DSC_RC_RANGE_PARAM4	(0x005C)
+#define DSC_RC_RANGE_PARAM5	(0x0060)
+#define DSC_RC_RANGE_PARAM6	(0x0064)
+#define DSC_RC_RANGE_PARAM7	(0x0068)
+#define DSC_ADJUSTMENT_BITS	(0x006C)
+#define DSC_BITS_PER_GRP	(0x0070)
+#define DSC_MULTI_SLICE_CTL	(0x0074)
+#define DSC_OUT_CTRL	(0x0078)
+#define DSC_CLK_SEL	(0x007C)
+#define DSC_CLK_EN	(0x0080)
+#define DSC_MEM_CTRL	(0x0084)
+#define DSC_ST_DATAIN	(0x0088)
+#define DSC_ST_DATAOUT	(0x008C)
+#define DSC0_ST_SLC_POS	(0x0090)
+#define DSC1_ST_SLC_POS	(0x0094)
+#define DSC0_ST_PIC_POS	(0x0098)
+#define DSC1_ST_PIC_POS	(0x009C)
+#define DSC0_ST_FIFO	(0x00A0)
+#define DSC1_ST_FIFO	(0x00A4)
+#define DSC0_ST_LINEBUF	(0x00A8)
+#define DSC1_ST_LINEBUF	(0x00AC)
+#define DSC_ST_ITFC	(0x00B0)
+#define DSC_RD_SHADOW_SEL	(0x00B4)
+#define DSC_REG_DEFAULT	(0x00B8)
+
+/* LDI */
+#define LDI_DPI0_HRZ_CTRL0	(0x0000)
+#define LDI_DPI0_HRZ_CTRL1	(0x0004)
+#define LDI_DPI0_HRZ_CTRL2	(0x0008)
+#define LDI_VRT_CTRL0	(0x000C)
+#define LDI_VRT_CTRL1	(0x0010)
+#define LDI_VRT_CTRL2	(0x0014)
+#define LDI_PLR_CTRL	(0x0018)
+#define LDI_SH_MASK_INT	(0x001C)
+#define LDI_3D_CTRL	(0x0020)
+#define LDI_CTRL	(0x0024)
+#define LDI_WORK_MODE	(0x0028)
+#define LDI_DE_SPACE_LOW	(0x002C)
+#define LDI_DSI_CMD_MOD_CTRL	(0x0030)
+#define LDI_DSI_TE_CTRL	(0x0034)
+#define LDI_DSI_TE_HS_NUM	(0x0038)
+#define LDI_DSI_TE_HS_WD	(0x003C)
+#define LDI_DSI_TE_VS_WD	(0x0040)
+#define LDI_FRM_MSK	(0x0044)
+#define LDI_FRM_MSK_UP	(0x0048)
+#define LDI_VINACT_MSK_LEN	(0x0050)
+#define LDI_VSTATE	(0x0054)
+#define LDI_DPI0_HSTATE	(0x0058)
+#define LDI_DPI1_HSTATE	(0x005C)
+#define LDI_CMD_EVENT_SEL	(0x0060)
+#define LDI_SRAM_LP_CTRL	(0x0064)
+#define LDI_ITF_RD_SHADOW	(0x006C)
+#define LDI_DPI1_HRZ_CTRL0	(0x00F0)
+#define LDI_DPI1_HRZ_CTRL1	(0x00F4)
+#define LDI_DPI1_HRZ_CTRL2	(0x00F8)
+#define LDI_OVERLAP_SIZE	(0x00FC)
+#define LDI_MEM_CTRL	(0x0100)
+#define LDI_PM_CTRL	(0x0104)
+#define LDI_CLK_SEL	(0x0108)
+#define LDI_CLK_EN	(0x010C)
+#define LDI_IF_BYPASS	(0x0110)
+#define LDI_FRM_VALID_DBG (0x0118)
+/* LDI GLB*/
+#define LDI_PXL0_DIV2_GT_EN (0x0210)
+#define LDI_PXL0_DIV4_GT_EN (0x0214)
+#define LDI_PXL0_GT_EN (0x0218)
+#define LDI_PXL0_DSI_GT_EN (0x021C)
+#define LDI_PXL0_DIVXCFG (0x0220)
+#define LDI_DSI1_CLK_SEL (0x0224)
+#define LDI_VESA_CLK_SEL (0x0228)
+/* DSI1 RST*/
+#define LDI_DSI1_RST_SEL (0x0238)
+/* LDI INTERRUPT*/
+#define LDI_MCU_ITF_INTS (0x0240)
+#define LDI_MCU_ITF_INT_MSK (0x0244)
+#define LDI_CPU_ITF_INTS (0x0248)
+#define LDI_CPU_ITF_INT_MSK (0x024C)
+/* LDI MODULE CLOCK GATING*/
+#define LDI_MODULE_CLK_SEL (0x0258)
+#define LDI_MODULE_CLK_EN (0x025C)
+
+/* MIPI DSI */
+#define MIPIDSI_VERSION_OFFSET	(0x0000)
+#define MIPIDSI_PWR_UP_OFFSET	(0x0004)
+#define MIPIDSI_CLKMGR_CFG_OFFSET	(0x0008)
+#define MIPIDSI_DPI_VCID_OFFSET	(0x000c)
+#define MIPIDSI_DPI_COLOR_CODING_OFFSET	(0x0010)
+#define MIPIDSI_DPI_CFG_POL_OFFSET	(0x0014)
+#define MIPIDSI_DPI_LP_CMD_TIM_OFFSET	(0x0018)
+#define MIPIDSI_PCKHDL_CFG_OFFSET	(0x002c)
+#define MIPIDSI_GEN_VCID_OFFSET	(0x0030)
+#define MIPIDSI_MODE_CFG_OFFSET	(0x0034)
+#define MIPIDSI_VID_MODE_CFG_OFFSET	(0x0038)
+#define MIPIDSI_VID_PKT_SIZE_OFFSET	(0x003c)
+#define MIPIDSI_VID_NUM_CHUNKS_OFFSET	(0x0040)
+#define MIPIDSI_VID_NULL_SIZE_OFFSET	(0x0044)
+#define MIPIDSI_VID_HSA_TIME_OFFSET	(0x0048)
+#define MIPIDSI_VID_HBP_TIME_OFFSET	(0x004c)
+#define MIPIDSI_VID_HLINE_TIME_OFFSET	(0x0050)
+#define MIPIDSI_VID_VSA_LINES_OFFSET	(0x0054)
+#define MIPIDSI_VID_VBP_LINES_OFFSET	(0x0058)
+#define MIPIDSI_VID_VFP_LINES_OFFSET	(0x005c)
+#define MIPIDSI_VID_VACTIVE_LINES_OFFSET	(0x0060)
+#define MIPIDSI_EDPI_CMD_SIZE_OFFSET	(0x0064)
+#define MIPIDSI_CMD_MODE_CFG_OFFSET	(0x0068)
+#define MIPIDSI_GEN_HDR_OFFSET	(0x006c)
+#define MIPIDSI_GEN_PLD_DATA_OFFSET	(0x0070)
+#define MIPIDSI_CMD_PKT_STATUS_OFFSET	(0x0074)
+#define MIPIDSI_TO_CNT_CFG_OFFSET	(0x0078)
+#define MIPIDSI_HS_RD_TO_CNT_OFFSET	(0x007C)
+#define MIPIDSI_LP_RD_TO_CNT_OFFSET	(0x0080)
+#define MIPIDSI_HS_WR_TO_CNT_OFFSET	(0x0084)
+#define MIPIDSI_LP_WR_TO_CNT_OFFSET	(0x0088)
+#define MIPIDSI_BTA_TO_CNT_OFFSET	(0x008C)
+#define MIPIDSI_SDF_3D_OFFSET	(0x0090)
+#define MIPIDSI_LPCLK_CTRL_OFFSET	(0x0094)
+#define MIPIDSI_DSC_PARAMETER_OFFSET	(0x00f0)
+#define MIPIDSI_PHY_TMR_RD_CFG_OFFSET	(0x00f4)
+#define MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET	(0x0098)
+#define MIPIDSI_PHY_TMR_CFG_OFFSET	(0x009c)
+#define MIPIDSI_PHY_RSTZ_OFFSET	(0x00a0)
+#define MIPIDSI_PHY_IF_CFG_OFFSET	(0x00a4)
+#define MIPIDSI_PHY_ULPS_CTRL_OFFSET	(0x00a8)
+#define MIPIDSI_PHY_TX_TRIGGERS_OFFSET	(0x00ac)
+#define MIPIDSI_PHY_STATUS_OFFSET	(0x00b0)
+#define MIPIDSI_PHY_TST_CTRL0_OFFSET	(0x00b4)
+#define MIPIDSI_PHY_TST_CTRL1_OFFSET	(0x00b8)
+#define MIPIDSI_PHY_TST_CLK_PRE_DELAY (0x00B0)
+#define MIPIDSI_PHY_TST_CLK_POST_DELAY (0x00B1)
+#define MIPIDSI_PHY_TST_CLK_TLPX (0x00B2)
+#define MIPIDSI_PHY_TST_CLK_PREPARE (0x00B3)
+#define MIPIDSI_PHY_TST_CLK_ZERO (0x00B4)
+#define MIPIDSI_PHY_TST_CLK_TRAIL (0x00B5)
+#define MIPIDSI_PHY_TST_DATA_PRE_DELAY (0x0070)
+#define MIPIDSI_PHY_TST_DATA_POST_DELAY (0x0071)
+#define MIPIDSI_PHY_TST_DATA_TLPX (0x0072)
+#define MIPIDSI_PHY_TST_DATA_PREPARE (0x0073)
+#define MIPIDSI_PHY_TST_DATA_ZERO (0x0074)
+#define MIPIDSI_PHY_TST_DATA_TRAIL (0x0075)
+#define MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY (0x0077)
+#define MIPIDSI_INT_ST0_OFFSET	(0x00bc)
+#define MIPIDSI_INT_ST1_OFFSET	(0x00c0)
+#define MIPIDSI_INT_MSK0_OFFSET	(0x00c4)
+#define MIPIDSI_INT_MSK1_OFFSET	(0x00c8)
+#define INT_FORCE0	(0x00D8)
+#define INT_FORCE1	(0x00DC)
+#define VID_SHADOW_CTRL	(0x0100)
+#define DPI_VCID_ACT	(0x010C)
+#define DPI_COLOR_CODING_ACT	(0x0110)
+#define DPI_LP_CMD_TIM_ACT	(0x0118)
+#define VID_MODE_CFG_ACT	(0x0138)
+#define VID_PKT_SIZE_ACT	(0x013C)
+#define VID_NUM_CHUNKS_ACT	(0x0140)
+#define VID_NULL_SIZE_ACT	(0x0144)
+#define VID_HSA_TIME_ACT	(0x0148)
+#define VID_HBP_TIME_ACT	(0x014C)
+#define VID_HLINE_TIME_ACT	(0x0150)
+#define VID_VSA_LINES_ACT	(0x0154)
+#define VID_VBP_LINES_ACT	(0x0158)
+#define VID_VFP_LINES_ACT	(0x015C)
+#define VID_VACTIVE_LINES_ACT	(0x0160)
+#define SDF_3D_ACT	(0x0190)
+
+/* MMBUF */
+#define SMC_LOCK	(0x0000)
+#define SMC_MEM_LP	(0x0004)
+#define SMC_GCLK_CS	(0x000C)
+#define SMC_QOS_BACKDOOR	(0x0010)
+#define SMC_DFX_WCMD_CNT_1ST	(0x0014)
+#define SMC_DFX_WCMD_CNT_2ND	(0x0018)
+#define SMC_DFX_WCMD_CNT_3RD	(0x001C)
+#define SMC_DFX_WCMD_CNT_4TH	(0x0020)
+#define SMC_DFX_RCMD_CNT_1ST	(0x0024)
+#define SMC_DFX_RCMD_CNT_2ND	(0x0028)
+#define SMC_DFX_RCMD_CNT_3RD	(0x002C)
+#define SMC_DFX_RCMD_CNT_4TH	(0x0030)
+#define SMC_CS_IDLE	(0x0034)
+#define SMC_DFX_BFIFO_CNT0	(0x0038)
+#define SMC_DFX_RDFIFO_CNT1	(0x003C)
+#define SMC_SP_SRAM_STATE0	(0x0040)
+#define SMC_SP_SRAM_STATE1	(0x0044)
+
+#define MIPI_DPHY_NUM	(2)
+
+struct mipi_ifbc_division {
+	u32 xres_div;
+	u32 yres_div;
+	u32 comp_mode;
+	u32 pxl0_div2_gt_en;
+	u32 pxl0_div4_gt_en;
+	u32 pxl0_divxcfg;
+	u32 pxl0_dsi_gt_en;
+};
+
+/* MMBUF */
+
+/* IFBC compress mode */
+enum IFBC_TYPE {
+	IFBC_TYPE_NONE = 0,
+	IFBC_TYPE_ORISE2X,
+	IFBC_TYPE_ORISE3X,
+	IFBC_TYPE_HIMAX2X,
+	IFBC_TYPE_RSP2X,
+	IFBC_TYPE_RSP3X,
+	IFBC_TYPE_VESA2X_SINGLE,
+	IFBC_TYPE_VESA3X_SINGLE,
+	IFBC_TYPE_VESA2X_DUAL,
+	IFBC_TYPE_VESA3X_DUAL,
+	IFBC_TYPE_VESA3_75X_DUAL,
+
+	IFBC_TYPE_MAX
+};
+
+/* IFBC compress mode */
+enum IFBC_COMP_MODE {
+	IFBC_COMP_MODE_0 = 0,
+	IFBC_COMP_MODE_1,
+	IFBC_COMP_MODE_2,
+	IFBC_COMP_MODE_3,
+	IFBC_COMP_MODE_4,
+	IFBC_COMP_MODE_5,
+	IFBC_COMP_MODE_6,
+};
+
+/* xres_div */
+enum XRES_DIV {
+	XRES_DIV_1 = 1,
+	XRES_DIV_2,
+	XRES_DIV_3,
+	XRES_DIV_4,
+	XRES_DIV_5,
+	XRES_DIV_6,
+};
+
+/* yres_div */
+enum YRES_DIV {
+	YRES_DIV_1 = 1,
+	YRES_DIV_2,
+	YRES_DIV_3,
+	YRES_DIV_4,
+	YRES_DIV_5,
+	YRES_DIV_6,
+};
+
+/* pxl0_divxcfg */
+enum PXL0_DIVCFG {
+	PXL0_DIVCFG_0 = 0,
+	PXL0_DIVCFG_1,
+	PXL0_DIVCFG_2,
+	PXL0_DIVCFG_3,
+	PXL0_DIVCFG_4,
+	PXL0_DIVCFG_5,
+	PXL0_DIVCFG_6,
+	PXL0_DIVCFG_7,
+};
+
+/* pxl0_div2_gt_en */
+enum PXL0_DIV2_GT_EN {
+	PXL0_DIV2_GT_EN_CLOSE = 0,
+	PXL0_DIV2_GT_EN_OPEN,
+};
+
+/* pxl0_div4_gt_en */
+enum PXL0_DIV4_GT_EN {
+	PXL0_DIV4_GT_EN_CLOSE = 0,
+	PXL0_DIV4_GT_EN_OPEN,
+};
+
+/* pxl0_dsi_gt_en */
+enum PXL0_DSI_GT_EN {
+	PXL0_DSI_GT_EN_0 = 0,
+	PXL0_DSI_GT_EN_1,
+	PXL0_DSI_GT_EN_2,
+	PXL0_DSI_GT_EN_3,
+};
+
+/*****************************************************************************/
+
+#ifndef ALIGN_DOWN
+#define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
+#endif
+
+#ifndef ALIGN_UP
+#define ALIGN_UP(val, al)    (((val) + ((al) - 1)) & ~((al) - 1))
+#endif
+
+#define to_dss_crtc(crtc) container_of(crtc, struct dss_crtc, base)
+#define to_dss_plane(plane) container_of(plane, struct dss_plane, base)
+
+#endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index ae4eaae14429..14604e90dea0 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -9,396 +9,18 @@
  *
  */
 
-#ifndef __KIRIN_DPE_REG_H__
-#define __KIRIN_DPE_REG_H__
+#ifndef __KIRIN960_DPE_REG_H__
+#define __KIRIN960_DPE_REG_H__
 
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/string.h>
-#include <linux/platform_device.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/wait.h>
-#include <linux/bug.h>
-#include <linux/iommu.h>
-#include <linux/regulator/consumer.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/machine.h>
-
-#include <drm/drm_plane.h>
-#include <drm/drm_crtc.h>
-
-#define FB_ACCEL_HI62xx	0x1
-#define FB_ACCEL_HI363x	0x2
-#define FB_ACCEL_HI365x	0x4
-#define FB_ACCEL_HI625x	0x8
-#define FB_ACCEL_HI366x	0x10
-#define FB_ACCEL_KIRIN970_ES  0x20
-#define FB_ACCEL_KIRIN970  0x40
-#define FB_ACCEL_KIRIN660  0x80
-#define FB_ACCEL_KIRIN980_ES  0x100
-#define FB_ACCEL_KIRIN980  0x200
-#define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
-#define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
-
-/******************************************************************************/
-
-enum dss_chn_idx {
-	DSS_RCHN_NONE = -1,
-	DSS_RCHN_D2 = 0,
-	DSS_RCHN_D3,
-	DSS_RCHN_V0,
-	DSS_RCHN_G0,
-	DSS_RCHN_V1,
-	DSS_RCHN_G1,
-	DSS_RCHN_D0,
-	DSS_RCHN_D1,
-
-	DSS_WCHN_W0,
-	DSS_WCHN_W1,
-
-	DSS_CHN_MAX,
-
-	DSS_RCHN_V2 = DSS_CHN_MAX,  /*for copybit, only supported in chicago*/
-	DSS_WCHN_W2,
-
-	DSS_COPYBIT_MAX,
-};
-
-enum dss_channel {
-	DSS_CH1 = 0,	/* channel 1 for primary plane */
-	DSS_CH_NUM
-};
-
-#define PRIMARY_CH	DSS_CH1 /* primary plane */
-
-struct dss_rect {
-	s32 x;
-	s32 y;
-	s32 w;
-	s32 h;
-};
-
-struct dss_rect_ltrb {
-	s32 left;
-	s32 top;
-	s32 right;
-	s32 bottom;
-};
-
-enum {
-	DSI_1_LANES = 0,
-	DSI_2_LANES,
-	DSI_3_LANES,
-	DSI_4_LANES,
-};
-
-enum dss_ovl_idx {
-	DSS_OVL0 = 0,
-	DSS_OVL1,
-	DSS_OVL2,
-	DSS_OVL3,
-	DSS_OVL_IDX_MAX,
-};
-
-#define DSS_WCH_MAX  (2)
-
-struct dss_img {
-	u32 format;
-	u32 width;
-	u32 height;
-	u32 bpp;		/* bytes per pixel */
-	u32 buf_size;
-	u32 stride;
-	u32 stride_plane1;
-	u32 stride_plane2;
-	u64 phy_addr;
-	u64 vir_addr;
-	u32 offset_plane1;
-	u32 offset_plane2;
-
-	u64 afbc_header_addr;
-	u64 afbc_payload_addr;
-	u32 afbc_header_stride;
-	u32 afbc_payload_stride;
-	u32 afbc_scramble_mode;
-	u32 mmbuf_base;
-	u32 mmbuf_size;
-
-	u32 mmu_enable;
-	u32 csc_mode;
-	u32 secure_mode;
-	s32 shared_fd;
-	u32 reserved0;
-};
-
-struct drm_dss_layer {
-	struct dss_img img;
-	struct dss_rect src_rect;
-	struct dss_rect src_rect_mask;
-	struct dss_rect dst_rect;
-	u32 transform;
-	s32 blending;
-	u32 glb_alpha;
-	u32 color;		/* background color or dim color */
-	s32 layer_idx;
-	s32 chn_idx;
-	u32 need_cap;
-	s32 acquire_fence;
-};
-
-/******************************************************************************/
-
-#define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
-#define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
-
-#define DSS_MAX_PXL0_CLK_144M (144000000UL)
-
-#define DSS_ADDR  0xE8600000
-#define DSS_DSI_ADDR	(DSS_ADDR + 0x01000)
-#define DSS_LDI_ADDR	(DSS_ADDR + 0x7d000)
-#define PMC_BASE	(0xFFF31000)
-#define PERI_CRG_BASE	(0xFFF35000)
-#define SCTRL_BASE	(0xFFF0A000)
-#define PCTRL_BASE		(0xE8A09000)
-
-#define GPIO_LCD_POWER_1V2  (54)
-#define GPIO_LCD_STANDBY    (67)
-#define GPIO_LCD_RESETN     (65)
-#define GPIO_LCD_GATING     (60)
-#define GPIO_LCD_PCLK_GATING (58)
-#define GPIO_LCD_REFCLK_GATING (59)
-#define GPIO_LCD_SPICS         (168)
-#define GPIO_LCD_DRV_EN        (73)
-
-#define GPIO_PG_SEL_A (72)
-#define GPIO_TX_RX_A (74)
-#define GPIO_PG_SEL_B (76)
-#define GPIO_TX_RX_B (78)
-
-/******************************************************************************/
+#include "kirin9xx_dpe.h"
 
 #define CRGPERI_PLL0_CLK_RATE	(1600000000UL)
 #define CRGPERI_PLL2_CLK_RATE	(960000000UL)
 #define CRGPERI_PLL3_CLK_RATE	(1600000000UL)
 
-#define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
-#define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
-#define DEFAULT_DSS_CORE_CLK_RATE_L1	(300000000UL)
-#define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
-
-#define DEFAULT_PCLK_DSS_RATE	(114000000UL)
-#define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
-#define DSS_MAX_PXL0_CLK_288M (288000000UL)
-
 /*dss clk power off */
-#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF	(277000000UL)
 #define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(277000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(238000000UL)
-#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF	(238000000UL)
-
-#define MMBUF_SIZE_MAX	(288 * 1024)
-#define HISI_DSS_CMDLIST_MAX	(16)
-#define HISI_DSS_CMDLIST_IDXS_MAX (0xFFFF)
-#define HISI_DSS_COPYBIT_CMDLIST_IDXS	 (0xC000)
-#define HISI_DSS_DPP_MAX_SUPPORT_BIT (0x7ff)
-#define HISIFB_DSS_PLATFORM_TYPE  (FB_ACCEL_HI366x | FB_ACCEL_PLATFORM_TYPE_ASIC)
-
-#define DSS_MIF_SMMU_SMRX_IDX_STEP (16)
-#define CRG_PERI_DIS3_DEFAULT_VAL     (0x0002F000)
-#define SCF_LINE_BUF	(2560)
-#define DSS_GLB_MODULE_CLK_SEL_DEFAULT_VAL  (0xF0000008)
-#define DSS_LDI_CLK_SEL_DEFAULT_VAL    (0x00000004)
-#define DSS_DBUF_MEM_CTRL_DEFAULT_VAL  (0x00000008)
-#define DSS_SMMU_RLD_EN0_DEFAULT_VAL    (0xffffffff)
-#define DSS_SMMU_RLD_EN1_DEFAULT_VAL    (0xffffff8f)
-#define DSS_SMMU_OUTSTANDING_VAL		(0xf)
-#define DSS_MIF_CTRL2_INVAL_SEL3_STRIDE_MASK		(0xc)
-#define DSS_AFBCE_ENC_OS_CFG_DEFAULT_VAL			(0x7)
-#define TUI_SEC_RCH			(DSS_RCHN_V0)
-#define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
-
-/* perf stat */
-#define DSS_DEVMEM_PERF_BASE (0xFDF10000)
-#define CRG_PERIPH_APB_PERRSTSTAT0_REG (0x68)
-#define CRG_PERIPH_APB_IP_RST_PERF_STAT_BIT (18)
-#define PERF_SAMPSTOP_REG (0x10)
-#define DEVMEM_PERF_SIZE (0x100)
-
-/* dp clock used for hdmi */
-#define DEFAULT_AUXCLK_DPCTRL_RATE	16000000UL
-#define DEFAULT_ACLK_DPCTRL_RATE_ES	288000000UL
-#define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
-#define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
-
-#define KIRIN970_VCO_MIN_FREQ_OUTPUT         1000000 /*Boston: 1000 * 1000*/
-#define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
-
-#define MIDIA_PPLL7_CTRL0	0x50c
-#define MIDIA_PPLL7_CTRL1	0x510
-
-#define MIDIA_PPLL7_FREQ_DEVIDER_MASK	GENMASK(25, 2)
-#define MIDIA_PPLL7_FRAC_MODE_MASK	GENMASK(25, 0)
-
-#define ACCESS_REGISTER_FN_MAIN_ID_HDCP           0xc500aa01
-#define ACCESS_REGISTER_FN_SUB_ID_HDCP_CTRL   (0x55bbccf1)
-#define ACCESS_REGISTER_FN_SUB_ID_HDCP_INT   (0x55bbccf2)
-
-/*
- * DSS Registers
- */
-
-/* MACROS */
-#define DSS_WIDTH(width)	((width) - 1)
-#define DSS_HEIGHT(height)	((height) - 1)
-
-#define RES_540P	(960 * 540)
-#define RES_720P	(1280 * 720)
-#define RES_1080P	(1920 * 1080)
-#define RES_1200P	(1920 * 1200)
-#define RES_1440P	(2560 * 1440)
-#define RES_1600P	(2560 * 1600)
-#define RES_4K_PHONE	(3840 * 2160)
-#define RES_4K_PAD	(3840 * 2400)
-
-#define DFC_MAX_CLIP_NUM	(31)
-
-/* for DFS */
-/* 1480 * 144bits */
-#define DFS_TIME	(80)
-#define DFS_TIME_MIN	(50)
-#define DFS_TIME_MIN_4K	(10)
-#define DBUF0_DEPTH	(1408)
-#define DBUF1_DEPTH	(512)
-#define DBUF_WIDTH_BIT	(144)
-
-#define GET_THD_RQOS_IN(max_depth)	((max_depth) * 10 / 100)
-#define GET_THD_RQOS_OUT(max_depth)	((max_depth) * 30 / 100)
-#define GET_THD_WQOS_IN(max_depth)	((max_depth) * 95 / 100)
-#define GET_THD_WQOS_OUT(max_depth)	((max_depth) * 70 / 100)
-#define GET_THD_CG_IN(max_depth)	((max_depth) - 1)
-#define GET_THD_CG_OUT(max_depth)	((max_depth) * 70 / 100)
-#define GET_FLUX_REQ_IN(max_depth)	((max_depth) * 50 / 100)
-#define GET_FLUX_REQ_OUT(max_depth)	((max_depth) * 90 / 100)
-#define GET_THD_OTHER_DFS_CG_HOLD(max_depth)	(0x20)
-#define GET_THD_OTHER_WR_WAIT(max_depth)	((max_depth) * 90 / 100)
-
-#define GET_RDMA_ROT_HQOS_ASSERT_LEV(max_depth)	((max_depth) * 30 / 100)
-#define GET_RDMA_ROT_HQOS_REMOVE_LEV(max_depth)	((max_depth) * 60 / 100)
-
-enum lcd_orientation {
-	LCD_LANDSCAPE = 0,
-	LCD_PORTRAIT,
-};
-
-enum lcd_format {
-	LCD_RGB888 = 0,
-	LCD_RGB101010,
-	LCD_RGB565,
-};
-
-enum lcd_rgb_order {
-	LCD_RGB = 0,
-	LCD_BGR,
-};
-
-enum dss_addr {
-	DSS_ADDR_PLANE0 = 0,
-	DSS_ADDR_PLANE1,
-	DSS_ADDR_PLANE2,
-};
-
-enum dss_transform {
-	DSS_TRANSFORM_NOP = 0x0,
-	DSS_TRANSFORM_FLIP_H = 0x01,
-	DSS_TRANSFORM_FLIP_V = 0x02,
-	DSS_TRANSFORM_ROT = 0x04,
-};
-
-enum dss_dfc_format {
-	DFC_PIXEL_FORMAT_RGB_565 = 0,
-	DFC_PIXEL_FORMAT_XRGB_4444,
-	DFC_PIXEL_FORMAT_ARGB_4444,
-	DFC_PIXEL_FORMAT_XRGB_5551,
-	DFC_PIXEL_FORMAT_ARGB_5551,
-	DFC_PIXEL_FORMAT_XRGB_8888,
-	DFC_PIXEL_FORMAT_ARGB_8888,
-	DFC_PIXEL_FORMAT_BGR_565,
-	DFC_PIXEL_FORMAT_XBGR_4444,
-	DFC_PIXEL_FORMAT_ABGR_4444,
-	DFC_PIXEL_FORMAT_XBGR_5551,
-	DFC_PIXEL_FORMAT_ABGR_5551,
-	DFC_PIXEL_FORMAT_XBGR_8888,
-	DFC_PIXEL_FORMAT_ABGR_8888,
-
-	DFC_PIXEL_FORMAT_YUV444,
-	DFC_PIXEL_FORMAT_YVU444,
-	DFC_PIXEL_FORMAT_YUYV422,
-	DFC_PIXEL_FORMAT_YVYU422,
-	DFC_PIXEL_FORMAT_VYUY422,
-	DFC_PIXEL_FORMAT_UYVY422,
-};
-
-enum dss_dma_format {
-	DMA_PIXEL_FORMAT_RGB_565 = 0,
-	DMA_PIXEL_FORMAT_ARGB_4444,
-	DMA_PIXEL_FORMAT_XRGB_4444,
-	DMA_PIXEL_FORMAT_ARGB_5551,
-	DMA_PIXEL_FORMAT_XRGB_5551,
-	DMA_PIXEL_FORMAT_ARGB_8888,
-	DMA_PIXEL_FORMAT_XRGB_8888,
-
-	DMA_PIXEL_FORMAT_RESERVED0,
-
-	DMA_PIXEL_FORMAT_YUYV_422_Pkg,
-	DMA_PIXEL_FORMAT_YUV_420_SP_HP,
-	DMA_PIXEL_FORMAT_YUV_420_P_HP,
-	DMA_PIXEL_FORMAT_YUV_422_SP_HP,
-	DMA_PIXEL_FORMAT_YUV_422_P_HP,
-	DMA_PIXEL_FORMAT_AYUV_4444,
-};
-
-enum dss_buf_format {
-	DSS_BUF_LINEAR = 0,
-	DSS_BUF_TILE,
-};
-
-enum dss_blend_mode {
-	DSS_BLEND_CLEAR = 0,
-	DSS_BLEND_SRC,
-	DSS_BLEND_DST,
-	DSS_BLEND_SRC_OVER_DST,
-	DSS_BLEND_DST_OVER_SRC,
-	DSS_BLEND_SRC_IN_DST,
-	DSS_BLEND_DST_IN_SRC,
-	DSS_BLEND_SRC_OUT_DST,
-	DSS_BLEND_DST_OUT_SRC,
-	DSS_BLEND_SRC_ATOP_DST,
-	DSS_BLEND_DST_ATOP_SRC,
-	DSS_BLEND_SRC_XOR_DST,
-	DSS_BLEND_SRC_ADD_DST,
-	DSS_BLEND_FIX_OVER,
-	DSS_BLEND_FIX_PER0,
-	DSS_BLEND_FIX_PER1,
-	DSS_BLEND_FIX_PER2,
-	DSS_BLEND_FIX_PER3,
-	DSS_BLEND_FIX_PER4,
-	DSS_BLEND_FIX_PER5,
-	DSS_BLEND_FIX_PER6,
-	DSS_BLEND_FIX_PER7,
-	DSS_BLEND_FIX_PER8,
-	DSS_BLEND_FIX_PER9,
-	DSS_BLEND_FIX_PER10,
-	DSS_BLEND_FIX_PER11,
-	DSS_BLEND_FIX_PER12,
-	DSS_BLEND_FIX_PER13,
-	DSS_BLEND_FIX_PER14,
-	DSS_BLEND_FIX_PER15,
-	DSS_BLEND_FIX_PER16,
-	DSS_BLEND_FIX_PER17,
-
-	DSS_BLEND_MAX,
-};
 
 enum dss_chn_module {
 	MODULE_MIF_CHN,
@@ -421,1128 +43,84 @@ enum dss_chn_module {
 	MODULE_CHN_MAX,
 };
 
-enum dss_chn_cap {
-	MODULE_CAP_ROT,
-	MODULE_CAP_SCL,
-	MODULE_CAP_CSC,
-	MODULE_CAP_SHARPNESS_1D,
-	MODULE_CAP_SHARPNESS_2D,
-	MODULE_CAP_CE,
-	MODULE_CAP_AFBCD,
-	MODULE_CAP_AFBCE,
-	MODULE_CAP_YUV_PLANAR,
-	MODULE_CAP_YUV_SEMI_PLANAR,
-	MODULE_CAP_YUV_PACKAGE,
-	MODULE_CAP_MAX,
-};
-
-enum dss_ovl_module {
-	MODULE_OVL_BASE,
-	MODULE_MCTL_BASE,
-	MODULE_OVL_MAX,
-};
-
-enum dss_axi_idx {
-	AXI_CHN0 = 0,
-	AXI_CHN1,
-	AXI_CHN_MAX,
-};
-
-#define AXI0_MAX_DSS_CHN_THRESHOLD	(3)
-#define AXI1_MAX_DSS_CHN_THRESHOLD	(3)
-
-#define DEFAULT_AXI_CLK_RATE0	(120 * 1000000)
-#define DEFAULT_AXI_CLK_RATE1	(240 * 1000000)
-#define DEFAULT_AXI_CLK_RATE2	(360 * 1000000)
-#define DEFAULT_AXI_CLK_RATE3	(480 * 1000000)
-#define DEFAULT_AXI_CLK_RATE4	(667 * 1000000)
-#define DEFAULT_AXI_CLK_RATE5	(800 * 1000000)
-
-enum dss_rdma_idx {
-	DSS_RDMA0 = 0,
-	DSS_RDMA1,
-	DSS_RDMA2,
-	DSS_RDMA3,
-	DSS_RDMA4,
-	DSS_RDMA_MAX,
-};
-
 /*****************************************************************************/
 
-#define PEREN0	(0x000)
-#define PERDIS0	(0x004)
-#define PEREN2	(0x020)
-#define PERDIS2	(0x024)
-#define PERCLKEN2	(0x028)
-#define PERSTAT2	(0x02C)
-#define PEREN3	(0x030)
-#define PERDIS3	(0x034)
-#define PERCLKEN3	(0x038)
-#define PERSTAT3	(0x03C)
-#define PEREN5	(0x050)
-#define PERDIS5	(0x054)
-#define PERCLKEN5	(0x058)
-#define PERSTAT5	(0x05C)
-#define PERRSTDIS0	(0x064)
-#define PERRSTEN2	(0x078)
-#define PERRSTDIS2	(0x07C)
-#define PERRSTEN3	(0x084)
-#define PERRSTDIS3	(0x088)
-#define PERRSTSTAT3 (0x08c)
-#define PERRSTEN4	(0x090)
-#define PERRSTDIS4	(0x094)
-#define PERRSTSTAT4 (0x098)
-#define CLKDIV3	(0x0B4)
-#define CLKDIV5	(0x0BC)
-#define CLKDIV10	(0x0D0)
-#define CLKDIV18	(0x0F0)
-#define CLKDIV20	(0x0F8)
-#define ISOEN	(0x144)
-#define ISODIS	(0x148)
-#define ISOSTAT	(0x14c)
-#define PERPWREN	(0x150)
-#define PERPWRDIS	(0x154)
-#define PERPWRSTAT (0x158)
-#define PERI_AUTODIV8	(0x380)
-#define PERI_AUTODIV9	(0x384)
-#define PERI_AUTODIV10	(0x388)
-
-#define NOC_POWER_IDLEREQ	(0x380)
-#define NOC_POWER_IDLEACK	(0x384)
-#define NOC_POWER_IDLE	(0x388)
-
 #define SCPWREN	(0x0D0)
 #define SCPEREN1 (0x040)
 #define SCPERDIS1  (0x044)
-#define SCPERCLKEN1 (0x048)
 #define SCPERRSTDIS1	(0x090)
 #define SCISODIS	(0x0C4)
-#define SCCLKDIV2	(0x258)
-#define SCCLKDIV4	(0x260)
-
-#define PERI_CTRL23	(0x060)
-#define PERI_CTRL29	(0x078)
-#define PERI_CTRL30	(0x07C)
-#define PERI_CTRL32	(0x084)
-#define PERI_STAT0	(0x094)
-#define PERI_STAT1	(0x098)
-#define PERI_STAT16	(0x0D4)
-
-#define PCTRL_DPHYTX_ULPSEXIT1	BIT(4)
-#define PCTRL_DPHYTX_ULPSEXIT0	BIT(3)
-
-#define PCTRL_DPHYTX_CTRL1	BIT(1)
-#define PCTRL_DPHYTX_CTRL0	BIT(0)
 
 /*****************************************************************************/
 
-#define BIT_DSS_GLB_INTS	BIT(30)
-#define BIT_MMU_IRPT_S	BIT(29)
-#define BIT_MMU_IRPT_NS	BIT(28)
-#define BIT_DBG_MCTL_INTS	BIT(27)
-#define BIT_DBG_WCH1_INTS	BIT(26)
-#define BIT_DBG_WCH0_INTS	BIT(25)
-#define BIT_DBG_RCH7_INTS	BIT(24)
-#define BIT_DBG_RCH6_INTS	BIT(23)
-#define BIT_DBG_RCH5_INTS	BIT(22)
-#define BIT_DBG_RCH4_INTS	BIT(21)
-#define BIT_DBG_RCH3_INTS	BIT(20)
-#define BIT_DBG_RCH2_INTS	BIT(19)
-#define BIT_DBG_RCH1_INTS	BIT(18)
-#define BIT_DBG_RCH0_INTS	BIT(17)
-#define BIT_ITF0_INTS	BIT(16)
-#define BIT_DPP_INTS	BIT(15)
-#define BIT_CMDLIST13	BIT(14)
-#define BIT_CMDLIST12	BIT(13)
-#define BIT_CMDLIST11	BIT(12)
-#define BIT_CMDLIST10	BIT(11)
-#define BIT_CMDLIST9	BIT(10)
-#define BIT_CMDLIST8	BIT(9)
-#define BIT_CMDLIST7	BIT(8)
-#define BIT_CMDLIST6	BIT(7)
-#define BIT_CMDLIST5	BIT(6)
-#define BIT_CMDLIST4	BIT(5)
-#define BIT_CMDLIST3	BIT(4)
-#define BIT_CMDLIST2	BIT(3)
-#define BIT_CMDLIST1	BIT(2)
-#define BIT_CMDLIST0	BIT(1)
-
-#define BIT_SDP_DSS_GLB_INTS	BIT(29)
-#define BIT_SDP_MMU_IRPT_S	BIT(28)
-#define BIT_SDP_MMU_IRPT_NS	BIT(27)
-#define BIT_SDP_DBG_MCTL_INTS	BIT(26)
-#define BIT_SDP_DBG_WCH1_INTS	BIT(25)
-#define BIT_SDP_DBG_WCH0_INTS	BIT(24)
-#define BIT_SDP_DBG_RCH7_INTS	BIT(23)
-#define BIT_SDP_DBG_RCH6_INTS	BIT(22)
-#define BIT_SDP_DBG_RCH5_INTS	BIT(21)
-#define BIT_SDP_DBG_RCH4_INTS	BIT(20)
-#define BIT_SDP_DBG_RCH3_INTS	BIT(19)
-#define BIT_SDP_DBG_RCH2_INTS	BIT(18)
-#define BIT_SDP_DBG_RCH1_INTS	BIT(17)
-#define BIT_SDP_DBG_RCH0_INTS	BIT(16)
-#define BIT_SDP_ITF1_INTS	BIT(15)
-#define BIT_SDP_CMDLIST13	BIT(14)
-#define BIT_SDP_CMDLIST12	BIT(13)
-#define BIT_SDP_CMDLIST11	BIT(12)
-#define BIT_SDP_CMDLIST10	BIT(11)
-#define BIT_SDP_CMDLIST9	BIT(10)
-#define BIT_SDP_CMDLIST8	BIT(9)
-#define BIT_SDP_CMDLIST7	BIT(8)
-#define BIT_SDP_CMDLIST6	BIT(7)
-#define BIT_SDP_CMDLIST5	BIT(6)
-#define BIT_SDP_CMDLIST4	BIT(5)
-#define BIT_SDP_CMDLIST3	BIT(4)
-#define BIT_SDP_SDP_CMDLIST2	BIT(3)
-#define BIT_SDP_CMDLIST1	BIT(2)
-#define BIT_SDP_CMDLIST0	BIT(1)
-#define BIT_SDP_RCH_CE_INTS	BIT(0)
-
-#define BIT_OFF_DSS_GLB_INTS	BIT(31)
-#define BIT_OFF_MMU_IRPT_S	BIT(30)
-#define BIT_OFF_MMU_IRPT_NS	BIT(29)
-#define BIT_OFF_DBG_MCTL_INTS	BIT(28)
-#define BIT_OFF_DBG_WCH1_INTS	BIT(27)
-#define BIT_OFF_DBG_WCH0_INTS	BIT(26)
-#define BIT_OFF_DBG_RCH7_INTS	BIT(25)
-#define BIT_OFF_DBG_RCH6_INTS	BIT(24)
-#define BIT_OFF_DBG_RCH5_INTS	BIT(23)
-#define BIT_OFF_DBG_RCH4_INTS	BIT(22)
-#define BIT_OFF_DBG_RCH3_INTS	BIT(21)
-#define BIT_OFF_DBG_RCH2_INTS	BIT(20)
-#define BIT_OFF_DBG_RCH1_INTS	BIT(19)
-#define BIT_OFF_DBG_RCH0_INTS	BIT(18)
-#define BIT_OFF_WCH1_INTS	BIT(17)
-#define BIT_OFF_WCH0_INTS	BIT(16)
-#define BIT_OFF_WCH0_WCH1_FRM_END_INT	BIT(15)
-#define BIT_OFF_CMDLIST13	BIT(14)
-#define BIT_OFF_CMDLIST12	BIT(13)
-#define BIT_OFF_CMDLIST11	BIT(12)
-#define BIT_OFF_CMDLIST10	BIT(11)
-#define BIT_OFF_CMDLIST9	BIT(10)
-#define BIT_OFF_CMDLIST8	BIT(9)
-#define BIT_OFF_CMDLIST7	BIT(8)
-#define BIT_OFF_CMDLIST6	BIT(7)
-#define BIT_OFF_CMDLIST5	BIT(6)
-#define BIT_OFF_CMDLIST4	BIT(5)
-#define BIT_OFF_CMDLIST3	BIT(4)
-#define BIT_OFF_CMDLIST2	BIT(3)
-#define BIT_OFF_CMDLIST1	BIT(2)
-#define BIT_OFF_CMDLIST0	BIT(1)
-#define BIT_OFF_RCH_CE_INTS	BIT(0)
-
-#define BIT_OFF_CAM_DBG_WCH2_INTS	BIT(4)
-#define BIT_OFF_CAM_DBG_RCH8_INTS	BIT(3)
-#define BIT_OFF_CAM_WCH2_FRMEND_INTS  BIT(2)
-#define BIT_OFF_CAM_CMDLIST15_INTS	BIT(1)
-#define BIT_OFF_CAM_CMDLIST14_INTS	BIT(0)
-
-#define BIT_VACTIVE_CNT	BIT(14)
-#define BIT_DSI_TE_TRI	BIT(13)
-#define BIT_LCD_TE0_PIN	BIT(12)
-#define BIT_LCD_TE1_PIN	BIT(11)
-#define BIT_VACTIVE1_END	BIT(10)
-#define BIT_VACTIVE1_START	BIT(9)
-#define BIT_VACTIVE0_END	BIT(8)
-#define BIT_VACTIVE0_START	BIT(7)
-#define BIT_VFRONTPORCH	BIT(6)
-#define BIT_VBACKPORCH	BIT(5)
-#define BIT_VSYNC	BIT(4)
-#define BIT_VFRONTPORCH_END	BIT(3)
-#define BIT_LDI_UNFLOW	BIT(2)
-#define BIT_FRM_END	BIT(1)
-#define BIT_FRM_START	BIT(0)
-
-#define BIT_CTL_FLUSH_EN	BIT(21)
-#define BIT_SCF_FLUSH_EN	BIT(19)
-#define BIT_DPP0_FLUSH_EN	BIT(18)
-#define BIT_DBUF1_FLUSH_EN	BIT(17)
-#define BIT_DBUF0_FLUSH_EN	BIT(16)
-#define BIT_OV3_FLUSH_EN	BIT(15)
-#define BIT_OV2_FLUSH_EN	BIT(14)
-#define BIT_OV1_FLUSH_EN	BIT(13)
-#define BIT_OV0_FLUSH_EN	BIT(12)
-#define BIT_WB1_FLUSH_EN	BIT(11)
-#define BIT_WB0_FLUSH_EN	BIT(10)
-#define BIT_DMA3_FLUSH_EN	BIT(9)
-#define BIT_DMA2_FLUSH_EN	BIT(8)
-#define BIT_DMA1_FLUSH_EN	BIT(7)
-#define BIT_DMA0_FLUSH_EN	BIT(6)
-#define BIT_RGB1_FLUSH_EN	BIT(4)
-#define BIT_RGB0_FLUSH_EN	BIT(3)
-#define BIT_VIG1_FLUSH_EN	BIT(1)
-#define BIT_VIG0_FLUSH_EN	BIT(0)
-
-#define BIT_BUS_DBG_INT	BIT(5)
-#define BIT_CRC_SUM_INT	BIT(4)
-#define BIT_CRC_ITF1_INT	BIT(3)
-#define BIT_CRC_ITF0_INT	BIT(2)
-#define BIT_CRC_OV1_INT	BIT(1)
-#define BIT_CRC_OV0_INT	BIT(0)
-
-#define BIT_SBL_SEND_FRAME_OUT	BIT(19)
-#define BIT_SBL_STOP_FRAME_OUT	BIT(18)
-#define BIT_SBL_BACKLIGHT_OUT	BIT(17)
-#define BIT_SBL_DARKENH_OUT		BIT(16)
-#define BIT_SBL_BRIGHTPTR_OUT	BIT(15)
-#define BIT_STRENGTH_INROI_OUT	BIT(14)
-#define BIT_STRENGTH_OUTROI_OUT	BIT(13)
-#define BIT_DONE_OUT			BIT(12)
-#define BIT_PPROC_DONE_OUT		BIT(11)
-
-#define BIT_HIACE_IND	BIT(8)
-#define BIT_STRENGTH_INTP	BIT(7)
-#define BIT_BACKLIGHT_INTP	BIT(6)
-#define BIT_CE_END_IND	BIT(5)
-#define BIT_CE_CANCEL_IND	BIT(4)
-#define BIT_CE_LUT1_RW_COLLIDE_IND	BIT(3)
-#define BIT_CE_LUT0_RW_COLLIDE_IND	BIT(2)
-#define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
-#define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
-
-/*
- * MODULE BASE ADDRESS
- */
-
-#define DSS_MIPI_DSI0_OFFSET	(0x00001000)
-#define DSS_MIPI_DSI1_OFFSET	(0x00001400)
-
-#define DSS_GLB0_OFFSET	(0x12000)
-
-#define DSS_DBG_OFFSET	(0x11000)
-
-#define DSS_CMDLIST_OFFSET	(0x2000)
+/* MODULE BASE ADDRESS */
 
 #define DSS_SMMU_OFFSET	(0x8000)
 
-#define DSS_VBIF0_AIF	(0x7000)
-#define DSS_VBIF1_AIF	(0x9000)
-
-#define DSS_MIF_OFFSET	(0xA000)
-
-#define DSS_MCTRL_SYS_OFFSET	(0x10000)
-
-#define DSS_MCTRL_CTL0_OFFSET	(0x10800)
-#define DSS_MCTRL_CTL1_OFFSET	(0x10900)
-#define DSS_MCTRL_CTL2_OFFSET	(0x10A00)
-#define DSS_MCTRL_CTL3_OFFSET	(0x10B00)
-#define DSS_MCTRL_CTL4_OFFSET	(0x10C00)
-#define DSS_MCTRL_CTL5_OFFSET	(0x10D00)
-
-#define DSS_RCH_VG0_DMA_OFFSET	(0x20000)
-#define DSS_RCH_VG0_DFC_OFFSET (0x20100)
-#define DSS_RCH_VG0_SCL_OFFSET	(0x20200)
-#define DSS_RCH_VG0_ARSR_OFFSET	(0x20300)
 #define DSS_RCH_VG0_POST_CLIP_OFFSET	(0x203A0)
-#define DSS_RCH_VG0_PCSC_OFFSET	(0x20400)
-#define DSS_RCH_VG0_CSC_OFFSET	(0x20500)
-#define DSS_RCH_VG0_DEBUG_OFFSET	(0x20600)
-#define DSS_RCH_VG0_VPP_OFFSET	(0x20700)
-#define DSS_RCH_VG0_DMA_BUF_OFFSET	(0x20800)
-#define DSS_RCH_VG0_AFBCD_OFFSET	(0x20900)
-#define DSS_RCH_VG0_REG_DEFAULT_OFFSET	(0x20A00)
-#define DSS_RCH_VG0_SCL_LUT_OFFSET	(0x21000)
-#define DSS_RCH_VG0_ARSR_LUT_OFFSET	(0x25000)
 
-#define DSS_RCH_VG1_DMA_OFFSET	(0x28000)
-#define DSS_RCH_VG1_DFC_OFFSET (0x28100)
-#define DSS_RCH_VG1_SCL_OFFSET	(0x28200)
 #define DSS_RCH_VG1_POST_CLIP_OFFSET	(0x283A0)
-#define DSS_RCH_VG1_CSC_OFFSET	(0x28500)
-#define DSS_RCH_VG1_DEBUG_OFFSET	(0x28600)
-#define DSS_RCH_VG1_VPP_OFFSET	(0x28700)
-#define DSS_RCH_VG1_DMA_BUF_OFFSET	(0x28800)
-#define DSS_RCH_VG1_AFBCD_OFFSET	(0x28900)
-#define DSS_RCH_VG1_REG_DEFAULT_OFFSET	(0x28A00)
-#define DSS_RCH_VG1_SCL_LUT_OFFSET	(0x29000)
 
-#define DSS_RCH_VG2_DMA_OFFSET	(0x30000)
-#define DSS_RCH_VG2_DFC_OFFSET (0x30100)
-#define DSS_RCH_VG2_SCL_OFFSET	(0x30200)
 #define DSS_RCH_VG2_POST_CLIP_OFFSET	(0x303A0)
-#define DSS_RCH_VG2_CSC_OFFSET	(0x30500)
-#define DSS_RCH_VG2_DEBUG_OFFSET	(0x30600)
-#define DSS_RCH_VG2_VPP_OFFSET	(0x30700)
-#define DSS_RCH_VG2_DMA_BUF_OFFSET	(0x30800)
 #define DSS_RCH_VG2_AFBCD_OFFSET	(0x30900)
-#define DSS_RCH_VG2_REG_DEFAULT_OFFSET	(0x30A00)
-#define DSS_RCH_VG2_SCL_LUT_OFFSET	(0x31000)
 
-#define DSS_RCH_G0_DMA_OFFSET	(0x38000)
-#define DSS_RCH_G0_DFC_OFFSET	(0x38100)
-#define DSS_RCH_G0_SCL_OFFSET	(0x38200)
 #define DSS_RCH_G0_POST_CLIP_OFFSET (0x383A0)
-#define DSS_RCH_G0_CSC_OFFSET (0x38500)
-#define DSS_RCH_G0_DEBUG_OFFSET (0x38600)
-#define DSS_RCH_G0_DMA_BUF_OFFSET (0x38800)
-#define DSS_RCH_G0_AFBCD_OFFSET (0x38900)
-#define DSS_RCH_G0_REG_DEFAULT_OFFSET (0x38A00)
 
-#define DSS_RCH_G1_DMA_OFFSET	(0x40000)
-#define DSS_RCH_G1_DFC_OFFSET	(0x40100)
-#define DSS_RCH_G1_SCL_OFFSET	(0x40200)
 #define DSS_RCH_G1_POST_CLIP_OFFSET (0x403A0)
-#define DSS_RCH_G1_CSC_OFFSET (0x40500)
-#define DSS_RCH_G1_DEBUG_OFFSET (0x40600)
-#define DSS_RCH_G1_DMA_BUF_OFFSET (0x40800)
-#define DSS_RCH_G1_AFBCD_OFFSET (0x40900)
-#define DSS_RCH_G1_REG_DEFAULT_OFFSET (0x40A00)
 
-#define DSS_RCH_D2_DMA_OFFSET	(0x50000)
-#define DSS_RCH_D2_DFC_OFFSET	(0x50100)
-#define DSS_RCH_D2_CSC_OFFSET	(0x50500)
-#define DSS_RCH_D2_DEBUG_OFFSET	(0x50600)
-#define DSS_RCH_D2_DMA_BUF_OFFSET	(0x50800)
 #define DSS_RCH_D2_AFBCD_OFFSET	(0x50900)
 
-#define DSS_RCH_D3_DMA_OFFSET	(0x51000)
-#define DSS_RCH_D3_DFC_OFFSET	(0x51100)
-#define DSS_RCH_D3_CSC_OFFSET	(0x51500)
-#define DSS_RCH_D3_DEBUG_OFFSET	(0x51600)
-#define DSS_RCH_D3_DMA_BUF_OFFSET	(0x51800)
 #define DSS_RCH_D3_AFBCD_OFFSET	(0x51900)
 
-#define DSS_RCH_D0_DMA_OFFSET	(0x52000)
-#define DSS_RCH_D0_DFC_OFFSET	(0x52100)
-#define DSS_RCH_D0_CSC_OFFSET	(0x52500)
-#define DSS_RCH_D0_DEBUG_OFFSET	(0x52600)
-#define DSS_RCH_D0_DMA_BUF_OFFSET	(0x52800)
-#define DSS_RCH_D0_AFBCD_OFFSET	(0x52900)
-
-#define DSS_RCH_D1_DMA_OFFSET	(0x53000)
-#define DSS_RCH_D1_DFC_OFFSET	(0x53100)
-#define DSS_RCH_D1_CSC_OFFSET	(0x53500)
-#define DSS_RCH_D1_DEBUG_OFFSET	(0x53600)
-#define DSS_RCH_D1_DMA_BUF_OFFSET	(0x53800)
 #define DSS_RCH_D1_AFBCD_OFFSET	(0x53900)
 
-#define DSS_WCH0_DMA_OFFSET	(0x5A000)
-#define DSS_WCH0_DFC_OFFSET	(0x5A100)
-#define DSS_WCH0_CSC_OFFSET	(0x5A500)
 #define DSS_WCH0_ROT_OFFSET	(0x5A500)
-#define DSS_WCH0_DEBUG_OFFSET	(0x5A600)
-#define DSS_WCH0_DMA_BUFFER_OFFSET	(0x5A800)
-#define DSS_WCH0_AFBCE_OFFSET	(0x5A900)
 
-#define DSS_WCH1_DMA_OFFSET	(0x5C000)
-#define DSS_WCH1_DFC_OFFSET	(0x5C100)
-#define DSS_WCH1_CSC_OFFSET	(0x5C500)
 #define DSS_WCH1_ROT_OFFSET	(0x5C500)
-#define DSS_WCH1_DEBUG_OFFSET	(0x5C600)
-#define DSS_WCH1_DMA_BUFFER_OFFSET	(0x5C800)
-#define DSS_WCH1_AFBCE_OFFSET	(0x5C900)
 
-#define DSS_WCH2_DMA_OFFSET	(0x5E000)
-#define DSS_WCH2_DFC_OFFSET	(0x5E100)
-#define DSS_WCH2_CSC_OFFSET	(0x5E500)
-#define DSS_WCH2_ROT_OFFSET	(0x5E500)
-#define DSS_WCH2_DEBUG_OFFSET	(0x5E600)
-#define DSS_WCH2_DMA_BUFFER_OFFSET	(0x5E800)
-#define DSS_WCH2_AFBCE_OFFSET	(0x5E900)
-
-#define DSS_OVL0_OFFSET	(0x60000)
-#define DSS_OVL1_OFFSET	(0x60400)
-#define DSS_OVL2_OFFSET	(0x60800)
-#define DSS_OVL3_OFFSET	(0x60C00)
-
-#define DSS_DBUF0_OFFSET	(0x6D000)
-#define DSS_DBUF1_OFFSET	(0x6E000)
-
-#define DSS_HI_ACE_OFFSET	(0x6F000)
-
-#define DSS_DPP_OFFSET	(0x70000)
-#define DSS_TOP_OFFSET	(0x70000)
-#define DSS_DPP_COLORBAR_OFFSET	(0x70100)
-#define DSS_DPP_DITHER_OFFSET	(0x70200)
-#define DSS_DPP_CSC_RGB2YUV10B_OFFSET	(0x70300)
-#define DSS_DPP_CSC_YUV2RGB10B_OFFSET	(0x70400)
 #define DSS_DPP_DEGAMA_OFFSET	(0x70500)
-#define DSS_DPP_GAMA_OFFSET	(0x70600)
-#define DSS_DPP_ACM_OFFSET	(0x70700)
-#define DSS_DPP_ACE_OFFSET	(0x70800)
 #define DSS_DPP_LCP_OFFSET	(0x70900)
 #define DSS_DPP_ARSR1P_OFFSET	(0x70A00)
 #define DSS_DPP_BITEXT0_OFFSET	(0x70B00)
-#define DSS_DPP_GAMA_LUT_OFFSET	(0x71000)
-#define DSS_DPP_ACM_LUT_OFFSET	(0x72000)
 #define DSS_DPP_LCP_LUT_OFFSET	(0x73000)
-#define DSS_DPP_ACE_LUT_OFFSET	(0x79000)
 #define DSS_DPP_ARSR1P_LUT_OFFSET	(0x7B000)
 
 #define DSS_POST_SCF_OFFSET	DSS_DPP_ARSR1P_OFFSET
 #define DSS_POST_SCF_LUT_OFFSET	DSS_DPP_ARSR1P_LUT_OFFSET
 
-#define DSS_DPP_SBL_OFFSET	(0x7C000)
-#define DSS_LDI0_OFFSET	(0x7D000)
-#define DSS_IFBC_OFFSET	(0x7D800)
-#define DSS_DSC_OFFSET	(0x7DC00)
-#define DSS_LDI1_OFFSET	(0x7E000)
-
-/*
- * GLB
- */
-#define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
-
-#define GLB_APB_CTL	 (DSS_GLB0_OFFSET + 0x0004)
-
-#define GLB_DSS_AXI_RST_EN	(DSS_GLB0_OFFSET + 0x0118)
-#define GLB_DSS_APB_RST_EN	(DSS_GLB0_OFFSET + 0x011C)
-#define GLB_DSS_CORE_RST_EN	(DSS_GLB0_OFFSET + 0x0120)
-#define GLB_PXL0_DIV2_RST_EN	(DSS_GLB0_OFFSET + 0x0124)
-#define GLB_PXL0_DIV4_RST_EN	(DSS_GLB0_OFFSET + 0x0128)
-#define GLB_PXL0_RST_EN	(DSS_GLB0_OFFSET + 0x012C)
-#define GLB_PXL0_DSI_RST_EN	(DSS_GLB0_OFFSET + 0x0130)
-#define GLB_DSS_PXL1_RST_EN	(DSS_GLB0_OFFSET + 0x0134)
-#define GLB_MM_AXI_CLK_RST_EN	(DSS_GLB0_OFFSET + 0x0138)
-#define GLB_AFBCD0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0140)
-#define GLB_AFBCD1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0144)
-#define GLB_AFBCD2_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0148)
-#define GLB_AFBCD3_IP_RST_EN	(DSS_GLB0_OFFSET + 0x014C)
-#define GLB_AFBCD4_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0150)
-#define GLB_AFBCD5_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0154)
-#define GLB_AFBCD6_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0158)
-#define GLB_AFBCD7_IP_RST_EN	(DSS_GLB0_OFFSET + 0x015C)
-#define GLB_AFBCE0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0160)
-#define GLB_AFBCE1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0164)
-
-#define GLB_MCU_PDP_INTS	(DSS_GLB0_OFFSET + 0x20C)
-#define GLB_MCU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x210)
-#define GLB_MCU_SDP_INTS	(DSS_GLB0_OFFSET + 0x214)
-#define GLB_MCU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x218)
-#define GLB_MCU_OFF_INTS	(DSS_GLB0_OFFSET + 0x21C)
-#define GLB_MCU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x220)
-#define GLB_MCU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2B4)
-#define GLB_MCU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B8)
-#define GLB_CPU_PDP_INTS	(DSS_GLB0_OFFSET + 0x224)
-#define GLB_CPU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x228)
-#define GLB_CPU_SDP_INTS	(DSS_GLB0_OFFSET + 0x22C)
-#define GLB_CPU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x230)
-#define GLB_CPU_OFF_INTS	(DSS_GLB0_OFFSET + 0x234)
-#define GLB_CPU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x238)
-#define GLB_CPU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2AC)
-#define GLB_CPU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B0)
-
-#define GLB_MODULE_CLK_SEL	(DSS_GLB0_OFFSET + 0x0300)
-#define GLB_MODULE_CLK_EN	(DSS_GLB0_OFFSET + 0x0304)
-
-#define GLB_GLB0_DBG_SEL	(DSS_GLB0_OFFSET + 0x310)
-#define GLB_GLB1_DBG_SEL	(DSS_GLB0_OFFSET + 0x314)
-#define GLB_DBG_IRQ_CPU	(DSS_GLB0_OFFSET + 0x320)
-#define GLB_DBG_IRQ_MCU	(DSS_GLB0_OFFSET + 0x324)
-
-#define GLB_TP_SEL	(DSS_GLB0_OFFSET + 0x0400)
-#define GLB_CRC_DBG_LDI0	(DSS_GLB0_OFFSET + 0x0404)
-#define GLB_CRC_DBG_LDI1	(DSS_GLB0_OFFSET + 0x0408)
-#define GLB_CRC_LDI0_EN	(DSS_GLB0_OFFSET + 0x040C)
-#define GLB_CRC_LDI0_FRM	(DSS_GLB0_OFFSET + 0x0410)
-#define GLB_CRC_LDI1_EN	(DSS_GLB0_OFFSET + 0x0414)
-#define GLB_CRC_LDI1_FRM	(DSS_GLB0_OFFSET + 0x0418)
-
-#define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
-#define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
-
-/*
- * DBG
- */
-#define DBG_CRC_DBG_OV0	(0x0000)
-#define DBG_CRC_DBG_OV1	(0x0004)
-#define DBG_CRC_DBG_SUM	(0x0008)
-#define DBG_CRC_OV0_EN	(0x000C)
-#define DBG_DSS_GLB_DBG_O	(0x0010)
-#define DBG_DSS_GLB_DBG_I	(0x0014)
-#define DBG_CRC_OV0_FRM	(0x0018)
-#define DBG_CRC_OV1_EN	(0x001C)
-#define DBG_CRC_OV1_FRM	(0x0020)
-#define DBG_CRC_SUM_EN	(0x0024)
-#define DBG_CRC_SUM_FRM	(0x0028)
-
-#define DBG_MCTL_INTS	(0x023C)
-#define DBG_MCTL_INT_MSK	(0x0240)
-#define DBG_WCH0_INTS	(0x0244)
-#define DBG_WCH0_INT_MSK	(0x0248)
-#define DBG_WCH1_INTS	(0x024C)
-#define DBG_WCH1_INT_MSK	(0x0250)
-#define DBG_RCH0_INTS	(0x0254)
-#define DBG_RCH0_INT_MSK	(0x0258)
-#define DBG_RCH1_INTS	(0x025C)
-#define DBG_RCH1_INT_MSK	(0x0260)
-#define DBG_RCH2_INTS	(0x0264)
-#define DBG_RCH2_INT_MSK	(0x0268)
-#define DBG_RCH3_INTS	(0x026C)
-#define DBG_RCH3_INT_MSK	(0x0270)
-#define DBG_RCH4_INTS	(0x0274)
-#define DBG_RCH4_INT_MSK	(0x0278)
-#define DBG_RCH5_INTS	(0x027C)
-#define DBG_RCH5_INT_MSK	(0x0280)
-#define DBG_RCH6_INTS	(0x0284)
-#define DBG_RCH6_INT_MSK	(0x0288)
-#define DBG_RCH7_INTS	(0x028C)
-#define DBG_RCH7_INT_MSK	(0x0290)
-#define DBG_DSS_GLB_INTS	(0x0294)
-#define DBG_DSS_GLB_INT_MSK	(0x0298)
-#define DBG_WCH2_INTS	(0x029C)
-#define DBG_WCH2_INT_MSK	(0x02A0)
-#define DBG_RCH8_INTS	(0x02A4)
-#define DBG_RCH8_INT_MSK	(0x02A8)
-
-/*
- * CMDLIST
- */
-
-#define CMDLIST_CH0_PENDING_CLR	(0x0000)
-#define CMDLIST_CH0_CTRL	(0x0004)
-#define CMDLIST_CH0_STATUS	(0x0008)
-#define CMDLIST_CH0_STAAD	(0x000C)
-#define CMDLIST_CH0_CURAD	(0x0010)
-#define CMDLIST_CH0_INTE	(0x0014)
-#define CMDLIST_CH0_INTC	(0x0018)
-#define CMDLIST_CH0_INTS	(0x001C)
-#define CMDLIST_CH0_SCENE	(0x0020)
-#define CMDLIST_CH0_DBG	(0x0028)
-
-#define CMDLIST_DBG	(0x0700)
-#define CMDLIST_BUF_DBG_EN	(0x0704)
-#define CMDLIST_BUF_DBG_CNT_CLR	(0x0708)
-#define CMDLIST_BUF_DBG_CNT	(0x070C)
-#define CMDLIST_TIMEOUT_TH	(0x0710)
-#define CMDLIST_START	(0x0714)
-#define CMDLIST_ADDR_MASK_EN	(0x0718)
-#define CMDLIST_ADDR_MASK_DIS	(0x071C)
-#define CMDLIST_ADDR_MASK_STATUS	(0x0720)
-#define CMDLIST_TASK_CONTINUE	(0x0724)
-#define CMDLIST_TASK_STATUS	(0x0728)
-#define CMDLIST_CTRL	(0x072C)
-#define CMDLIST_SECU	(0x0730)
-#define CMDLIST_INTS	(0x0734)
-#define CMDLIST_SWRST	(0x0738)
-#define CMD_MEM_CTRL	(0x073C)
-#define CMD_CLK_SEL		(0x0740)
-#define CMD_CLK_EN	(0x0744)
-
-#define HISI_DSS_MIN_ROT_AFBCE_BLOCK_SIZE (256)
-#define HISI_DSS_MAX_ROT_AFBCE_BLOCK_SIZE (480)
-
-#define BIT_CMDLIST_CH_TASKDONE_INTS	    BIT(7)
-#define BIT_CMDLIST_CH_TIMEOUT_INTS	    BIT(6)
-#define BIT_CMDLIST_CH_BADCMD_INTS	    BIT(5)
-#define BIT_CMDLIST_CH_START_INTS	           BIT(4)
-#define BIT_CMDLIST_CH_PENDING_INTS	    BIT(3)
-#define BIT_CMDLIST_CH_AXIERR_INTS	    BIT(2)
-#define BIT_CMDLIST_CH_ALLDONE_INTS	    BIT(1)
-#define BIT_CMDLIST_CH_ONEDONE_INTS	    BIT(0)
-
-#define BIT_CMDLIST_CH15_INTS	BIT(15)
-#define BIT_CMDLIST_CH14_INTS	BIT(14)
-#define BIT_CMDLIST_CH13_INTS	BIT(13)
-#define BIT_CMDLIST_CH12_INTS	BIT(12)
-#define BIT_CMDLIST_CH11_INTS	BIT(11)
-#define BIT_CMDLIST_CH10_INTS	BIT(10)
-#define BIT_CMDLIST_CH9_INTS	BIT(9)
-#define BIT_CMDLIST_CH8_INTS	BIT(8)
-#define BIT_CMDLIST_CH7_INTS	BIT(7)
-#define BIT_CMDLIST_CH6_INTS	BIT(6)
-#define BIT_CMDLIST_CH5_INTS	BIT(5)
-#define BIT_CMDLIST_CH4_INTS	BIT(4)
-#define BIT_CMDLIST_CH3_INTS	BIT(3)
-#define BIT_CMDLIST_CH2_INTS	BIT(2)
-#define BIT_CMDLIST_CH1_INTS	BIT(1)
-#define BIT_CMDLIST_CH0_INTS	BIT(0)
-
-/*
- * AIF
- */
-#define AIF0_CH0_OFFSET	(DSS_VBIF0_AIF + 0x00)
+/* AIF */
 #define AIF0_CH0_ADD_OFFSET	(DSS_VBIF0_AIF + 0x04)
-#define AIF0_CH1_OFFSET	(DSS_VBIF0_AIF + 0x20)
 #define AIF0_CH1_ADD_OFFSET	(DSS_VBIF0_AIF + 0x24)
-#define AIF0_CH2_OFFSET	(DSS_VBIF0_AIF + 0x40)
 #define AIF0_CH2_ADD_OFFSET	(DSS_VBIF0_AIF + 0x44)
-#define AIF0_CH3_OFFSET	(DSS_VBIF0_AIF + 0x60)
 #define AIF0_CH3_ADD_OFFSET	(DSS_VBIF0_AIF + 0x64)
-#define AIF0_CH4_OFFSET	(DSS_VBIF0_AIF + 0x80)
 #define AIF0_CH4_ADD_OFFSET	(DSS_VBIF0_AIF + 0x84)
-#define AIF0_CH5_OFFSET	(DSS_VBIF0_AIF + 0xA0)
 #define AIF0_CH5_ADD_OFFSET	(DSS_VBIF0_AIF + 0xa4)
-#define AIF0_CH6_OFFSET	(DSS_VBIF0_AIF + 0xC0)
 #define AIF0_CH6_ADD_OFFSET	(DSS_VBIF0_AIF + 0xc4)
-#define AIF0_CH7_OFFSET	(DSS_VBIF0_AIF + 0xE0)
 #define AIF0_CH7_ADD_OFFSET	(DSS_VBIF0_AIF + 0xe4)
-#define AIF0_CH8_OFFSET	(DSS_VBIF0_AIF + 0x100)
 #define AIF0_CH8_ADD_OFFSET	(DSS_VBIF0_AIF + 0x104)
-#define AIF0_CH9_OFFSET	(DSS_VBIF0_AIF + 0x120)
 #define AIF0_CH9_ADD_OFFSET	(DSS_VBIF0_AIF + 0x124)
-#define AIF0_CH10_OFFSET	(DSS_VBIF0_AIF + 0x140)
 #define AIF0_CH10_ADD_OFFSET	(DSS_VBIF0_AIF + 0x144)
-#define AIF0_CH11_OFFSET	(DSS_VBIF0_AIF + 0x160)
 #define AIF0_CH11_ADD_OFFSET	(DSS_VBIF0_AIF + 0x164)
-#define AIF0_CH12_OFFSET	(DSS_VBIF0_AIF + 0x180)
 #define AIF0_CH12_ADD_OFFSET	(DSS_VBIF0_AIF + 0x184)
 
-#define AIF1_CH0_OFFSET	(DSS_VBIF1_AIF + 0x00)
 #define AIF1_CH0_ADD_OFFSET	(DSS_VBIF1_AIF + 0x04)
-#define AIF1_CH1_OFFSET	(DSS_VBIF1_AIF + 0x20)
 #define AIF1_CH1_ADD_OFFSET	(DSS_VBIF1_AIF + 0x24)
-#define AIF1_CH2_OFFSET	(DSS_VBIF1_AIF + 0x40)
 #define AIF1_CH2_ADD_OFFSET	(DSS_VBIF1_AIF + 0x44)
-#define AIF1_CH3_OFFSET	(DSS_VBIF1_AIF + 0x60)
 #define AIF1_CH3_ADD_OFFSET	(DSS_VBIF1_AIF + 0x64)
-#define AIF1_CH4_OFFSET	(DSS_VBIF1_AIF + 0x80)
 #define AIF1_CH4_ADD_OFFSET	(DSS_VBIF1_AIF + 0x84)
-#define AIF1_CH5_OFFSET	(DSS_VBIF1_AIF + 0xA0)
 #define AIF1_CH5_ADD_OFFSET	(DSS_VBIF1_AIF + 0xa4)
-#define AIF1_CH6_OFFSET	(DSS_VBIF1_AIF + 0xC0)
 #define AIF1_CH6_ADD_OFFSET	(DSS_VBIF1_AIF + 0xc4)
-#define AIF1_CH7_OFFSET	(DSS_VBIF1_AIF + 0xE0)
 #define AIF1_CH7_ADD_OFFSET	(DSS_VBIF1_AIF + 0xe4)
-#define AIF1_CH8_OFFSET	(DSS_VBIF1_AIF + 0x100)
 #define AIF1_CH8_ADD_OFFSET	(DSS_VBIF1_AIF + 0x104)
-#define AIF1_CH9_OFFSET	(DSS_VBIF1_AIF + 0x120)
 #define AIF1_CH9_ADD_OFFSET	(DSS_VBIF1_AIF + 0x124)
-#define AIF1_CH10_OFFSET	(DSS_VBIF1_AIF + 0x140)
 #define AIF1_CH10_ADD_OFFSET	(DSS_VBIF1_AIF + 0x144)
-#define AIF1_CH11_OFFSET	(DSS_VBIF1_AIF + 0x160)
 #define AIF1_CH11_ADD_OFFSET	(DSS_VBIF1_AIF + 0x164)
-#define AIF1_CH12_OFFSET	(DSS_VBIF1_AIF + 0x180)
 #define AIF1_CH12_ADD_OFFSET	(DSS_VBIF1_AIF + 0x184)
 
-/* aif dmax */
-
-#define AIF_CH_CTL	(0x0000)
-
-#define AIF_CH_CTL_ADD (0x0004)
-
-/* aif common */
-#define AXI0_RID_MSK0	(0x0800)
-#define AXI0_RID_MSK1	(0x0804)
-#define AXI0_WID_MSK	(0x0808)
-#define AXI0_R_QOS_MAP	(0x080c)
-#define AXI1_RID_MSK0	(0x0810)
-#define AXI1_RID_MSK1	(0x0814)
-#define AXI1_WID_MSK	(0x0818)
-#define AXI1_R_QOS_MAP	(0x081c)
-#define AIF_CLK_SEL0	(0x0820)
-#define AIF_CLK_SEL1	(0x0824)
-#define AIF_CLK_EN0	(0x0828)
-#define AIF_CLK_EN1	(0x082c)
-#define MONITOR_CTRL	(0x0830)
-#define MONITOR_TIMER_INI	(0x0834)
-#define DEBUG_BUF_BASE	(0x0838)
-#define DEBUG_CTRL	(0x083C)
-#define AIF_SHADOW_READ	(0x0840)
-#define AIF_MEM_CTRL	(0x0844)
-#define AIF_MONITOR_EN	(0x0848)
-#define AIF_MONITOR_CTRL	(0x084C)
-#define AIF_MONITOR_SAMPLE_MUN	(0x0850)
-#define AIF_MONITOR_SAMPLE_TIME	(0x0854)
-#define AIF_MONITOR_SAMPLE_FLOW	(0x0858)
-
-/* aif debug */
-#define AIF_MONITOR_READ_DATA	(0x0880)
-#define AIF_MONITOR_WRITE_DATA	(0x0884)
-#define AIF_MONITOR_WINDOW_CYCLE	(0x0888)
-#define AIF_MONITOR_WBURST_CNT	(0x088C)
-#define AIF_MONITOR_MIN_WR_CYCLE	(0x0890)
-#define AIF_MONITOR_MAX_WR_CYCLE	(0x0894)
-#define AIF_MONITOR_AVR_WR_CYCLE	(0x0898)
-#define AIF_MONITOR_MIN_WRW_CYCLE	(0x089C)
-#define AIF_MONITOR_MAX_WRW_CYCLE	(0x08A0)
-#define AIF_MONITOR_AVR_WRW_CYCLE	(0x08A4)
-#define AIF_MONITOR_RBURST_CNT	(0x08A8)
-#define AIF_MONITOR_MIN_RD_CYCLE	(0x08AC)
-#define AIF_MONITOR_MAX_RD_CYCLE	(0x08B0)
-#define AIF_MONITOR_AVR_RD_CYCLE	(0x08B4)
-#define AIF_MONITOR_MIN_RDW_CYCLE	(0x08B8)
-#define AIF_MONITOR_MAX_RDW_CYCLE	(0x08BC)
-#define AIF_MONITOR_AVR_RDW_CYCLE	(0x08C0)
-#define AIF_CH_STAT_0	(0x08C4)
-#define AIF_CH_STAT_1	(0x08C8)
-
-#define AIF_MODULE_CLK_SEL	(0x0A04)
-#define AIF_MODULE_CLK_EN	(0x0A08)
-
-struct dss_aif {
-	u32 aif_ch_ctl;
-	u32 aif_ch_ctl_add;
-};
-
-struct dss_aif_bw {
-	u64 bw;
-	u8 chn_idx;
-	s8 axi_sel;
-	u8 is_used;
-};
-
-/*
- * MIF
- */
-#define MIF_ENABLE	(0x0000)
-#define MIF_MEM_CTRL	(0x0004)
-
-#define MIF_CTRL0	(0x000)
-#define MIF_CTRL1	(0x004)
-#define MIF_CTRL2	(0x008)
-#define MIF_CTRL3	(0x00C)
-#define MIF_CTRL4	(0x010)
-#define MIF_CTRL5	(0x014)
-#define REG_DEFAULT (0x0500)
-#define MIF_SHADOW_READ	(0x0504)
-#define MIF_CLK_CTL	(0x0508)
-
-#define MIF_STAT0	(0x0600)
-
-#define MIF_STAT1	(0x0604)
-
-#define MIF_STAT2	(0x0608)
-
-#define MIF_CTRL_OFFSET	(0x20)
-#define MIF_CH0_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 1)
-#define MIF_CH1_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 2)
-#define MIF_CH2_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 3)
-#define MIF_CH3_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 4)
-#define MIF_CH4_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 5)
-#define MIF_CH5_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 6)
-#define MIF_CH6_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 7)
-#define MIF_CH7_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 8)
-#define MIF_CH8_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 9)
-#define MIF_CH9_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 10)
-#define MIF_CH10_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 11)
-#define MIF_CH11_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 12)
-#define MIF_CTRL_NUM	(12)
-
-#define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
-#define MIF_STRIDE_UNIT (4 * 1024)
-
-struct dss_mif {
-	u32 mif_ctrl1;
-	u32 mif_ctrl2;
-	u32 mif_ctrl3;
-	u32 mif_ctrl4;
-	u32 mif_ctrl5;
-};
-
-/*
- * stretch blt, linear/tile, rotation, pixel format
- * 0 0 000
- */
-enum dss_mmu_tlb_tag_org {
-	MMU_TLB_TAG_ORG_0x0 = 0x0,
-	MMU_TLB_TAG_ORG_0x1 = 0x1,
-	MMU_TLB_TAG_ORG_0x2 = 0x2,
-	MMU_TLB_TAG_ORG_0x3 = 0x3,
-	MMU_TLB_TAG_ORG_0x4 = 0x4,
-	MMU_TLB_TAG_ORG_0x7 = 0x7,
-
-	MMU_TLB_TAG_ORG_0x8 = 0x8,
-	MMU_TLB_TAG_ORG_0x9 = 0x9,
-	MMU_TLB_TAG_ORG_0xA = 0xA,
-	MMU_TLB_TAG_ORG_0xB = 0xB,
-	MMU_TLB_TAG_ORG_0xC = 0xC,
-	MMU_TLB_TAG_ORG_0xF = 0xF,
-
-	MMU_TLB_TAG_ORG_0x10 = 0x10,
-	MMU_TLB_TAG_ORG_0x11 = 0x11,
-	MMU_TLB_TAG_ORG_0x12 = 0x12,
-	MMU_TLB_TAG_ORG_0x13 = 0x13,
-	MMU_TLB_TAG_ORG_0x14 = 0x14,
-	MMU_TLB_TAG_ORG_0x17 = 0x17,
-
-	MMU_TLB_TAG_ORG_0x18 = 0x18,
-	MMU_TLB_TAG_ORG_0x19 = 0x19,
-	MMU_TLB_TAG_ORG_0x1A = 0x1A,
-	MMU_TLB_TAG_ORG_0x1B = 0x1B,
-	MMU_TLB_TAG_ORG_0x1C = 0x1C,
-	MMU_TLB_TAG_ORG_0x1F = 0x1F,
-};
-
-/*
- * SMMU
- */
-#define SMMU_SCR	(0x0000)
-#define SMMU_MEMCTRL	(0x0004)
-#define SMMU_LP_CTRL	(0x0008)
-#define SMMU_PRESS_REMAP	(0x000C)
-#define SMMU_INTMASK_NS	(0x0010)
-#define SMMU_INTRAW_NS	(0x0014)
-#define SMMU_INTSTAT_NS	(0x0018)
-#define SMMU_INTCLR_NS	(0x001C)
-
-#define SMMU_SMRx_NS	(0x0020)
-#define SMMU_RLD_EN0_NS	(0x01F0)
-#define SMMU_RLD_EN1_NS	(0x01F4)
-#define SMMU_RLD_EN2_NS	(0x01F8)
-#define SMMU_CB_SCTRL	(0x0200)
-#define SMMU_CB_TTBR0	(0x0204)
-#define SMMU_CB_TTBR1	(0x0208)
-#define SMMU_CB_TTBCR	(0x020C)
-#define SMMU_OFFSET_ADDR_NS	(0x0210)
-#define SMMU_SCACHEI_ALL	(0x0214)
-#define SMMU_SCACHEI_L1	(0x0218)
-#define SMMU_SCACHEI_L2L3	(0x021C)
-#define SMMU_FAMA_CTRL0	(0x0220)
-#define SMMU_FAMA_CTRL1	(0x0224)
-#define SMMU_ADDR_MSB	(0x0300)
-#define SMMU_ERR_RDADDR	(0x0304)
-#define SMMU_ERR_WRADDR	(0x0308)
-#define SMMU_FAULT_ADDR_TCU (0x0310)
-#define SMMU_FAULT_ID_TCU	(0x0314)
-
-#define SMMU_FAULT_ADDR_TBUx	(0x0320)
-#define SMMU_FAULT_ID_TBUx	(0x0324)
-#define SMMU_FAULT_INFOx	(0x0328)
-#define SMMU_DBGRPTR_TLB	(0x0380)
-#define SMMU_DBGRDATA_TLB	(0x0380)
-#define SMMU_DBGRDATA0_CACHE	(0x038C)
-#define SMMU_DBGRDATA1_CACHE	(0x0390)
-#define SMMU_DBGAXI_CTRL	(0x0394)
-#define SMMU_OVA_ADDR	(0x0398)
-#define SMMU_OPA_ADDR	(0x039C)
-#define SMMU_OVA_CTRL	(0x03A0)
-#define SMMU_OPREF_ADDR	(0x03A4)
-#define SMMU_OPREF_CTRL	(0x03A8)
-#define SMMU_OPREF_CNT	(0x03AC)
-
-#define SMMU_SMRx_S	(0x0500)
-#define SMMU_RLD_EN0_S	(0x06F0)
-#define SMMU_RLD_EN1_S	(0x06F4)
-#define SMMU_RLD_EN2_S	(0x06F8)
-#define SMMU_INTMAS_S	(0x0700)
-#define SMMU_INTRAW_S	(0x0704)
-#define SMMU_INTSTAT_S	(0x0708)
-#define SMMU_INTCLR_S	(0x070C)
-#define SMMU_SCR_S	(0x0710)
-#define SMMU_SCB_SCTRL	(0x0714)
-#define SMMU_SCB_TTBR	(0x0718)
-#define SMMU_SCB_TTBCR	(0x071C)
-#define SMMU_OFFSET_ADDR_S	(0x0720)
-
-#define SMMU_SID_NUM	(64)
-
-struct dss_smmu {
-	u32 smmu_scr;
-	u32 smmu_memctrl;
-	u32 smmu_lp_ctrl;
-	u32 smmu_press_remap;
-	u32 smmu_intmask_ns;
-	u32 smmu_intraw_ns;
-	u32 smmu_intstat_ns;
-	u32 smmu_intclr_ns;
-	u32 smmu_smrx_ns[SMMU_SID_NUM];
-	u32 smmu_rld_en0_ns;
-	u32 smmu_rld_en1_ns;
-	u32 smmu_rld_en2_ns;
-	u32 smmu_cb_sctrl;
-	u32 smmu_cb_ttbr0;
-	u32 smmu_cb_ttbr1;
-	u32 smmu_cb_ttbcr;
-	u32 smmu_offset_addr_ns;
-	u32 smmu_scachei_all;
-	u32 smmu_scachei_l1;
-	u32 smmu_scachei_l2l3;
-	u32 smmu_fama_ctrl0_ns;
-	u32 smmu_fama_ctrl1_ns;
-	u32 smmu_addr_msb;
-	u32 smmu_err_rdaddr;
-	u32 smmu_err_wraddr;
-	u32 smmu_fault_addr_tcu;
-	u32 smmu_fault_id_tcu;
-	u32 smmu_fault_addr_tbux;
-	u32 smmu_fault_id_tbux;
-	u32 smmu_fault_infox;
-	u32 smmu_dbgrptr_tlb;
-	u32 smmu_dbgrdata_tlb;
-	u32 smmu_dbgrptr_cache;
-	u32 smmu_dbgrdata0_cache;
-	u32 smmu_dbgrdata1_cache;
-	u32 smmu_dbgaxi_ctrl;
-	u32 smmu_ova_addr;
-	u32 smmu_opa_addr;
-	u32 smmu_ova_ctrl;
-	u32 smmu_opref_addr;
-	u32 smmu_opref_ctrl;
-	u32 smmu_opref_cnt;
-	u32 smmu_smrx_s[SMMU_SID_NUM];
-	u32 smmu_rld_en0_s;
-	u32 smmu_rld_en1_s;
-	u32 smmu_rld_en2_s;
-	u32 smmu_intmas_s;
-	u32 smmu_intraw_s;
-	u32 smmu_intstat_s;
-	u32 smmu_intclr_s;
-	u32 smmu_scr_s;
-	u32 smmu_scb_sctrl;
-	u32 smmu_scb_ttbr;
-	u32 smmu_scb_ttbcr;
-	u32 smmu_offset_addr_s;
-
-	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
-};
-
-/*
- * RDMA
- */
-
-#define DMA_OFT_X0	(0x0000)
-#define DMA_OFT_Y0	(0x0004)
-#define DMA_OFT_X1	(0x0008)
-#define DMA_OFT_Y1	(0x000C)
-#define DMA_MASK0	(0x0010)
-#define DMA_MASK1	(0x0014)
-#define DMA_STRETCH_SIZE_VRT	(0x0018)
-#define DMA_CTRL	(0x001C)
-#define DMA_TILE_SCRAM	(0x0020)
-
-#define DMA_PULSE	(0x0028)
-#define DMA_CORE_GT	(0x002C)
-#define RWCH_CFG0	(0x0030)
-
-#define WDMA_DMA_SW_MASK_EN	(0x004C)
-#define WDMA_DMA_START_MASK0	(0x0050)
-#define WDMA_DMA_END_MASK0	(0x0054)
-#define WDMA_DMA_START_MASK1	(0x0058)
-#define WDMA_DMA_END_MASK1	(0x005C)
-
-#define DMA_DATA_ADDR0	(0x0060)
-#define DMA_STRIDE0	(0x0064)
-#define DMA_STRETCH_STRIDE0	(0x0068)
-#define DMA_DATA_NUM0	(0x006C)
-
-#define DMA_TEST0	(0x0070)
-#define DMA_TEST1	(0x0074)
-#define DMA_TEST3	(0x0078)
-#define DMA_TEST4	(0x007C)
-#define DMA_STATUS_Y	(0x0080)
-
-#define DMA_DATA_ADDR1	(0x0084)
-#define DMA_STRIDE1	(0x0088)
-#define DMA_STRETCH_STRIDE1	(0x008C)
-#define DMA_DATA_NUM1	(0x0090)
-
-#define DMA_TEST0_U	(0x0094)
-#define DMA_TEST1_U	(0x0098)
-#define DMA_TEST3_U	(0x009C)
-#define DMA_TEST4_U	(0x00A0)
-#define DMA_STATUS_U	(0x00A4)
-
-#define DMA_DATA_ADDR2	(0x00A8)
-#define DMA_STRIDE2	(0x00AC)
-#define DMA_STRETCH_STRIDE2	(0x00B0)
-#define DMA_DATA_NUM2	(0x00B4)
-
-#define DMA_TEST0_V	(0x00B8)
-#define DMA_TEST1_V	(0x00BC)
-#define DMA_TEST3_V	(0x00C0)
-#define DMA_TEST4_V	(0x00C4)
-#define DMA_STATUS_V	(0x00C8)
-
-#define CH_RD_SHADOW	(0x00D0)
-#define CH_CTL	(0x00D4)
-#define CH_SECU_EN	(0x00D8)
-#define CH_SW_END_REQ	(0x00DC)
-#define CH_CLK_SEL	(0x00E0)
-#define CH_CLK_EN	(0x00E4)
-
-/*
- * DFC
- */
-#define DFC_DISP_SIZE	(0x0000)
-#define DFC_PIX_IN_NUM	(0x0004)
+/* DFC */
 #define DFC_GLB_ALPHA	(0x0008)
-#define DFC_DISP_FMT	(0x000C)
-#define DFC_CLIP_CTL_HRZ	(0x0010)
-#define DFC_CLIP_CTL_VRZ	(0x0014)
-#define DFC_CTL_CLIP_EN	(0x0018)
-#define DFC_ICG_MODULE	(0x001C)
-#define DFC_DITHER_ENABLE	(0x0020)
-#define DFC_PADDING_CTL	(0x0024)
 
-struct dss_dfc {
-	u32 disp_size;
-	u32 pix_in_num;
-	u32 disp_fmt;
-	u32 clip_ctl_hrz;
-	u32 clip_ctl_vrz;
-	u32 ctl_clip_en;
-	u32 icg_module;
-	u32 dither_enable;
-	u32 padding_ctl;
-};
-
-/*
- * SCF
- */
-#define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
-#define DSS_SCF_Y_COEF_OFFSET	(0x2000)
-#define DSS_SCF_UV_COEF_OFFSET	(0x2800)
-
-#define SCF_EN_HSCL_STR	(0x0000)
-#define SCF_EN_VSCL_STR	(0x0004)
-#define SCF_H_V_ORDER	(0x0008)
-#define SCF_SCF_CORE_GT	(0x000C)
-#define SCF_INPUT_WIDTH_HEIGHT	(0x0010)
-#define SCF_OUTPUT_WIDTH_HEIGHT	(0x0014)
-#define SCF_COEF_MEM_CTRL  (0x0018)
-#define SCF_EN_HSCL	(0x001C)
-#define SCF_EN_VSCL	(0x0020)
-#define SCF_ACC_HSCL	(0x0024)
-#define SCF_ACC_HSCL1	(0x0028)
-#define SCF_INC_HSCL	(0x0034)
-#define SCF_ACC_VSCL	(0x0038)
-#define SCF_ACC_VSCL1	(0x003C)
-#define SCF_INC_VSCL	(0x0048)
-#define SCF_EN_NONLINEAR	(0x004C)
-#define SCF_EN_MMP	(0x007C)
-#define SCF_DB_H0	(0x0080)
-#define SCF_DB_H1	(0x0084)
-#define SCF_DB_V0	(0x0088)
-#define SCF_DB_V1	(0x008C)
-#define SCF_LB_MEM_CTRL	(0x0090)
-#define SCF_RD_SHADOW	(0x00F0)
-#define SCF_CLK_SEL	(0x00F8)
-#define SCF_CLK_EN	(0x00FC)
-#define WCH_SCF_COEF_MEM_CTRL (0x0218)
-#define WCH_SCF_LB_MEM_CTRL	(0x290)
-
-/* MACROS */
-#define SCF_MIN_INPUT	(16)
-#define SCF_MIN_OUTPUT	(16)
-
-/* Threshold for SCF Stretch and SCF filter */
-#define RDMA_STRETCH_THRESHOLD	(2)
-#define SCF_INC_FACTOR	BIT(18)
-#define SCF_UPSCALE_MAX	(60)
-#define SCF_DOWNSCALE_MAX	  (60)
-#define SCF_EDGE_FACTOR (3)
-#define ARSR2P_INC_FACTOR (65536)
-
-struct dss_scl {
-	u32 en_hscl_str;
-	u32 en_vscl_str;
-	u32 h_v_order;
-	u32 input_width_height;
-	u32 output_width_height;
-	u32 en_hscl;
-	u32 en_vscl;
-	u32 acc_hscl;
-	u32 inc_hscl;
-	u32 inc_vscl;
-	u32 en_mmp;
-	u32 scf_ch_core_gt;
-	u32 fmt;
-};
-
-enum scl_coef_lut_idx {
-	SCL_COEF_NONE_IDX = -1,
-	SCL_COEF_YUV_IDX = 0,
-	SCL_COEF_RGB_IDX = 1,
-	SCL_COEF_IDX_MAX = 2,
-};
-
-/*******************************************************************************
- ** ARSR2P  v0
- */
-#define ARSR2P_INPUT_WIDTH_HEIGHT		(0x000)
-#define ARSR2P_OUTPUT_WIDTH_HEIGHT		(0x004)
-#define ARSR2P_IHLEFT		(0x008)
+/* ARSR2P v0 */
 #define ARSR2P_IHRIGHT		(0x00C)
 #define ARSR2P_IVTOP		(0x010)
 #define ARSR2P_IVBOTTOM		(0x014)
@@ -1578,898 +156,29 @@ enum scl_coef_lut_idx {
 #define ARSR2P_IHRIGHT1		(0x090)
 #define ARSR2P_IVBOTTOM1		(0x094)
 
-#define ARSR2P_LUT_COEFY_V_OFFSET (0x0000)
-#define ARSR2P_LUT_COEFY_H_OFFSET (0x0100)
-#define ARSR2P_LUT_COEFA_V_OFFSET (0x0300)
-#define ARSR2P_LUT_COEFA_H_OFFSET (0x0400)
-#define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
-#define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
-
-struct dss_arsr2p_effect {
-	u32 skin_thres_y;
-	u32 skin_thres_u;
-	u32 skin_thres_v;
-	u32 skin_cfg0;
-	u32 skin_cfg1;
-	u32 skin_cfg2;
-	u32 shoot_cfg1;
-	u32 shoot_cfg2;
-	u32 sharp_cfg1;
-	u32 sharp_cfg2;
-	u32 sharp_cfg3;
-	u32 sharp_cfg4;
-	u32 sharp_cfg5;
-	u32 sharp_cfg6;
-	u32 sharp_cfg7;
-	u32 sharp_cfg8;
-	u32 sharp_cfg9;
-	u32 texturw_analysts;
-	u32 intplshootctrl;
-};
-
-struct dss_arsr2p {
-	u32 arsr_input_width_height;
-	u32 arsr_output_width_height;
-	u32 ihleft;
-	u32 ihright;
-	u32 ivtop;
-	u32 ivbottom;
-	u32 ihinc;
-	u32 ivinc;
-	u32 offset;
-	u32 mode;
-	struct dss_arsr2p_effect arsr2p_effect;
-	u32 ihleft1;
-	u32 ihright1;
-	u32 ivbottom1;
-};
-
-/*
- * POST_CLIP  v g
- */
-#define POST_CLIP_DISP_SIZE	(0x0000)
+/* POST_CLIP  v g */
 #define POST_CLIP_CTL_HRZ	(0x0010)
 #define POST_CLIP_CTL_VRZ	(0x0014)
 #define POST_CLIP_EN	(0x0018)
 
-struct dss_post_clip {
-	u32 disp_size;
-	u32 clip_ctl_hrz;
-	u32 clip_ctl_vrz;
-	u32 ctl_clip_en;
-};
+/* CSC */
 
-/*
- * PCSC v
- */
-#define PCSC_IDC0	(0x0000)
-#define PCSC_IDC2	(0x0004)
-#define PCSC_ODC0	(0x0008)
-#define PCSC_ODC2	(0x000C)
-#define PCSC_P0	(0x0010)
-#define PCSC_P1	(0x0014)
-#define PCSC_P2	(0x0018)
-#define PCSC_P3	(0x001C)
-#define PCSC_P4	(0x0020)
-#define PCSC_ICG_MODULE	(0x0024)
-#define PCSC_MPREC	(0x0028)
-
-struct dss_pcsc {
-	u32 pcsc_idc0;
-};
-
-/*
- * CSC
- */
-
-#define CSC_IDC0	(0x0000)
-#define CSC_IDC2	(0x0004)
-#define CSC_ODC0	(0x0008)
-#define CSC_ODC2	(0x000C)
-#define CSC_P0	(0x0010)
-#define CSC_P1	(0x0014)
-#define CSC_P2	(0x0018)
-#define CSC_P3	(0x001C)
-#define CSC_P4	(0x0020)
 #define CSC_ICG_MODULE	(0x0024)
-#define CSC_MPREC	(0x0028)
 
-struct dss_csc {
-	u32 idc0;
-	u32 idc2;
-	u32 odc0;
-	u32 odc2;
-	u32 p0;
-	u32 p1;
-	u32 p2;
-	u32 p3;
-	u32 p4;
-	u32 icg_module;
-	u32 mprec;
-};
+/* DMA BUF */
 
-/*
- * channel DEBUG
- */
-#define CH_DEBUG_SEL (0x600)
-
-/*
- * VPP
- */
-#define VPP_CTRL (0x700)
-#define VPP_MEM_CTRL (0x704)
-
-/*
- * DMA BUF
- */
-#define DMA_BUF_CTRL	(0x800)
-#define DMA_BUF_SIZE  (0x850)
-#define DMA_BUF_MEM_CTRL	(0x854)
-#define DMA_BUF_DBG0 (0x0838)
-#define DMA_BUF_DBG1 (0x083c)
-
-#define AFBCD_HREG_HDR_PTR_LO	(0x900)
-#define AFBCD_HREG_PIC_WIDTH	(0x904)
-#define AFBCD_HREG_PIC_HEIGHT	(0x90C)
-#define AFBCD_HREG_FORMAT	(0x910)
-#define AFBCD_CTL		(0x914)
-#define AFBCD_STR	(0x918)
-#define AFBCD_LINE_CROP	(0x91C)
-#define AFBCD_INPUT_HEADER_STRIDE	(0x920)
-#define AFBCD_PAYLOAD_STRIDE	(0x924)
-#define AFBCD_MM_BASE_0	(0x928)
-#define AFBCD_AFBCD_PAYLOAD_POINTER	(0x930)
-#define AFBCD_HEIGHT_BF_STR	(0x934)
-#define AFBCD_OS_CFG	(0x938)
-#define AFBCD_MEM_CTRL	(0x93C)
-#define AFBCD_SCRAMBLE_MODE	(0x940)
-#define AFBCD_HEADER_POINTER_OFFSET	(0x944)
-#define AFBCD_MONITOR_REG1_OFFSET	(0x948)
-#define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
-#define AFBCD_MONITOR_REG3_OFFSET	(0x950)
-#define AFBCD_DEBUG_REG0_OFFSET	(0x954)
-#define AFBCD_CREG_FBCD_CTRL_MODE	(0x960)
-#define AFBCD_HREG_HDR_PTR_L1		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1		(0x968)
-#define AFBCD_HEADER_SRTIDE_1		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
-#define AFBCD_HREG_HDR_PTR_L1		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1		(0x968)
-#define AFBCD_HEADER_SRTIDE_1		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
-#define AFBCD_BLOCK_TYPE				(0x974)
-#define AFBCD_MM_BASE_1				(0x978)
-#define AFBCD_MM_BASE_2				(0x97C)
-#define AFBCD_MM_BASE_3				(0x980)
-#define HFBCD_MEM_CTRL				(0x984)
-#define HFBCD_MEM_CTRL_1				(0x988)
-
-#define AFBCE_HREG_PIC_BLKS	(0x900)
-#define AFBCE_HREG_FORMAT	(0x904)
 #define AFBCE_HREG_HDR_PTR_LO	(0x908)
 #define AFBCE_HREG_PLD_PTR_LO	(0x90C)
-#define AFBCE_PICTURE_SIZE	(0x910)
-#define AFBCE_CTL	(0x914)
-#define AFBCE_HEADER_SRTIDE	(0x918)
-#define AFBCE_PAYLOAD_STRIDE	(0x91C)
-#define AFBCE_ENC_OS_CFG	(0x920)
-#define AFBCE_MEM_CTRL	(0x924)
-#define AFBCE_QOS_CFG	(0x928)
-#define AFBCE_THRESHOLD	(0x92C)
-#define AFBCE_SCRAMBLE_MODE	(0x930)
-#define AFBCE_HEADER_POINTER_OFFSET	(0x934)
-#define AFBCE_CREG_FBCE_CTRL_MODE	(0x950)
-#define AFBCE_HREG_HDR_PTR_L1		(0x954)
-#define AFBCE_HREG_PLD_PTR_L1		(0x958)
-#define AFBCE_HEADER_SRTIDE_1			(0x95C)
-#define AFBCE_PAYLOAD_SRTIDE_1		(0x960)
-#define AFBCE_MEM_CTRL_1				(0x968)
-#define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
 
-#define ROT_FIRST_LNS	(0x530)
-#define ROT_STATE	(0x534)
 #define ROT_MEM_CTRL		(0x538)
 #define ROT_SIZE	(0x53C)
-#define ROT_CPU_CTL0	(0x540)
-#define ROT_CPU_START0	(0x544)
-#define ROT_CPU_ADDR0	(0x548)
-#define ROT_CPU_RDATA0	(0x54C)
-#define ROT_CPU_RDATA1	(0x550)
-#define ROT_CPU_WDATA0	(0x554)
-#define ROT_CPU_WDATA1	(0x558)
-#define ROT_CPU_CTL1	(0x55C)
-#define ROT_CPU_START1	(0x560)
-#define ROT_CPU_ADDR1	(0x564)
-#define ROT_CPU_RDATA2	(0x568)
-#define ROT_CPU_RDATA3	(0x56C)
-#define ROT_CPU_WDATA2	(0x570)
-#define ROT_CPU_WDATA3	(0x574)
-
-#define CH_REG_DEFAULT (0x0A00)
-
-/* MACROS */
-#define MIN_INTERLEAVE	(7)
-#define MAX_TILE_SURPORT_NUM	(6)
 
 /* DMA aligned limited:  128bits aligned */
-#define DMA_ALIGN_BYTES	(128 / BITS_PER_BYTE)
-#define DMA_ADDR_ALIGN	(128 / BITS_PER_BYTE)
-#define DMA_STRIDE_ALIGN	(128 / BITS_PER_BYTE)
 
-#define TILE_DMA_ADDR_ALIGN	(256 * 1024)
-
-#define DMA_IN_WIDTH_MAX	(2048)
-#define DMA_IN_HEIGHT_MAX	(8192)
-
-#define AFBC_PIC_WIDTH_MIN	(16)
-#define AFBC_PIC_WIDTH_MAX	(8192)
-#define AFBC_PIC_HEIGHT_MIN	(16)
-#define AFBC_PIC_HEIGHT_MAX	(4096)
-
-#define AFBCD_TOP_CROP_MAX	(15)
-#define AFBCD_BOTTOM_CROP_MAX	(15)
-
-#define AFBC_HEADER_STRIDE_BLOCK	(16)
-
-#define AFBC_PAYLOAD_STRIDE_BLOCK	(1024)
-
-#define AFBC_SUPER_GRAPH_HEADER_ADDR_ALIGN	(128)
 #define AFBC_HEADER_ADDR_ALIGN	(64)
 #define AFBC_HEADER_STRIDE_ALIGN	(64)
 
-#define AFBC_PAYLOAD_ADDR_ALIGN_32	(1024)
-#define AFBC_PAYLOAD_STRIDE_ALIGN_32	(1024)
-#define AFBC_PAYLOAD_ADDR_ALIGN_16	(512)
-#define AFBC_PAYLOAD_STRIDE_ALIGN_16	(512)
-
-#define AFBC_BLOCK_ALIGN	(16)
-
-#define AFBCE_IN_WIDTH_MAX	(512)
-#define WROT_IN_WIDTH_MAX	(512)
-
-#define MMBUF_BASE	(0x40)
-#define MMBUF_LINE_NUM	(8)
-#define MMBUF_ADDR_ALIGN	(64)
-
-enum DSS_AFBC_HALF_BLOCK_MODE {
-	AFBC_HALF_BLOCK_UPPER_LOWER_ALL = 0,
-	AFBC_HALF_BLOCK_LOWER_UPPER_ALL,
-	AFBC_HALF_BLOCK_UPPER_ONLY,
-	AFBC_HALF_BLOCK_LOWER_ONLY,
-};
-
-struct dss_rdma {
-	u32 oft_x0;
-	u32 oft_y0;
-	u32 oft_x1;
-	u32 oft_y1;
-	u32 mask0;
-	u32 mask1;
-	u32 stretch_size_vrt;
-	u32 ctrl;
-	u32 tile_scram;
-
-	u32 data_addr0;
-	u32 stride0;
-	u32 stretch_stride0;
-	u32 data_num0;
-
-	u32 data_addr1;
-	u32 stride1;
-	u32 stretch_stride1;
-	u32 data_num1;
-
-	u32 data_addr2;
-	u32 stride2;
-	u32 stretch_stride2;
-	u32 data_num2;
-
-	u32 ch_rd_shadow;
-	u32 ch_ctl;
-
-	u32 dma_buf_ctrl;
-
-	u32 vpp_ctrl;
-	u32 vpp_mem_ctrl;
-
-	u32 afbcd_hreg_hdr_ptr_lo;
-	u32 afbcd_hreg_pic_width;
-	u32 afbcd_hreg_pic_height;
-	u32 afbcd_hreg_format;
-	u32 afbcd_ctl;
-	u32 afbcd_str;
-	u32 afbcd_line_crop;
-	u32 afbcd_input_header_stride;
-	u32 afbcd_payload_stride;
-	u32 afbcd_mm_base_0;
-
-	u32 afbcd_afbcd_payload_pointer;
-	u32 afbcd_height_bf_str;
-	u32 afbcd_os_cfg;
-	u32 afbcd_mem_ctrl;
-	u32 afbcd_scramble_mode;
-	u32 afbcd_header_pointer_offset;
-
-	u8 vpp_used;
-	u8 afbc_used;
-};
-
-struct dss_wdma {
-	u32 oft_x0;
-	u32 oft_y0;
-	u32 oft_x1;
-	u32 oft_y1;
-
-	u32 mask0;
-	u32 mask1;
-	u32 stretch_size_vrt;
-	u32 ctrl;
-	u32 tile_scram;
-
-	u32 sw_mask_en;
-	u32 start_mask0;
-	u32 end_mask0;
-	u32 start_mask1;
-	u32 end_mask1;
-
-	u32 data_addr;
-	u32 stride0;
-	u32 data1_addr;
-	u32 stride1;
-
-	u32 stretch_stride;
-	u32 data_num;
-
-	u32 ch_rd_shadow;
-	u32 ch_ctl;
-	u32 ch_secu_en;
-	u32 ch_sw_end_req;
-
-	u32 dma_buf_ctrl;
-	u32 dma_buf_size;
-
-	u32 rot_size;
-
-	u32 afbce_hreg_pic_blks;
-	u32 afbce_hreg_format;
-	u32 afbce_hreg_hdr_ptr_lo;
-	u32 afbce_hreg_pld_ptr_lo;
-	u32 afbce_picture_size;
-	u32 afbce_ctl;
-	u32 afbce_header_srtide;
-	u32 afbce_payload_stride;
-	u32 afbce_enc_os_cfg;
-	u32 afbce_mem_ctrl;
-	u32 afbce_qos_cfg;
-	u32 afbce_threshold;
-	u32 afbce_scramble_mode;
-	u32 afbce_header_pointer_offset;
-
-	u8 afbc_used;
-	u8 rot_used;
-};
-
-/*
- * MCTL  MUTEX0 1 2 3 4 5
- */
-#define MCTL_CTL_EN	(0x0000)
-#define MCTL_CTL_MUTEX	(0x0004)
-#define MCTL_CTL_MUTEX_STATUS	(0x0008)
-#define MCTL_CTL_MUTEX_ITF	(0x000C)
-#define MCTL_CTL_MUTEX_DBUF	(0x0010)
-#define MCTL_CTL_MUTEX_SCF	(0x0014)
-#define MCTL_CTL_MUTEX_OV	(0x0018)
-#define MCTL_CTL_MUTEX_WCH0	(0x0020)
-#define MCTL_CTL_MUTEX_WCH1	(0x0024)
-#define MCTL_CTL_MUTEX_WCH2	(0x0028)
-#define MCTL_CTL_MUTEX_RCH8	(0x002C)
-#define MCTL_CTL_MUTEX_RCH0	(0x0030)
-#define MCTL_CTL_MUTEX_RCH1	(0x0034)
-#define MCTL_CTL_MUTEX_RCH2	(0x0038)
-#define MCTL_CTL_MUTEX_RCH3	(0x003C)
-#define MCTL_CTL_MUTEX_RCH4	(0x0040)
-#define MCTL_CTL_MUTEX_RCH5	(0x0044)
-#define MCTL_CTL_MUTEX_RCH6	(0x0048)
-#define MCTL_CTL_MUTEX_RCH7	(0x004C)
-#define MCTL_CTL_TOP	(0x0050)
-#define MCTL_CTL_FLUSH_STATUS	(0x0054)
-#define MCTL_CTL_CLEAR	(0x0058)
-#define MCTL_CTL_CACK_TOUT	(0x0060)
-#define MCTL_CTL_MUTEX_TOUT	(0x0064)
-#define MCTL_CTL_STATUS	(0x0068)
-#define MCTL_CTL_INTEN	(0x006C)
-#define MCTL_CTL_SW_ST	(0x0070)
-#define MCTL_CTL_ST_SEL	(0x0074)
-#define MCTL_CTL_END_SEL	(0x0078)
-#define MCTL_CTL_CLK_SEL	(0x0080)
-#define MCTL_CTL_CLK_EN	(0x0084)
-#define MCTL_CTL_DBG	(0x00E0)
-
-/*
- * MCTL  SYS
- */
-#define MCTL_CTL_SECU_CFG	(0x0000)
-#define MCTL_PAY_SECU_FLUSH_EN  (0x0018)
-#define MCTL_CTL_SECU_GATE0	(0x0080)
-#define MCTL_CTL_SECU_GATE1	(0x0084)
-#define MCTL_CTL_SECU_GATE2	(0x0088)
-#define MCTL_DSI0_SECU_CFG_EN	(0x00A0)
-#define MCTL_DSI1_SECU_CFG_EN	(0x00A4)
-
-#define MCTL_RCH0_FLUSH_EN	(0x0100)
-#define MCTL_RCH1_FLUSH_EN	(0x0104)
-#define MCTL_RCH2_FLUSH_EN	(0x0108)
-#define MCTL_RCH3_FLUSH_EN	(0x010C)
-#define MCTL_RCH4_FLUSH_EN	(0x0110)
-#define MCTL_RCH5_FLUSH_EN	(0x0114)
-#define MCTL_RCH6_FLUSH_EN	(0x0118)
-#define MCTL_RCH7_FLUSH_EN	(0x011C)
-#define MCTL_WCH0_FLUSH_EN	(0x0120)
-#define MCTL_WCH1_FLUSH_EN	(0x0124)
-#define MCTL_OV0_FLUSH_EN	(0x0128)
-#define MCTL_OV1_FLUSH_EN	(0x012C)
-#define MCTL_OV2_FLUSH_EN	(0x0130)
-#define MCTL_OV3_FLUSH_EN	(0x0134)
-#define MCTL_RCH8_FLUSH_EN	(0x0138)
-#define MCTL_WCH2_FLUSH_EN	(0x013C)
-
-#define MCTL_RCH0_OV_OEN	(0x0160)
-#define MCTL_RCH1_OV_OEN	(0x0164)
-#define MCTL_RCH2_OV_OEN	(0x0168)
-#define MCTL_RCH3_OV_OEN	(0x016C)
-#define MCTL_RCH4_OV_OEN	(0x0170)
-#define MCTL_RCH5_OV_OEN	(0x0174)
-#define MCTL_RCH6_OV_OEN	(0x0178)
-#define MCTL_RCH7_OV_OEN	(0x017C)
-
-#define MCTL_RCH_OV0_SEL	(0x0180)
-#define MCTL_RCH_OV1_SEL	(0x0184)
-#define MCTL_RCH_OV2_SEL	(0x0188)
-#define MCTL_RCH_OV3_SEL	(0x018C)
-
-#define MCTL_WCH0_OV_IEN   (0x01A0)
-#define MCTL_WCH1_OV_IEN   (0x01A4)
-
-#define MCTL_WCH_OV2_SEL   (0x01A8)
-#define MCTL_WCH_OV3_SEL   (0x01AC)
-
-#define MCTL_WB_ENC_SEL	(0x01B0)
-#define MCTL_DSI_MUX_SEL	(0x01B4)
-
-#define MCTL_RCH0_STARTY	(0x01C0)
-#define MCTL_RCH1_STARTY	(0x01C4)
-#define MCTL_RCH2_STARTY	(0x01C8)
-#define MCTL_RCH3_STARTY	(0x01CC)
-#define MCTL_RCH4_STARTY	(0x01D0)
-#define MCTL_RCH5_STARTY	(0x01D4)
-#define MCTL_RCH6_STARTY	(0x01D8)
-#define MCTL_RCH7_STARTY	(0x01DC)
-
-#define MCTL_MCTL_CLK_SEL	(0x01F0)
-#define MCTL_MCTL_CLK_EN	(0x01F4)
-#define MCTL_MOD_CLK_SEL	(0x01F8)
-#define MCTL_MOD_CLK_EN	(0x01FC)
-
-#define MCTL_MOD0_DBG	(0x0200)
-#define MCTL_MOD1_DBG	(0x0204)
-#define MCTL_MOD2_DBG	(0x0208)
-#define MCTL_MOD3_DBG	(0x020C)
-#define MCTL_MOD4_DBG	(0x0210)
-#define MCTL_MOD5_DBG	(0x0214)
-#define MCTL_MOD6_DBG	(0x0218)
-#define MCTL_MOD7_DBG	(0x021C)
-#define MCTL_MOD8_DBG	(0x0220)
-#define MCTL_MOD9_DBG	(0x0224)
-#define MCTL_MOD10_DBG	(0x0228)
-#define MCTL_MOD11_DBG	(0x022C)
-#define MCTL_MOD12_DBG	(0x0230)
-#define MCTL_MOD13_DBG	(0x0234)
-#define MCTL_MOD14_DBG	(0x0238)
-#define MCTL_MOD15_DBG	(0x023C)
-#define MCTL_MOD16_DBG	(0x0240)
-#define MCTL_MOD17_DBG	(0x0244)
-#define MCTL_MOD18_DBG	(0x0248)
-#define MCTL_MOD19_DBG	(0x024C)
-#define MCTL_MOD20_DBG	(0x0250)
-#define MCTL_MOD0_STATUS	(0x0280)
-#define MCTL_MOD1_STATUS	(0x0284)
-#define MCTL_MOD2_STATUS	(0x0288)
-#define MCTL_MOD3_STATUS	(0x028C)
-#define MCTL_MOD4_STATUS	(0x0290)
-#define MCTL_MOD5_STATUS	(0x0294)
-#define MCTL_MOD6_STATUS	(0x0298)
-#define MCTL_MOD7_STATUS	(0x029C)
-#define MCTL_MOD8_STATUS	(0x02A0)
-#define MCTL_MOD9_STATUS	(0x02A4)
-#define MCTL_MOD10_STATUS	(0x02A8)
-#define MCTL_MOD11_STATUS	(0x02AC)
-#define MCTL_MOD12_STATUS	(0x02B0)
-#define MCTL_MOD13_STATUS	(0x02B4)
-#define MCTL_MOD14_STATUS	(0x02B8)
-#define MCTL_MOD15_STATUS	(0x02BC)
-#define MCTL_MOD16_STATUS	(0x02C0)
-#define MCTL_MOD17_STATUS	(0x02C4)
-#define MCTL_MOD18_STATUS	(0x02C8)
-#define MCTL_MOD19_STATUS	(0x02CC)
-#define MCTL_MOD20_STATUS	(0x02D0)
-#define MCTL_SW_DBG	(0x0300)
-#define MCTL_SW0_STATUS0	(0x0304)
-#define MCTL_SW0_STATUS1	(0x0308)
-#define MCTL_SW0_STATUS2	(0x030C)
-#define MCTL_SW0_STATUS3	(0x0310)
-#define MCTL_SW0_STATUS4	(0x0314)
-#define MCTL_SW0_STATUS5	(0x0318)
-#define MCTL_SW0_STATUS6	(0x031C)
-#define MCTL_SW0_STATUS7	(0x0320)
-#define MCTL_SW1_STATUS	(0x0324)
-
-#define MCTL_MOD_DBG_CH_NUM (10)
-#define MCTL_MOD_DBG_OV_NUM (4)
-#define MCTL_MOD_DBG_DBUF_NUM (2)
-#define MCTL_MOD_DBG_SCF_NUM (1)
-#define MCTL_MOD_DBG_ITF_NUM (2)
-#define MCTL_MOD_DBG_ADD_CH_NUM (2)
-
-enum dss_mctl_idx {
-	DSS_MCTL0 = 0,
-	DSS_MCTL1,
-	DSS_MCTL2,
-	DSS_MCTL3,
-	DSS_MCTL4,
-	DSS_MCTL5,
-	DSS_MCTL_IDX_MAX,
-};
-
-struct dss_mctl {
-	u32 ctl_mutex_itf;
-	u32 ctl_mutex_dbuf;
-	u32 ctl_mutex_scf;
-	u32 ctl_mutex_ov;
-};
-
-struct dss_mctl_ch_base {
-	char __iomem *chn_mutex_base;
-	char __iomem *chn_flush_en_base;
-	char __iomem *chn_ov_en_base;
-	char __iomem *chn_starty_base;
-	char __iomem *chn_mod_dbg_base;
-};
-
-struct dss_mctl_ch {
-	u32 chn_mutex;
-	u32 chn_flush_en;
-	u32 chn_ov_oen;
-	u32 chn_starty;
-	u32 chn_mod_dbg;
-};
-
-struct dss_mctl_sys {
-	u32 ov_flush_en[DSS_OVL_IDX_MAX];
-	u32 chn_ov_sel[DSS_OVL_IDX_MAX];
-	u32 wchn_ov_sel[DSS_WCH_MAX];
-	u8 ov_flush_en_used[DSS_OVL_IDX_MAX];
-	u8 chn_ov_sel_used[DSS_OVL_IDX_MAX];
-	u8 wch_ov_sel_used[DSS_WCH_MAX];
-};
-
-/*
- * OVL
- */
-#define OVL_SIZE	(0x0000)
-#define OVL_BG_COLOR	(0x4)
-#define OVL_DST_STARTPOS	(0x8)
-#define OVL_DST_ENDPOS	(0xC)
-#define OVL_GCFG	(0x10)
-#define OVL_LAYER0_POS	(0x14)
-#define OVL_LAYER0_SIZE	(0x18)
-#define OVL_LAYER0_SRCLOKEY	(0x1C)
-#define OVL_LAYER0_SRCHIKEY	(0x20)
-#define OVL_LAYER0_DSTLOKEY	(0x24)
-#define OVL_LAYER0_DSTHIKEY	(0x28)
-#define OVL_LAYER0_PATTERN	(0x2C)
-#define OVL_LAYER0_ALPHA	(0x30)
-#define OVL_LAYER0_CFG	(0x34)
-#define OVL_LAYER0_INFO_ALPHA	(0x40)
-#define OVL_LAYER0_INFO_SRCCOLOR	(0x44)
-#define OVL_LAYER1_POS	(0x50)
-#define OVL_LAYER1_SIZE	(0x54)
-#define OVL_LAYER1_SRCLOKEY	(0x58)
-#define OVL_LAYER1_SRCHIKEY	(0x5C)
-#define OVL_LAYER1_DSTLOKEY	(0x60)
-#define OVL_LAYER1_DSTHIKEY	(0x64)
-#define OVL_LAYER1_PATTERN	(0x68)
-#define OVL_LAYER1_ALPHA	(0x6C)
-#define OVL_LAYER1_CFG	(0x70)
-#define OVL_LAYER1_INFO_ALPHA	(0x7C)
-#define OVL_LAYER1_INFO_SRCCOLOR	(0x80)
-#define OVL_LAYER2_POS	(0x8C)
-#define OVL_LAYER2_SIZE	(0x90)
-#define OVL_LAYER2_SRCLOKEY	(0x94)
-#define OVL_LAYER2_SRCHIKEY	(0x98)
-#define OVL_LAYER2_DSTLOKEY	(0x9C)
-#define OVL_LAYER2_DSTHIKEY	(0xA0)
-#define OVL_LAYER2_PATTERN	(0xA4)
-#define OVL_LAYER2_ALPHA	(0xA8)
-#define OVL_LAYER2_CFG	(0xAC)
-#define OVL_LAYER2_INFO_ALPHA	(0xB8)
-#define OVL_LAYER2_INFO_SRCCOLOR	(0xBC)
-#define OVL_LAYER3_POS	(0xC8)
-#define OVL_LAYER3_SIZE	(0xCC)
-#define OVL_LAYER3_SRCLOKEY	(0xD0)
-#define OVL_LAYER3_SRCHIKEY	(0xD4)
-#define OVL_LAYER3_DSTLOKEY	(0xD8)
-#define OVL_LAYER3_DSTHIKEY	(0xDC)
-#define OVL_LAYER3_PATTERN	(0xE0)
-#define OVL_LAYER3_ALPHA	(0xE4)
-#define OVL_LAYER3_CFG	(0xE8)
-#define OVL_LAYER3_INFO_ALPHA	(0xF4)
-#define OVL_LAYER3_INFO_SRCCOLOR	(0xF8)
-#define OVL_LAYER4_POS	(0x104)
-#define OVL_LAYER4_SIZE	(0x108)
-#define OVL_LAYER4_SRCLOKEY	(0x10C)
-#define OVL_LAYER4_SRCHIKEY	(0x110)
-#define OVL_LAYER4_DSTLOKEY	(0x114)
-#define OVL_LAYER4_DSTHIKEY	(0x118)
-#define OVL_LAYER4_PATTERN	(0x11C)
-#define OVL_LAYER4_ALPHA	(0x120)
-#define OVL_LAYER4_CFG	(0x124)
-#define OVL_LAYER4_INFO_ALPHA	(0x130)
-#define OVL_LAYER4_INFO_SRCCOLOR	(0x134)
-#define OVL_LAYER5_POS	(0x140)
-#define OVL_LAYER5_SIZE	(0x144)
-#define OVL_LAYER5_SRCLOKEY	(0x148)
-#define OVL_LAYER5_SRCHIKEY	(0x14C)
-#define OVL_LAYER5_DSTLOKEY	(0x150)
-#define OVL_LAYER5_DSTHIKEY	(0x154)
-#define OVL_LAYER5_PATTERN	(0x158)
-#define OVL_LAYER5_ALPHA	(0x15C)
-#define OVL_LAYER5_CFG	(0x160)
-#define OVL_LAYER5_INFO_ALPHA	(0x16C)
-#define OVL_LAYER5_INFO_SRCCOLOR	(0x170)
-#define OVL_LAYER6_POS	(0x14)
-#define OVL_LAYER6_SIZE	(0x18)
-#define OVL_LAYER6_SRCLOKEY	(0x1C)
-#define OVL_LAYER6_SRCHIKEY	(0x20)
-#define OVL_LAYER6_DSTLOKEY	(0x24)
-#define OVL_LAYER6_DSTHIKEY	(0x28)
-#define OVL_LAYER6_PATTERN	(0x2C)
-#define OVL_LAYER6_ALPHA	(0x30)
-#define OVL_LAYER6_CFG	(0x34)
-#define OVL_LAYER6_INFO_ALPHA	(0x40)
-#define OVL_LAYER6_INFO_SRCCOLOR	(0x44)
-#define OVL_LAYER7_POS	(0x50)
-#define OVL_LAYER7_SIZE	(0x54)
-#define OVL_LAYER7_SRCLOKEY	(0x58)
-#define OVL_LAYER7_SRCHIKEY	(0x5C)
-#define OVL_LAYER7_DSTLOKEY	(0x60)
-#define OVL_LAYER7_DSTHIKEY	(0x64)
-#define OVL_LAYER7_PATTERN	(0x68)
-#define OVL_LAYER7_ALPHA	(0x6C)
-#define OVL_LAYER7_CFG	(0x70)
-#define OVL_LAYER7_INFO_ALPHA	(0x7C)
-#define OVL_LAYER7_INFO_SRCCOLOR	(0x80)
-#define OVL_LAYER0_ST_INFO	(0x48)
-#define OVL_LAYER1_ST_INFO	(0x84)
-#define OVL_LAYER2_ST_INFO	(0xC0)
-#define OVL_LAYER3_ST_INFO	(0xFC)
-#define OVL_LAYER4_ST_INFO	(0x138)
-#define OVL_LAYER5_ST_INFO	(0x174)
-#define OVL_LAYER6_ST_INFO	(0x48)
-#define OVL_LAYER7_ST_INFO	(0x84)
-#define OVL_LAYER0_IST_INFO	(0x4C)
-#define OVL_LAYER1_IST_INFO	(0x88)
-#define OVL_LAYER2_IST_INFO	(0xC4)
-#define OVL_LAYER3_IST_INFO	(0x100)
-#define OVL_LAYER4_IST_INFO	(0x13C)
-#define OVL_LAYER5_IST_INFO	(0x178)
-#define OVL_LAYER6_IST_INFO	(0x4C)
-#define OVL_LAYER7_IST_INFO	(0x88)
-#define OVL_LAYER0_PSPOS	(0x38)
-#define OVL_LAYER0_PEPOS	(0x3C)
-#define OVL_LAYER1_PSPOS	(0x74)
-#define OVL_LAYER1_PEPOS	(0x78)
-#define OVL_LAYER2_PSPOS	(0xB0)
-#define OVL_LAYER2_PEPOS	(0xB4)
-#define OVL_LAYER3_PSPOS	(0xEC)
-#define OVL_LAYER3_PEPOS	(0xF0)
-#define OVL_LAYER4_PSPOS	(0x128)
-#define OVL_LAYER4_PEPOS	(0x12C)
-#define OVL_LAYER5_PSPOS	(0x164)
-#define OVL_LAYER5_PEPOS	(0x168)
-#define OVL_LAYER6_PSPOS	(0x38)
-#define OVL_LAYER6_PEPOS	(0x3C)
-#define OVL_LAYER7_PSPOS	(0x74)
-#define OVL_LAYER7_PEPOS	(0x78)
-
-#define OVL6_BASE_ST_INFO	(0x17C)
-#define OVL6_BASE_IST_INFO	(0x180)
-#define OVL6_GATE_CTRL	(0x184)
-#define OVL6_RD_SHADOW_SEL	(0x188)
-#define OVL6_OV_CLK_SEL	(0x18C)
-#define OVL6_OV_CLK_EN	(0x190)
-#define OVL6_BLOCK_SIZE	(0x1A0)
-#define OVL6_BLOCK_DBG	(0x1A4)
-#define OVL6_REG_DEFAULT (0x1A8)
-
-#define OVL2_BASE_ST_INFO	(0x8C)
-#define OVL2_BASE_IST_INFO	(0x90)
-#define OVL2_GATE_CTRL	(0x94)
-#define OVL2_OV_RD_SHADOW_SEL	(0x98)
-#define OVL2_OV_CLK_SEL	(0x9C)
-#define OVL2_OV_CLK_EN	(0xA0)
-#define OVL2_BLOCK_SIZE	(0xB0)
-#define OVL2_BLOCK_DBG	(0xB4)
-#define OVL2_REG_DEFAULT	(0xB8)
-
-/* LAYER0_CFG */
-#define BIT_OVL_LAYER_SRC_CFG	BIT(8)
-#define BIT_OVL_LAYER_ENABLE	BIT(0)
-
-/* LAYER0_INFO_ALPHA */
-#define BIT_OVL_LAYER_SRCALPHA_FLAG	BIT(3)
-#define BIT_OVL_LAYER_DSTALPHA_FLAG	BIT(2)
-
-/* LAYER0_INFO_SRCCOLOR */
-#define BIT_OVL_LAYER_SRCCOLOR_FLAG	BIT(0)
-
-#define OVL_6LAYER_NUM		(6)
-#define OVL_2LAYER_NUM		(2)
-
-/*
- * OVL
- */
-#define OV_SIZE						(0x000)
-#define OV_BG_COLOR_RGB			(0x004)
-#define OV_BG_COLOR_A				(0x008)
-#define OV_DST_STARTPOS			(0x00C)
-#define OV_DST_ENDPOS				(0x010)
-#define OV_GCFG					(0x014)
-#define OV_LAYER0_POS				(0x030)
-#define OV_LAYER0_SIZE				(0x034)
-#define OV_LAYER0_SRCLOKEY		(0x038)
-#define OV_LAYER0_SRCHIKEY		(0x03C)
-#define OV_LAYER0_DSTLOKEY		(0x040)
-#define OV_LAYER0_DSTHIKEY		(0x044)
-#define OV_LAYER0_PATTERN_RGB	(0x048)
-#define OV_LAYER0_PATTERN_A		(0x04C)
-#define OV_LAYER0_ALPHA_MODE		(0x050)
-#define OV_LAYER0_ALPHA_A			(0x054)
-#define OV_LAYER0_CFG				(0x058)
-#define OV_LAYER0_PSPOS			(0x05C)
-#define OV_LAYER0_PEPOS			(0x060)
-#define OV_LAYER0_INFO_ALPHA		(0x064)
-#define OV_LAYER0_INFO_SRCCOLOR	(0x068)
-#define OV_LAYER0_DBG_INFO		(0x06C)
-#define OV8_BASE_DBG_INFO			(0x340)
-#define OV8_RD_SHADOW_SEL			(0x344)
-#define OV8_CLK_SEL					(0x348)
-#define OV8_CLK_EN					(0x34C)
-#define OV8_BLOCK_SIZE				(0x350)
-#define OV8_BLOCK_DBG				(0x354)
-#define OV8_REG_DEFAULT			(0x358)
-#define OV2_BASE_DBG_INFO			(0x200)
-#define OV2_RD_SHADOW_SEL			(0x204)
-#define OV2_CLK_SEL					(0x208)
-#define OV2_CLK_EN					(0x20C)
-#define OV2_BLOCK_SIZE				(0x210)
-#define OV2_BLOCK_DBG				(0x214)
-#define OV2_REG_DEFAULT			(0x218)
-
-#define OV_8LAYER_NUM				(8)
-struct dss_ovl_layer {
-	u32 layer_pos;
-	u32 layer_size;
-	u32 layer_pattern;
-	u32 layer_alpha;
-	u32 layer_cfg;
-
-};
-
-struct dss_ovl_layer_pos {
-	u32 layer_pspos;
-	u32 layer_pepos;
-
-};
-
-struct dss_ovl {
-	u32 ovl_size;
-	u32 ovl_bg_color;
-	u32 ovl_dst_startpos;
-	u32 ovl_dst_endpos;
-	u32 ovl_gcfg;
-	u32 ovl_block_size;
-	struct dss_ovl_layer ovl_layer[OVL_6LAYER_NUM];
-	struct dss_ovl_layer_pos ovl_layer_pos[OVL_6LAYER_NUM];
-	u8 ovl_layer_used[OVL_6LAYER_NUM];
-};
-
-struct dss_ovl_alpha {
-	u32 src_amode;
-	u32 src_gmode;
-	u32 alpha_offsrc;
-	u32 src_lmode;
-	u32 src_pmode;
-
-	u32 alpha_smode;
-
-	u32 dst_amode;
-	u32 dst_gmode;
-	u32 alpha_offdst;
-	u32 dst_pmode;
-
-	u32 fix_mode;
-};
-
-/*
- * DBUF
- */
-#define DBUF_FRM_SIZE	(0x0000)
-#define DBUF_FRM_HSIZE	(0x0004)
-#define DBUF_SRAM_VALID_NUM	(0x0008)
-#define DBUF_WBE_EN	(0x000C)
-#define DBUF_THD_FILL_LEV0	(0x0010)
-#define DBUF_DFS_FILL_LEV1	(0x0014)
-#define DBUF_THD_RQOS	(0x0018)
-#define DBUF_THD_WQOS	(0x001C)
-#define DBUF_THD_CG	(0x0020)
-#define DBUF_THD_OTHER	(0x0024)
-#define DBUF_FILL_LEV0_CNT	(0x0028)
-#define DBUF_FILL_LEV1_CNT	(0x002C)
-#define DBUF_FILL_LEV2_CNT	(0x0030)
-#define DBUF_FILL_LEV3_CNT	(0x0034)
-#define DBUF_FILL_LEV4_CNT	(0x0038)
-#define DBUF_ONLINE_FILL_LEVEL	(0x003C)
-#define DBUF_WB_FILL_LEVEL	(0x0040)
-#define DBUF_DFS_STATUS	(0x0044)
-#define DBUF_THD_FLUX_REQ_BEF	(0x0048)
-#define DBUF_DFS_LP_CTRL	(0x004C)
-#define DBUF_RD_SHADOW_SEL	(0x0050)
-#define DBUF_MEM_CTRL (0x0054)
-#define DBUF_PM_CTRL (0x0058)
-#define DBUF_CLK_SEL (0x005C)
-#define DBUF_CLK_EN (0x0060)
-#define DBUF_THD_FLUX_REQ_AFT (0x0064)
-#define DBUF_THD_DFS_OK (0x0068)
-#define DBUF_FLUX_REQ_CTRL (0x006C)
-#define DBUF_REG_DEFAULT  (0x00A4)
-#define DBUF_DFS_RAM_MANAGE  (0x00A8)
-#define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
-
-/*
- * DPP
- */
-#define DPP_RD_SHADOW_SEL	(0x000)
-#define DPP_DEFAULT	(0x004)
-#define DPP_ID	(0x008)
-#define DPP_IMG_SIZE_BEF_SR	(0x00C)
-#define DPP_IMG_SIZE_AFT_SR	(0x010)
-#define DPP_SBL	(0x014)
-#define DPP_SBL_MEM_CTRL	(0x018)
-#define DPP_ARSR1P_MEM_CTRL	(0x01C)
-#define DPP_CLK_SEL	(0x020)
-#define DPP_CLK_EN	(0x024)
-#define DPP_DBG1_CNT	(0x028)
-#define DPP_DBG2_CNT	(0x02C)
-#define DPP_DBG1	(0x030)
-#define DPP_DBG2	(0x034)
-#define DPP_DBG3	(0x038)
-#define DPP_DBG4	(0x03C)
-#define DPP_INTS	(0x040)
-#define DPP_INT_MSK	(0x044)
-#define DPP_ARSR1P	(0x048)
-#define DPP_DBG_CNT  DPP_DBG1_CNT
-
-#define DPP_CLRBAR_CTRL (0x100)
-#define DPP_CLRBAR_1ST_CLR (0x104)
-#define DPP_CLRBAR_2ND_CLR (0x108)
-#define DPP_CLRBAR_3RD_CLR (0x10C)
-
-#define DPP_CLIP_TOP (0x180)
-#define DPP_CLIP_BOTTOM (0x184)
-#define DPP_CLIP_LEFT (0x188)
-#define DPP_CLIP_RIGHT (0x18C)
-#define DPP_CLIP_EN (0x190)
-#define DPP_CLIP_DBG (0x194)
+/* DPP */
 
 #define DITHER_PARA (0x000)
 #define DITHER_CTL (0x004)
@@ -2487,162 +196,12 @@ struct dss_ovl_alpha {
 #define DITHER_DBG1 (0x034)
 #define DITHER_DBG2 (0x038)
 
-#define CSC10B_IDC0	(0x000)
-#define CSC10B_IDC1	(0x004)
-#define CSC10B_IDC2	(0x008)
-#define CSC10B_ODC0	(0x00C)
-#define CSC10B_ODC1	(0x010)
-#define CSC10B_ODC2	(0x014)
-#define CSC10B_P00	(0x018)
-#define CSC10B_P01	(0x01C)
-#define CSC10B_P02	(0x020)
-#define CSC10B_P10	(0x024)
-#define CSC10B_P11	(0x028)
-#define CSC10B_P12	(0x02C)
-#define CSC10B_P20	(0x030)
-#define CSC10B_P21	(0x034)
-#define CSC10B_P22	(0x038)
-#define CSC10B_MODULE_EN	(0x03C)
-#define CSC10B_MPREC	(0x040)
-
-#define GAMA_EN	(0x000)
-#define GAMA_MEM_CTRL	(0x004)
-
-#define ACM_EN	(0x000)
-#define ACM_SATA_OFFSET	(0x004)
-#define ACM_HUESEL	(0x008)
-#define ACM_CSC_IDC0	(0x00C)
-#define ACM_CSC_IDC1	(0x010)
-#define ACM_CSC_IDC2	(0x014)
-#define ACM_CSC_P00	(0x018)
-#define ACM_CSC_P01	(0x01C)
-#define ACM_CSC_P02	(0x020)
-#define ACM_CSC_P10	(0x024)
-#define ACM_CSC_P11	(0x028)
-#define ACM_CSC_P12	(0x02C)
-#define ACM_CSC_P20	(0x030)
-#define ACM_CSC_P21	(0x034)
-#define ACM_CSC_P22	(0x038)
-#define ACM_CSC_MRREC	(0x03C)
-#define ACM_R0_H	(0x040)
-#define ACM_R1_H	(0x044)
-#define ACM_R2_H	(0x048)
-#define ACM_R3_H	(0x04C)
-#define ACM_R4_H	(0x050)
-#define ACM_R5_H	(0x054)
-#define ACM_R6_H	(0x058)
-#define ACM_LUT_DIS0	(0x05C)
-#define ACM_LUT_DIS1	(0x060)
-#define ACM_LUT_DIS2	(0x064)
-#define ACM_LUT_DIS3	(0x068)
-#define ACM_LUT_DIS4	(0x06C)
-#define ACM_LUT_DIS5	(0x070)
-#define ACM_LUT_DIS6	(0x074)
-#define ACM_LUT_DIS7	(0x078)
-#define ACM_LUT_PARAM0	(0x07C)
-#define ACM_LUT_PARAM1	(0x080)
-#define ACM_LUT_PARAM2	(0x084)
-#define ACM_LUT_PARAM3	(0x088)
-#define ACM_LUT_PARAM4	(0x08C)
-#define ACM_LUT_PARAM5	(0x090)
-#define ACM_LUT_PARAM6	(0x094)
-#define ACM_LUT_PARAM7	(0x098)
-#define ACM_LUT_SEL	(0x09C)
-#define ACM_MEM_CTRL	(0x0A0)
-#define ACM_DEBUG_TOP	(0x0A4)
-#define ACM_DEBUG_CFG	(0x0A8)
-#define ACM_DEBUG_W	(0x0AC)
-
-#define ACE_EN	(0x000)
-#define ACE_SKIN_CFG	(0x004)
-#define ACE_LUT_SEL	(0x008)
-#define ACE_HIST_IND	(0x00C)
-#define ACE_ACTIVE	(0x010)
-#define ACE_DBG	(0x014)
-#define ACE_MEM_CTRL	(0x018)
-#define ACE_IN_SEL	(0x01C)
-#define ACE_R2Y	(0x020)
-#define ACE_G2Y	(0x024)
-#define ACE_B2Y	(0x028)
-#define ACE_Y_OFFSET	(0x02C)
-#define ACE_Y_CEN	(0x030)
-#define ACE_U_CEN	(0x034)
-#define ACE_V_CEN	(0x038)
-#define ACE_Y_EXT	(0x03C)
-#define ACE_U_EXT	(0x040)
-#define ACE_V_EXT	(0x044)
-#define ACE_Y_ATTENU	(0x048)
-#define ACE_U_ATTENU	(0x04C)
-#define ACE_V_ATTENU	(0x050)
-#define ACE_ROTA	(0x054)
-#define ACE_ROTB	(0x058)
-#define ACE_Y_CORE	(0x05C)
-#define ACE_U_CORE	(0x060)
-#define ACE_V_CORE	(0x064)
-
-#define LCP_XCC_COEF_00	(0x000)
-#define LCP_XCC_COEF_01	(0x004)
-#define LCP_XCC_COEF_02	(0x008)
-#define LCP_XCC_COEF_03	(0x00C)
-#define LCP_XCC_COEF_10	(0x010)
-#define LCP_XCC_COEF_11	(0x014)
-#define LCP_XCC_COEF_12	(0x018)
-#define LCP_XCC_COEF_13	(0x01C)
-#define LCP_XCC_COEF_20	(0x020)
-#define LCP_XCC_COEF_21	(0x024)
-#define LCP_XCC_COEF_22	(0x028)
-#define LCP_XCC_COEF_23	(0x02C)
 #define LCP_GMP_BYPASS_EN	(0x030)
 #define LCP_XCC_BYPASS_EN	(0x034)
 #define LCP_DEGAMA_EN	(0x038)
 #define LCP_DEGAMA_MEM_CTRL	(0x03C)
 #define LCP_GMP_MEM_CTRL	(0x040)
 
-struct dss_arsr1p {
-	u32 ihleft;
-	u32 ihright;
-	u32 ihleft1;
-	u32 ihright1;
-	u32 ivtop;
-	u32 ivbottom;
-	u32 uv_offset;
-	u32 ihinc;
-	u32 ivinc;
-	u32 mode;
-	u32 format;
-
-	u32 skin_thres_y;
-	u32 skin_thres_u;
-	u32 skin_thres_v;
-	u32 skin_expected;
-	u32 skin_cfg;
-	u32 shoot_cfg1;
-	u32 shoot_cfg2;
-	u32 sharp_cfg1;
-	u32 sharp_cfg2;
-	u32 sharp_cfg3;
-	u32 sharp_cfg4;
-	u32 sharp_cfg5;
-	u32 sharp_cfg6;
-	u32 sharp_cfg7;
-	u32 sharp_cfg8;
-	u32 sharp_cfg9;
-	u32 sharp_cfg10;
-	u32 sharp_cfg11;
-	u32 diff_ctrl;
-	u32 lsc_cfg1;
-	u32 lsc_cfg2;
-	u32 lsc_cfg3;
-	u32 force_clk_on_cfg;
-
-	u32 dpp_img_hrz_bef_sr;
-	u32 dpp_img_vrt_bef_sr;
-	u32 dpp_img_hrz_aft_sr;
-	u32 dpp_img_vrt_aft_sr;
-};
-
-#define ARSR1P_INC_FACTOR (65536)
-
 #define ARSR1P_IHLEFT		(0x000)
 #define ARSR1P_IHRIGHT		(0x004)
 #define ARSR1P_IHLEFT1		(0x008)
@@ -2678,41 +237,9 @@ struct dss_arsr1p {
 #define ARSR1P_LSC_CFG3		(0x080)
 #define ARSR1P_FORCE_CLK_ON_CFG		(0x084)
 
-/*
- * BIT EXT
- */
-#define BIT_EXT0_CTL (0x000)
-
-#define U_GAMA_R_COEF	(0x000)
-#define U_GAMA_G_COEF	(0x400)
-#define U_GAMA_B_COEF	(0x800)
-#define U_GAMA_R_LAST_COEF (0x200)
-#define U_GAMA_G_LAST_COEF (0x600)
-#define U_GAMA_B_LAST_COEF (0xA00)
-
-#define ACM_U_H_COEF	(0x000)
-#define ACM_U_SATA_COEF	(0x200)
-#define ACM_U_SATR0_COEF	(0x300)
-#define ACM_U_SATR1_COEF	(0x340)
-#define ACM_U_SATR2_COEF	(0x380)
-#define ACM_U_SATR3_COEF	(0x3C0)
-#define ACM_U_SATR4_COEF	(0x400)
-#define ACM_U_SATR5_COEF	(0x440)
-#define ACM_U_SATR6_COEF	(0x480)
-#define ACM_U_SATR7_COEF	(0x4C0)
+/* BIT EXT */
 
 #define LCP_U_GMP_COEF	(0x0000)
-#define LCP_U_DEGAMA_R_COEF	(0x5000)
-#define LCP_U_DEGAMA_G_COEF	(0x5400)
-#define LCP_U_DEGAMA_B_COEF	(0x5800)
-#define LCP_U_DEGAMA_R_LAST_COEF (0x5200)
-#define LCP_U_DEGAMA_G_LAST_COEF (0x5600)
-#define LCP_U_DEGAMA_B_LAST_COEF (0x5A00)
-
-#define ACE_HIST0	(0x000)
-#define ACE_HIST1	(0x400)
-#define ACE_LUT0	(0x800)
-#define ACE_LUT1	(0xA00)
 
 #define ARSR1P_LSC_GAIN		(0x084)
 #define ARSR1P_COEFF_H_Y0	(0x0F0)
@@ -2724,509 +251,4 @@ struct dss_arsr1p {
 #define ARSR1P_COEFF_V_UV0	(0x1C8)
 #define ARSR1P_COEFF_V_UV1	(0x1EC)
 
-#define HIACE_INT_STAT (0x0000)
-#define HIACE_INT_UNMASK (0x0004)
-#define HIACE_BYPASS_ACE (0x0008)
-#define HIACE_BYPASS_ACE_STAT (0x000c)
-#define HIACE_UPDATE_LOCAL (0x0010)
-#define HIACE_LOCAL_VALID (0x0014)
-#define HIACE_GAMMA_AB_SHADOW (0x0018)
-#define HIACE_GAMMA_AB_WORK (0x001c)
-#define HIACE_GLOBAL_HIST_AB_SHADOW (0x0020)
-#define HIACE_GLOBAL_HIST_AB_WORK (0x0024)
-#define HIACE_IMAGE_INFO (0x0030)
-#define HIACE_HALF_BLOCK_H_W (0x0034)
-#define HIACE_XYWEIGHT (0x0038)
-#define HIACE_LHIST_SFT (0x003c)
-#define HIACE_HUE (0x0050)
-#define HIACE_SATURATION (0x0054)
-#define HIACE_VALUE (0x0058)
-#define HIACE_SKIN_GAIN (0x005c)
-#define HIACE_UP_LOW_TH (0x0060)
-#define HIACE_UP_CNT (0x0070)
-#define HIACE_LOW_CNT (0x0074)
-#define HIACE_GLOBAL_HIST_LUT_ADDR (0x0080)
-#define HIACE_LHIST_EN (0x0100)
-#define HIACE_LOCAL_HIST_VxHy_2z_2z1 (0x0104)
-#define HIACE_GAMMA_EN (0x0108)
-#define HIACE_GAMMA_VxHy_3z2_3z1_3z_W (0x010c)
-#define HIACE_GAMMA_EN_HV_R (0x0110)
-#define HIACE_GAMMA_VxHy_3z2_3z1_3z_R (0x0114)
-#define HIACE_INIT_GAMMA (0x0120)
-#define HIACE_MANUAL_RELOAD (0x0124)
-#define HIACE_RAMCLK_FUNC (0x0128)
-#define HIACE_CLK_GATE (0x012c)
-#define HIACE_GAMMA_RAM_A_CFG_MEM_CTRL (0x0130)
-#define HIACE_GAMMA_RAM_B_CFG_MEM_CTRL (0x0134)
-#define HIACE_LHIST_RAM_CFG_MEM_CTRL (0x0138)
-#define HIACE_GAMMA_RAM_A_CFG_PM_CTRL (0x0140)
-#define HIACE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
-#define HIACE_LHIST_RAM_CFG_PM_CTRL (0x0148)
-
-/*
- * IFBC
- */
-#define IFBC_SIZE	(0x0000)
-#define IFBC_CTRL	(0x0004)
-#define IFBC_HIMAX_CTRL0	(0x0008)
-#define IFBC_HIMAX_CTRL1	(0x000C)
-#define IFBC_HIMAX_CTRL2	(0x0010)
-#define IFBC_HIMAX_CTRL3	(0x0014)
-#define IFBC_EN	(0x0018)
-#define IFBC_MEM_CTRL	(0x001C)
-#define IFBC_INSERT	(0x0020)
-#define IFBC_HIMAX_TEST_MODE	(0x0024)
-#define IFBC_CORE_GT	(0x0028)
-#define IFBC_PM_CTRL	(0x002C)
-#define IFBC_RD_SHADOW	(0x0030)
-#define IFBC_ORISE_CTL	(0x0034)
-#define IFBC_ORSISE_DEBUG0	(0x0038)
-#define IFBC_ORSISE_DEBUG1	(0x003C)
-#define IFBC_RSP_COMP_TEST	(0x0040)
-#define IFBC_CLK_SEL	(0x044)
-#define IFBC_CLK_EN	(0x048)
-#define IFBC_PAD	(0x004C)
-#define IFBC_REG_DEFAULT	(0x0050)
-
-/*
- * DSC
- */
-#define DSC_VERSION	(0x0000)
-#define DSC_PPS_IDENTIFIER	(0x0004)
-#define DSC_EN	(0x0008)
-#define DSC_CTRL	(0x000C)
-#define DSC_PIC_SIZE	(0x0010)
-#define DSC_SLICE_SIZE	(0x0014)
-#define DSC_CHUNK_SIZE	(0x0018)
-#define DSC_INITIAL_DELAY	(0x001C)
-#define DSC_RC_PARAM0	(0x0020)
-#define DSC_RC_PARAM1	(0x0024)
-#define DSC_RC_PARAM2	(0x0028)
-#define DSC_RC_PARAM3	(0x002C)
-#define DSC_FLATNESS_QP_TH	(0x0030)
-#define DSC_RC_PARAM4	(0x0034)
-#define DSC_RC_PARAM5	(0x0038)
-#define DSC_RC_BUF_THRESH0	(0x003C)
-#define DSC_RC_BUF_THRESH1	(0x0040)
-#define DSC_RC_BUF_THRESH2	(0x0044)
-#define DSC_RC_BUF_THRESH3	(0x0048)
-#define DSC_RC_RANGE_PARAM0	(0x004C)
-#define DSC_RC_RANGE_PARAM1	(0x0050)
-#define DSC_RC_RANGE_PARAM2	(0x0054)
-#define DSC_RC_RANGE_PARAM3	(0x0058)
-#define DSC_RC_RANGE_PARAM4	(0x005C)
-#define DSC_RC_RANGE_PARAM5	(0x0060)
-#define DSC_RC_RANGE_PARAM6	(0x0064)
-#define DSC_RC_RANGE_PARAM7	(0x0068)
-#define DSC_ADJUSTMENT_BITS	(0x006C)
-#define DSC_BITS_PER_GRP	(0x0070)
-#define DSC_MULTI_SLICE_CTL	(0x0074)
-#define DSC_OUT_CTRL	(0x0078)
-#define DSC_CLK_SEL	(0x007C)
-#define DSC_CLK_EN	(0x0080)
-#define DSC_MEM_CTRL	(0x0084)
-#define DSC_ST_DATAIN	(0x0088)
-#define DSC_ST_DATAOUT	(0x008C)
-#define DSC0_ST_SLC_POS	(0x0090)
-#define DSC1_ST_SLC_POS	(0x0094)
-#define DSC0_ST_PIC_POS	(0x0098)
-#define DSC1_ST_PIC_POS	(0x009C)
-#define DSC0_ST_FIFO	(0x00A0)
-#define DSC1_ST_FIFO	(0x00A4)
-#define DSC0_ST_LINEBUF	(0x00A8)
-#define DSC1_ST_LINEBUF	(0x00AC)
-#define DSC_ST_ITFC	(0x00B0)
-#define DSC_RD_SHADOW_SEL	(0x00B4)
-#define DSC_REG_DEFAULT	(0x00B8)
-
-/*
- * LDI
- */
-#define LDI_DPI0_HRZ_CTRL0	(0x0000)
-#define LDI_DPI0_HRZ_CTRL1	(0x0004)
-#define LDI_DPI0_HRZ_CTRL2	(0x0008)
-#define LDI_VRT_CTRL0	(0x000C)
-#define LDI_VRT_CTRL1	(0x0010)
-#define LDI_VRT_CTRL2	(0x0014)
-#define LDI_PLR_CTRL	(0x0018)
-#define LDI_SH_MASK_INT	(0x001C)
-#define LDI_3D_CTRL	(0x0020)
-#define LDI_CTRL	(0x0024)
-#define LDI_WORK_MODE	(0x0028)
-#define LDI_DE_SPACE_LOW	(0x002C)
-#define LDI_DSI_CMD_MOD_CTRL	(0x0030)
-#define LDI_DSI_TE_CTRL	(0x0034)
-#define LDI_DSI_TE_HS_NUM	(0x0038)
-#define LDI_DSI_TE_HS_WD	(0x003C)
-#define LDI_DSI_TE_VS_WD	(0x0040)
-#define LDI_FRM_MSK	(0x0044)
-#define LDI_FRM_MSK_UP	(0x0048)
-#define LDI_VINACT_MSK_LEN	(0x0050)
-#define LDI_VSTATE	(0x0054)
-#define LDI_DPI0_HSTATE	(0x0058)
-#define LDI_DPI1_HSTATE	(0x005C)
-#define LDI_CMD_EVENT_SEL	(0x0060)
-#define LDI_SRAM_LP_CTRL	(0x0064)
-#define LDI_ITF_RD_SHADOW	(0x006C)
-#define LDI_DPI1_HRZ_CTRL0	(0x00F0)
-#define LDI_DPI1_HRZ_CTRL1	(0x00F4)
-#define LDI_DPI1_HRZ_CTRL2	(0x00F8)
-#define LDI_OVERLAP_SIZE	(0x00FC)
-#define LDI_MEM_CTRL	(0x0100)
-#define LDI_PM_CTRL	(0x0104)
-#define LDI_CLK_SEL	(0x0108)
-#define LDI_CLK_EN	(0x010C)
-#define LDI_IF_BYPASS	(0x0110)
-#define LDI_FRM_VALID_DBG (0x0118)
-/* LDI GLB*/
-#define LDI_PXL0_DIV2_GT_EN (0x0210)
-#define LDI_PXL0_DIV4_GT_EN (0x0214)
-#define LDI_PXL0_GT_EN (0x0218)
-#define LDI_PXL0_DSI_GT_EN (0x021C)
-#define LDI_PXL0_DIVXCFG (0x0220)
-#define LDI_DSI1_CLK_SEL (0x0224)
-#define LDI_VESA_CLK_SEL (0x0228)
-/* DSI1 RST*/
-#define LDI_DSI1_RST_SEL (0x0238)
-/* LDI INTERRUPT*/
-#define LDI_MCU_ITF_INTS (0x0240)
-#define LDI_MCU_ITF_INT_MSK (0x0244)
-#define LDI_CPU_ITF_INTS (0x0248)
-#define LDI_CPU_ITF_INT_MSK (0x024C)
-/* LDI MODULE CLOCK GATING*/
-#define LDI_MODULE_CLK_SEL (0x0258)
-#define LDI_MODULE_CLK_EN (0x025C)
-
-/*
- * MIPI DSI
- */
-#define MIPIDSI_VERSION_OFFSET	(0x0000)
-#define MIPIDSI_PWR_UP_OFFSET	(0x0004)
-#define MIPIDSI_CLKMGR_CFG_OFFSET	(0x0008)
-#define MIPIDSI_DPI_VCID_OFFSET	(0x000c)
-#define MIPIDSI_DPI_COLOR_CODING_OFFSET	(0x0010)
-#define MIPIDSI_DPI_CFG_POL_OFFSET	(0x0014)
-#define MIPIDSI_DPI_LP_CMD_TIM_OFFSET	(0x0018)
-#define MIPIDSI_PCKHDL_CFG_OFFSET	(0x002c)
-#define MIPIDSI_GEN_VCID_OFFSET	(0x0030)
-#define MIPIDSI_MODE_CFG_OFFSET	(0x0034)
-#define MIPIDSI_VID_MODE_CFG_OFFSET	(0x0038)
-#define MIPIDSI_VID_PKT_SIZE_OFFSET	(0x003c)
-#define MIPIDSI_VID_NUM_CHUNKS_OFFSET	(0x0040)
-#define MIPIDSI_VID_NULL_SIZE_OFFSET	(0x0044)
-#define MIPIDSI_VID_HSA_TIME_OFFSET	(0x0048)
-#define MIPIDSI_VID_HBP_TIME_OFFSET	(0x004c)
-#define MIPIDSI_VID_HLINE_TIME_OFFSET	(0x0050)
-#define MIPIDSI_VID_VSA_LINES_OFFSET	(0x0054)
-#define MIPIDSI_VID_VBP_LINES_OFFSET	(0x0058)
-#define MIPIDSI_VID_VFP_LINES_OFFSET	(0x005c)
-#define MIPIDSI_VID_VACTIVE_LINES_OFFSET	(0x0060)
-#define MIPIDSI_EDPI_CMD_SIZE_OFFSET	(0x0064)
-#define MIPIDSI_CMD_MODE_CFG_OFFSET	(0x0068)
-#define MIPIDSI_GEN_HDR_OFFSET	(0x006c)
-#define MIPIDSI_GEN_PLD_DATA_OFFSET	(0x0070)
-#define MIPIDSI_CMD_PKT_STATUS_OFFSET	(0x0074)
-#define MIPIDSI_TO_CNT_CFG_OFFSET	(0x0078)
-#define MIPIDSI_HS_RD_TO_CNT_OFFSET	(0x007C)
-#define MIPIDSI_LP_RD_TO_CNT_OFFSET	(0x0080)
-#define MIPIDSI_HS_WR_TO_CNT_OFFSET	(0x0084)
-#define MIPIDSI_LP_WR_TO_CNT_OFFSET	(0x0088)
-#define MIPIDSI_BTA_TO_CNT_OFFSET	(0x008C)
-#define MIPIDSI_SDF_3D_OFFSET	(0x0090)
-#define MIPIDSI_LPCLK_CTRL_OFFSET	(0x0094)
-#define MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET	(0x0098)
-#define MIPIDSI_PHY_TMR_CFG_OFFSET	(0x009c)
-#define MIPIDSI_PHY_RSTZ_OFFSET	(0x00a0)
-#define MIPIDSI_PHY_IF_CFG_OFFSET	(0x00a4)
-#define MIPIDSI_PHY_ULPS_CTRL_OFFSET	(0x00a8)
-#define MIPIDSI_PHY_TX_TRIGGERS_OFFSET	(0x00ac)
-#define MIPIDSI_PHY_STATUS_OFFSET	(0x00b0)
-#define MIPIDSI_PHY_TST_CTRL0_OFFSET	(0x00b4)
-#define MIPIDSI_PHY_TST_CTRL1_OFFSET	(0x00b8)
-#define MIPIDSI_PHY_TST_CLK_PRE_DELAY (0x00B0)
-#define MIPIDSI_PHY_TST_CLK_POST_DELAY (0x00B1)
-#define MIPIDSI_PHY_TST_CLK_TLPX (0x00B2)
-#define MIPIDSI_PHY_TST_CLK_PREPARE (0x00B3)
-#define MIPIDSI_PHY_TST_CLK_ZERO (0x00B4)
-#define MIPIDSI_PHY_TST_CLK_TRAIL (0x00B5)
-#define MIPIDSI_PHY_TST_DATA_PRE_DELAY (0x0070)
-#define MIPIDSI_PHY_TST_DATA_POST_DELAY (0x0071)
-#define MIPIDSI_PHY_TST_DATA_TLPX (0x0072)
-#define MIPIDSI_PHY_TST_DATA_PREPARE (0x0073)
-#define MIPIDSI_PHY_TST_DATA_ZERO (0x0074)
-#define MIPIDSI_PHY_TST_DATA_TRAIL (0x0075)
-#define MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY (0x0077)
-#define MIPIDSI_INT_ST0_OFFSET	(0x00bc)
-#define MIPIDSI_INT_ST1_OFFSET	(0x00c0)
-#define MIPIDSI_INT_MSK0_OFFSET	(0x00c4)
-#define MIPIDSI_INT_MSK1_OFFSET	(0x00c8)
-#define INT_FORCE0	(0x00D8)
-#define INT_FORCE1	(0x00DC)
-#define MIPIDSI_DSC_PARAMETER_OFFSET	(0x00f0)
-#define MIPIDSI_PHY_TMR_RD_CFG_OFFSET	(0x00f4)
-#define VID_SHADOW_CTRL	(0x0100)
-#define DPI_VCID_ACT	(0x010C)
-#define DPI_COLOR_CODING_ACT	(0x0110)
-#define DPI_LP_CMD_TIM_ACT	(0x0118)
-#define VID_MODE_CFG_ACT	(0x0138)
-#define VID_PKT_SIZE_ACT	(0x013C)
-#define VID_NUM_CHUNKS_ACT	(0x0140)
-#define VID_NULL_SIZE_ACT	(0x0144)
-#define VID_HSA_TIME_ACT	(0x0148)
-#define VID_HBP_TIME_ACT	(0x014C)
-#define VID_HLINE_TIME_ACT	(0x0150)
-#define VID_VSA_LINES_ACT	(0x0154)
-#define VID_VBP_LINES_ACT	(0x0158)
-#define VID_VFP_LINES_ACT	(0x015C)
-#define VID_VACTIVE_LINES_ACT	(0x0160)
-#define SDF_3D_ACT	(0x0190)
-
-/*
- * MMBUF
- */
-#define SMC_LOCK	(0x0000)
-#define SMC_MEM_LP	(0x0004)
-#define SMC_GCLK_CS	(0x000C)
-#define SMC_QOS_BACKDOOR	(0x0010)
-#define SMC_DFX_WCMD_CNT_1ST	(0x0014)
-#define SMC_DFX_WCMD_CNT_2ND	(0x0018)
-#define SMC_DFX_WCMD_CNT_3RD	(0x001C)
-#define SMC_DFX_WCMD_CNT_4TH	(0x0020)
-#define SMC_DFX_RCMD_CNT_1ST	(0x0024)
-#define SMC_DFX_RCMD_CNT_2ND	(0x0028)
-#define SMC_DFX_RCMD_CNT_3RD	(0x002C)
-#define SMC_DFX_RCMD_CNT_4TH	(0x0030)
-#define SMC_CS_IDLE	(0x0034)
-#define SMC_DFX_BFIFO_CNT0	(0x0038)
-#define SMC_DFX_RDFIFO_CNT1	(0x003C)
-#define SMC_SP_SRAM_STATE0	(0x0040)
-#define SMC_SP_SRAM_STATE1	(0x0044)
-
-enum hisi_fb_pixel_format {
-	HISI_FB_PIXEL_FORMAT_RGB_565 = 0,
-	HISI_FB_PIXEL_FORMAT_RGBX_4444,
-	HISI_FB_PIXEL_FORMAT_RGBA_4444,
-	HISI_FB_PIXEL_FORMAT_RGBX_5551,
-	HISI_FB_PIXEL_FORMAT_RGBA_5551,
-	HISI_FB_PIXEL_FORMAT_RGBX_8888,
-	HISI_FB_PIXEL_FORMAT_RGBA_8888,
-
-	HISI_FB_PIXEL_FORMAT_BGR_565,
-	HISI_FB_PIXEL_FORMAT_BGRX_4444,
-	HISI_FB_PIXEL_FORMAT_BGRA_4444,
-	HISI_FB_PIXEL_FORMAT_BGRX_5551,
-	HISI_FB_PIXEL_FORMAT_BGRA_5551,
-	HISI_FB_PIXEL_FORMAT_BGRX_8888,
-	HISI_FB_PIXEL_FORMAT_BGRA_8888,
-
-	HISI_FB_PIXEL_FORMAT_YUV_422_I,
-
-	/* YUV Semi-planar */
-	HISI_FB_PIXEL_FORMAT_YCbCr_422_SP,	/* NV16 */
-	HISI_FB_PIXEL_FORMAT_YCrCb_422_SP,
-	HISI_FB_PIXEL_FORMAT_YCbCr_420_SP,
-	HISI_FB_PIXEL_FORMAT_YCrCb_420_SP,	/* NV21 */
-
-	/* YUV Planar */
-	HISI_FB_PIXEL_FORMAT_YCbCr_422_P,
-	HISI_FB_PIXEL_FORMAT_YCrCb_422_P,
-	HISI_FB_PIXEL_FORMAT_YCbCr_420_P,
-	HISI_FB_PIXEL_FORMAT_YCrCb_420_P,	/* HISI_FB_PIXEL_FORMAT_YV12 */
-
-	/* YUV Package */
-	HISI_FB_PIXEL_FORMAT_YUYV_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_UYVY_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_YVYU_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_VYUY_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_MAX,
-
-	HISI_FB_PIXEL_FORMAT_UNSUPPORT = 800
-};
-
-struct dss_hw_ctx {
-	void __iomem *base;
-	struct regmap *noc_regmap;
-	struct reset_control *reset;
-	u32 g_dss_version_tag;
-
-	void __iomem *noc_dss_base;
-	void __iomem *peri_crg_base;
-	void __iomem *pmc_base;
-	void __iomem *sctrl_base;
-	void __iomem *media_crg_base;
-	void __iomem *pctrl_base;
-	void __iomem *mmbuf_crg_base;
-	void __iomem *pmctrl_base;
-
-	struct clk *dss_axi_clk;
-	struct clk *dss_pclk_dss_clk;
-	struct clk *dss_pri_clk;
-	struct clk *dss_pxl0_clk;
-	struct clk *dss_pxl1_clk;
-	struct clk *dss_mmbuf_clk;
-	struct clk *dss_pclk_mmbuf_clk;
-
-	struct dss_clk_rate *dss_clk;
-
-	struct regulator *dpe_regulator;
-	struct regulator *mmbuf_regulator;
-	struct regulator *mediacrg_regulator;
-
-	bool power_on;
-	int irq;
-
-	wait_queue_head_t vactive0_end_wq;
-	u32 vactive0_end_flag;
-	ktime_t vsync_timestamp;
-	ktime_t vsync_timestamp_prev;
-
-	struct iommu_domain *mmu_domain;
-	char __iomem *screen_base;
-	unsigned long smem_start;
-	unsigned long screen_size;
-};
-
-struct dss_clk_rate {
-	u64 dss_pri_clk_rate;
-	u64 dss_pclk_dss_rate;
-	u64 dss_pclk_pctrl_rate;
-	u64 dss_mmbuf_rate;
-	u32 dss_voltage_value; //0:0.7v, 2:0.8v
-	u32 reserved;
-};
-
-struct dss_crtc {
-	struct drm_crtc base;
-	struct dss_hw_ctx *ctx;
-	bool enable;
-	u32 out_format;
-	u32 bgr_fmt;
-};
-
-struct dss_plane {
-	struct drm_plane base;
-	/*void *ctx;*/
-	void *acrtc;
-	u8 ch; /* channel */
-};
-
-struct dss_data {
-	struct dss_crtc acrtc;
-	struct dss_plane aplane[DSS_CH_NUM];
-	struct dss_hw_ctx ctx;
-};
-
-/* ade-format info: */
-struct dss_format {
-	u32 pixel_format;
-	enum hisi_fb_pixel_format dss_format;
-};
-
-#define MIPI_DPHY_NUM	(2)
-
-/* IFBC compress mode */
-enum IFBC_TYPE {
-	IFBC_TYPE_NONE = 0,
-	IFBC_TYPE_ORISE2X,
-	IFBC_TYPE_ORISE3X,
-	IFBC_TYPE_HIMAX2X,
-	IFBC_TYPE_RSP2X,
-	IFBC_TYPE_RSP3X,
-	IFBC_TYPE_VESA2X_SINGLE,
-	IFBC_TYPE_VESA3X_SINGLE,
-	IFBC_TYPE_VESA2X_DUAL,
-	IFBC_TYPE_VESA3X_DUAL,
-	IFBC_TYPE_VESA3_75X_DUAL,
-
-	IFBC_TYPE_MAX
-};
-
-/* IFBC compress mode */
-enum IFBC_COMP_MODE {
-	IFBC_COMP_MODE_0 = 0,
-	IFBC_COMP_MODE_1,
-	IFBC_COMP_MODE_2,
-	IFBC_COMP_MODE_3,
-	IFBC_COMP_MODE_4,
-	IFBC_COMP_MODE_5,
-	IFBC_COMP_MODE_6,
-};
-
-/* xres_div */
-enum XRES_DIV {
-	XRES_DIV_1 = 1,
-	XRES_DIV_2,
-	XRES_DIV_3,
-	XRES_DIV_4,
-	XRES_DIV_5,
-	XRES_DIV_6,
-};
-
-/* yres_div */
-enum YRES_DIV {
-	YRES_DIV_1 = 1,
-	YRES_DIV_2,
-	YRES_DIV_3,
-	YRES_DIV_4,
-	YRES_DIV_5,
-	YRES_DIV_6,
-};
-
-/* pxl0_divxcfg */
-enum PXL0_DIVCFG {
-	PXL0_DIVCFG_0 = 0,
-	PXL0_DIVCFG_1,
-	PXL0_DIVCFG_2,
-	PXL0_DIVCFG_3,
-	PXL0_DIVCFG_4,
-	PXL0_DIVCFG_5,
-	PXL0_DIVCFG_6,
-	PXL0_DIVCFG_7,
-};
-
-/* pxl0_div2_gt_en */
-enum PXL0_DIV2_GT_EN {
-	PXL0_DIV2_GT_EN_CLOSE = 0,
-	PXL0_DIV2_GT_EN_OPEN,
-};
-
-/* pxl0_div4_gt_en */
-enum PXL0_DIV4_GT_EN {
-	PXL0_DIV4_GT_EN_CLOSE = 0,
-	PXL0_DIV4_GT_EN_OPEN,
-};
-
-/* pxl0_dsi_gt_en */
-enum PXL0_DSI_GT_EN {
-	PXL0_DSI_GT_EN_0 = 0,
-	PXL0_DSI_GT_EN_1,
-	PXL0_DSI_GT_EN_2,
-	PXL0_DSI_GT_EN_3,
-};
-
-struct mipi_ifbc_division {
-	u32 xres_div;
-	u32 yres_div;
-	u32 comp_mode;
-	u32 pxl0_div2_gt_en;
-	u32 pxl0_div4_gt_en;
-	u32 pxl0_divxcfg;
-	u32 pxl0_dsi_gt_en;
-};
-
-/*****************************************************************************/
-
-#ifndef ALIGN_DOWN
-#define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
-#endif
-#ifndef ALIGN_UP
-#define ALIGN_UP(val, al)    (((val) + ((al) - 1)) & ~((al) - 1))
-#endif
-
-#define to_dss_crtc(crtc) \
-	container_of(crtc, struct dss_crtc, base)
-
-#define to_dss_plane(plane) \
-	container_of(plane, struct dss_plane, base)
-
 #endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 4751b8b6423c..033975b7edef 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -12,174 +12,7 @@
 #ifndef __KIRIN970_DPE_REG_H__
 #define __KIRIN970_DPE_REG_H__
 
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/string.h>
-#include <linux/platform_device.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/wait.h>
-#include <linux/bug.h>
-#include <linux/iommu.h>
-#include <linux/regulator/consumer.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/machine.h>
-
-#include <drm/drm_plane.h>
-#include <drm/drm_crtc.h>
-
-#define FB_ACCEL_HI62xx	0x1
-#define FB_ACCEL_HI363x	0x2
-#define FB_ACCEL_HI365x	0x4
-#define FB_ACCEL_HI625x	0x8
-#define FB_ACCEL_HI366x	0x10
-#define FB_ACCEL_KIRIN970_ES  0x20
-#define FB_ACCEL_KIRIN970  0x40
-#define FB_ACCEL_KIRIN660  0x80
-#define FB_ACCEL_KIRIN980_ES  0x100
-#define FB_ACCEL_KIRIN980  0x200
-#define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
-#define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
-
-/* vcc name */
-#define REGULATOR_PDP_NAME	"ldo3"
-
-/*****************************************************************************/
-
-enum dss_chn_idx {
-	DSS_RCHN_NONE = -1,
-	DSS_RCHN_D2 = 0,
-	DSS_RCHN_D3,
-	DSS_RCHN_V0,
-	DSS_RCHN_G0,
-	DSS_RCHN_V1,
-	DSS_RCHN_G1,
-	DSS_RCHN_D0,
-	DSS_RCHN_D1,
-
-	DSS_WCHN_W0,
-	DSS_WCHN_W1,
-
-	DSS_CHN_MAX,
-
-	DSS_RCHN_V2 = DSS_CHN_MAX,  /*for copybit, only supported in chicago*/
-	DSS_WCHN_W2,
-
-	DSS_COPYBIT_MAX,
-};
-
-enum dss_channel {
-	DSS_CH1 = 0,	/* channel 1 for primary plane */
-	DSS_CH_NUM
-};
-
-#define PRIMARY_CH	DSS_CH1 /* primary plane */
-
-struct dss_rect {
-	s32 x;
-	s32 y;
-	s32 w;
-	s32 h;
-};
-
-struct dss_rect_ltrb {
-	s32 left;
-	s32 top;
-	s32 right;
-	s32 bottom;
-};
-
-enum {
-	DSI_1_LANES = 0,
-	DSI_2_LANES,
-	DSI_3_LANES,
-	DSI_4_LANES,
-};
-
-enum dss_ovl_idx {
-	DSS_OVL0 = 0,
-	DSS_OVL1,
-	DSS_OVL2,
-	DSS_OVL3,
-	DSS_OVL_IDX_MAX,
-};
-
-#define DSS_WCH_MAX  (2)
-
-struct dss_img {
-	u32 format;
-	u32 width;
-	u32 height;
-	u32 bpp;		/* bytes per pixel */
-	u32 buf_size;
-	u32 stride;
-	u32 stride_plane1;
-	u32 stride_plane2;
-	u64 phy_addr;
-	u64 vir_addr;
-	u32 offset_plane1;
-	u32 offset_plane2;
-
-	u64 afbc_header_addr;
-	u64 afbc_payload_addr;
-	u32 afbc_header_stride;
-	u32 afbc_payload_stride;
-	u32 afbc_scramble_mode;
-	u32 mmbuf_base;
-	u32 mmbuf_size;
-
-	u32 mmu_enable;
-	u32 csc_mode;
-	u32 secure_mode;
-	s32 shared_fd;
-	u32 reserved0;
-};
-
-struct drm_dss_layer {
-	struct dss_img img;
-	struct dss_rect src_rect;
-	struct dss_rect src_rect_mask;
-	struct dss_rect dst_rect;
-	u32 transform;
-	s32 blending;
-	u32 glb_alpha;
-	u32 color;		/* background color or dim color */
-	s32 layer_idx;
-	s32 chn_idx;
-	u32 need_cap;
-	s32 acquire_fence;
-};
-
-/*****************************************************************************/
-
-#define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
-#define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
-
-#define DSS_MAX_PXL0_CLK_144M (144000000UL)
-
-#define DSS_ADDR  0xE8600000
-#define DSS_DSI_ADDR	(DSS_ADDR + 0x01000)
-#define DSS_LDI_ADDR	(DSS_ADDR + 0x7d000)
-#define PMC_BASE	(0xFFF31000)
-#define PERI_CRG_BASE	(0xFFF35000)
-#define SCTRL_BASE	(0xFFF0A000)
-#define PCTRL_BASE		(0xE8A09000)
-
-#define GPIO_LCD_POWER_1V2  (54)
-#define GPIO_LCD_STANDBY    (67)
-#define GPIO_LCD_RESETN     (65)
-#define GPIO_LCD_GATING     (60)
-#define GPIO_LCD_PCLK_GATING (58)
-#define GPIO_LCD_REFCLK_GATING (59)
-#define GPIO_LCD_SPICS         (168)
-#define GPIO_LCD_DRV_EN        (73)
-
-#define GPIO_PG_SEL_A (72)
-#define GPIO_TX_RX_A (74)
-#define GPIO_PG_SEL_B (76)
-#define GPIO_TX_RX_B (78)
-
-/*****************************************************************************/
+#include "kirin9xx_dpe.h"
 
 #define CRGPERI_PLL0_CLK_RATE	(1660000000UL)
 #define CRGPERI_PLL2_CLK_RATE	(1920000000UL)
@@ -189,7 +22,6 @@ struct drm_dss_layer {
 /*core_clk: 0.65v-300M, 0.75-415M, 0.8-553.33M*/
 #define DEFAULT_DSS_CORE_CLK_RATE_L3	(554000000UL)
 #define DEFAULT_DSS_CORE_CLK_RATE_L2	(415000000UL)
-#define DEFAULT_DSS_CORE_CLK_RATE_L1	(300000000UL)
 
 #define DEFAULT_DSS_CORE_CLK_RATE_ES	(400000000UL)
 
@@ -201,7 +33,6 @@ struct drm_dss_layer {
 /*mmbuf_clk: 0.65v-237.14M, 0.75-332M, 0.8-480M*/
 #define DEFAULT_DSS_MMBUF_CLK_RATE_L3	(480000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_L2	(332000000UL)
-#define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
 
 /*pix1_clk: 0.65v-254.57M, 0.75-415M, 0.8-594M*/
 #define DEFAULT_DSS_PXL1_CLK_RATE_L3	(594000000UL)
@@ -214,221 +45,8 @@ struct drm_dss_layer {
 #define DEFAULT_MDC_CORE_CLK_RATE_L1	(240000000UL)
 
 /*dss clk power off */
-#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF	(277000000UL)
 #define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF	(238000000UL)
 #define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF	(208000000UL)
-#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF	(238000000UL)
-
-#define DEFAULT_PCLK_DSS_RATE	(114000000UL)
-#define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
-#define DSS_MAX_PXL0_CLK_288M (288000000UL)
-
-#define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
-#define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
-
-#define MMBUF_SIZE_MAX	(288 * 1024)
-#define HISI_DSS_CMDLIST_MAX	(16)
-#define HISI_DSS_CMDLIST_IDXS_MAX (0xFFFF)
-#define HISI_DSS_COPYBIT_CMDLIST_IDXS	 (0xC000)
-#define HISI_DSS_DPP_MAX_SUPPORT_BIT (0x7ff)
-#define HISIFB_DSS_PLATFORM_TYPE  (FB_ACCEL_HI366x | FB_ACCEL_PLATFORM_TYPE_ASIC)
-
-#define DSS_MIF_SMMU_SMRX_IDX_STEP (16)
-#define CRG_PERI_DIS3_DEFAULT_VAL     (0x0002F000)
-#define SCF_LINE_BUF	(2560)
-#define DSS_GLB_MODULE_CLK_SEL_DEFAULT_VAL  (0xF0000008)
-#define DSS_LDI_CLK_SEL_DEFAULT_VAL    (0x00000004)
-#define DSS_DBUF_MEM_CTRL_DEFAULT_VAL  (0x00000008)
-#define DSS_SMMU_RLD_EN0_DEFAULT_VAL    (0xffffffff)
-#define DSS_SMMU_RLD_EN1_DEFAULT_VAL    (0xffffff8f)
-#define DSS_SMMU_OUTSTANDING_VAL		(0xf)
-#define DSS_MIF_CTRL2_INVAL_SEL3_STRIDE_MASK		(0xc)
-#define DSS_AFBCE_ENC_OS_CFG_DEFAULT_VAL			(0x7)
-#define TUI_SEC_RCH			(DSS_RCHN_V0)
-#define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
-
-/* perf stat */
-#define DSS_DEVMEM_PERF_BASE (0xFDF10000)
-#define CRG_PERIPH_APB_PERRSTSTAT0_REG (0x68)
-#define CRG_PERIPH_APB_IP_RST_PERF_STAT_BIT (18)
-#define PERF_SAMPSTOP_REG (0x10)
-#define DEVMEM_PERF_SIZE (0x100)
-
-/* dp clock used for hdmi */
-#define DEFAULT_AUXCLK_DPCTRL_RATE	16000000UL
-#define DEFAULT_ACLK_DPCTRL_RATE_ES	288000000UL
-#define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
-#define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
-
-#define KIRIN970_VCO_MIN_FREQ_OUTPUT         1000000 /*Boston: 1000 * 1000*/
-#define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
-
-#define MIDIA_PPLL7_CTRL0	0x50c
-#define MIDIA_PPLL7_CTRL1	0x510
-
-#define MIDIA_PPLL7_FREQ_DEVIDER_MASK	GENMASK(25, 2)
-#define MIDIA_PPLL7_FRAC_MODE_MASK	GENMASK(25, 0)
-
-#define ACCESS_REGISTER_FN_MAIN_ID_HDCP           0xc500aa01
-#define ACCESS_REGISTER_FN_SUB_ID_HDCP_CTRL   (0x55bbccf1)
-#define ACCESS_REGISTER_FN_SUB_ID_HDCP_INT   (0x55bbccf2)
-
-/*
- * DSS Registers
- */
-
-/* MACROS */
-#define DSS_WIDTH(width)	((width) - 1)
-#define DSS_HEIGHT(height)	((height) - 1)
-
-#define RES_540P	(960 * 540)
-#define RES_720P	(1280 * 720)
-#define RES_1080P	(1920 * 1080)
-#define RES_1200P	(1920 * 1200)
-#define RES_1440P	(2560 * 1440)
-#define RES_1600P	(2560 * 1600)
-#define RES_4K_PHONE	(3840 * 2160)
-#define RES_4K_PAD	(3840 * 2400)
-
-#define DFC_MAX_CLIP_NUM	(31)
-
-/* for DFS */
-
-/* 1480 * 144bits */
-#define DFS_TIME	(80)
-#define DFS_TIME_MIN	(50)
-#define DFS_TIME_MIN_4K	(10)
-#define DBUF0_DEPTH	(1408)
-#define DBUF1_DEPTH	(512)
-#define DBUF_WIDTH_BIT	(144)
-
-#define GET_THD_RQOS_IN(max_depth)	((max_depth) * 10 / 100)
-#define GET_THD_RQOS_OUT(max_depth)	((max_depth) * 30 / 100)
-#define GET_THD_WQOS_IN(max_depth)	((max_depth) * 95 / 100)
-#define GET_THD_WQOS_OUT(max_depth)	((max_depth) * 70 / 100)
-#define GET_THD_CG_IN(max_depth)	((max_depth) - 1)
-#define GET_THD_CG_OUT(max_depth)	((max_depth) * 70 / 100)
-#define GET_FLUX_REQ_IN(max_depth)	((max_depth) * 50 / 100)
-#define GET_FLUX_REQ_OUT(max_depth)	((max_depth) * 90 / 100)
-#define GET_THD_OTHER_DFS_CG_HOLD(max_depth)	(0x20)
-#define GET_THD_OTHER_WR_WAIT(max_depth)	((max_depth) * 90 / 100)
-
-#define GET_RDMA_ROT_HQOS_ASSERT_LEV(max_depth)	((max_depth) * 30 / 100)
-#define GET_RDMA_ROT_HQOS_REMOVE_LEV(max_depth)	((max_depth) * 60 / 100)
-
-enum lcd_orientation {
-	LCD_LANDSCAPE = 0,
-	LCD_PORTRAIT,
-};
-
-enum lcd_format {
-	LCD_RGB888 = 0,
-	LCD_RGB101010,
-	LCD_RGB565,
-};
-
-enum lcd_rgb_order {
-	LCD_RGB = 0,
-	LCD_BGR,
-};
-
-enum dss_addr {
-	DSS_ADDR_PLANE0 = 0,
-	DSS_ADDR_PLANE1,
-	DSS_ADDR_PLANE2,
-};
-
-enum dss_transform {
-	DSS_TRANSFORM_NOP = 0x0,
-	DSS_TRANSFORM_FLIP_H = 0x01,
-	DSS_TRANSFORM_FLIP_V = 0x02,
-	DSS_TRANSFORM_ROT = 0x04,
-};
-
-enum dss_dfc_format {
-	DFC_PIXEL_FORMAT_RGB_565 = 0,
-	DFC_PIXEL_FORMAT_XRGB_4444,
-	DFC_PIXEL_FORMAT_ARGB_4444,
-	DFC_PIXEL_FORMAT_XRGB_5551,
-	DFC_PIXEL_FORMAT_ARGB_5551,
-	DFC_PIXEL_FORMAT_XRGB_8888,
-	DFC_PIXEL_FORMAT_ARGB_8888,
-	DFC_PIXEL_FORMAT_BGR_565,
-	DFC_PIXEL_FORMAT_XBGR_4444,
-	DFC_PIXEL_FORMAT_ABGR_4444,
-	DFC_PIXEL_FORMAT_XBGR_5551,
-	DFC_PIXEL_FORMAT_ABGR_5551,
-	DFC_PIXEL_FORMAT_XBGR_8888,
-	DFC_PIXEL_FORMAT_ABGR_8888,
-
-	DFC_PIXEL_FORMAT_YUV444,
-	DFC_PIXEL_FORMAT_YVU444,
-	DFC_PIXEL_FORMAT_YUYV422,
-	DFC_PIXEL_FORMAT_YVYU422,
-	DFC_PIXEL_FORMAT_VYUY422,
-	DFC_PIXEL_FORMAT_UYVY422,
-};
-
-enum dss_dma_format {
-	DMA_PIXEL_FORMAT_RGB_565 = 0,
-	DMA_PIXEL_FORMAT_ARGB_4444,
-	DMA_PIXEL_FORMAT_XRGB_4444,
-	DMA_PIXEL_FORMAT_ARGB_5551,
-	DMA_PIXEL_FORMAT_XRGB_5551,
-	DMA_PIXEL_FORMAT_ARGB_8888,
-	DMA_PIXEL_FORMAT_XRGB_8888,
-
-	DMA_PIXEL_FORMAT_RESERVED0,
-
-	DMA_PIXEL_FORMAT_YUYV_422_Pkg,
-	DMA_PIXEL_FORMAT_YUV_420_SP_HP,
-	DMA_PIXEL_FORMAT_YUV_420_P_HP,
-	DMA_PIXEL_FORMAT_YUV_422_SP_HP,
-	DMA_PIXEL_FORMAT_YUV_422_P_HP,
-	DMA_PIXEL_FORMAT_AYUV_4444,
-};
-
-enum dss_buf_format {
-	DSS_BUF_LINEAR = 0,
-	DSS_BUF_TILE,
-};
-
-enum dss_blend_mode {
-	DSS_BLEND_CLEAR = 0,
-	DSS_BLEND_SRC,
-	DSS_BLEND_DST,
-	DSS_BLEND_SRC_OVER_DST,
-	DSS_BLEND_DST_OVER_SRC,
-	DSS_BLEND_SRC_IN_DST,
-	DSS_BLEND_DST_IN_SRC,
-	DSS_BLEND_SRC_OUT_DST,
-	DSS_BLEND_DST_OUT_SRC,
-	DSS_BLEND_SRC_ATOP_DST,
-	DSS_BLEND_DST_ATOP_SRC,
-	DSS_BLEND_SRC_XOR_DST,
-	DSS_BLEND_SRC_ADD_DST,
-	DSS_BLEND_FIX_OVER,
-	DSS_BLEND_FIX_PER0,
-	DSS_BLEND_FIX_PER1,
-	DSS_BLEND_FIX_PER2,
-	DSS_BLEND_FIX_PER3,
-	DSS_BLEND_FIX_PER4,
-	DSS_BLEND_FIX_PER5,
-	DSS_BLEND_FIX_PER6,
-	DSS_BLEND_FIX_PER7,
-	DSS_BLEND_FIX_PER8,
-	DSS_BLEND_FIX_PER9,
-	DSS_BLEND_FIX_PER10,
-	DSS_BLEND_FIX_PER11,
-	DSS_BLEND_FIX_PER12,
-	DSS_BLEND_FIX_PER13,
-	DSS_BLEND_FIX_PER14,
-	DSS_BLEND_FIX_PER15,
-	DSS_BLEND_FIX_PER16,
-	DSS_BLEND_FIX_PER17,
-
-	DSS_BLEND_MAX,
-};
 
 enum dss_chn_module {
 	MODULE_MIF_CHN,
@@ -452,503 +70,79 @@ enum dss_chn_module {
 	MODULE_CHN_MAX,
 };
 
-enum dss_chn_cap {
-	MODULE_CAP_ROT,
-	MODULE_CAP_SCL,
-	MODULE_CAP_CSC,
-	MODULE_CAP_SHARPNESS_1D,
-	MODULE_CAP_SHARPNESS_2D,
-	MODULE_CAP_CE,
-	MODULE_CAP_AFBCD,
-	MODULE_CAP_AFBCE,
-	MODULE_CAP_YUV_PLANAR,
-	MODULE_CAP_YUV_SEMI_PLANAR,
-	MODULE_CAP_YUV_PACKAGE,
-	MODULE_CAP_MAX,
-};
-
-enum dss_ovl_module {
-	MODULE_OVL_BASE,
-	MODULE_MCTL_BASE,
-	MODULE_OVL_MAX,
-};
-
-enum dss_axi_idx {
-	AXI_CHN0 = 0,
-	AXI_CHN1,
-	AXI_CHN_MAX,
-};
-
-#define AXI0_MAX_DSS_CHN_THRESHOLD	(3)
-#define AXI1_MAX_DSS_CHN_THRESHOLD	(3)
-
-#define DEFAULT_AXI_CLK_RATE0	(120 * 1000000)
-#define DEFAULT_AXI_CLK_RATE1	(240 * 1000000)
-#define DEFAULT_AXI_CLK_RATE2	(360 * 1000000)
-#define DEFAULT_AXI_CLK_RATE3	(480 * 1000000)
-#define DEFAULT_AXI_CLK_RATE4	(667 * 1000000)
-#define DEFAULT_AXI_CLK_RATE5	(800 * 1000000)
-
-enum dss_rdma_idx {
-	DSS_RDMA0 = 0,
-	DSS_RDMA1,
-	DSS_RDMA2,
-	DSS_RDMA3,
-	DSS_RDMA4,
-	DSS_RDMA_MAX,
-};
-
 /*****************************************************************************/
 
-#define PEREN0	(0x000)
-#define PERDIS0	(0x004)
-#define PEREN2	(0x020)
-#define PERDIS2	(0x024)
-#define PERCLKEN2	(0x028)
-#define PERSTAT2	(0x02C)
-#define PEREN3	(0x030)
-#define PERDIS3	(0x034)
-#define PERCLKEN3	(0x038)
-#define PERSTAT3	(0x03C)
 #define PEREN4	(0x040)
 #define PERDIS4	(0x044)
-#define PEREN5	(0x050)
-#define PERDIS5	(0x054)
-#define PERCLKEN5	(0x058)
-#define PERSTAT5	(0x05C)
 #define PERRSTEN0	(0x060)
-#define PERRSTDIS0	(0x064)
-#define PERRSTEN2	(0x078)
-#define PERRSTDIS2	(0x07C)
-#define PERRSTEN3	(0x084)
-#define PERRSTDIS3	(0x088)
-#define PERRSTSTAT3 (0x08c)
-#define PERRSTEN4	(0x090)
-#define PERRSTDIS4	(0x094)
-#define PERRSTSTAT4 (0x098)
 #define PERRSTDIS5	(0x0A0)
-#define CLKDIV3	(0x0B4)
-#define CLKDIV5	(0x0BC)
-#define CLKDIV10	(0x0D0)
-#define CLKDIV18	(0x0F0)
-#define CLKDIV20	(0x0F8)
-#define ISOEN	(0x144)
-#define ISODIS	(0x148)
-#define ISOSTAT	(0x14c)
-#define PERPWREN	(0x150)
-#define PERPWRDIS	(0x154)
-#define PERPWRSTAT (0x158)
-#define PERI_AUTODIV8	(0x380)
-#define PERI_AUTODIV9	(0x384)
-#define PERI_AUTODIV10	(0x388)
 #define PEREN6	(0x410)
 #define PERDIS6	(0x414)
 
-// PMC
-#define NOC_POWER_IDLEREQ	(0x380)
-#define NOC_POWER_IDLEACK	(0x384)
-#define NOC_POWER_IDLE	(0x388)
-
 //SYSCTRL
 #define SCISODIS	(0x044)
-#define SCPERCLKEN1 (0x048)
 #define SCPWREN	(0x060)
 #define SCPEREN1	(0x170)
 #define SCPERDIS1	(0x174)
 #define SCPEREN4	(0x1B0)
 #define SCPERDIS4	(0x1B4)
 #define SCPERRSTDIS1	(0x210)
-#define SCCLKDIV2	(0x258)
-#define SCCLKDIV4	(0x260)
 
 //PCTRL
-#define PERI_CTRL23	(0x060)
-#define PERI_CTRL29	(0x078)
-#define PERI_CTRL30	(0x07C)
-#define PERI_CTRL32	(0x084)
 #define PERI_CTRL33	(0x088)
-#define PERI_STAT0	(0x094)
-#define PERI_STAT1	(0x098)
-#define PERI_STAT16	(0x0D4)
-
-#define PCTRL_DPHYTX_ULPSEXIT1	BIT(4)
-#define PCTRL_DPHYTX_ULPSEXIT0	BIT(3)
-
-#define PCTRL_DPHYTX_CTRL1	BIT(1)
-#define PCTRL_DPHYTX_CTRL0	BIT(0)
 
 /*****************************************************************************/
 
-#define BIT_DSS_GLB_INTS	BIT(30)
-#define BIT_MMU_IRPT_S	BIT(29)
-#define BIT_MMU_IRPT_NS	BIT(28)
-#define BIT_DBG_MCTL_INTS	BIT(27)
-#define BIT_DBG_WCH1_INTS	BIT(26)
-#define BIT_DBG_WCH0_INTS	BIT(25)
-#define BIT_DBG_RCH7_INTS	BIT(24)
-#define BIT_DBG_RCH6_INTS	BIT(23)
-#define BIT_DBG_RCH5_INTS	BIT(22)
-#define BIT_DBG_RCH4_INTS	BIT(21)
-#define BIT_DBG_RCH3_INTS	BIT(20)
-#define BIT_DBG_RCH2_INTS	BIT(19)
-#define BIT_DBG_RCH1_INTS	BIT(18)
-#define BIT_DBG_RCH0_INTS	BIT(17)
-#define BIT_ITF0_INTS	BIT(16)
-#define BIT_DPP_INTS	BIT(15)
-#define BIT_CMDLIST13	BIT(14)
-#define BIT_CMDLIST12	BIT(13)
-#define BIT_CMDLIST11	BIT(12)
-#define BIT_CMDLIST10	BIT(11)
-#define BIT_CMDLIST9	BIT(10)
-#define BIT_CMDLIST8	BIT(9)
-#define BIT_CMDLIST7	BIT(8)
-#define BIT_CMDLIST6	BIT(7)
-#define BIT_CMDLIST5	BIT(6)
-#define BIT_CMDLIST4	BIT(5)
-#define BIT_CMDLIST3	BIT(4)
-#define BIT_CMDLIST2	BIT(3)
-#define BIT_CMDLIST1	BIT(2)
-#define BIT_CMDLIST0	BIT(1)
 
-// CPU_SDP_INTS		0x22C
-// CPU_SDP_INT_MSK	0x230
-#define BIT_SDP_DSS_GLB_INTS	BIT(29)
-#define BIT_SDP_MMU_IRPT_S	BIT(28)
-#define BIT_SDP_MMU_IRPT_NS	BIT(27)
-#define BIT_SDP_DBG_MCTL_INTS	BIT(26)
-#define BIT_SDP_DBG_WCH1_INTS	BIT(25)
-#define BIT_SDP_DBG_WCH0_INTS	BIT(24)
-#define BIT_SDP_DBG_RCH7_INTS	BIT(23)
-#define BIT_SDP_DBG_RCH6_INTS	BIT(22)
-#define BIT_SDP_DBG_RCH5_INTS	BIT(21)
-#define BIT_SDP_DBG_RCH4_INTS	BIT(20)
-#define BIT_SDP_DBG_RCH3_INTS	BIT(19)
-#define BIT_SDP_DBG_RCH2_INTS	BIT(18)
-#define BIT_SDP_DBG_RCH1_INTS	BIT(17)
-#define BIT_SDP_DBG_RCH0_INTS	BIT(16)
-#define BIT_SDP_ITF1_INTS	BIT(15)
-#define BIT_SDP_CMDLIST13	BIT(14)
-#define BIT_SDP_CMDLIST12	BIT(13)
-#define BIT_SDP_CMDLIST11	BIT(12)
-#define BIT_SDP_CMDLIST10	BIT(11)
-#define BIT_SDP_CMDLIST9	BIT(10)
-#define BIT_SDP_CMDLIST8	BIT(9)
-#define BIT_SDP_CMDLIST7	BIT(8)
-#define BIT_SDP_CMDLIST6	BIT(7)
-#define BIT_SDP_CMDLIST5	BIT(6)
-#define BIT_SDP_CMDLIST4	BIT(5)
-#define BIT_SDP_CMDLIST3	BIT(4)
-#define BIT_SDP_SDP_CMDLIST2	BIT(3)
-#define BIT_SDP_CMDLIST1	BIT(2)
-#define BIT_SDP_CMDLIST0	BIT(1)
-#define BIT_SDP_RCH_CE_INTS	BIT(0)
-
-// CPU_OFF_INTS	0x234
-// CPU_OFF_INT_MASK	0x238
-#define BIT_OFF_DSS_GLB_INTS	BIT(31)
-#define BIT_OFF_MMU_IRPT_S	BIT(30)
-#define BIT_OFF_MMU_IRPT_NS	BIT(29)
-#define BIT_OFF_DBG_MCTL_INTS	BIT(28)
-#define BIT_OFF_DBG_WCH1_INTS	BIT(27)
-#define BIT_OFF_DBG_WCH0_INTS	BIT(26)
-#define BIT_OFF_DBG_RCH7_INTS	BIT(25)
-#define BIT_OFF_DBG_RCH6_INTS	BIT(24)
-#define BIT_OFF_DBG_RCH5_INTS	BIT(23)
-#define BIT_OFF_DBG_RCH4_INTS	BIT(22)
-#define BIT_OFF_DBG_RCH3_INTS	BIT(21)
-#define BIT_OFF_DBG_RCH2_INTS	BIT(20)
-#define BIT_OFF_DBG_RCH1_INTS	BIT(19)
-#define BIT_OFF_DBG_RCH0_INTS	BIT(18)
-#define BIT_OFF_WCH1_INTS	BIT(17)
-#define BIT_OFF_WCH0_INTS	BIT(16)
-#define BIT_OFF_WCH0_WCH1_FRM_END_INT	BIT(15)
-#define BIT_OFF_CMDLIST13	BIT(14)
-#define BIT_OFF_CMDLIST12	BIT(13)
-#define BIT_OFF_CMDLIST11	BIT(12)
-#define BIT_OFF_CMDLIST10	BIT(11)
-#define BIT_OFF_CMDLIST9	BIT(10)
-#define BIT_OFF_CMDLIST8	BIT(9)
-#define BIT_OFF_CMDLIST7	BIT(8)
-#define BIT_OFF_CMDLIST6	BIT(7)
-#define BIT_OFF_CMDLIST5	BIT(6)
-#define BIT_OFF_CMDLIST4	BIT(5)
-#define BIT_OFF_CMDLIST3	BIT(4)
-#define BIT_OFF_CMDLIST2	BIT(3)
-#define BIT_OFF_CMDLIST1	BIT(2)
-#define BIT_OFF_CMDLIST0	BIT(1)
-#define BIT_OFF_RCH_CE_INTS	BIT(0)
-
-#define BIT_OFF_CAM_DBG_WCH2_INTS	BIT(4)
-#define BIT_OFF_CAM_DBG_RCH8_INTS	BIT(3)
-#define BIT_OFF_CAM_WCH2_FRMEND_INTS  BIT(2)
-#define BIT_OFF_CAM_CMDLIST15_INTS	BIT(1)
-#define BIT_OFF_CAM_CMDLIST14_INTS	BIT(0)
-
-#define BIT_VACTIVE_CNT	BIT(14)
-#define BIT_DSI_TE_TRI	BIT(13)
-#define BIT_LCD_TE0_PIN	BIT(12)
-#define BIT_LCD_TE1_PIN	BIT(11)
-#define BIT_VACTIVE1_END	BIT(10)
-#define BIT_VACTIVE1_START	BIT(9)
-#define BIT_VACTIVE0_END	BIT(8)
-#define BIT_VACTIVE0_START	BIT(7)
-#define BIT_VFRONTPORCH	BIT(6)
-#define BIT_VBACKPORCH	BIT(5)
-#define BIT_VSYNC	BIT(4)
-#define BIT_VFRONTPORCH_END	BIT(3)
-#define BIT_LDI_UNFLOW	BIT(2)
-#define BIT_FRM_END	BIT(1)
-#define BIT_FRM_START	BIT(0)
-
-#define BIT_CTL_FLUSH_EN	BIT(21)
-#define BIT_SCF_FLUSH_EN	BIT(19)
-#define BIT_DPP0_FLUSH_EN	BIT(18)
-#define BIT_DBUF1_FLUSH_EN	BIT(17)
-#define BIT_DBUF0_FLUSH_EN	BIT(16)
-#define BIT_OV3_FLUSH_EN	BIT(15)
-#define BIT_OV2_FLUSH_EN	BIT(14)
-#define BIT_OV1_FLUSH_EN	BIT(13)
-#define BIT_OV0_FLUSH_EN	BIT(12)
-#define BIT_WB1_FLUSH_EN	BIT(11)
-#define BIT_WB0_FLUSH_EN	BIT(10)
-#define BIT_DMA3_FLUSH_EN	BIT(9)
-#define BIT_DMA2_FLUSH_EN	BIT(8)
-#define BIT_DMA1_FLUSH_EN	BIT(7)
-#define BIT_DMA0_FLUSH_EN	BIT(6)
-#define BIT_RGB1_FLUSH_EN	BIT(4)
-#define BIT_RGB0_FLUSH_EN	BIT(3)
-#define BIT_VIG1_FLUSH_EN	BIT(1)
-#define BIT_VIG0_FLUSH_EN	BIT(0)
-
-#define BIT_BUS_DBG_INT	BIT(5)
-#define BIT_CRC_SUM_INT	BIT(4)
-#define BIT_CRC_ITF1_INT	BIT(3)
-#define BIT_CRC_ITF0_INT	BIT(2)
-#define BIT_CRC_OV1_INT	BIT(1)
-#define BIT_CRC_OV0_INT	BIT(0)
-
-#define BIT_SBL_SEND_FRAME_OUT	BIT(19)
-#define BIT_SBL_STOP_FRAME_OUT	BIT(18)
-#define BIT_SBL_BACKLIGHT_OUT	BIT(17)
-#define BIT_SBL_DARKENH_OUT		BIT(16)
-#define BIT_SBL_BRIGHTPTR_OUT	BIT(15)
-#define BIT_STRENGTH_INROI_OUT	BIT(14)
-#define BIT_STRENGTH_OUTROI_OUT	BIT(13)
-#define BIT_DONE_OUT			BIT(12)
-#define BIT_PPROC_DONE_OUT		BIT(11)
-
-#define BIT_HIACE_IND	BIT(8)
-#define BIT_STRENGTH_INTP	BIT(7)
-#define BIT_BACKLIGHT_INTP	BIT(6)
-#define BIT_CE_END_IND	BIT(5)
-#define BIT_CE_CANCEL_IND	BIT(4)
-#define BIT_CE_LUT1_RW_COLLIDE_IND	BIT(3)
-#define BIT_CE_LUT0_RW_COLLIDE_IND	BIT(2)
-#define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
-#define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
-
-/*
- * MODULE BASE ADDRESS
- */
-
-//DSI0 DSI1
-#define DSS_MIPI_DSI0_OFFSET	(0x00001000)
-#define DSS_MIPI_DSI1_OFFSET	(0x00001400)
-// GLB0
-#define DSS_GLB0_OFFSET	(0x12000)
-// debug
-#define DSS_DBG_OFFSET	(0x11000)
-
-// CMDLIST
-#define DSS_CMDLIST_OFFSET	(0x2000)
+/* MODULE BASE ADDRESS */
 
 //SMMU
 #define DSS_SMMU_OFFSET	(0x80000)
 
-//AIF
-#define DSS_VBIF0_AIF	(0x7000)
-#define DSS_VBIF1_AIF	(0x9000)
-
-// MIF
-#define DSS_MIF_OFFSET	(0xA000)
-
-// MCTL SYS
-#define DSS_MCTRL_SYS_OFFSET	(0x10000)
-
-// MCTL MUTEX
-#define DSS_MCTRL_CTL0_OFFSET	(0x10800)
-#define DSS_MCTRL_CTL1_OFFSET	(0x10900)
-#define DSS_MCTRL_CTL2_OFFSET	(0x10A00)
-#define DSS_MCTRL_CTL3_OFFSET	(0x10B00)
-#define DSS_MCTRL_CTL4_OFFSET	(0x10C00)
-#define DSS_MCTRL_CTL5_OFFSET	(0x10D00)
-
 // RCH_V
-#define DSS_RCH_VG0_DMA_OFFSET			(0x20000)
-#define DSS_RCH_VG0_DFC_OFFSET			(0x20100)
-#define DSS_RCH_VG0_SCL_OFFSET			(0x20200)
-#define DSS_RCH_VG0_ARSR_OFFSET			(0x20300)
 #define DSS_RCH_VG0_POST_CLIP_OFFSET_ES	(0x203A0)
-#define DSS_RCH_VG0_PCSC_OFFSET			(0x20400)
 #define DSS_RCH_VG0_POST_CLIP_OFFSET	(0x20480)
-#define DSS_RCH_VG0_CSC_OFFSET			(0x20500)
-#define DSS_RCH_VG0_DEBUG_OFFSET		(0x20600)
-#define DSS_RCH_VG0_VPP_OFFSET			(0x20700)
-#define DSS_RCH_VG0_DMA_BUF_OFFSET		(0x20800)
-#define DSS_RCH_VG0_AFBCD_OFFSET		(0x20900)
-#define DSS_RCH_VG0_REG_DEFAULT_OFFSET	(0x20A00)
-#define DSS_RCH_VG0_SCL_LUT_OFFSET		(0x21000)
-#define DSS_RCH_VG0_ARSR_LUT_OFFSET		(0x25000)
 
-#define DSS_RCH_VG1_DMA_OFFSET			(0x28000)
-#define DSS_RCH_VG1_DFC_OFFSET			(0x28100)
-#define DSS_RCH_VG1_SCL_OFFSET			(0x28200)
 #define DSS_RCH_VG1_POST_CLIP_OFFSET_ES	(0x283A0)
 #define DSS_RCH_VG1_POST_CLIP_OFFSET	(0x28480)
-#define DSS_RCH_VG1_CSC_OFFSET			(0x28500)
-#define DSS_RCH_VG1_DEBUG_OFFSET		(0x28600)
-#define DSS_RCH_VG1_VPP_OFFSET			(0x28700)
-#define DSS_RCH_VG1_DMA_BUF_OFFSET		(0x28800)
-#define DSS_RCH_VG1_AFBCD_OFFSET		(0x28900)
-#define DSS_RCH_VG1_REG_DEFAULT_OFFSET	(0x28A00)
-#define DSS_RCH_VG1_SCL_LUT_OFFSET		(0x29000)
 
-#define DSS_RCH_VG2_DMA_OFFSET			(0x30000)
-#define DSS_RCH_VG2_DFC_OFFSET			(0x30100)
-#define DSS_RCH_VG2_SCL_OFFSET			(0x30200)
 #define DSS_RCH_VG2_POST_CLIP_OFFSET_ES	(0x303A0)
 #define DSS_RCH_VG2_POST_CLIP_OFFSET	(0x30480)
-#define DSS_RCH_VG2_CSC_OFFSET			(0x30500)
-#define DSS_RCH_VG2_DEBUG_OFFSET		(0x30600)
-#define DSS_RCH_VG2_VPP_OFFSET			(0x30700)
-#define DSS_RCH_VG2_DMA_BUF_OFFSET		(0x30800)
-#define DSS_RCH_VG2_REG_DEFAULT_OFFSET	(0x30A00)
 #define DSS_RCH_VG2_SCL_LUT_OFFSET		(0x31000)   //ES
 
 // RCH_G
-#define DSS_RCH_G0_DMA_OFFSET				(0x38000)
-#define DSS_RCH_G0_DFC_OFFSET				(0x38100)
-#define DSS_RCH_G0_SCL_OFFSET				(0x38200)
 #define DSS_RCH_G0_POST_CLIP_OFFSET_ES		(0x383A0)
 #define DSS_RCH_G0_POST_CLIP_OFFSET		(0x38480)
-#define DSS_RCH_G0_CSC_OFFSET			(0x38500)
-#define DSS_RCH_G0_DEBUG_OFFSET			(0x38600)
-#define DSS_RCH_G0_DMA_BUF_OFFSET		(0x38800)
-#define DSS_RCH_G0_AFBCD_OFFSET			(0x38900)
-#define DSS_RCH_G0_REG_DEFAULT_OFFSET	(0x38A00)
 
-#define DSS_RCH_G1_DMA_OFFSET				(0x40000)
-#define DSS_RCH_G1_DFC_OFFSET				(0x40100)
-#define DSS_RCH_G1_SCL_OFFSET				(0x40200)
 #define DSS_RCH_G1_POST_CLIP_OFFSET_ES	(0x403A0)
 #define DSS_RCH_G1_POST_CLIP_OFFSET		(0x40480)
-#define DSS_RCH_G1_CSC_OFFSET			(0x40500)
-#define DSS_RCH_G1_DEBUG_OFFSET			(0x40600)
-#define DSS_RCH_G1_DMA_BUF_OFFSET		(0x40800)
-#define DSS_RCH_G1_AFBCD_OFFSET			(0x40900)
-#define DSS_RCH_G1_REG_DEFAULT_OFFSET	(0x40A00)
 
 // RCH_D
-#define DSS_RCH_D2_DMA_OFFSET			(0x50000)
-#define DSS_RCH_D2_DFC_OFFSET			(0x50100)
-#define DSS_RCH_D2_CSC_OFFSET			(0x50500)
-#define DSS_RCH_D2_DEBUG_OFFSET		(0x50600)
-#define DSS_RCH_D2_DMA_BUF_OFFSET	(0x50800)
-
-#define DSS_RCH_D3_DMA_OFFSET			(0x51000)
-#define DSS_RCH_D3_DFC_OFFSET			(0x51100)
-#define DSS_RCH_D3_CSC_OFFSET			(0x51500)
-#define DSS_RCH_D3_DEBUG_OFFSET		(0x51600)
-#define DSS_RCH_D3_DMA_BUF_OFFSET	(0x51800)
-
-#define DSS_RCH_D0_DMA_OFFSET			(0x52000)
-#define DSS_RCH_D0_DFC_OFFSET			(0x52100)
-#define DSS_RCH_D0_CSC_OFFSET			(0x52500)
-#define DSS_RCH_D0_DEBUG_OFFSET		(0x52600)
-#define DSS_RCH_D0_DMA_BUF_OFFSET	(0x52800)
-#define DSS_RCH_D0_AFBCD_OFFSET		(0x52900)
-
-#define DSS_RCH_D1_DMA_OFFSET			(0x53000)
-#define DSS_RCH_D1_DFC_OFFSET			(0x53100)
-#define DSS_RCH_D1_CSC_OFFSET			(0x53500)
-#define DSS_RCH_D1_DEBUG_OFFSET		(0x53600)
-#define DSS_RCH_D1_DMA_BUF_OFFSET	(0x53800)
 
 // WCH
-#define DSS_WCH0_DMA_OFFSET			(0x5A000)
-#define DSS_WCH0_DFC_OFFSET			(0x5A100)
 #define DSS_WCH0_BITEXT_OFFSET		(0x5A140)
 #define DSS_WCH0_DITHER_OFFSET            (0x5A1D0)
 #define DSS_WCH0_PCSC_OFFSET			(0x5A400)
-#define DSS_WCH0_CSC_OFFSET			(0x5A500)
 #define DSS_WCH0_ROT_OFFSET			(0x5A530)
-#define DSS_WCH0_DEBUG_OFFSET		(0x5A600)
-#define DSS_WCH0_DMA_BUFFER_OFFSET	(0x5A800)
-#define DSS_WCH0_AFBCE_OFFSET			(0x5A900)
 #define DSS_WCH0_FBCE_CREG_CTRL_GATE (0x5A964)
 
-#define DSS_WCH1_DMA_OFFSET			(0x5C000)
-#define DSS_WCH1_DFC_OFFSET			(0x5C100)
 #define DSS_WCH1_BITEXT_OFFSET		(0x5C140)
 #define DSS_WCH1_DITHER_OFFSET            (0x5C1D0)
 #define DSS_WCH1_SCL_OFFSET			(0x5C200)
 #define DSS_WCH1_PCSC_OFFSET			(0x5C400)
-#define DSS_WCH1_CSC_OFFSET			(0x5C500)
 #define DSS_WCH1_ROT_OFFSET			(0x5C530)
-#define DSS_WCH1_DEBUG_OFFSET		(0x5C600)
-#define DSS_WCH1_DMA_BUFFER_OFFSET	(0x5C800)
-#define DSS_WCH1_AFBCE_OFFSET			(0x5C900)
 #define DSS_WCH1_FBCE_CREG_CTRL_GATE	(0x5C964)
 
-#define DSS_WCH2_DMA_OFFSET			(0x5E000)
-#define DSS_WCH2_DFC_OFFSET			(0x5E100)
-#define DSS_WCH2_CSC_OFFSET			(0x5E500)
-#define DSS_WCH2_ROT_OFFSET			(0x5E500)
-#define DSS_WCH2_DEBUG_OFFSET		(0x5E600)
-#define DSS_WCH2_DMA_BUFFER_OFFSET	(0x5E800)
-#define DSS_WCH2_AFBCE_OFFSET			(0x5E900)
-
-// OVL
-#define DSS_OVL0_OFFSET	(0x60000)
-#define DSS_OVL1_OFFSET	(0x60400)
-#define DSS_OVL2_OFFSET	(0x60800)
-#define DSS_OVL3_OFFSET	(0x60C00)
-
-//DBUF
-#define DSS_DBUF0_OFFSET	(0x6D000)
-#define DSS_DBUF1_OFFSET	(0x6E000)
-
-//HI_ACE
-#define DSS_HI_ACE_OFFSET	(0x6F000)
-
 // DPP
-#define DSS_DPP_OFFSET	(0x70000)
-#define DSS_TOP_OFFSET	(0x70000)
-#define DSS_DPP_COLORBAR_OFFSET	(0x70100)
 #define DSS_DPP_CLIP_OFFSET	(0x70180)
-#define DSS_DPP_DITHER_OFFSET	(0x70200)
-#define DSS_DPP_CSC_RGB2YUV10B_OFFSET	(0x70300)
-#define DSS_DPP_CSC_YUV2RGB10B_OFFSET	(0x70400)
-#define DSS_DPP_GAMA_OFFSET	(0x70600)
-#define DSS_DPP_ACM_OFFSET	(0x70700)
 #define DSS_DPP_XCC_OFFSET	(0x70900)
 #define DSS_DPP_DEGAMMA_OFFSET	(0x70950)
 #define DSS_DPP_GMP_OFFSET	(0x709A0)
 #define DSS_DPP_ARSR_POST_OFFSET	(0x70A00)
-#define DSS_DPP_GAMA_LUT_OFFSET	(0x71000)
-#define DSS_DPP_ACM_LUT_OFFSET	(0x72000)
 #define DSS_DPP_GMP_LUT_OFFSET	(0x73000)
 #define DSS_DPP_GAMA_PRE_LUT_OFFSET	(0x75000)
 #define DSS_DPP_DEGAMMA_LUT_OFFSET	(0x78000)
 #define DSS_DPP_ARSR_POST_LUT_OFFSET	(0x7B000)
-//ace for ES
-#define DSS_DPP_ACE_OFFSET	(0x70800)
-#define DSS_DPP_ACE_LUT_OFFSET	(0x79000)
-//ACE LUT
-#define ACE_HIST0	(0x000)
-#define ACE_HIST1	(0x400)
-#define ACE_LUT0	(0x800)
-#define ACE_LUT1	(0xA00)
 
 //for boston es
 #define DSS_DPP_LCP_OFFSET_ES	(0x70900)
@@ -960,431 +154,14 @@ enum dss_rdma_idx {
 //POST SCF for ES
 #define DSS_POST_SCF_LUT_OFFSET_ES	(0x7B000)
 
-#define DSS_DPP_SBL_OFFSET	(0x7C000)
-#define DSS_LDI0_OFFSET	(0x7D000)
-#define DSS_IFBC_OFFSET	(0x7D800)
-#define DSS_DSC_OFFSET	(0x7DC00)
-#define DSS_LDI1_OFFSET	(0x7E000)
+/* AIF */
 
-/*
- * GLB
- */
-
-#define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
-//APB
-#define GLB_APB_CTL	 (DSS_GLB0_OFFSET + 0x0004)
-//RST
-#define GLB_DSS_AXI_RST_EN	(DSS_GLB0_OFFSET + 0x0118)
-#define GLB_DSS_APB_RST_EN	(DSS_GLB0_OFFSET + 0x011C)
-#define GLB_DSS_CORE_RST_EN	(DSS_GLB0_OFFSET + 0x0120)
-#define GLB_PXL0_DIV2_RST_EN	(DSS_GLB0_OFFSET + 0x0124)
-#define GLB_PXL0_DIV4_RST_EN	(DSS_GLB0_OFFSET + 0x0128)
-#define GLB_PXL0_RST_EN	(DSS_GLB0_OFFSET + 0x012C)
-#define GLB_PXL0_DSI_RST_EN	(DSS_GLB0_OFFSET + 0x0130)
-#define GLB_DSS_PXL1_RST_EN	(DSS_GLB0_OFFSET + 0x0134)
-#define GLB_MM_AXI_CLK_RST_EN	(DSS_GLB0_OFFSET + 0x0138)
-#define GLB_AFBCD0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0140)
-#define GLB_AFBCD1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0144)
-#define GLB_AFBCD2_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0148)
-#define GLB_AFBCD3_IP_RST_EN	(DSS_GLB0_OFFSET + 0x014C)
-#define GLB_AFBCD4_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0150)
-#define GLB_AFBCD5_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0154)
-#define GLB_AFBCD6_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0158)
-#define GLB_AFBCD7_IP_RST_EN	(DSS_GLB0_OFFSET + 0x015C)
-#define GLB_AFBCE0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0160)
-#define GLB_AFBCE1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0164)
-
-//MCU CPU first class interrupts
-#define GLB_MCU_PDP_INTS	(DSS_GLB0_OFFSET + 0x20C)
-#define GLB_MCU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x210)
-#define GLB_MCU_SDP_INTS	(DSS_GLB0_OFFSET + 0x214)
-#define GLB_MCU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x218)
-#define GLB_MCU_OFF_INTS	(DSS_GLB0_OFFSET + 0x21C)
-#define GLB_MCU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x220)
-#define GLB_MCU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2B4)
-#define GLB_MCU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B8)
-#define GLB_CPU_PDP_INTS	(DSS_GLB0_OFFSET + 0x224)
-#define GLB_CPU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x228)
-#define GLB_CPU_SDP_INTS	(DSS_GLB0_OFFSET + 0x22C)
-#define GLB_CPU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x230)
-#define GLB_CPU_OFF_INTS	(DSS_GLB0_OFFSET + 0x234)
-#define GLB_CPU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x238)
-#define GLB_CPU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2AC)
-#define GLB_CPU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B0)
-
-//core clock area, first class gating
-#define GLB_MODULE_CLK_SEL	(DSS_GLB0_OFFSET + 0x0300)
-#define GLB_MODULE_CLK_EN	(DSS_GLB0_OFFSET + 0x0304)
-//irq debug
-#define GLB_GLB0_DBG_SEL	(DSS_GLB0_OFFSET + 0x310)
-#define GLB_GLB1_DBG_SEL	(DSS_GLB0_OFFSET + 0x314)
-#define GLB_DBG_IRQ_CPU	(DSS_GLB0_OFFSET + 0x320)
-#define GLB_DBG_IRQ_MCU	(DSS_GLB0_OFFSET + 0x324)
-//glb reserved
-#define GLB_TP_SEL	(DSS_GLB0_OFFSET + 0x0400)
-#define GLB_CRC_DBG_LDI0	(DSS_GLB0_OFFSET + 0x0404)
-#define GLB_CRC_DBG_LDI1	(DSS_GLB0_OFFSET + 0x0408)
-#define GLB_CRC_LDI0_EN	(DSS_GLB0_OFFSET + 0x040C)
-#define GLB_CRC_LDI0_FRM	(DSS_GLB0_OFFSET + 0x0410)
-#define GLB_CRC_LDI1_EN	(DSS_GLB0_OFFSET + 0x0414)
-#define GLB_CRC_LDI1_FRM	(DSS_GLB0_OFFSET + 0x0418)
-//memory lowpower
-#define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
-#define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
-
-/*****************************************************************************/
-
-#define DBG_CRC_DBG_OV0	(0x0000)
-#define DBG_CRC_DBG_OV1	(0x0004)
-#define DBG_CRC_DBG_SUM	(0x0008)
-#define DBG_CRC_OV0_EN	(0x000C)
-#define DBG_DSS_GLB_DBG_O	(0x0010)
-#define DBG_DSS_GLB_DBG_I	(0x0014)
-#define DBG_CRC_OV0_FRM	(0x0018)
-#define DBG_CRC_OV1_EN	(0x001C)
-#define DBG_CRC_OV1_FRM	(0x0020)
-#define DBG_CRC_SUM_EN	(0x0024)
-#define DBG_CRC_SUM_FRM	(0x0028)
-//second class interrupt
-#define DBG_MCTL_INTS	(0x023C)
-#define DBG_MCTL_INT_MSK	(0x0240)
-#define DBG_WCH0_INTS	(0x0244)
-#define DBG_WCH0_INT_MSK	(0x0248)
-#define DBG_WCH1_INTS	(0x024C)
-#define DBG_WCH1_INT_MSK	(0x0250)
-#define DBG_RCH0_INTS	(0x0254)
-#define DBG_RCH0_INT_MSK	(0x0258)
-#define DBG_RCH1_INTS	(0x025C)
-#define DBG_RCH1_INT_MSK	(0x0260)
-#define DBG_RCH2_INTS	(0x0264)
-#define DBG_RCH2_INT_MSK	(0x0268)
-#define DBG_RCH3_INTS	(0x026C)
-#define DBG_RCH3_INT_MSK	(0x0270)
-#define DBG_RCH4_INTS	(0x0274)
-#define DBG_RCH4_INT_MSK	(0x0278)
-#define DBG_RCH5_INTS	(0x027C)
-#define DBG_RCH5_INT_MSK	(0x0280)
-#define DBG_RCH6_INTS	(0x0284)
-#define DBG_RCH6_INT_MSK	(0x0288)
-#define DBG_RCH7_INTS	(0x028C)
-#define DBG_RCH7_INT_MSK	(0x0290)
-#define DBG_DSS_GLB_INTS	(0x0294)
-#define DBG_DSS_GLB_INT_MSK	(0x0298)
-#define DBG_WCH2_INTS	(0x029C)
-#define DBG_WCH2_INT_MSK	(0x02A0)
-#define DBG_RCH8_INTS	(0x02A4)
-#define DBG_RCH8_INT_MSK	(0x02A8)
-
-/*
- * CMDLIST
- */
-//DSS_CMD_OFFSET +  CMDLIST_CH0_* + 0x40 * i
-#define CMDLIST_CH0_PENDING_CLR	(0x0000)
-#define CMDLIST_CH0_CTRL	(0x0004)
-#define CMDLIST_CH0_STATUS	(0x0008)
-#define CMDLIST_CH0_STAAD	(0x000C)
-#define CMDLIST_CH0_CURAD	(0x0010)
-#define CMDLIST_CH0_INTE	(0x0014)
-#define CMDLIST_CH0_INTC	(0x0018)
-#define CMDLIST_CH0_INTS	(0x001C)
-#define CMDLIST_CH0_SCENE	(0x0020)
-#define CMDLIST_CH0_DBG	(0x0028)
-
-#define CMDLIST_DBG	(0x0700)
-#define CMDLIST_BUF_DBG_EN	(0x0704)
-#define CMDLIST_BUF_DBG_CNT_CLR	(0x0708)
-#define CMDLIST_BUF_DBG_CNT	(0x070C)
-#define CMDLIST_TIMEOUT_TH	(0x0710)
-#define CMDLIST_START	(0x0714)
-#define CMDLIST_ADDR_MASK_EN	(0x0718)
-#define CMDLIST_ADDR_MASK_DIS	(0x071C)
-#define CMDLIST_ADDR_MASK_STATUS	(0x0720)
-#define CMDLIST_TASK_CONTINUE	(0x0724)
-#define CMDLIST_TASK_STATUS	(0x0728)
-#define CMDLIST_CTRL	(0x072C)
-#define CMDLIST_SECU	(0x0730)
-#define CMDLIST_INTS	(0x0734)
-#define CMDLIST_SWRST	(0x0738)
-#define CMD_MEM_CTRL	(0x073C)
-#define CMD_CLK_SEL		(0x0740)
-#define CMD_CLK_EN	(0x0744)
-
-#define HISI_DSS_MIN_ROT_AFBCE_BLOCK_SIZE (256)
-#define HISI_DSS_MAX_ROT_AFBCE_BLOCK_SIZE (480)
-
-//cmdlist channel interrupt status  0x1c
-#define BIT_CMDLIST_CH_TASKDONE_INTS	    BIT(7)
-#define BIT_CMDLIST_CH_TIMEOUT_INTS	    BIT(6)
-#define BIT_CMDLIST_CH_BADCMD_INTS	    BIT(5)
-#define BIT_CMDLIST_CH_START_INTS	           BIT(4)
-#define BIT_CMDLIST_CH_PENDING_INTS	    BIT(3)
-#define BIT_CMDLIST_CH_AXIERR_INTS	    BIT(2)
-#define BIT_CMDLIST_CH_ALLDONE_INTS	    BIT(1)
-#define BIT_CMDLIST_CH_ONEDONE_INTS	    BIT(0)
-//cmdlist interrupt status 0x734
-#define BIT_CMDLIST_CH15_INTS	BIT(15)
-#define BIT_CMDLIST_CH14_INTS	BIT(14)
-#define BIT_CMDLIST_CH13_INTS	BIT(13)
-#define BIT_CMDLIST_CH12_INTS	BIT(12)
-#define BIT_CMDLIST_CH11_INTS	BIT(11)
-#define BIT_CMDLIST_CH10_INTS	BIT(10)
-#define BIT_CMDLIST_CH9_INTS	BIT(9)
-#define BIT_CMDLIST_CH8_INTS	BIT(8)
-#define BIT_CMDLIST_CH7_INTS	BIT(7)
-#define BIT_CMDLIST_CH6_INTS	BIT(6)
-#define BIT_CMDLIST_CH5_INTS	BIT(5)
-#define BIT_CMDLIST_CH4_INTS	BIT(4)
-#define BIT_CMDLIST_CH3_INTS	BIT(3)
-#define BIT_CMDLIST_CH2_INTS	BIT(2)
-#define BIT_CMDLIST_CH1_INTS	BIT(1)
-#define BIT_CMDLIST_CH0_INTS	BIT(0)
-
-/*
- * AIF
- */
-#define AIF0_CH0_OFFSET		(DSS_VBIF0_AIF + 0x00)
-#define AIF0_CH1_OFFSET		(DSS_VBIF0_AIF + 0x20)
-#define AIF0_CH2_OFFSET		(DSS_VBIF0_AIF + 0x40)
-#define AIF0_CH3_OFFSET		(DSS_VBIF0_AIF + 0x60)
-#define AIF0_CH4_OFFSET		(DSS_VBIF0_AIF + 0x80)
-#define AIF0_CH5_OFFSET		(DSS_VBIF0_AIF + 0xA0)
-#define AIF0_CH6_OFFSET		(DSS_VBIF0_AIF + 0xC0)
-#define AIF0_CH7_OFFSET		(DSS_VBIF0_AIF + 0xE0)
-#define AIF0_CH8_OFFSET		(DSS_VBIF0_AIF + 0x100)
-#define AIF0_CH9_OFFSET		(DSS_VBIF0_AIF + 0x120)
-#define AIF0_CH10_OFFSET	(DSS_VBIF0_AIF + 0x140)
-#define AIF0_CH11_OFFSET	(DSS_VBIF0_AIF + 0x160)
-#define AIF0_CH12_OFFSET	(DSS_VBIF0_AIF + 0x180)
-
-#define AIF1_CH0_OFFSET		(DSS_VBIF1_AIF + 0x00)
-#define AIF1_CH1_OFFSET		(DSS_VBIF1_AIF + 0x20)
-#define AIF1_CH2_OFFSET		(DSS_VBIF1_AIF + 0x40)
-#define AIF1_CH3_OFFSET		(DSS_VBIF1_AIF + 0x60)
-#define AIF1_CH4_OFFSET		(DSS_VBIF1_AIF + 0x80)
-#define AIF1_CH5_OFFSET		(DSS_VBIF1_AIF + 0xA0)
-#define AIF1_CH6_OFFSET		(DSS_VBIF1_AIF + 0xC0)
-#define AIF1_CH7_OFFSET		(DSS_VBIF1_AIF + 0xE0)
-#define AIF1_CH8_OFFSET		(DSS_VBIF1_AIF + 0x100)
-#define AIF1_CH9_OFFSET		(DSS_VBIF1_AIF + 0x120)
-#define AIF1_CH10_OFFSET	(DSS_VBIF1_AIF + 0x140)
-#define AIF1_CH11_OFFSET	(DSS_VBIF1_AIF + 0x160)
-#define AIF1_CH12_OFFSET	(DSS_VBIF1_AIF + 0x180)
-
-/* aif dmax */
-//(0x0000+0x20*n)
-#define AIF_CH_CTL	(0x0000)
-//(0x0004+0x20*n)  //ES
-#define AIF_CH_CTL_ADD	(0x0004)
 //(0x0004+0x20*n)
 #define AIF_CH_HS	(0x0004)
 //(0x0008+0x20*n)
 #define AIF_CH_LS	(0x0008)
 
-/* aif common */
-#define AXI0_RID_MSK0	(0x0800)
-#define AXI0_RID_MSK1	(0x0804)
-#define AXI0_WID_MSK	(0x0808)
-#define AXI0_R_QOS_MAP	(0x080c)
-#define AXI1_RID_MSK0	(0x0810)
-#define AXI1_RID_MSK1	(0x0814)
-#define AXI1_WID_MSK	(0x0818)
-#define AXI1_R_QOS_MAP	(0x081c)
-#define AIF_CLK_SEL0	(0x0820)
-#define AIF_CLK_SEL1	(0x0824)
-#define AIF_CLK_EN0	(0x0828)
-#define AIF_CLK_EN1	(0x082c)
-#define MONITOR_CTRL	(0x0830)
-#define MONITOR_TIMER_INI	(0x0834)
-#define DEBUG_BUF_BASE	(0x0838)
-#define DEBUG_CTRL	(0x083C)
-#define AIF_SHADOW_READ	(0x0840)
-#define AIF_MEM_CTRL	(0x0844)
-#define AIF_MONITOR_EN	(0x0848)
-#define AIF_MONITOR_CTRL	(0x084C)
-#define AIF_MONITOR_SAMPLE_MUN	(0x0850)
-#define AIF_MONITOR_SAMPLE_TIME	(0x0854)
-#define AIF_MONITOR_SAMPLE_FLOW	(0x0858)
-
-/* aif debug */
-#define AIF_MONITOR_READ_DATA	(0x0880)
-#define AIF_MONITOR_WRITE_DATA	(0x0884)
-#define AIF_MONITOR_WINDOW_CYCLE	(0x0888)
-#define AIF_MONITOR_WBURST_CNT	(0x088C)
-#define AIF_MONITOR_MIN_WR_CYCLE	(0x0890)
-#define AIF_MONITOR_MAX_WR_CYCLE	(0x0894)
-#define AIF_MONITOR_AVR_WR_CYCLE	(0x0898)
-#define AIF_MONITOR_MIN_WRW_CYCLE	(0x089C)
-#define AIF_MONITOR_MAX_WRW_CYCLE	(0x08A0)
-#define AIF_MONITOR_AVR_WRW_CYCLE	(0x08A4)
-#define AIF_MONITOR_RBURST_CNT	(0x08A8)
-#define AIF_MONITOR_MIN_RD_CYCLE	(0x08AC)
-#define AIF_MONITOR_MAX_RD_CYCLE	(0x08B0)
-#define AIF_MONITOR_AVR_RD_CYCLE	(0x08B4)
-#define AIF_MONITOR_MIN_RDW_CYCLE	(0x08B8)
-#define AIF_MONITOR_MAX_RDW_CYCLE	(0x08BC)
-#define AIF_MONITOR_AVR_RDW_CYCLE	(0x08C0)
-#define AIF_CH_STAT_0	(0x08C4)
-#define AIF_CH_STAT_1	(0x08C8)
-//axi mm_axi clock area, first class gating
-#define AIF_MODULE_CLK_SEL	(0x0A04)
-#define AIF_MODULE_CLK_EN	(0x0A08)
-
-struct dss_aif {
-	u32 aif_ch_ctl;
-	u32 aif_ch_ctl_add;  //ES
-	u32 aif_ch_hs;
-	u32 aif_ch_ls;
-};
-
-struct dss_aif_bw {
-	u64 bw;
-	u8 chn_idx;
-	s8 axi_sel;
-	u8 is_used;
-};
-
-/*
- * MIF
- */
-#define MIF_ENABLE	(0x0000)
-#define MIF_MEM_CTRL	(0x0004)
-
-#define MIF_CTRL0	(0x000)
-#define MIF_CTRL1	(0x004)
-#define MIF_CTRL2	(0x008)
-#define MIF_CTRL3	(0x00C)
-#define MIF_CTRL4	(0x010)
-#define MIF_CTRL5	(0x014)
-#define REG_DEFAULT (0x0500)
-#define MIF_SHADOW_READ	(0x0504)
-#define MIF_CLK_CTL	(0x0508)
-//0x0160+16*k
-#define MIF_STAT0	(0x0600)
-//0x0164+16*k
-#define MIF_STAT1	(0x0604)
-//0x0168+16*k
-#define MIF_STAT2	(0x0608)
-
-#define MIF_CTRL_OFFSET	(0x20)
-#define MIF_CH0_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 1)
-#define MIF_CH1_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 2)
-#define MIF_CH2_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 3)
-#define MIF_CH3_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 4)
-#define MIF_CH4_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 5)
-#define MIF_CH5_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 6)
-#define MIF_CH6_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 7)
-#define MIF_CH7_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 8)
-#define MIF_CH8_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 9)
-#define MIF_CH9_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 10)
-#define MIF_CH10_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 11)
-#define MIF_CH11_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET * 12)
-#define MIF_CTRL_NUM	(12)
-
-#define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
-#define MIF_STRIDE_UNIT (4 * 1024)
-
-struct dss_mif {
-	u32 mif_ctrl1;
-	u32 mif_ctrl2;
-	u32 mif_ctrl3;
-	u32 mif_ctrl4;
-	u32 mif_ctrl5;
-};
-
-/*
-** stretch blt, linear/tile, rotation, pixel format
-** 0 0 000
-*/
-enum dss_mmu_tlb_tag_org {
-	MMU_TLB_TAG_ORG_0x0 = 0x0,
-	MMU_TLB_TAG_ORG_0x1 = 0x1,
-	MMU_TLB_TAG_ORG_0x2 = 0x2,
-	MMU_TLB_TAG_ORG_0x3 = 0x3,
-	MMU_TLB_TAG_ORG_0x4 = 0x4,
-	MMU_TLB_TAG_ORG_0x7 = 0x7,
-
-	MMU_TLB_TAG_ORG_0x8 = 0x8,
-	MMU_TLB_TAG_ORG_0x9 = 0x9,
-	MMU_TLB_TAG_ORG_0xA = 0xA,
-	MMU_TLB_TAG_ORG_0xB = 0xB,
-	MMU_TLB_TAG_ORG_0xC = 0xC,
-	MMU_TLB_TAG_ORG_0xF = 0xF,
-
-	MMU_TLB_TAG_ORG_0x10 = 0x10,
-	MMU_TLB_TAG_ORG_0x11 = 0x11,
-	MMU_TLB_TAG_ORG_0x12 = 0x12,
-	MMU_TLB_TAG_ORG_0x13 = 0x13,
-	MMU_TLB_TAG_ORG_0x14 = 0x14,
-	MMU_TLB_TAG_ORG_0x17 = 0x17,
-
-	MMU_TLB_TAG_ORG_0x18 = 0x18,
-	MMU_TLB_TAG_ORG_0x19 = 0x19,
-	MMU_TLB_TAG_ORG_0x1A = 0x1A,
-	MMU_TLB_TAG_ORG_0x1B = 0x1B,
-	MMU_TLB_TAG_ORG_0x1C = 0x1C,
-	MMU_TLB_TAG_ORG_0x1F = 0x1F,
-};
-
-/*
- * SMMU
- */
-#define SMMU_SCR	(0x0000)
-#define SMMU_MEMCTRL	(0x0004)
-#define SMMU_LP_CTRL	(0x0008)
-#define SMMU_PRESS_REMAP	(0x000C)
-#define SMMU_INTMASK_NS	(0x0010)
-#define SMMU_INTRAW_NS	(0x0014)
-#define SMMU_INTSTAT_NS	(0x0018)
-#define SMMU_INTCLR_NS	(0x001C)
-//(0x0020+n*0x4)
-#define SMMU_SMRx_NS	(0x0020)
-#define SMMU_RLD_EN0_NS	(0x01F0)
-#define SMMU_RLD_EN1_NS	(0x01F4)
-#define SMMU_RLD_EN2_NS	(0x01F8)
-#define SMMU_CB_SCTRL	(0x0200)
-#define SMMU_CB_TTBR0	(0x0204)
-#define SMMU_CB_TTBR1	(0x0208)
-#define SMMU_CB_TTBCR	(0x020C)
-#define SMMU_OFFSET_ADDR_NS	(0x0210)
-#define SMMU_SCACHEI_ALL	(0x0214)
-#define SMMU_SCACHEI_L1	(0x0218)
-#define SMMU_SCACHEI_L2L3	(0x021C)
-#define SMMU_FAMA_CTRL0	(0x0220)
-#define SMMU_FAMA_CTRL1	(0x0224)
-#define SMMU_ADDR_MSB	(0x0300)
-#define SMMU_ERR_RDADDR	(0x0304)
-#define SMMU_ERR_WRADDR	(0x0308)
-#define SMMU_FAULT_ADDR_TCU (0x0310)
-#define SMMU_FAULT_ID_TCU	(0x0314)
-//(0x0320+n*0x10)
-#define SMMU_FAULT_ADDR_TBUx	(0x0320)
-#define SMMU_FAULT_ID_TBUx	(0x0324)
-#define SMMU_FAULT_INFOx	(0x0328)
-#define SMMU_DBGRPTR_TLB	(0x0380)
-#define SMMU_DBGRDATA_TLB	(0x0380)
-#define SMMU_DBGRDATA0_CACHE	(0x038C)
-#define SMMU_DBGRDATA1_CACHE	(0x0390)
-#define SMMU_DBGAXI_CTRL	(0x0394)
-#define SMMU_OVA_ADDR	(0x0398)
-#define SMMU_OPA_ADDR	(0x039C)
-#define SMMU_OVA_CTRL	(0x03A0)
-#define SMMU_OPREF_ADDR	(0x03A4)
-#define SMMU_OPREF_CTRL	(0x03A8)
-#define SMMU_OPREF_CNT	(0x03AC)
-//(0x0500+n*0x4)
-#define SMMU_SMRx_S	(0x0500)
-#define SMMU_RLD_EN0_S	(0x06F0)
-#define SMMU_RLD_EN1_S	(0x06F4)
-#define SMMU_RLD_EN2_S	(0x06F8)
-#define SMMU_INTMAS_S	(0x0700)
-#define SMMU_INTRAW_S	(0x0704)
-#define SMMU_INTSTAT_S	(0x0708)
-#define SMMU_INTCLR_S	(0x070C)
-#define SMMU_SCR_S	(0x0710)
-#define SMMU_SCB_SCTRL	(0x0714)
-#define SMMU_SCB_TTBR	(0x0718)
-#define SMMU_SCB_TTBCR	(0x071C)
-#define SMMU_OFFSET_ADDR_S	(0x0720)
+/* SMMU */
 
 #define SMMU_SMRx_P	(0x10000)
 #define SMMU_RLD_EN0_P	(0x101F0)
@@ -1400,241 +177,21 @@ enum dss_mmu_tlb_tag_org {
 #define SMMU_PCB_TTBCR	(0x1021C)
 #define SMMU_OFFSET_ADDR_P	(0x10220)
 
-#define SMMU_SID_NUM	(64)
-
-struct dss_smmu {
-	u32 smmu_scr;
-	u32 smmu_memctrl;
-	u32 smmu_lp_ctrl;
-	u32 smmu_press_remap;
-	u32 smmu_intmask_ns;
-	u32 smmu_intraw_ns;
-	u32 smmu_intstat_ns;
-	u32 smmu_intclr_ns;
-	u32 smmu_smrx_ns[SMMU_SID_NUM];
-	u32 smmu_rld_en0_ns;
-	u32 smmu_rld_en1_ns;
-	u32 smmu_rld_en2_ns;
-	u32 smmu_cb_sctrl;
-	u32 smmu_cb_ttbr0;
-	u32 smmu_cb_ttbr1;
-	u32 smmu_cb_ttbcr;
-	u32 smmu_offset_addr_ns;
-	u32 smmu_scachei_all;
-	u32 smmu_scachei_l1;
-	u32 smmu_scachei_l2l3;
-	u32 smmu_fama_ctrl0_ns;
-	u32 smmu_fama_ctrl1_ns;
-	u32 smmu_addr_msb;
-	u32 smmu_err_rdaddr;
-	u32 smmu_err_wraddr;
-	u32 smmu_fault_addr_tcu;
-	u32 smmu_fault_id_tcu;
-	u32 smmu_fault_addr_tbux;
-	u32 smmu_fault_id_tbux;
-	u32 smmu_fault_infox;
-	u32 smmu_dbgrptr_tlb;
-	u32 smmu_dbgrdata_tlb;
-	u32 smmu_dbgrptr_cache;
-	u32 smmu_dbgrdata0_cache;
-	u32 smmu_dbgrdata1_cache;
-	u32 smmu_dbgaxi_ctrl;
-	u32 smmu_ova_addr;
-	u32 smmu_opa_addr;
-	u32 smmu_ova_ctrl;
-	u32 smmu_opref_addr;
-	u32 smmu_opref_ctrl;
-	u32 smmu_opref_cnt;
-	u32 smmu_smrx_s[SMMU_SID_NUM];
-	u32 smmu_rld_en0_s;
-	u32 smmu_rld_en1_s;
-	u32 smmu_rld_en2_s;
-	u32 smmu_intmas_s;
-	u32 smmu_intraw_s;
-	u32 smmu_intstat_s;
-	u32 smmu_intclr_s;
-	u32 smmu_scr_s;
-	u32 smmu_scb_sctrl;
-	u32 smmu_scb_ttbr;
-	u32 smmu_scb_ttbcr;
-	u32 smmu_offset_addr_s;
-
-	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
-};
-
-/*
- * RDMA
- */
-
-//DMA_CMN
-#define DMA_OFT_X0	(0x0000)
-#define DMA_OFT_Y0	(0x0004)
-#define DMA_OFT_X1	(0x0008)
-#define DMA_OFT_Y1	(0x000C)
-#define DMA_MASK0	(0x0010)
-#define DMA_MASK1	(0x0014)
-#define DMA_STRETCH_SIZE_VRT	(0x0018)
-#define DMA_CTRL	(0x001C)
-#define DMA_TILE_SCRAM	(0x0020)
-
-#define DMA_PULSE	(0x0028)
-#define DMA_CORE_GT	(0x002C)
-#define RWCH_CFG0	(0x0030)
-
-//WDMA_CMN
-#define WDMA_DMA_SW_MASK_EN	(0x004C)
-#define WDMA_DMA_START_MASK0	(0x0050)
-#define WDMA_DMA_END_MASK0	(0x0054)
-#define WDMA_DMA_START_MASK1	(0x0058)
-#define WDMA_DMA_END_MASK1	(0x005C)
-
-//Y
-#define DMA_DATA_ADDR0	(0x0060)
-#define DMA_STRIDE0	(0x0064)
-#define DMA_STRETCH_STRIDE0	(0x0068)
-#define DMA_DATA_NUM0	(0x006C)
-
-#define DMA_TEST0	(0x0070)
-#define DMA_TEST1	(0x0074)
-#define DMA_TEST3	(0x0078)
-#define DMA_TEST4	(0x007C)
-#define DMA_STATUS_Y	(0x0080)
-
-//U
-#define DMA_DATA_ADDR1	(0x0084)
-#define DMA_STRIDE1	(0x0088)
-#define DMA_STRETCH_STRIDE1	(0x008C)
-#define DMA_DATA_NUM1	(0x0090)
-
-#define DMA_TEST0_U	(0x0094)
-#define DMA_TEST1_U	(0x0098)
-#define DMA_TEST3_U	(0x009C)
-#define DMA_TEST4_U	(0x00A0)
-#define DMA_STATUS_U	(0x00A4)
-
-//V
-#define DMA_DATA_ADDR2	(0x00A8)
-#define DMA_STRIDE2	(0x00AC)
-#define DMA_STRETCH_STRIDE2	(0x00B0)
-#define DMA_DATA_NUM2	(0x00B4)
-
-#define DMA_TEST0_V	(0x00B8)
-#define DMA_TEST1_V	(0x00BC)
-#define DMA_TEST3_V	(0x00C0)
-#define DMA_TEST4_V	(0x00C4)
-#define DMA_STATUS_V	(0x00C8)
-
-//CH
-#define CH_RD_SHADOW	(0x00D0)
-#define CH_CTL	(0x00D4)
-#define CH_SECU_EN	(0x00D8)
-#define CH_SW_END_REQ	(0x00DC)
-#define CH_CLK_SEL	(0x00E0)
-#define CH_CLK_EN	(0x00E4)
-
-/*
- * DFC
- */
-#define DFC_DISP_SIZE		(0x0000)
-#define DFC_PIX_IN_NUM		(0x0004)
+/* DFC */
 #define DFC_GLB_ALPHA01		(0x0008)
-#define DFC_DISP_FMT		(0x000C)
-#define DFC_CLIP_CTL_HRZ	(0x0010)
-#define DFC_CLIP_CTL_VRZ	(0x0014)
-#define DFC_CTL_CLIP_EN		(0x0018)
-#define DFC_ICG_MODULE		(0x001C)
-#define DFC_DITHER_ENABLE	(0x0020)
-#define DFC_PADDING_CTL		(0x0024)
 #define DFC_GLB_ALPHA23		(0x0028)
 #define DFC_BITEXT_CTL		(0x0040)
 #define DFC_DITHER_CTL1      (0x00D0)
 
-struct dss_dfc {
-	u32 disp_size;
-	u32 pix_in_num;
-	u32 disp_fmt;
-	u32 clip_ctl_hrz;
-	u32 clip_ctl_vrz;
-	u32 ctl_clip_en;
-	u32 icg_module;
-	u32 dither_enable;
-	u32 padding_ctl;
-	u32 bitext_ctl;
-};
-
-/*
- * SCF
- */
-#define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
-#define DSS_SCF_Y_COEF_OFFSET	(0x2000)
-#define DSS_SCF_UV_COEF_OFFSET	(0x2800)
-
-#define SCF_EN_HSCL_STR	(0x0000)
-#define SCF_EN_VSCL_STR	(0x0004)
-#define SCF_H_V_ORDER	(0x0008)
-#define SCF_SCF_CORE_GT	(0x000C)
-#define SCF_INPUT_WIDTH_HEIGHT	(0x0010)
-#define SCF_OUTPUT_WIDTH_HEIGHT	(0x0014)
-#define SCF_COEF_MEM_CTRL  (0x0018)
-#define SCF_EN_HSCL	(0x001C)
-#define SCF_EN_VSCL	(0x0020)
-#define SCF_ACC_HSCL	(0x0024)
-#define SCF_ACC_HSCL1	(0x0028)
-#define SCF_INC_HSCL	(0x0034)
-#define SCF_ACC_VSCL	(0x0038)
-#define SCF_ACC_VSCL1	(0x003C)
-#define SCF_INC_VSCL	(0x0048)
-#define SCF_EN_NONLINEAR	(0x004C)
-#define SCF_EN_MMP	(0x007C)
-#define SCF_DB_H0	(0x0080)
-#define SCF_DB_H1	(0x0084)
-#define SCF_DB_V0	(0x0088)
-#define SCF_DB_V1	(0x008C)
-#define SCF_LB_MEM_CTRL	(0x0090)
-#define SCF_RD_SHADOW	(0x00F0)
-#define SCF_CLK_SEL	(0x00F8)
-#define SCF_CLK_EN	(0x00FC)
-#define WCH_SCF_COEF_MEM_CTRL (0x0218)
-#define WCH_SCF_LB_MEM_CTRL	(0x290)
+/* SCF */
 
 /* MACROS */
 #define SCF_MIN_INPUT	(16) //SCF min input pix 16x16
 #define SCF_MIN_OUTPUT	(16) //SCF min output pix 16x16
 
-/* Threshold for SCF Stretch and SCF filter */
-#define RDMA_STRETCH_THRESHOLD	(2)
 #define SCF_INC_FACTOR	BIT(18) //(262144)
-#define SCF_UPSCALE_MAX	(60)
-#define SCF_DOWNSCALE_MAX	  (60)
-#define SCF_EDGE_FACTOR (3)
-#define ARSR2P_INC_FACTOR (65536)
 
-struct dss_scl {
-	u32 en_hscl_str;
-	u32 en_vscl_str;
-	u32 h_v_order;
-	u32 input_width_height;
-	u32 output_width_height;
-	u32 en_hscl;
-	u32 en_vscl;
-	u32 acc_hscl;
-	u32 inc_hscl;
-	u32 inc_vscl;
-	u32 en_mmp;
-	u32 scf_ch_core_gt;
-	u32 fmt;
-};
-
-enum scl_coef_lut_idx {
-	SCL_COEF_NONE_IDX = -1,
-	SCL_COEF_YUV_IDX = 0,
-	SCL_COEF_RGB_IDX = 1,
-	SCL_COEF_IDX_MAX = 2,
-};
-
-/*
- * ARSR2P ES  v0
- */
+/* ARSR2P ES  v0 */
 #define ARSR2P_INPUT_WIDTH_HEIGHT_ES	(0x000)
 #define ARSR2P_OUTPUT_WIDTH_HEIGHT_ES	(0x004)
 #define ARSR2P_IHLEFT_ES	(0x008)
@@ -1680,12 +237,7 @@ enum scl_coef_lut_idx {
 #define ARSR2P_LUT_COEFUV_V_OFFSET_ES	(0x0600)
 #define ARSR2P_LUT_COEFUV_H_OFFSET_ES	(0x0700)
 
-/*
- * ARSR2P  v0
- */
-#define ARSR2P_INPUT_WIDTH_HEIGHT (0x000)
-#define ARSR2P_OUTPUT_WIDTH_HEIGHT (0x004)
-#define ARSR2P_IHLEFT (0x008)
+/* ARSR2P  v0 */
 #define ARSR2P_IHLEFT1 (0x00C)
 #define ARSR2P_IHRIGHT (0x010)
 #define ARSR2P_IHRIGHT1 (0x014)
@@ -1725,17 +277,7 @@ enum scl_coef_lut_idx {
 #define ARSR2P_DEBUG3 (0x0E4)
 #define ARSR2P_LB_MEM_CTRL (0x0E8)
 
-#define ARSR2P_LUT_COEFY_V_OFFSET (0x0000)
-#define ARSR2P_LUT_COEFY_H_OFFSET (0x0100)
-#define ARSR2P_LUT_COEFA_V_OFFSET (0x0300)
-#define ARSR2P_LUT_COEFA_H_OFFSET (0x0400)
-#define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
-#define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
-
-/*
- * POST_CLIP  v g
- */
-#define POST_CLIP_DISP_SIZE			(0x0000)
+/* POST_CLIP  v g */
 #define POST_CLIP_CTL_HRZ			(0x0004)
 #define POST_CLIP_CTL_VRZ			(0x0008)
 #define POST_CLIP_EN				(0x000C)
@@ -1745,46 +287,8 @@ enum scl_coef_lut_idx {
 #define POST_CLIP_CTL_VRZ_ES		(0x0014)
 #define POST_CLIP_EN_ES			(0x0018)
 
-struct dss_post_clip {
-	u32 disp_size;
-	u32 clip_ctl_hrz;
-	u32 clip_ctl_vrz;
-	u32 ctl_clip_en;
-};
-
-/*
- * PCSC v
- */
-#define PCSC_IDC0	(0x0000)
-#define PCSC_IDC2	(0x0004)
-#define PCSC_ODC0	(0x0008)
-#define PCSC_ODC2	(0x000C)
-#define PCSC_P0	(0x0010)
-#define PCSC_P1	(0x0014)
-#define PCSC_P2	(0x0018)
-#define PCSC_P3	(0x001C)
-#define PCSC_P4	(0x0020)
-#define PCSC_ICG_MODULE	(0x0024)
-#define PCSC_MPREC	(0x0028)
-
-struct dss_pcsc {
-	u32 pcsc_idc0;
-};
-
-/*
- * CSC
- */
-#define CSC_IDC0			(0x0000)
-#define CSC_IDC2			(0x0004)
-#define CSC_ODC0			(0x0008)
-#define CSC_ODC2			(0x000C)
-#define CSC_P0				(0x0010)
-#define CSC_P1				(0x0014)
-#define CSC_P2				(0x0018)
-#define CSC_P3				(0x001C)
-#define CSC_P4				(0x0020)
+/* CSC */
 #define CSC_ICG_MODULE_ES	(0x0024)
-#define CSC_MPREC			(0x0028)
 #define CSC_P00				(0x0010)
 #define CSC_P01				(0x0014)
 #define CSC_P02				(0x0018)
@@ -1796,185 +300,36 @@ struct dss_pcsc {
 #define CSC_P22				(0x0030)
 #define CSC_ICG_MODULE		(0x0034)
 
-struct dss_csc {
-	u32 idc0;
-	u32 idc2;
-	u32 odc0;
-	u32 odc2;
-	u32 p0;
-	u32 p1;
-	u32 p2;
-	u32 p3;
-	u32 p4;
-	u32 icg_module_es;
-	u32 mprec;
-	u32 p00;
-	u32 p01;
-	u32 p02;
-	u32 p10;
-	u32 p11;
-	u32 p12;
-	u32 p20;
-	u32 p21;
-	u32 p22;
-	u32 icg_module;
-};
-
-/*
- * channel DEBUG
- */
-#define CH_DEBUG_SEL (0x600)
-
-/*
- * VPP
- */
-#define VPP_CTRL (0x700)
-#define VPP_MEM_CTRL (0x704)
-
-/*
- * DMA BUF
- */
-#define DMA_BUF_CTRL	(0x800)
-#define DMA_BUF_SIZE  (0x850)
-#define DMA_BUF_MEM_CTRL	(0x854)
-#define DMA_BUF_DBG0 (0x0838)
-#define DMA_BUF_DBG1 (0x083c)
-
-//AFBCD
-#define AFBCD_HREG_HDR_PTR_LO		(0x900)
-#define AFBCD_HREG_PIC_WIDTH			(0x904)
-#define AFBCD_HREG_PIC_HEIGHT			(0x90C)
-#define AFBCD_HREG_FORMAT				(0x910)
-#define AFBCD_CTL						(0x914)
-#define AFBCD_STR						(0x918)
-#define AFBCD_LINE_CROP				(0x91C)
-#define AFBCD_INPUT_HEADER_STRIDE	(0x920)
-#define AFBCD_PAYLOAD_STRIDE			(0x924)
-#define AFBCD_MM_BASE_0				(0x928)
-#define AFBCD_AFBCD_PAYLOAD_POINTER	(0x930)
-#define AFBCD_HEIGHT_BF_STR			(0x934)
-#define AFBCD_OS_CFG					(0x938)
-#define AFBCD_MEM_CTRL					(0x93C)
-#define AFBCD_SCRAMBLE_MODE			(0x940)
-#define AFBCD_HEADER_POINTER_OFFSET	(0x944)
-#define AFBCD_MONITOR_REG1_OFFSET	(0x948)
-#define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
-#define AFBCD_MONITOR_REG3_OFFSET	(0x950)
-#define AFBCD_DEBUG_REG0_OFFSET		(0x954)
-#define AFBCD_CREG_FBCD_CTRL_MODE	(0x960)
-#define AFBCD_HREG_HDR_PTR_L1		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1		(0x968)
-#define AFBCD_HEADER_SRTIDE_1		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
-#define AFBCD_HREG_HDR_PTR_L1		(0x964)
-#define AFBCD_HREG_PLD_PTR_L1		(0x968)
-#define AFBCD_HEADER_SRTIDE_1		(0x96C)
-#define AFBCD_PAYLOAD_SRTIDE_1		(0x970)
-#define AFBCD_BLOCK_TYPE				(0x974)
-#define AFBCD_MM_BASE_1				(0x978)
-#define AFBCD_MM_BASE_2				(0x97C)
-#define AFBCD_MM_BASE_3				(0x980)
-#define HFBCD_MEM_CTRL				(0x984)
-#define HFBCD_MEM_CTRL_1				(0x988)
-
 //AFBCE
-#define AFBCE_HREG_PIC_BLKS			(0x900)
-#define AFBCE_HREG_FORMAT				(0x904)
 #define AFBCE_HREG_HDR_PTR_L0		(0x908)
 #define AFBCE_HREG_PLD_PTR_L0		(0x90C)
-#define AFBCE_PICTURE_SIZE				(0x910)
-#define AFBCE_CTL						(0x914)
-#define AFBCE_HEADER_SRTIDE			(0x918)
-#define AFBCE_PAYLOAD_STRIDE			(0x91C)
-#define AFBCE_ENC_OS_CFG				(0x920)
-#define AFBCE_MEM_CTRL					(0x924)
-#define AFBCE_QOS_CFG					(0x928)
-#define AFBCE_THRESHOLD				(0x92C)
-#define AFBCE_SCRAMBLE_MODE			(0x930)
-#define AFBCE_HEADER_POINTER_OFFSET	(0x934)
-#define AFBCE_CREG_FBCE_CTRL_MODE	(0x950)
-#define AFBCE_HREG_HDR_PTR_L1		(0x954)
-#define AFBCE_HREG_PLD_PTR_L1		(0x958)
-#define AFBCE_HEADER_SRTIDE_1			(0x95C)
-#define AFBCE_PAYLOAD_SRTIDE_1		(0x960)
-#define AFBCE_MEM_CTRL_1				(0x968)
-#define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
 
 //ROT
-#define ROT_FIRST_LNS			(0x530)
-#define ROT_STATE				(0x534)
 #define ROT_MEM_CTRL_ES		(0x538)
 #define ROT_SIZE_ES			(0x53C)
-#define ROT_CPU_CTL0			(0x540)
-#define ROT_CPU_START0			(0x544)
-#define ROT_CPU_ADDR0			(0x548)
-#define ROT_CPU_RDATA0		(0x54C)
-#define ROT_CPU_RDATA1		(0x550)
-#define ROT_CPU_WDATA0		(0x554)
-#define ROT_CPU_WDATA1		(0x558)
-#define ROT_CPU_CTL1			(0x55C)
-#define ROT_CPU_START1			(0x560)
-#define ROT_CPU_ADDR1			(0x564)
-#define ROT_CPU_RDATA2		(0x568)
-#define ROT_CPU_RDATA3		(0x56C)
-#define ROT_CPU_WDATA2		(0x570)
-#define ROT_CPU_WDATA3		(0x574)
 
 #define ROT_MEM_CTRL			(0x588)
 #define ROT_SIZE				(0x58C)
 #define ROT_422_MODE			(0x590)
 
 //REG_DEFAULT
-#define CH_REG_DEFAULT (0x0A00)
 
 /* MACROS */
-#define MIN_INTERLEAVE	(7)
-#define MAX_TILE_SURPORT_NUM	(6)
 
 /* DMA aligned limited:  128bits aligned */
-#define DMA_ALIGN_BYTES	(128 / BITS_PER_BYTE)
-#define DMA_ADDR_ALIGN	(128 / BITS_PER_BYTE)
-#define DMA_STRIDE_ALIGN	(128 / BITS_PER_BYTE)
-
-#define TILE_DMA_ADDR_ALIGN	(256 * 1024)
-
-#define DMA_IN_WIDTH_MAX	(2048)
-#define DMA_IN_HEIGHT_MAX	(8192)
-
-#define AFBC_PIC_WIDTH_MIN	(16)
-#define AFBC_PIC_WIDTH_MAX	(8192)
-#define AFBC_PIC_HEIGHT_MIN	(16)
-#define AFBC_PIC_HEIGHT_MAX	(4096)
-
-#define AFBCD_TOP_CROP_MAX	(15)
-#define AFBCD_BOTTOM_CROP_MAX	(15)
 
 //16Bytes
-#define AFBC_HEADER_STRIDE_BLOCK	(16)
 //32BPP:1024, 16BPP 512
-#define AFBC_PAYLOAD_STRIDE_BLOCK	(1024)
 
-#define AFBC_SUPER_GRAPH_HEADER_ADDR_ALIGN	(128)
 #define AFBC_HEADER_ADDR_ALIGN	(16)
 #define AFBC_HEADER_STRIDE_ALIGN	(16)
 
-#define AFBC_PAYLOAD_ADDR_ALIGN_32	(1024)
-#define AFBC_PAYLOAD_STRIDE_ALIGN_32	(1024)
-#define AFBC_PAYLOAD_ADDR_ALIGN_16	(512)
-#define AFBC_PAYLOAD_STRIDE_ALIGN_16	(512)
-
 //16Pixels
-#define AFBC_BLOCK_ALIGN	(16)
-
-#define AFBCE_IN_WIDTH_MAX	(512)
-#define WROT_IN_WIDTH_MAX	(512)
 
 #define MMBUF_BASE	(0x40) //(0xea800000)
-#define MMBUF_LINE_NUM	(8)
 #define MMBUF_BLOCK0_LINE_NUM	(8)
 #define MMBUF_BLOCK0_ROT_LINE_NUM	(64)
 #define MMBUF_BLOCK1_LINE_NUM	(16)
-#define MMBUF_ADDR_ALIGN	(64)
 
 #define HFBC_PIC_WIDTH_MIN	(64)
 #define HFBC_PIC_WIDTH_ROT_MIN	(16)
@@ -1999,206 +354,8 @@ struct dss_csc {
 #define HFBCD_BLOCK0_ROT_CROP_MAX	(63)
 #define HFBCD_BLOCK1_CROP_MAX	(15)
 
-enum DSS_AFBC_HALF_BLOCK_MODE {
-	AFBC_HALF_BLOCK_UPPER_LOWER_ALL = 0,
-	AFBC_HALF_BLOCK_LOWER_UPPER_ALL,
-	AFBC_HALF_BLOCK_UPPER_ONLY,
-	AFBC_HALF_BLOCK_LOWER_ONLY,
-};
-
-struct dss_rdma {
-	u32 oft_x0;
-	u32 oft_y0;
-	u32 oft_x1;
-	u32 oft_y1;
-	u32 mask0;
-	u32 mask1;
-	u32 stretch_size_vrt;
-	u32 ctrl;
-	u32 tile_scram;
-
-	u32 data_addr0;
-	u32 stride0;
-	u32 stretch_stride0;
-	u32 data_num0;
-
-	u32 data_addr1;
-	u32 stride1;
-	u32 stretch_stride1;
-	u32 data_num1;
-
-	u32 data_addr2;
-	u32 stride2;
-	u32 stretch_stride2;
-	u32 data_num2;
-
-	u32 ch_rd_shadow;
-	u32 ch_ctl;
-
-	u32 dma_buf_ctrl;
-
-	u32 vpp_ctrl;
-	u32 vpp_mem_ctrl;
-
-	u32 afbcd_hreg_hdr_ptr_lo;
-	u32 afbcd_hreg_pic_width;
-	u32 afbcd_hreg_pic_height;
-	u32 afbcd_hreg_format;
-	u32 afbcd_ctl;
-	u32 afbcd_str;
-	u32 afbcd_line_crop;
-	u32 afbcd_input_header_stride;
-	u32 afbcd_payload_stride;
-	u32 afbcd_mm_base_0;
-	//uint32_t afbcd_mm_base_1;
-	u32 afbcd_afbcd_payload_pointer;
-	u32 afbcd_height_bf_str;
-	u32 afbcd_os_cfg;
-	u32 afbcd_mem_ctrl;
-	u32 afbcd_scramble_mode;
-	u32 afbcd_header_pointer_offset;
-
-	u32 hfbcd_hreg_hdr_ptr_l0;
-	u32 hfbcd_hreg_pic_width;
-	u32 hfbcd_hreg_pic_height;
-	u32 hfbcd_line_crop;
-	u32 hfbcd_input_header_stride0;
-	u32 hfbcd_payload_stride0;
-	u32 hfbcd_payload_pointer; //hfbcd_hreg_pld_ptr_l0;
-	u32 hfbcd_scramble_mode;
-	u32 hfbcd_creg_fbcd_ctrl_mode;
-	u32 hfbcd_hreg_hdr_ptr_l1;
-	u32 hfbcd_hreg_pld_ptr_l1;
-	u32 hfbcd_header_stride1;
-	u32 hfbcd_payload_stride1;
-	u32 hfbcd_block_type;
-	u32 hfbcd_mm_base0_y8;
-	u32 hfbcd_mm_base1_c8;
-	u32 hfbcd_mm_base2_y2;
-	u32 hfbcd_mm_base3_c2;
-
-	u8 vpp_used;
-	u8 afbc_used;
-	u8 hfbcd_used;
-};
-
-struct dss_wdma {
-	u32 oft_x0;
-	u32 oft_y0;
-	u32 oft_x1;
-	u32 oft_y1;
-
-	u32 mask0;
-	u32 mask1;
-	u32 stretch_size_vrt;
-	u32 ctrl;
-	u32 tile_scram;
-
-	u32 sw_mask_en;
-	u32 start_mask0;
-	u32 end_mask0;
-	u32 start_mask1;
-	u32 end_mask1;
-
-	u32 data_addr;
-	u32 stride0;
-	u32 data1_addr;
-	u32 stride1;
-
-	u32 stretch_stride;
-	u32 data_num;
-
-	u32 ch_rd_shadow;
-	u32 ch_ctl;
-	u32 ch_secu_en;
-	u32 ch_sw_end_req;
-
-	u32 dma_buf_ctrl;
-	u32 dma_buf_size;
-
-	u32 rot_size;
-
-	u32 afbce_hreg_pic_blks;
-	u32 afbce_hreg_format;
-	u32 afbce_hreg_hdr_ptr_l0;
-	u32 afbce_hreg_pld_ptr_l0;
-	u32 afbce_picture_size;
-	u32 afbce_ctl;
-	u32 afbce_header_srtide;
-	u32 afbce_payload_stride;
-	u32 afbce_enc_os_cfg;
-	u32 afbce_mem_ctrl;
-	u32 afbce_qos_cfg;
-	u32 afbce_threshold;
-	u32 afbce_scramble_mode;
-	u32 afbce_header_pointer_offset;
-
-	u32 hfbce_hreg_pic_blks;
-	u32 hfbce_hreg_hdr_ptr_l0;
-	u32 hfbce_hreg_pld_ptr_l0;
-	u32 hfbce_picture_size;
-	u32 hfbce_scramble_mode;
-	u32 hfbce_header_stride0;
-	u32 hfbce_payload_stride0;
-	u32 hfbce_header_pointer_offset;
-	u32 fbce_creg_fbce_ctrl_mode;
-	u32 hfbce_hreg_hdr_ptr_l1;
-	u32 hfbce_hreg_pld_ptr_l1;
-	u32 hfbce_header_stride1;
-	u32 hfbce_payload_stride1;
-
-	u8 afbc_used;
-	u8 hfbce_used;
-	u8 rot_used;
-};
-
-/*
- * MCTL  MUTEX0 1 2 3 4 5
- */
-#define MCTL_CTL_EN	(0x0000)
-#define MCTL_CTL_MUTEX	(0x0004)
-#define MCTL_CTL_MUTEX_STATUS	(0x0008)
-#define MCTL_CTL_MUTEX_ITF	(0x000C)
-#define MCTL_CTL_MUTEX_DBUF	(0x0010)
-#define MCTL_CTL_MUTEX_SCF	(0x0014)
-#define MCTL_CTL_MUTEX_OV	(0x0018)
-#define MCTL_CTL_MUTEX_WCH0	(0x0020)
-#define MCTL_CTL_MUTEX_WCH1	(0x0024)
-#define MCTL_CTL_MUTEX_WCH2	(0x0028)
-#define MCTL_CTL_MUTEX_RCH8	(0x002C)
-#define MCTL_CTL_MUTEX_RCH0	(0x0030)
-#define MCTL_CTL_MUTEX_RCH1	(0x0034)
-#define MCTL_CTL_MUTEX_RCH2	(0x0038)
-#define MCTL_CTL_MUTEX_RCH3	(0x003C)
-#define MCTL_CTL_MUTEX_RCH4	(0x0040)
-#define MCTL_CTL_MUTEX_RCH5	(0x0044)
-#define MCTL_CTL_MUTEX_RCH6	(0x0048)
-#define MCTL_CTL_MUTEX_RCH7	(0x004C)
-#define MCTL_CTL_TOP	(0x0050)
-#define MCTL_CTL_FLUSH_STATUS	(0x0054)
-#define MCTL_CTL_CLEAR	(0x0058)
-#define MCTL_CTL_CACK_TOUT	(0x0060)
-#define MCTL_CTL_MUTEX_TOUT	(0x0064)
-#define MCTL_CTL_STATUS	(0x0068)
-#define MCTL_CTL_INTEN	(0x006C)
-#define MCTL_CTL_SW_ST	(0x0070)
-#define MCTL_CTL_ST_SEL	(0x0074)
-#define MCTL_CTL_END_SEL	(0x0078)
-#define MCTL_CTL_CLK_SEL	(0x0080)
-#define MCTL_CTL_CLK_EN	(0x0084)
-#define MCTL_CTL_DBG	(0x00E0)
-
-/*
- * MCTL  SYS
- */
+/* MCTL  SYS */
 //SECU
-#define MCTL_CTL_SECU_CFG			(0x0000)
-#define MCTL_PAY_SECU_FLUSH_EN	(0x0018)
-#define MCTL_CTL_SECU_GATE0    (0x0080)
-#define MCTL_CTL_SECU_GATE1    (0x0084)
-#define MCTL_CTL_SECU_GATE2    (0x0088)
-#define MCTL_DSI0_SECU_CFG_EN  (0x00A0)
-#define MCTL_DSI1_SECU_CFG_EN  (0x00A4)
 #define MCTL_RCH0_SECU_GATE		(0x0080)
 #define MCTL_RCH1_SECU_GATE		(0x0084)
 #define MCTL_RCH2_SECU_GATE		(0x0088)
@@ -2215,449 +372,23 @@ struct dss_wdma {
 #define MCTL_DP_SECU_GATE			(0x00C8)
 #define MCTL_DSI_MUX_SECU_GATE	(0x00CC)
 //FLUSH EN
-#define MCTL_RCH0_FLUSH_EN	(0x0100)
-#define MCTL_RCH1_FLUSH_EN	(0x0104)
-#define MCTL_RCH2_FLUSH_EN	(0x0108)
-#define MCTL_RCH3_FLUSH_EN	(0x010C)
-#define MCTL_RCH4_FLUSH_EN	(0x0110)
-#define MCTL_RCH5_FLUSH_EN	(0x0114)
-#define MCTL_RCH6_FLUSH_EN	(0x0118)
-#define MCTL_RCH7_FLUSH_EN	(0x011C)
-#define MCTL_WCH0_FLUSH_EN	(0x0120)
-#define MCTL_WCH1_FLUSH_EN	(0x0124)
-#define MCTL_OV0_FLUSH_EN	(0x0128)
-#define MCTL_OV1_FLUSH_EN	(0x012C)
-#define MCTL_OV2_FLUSH_EN	(0x0130)
-#define MCTL_OV3_FLUSH_EN	(0x0134)
-#define MCTL_RCH8_FLUSH_EN	(0x0138)
-#define MCTL_WCH2_FLUSH_EN	(0x013C)
 //SW FOR RCH
-#define MCTL_RCH0_OV_OEN	(0x0160)
-#define MCTL_RCH1_OV_OEN	(0x0164)
-#define MCTL_RCH2_OV_OEN	(0x0168)
-#define MCTL_RCH3_OV_OEN	(0x016C)
-#define MCTL_RCH4_OV_OEN	(0x0170)
-#define MCTL_RCH5_OV_OEN	(0x0174)
-#define MCTL_RCH6_OV_OEN	(0x0178)
-#define MCTL_RCH7_OV_OEN	(0x017C)
 #define MCTL_RCH8_OV_OEN	(0x015C)
 //SW FOR OV
-#define MCTL_RCH_OV0_SEL	(0x0180)
-#define MCTL_RCH_OV1_SEL	(0x0184)
-#define MCTL_RCH_OV2_SEL	(0x0188)
-#define MCTL_RCH_OV3_SEL	(0x018C)
 #define MCTL_RCH_OV0_SEL1  (0x0190)
 #define MCTL_RCH_OV1_SEL1  (0x0194)
 #define MCTL_RCH_OV2_SEL1  (0x0198)
 //SW FOR WCH
-#define MCTL_WCH0_OV_IEN   (0x01A0)
-#define MCTL_WCH1_OV_IEN   (0x01A4)
 //SW FOR OV2/3 OUTPUT
-#define MCTL_WCH_OV2_SEL   (0x01A8)
-#define MCTL_WCH_OV3_SEL   (0x01AC)
 //SW
-#define MCTL_WB_ENC_SEL	(0x01B0)
-#define MCTL_DSI_MUX_SEL	(0x01B4)
 //RCH STARTY
-#define MCTL_RCH0_STARTY	(0x01C0)
-#define MCTL_RCH1_STARTY	(0x01C4)
-#define MCTL_RCH2_STARTY	(0x01C8)
-#define MCTL_RCH3_STARTY	(0x01CC)
-#define MCTL_RCH4_STARTY	(0x01D0)
-#define MCTL_RCH5_STARTY	(0x01D4)
-#define MCTL_RCH6_STARTY	(0x01D8)
-#define MCTL_RCH7_STARTY	(0x01DC)
 #define MCTL_RCH8_STARTY	(0x01E0)
 //LP
-#define MCTL_MCTL_CLK_SEL	(0x01F0)
-#define MCTL_MCTL_CLK_EN	(0x01F4)
-#define MCTL_MOD_CLK_SEL	(0x01F8)
-#define MCTL_MOD_CLK_EN	(0x01FC)
-
-#define MCTL_MOD0_DBG	(0x0200)
-#define MCTL_MOD1_DBG	(0x0204)
-#define MCTL_MOD2_DBG	(0x0208)
-#define MCTL_MOD3_DBG	(0x020C)
-#define MCTL_MOD4_DBG	(0x0210)
-#define MCTL_MOD5_DBG	(0x0214)
-#define MCTL_MOD6_DBG	(0x0218)
-#define MCTL_MOD7_DBG	(0x021C)
-#define MCTL_MOD8_DBG	(0x0220)
-#define MCTL_MOD9_DBG	(0x0224)
-#define MCTL_MOD10_DBG	(0x0228)
-#define MCTL_MOD11_DBG	(0x022C)
-#define MCTL_MOD12_DBG	(0x0230)
-#define MCTL_MOD13_DBG	(0x0234)
-#define MCTL_MOD14_DBG	(0x0238)
-#define MCTL_MOD15_DBG	(0x023C)
-#define MCTL_MOD16_DBG	(0x0240)
-#define MCTL_MOD17_DBG	(0x0244)
-#define MCTL_MOD18_DBG	(0x0248)
-#define MCTL_MOD19_DBG	(0x024C)
-#define MCTL_MOD20_DBG	(0x0250)
-#define MCTL_MOD0_STATUS	(0x0280)
-#define MCTL_MOD1_STATUS	(0x0284)
-#define MCTL_MOD2_STATUS	(0x0288)
-#define MCTL_MOD3_STATUS	(0x028C)
-#define MCTL_MOD4_STATUS	(0x0290)
-#define MCTL_MOD5_STATUS	(0x0294)
-#define MCTL_MOD6_STATUS	(0x0298)
-#define MCTL_MOD7_STATUS	(0x029C)
-#define MCTL_MOD8_STATUS	(0x02A0)
-#define MCTL_MOD9_STATUS	(0x02A4)
-#define MCTL_MOD10_STATUS	(0x02A8)
-#define MCTL_MOD11_STATUS	(0x02AC)
-#define MCTL_MOD12_STATUS	(0x02B0)
-#define MCTL_MOD13_STATUS	(0x02B4)
-#define MCTL_MOD14_STATUS	(0x02B8)
-#define MCTL_MOD15_STATUS	(0x02BC)
-#define MCTL_MOD16_STATUS	(0x02C0)
-#define MCTL_MOD17_STATUS	(0x02C4)
-#define MCTL_MOD18_STATUS	(0x02C8)
-#define MCTL_MOD19_STATUS	(0x02CC)
-#define MCTL_MOD20_STATUS	(0x02D0)
-#define MCTL_SW_DBG	(0x0300)
-#define MCTL_SW0_STATUS0	(0x0304)
-#define MCTL_SW0_STATUS1	(0x0308)
-#define MCTL_SW0_STATUS2	(0x030C)
-#define MCTL_SW0_STATUS3	(0x0310)
-#define MCTL_SW0_STATUS4	(0x0314)
-#define MCTL_SW0_STATUS5	(0x0318)
-#define MCTL_SW0_STATUS6	(0x031C)
-#define MCTL_SW0_STATUS7	(0x0320)
-#define MCTL_SW1_STATUS	(0x0324)
 
 //RCH
-#define MCTL_MOD_DBG_CH_NUM (10)
-#define MCTL_MOD_DBG_OV_NUM (4)
-#define MCTL_MOD_DBG_DBUF_NUM (2)
-#define MCTL_MOD_DBG_SCF_NUM (1)
-#define MCTL_MOD_DBG_ITF_NUM (2)
 #define MCTL_MOD_DBG_ADD_CH_NUM (2)  // copybit
 
-enum dss_mctl_idx {
-	DSS_MCTL0 = 0,
-	DSS_MCTL1,
-	DSS_MCTL2,
-	DSS_MCTL3,
-	DSS_MCTL4,
-	DSS_MCTL5,
-	DSS_MCTL_IDX_MAX,
-};
-
-struct dss_mctl {
-	u32 ctl_mutex_itf;
-	u32 ctl_mutex_dbuf;
-	u32 ctl_mutex_scf;
-	u32 ctl_mutex_ov;
-};
-
-struct dss_mctl_ch {
-	u32 chn_mutex;
-	u32 chn_flush_en;
-	u32 chn_ov_oen;
-	u32 chn_starty;
-	u32 chn_mod_dbg;
-};
-
-struct dss_mctl_sys {
-	u32 ov_flush_en[DSS_OVL_IDX_MAX];
-	u32 chn_ov_sel[DSS_OVL_IDX_MAX];
-	u32 chn_ov_sel1[DSS_OVL_IDX_MAX];
-	u32 wchn_ov_sel[DSS_WCH_MAX];
-	u8 ov_flush_en_used[DSS_OVL_IDX_MAX];
-	u8 chn_ov_sel_used[DSS_OVL_IDX_MAX];
-	u8 wch_ov_sel_used[DSS_WCH_MAX];
-};
-
-/*
- * OVL ES
- */
-#define OVL_SIZE	(0x0000)
-#define OVL_BG_COLOR	(0x4)
-#define OVL_DST_STARTPOS	(0x8)
-#define OVL_DST_ENDPOS	(0xC)
-#define OVL_GCFG	(0x10)
-#define OVL_LAYER0_POS	(0x14)
-#define OVL_LAYER0_SIZE	(0x18)
-#define OVL_LAYER0_SRCLOKEY	(0x1C)
-#define OVL_LAYER0_SRCHIKEY	(0x20)
-#define OVL_LAYER0_DSTLOKEY	(0x24)
-#define OVL_LAYER0_DSTHIKEY	(0x28)
-#define OVL_LAYER0_PATTERN	(0x2C)
-#define OVL_LAYER0_ALPHA	(0x30)
-#define OVL_LAYER0_CFG	(0x34)
-#define OVL_LAYER0_INFO_ALPHA	(0x40)
-#define OVL_LAYER0_INFO_SRCCOLOR	(0x44)
-#define OVL_LAYER1_POS	(0x50)
-#define OVL_LAYER1_SIZE	(0x54)
-#define OVL_LAYER1_SRCLOKEY	(0x58)
-#define OVL_LAYER1_SRCHIKEY	(0x5C)
-#define OVL_LAYER1_DSTLOKEY	(0x60)
-#define OVL_LAYER1_DSTHIKEY	(0x64)
-#define OVL_LAYER1_PATTERN	(0x68)
-#define OVL_LAYER1_ALPHA	(0x6C)
-#define OVL_LAYER1_CFG	(0x70)
-#define OVL_LAYER1_INFO_ALPHA	(0x7C)
-#define OVL_LAYER1_INFO_SRCCOLOR	(0x80)
-#define OVL_LAYER2_POS	(0x8C)
-#define OVL_LAYER2_SIZE	(0x90)
-#define OVL_LAYER2_SRCLOKEY	(0x94)
-#define OVL_LAYER2_SRCHIKEY	(0x98)
-#define OVL_LAYER2_DSTLOKEY	(0x9C)
-#define OVL_LAYER2_DSTHIKEY	(0xA0)
-#define OVL_LAYER2_PATTERN	(0xA4)
-#define OVL_LAYER2_ALPHA	(0xA8)
-#define OVL_LAYER2_CFG	(0xAC)
-#define OVL_LAYER2_INFO_ALPHA	(0xB8)
-#define OVL_LAYER2_INFO_SRCCOLOR	(0xBC)
-#define OVL_LAYER3_POS	(0xC8)
-#define OVL_LAYER3_SIZE	(0xCC)
-#define OVL_LAYER3_SRCLOKEY	(0xD0)
-#define OVL_LAYER3_SRCHIKEY	(0xD4)
-#define OVL_LAYER3_DSTLOKEY	(0xD8)
-#define OVL_LAYER3_DSTHIKEY	(0xDC)
-#define OVL_LAYER3_PATTERN	(0xE0)
-#define OVL_LAYER3_ALPHA	(0xE4)
-#define OVL_LAYER3_CFG	(0xE8)
-#define OVL_LAYER3_INFO_ALPHA	(0xF4)
-#define OVL_LAYER3_INFO_SRCCOLOR	(0xF8)
-#define OVL_LAYER4_POS	(0x104)
-#define OVL_LAYER4_SIZE	(0x108)
-#define OVL_LAYER4_SRCLOKEY	(0x10C)
-#define OVL_LAYER4_SRCHIKEY	(0x110)
-#define OVL_LAYER4_DSTLOKEY	(0x114)
-#define OVL_LAYER4_DSTHIKEY	(0x118)
-#define OVL_LAYER4_PATTERN	(0x11C)
-#define OVL_LAYER4_ALPHA	(0x120)
-#define OVL_LAYER4_CFG	(0x124)
-#define OVL_LAYER4_INFO_ALPHA	(0x130)
-#define OVL_LAYER4_INFO_SRCCOLOR	(0x134)
-#define OVL_LAYER5_POS	(0x140)
-#define OVL_LAYER5_SIZE	(0x144)
-#define OVL_LAYER5_SRCLOKEY	(0x148)
-#define OVL_LAYER5_SRCHIKEY	(0x14C)
-#define OVL_LAYER5_DSTLOKEY	(0x150)
-#define OVL_LAYER5_DSTHIKEY	(0x154)
-#define OVL_LAYER5_PATTERN	(0x158)
-#define OVL_LAYER5_ALPHA	(0x15C)
-#define OVL_LAYER5_CFG	(0x160)
-#define OVL_LAYER5_INFO_ALPHA	(0x16C)
-#define OVL_LAYER5_INFO_SRCCOLOR	(0x170)
-#define OVL_LAYER6_POS	(0x14)
-#define OVL_LAYER6_SIZE	(0x18)
-#define OVL_LAYER6_SRCLOKEY	(0x1C)
-#define OVL_LAYER6_SRCHIKEY	(0x20)
-#define OVL_LAYER6_DSTLOKEY	(0x24)
-#define OVL_LAYER6_DSTHIKEY	(0x28)
-#define OVL_LAYER6_PATTERN	(0x2C)
-#define OVL_LAYER6_ALPHA	(0x30)
-#define OVL_LAYER6_CFG	(0x34)
-#define OVL_LAYER6_INFO_ALPHA	(0x40)
-#define OVL_LAYER6_INFO_SRCCOLOR	(0x44)
-#define OVL_LAYER7_POS	(0x50)
-#define OVL_LAYER7_SIZE	(0x54)
-#define OVL_LAYER7_SRCLOKEY	(0x58)
-#define OVL_LAYER7_SRCHIKEY	(0x5C)
-#define OVL_LAYER7_DSTLOKEY	(0x60)
-#define OVL_LAYER7_DSTHIKEY	(0x64)
-#define OVL_LAYER7_PATTERN	(0x68)
-#define OVL_LAYER7_ALPHA	(0x6C)
-#define OVL_LAYER7_CFG	(0x70)
-#define OVL_LAYER7_INFO_ALPHA	(0x7C)
-#define OVL_LAYER7_INFO_SRCCOLOR	(0x80)
-#define OVL_LAYER0_ST_INFO	(0x48)
-#define OVL_LAYER1_ST_INFO	(0x84)
-#define OVL_LAYER2_ST_INFO	(0xC0)
-#define OVL_LAYER3_ST_INFO	(0xFC)
-#define OVL_LAYER4_ST_INFO	(0x138)
-#define OVL_LAYER5_ST_INFO	(0x174)
-#define OVL_LAYER6_ST_INFO	(0x48)
-#define OVL_LAYER7_ST_INFO	(0x84)
-#define OVL_LAYER0_IST_INFO	(0x4C)
-#define OVL_LAYER1_IST_INFO	(0x88)
-#define OVL_LAYER2_IST_INFO	(0xC4)
-#define OVL_LAYER3_IST_INFO	(0x100)
-#define OVL_LAYER4_IST_INFO	(0x13C)
-#define OVL_LAYER5_IST_INFO	(0x178)
-#define OVL_LAYER6_IST_INFO	(0x4C)
-#define OVL_LAYER7_IST_INFO	(0x88)
-#define OVL_LAYER0_PSPOS	(0x38)
-#define OVL_LAYER0_PEPOS	(0x3C)
-#define OVL_LAYER1_PSPOS	(0x74)
-#define OVL_LAYER1_PEPOS	(0x78)
-#define OVL_LAYER2_PSPOS	(0xB0)
-#define OVL_LAYER2_PEPOS	(0xB4)
-#define OVL_LAYER3_PSPOS	(0xEC)
-#define OVL_LAYER3_PEPOS	(0xF0)
-#define OVL_LAYER4_PSPOS	(0x128)
-#define OVL_LAYER4_PEPOS	(0x12C)
-#define OVL_LAYER5_PSPOS	(0x164)
-#define OVL_LAYER5_PEPOS	(0x168)
-#define OVL_LAYER6_PSPOS	(0x38)
-#define OVL_LAYER6_PEPOS	(0x3C)
-#define OVL_LAYER7_PSPOS	(0x74)
-#define OVL_LAYER7_PEPOS	(0x78)
-
-#define OVL6_BASE_ST_INFO	(0x17C)
-#define OVL6_BASE_IST_INFO	(0x180)
-#define OVL6_GATE_CTRL	(0x184)
-#define OVL6_RD_SHADOW_SEL	(0x188)
-#define OVL6_OV_CLK_SEL	(0x18C)
-#define OVL6_OV_CLK_EN	(0x190)
-#define OVL6_BLOCK_SIZE	(0x1A0)
-#define OVL6_BLOCK_DBG	(0x1A4)
-#define OVL6_REG_DEFAULT (0x1A8)
-
-#define OVL2_BASE_ST_INFO	(0x8C)
-#define OVL2_BASE_IST_INFO	(0x90)
-#define OVL2_GATE_CTRL	(0x94)
-#define OVL2_OV_RD_SHADOW_SEL	(0x98)
-#define OVL2_OV_CLK_SEL	(0x9C)
-#define OVL2_OV_CLK_EN	(0xA0)
-#define OVL2_BLOCK_SIZE	(0xB0)
-#define OVL2_BLOCK_DBG	(0xB4)
-#define OVL2_REG_DEFAULT	(0xB8)
-
-/* LAYER0_CFG */
-#define BIT_OVL_LAYER_SRC_CFG	BIT(8)
-#define BIT_OVL_LAYER_ENABLE	BIT(0)
-
-/* LAYER0_INFO_ALPHA */
-#define BIT_OVL_LAYER_SRCALPHA_FLAG	BIT(3)
-#define BIT_OVL_LAYER_DSTALPHA_FLAG	BIT(2)
-
-/* LAYER0_INFO_SRCCOLOR */
-#define BIT_OVL_LAYER_SRCCOLOR_FLAG	BIT(0)
-
-#define OVL_6LAYER_NUM		(6)
-#define OVL_2LAYER_NUM		(2)
-
-/*
- * OVL
- */
-#define OV_SIZE						(0x000)
-#define OV_BG_COLOR_RGB			(0x004)
-#define OV_BG_COLOR_A				(0x008)
-#define OV_DST_STARTPOS			(0x00C)
-#define OV_DST_ENDPOS				(0x010)
-#define OV_GCFG					(0x014)
-#define OV_LAYER0_POS				(0x030)
-#define OV_LAYER0_SIZE				(0x034)
-#define OV_LAYER0_SRCLOKEY		(0x038)
-#define OV_LAYER0_SRCHIKEY		(0x03C)
-#define OV_LAYER0_DSTLOKEY		(0x040)
-#define OV_LAYER0_DSTHIKEY		(0x044)
-#define OV_LAYER0_PATTERN_RGB	(0x048)
-#define OV_LAYER0_PATTERN_A		(0x04C)
-#define OV_LAYER0_ALPHA_MODE		(0x050)
-#define OV_LAYER0_ALPHA_A			(0x054)
-#define OV_LAYER0_CFG				(0x058)
-#define OV_LAYER0_PSPOS			(0x05C)
-#define OV_LAYER0_PEPOS			(0x060)
-#define OV_LAYER0_INFO_ALPHA		(0x064)
-#define OV_LAYER0_INFO_SRCCOLOR	(0x068)
-#define OV_LAYER0_DBG_INFO		(0x06C)
-#define OV8_BASE_DBG_INFO			(0x340)
-#define OV8_RD_SHADOW_SEL			(0x344)
-#define OV8_CLK_SEL					(0x348)
-#define OV8_CLK_EN					(0x34C)
-#define OV8_BLOCK_SIZE				(0x350)
-#define OV8_BLOCK_DBG				(0x354)
-#define OV8_REG_DEFAULT			(0x358)
-#define OV2_BASE_DBG_INFO			(0x200)
-#define OV2_RD_SHADOW_SEL			(0x204)
-#define OV2_CLK_SEL					(0x208)
-#define OV2_CLK_EN					(0x20C)
-#define OV2_BLOCK_SIZE				(0x210)
-#define OV2_BLOCK_DBG				(0x214)
-#define OV2_REG_DEFAULT			(0x218)
-
-#define OV_8LAYER_NUM				(8)
-
-struct dss_ovl_layer {
-	u32 layer_pos;
-	u32 layer_size;
-	u32 layer_pattern;
-	u32 layer_pattern_alpha;
-	u32 layer_alpha_a;
-	u32 layer_alpha;
-	u32 layer_cfg;
-};
-
-struct dss_ovl_layer_pos {
-	u32 layer_pspos;
-	u32 layer_pepos;
-};
-
-struct dss_ovl {
-	u32 ovl_size;
-	u32 ovl_bg_color;
-	u32 ovl_bg_color_alpha;
-	u32 ovl_dst_startpos;
-	u32 ovl_dst_endpos;
-	u32 ovl_gcfg;
-	u32 ovl_block_size;
-	struct dss_ovl_layer ovl_layer[OV_8LAYER_NUM];
-	struct dss_ovl_layer_pos ovl_layer_pos[OV_8LAYER_NUM];
-	u8 ovl_layer_used[OV_8LAYER_NUM];
-};
-
-struct dss_ovl_alpha {
-	u32 src_amode;
-	u32 src_gmode;
-	u32 alpha_offsrc;
-	u32 src_lmode;
-	u32 src_pmode;
-
-	u32 alpha_smode;
-
-	u32 dst_amode;
-	u32 dst_gmode;
-	u32 alpha_offdst;
-	u32 dst_pmode;
-
-	u32 fix_mode;
-};
-
-/*
- * DBUF
- */
-#define DBUF_FRM_SIZE	(0x0000)
-#define DBUF_FRM_HSIZE	(0x0004)
-#define DBUF_SRAM_VALID_NUM	(0x0008)
-#define DBUF_WBE_EN	(0x000C)
-#define DBUF_THD_FILL_LEV0	(0x0010)
-#define DBUF_DFS_FILL_LEV1	(0x0014)
-#define DBUF_THD_RQOS	(0x0018)
-#define DBUF_THD_WQOS	(0x001C)
-#define DBUF_THD_CG	(0x0020)
-#define DBUF_THD_OTHER	(0x0024)
-#define DBUF_FILL_LEV0_CNT	(0x0028)
-#define DBUF_FILL_LEV1_CNT	(0x002C)
-#define DBUF_FILL_LEV2_CNT	(0x0030)
-#define DBUF_FILL_LEV3_CNT	(0x0034)
-#define DBUF_FILL_LEV4_CNT	(0x0038)
-#define DBUF_ONLINE_FILL_LEVEL	(0x003C)
-#define DBUF_WB_FILL_LEVEL	(0x0040)
-#define DBUF_DFS_STATUS	(0x0044)
-#define DBUF_THD_FLUX_REQ_BEF	(0x0048)
-#define DBUF_DFS_LP_CTRL	(0x004C)
-#define DBUF_RD_SHADOW_SEL	(0x0050)
-#define DBUF_MEM_CTRL	(0x0054)
-#define DBUF_PM_CTRL	(0x0058)
-#define DBUF_CLK_SEL	(0x005C)
-#define DBUF_CLK_EN	(0x0060)
-#define DBUF_THD_FLUX_REQ_AFT (0x0064)
-#define DBUF_THD_DFS_OK (0x0068)
-#define DBUF_FLUX_REQ_CTRL (0x006C)
-#define DBUF_REG_DEFAULT  (0x00A4)
-#define DBUF_DFS_RAM_MANAGE  (0x00A8)
-#define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
-
-/*
- * SBL
- */
+/* SBL */
 //SBL FOR ES
 #define SBL_REG_FRMT_MODE_ES                          (0x0000)
 #define SBL_REG_FRMT_DBUF_CTRL_ES                     (0x0008)
@@ -2885,22 +616,6 @@ struct dss_ovl_alpha {
 #define SBL_CORE1_REG_OUT1_7_TO_0_ES                  (0x0e60)
 #define SBL_CORE1_REG_OUT1_15_TO_8_ES                 (0x0e64)
 
-struct dss_sbl {
-	int sbl_backlight_l;
-	int sbl_backlight_h;
-	int sbl_ambient_light_l;
-	int sbl_ambient_light_h;
-	int sbl_calibration_a_l;
-	int sbl_calibration_a_h;
-	int sbl_calibration_b_l;
-	int sbl_calibration_b_h;
-	int sbl_calibration_c_l;
-	int sbl_calibration_c_h;
-	int sbl_calibration_d_l;
-	int sbl_calibration_d_h;
-	int sbl_enable;
-};
-
 //SBL for 970
 #define SBL_REG_FRMT_MODE                                  (0x0000)
 #define SBL_REG_FRMT_FRAME_DIMEN                           (0x0004)
@@ -2990,45 +705,11 @@ struct dss_sbl {
 #define SBL_VC_ANTI_FLCKR_AL_ANTI_FLCKR_T_DURATION         (0x03a8)
 #define SBL_VC_ANTI_FLCKR_ALPHA                            (0x03ac)
 
-/*
- * DPP
- */
+/* DPP */
 //DPP TOP
-#define DPP_RD_SHADOW_SEL	(0x000)
-#define DPP_DEFAULT	(0x004)
-#define DPP_ID	(0x008)
-#define DPP_IMG_SIZE_BEF_SR	(0x00C)
-#define DPP_IMG_SIZE_AFT_SR	(0x010)
-#define DPP_SBL	(0x014)
-#define DPP_SBL_MEM_CTRL	(0x018)
 //#define DPP_ARSR1P_MEM_CTRL	(0x01C)
 #define DPP_ARSR_POST_MEM_CTRL	(0x01C)
-#define DPP_CLK_SEL	(0x020)
-#define DPP_CLK_EN	(0x024)
-#define DPP_DBG1_CNT	(0x028)
-#define DPP_DBG2_CNT	(0x02C)
-#define DPP_DBG1	(0x030)
-#define DPP_DBG2	(0x034)
-#define DPP_DBG3	(0x038)
-#define DPP_DBG4	(0x03C)
-#define DPP_INTS	(0x040)
-#define DPP_INT_MSK	(0x044)
 //#define DPP_ARSR1P	(0x048)
-#define DPP_DBG_CNT  DPP_DBG1_CNT
-
-//COLORBAR
-#define DPP_CLRBAR_CTRL (0x100)
-#define DPP_CLRBAR_1ST_CLR (0x104)
-#define DPP_CLRBAR_2ND_CLR (0x108)
-#define DPP_CLRBAR_3RD_CLR (0x10C)
-
-//DPP CLIP
-#define DPP_CLIP_TOP (0x180)
-#define DPP_CLIP_BOTTOM (0x184)
-#define DPP_CLIP_LEFT (0x188)
-#define DPP_CLIP_RIGHT (0x18C)
-#define DPP_CLIP_EN (0x190)
-#define DPP_CLIP_DBG (0x194)
 
 //DITHER
 #define DITHER_CTL1 (0x000)
@@ -3102,27 +783,8 @@ struct dss_sbl {
 #define DITHER_DBG2_ES (0x038)
 
 //CSC_RGB2YUV_10bits  CSC_YUV2RGB_10bits
-#define CSC10B_IDC0	(0x000)
-#define CSC10B_IDC1	(0x004)
-#define CSC10B_IDC2	(0x008)
-#define CSC10B_ODC0	(0x00C)
-#define CSC10B_ODC1	(0x010)
-#define CSC10B_ODC2	(0x014)
-#define CSC10B_P00	(0x018)
-#define CSC10B_P01	(0x01C)
-#define CSC10B_P02	(0x020)
-#define CSC10B_P10	(0x024)
-#define CSC10B_P11	(0x028)
-#define CSC10B_P12	(0x02C)
-#define CSC10B_P20	(0x030)
-#define CSC10B_P21	(0x034)
-#define CSC10B_P22	(0x038)
-#define CSC10B_MODULE_EN	(0x03C)
-#define CSC10B_MPREC	(0x040)
 
 //GAMA
-#define GAMA_EN	(0x000)
-#define GAMA_MEM_CTRL	(0x004)
 #define GAMA_LUT_SEL (0x008)
 #define GAMA_DBG0 (0x00C)
 #define GAMA_DBG1 (0x010)
@@ -3174,20 +836,6 @@ struct dss_sbl {
 #define ACM_DEBUG_W_ES       (0x0AC)
 
 //ACM
-#define ACM_EN	(0x000)
-#define ACM_SATA_OFFSET	(0x004)
-#define ACM_CSC_IDC0 (0x00C)
-#define ACM_CSC_IDC1 (0x010)
-#define ACM_CSC_IDC2 (0x014)
-#define ACM_CSC_P00 (0x018)
-#define ACM_CSC_P01 (0x01C)
-#define ACM_CSC_P02 (0x020)
-#define ACM_CSC_P10 (0x024)
-#define ACM_CSC_P11 (0x028)
-#define ACM_CSC_P12 (0x02C)
-#define ACM_CSC_P20 (0x030)
-#define ACM_CSC_P21 (0x034)
-#define ACM_CSC_P22 (0x038)
 #define ACM_HUE_RLH01 (0x040)
 #define ACM_HUE_RLH23 (0x044)
 #define ACM_HUE_RLH45 (0x048)
@@ -3204,8 +852,6 @@ struct dss_sbl {
 #define ACM_HUE_SMOOTH5 (0x084)
 #define ACM_HUE_SMOOTH6 (0x088)
 #define ACM_HUE_SMOOTH7 (0x08C)
-#define ACM_LUT_SEL (0x09C)
-#define ACM_MEM_CTRL (0x0A0)
 #define ACM_DBG_TOP (0x0A4)
 #define ACM_DBG_CFG (0x0A8)
 #define ACM_DBG_W (0x0AC)
@@ -3249,76 +895,10 @@ struct dss_sbl {
 #define ACM_CAPTURE_OUT (0x1B8)
 #define ACM_INK_CTRL (0x1C0)
 #define ACM_INK_OUT (0x1C4)
-//#define ACM_HUESEL	(0x008)
-//#define ACM_CSC_MRREC	(0x03C)
-//#define ACM_R0_H	(0x040)
-//#define ACM_R1_H	(0x044)
-//#define ACM_R2_H	(0x048)
-//#define ACM_R3_H	(0x04C)
-//#define ACM_R4_H	(0x050)
-//#define ACM_R5_H	(0x054)
-//#define ACM_R6_H	(0x058)
-//#define ACM_LUT_DIS0	(0x05C)
-//#define ACM_LUT_DIS1	(0x060)
-//#define ACM_LUT_DIS2	(0x064)
-//#define ACM_LUT_DIS3	(0x068)
-//#define ACM_LUT_DIS4	(0x06C)
-//#define ACM_LUT_DIS5	(0x070)
-//#define ACM_LUT_DIS6	(0x074)
-//#define ACM_LUT_DIS7	(0x078)
-//#define ACM_LUT_PARAM0	(0x07C)
-//#define ACM_LUT_PARAM1	(0x080)
-//#define ACM_LUT_PARAM2	(0x084)
-//#define ACM_LUT_PARAM3	(0x088)
-//#define ACM_LUT_PARAM4	(0x08C)
-//#define ACM_LUT_PARAM5	(0x090)
-//#define ACM_LUT_PARAM6	(0x094)
-//#define ACM_LUT_PARAM7	(0x098)
-//#define ACM_DEBUG_TOP	(0x0A4)
-//#define ACM_DEBUG_CFG	(0x0A8)
-//#define ACM_DEBUG_W	(0x0AC)
 
 //ACE FOR ES
-#define ACE_EN	(0x000)
-#define ACE_SKIN_CFG	(0x004)
-#define ACE_LUT_SEL	(0x008)
-#define ACE_HIST_IND	(0x00C)
-#define ACE_ACTIVE	(0x010)
-#define ACE_DBG	(0x014)
-#define ACE_MEM_CTRL	(0x018)
-#define ACE_IN_SEL	(0x01C)
-#define ACE_R2Y	(0x020)
-#define ACE_G2Y	(0x024)
-#define ACE_B2Y	(0x028)
-#define ACE_Y_OFFSET	(0x02C)
-#define ACE_Y_CEN	(0x030)
-#define ACE_U_CEN	(0x034)
-#define ACE_V_CEN	(0x038)
-#define ACE_Y_EXT	(0x03C)
-#define ACE_U_EXT	(0x040)
-#define ACE_V_EXT	(0x044)
-#define ACE_Y_ATTENU	(0x048)
-#define ACE_U_ATTENU	(0x04C)
-#define ACE_V_ATTENU	(0x050)
-#define ACE_ROTA	(0x054)
-#define ACE_ROTB	(0x058)
-#define ACE_Y_CORE	(0x05C)
-#define ACE_U_CORE	(0x060)
-#define ACE_V_CORE	(0x064)
 
 //LCP
-//#define LCP_XCC_COEF_00	(0x000)
-//#define LCP_XCC_COEF_01	(0x004)
-//#define LCP_XCC_COEF_02	(0x008)
-//#define LCP_XCC_COEF_03	(0x00C)
-//#define LCP_XCC_COEF_10	(0x010)
-//#define LCP_XCC_COEF_11	(0x014)
-//#define LCP_XCC_COEF_12	(0x018)
-//#define LCP_XCC_COEF_13	(0x01C)
-//#define LCP_XCC_COEF_20	(0x020)
-//#define LCP_XCC_COEF_21	(0x024)
-//#define LCP_XCC_COEF_22	(0x028)
-//#define LCP_XCC_COEF_23	(0x02C)
 #define LCP_GMP_BYPASS_EN_ES	(0x030)
 #define LCP_XCC_BYPASS_EN_ES	(0x034)
 #define LCP_DEGAMA_EN_ES	(0x038)
@@ -3393,65 +973,6 @@ struct dss_sbl {
 #define ARSR1P_FORCE_CLK_ON_CFG_ES	(0x084)
 
 //ARSR1P
-struct dss_arsr1p {
-	u32 ihleft;
-	u32 ihright;
-	u32 ihleft1;
-	u32 ihright1;
-	u32 ivtop;
-	u32 ivbottom;
-	u32 uv_offset;
-	u32 ihinc;
-	u32 ivinc;
-	u32 mode;
-	u32 format;
-
-	u32 skin_thres_y;
-	u32 skin_thres_u;
-	u32 skin_thres_v;
-	u32 skin_expected;
-	u32 skin_cfg;
-	u32 shoot_cfg1;
-	u32 shoot_cfg2;
-	u32 shoot_cfg3;
-	u32 sharp_cfg1_h;
-	u32 sharp_cfg1_l;
-	u32 sharp_cfg2_h;
-	u32 sharp_cfg2_l;
-	u32 sharp_cfg3;
-	u32 sharp_cfg4;
-	u32 sharp_cfg5;
-	u32 sharp_cfg6;
-	u32 sharp_cfg6_cut;
-	u32 sharp_cfg7;
-	u32 sharp_cfg7_ratio;
-	u32 sharp_cfg8;
-	u32 sharp_cfg9;
-	u32 sharp_cfg10;
-	u32 sharp_cfg11;
-	u32 diff_ctrl;
-	u32 skin_slop_y;
-	u32 skin_slop_u;
-	u32 skin_slop_v;
-	u32 force_clk_on_cfg;
-
-	u32 dbuf_frm_size;
-	u32 dbuf_frm_hsize;
-	u32 dbuf_used;
-
-	u32 dpp_img_size_bef_sr;
-	u32 dpp_img_size_aft_sr;
-	u32 dpp_used;
-
-	//for ES
-	u32 sharp_cfg1;
-	u32 sharp_cfg2;
-	u32 lsc_cfg1;
-	u32 lsc_cfg2;
-	u32 lsc_cfg3;
-};
-
-#define ARSR1P_INC_FACTOR (65536)
 
 #define ARSR_POST_IHLEFT (0x000)
 #define ARSR_POST_IHRIGHT (0x004)
@@ -3499,18 +1020,7 @@ struct dss_arsr1p {
 #define ARSR_POST_DEBUG_RO_1 (0x0AC)
 #define ARSR_POST_DEBUG_RO_2 (0x0B0)
 
-/*
- * BIT EXT
- */
-//#define BIT_EXT0_CTL (0x000)
-
-//GAMA LUT
-#define U_GAMA_R_COEF	(0x000)
-#define U_GAMA_G_COEF	(0x400)
-#define U_GAMA_B_COEF	(0x800)
-#define U_GAMA_R_LAST_COEF (0x200)
-#define U_GAMA_G_LAST_COEF (0x600)
-#define U_GAMA_B_LAST_COEF (0xA00)
+/* BIT EXT */
 
 //GAMA PRE LUT
 #define U_GAMA_PRE_R_COEF	(0x000)
@@ -3521,16 +1031,6 @@ struct dss_arsr1p {
 #define U_GAMA_PRE_B_LAST_COEF (0xA00)
 
 //ACM LUT
-#define ACM_U_H_COEF	(0x000)
-#define ACM_U_SATA_COEF	(0x200)
-#define ACM_U_SATR0_COEF	(0x300)
-#define ACM_U_SATR1_COEF	(0x340)
-#define ACM_U_SATR2_COEF	(0x380)
-#define ACM_U_SATR3_COEF	(0x3C0)
-#define ACM_U_SATR4_COEF	(0x400)
-#define ACM_U_SATR5_COEF	(0x440)
-#define ACM_U_SATR6_COEF	(0x480)
-#define ACM_U_SATR7_COEF	(0x4C0)
 #define ACM_U_ACM_SATR_FACE_COEF (0x500)
 #define ACM_U_ACM_LTA_COEF (0x580)
 #define ACM_U_ACM_LTR0_COEF (0x600)
@@ -3561,12 +1061,6 @@ struct dss_arsr1p {
 //LCP LUT
 #define GMP_U_GMP_COEF	(0x0000)
 
-//#define LCP_U_DEGAMA_R_COEF	(0x5000)
-//#define LCP_U_DEGAMA_G_COEF	(0x5400)
-//#define LCP_U_DEGAMA_B_COEF	(0x5800)
-//#define LCP_U_DEGAMA_R_LAST_COEF (0x5200)
-//#define LCP_U_DEGAMA_G_LAST_COEF (0x5600)
-//#define LCP_U_DEGAMA_B_LAST_COEF (0x5A00)
 #define U_DEGAMA_R_COEF	(0x0000)
 #define U_DEGAMA_G_COEF	(0x0400)
 #define U_DEGAMA_B_COEF	(0x0800)
@@ -3574,12 +1068,6 @@ struct dss_arsr1p {
 #define U_DEGAMA_G_LAST_COEF (0x0600)
 #define U_DEGAMA_B_LAST_COEF (0x0A00)
 
-//ACE LUT
-//#define ACE_HIST0	(0x000)
-//#define ACE_HIST1	(0x400)
-//#define ACE_LUT0	(0x800)
-//#define ACE_LUT1	(0xA00)
-
 //ARSR1P LUT for ES
 #define ARSR1P_LSC_GAIN_ES		(0x084)  //0xB07C+0x4*range27
 #define ARSR1P_COEFF_H_Y0_ES	(0x0F0)  //0xB0E8+0x4*range9
@@ -3601,44 +1089,6 @@ struct dss_arsr1p {
 #define ARSR_POST_COEFF_V_UV0	(0x1C8)  //0xB1C0+0x4*range9
 #define ARSR_POST_COEFF_V_UV1	(0x1EC)  //0xB1E4+0x4*range9
 
-#define HIACE_INT_STAT (0x0000)
-#define HIACE_INT_UNMASK (0x0004)
-#define HIACE_BYPASS_ACE (0x0008)
-#define HIACE_BYPASS_ACE_STAT (0x000c)
-#define HIACE_UPDATE_LOCAL (0x0010)
-#define HIACE_LOCAL_VALID (0x0014)
-#define HIACE_GAMMA_AB_SHADOW (0x0018)
-#define HIACE_GAMMA_AB_WORK (0x001c)
-#define HIACE_GLOBAL_HIST_AB_SHADOW (0x0020)
-#define HIACE_GLOBAL_HIST_AB_WORK (0x0024)
-#define HIACE_IMAGE_INFO (0x0030)
-#define HIACE_HALF_BLOCK_H_W (0x0034)
-#define HIACE_XYWEIGHT (0x0038)
-#define HIACE_LHIST_SFT (0x003c)
-#define HIACE_HUE (0x0050)
-#define HIACE_SATURATION (0x0054)
-#define HIACE_VALUE (0x0058)
-#define HIACE_SKIN_GAIN (0x005c)
-#define HIACE_UP_LOW_TH (0x0060)
-#define HIACE_UP_CNT (0x0070)
-#define HIACE_LOW_CNT (0x0074)
-#define HIACE_GLOBAL_HIST_LUT_ADDR (0x0080)
-#define HIACE_LHIST_EN (0x0100)
-#define HIACE_LOCAL_HIST_VxHy_2z_2z1 (0x0104)
-#define HIACE_GAMMA_EN (0x0108)
-#define HIACE_GAMMA_VxHy_3z2_3z1_3z_W (0x010c)
-#define HIACE_GAMMA_EN_HV_R (0x0110)
-#define HIACE_GAMMA_VxHy_3z2_3z1_3z_R (0x0114)
-#define HIACE_INIT_GAMMA (0x0120)
-#define HIACE_MANUAL_RELOAD (0x0124)
-#define HIACE_RAMCLK_FUNC (0x0128)
-#define HIACE_CLK_GATE (0x012c)
-#define HIACE_GAMMA_RAM_A_CFG_MEM_CTRL (0x0130)
-#define HIACE_GAMMA_RAM_B_CFG_MEM_CTRL (0x0134)
-#define HIACE_LHIST_RAM_CFG_MEM_CTRL (0x0138)
-#define HIACE_GAMMA_RAM_A_CFG_PM_CTRL (0x0140)
-#define HIACE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
-#define HIACE_LHIST_RAM_CFG_PM_CTRL (0x0148)
 //DPE
 #define DPE_INT_STAT (0x0000)
 #define DPE_INT_UNMASK (0x0004)
@@ -3725,295 +1175,23 @@ struct dss_arsr1p {
 #define DPE_NR_RAM_A_CFG_MEM_CTRL (0x0498)
 #define DPE_NR_RAM_A_CFG_PM_CTRL (0x049c)
 
-/*
- * IFBC
- */
-#define IFBC_SIZE	(0x0000)
-#define IFBC_CTRL	(0x0004)
-#define IFBC_HIMAX_CTRL0	(0x0008)
-#define IFBC_HIMAX_CTRL1	(0x000C)
-#define IFBC_HIMAX_CTRL2	(0x0010)
-#define IFBC_HIMAX_CTRL3	(0x0014)
-#define IFBC_EN	(0x0018)
-#define IFBC_MEM_CTRL	(0x001C)
-#define IFBC_INSERT	(0x0020)
-#define IFBC_HIMAX_TEST_MODE	(0x0024)
-#define IFBC_CORE_GT	(0x0028)
-#define IFBC_PM_CTRL	(0x002C)
-#define IFBC_RD_SHADOW	(0x0030)
-#define IFBC_ORISE_CTL	(0x0034)
-#define IFBC_ORSISE_DEBUG0	(0x0038)
-#define IFBC_ORSISE_DEBUG1	(0x003C)
-#define IFBC_RSP_COMP_TEST	(0x0040)
-#define IFBC_CLK_SEL	(0x044)
-#define IFBC_CLK_EN	(0x048)
-#define IFBC_PAD	(0x004C)
-#define IFBC_REG_DEFAULT	(0x0050)
+/* IFBC */
 
-/*
- * DSC
- */
-#define DSC_VERSION	(0x0000)
-#define DSC_PPS_IDENTIFIER	(0x0004)
-#define DSC_EN	(0x0008)
-#define DSC_CTRL	(0x000C)
-#define DSC_PIC_SIZE	(0x0010)
-#define DSC_SLICE_SIZE	(0x0014)
-#define DSC_CHUNK_SIZE	(0x0018)
-#define DSC_INITIAL_DELAY	(0x001C)
-#define DSC_RC_PARAM0	(0x0020)
-#define DSC_RC_PARAM1	(0x0024)
-#define DSC_RC_PARAM2	(0x0028)
-#define DSC_RC_PARAM3	(0x002C)
-#define DSC_FLATNESS_QP_TH	(0x0030)
-#define DSC_RC_PARAM4	(0x0034)
-#define DSC_RC_PARAM5	(0x0038)
-#define DSC_RC_BUF_THRESH0	(0x003C)
-#define DSC_RC_BUF_THRESH1	(0x0040)
-#define DSC_RC_BUF_THRESH2	(0x0044)
-#define DSC_RC_BUF_THRESH3	(0x0048)
-#define DSC_RC_RANGE_PARAM0	(0x004C)
-#define DSC_RC_RANGE_PARAM1	(0x0050)
-#define DSC_RC_RANGE_PARAM2	(0x0054)
-#define DSC_RC_RANGE_PARAM3	(0x0058)
-#define DSC_RC_RANGE_PARAM4	(0x005C)
-#define DSC_RC_RANGE_PARAM5	(0x0060)
-#define DSC_RC_RANGE_PARAM6	(0x0064)
-#define DSC_RC_RANGE_PARAM7	(0x0068)
-#define DSC_ADJUSTMENT_BITS	(0x006C)
-#define DSC_BITS_PER_GRP	(0x0070)
-#define DSC_MULTI_SLICE_CTL	(0x0074)
-#define DSC_OUT_CTRL	(0x0078)
-#define DSC_CLK_SEL	(0x007C)
-#define DSC_CLK_EN	(0x0080)
-#define DSC_MEM_CTRL	(0x0084)
-#define DSC_ST_DATAIN	(0x0088)
-#define DSC_ST_DATAOUT	(0x008C)
-#define DSC0_ST_SLC_POS	(0x0090)
-#define DSC1_ST_SLC_POS	(0x0094)
-#define DSC0_ST_PIC_POS	(0x0098)
-#define DSC1_ST_PIC_POS	(0x009C)
-#define DSC0_ST_FIFO	(0x00A0)
-#define DSC1_ST_FIFO	(0x00A4)
-#define DSC0_ST_LINEBUF	(0x00A8)
-#define DSC1_ST_LINEBUF	(0x00AC)
-#define DSC_ST_ITFC	(0x00B0)
-#define DSC_RD_SHADOW_SEL	(0x00B4)
-#define DSC_REG_DEFAULT	(0x00B8)
-
-/*
- * LDI
- */
-#define LDI_DPI0_HRZ_CTRL0	(0x0000)
-#define LDI_DPI0_HRZ_CTRL1	(0x0004)
-#define LDI_DPI0_HRZ_CTRL2	(0x0008)
-#define LDI_VRT_CTRL0	(0x000C)
-#define LDI_VRT_CTRL1	(0x0010)
-#define LDI_VRT_CTRL2	(0x0014)
-#define LDI_PLR_CTRL	(0x0018)
-#define LDI_SH_MASK_INT	(0x001C)
-#define LDI_3D_CTRL	(0x0020)
-#define LDI_CTRL	(0x0024)
-#define LDI_WORK_MODE	(0x0028)
-#define LDI_DE_SPACE_LOW	(0x002C)
-#define LDI_DSI_CMD_MOD_CTRL	(0x0030)
-#define LDI_DSI_TE_CTRL	(0x0034)
-#define LDI_DSI_TE_HS_NUM	(0x0038)
-#define LDI_DSI_TE_HS_WD	(0x003C)
-#define LDI_DSI_TE_VS_WD	(0x0040)
-#define LDI_FRM_MSK	(0x0044)
-#define LDI_FRM_MSK_UP	(0x0048)
-#define LDI_VINACT_MSK_LEN	(0x0050)
-#define LDI_VSTATE	(0x0054)
-#define LDI_DPI0_HSTATE	(0x0058)
-#define LDI_DPI1_HSTATE	(0x005C)
-#define LDI_CMD_EVENT_SEL	(0x0060)
-#define LDI_SRAM_LP_CTRL	(0x0064)
-#define LDI_ITF_RD_SHADOW	(0x006C)
+/* LDI */
 #define LDI_DP_DSI_SEL		(0x0080)
-#define LDI_DPI1_HRZ_CTRL0	(0x00F0)
-#define LDI_DPI1_HRZ_CTRL1	(0x00F4)
-#define LDI_DPI1_HRZ_CTRL2	(0x00F8)
-#define LDI_OVERLAP_SIZE	(0x00FC)
-#define LDI_MEM_CTRL	(0x0100)
-#define LDI_PM_CTRL	(0x0104)
-#define LDI_CLK_SEL	(0x0108)
-#define LDI_CLK_EN	(0x010C)
-#define LDI_IF_BYPASS	(0x0110)
-#define LDI_FRM_VALID_DBG (0x0118)
-/* LDI GLB*/
-#define LDI_PXL0_DIV2_GT_EN (0x0210)
-#define LDI_PXL0_DIV4_GT_EN (0x0214)
-#define LDI_PXL0_GT_EN (0x0218)
-#define LDI_PXL0_DSI_GT_EN (0x021C)
-#define LDI_PXL0_DIVXCFG (0x0220)
-#define LDI_DSI1_CLK_SEL (0x0224)
-#define LDI_VESA_CLK_SEL (0x0228)
-/* DSI1 RST*/
-#define LDI_DSI1_RST_SEL (0x0238)
-/* LDI INTERRUPT*/
-#define LDI_MCU_ITF_INTS (0x0240)
-#define LDI_MCU_ITF_INT_MSK (0x0244)
-#define LDI_CPU_ITF_INTS (0x0248)
-#define LDI_CPU_ITF_INT_MSK (0x024C)
-/* LDI MODULE CLOCK GATING*/
-#define LDI_MODULE_CLK_SEL (0x0258)
-#define LDI_MODULE_CLK_EN (0x025C)
 
-/*
- * MIPI DSI
- */
-#define MIPIDSI_VERSION_OFFSET	(0x0000)
-#define MIPIDSI_PWR_UP_OFFSET	(0x0004)
-#define MIPIDSI_CLKMGR_CFG_OFFSET	(0x0008)
-#define MIPIDSI_DPI_VCID_OFFSET	(0x000c)
-#define MIPIDSI_DPI_COLOR_CODING_OFFSET	(0x0010)
-#define MIPIDSI_DPI_CFG_POL_OFFSET	(0x0014)
-#define MIPIDSI_DPI_LP_CMD_TIM_OFFSET	(0x0018)
-#define MIPIDSI_PCKHDL_CFG_OFFSET	(0x002c)
-#define MIPIDSI_GEN_VCID_OFFSET	(0x0030)
-#define MIPIDSI_MODE_CFG_OFFSET	(0x0034)
-#define MIPIDSI_VID_MODE_CFG_OFFSET	(0x0038)
-#define MIPIDSI_VID_PKT_SIZE_OFFSET	(0x003c)
-#define MIPIDSI_VID_NUM_CHUNKS_OFFSET	(0x0040)
-#define MIPIDSI_VID_NULL_SIZE_OFFSET	(0x0044)
-#define MIPIDSI_VID_HSA_TIME_OFFSET	(0x0048)
-#define MIPIDSI_VID_HBP_TIME_OFFSET	(0x004c)
-#define MIPIDSI_VID_HLINE_TIME_OFFSET	(0x0050)
-#define MIPIDSI_VID_VSA_LINES_OFFSET	(0x0054)
-#define MIPIDSI_VID_VBP_LINES_OFFSET	(0x0058)
-#define MIPIDSI_VID_VFP_LINES_OFFSET	(0x005c)
-#define MIPIDSI_VID_VACTIVE_LINES_OFFSET	(0x0060)
-#define MIPIDSI_EDPI_CMD_SIZE_OFFSET	(0x0064)
-#define MIPIDSI_CMD_MODE_CFG_OFFSET	(0x0068)
-#define MIPIDSI_GEN_HDR_OFFSET	(0x006c)
-#define MIPIDSI_GEN_PLD_DATA_OFFSET	(0x0070)
-#define MIPIDSI_CMD_PKT_STATUS_OFFSET	(0x0074)
-#define MIPIDSI_TO_CNT_CFG_OFFSET	(0x0078)
-#define MIPIDSI_HS_RD_TO_CNT_OFFSET	(0x007C)
-#define MIPIDSI_LP_RD_TO_CNT_OFFSET	(0x0080)
-#define MIPIDSI_HS_WR_TO_CNT_OFFSET	(0x0084)
-#define MIPIDSI_LP_WR_TO_CNT_OFFSET	(0x0088)
-#define MIPIDSI_BTA_TO_CNT_OFFSET	(0x008C)
-#define MIPIDSI_SDF_3D_OFFSET	(0x0090)
-#define MIPIDSI_LPCLK_CTRL_OFFSET	(0x0094)
-#define MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET	(0x0098)
-#define MIPIDSI_PHY_TMR_CFG_OFFSET	(0x009c)
-#define MIPIDSI_PHY_RSTZ_OFFSET	(0x00a0)
-#define MIPIDSI_PHY_IF_CFG_OFFSET	(0x00a4)
-#define MIPIDSI_PHY_ULPS_CTRL_OFFSET	(0x00a8)
-#define MIPIDSI_PHY_TX_TRIGGERS_OFFSET	(0x00ac)
-#define MIPIDSI_PHY_STATUS_OFFSET	(0x00b0)
-#define MIPIDSI_PHY_TST_CTRL0_OFFSET	(0x00b4)
-#define MIPIDSI_PHY_TST_CTRL1_OFFSET	(0x00b8)
-#define MIPIDSI_PHY_TST_CLK_PRE_DELAY (0x00B0)
-#define MIPIDSI_PHY_TST_CLK_POST_DELAY (0x00B1)
-#define MIPIDSI_PHY_TST_CLK_TLPX (0x00B2)
-#define MIPIDSI_PHY_TST_CLK_PREPARE (0x00B3)
-#define MIPIDSI_PHY_TST_CLK_ZERO (0x00B4)
-#define MIPIDSI_PHY_TST_CLK_TRAIL (0x00B5)
-#define MIPIDSI_PHY_TST_DATA_PRE_DELAY (0x0070)
-#define MIPIDSI_PHY_TST_DATA_POST_DELAY (0x0071)
-#define MIPIDSI_PHY_TST_DATA_TLPX (0x0072)
-#define MIPIDSI_PHY_TST_DATA_PREPARE (0x0073)
-#define MIPIDSI_PHY_TST_DATA_ZERO (0x0074)
-#define MIPIDSI_PHY_TST_DATA_TRAIL (0x0075)
-#define MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY (0x0077)
+/* MIPI DSI */
 
-#define MIPIDSI_INT_ST0_OFFSET	(0x00bc)
-#define MIPIDSI_INT_ST1_OFFSET	(0x00c0)
-#define MIPIDSI_INT_MSK0_OFFSET	(0x00c4)
-#define MIPIDSI_INT_MSK1_OFFSET	(0x00c8)
-#define INT_FORCE0	(0x00D8)
-#define INT_FORCE1	(0x00DC)
 #define AUTO_ULPS_MODE	(0x00E0)
 #define AUTO_ULPS_ENTER_DELAY	(0x00E4)
 #define AUTO_ULPS_WAKEUP_TIME	(0x00E8)
-#define MIPIDSI_DSC_PARAMETER_OFFSET	(0x00F0)
-#define MIPIDSI_PHY_TMR_RD_CFG_OFFSET	(0x00F4)
 #define AUTO_ULPS_MIN_TIME  (0xF8)
 #define PHY_MODE (0xFC)
-#define VID_SHADOW_CTRL	(0x0100)
-#define DPI_VCID_ACT	(0x010C)
-#define DPI_COLOR_CODING_ACT	(0x0110)
-#define DPI_LP_CMD_TIM_ACT	(0x0118)
-#define VID_MODE_CFG_ACT	(0x0138)
-#define VID_PKT_SIZE_ACT	(0x013C)
-#define VID_NUM_CHUNKS_ACT	(0x0140)
-#define VID_NULL_SIZE_ACT	(0x0144)
-#define VID_HSA_TIME_ACT	(0x0148)
-#define VID_HBP_TIME_ACT	(0x014C)
-#define VID_HLINE_TIME_ACT	(0x0150)
-#define VID_VSA_LINES_ACT	(0x0154)
-#define VID_VBP_LINES_ACT	(0x0158)
-#define VID_VFP_LINES_ACT	(0x015C)
-#define VID_VACTIVE_LINES_ACT	(0x0160)
-#define SDF_3D_ACT	(0x0190)
 #define DSI_MEM_CTRL  (0x0194)
 #define DSI_PM_CTRL  (0x0198)
 #define DSI_DEBUG  (0x019C)
 
-/*
- * MMBUF
- */
-#define SMC_LOCK	(0x0000)
-#define SMC_MEM_LP	(0x0004)
-#define SMC_GCLK_CS	(0x000C)
-#define SMC_QOS_BACKDOOR	(0x0010)
-#define SMC_DFX_WCMD_CNT_1ST	(0x0014)
-#define SMC_DFX_WCMD_CNT_2ND	(0x0018)
-#define SMC_DFX_WCMD_CNT_3RD	(0x001C)
-#define SMC_DFX_WCMD_CNT_4TH	(0x0020)
-#define SMC_DFX_RCMD_CNT_1ST	(0x0024)
-#define SMC_DFX_RCMD_CNT_2ND	(0x0028)
-#define SMC_DFX_RCMD_CNT_3RD	(0x002C)
-#define SMC_DFX_RCMD_CNT_4TH	(0x0030)
-#define SMC_CS_IDLE	(0x0034)
-#define SMC_DFX_BFIFO_CNT0	(0x0038)
-#define SMC_DFX_RDFIFO_CNT1	(0x003C)
-#define SMC_SP_SRAM_STATE0	(0x0040)
-#define SMC_SP_SRAM_STATE1	(0x0044)
-
-enum hisi_fb_pixel_format {
-	HISI_FB_PIXEL_FORMAT_RGB_565 = 0,
-	HISI_FB_PIXEL_FORMAT_RGBX_4444,
-	HISI_FB_PIXEL_FORMAT_RGBA_4444,
-	HISI_FB_PIXEL_FORMAT_RGBX_5551,
-	HISI_FB_PIXEL_FORMAT_RGBA_5551,
-	HISI_FB_PIXEL_FORMAT_RGBX_8888,
-	HISI_FB_PIXEL_FORMAT_RGBA_8888,
-
-	HISI_FB_PIXEL_FORMAT_BGR_565,
-	HISI_FB_PIXEL_FORMAT_BGRX_4444,
-	HISI_FB_PIXEL_FORMAT_BGRA_4444,
-	HISI_FB_PIXEL_FORMAT_BGRX_5551,
-	HISI_FB_PIXEL_FORMAT_BGRA_5551,
-	HISI_FB_PIXEL_FORMAT_BGRX_8888,
-	HISI_FB_PIXEL_FORMAT_BGRA_8888,
-
-	HISI_FB_PIXEL_FORMAT_YUV_422_I,
-
-	/* YUV Semi-planar */
-	HISI_FB_PIXEL_FORMAT_YCbCr_422_SP,	/* NV16 */
-	HISI_FB_PIXEL_FORMAT_YCrCb_422_SP,
-	HISI_FB_PIXEL_FORMAT_YCbCr_420_SP,
-	HISI_FB_PIXEL_FORMAT_YCrCb_420_SP,	/* NV21 */
-
-	/* YUV Planar */
-	HISI_FB_PIXEL_FORMAT_YCbCr_422_P,
-	HISI_FB_PIXEL_FORMAT_YCrCb_422_P,
-	HISI_FB_PIXEL_FORMAT_YCbCr_420_P,
-	HISI_FB_PIXEL_FORMAT_YCrCb_420_P,	/* HISI_FB_PIXEL_FORMAT_YV12 */
-
-	/* YUV Package */
-	HISI_FB_PIXEL_FORMAT_YUYV_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_UYVY_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_YVYU_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_VYUY_422_Pkg,
-	HISI_FB_PIXEL_FORMAT_MAX,
-
-	HISI_FB_PIXEL_FORMAT_UNSUPPORT = 800
-};
+/* MMBUF */
 
 //MEDIA_CRG
 #define MEDIA_PEREN0	(0x000)
@@ -4030,190 +1208,4 @@ enum hisi_fb_pixel_format {
 #define PERRSTEN_GENERAL_SEC (0xA00)
 #define PERRSTDIS_GENERAL_SEC (0xA04)
 
-struct dss_hw_ctx {
-	void __iomem *base;
-	struct regmap *noc_regmap;
-	struct reset_control *reset;
-	u32 g_dss_version_tag;
-
-	void __iomem *noc_dss_base;
-	void __iomem *peri_crg_base;
-	void __iomem *pmc_base;
-	void __iomem *sctrl_base;
-	void __iomem *media_crg_base;
-	void __iomem *pctrl_base;
-	void __iomem *mmbuf_crg_base;
-	void __iomem *pmctrl_base;
-
-	struct clk *dss_axi_clk;
-	struct clk *dss_pclk_dss_clk;
-	struct clk *dss_pri_clk;
-	struct clk *dss_pxl0_clk;
-	struct clk *dss_pxl1_clk;
-	struct clk *dss_mmbuf_clk;
-	struct clk *dss_pclk_mmbuf_clk;
-
-	struct dss_clk_rate *dss_clk;
-
-	struct regulator *dpe_regulator;
-	struct regulator *mmbuf_regulator;
-	struct regulator *mediacrg_regulator;
-
-	bool power_on;
-	int irq;
-
-	wait_queue_head_t vactive0_end_wq;
-	u32 vactive0_end_flag;
-	ktime_t vsync_timestamp;
-	ktime_t vsync_timestamp_prev;
-
-	struct iommu_domain *mmu_domain;
-	char __iomem *screen_base;
-	unsigned long smem_start;
-	unsigned long screen_size;
-};
-
-struct dss_clk_rate {
-	u64 dss_pri_clk_rate;
-	u64 dss_pclk_dss_rate;
-	u64 dss_pclk_pctrl_rate;
-	u64 dss_mmbuf_rate;
-	u32 dss_voltage_value; //0:0.7v, 2:0.8v
-	u32 reserved;
-};
-
-struct dss_crtc {
-	struct drm_crtc base;
-	struct dss_hw_ctx *ctx;
-	bool enable;
-	u32 out_format;
-	u32 bgr_fmt;
-};
-
-struct dss_plane {
-	struct drm_plane base;
-	/*void *ctx;*/
-	void *acrtc;
-	u8 ch; /* channel */
-};
-
-struct dss_data {
-	struct dss_crtc acrtc;
-	struct dss_plane aplane[DSS_CH_NUM];
-	struct dss_hw_ctx ctx;
-};
-
-/* ade-format info: */
-struct dss_format {
-	u32 pixel_format;
-	enum hisi_fb_pixel_format dss_format;
-};
-
-#define MIPI_DPHY_NUM	(2)
-
-/* IFBC compress mode */
-enum IFBC_TYPE {
-	IFBC_TYPE_NONE = 0,
-	IFBC_TYPE_ORISE2X,
-	IFBC_TYPE_ORISE3X,
-	IFBC_TYPE_HIMAX2X,
-	IFBC_TYPE_RSP2X,
-	IFBC_TYPE_RSP3X,
-	IFBC_TYPE_VESA2X_SINGLE,
-	IFBC_TYPE_VESA3X_SINGLE,
-	IFBC_TYPE_VESA2X_DUAL,
-	IFBC_TYPE_VESA3X_DUAL,
-	IFBC_TYPE_VESA3_75X_DUAL,
-
-	IFBC_TYPE_MAX
-};
-
-/* IFBC compress mode */
-enum IFBC_COMP_MODE {
-	IFBC_COMP_MODE_0 = 0,
-	IFBC_COMP_MODE_1,
-	IFBC_COMP_MODE_2,
-	IFBC_COMP_MODE_3,
-	IFBC_COMP_MODE_4,
-	IFBC_COMP_MODE_5,
-	IFBC_COMP_MODE_6,
-};
-
-/* xres_div */
-enum XRES_DIV {
-	XRES_DIV_1 = 1,
-	XRES_DIV_2,
-	XRES_DIV_3,
-	XRES_DIV_4,
-	XRES_DIV_5,
-	XRES_DIV_6,
-};
-
-/* yres_div */
-enum YRES_DIV {
-	YRES_DIV_1 = 1,
-	YRES_DIV_2,
-	YRES_DIV_3,
-	YRES_DIV_4,
-	YRES_DIV_5,
-	YRES_DIV_6,
-};
-
-/* pxl0_divxcfg */
-enum PXL0_DIVCFG {
-	PXL0_DIVCFG_0 = 0,
-	PXL0_DIVCFG_1,
-	PXL0_DIVCFG_2,
-	PXL0_DIVCFG_3,
-	PXL0_DIVCFG_4,
-	PXL0_DIVCFG_5,
-	PXL0_DIVCFG_6,
-	PXL0_DIVCFG_7,
-};
-
-/* pxl0_div2_gt_en */
-enum PXL0_DIV2_GT_EN {
-	PXL0_DIV2_GT_EN_CLOSE = 0,
-	PXL0_DIV2_GT_EN_OPEN,
-};
-
-/* pxl0_div4_gt_en */
-enum PXL0_DIV4_GT_EN {
-	PXL0_DIV4_GT_EN_CLOSE = 0,
-	PXL0_DIV4_GT_EN_OPEN,
-};
-
-/* pxl0_dsi_gt_en */
-enum PXL0_DSI_GT_EN {
-	PXL0_DSI_GT_EN_0 = 0,
-	PXL0_DSI_GT_EN_1,
-	PXL0_DSI_GT_EN_2,
-	PXL0_DSI_GT_EN_3,
-};
-
-struct mipi_ifbc_division {
-	u32 xres_div;
-	u32 yres_div;
-	u32 comp_mode;
-	u32 pxl0_div2_gt_en;
-	u32 pxl0_div4_gt_en;
-	u32 pxl0_divxcfg;
-	u32 pxl0_dsi_gt_en;
-};
-
-/*****************************************************************************/
-
-#ifndef ALIGN_DOWN
-#define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
-#endif
-#ifndef ALIGN_UP
-#define ALIGN_UP(val, al)    (((val) + ((al) - 1)) & ~((al) - 1))
-#endif
-
-#define to_dss_crtc(crtc) \
-	container_of(crtc, struct dss_crtc, base)
-
-#define to_dss_plane(plane) \
-	container_of(plane, struct dss_plane, base)
-
 #endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index ac7924fd0fc9..4781194266c4 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -17,6 +17,12 @@
 
 #include "kirin9xx_drm_dpe_utils.h"
 
+#if defined(CONFIG_DRM_HISI_KIRIN970)
+#include "kirin970_dpe_reg.h"
+#else
+#include "kirin960_dpe_reg.h"
+#endif
+
 static int g_debug_set_reg_val;
 
 DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
@@ -118,22 +124,6 @@ struct mipi_ifbc_division g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
 	}
 };
 
-void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs)
-{
-	u32 mask = (1UL << bw) - 1UL;
-	u32 tmp = 0;
-
-	tmp = readl(addr);
-	tmp &= ~(mask << bs);
-
-	writel(tmp | ((val & mask) << bs), addr);
-
-	if (g_debug_set_reg_val) {
-		printk(KERN_INFO "writel: [%p] = 0x%x\n", addr,
-		       tmp | ((val & mask) << bs));
-	}
-}
-
 u32 set_bits32(u32 old_val, uint32_t val, uint8_t bw, uint8_t bs)
 {
 	u32 mask = (1UL << bw) - 1UL;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index 28c8eb6cbe73..13e51a725579 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -16,14 +16,201 @@
 #ifndef KIRIN_DRM_DPE_UTILS_H
 #define KIRIN_DRM_DPE_UTILS_H
 
-#if defined(CONFIG_DRM_HISI_KIRIN970)
-#include "kirin970_dpe_reg.h"
-#else
-#include "kirin960_dpe_reg.h"
-#endif
+#include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
+
 #include "kirin9xx_drm_drv.h"
 
-void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs);
+enum dss_channel {
+	DSS_CH1 = 0,	/* channel 1 for primary plane */
+	DSS_CH_NUM
+};
+
+#define PRIMARY_CH	DSS_CH1 /* primary plane */
+
+enum hisi_fb_pixel_format {
+	HISI_FB_PIXEL_FORMAT_RGB_565 = 0,
+	HISI_FB_PIXEL_FORMAT_RGBX_4444,
+	HISI_FB_PIXEL_FORMAT_RGBA_4444,
+	HISI_FB_PIXEL_FORMAT_RGBX_5551,
+	HISI_FB_PIXEL_FORMAT_RGBA_5551,
+	HISI_FB_PIXEL_FORMAT_RGBX_8888,
+	HISI_FB_PIXEL_FORMAT_RGBA_8888,
+
+	HISI_FB_PIXEL_FORMAT_BGR_565,
+	HISI_FB_PIXEL_FORMAT_BGRX_4444,
+	HISI_FB_PIXEL_FORMAT_BGRA_4444,
+	HISI_FB_PIXEL_FORMAT_BGRX_5551,
+	HISI_FB_PIXEL_FORMAT_BGRA_5551,
+	HISI_FB_PIXEL_FORMAT_BGRX_8888,
+	HISI_FB_PIXEL_FORMAT_BGRA_8888,
+
+	HISI_FB_PIXEL_FORMAT_YUV_422_I,
+
+	/* YUV Semi-planar */
+	HISI_FB_PIXEL_FORMAT_YCbCr_422_SP,	/* NV16 */
+	HISI_FB_PIXEL_FORMAT_YCrCb_422_SP,
+	HISI_FB_PIXEL_FORMAT_YCbCr_420_SP,
+	HISI_FB_PIXEL_FORMAT_YCrCb_420_SP,	/* NV21 */
+
+	/* YUV Planar */
+	HISI_FB_PIXEL_FORMAT_YCbCr_422_P,
+	HISI_FB_PIXEL_FORMAT_YCrCb_422_P,
+	HISI_FB_PIXEL_FORMAT_YCbCr_420_P,
+	HISI_FB_PIXEL_FORMAT_YCrCb_420_P,	/* HISI_FB_PIXEL_FORMAT_YV12 */
+
+	/* YUV Package */
+	HISI_FB_PIXEL_FORMAT_YUYV_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_UYVY_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_YVYU_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_VYUY_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_MAX,
+
+	HISI_FB_PIXEL_FORMAT_UNSUPPORT = 800
+};
+
+struct dss_hw_ctx {
+	void __iomem *base;
+	struct regmap *noc_regmap;
+	struct reset_control *reset;
+	u32 g_dss_version_tag;
+
+	void __iomem *noc_dss_base;
+	void __iomem *peri_crg_base;
+	void __iomem *pmc_base;
+	void __iomem *sctrl_base;
+	void __iomem *media_crg_base;
+	void __iomem *pctrl_base;
+	void __iomem *mmbuf_crg_base;
+	void __iomem *pmctrl_base;
+
+	struct clk *dss_axi_clk;
+	struct clk *dss_pclk_dss_clk;
+	struct clk *dss_pri_clk;
+	struct clk *dss_pxl0_clk;
+	struct clk *dss_pxl1_clk;
+	struct clk *dss_mmbuf_clk;
+	struct clk *dss_pclk_mmbuf_clk;
+
+	struct dss_clk_rate *dss_clk;
+
+	struct regulator *dpe_regulator;
+	struct regulator *mmbuf_regulator;
+	struct regulator *mediacrg_regulator;
+
+	bool power_on;
+	int irq;
+
+	wait_queue_head_t vactive0_end_wq;
+	u32 vactive0_end_flag;
+	ktime_t vsync_timestamp;
+	ktime_t vsync_timestamp_prev;
+
+	struct iommu_domain *mmu_domain;
+	char __iomem *screen_base;
+	unsigned long smem_start;
+	unsigned long screen_size;
+};
+
+struct dss_clk_rate {
+	u64 dss_pri_clk_rate;
+	u64 dss_pclk_dss_rate;
+	u64 dss_pclk_pctrl_rate;
+	u64 dss_mmbuf_rate;
+	u32 dss_voltage_value; //0:0.7v, 2:0.8v
+	u32 reserved;
+};
+
+struct dss_crtc {
+	struct drm_crtc base;
+	struct dss_hw_ctx *ctx;
+	bool enable;
+	u32 out_format;
+	u32 bgr_fmt;
+};
+
+struct dss_plane {
+	struct drm_plane base;
+	/*void *ctx;*/
+	void *acrtc;
+	u8 ch; /* channel */
+};
+
+struct dss_data {
+	struct dss_crtc acrtc;
+	struct dss_plane aplane[DSS_CH_NUM];
+	struct dss_hw_ctx ctx;
+};
+
+/* ade-format info: */
+struct dss_format {
+	u32 pixel_format;
+	enum hisi_fb_pixel_format dss_format;
+};
+
+struct dss_img {
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
+
+	u64 afbc_header_addr;
+	u64 afbc_payload_addr;
+	u32 afbc_header_stride;
+	u32 afbc_payload_stride;
+	u32 afbc_scramble_mode;
+	u32 mmbuf_base;
+	u32 mmbuf_size;
+
+	u32 mmu_enable;
+	u32 csc_mode;
+	u32 secure_mode;
+	s32 shared_fd;
+	u32 reserved0;
+};
+
+struct dss_rect {
+	s32 x;
+	s32 y;
+	s32 w;
+	s32 h;
+};
+
+struct drm_dss_layer {
+	struct dss_img img;
+	struct dss_rect src_rect;
+	struct dss_rect src_rect_mask;
+	struct dss_rect dst_rect;
+	u32 transform;
+	s32 blending;
+	u32 glb_alpha;
+	u32 color;		/* background color or dim color */
+	s32 layer_idx;
+	s32 chn_idx;
+	u32 need_cap;
+	s32 acquire_fence;
+};
+
+static inline void set_reg(char __iomem *addr, uint32_t val, uint8_t bw,
+			   uint8_t bs)
+{
+	u32 mask = (1UL << bw) - 1UL;
+	u32 tmp = 0;
+
+	tmp = readl(addr);
+	tmp &= ~(mask << bs);
+
+	writel(tmp | ((val & mask) << bs), addr);
+}
+
 u32 set_bits32(u32 old_val, uint32_t val, uint8_t bw, uint8_t bs);
 
 void init_dbuf(struct dss_crtc *acrtc);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 60c43c153829..335f4d9fba15 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -25,6 +25,12 @@
 #include "kirin9xx_drm_dpe_utils.h"
 #include "kirin9xx_drm_drv.h"
 
+#if defined(CONFIG_DRM_HISI_KIRIN970)
+#include "kirin970_dpe_reg.h"
+#else
+#include "kirin960_dpe_reg.h"
+#endif
+
 static const int mid_array[DSS_CHN_MAX_DEFINE] = {
 	0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0
 };
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 5c6a9b78a1ec..3a77945038c4 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -38,6 +38,7 @@
 #include "kirin960_dpe_reg.h"
 #endif
 #include "kirin9xx_drm_drv.h"
+#include "kirin9xx_drm_dpe_utils.h"
 
 #if defined(CONFIG_DRM_HISI_KIRIN970)
 #define DTS_COMP_DSI_NAME "hisilicon,kirin970-dsi"
@@ -273,17 +274,6 @@ static const struct dsi_phy_range dphy_range_info[] = {
  * Except for debug, this is identical to the one defined at
  * kirin9xx_drm_dpe_utils.h.
  */
-static void set_reg(char __iomem *addr, uint32_t val, uint8_t bw,
-		    uint8_t bs)
-{
-	u32 mask = (1UL << bw) - 1UL;
-	u32 tmp = 0;
-
-	tmp = readl(addr);
-	tmp &= ~(mask << bs);
-
-	writel(tmp | ((val & mask) << bs), addr);
-}
 
 void dsi_set_output_client(struct drm_device *dev)
 {
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
index c920734e6332..d0b1be278367 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
@@ -27,6 +27,12 @@
 #include "kirin9xx_fb_panel.h"
 #include "kirin9xx_dw_dsi_reg.h"
 
+#if defined(CONFIG_DRM_HISI_KIRIN970)
+#include "kirin970_dpe_reg.h"
+#else
+#include "kirin960_dpe_reg.h"
+#endif
+
 /* default pwm clk */
 #define DEFAULT_PWM_CLK_RATE	(80 * 1000000L)
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
