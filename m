Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E205E658F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED3510EBCD;
	Thu, 22 Sep 2022 14:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9810EBB7;
 Thu, 22 Sep 2022 14:29:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 047472B05B44;
 Thu, 22 Sep 2022 10:29:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856958; x=
 1663864158; bh=CiolBBEbAgAOB0yuauLxIchGO7qhcQ+kNL6bxBM12tk=; b=I
 V3YmQQxGIcXLhz8ltASLrTI76UklmK4w42jJPp+MBmlJFvZXQELAQRsQhgvBoCJa
 V5IImTrNMqRslWOPDPBwYBq6qZHENXw/sXqcDF4fgUrKcPqt8VKixwQE5TnG0pB4
 MSQfq9rCWJLxGvthBJsMDZPG5urVoL+LKTZ5EBh1KBATww53uGzIQEX/TPTwEKs1
 ObAIn90XCN0AiNrmyZX/mShjffgUwI9faUesUHQWVxs+uut0y1zER2/Uy0u/VGAh
 /SQX9h7glpZ6YwfnEZZBUA7hFzSXi+l1YEMk0VVqN5IRJ8IPmM+0T3ScZ93moI/r
 1SxMsTfeaOX04+PytMerg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856958; x=
 1663864158; bh=CiolBBEbAgAOB0yuauLxIchGO7qhcQ+kNL6bxBM12tk=; b=j
 FtDkz7O7FatJnnVkc/UOfWjsza4O4N0x+7M3vWU4i3c/BOAvTBDsfzwesJpdBid+
 L2wC8XrfFzF9g2Mh+NGUhF3p75xNuJAV35g4cHFVeMKVzMfDR7G73GhHhQlfF+n7
 eDqAOUJZg388n9Z7tbqZV91rMAWUziQtS1mZJAj0FimETcgnfNXZDsnq3HazBQZx
 t4eaEvfnhTSWymiSaQ3ZEhr3GJ2c4Gg4zCaxsI2VCNiZXzxfazBzRNd3DJAdeycd
 bmVJtP5uOzD1POSVjjkJh+Xi2hXu9YOlVOH5aycR/MKSJ+S07XICi4oXqBj9i0qo
 VdCsmT1FWRqW+BbKVRInA==
X-ME-Sender: <xms:PnEsY_LvHc0b0JNLId786_G3AVbm8iYZ4Cs9O8IyRi_kXj8jlyAmRA>
 <xme:PnEsYzKyYJIhAImRpYX-0ufAKm7gx7QUNj3oP8OPAYww9GngLWXkX7L8F28I2Not5
 UCn4-QjZo6SsCW4BkA>
X-ME-Received: <xmr:PnEsY3sjvcwTBcu3WzbSe8pNQ1Zj2wLqyfLN6EzWiiHSZSD-X3lUi60ejk4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PnEsY4YJsL7igkZ5xTbrSTIVWdx6dv1_LFr5VT2P1JQjkf3XWE2R7Q>
 <xmx:PnEsY2Y2TpFG8--pQVw5To_W4MumnjgKfvJNAIG1VteHrw3oNbEnew>
 <xmx:PnEsY8BpGz6CDoQaxGz6HDwulMhFD0F_2mFOU6BvRtJP5kCwZSOjhg>
 <xmx:PnEsY3EcGewOs-X1VKCb-2c53ANQs2OPzCgh9-ObA-XavIA1Of1a-tfSNks>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:29:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:48 +0200
Subject: [PATCH v2 31/33] drm/vc4: vec: Convert to the new TV mode property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-31-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9407; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=njHT+B8aOMhNdBC4NTIx/Zg2IqYDJ2icfYnoChX93p0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYHqIYv9km7sq5RgZZRhKD25znz+tt2pdd3n274XlGjl
 XLnbUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInIbGH4X7TGJ/y6Aru5NcejFcyH5K
 7sP7f73sOQma5ffER/lJ+zLGBkWBzZwa27c+dMt09XivebfXLYo3Ff8MXkW67vppivX6X5mhkA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the core can deal fine with analog TV modes, let's convert the vc4
VEC driver to leverage those new features.

We've added some backward compatibility to support the old TV mode property
and translate it into the new TV norm property.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 6828b79a1001..a9463364015b 100644
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
@@ -276,19 +292,99 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
 
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_connector_state *state = connector->state;
 	struct drm_display_mode *mode;
+	int count = 0;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
+	mode = drm_mode_analog_ntsc_480i(connector->dev);
 	if (!mode) {
 		DRM_ERROR("Failed to create a new display mode\n");
 		return -ENOMEM;
 	}
 
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
+	count += 1;
 
-	return 1;
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create a new display mode\n");
+		return -ENOMEM;
+	}
+
+	drm_mode_probed_add(connector, mode);
+	count += 1;
+
+	return count;
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
@@ -297,15 +393,19 @@ static const struct drm_connector_funcs vc4_vec_connector_funcs = {
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
@@ -318,8 +418,16 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
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
 
@@ -366,13 +474,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	const struct vc4_vec_tv_mode *tv_mode =
-		&vc4_vec_tv_modes[conn_state->tv.mode];
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
@@ -454,13 +565,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
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
@@ -554,13 +658,6 @@ static const struct of_device_id vc4_vec_dt_match[] = {
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
@@ -568,9 +665,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
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
b4 0.10.0
