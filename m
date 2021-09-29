Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517941C0DD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929416EA07;
	Wed, 29 Sep 2021 08:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E88D6EA07
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7D5DF3200F9F;
 Wed, 29 Sep 2021 04:42:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Sep 2021 04:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FJFQ1azQRDRmA
 YHCJ8TvmTKHApO5RLnncYdEXMr5UsM=; b=NjOc4nS/f4GkCF7075NWSJTeQLKWf
 IUj2Kjz/aw/uAe+QWfRejRAo2OJoXrIFf7H0k8BdmhTEfxD9fGiXC7aXX3DhVXFl
 BfWJjvTfogNyJ/4asC3TaBH8iv7IOMnUXe9JVCQzD8rbwf7tYI3lkb2wo+G/K8f0
 tF54hjnQZEq6pNsAVNERj8Bxw331zgCMFEI5odJtb9wDTI6kIt2uR9NTCoxVnz0n
 ZJmXw0zIsY98WxTb3+JMiXwU4jGEbE5Qdt/kgdxqrC0SgQBdPrMEgrEZsNa/sv7P
 8BmKBXp55EKnyngvBPcmXmMf/oOMS5e4W11TbvTIzPSYYzNmRIAZFQIMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FJFQ1azQRDRmAYHCJ8TvmTKHApO5RLnncYdEXMr5UsM=; b=ZxrawEVY
 fDyp/705XtU+DgFfkdjj98VVAzrt9ucLcsGDVLLR6XPD63dVXmfQ4/y+D9/CNrk7
 YoUmq/4y8/9kOFtHujh7nNBLvBXGQtzuguFo0bRBXoKQXB/o/JVDVL60qf/tHuYm
 cjDeIlenvbgxxElXc2YWlp6auwNc4b2GANz2WMe24Szg/HThsJ8gB50LiRiRN8+G
 oaJGh8JPur65fmTvX/5+URUCselZ3mr+pNhGUgLNzuekIy/chBTfF7xspRMLMHwM
 lt8WDwdjXDwu1/U1SKaHltFzbAvI1ld4k7e3I5G+ZBAVsTZzKvrqhotQJbxVjGO9
 kPmWk/pBsjtZOg==
X-ME-Sender: <xms:ECdUYWnvLsw0w7-A5bJW7OMPfbCkCJW7sUwkZpwntcmTSQ7Wn5iJCQ>
 <xme:ECdUYd1h1iUmIUpPdIsfAxW0zSBhptQ3eM34lkZ7Mwu_O3_e03JJfvE96KiEjbbhL
 jwTG8N9fsByim5RsH4>
X-ME-Received: <xmr:ECdUYUqRUI3eBkk1zTmIlpp_CBIXezKOpaIDZCu976UF47VYr4UVggxtobGi8BPehdGxWzv8XfyTAWoy90ml7plrhW5J5p3PSCGcXwYn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ECdUYanE8e54PTFXKEnlGPNTy08rx2grCDoMcNBX89P5JbVEcGsBDQ>
 <xmx:ECdUYU1WsAl7IcvWAUhv1XUcstWGWZoKP7vWY9621ONk7_vp_hYmCg>
 <xmx:ECdUYRuJgGOOXIvq6KZ6zI6RlylrEV0GT5zFsK2x8rSQidHNEU3yjg>
 <xmx:ESdUYVJgzk92mtR1fvAVQC9LeDTzJS2kaP44xHnVE8RhBycdq1lptw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/7] drm/sun4i: tcon: Support the LVDS Dual-Link
Date: Wed, 29 Sep 2021 10:42:32 +0200
Message-Id: <20210929084234.1271915-6-maxime@cerno.tech>
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
index e38e60faafd2..c7c94b7c6439 100644
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
@@ -886,6 +890,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
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
@@ -922,6 +936,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
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
2.31.1

