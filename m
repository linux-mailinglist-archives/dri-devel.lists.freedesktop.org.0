Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D7925A51
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054110E7A5;
	Wed,  3 Jul 2024 10:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="UK6kcdDx";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="oXiUPHUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1010E7A6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:56:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 1C6061380623;
 Wed,  3 Jul 2024 06:56:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004184; x=
 1720090584; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=U
 K6kcdDxkvrlV+Zx6+eoZAumo9/YJMhAIV4IPB+aJ3bhIXgqgHTMvtXZNBnaMt072
 zwJBuxrs1Ik8+dMVDA8UxekZNTQJwWE+4N+qd5zxHOa5uSDndqyWm5AyxM/pGkWX
 +FGGcripBJhomZSHtAV7b15HUGeS5kon5jn3885xLLB0iUr4CWgvMym1EgdPL8lB
 QOVTK2UD+UFu93d8TpMQFtfEJDMBg/fB8IoqdrLn3UYTKD2v1eUy9ndlof1ZUUi2
 mG3iMV5pICVccO98VD8+SCftnQYaCkMSSMxBURJbWTfpFHmy8RJq3BfWn9YRmXTR
 f5FH0VCONwyKlJXRBLYgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004184; x=
 1720090584; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=o
 XiUPHUPmmibQK91pO3E61a3+AN3PDdkKHNtSHNLI71IQ2gBBf+Uou3ja8Ko6DF+b
 2xTybS2uk9nHh6nDT+N/t5Vsln/Ud27401in0M+J0ISmFvJHoOuqWrXW3/2f9sLP
 7rR0zBs/xDMrFTHVNBAcjiQTSoPxinprsnp44TlDHvFJ5c2mZruliQ7yCXxb8jnA
 l01zx6RGrEjZonMHA/LREaFWOf2j/NUWwU8s3iVJJYMy2QYo1y8P1yYlqj8A2+Va
 +E9vX3QhqamabaqG3aIBA+W/xmye5l/zXtkwQRB6ZiGWgmZc4qYkEpNOjKRSpaOs
 XCCg2LfQ5QsKHa7bVj9VA==
X-ME-Sender: <xms:Vy6FZnr5Om2hEwOAhwjbq2BeMDLyJOMTd_lvxHeB_5b7KlyUnQhrEQ>
 <xme:Vy6FZhrxrY7UOTwc3GOE3NOElGxjCgsNOqphOhyOHK2UDSZDkDpBrOxInLw2VU6S5
 Xhlyy7bKmb2kgbbMA>
X-ME-Received: <xmr:Vy6FZkNcBc4eL5zuOvxAmF0YSeKisMwFiYVDEouI_AY_Q8h6sPehC6l4DyimZhQrPVSdft140eMtxxIKbV9Iysiphl3WJulve-6G4IVwCYUvJXcD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:WC6FZq7m0_Vq1_8Y0SXTkcrngU4uiyZMq9-DQw7AywaEhXv1DOqU1Q>
 <xmx:WC6FZm5QJdVHOmE80scXqfCeGEsFCjEZZb8rqfEFbSNVFG0SE3FBYQ>
 <xmx:WC6FZiivdFFVusSLf7JRyLOfbZ6B5tVZTOid-SP5mEuD9Fq5ugyECQ>
 <xmx:WC6FZo4Vih-ks_Vj3N7_4wCsCmPiMtgUcaN-87yTjANcRwVEM8El6Q>
 <xmx:WC6FZrpYHGwyEILMq8jqgdszginUXe3jqGQeL1h-13OA23pG-doawPOT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:18 -0400 (EDT)
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
Subject: [PATCH v2 11/23] drm: sun4i: de3: add YUV support to the TCON
Date: Wed,  3 Jul 2024 22:51:01 +1200
Message-ID: <20240703105454.41254-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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

