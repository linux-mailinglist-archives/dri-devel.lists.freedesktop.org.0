Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7FD4FD7D9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC3310E552;
	Tue, 12 Apr 2022 10:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059AA10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:31:23 +0000 (UTC)
X-UUID: 7d340f2ae4114eeb9dc3920632a884b2-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:49055209-42bb-48b0-9c61-4d72c8013184, OB:40,
 L
 OB:50,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:49055209-42bb-48b0-9c61-4d72c8013184, OB:40,
 LOB
 :50,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:e1102278-0afa-4dca-bdec-ca54c998425a,
 C
 OID:e31c88b20976,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 7d340f2ae4114eeb9dc3920632a884b2-20220412
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 22711857; Tue, 12 Apr 2022 18:31:16 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 18:31:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 18:31:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 18:31:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v18 03/10] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Date: Tue, 12 Apr 2022 18:31:07 +0800
Message-ID: <20220412103114.19922-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, devicetree@vger.kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Add mt8195 mmsys compatible for 2 vdosys.
2. Add io_start into each driver data of mt8195 vdosys.
3. Add get match data function to identify mmsys by io_start.
4. Add mt8195 routing table settings of vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 370 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
 drivers/soc/mediatek/mtk-mmsys.h       |   6 +
 include/linux/soc/mediatek/mtk-mmsys.h |  11 +
 4 files changed, 528 insertions(+), 11 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
new file mode 100644
index 000000000000..13ab0ab64396
--- /dev/null
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
+#define __SOC_MEDIATEK_MT8195_MMSYS_H
+
+#define MT8195_VDO0_OVL_MOUT_EN					0xf14
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
+
+#define MT8195_VDO0_SEL_IN					0xf34
+#define MT8195_SEL_IN_VPP_MERGE_FROM_MASK			GENMASK(1, 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK			GENMASK(4, 4)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK			GENMASK(5, 5)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK			GENMASK(8, 8)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)
+#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK			GENMASK(9, 9)
+#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
+#define MT8195_SEL_IN_DP_INTF0_FROM_MASK			GENMASK(13, 12)
+#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 0)
+#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)
+#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)
+#define MT8195_SEL_IN_DSI0_FROM_MASK				GENMASK(16, 16)
+#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			(0 << 16)
+#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			(1 << 16)
+#define MT8195_SEL_IN_DSI1_FROM_MASK				GENMASK(17, 17)
+#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			(0 << 17)
+#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 << 17)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_MASK			GENMASK(20, 20)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
+#define MT8195_SEL_IN_DSC_WRAP1_FROM_MASK			GENMASK(21, 21)
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0 << 21)
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		(1 << 21)
+#define MT8195_SEL_IN_DISP_WDMA0_FROM_MASK			GENMASK(22, 22)
+#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
+
+#define MT8195_VDO0_SEL_OUT					0xf38
+#define MT8195_SOUT_DISP_DITHER0_TO_MASK			BIT(0)
+#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 << 0)
+#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 << 0)
+#define MT8195_SOUT_DISP_DITHER1_TO_MASK			GENMASK(2, 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 << 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			(1 << 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 << 1)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK			GENMASK(4, 4)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			(0 << 4)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			(1 << 4)
+#define MT8195_SOUT_VPP_MERGE_TO_MASK				GENMASK(10, 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSI1				(0 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			(2 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(3 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			(4 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK		GENMASK(11, 11)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			(0 << 11)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK			GENMASK(13, 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 << 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 << 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			(2 << 12)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK			GENMASK(17, 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			(1 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
+
+static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_OVL0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
+		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
+		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
+		MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
+		MT8195_SEL_IN_DSI1_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA0_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
+		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
+		MT8195_SOUT_DISP_DITHER0_TO_DSI0
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
+		MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
+		MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSI1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4fc4c2c9ea20..21a787f82e00 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -17,6 +17,7 @@
 #include "mt8183-mmsys.h"
 #include "mt8186-mmsys.h"
 #include "mt8192-mmsys.h"
+#include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
@@ -25,26 +26,61 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
+static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2701_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.clk_driver = "clk-mt2712-mm",
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
+static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2712_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
 	.clk_driver = "clk-mt6779-mm",
 };
 
+static const struct mtk_mmsys_match_data mt6779_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt6779_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
+static const struct mtk_mmsys_match_data mt6797_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt6797_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
 };
 
+static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8167_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mmsys_default_routing_table,
@@ -52,6 +88,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 };
 
+static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8173_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 	.routes = mmsys_mt8183_routing_table,
@@ -59,6 +102,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 };
 
+static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8183_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.clk_driver = "clk-mt8186-mm",
 	.routes = mmsys_mt8186_routing_table,
@@ -66,25 +116,79 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
+static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8186_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 };
 
+static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8192_mmsys_driver_data,
+	},
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.io_start = 0x1c01a000,
+	.clk_driver = "clk-mt8195-vdo0",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.io_start = 0x1c100000,
+	.clk_driver = "clk-mt8195-vdo1",
+};
+
+static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
+	.num_drv_data = 2,
+	.drv_data = {
+		&mt8195_vdosys0_driver_data,
+		&mt8195_vdosys1_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
 };
 
+static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8365_mmsys_driver_data,
+	},
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
+	phys_addr_t io_start;
 };
 
+static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
+					const struct mtk_mmsys_match_data *match)
+{
+	int i;
+
+	for (i = 0; i < match->num_drv_data; i++)
+		if (mmsys->io_start == match->drv_data[i]->io_start)
+			return i;
+
+	return -EINVAL;
+}
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -179,7 +283,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
 	struct platform_device *drm;
+	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_mmsys *mmsys;
+	struct resource *res;
 	int ret;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
@@ -205,7 +311,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mmsys->data = of_device_get_match_data(&pdev->dev);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (PTR_ERR(res)) {
+		dev_err(dev, "Couldn't get mmsys resource\n");
+		return -EINVAL;
+	}
+	mmsys->io_start = res->start;
+
+	match_data = of_device_get_match_data(dev);
+	if (match_data->num_drv_data > 1) {
+		/* This SoC has multiple mmsys channels */
+		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
+		if (ret < 0) {
+			dev_err(dev, "Couldn't get match driver data\n");
+			return ret;
+		}
+		mmsys->data = match_data->drv_data[ret];
+	} else {
+		dev_dbg(dev, "Using single mmsys channel\n");
+		mmsys->data = match_data->drv_data[0];
+	}
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
@@ -226,43 +352,47 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 static const struct of_device_id of_match_mtk_mmsys[] = {
 	{
 		.compatible = "mediatek,mt2701-mmsys",
-		.data = &mt2701_mmsys_driver_data,
+		.data = &mt2701_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt2712-mmsys",
-		.data = &mt2712_mmsys_driver_data,
+		.data = &mt2712_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt6779-mmsys",
-		.data = &mt6779_mmsys_driver_data,
+		.data = &mt6779_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt6797-mmsys",
-		.data = &mt6797_mmsys_driver_data,
+		.data = &mt6797_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8167-mmsys",
-		.data = &mt8167_mmsys_driver_data,
+		.data = &mt8167_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8173-mmsys",
-		.data = &mt8173_mmsys_driver_data,
+		.data = &mt8173_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8183-mmsys",
-		.data = &mt8183_mmsys_driver_data,
+		.data = &mt8183_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8186-mmsys",
-		.data = &mt8186_mmsys_driver_data,
+		.data = &mt8186_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
-		.data = &mt8192_mmsys_driver_data,
+		.data = &mt8192_mmsys_match_data,
+	},
+	{
+		.compatible = "mediatek,mt8195-mmsys",
+		.data = &mt8195_mmsys_match_data,
 	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
-		.data = &mt8365_mmsys_driver_data,
+		.data = &mt8365_mmsys_match_data,
 	},
 	{ }
 };
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 77f37f8c715b..21cf300ba864 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
 };
 
 struct mtk_mmsys_driver_data {
+	const u32 io_start;
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
 };
 
+struct mtk_mmsys_match_data {
+	unsigned short num_drv_data;
+	const struct mtk_mmsys_driver_data *drv_data[];
+};
+
 /*
  * Routes in mt8173, mt2701, mt2712 are different. That means
  * in the same register address, it controls different input/output
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4bba275e235a..cff5c9adbf46 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -17,13 +17,24 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER1,
+	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSI0,
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
 	DDP_COMPONENT_DSI3,
 	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_MERGE1,
+	DDP_COMPONENT_MERGE2,
+	DDP_COMPONENT_MERGE3,
+	DDP_COMPONENT_MERGE4,
+	DDP_COMPONENT_MERGE5,
 	DDP_COMPONENT_OD0,
 	DDP_COMPONENT_OD1,
 	DDP_COMPONENT_OVL0,
-- 
2.18.0

