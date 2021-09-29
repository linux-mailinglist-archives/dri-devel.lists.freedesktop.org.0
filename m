Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97F41C0DC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26EE6EA0A;
	Wed, 29 Sep 2021 08:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCC86EA07
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 03B9C3200F9F;
 Wed, 29 Sep 2021 04:42:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 29 Sep 2021 04:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=m7erXvXAgiomR
 18EaZboPnGxQzKM2J1BreGTXbt+er0=; b=fJK16vRqXpt34z6Xpz7OAJEcgjRrr
 xvmeiq2Ja1I5r1UCYdYM2beU6X9J+GlMDrgRfbPb7rNRzHNvNc43KlTXDJ8EnqhH
 gNzVvlKT+6Ct8Jlw0b7+saJvSjDM8b3skPhi3otNNaRIHgmqhBcOZVWz/TjTA3YL
 9WYwkO0UOLIs7YE7vCtPz1eY4CsxCa790/IPxk3uLKqT1uDoEi7tKgT787DK5/Ip
 P7ApbiIctzJ7piLMDWhlQhc+ZNEYdznEZ9avkDYEKWvkCs/cxI9ICbuK+Mco0oOL
 Cg8EntG7DLYK1pCPL2UFGCrLsS3BM2SZHwJBd7TQ/pos+MmOIwxHH6J9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=m7erXvXAgiomR18EaZboPnGxQzKM2J1BreGTXbt+er0=; b=PBNmC6Da
 gRktST4wvpvXixTlSOkUZV9qv8/gh6hBB/YvNlmBy11fsyx11T0kDeSskbKIzim0
 v4Hs/JSito7YQrifmcoRzwSS7p37CxeWdYO6kVJ6JT7ypDZigYLk0xAdtT9k84Cc
 H4feoan6vFo7HYei1X2MPJCC3rrgbufB9fR5R4lU5RI12Nw9EoSbe8UzCxMPB0je
 4Agr/+d/YFzpiWe05oPgErfAeCj4UmHKZroZ4jdKCtls7xqSBy6SIxq+9oNJSE6X
 BVLvroKfRNM4gd/Botcaqr0dRlia07I/adSCAYIZxdvs9y+FPop+EHs2Q0dT/VKF
 h/edju+GM6KZ0Q==
X-ME-Sender: <xms:DSdUYR-WILVL7Pv22zyid1iPLd8ezlBOL9vdZVHYiIKMCgUiaieVnw>
 <xme:DSdUYVvhSfTAtUAHo8oo5nhYU-Hmx1haD0uuD7sB9k60pjr1vbReS7dKYyBPFuUaK
 9bjpscTmsRBbLpM49A>
X-ME-Received: <xmr:DSdUYfANMQWqSyV0gdkZshfrw0Y3pypklF8xjDbXfj8AYsANw5PzW3EBqo4Tz4Pl1PC6XHKFRismzZeTXTXA0GXC7B4o23SwVbYYmurn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DSdUYVf7i4YC9IMzYcEGzqB2YAdYYx5N33XUuYO053C70Whyblk3Lw>
 <xmx:DSdUYWPy4W_cRltCEUJQ0eFYUDqVeSdBvWJfbr9oYa82SlXW7nz_2g>
 <xmx:DSdUYXnCI3GrrctcND0s39g26iUFptceAAgEGs2OxFJr8Jxn8geGcQ>
 <xmx:DSdUYXhS_zvndHnq6fVR9lEn7ybATc7XZM7wTybNgkVoztYY2TOYqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/7] drm/sun4i: tcon: Refactor the LVDS and panel probing
Date: Wed, 29 Sep 2021 10:42:31 +0200
Message-Id: <20210929084234.1271915-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
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

The current code to parse the DT, deal with the older device trees, and
register either the RGB or LVDS output has so far grown organically into
the bind function and has become quite hard to extend properly.

Let's move it into a single function that grabs all the resources it needs
and registers the proper panel output.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 127 +++++++++++++----------------
 1 file changed, 58 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 9f06dec0fc61..e38e60faafd2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -868,6 +868,63 @@ static int sun4i_tcon_init_regmap(struct device *dev,
 	return 0;
 }
 
+static int sun4i_tcon_register_panel(struct drm_device *drm,
+				     struct sun4i_tcon *tcon)
+{
+	struct device_node *companion;
+	struct device_node *remote;
+	struct device *dev = tcon->dev;
+	int ret;
+
+	/*
+	 * If we have an LVDS panel connected to the TCON, we should
+	 * just probe the LVDS connector. Otherwise, let's just register
+	 * an RGB panel.
+	 */
+	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+	if (!tcon->quirks->supports_lvds ||
+	    !of_device_is_compatible(remote, "panel-lvds"))
+		return sun4i_rgb_init(drm, tcon);
+
+	/*
+	 * This can only be made optional since we've had DT
+	 * nodes without the LVDS reset properties.
+	 *
+	 * If the property is missing, just disable LVDS, and
+	 * print a warning.
+	 */
+	tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+	if (IS_ERR(tcon->lvds_rst)) {
+		dev_err(dev, "Couldn't get our reset line\n");
+		return PTR_ERR(tcon->lvds_rst);
+	} else if (!tcon->lvds_rst) {
+		dev_warn(dev, "Missing LVDS reset property, please upgrade your DT\n");
+		return -ENODEV;
+	}
+
+	reset_control_reset(tcon->lvds_rst);
+
+	/*
+	 * This can only be made optional since we've had DT
+	 * nodes without the LVDS clocks properties.
+	 *
+	 * If the property is missing, just disable LVDS, and
+	 * print a warning.
+	 */
+	if (tcon->quirks->has_lvds_alt) {
+		tcon->lvds_pll = devm_clk_get_optional(dev, "lvds-alt");
+		if (IS_ERR(tcon->lvds_pll)) {
+			dev_err(dev, "Couldn't get the LVDS PLL\n");
+			return PTR_ERR(tcon->lvds_pll);
+		} else if (!tcon->lvds_pll) {
+			dev_warn(dev, "Missing LVDS PLL clock, please upgrade your DT\n");
+			return -ENODEV;
+		}
+	}
+
+	return sun4i_lvds_init(drm, tcon);
+}
+
 /*
  * On SoCs with the old display pipeline design (Display Engine 1.0),
  * the TCON is always tied to just one backend. Hence we can traverse
@@ -1115,10 +1172,8 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sunxi_engine *engine;
-	struct device_node *remote;
 	struct sun4i_tcon *tcon;
 	struct reset_control *edp_rstc;
-	bool has_lvds_rst, has_lvds_alt, can_lvds;
 	int ret;
 
 	engine = sun4i_tcon_find_engine(drv, dev->of_node);
@@ -1163,58 +1218,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	if (tcon->quirks->supports_lvds) {
-		/*
-		 * This can only be made optional since we've had DT
-		 * nodes without the LVDS reset properties.
-		 *
-		 * If the property is missing, just disable LVDS, and
-		 * print a warning.
-		 */
-		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
-		if (IS_ERR(tcon->lvds_rst)) {
-			dev_err(dev, "Couldn't get our reset line\n");
-			return PTR_ERR(tcon->lvds_rst);
-		} else if (tcon->lvds_rst) {
-			has_lvds_rst = true;
-			reset_control_reset(tcon->lvds_rst);
-		} else {
-			has_lvds_rst = false;
-		}
-
-		/*
-		 * This can only be made optional since we've had DT
-		 * nodes without the LVDS reset properties.
-		 *
-		 * If the property is missing, just disable LVDS, and
-		 * print a warning.
-		 */
-		if (tcon->quirks->has_lvds_alt) {
-			tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
-			if (IS_ERR(tcon->lvds_pll)) {
-				if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
-					has_lvds_alt = false;
-				} else {
-					dev_err(dev, "Couldn't get the LVDS PLL\n");
-					return PTR_ERR(tcon->lvds_pll);
-				}
-			} else {
-				has_lvds_alt = true;
-			}
-		}
-
-		if (!has_lvds_rst ||
-		    (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
-			dev_warn(dev, "Missing LVDS properties, Please upgrade your DT\n");
-			dev_warn(dev, "LVDS output disabled\n");
-			can_lvds = false;
-		} else {
-			can_lvds = true;
-		}
-	} else {
-		can_lvds = false;
-	}
-
 	ret = sun4i_tcon_init_clocks(dev, tcon);
 	if (ret) {
 		dev_err(dev, "Couldn't init our TCON clocks\n");
@@ -1249,21 +1252,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	}
 
 	if (tcon->quirks->has_channel_0) {
-		/*
-		 * If we have an LVDS panel connected to the TCON, we should
-		 * just probe the LVDS connector. Otherwise, just probe RGB as
-		 * we used to.
-		 */
-		remote = of_graph_get_remote_node(dev->of_node, 1, 0);
-		if (of_device_is_compatible(remote, "panel-lvds"))
-			if (can_lvds)
-				ret = sun4i_lvds_init(drm, tcon);
-			else
-				ret = -EINVAL;
-		else
-			ret = sun4i_rgb_init(drm, tcon);
-		of_node_put(remote);
-
+		ret = sun4i_tcon_register_panel(drm, tcon);
 		if (ret < 0)
 			goto err_free_dotclock;
 	}
-- 
2.31.1

