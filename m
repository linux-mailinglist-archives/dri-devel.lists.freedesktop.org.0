Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69B7A41FB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1810E1CC;
	Mon, 18 Sep 2023 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717EB10E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:14 +0000 (UTC)
X-UUID: 1c9587ac514211ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RNTVy9AacJES7wW9DpJtDoveuOJt0uOZcybu2/uFRUw=; 
 b=d1plwFeitzGoujtOOacVwiXXDN98UjDO6xKoBNu0HXOL4e5/j7Qde88AfGG7LVb051dfSPxf6mRPbWv7vB06o2cwQaIzFIyxq6qAXBoup9r2RcMwKzWryAgnznK9sHY+54BXfLHz5+Uv0h39oAyOTXtLy3z+TlQ4kuivRhCeDvw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:7cde598e-4838-4594-bad6-8ccb71de092a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:d3a9edc2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c9587ac514211ee8051498923ad61e6-20230912
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 628305077; Tue, 12 Sep 2023 15:58:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:08 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 12/14] media: platform: mtk-mdp3: add mt8195 shared memory
 configurations
Date: Tue, 12 Sep 2023 15:58:03 +0800
Message-ID: <20230912075805.11432-13-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The configuration of the MT8195 components in the shared memory
is defined in the header file "mdp_sm_mt8195.h".

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
 2 files changed, 287 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h b/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
new file mode 100644
index 000000000000..b09f48222d24
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_SM_MT8195_H__
+#define __MDP_SM_MT8195_H__
+
+#include "mtk-mdp3-type.h"
+
+/*
+ * ISP-MDP generic output information
+ * MD5 of the target SCP prebuild:
+ *     a49ec487e458b5971880f1b63dc2a9d5
+ */
+
+#define IMG_MAX_SUBFRAMES_8195	20
+
+struct img_comp_frame_8195 {
+	u32 output_disable;
+	u32 bypass;
+	u32 in_width;
+	u32 in_height;
+	u32 out_width;
+	u32 out_height;
+	struct img_crop crop;
+	u32 in_total_width;
+	u32 out_total_width;
+} __packed;
+
+struct img_comp_subfrm_8195 {
+	u32 tile_disable;
+	struct img_region in;
+	struct img_region out;
+	struct img_offset luma;
+	struct img_offset chroma;
+	s32 out_vertical; /* Output vertical index */
+	s32 out_horizontal; /* Output horizontal index */
+} __packed;
+
+struct mdp_rdma_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 offset_0_p;
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 in_tile_xleft;
+	u32 in_tile_ytop;
+} __packed;
+
+struct mdp_rdma_data_8195 {
+	u32 src_ctrl;
+	u32 comp_ctrl;
+	u32 control;
+	u32 iova[IMG_MAX_PLANES];
+	u32 iova_end[IMG_MAX_PLANES];
+	u32 mf_bkgd;
+	u32 mf_bkgd_in_pxl;
+	u32 sf_bkgd;
+	u32 ufo_dec_y;
+	u32 ufo_dec_c;
+	u32 transform;
+	u32 dmabuf_con0;
+	u32 ultra_th_high_con0;
+	u32 ultra_th_low_con0;
+	u32 dmabuf_con1;
+	u32 ultra_th_high_con1;
+	u32 ultra_th_low_con1;
+	u32 dmabuf_con2;
+	u32 ultra_th_high_con2;
+	u32 ultra_th_low_con2;
+	u32 dmabuf_con3;
+	struct mdp_rdma_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_fg_subfrm_8195 {
+	u32 info_0;
+	u32 info_1;
+} __packed;
+
+struct mdp_fg_data_8195 {
+	u32 ctrl_0;
+	u32 ck_en;
+	struct mdp_fg_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_hdr_subfrm_8195 {
+	u32 win_size;
+	u32 src;
+	u32 clip_ofst0;
+	u32 clip_ofst1;
+	u32 hist_ctrl_0;
+	u32 hist_ctrl_1;
+	u32 hdr_top;
+	u32 hist_addr;
+} __packed;
+
+struct mdp_hdr_data_8195 {
+	u32 top;
+	u32 relay;
+	struct mdp_hdr_subfrm_8195   subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_aal_subfrm_8195 {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_aal_data_8195 {
+	u32 cfg_main;
+	u32 cfg;
+	struct mdp_aal_subfrm_8195   subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_rsz_subfrm_8195 {
+	u32 control2;
+	u32 src;
+	u32 clip;
+	u32 hdmirx_en;
+	u32 luma_h_int_ofst;
+	u32 luma_h_sub_ofst;
+	u32 luma_v_int_ofst;
+	u32 luma_v_sub_ofst;
+	u32 chroma_h_int_ofst;
+	u32 chroma_h_sub_ofst;
+	u32 rsz_switch;
+	u32 merge_cfg;
+} __packed;
+
+struct mdp_rsz_data_8195 {
+	u32 coeff_step_x;
+	u32 coeff_step_y;
+	u32 control1;
+	u32 control2;
+	u32 etc_control;
+	u32 prz_enable;
+	u32 ibse_softclip;
+	u32 tap_adapt;
+	u32 ibse_gaincontrol1;
+	u32 ibse_gaincontrol2;
+	u32 ibse_ylevel_1;
+	u32 ibse_ylevel_2;
+	u32 ibse_ylevel_3;
+	u32 ibse_ylevel_4;
+	u32 ibse_ylevel_5;
+	struct mdp_rsz_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_tdshp_subfrm_8195 {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 hist_cfg_0;
+	u32 hist_cfg_1;
+} __packed;
+
+struct mdp_tdshp_data_8195 {
+	u32 cfg;
+	struct mdp_tdshp_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_color_subfrm_8195 {
+	u32 in_hsize;
+	u32 in_vsize;
+} __packed;
+
+struct mdp_color_data_8195 {
+	u32 start;
+	struct mdp_color_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_ovl_subfrm_8195 {
+	u32 L0_src_size;
+	u32 roi_size;
+} __packed;
+
+struct mdp_ovl_data_8195 {
+	u32 L0_con;
+	u32 src_con;
+	struct mdp_ovl_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_pad_subfrm_8195 {
+	u32 pic_size;
+} __packed;
+
+struct mdp_pad_data_8195 {
+	struct mdp_pad_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_tcc_subfrm_8195 {
+	u32 pic_size;
+} __packed;
+
+struct mdp_tcc_data_8195 {
+	struct mdp_tcc_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_wrot_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 main_buf;
+} __packed;
+
+struct mdp_wrot_data_8195 {
+	u32 iova[IMG_MAX_PLANES];
+	u32 control;
+	u32 stride[IMG_MAX_PLANES];
+	u32 mat_ctrl;
+	u32 fifo_test;
+	u32 filter;
+	u32 pre_ultra;
+	u32 framesize;
+	u32 afbc_yuvtrans;
+	u32 scan_10bit;
+	u32 pending_zero;
+	u32 bit_number;
+	u32 pvric;
+	u32 vpp02vpp1;
+	struct mdp_wrot_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct mdp_wdma_subfrm_8195 {
+	u32 offset[IMG_MAX_PLANES];
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_wdma_data_8195 {
+	u32 wdma_cfg;
+	u32 iova[IMG_MAX_PLANES];
+	u32 w_in_byte;
+	u32 uv_stride;
+	struct mdp_wdma_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct isp_data_8195 {
+	u64 dl_flags; /* 1 << (enum mdp_comp_type) */
+	u32 smxi_iova[4];
+	u32 cq_idx;
+	u32 cq_iova;
+	u32 tpipe_iova[IMG_MAX_SUBFRAMES_8195];
+} __packed;
+
+struct img_compparam_8195 {
+	u32 type; /* enum mdp_comp_id */
+	u32 id; /* engine alias_id */
+	u32 input;
+	u32 outputs[IMG_MAX_HW_OUTPUTS];
+	u32 num_outputs;
+	struct img_comp_frame_8195 frame;
+	struct img_comp_subfrm_8195 subfrms[IMG_MAX_SUBFRAMES_8195];
+	u32 num_subfrms;
+	union {
+		struct mdp_rdma_data_8195 rdma;
+		struct mdp_fg_data_8195 fg;
+		struct mdp_hdr_data_8195 hdr;
+		struct mdp_aal_data_8195 aal;
+		struct mdp_rsz_data_8195 rsz;
+		struct mdp_tdshp_data_8195 tdshp;
+		struct mdp_color_data_8195 color;
+		struct mdp_ovl_data_8195 ovl;
+		struct mdp_pad_data_8195 pad;
+		struct mdp_tcc_data_8195 tcc;
+		struct mdp_wrot_data_8195 wrot;
+		struct mdp_wdma_data_8195 wdma;
+		struct isp_data_8195 isp;
+	};
+} __packed;
+
+struct img_config_8195 {
+	struct img_compparam_8195 components[IMG_MAX_COMPONENTS];
+	u32 num_components;
+	struct img_mmsys_ctrl ctrls[IMG_MAX_SUBFRAMES_8195];
+	u32 num_subfrms;
+} __packed;
+
+#endif  /* __MDP_SM_MT8195_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index 22b8b9a10ef7..f83ac408306e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -10,6 +10,7 @@
 
 #include <linux/err.h>
 #include "mdp_sm_mt8183.h"
+#include "mdp_sm_mt8195.h"
 #include "mtk-mdp3-type.h"
 
 /* ISP-MDP generic input information */
@@ -115,6 +116,7 @@ struct img_frameparam {
 
 /* Platform config indicator */
 #define MT8183 8183
+#define MT8195 8195
 
 #define CFG_CHECK(plat, p_id) ((plat) == (p_id))
 
@@ -137,12 +139,14 @@ struct img_frameparam {
 struct img_config {
 	union {
 		struct img_config_8183 config_8183;
+		struct img_config_8195 config_8195;
 	};
 } __packed;
 
 struct img_compparam {
 	union {
 		struct img_compparam_8183 comp_8183;
+		struct img_compparam_8195 comp_8195;
 	};
 } __packed;
 
-- 
2.18.0

