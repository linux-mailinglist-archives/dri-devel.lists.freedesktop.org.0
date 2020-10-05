Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3D28473F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6572F6E413;
	Tue,  6 Oct 2020 07:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2189D4A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:15:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 896F858016F;
 Mon,  5 Oct 2020 11:15:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=M6TxlEDbt/kDk
 MimJa7ybEwCUY45Z+gACtOYuOtwq/s=; b=rdQD7n/fiHZTuQO5WB+A4I6dZJgZ5
 jTjpc6T2nCRY78jVvi7gRVI9XYR27KgzocxxYKXg6f7A7ioptB7viw1G04fSVlLn
 YG4MmeNc1alBxjiyZ1loM/eKzpyxFaXKE5eRYHcX0L0bhxJ5tIkbEZhJe9JpFtQ5
 RLbvJwBPW20HYlT3z4cLlSp5CP8Jdo8yPIss0XqCK4ymXmGblzHvISNrpCpe1TP7
 16vl6V9091ctu9OGbel5HYtDDqDM6V0Wn0hXw33TywFc9Nex8EooSCrhtFQlYfru
 NtFsmbn/khvrs/hwxRE/Xcrj7CvlGmJYW9sa36Hhn5PDAX7kwZauEJweQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M6TxlEDbt/kDkMimJa7ybEwCUY45Z+gACtOYuOtwq/s=; b=Xxau1wSS
 fgFYOu65IFeXBZYthNZ/H2P6jg48s453rixVv01/xUQUeMl9l8Vu7tCqGm7codmV
 YbzEZITthpHWfu9zZVcI+xBNSDlB3g6SFGlUY4RbCoQep5pXQ2kt0rqti8Z3jfl2
 Slrj1ScsFTggv7jjcNExznvXSuOYjm77/C2H/3Jk0DTKuDSomTeQclE+uqqPJKEK
 t7oS0SVAmuc2m1NmBxEfWV0EKrx1HWIua8QxxI55QbIkX25zUxbjxZUKMhMKIKO/
 XLmWTsmk3fTQ2QLGJMYQqVV7FlsAoTahLMDs5OClZIo7MxZyMerlkQIHM0jBKV8V
 FLXpIKfJFCVeTQ==
X-ME-Sender: <xms:qDh7X7hgiHI4PiVIua70nR9rWo1vWU3tupKGTiN-4dG2H529sooK6A>
 <xme:qDh7X4CajEwzHHpL5mTtrSbr2Kp9YoJnwx9u_qxu66UWja7gpv2KMFKfh8Eg8iLE-
 vm_7_2dFCXrX5Lontw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qDh7X7EgDVAqVKB2-acwIzjxgpXNi3cevC7_XOmbZYHaNuQD7ET9Vw>
 <xmx:qDh7X4RdBcdyFHDgWkFRagQro6y0jVKjix9dq3Sm8u0LgY_P7Afo2w>
 <xmx:qDh7X4wtQXniN88GLwLdrt9ArlTQk3tIR1ET16LEvQjJxR1AIftRqg>
 <xmx:qDh7X9o6vv_hA_EFx7JJhd0r07zpWnThivcp5Y7WKA3FfPY_5SBIUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26481328005D;
 Mon,  5 Oct 2020 11:15:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 4/6] drm/sun4i: tcon: Support the LVDS Dual-Link
Date: Mon,  5 Oct 2020 17:15:42 +0200
Message-Id: <8e63e9092f0fa4690a3fe6d21edd613b1f9c6874.1601910923.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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

The A20 and other SoC with two TCONs (A31, R40, etc.) can use its second
TCON as the secondary LVDS link in a dual-link setup, with the TCON0 being
the main link. Extend a bit the parsing code to leverage the DRM dual-link
code, register only the LVDS output on the primary TCON, and add the needed
bits to setup the TCON properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 35 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 ++++-
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 8a21cf7a6bc1..f497d866e835 100644
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
@@ -894,6 +897,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 		return sun4i_rgb_init(drm, tcon);
 
 	/*
+	 * Only the TCON0 will be relevant for the LVDS output, so if
+	 * our ID is something else, let's prevent our TCON from
+	 * registering its own LVDS output
+	 */
+	if (tcon->id) {
+		dev_dbg(dev, "TCON used as an LVDS secondary link.");
+		return 0;
+	}
+
+	/*
 	 * This can only be made optional since we've had DT
 	 * nodes without the LVDS reset properties.
 	 *
@@ -929,6 +942,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
 		}
 	}
 
+	/*
+	 * If we don't have a second TCON, we will never be able to do
+	 * dual-link LVDS, so we don't have much more to do.
+	 */
+	companion = of_parse_phandle(dev->of_node, "allwinner,lvds-companion", 0);
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
