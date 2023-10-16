Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B97CA5D7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10F810E1B1;
	Mon, 16 Oct 2023 10:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C4A10E19F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:40:23 +0000 (UTC)
X-UUID: 648783246c1011ee8051498923ad61e6-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d+LzXIKA/zBp7PUzjcKv+Ltc19EYgBayeljoDsVzf8s=; 
 b=PLof5fSsxk3AOvyYT8V4Pb2m1yDB52v4MW7xm9P4hTdUTV3PtrrKhzzyGFF2USE76NEYDyj8rtgm++YmfWuO6kH7CfVf0Oolz1cPGShoI2UM2nc9Y/7VDScj3nEU8v3LDpDNdGzk6Mv01M0qDvRu3eNxme+HEJyczNl7ULp19Zg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:167a505a-4e4b-4a50-b166-e39fc1818a6b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:f9bb2dc4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 648783246c1011ee8051498923ad61e6-20231016
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1632837691; Mon, 16 Oct 2023 18:40:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:14 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 10/23] soc: mediatek: Add MT8188 VDOSYS reset bit map
Date: Mon, 16 Oct 2023 18:39:57 +0800
Message-ID: <20231016104010.3270-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.042400-8.000000
X-TMASE-MatchedRID: 9DomuZeNnSapk9YSiEd5IufHZObG8Jso6SXuwUgGH0hbKBBN5zqG8EiO
 7+wNDdeYRHLRFcKKZXfbCHv011Gy9VSU1d+VJ4IjtG07VELUSnRfohHCqSnabgTozVi1xfq8MJK
 6qaU5tN00ULOv9iNOM0q+cX2jmfqvmxh0gY/o+VmiAZ3zAhQYgn0tCKdnhB589yM15V5aWpj6C0
 ePs7A07fyjtizU0rhjVyJ6Rrqx+FNSRMjv86A6CPVU14ep5TZkqBHnAYeJC8o=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.042400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1560774F9B31785BA489B0CCCD36CB352635536E4F56D43D532D63E15EF4E6C22000:8
X-MTK: N
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MT8188 reset bit map for VDOSYS0 and VDOSYS1.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 84 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  7 ++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index a9490c3c4256..6bebf1a69fc0 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -3,6 +3,10 @@
 #ifndef __SOC_MEDIATEK_MT8188_MMSYS_H
 #define __SOC_MEDIATEK_MT8188_MMSYS_H
 
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <dt-bindings/reset/mt8188-resets.h>
+
+#define MT8188_VDO0_SW0_RST_B				0x190
 #define MT8188_VDO0_OVL_MOUT_EN				0xf14
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0		BIT(0)
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0		BIT(1)
@@ -67,6 +71,7 @@
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE		BIT(18)
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_DISP_WDMA0		BIT(19)
 
+#define MT8188_VDO1_SW0_RST_B					0x1d0
 #define MT8188_VDO1_HDR_TOP_CFG					0xd00
 #define MT8188_VDO1_MIXER_IN1_ALPHA				0xd30
 #define MT8188_VDO1_MIXER_IN1_PAD				0xd40
@@ -117,6 +122,85 @@
 #define MT8188_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8188_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		0
 
+static const u8 mmsys_mt8188_vdo0_rst_tb[] = {
+	[MT8188_VDO0_RST_DISP_OVL0]	= MMSYS_RST_NR(0, 0),
+	[MT8188_VDO0_RST_FAKE_ENG0]	= MMSYS_RST_NR(0, 2),
+	[MT8188_VDO0_RST_DISP_CCORR0]	= MMSYS_RST_NR(0, 4),
+	[MT8188_VDO0_RST_DISP_MUTEX0]	= MMSYS_RST_NR(0, 6),
+	[MT8188_VDO0_RST_DISP_GAMMA0]	= MMSYS_RST_NR(0, 8),
+	[MT8188_VDO0_RST_DISP_DITHER0]	= MMSYS_RST_NR(0, 10),
+	[MT8188_VDO0_RST_DISP_WDMA0]	= MMSYS_RST_NR(0, 17),
+	[MT8188_VDO0_RST_DISP_RDMA0]	= MMSYS_RST_NR(0, 19),
+	[MT8188_VDO0_RST_DSI0]		= MMSYS_RST_NR(0, 21),
+	[MT8188_VDO0_RST_DSI1]		= MMSYS_RST_NR(0, 22),
+	[MT8188_VDO0_RST_DSC_WRAP0]	= MMSYS_RST_NR(0, 23),
+	[MT8188_VDO0_RST_VPP_MERGE0]	= MMSYS_RST_NR(0, 24),
+	[MT8188_VDO0_RST_DP_INTF0]	= MMSYS_RST_NR(0, 25),
+	[MT8188_VDO0_RST_DISP_AAL0]	= MMSYS_RST_NR(0, 26),
+	[MT8188_VDO0_RST_INLINEROT0]	= MMSYS_RST_NR(0, 27),
+	[MT8188_VDO0_RST_APB_BUS]	= MMSYS_RST_NR(0, 28),
+	[MT8188_VDO0_RST_DISP_COLOR0]	= MMSYS_RST_NR(0, 29),
+	[MT8188_VDO0_RST_MDP_WROT0]	= MMSYS_RST_NR(0, 30),
+	[MT8188_VDO0_RST_DISP_RSZ0]	= MMSYS_RST_NR(0, 31),
+};
+
+static const u8 mmsys_mt8188_vdo1_rst_tb[] = {
+	[MT8188_VDO1_RST_SMI_LARB2]			= MMSYS_RST_NR(0, 0),
+	[MT8188_VDO1_RST_SMI_LARB3]			= MMSYS_RST_NR(0, 1),
+	[MT8188_VDO1_RST_GALS]				= MMSYS_RST_NR(0, 2),
+	[MT8188_VDO1_RST_FAKE_ENG0]			= MMSYS_RST_NR(0, 3),
+	[MT8188_VDO1_RST_FAKE_ENG1]			= MMSYS_RST_NR(0, 4),
+	[MT8188_VDO1_RST_MDP_RDMA0]			= MMSYS_RST_NR(0, 5),
+	[MT8188_VDO1_RST_MDP_RDMA1]			= MMSYS_RST_NR(0, 6),
+	[MT8188_VDO1_RST_MDP_RDMA2]			= MMSYS_RST_NR(0, 7),
+	[MT8188_VDO1_RST_MDP_RDMA3]			= MMSYS_RST_NR(0, 8),
+	[MT8188_VDO1_RST_VPP_MERGE0]			= MMSYS_RST_NR(0, 9),
+	[MT8188_VDO1_RST_VPP_MERGE1]			= MMSYS_RST_NR(0, 10),
+	[MT8188_VDO1_RST_VPP_MERGE2]			= MMSYS_RST_NR(0, 11),
+	[MT8188_VDO1_RST_VPP_MERGE3]			= MMSYS_RST_NR(1, 0),
+	[MT8188_VDO1_RST_VPP_MERGE4]			= MMSYS_RST_NR(1, 1),
+	[MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 2),
+	[MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 3),
+	[MT8188_VDO1_RST_DISP_MUTEX]			= MMSYS_RST_NR(1, 4),
+	[MT8188_VDO1_RST_MDP_RDMA4]			= MMSYS_RST_NR(1, 5),
+	[MT8188_VDO1_RST_MDP_RDMA5]			= MMSYS_RST_NR(1, 6),
+	[MT8188_VDO1_RST_MDP_RDMA6]			= MMSYS_RST_NR(1, 7),
+	[MT8188_VDO1_RST_MDP_RDMA7]			= MMSYS_RST_NR(1, 8),
+	[MT8188_VDO1_RST_DP_INTF1_MMCK]			= MMSYS_RST_NR(1, 9),
+	[MT8188_VDO1_RST_DPI0_MM_CK]			= MMSYS_RST_NR(1, 10),
+	[MT8188_VDO1_RST_DPI1_MM_CK]			= MMSYS_RST_NR(1, 11),
+	[MT8188_VDO1_RST_MERGE0_DL_ASYNC]		= MMSYS_RST_NR(1, 13),
+	[MT8188_VDO1_RST_MERGE1_DL_ASYNC]		= MMSYS_RST_NR(1, 14),
+	[MT8188_VDO1_RST_MERGE2_DL_ASYNC]		= MMSYS_RST_NR(1, 15),
+	[MT8188_VDO1_RST_MERGE3_DL_ASYNC]		= MMSYS_RST_NR(1, 16),
+	[MT8188_VDO1_RST_MERGE4_DL_ASYNC]		= MMSYS_RST_NR(1, 17),
+	[MT8188_VDO1_RST_VDO0_DSC_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 18),
+	[MT8188_VDO1_RST_VDO0_MERGE_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 19),
+	[MT8188_VDO1_RST_PADDING0]			= MMSYS_RST_NR(1, 20),
+	[MT8188_VDO1_RST_PADDING1]			= MMSYS_RST_NR(1, 21),
+	[MT8188_VDO1_RST_PADDING2]			= MMSYS_RST_NR(1, 22),
+	[MT8188_VDO1_RST_PADDING3]			= MMSYS_RST_NR(1, 23),
+	[MT8188_VDO1_RST_PADDING4]			= MMSYS_RST_NR(1, 24),
+	[MT8188_VDO1_RST_PADDING5]			= MMSYS_RST_NR(1, 25),
+	[MT8188_VDO1_RST_PADDING6]			= MMSYS_RST_NR(1, 26),
+	[MT8188_VDO1_RST_PADDING7]			= MMSYS_RST_NR(1, 27),
+	[MT8188_VDO1_RST_DISP_RSZ0]			= MMSYS_RST_NR(1, 28),
+	[MT8188_VDO1_RST_DISP_RSZ1]			= MMSYS_RST_NR(1, 29),
+	[MT8188_VDO1_RST_DISP_RSZ2]			= MMSYS_RST_NR(1, 30),
+	[MT8188_VDO1_RST_DISP_RSZ3]			= MMSYS_RST_NR(1, 31),
+	[MT8188_VDO1_RST_HDR_VDO_FE0]			= MMSYS_RST_NR(2, 0),
+	[MT8188_VDO1_RST_HDR_GFX_FE0]			= MMSYS_RST_NR(2, 1),
+	[MT8188_VDO1_RST_HDR_VDO_BE]			= MMSYS_RST_NR(2, 2),
+	[MT8188_VDO1_RST_HDR_VDO_FE1]			= MMSYS_RST_NR(2, 16),
+	[MT8188_VDO1_RST_HDR_GFX_FE1]			= MMSYS_RST_NR(2, 17),
+	[MT8188_VDO1_RST_DISP_MIXER]			= MMSYS_RST_NR(2, 18),
+	[MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 19),
+	[MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 20),
+	[MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 21),
+	[MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 22),
+	[MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC]		= MMSYS_RST_NR(2, 23),
+};
+
 static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 3a7108eefe9d..a456c3e0aee7 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -87,13 +87,18 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.clk_driver = "clk-mt8188-vdo0",
 	.routes = mmsys_mt8188_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
+	.sw0_rst_offset = MT8188_VDO0_SW0_RST_B,
+	.rst_tb = mmsys_mt8188_vdo0_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8188_vdo0_rst_tb),
 };
 
 static const struct mtk_mmsys_driver_data mt8188_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8188-vdo1",
 	.routes = mmsys_mt8188_vdo1_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_vdo1_routing_table),
-	.num_resets = 96,
+	.sw0_rst_offset = MT8188_VDO1_SW0_RST_B,
+	.rst_tb = mmsys_mt8188_vdo1_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8188_vdo1_rst_tb),
 	.vsync_len = 1,
 };
 
-- 
2.18.0

