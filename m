Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD91478CC6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4601892C2;
	Fri, 17 Dec 2021 13:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8239890AF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E949C5C0178;
 Fri, 17 Dec 2021 08:51:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 08:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aH1pAYV+tXJ5x
 oBSTjz2hscIrtUupVA0V4HuuGPNrPA=; b=LJPQK6m1mIXxl0h5ObR+8A4C8RZ8Q
 +fvIv5BYCqj7YX9qt3PYT3zZXxkSoR9Xv8PZEwY+qnyOid4Y8Zko9xtHlctjq8nG
 qEtMeUoAWaXxQ0k+tr1LGnxk5vd7zI4TZyPP4cm3jmKO/c7TvIv3RicSkDYi8ZGr
 niHqgGO6Re+ScOdinXadEYTw7N1gUgOIxZtKBXxmj7zkXZyG2yGI6RJMzxehAgRV
 s2HoFjqeUOePmDXswpW/abtQOICoPTEkWd+jqtfZVakIfrswpzV0wIykGNBw8oXj
 PeW0SzW7ievQB/9KcYDQN6ZV1vNM3NMXDE1KSKsRW054llYfmO8AANgmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aH1pAYV+tXJ5xoBSTjz2hscIrtUupVA0V4HuuGPNrPA=; b=nnTF8YBQ
 AtGGJy/lKacV3rpudcLgG4HhzGRUTqngZmJS4HzGO7MMKLhRaRifBtlg/qkaQFAV
 DYBDEzOZuyEUAPxmlfSkNkrEcqsIEEioEcZG91rlt9dRXCBFNOaG7K/9sVWH6/Wj
 UIsFO45YfWrQ/9XvIh52ngoBf0CZ5mvUD3t7l8d1JPCnCmxUPTrgKkhaeDlLJVpQ
 ID5DjBjaBiFLg7GOanGbuiedNgu7uZHVMXU3QHkeODOlB1Q0pFMS7MlzFKDrjMOU
 RmPMWmbIo3ZmwjTEt907NM99bx75CQkIaRCflDxOPKtWHx1VBdXLAE400N6tr8dg
 mWySCtDAcAfj8g==
X-ME-Sender: <xms:45W8YRq21V7nfDedPZJhiL2lOpR7pbxXyknXWMEZNvE-N66WF3qy9Q>
 <xme:45W8YToBiBZdgqM61kYMMW0s2WvZE-ZdQD9aivaQTd9BtIwjNKhJDAeLYlmBmkmBy
 6OP1eg39MDZrxqQ2EQ>
X-ME-Received: <xmr:45W8YeP52i1yTZ6dySKmGiEcnLDFY18IqcnmDlJ0fgTE85ZJRw-9u4UQRFOIbko53yGc1XQvEMmumb2i7XO7FgF9OOMUiZI2F2gPMlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:45W8Yc7D5b6ltAIq1nb-YOYPta8xXXwpXjL3qweGhpjeeHD5ed5H4Q>
 <xmx:45W8YQ436xdGRr5vrBKfAmPgxWQcTLE8lYnnKqGCh_JOuyb16p1iuA>
 <xmx:45W8YUiha-i0amaG9bClPWyZ9WblHXYQlfkd0s_ifiIqSUYfhs0SuA>
 <xmx:45W8YSshGO2lw4tf8ADHMuGm2GxLWVABFSxB827HMXxHb5XiZGNRJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 4/7] drm/sun4i: tcon: Refactor the LVDS and panel probing
Date: Fri, 17 Dec 2021 14:51:16 +0100
Message-Id: <20211217135119.316781-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217135119.316781-1-maxime@cerno.tech>
References: <20211217135119.316781-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
index 88db2d2a9336..4e01807ecf41 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -866,6 +866,63 @@ static int sun4i_tcon_init_regmap(struct device *dev,
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
@@ -1113,10 +1170,8 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sunxi_engine *engine;
-	struct device_node *remote;
 	struct sun4i_tcon *tcon;
 	struct reset_control *edp_rstc;
-	bool has_lvds_rst, has_lvds_alt, can_lvds;
 	int ret;
 
 	engine = sun4i_tcon_find_engine(drv, dev->of_node);
@@ -1161,58 +1216,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
@@ -1247,21 +1250,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
2.33.1

