Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841D48B5F4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49B10E27C;
	Tue, 11 Jan 2022 18:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1052C10E27C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 18:44:12 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id oa15so389439pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvFukKcbKrvTbSgUXhfcVoTRDK/Oh/6Yiixg17ITKS0=;
 b=Ed6+LOyusNTyYu96cvLDgnV/GeAJZnMGiw1YRUZwZ9wRxIxrUw2YBPIGga6dL0EZVr
 ZvaK696MFjdmfHNrLnj8WnrgVWVJILxI+boX3GPNHovG3BeuKI+CZOR3akGeJe/eIpFm
 RPSaLupQLjfqTa0bxUzkWzVGqQieYDRVHzM2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvFukKcbKrvTbSgUXhfcVoTRDK/Oh/6Yiixg17ITKS0=;
 b=huwu/Gf0CVXMeLI5fR22rwvMWX34BnhkuP3bj/adBBmNN1ReD1Dmp9bgaHQSlO+M8R
 PvikfrC98BHaO403nAYe9TerweuKiCIXSBTHtXXxLsHPTJ7zjI9oDiX4vn7ANk3H02Bp
 LIsTUl8CmTCUDaiFMCQ9dswxD+Lp3f8cyrf8bM336aY5vEN86jIqF9m1DhoPGnFMK3ji
 UdOnmPkZPM1QUM11zRVW/xbASnWZiBynOBFaMNXSUp9ND2wbXgTqGZbrE1rwj2ehjPY9
 ABWXNvdJuphNwLbNerQIA09QeE3ZxEqlM2X29vbmVawTyRHw2KuZYLuC/N2c/TNKaJkb
 jKdA==
X-Gm-Message-State: AOAM532oIejx2SdaHlBhS8NHp2yhMmpLbO3UGun4HBaR5RsqXmAK9djI
 4nJsvB4k0G1JrJqOMAffjhMiTg==
X-Google-Smtp-Source: ABdhPJyNaVPWfmGGwHeOZqx1SmWBcQE9nkAAkD87pzcCuCJYUebMkABvvH7B2o8h5Mc/OTaO+Q5eMw==
X-Received: by 2002:a63:3852:: with SMTP id h18mr5142931pgn.512.1641926651646; 
 Tue, 11 Jan 2022 10:44:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3a09:a842:9ff2:6831])
 by smtp.gmail.com with ESMTPSA id c17sm3074364pjs.25.2022.01.11.10.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:44:10 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Robert Foss <robert.foss@linaro.org>, Inki Dae <inki.dae@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH] Revert "drm: exynos: dsi: Convert to bridge driver"
Date: Wed, 12 Jan 2022 00:13:47 +0530
Message-Id: <20220111184347.502471-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 92e794fab87af0793403d5e4a547f0be94a0e656.

It is merged by accident, the actual patch series on this bridge
conversion is still under review.

Revert this as it breaks the exynos DSI.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 93 +++++++++----------------
 1 file changed, 32 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3d4713346949..bce5331ed1e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -257,7 +257,6 @@ struct exynos_dsi {
 	struct drm_connector connector;
 	struct drm_panel *panel;
 	struct list_head bridge_chain;
-	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
@@ -289,9 +288,9 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
-static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
+static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
 {
-	return container_of(b, struct exynos_dsi, bridge);
+	return container_of(e, struct exynos_dsi, encoder);
 }
 
 enum reg_idx {
@@ -1376,10 +1375,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+static void exynos_dsi_enable(struct drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 	int ret;
 
@@ -1402,8 +1400,7 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
 					    chain_node) {
 			if (iter->funcs->pre_enable)
-				iter->funcs->atomic_pre_enable(iter,
-							       old_bridge_state);
+				iter->funcs->pre_enable(iter);
 		}
 	}
 
@@ -1417,7 +1414,7 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 	} else {
 		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 			if (iter->funcs->enable)
-				iter->funcs->atomic_enable(iter, old_bridge_state);
+				iter->funcs->enable(iter);
 		}
 	}
 
@@ -1433,10 +1430,9 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 	pm_runtime_put(dsi->dev);
 }
 
-static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
-				      struct drm_bridge_state *old_bridge_state)
+static void exynos_dsi_disable(struct drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_bridge *iter;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
@@ -1448,7 +1444,7 @@ static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
 
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->disable)
-			iter->funcs->atomic_disable(iter, old_bridge_state);
+			iter->funcs->disable(iter);
 	}
 
 	exynos_dsi_set_display_enable(dsi, false);
@@ -1456,13 +1452,22 @@ static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
 
 	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
-			iter->funcs->atomic_post_disable(iter, old_bridge_state);
+			iter->funcs->post_disable(iter);
 	}
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static void exynos_dsi_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static enum drm_connector_status
 exynos_dsi_detect(struct drm_connector *connector, bool force)
 {
@@ -1499,9 +1504,9 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
 	.get_modes = exynos_dsi_get_modes,
 };
 
-static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
+static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 {
-	struct drm_encoder *encoder = &dsi->encoder;
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_connector *connector = &dsi->connector;
 	struct drm_device *drm = encoder->dev;
 	int ret;
@@ -1527,31 +1532,10 @@ static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static void exynos_dsi_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-
-	drm_mode_copy(&dsi->mode, adjusted_mode);
-}
-
-static int exynos_dsi_attach(struct drm_bridge *bridge,
-			     enum drm_bridge_attach_flags flags)
-{
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, 0);
-}
-
-static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
-	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
-	.atomic_enable		= exynos_dsi_atomic_enable,
-	.atomic_disable		= exynos_dsi_atomic_disable,
-	.mode_set		= exynos_dsi_mode_set,
-	.attach			= exynos_dsi_attach,
+static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
+	.enable = exynos_dsi_enable,
+	.disable = exynos_dsi_disable,
+	.mode_set = exynos_dsi_mode_set,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1570,7 +1554,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 		dsi->out_bridge = out_bridge;
 		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
-		int ret = exynos_dsi_create_connector(dsi);
+		int ret = exynos_dsi_create_connector(encoder);
 
 		if (ret) {
 			DRM_DEV_ERROR(dsi->dev,
@@ -1623,7 +1607,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (dsi->panel) {
 		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_atomic_disable(&dsi->bridge, NULL);
+		exynos_dsi_disable(&dsi->encoder);
 		dsi->panel = NULL;
 		dsi->connector.status = connector_status_disconnected;
 		mutex_unlock(&drm->mode_config.mutex);
@@ -1729,16 +1713,12 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
+	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
+
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
-	if (ret) {
-		drm_encoder_cleanup(&dsi->encoder);
-		return ret;
-	}
-
 	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
 	if (in_bridge_node) {
 		in_bridge = of_drm_find_bridge(in_bridge_node);
@@ -1754,9 +1734,10 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
+
+	exynos_dsi_disable(encoder);
 
-	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
-	drm_encoder_cleanup(&dsi->encoder);
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
@@ -1849,12 +1830,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
-	dsi->bridge.of_node = dev->of_node;
-	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
-
-	drm_bridge_add(&dsi->bridge);
-
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
@@ -1869,10 +1844,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
-
-	drm_bridge_remove(&dsi->bridge);
-
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-- 
2.25.1

