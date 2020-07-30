Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F3234025
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52216EA04;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697646E091
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:35:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0C235803DF;
 Thu, 30 Jul 2020 05:35:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XW1cJZ5QsKEOB
 +Ltal+2UQAjqNTRc+bz0avXmWKWqAE=; b=eJ9bqIAXEKA7b0KLcid7+BE36kpgt
 5VRyAaV+/TeOi5Ar472rHiyvnCdTTkIA8ZkOZyHn4Fbjj/GNLwJArR8Umwjr3Mzu
 DMw2gz+v3Bz3S2tC6tb/T/PoTGBoo5o/J22p5hWCyPsKX0mXYahBXToRPhN+pn+D
 0NNheGz4CpKf4tBSWxIqVEwyd4TGtdTWnMWzrkd9yPGOTk34fDb+yehcecjsvY4I
 vBUGKaYAF4KwwgPPUc874Zrp913M4vS9kk/vQquZNlDU0bc4jbW8FxXkM6eWM48M
 xjfQAMlY+oRfalvmYx7SDBQs9+LRJJqkG09jC6W6njZ/iEciT8m+qWK2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XW1cJZ5QsKEOB+Ltal+2UQAjqNTRc+bz0avXmWKWqAE=; b=oTeN+aY3
 SmkE8twMMZcicTQvv6T7IpTL5oltmZEHAJgWKT4Y1q3aKBLcZrPbtRZ6OIJZlaCj
 IIXCERft9X8A/Ov6YS0nO6SH8BmZ1O7a1A5r5XlZrqnosvBNLTXe4IwJIThMYYpW
 xLJB1+41Efs5k2yeaCRMmhLgS6iyZQ0znbLLOQCYC4ehBfA8L9GJN8dSWIbBqN37
 77PcySt13OCSbdZhF2R2DE8pzJ11xnrXO9sXV7Vm2YsvdyOQR9KSEWkGJxgE7wNE
 ZUnSrz5ysbKUfIxPfOmMguiDsc1vCkJW4NZBgiqTez7H6MqY6NW8kWG6C8IHraaK
 DYv0bhDv1mjZ6g==
X-ME-Sender: <xms:X5QiX2dNHPvBtywqah48tSFX-DPdSi8urTYtJdlx_YY2MAL-O-wErw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:X5QiXwObgU2yIyEnT_tKtDHvaM26kpGVXmvezEltn3pU2iRCvbn_cg>
 <xmx:X5QiX3gKmOkuSbh25yH2bgqSW9egPZquOaGdN6lGkLxRNb-r20SdAw>
 <xmx:X5QiXz-xpwrXtmjjmsq4be5zV7yeFIPY5mmIbxT1_1DNXv03nZbUgg>
 <xmx:X5QiX8KflxFI8u5mBm32SevGXjxCgpyHL_bsZdsrbQBvm6GKi-aQ3A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 716B23060067;
 Thu, 30 Jul 2020 05:35:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/sun4i: tcon: Support the LVDS Dual-Link on the A20
Date: Thu, 30 Jul 2020 11:35:03 +0200
Message-Id: <100f5fe3391366e9bbc76ebec1edbf8c0aeb715a.1596101672.git-series.maxime@cerno.tech>
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

The A20 can use its second TCON as the secondary LVDS link in a dual-link
setup, with the TCON0 being the main link. Extend a bit the parsing code to
leverage the DRM dual-link code, register only the LVDS output on the
primary TCON, and add the needed bits to setup the TCON properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 +++-
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index d03ad75f9900..ed2abf6eb18b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -487,6 +487,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 	else
 		reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL;
 
+	if (tcon->lvds_dual_link)
+		reg |= SUN4I_TCON0_LVDS_IF_DUAL_LINK;
+
 	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
 		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
 	else
@@ -896,6 +899,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 		return sun4i_rgb_init(drm, tcon);
 
 	/*
+	 * Only the TCON0 will be relevant for the LVDS output, so if
+	 * our ID is something else, let's prevent our TCON from
+	 * registering its own LVDS output
+	 */
+	if (tcon->id) {
+		dev_info(dev, "Secondary TCON, disabling panel output");
+		return 0;
+	}
+
+	/*
 	 * This can only be made optional since we've had DT
 	 * nodes without the LVDS reset properties.
 	 *
@@ -941,6 +954,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 		return -ENODEV;
 	}
 
+	/*
+	 * If we don't have a second TCON, we will never be able to do
+	 * dual-link LVDS, so we don't have much more to do.
+	 */
+	companion = of_parse_phandle(dev->of_node, "allwinner,lvds-companion", 0);
+	if (!companion)
+		return 0;
+
+	/*
+	 * Let's do a sanity check on the dual-link setup to make sure
+	 * everything is properly described.
+	 */
+	ret = drm_of_lvds_get_dual_link_pixel_order(dev->of_node, 1, 0,
+						    companion, 1, 0);
+	if (ret < 0) {
+		dev_err(dev, "Invalid Dual-Link Configuration.\n");
+		return ret;
+	}
+
+	dev_info(dev, "Primary TCON, enabling LVDS Dual-Link");
+	tcon->lvds_dual_link = true;
+
 	return sun4i_lvds_init(drm, tcon);
 }
 
@@ -1500,6 +1535,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index cfbf4e6c1679..51c4e09cdd13 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -98,6 +98,7 @@
 
 #define SUN4I_TCON0_LVDS_IF_REG			0x84
 #define SUN4I_TCON0_LVDS_IF_EN				BIT(31)
+#define SUN4I_TCON0_LVDS_IF_DUAL_LINK			BIT(30)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK		BIT(26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS		(1 << 26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS		(0 << 26)
@@ -274,6 +275,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Is the LVDS link a dual-channel link? */
+	bool				lvds_dual_link;
+
 	int				id;
 
 	/* TCON list management */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
