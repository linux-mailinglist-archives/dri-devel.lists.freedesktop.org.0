Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EC3CFB0C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F936E39B;
	Tue, 20 Jul 2021 13:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED776E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:46:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 875022B005D0;
 Tue, 20 Jul 2021 09:46:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 20 Jul 2021 09:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=rpqGJA8BzP498
 VRthL+GNLGbJX6smf0yyUoSj3bk7lg=; b=liC6SCDatppqQysuy4XdOdBm/hL9z
 rFNTqft+3e40uxFGLIAbYKAHEzFOTdo7BIdm84hYJqyDN3G1oPzQoU8SWaO6f6B2
 WbVo7XRroBsx5iEl+3M3CHScJIFd4OwMoJObyMA+t2DslgWbeb82e+RRulxKpu/1
 8VoWmuw6zBLJV98XhkOisFX8HALRctsGr5OV38CGPByHn07QKBwpg8/OrQWLwKRU
 wmPaZRVKp6qS1+oYkGbF0AMbFtzsbMKRFN8M7Y/ixlJd4nZUSKYglZbL1BztGLtx
 gDc8XIlaSMLLFf9UdobfZz8AmxQui6u287NKBFv9a36kJgh3oeSf1J4fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rpqGJA8BzP498VRthL+GNLGbJX6smf0yyUoSj3bk7lg=; b=OB7E272R
 oQsMem7IvWJ2BtjDYbP6oMYR1e0zswulSjGN3eJ4QYRXkjOQlokgXKSTGWDFvxxo
 jbLfcVg8382wxhA65ZWi5lDyqnp7xJXaYPkSam2Gspe6umCpCvDLcamP/nqoW6sH
 FUwyIcii2Fea0BHdFvB5Rjavt8tUvXoeecXAaj9eIbtzaEdWzQuWpRSIn9wnAY5l
 mKDNUklp1oqjLZFzrqLbOj2q06xhLNMrIAXVOnUTPya9SWC6ej++3YaX2R5NsRxC
 /FIEJXP30ZnAVum2Swo5K2DD96o8gVUNKyq9UY2bzVWLMVvBT6HCHem4MxrY9FRh
 HuF5pxCkOPVM/Q==
X-ME-Sender: <xms:otP2YANk-QBKm5gWU7NOJJtgTnfY51lbHvBlpHk9_Hqj7hBa7LVemA>
 <xme:otP2YG9jxI5HezePBeLsz-fmaTO339OB5M_4fszDQ-zq1NPRGZA12bEnQxDI8aHSq
 dXlevym078kOcFO4mk>
X-ME-Received: <xmr:otP2YHRoqB50EBDsdfAJBq_yVpiEWcu-muOjm_T_aKrfb9VR-jlS1rCTP4UPl0Pu5slCCLi3Pxbe0_nDdteyN-L8vMNoDudJTcyJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:otP2YIsdYIMeva7GlD6_6VMxyOj1g8H4zePnCabHhdzgqojTfoYzWA>
 <xmx:otP2YIc630zHMKdh8OqgsMq495HTukORXidI4FwKnwWRuGaLCTs_CA>
 <xmx:otP2YM3R-9DB7f7UHX-rpjICyYeoEbFoVm55hyb-pj61W7gmaFmZSg>
 <xmx:o9P2YH8PG__rN3ncNSdQ_mNn9JnqKK9gRYlvaf2qyWweSBdx7t-AKnqVLQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:46:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 09/10] drm/panel: raspberrypi-touchscreen: Use the attach hook
Date: Tue, 20 Jul 2021 15:45:24 +0200
Message-Id: <20210720134525.563936-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have an attach hook available for panels as well, let's use
it for the RaspberryPi 7" DSI panel.

This now mimics what all the other bridges in a similar situation are
doing, and we avoid our probe order issue entirely.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../drm/panel/panel-raspberrypi-touchscreen.c | 135 ++++++++++--------
 1 file changed, 77 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 462faae0f446..995c5cafb970 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -346,7 +346,83 @@ static int rpi_touchscreen_get_modes(struct drm_panel *panel,
 	return num;
 }
 
+static int rpi_touchscreen_attach(struct drm_panel *panel)
+{
+	struct rpi_touchscreen *ts = panel_to_ts(panel);
+	struct device *dev = &ts->i2c->dev;
+	struct device_node *endpoint, *dsi_host_node;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret;
+
+	struct mipi_dsi_device_info info = {
+		.type = RPI_DSI_DRIVER_NAME,
+		.channel = 0,
+		.node = NULL,
+	};
+
+	/* Look up the DSI host.  It needs to probe before we do. */
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (!endpoint)
+		return -ENODEV;
+
+	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
+	if (!dsi_host_node) {
+		of_node_put(endpoint);
+		return -ENODEV;
+	}
+
+	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
+	of_node_put(dsi_host_node);
+	if (!host) {
+		of_node_put(endpoint);
+		return -EPROBE_DEFER;
+	}
+
+	info.node = of_graph_get_remote_port(endpoint);
+	if (!info.node) {
+		of_node_put(endpoint);
+		return -ENODEV;
+	}
+
+	of_node_put(endpoint);
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		dev_err(dev, "DSI device registration failed: %ld\n",
+			PTR_ERR(dsi));
+		return PTR_ERR(dsi);
+	}
+
+	ts->dsi = dsi;
+
+	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
+			   MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			   MIPI_DSI_MODE_LPM);
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = 1;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		dev_err(&dsi->dev, "failed to attach dsi to host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rpi_touchscreen_detach(struct drm_panel *panel)
+{
+	struct rpi_touchscreen *ts = panel_to_ts(panel);
+
+	mipi_dsi_detach(ts->dsi);
+	mipi_dsi_device_unregister(ts->dsi);
+}
+
 static const struct drm_panel_funcs rpi_touchscreen_funcs = {
+	.attach = rpi_touchscreen_attach,
+	.detach = rpi_touchscreen_detach,
+
 	.disable = rpi_touchscreen_disable,
 	.unprepare = rpi_touchscreen_noop,
 	.prepare = rpi_touchscreen_noop,
@@ -359,14 +435,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 {
 	struct device *dev = &i2c->dev;
 	struct rpi_touchscreen *ts;
-	struct device_node *endpoint, *dsi_host_node;
-	struct mipi_dsi_host *host;
 	int ver;
-	struct mipi_dsi_device_info info = {
-		.type = RPI_DSI_DRIVER_NAME,
-		.channel = 0,
-		.node = NULL,
-	};
 
 	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
@@ -394,35 +463,6 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 	/* /\* Turn off at boot, so we can cleanly sequence powering on. *\/ */
 	/* rpi_touchscreen_i2c_write(ts, REG_POWERON, 0); */
 
-	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (!endpoint)
-		return -ENODEV;
-
-	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
-	if (!dsi_host_node)
-		goto error;
-
-	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
-	of_node_put(dsi_host_node);
-	if (!host) {
-		of_node_put(endpoint);
-		return -EPROBE_DEFER;
-	}
-
-	info.node = of_graph_get_remote_port(endpoint);
-	if (!info.node)
-		goto error;
-
-	of_node_put(endpoint);
-
-	ts->dsi = mipi_dsi_device_register_full(host, &info);
-	if (IS_ERR(ts->dsi)) {
-		dev_err(dev, "DSI device registration failed: %ld\n",
-			PTR_ERR(ts->dsi));
-		return PTR_ERR(ts->dsi);
-	}
-
 	drm_panel_init(&ts->base, dev, &rpi_touchscreen_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
@@ -432,41 +472,20 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 	drm_panel_add(&ts->base);
 
 	return 0;
-
-error:
-	of_node_put(endpoint);
-	return -ENODEV;
 }
 
 static int rpi_touchscreen_remove(struct i2c_client *i2c)
 {
 	struct rpi_touchscreen *ts = i2c_get_clientdata(i2c);
 
-	mipi_dsi_detach(ts->dsi);
-
 	drm_panel_remove(&ts->base);
 
-	mipi_dsi_device_unregister(ts->dsi);
-
 	return 0;
 }
 
 static int rpi_touchscreen_dsi_probe(struct mipi_dsi_device *dsi)
 {
-	int ret;
-
-	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
-			   MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			   MIPI_DSI_MODE_LPM);
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = 1;
-
-	ret = mipi_dsi_attach(dsi);
-
-	if (ret)
-		dev_err(&dsi->dev, "failed to attach dsi to host: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static struct mipi_dsi_driver rpi_touchscreen_dsi_driver = {
-- 
2.31.1

