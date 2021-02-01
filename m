Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA8A30B9BC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5556E8FF;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D95B6E1A8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:38 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id w14so11308994pfi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEgDvAhQkWFWjBURDR3gNg/A8ez3XdccaACYPjT87uo=;
 b=Rfdmt3b1VcwIoQaTsLIC8kDgrPGIxscsk6Ei0VsHaXoKrzPlqh26AKVrT8ogJ83Lyq
 IcWVBdiGfGeJOpJ/riOxOm8q5xiIuXWDDWy3KQEH84/lwhlKFGe+H+x6mMajNBrp3YVB
 uBCqIK44tYg1NcXxAF8WNycnv1vWPyoYJbEDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEgDvAhQkWFWjBURDR3gNg/A8ez3XdccaACYPjT87uo=;
 b=PFWAOrfpHqPACGK0NJL4Efbvv92R1tlUNwWtENmjJBPNVT6uzti/1Xxbwtff9wfC61
 11+PBiSk8uLdiPqYk54KAKu27f3vDUfhols9IcMp10drS75lYKHo93Py3/vwL0m9UH2m
 thbrl50bsYShj94uWm/mDGvRG970vfFax/EkF+J+Xr7rIox25vi3cC5yAwhafZabUvVG
 uPm24hjMYfp1HER7lxAwoZGyW2zrbHD590VLA5pyg4qKRphrN71YrpDOCYjSdlggMo22
 Z+4W2JnOeIZABfuK8UmIDZfp1LImhFbTbRE8Hptt8arkwZ0y0a57DqAPA/VNSdxOa4Zz
 +KSQ==
X-Gm-Message-State: AOAM532LIk3y7RuC9La62lUPNLShtjdno99Dil0HwvoavkFKLBT8Mtgp
 s3xhxmUbLcSx9zSOqRnnbiZoTA==
X-Google-Smtp-Source: ABdhPJzl0aVcAYP7WWbPxcEstd4MdU4UHy4qTEg6SUdZ6dLeMD03zwAee3512Po2m3u6Sr6bqai4FQ==
X-Received: by 2002:a63:4d1:: with SMTP id 200mr15915098pge.362.1612175857694; 
 Mon, 01 Feb 2021 02:37:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 2/8] drm/mediatek: add component POSTMASK
Date: Mon,  1 Feb 2021 18:37:21 +0800
Message-Id: <20210201103727.376721-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add component POSTMASK.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/Makefile            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 149 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  71 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
 7 files changed, 204 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index b64674b944860..13a0eafabf9c0 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -3,6 +3,7 @@
 mediatek-drm-y := mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_postmask.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
 		  mtk_drm_ddp_comp.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cdb0383f99061..06d4d4e1c0d05 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -37,6 +37,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
+int mtk_postmask_clk_enable(struct device *dev);
+void mtk_postmask_clk_disable(struct device *dev);
+void mtk_postmask_config(struct device *dev, unsigned int w,
+			 unsigned int h, unsigned int vrefresh,
+			 unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_postmask_start(struct device *dev);
+void mtk_postmask_stop(struct device *dev);
+
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
new file mode 100644
index 0000000000000..5a109fee6b238
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_POSTMASK_EN			0x0000
+#define POSTMASK_EN				BIT(0)
+#define DISP_POSTMASK_CFG			0x0020
+#define POSTMASK_RELAY_MODE			BIT(0)
+#define DISP_POSTMASK_SIZE			0x0030
+
+/**
+ * struct mtk_disp_postmask - DISP_postmask driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_postmask {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+};
+
+int mtk_postmask_clk_enable(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(postmask->clk);
+}
+
+void mtk_postmask_clk_disable(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(postmask->clk);
+}
+
+void mtk_postmask_config(struct device *dev, unsigned int w,
+			 unsigned int h, unsigned int vrefresh,
+			 unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &postmask->cmdq_reg, postmask->regs,
+		      DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &postmask->cmdq_reg,
+		      postmask->regs, DISP_POSTMASK_CFG);
+}
+
+void mtk_postmask_start(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	writel(POSTMASK_EN, postmask->regs + DISP_POSTMASK_EN);
+}
+
+void mtk_postmask_stop(struct device *dev)
+{
+	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, postmask->regs + DISP_POSTMASK_EN);
+}
+
+static int mtk_disp_postmask_bind(struct device *dev, struct device *master, void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_postmask_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_postmask_component_ops = {
+	.bind	= mtk_disp_postmask_bind,
+	.unbind = mtk_disp_postmask_unbind,
+};
+
+static int mtk_disp_postmask_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_postmask *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get postmask clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap postmask\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_postmask_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_postmask_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_postmask_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
+
+struct platform_driver mtk_disp_postmask_driver = {
+	.probe		= mtk_disp_postmask_probe,
+	.remove		= mtk_disp_postmask_remove,
+	.driver		= {
+		.name	= "mediatek-disp-postmask",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_postmask_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b6c4e73031ca6..7a6efc849694b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -413,6 +413,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_postmask = {
+	.clk_enable = mtk_postmask_clk_enable,
+	.clk_disable = mtk_postmask_clk_disable,
+	.config = mtk_postmask_config,
+	.start = mtk_postmask_start,
+	.stop = mtk_postmask_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.clk_enable = mtk_rdma_clk_enable,
 	.clk_disable = mtk_rdma_clk_disable,
@@ -448,6 +456,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -457,36 +466,37 @@ struct mtk_ddp_comp_match {
 };
 
 static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
-	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
-	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
-	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
-	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
-	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
-	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
-	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
-	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
-	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
-	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
-	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
-	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
-	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
-	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
-	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
-	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
-	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
-	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
-	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
-	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
-	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
-	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
-	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
+	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
+	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
+	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
+	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
+	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
+	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
+	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
+	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
+	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
+	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
+	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
+	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
+	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
+	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
+	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
+	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
+	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
+	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
+	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
+	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
 };
 
 static bool mtk_drm_find_comp_in_ddp(struct device *dev,
@@ -601,6 +611,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (type == MTK_DISP_BLS ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_GAMMA ||
+	    type == MTK_DISP_POSTMASK ||
 	    type == MTK_DPI ||
 	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index bb914d976cf5d..cd1dec6b4cdf2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DSI,
 	MTK_DPI,
+	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 486e73e675ad5..d99afc8528684 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -531,7 +531,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
+		 * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
 		 * separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
@@ -539,6 +539,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_POSTMASK ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DSI ||
 		    comp_type == MTK_DPI) {
@@ -637,6 +638,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
+	&mtk_disp_postmask_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 0e54e3d51014a..7e7b28e32aa2f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -49,6 +49,7 @@ struct mtk_drm_private {
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
+extern struct platform_driver mtk_disp_postmask_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
