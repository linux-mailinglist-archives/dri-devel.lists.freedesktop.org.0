Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB24EDDAC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417CE10E5BE;
	Thu, 31 Mar 2022 15:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0197010F3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:19 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s8so22413914pfk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4j3Qt6w8Esn9msyNRh1aWfBBelNHCS4Qddf02urjTE=;
 b=ke7OiYmnjel9k1gGvoaBqnwLM1uX5yWUou7xW+CsdHRDCi0RkXQQ2ll8xWberQJYha
 tFRpORbCDlp/r43v5SznjGVFSesgEXpjgyui6cnBbeQ7wwU5KO4Vbqc1VD0zbHlRg4F2
 XSv5WiRf3NsZvSBU+SKIN8uEtZBIu6HveuFQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4j3Qt6w8Esn9msyNRh1aWfBBelNHCS4Qddf02urjTE=;
 b=0+UfcDUdXxnvsjHjhlhOhFkgkn2Wv/2iWIVGwj24N0b6aDqjcjVusSjdisjRCiDpVs
 4new7F/BzP5tny80z2KmbX6JyBNilxhUC0clmh/DpjiypSUoej4ZLLEDuHjONVFG2CyA
 tML/Z3cR0XrMbkrHiwhfxak+1Y0BTsn3lgKIpR2WjCOPsJCdVt9MB8wcKQEF/rqnSlVw
 5zLqvhnht1ZeGButDMK/EPRdID9+WgXYoGWzZdF5ytCsBVZ5CUOauDAPmWVVc4gjzsZc
 iW09L06YnQ/gcuCb1XoI6m/bcdWZvdSh/TYAAWFs5QGmE3MeyLvwAwn38daemB5523ej
 X+Bw==
X-Gm-Message-State: AOAM531wpTdlz0dQaDTQZTNEOtGQhmGfpsThi99H4Q/LFu6NXhzk8op1
 KGqUk0fXxe5NYIZecoInJcshXW/2l9u+uA==
X-Google-Smtp-Source: ABdhPJznYGzlk1q5h60sEZN9r0RvKOy0RpFblvz3oIfFFBHnel/VPqC63CsNiyRKPczS06CLBbbGCw==
X-Received: by 2002:a63:c015:0:b0:385:fe06:eb86 with SMTP id
 h21-20020a63c015000000b00385fe06eb86mr6426559pgg.132.1648741519413; 
 Thu, 31 Mar 2022 08:45:19 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm10205684pjx.42.2022.03.31.08.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:45:18 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 1/5] Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI
 devices"
Date: Thu, 31 Mar 2022 21:14:59 +0530
Message-Id: <20220331154503.66054-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-amarula@amarulasolutions.com, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit c206c7faeb3263a7cc7b4de443a3877cd7a5e74b.

In order to avoid any probe ordering issues, the I2C based downstream
bridge drivers now register and attach the DSI devices at the probe
instead of doing it on drm_bridge_function.attach().

Examples of those commits are:

commit <6ef7ee48765f> ("drm/bridge: sn65dsi83: Register and attach our
DSI device at probe")
commit <d89078c37b10> ("drm/bridge: lt8912b: Register and attach our DSI
device at probe")
commit <864c49a31d6b> ("drm/bridge: adv7511: Register and attach our DSI
device at probe")

dw-mipi-dsi has panel or bridge finding code based on previous downstream
bridges, so revert the same and make the panel or bridge funding in host
attach as before.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3, v2:
- none

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 +++++--------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 11d20b8638cd..1cc912b6e1f8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -246,7 +246,6 @@ struct dw_mipi_dsi {
 
 	struct clk *pclk;
 
-	bool device_found;
 	unsigned int lane_mbps; /* per lane */
 	u32 channel;
 	u32 lanes;
@@ -310,37 +309,13 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
 	return readl(dsi->base + reg);
 }
 
-static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
-				       struct device_node *node)
-{
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
-	dsi->panel_bridge = bridge;
-
-	if (!dsi->panel_bridge)
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				   struct mipi_dsi_device *device)
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -354,14 +329,22 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	if (!dsi->device_found) {
-		ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
-		if (ret)
-			return ret;
+	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
+					  &panel, &bridge);
+	if (ret)
+		return ret;
 
-		dsi->device_found = true;
+	if (panel) {
+		bridge = drm_panel_bridge_add_typed(panel,
+						    DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
 	}
 
+	dsi->panel_bridge = bridge;
+
+	drm_bridge_add(&dsi->bridge);
+
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
 		if (ret < 0)
@@ -1021,16 +1004,6 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 	/* Set the encoder type as caller does not know it */
 	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
-	if (!dsi->device_found) {
-		int ret;
-
-		ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
-		if (ret)
-			return ret;
-
-		dsi->device_found = true;
-	}
-
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
 				 flags);
@@ -1217,7 +1190,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
 #endif
-	drm_bridge_add(&dsi->bridge);
 
 	return dsi;
 }
-- 
2.25.1

