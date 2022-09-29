Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA85EFAE4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632B10EB25;
	Thu, 29 Sep 2022 16:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7D10EAFF;
 Thu, 29 Sep 2022 16:32:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 32A6F5807D7;
 Thu, 29 Sep 2022 12:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469140; x=
 1664476340; bh=V5aJvg3eaSs8kd+jtkXPTaDxvw4OTF9zgvoC6sFlzuM=; b=p
 HXZn3kKsdYrm0OJfTSSQ6mTHM4aUnPGN7+xlL9l0P1e53nkwJVvPNksRf7mGo/0Q
 EI/gF1x/V9VvHT2WY7XUrv38AkEeo0fgoHiMZrPfqDqm2nFAlIVMigzN2khCv6g8
 ggvPtSv+WjOsRclpFwqju5suwR/ZxNX3EGrmVgVrSbH4nXRrmR+xVkNt1cClVJpw
 GdMz+/rGCBLtZOa/Qz5E0226rzEIwo4LK6XJfR+zC7Uf/XYx6mR+NcHfRjIa8k74
 1CUWptYuAkhVIjsCss1bmpN5IGYn168yXQ9YkC+VG2onXmJds37vqBMDj5wWFmiA
 1gf57K3u/vZib2frUc93A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469140; x=
 1664476340; bh=V5aJvg3eaSs8kd+jtkXPTaDxvw4OTF9zgvoC6sFlzuM=; b=b
 yU6pZooYZMFbKJELeKLNkC2JbLj5qYsQja0UTMH3f3tjJRnjhuRGj1bZLQTA2Yky
 sfYxgB8uaI39A6LCCbw8X3IlUuATJyzjQ6RLiEFZr8l5b0AA0p2bGZvT0N997ejo
 f8WokVJ3JGqk1zRG/2qNElDiWSe+o1FcDNQZsA0RhyFKLIRuGMGY84WORgGhQHdT
 7C5Y2Kj+mqqKya1EzZkg8kXoLMeNqVDJ5Wn0/zvrwbeUH03it4Jt9xe4s9/aKTn7
 23JT9OqfkkHQHOCkhEjvjzeri/scFazGW0P4RUNPcLMIQGJPBosEddQcs8vebjK9
 2h7gYhUw6CqNhuc6m88cQ==
X-ME-Sender: <xms:k8g1Y9fbXJ0NAuBCh1mTDhtd1uxr0gHIrAEiMlCEb3frc-DgdeRK2Q>
 <xme:k8g1Y7PgNtJW1dEiOjYSEZv7AFn83I0zYan0GHKMobTVSkKF7Pt3mNtAOBdc8DFhe
 HKMBZOhznYg34JCgkI>
X-ME-Received: <xmr:k8g1Y2jWoiUzHbnNMsXg0hOKDNKx7nAgSh89LXPt8usFjfEoXPyO0bqDFg0Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k8g1Y28mum-kPR9nS4-fiIgj_aDwtNho_vh5RJqe4Z8YQRkaTTk18w>
 <xmx:k8g1Y5vbYb1CVAeW_vs56HyqNfhx1OsSb-jSpG-cSsXvAKvZDsiwIQ>
 <xmx:k8g1Y1FfwuuknslgWO_dJER1pg5IaMjMEa94OB8Gnl8fmkhKhwCeug>
 <xmx:lMg1Y64Tfvsu4uAQRQtmZpdxoIXlTYCV9In6KFQVBhrlbTuLXo5ILw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:24 +0200
Subject: [PATCH v4 30/30] drm/sun4i: tv: Convert to the new TV mode property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-30-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=8751; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=G2lGxOB8/vt1E9rm4M5ktG51JT1tnrk8aiu66U9rcZk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzzuOYTxma9rfi19ZGt54KF51Ykv730qit//+OPrLRbr
 freZdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiV64wMpxYF1SfvP4+X2rXWr/a6v
 NvnjNf8eHu8t7JEZQcN4X18DSGv1KlMVkRqyXXT9panuAi5J6mq+nuejpTa47xZQsnzze8zAA=
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 148 ++++++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_vec.c    |   5 +-
 2 files changed, 54 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index c65f0a89b6b0..1a8f5b986a95 100644
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
@@ -467,35 +398,46 @@ static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
 {
-	int i;
+	struct drm_display_mode *mode;
+	int count = 0;
 
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
+	count += 1;
 
-		sun4i_tv_mode_to_drm_mode(tv_mode, mode);
-		drm_mode_probed_add(connector, mode);
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
 	}
 
-	return i;
+	drm_mode_probed_add(connector, mode);
+	count += 1;
+
+	return count;
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
@@ -587,8 +529,20 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
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
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 8d37d7ba9b2a..88b4330bfa39 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -322,7 +322,7 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
 	return NULL;
 }
 
-static const struct drm_prop_enum_list tv_mode_names[] = {
+static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
 	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
 	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
 	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
@@ -498,7 +498,8 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 				   DRM_MODE_TV_MODE_NTSC);
 
 	prop = drm_property_create_enum(dev, 0, "mode",
-					tv_mode_names, ARRAY_SIZE(tv_mode_names));
+					legacy_tv_mode_names,
+					ARRAY_SIZE(legacy_tv_mode_names));
 	if (!prop)
 		return -ENOMEM;
 	vec->legacy_tv_mode_property = prop;

-- 
b4 0.11.0-dev-7da52
