Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE35A4D64
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479D310F1AF;
	Mon, 29 Aug 2022 13:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A99A10F1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:16:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 41E262B06090;
 Mon, 29 Aug 2022 09:16:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778991; x=
 1661786191; bh=tVvgEA3a0r+6vtlMZVtwbeURRb1tj232wXwVtdz5EAA=; b=Y
 DYhrpZLyx6Cu7gyUw5RfgeBtn+vgeUVVHKm7O+6muotDy5gnRm+B3QouFqtRYjem
 pqINcrgzNuK+BiS9pvhc1OvRWL/z8iFgFebQkRYpHMhoKWikOLVSilCdIKiUCKTD
 YsnVD1SsWLTZ3ETC+WWMt0CsjJCGFFg99n8sF2cw8TlTw0f57Mg3ENC0Sh2meIiT
 X12JkCahvWQeU/dIoBwGmrbAiwjJDetDY+iwbBYPrc+fZXMRp/oZ/xc7ICqbukZm
 eAYzjLHMy9rEW6cGyNfzEWz/kTD8sRG0jWGhqygeqttaVqOhtrT1wnxfEEmRqf7O
 LUQBAXbqcDJZ6dWHIKdzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778991; x=
 1661786191; bh=tVvgEA3a0r+6vtlMZVtwbeURRb1tj232wXwVtdz5EAA=; b=Y
 JCz984246F6DBA+LiY4JypkuMjvR08r2x1tvinmXECHpK4O1G6Yh5NXpvW9hYWGB
 RmpB9oX+Cif2uyV/xgbtw/Uu90iU+vn8YhCN53UCFbs4hbWyP5I3PcieYJYMlAst
 TRoZK1k5slZEAlY2xZtExNiqz57kCadMXYzscSRkmp4x48BXAOrZd/6/TkeeZHXt
 fcR51daVHwEcUbvr/BOULLD810yUGnJg0f5vYz3R3gRXOkOy9jt9ksCCp0eF99Hr
 Z4HkR6yx35yGsktrPmumsKUwMutD3mgyqJVyyVqDfVTgsGfHlcsmCFSoy3oGlRUz
 OsRpCth5gieuFSL9+9Uug==
X-ME-Sender: <xms:L7wMY1XE3wOmW6eHXUeTbaS5c9-OXGbjr2WSFNmOP4pusafGdA9ENA>
 <xme:L7wMY1kS_axmUSMcCvYME3UHKiGqRGirjWxti5h0r-5UpBlBfOKwn-bNOKsVZXETR
 hZ_sLVwzIYJ-Ieznhc>
X-ME-Received: <xmr:L7wMYxYeqRWWav-yYNjR6G40piwyNpo-ahpPRffENmO-xhIYSk1YVMy5W7oi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L7wMY4X_ND_SKX8Sl3SvVeBB0b6zkYtXuGhPecaFR3nRBX-BFFy9-g>
 <xmx:L7wMY_kNAqg_IaSNl3fXV1vpqHIGP7rkfg5uAm4cP8EkTib9fA6pIA>
 <xmx:L7wMY1dF4LHiQXDmFCIviRNhUEYYquvCp6IHk1L6UUQrw2FYHHi4EA>
 <xmx:L7wMYzsXqdcsqcjaBlKI75riVBVu6fgcfII4dmdxgdmlyiJWe3j0oCM8sTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:16:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 41/41] drm/sun4i: tv: Convert to the new TV mode property
Date: Mon, 29 Aug 2022 15:11:55 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-41-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=7619; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=d9NyAFsgWE8A2NZjwZ98RGHmubqiSFwy9+VurUoUxG0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxQf7bWudXhyo1pYmyFXTLjggZ9+a376X+cky225yTWK
 TswdpSwMYlwMsmKKLDHC5kviTs163cnGNw9mDisTyBAGLk4BmAjXNEaGT+UujTzbSh+db4gQ7FcRu1
 zH8+QNR3fYlQeXK/w564szGBmW5G1qV7G3Ydz78+1+xjV//P2bDDMsBHZq7p37Rldklw4XAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the core can deal fine with analog TV modes, let's convert the=0D
sun4i TV driver to leverage those new features.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index 74ff5ad6a8b9..10c0d727d700 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -140,23 +140,14 @@ struct resync_parameters {=0D
 struct tv_mode {=0D
 	char		*name;=0D
 =0D
+	unsigned int	tv_mode;=0D
+=0D
 	u32		mode;=0D
 	u32		chroma_freq;=0D
 	u16		back_porch;=0D
 	u16		front_porch;=0D
-	u16		line_number;=0D
 	u16		vblank_level;=0D
 =0D
-	u32		hdisplay;=0D
-	u16		hfront_porch;=0D
-	u16		hsync_len;=0D
-	u16		hback_porch;=0D
-=0D
-	u32		vdisplay;=0D
-	u16		vfront_porch;=0D
-	u16		vsync_len;=0D
-	u16		vback_porch;=0D
-=0D
 	bool		yc_en;=0D
 	bool		dac3_en;=0D
 	bool		dac_bit25_en;=0D
@@ -212,7 +203,7 @@ static const struct resync_parameters pal_resync_parame=
ters =3D {=0D
 =0D
 static const struct tv_mode tv_modes[] =3D {=0D
 	{=0D
-		.name		=3D "NTSC",=0D
+		.tv_mode	=3D DRM_MODE_TV_MODE_NTSC_M,=0D
 		.mode		=3D SUN4I_TVE_CFG0_RES_480i,=0D
 		.chroma_freq	=3D 0x21f07c1f,=0D
 		.yc_en		=3D true,=0D
@@ -221,17 +212,6 @@ static const struct tv_mode tv_modes[] =3D {=0D
 =0D
 		.back_porch	=3D 118,=0D
 		.front_porch	=3D 32,=0D
-		.line_number	=3D 525,=0D
-=0D
-		.hdisplay	=3D 720,=0D
-		.hfront_porch	=3D 18,=0D
-		.hsync_len	=3D 2,=0D
-		.hback_porch	=3D 118,=0D
-=0D
-		.vdisplay	=3D 480,=0D
-		.vfront_porch	=3D 26,=0D
-		.vsync_len	=3D 2,=0D
-		.vback_porch	=3D 17,=0D
 =0D
 		.vblank_level	=3D 240,=0D
 =0D
@@ -241,23 +221,12 @@ static const struct tv_mode tv_modes[] =3D {=0D
 		.resync_params	=3D &ntsc_resync_parameters,=0D
 	},=0D
 	{=0D
-		.name		=3D "PAL",=0D
+		.tv_mode	=3D DRM_MODE_TV_MODE_PAL_B,=0D
 		.mode		=3D SUN4I_TVE_CFG0_RES_576i,=0D
 		.chroma_freq	=3D 0x2a098acb,=0D
 =0D
 		.back_porch	=3D 138,=0D
 		.front_porch	=3D 24,=0D
-		.line_number	=3D 625,=0D
-=0D
-		.hdisplay	=3D 720,=0D
-		.hfront_porch	=3D 3,=0D
-		.hsync_len	=3D 2,=0D
-		.hback_porch	=3D 139,=0D
-=0D
-		.vdisplay	=3D 576,=0D
-		.vfront_porch	=3D 28,=0D
-		.vsync_len	=3D 2,=0D
-		.vback_porch	=3D 19,=0D
 =0D
 		.vblank_level	=3D 252,=0D
 =0D
@@ -275,63 +244,21 @@ drm_encoder_to_sun4i_tv(struct drm_encoder *encoder)=
=0D
 			    encoder);=0D
 }=0D
 =0D
-/*=0D
- * FIXME: If only the drm_display_mode private field was usable, this=0D
- * could go away...=0D
- *=0D
- * So far, it doesn't seem to be preserved when the mode is passed by=0D
- * to mode_set for some reason.=0D
- */=0D
-static const struct tv_mode *sun4i_tv_find_tv_by_mode(const struct drm_dis=
play_mode *mode)=0D
+static const struct tv_mode *=0D
+sun4i_tv_find_tv_by_mode(unsigned int mode)=0D
 {=0D
 	int i;=0D
 =0D
-	/* First try to identify the mode by name */=0D
 	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {=0D
 		const struct tv_mode *tv_mode =3D &tv_modes[i];=0D
 =0D
-		DRM_DEBUG_DRIVER("Comparing mode %s vs %s",=0D
-				 mode->name, tv_mode->name);=0D
-=0D
-		if (!strcmp(mode->name, tv_mode->name))=0D
-			return tv_mode;=0D
-	}=0D
-=0D
-	/* Then by number of lines */=0D
-	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {=0D
-		const struct tv_mode *tv_mode =3D &tv_modes[i];=0D
-=0D
-		DRM_DEBUG_DRIVER("Comparing mode %s vs %s (X: %d vs %d)",=0D
-				 mode->name, tv_mode->name,=0D
-				 mode->vdisplay, tv_mode->vdisplay);=0D
-=0D
-		if (mode->vdisplay =3D=3D tv_mode->vdisplay)=0D
+		if (tv_mode->tv_mode =3D=3D mode)=0D
 			return tv_mode;=0D
 	}=0D
 =0D
 	return NULL;=0D
 }=0D
 =0D
-static void sun4i_tv_mode_to_drm_mode(const struct tv_mode *tv_mode,=0D
-				      struct drm_display_mode *mode)=0D
-{=0D
-	DRM_DEBUG_DRIVER("Creating mode %s\n", mode->name);=0D
-=0D
-	mode->type =3D DRM_MODE_TYPE_DRIVER;=0D
-	mode->clock =3D 13500;=0D
-	mode->flags =3D DRM_MODE_FLAG_INTERLACE;=0D
-=0D
-	mode->hdisplay =3D tv_mode->hdisplay;=0D
-	mode->hsync_start =3D mode->hdisplay + tv_mode->hfront_porch;=0D
-	mode->hsync_end =3D mode->hsync_start + tv_mode->hsync_len;=0D
-	mode->htotal =3D mode->hsync_end  + tv_mode->hback_porch;=0D
-=0D
-	mode->vdisplay =3D tv_mode->vdisplay;=0D
-	mode->vsync_start =3D mode->vdisplay + tv_mode->vfront_porch;=0D
-	mode->vsync_end =3D mode->vsync_start + tv_mode->vsync_len;=0D
-	mode->vtotal =3D mode->vsync_end  + tv_mode->vback_porch;=0D
-}=0D
-=0D
 static void sun4i_tv_disable(struct drm_encoder *encoder,=0D
 			    struct drm_atomic_state *state)=0D
 {=0D
@@ -355,7 +282,11 @@ static void sun4i_tv_enable(struct drm_encoder *encode=
r,=0D
 	struct drm_crtc_state *crtc_state =3D=0D
 		drm_atomic_get_new_crtc_state(state, encoder->crtc);=0D
 	struct drm_display_mode *mode =3D &crtc_state->mode;=0D
-	const struct tv_mode *tv_mode =3D sun4i_tv_find_tv_by_mode(mode);=0D
+	struct drm_connector *connector =3D &tv->connector;=0D
+	struct drm_connector_state *conn_state =3D=0D
+		drm_atomic_get_new_connector_state(state, connector);=0D
+	const struct tv_mode *tv_mode =3D=0D
+		sun4i_tv_find_tv_by_mode(conn_state->tv.mode);=0D
 =0D
 	DRM_DEBUG_DRIVER("Enabling the TV Output\n");=0D
 =0D
@@ -403,7 +334,7 @@ static void sun4i_tv_enable(struct drm_encoder *encoder=
,=0D
 	/* Set the lines setup */=0D
 	regmap_write(tv->regs, SUN4I_TVE_LINE_REG,=0D
 		     SUN4I_TVE_LINE_FIRST(22) |=0D
-		     SUN4I_TVE_LINE_NUMBER(tv_mode->line_number));=0D
+		     SUN4I_TVE_LINE_NUMBER(mode->vtotal));=0D
 =0D
 	regmap_write(tv->regs, SUN4I_TVE_LEVEL_REG,=0D
 		     SUN4I_TVE_LEVEL_BLANK(tv_mode->video_levels->blank) |=0D
@@ -466,35 +397,45 @@ static const struct drm_encoder_helper_funcs sun4i_tv=
_helper_funcs =3D {=0D
 =0D
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)=0D
 {=0D
-	int i;=0D
+	struct drm_display_mode *mode;=0D
+	int count =3D 0;=0D
 =0D
-	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {=0D
-		struct drm_display_mode *mode;=0D
-		const struct tv_mode *tv_mode =3D &tv_modes[i];=0D
-=0D
-		mode =3D drm_mode_create(connector->dev);=0D
-		if (!mode) {=0D
-			DRM_ERROR("Failed to create a new display mode\n");=0D
-			return 0;=0D
-		}=0D
+	mode =3D drm_mode_analog_ntsc_480i(connector->dev);=0D
+	if (!mode) {=0D
+		DRM_ERROR("Failed to create a new display mode\n");=0D
+		return -ENOMEM;=0D
+	}=0D
 =0D
-		strcpy(mode->name, tv_mode->name);=0D
+	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
 =0D
-		sun4i_tv_mode_to_drm_mode(tv_mode, mode);=0D
-		drm_mode_probed_add(connector, mode);=0D
+	mode =3D drm_mode_analog_pal_576i(connector->dev);=0D
+	if (!mode) {=0D
+		DRM_ERROR("Failed to create a new display mode\n");=0D
+		return -ENOMEM;=0D
 	}=0D
 =0D
-	return i;=0D
+	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
+=0D
+	return count;=0D
 }=0D
 =0D
 static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_hel=
per_funcs =3D {=0D
+	.atomic_check	=3D drm_atomic_helper_connector_tv_check,=0D
 	.get_modes	=3D sun4i_tv_comp_get_modes,=0D
 };=0D
 =0D
+static void sun4i_tv_connector_reset(struct drm_connector *connector)=0D
+{=0D
+	drm_atomic_helper_connector_reset(connector);=0D
+	drm_atomic_helper_connector_tv_reset(connector);=0D
+}=0D
+=0D
 static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs =3D =
{=0D
 	.fill_modes		=3D drm_helper_probe_single_connector_modes,=0D
 	.destroy		=3D drm_connector_cleanup,=0D
-	.reset			=3D drm_atomic_helper_connector_reset,=0D
+	.reset			=3D sun4i_tv_connector_reset,=0D
 	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_state,=
=0D
 	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,=0D
 };=0D
@@ -586,8 +527,20 @@ static int sun4i_tv_bind(struct device *dev, struct de=
vice *master,=0D
 =0D
 	drm_connector_attach_encoder(&tv->connector, &tv->encoder);=0D
 =0D
+	ret =3D drm_mode_create_tv_properties(drm,=0D
+					    BIT(DRM_MODE_TV_MODE_NTSC_M) |=0D
+					    BIT(DRM_MODE_TV_MODE_PAL_B));=0D
+	if (ret)=0D
+		goto err_cleanup_connector;=0D
+=0D
+	drm_object_attach_property(&connector->base,=0D
+				   dev->mode_config.tv_mode_property,=0D
+				   DRM_MODE_TV_MODE_NTSC_M);=0D
+=0D
 	return 0;=0D
 =0D
+err_cleanup_connector:=0D
+	drm_connector_cleanup(&tv->connector);=0D
 err_cleanup_encoder:=0D
 	drm_encoder_cleanup(&tv->encoder);=0D
 err_disable_clk:=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
