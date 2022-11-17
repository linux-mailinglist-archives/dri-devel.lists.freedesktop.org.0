Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139BB62D707
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2210E5D8;
	Thu, 17 Nov 2022 09:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCA910E5C4;
 Thu, 17 Nov 2022 09:30:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 2464C2B069CB;
 Thu, 17 Nov 2022 04:30:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 04:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677410; x=
 1668684610; bh=8wrnSplflNxoDXeWFZCqnTOFgcIawLwQW9QWmB/dHdE=; b=T
 ju3aYVTe/s68UUvFoQgFUHYpB5V/k7glT1FEliUN7/Wi/FQ1vQ1pHCQYwwcMvCeE
 X+pfRKdcVKzATkiNeryg1Z34u35LxqFq9WIU++yZImE/y4k4vKGMjb0NPW49ouyM
 WshbbTfnZGd2C18NvGLuuR7NjKOy6HzaKDn7XBGt/obv07q0+9MVXYlXc13IWQLi
 SJxQtmtvxy5gPY/Le6qRIEZxOmhxJx3aVHEghP8R3bQjMTW046nK+d4LUw4f5BMp
 NkFqPYf47GuIdgnF6KpP73K1fCmLFYs54GGTUlwehJB11QMn3qAa1/KQClTnkv7G
 AzHdvC48TjL4zBsZhVjQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677410; x=
 1668684610; bh=8wrnSplflNxoDXeWFZCqnTOFgcIawLwQW9QWmB/dHdE=; b=h
 bD90GJjuqdONdc32XAvrvULnL9VHzeqzVhYFKltznTj5IlZOHIM0BlPeTvC1/lKP
 YeGOY7YtiFA8LoUViyjnk3JNIXRMgnzUJ5+hqzrIl4IzVvzeZCrJKTksWVXC8tYW
 pQCHKWwqqbAA1uNAUF8/5ZT3MfQAYtTUwi94tdg0u/WUX0CDM5sdRoHPrttl+bA3
 oBrUE1iEnBSXJ1ydJxyjf3GAZB5J3pEDsIyoIFFToDghOEOoLlX+b6gbC2eMHjln
 VsT/KOGfFJwaFU0hFdREVyyX4JCE00sj5kNcT+7OC+UY95e+H/4gZDWKt+2sUFie
 EhrwAqeT5HjiIwbnfNg4Q==
X-ME-Sender: <xms:Iv91Y4RMwP3vmELTDSdn79PSCTeUfJcxX2DPnW35bQVLI4xbaPg1Ag>
 <xme:Iv91Y1xIRRmMYgJcXU2w9Sp6fCPyUPakquba7bspk8MWBqlX5K0-D-tJgjjscvb1C
 RHVS3dVHNvIObOlmJc>
X-ME-Received: <xmr:Iv91Y13PsnV9kAKyxmBg2asu_aMAxW2VE1pkI-mC4NiNsLt_g6B55dVEA_zxpbjGilw6XGeBmonMU-4LXMiSTbNT6mKhlRel5lfwDexP8uB9_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Iv91Y8BED9iAKfoFVvXz1oA2tDGDXrjWzfFOGmsOUj9Yc12eVBOxmg>
 <xmx:Iv91YxiKiNPhvshF_F6Tw_CBwErKFAH8BvEYC7HWkDER2l9xDLS7Kg>
 <xmx:Iv91Y4r4OlwiRuB46ANxFXgpLfkRiGAq5U5OHGyHUMZutmPAWSo1IA>
 <xmx:Iv91Y3ONKPh6_I3nfosYlDFu2puTqpL4QCufcGARCOoCXT0pKa3yncqQ1oE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:30:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:29:00 +0100
Subject: [PATCH v10 17/19] drm/vc4: vec: Convert to the new TV mode property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-17-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=9940; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8dwEnMAR6eSuVmdxx4UCplriWsdk527kJh8yu44yejo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y7GzYz+Ny+4c87q+PAm2+IF6xdvqT7GurDkxyb5BVve
 SJov7yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBE/kxgZJj14YWzEov4ja2T3722Yj
 7z+r0+g958++OXU9Nv3bht+PMPI8NW8ZYlInd7GtMCJvbaKpybfPmgHPu3X6tLH90tOeNk84sNAA==
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
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Lookup the tv mode in atomic_check to make sure it's supported

Changes in v6:
- Use new get_modes helper

Changes in v5:
- Renamed tv_mode_names into legacy_tv_mode_names

Changes in v4:
- Removed the count variable in .get_modes
---
 drivers/gpu/drm/vc4/vc4_vec.c | 186 ++++++++++++++++++++++++++++++------------
 1 file changed, 132 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index bfa8a58dba30..a828fc6fb776 100644
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
+static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
+	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
+	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
+	{ VC4_VEC_TV_MODE_PAL, "PAL", },
+	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
+};
+
 static enum drm_connector_status
 vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -274,21 +290,74 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
 	drm_atomic_helper_connector_tv_reset(connector);
 }
 
-static int vc4_vec_connector_get_modes(struct drm_connector *connector)
+static int
+vc4_vec_connector_set_property(struct drm_connector *connector,
+			       struct drm_connector_state *state,
+			       struct drm_property *property,
+			       uint64_t val)
 {
-	struct drm_connector_state *state = connector->state;
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev,
-				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
-	if (!mode) {
-		DRM_ERROR("Failed to create a new display mode\n");
-		return -ENOMEM;
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
 	}
 
-	drm_mode_probed_add(connector, mode);
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
 
-	return 1;
+	return 0;
 }
 
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
@@ -297,15 +366,19 @@ static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.reset = vc4_vec_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_get_property = vc4_vec_connector_get_property,
+	.atomic_set_property = vc4_vec_connector_set_property,
 };
 
 static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs = {
-	.get_modes = vc4_vec_connector_get_modes,
+	.atomic_check = drm_atomic_helper_connector_tv_check,
+	.get_modes = drm_connector_helper_tv_get_modes,
 };
 
 static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 {
 	struct drm_connector *connector = &vec->connector;
+	struct drm_property *prop;
 	int ret;
 
 	connector->interlace_allowed = true;
@@ -318,8 +391,17 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
-				   dev->mode_config.legacy_tv_mode_property,
-				   VC4_VEC_TV_MODE_NTSC);
+				   dev->mode_config.tv_mode_property,
+				   DRM_MODE_TV_MODE_NTSC);
+
+	prop = drm_property_create_enum(dev, 0, "mode",
+					legacy_tv_mode_names,
+					ARRAY_SIZE(legacy_tv_mode_names));
+	if (!prop)
+		return -ENOMEM;
+	vec->legacy_tv_mode_property = prop;
+
+	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
 
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
@@ -366,13 +448,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
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
@@ -454,12 +539,10 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_connector_state *conn_state)
 {
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	const struct vc4_vec_tv_mode *vec_mode;
+	const struct vc4_vec_tv_mode *tv_mode;
 
-	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
-
-	if (conn_state->crtc &&
-	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode, mode->htotal);
+	if (!tv_mode)
 		return -EINVAL;
 
 	if (mode->crtc_hdisplay % 4)
@@ -556,13 +639,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
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
@@ -570,9 +646,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
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
b4 0.11.0-dev-99e3a
