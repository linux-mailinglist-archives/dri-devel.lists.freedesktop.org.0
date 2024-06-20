Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CB9102B3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7D10E92C;
	Thu, 20 Jun 2024 11:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ZNyQr4fh";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NKiJtUDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C0110E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:33:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2CE84114026F;
 Thu, 20 Jun 2024 07:33:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 20 Jun 2024 07:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883191; x=
 1718969591; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=Z
 NyQr4fhn3vhEQrpnKijIIWJn5umfcRB7FPFIQlQFqUaRACGTTaxKC2XOXP2KHK/a
 nBd6/+xV2YHSBkgvzVEpM/Gu/Z2yB75dPHvFuZuzxmszawI8nwEj7kTjO8eUIBYs
 XQlQneLAKde8v2S2Tz1vtxmGPKk64jF5BOAI5kZLElRAk2FkRHSsEfRDXaYyZfhN
 Rm+6j3Lo2tMzCzGEfaEt+Cl6L3aJtAuvyhWBmNiwqoXgKoZ+Q9IpI1S7i2oFUCh6
 8bist7ZsU5McCI1yv+UmC1rTpPAzv7AGw6KDBcu5i16cHUmLj/dUrTY+WuA2KPt2
 kzJeeVeKeLKiLf+NndFXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883191; x=
 1718969591; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=N
 KiJtUDqAr/H3w96CtK9rRPvS0vC+nphOc+bhaTEkU7Fg3xZWGmHBoOvdLCKAghwW
 KqsXjEkHEFEGS8yRG4ejkI+TKcTKxfjEu0inhFzcDBs5EkwlNwruQASLP8ZPVPps
 1Q17IbsbBIn2Pg34z8iHIoLH+KzGiKdz7u2D1K8lp5EMC4GnqfRkF39PhbTr73hj
 N0eZHutVNn7e9w2LXkaoO43r9+iZacVzBLO9A7ehWRCZaHWyre0gx7f2GqHuqxFr
 8gp36qP3cud79DGVnrisTiWsO+CDz2GLx2SEwicmA+ANIr06vNTSXwewTueFTu0z
 jUsSjvzXuP7xlLT6PU3rQ==
X-ME-Sender: <xms:dhN0ZvgjgvOMZ0EFxOiKntdLkEDYWcmYFuuImHrcJgN8mtRqEWeTrA>
 <xme:dhN0ZsA8UBuH_NSKbcIGZBHr6_ZcLwiuiwvPEzU1j2tz-2IBuWVQnbaN4jRCJxgwj
 9LcP3hVzFnPcxMukA>
X-ME-Received: <xmr:dhN0ZvG1HjCbfB5btRWTJl8kddaywGtKwyCN6qC301Hlz0WxpTJat7IKuoqVtOs-4Bb3IZEy4w89VwQXQOAEMnUXwp15jSkDnnS0aqo57g32MWOR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:dxN0ZsRpmRGmtRmaVMazH4Udqk55sfa29U3Eo__wtXAwFFrT736JkQ>
 <xmx:dxN0ZszkSwizZuvQduvGSH97KSraEMMzGPH96EGEBnBM_U-kiCZIDw>
 <xmx:dxN0Zi5P1gzGyBUvrf3y8ep5sxG4rrET92F8o7Ns9u33J3yc0BShVQ>
 <xmx:dxN0ZhycaFdHYhY4FqE7ZQLHx2CrLFw2b1ogn8gkFpllJGvPdhyHYQ>
 <xmx:dxN0Zjia8GeQb7FuNYeOcM4AEPcA_QxR3YtLUvmzbESdgTDKFUqafDVh>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:05 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 11/23] drm: sun4i: de3: add YUV support to the TCON
Date: Thu, 20 Jun 2024 23:29:49 +1200
Message-ID: <20240620113150.83466-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Account for U/V channel subsampling by reducing the dot clock and
resolution with a divider in the DE3 timing controller if a YUV format
is selected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index a1a2c845ade0c..e39926e9f0b5d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -598,14 +598,26 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sunxi_engine *engine = scrtc->engine;
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (engine->format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		div = 2;
+		break;
+	default:
+		div = 1;
+		break;
+	}
+
 	/* Configure the dot clock */
-	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000);
+	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000 / div);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 1);
@@ -624,17 +636,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
 	/* Set the input resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC0_REG,
-		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set the upscaling resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC1_REG,
-		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC1_Y(mode->crtc_vdisplay));
 
 	/* Set the output resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC2_REG,
-		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
 
 	/* Set horizontal display timings */
@@ -642,8 +654,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 	DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
 			 mode->htotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
-		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal) |
-		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
+		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal / div) |
+		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp / div));
 
 	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
 	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
-- 
2.45.2

