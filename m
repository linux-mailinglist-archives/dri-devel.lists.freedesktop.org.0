Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C255EFADC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDF910EB1F;
	Thu, 29 Sep 2022 16:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0D710EB04;
 Thu, 29 Sep 2022 16:32:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EAC3D580800;
 Thu, 29 Sep 2022 12:32:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469135; x=
 1664476335; bh=Lc/WiMecB7Y6+18IuJwjUn613PR2He/uZXmLrSkCXP8=; b=U
 4KZu0piVI3pOQeaTNl+m7JyJ8DouvxDqUHQyahl6cC+E0K9zuqqUCfUZ8n2W3Xz+
 tNVHd5V0NqDJxtK5tei/UZBMVCwOHmW0RpvZmEwOyF9LvPD/XXMX1zeZOID76Naa
 1zVzODNxaYqeTT4Y26Pn5YwK0q1S1wVbxBJYt6YQ2a2O3f2lm+c/ZhK5UOmN9vy2
 +04DrEGUXYYPcp3MeNLrSKO9UYzJYKFgIQUm5uUfJERK6Je5MQleKOM1BHrFOkJw
 tW0RoHjCAl3xIQRTCfcx43iOkYwvL70rsRlYaY1BQF0plipYIOnpuf5HSE/ejwiq
 t1FwvimSoYorPzgjNGWAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469135; x=
 1664476335; bh=Lc/WiMecB7Y6+18IuJwjUn613PR2He/uZXmLrSkCXP8=; b=D
 0radm+bQHzZ3ksAhuBVHkilMFocsF71j9YTmjC+VTM1Brk+PHB73LdU2oHx87i7i
 BpxPtijW7yvXli29EY+iZbGPLSHndttpeTROsfyWSs2g61TohUAh4BmrtdhgTDJY
 xURwQr3RpqLZSozbj+syNCFUL6xReTrVdb2+RnWH2SmzcIdzDUjJrHhJhEH5iDGk
 OKMiIxcvZrKXcTgmClQ/q9nbKA8p0n7DbVJfDtredHav8EHeCFzIV+o4/QpgVMLK
 oFwvtfwTG7IwmypXunVfo8L7h61uznDGWBXSVMfVFFszdv1w985GWuYWXjQoZmCc
 rzxX4mtNkHBw9nfFAVf6g==
X-ME-Sender: <xms:j8g1Y92BuA8ASmBhs0I66ldOgtZjEE8I7-gH30sHgoAdL5HfN7vcrg>
 <xme:j8g1Y0H17Rv0XZ5pHDie5AIPE1XrRqOICJHBaQzsN_lU63CBtEjCI7-qf5k8ghGKM
 cFcd8WbNqKYXhILbpY>
X-ME-Received: <xmr:j8g1Y94q9hsnzYNs8ek5wGZgM9VtFbag1yLKN3tQuu3SwXOFiAABqOgRxtpz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j8g1Y60g31_0QhlezerDTKKASuLVRyB07pVTIXRkKFs6E6jpWGAdqg>
 <xmx:j8g1YwEcHKv4JqtVYpj1do4DnCorandLpvTZyhjl31oGGC-iQlImPw>
 <xmx:j8g1Y79u80vfauDRr-pxbub25wCvUEBQ-sx3WefoMGMWc1sgz2MyBQ>
 <xmx:j8g1Y4Qc7ABzKrShma7Z9P0YiqpGVW4RbuqsZ9TUB4AIEsGEo-p7kg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:22 +0200
Subject: [PATCH v4 28/30] drm/vc4: vec: Convert to the new TV mode property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-28-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9758; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pTtH69hF7e0xH47zISpM/zvB8kBD9PsqteUsffrcLMU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzysTFNe/IsP/qjIr3KsgLn49wvVS4dmP9st8OqNzk6l
 6CLbjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExEP4bhn+Evm7Dbu2ycT4t7qpxOFv
 2+5cOnGDv1aXVnvoe/Nu4UW8XwP3vd1c8O9g83XHmtuMTHNXLhMeHqqBl/bjg59v2/dLF4HjMA
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

Now that the core can deal fine with analog TV modes, let's convert the vc4
VEC driver to leverage those new features.

We've added some backward compatibility to support the old TV mode property
and translate it into the new TV norm property. We're also making use of
the new analog TV atomic_check helper to make sure we trigger a modeset
whenever the TV mode is updated.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Removed the count variable in .get_modes
---
 drivers/gpu/drm/vc4/vc4_vec.c | 192 +++++++++++++++++++++++++++++++-----------
 1 file changed, 144 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 1fcb7baf874e..b342dc9cf69c 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -172,6 +172,8 @@ struct vc4_vec {
 
 	struct clk *clock;
 
+	struct drm_property *legacy_tv_mode_property;
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
@@ -225,43 +233,51 @@ static const struct debugfs_reg32 vec_regs[] = {
 	VC4_REG32(VEC_DAC_MISC),
 };
 
-static const struct drm_display_mode ntsc_mode = {
-	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
-		 480, 480 + 7, 480 + 7 + 6, 525, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
-static const struct drm_display_mode pal_mode = {
-	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
-		 576, 576 + 4, 576 + 4 + 6, 625, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
-	[VC4_VEC_TV_MODE_NTSC] = {
-		.mode = &ntsc_mode,
+	{
+		.mode = DRM_MODE_TV_MODE_NTSC,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_NTSC_J] = {
-		.mode = &ntsc_mode,
+	{
+		.mode = DRM_MODE_TV_MODE_NTSC_J,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_PAL] = {
-		.mode = &pal_mode,
+	{
+		.mode = DRM_MODE_TV_MODE_PAL,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
-	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &ntsc_mode,
+	{
+		.mode = DRM_MODE_TV_MODE_PAL_M,
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
@@ -276,19 +292,96 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
 
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_connector_state *state = connector->state;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
+	mode = drm_mode_analog_ntsc_480i(connector->dev);
 	if (!mode) {
 		DRM_ERROR("Failed to create a new display mode\n");
 		return -ENOMEM;
 	}
 
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	return 1;
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
+	}
+
+	drm_mode_probed_add(connector, mode);
+
+	return 2;
+}
+
+static int
+vc4_vec_connector_set_property(struct drm_connector *connector,
+			       struct drm_connector_state *state,
+			       struct drm_property *property,
+			       uint64_t val)
+{
+	struct vc4_vec *vec = connector_to_vc4_vec(connector);
+
+	if (property != vec->legacy_tv_mode_property)
+		return -EINVAL;
+
+	switch (val) {
+	case VC4_VEC_TV_MODE_NTSC:
+		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
+		break;
+
+	case VC4_VEC_TV_MODE_NTSC_J:
+		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
+		break;
+
+	case VC4_VEC_TV_MODE_PAL:
+		state->tv.mode = DRM_MODE_TV_MODE_PAL;
+		break;
+
+	case VC4_VEC_TV_MODE_PAL_M:
+		state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
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
+	if (property != vec->legacy_tv_mode_property)
+		return -EINVAL;
+
+	switch (state->tv.mode) {
+	case DRM_MODE_TV_MODE_NTSC:
+		*val = VC4_VEC_TV_MODE_NTSC;
+		break;
+
+	case DRM_MODE_TV_MODE_NTSC_J:
+		*val = VC4_VEC_TV_MODE_NTSC_J;
+		break;
+
+	case DRM_MODE_TV_MODE_PAL:
+		*val = VC4_VEC_TV_MODE_PAL;
+		break;
+
+	case DRM_MODE_TV_MODE_PAL_M:
+		*val = VC4_VEC_TV_MODE_PAL_M;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
@@ -297,15 +390,19 @@ static const struct drm_connector_funcs vc4_vec_connector_funcs = {
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
@@ -318,8 +415,16 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
-				   dev->mode_config.legacy_tv_mode_property,
-				   VC4_VEC_TV_MODE_NTSC);
+				   dev->mode_config.tv_mode_property,
+				   DRM_MODE_TV_MODE_NTSC);
+
+	prop = drm_property_create_enum(dev, 0, "mode",
+					tv_mode_names, ARRAY_SIZE(tv_mode_names));
+	if (!prop)
+		return -ENOMEM;
+	vec->legacy_tv_mode_property = prop;
+
+	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
 
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
@@ -366,13 +471,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	const struct vc4_vec_tv_mode *tv_mode =
-		&vc4_vec_tv_modes[conn_state->tv.legacy_mode];
+	const struct vc4_vec_tv_mode *tv_mode;
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+	if (!tv_mode)
+		goto err_dev_exit;
+
 	ret = pm_runtime_get_sync(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
@@ -454,13 +562,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_connector_state *conn_state)
 {
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	const struct vc4_vec_tv_mode *vec_mode;
-
-	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
-
-	if (conn_state->crtc &&
-	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
-		return -EINVAL;
 
 	if (mode->crtc_hdisplay % 4)
 		return -EINVAL;
@@ -554,13 +655,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
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
@@ -568,9 +662,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_vec *vec;
 	int ret;
 
-	ret = drm_mode_create_tv_properties_legacy(drm,
-						   ARRAY_SIZE(tv_mode_names),
-						   tv_mode_names);
+	ret = drm_mode_create_tv_properties(drm,
+					    BIT(DRM_MODE_TV_MODE_NTSC) |
+					    BIT(DRM_MODE_TV_MODE_NTSC_J) |
+					    BIT(DRM_MODE_TV_MODE_PAL) |
+					    BIT(DRM_MODE_TV_MODE_PAL_M));
 	if (ret)
 		return ret;
 

-- 
b4 0.11.0-dev-7da52
