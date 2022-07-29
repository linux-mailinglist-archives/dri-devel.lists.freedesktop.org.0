Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36A5853C3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6712F10E106;
	Fri, 29 Jul 2022 16:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494B10E649
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9FF5C580983;
 Fri, 29 Jul 2022 12:36:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112610; x=
 1659119810; bh=dD15BsyaW+QYuCRJy0566Klym6N86DYmjmb7CUM9paU=; b=K
 nhzlrBxfUUd1K/1TuWkR96avuQ1TLBjYHqrTJVh9vruWcIdT8DFIXwHA3O+Otkgt
 pf9FCPitdrSn37+AFLC41/f8Is+aBkYG49dJSq+5SkBAFkpzydY0LsgFahyX9aUc
 g7Avyv/lD3TkQlP0Pr6UIa3ltFonSjjyktdwUwT7i9DFnR/jbZQ+JzUhW3BbL9YA
 0KSba565BU+hgL4TNxPnAvTRxxm6wIDpKWKek0eTE76DIEsHQr2QPb81YMVlFcSP
 ictHWUsMXA4fwaxlayPUM3GDaVuMy9arQsvS2AtniAa+tObdmjZVPuB9t196c1wc
 DXu8fZmfQcBNp3vintMLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112610; x=
 1659119810; bh=dD15BsyaW+QYuCRJy0566Klym6N86DYmjmb7CUM9paU=; b=H
 kbBuOhvcwuN5+39NeHRO+OUxvf0oqmIxyg9HgXF6caUY/HbrVYX5dYsFhNurhTtc
 3cNAkDU9Yilq8E6WEQpD2vB/T+cMH5SGbFExDP/hX+uNZ0p3fBqS1erAkaqbZCcM
 SJNgd/X1C+7pwvWByiVc/4+md24eheKr/mhAG1NqD0VA5Fw9AyhNxKvXZLB+upDr
 Y57tm8LHX26ZdRB2YqlSdKoUcCluUqSfVkA7sm9wp4OMY29amrcuFBB7Lr5t+nvS
 zbLnhnbA3OQJH+8iuU4goFfmg56J/OkjE32GB2KadOMa2lvEbUCyYHESsc5qHTDd
 pRLudDzNPL8nlKfjCgFJg==
X-ME-Sender: <xms:ogzkYkLDy3wsH1-ySvidzx-E43RflRlH5Ka1vKz7bN9sksCss5ejdA>
 <xme:ogzkYkKL_bgRTLtsf4Rb7FvSVo7TrUwmpEzJeJr7guXlhVr5tJsP9R7pmRtM7twWp
 2pgVWGxJ4YdNaWztTk>
X-ME-Received: <xmr:ogzkYkvvSSM-f663q9gvHU0lOc8DNJsSAbt36eJDXI1BIuKQmSBXQFk2C-GJxJpykmxz0wHvDkM_3UfULGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ogzkYhaxf1vrdsYWBJ3uqszCwoX0AEzz7pHlFGyVZ5VP-mIjEnvr2A>
 <xmx:ogzkYrbuAz8OVVYOGml3oKIgIvT2NJP9pJgfPA9v27ffsng-7KxRuA>
 <xmx:ogzkYtDD0sH6x2R0qjXMMuAfK0ZYiKofGsL_FcbPhjohGj1tkIPrdA>
 <xmx:ogzkYvJSSY32R20ab7N4LpqwVEsbo9PPH8R8jOgOHix5hZNKIWQJxQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 23/35] drm/vc4: vec: Convert to the new TV mode property
Date: Fri, 29 Jul 2022 18:35:06 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-23-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=9047; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5OWHqL1TWqDdRNr5zwS2Im5z29Ujg+Vg5EAQgi/glLg=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFqFPgmoObB4/Co1Hz9h6DHW6bZba2fV7deuOiFS/mU
 S6z8HaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAExEypyRYV3Qw5fy2iyf62WdzRb5Kl
 4Ke2ze5TLvcpj1n8C7ZxP8ljIyHPVUTrNc4pfV6/xxe4qAQlfZ6qpkQ/0Xx/QTlA9V3G4VAQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the core can deal fine with analog TV modes, let's convert the vc4
VEC driver to leverage those new features.

We've added some backward compatibility to support the old TV mode property
and translate it into the new TV norm property.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 6f4536bf537f..e40b55de1b3c 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -172,6 +172,8 @@ struct vc4_vec {
 
 	struct clk *clock;
 
+	struct drm_property *tv_mode_property;
+
 	struct debugfs_regset32 regset;
 };
 
@@ -184,6 +186,12 @@ encoder_to_vc4_vec(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_vec, encoder.base);
 }
 
+static inline struct vc4_vec *
+connector_to_vc4_vec(struct drm_connector *connector)
+{
+	return container_of(connector, struct vc4_vec, connector);
+}
+
 enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC,
 	VC4_VEC_TV_MODE_NTSC_J,
@@ -192,7 +200,7 @@ enum vc4_vec_tv_mode_id {
 };
 
 struct vc4_vec_tv_mode {
-	const struct drm_display_mode *mode;
+	unsigned int mode;
 	u32 config0;
 	u32 config1;
 	u32 custom_freq;
@@ -226,28 +234,50 @@ static const struct debugfs_reg32 vec_regs[] = {
 };
 
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
-	[VC4_VEC_TV_MODE_NTSC] = {
-		.mode = &drm_mode_480i,
+	{
+		.mode = DRM_MODE_TV_NORM_NTSC_M,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_NTSC_J] = {
-		.mode = &drm_mode_480i,
+	{
+		.mode = DRM_MODE_TV_NORM_NTSC_J,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_PAL] = {
-		.mode = &drm_mode_576i,
+	{
+		.mode = DRM_MODE_TV_NORM_PAL_B,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &drm_mode_480i,
+	{
+		.mode = DRM_MODE_TV_NORM_PAL_M,
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 };
 
+static inline const struct vc4_vec_tv_mode *
+vc4_vec_tv_mode_lookup(unsigned int mode)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
+		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
+
+		if (tv_mode->mode == mode)
+			return tv_mode;
+	}
+
+	return NULL;
+}
+
+static const struct drm_prop_enum_list tv_mode_names[] = {
+	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
+	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
+	{ VC4_VEC_TV_MODE_PAL, "PAL", },
+	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
+};
+
 static enum drm_connector_status
 vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -262,11 +292,17 @@ void vc4_vec_connector_reset(struct drm_connector *connector)
 
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_connector_state *state = connector->state;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  vc4_vec_tv_modes[state->tv.mode].mode);
+	mode = drm_mode_duplicate(connector->dev, &drm_mode_480i);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
+	}
+
+	drm_mode_probed_add(connector, mode);
+
+	mode = drm_mode_duplicate(connector->dev, &drm_mode_576i);
 	if (!mode) {
 		DRM_ERROR("Failed to create a new display mode\n");
 		return -ENOMEM;
@@ -277,21 +313,95 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 	return 1;
 }
 
+static int
+vc4_vec_connector_set_property(struct drm_connector *connector,
+			       struct drm_connector_state *state,
+			       struct drm_property *property,
+			       uint64_t val)
+{
+	struct vc4_vec *vec = connector_to_vc4_vec(connector);
+
+	if (property != vec->tv_mode_property)
+		return -EINVAL;
+
+	switch (val) {
+	case VC4_VEC_TV_MODE_NTSC:
+		state->tv.norm = DRM_MODE_TV_NORM_NTSC_M;
+		break;
+
+	case VC4_VEC_TV_MODE_NTSC_J:
+		state->tv.norm = DRM_MODE_TV_NORM_NTSC_J;
+		break;
+
+	case VC4_VEC_TV_MODE_PAL:
+		state->tv.norm = DRM_MODE_TV_NORM_PAL_B;
+		break;
+
+	case VC4_VEC_TV_MODE_PAL_M:
+		state->tv.norm = DRM_MODE_TV_NORM_PAL_M;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+vc4_vec_connector_get_property(struct drm_connector *connector,
+			       const struct drm_connector_state *state,
+			       struct drm_property *property,
+			       uint64_t *val)
+{
+	struct vc4_vec *vec = connector_to_vc4_vec(connector);
+
+	if (property != vec->tv_mode_property)
+		return -EINVAL;
+
+	switch (state->tv.norm) {
+	case DRM_MODE_TV_NORM_NTSC_J:
+		*val = VC4_VEC_TV_MODE_NTSC_J;
+		break;
+
+	case DRM_MODE_TV_NORM_NTSC_M:
+		*val = VC4_VEC_TV_MODE_NTSC;
+		break;
+
+	case DRM_MODE_TV_NORM_PAL_B:
+		*val = VC4_VEC_TV_MODE_PAL;
+		break;
+
+	case DRM_MODE_TV_NORM_PAL_M:
+		*val = VC4_VEC_TV_MODE_PAL_M;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_vec_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_get_property = vc4_vec_connector_get_property,
+	.atomic_set_property = vc4_vec_connector_set_property,
 };
 
 static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_tv_check,
 	.get_modes = vc4_vec_connector_get_modes,
 };
 
 static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 {
 	struct drm_connector *connector = &vec->connector;
+	struct drm_property *prop;
 	int ret;
 
 	connector->interlace_allowed = true;
@@ -304,8 +414,16 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
-				   dev->mode_config.tv_mode_property,
-				   VC4_VEC_TV_MODE_NTSC);
+				   dev->mode_config.tv_norm_property,
+				   DRM_MODE_TV_NORM_NTSC_M);
+
+	prop = drm_property_create_enum(dev, 0, "mode",
+					tv_mode_names, ARRAY_SIZE(tv_mode_names));
+	if (!prop)
+		return -ENOMEM;
+	vec->tv_mode_property = prop;
+
+	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
 
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
@@ -352,13 +470,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	const struct vc4_vec_tv_mode *tv_mode =
-		&vc4_vec_tv_modes[conn_state->tv.mode];
+	const struct vc4_vec_tv_mode *tv_mode;
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.norm);
+	if (!tv_mode)
+		goto err_dev_exit;
+
 	ret = pm_runtime_get_sync(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
@@ -435,23 +556,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	drm_dev_exit(idx);
 }
 
-static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
-{
-	const struct vc4_vec_tv_mode *vec_mode;
-
-	vec_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
-
-	if (conn_state->crtc &&
-	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
-		return -EINVAL;
-
-	return 0;
-}
-
 static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
-	.atomic_check = vc4_vec_encoder_atomic_check,
 	.atomic_disable = vc4_vec_encoder_disable,
 	.atomic_enable = vc4_vec_encoder_enable,
 };
@@ -492,13 +597,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
 	{ /* sentinel */ },
 };
 
-static const char * const tv_mode_names[] = {
-	[VC4_VEC_TV_MODE_NTSC] = "NTSC",
-	[VC4_VEC_TV_MODE_NTSC_J] = "NTSC-J",
-	[VC4_VEC_TV_MODE_PAL] = "PAL",
-	[VC4_VEC_TV_MODE_PAL_M] = "PAL-M",
-};
-
 static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -507,9 +605,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ret = drm_mode_create_tv_properties(drm,
-					    0,
-					    ARRAY_SIZE(tv_mode_names),
-					    tv_mode_names);
+					    DRM_MODE_TV_NORM_NTSC_J |
+					    DRM_MODE_TV_NORM_NTSC_M |
+					    DRM_MODE_TV_NORM_PAL_B |
+					    DRM_MODE_TV_NORM_PAL_M,
+					    0, NULL);
 	if (ret)
 		return ret;
 

-- 
b4 0.10.0-dev-49460
