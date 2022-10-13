Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E955FDAAF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA17610E8F8;
	Thu, 13 Oct 2022 13:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BB310E8B0;
 Thu, 13 Oct 2022 13:19:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D161A580361;
 Thu, 13 Oct 2022 09:19:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 09:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667189; x=
 1665674389; bh=h9rIQtE16UVNLTGu8t+q8bCoDQMyIMJnR3Mj2Nv+w+s=; b=S
 vyV2FbHctiYGtfh9TVzIx+ekfviKyKOh2eGaS+SWBBUQ+F8t3+1hKQwPfFP3TrCE
 b9jW59IYIUZBjryl/l8zxAfiKYzuHzfNkxefqelZ1UsJPWHNJaUPxAJxkx5/jM+m
 Rn5eezFeDcG+43hvFByZXIHlayIerT4f9XBJN6ZpW6V6Rs0gtpkVu4IgD2dIRze9
 w/n1r68h8gboFRtKHE0PJX/2P8t39IZS4Oozu5p9y2UwAvODwl9kIgwzVDm+dHcH
 I+IpKuEYmKDUkpv8uLj2S+dLQLbKKlTYqPwXSNbv/JF9acM/4/SIlUegaSqVa3d4
 2KQsTXWMGsZCI7uMCvckQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667189; x=
 1665674389; bh=h9rIQtE16UVNLTGu8t+q8bCoDQMyIMJnR3Mj2Nv+w+s=; b=l
 HLPHXVAhDRyGM4IkxMIa4OQiNMlBaqTmBXnPoIsWRaK6OqZ3k3yqk6dorTwFxnYG
 YF9Aw0jyHyEhmzo2T4E0YuE+yRneWXRmGBGAtH+KspIMSDtIBtJVKQW0tYQCMLZa
 sniL+SHqNNADkK+Rr34z4DfT3gwsu7Z1CEtiZJCxH6Dlwj/nl71kQ/Jsq2JCpQq1
 w2MSxKX17bJjnw4sI9NtUKdHA/T+0MDD3BY11O+X30/7vlCP/Vl3Pskv3y1tnKR2
 d1wpByhAsoCJ/Tv7LxdQxIGwjO8pbjchiDBgGrtNQ7U7dafMAf9r7cR6Bnkz4/rk
 0NCUfT6spKcjIdTt/B6xg==
X-ME-Sender: <xms:dRBIY1hjDeptiqy39yP1yG1ThohyJSVRcdykhcQKfJHWx1c-5kGKzg>
 <xme:dRBIY6B4Ctx_8jbdcbiq-5J2v_CQzm71tCT8bupwP2gv5x9cSHvH3Zze3YT5OBfEe
 7Wq9m3tbZQJADxJ_6Y>
X-ME-Received: <xmr:dRBIY1F0tQPwWTumvoBflTmCNCwix-QnpRRZdRpE0TxQJo_8GCk8bWrHu9DeW3WoWh3LAi0qLW6zTPaacADJ7cqsMiT9mHrtTLJ_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dRBIY6S4UlhuWnUCMpHz1-FC6ne4dsXeVyh6kiuPU2N9tWnHhONF2g>
 <xmx:dRBIYyy6j5jxk6B6CAbHEUZWKsTdFFxyCSR_c8rHj5v6pIcVKqAvUA>
 <xmx:dRBIYw5p7F_oY7MxyvSCMjA8pB1mDFSe3VTFPbVqku5uWNu0Jhq0IQ>
 <xmx:dRBIY6c3ZA8OrXW6kOg-surudx5H1Vc-itU6EPsaPYXP3rIy7ziGvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:19:06 +0200
Subject: [PATCH v5 22/22] drm/sun4i: tv: Convert to the new TV mode property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v5-22-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=7885; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UBK2496A12qSpxKEPLeEGMre7XGaly++EuuFpxx2R2s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAu4StzeF7Xh0lnf3/2MP+c9+ddge9s7TI0lN9NWi3wlt
 m+SndZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiAp0M/2NeZ3kvfioYd0c2Y1ehXk
 9un1vI4hyeBqueYx9vT6lexMTwV0JqhrLED067fy6cD+Ytup/9lFM08YhpvtQUwYzY2GM2jAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the core can deal fine with analog TV modes, let's convert the
sun4i TV driver to leverage those new features.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v5:
- Removed the count variable in get_modes
- Removed spurious vc4 change
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 145 +++++++++++++--------------------------
 1 file changed, 48 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index c65f0a89b6b0..4f07aff11551 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -141,23 +141,14 @@ struct resync_parameters {
 struct tv_mode {
 	char		*name;
 
+	unsigned int	tv_mode;
+
 	u32		mode;
 	u32		chroma_freq;
 	u16		back_porch;
 	u16		front_porch;
-	u16		line_number;
 	u16		vblank_level;
 
-	u32		hdisplay;
-	u16		hfront_porch;
-	u16		hsync_len;
-	u16		hback_porch;
-
-	u32		vdisplay;
-	u16		vfront_porch;
-	u16		vsync_len;
-	u16		vback_porch;
-
 	bool		yc_en;
 	bool		dac3_en;
 	bool		dac_bit25_en;
@@ -213,7 +204,7 @@ static const struct resync_parameters pal_resync_parameters = {
 
 static const struct tv_mode tv_modes[] = {
 	{
-		.name		= "NTSC",
+		.tv_mode	= DRM_MODE_TV_MODE_NTSC,
 		.mode		= SUN4I_TVE_CFG0_RES_480i,
 		.chroma_freq	= 0x21f07c1f,
 		.yc_en		= true,
@@ -222,17 +213,6 @@ static const struct tv_mode tv_modes[] = {
 
 		.back_porch	= 118,
 		.front_porch	= 32,
-		.line_number	= 525,
-
-		.hdisplay	= 720,
-		.hfront_porch	= 18,
-		.hsync_len	= 2,
-		.hback_porch	= 118,
-
-		.vdisplay	= 480,
-		.vfront_porch	= 26,
-		.vsync_len	= 2,
-		.vback_porch	= 17,
 
 		.vblank_level	= 240,
 
@@ -242,23 +222,12 @@ static const struct tv_mode tv_modes[] = {
 		.resync_params	= &ntsc_resync_parameters,
 	},
 	{
-		.name		= "PAL",
+		.tv_mode	= DRM_MODE_TV_MODE_PAL,
 		.mode		= SUN4I_TVE_CFG0_RES_576i,
 		.chroma_freq	= 0x2a098acb,
 
 		.back_porch	= 138,
 		.front_porch	= 24,
-		.line_number	= 625,
-
-		.hdisplay	= 720,
-		.hfront_porch	= 3,
-		.hsync_len	= 2,
-		.hback_porch	= 139,
-
-		.vdisplay	= 576,
-		.vfront_porch	= 28,
-		.vsync_len	= 2,
-		.vback_porch	= 19,
 
 		.vblank_level	= 252,
 
@@ -276,63 +245,21 @@ drm_encoder_to_sun4i_tv(struct drm_encoder *encoder)
 			    encoder);
 }
 
-/*
- * FIXME: If only the drm_display_mode private field was usable, this
- * could go away...
- *
- * So far, it doesn't seem to be preserved when the mode is passed by
- * to mode_set for some reason.
- */
-static const struct tv_mode *sun4i_tv_find_tv_by_mode(const struct drm_display_mode *mode)
+static const struct tv_mode *
+sun4i_tv_find_tv_by_mode(unsigned int mode)
 {
 	int i;
 
-	/* First try to identify the mode by name */
 	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
 		const struct tv_mode *tv_mode = &tv_modes[i];
 
-		DRM_DEBUG_DRIVER("Comparing mode %s vs %s",
-				 mode->name, tv_mode->name);
-
-		if (!strcmp(mode->name, tv_mode->name))
-			return tv_mode;
-	}
-
-	/* Then by number of lines */
-	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
-		const struct tv_mode *tv_mode = &tv_modes[i];
-
-		DRM_DEBUG_DRIVER("Comparing mode %s vs %s (X: %d vs %d)",
-				 mode->name, tv_mode->name,
-				 mode->vdisplay, tv_mode->vdisplay);
-
-		if (mode->vdisplay == tv_mode->vdisplay)
+		if (tv_mode->tv_mode == mode)
 			return tv_mode;
 	}
 
 	return NULL;
 }
 
-static void sun4i_tv_mode_to_drm_mode(const struct tv_mode *tv_mode,
-				      struct drm_display_mode *mode)
-{
-	DRM_DEBUG_DRIVER("Creating mode %s\n", mode->name);
-
-	mode->type = DRM_MODE_TYPE_DRIVER;
-	mode->clock = 13500;
-	mode->flags = DRM_MODE_FLAG_INTERLACE;
-
-	mode->hdisplay = tv_mode->hdisplay;
-	mode->hsync_start = mode->hdisplay + tv_mode->hfront_porch;
-	mode->hsync_end = mode->hsync_start + tv_mode->hsync_len;
-	mode->htotal = mode->hsync_end  + tv_mode->hback_porch;
-
-	mode->vdisplay = tv_mode->vdisplay;
-	mode->vsync_start = mode->vdisplay + tv_mode->vfront_porch;
-	mode->vsync_end = mode->vsync_start + tv_mode->vsync_len;
-	mode->vtotal = mode->vsync_end  + tv_mode->vback_porch;
-}
-
 static void sun4i_tv_disable(struct drm_encoder *encoder,
 			    struct drm_atomic_state *state)
 {
@@ -356,7 +283,11 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 	struct drm_crtc_state *crtc_state =
 		drm_atomic_get_new_crtc_state(state, encoder->crtc);
 	struct drm_display_mode *mode = &crtc_state->mode;
-	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
+	struct drm_connector *connector = &tv->connector;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	const struct tv_mode *tv_mode =
+		sun4i_tv_find_tv_by_mode(conn_state->tv.mode);
 
 	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
 
@@ -404,7 +335,7 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 	/* Set the lines setup */
 	regmap_write(tv->regs, SUN4I_TVE_LINE_REG,
 		     SUN4I_TVE_LINE_FIRST(22) |
-		     SUN4I_TVE_LINE_NUMBER(tv_mode->line_number));
+		     SUN4I_TVE_LINE_NUMBER(mode->vtotal));
 
 	regmap_write(tv->regs, SUN4I_TVE_LEVEL_REG,
 		     SUN4I_TVE_LEVEL_BLANK(tv_mode->video_levels->blank) |
@@ -467,35 +398,43 @@ static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
 {
-	int i;
+	struct drm_display_mode *mode;
 
-	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
-		struct drm_display_mode *mode;
-		const struct tv_mode *tv_mode = &tv_modes[i];
-
-		mode = drm_mode_create(connector->dev);
-		if (!mode) {
-			DRM_ERROR("Failed to create a new display mode\n");
-			return 0;
-		}
+	mode = drm_mode_analog_ntsc_480i(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
+	}
 
-		strcpy(mode->name, tv_mode->name);
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
 
-		sun4i_tv_mode_to_drm_mode(tv_mode, mode);
-		drm_mode_probed_add(connector, mode);
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
 	}
 
-	return i;
+	drm_mode_probed_add(connector, mode);
+
+	return 2;
 }
 
 static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_funcs = {
+	.atomic_check	= drm_atomic_helper_connector_tv_check,
 	.get_modes	= sun4i_tv_comp_get_modes,
 };
 
+static void sun4i_tv_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	drm_atomic_helper_connector_tv_reset(connector);
+}
+
 static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
+	.reset			= sun4i_tv_connector_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -587,8 +526,20 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&tv->connector, &tv->encoder);
 
+	ret = drm_mode_create_tv_properties(drm,
+					    BIT(DRM_MODE_TV_MODE_NTSC) |
+					    BIT(DRM_MODE_TV_MODE_PAL));
+	if (ret)
+		goto err_cleanup_connector;
+
+	drm_object_attach_property(&tv->connector.base,
+				   drm->mode_config.tv_mode_property,
+				   DRM_MODE_TV_MODE_NTSC);
+
 	return 0;
 
+err_cleanup_connector:
+	drm_connector_cleanup(&tv->connector);
 err_cleanup_encoder:
 	drm_encoder_cleanup(&tv->encoder);
 err_disable_clk:

-- 
b4 0.11.0-dev-7da52
