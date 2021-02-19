Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35D31FA2E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 14:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839E86EB34;
	Fri, 19 Feb 2021 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B691C6EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id C390E816;
 Fri, 19 Feb 2021 08:59:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 19 Feb 2021 08:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Tbh3a6kdyKzOE
 oFv3/SxTGtrVykwWzfjESwaCBMK/U0=; b=XYTBmxZvfrBH1wmBaz71V8UmOxNTG
 BuyzUMG6Qy2e3+GjPUaEwA8a53hmJV7KjGd41dXAeg/Det7liKFbL30Nlv66V41E
 BSydTX07xbptzPRObe+v05h+hwX98ZOKq9t6i1i9TxelDhyEYvJ+PXW92u4vkb/1
 BVkbijHIECjpy6ctlmr1hsCD+r1J3H3rfhqoIthtLBjvBwiKZowNZxDp4lI9BJoZ
 er4xq3y6YhLn55SOxfLatbWn0yoA7P5TEDQnmb3V8otuDx8WbdJmxqpWwJiVlmwD
 J7qbmH1dY+PrIyJSskPgA6f8605rTLjFzzbbsUUqBWXTm1FyQWXTMFSzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Tbh3a6kdyKzOEoFv3/SxTGtrVykwWzfjESwaCBMK/U0=; b=MGOIhoIf
 frntwgjHJ3h5IvJMT3Ogog+5Eqd0Sbs3s1oBp3sXKaOSPlSI7zqQ2eX4vXNzuMD2
 yRU+m+G968K9wON8kJin7Kth8n0TsXcABYaOADT63AE1rDediVezxRKbEt6B15Mg
 BsICGdIZqb/+f70e7NmDif6L1aqGmo68MriWi/EWfz7b8jMlmTQCE5S072Uti+Cu
 g/WFIbONPSDkx1UvnE/P2ui4DzKusq9eGo70slzJ+Zm6PoOCV0TI+SfMxihSagnT
 TBWovMXzCaP5DBPfiw0EtqdURIn4GNMZmiGGCGDAi32kOjmJ/DHrS+b1xNHkmSsX
 vPb7bOOyiWDa2Q==
X-ME-Sender: <xms:UMQvYK2B2HsyMxzeOW430r9vf2-4uS_6_4kyB6Ov9dQWZ8cx4JMe2A>
 <xme:UMQvYPEPT00pL4qzFcEbeRS5OvHPgpbHljLk1wSu8OrjDSC1SAtd-pguu9VdVfx-p
 gXbZUYDyQ5xf_PYzDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UMQvYMTQnQuo9Spf2svIdI72glOL5FFltkmnyJZl0OjBQMt3bQvZdw>
 <xmx:UMQvYODwlskL_0tO3Tu-6XHE5SpRsqxMFshLgNBMs4yCFtXcY9T4Pg>
 <xmx:UMQvYE282IGS4Gybbu4ZipjVIDsO4RUS1oOBNOcGponmUW-_F7981Q>
 <xmx:UcQvYFZw9NZvsTYTM2aPN_zeCI2tnK5roQDQFoKl2905jTovjG05wA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2584240057;
 Fri, 19 Feb 2021 08:59:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 4/7] drm/sun4i: tcon: Refactor the LVDS and panel probing
Date: Fri, 19 Feb 2021 14:59:31 +0100
Message-Id: <20210219135934.618684-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219135934.618684-1-maxime@cerno.tech>
References: <20210219135934.618684-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 1e643bc7e786..32757175f86b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -885,6 +885,63 @@ static int sun4i_tcon_init_regmap(struct device *dev,
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
@@ -1132,10 +1189,8 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sunxi_engine *engine;
-	struct device_node *remote;
 	struct sun4i_tcon *tcon;
 	struct reset_control *edp_rstc;
-	bool has_lvds_rst, has_lvds_alt, can_lvds;
 	int ret;
 
 	engine = sun4i_tcon_find_engine(drv, dev->of_node);
@@ -1180,58 +1235,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
@@ -1266,21 +1269,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
