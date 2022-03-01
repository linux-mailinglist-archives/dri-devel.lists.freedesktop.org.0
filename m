Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AEC4C8D60
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA90A10E76F;
	Tue,  1 Mar 2022 14:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5EB10E76F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:04 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e13so13543788plh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2B4o51whjRTaRj0FzLtK0MK8NoU9GtLYROjbqylZQvk=;
 b=JDuW9iUmizXTHoCFc75sGw9naqQAx8l9NVepY/AeD/0G7CTmEr3v0jRiiskJO4suKq
 S/jui1fsJATDN8ocfLeS8mapW0kLYU0RXECEG/fhv1bOEVR0SA+5jHHmkX5jBsyXwzb2
 O2b4Fj5OpRPPTqevgKyqBM+7YOJ8wiQVrR9XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2B4o51whjRTaRj0FzLtK0MK8NoU9GtLYROjbqylZQvk=;
 b=7KKZZiyy9/DvAEZSyY8zGrsil2j4u+ZMoL6N8wA8yJ1x62EuBCjjR6pMDfBbjRFJOU
 3ugT6ilGrbKCe5TtPjamG6Tp2tM1kT5qI2wkTUoadIVkTy3qznt9N9Pv1i4lwohwV3qX
 pzuFVcvgOWSkiLI6XvpMO71bs7JNjO5kgsPXVA99fqYnAAMmfGnRoHKFIiH0zbYPL8Or
 QHz+H+qi3XzUE2yf5uwf4D0X4XlupIynzgNyB7/E2N0qFtPO1LRcKQieBcRNzsb+9mch
 MHjBZyXSXbjry91sEJROh38Fi4lHs42XU1JZrRb1fykjtWvXAJv0Tp7begNoH+oBNpR7
 1Sbg==
X-Gm-Message-State: AOAM533RopVedgDThNh8gCFblEdqDqMFfAiat2EcxzKDIrK9ENlTR4ud
 rrTItZ4RXNhqqttbfuqflkB8CQ==
X-Google-Smtp-Source: ABdhPJwOtMJHC7jK1aXLntj6g8tREE509L7jmqO9Yu26vBzlPd2uQr/tK2RT5wFG19b64nGxxndVcQ==
X-Received: by 2002:a17:90b:10a:b0:1bd:260a:97f9 with SMTP id
 p10-20020a17090b010a00b001bd260a97f9mr14994313pjz.71.1646143984420; 
 Tue, 01 Mar 2022 06:13:04 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:03 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 1/8] Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI
 devices"
Date: Tue,  1 Mar 2022 19:42:40 +0530
Message-Id: <20220301141247.126911-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
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
Changes for v2:
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

