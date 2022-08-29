Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8505A4D82
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899D10F1EF;
	Mon, 29 Aug 2022 13:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382C610F259
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 12B562B0607E;
 Mon, 29 Aug 2022 09:15:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778934; x=
 1661786134; bh=d74tP5iKS7wtiPkK9wp1T9Mx2zT0b5CzIXUZcq4F8kI=; b=h
 hmqCHmZ05R8wz+RuLpvYze/OuKbUQBZI6ODYaQ2icBRLaWjy9ut20laMImXzxxZ4
 gR8SbG8q9Wnl34FzAYNXpuEZq8XTJBFFDwdTfd+PJRzyfSjtIZZoYyTRBbsgST0u
 WGSM1qYclKIyaI0JV5GhFcgEnxJ/wWcQQhstysIk5bTZeCndv3a11DpSU6zg3mfF
 vLYMXK7f/o34Qf8ZnlfBHkZPKqxplN1J1X6KJDlpEZberhgnRFjqrZ2nfp+vvIjG
 x2xauzJqL4TZSk+zIPKzkUCvqDY+0cf7FmQHqkbTM4B0lFmtUEHRipFEYABLEk/N
 tSpBeOCVzRNhCt8xV7jfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778934; x=
 1661786134; bh=d74tP5iKS7wtiPkK9wp1T9Mx2zT0b5CzIXUZcq4F8kI=; b=m
 iM7JFVLOyjTjTvHinPsieIVJaGVBDCJy42PVT9KM+0KUBAkqAazD5tBHJOYXx6jq
 QhPYYSrffDJ1FhpJvJs5u4AOlB03mPNM4YKnGREKhG1qFmSalR78a8aM0YtDcs/c
 Bg/oqPDjwfS9UBGT8lUQBtTaktQS4yEtfmXLwUlLwo2sGm6kECR3Gny9Pev5vokX
 bo/cM1C6qg1rOciX6Ef9whhvkRpJoaIYZkj2uELz9lpXV7KvBr6Igea8MOz46lOB
 BRj7aaDc11RmsqSytkSauWpLQRbkS6KEUBlol/yJuaqYS9mL9ZQP2Z+oqQraCIGa
 1gL9ol+cLeNKaH/iPQfYw==
X-ME-Sender: <xms:9bsMY8DLxmtp_42mde9u9rbN82flXIzChr1NPPRdQghJTMVvKP-nyg>
 <xme:9bsMY-hcqRvB6FKdoVN9hOC2jVnjEuf1KD1ckuyL91uU3CzVj_lY9eURK3rJJQVsy
 pfkBrVCz_3e7uE9OC4>
X-ME-Received: <xmr:9bsMY_lW1b0QxD506iSxtc_wdRAqU6VdJ7BnZijOJEnmTJhWfR-FuhB5kXNf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9bsMYywqaeB7pjA7eH1_iA9Rz73T6PP44iQ-YVKxOm78nJSxNlN5rA>
 <xmx:9bsMYxRBfk3VNuKh2_iWxQH2f66iSDiF2-xFKvjkBnBY4hqdR2QdzQ>
 <xmx:9bsMY9ZJkES3OG-Foczuiy-8-lD1J3r1_Hk99-3TnWVILEySq1n9Sg>
 <xmx:9rsMY9K8c7Yp3qVne7X4c8etFVVzRtqBZYzyMWfoHdkzjqiYK_PgvjGkMdY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:15:32 -0400 (EDT)
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
Subject: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
Date: Mon, 29 Aug 2022 15:11:46 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=9147; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lcNmN9CzcnK3ui/H7KmOX4lEfytOWT0LrcJRB2J9u68=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxTCUu9d4nvW1XSQx+qrpzdD6v0fTlN3fph7xXrHTucb
 X2bldZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAie2Yw/E9k+ZLc/SlU+PSVj51eXu
 ZNlkrHOQwVA9+d4XiZcGHJgVhGhr//uV81tiXNFDscaOMbuHL1hMg+a/5n178/X+9rK1YwhxUA
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

Now that the core can deal fine with analog TV modes, let's convert the vc4=
=0D
VEC driver to leverage those new features.=0D
=0D
We've added some backward compatibility to support the old TV mode property=
=0D
and translate it into the new TV norm property.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index ba6f81908923..58286acf4b9e 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -172,6 +172,8 @@ struct vc4_vec {=0D
 =0D
 	struct clk *clock;=0D
 =0D
+	struct drm_property *legacy_tv_mode_property;=0D
+=0D
 	struct debugfs_regset32 regset;=0D
 };=0D
 =0D
@@ -184,6 +186,12 @@ encoder_to_vc4_vec(struct drm_encoder *encoder)=0D
 	return container_of(encoder, struct vc4_vec, encoder.base);=0D
 }=0D
 =0D
+static inline struct vc4_vec *=0D
+connector_to_vc4_vec(struct drm_connector *connector)=0D
+{=0D
+	return container_of(connector, struct vc4_vec, connector);=0D
+}=0D
+=0D
 enum vc4_vec_tv_mode_id {=0D
 	VC4_VEC_TV_MODE_NTSC,=0D
 	VC4_VEC_TV_MODE_NTSC_J,=0D
@@ -192,7 +200,7 @@ enum vc4_vec_tv_mode_id {=0D
 };=0D
 =0D
 struct vc4_vec_tv_mode {=0D
-	const struct drm_display_mode *mode;=0D
+	unsigned int mode;=0D
 	u32 config0;=0D
 	u32 config1;=0D
 	u32 custom_freq;=0D
@@ -226,28 +234,50 @@ static const struct debugfs_reg32 vec_regs[] =3D {=0D
 };=0D
 =0D
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {=0D
-	[VC4_VEC_TV_MODE_NTSC] =3D {=0D
-		.mode =3D &drm_mode_480i,=0D
+	{=0D
+		.mode =3D DRM_MODE_TV_MODE_NTSC_M,=0D
 		.config0 =3D VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,=0D
 		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
-	[VC4_VEC_TV_MODE_NTSC_J] =3D {=0D
-		.mode =3D &drm_mode_480i,=0D
+	{=0D
+		.mode =3D DRM_MODE_TV_MODE_NTSC_J,=0D
 		.config0 =3D VEC_CONFIG0_NTSC_STD,=0D
 		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
-	[VC4_VEC_TV_MODE_PAL] =3D {=0D
-		.mode =3D &drm_mode_576i,=0D
+	{=0D
+		.mode =3D DRM_MODE_TV_MODE_PAL_B,=0D
 		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,=0D
 		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
-	[VC4_VEC_TV_MODE_PAL_M] =3D {=0D
-		.mode =3D &drm_mode_480i,=0D
+	{=0D
+		.mode =3D DRM_MODE_TV_MODE_PAL_M,=0D
 		.config0 =3D VEC_CONFIG0_PAL_M_STD,=0D
 		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 };=0D
 =0D
+static inline const struct vc4_vec_tv_mode *=0D
+vc4_vec_tv_mode_lookup(unsigned int mode)=0D
+{=0D
+	unsigned int i;=0D
+=0D
+	for (i =3D 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {=0D
+		const struct vc4_vec_tv_mode *tv_mode =3D &vc4_vec_tv_modes[i];=0D
+=0D
+		if (tv_mode->mode =3D=3D mode)=0D
+			return tv_mode;=0D
+	}=0D
+=0D
+	return NULL;=0D
+}=0D
+=0D
+static const struct drm_prop_enum_list tv_mode_names[] =3D {=0D
+	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },=0D
+	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },=0D
+	{ VC4_VEC_TV_MODE_PAL, "PAL", },=0D
+	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },=0D
+};=0D
+=0D
 static enum drm_connector_status=0D
 vc4_vec_connector_detect(struct drm_connector *connector, bool force)=0D
 {=0D
@@ -262,19 +292,98 @@ static void vc4_vec_connector_reset(struct drm_connec=
tor *connector)=0D
 =0D
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)=0D
 {=0D
-	struct drm_connector_state *state =3D connector->state;=0D
 	struct drm_display_mode *mode;=0D
+	int count =3D 0;=0D
 =0D
-	mode =3D drm_mode_duplicate(connector->dev,=0D
-				  vc4_vec_tv_modes[state->tv.mode].mode);=0D
+	mode =3D drm_mode_analog_ntsc_480i(connector->dev);=0D
 	if (!mode) {=0D
 		DRM_ERROR("Failed to create a new display mode\n");=0D
 		return -ENOMEM;=0D
 	}=0D
 =0D
 	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
 =0D
-	return 1;=0D
+	mode =3D drm_mode_analog_pal_576i(connector->dev);=0D
+	if (!mode) {=0D
+		DRM_ERROR("Failed to create a new display mode\n");=0D
+		return -ENOMEM;=0D
+	}=0D
+=0D
+	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
+=0D
+	return count;=0D
+}=0D
+=0D
+static int=0D
+vc4_vec_connector_set_property(struct drm_connector *connector,=0D
+			       struct drm_connector_state *state,=0D
+			       struct drm_property *property,=0D
+			       uint64_t val)=0D
+{=0D
+	struct vc4_vec *vec =3D connector_to_vc4_vec(connector);=0D
+=0D
+	if (property !=3D vec->legacy_tv_mode_property)=0D
+		return -EINVAL;=0D
+=0D
+	switch (val) {=0D
+	case VC4_VEC_TV_MODE_NTSC:=0D
+		state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_M;=0D
+		break;=0D
+=0D
+	case VC4_VEC_TV_MODE_NTSC_J:=0D
+		state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_J;=0D
+		break;=0D
+=0D
+	case VC4_VEC_TV_MODE_PAL:=0D
+		state->tv.mode =3D DRM_MODE_TV_MODE_PAL_B;=0D
+		break;=0D
+=0D
+	case VC4_VEC_TV_MODE_PAL_M:=0D
+		state->tv.mode =3D DRM_MODE_TV_MODE_PAL_M;=0D
+		break;=0D
+=0D
+	default:=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+static int=0D
+vc4_vec_connector_get_property(struct drm_connector *connector,=0D
+			       const struct drm_connector_state *state,=0D
+			       struct drm_property *property,=0D
+			       uint64_t *val)=0D
+{=0D
+	struct vc4_vec *vec =3D connector_to_vc4_vec(connector);=0D
+=0D
+	if (property !=3D vec->legacy_tv_mode_property)=0D
+		return -EINVAL;=0D
+=0D
+	switch (state->tv.mode) {=0D
+	case DRM_MODE_TV_MODE_NTSC_J:=0D
+		*val =3D VC4_VEC_TV_MODE_NTSC_J;=0D
+		break;=0D
+=0D
+	case DRM_MODE_TV_MODE_NTSC_M:=0D
+		*val =3D VC4_VEC_TV_MODE_NTSC;=0D
+		break;=0D
+=0D
+	case DRM_MODE_TV_MODE_PAL_B:=0D
+		*val =3D VC4_VEC_TV_MODE_PAL;=0D
+		break;=0D
+=0D
+	case DRM_MODE_TV_MODE_PAL_M:=0D
+		*val =3D VC4_VEC_TV_MODE_PAL_M;=0D
+		break;=0D
+=0D
+	default:=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	return 0;=0D
 }=0D
 =0D
 static const struct drm_connector_funcs vc4_vec_connector_funcs =3D {=0D
@@ -283,15 +392,19 @@ static const struct drm_connector_funcs vc4_vec_conne=
ctor_funcs =3D {=0D
 	.reset =3D vc4_vec_connector_reset,=0D
 	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,=
=0D
 	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=0D
+	.atomic_get_property =3D vc4_vec_connector_get_property,=0D
+	.atomic_set_property =3D vc4_vec_connector_set_property,=0D
 };=0D
 =0D
 static const struct drm_connector_helper_funcs vc4_vec_connector_helper_fu=
ncs =3D {=0D
+	.atomic_check =3D drm_atomic_helper_connector_tv_check,=0D
 	.get_modes =3D vc4_vec_connector_get_modes,=0D
 };=0D
 =0D
 static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *=
vec)=0D
 {=0D
 	struct drm_connector *connector =3D &vec->connector;=0D
+	struct drm_property *prop;=0D
 	int ret;=0D
 =0D
 	connector->interlace_allowed =3D true;=0D
@@ -304,8 +417,16 @@ static int vc4_vec_connector_init(struct drm_device *d=
ev, struct vc4_vec *vec)=0D
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);=0D
 =0D
 	drm_object_attach_property(&connector->base,=0D
-				   dev->mode_config.legacy_tv_mode_property,=0D
-				   VC4_VEC_TV_MODE_NTSC);=0D
+				   dev->mode_config.tv_mode_property,=0D
+				   DRM_MODE_TV_MODE_NTSC_M);=0D
+=0D
+	prop =3D drm_property_create_enum(dev, 0, "mode",=0D
+					tv_mode_names, ARRAY_SIZE(tv_mode_names));=0D
+	if (!prop)=0D
+		return -ENOMEM;=0D
+	vec->legacy_tv_mode_property =3D prop;=0D
+=0D
+	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);=
=0D
 =0D
 	drm_connector_attach_encoder(connector, &vec->encoder.base);=0D
 =0D
@@ -352,13 +473,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder=
 *encoder,=0D
 	struct drm_connector *connector =3D &vec->connector;=0D
 	struct drm_connector_state *conn_state =3D=0D
 		drm_atomic_get_new_connector_state(state, connector);=0D
-	const struct vc4_vec_tv_mode *tv_mode =3D=0D
-		&vc4_vec_tv_modes[conn_state->tv.mode];=0D
+	const struct vc4_vec_tv_mode *tv_mode;=0D
 	int idx, ret;=0D
 =0D
 	if (!drm_dev_enter(drm, &idx))=0D
 		return;=0D
 =0D
+	tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode);=0D
+	if (!tv_mode)=0D
+		goto err_dev_exit;=0D
+=0D
 	ret =3D pm_runtime_get_sync(&vec->pdev->dev);=0D
 	if (ret < 0) {=0D
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);=0D
@@ -435,23 +559,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder =
*encoder,=0D
 	drm_dev_exit(idx);=0D
 }=0D
 =0D
-static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,=0D
-					struct drm_crtc_state *crtc_state,=0D
-					struct drm_connector_state *conn_state)=0D
-{=0D
-	const struct vc4_vec_tv_mode *vec_mode;=0D
-=0D
-	vec_mode =3D &vc4_vec_tv_modes[conn_state->tv.mode];=0D
-=0D
-	if (conn_state->crtc &&=0D
-	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))=0D
-		return -EINVAL;=0D
-=0D
-	return 0;=0D
-}=0D
-=0D
 static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs =
=3D {=0D
-	.atomic_check =3D vc4_vec_encoder_atomic_check,=0D
 	.atomic_disable =3D vc4_vec_encoder_disable,=0D
 	.atomic_enable =3D vc4_vec_encoder_enable,=0D
 };=0D
@@ -492,13 +600,6 @@ static const struct of_device_id vc4_vec_dt_match[] =
=3D {=0D
 	{ /* sentinel */ },=0D
 };=0D
 =0D
-static const char * const tv_mode_names[] =3D {=0D
-	[VC4_VEC_TV_MODE_NTSC] =3D "NTSC",=0D
-	[VC4_VEC_TV_MODE_NTSC_J] =3D "NTSC-J",=0D
-	[VC4_VEC_TV_MODE_PAL] =3D "PAL",=0D
-	[VC4_VEC_TV_MODE_PAL_M] =3D "PAL-M",=0D
-};=0D
-=0D
 static int vc4_vec_bind(struct device *dev, struct device *master, void *d=
ata)=0D
 {=0D
 	struct platform_device *pdev =3D to_platform_device(dev);=0D
@@ -506,9 +607,11 @@ static int vc4_vec_bind(struct device *dev, struct dev=
ice *master, void *data)=0D
 	struct vc4_vec *vec;=0D
 	int ret;=0D
 =0D
-	ret =3D drm_mode_create_tv_properties_legacy(drm,=0D
-						   ARRAY_SIZE(tv_mode_names),=0D
-						   tv_mode_names);=0D
+	ret =3D drm_mode_create_tv_properties(drm,=0D
+					    BIT(DRM_MODE_TV_MODE_NTSC_J) |=0D
+					    BIT(DRM_MODE_TV_MODE_NTSC_M) |=0D
+					    BIT(DRM_MODE_TV_MODE_PAL_B) |=0D
+					    BIT(DRM_MODE_TV_MODE_PAL_M));=0D
 	if (ret)=0D
 		return ret;=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
