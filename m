Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE653D8F32
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01B56EA77;
	Wed, 28 Jul 2021 13:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639FF6EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C99FE580B89;
 Wed, 28 Jul 2021 09:32:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 28 Jul 2021 09:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=rpqGJA8BzP498
 VRthL+GNLGbJX6smf0yyUoSj3bk7lg=; b=T7QPu9DZcrvJ9+DUbEM2WWuxIgvsA
 aITQ042/uKsM3KruhSU0AE4u17DCinRfDhHJ411KfCKTqHJMfErqcrmOmbHZbQou
 pv7o1qhZAAv5m4su4JKIy/cHbAjT1r2sg3zRwsFnfnuJQeM81j2gweCQTRmXPpEp
 +Dejvo9qy+ujNYiXxaaEwGFRCWLfLyKMRPUt7cWWfqjEcHCPnyMCDpITJ/M7zHeL
 0yFUePKHq6p2k98yssDPwzK8WbyQS/FTmCdtlwTK6OgqAfWGsY6S/4gToqmt1X5b
 bjFqBV7hJ6deK29Il+b44wVaTNdwwfSPI6fqdcKPbeyxewjKzae9qtUdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rpqGJA8BzP498VRthL+GNLGbJX6smf0yyUoSj3bk7lg=; b=mzkBpZBj
 MFoDsZ2rHfeXCJsmwG+9bmw+xSYn9Ok8xtbCoysdJw9h80OmmUOnOpBMheKFRB5Q
 ulD2Gr2Y7q7hFTikZhL0KIHLaaYU9Ab2AKOxeR1yM9OYJ2t2vW5cew0sEt52Hvmn
 EvoNcZhBfKhQTH+x6HJXRdvl25gfpIx1BfiXInkhhjuahf8IsCejx8j4kCjxU5Dl
 XE9q3UaESs0v4y7uEXXMeWpr3iyXIB0UTZSYpfG5l3orGYAFZXl1X7aPP+ukD5jM
 H4ryNloUl1HMBMYVTAfOGeAcIaQmR0HltX0A35x7U5fSf22tmDEPGxVfhG37s0QG
 NKaLa+m/1OT1yg==
X-ME-Sender: <xms:hlwBYYTelkxCXq9iaal2xeJBuk0mPBEsjsmb2NfbAkyf_ctyCKzV4Q>
 <xme:hlwBYVxyzQmeeb5uNdBstBas3EcMMJ02sJkQ88B-xmxO5IW-pY8JB6la9hCDO86R2
 eMXFxMy91zqacSH6mM>
X-ME-Received: <xmr:hlwBYV2xaO3yCMWFJr_t3bjWr448oc2TneyxV4H9mkNcmO4sFWlvxTbx4oWCTA8IlZkdKknEZ83vq7dGvAZDRHAjCM-YAKUoVDlJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hlwBYcB-jJFEL-2cp7AmmODKANCwanjwxK8zy4SZcajabE050sh13Q>
 <xmx:hlwBYRg89sfwRyt-jurlnpIksRaJ24WNAskO-0xtbQL4ToWz8Spk9g>
 <xmx:hlwBYYrC2xQaTl3AscQBTGfw66b_EcLlkX_NJgbqYAfiq340PoXf2A>
 <xmx:h1wBYUQaB3NFDDphv1DsiTGWoA_VEQTOawhxCU-K3MS4JgcFzrKa9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 7/8] drm/panel: raspberrypi-touchscreen: Use the attach hook
Date: Wed, 28 Jul 2021 15:32:28 +0200
Message-Id: <20210728133229.2247965-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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

