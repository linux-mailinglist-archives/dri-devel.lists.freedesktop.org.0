Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED983CC4B8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 19:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C306EA97;
	Sat, 17 Jul 2021 17:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF706EA1D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:09:31 +0000 (UTC)
X-UUID: f94fa4bd03394afebd4ff602a4348bed-20210717
X-UUID: f94fa4bd03394afebd4ff602a4348bed-20210717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2076825035; Sat, 17 Jul 2021 17:04:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 04/10] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Date: Sat, 17 Jul 2021 17:04:02 +0800
Message-ID: <20210717090408.28283-5-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 17:08:05 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mt8195 vdosys1 clock driver name and routing table to
the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 83 ++++++++++++++++++++++++--
 drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
 include/linux/soc/mediatek/mtk-mmsys.h |  3 +
 3 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 73e9e8286d50..bc4e291dbe35 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -64,16 +64,16 @@
 #define SOUT_TO_VPP_MERGE0_P1_SEL				(1 << 0)
 
 #define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
-#define SOUT_TO_HDR_VDO_FE0					(0 << 0)
+#define SOUT_TO_MIXER_IN1_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
-#define SOUT_TO_HDR_VDO_FE1					(0 << 0)
+#define SOUT_TO_MIXER_IN2_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
-#define SOUT_TO_HDR_GFX_FE0					(0 << 0)
+#define SOUT_TO_MIXER_IN3_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
-#define SOUT_TO_HDR_GFX_FE1					(0 << 0)
+#define SOUT_TO_MIXER_IN4_SEL					(1 << 0)
 
 #define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
 #define MIXER_IN1_SOUT_TO_DISP_MIXER				(0 << 0)
@@ -88,7 +88,7 @@
 #define MIXER_IN4_SOUT_TO_DISP_MIXER				(0 << 0)
 
 #define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
-#define MIXER_SOUT_TO_HDR_VDO_BE0				(0 << 0)
+#define MIXER_SOUT_TO_MERGE4_ASYNC_SEL				(1 << 0)
 
 #define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
 #define MERGE4_SOUT_TO_VDOSYS0					(0 << 0)
@@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}, {
 		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
 		MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN1_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN2_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN3_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN4_SEL
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_DISP_DPI1_SEL_IN, DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DPI1_SEL
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
+		DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DP_INTF0_SEL
 	}
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1fb241750897..9e31aad6c5c8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -168,6 +174,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 34cb605e5df9..f9b227a07fe6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -49,6 +49,9 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSC1_VIRTUAL0,
 	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
+	DDP_COMPONENT_PSEUDO_OVL,
+	DDP_COMPONENT_ETHDR,
 	DDP_COMPONENT_ID_MAX,
 };
 
-- 
2.18.0

