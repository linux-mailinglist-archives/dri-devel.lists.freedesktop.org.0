Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B731FA30
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 15:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4B6EB39;
	Fri, 19 Feb 2021 13:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5626EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D747D8A2;
 Fri, 19 Feb 2021 08:59:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 19 Feb 2021 08:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=56Q7VGWJxuS+2
 zJzR/vJpArneG2/6DQUpAmi2c91b+8=; b=NDr8thfvJ44ylJJK6E2HHD2CcbIvi
 voSJQGRTAGO02QGJWG88da9RfO0DZakztW9SVIZ+TRm4sz/U9LcdSaxPFcJvSMcS
 Lkm38UWdwCDPOBBSEtzVIAce1rwxNZY0jxYyMhRczc5SGsiLwhHl+yFAy3XDCkJw
 9/GRrRP2PjY0wLxb++SYVk0TcPBfn4CF5ltixP+hLknEoTYNDHXx6sBg+B8jis1f
 CkILQFYwC/BXlzj1AkcHiM58F6/0x47xuUTRxViHFJ7zuRelktw+5E+NXVcoho1G
 5NQlI2w2iwvardj5i05lF/26osZzejJjxz6ZzIf3GWfKAyG71DmzCOSFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=56Q7VGWJxuS+2zJzR/vJpArneG2/6DQUpAmi2c91b+8=; b=CV+86p6s
 /PS9c5+tSJHUcSs8ikosi+NbUWoDfBlr5/jjii4Or8UnF+MbI4QVOUzBYqK8+XXs
 VCtoHXFJDPkPJh8QfWgJeyX5NVReAg3AcRj1FAus+6c57uhOUnfufrTt4eHSoYvY
 Rpgkv7hxYPWoBrU2iGnlT7wmfUoMLV3hcsy7SJcwLb0g6zkKmFJhbHHxuXdnJNbM
 oR8r8lR8DHFdhX6VPO3hJRD5WIcAWLgpmCttcK03fgee0GkzW3na1MlRq+DAGraW
 wv69UW7mP75RysoPHwOPl35kL3J59LYdUq4teZkrZ9pPgZaSFX0l5nkl3K/2s5Ns
 1AyL5unm9OJwOA==
X-ME-Sender: <xms:UsQvYPkbtriZYqOqmR0mEi3Eu4Ri3MTWedkan4caDwXsJEh5QsDqTA>
 <xme:UsQvYGjgqPEu7WWRWIc3DNX8PgCyI0ygfVVxTZ9MJW4DRSqmstf0cOIJQcXw3gvbk
 _5Ns72jXZDRH7N9Nqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UsQvYPdWKPcrD5Bsa-hWo1eMxH_x3wphpI0z7US071HYYx1eh-mWng>
 <xmx:UsQvYOhg8LtLDjjRpzH648gc6N79NY-zLba9RXhSN1yZ9MrRBZ1O1A>
 <xmx:UsQvYPyBv-jt3AzAva3rmHG_9bDImI-AaOyxxhWIYYsDXAlLMwZ7Lg>
 <xmx:UsQvYCRCpiSBdISjkqpAYi71CJ3x_mWqhPL99zu1B-BXo65_yAHbGA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 455AB24005C;
 Fri, 19 Feb 2021 08:59:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 5/7] drm/sun4i: tcon: Support the LVDS Dual-Link
Date: Fri, 19 Feb 2021 14:59:32 +0100
Message-Id: <20210219135934.618684-6-maxime@cerno.tech>
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

The A20 and other SoC with two TCONs (A31, R40, etc.) can use its second
TCON as the secondary LVDS link in a dual-link setup, with the TCON0 being
the main link. Extend a bit the parsing code to leverage the DRM dual-link
code, register only the LVDS output on the primary TCON, and add the needed
bits to setup the TCON properly.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 32757175f86b..005c37831eb6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -475,6 +475,10 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 		     SUN4I_TCON0_BASIC2_V_BACKPORCH(bp));
 
 	reg = SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0;
+
+	if (tcon->lvds_dual_link)
+		reg |= SUN4I_TCON0_LVDS_IF_DUAL_LINK;
+
 	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
 		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
 	else
@@ -903,6 +907,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 	    !of_device_is_compatible(remote, "panel-lvds"))
 		return sun4i_rgb_init(drm, tcon);
 
+	/*
+	 * Only the TCON0 will be relevant for the LVDS output, so if
+	 * our ID is something else, let's prevent our TCON from
+	 * registering its own LVDS output
+	 */
+	if (tcon->id) {
+		dev_dbg(dev, "TCON used as an LVDS secondary link.");
+		return 0;
+	}
+
 	/*
 	 * This can only be made optional since we've had DT
 	 * nodes without the LVDS reset properties.
@@ -939,6 +953,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 		}
 	}
 
+	/*
+	 * If we don't have a second TCON, we will never be able to do
+	 * dual-link LVDS, so we don't have much more to do.
+	 */
+	companion = of_parse_phandle(dev->of_node, "link-companion", 0);
+	if (!companion)
+		return sun4i_lvds_init(drm, tcon);
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
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index ee555318e3c2..f6a589828f94 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -98,6 +98,7 @@
 
 #define SUN4I_TCON0_LVDS_IF_REG			0x84
 #define SUN4I_TCON0_LVDS_IF_EN				BIT(31)
+#define SUN4I_TCON0_LVDS_IF_DUAL_LINK			BIT(30)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK		BIT(26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS		(1 << 26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS		(0 << 26)
@@ -280,6 +281,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Is the LVDS link a dual-channel link? */
+	bool				lvds_dual_link;
+
 	int				id;
 
 	/* TCON list management */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
