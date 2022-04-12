Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53844FCDE9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2010E930;
	Tue, 12 Apr 2022 04:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AB710ECBD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CE6E53201C39;
 Tue, 12 Apr 2022 00:28:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Apr 2022 00:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737711; x=1649824111; bh=x/
 kjGEoJjnBOZQliR6L7zzdNmMkF1cO50gChVssOtCM=; b=iyeRGURJSdWVCuhdzF
 h3hw6HcZS1ZDj6BcZVX8WTX2oPbt5vJ8MrviCAlNwFP95/uL40XHrRNhqYrwqlsn
 6Dlygpj89dZ8ZNTrYTSpNxyjZb517FoqUCVgo8ph6xRfZZqMjnFdx1BKzYA9tJgE
 CetwPtSWAf5QNXuYRahEfIwipJew6yoLnIg4wV+Pn+DlPcm/urh6RNrVAk60u5di
 I7ZT8grxogNSjYGMp81BFUd71cegC8DIE+ugrc8r6QfcWIG8r3HnvJBYMwMQvyTn
 3jjxjnzNtBV54GaWRT6tjve91logF7tiUcmmEpm0pzrJAAB+utopQmc7T3GfUrXO
 J8mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737711; x=1649824111; bh=x/kjGEoJjnBOZQliR6L7zzdNmMkF1cO50gC
 hVssOtCM=; b=ItJmB2PV7CUCNKEQeleoFs7BEjojXC8b2/BmGQF4wCowg/Y2tB1
 8hQwSQX30y0OoqNtuPnmLNteMxmBEu64X7AN1DnpyWykxY/m5OowTdkWklzJhT2a
 HB2UZBi+Ux4sD6F+y0vaJlKeWrtDcPrSYZ/LSy+pjm2WYW49bGyXUdrnhTjcjgHR
 om+b0MlKTUlmd694eCNM0Yuek7BRbMLnNZbC56QOfQyJYynGQSETNzXfZM5d+j6o
 4NXqhUMXLcrrJQooYaUmEKbu2LV3xkap+fN4Ui1zUzn8Y8XKyiJWt67xgTFBEueT
 ALZMhWWW6GqyHmaqkcxSa+r/+liMj60tUEg==
X-ME-Sender: <xms:7_9UYhYKs1eqrvRTFuIqUzyPOMwqWlrYa17-NZHfgfiE9_Oms1lfXw>
 <xme:7_9UYoYridqHP3C9-K0hKWkFGXnGCG6rqssV4aEqB6v7xyJh9VTImgEMUNZXnqOtG
 P9YgfwOmycx3rcByg>
X-ME-Received: <xmr:7_9UYj9EapTN4ElSmkmi3V-Z5v2raYt9gKMgy50fSu5OyV8-luPDOHvQvRGMRDpofkufYZv8mn7Jw0X5vzQeZjP7a9eXTU4FRhwtVCyYb83j8zJvGfb5WXi1z9B-eU9HOGu8Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7_9UYvoUh3uMlbjGHF0SlN2rdUav0dpm7k8z86JufLObkNee5kjv0g>
 <xmx:7_9UYspOGFRhjAzGEWMdWPrhniu7GcaAIDe4euryO6ToaullHc5E8w>
 <xmx:7_9UYlSkQfQiJ5rGwAmXse9tuYoXuSTX175i1ajqSDdj9lj29KxN9Q>
 <xmx:7_9UYhR0mbzdyBt9ftnKBTCEZo4jWrSSBUiz0PPHU0VI1kaeHRABiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:30 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 07/14] sun4i/drm: backend: use mode_set engine callback
Date: Mon, 11 Apr 2022 23:27:59 -0500
Message-Id: <20220412042807.47519-8-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Newly introduced mode_set callback in engine structure is a much better
place for setting backend output size and interlace mode for following
reasons:
1. Aforementioned properties change only when mode changes, so it's
   enough to be set only once per mode set. Currently it's done whenever
   properties of primary plane are changed.
2. It's assumed that primary plane will always cover whole screen. While
   this is true most of the time, it's not always. Planes are universal.
   There is no reason to add artificial limitation to primary plane.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[Samuel: drop unused 'interlaced' variable]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun4i_backend.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index f52ff4e6c662..decd95ad519d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -172,14 +172,6 @@ int sun4i_backend_update_layer_coord(struct sun4i_backend *backend,
 
 	DRM_DEBUG_DRIVER("Updating layer %d\n", layer);
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
-				 state->crtc_w, state->crtc_h);
-		regmap_write(backend->engine.regs, SUN4I_BACKEND_DISSIZE_REG,
-			     SUN4I_BACKEND_DISSIZE(state->crtc_w,
-						   state->crtc_h));
-	}
-
 	/* Set height and width */
 	DRM_DEBUG_DRIVER("Layer size W: %u H: %u\n",
 			 state->crtc_w, state->crtc_h);
@@ -259,7 +251,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	bool interlaced = false;
 	u32 val;
 	int ret;
 
@@ -267,17 +258,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_ATTCTL_REG0(layer),
 			   SUN4I_BACKEND_ATTCTL_REG0_LAY_YUVEN, 0);
 
-	if (plane->state->crtc)
-		interlaced = plane->state->crtc->state->adjusted_mode.flags
-			& DRM_MODE_FLAG_INTERLACE;
-
-	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_MODCTL_REG,
-			   SUN4I_BACKEND_MODCTL_ITLMOD_EN,
-			   interlaced ? SUN4I_BACKEND_MODCTL_ITLMOD_EN : 0);
-
-	DRM_DEBUG_DRIVER("Switching display backend interlaced mode %s\n",
-			 interlaced ? "on" : "off");
-
 	val = SUN4I_BACKEND_ATTCTL_REG0_LAY_GLBALPHA(state->alpha >> 8);
 	if (state->alpha != DRM_BLEND_ALPHA_OPAQUE)
 		val |= SUN4I_BACKEND_ATTCTL_REG0_LAY_GLBALPHA_EN;
@@ -654,6 +634,25 @@ static void sun4i_backend_vblank_quirk(struct sunxi_engine *engine)
 	spin_unlock(&backend->frontend_lock);
 };
 
+static void sun4i_backend_mode_set(struct sunxi_engine *engine,
+				   const struct drm_display_mode *mode)
+{
+	bool interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+
+	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
+			 mode->hdisplay, mode->vdisplay);
+
+	regmap_write(engine->regs, SUN4I_BACKEND_DISSIZE_REG,
+		     SUN4I_BACKEND_DISSIZE(mode->hdisplay, mode->vdisplay));
+
+	regmap_update_bits(engine->regs, SUN4I_BACKEND_MODCTL_REG,
+			   SUN4I_BACKEND_MODCTL_ITLMOD_EN,
+			   interlaced ? SUN4I_BACKEND_MODCTL_ITLMOD_EN : 0);
+
+	DRM_DEBUG_DRIVER("Switching display backend interlaced mode %s\n",
+			 interlaced ? "on" : "off");
+}
+
 static int sun4i_backend_init_sat(struct device *dev) {
 	struct sun4i_backend *backend = dev_get_drvdata(dev);
 	int ret;
@@ -765,6 +764,7 @@ static const struct sunxi_engine_ops sun4i_backend_engine_ops = {
 	.apply_color_correction		= sun4i_backend_apply_color_correction,
 	.disable_color_correction	= sun4i_backend_disable_color_correction,
 	.vblank_quirk			= sun4i_backend_vblank_quirk,
+	.mode_set			= sun4i_backend_mode_set,
 };
 
 static const struct regmap_config sun4i_backend_regmap_config = {
-- 
2.35.1

