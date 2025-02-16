Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B95A372EE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9604910E23B;
	Sun, 16 Feb 2025 09:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Dmox648l";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="wT6T8Vwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0DE10E231
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:43 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id F2DFD1140115;
 Sun, 16 Feb 2025 03:57:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 03:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696230; x=
 1739782630; bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=D
 mox648ljHJDAW9ch+aahuxNujXkNk5hFGEDG20Elnn5o5dFLoEKfYDe6suXRWoz3
 Zn4ZclfUoJwtWM2kekRtX2MN7+TVHsBPXRjeaueokrpsJrJ1gKgD5n6tgLptseDB
 YewTBXHQz5sVOSy5+HF0Np4ntQxDgB3gJhSaX9c6c3I2OoKhMGmfh8HfwrTDNvWe
 mGbiL3FQieeCZQ/W0h7MhqZaKCxEHYyDlLjxotZv/flO9u9jIyw1VbwrN9zGjp1+
 8yLXTjI5KwJAWViPg1PwUwwLMdj7SdWlkkk/XFBz9pg8dh3jXDA7cWHnzFoB1QtV
 dofZmXrWBtPuzs/51rTIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696230; x=1739782630; bh=p
 NN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=wT6T8VwbGoZOaHsmL
 1IsQfv763ZAsvlX1YfNZ4R1AwVFwoCNe/8RnNrN6rKe7fCG/dCuxAP6PvKXAGM6c
 Y3LMXI0DJO+1L61GiezmB/6slQ0GPfYgj9PdeORFGAfdIUG0ymcBpsUrPvE2NoQt
 pPRHLS3zc4qjQIgLUUhBqwnHo3nKZpvwYO3DEQRBN7N3XFYL5a/cg2zYGg+4u13C
 CEHR/SPvmikBwkbOiUT3NwBJi9O210YQleKKW4jRRzRQfs/jW5P4DlT+EytYj1jS
 B8Di/lqBGtZBLcxffRtdYF5rm/T0zpKf0nvTE1rs+um2hDmtUV9qrB7I4qQWTdhB
 2/ukg==
X-ME-Sender: <xms:ZqixZxVs2b-0fqK9Mfi6b5eQQRqdS816JyVvQz1UnU-jI3C4pbDZmw>
 <xme:ZqixZxn__ycx_Y_wPX_W1ghJLMY2CbLK-s8WjzwOFwWRkRcJR-epF4eT9YSJruHQ8
 XrVvDANsivtyvAPtQ>
X-ME-Received: <xmr:ZqixZ9ZrnNevqaWjayGtljJe7zrYUNPrv7RF49-3cpkBjZqBkXsVLbGR0IY_KchuusMTRQQRK4SrR00xkLiVzNU4KzSKRaWcmGz56NdJeHkX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZqixZ0Wap5gvd0kklJrH8YbWKKBwlypw8aq87hGIU35ZK2JCmU_1qA>
 <xmx:ZqixZ7lx1t3WkXDmAZhjXJ_udfD-fYGUMynhvMK2e1LO742VHG8uXg>
 <xmx:ZqixZxc-7eOkdYivHuMYmhDu7IaDBXrd8c0uxIXzjNn_Aj-Dmsmhcg>
 <xmx:ZqixZ1GrndMDCSePKp9cZGt9gSYTLApbGOFSjo492sF7CxR0fb1b-A>
 <xmx:ZqixZ_3wQ9cKsCXNIdYn4wjefIeGrOPuiH2Td9MRxuL46QCcTp8sebMs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:04 -0500 (EST)
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
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 12/27] drm: sun4i: de3: add YUV support to the TCON
Date: Sun, 16 Feb 2025 21:50:43 +1300
Message-ID: <20250216085432.6373-14-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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

--
Changelog v5..v6:
- Update to obtain color format from mixer if required.
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291da..4cd3a07daf6e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -37,6 +37,7 @@
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
 #include "sun4i_tcon_dclk.h"
+#include "sun8i_mixer.h"
 #include "sun8i_tcon_top.h"
 #include "sunxi_engine.h"
 
@@ -598,14 +599,27 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
+
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (mixer->color_model.format) {
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
@@ -624,17 +638,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
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
@@ -642,8 +656,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
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
2.48.1

