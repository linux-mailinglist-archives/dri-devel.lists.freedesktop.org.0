Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E48628024
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E626710E2E8;
	Mon, 14 Nov 2022 13:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2F510E2B6;
 Mon, 14 Nov 2022 13:01:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id DDB89580242;
 Mon, 14 Nov 2022 08:01:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430884; x=
 1668438084; bh=8wrnSplflNxoDXeWFZCqnTOFgcIawLwQW9QWmB/dHdE=; b=T
 ohxiR1CPwfG+h7j9dZzn5/Ca08d9pLDREKm5OzyAe2BO0ZT5Jna/8mMO6HVRuKNU
 5/O0P36rVNVdp+YV+WAh0GzzObhs1ZeLPKvD+hcPBh0f5Oze/KXhLFMxr3GyN8wV
 8yhNUX+7fGvBxmmb+YJ1lBgQU2NDtnQ+EpmfI553me8eRrEHeEoMgteyZNKUgDJ6
 Mfssi0N1S116Subwbwq/3ZrmU+RM/w8w/sScKa8omGFc02rRwRZlz8cFVJn60tO4
 3DGzbx2k6wYFoxkQ7nmjL8MVWDqcLXPBhc+eStI2qvfq6Mc8VK8X0jEKt/hfCJ7O
 Ma8Hij5+7x1ckwM7bBs+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430884; x=
 1668438084; bh=8wrnSplflNxoDXeWFZCqnTOFgcIawLwQW9QWmB/dHdE=; b=k
 7+tKff9Gw5qpQ1B+5ArBaBdIHDsgWDrG7QeN1NHTmbDDVXAHGU7ZuBXUF5m314IU
 tm5060hqST285Z7Z49alyRi9gdkN6f7cLDd+5BFOTgQaw4mtzpFNHdqXQ+KT3YgH
 45nDmL24ALm6T4Pm9NnXSUAXd/4RGL4q+jDr6YOqCPx9fn5JDIzm8W2sjFEPV4zZ
 B81Aw/tmfHPy1TJEuGXMkqPiUaZXngLLWOle4QK9VhTO+gaXdDiRHx1SPUXmCHtb
 ioNeA5apGISOZ29Apozbp9bZ29jvUnENNh0rgD6iFj+yFZErjnARDC6yDSr269Pd
 D+NGeFiQxkQy58YEsmcgg==
X-ME-Sender: <xms:IzxyY8wANauBaNphVugLTeRkFOj0_UxbNeSSDfJBCV-IySCBrrAKOQ>
 <xme:IzxyYwS7TnDvSdw3DR3ODoanEEf2rmiImtS1X96_O8g_04t_WG3NW8Aw2e5_qil8x
 2YK-qcZBMAj9pFHsqQ>
X-ME-Received: <xmr:IzxyY-WQm2SSg4PcJjiHlTdwXtBNRnl_WxYYrlZiC48y4HKsa3NaG02AKKYEgjVnZNvuA6_iN_S3iIfBxDxgV8pYdRxC0Bfy6v3yBNhiTDLMLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JDxyY6jbaQgdAkWXtrD3QPMUN8TLeO4VosXvAdoGEZ9NGSERBNpOsQ>
 <xmx:JDxyY-A6jxvYtZog6Q2aAIQJzCjsgpldstAjy99JByKZNgDfaXmuxQ>
 <xmx:JDxyY7LtR3I8hlcTYK1730T5NH5KQ9p_YUFNVe2A6Vpv1x1U39zxvQ>
 <xmx:JDxyY3uDyEOGqV_v6OAr1kXe88KCHSGEgW5Z42Xb7tqh751bO-59TQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:42 +0100
Subject: [PATCH v9 23/25] drm/vc4: vec: Convert to the new TV mode property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-23-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=9940; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8dwEnMAR6eSuVmdxx4UCplriWsdk527kJh8yu44yejo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m80vh5pDBD8JC7OPefOdoE7KSevzX4mM7FAs/Ni0sqe
 +563OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR1QRGhseCrtEZIps5V0Yunnhj+x
 7Z4GcvSl26nvJNXHdQfsmqrcYMv9n6DmYVTd7cla+wdLPKXr/gORXHJ4f9S/AIOKL5RT6ahR8A
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
