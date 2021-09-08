Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACD40340D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 08:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1306E118;
	Wed,  8 Sep 2021 06:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4816E113
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 06:04:14 +0000 (UTC)
X-UUID: febc94b4c0f24e34af6e86f0e8bef52a-20210908
X-UUID: febc94b4c0f24e34af6e86f0e8bef52a-20210908
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2023128501; Wed, 08 Sep 2021 14:04:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 14:04:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 14:04:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:11 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 14/17] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
Date: Wed, 8 Sep 2021 14:03:09 +0800
Message-ID: <20210908060312.24007-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust to the alphabetic order for the define, function, struct
and array in mediatek-drm driver

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
rebase on series [1]

[1] drm/mediatek: add support for mediatek SOC MT8192
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 126 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  24 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 100 ++++++++--------
 3 files changed, 124 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b46bc0f5d1a5..23c03e550658 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,26 +20,30 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_REG_OD_EN				0x0000
-#define DISP_REG_OD_CFG				0x0020
-#define DISP_REG_OD_SIZE			0x0030
-#define DISP_REG_DITHER_5			0x0114
-#define DISP_REG_DITHER_7			0x011c
-#define DISP_REG_DITHER_15			0x013c
-#define DISP_REG_DITHER_16			0x0140
-
-#define DISP_REG_UFO_START			0x0000
 
 #define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
+#define DISP_DITHERING				BIT(2)
 #define DISP_REG_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
+#define DITHER_NEW_BIT_MODE			BIT(0)
+#define DISP_REG_DITHER_16			0x0140
+#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
+#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
+#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
 #define OD_RELAYMODE				BIT(0)
-
-#define UFO_BYPASS				BIT(2)
+#define DISP_REG_OD_SIZE			0x0030
 
 #define DISP_REG_POSTMASK_EN			0x0000
 #define POSTMASK_EN				BIT(0)
@@ -47,14 +51,8 @@
 #define POSTMASK_RELAY_MODE			BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
-#define DISP_DITHERING				BIT(2)
-#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
-#define DITHER_NEW_BIT_MODE			BIT(0)
-#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
-#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
-#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
+#define DISP_REG_UFO_START			0x0000
+#define UFO_BYPASS				BIT(2)
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
@@ -147,8 +145,35 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 	}
 }
 
+static void mtk_dither_config(struct device *dev, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
+}
+
+static void mtk_dither_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
+}
+
+static void mtk_dither_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+}
+
 static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+			   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
@@ -174,13 +199,6 @@ static void mtk_od_start(struct device *dev)
 	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
-static void mtk_ufoe_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
-}
-
 static void mtk_postmask_config(struct device *dev, unsigned int w,
 			unsigned int h, unsigned int vrefresh,
 			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -207,31 +225,11 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
-static void mtk_dither_config(struct device *dev, unsigned int w,
-			      unsigned int h, unsigned int vrefresh,
-			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
-			      DITHER_ENGINE_EN, cmdq_pkt);
-}
-
-static void mtk_dither_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
-}
-
-static void mtk_dither_stop(struct device *dev)
+static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
@@ -336,23 +334,23 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
-	[MTK_DISP_OVL] = "ovl",
-	[MTK_DISP_OVL_2L] = "ovl-2l",
-	[MTK_DISP_RDMA] = "rdma",
-	[MTK_DISP_WDMA] = "wdma",
-	[MTK_DISP_COLOR] = "color",
-	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_AAL] = "aal",
-	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_CCORR] = "ccorr",
+	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_DITHER] = "dither",
-	[MTK_DISP_UFOE] = "ufoe",
-	[MTK_DSI] = "dsi",
-	[MTK_DPI] = "dpi",
-	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
-	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_OVL] = "ovl",
+	[MTK_DISP_OVL_2L] = "ovl-2l",
 	[MTK_DISP_POSTMASK] = "postmask",
+	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_UFOE] = "ufoe",
+	[MTK_DISP_WDMA] = "wdma",
+	[MTK_DPI] = "dpi",
+	[MTK_DSI] = "dsi",
 };
 
 struct mtk_ddp_comp_match {
@@ -510,12 +508,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA)
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DPI ||
+	    type == MTK_DSI)
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index cd1dec6b4cdf..4c6a98662305 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -18,23 +18,23 @@ struct mtk_plane_state;
 struct drm_crtc_state;
 
 enum mtk_ddp_comp_type {
-	MTK_DISP_OVL,
-	MTK_DISP_OVL_2L,
-	MTK_DISP_RDMA,
-	MTK_DISP_WDMA,
-	MTK_DISP_COLOR,
+	MTK_DISP_AAL,
+	MTK_DISP_BLS,
 	MTK_DISP_CCORR,
+	MTK_DISP_COLOR,
 	MTK_DISP_DITHER,
-	MTK_DISP_AAL,
 	MTK_DISP_GAMMA,
-	MTK_DISP_UFOE,
-	MTK_DSI,
-	MTK_DPI,
-	MTK_DISP_POSTMASK,
-	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-	MTK_DISP_BLS,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+	MTK_DPI,
+	MTK_DSI,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 794bdddc915e..e0ddfae20d37 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -422,28 +422,12 @@ static const struct component_master_ops mtk_drm_ops = {
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
-	{ .compatible = "mediatek,mt2701-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8173-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt8192-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt2701-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8183-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8192-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-wdma",
-	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8192-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt8192-disp-ccorr",
@@ -452,32 +436,12 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8183-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8192-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
-	{ .compatible = "mediatek,mt8183-disp-dither",
-	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8173-disp-ufoe",
-	  .data = (void *)MTK_DISP_UFOE },
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -488,14 +452,50 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
-	{ .compatible = "mediatek,mt2701-disp-pwm",
-	  .data = (void *)MTK_DISP_BLS },
-	{ .compatible = "mediatek,mt8173-disp-pwm",
-	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt2701-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8173-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-postmask",
 	  .data = (void *)MTK_DISP_POSTMASK },
+	{ .compatible = "mediatek,mt2701-disp-pwm",
+	  .data = (void *)MTK_DISP_BLS },
+	{ .compatible = "mediatek,mt8173-disp-pwm",
+	  .data = (void *)MTK_DISP_PWM },
+	{ .compatible = "mediatek,mt2701-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8183-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-ufoe",
+	  .data = (void *)MTK_DISP_UFOE },
+	{ .compatible = "mediatek,mt8173-disp-wdma",
+	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8173-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8183-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt2701-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8173-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8183-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
@@ -587,8 +587,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
-		    comp_type == MTK_DSI ||
-		    comp_type == MTK_DPI) {
+		    comp_type == MTK_DPI ||
+		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, compare_of,
-- 
2.18.0

