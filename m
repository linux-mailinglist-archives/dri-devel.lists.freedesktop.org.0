Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFED234020
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FF36E9F8;
	Fri, 31 Jul 2020 07:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723026E091
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:35:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 676645803D8;
 Thu, 30 Jul 2020 05:35:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aXaQHQkHwW73y
 YRM06miIg+Jwhv7Qbn9SPMYf/irAek=; b=GYqKkGEBu7+t8AQaIbio/zvIaBT/4
 J1uRPHu0dPCENa5jToeQS+O0OvMHlmXvIJcl95jRh2IkWcuwDztA0STJr0eOAJGS
 KtU3XswxkgYoq2GgQ7JYm1j2gxVpguKWUcJ2bTGNIPb0VNhynxw+6uahS6ShTsLB
 ViLZsI7mHq9vxocQ0wH5uYyHssc3432lRHoim68Ntgadd6wD3yaUONSLXy2lMojt
 ymm8nTf3Gmch9yOQ2+8Fm2xhcTEzTUqQAoAefobO/aI3R2V+bIMXe4s5SmU1+JXJ
 fOEu0Y1b83nlhj638gCAXdHCRgfTA/EypXdjbbS6HIvQql99DsZdrv1Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aXaQHQkHwW73yYRM06miIg+Jwhv7Qbn9SPMYf/irAek=; b=lwQHabEi
 +/1DuITT2MiWH8HMBdi0+vnZcaHEHjQuPHhkjbfAh5Wl8DsTN76ZfPy454S0Nljg
 NtbTlT3cM3TVPrnGyVpoeUS+FP4HutMHz+0ri4aJzrlGLg7bwn5Z0H73Vvj2ew+/
 x1GxOFFYMvRO2L7av5Zw350tngXUbowqOcLfdhWUePlH5sIvnTDIRnyGaVO1AkM8
 lFlI0590L6EGL0Axi+RdE/mfp41hzYKzJ3nz4J1A2N/vv+hG+KemFgbD13zraAEO
 Ws/eaLxWI+hPuSrRknTonfhufVgvYU15JupfuTGYA5qPLy5So4N4ejU4Wg743hCz
 XhPymIJhFy4/sA==
X-ME-Sender: <xms:XpQiX7aHKj93JGmgzHxDHvoM7aWjejqxqN3uy9pOPSxAgkc9fbRhaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XpQiX6Zox1JiOWtGzahZD1bwzXYj3p8isF_hcQjhj0EJ6y17Nu7bWA>
 <xmx:XpQiX98KVcuaWE5YF6AIBBPaHOOupabZT4RqalI1UXnyTcbPWTKGZg>
 <xmx:XpQiXxpncafHT_N7SJ2VUQGQ0Iwp3y7Y7xsc9QHwIlD8dCwJql4Mmg>
 <xmx:XpQiX12CdvvubZZ1jfZUR5DB1XgfOVroXO4EMxfQTo4Y694CVukpQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 057D2328005A;
 Thu, 30 Jul 2020 05:35:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/sun4i: tcon: Refactor the LVDS and panel probing
Date: Thu, 30 Jul 2020 11:35:02 +0200
Message-Id: <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code to parse the DT, deal with the older device trees, and
register either the RGB or LVDS output has so far grown organically into
the bind function and has become quite hard to extend properly.

Let's move it into a single function that grabs all the resources it needs
and registers the proper panel output.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 139 +++++++++++++++---------------
 1 file changed, 70 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 2a5a9903c4c6..d03ad75f9900 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -875,6 +875,75 @@ static int sun4i_tcon_init_regmap(struct device *dev,
 	return 0;
 }
 
+static int sun4i_tcon_register_panel(struct drm_device *drm,
+				     struct sun4i_tcon *tcon)
+{
+	struct device_node *companion;
+	struct device_node *remote;
+	struct device *dev = tcon->dev;
+	bool has_lvds_alt;
+	bool has_lvds_rst;
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
+	} else if (tcon->lvds_rst) {
+		has_lvds_rst = true;
+		reset_control_reset(tcon->lvds_rst);
+	} else {
+		has_lvds_rst = false;
+	}
+
+	/*
+	 * This can only be made optional since we've had DT
+	 * nodes without the LVDS reset properties.
+	 *
+	 * If the property is missing, just disable LVDS, and
+	 * print a warning.
+	 */
+	if (tcon->quirks->has_lvds_alt) {
+		tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
+		if (IS_ERR(tcon->lvds_pll)) {
+			if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
+				has_lvds_alt = false;
+			} else {
+				dev_err(dev, "Couldn't get the LVDS PLL\n");
+				return PTR_ERR(tcon->lvds_pll);
+			}
+		} else {
+			has_lvds_alt = true;
+		}
+	}
+
+	if (!has_lvds_rst ||
+	    (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
+		dev_warn(dev, "Missing LVDS properties, Please upgrade your DT\n");
+		dev_warn(dev, "LVDS output disabled\n");
+		return -ENODEV;
+	}
+
+	return sun4i_lvds_init(drm, tcon);
+}
+
 /*
  * On SoCs with the old display pipeline design (Display Engine 1.0),
  * the TCON is always tied to just one backend. Hence we can traverse
@@ -1122,10 +1191,8 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sunxi_engine *engine;
-	struct device_node *remote;
 	struct sun4i_tcon *tcon;
 	struct reset_control *edp_rstc;
-	bool has_lvds_rst, has_lvds_alt, can_lvds;
 	int ret;
 
 	engine = sun4i_tcon_find_engine(drv, dev->of_node);
@@ -1170,58 +1237,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
@@ -1256,21 +1271,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
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
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
