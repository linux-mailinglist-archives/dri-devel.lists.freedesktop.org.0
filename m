Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22327E7C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 13:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C9689907;
	Wed, 30 Sep 2020 11:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AE389907
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:40:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200930114051euoutp011aa61c6a4654fd0ef8bc05bceed7ac68~5jON5A8Co1064410644euoutp010
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:40:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200930114051euoutp011aa61c6a4654fd0ef8bc05bceed7ac68~5jON5A8Co1064410644euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601466051;
 bh=2TmK0Cd2dcSjEXv4p3j4u0LUwJ5ah0OK12YGNxuOZKs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=b7UET/pgRcwPwe9osf3BN7PYSippSgIBv3wjn3jp9E4xBxH9TiswGNtSeurbixWh0
 bHnjXGkdlipa33PmQs1jPIQu130TzZRWE7Xejg4wvqGj6BNRbleXmEOhHqTaNWkVkE
 RCMcfRFDlSz9FJqzhEMmfIHLaQt8dWNa47xLX75w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200930114050eucas1p253e6bb99c55b23d7e23ee7e47068eddd~5jONi5pZ22053920539eucas1p2u;
 Wed, 30 Sep 2020 11:40:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 52.35.05997.2CE647F5; Wed, 30
 Sep 2020 12:40:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7~5jOM_Kj8T2053920539eucas1p2t;
 Wed, 30 Sep 2020 11:40:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200930114050eusmtrp2dbf62baaf4a76d1d8c4378b53f17c14b~5jOM9XYDf3088230882eusmtrp2D;
 Wed, 30 Sep 2020 11:40:50 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-ed-5f746ec2195e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E2.5A.06314.1CE647F5; Wed, 30
 Sep 2020 12:40:50 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200930114049eusmtip213d9a422c8f9f21b008628d18f0fab22~5jOMWPT_T2020420204eusmtip2G;
 Wed, 30 Sep 2020 11:40:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH RESEND] drm/bridge: tc358764: restore connector support
Date: Wed, 30 Sep 2020 13:40:42 +0200
Message-Id: <20200930114042.5806-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0gTcRzvd7fdzuHimpa/tCwWJQZqVsiBFr2wI/+JKILC5sxLLTdtNy0H
 lq20udSs8NHsxdJ8peYwUyHT+Zg6NkVnTCkkE01TpJyIPbTNU/vv8+Tz/eOLo8JMriceK1PQ
 cpkkToTxOXUdCz1+BplCvKf6oy85VGXhkta5GYwcmJ9Aya6pAQ6Z8aCIR/Y3PsHIgp4mhKxs
 +8wjDdnnydKFt+AQn5qxpfGoQvVjLtWZ04dQw/eMCFWUN4BR2bXlgGrOesShZvXeJ/Fz/JAo
 Oi42iZYHHIzgx5jHm7AEXdD1r3qfVGDw0wAXHBL7YeuYhaMBfFxIlAI4OWhCWGIHUJfftUJm
 AdQvZWOrlU77S5Q1SgAsM9dw1iq95SM8ZwojAqFmWrPccCdCoar1MdcZQokOBN6qzQNOw404
 DkfrWxAn5hA7oWZEvYwFRAj8MW7ksnPbYMWb5uU5SPzGYHu9DmGNY3CquAWw2A1OGmt5LN4C
 lxqeI2zhNoBfLJU8lmQC2K8qWGkEw0+WX477cMdNvrC6MYCVD8P5yleIU4bEemib3uCUUQd8
 WJePsrIAqtOFbHoX1Bqr1mZbevtWIhQ0qHycspAIh3d+piI5wFv7f+oFAOXAg05kpNE0s1dG
 X/NnJFImURbtfzFeqgeOHzEtGu31oPFPpAEQOBC5CiIgIxZyJUlMstQAII6K3AVHzKYLQkGU
 JFlJy+PF8sQ4mjEAL5wj8hDs002EC4loiYK+QtMJtHzVRXAXz1SQty630Po3d77dYt5+9IBr
 9Wblfa333bH3bfzhb6FJvSnMQsHrssWzAX25yu4TS1bs0pmt/AraOjqIe+4YUbyrGUoLCy7W
 PvNQ67+HbewwpN9siMgJGhRkSbHu7htofKfpVGGJV7vqw9imyEBxVYqy5GmxfMg2Z7VR9stX
 T2szRBwmRhK4G5Uzkn8A6ElyHwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsVy+t/xe7qH8kriDVp8LW6tO8dqceXrezaL
 q99fMlucfHOVxaJz4hJ2i8u75rBZzDi/j8li7ZG77BaH+qItVvzcyujA5fH+Riu7x+yOmawe
 JyZcYvK4332cyWPJtKtsHn1bVjF6HOidzOLxeZNcAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
 hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbZ5/vYChaZVTzepN7AeEi3i5GTQ0LAROLE
 l8XMXYxcHEICSxklTr3ZzwyRkJE4Oa2BFcIWlvhzrYsNougTo8S0WZ0sIAk2AUOJrrcgCU4O
 EQEPieZvx9lBipgFzjBJ/Dz8BqxbWMBd4smOg0wgNouAqkTXow4wm1fARuLj8+NQG+QlVm84
 wDyBkWcBI8MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwODdduzn5h2MlzYGH2IU4GBU4uFN
 kCiOF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOg5ROZpUST84GRBYwe
 Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjM41Bs8WVUVeXi6Zs1p8
 0vVkNRaFy8GaBwq78u9c/G3+1KH/evaKlV/bJmjqppyZNoux1rT7euZkV37G/QtWiZ9K/MK/
 IXrDammJRh7l+Yqs9+Wur7h1wNuOd61KfNS/zRbaK87qN7ivYW9aueBFhLFtmU1vWu+75/GK
 ue5L2zdpF7AlWwhLKrEUZyQaajEXFScCABuioW50AgAA
X-CMS-MailID: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
X-Msg-Generator: CA
X-RootMTR: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
References: <CGME20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7@eucas1p2.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch restores DRM connector registration in the TC358764 bridge
driver and restores usage of the old drm_panel_* API, thus allows dynamic
panel registration. This fixes panel operation on Exynos5250-based
Arndale board.

This is equivalent to the revert of the following commits:
1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
were no-ops and has been removed in meanwhile.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
As I've reported and Andrzej Hajda pointed, the reverted patches break
operation of the panel on the Arndale board. Noone suggested how to fix
the regression, I've decided to send a revert until a new solution is
found.

The issues with tc358764 might be automatically resolved once the Exynos
DSI itself is converted to DRM bridge:
https://patchwork.kernel.org/cover/11770683/
but that approach has also its own issues so far.

Resend reason: added Sam Ravnborg to CC:

Best regards,
Marek Szyprowski
---
 drivers/gpu/drm/bridge/tc358764.c | 107 +++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index d89394bc5aa4..c1e35bdf9232 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -153,9 +153,10 @@ static const char * const tc358764_supplies[] = {
 struct tc358764 {
 	struct device *dev;
 	struct drm_bridge bridge;
+	struct drm_connector connector;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
 	struct gpio_desc *gpio_reset;
-	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
 	int error;
 };
 
@@ -209,6 +210,12 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
 	return container_of(bridge, struct tc358764, bridge);
 }
 
+static inline
+struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
+{
+	return container_of(connector, struct tc358764, connector);
+}
+
 static int tc358764_init(struct tc358764 *ctx)
 {
 	u32 v = 0;
@@ -271,11 +278,43 @@ static void tc358764_reset(struct tc358764 *ctx)
 	usleep_range(1000, 2000);
 }
 
+static int tc358764_get_modes(struct drm_connector *connector)
+{
+	struct tc358764 *ctx = connector_to_tc358764(connector);
+
+	return drm_panel_get_modes(ctx->panel, connector);
+}
+
+static const
+struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
+	.get_modes = tc358764_get_modes,
+};
+
+static const struct drm_connector_funcs tc358764_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static void tc358764_disable(struct drm_bridge *bridge)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
+
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
+}
+
 static void tc358764_post_disable(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 	int ret;
 
+	ret = drm_panel_unprepare(ctx->panel);
+	if (ret < 0)
+		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
 	tc358764_reset(ctx);
 	usleep_range(10000, 15000);
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -296,28 +335,71 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
 	ret = tc358764_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
+	ret = drm_panel_prepare(ctx->panel);
+	if (ret < 0)
+		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
+}
+
+static void tc358764_enable(struct drm_bridge *bridge)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	int ret = drm_panel_enable(ctx->panel);
+
+	if (ret < 0)
+		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
 }
 
 static int tc358764_attach(struct drm_bridge *bridge,
 			   enum drm_bridge_attach_flags flags)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	struct drm_device *drm = bridge->dev;
+	int ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
+	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	ret = drm_connector_init(drm, &ctx->connector,
+				 &tc358764_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(&ctx->connector,
+				 &tc358764_connector_helper_funcs);
+	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
+	ctx->connector.funcs->reset(&ctx->connector);
+	drm_connector_register(&ctx->connector);
+
+	return 0;
+}
+
+static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
-				 bridge, flags);
+	drm_connector_unregister(&ctx->connector);
+	ctx->panel = NULL;
+	drm_connector_put(&ctx->connector);
 }
 
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
+	.disable = tc358764_disable,
 	.post_disable = tc358764_post_disable,
+	.enable = tc358764_enable,
 	.pre_enable = tc358764_pre_enable,
 	.attach = tc358764_attach,
+	.detach = tc358764_detach,
 };
 
 static int tc358764_parse_dt(struct tc358764 *ctx)
 {
-	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
-	struct drm_panel *panel;
 	int ret;
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
@@ -326,16 +408,12 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 		return PTR_ERR(ctx->gpio_reset);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(panel_bridge))
-		return PTR_ERR(panel_bridge);
+	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
+					  NULL);
+	if (ret && ret != -EPROBE_DEFER)
+		dev_err(dev, "cannot find panel (%d)\n", ret);
 
-	ctx->panel_bridge = panel_bridge;
-	return 0;
+	return ret;
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
@@ -381,7 +459,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
-	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ctx->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&ctx->bridge);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
