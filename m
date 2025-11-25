Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB87C86D6E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 20:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2810E444;
	Tue, 25 Nov 2025 19:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9rKh79V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B31510E444
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 19:42:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso1088385e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 11:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764099740; x=1764704540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HhdvsOVj27n/3OX2Xubld0LZbS4jqGYO9b78eyJdYWM=;
 b=f9rKh79VfDOB06dxSeBJ1aiHABROV3AZ/+Uiu6++ERuP93WDs9MTyvU8QGP0dSoUBX
 B8/RuwYzkhcWYxVg4Rjt8iDw+qtEB8VAQZn4LFyNGLF5b1GkvUsfoy4ZlPatqPVOBcIL
 0VTONZoeSaX6TH+WR/TOINucVx1Cp8fWqIS1bnVmvFe6u6p5CA0XYNpTtrMEmbJVbcH0
 ANVMg4FF16qTZeiXB1O8r8LgH37j+y8DyEVMhwEST6c0xdwE6PEaTtLnUtjj5OrMBIWi
 FZujGqSpgo/aKEBdhgmXDKo1WA4m5RG6BsKgPGxHNg8cKtJ6NTYqcVxIIKPqBcv4fcDM
 WkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764099740; x=1764704540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhdvsOVj27n/3OX2Xubld0LZbS4jqGYO9b78eyJdYWM=;
 b=Pxn9YoMZi62DkjeQiUxVvJVCf+vFkmlX/MFhgqjgDuI8p7zFusTgaWz7gwBAXEquCv
 S7EBoHDQu2keYZlD5Ei4cXKYm/j50yZSTGoaPFaOyVIVHAaPZJXxgJGSbFWYHlF2yv1q
 WCr2Kt41Av6YdKuhKObmvYeOcNECXJ5rd6+rnbXsH47RwtnqKfI7f2RF6LH/1fXaI8NG
 mrXCPLSybN1hFPaviqlb4leKlwYnqCKTd+b15PxNdw30dHTlG34khOVKxc4Q2mLrWf9S
 VUGzZBLHTRYXThsETMVk2yu4KnICrAxyaW5+tIOkqZTt3KWKSooRJvaTMNGR38CrlYja
 KMkg==
X-Gm-Message-State: AOJu0YxvVd0+fZdNtKJGs6DVEyf/sUzHqk0D97zgPZLOTi5sxoVQfUTH
 ViWfSZGIYBAW1VeqtHN3vxiY+6/hsMlaxlY0OwPW76DYVX8YdIdkSYJHMYyTpUJpoZcLNg==
X-Gm-Gg: ASbGncsfPeNNPoszt+QDmx0SExaRyFFvTq0xPp/PCiVgfORuQ4mfBWWXfEdpe6zRqG4
 j45LlyS4/kiDZIt5iFvq68p5J1cDADFdRanQZUW3ei06kEEFisGlaA5WnPvHR0jCxedJ73QUT1W
 WKZwZjZTLWdwDlPavJezr1Yf6JeTe5NUeewci67sC9pcBaHDeJLwI35TvWe/a4rxPCheRKAEHzY
 sz+PNxWZzR1OgoBIQabFM1F8LVS9DsOWc2Ee7w9q5sI2KR27ySeIaJhfGqHYpUohhwWMm7hWClj
 MUtge5E4/g5jaDF+aij6fKNU1wM9zPPkkdknZIhwQnx7UvfdEJUW9W/SRF55aNsiiSwdSmfde2J
 r3FkaMmf5ApWhlJWg2yluQial2GF8IPreUNOte6HVNfZeOCSwlau7ZdZqIqmbC+/ja3sUV416g9
 MnM/ZovZNv41b4u/8sgca93xLoupp2ag==
X-Google-Smtp-Source: AGHT+IFH9+jQd+X7CEmL1fT+ePV/jVfuukHMqFPDUZT7xd0VTt20d00OWBR8n2jSmCSIsvhuPkbz7A==
X-Received: by 2002:a05:600c:4f45:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-477c04db9a0mr184120685e9.8.1764099739623; 
 Tue, 25 Nov 2025 11:42:19 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([41.34.101.194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040bd209sm26226975e9.3.2025.11.25.11.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 11:42:19 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: linus.walleij@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eslam Khafagy <eslam.medhat1993@gmail.com>
Subject: [PATCH v2] drm: pl111: replace dev_* print functions with drm_*
 variants
Date: Tue, 25 Nov 2025 21:42:15 +0200
Message-ID: <20251125194215.427111-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Update the PL111 CLCD driver to use DRM print macros drm_*() instead of
dev_*(). This change ensures consistency with DRM subsystem
logging conventions [1].

[1]
Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
v2:
* Add mssing include file drm/drm_print.h
v1: https://lore.kernel.org/all/20251122004951.567753-1-eslam.medhat1993@gmail.com/
---
 drivers/gpu/drm/pl111/pl111_display.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c       | 29 +++++++-------
 drivers/gpu/drm/pl111/pl111_nomadik.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h   |  4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c | 53 +++++++++++++------------
 drivers/gpu/drm/pl111/pl111_versatile.h |  2 +-
 6 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 3a9661b9b1fc..5d10bc5fdf1f 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -138,7 +138,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_set_rate(priv->clk, mode->clock * 1000);
 	if (ret) {
-		dev_err(drm->dev,
+		drm_err(drm,
 			"Failed to set pixel clock rate to %d: %d\n",
 			mode->clock * 1000, ret);
 	}
@@ -553,7 +553,7 @@ pl111_init_clock_divider(struct drm_device *drm)
 	int ret;
 
 	if (IS_ERR(parent)) {
-		dev_err(drm->dev, "CLCD: unable to get clcdclk.\n");
+		drm_err(drm, "CLCD: unable to get clcdclk.\n");
 		return PTR_ERR(parent);
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 56ff6a3fb483..ac9e4b6bd2eb 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -55,6 +55,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -98,7 +99,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		struct drm_panel *tmp_panel;
 		struct drm_bridge *tmp_bridge;
 
-		dev_dbg(dev->dev, "checking endpoint %d\n", i);
+		drm_dbg(dev, "checking endpoint %d\n", i);
 
 		ret = drm_of_find_panel_or_bridge(dev->dev->of_node,
 						  0, i,
@@ -114,18 +115,18 @@ static int pl111_modeset_init(struct drm_device *dev)
 				defer = true;
 			} else if (ret != -ENODEV) {
 				/* Continue, maybe something else is working */
-				dev_err(dev->dev,
+				drm_err(dev,
 					"endpoint %d returns %d\n", i, ret);
 			}
 		}
 
 		if (tmp_panel) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found panel on endpoint %d\n", i);
 			panel = tmp_panel;
 		}
 		if (tmp_bridge) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found bridge on endpoint %d\n", i);
 			bridge = tmp_bridge;
 		}
@@ -149,9 +150,9 @@ static int pl111_modeset_init(struct drm_device *dev)
 			goto finish;
 		}
 	} else if (bridge) {
-		dev_info(dev->dev, "Using non-panel bridge\n");
+		drm_info(dev, "Using non-panel bridge\n");
 	} else {
-		dev_err(dev->dev, "No bridge, exiting\n");
+		drm_err(dev, "No bridge, exiting\n");
 		return -ENODEV;
 	}
 
@@ -163,7 +164,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 
 	ret = pl111_display_init(dev);
 	if (ret != 0) {
-		dev_err(dev->dev, "Failed to init display\n");
+		drm_err(dev, "Failed to init display\n");
 		goto out_bridge;
 	}
 
@@ -175,7 +176,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (!priv->variant->broken_vblank) {
 		ret = drm_vblank_init(dev, 1);
 		if (ret != 0) {
-			dev_err(dev->dev, "Failed to init vblank\n");
+			drm_err(dev, "Failed to init vblank\n");
 			goto out_bridge;
 		}
 	}
@@ -255,13 +256,13 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	ret = of_reserved_mem_device_init(dev);
 	if (!ret) {
-		dev_info(dev, "using device-specific reserved memory\n");
+		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
 	}
 
 	if (of_property_read_u32(dev->of_node, "max-memory-bandwidth",
 				 &priv->memory_bw)) {
-		dev_info(dev, "no max memory bandwidth specified, assume unlimited\n");
+		drm_info(drm, "no max memory bandwidth specified, assume unlimited\n");
 		priv->memory_bw = 0;
 	}
 
@@ -276,17 +277,17 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	priv->regs = devm_ioremap_resource(dev, &amba_dev->res);
 	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "%s failed mmio\n", __func__);
+		drm_err(drm, "%s failed mmio\n", __func__);
 		ret = PTR_ERR(priv->regs);
 		goto dev_put;
 	}
 
 	/* This may override some variant settings */
-	ret = pl111_versatile_init(dev, priv);
+	ret = pl111_versatile_init(drm, priv);
 	if (ret)
 		goto dev_put;
 
-	pl111_nomadik_init(dev);
+	pl111_nomadik_init(drm);
 
 	/* turn off interrupts before requesting the irq */
 	writel(0, priv->regs + priv->ienb);
@@ -294,7 +295,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	ret = devm_request_irq(dev, amba_dev->irq[0], pl111_irq, 0,
 			       variant->name, priv);
 	if (ret != 0) {
-		dev_err(dev, "%s failed irq %d\n", __func__, ret);
+		drm_err(drm, "%s failed irq %d\n", __func__, ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.c b/drivers/gpu/drm/pl111/pl111_nomadik.c
index 6f385e59be22..f3218d59c5f1 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.c
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.c
@@ -9,7 +9,7 @@
 #define PMU_CTRL_OFFSET 0x0000
 #define PMU_CTRL_LCDNDIF BIT(26)
 
-void pl111_nomadik_init(struct device *dev)
+void pl111_nomadik_init(struct drm_device *dev)
 {
 	struct regmap *pmu_regmap;
 
@@ -31,6 +31,6 @@ void pl111_nomadik_init(struct device *dev)
 			   PMU_CTRL_OFFSET,
 			   PMU_CTRL_LCDNDIF,
 			   0);
-	dev_info(dev, "set Nomadik PMU mux to CLCD mode\n");
+	drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
 }
 EXPORT_SYMBOL_GPL(pl111_nomadik_init);
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.h b/drivers/gpu/drm/pl111/pl111_nomadik.h
index 47ccf5c839fc..b2c9f7cc1c8c 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.h
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.h
@@ -8,11 +8,11 @@ struct device;
 
 #ifdef CONFIG_ARCH_NOMADIK
 
-void pl111_nomadik_init(struct device *dev);
+void pl111_nomadik_init(struct drm_device *dev);
 
 #else
 
-static inline void pl111_nomadik_init(struct device *dev)
+static inline void pl111_nomadik_init(struct drm_device *dev)
 {
 }
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 5f460b296c0c..0d8331a3909f 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -20,6 +20,7 @@
 #include <linux/vexpress.h>
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "pl111_versatile.h"
 #include "pl111_drm.h"
@@ -116,7 +117,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable Integrator CLCD connectors\n");
+	drm_info(drm, "enable Integrator CLCD connectors\n");
 
 	/* FIXME: really needed? */
 	val = INTEGRATOR_CLCD_LCD_STATIC1 | INTEGRATOR_CLCD_LCD_STATIC2 |
@@ -134,7 +135,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 		val |= INTEGRATOR_CLCD_LCDMUX_VGA555;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Integrator 0x%08x\n",
+		drm_err(drm, "unhandled format on Integrator 0x%08x\n",
 			format);
 		break;
 	}
@@ -156,7 +157,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "enable IM-PD1 CLCD connectors\n");
 	val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
 
 	regmap_update_bits(versatile_syscon_map,
@@ -167,7 +168,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 
 static void pl111_impd1_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "disable IM-PD1 CLCD connectors\n");
 
 	regmap_update_bits(versatile_syscon_map,
 			   IMPD1_CTRL_OFFSET,
@@ -194,7 +195,7 @@ static void pl111_impd1_disable(struct drm_device *drm)
 
 static void pl111_versatile_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable Versatile CLCD connectors\n");
+	drm_info(drm, "disable Versatile CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -205,7 +206,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 {
 	u32 val = 0;
 
-	dev_info(drm->dev, "enable Versatile CLCD connectors\n");
+	drm_info(drm, "enable Versatile CLCD connectors\n");
 
 	switch (format) {
 	case DRM_FORMAT_ABGR8888:
@@ -227,7 +228,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 		val |= SYS_CLCD_MODE_5551;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Versatile 0x%08x\n",
+		drm_err(drm, "unhandled format on Versatile 0x%08x\n",
 			format);
 		break;
 	}
@@ -247,7 +248,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 
 static void pl111_realview_clcd_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable RealView CLCD connectors\n");
+	drm_info(drm, "disable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -256,7 +257,7 @@ static void pl111_realview_clcd_disable(struct drm_device *drm)
 
 static void pl111_realview_clcd_enable(struct drm_device *drm, u32 format)
 {
-	dev_info(drm->dev, "enable RealView CLCD connectors\n");
+	drm_info(drm, "enable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -376,7 +377,7 @@ static const struct pl111_variant_data pl111_vexpress = {
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
 
-static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
+static int pl111_vexpress_clcd_init(struct drm_device *dev, struct device_node *np,
 				    struct pl111_drm_dev_private *priv)
 {
 	struct platform_device *pdev;
@@ -433,22 +434,22 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 		mux_motherboard = false;
 
 	if (mux_motherboard) {
-		dev_info(dev, "DVI muxed to motherboard CLCD\n");
+		drm_info(dev, "DVI muxed to motherboard CLCD\n");
 		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
-	} else if (ct_clcd == dev->of_node) {
-		dev_info(dev,
+	} else if (ct_clcd == dev->dev->of_node) {
+		drm_info(dev,
 			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
 		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
 	} else {
-		dev_info(dev, "core tile graphics present\n");
-		dev_info(dev, "this device will be deactivated\n");
+		drm_info(dev, "core tile graphics present\n");
+		drm_info(dev, "this device will be deactivated\n");
 		return -ENODEV;
 	}
 
 	/* Call into deep Vexpress configuration API */
 	pdev = of_find_device_by_node(np);
 	if (!pdev) {
-		dev_err(dev, "can't find the sysreg device, deferring\n");
+		drm_err(dev, "can't find the sysreg device, deferring\n");
 		return -EPROBE_DEFER;
 	}
 
@@ -461,17 +462,17 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 	ret = regmap_write(map, 0, val);
 	platform_device_put(pdev);
 	if (ret) {
-		dev_err(dev, "error setting DVI muxmode\n");
+		drm_err(dev, "error setting DVI muxmode\n");
 		return -ENODEV;
 	}
 
 	priv->variant = &pl111_vexpress;
-	dev_info(dev, "initializing Versatile Express PL111\n");
+	drm_info(dev, "initializing Versatile Express PL111\n");
 
 	return 0;
 }
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv)
 {
 	const struct of_device_id *clcd_id;
 	enum versatile_clcd versatile_clcd_type;
@@ -492,7 +493,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		int ret = pl111_vexpress_clcd_init(dev, np, priv);
 		of_node_put(np);
 		if (ret)
-			dev_err(dev, "Versatile Express init failed - %d", ret);
+			drm_err(dev, "Versatile Express init failed - %d", ret);
 		return ret;
 	}
 
@@ -511,7 +512,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	map = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(map)) {
-		dev_err(dev, "no Versatile syscon regmap\n");
+		drm_err(dev, "no Versatile syscon regmap\n");
 		return PTR_ERR(map);
 	}
 
@@ -520,14 +521,14 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		versatile_syscon_map = map;
 		priv->variant = &pl110_integrator;
 		priv->variant_display_enable = pl111_integrator_enable;
-		dev_info(dev, "set up callbacks for Integrator PL110\n");
+		drm_info(dev, "set up callbacks for Integrator PL110\n");
 		break;
 	case INTEGRATOR_IMPD1:
 		versatile_syscon_map = map;
 		priv->variant = &pl110_impd1;
 		priv->variant_display_enable = pl111_impd1_enable;
 		priv->variant_display_disable = pl111_impd1_disable;
-		dev_info(dev, "set up callbacks for IM-PD1 PL110\n");
+		drm_info(dev, "set up callbacks for IM-PD1 PL110\n");
 		break;
 	case VERSATILE_CLCD:
 		versatile_syscon_map = map;
@@ -542,7 +543,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		 */
 		priv->ienb = CLCD_PL111_IENB;
 		priv->ctrl = CLCD_PL111_CNTL;
-		dev_info(dev, "set up callbacks for Versatile PL110\n");
+		drm_info(dev, "set up callbacks for Versatile PL110\n");
 		break;
 	case REALVIEW_CLCD_EB:
 	case REALVIEW_CLCD_PB1176:
@@ -553,10 +554,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		priv->variant = &pl111_realview;
 		priv->variant_display_enable = pl111_realview_clcd_enable;
 		priv->variant_display_disable = pl111_realview_clcd_disable;
-		dev_info(dev, "set up callbacks for RealView PL111\n");
+		drm_info(dev, "set up callbacks for RealView PL111\n");
 		break;
 	default:
-		dev_info(dev, "unknown Versatile system controller\n");
+		drm_info(dev, "unknown Versatile system controller\n");
 		break;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.h b/drivers/gpu/drm/pl111/pl111_versatile.h
index 143877010042..7a15c5f7efe8 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.h
+++ b/drivers/gpu/drm/pl111/pl111_versatile.h
@@ -7,6 +7,6 @@
 struct device;
 struct pl111_drm_dev_private;
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv);
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv);
 
 #endif
-- 
2.43.0

