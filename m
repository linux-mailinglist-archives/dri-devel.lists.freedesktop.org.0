Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AD4D122C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB85D10EB2C;
	Tue,  8 Mar 2022 08:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DCF10EB2C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:34 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so1560385pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8vXe2gSe0GDfFDLofWQjV/n4FCpRr46X4SnMCueuW8=;
 b=T8KX/6rvoDjmue1DhpmbVNrtbpX+Ed1pxb4jlYEOj29g3VKcvEs6Z10ccVX2ddleZ0
 OLnc3/nTsOFb8oboW+ZabN5YGvi4lO3JUxC9I/mm/va6necZIC549/P8iw4Nw8jcK57d
 BGlMjynK2ZeGJjRsSkzd8cwCEyIh+oLNBR8Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8vXe2gSe0GDfFDLofWQjV/n4FCpRr46X4SnMCueuW8=;
 b=Zfu731mBXUfhPMHB8u1WZqzq87KZqy17QxeP+M/NZ+omIF56N/vuI7p+Ca/7IdUML4
 /zSNxHbspP0f1OeHIw1Mk0Ke+frvW3/kJ3WcvGHNpCW+VVoUbRsu40lhAAiGN/zVwOzG
 eFp6tMa2xdspjNbNdIrA58LhjXFLe67vB/bfXIuNFuWZlAUZi3gb7HpM3UcvqvSVnam7
 /bcQJKKBVQHQQs2sfT9r9huOqO4R9mFedJQ6l1N1hGyn0b5SQ0gnS8L2YdYwp9rCSvbg
 vLmeZ6RXgRkWugBxDb2TnDEyD0j168g0LZ40opWlkH+5j3Nod+KktSEqDvOJKecFv8Be
 n4tQ==
X-Gm-Message-State: AOAM532600TCQm/GmiSGftUGPSIDQfpW7xAE6hhX0e4hqf0JZaYHNIBu
 r5jhrxtoDoR7c2rMz8p9OuUDbw==
X-Google-Smtp-Source: ABdhPJwBztySmqgDaY9GaaazqHSe57KBl+4k01keRuf+mas8cIIlSYa5Gn/0kwfSPJqLJ/2QS7KZCg==
X-Received: by 2002:a17:90a:7d17:b0:1bd:6972:f942 with SMTP id
 g23-20020a17090a7d1700b001bd6972f942mr3469886pjl.160.1646728054116; 
 Tue, 08 Mar 2022 00:27:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:33 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/8] Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI
 devices"
Date: Tue,  8 Mar 2022 13:57:19 +0530
Message-Id: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Changes for v3, v2:
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

