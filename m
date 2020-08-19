Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A8249C37
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AA46E24E;
	Wed, 19 Aug 2020 11:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8D76E231
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AFFA2311E;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=w/vxnXiCfN0he/mjewZdMu9sjoebmIvaXAG/Engdfdw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZG7w+t2Rtj34/uHJsDVX2DwVWfrFlZayjt+u5eWZZ9BlvnCJdGdSe0LRBO5ATwP2u
 GlzcFgeW5ErRNoRL1guFe4SEq9F7AzUIgcz1jAN6ufpiLlOcAWZXoun6VKOq2a2qGF
 Os5qDXw9bwKpoCBUsLHbe6Ivux5Mo51KRCHDakYM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Eubo-2g; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 39/49] staging: hikey9xx/gpu: get rid of typedefs
Date: Wed, 19 Aug 2020 13:46:07 +0200
Message-Id: <8d83e0bb931e483c29ac6b16b1fc7856c3f4af09.1597833138.git.mchehab+huawei@kernel.org>
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

There are a few typedefs inside this driver. Get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin960_dpe_reg.h   | 126 +++++++++---------
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   | 117 ++++++++--------
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |   4 +-
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |   2 +-
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c |   8 +-
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |   2 +-
 6 files changed, 130 insertions(+), 129 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index 651b3b172033..f34d5af189f7 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -72,19 +72,19 @@ enum dss_channel {
 
 #define PRIMARY_CH	DSS_CH1 /* primary plane */
 
-typedef struct dss_rect {
+struct dss_rect {
 	s32 x;
 	s32 y;
 	s32 w;
 	s32 h;
-} dss_rect_t;
+};
 
-typedef struct dss_rect_ltrb {
+struct dss_rect_ltrb {
 	s32 left;
 	s32 top;
 	s32 right;
 	s32 bottom;
-} dss_rect_ltrb_t;
+};
 
 enum {
 	DSI_1_LANES = 0,
@@ -103,7 +103,7 @@ enum dss_ovl_idx {
 
 #define DSS_WCH_MAX  (2)
 
-typedef struct dss_img {
+struct dss_img {
 	u32 format;
 	u32 width;
 	u32 height;
@@ -130,13 +130,13 @@ typedef struct dss_img {
 	u32 secure_mode;
 	s32 shared_fd;
 	u32 reserved0;
-} dss_img_t;
+};
 
-typedef struct drm_dss_layer {
-	dss_img_t img;
-	dss_rect_t src_rect;
-	dss_rect_t src_rect_mask;
-	dss_rect_t dst_rect;
+struct drm_dss_layer {
+	struct dss_img img;
+	struct dss_rect src_rect;
+	struct dss_rect src_rect_mask;
+	struct dss_rect dst_rect;
 	u32 transform;
 	s32 blending;
 	u32 glb_alpha;
@@ -145,7 +145,7 @@ typedef struct drm_dss_layer {
 	s32 chn_idx;
 	u32 need_cap;
 	s32 acquire_fence;
-} drm_dss_layer_t;
+};
 
 /******************************************************************************/
 
@@ -1160,17 +1160,17 @@ enum dss_rdma_idx {
 #define AIF_MODULE_CLK_SEL	(0x0A04)
 #define AIF_MODULE_CLK_EN	(0x0A08)
 
-typedef struct dss_aif {
+struct dss_aif {
 	u32 aif_ch_ctl;
 	u32 aif_ch_ctl_add;
-} dss_aif_t;
+};
 
-typedef struct dss_aif_bw {
+struct dss_aif_bw {
 	u64 bw;
 	u8 chn_idx;
 	s8 axi_sel;
 	u8 is_used;
-} dss_aif_bw_t;
+};
 
 /*
  * MIF
@@ -1212,13 +1212,13 @@ typedef struct dss_aif_bw {
 #define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
 #define MIF_STRIDE_UNIT (4 * 1024)
 
-typedef struct dss_mif {
+struct dss_mif {
 	u32 mif_ctrl1;
 	u32 mif_ctrl2;
 	u32 mif_ctrl3;
 	u32 mif_ctrl4;
 	u32 mif_ctrl5;
-} dss_mif_t;
+};
 
 /*
  * stretch blt, linear/tile, rotation, pixel format
@@ -1317,7 +1317,7 @@ enum dss_mmu_tlb_tag_org {
 
 #define SMMU_SID_NUM	(64)
 
-typedef struct dss_smmu {
+struct dss_smmu {
 	u32 smmu_scr;
 	u32 smmu_memctrl;
 	u32 smmu_lp_ctrl;
@@ -1375,7 +1375,7 @@ typedef struct dss_smmu {
 	u32 smmu_offset_addr_s;
 
 	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
-} dss_smmu_t;
+};
 
 /*
  * RDMA
@@ -1455,7 +1455,7 @@ typedef struct dss_smmu {
 #define DFC_DITHER_ENABLE	(0x0020)
 #define DFC_PADDING_CTL	(0x0024)
 
-typedef struct dss_dfc {
+struct dss_dfc {
 	u32 disp_size;
 	u32 pix_in_num;
 	u32 disp_fmt;
@@ -1465,7 +1465,7 @@ typedef struct dss_dfc {
 	u32 icg_module;
 	u32 dither_enable;
 	u32 padding_ctl;
-} dss_dfc_t;
+};
 
 /*
  * SCF
@@ -1514,7 +1514,7 @@ typedef struct dss_dfc {
 #define SCF_EDGE_FACTOR (3)
 #define ARSR2P_INC_FACTOR (65536)
 
-typedef struct dss_scl {
+struct dss_scl {
 	u32 en_hscl_str;
 	u32 en_vscl_str;
 	u32 h_v_order;
@@ -1528,7 +1528,7 @@ typedef struct dss_scl {
 	u32 en_mmp;
 	u32 scf_ch_core_gt;
 	u32 fmt;
-} dss_scl_t;
+};
 
 enum scl_coef_lut_idx {
 	SCL_COEF_NONE_IDX = -1,
@@ -1585,7 +1585,7 @@ enum scl_coef_lut_idx {
 #define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
 #define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
 
-typedef struct dss_arsr2p_effect {
+struct dss_arsr2p_effect {
 	u32 skin_thres_y;
 	u32 skin_thres_u;
 	u32 skin_thres_v;
@@ -1605,9 +1605,9 @@ typedef struct dss_arsr2p_effect {
 	u32 sharp_cfg9;
 	u32 texturw_analysts;
 	u32 intplshootctrl;
-} dss_arsr2p_effect_t;
+};
 
-typedef struct dss_arsr2p {
+struct dss_arsr2p {
 	u32 arsr_input_width_height;
 	u32 arsr_output_width_height;
 	u32 ihleft;
@@ -1618,11 +1618,11 @@ typedef struct dss_arsr2p {
 	u32 ivinc;
 	u32 offset;
 	u32 mode;
-	dss_arsr2p_effect_t arsr2p_effect;
+	struct dss_arsr2p_effect arsr2p_effect;
 	u32 ihleft1;
 	u32 ihright1;
 	u32 ivbottom1;
-} dss_arsr2p_t;
+};
 
 /*
  * POST_CLIP  v g
@@ -1632,12 +1632,12 @@ typedef struct dss_arsr2p {
 #define POST_CLIP_CTL_VRZ	(0x0014)
 #define POST_CLIP_EN	(0x0018)
 
-typedef struct dss_post_clip {
+struct dss_post_clip {
 	u32 disp_size;
 	u32 clip_ctl_hrz;
 	u32 clip_ctl_vrz;
 	u32 ctl_clip_en;
-} dss_post_clip_t;
+};
 
 /*
  * PCSC v
@@ -1654,9 +1654,9 @@ typedef struct dss_post_clip {
 #define PCSC_ICG_MODULE	(0x0024)
 #define PCSC_MPREC	(0x0028)
 
-typedef struct dss_pcsc {
+struct dss_pcsc {
 	u32 pcsc_idc0;
-} dss_pcsc_t;
+};
 
 /*
  * CSC
@@ -1674,7 +1674,7 @@ typedef struct dss_pcsc {
 #define CSC_ICG_MODULE	(0x0024)
 #define CSC_MPREC	(0x0028)
 
-typedef struct dss_csc {
+struct dss_csc {
 	u32 idc0;
 	u32 idc2;
 	u32 odc0;
@@ -1686,7 +1686,7 @@ typedef struct dss_csc {
 	u32 p4;
 	u32 icg_module;
 	u32 mprec;
-} dss_csc_t;
+};
 
 /*
  * channel DEBUG
@@ -1838,7 +1838,7 @@ enum DSS_AFBC_HALF_BLOCK_MODE {
 	AFBC_HALF_BLOCK_LOWER_ONLY,
 };
 
-typedef struct dss_rdma {
+struct dss_rdma {
 	u32 oft_x0;
 	u32 oft_y0;
 	u32 oft_x1;
@@ -1892,9 +1892,9 @@ typedef struct dss_rdma {
 
 	u8 vpp_used;
 	u8 afbc_used;
-} dss_rdma_t;
+};
 
-typedef struct dss_wdma {
+struct dss_wdma {
 	u32 oft_x0;
 	u32 oft_y0;
 	u32 oft_x1;
@@ -1947,7 +1947,7 @@ typedef struct dss_wdma {
 
 	u8 afbc_used;
 	u8 rot_used;
-} dss_wdma_t;
+};
 
 /*
  * MCTL  MUTEX0 1 2 3 4 5
@@ -2120,37 +2120,37 @@ enum dss_mctl_idx {
 	DSS_MCTL_IDX_MAX,
 };
 
-typedef struct dss_mctl {
+struct dss_mctl {
 	u32 ctl_mutex_itf;
 	u32 ctl_mutex_dbuf;
 	u32 ctl_mutex_scf;
 	u32 ctl_mutex_ov;
-} dss_mctl_t;
+};
 
-typedef struct dss_mctl_ch_base {
+struct dss_mctl_ch_base {
 	char __iomem *chn_mutex_base;
 	char __iomem *chn_flush_en_base;
 	char __iomem *chn_ov_en_base;
 	char __iomem *chn_starty_base;
 	char __iomem *chn_mod_dbg_base;
-} dss_mctl_ch_base_t;
+};
 
-typedef struct dss_mctl_ch {
+struct dss_mctl_ch {
 	u32 chn_mutex;
 	u32 chn_flush_en;
 	u32 chn_ov_oen;
 	u32 chn_starty;
 	u32 chn_mod_dbg;
-} dss_mctl_ch_t;
+};
 
-typedef struct dss_mctl_sys {
+struct dss_mctl_sys {
 	u32 ov_flush_en[DSS_OVL_IDX_MAX];
 	u32 chn_ov_sel[DSS_OVL_IDX_MAX];
 	u32 wchn_ov_sel[DSS_WCH_MAX];
 	u8 ov_flush_en_used[DSS_OVL_IDX_MAX];
 	u8 chn_ov_sel_used[DSS_OVL_IDX_MAX];
 	u8 wch_ov_sel_used[DSS_WCH_MAX];
-} dss_mctl_sys_t;
+};
 
 /*
  * OVL
@@ -2356,34 +2356,34 @@ typedef struct dss_mctl_sys {
 #define OV2_REG_DEFAULT			(0x218)
 
 #define OV_8LAYER_NUM				(8)
-typedef struct dss_ovl_layer {
+struct dss_ovl_layer {
 	u32 layer_pos;
 	u32 layer_size;
 	u32 layer_pattern;
 	u32 layer_alpha;
 	u32 layer_cfg;
 
-} dss_ovl_layer_t;
+};
 
-typedef struct dss_ovl_layer_pos {
+struct dss_ovl_layer_pos {
 	u32 layer_pspos;
 	u32 layer_pepos;
 
-} dss_ovl_layer_pos_t;
+};
 
-typedef struct dss_ovl {
+struct dss_ovl {
 	u32 ovl_size;
 	u32 ovl_bg_color;
 	u32 ovl_dst_startpos;
 	u32 ovl_dst_endpos;
 	u32 ovl_gcfg;
 	u32 ovl_block_size;
-	dss_ovl_layer_t ovl_layer[OVL_6LAYER_NUM];
-	dss_ovl_layer_pos_t ovl_layer_pos[OVL_6LAYER_NUM];
+	struct dss_ovl_layer ovl_layer[OVL_6LAYER_NUM];
+	struct dss_ovl_layer_pos ovl_layer_pos[OVL_6LAYER_NUM];
 	u8 ovl_layer_used[OVL_6LAYER_NUM];
-} dss_ovl_t;
+};
 
-typedef struct dss_ovl_alpha {
+struct dss_ovl_alpha {
 	u32 src_amode;
 	u32 src_gmode;
 	u32 alpha_offsrc;
@@ -2398,7 +2398,7 @@ typedef struct dss_ovl_alpha {
 	u32 dst_pmode;
 
 	u32 fix_mode;
-} dss_ovl_alpha_t;
+};
 
 /*
  * DBUF
@@ -2598,7 +2598,7 @@ typedef struct dss_ovl_alpha {
 #define LCP_DEGAMA_MEM_CTRL	(0x03C)
 #define LCP_GMP_MEM_CTRL	(0x040)
 
-typedef struct dss_arsr1p {
+struct dss_arsr1p {
 	u32 ihleft;
 	u32 ihright;
 	u32 ihleft1;
@@ -2639,7 +2639,7 @@ typedef struct dss_arsr1p {
 	u32 dpp_img_vrt_bef_sr;
 	u32 dpp_img_hrz_aft_sr;
 	u32 dpp_img_vrt_aft_sr;
-} dss_arsr1p_t;
+};
 
 #define ARSR1P_INC_FACTOR (65536)
 
@@ -3088,14 +3088,14 @@ struct dss_hw_ctx {
 	unsigned long screen_size;
 };
 
-typedef struct dss_clk_rate {
+struct dss_clk_rate {
 	u64 dss_pri_clk_rate;
 	u64 dss_pclk_dss_rate;
 	u64 dss_pclk_pctrl_rate;
 	u64 dss_mmbuf_rate;
 	u32 dss_voltage_value; //0:0.7v, 2:0.8v
 	u32 reserved;
-} dss_clk_rate_t;
+};
 
 struct dss_crtc {
 	struct drm_crtc base;
@@ -3206,7 +3206,7 @@ enum PXL0_DSI_GT_EN {
 	PXL0_DSI_GT_EN_3,
 };
 
-typedef struct mipi_ifbc_division {
+struct mipi_ifbc_division {
 	u32 xres_div;
 	u32 yres_div;
 	u32 comp_mode;
@@ -3214,7 +3214,7 @@ typedef struct mipi_ifbc_division {
 	u32 pxl0_div4_gt_en;
 	u32 pxl0_divxcfg;
 	u32 pxl0_dsi_gt_en;
-} mipi_ifbc_division_t;
+};
 
 /*****************************************************************************/
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 9c5009389f00..4f24322ebc7f 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -75,19 +75,19 @@ enum dss_channel {
 
 #define PRIMARY_CH	DSS_CH1 /* primary plane */
 
-typedef struct dss_rect {
+struct dss_rect {
 	s32 x;
 	s32 y;
 	s32 w;
 	s32 h;
-} dss_rect_t;
+};
 
-typedef struct dss_rect_ltrb {
+struct dss_rect_ltrb {
 	s32 left;
 	s32 top;
 	s32 right;
 	s32 bottom;
-} dss_rect_ltrb_t;
+};
 
 enum {
 	DSI_1_LANES = 0,
@@ -106,7 +106,7 @@ enum dss_ovl_idx {
 
 #define DSS_WCH_MAX  (2)
 
-typedef struct dss_img {
+struct dss_img {
 	u32 format;
 	u32 width;
 	u32 height;
@@ -133,13 +133,13 @@ typedef struct dss_img {
 	u32 secure_mode;
 	s32 shared_fd;
 	u32 reserved0;
-} dss_img_t;
+};
 
-typedef struct drm_dss_layer {
-	dss_img_t img;
-	dss_rect_t src_rect;
-	dss_rect_t src_rect_mask;
-	dss_rect_t dst_rect;
+struct drm_dss_layer {
+	struct dss_img img;
+	struct dss_rect src_rect;
+	struct dss_rect src_rect_mask;
+	struct dss_rect dst_rect;
 	u32 transform;
 	s32 blending;
 	u32 glb_alpha;
@@ -148,7 +148,7 @@ typedef struct drm_dss_layer {
 	s32 chn_idx;
 	u32 need_cap;
 	s32 acquire_fence;
-} drm_dss_layer_t;
+};
 
 /*****************************************************************************/
 
@@ -1229,19 +1229,19 @@ enum dss_rdma_idx {
 #define AIF_MODULE_CLK_SEL	(0x0A04)
 #define AIF_MODULE_CLK_EN	(0x0A08)
 
-typedef struct dss_aif {
+struct dss_aif {
 	u32 aif_ch_ctl;
 	u32 aif_ch_ctl_add;  //ES
 	u32 aif_ch_hs;
 	u32 aif_ch_ls;
-} dss_aif_t;
+};
 
-typedef struct dss_aif_bw {
+struct dss_aif_bw {
 	u64 bw;
 	u8 chn_idx;
 	s8 axi_sel;
 	u8 is_used;
-} dss_aif_bw_t;
+};
 
 /*
  * MIF
@@ -1283,13 +1283,13 @@ typedef struct dss_aif_bw {
 #define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
 #define MIF_STRIDE_UNIT (4 * 1024)
 
-typedef struct dss_mif {
+struct dss_mif {
 	u32 mif_ctrl1;
 	u32 mif_ctrl2;
 	u32 mif_ctrl3;
 	u32 mif_ctrl4;
 	u32 mif_ctrl5;
-} dss_mif_t;
+};
 
 /*
 ** stretch blt, linear/tile, rotation, pixel format
@@ -1402,7 +1402,7 @@ enum dss_mmu_tlb_tag_org {
 
 #define SMMU_SID_NUM	(64)
 
-typedef struct dss_smmu {
+struct dss_smmu {
 	u32 smmu_scr;
 	u32 smmu_memctrl;
 	u32 smmu_lp_ctrl;
@@ -1460,7 +1460,7 @@ typedef struct dss_smmu {
 	u32 smmu_offset_addr_s;
 
 	u8 smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
-} dss_smmu_t;
+};
 
 /*
  * RDMA
@@ -1549,7 +1549,7 @@ typedef struct dss_smmu {
 #define DFC_BITEXT_CTL		(0x0040)
 #define DFC_DITHER_CTL1      (0x00D0)
 
-typedef struct dss_dfc {
+struct dss_dfc {
 	u32 disp_size;
 	u32 pix_in_num;
 	u32 disp_fmt;
@@ -1560,7 +1560,7 @@ typedef struct dss_dfc {
 	u32 dither_enable;
 	u32 padding_ctl;
 	u32 bitext_ctl;
-} dss_dfc_t;
+};
 
 /*
  * SCF
@@ -1609,7 +1609,7 @@ typedef struct dss_dfc {
 #define SCF_EDGE_FACTOR (3)
 #define ARSR2P_INC_FACTOR (65536)
 
-typedef struct dss_scl {
+struct dss_scl {
 	u32 en_hscl_str;
 	u32 en_vscl_str;
 	u32 h_v_order;
@@ -1623,7 +1623,7 @@ typedef struct dss_scl {
 	u32 en_mmp;
 	u32 scf_ch_core_gt;
 	u32 fmt;
-} dss_scl_t;
+};
 
 enum scl_coef_lut_idx {
 	SCL_COEF_NONE_IDX = -1,
@@ -1745,12 +1745,12 @@ enum scl_coef_lut_idx {
 #define POST_CLIP_CTL_VRZ_ES		(0x0014)
 #define POST_CLIP_EN_ES			(0x0018)
 
-typedef struct dss_post_clip {
+struct dss_post_clip {
 	u32 disp_size;
 	u32 clip_ctl_hrz;
 	u32 clip_ctl_vrz;
 	u32 ctl_clip_en;
-} dss_post_clip_t;
+};
 
 /*
  * PCSC v
@@ -1767,9 +1767,9 @@ typedef struct dss_post_clip {
 #define PCSC_ICG_MODULE	(0x0024)
 #define PCSC_MPREC	(0x0028)
 
-typedef struct dss_pcsc {
+struct dss_pcsc {
 	u32 pcsc_idc0;
-} dss_pcsc_t;
+};
 
 /*
  * CSC
@@ -1796,7 +1796,7 @@ typedef struct dss_pcsc {
 #define CSC_P22				(0x0030)
 #define CSC_ICG_MODULE		(0x0034)
 
-typedef struct dss_csc {
+struct dss_csc {
 	u32 idc0;
 	u32 idc2;
 	u32 odc0;
@@ -1818,7 +1818,7 @@ typedef struct dss_csc {
 	u32 p21;
 	u32 p22;
 	u32 icg_module;
-} dss_csc_t;
+};
 
 /*
  * channel DEBUG
@@ -2006,7 +2006,7 @@ enum DSS_AFBC_HALF_BLOCK_MODE {
 	AFBC_HALF_BLOCK_LOWER_ONLY,
 };
 
-typedef struct dss_rdma {
+struct dss_rdma {
 	u32 oft_x0;
 	u32 oft_y0;
 	u32 oft_x1;
@@ -2080,9 +2080,9 @@ typedef struct dss_rdma {
 	u8 vpp_used;
 	u8 afbc_used;
 	u8 hfbcd_used;
-} dss_rdma_t;
+};
 
-typedef struct dss_wdma {
+struct dss_wdma {
 	u32 oft_x0;
 	u32 oft_y0;
 	u32 oft_x1;
@@ -2150,7 +2150,7 @@ typedef struct dss_wdma {
 	u8 afbc_used;
 	u8 hfbce_used;
 	u8 rot_used;
-} dss_wdma_t;
+};
 
 /*
  * MCTL  MUTEX0 1 2 3 4 5
@@ -2345,22 +2345,22 @@ enum dss_mctl_idx {
 	DSS_MCTL_IDX_MAX,
 };
 
-typedef struct dss_mctl {
+struct dss_mctl {
 	u32 ctl_mutex_itf;
 	u32 ctl_mutex_dbuf;
 	u32 ctl_mutex_scf;
 	u32 ctl_mutex_ov;
-} dss_mctl_t;
+};
 
-typedef struct dss_mctl_ch {
+struct dss_mctl_ch {
 	u32 chn_mutex;
 	u32 chn_flush_en;
 	u32 chn_ov_oen;
 	u32 chn_starty;
 	u32 chn_mod_dbg;
-} dss_mctl_ch_t;
+};
 
-typedef struct dss_mctl_sys {
+struct dss_mctl_sys {
 	u32 ov_flush_en[DSS_OVL_IDX_MAX];
 	u32 chn_ov_sel[DSS_OVL_IDX_MAX];
 	u32 chn_ov_sel1[DSS_OVL_IDX_MAX];
@@ -2368,7 +2368,7 @@ typedef struct dss_mctl_sys {
 	u8 ov_flush_en_used[DSS_OVL_IDX_MAX];
 	u8 chn_ov_sel_used[DSS_OVL_IDX_MAX];
 	u8 wch_ov_sel_used[DSS_WCH_MAX];
-} dss_mctl_sys_t;
+};
 
 /*
  * OVL ES
@@ -2575,7 +2575,7 @@ typedef struct dss_mctl_sys {
 
 #define OV_8LAYER_NUM				(8)
 
-typedef struct dss_ovl_layer {
+struct dss_ovl_layer {
 	u32 layer_pos;
 	u32 layer_size;
 	u32 layer_pattern;
@@ -2583,14 +2583,14 @@ typedef struct dss_ovl_layer {
 	u32 layer_alpha_a;
 	u32 layer_alpha;
 	u32 layer_cfg;
-} dss_ovl_layer_t;
+};
 
-typedef struct dss_ovl_layer_pos {
+struct dss_ovl_layer_pos {
 	u32 layer_pspos;
 	u32 layer_pepos;
-} dss_ovl_layer_pos_t;
+};
 
-typedef struct dss_ovl {
+struct dss_ovl {
 	u32 ovl_size;
 	u32 ovl_bg_color;
 	u32 ovl_bg_color_alpha;
@@ -2598,12 +2598,12 @@ typedef struct dss_ovl {
 	u32 ovl_dst_endpos;
 	u32 ovl_gcfg;
 	u32 ovl_block_size;
-	dss_ovl_layer_t ovl_layer[OV_8LAYER_NUM];
-	dss_ovl_layer_pos_t ovl_layer_pos[OV_8LAYER_NUM];
+	struct dss_ovl_layer ovl_layer[OV_8LAYER_NUM];
+	struct dss_ovl_layer_pos ovl_layer_pos[OV_8LAYER_NUM];
 	u8 ovl_layer_used[OV_8LAYER_NUM];
-} dss_ovl_t;
+};
 
-typedef struct dss_ovl_alpha {
+struct dss_ovl_alpha {
 	u32 src_amode;
 	u32 src_gmode;
 	u32 alpha_offsrc;
@@ -2618,7 +2618,7 @@ typedef struct dss_ovl_alpha {
 	u32 dst_pmode;
 
 	u32 fix_mode;
-} dss_ovl_alpha_t;
+};
 
 /*
  * DBUF
@@ -2885,7 +2885,7 @@ typedef struct dss_ovl_alpha {
 #define SBL_CORE1_REG_OUT1_7_TO_0_ES                  (0x0e60)
 #define SBL_CORE1_REG_OUT1_15_TO_8_ES                 (0x0e64)
 
-typedef struct dss_sbl {
+struct dss_sbl {
 	int sbl_backlight_l;
 	int sbl_backlight_h;
 	int sbl_ambient_light_l;
@@ -2899,7 +2899,7 @@ typedef struct dss_sbl {
 	int sbl_calibration_d_l;
 	int sbl_calibration_d_h;
 	int sbl_enable;
-} dss_sbl_t;
+};
 
 //SBL for 970
 #define SBL_REG_FRMT_MODE                                  (0x0000)
@@ -3393,7 +3393,7 @@ typedef struct dss_sbl {
 #define ARSR1P_FORCE_CLK_ON_CFG_ES	(0x084)
 
 //ARSR1P
-typedef struct dss_arsr1p {
+struct dss_arsr1p {
 	u32 ihleft;
 	u32 ihright;
 	u32 ihleft1;
@@ -3449,8 +3449,7 @@ typedef struct dss_arsr1p {
 	u32 lsc_cfg1;
 	u32 lsc_cfg2;
 	u32 lsc_cfg3;
-
-} dss_arsr1p_t;
+};
 
 #define ARSR1P_INC_FACTOR (65536)
 
@@ -4077,14 +4076,14 @@ struct dss_hw_ctx {
 	struct dss_smmu smmu;
 };
 
-typedef struct dss_clk_rate {
+struct dss_clk_rate {
 	u64 dss_pri_clk_rate;
 	u64 dss_pclk_dss_rate;
 	u64 dss_pclk_pctrl_rate;
 	u64 dss_mmbuf_rate;
 	u32 dss_voltage_value; //0:0.7v, 2:0.8v
 	u32 reserved;
-} dss_clk_rate_t;
+};
 
 struct dss_crtc {
 	struct drm_crtc base;
@@ -4195,7 +4194,7 @@ enum PXL0_DSI_GT_EN {
 	PXL0_DSI_GT_EN_3,
 };
 
-typedef struct mipi_ifbc_division {
+struct mipi_ifbc_division {
 	u32 xres_div;
 	u32 yres_div;
 	u32 comp_mode;
@@ -4203,7 +4202,7 @@ typedef struct mipi_ifbc_division {
 	u32 pxl0_div4_gt_en;
 	u32 pxl0_divxcfg;
 	u32 pxl0_dsi_gt_en;
-} mipi_ifbc_division_t;
+};
 
 /*****************************************************************************/
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index 8f07fabeee8c..0e3d192c3851 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -21,6 +21,8 @@ static int g_debug_set_reg_val;
 
 DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
 
+extern u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
+
 struct mipi_ifbc_division g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
 	/*single mipi*/
 	{
@@ -240,7 +242,7 @@ void init_ldi(struct dss_crtc *acrtc)
 	struct drm_display_mode *mode;
 	struct drm_display_mode *adj_mode;
 
-	dss_rect_t rect = {0, 0, 0, 0};
+	struct dss_rect rect = {0, 0, 0, 0};
 	u32 hfp, hbp, hsw, vfp, vbp, vsw;
 	u32 vsync_plr = 0;
 	u32 hsync_plr = 0;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index 1ab504d940a0..28c8eb6cbe73 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -71,7 +71,7 @@ int hisi_dss_mctl_mutex_unlock(struct dss_hw_ctx *ctx);
 int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres);
 
 void hisi_fb_pan_display(struct drm_plane *plane);
-void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, drm_dss_layer_t *layer);
+void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, struct drm_dss_layer *layer);
 
 u32 dss_get_format(u32 pixel_format);
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 6b6774b8d903..58cbb1448306 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1008,7 +1008,7 @@ static int hisi_dss_mctl_sys_config(struct dss_hw_ctx *ctx, int chn_idx)
 }
 
 static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
-				const dss_rect_ltrb_t *rect, u32 display_addr, u32 hal_format,
+				const struct dss_rect_ltrb *rect, u32 display_addr, u32 hal_format,
 	u32 bpp, int chn_idx, bool afbcd, bool mmu_enable)
 {
 	void __iomem *rdma_base;
@@ -1234,7 +1234,7 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 }
 
 static int hisi_dss_ovl_config(struct dss_hw_ctx *ctx,
-			       const dss_rect_ltrb_t *rect, u32 xres, u32 yres)
+			       const struct dss_rect_ltrb *rect, u32 xres, u32 yres)
 {
 	void __iomem *ovl0_base;
 
@@ -1524,7 +1524,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 
 	bool afbcd = false;
 	bool mmu_enable = false;
-	dss_rect_ltrb_t rect;
+	struct dss_rect_ltrb rect;
 	u32 bpp;
 	u32 stride;
 	u32 display_addr = 0;
@@ -1601,7 +1601,7 @@ void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane,
 
 	bool afbcd = false;
 	bool mmu_enable = false;
-	dss_rect_ltrb_t rect;
+	struct dss_rect_ltrb rect;
 	u32 bpp;
 	u32 stride;
 	u32 display_addr;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 5411113f148c..e7fb556befa1 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -1040,7 +1040,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	u32 tmp = 0;
 	bool is_ready = false;
 	struct mipi_panel_info *mipi = NULL;
-	dss_rect_t rect;
+	struct dss_rect rect;
 	u32 cmp_stopstate_val = 0;
 	u32 lanes;
 #if !defined(CONFIG_DRM_HISI_KIRIN970)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
