Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F3478CC7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA9F89686;
	Fri, 17 Dec 2021 13:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC4F89209
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DC8AE5C017C;
 Fri, 17 Dec 2021 08:51:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 17 Dec 2021 08:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yLWoOkQ6TZzUy
 yl70PvyuMwtxMG3V7qoapONhdLCXyI=; b=NFsq8BO2itVdQMaGRqA6A6ThpdVT5
 14vCnVSUHRAM6GVTT9SCVZQEwgOVrB3VNUpl7VQi12+yuqmkubec7MKO3i2xqQGp
 6kWqUDS8TuMDIqpNsavnE/myRjhiXvkU//Asw4JfkBMRH3ir2omNDzgReh5KYoDE
 IS14LLPRtrcrxpft3wEm6v6W9gCGaRGmXl+eICr1cb1hqRDbuxBKld161PuPz2rg
 nakcDHzzSsKwwXIg60VzBIwB8IPEWLdpkPlvTAz46k6GjnoLMCWQIeJ8G2bKt04A
 4lQLw3krEy6Ktasr0rvdflTBB/9U0y5+FTwgiwurSIPhftNhsDkAlEj8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yLWoOkQ6TZzUyyl70PvyuMwtxMG3V7qoapONhdLCXyI=; b=S5j0Zewj
 iPgusZ+BAeTBVL1RMk4ot+b0X4bMZNgMpAQtRAV77foVoSXdcMTTqGICCxzQUNg8
 sLkMKqS5lvqt6pvfsAczymGrCXmHE9lXsrDXjG0VXCs/3irUQwuLO0efQGJk/ftm
 ulQxRTmmtcE+wZ3H4nk8aRCGZ/VBplLbiBq/Cgt1UQkATpq7+ZXJpvZG1lNg0pOZ
 csPhxrHwzVWsD/7TCfL/fo9QJuMKJXlu88wyVMh23kQfmNGpZrcofUzlypqK+dU+
 g2P+wrM8y1lBZOErkt5nWVbLRYrwA5Fl7RI/KALf+dSzK43otUvBIW/H2D5hv2p2
 Q2pXkepshUXhYQ==
X-ME-Sender: <xms:5ZW8YfhguR7IFgwOK_iN42m6jXNr2uuZyW5hPZJg4ih3fslTFju_Hw>
 <xme:5ZW8YcA1o14WjHS4YwwqA6hRdVm4kGvQdgZjfaSBVosh09nuP_4spMbBGz05wumkZ
 Wg63vXhTC0qexEkjdk>
X-ME-Received: <xmr:5ZW8YfG6KPL4KiRgEb_FYdntMkZdk6QEm9wBkkg36D3ACL1MWw1-wqjWOkJxkm0Ylu-FWZxFPKRqJv_4-_z_Hwl9MKSIcrvCFG_6_OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5ZW8YcSKW0wu9LQKFspOHfzbXxJqNachk0gAanuWr5ukABG_e7hQjA>
 <xmx:5ZW8YczxmeKdo70tx8vyhyx21tqH0wT72L4Cg7JAfDZOJayutULigA>
 <xmx:5ZW8YS7YvxuRfbC64NyM-QmImH5ERZHJT253UdQMomN2viifDTMXxw>
 <xmx:5ZW8YblBsBoHaQrcY9AEdb2YKUCm1L7pRETlku9HQpvpSI31-82nMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 5/7] drm/sun4i: tcon: Support the LVDS Dual-Link
Date: Fri, 17 Dec 2021 14:51:17 +0100
Message-Id: <20211217135119.316781-6-maxime@cerno.tech>
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
index 4e01807ecf41..5e8f020d8c03 100644
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
@@ -884,6 +888,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
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
@@ -920,6 +934,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
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
index e624f6977eb8..7609a880a8a7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -98,6 +98,7 @@
 
 #define SUN4I_TCON0_LVDS_IF_REG			0x84
 #define SUN4I_TCON0_LVDS_IF_EN				BIT(31)
+#define SUN4I_TCON0_LVDS_IF_DUAL_LINK			BIT(30)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK		BIT(26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS		(1 << 26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS		(0 << 26)
@@ -281,6 +282,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Is the LVDS link a dual-channel link? */
+	bool				lvds_dual_link;
+
 	int				id;
 
 	/* TCON list management */
-- 
2.33.1

