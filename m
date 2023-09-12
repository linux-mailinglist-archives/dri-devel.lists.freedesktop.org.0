Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75B7A420B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D6510E1E9;
	Mon, 18 Sep 2023 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064BD10E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:14 +0000 (UTC)
X-UUID: 1cf76c2e514211eea33bb35ae8d461a2-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YmoPx5RIEwQ6qp3POQn9VuEHPhqOstVlIWIex0rFdfk=; 
 b=sAHlguWRS2EAFR/5DMsSynB0kOE3LU5OhXe0aMc/es+liWfBtikBn1DclpMunfSozIllDPqDaWVqkBVgiwGb6sBdUkDUDXF3i+Nbvh/OlROKK0hlAYI8FRQv0So/DBZ/GhmDVrqwbLeOLLihENuyQNwozpTbh+SJrR0tdksaqTE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:650cc9ab-c81e-4b0d-99d2-436b7c3f9547, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:ce29d713-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1cf76c2e514211eea33bb35ae8d461a2-20230912
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 137644544; Tue, 12 Sep 2023 15:58:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Date: Tue, 12 Sep 2023 15:58:02 +0800
Message-ID: <20230912075805.11432-12-moudy.ho@mediatek.com>
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

Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
and corresponding driver data.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 666 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    |  36 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   6 +
 5 files changed, 712 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index b69fa0452612..e23647c202c6 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -46,12 +46,91 @@ enum mt8183_mdp_comp_id {
 	MT8183_MDP_COMP_WROT1,          /* 25 */
 };
 
+enum mt8195_mdp_comp_id {
+	/* MT8195 Comp id */
+	/* ISP */
+	MT8195_MDP_COMP_WPEI = 0,
+	MT8195_MDP_COMP_WPEO,           /* 1 */
+	MT8195_MDP_COMP_WPEI2,          /* 2 */
+	MT8195_MDP_COMP_WPEO2,          /* 3 */
+
+	/* MDP */
+	MT8195_MDP_COMP_CAMIN,          /* 4 */
+	MT8195_MDP_COMP_CAMIN2,         /* 5 */
+	MT8195_MDP_COMP_SPLIT,          /* 6 */
+	MT8195_MDP_COMP_SPLIT2,         /* 7 */
+	MT8195_MDP_COMP_RDMA0,          /* 8 */
+	MT8195_MDP_COMP_RDMA1,          /* 9 */
+	MT8195_MDP_COMP_RDMA2,          /* 10 */
+	MT8195_MDP_COMP_RDMA3,          /* 11 */
+	MT8195_MDP_COMP_STITCH,         /* 12 */
+	MT8195_MDP_COMP_FG0,            /* 13 */
+	MT8195_MDP_COMP_FG1,            /* 14 */
+	MT8195_MDP_COMP_FG2,            /* 15 */
+	MT8195_MDP_COMP_FG3,            /* 16 */
+	MT8195_MDP_COMP_TO_SVPP2MOUT,   /* 17 */
+	MT8195_MDP_COMP_TO_SVPP3MOUT,   /* 18 */
+	MT8195_MDP_COMP_TO_WARP0MOUT,   /* 19 */
+	MT8195_MDP_COMP_TO_WARP1MOUT,   /* 20 */
+	MT8195_MDP_COMP_VPP0_SOUT,      /* 21 */
+	MT8195_MDP_COMP_VPP1_SOUT,      /* 22 */
+	MT8195_MDP_COMP_PQ0_SOUT,       /* 23 */
+	MT8195_MDP_COMP_PQ1_SOUT,       /* 24 */
+	MT8195_MDP_COMP_HDR0,           /* 25 */
+	MT8195_MDP_COMP_HDR1,           /* 26 */
+	MT8195_MDP_COMP_HDR2,           /* 27 */
+	MT8195_MDP_COMP_HDR3,           /* 28 */
+	MT8195_MDP_COMP_AAL0,           /* 29 */
+	MT8195_MDP_COMP_AAL1,           /* 30 */
+	MT8195_MDP_COMP_AAL2,           /* 31 */
+	MT8195_MDP_COMP_AAL3,           /* 32 */
+	MT8195_MDP_COMP_RSZ0,           /* 33 */
+	MT8195_MDP_COMP_RSZ1,           /* 34 */
+	MT8195_MDP_COMP_RSZ2,           /* 35 */
+	MT8195_MDP_COMP_RSZ3,           /* 36 */
+	MT8195_MDP_COMP_TDSHP0,         /* 37 */
+	MT8195_MDP_COMP_TDSHP1,         /* 38 */
+	MT8195_MDP_COMP_TDSHP2,         /* 39 */
+	MT8195_MDP_COMP_TDSHP3,         /* 40 */
+	MT8195_MDP_COMP_COLOR0,         /* 41 */
+	MT8195_MDP_COMP_COLOR1,         /* 42 */
+	MT8195_MDP_COMP_COLOR2,         /* 43 */
+	MT8195_MDP_COMP_COLOR3,         /* 44 */
+	MT8195_MDP_COMP_OVL0,           /* 45 */
+	MT8195_MDP_COMP_OVL1,           /* 46 */
+	MT8195_MDP_COMP_PAD0,           /* 47 */
+	MT8195_MDP_COMP_PAD1,           /* 48 */
+	MT8195_MDP_COMP_PAD2,           /* 49 */
+	MT8195_MDP_COMP_PAD3,           /* 50 */
+	MT8195_MDP_COMP_TCC0,           /* 51 */
+	MT8195_MDP_COMP_TCC1,           /* 52 */
+	MT8195_MDP_COMP_WROT0,          /* 53 */
+	MT8195_MDP_COMP_WROT1,          /* 54 */
+	MT8195_MDP_COMP_WROT2,          /* 55 */
+	MT8195_MDP_COMP_WROT3,          /* 56 */
+	MT8195_MDP_COMP_MERGE2,         /* 57 */
+	MT8195_MDP_COMP_MERGE3,         /* 58 */
+
+	MT8195_MDP_COMP_VDO0DL0,        /* 59 */
+	MT8195_MDP_COMP_VDO1DL0,        /* 60 */
+	MT8195_MDP_COMP_VDO0DL1,        /* 61 */
+	MT8195_MDP_COMP_VDO1DL1,        /* 62 */
+};
+
 static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
 	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
 	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
 	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
 };
 
+static const struct of_device_id mt8195_mdp_probe_infra[MDP_INFRA_MAX] = {
+	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8195-vppsys0" },
+	[MDP_INFRA_MMSYS2] = { .compatible = "mediatek,mt8195-vppsys1" },
+	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8195-vpp-mutex" },
+	[MDP_INFRA_MUTEX2] = { .compatible = "mediatek,mt8195-vpp-mutex" },
+	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8195-scp" }
+};
+
 static const struct mdp_platform_config mt8183_plat_cfg = {
 	.rdma_support_10bit		= true,
 	.rdma_rsz1_sram_sharing		= true,
@@ -62,6 +141,21 @@ static const struct mdp_platform_config mt8183_plat_cfg = {
 	.wrot_event_num			= 1,
 };
 
+static const struct mdp_platform_config mt8195_plat_cfg = {
+	.rdma_support_10bit             = true,
+	.rdma_rsz1_sram_sharing         = false,
+	.rdma_upsample_repeat_only      = false,
+	.rdma_esl_setting		= true,
+	.rdma_event_num			= 4,
+	.rsz_disable_dcm_small_sample   = false,
+	.rsz_etc_control		= true,
+	.wrot_filter_constraint		= false,
+	.wrot_event_num			= 4,
+	.tdshp_hist_num			= 17,
+	.tdshp_constrain		= true,
+	.tdshp_contour			= true,
+};
+
 static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
 	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
@@ -73,6 +167,52 @@ static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
 };
 
+static const u32 mt8195_mutex_idx[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
+	[MDP_COMP_RDMA1] = MUTEX_MOD_IDX_MDP_RDMA1,
+	[MDP_COMP_RDMA2] = MUTEX_MOD_IDX_MDP_RDMA2,
+	[MDP_COMP_RDMA3] = MUTEX_MOD_IDX_MDP_RDMA3,
+	[MDP_COMP_STITCH] = MUTEX_MOD_IDX_MDP_STITCH0,
+	[MDP_COMP_FG0] = MUTEX_MOD_IDX_MDP_FG0,
+	[MDP_COMP_FG1] = MUTEX_MOD_IDX_MDP_FG1,
+	[MDP_COMP_FG2] = MUTEX_MOD_IDX_MDP_FG2,
+	[MDP_COMP_FG3] = MUTEX_MOD_IDX_MDP_FG3,
+	[MDP_COMP_HDR0] = MUTEX_MOD_IDX_MDP_HDR0,
+	[MDP_COMP_HDR1] = MUTEX_MOD_IDX_MDP_HDR1,
+	[MDP_COMP_HDR2] = MUTEX_MOD_IDX_MDP_HDR2,
+	[MDP_COMP_HDR3] = MUTEX_MOD_IDX_MDP_HDR3,
+	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
+	[MDP_COMP_AAL1] = MUTEX_MOD_IDX_MDP_AAL1,
+	[MDP_COMP_AAL2] = MUTEX_MOD_IDX_MDP_AAL2,
+	[MDP_COMP_AAL3] = MUTEX_MOD_IDX_MDP_AAL3,
+	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
+	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
+	[MDP_COMP_RSZ2] = MUTEX_MOD_IDX_MDP_RSZ2,
+	[MDP_COMP_RSZ3] = MUTEX_MOD_IDX_MDP_RSZ3,
+	[MDP_COMP_MERGE2] = MUTEX_MOD_IDX_MDP_MERGE2,
+	[MDP_COMP_MERGE3] = MUTEX_MOD_IDX_MDP_MERGE3,
+	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
+	[MDP_COMP_TDSHP1] = MUTEX_MOD_IDX_MDP_TDSHP1,
+	[MDP_COMP_TDSHP2] = MUTEX_MOD_IDX_MDP_TDSHP2,
+	[MDP_COMP_TDSHP3] = MUTEX_MOD_IDX_MDP_TDSHP3,
+	[MDP_COMP_COLOR0] = MUTEX_MOD_IDX_MDP_COLOR0,
+	[MDP_COMP_COLOR1] = MUTEX_MOD_IDX_MDP_COLOR1,
+	[MDP_COMP_COLOR2] = MUTEX_MOD_IDX_MDP_COLOR2,
+	[MDP_COMP_COLOR3] = MUTEX_MOD_IDX_MDP_COLOR3,
+	[MDP_COMP_OVL0] = MUTEX_MOD_IDX_MDP_OVL0,
+	[MDP_COMP_OVL1] = MUTEX_MOD_IDX_MDP_OVL1,
+	[MDP_COMP_PAD0] = MUTEX_MOD_IDX_MDP_PAD0,
+	[MDP_COMP_PAD1] = MUTEX_MOD_IDX_MDP_PAD1,
+	[MDP_COMP_PAD2] = MUTEX_MOD_IDX_MDP_PAD2,
+	[MDP_COMP_PAD3] = MUTEX_MOD_IDX_MDP_PAD3,
+	[MDP_COMP_TCC0] = MUTEX_MOD_IDX_MDP_TCC0,
+	[MDP_COMP_TCC1] = MUTEX_MOD_IDX_MDP_TCC1,
+	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
+	[MDP_COMP_WROT1] = MUTEX_MOD_IDX_MDP_WROT1,
+	[MDP_COMP_WROT2] = MUTEX_MOD_IDX_MDP_WROT2,
+	[MDP_COMP_WROT3] = MUTEX_MOD_IDX_MDP_WROT3,
+};
+
 static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_WPEI] = {
 		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI, 0},
@@ -148,6 +288,263 @@ static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	},
 };
 
+static const struct mdp_comp_data mt8195_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_WPEI] = {
+		{MDP_COMP_TYPE_WPEI, 0, MT8195_MDP_COMP_WPEI, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO] = {
+		{MDP_COMP_TYPE_EXTO, 2, MT8195_MDP_COMP_WPEO, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEI2] = {
+		{MDP_COMP_TYPE_WPEI, 1, MT8195_MDP_COMP_WPEI2, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_WPEO2] = {
+		{MDP_COMP_TYPE_EXTO, 3, MT8195_MDP_COMP_WPEO2, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_CAMIN] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_CAMIN, 0},
+		{3, 3, 0}
+	},
+	[MDP_COMP_CAMIN2] = {
+		{MDP_COMP_TYPE_DL_PATH, 1, MT8195_MDP_COMP_CAMIN2, 0},
+		{3, 6, 0}
+	},
+	[MDP_COMP_SPLIT] = {
+		{MDP_COMP_TYPE_SPLIT, 0, MT8195_MDP_COMP_SPLIT, 1},
+		{7, 0, 0}
+	},
+	[MDP_COMP_SPLIT2] = {
+		{MDP_COMP_TYPE_SPLIT, 1, MT8195_MDP_COMP_SPLIT2, 1},
+		{7, 0, 0}
+	},
+	[MDP_COMP_RDMA0] = {
+		{MDP_COMP_TYPE_RDMA, 0, MT8195_MDP_COMP_RDMA0, 0},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA1] = {
+		{MDP_COMP_TYPE_RDMA, 1, MT8195_MDP_COMP_RDMA1, 1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA2] = {
+		{MDP_COMP_TYPE_RDMA, 2, MT8195_MDP_COMP_RDMA2, 1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_RDMA3] = {
+		{MDP_COMP_TYPE_RDMA, 3, MT8195_MDP_COMP_RDMA3, 1},
+		{3, 0, 0}
+	},
+	[MDP_COMP_STITCH] = {
+		{MDP_COMP_TYPE_STITCH, 0, MT8195_MDP_COMP_STITCH, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG0] = {
+		{MDP_COMP_TYPE_FG, 0, MT8195_MDP_COMP_FG0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG1] = {
+		{MDP_COMP_TYPE_FG, 1, MT8195_MDP_COMP_FG1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG2] = {
+		{MDP_COMP_TYPE_FG, 2, MT8195_MDP_COMP_FG2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_FG3] = {
+		{MDP_COMP_TYPE_FG, 3, MT8195_MDP_COMP_FG3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR0] = {
+		{MDP_COMP_TYPE_HDR, 0, MT8195_MDP_COMP_HDR0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR1] = {
+		{MDP_COMP_TYPE_HDR, 1, MT8195_MDP_COMP_HDR1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR2] = {
+		{MDP_COMP_TYPE_HDR, 2, MT8195_MDP_COMP_HDR2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_HDR3] = {
+		{MDP_COMP_TYPE_HDR, 3, MT8195_MDP_COMP_HDR3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL0] = {
+		{MDP_COMP_TYPE_AAL, 0, MT8195_MDP_COMP_AAL0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL1] = {
+		{MDP_COMP_TYPE_AAL, 1, MT8195_MDP_COMP_AAL1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL2] = {
+		{MDP_COMP_TYPE_AAL, 2, MT8195_MDP_COMP_AAL2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_AAL3] = {
+		{MDP_COMP_TYPE_AAL, 3, MT8195_MDP_COMP_AAL3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ0] = {
+		{MDP_COMP_TYPE_RSZ, 0, MT8195_MDP_COMP_RSZ0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ1] = {
+		{MDP_COMP_TYPE_RSZ, 1, MT8195_MDP_COMP_RSZ1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_RSZ2] = {
+		{MDP_COMP_TYPE_RSZ, 2, MT8195_MDP_COMP_RSZ2, 1},
+		{2, 0, 0},
+		{MDP_COMP_MERGE2, true, true}
+	},
+	[MDP_COMP_RSZ3] = {
+		{MDP_COMP_TYPE_RSZ, 3, MT8195_MDP_COMP_RSZ3, 1},
+		{2, 0, 0},
+		{MDP_COMP_MERGE3, true, true}
+	},
+	[MDP_COMP_TDSHP0] = {
+		{MDP_COMP_TYPE_TDSHP, 0, MT8195_MDP_COMP_TDSHP0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP1] = {
+		{MDP_COMP_TYPE_TDSHP, 1, MT8195_MDP_COMP_TDSHP1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP2] = {
+		{MDP_COMP_TYPE_TDSHP, 2, MT8195_MDP_COMP_TDSHP2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TDSHP3] = {
+		{MDP_COMP_TYPE_TDSHP, 3, MT8195_MDP_COMP_TDSHP3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR0] = {
+		{MDP_COMP_TYPE_COLOR, 0, MT8195_MDP_COMP_COLOR0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR1] = {
+		{MDP_COMP_TYPE_COLOR, 1, MT8195_MDP_COMP_COLOR1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR2] = {
+		{MDP_COMP_TYPE_COLOR, 2, MT8195_MDP_COMP_COLOR2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_COLOR3] = {
+		{MDP_COMP_TYPE_COLOR, 3, MT8195_MDP_COMP_COLOR3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_OVL0] = {
+		{MDP_COMP_TYPE_OVL, 0, MT8195_MDP_COMP_OVL0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_OVL1] = {
+		{MDP_COMP_TYPE_OVL, 1, MT8195_MDP_COMP_OVL1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD0] = {
+		{MDP_COMP_TYPE_PAD, 0, MT8195_MDP_COMP_PAD0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD1] = {
+		{MDP_COMP_TYPE_PAD, 1, MT8195_MDP_COMP_PAD1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD2] = {
+		{MDP_COMP_TYPE_PAD, 2, MT8195_MDP_COMP_PAD2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PAD3] = {
+		{MDP_COMP_TYPE_PAD, 3, MT8195_MDP_COMP_PAD3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TCC0] = {
+		{MDP_COMP_TYPE_TCC, 0, MT8195_MDP_COMP_TCC0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_TCC1] = {
+		{MDP_COMP_TYPE_TCC, 1, MT8195_MDP_COMP_TCC1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT0] = {
+		{MDP_COMP_TYPE_WROT, 0, MT8195_MDP_COMP_WROT0, 0},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT1] = {
+		{MDP_COMP_TYPE_WROT, 1, MT8195_MDP_COMP_WROT1, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT2] = {
+		{MDP_COMP_TYPE_WROT, 2, MT8195_MDP_COMP_WROT2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_WROT3] = {
+		{MDP_COMP_TYPE_WROT, 3, MT8195_MDP_COMP_WROT3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_MERGE2] = {
+		{MDP_COMP_TYPE_MERGE, 0, MT8195_MDP_COMP_MERGE2, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_MERGE3] = {
+		{MDP_COMP_TYPE_MERGE, 1, MT8195_MDP_COMP_MERGE3, 1},
+		{1, 0, 0}
+	},
+	[MDP_COMP_PQ0_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 0, MT8195_MDP_COMP_PQ0_SOUT, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_PQ1_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 1, MT8195_MDP_COMP_PQ1_SOUT, 1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_WARP0MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 2, MT8195_MDP_COMP_TO_WARP0MOUT, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_WARP1MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 3, MT8195_MDP_COMP_TO_WARP1MOUT, 0},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP2MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 4, MT8195_MDP_COMP_TO_SVPP2MOUT, 1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_TO_SVPP3MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 5, MT8195_MDP_COMP_TO_SVPP3MOUT, 1},
+		{0, 0, 0}
+	},
+	[MDP_COMP_VPP0_SOUT] = {
+		{MDP_COMP_TYPE_PATH, 0, MT8195_MDP_COMP_VPP0_SOUT, 1},
+		{4, 9, 0}
+	},
+	[MDP_COMP_VPP1_SOUT] = {
+		{MDP_COMP_TYPE_PATH, 1, MT8195_MDP_COMP_VPP1_SOUT, 0},
+		{2, 13, 0}
+	},
+	[MDP_COMP_VDO0DL0] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO0DL0, 1},
+		{1, 15, 0}
+	},
+	[MDP_COMP_VDO1DL0] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO1DL0, 1},
+		{1, 17, 0}
+	},
+	[MDP_COMP_VDO0DL1] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO0DL1, 1},
+		{1, 18, 0}
+	},
+	[MDP_COMP_VDO1DL1] = {
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8195_MDP_COMP_VDO1DL1, 1},
+		{1, 16, 0}
+	},
+};
+
 static const struct of_device_id mt8183_sub_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-wdma",
@@ -159,6 +556,10 @@ static const struct of_device_id mt8183_sub_comp_dt_ids[] = {
 	{}
 };
 
+static const struct of_device_id mt8195_sub_comp_dt_ids[] = {
+	{}
+};
+
 /*
  * All 10-bit related formats are not added in the basic format list,
  * please add the corresponding format settings before use.
@@ -384,6 +785,222 @@ static const struct mdp_format mt8183_formats[] = {
 	}
 };
 
+static const struct mdp_format mt8195_formats[] = {
+	{
+		.pixelformat	= V4L2_PIX_FMT_GREY,
+		.mdp_color	= MDP_COLOR_GREY,
+		.depth		= { 8 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mdp_color	= MDP_COLOR_BGR565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mdp_color	= MDP_COLOR_RGB565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB24,
+		.mdp_color	= MDP_COLOR_RGB888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_BGR24,
+		.mdp_color	= MDP_COLOR_BGR888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ABGR32,
+		.mdp_color	= MDP_COLOR_BGRA8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ARGB32,
+		.mdp_color	= MDP_COLOR_ARGB8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mdp_color	= MDP_COLOR_UYVY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mdp_color	= MDP_COLOR_VYUY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mdp_color	= MDP_COLOR_YUYV,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mdp_color	= MDP_COLOR_YVYU,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.mdp_color	= MDP_COLOR_420_BLK,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 6,
+		.halign		= 6,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV422M,
+		.mdp_color	= MDP_COLOR_I422,
+		.depth		= { 8, 4, 4 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU422M,
+		.mdp_color	= MDP_COLOR_YV16,
+		.depth		= { 8, 4, 4 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}
+};
+
 static const struct mdp_limit mt8183_mdp_def_limit = {
 	.out_limit = {
 		.wmin	= 16,
@@ -403,6 +1020,25 @@ static const struct mdp_limit mt8183_mdp_def_limit = {
 	.v_scale_down_max = 128,
 };
 
+static const struct mdp_limit mt8195_mdp_def_limit = {
+	.out_limit = {
+		.wmin	= 64,
+		.hmin	= 64,
+		.wmax	= 8192,
+		.hmax	= 8192,
+	},
+	.cap_limit = {
+		.wmin	= 64,
+		.hmin	= 64,
+		.wmax	= 8192,
+		.hmax	= 8192,
+	},
+	.h_scale_up_max = 64,
+	.v_scale_up_max = 64,
+	.h_scale_down_max = 128,
+	.v_scale_down_max = 128,
+};
+
 static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, 0, 0},
 	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, 0, 1},
@@ -410,6 +1046,20 @@ static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, 0, 3}
 };
 
+static const struct mdp_pipe_info mt8195_pipe_info[] = {
+	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, 0, 0},
+	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, 0, 1},
+	[MDP_PIPE_IMGI] = {MDP_PIPE_IMGI, 0, 2},
+	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, 0, 3},
+	[MDP_PIPE_RDMA1] = {MDP_PIPE_RDMA1, 1, 0},
+	[MDP_PIPE_RDMA2] = {MDP_PIPE_RDMA2, 1, 1},
+	[MDP_PIPE_RDMA3] = {MDP_PIPE_RDMA3, 1, 2},
+	[MDP_PIPE_SPLIT] = {MDP_PIPE_SPLIT, 1, 3},
+	[MDP_PIPE_SPLIT2] = {MDP_PIPE_SPLIT2, 1, 4},
+	[MDP_PIPE_VPP1_SOUT] = {MDP_PIPE_VPP1_SOUT, 0, 4},
+	[MDP_PIPE_VPP0_SOUT] = {MDP_PIPE_VPP0_SOUT, 1, 5},
+};
+
 const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_plat_id = MT8183,
 	.mdp_con_res = 0x14001000,
@@ -426,6 +1076,22 @@ const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.pipe_info_len = ARRAY_SIZE(mt8183_pipe_info),
 };
 
+const struct mtk_mdp_driver_data mt8195_mdp_driver_data = {
+	.mdp_plat_id = MT8195,
+	.mdp_con_res = 0x14001000,
+	.mdp_probe_infra = mt8195_mdp_probe_infra,
+	.mdp_sub_comp_dt_ids = mt8195_sub_comp_dt_ids,
+	.mdp_cfg = &mt8195_plat_cfg,
+	.mdp_mutex_table_idx = mt8195_mutex_idx,
+	.comp_data = mt8195_mdp_comp_data,
+	.comp_data_len = ARRAY_SIZE(mt8195_mdp_comp_data),
+	.format = mt8195_formats,
+	.format_len = ARRAY_SIZE(mt8195_formats),
+	.def_limit = &mt8195_mdp_def_limit,
+	.pipe_info = mt8195_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8195_pipe_info),
+};
+
 s32 mdp_cfg_get_id_inner(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
 {
 	if (!mdp_dev)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
index dfffc72868e4..49cdf45f6e59 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 
 extern const struct mtk_mdp_driver_data mt8183_mdp_driver_data;
+extern const struct mtk_mdp_driver_data mt8195_mdp_driver_data;
 
 struct mdp_dev;
 enum mtk_mdp_comp_id;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index bb21fa2f5c3b..e2887e01d2d8 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -767,6 +767,42 @@ static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wdma",
 		.data = (void *)MDP_COMP_TYPE_WDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-rdma",
+		.data = (void *)MDP_COMP_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-split",
+		.data = (void *)MDP_COMP_TYPE_SPLIT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-stitch",
+		.data = (void *)MDP_COMP_TYPE_STITCH,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg",
+		.data = (void *)MDP_COMP_TYPE_FG,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr",
+		.data = (void *)MDP_COMP_TYPE_HDR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal",
+		.data = (void *)MDP_COMP_TYPE_AAL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-merge",
+		.data = (void *)MDP_COMP_TYPE_MERGE,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp",
+		.data = (void *)MDP_COMP_TYPE_TDSHP,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color",
+		.data = (void *)MDP_COMP_TYPE_COLOR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-ovl",
+		.data = (void *)MDP_COMP_TYPE_OVL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad",
+		.data = (void *)MDP_COMP_TYPE_PAD,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tcc",
+		.data = (void *)MDP_COMP_TYPE_TCC,
 	},
 	{}
 };
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 06b7d2b0b814..8b69bd8b91c6 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -21,6 +21,9 @@ static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3-rdma",
 	  .data = &mt8183_mdp_driver_data,
 	},
+	{ .compatible = "mediatek,mt8195-mdp3-rdma",
+	  .data = &mt8195_mdp_driver_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mdp_of_ids);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index b2a3e4b2ee1a..3dd8a89cd6ab 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -39,10 +39,16 @@ struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
 	bool	rdma_upsample_repeat_only;
+	bool	rdma_esl_setting;
 	u32	rdma_event_num;
 	bool	rsz_disable_dcm_small_sample;
+	bool	rsz_etc_control;
 	bool	wrot_filter_constraint;
+	bool	wrot_support_10bit;
 	u32	wrot_event_num;
+	u32	tdshp_hist_num;
+	bool	tdshp_constrain;
+	bool	tdshp_contour;
 };
 
 /* indicate which mutex is used by each pipepline */
-- 
2.18.0

