Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777684707A9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C0210E402;
	Fri, 10 Dec 2021 17:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E33610E42E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:49:07 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so9950701pju.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 09:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Nc8TwxfVSVe1wllVo9dJ3a2pGJ8q3XwPSEkE8/FYhQ=;
 b=MM1upYS/L61PPHLwy82sz4xLdDLCNMYLsz3hvq5k4dJ0seo7e2I8P9hGsJaVnRj4Qo
 wGId760gCZIOES6wHXn6bALjUUSUB5H9uw2SKJdOzi4rlEj63e9F/GkmvVh7vulHUFnY
 tmAjwVLLN+vjQ2fTVO4KWh5+c/sUw+g17cdh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Nc8TwxfVSVe1wllVo9dJ3a2pGJ8q3XwPSEkE8/FYhQ=;
 b=rcAdwRDngtxb+ADQOrnV1Ux/MpNPo1nbGqH2As+9i0BQWXqx2V/lAZkuFN+HqiTzUy
 Rpd7GGqJCP4Q+iWmzLe2TMKnI2T4z2Q4haEh8MtBxBUn5vH3g8TAKAfZqzdXxORaamDl
 M/Nqgo9bl41/0TeyymM4RFZ54HlG0Y6UsWp/mzEE9KK8SH+Tjm0aMVhVhHlg4g+wzhBV
 eLUGusVB2ibSuBDlk5A9goDhoBjhw1izP2MrvUhZ037X0dX/K3zlLrAMHYYn3Kb0lk8+
 8VnOVGc2Bpg3ErHDAq4azgHmyYRIL7CvIs1m+fAzEdr8VWM4e7SC/xN9vJ3KeTuVS54F
 5uNA==
X-Gm-Message-State: AOAM533vA5J82Kzl3jkfFM57Ww7GRJ6PFgJ8DQ06Ww2tZWiZ5B5m4Nqd
 7mygdtGam6TtNQj8enBPhFTtNA==
X-Google-Smtp-Source: ABdhPJzzBhRewYnBoc9OlhBIdNPvxMiLbkkqd4UnFm0O7xyADqdLzVdA2mRgO/x3MXNAD3M5iCbqcg==
X-Received: by 2002:a17:902:c702:b0:144:ce0e:d47 with SMTP id
 p2-20020a170902c70200b00144ce0e0d47mr75825180plp.69.1639158546872; 
 Fri, 10 Dec 2021 09:49:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id w1sm4039644pfg.11.2021.12.10.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:49:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH 2/3] Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI
 devices"
Date: Fri, 10 Dec 2021 23:18:18 +0530
Message-Id: <20211210174819.2250178-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210174819.2250178-1-jagan@amarulasolutions.com>
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 +++++--------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index e44e18a0112a..7900da1d4325 100644
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
@@ -1016,16 +999,6 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
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
@@ -1208,7 +1181,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
 #endif
-	drm_bridge_add(&dsi->bridge);
 
 	return dsi;
 }
-- 
2.25.1

