Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202E624107
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279F10E721;
	Thu, 10 Nov 2022 11:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6610E6FF;
 Thu, 10 Nov 2022 11:08:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id EEFF658045F;
 Thu, 10 Nov 2022 06:08:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 10 Nov 2022 06:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078485; x=
 1668085685; bh=s0oohZSryHTvS6AqnbyD508bkpJln3+0v4TZJ9DnLl4=; b=X
 4WAHVK0sz8jX1dGMN8z4RgXpubcZnH4NhP8/0pbwjMEWvtdlUEeiNu3nE+Kk1KwQ
 HVsMkQRrmEPdo4Z4QUpfQCnXR5pht8CZuectlTuOQlFFPpd6dBQ/OaeXERw7pHNY
 XwBPa9ucAFu4bENAM0bss+fWDzmNaWZPcESS0pOLQM2I0gKRCpjfrnI258wT6Mbg
 a6leNhbG23tSRMkwXPovdbmRnnWc2KH4/pREOz+sF25mdh9KffnSFqpWD9xcgnTc
 KIF4F2HcBNzB11nDjeCOlLvzA7YELWkIMPG993UycM4QMtQTiYjNLcDPrntrxDW2
 RT7H6j0wHHtvOHQw2KTZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078485; x=
 1668085685; bh=s0oohZSryHTvS6AqnbyD508bkpJln3+0v4TZJ9DnLl4=; b=i
 /C3Ra84wMdg/7dzHq0zOVm/CYvTxA/cgbMPTHrbqJZU/+p11pstB+tOdaDG8KG4i
 jj8IzwQlLE1NEpVdjt6oPMaxQ1W/n9X1Abpa5X3IGYZRpj4iyCp2P6q74wh5vE2P
 wM4o1iD0wgdOZVGo5wQydriNHlKiilhDnyLXix52SP29wSXh0w0HU0zLQ19o7qZ1
 51EDW7TgwK1McDg9V/SPNqijBDqaKnpch0KODtmAy5yPGLs1zHHa+aonM6rCVXKM
 BSlVeyKYULLYqoMADUddbunrOx1WF0IAtNZd7dUmf2DdqKZRe+SSxTUmUPYrrT0S
 g9HyGnkcFehGZR61OcfGQ==
X-ME-Sender: <xms:ldtsY20xC4nRiy1ScmA8elcq5PzKSY9Sglk7-sdfDi0HkkR53Dksng>
 <xme:ldtsY5EVnsZguxrnBXIk_NzFYPLxRj5w1YXh0mQ_YVdKUDiNbEQc7Tp4bu1cXHMd1
 IaSdEVmrlkwE91QU5E>
X-ME-Received: <xmr:ldtsY-7Muy8_nx7gpdJw1dDk72FCaYHlu7LfHftPwW9aIxrTWBbjA3TN2GcXQG0XbuSjjIrjtjvD-mtAJG5oIUo063B7jI3VJB4Fobkz2JaSjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ldtsY32BX6HH4-zWeKwjQMgdmnn_HMTxsSNO-iEFYveFGTfhLmcjow>
 <xmx:ldtsY5E0gIV1SY9KVcF3QbvfggzOi7t1K44ZafgGvQqiNmCQSCVWLw>
 <xmx:ldtsYw9EY7t9SoW9fWuS8lEpnU7hEOtilCfS8Q13LQ7ayzZgO6ftXQ>
 <xmx:ldtsY5SXlqTgySpyZoHgNOiiChyes20femJyuS90Kb7iTVqpVzTJwg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:08:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:36 +0100
Subject: [PATCH v8 24/24] drm/sun4i: tv: Convert to the new TV mode property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-24-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=7620; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=hsNs2n7C7f9hehl8S1tfoiQIMRx0LRBYDZVow6+rmgA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1MZPfxZVhU7MIuslClesKBGtPsQY8OLQ1Vbvf5bupZ9
 +cbQUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkwb2Nk+N7/UCJo2XTmSRcidb+HdB
 y2z+9suncySWzjCfWPjn/llBgZOlMvlm17n2zQyRzSMPdRs5lEca1rAVvZkoPTVhsGNO1lAAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the core can deal fine with analog TV modes, let's convert the
sun4i TV driver to leverage those new features.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Convert to new get_modes helper

Changes in v5:
- Removed the count variable in get_modes
- Removed spurious vc4 change
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 141 ++++++++++-----------------------------
 1 file changed, 34 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index c65f0a89b6b0..9625a00a48ba 100644
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
@@ -465,37 +396,21 @@ static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.atomic_enable	= sun4i_tv_enable,
 };
 
-static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
-		struct drm_display_mode *mode;
-		const struct tv_mode *tv_mode = &tv_modes[i];
-
-		mode = drm_mode_create(connector->dev);
-		if (!mode) {
-			DRM_ERROR("Failed to create a new display mode\n");
-			return 0;
-		}
-
-		strcpy(mode->name, tv_mode->name);
-
-		sun4i_tv_mode_to_drm_mode(tv_mode, mode);
-		drm_mode_probed_add(connector, mode);
-	}
-
-	return i;
-}
-
 static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_funcs = {
-	.get_modes	= sun4i_tv_comp_get_modes,
+	.atomic_check	= drm_atomic_helper_connector_tv_check,
+	.get_modes	= drm_connector_helper_tv_get_modes,
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
@@ -587,8 +502,20 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
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
b4 0.11.0-dev-99e3a
