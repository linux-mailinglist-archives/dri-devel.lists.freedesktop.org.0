Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E14136A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 17:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD13D6EA59;
	Tue, 21 Sep 2021 15:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D50C6EA50
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:52:35 +0000 (UTC)
X-UUID: 773d40f118974ac0bf14dca93412d7e9-20210921
X-UUID: 773d40f118974ac0bf14dca93412d7e9-20210921
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 426546645; Tue, 21 Sep 2021 23:52:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 21 Sep 2021 23:52:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Sep 2021 23:52:29 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 12/16] drm/mediatek: rename the define of register offset
Date: Tue, 21 Sep 2021 23:52:14 +0800
Message-ID: <20210921155218.10387-13-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
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

Add DISP_REG prefix for the define of register offset to
make the difference from the define of register value.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
rebase on series [1]

[1] drm/mediatek: add support for mediatek SOC MT8192
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 61 +++++++++++----------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 839ffae3019c..b46bc0f5d1a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,32 +20,32 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_OD_EN				0x0000
-#define DISP_OD_CFG				0x0020
-#define DISP_OD_SIZE				0x0030
-#define DISP_DITHER_5				0x0114
-#define DISP_DITHER_7				0x011c
-#define DISP_DITHER_15				0x013c
-#define DISP_DITHER_16				0x0140
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
+#define DISP_REG_OD_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DISP_REG_DITHER_16			0x0140
 
 #define DISP_REG_UFO_START			0x0000
 
-#define DISP_DITHER_EN				0x0000
+#define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
-#define DISP_DITHER_CFG				0x0020
+#define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
-#define DISP_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_SIZE			0x0030
 
 #define OD_RELAYMODE				BIT(0)
 
 #define UFO_BYPASS				BIT(2)
 
-#define DISP_POSTMASK_EN			0x0000
+#define DISP_REG_POSTMASK_EN			0x0000
 #define POSTMASK_EN				BIT(0)
-#define DISP_POSTMASK_CFG			0x0020
+#define DISP_REG_POSTMASK_CFG			0x0020
 #define POSTMASK_RELAY_MODE			BIT(0)
-#define DISP_POSTMASK_SIZE			0x0030
+#define DISP_REG_POSTMASK_SIZE			0x0030
 
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
@@ -130,19 +130,19 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      cmdq_reg, regs, DISP_DITHER_15);
+			      cmdq_reg, regs, DISP_REG_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      cmdq_reg, regs, DISP_DITHER_16);
+			      cmdq_reg, regs, DISP_REG_DITHER_16);
 		mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
 	}
 }
@@ -162,16 +162,16 @@ static void mtk_od_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
-	mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
+	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
 }
 
 static void mtk_od_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(1, priv->regs + DISP_OD_EN);
+	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
 static void mtk_ufoe_start(struct device *dev)
@@ -188,23 +188,23 @@ static void mtk_postmask_config(struct device *dev, unsigned int w,
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
-		      DISP_POSTMASK_SIZE);
+		      DISP_REG_POSTMASK_SIZE);
 	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
-		      priv->regs, DISP_POSTMASK_CFG);
+		      priv->regs, DISP_REG_POSTMASK_CFG);
 }
 
 static void mtk_postmask_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
+	writel(POSTMASK_EN, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
 static void mtk_postmask_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
 static void mtk_dither_config(struct device *dev, unsigned int w,
@@ -213,9 +213,10 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
 			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
@@ -223,14 +224,14 @@ static void mtk_dither_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static void mtk_dither_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
-- 
2.18.0

