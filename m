Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65122534D37
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606C10EBA9;
	Thu, 26 May 2022 10:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195A310EB68
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:21:36 +0000 (UTC)
X-UUID: f28d0ad84bb84b3b96e4808958641ccb-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:11d26951-3263-4336-9967-aeb65fded71a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:100
X-CID-INFO: VERSION:1.1.5, REQID:11d26951-3263-4336-9967-aeb65fded71a, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:100
X-CID-META: VersionHash:2a19b09, CLOUDID:689c9447-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:408192a0f988,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: f28d0ad84bb84b3b96e4808958641ccb-20220526
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2036847630; Thu, 26 May 2022 18:21:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 26 May 2022 18:21:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 18:21:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v22 2/5] drm/mediatek: add MERGE support for mediatek-drm
Date: Thu, 26 May 2022 18:21:23 +0800
Message-ID: <20220526102126.19756-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
References: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "jason-jh.lin" <jason-jh.lin@mediatek.com>

Add MERGE engine file:
MERGE module is used to merge two slice-per-line inputs
into one side-by-side output.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 246 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 7 files changed, 276 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 29098d7c8307..a38e88e82d12 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -4,6 +4,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
+		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 763be99e8d33..f13a6f5d512a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -55,6 +55,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
+int mtk_merge_clk_enable(struct device *dev);
+void mtk_merge_clk_disable(struct device *dev);
+void mtk_merge_config(struct device *dev, unsigned int width,
+		      unsigned int height, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_start(struct device *dev);
+void mtk_merge_stop(struct device *dev);
+
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
new file mode 100644
index 000000000000..45face638153
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_drv.h"
+
+#define DISP_REG_MERGE_CTRL		0x000
+#define MERGE_EN				1
+#define DISP_REG_MERGE_CFG_0		0x010
+#define DISP_REG_MERGE_CFG_4		0x020
+#define DISP_REG_MERGE_CFG_10		0x038
+/* no swap */
+#define SWAP_MODE				0
+#define FLD_SWAP_MODE				GENMASK(4, 0)
+#define DISP_REG_MERGE_CFG_12		0x040
+#define CFG_10_10_1PI_2PO_BUF_MODE		6
+#define CFG_10_10_2PI_2PO_BUF_MODE		8
+#define FLD_CFG_MERGE_MODE			GENMASK(4, 0)
+#define DISP_REG_MERGE_CFG_24		0x070
+#define DISP_REG_MERGE_CFG_25		0x074
+#define DISP_REG_MERGE_CFG_36		0x0a0
+#define ULTRA_EN				BIT(0)
+#define PREULTRA_EN				BIT(4)
+#define DISP_REG_MERGE_CFG_37		0x0a4
+/* 0: Off, 1: SRAM0, 2: SRAM1, 3: SRAM0 + SRAM1 */
+#define BUFFER_MODE				3
+#define FLD_BUFFER_MODE				GENMASK(1, 0)
+/*
+ * For the ultra and preultra settings, 6us ~ 9us is experience value
+ * and the maximum frequency of mmsys clock is 594MHz.
+ */
+#define DISP_REG_MERGE_CFG_40		0x0b0
+/* 6 us, 594M pixel/sec */
+#define ULTRA_TH_LOW				(6 * 594)
+/* 8 us, 594M pixel/sec */
+#define ULTRA_TH_HIGH				(8 * 594)
+#define FLD_ULTRA_TH_LOW			GENMASK(15, 0)
+#define FLD_ULTRA_TH_HIGH			GENMASK(31, 16)
+#define DISP_REG_MERGE_CFG_41		0x0b4
+/* 8 us, 594M pixel/sec */
+#define PREULTRA_TH_LOW				(8 * 594)
+/* 9 us, 594M pixel/sec */
+#define PREULTRA_TH_HIGH			(9 * 594)
+#define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
+#define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
+
+struct mtk_disp_merge {
+	void __iomem			*regs;
+	struct clk			*clk;
+	struct clk			*async_clk;
+	struct cmdq_client_reg		cmdq_reg;
+	bool				fifo_en;
+};
+
+void mtk_merge_start(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
+}
+
+void mtk_merge_stop(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
+}
+
+static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
+				   struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write(cmdq_pkt, ULTRA_EN | PREULTRA_EN,
+		      &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_36);
+
+	mtk_ddp_write_mask(cmdq_pkt, BUFFER_MODE,
+			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_37,
+			   FLD_BUFFER_MODE);
+
+	mtk_ddp_write_mask(cmdq_pkt, ULTRA_TH_LOW | ULTRA_TH_HIGH << 16,
+			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_40,
+			   FLD_ULTRA_TH_LOW | FLD_ULTRA_TH_HIGH);
+
+	mtk_ddp_write_mask(cmdq_pkt, PREULTRA_TH_LOW | PREULTRA_TH_HIGH << 16,
+			   &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CFG_41,
+			   FLD_PREULTRA_TH_LOW | FLD_PREULTRA_TH_HIGH);
+}
+
+void mtk_merge_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
+
+	if (!h || !w) {
+		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, w, h);
+		return;
+	}
+
+	if (priv->fifo_en) {
+		mtk_merge_fifo_setting(priv, cmdq_pkt);
+		mode = CFG_10_10_2PI_2PO_BUF_MODE;
+	}
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_0);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_4);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_24);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_25);
+	mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
+	mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_MERGE_CFG_12, FLD_CFG_MERGE_MODE);
+}
+
+int mtk_merge_clk_enable(struct device *dev)
+{
+	int ret = 0;
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(dev, "merge clk prepare enable failed\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->async_clk);
+	if (ret) {
+		/* should clean up the state of priv->clk */
+		clk_disable_unprepare(priv->clk);
+
+		dev_err(dev, "async clk prepare enable failed\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+void mtk_merge_clk_disable(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->async_clk);
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_merge_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_merge_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_merge_component_ops = {
+	.bind	= mtk_disp_merge_bind,
+	.unbind = mtk_disp_merge_unbind,
+};
+
+static int mtk_disp_merge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_disp_merge *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap merge\n");
+		return PTR_ERR(priv->regs);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get merge clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	priv->async_clk = devm_clk_get_optional(dev, "merge_async");
+	if (IS_ERR(priv->async_clk)) {
+		dev_err(dev, "failed to get merge async clock\n");
+		return PTR_ERR(priv->async_clk);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	priv->fifo_en = of_property_read_bool(dev->of_node,
+					      "mediatek,merge-fifo-en");
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_merge_component_ops);
+	if (ret != 0)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_merge_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_merge_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_merge_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-merge", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
+
+struct platform_driver mtk_disp_merge_driver = {
+	.probe = mtk_disp_merge_probe,
+	.remove = mtk_disp_merge_remove,
+	.driver = {
+		.name = "mediatek-disp-merge",
+		.owner = THIS_MODULE,
+		.of_match_table = mtk_disp_merge_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 2af1641a49f2..aefd64a37035 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -328,6 +328,14 @@ static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.stop = mtk_gamma_stop,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_merge = {
+	.clk_enable = mtk_merge_clk_enable,
+	.clk_disable = mtk_merge_clk_disable,
+	.start = mtk_merge_start,
+	.stop = mtk_merge_stop,
+	.config = mtk_merge_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_od = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -389,6 +397,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_DITHER] = "dither",
 	[MTK_DISP_DSC] = "dsc",
 	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_MERGE] = "merge",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_OVL] = "ovl",
@@ -425,6 +434,12 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
 	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
 	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,	0, &ddp_merge },
+	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,	1, &ddp_merge },
+	[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,	2, &ddp_merge },
+	[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,	3, &ddp_merge },
+	[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,	4, &ddp_merge },
+	[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,	5, &ddp_merge },
 	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
 	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
 	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
@@ -527,6 +542,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_GAMMA ||
+	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_PWM ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 238776bd3b72..a43d82c12a9a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -25,6 +25,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_DITHER,
 	MTK_DISP_DSC,
 	MTK_DISP_GAMMA,
+	MTK_DISP_MERGE,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
 	MTK_DISP_OVL,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6abe6bcacbdc..5c1c657ceb6e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -628,7 +628,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the AAL, CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
+		 * Currently only the AAL, CCORR, COLOR, GAMMA, MERGE, OVL, RDMA, DSI, and DPI
 		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
@@ -636,6 +636,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
+		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
@@ -734,6 +735,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
+	&mtk_disp_merge_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 3e7d1e6fbe01..a58cebd01d35 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -50,6 +50,7 @@ extern struct platform_driver mtk_disp_aal_driver;
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
+extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
2.18.0

