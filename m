Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C26551415
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F6C10FA76;
	Mon, 20 Jun 2022 09:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EED810FA65
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:19:39 +0000 (UTC)
X-UUID: 509822652483462280f6c5bfb90e619a-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:453e2370-a413-457b-ac85-d87599bc57fe, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:b14ad71, CLOUDID:ed93ffe9-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 509822652483462280f6c5bfb90e619a-20220620
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1982002667; Mon, 20 Jun 2022 17:19:34 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 20 Jun 2022 17:19:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 20 Jun 2022 17:19:33 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v23 06/14] drm/mediatek: add display merge mute/unmute support
 for MT8195
Date: Mon, 20 Jun 2022 17:19:22 +0800
Message-ID: <20220620091930.27797-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220620091930.27797-1-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add merge mute/unmute setting for MT8195.
MT8195 Vdosys1 merge1~merge4 support HW mute function.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index c7af5ccab916..2e13d2fb429e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -58,12 +58,15 @@
 #define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
 #define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
 
+#define DISP_REG_MERGE_MUTE_0		0xf00
+
 struct mtk_disp_merge {
 	void __iomem			*regs;
 	struct clk			*clk;
 	struct clk			*async_clk;
 	struct cmdq_client_reg		cmdq_reg;
 	bool				fifo_en;
+	bool				mute_support;
 };
 
 void mtk_merge_start(struct device *dev)
@@ -80,6 +83,10 @@ void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -88,6 +95,10 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -262,6 +273,8 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	priv->fifo_en = of_property_read_bool(dev->of_node,
 					      "mediatek,merge-fifo-en");
 
+	priv->mute_support = of_property_read_bool(dev->of_node,
+						   "mediatek,merge-mute");
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_disp_merge_component_ops);
-- 
2.18.0

