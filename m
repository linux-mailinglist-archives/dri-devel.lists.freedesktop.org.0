Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C65A4D39
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB610F21D;
	Mon, 29 Aug 2022 13:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C231C10F1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9C5B52B05FC5;
 Mon, 29 Aug 2022 09:12:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778761; x=
 1661785961; bh=8CnDkZ8kqQ6q5hGMkFvBP77iUldYY5FJB+9fy2fc26U=; b=f
 tm9H3pcpBcqeDmWCYcUsHgOphPMD3kWww6Ak4b8U8sHf0a+bRA0sGanB4oN0k6Z6
 q1Zzlyq3nJ2xe5DdxUVSqNub0Hu+TeI7Qlun1vMEc/hzoK6Yd9GEy3yKsx60s9sD
 y89OogDs/+MQTnvPHnAmLfrK5Sk4R+PWvxUyAd7/Eru7/WNYLGMPdPxak1gFYYa5
 qacsG59yslX62BuHbXHWjEjO5uwmVCdshGsBjW93kIEhllVtnLQBLAU9lakIrODm
 DoIn3VgWxuTJwpHx5M1rk/JNAandW6N59AaTjakXBDrDna3jzwOmMAxSmqgmmbkZ
 tjN8FIetOirWY8ISZWNHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778761; x=
 1661785961; bh=8CnDkZ8kqQ6q5hGMkFvBP77iUldYY5FJB+9fy2fc26U=; b=z
 EqpP4aqEQ+xH46WKoW35kSxrDBqTJbFUeMrQDhO1Lrbb8ydxvpDy4Xpd4p857m49
 0eV9TdJGp5w7Kx2qqhRhnzCvTFrHE2WIUq7Sw2dwATGosGE5IrQFq9nmSWWMFACC
 04x/8SmQSN0IAwn2c8IHkW9LqijAIRrDnkcTG4MjYLIHQHjnCOpBveWVlheYTmxm
 0BjHZxXkWPc4bChJtDY7Jb2Cfx1m/v1HCSBt0DGKdjHMuwdJlukIKYsiAzOgwR8S
 pSYZLI5xEcPpM2LtHoDK4wBB3KlCVFlMY3PJj2B2rmYN6MVsVRgr0mVXxdJXpcrU
 RKBcllo4WlCmeorsH78Lw==
X-ME-Sender: <xms:SLsMY1xGdKEwbe98uk71ciwZQKw3M9xmOpdTMLwWmO24ma-DKUo2vA>
 <xme:SLsMY1S5fiKo0dTKRmgTLZTv5uqELTN_X5-5s9lipXbvYSRnjeLvwmzJAkHtel6w2
 zFp-4itsMW4CaojYF4>
X-ME-Received: <xmr:SLsMY_W4RjPqUN66LvL8qIYIJLUXIMtOXlXI4-xGHqotTevMkeH9srnyDE2S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvueehkefhhefghedugefhieevhfdvudegleeuteetlefgudevgfet
 kedtlefhtdenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:SLsMY3hKCJwpIJCa9X-U0C5W8lVYDiJ9lzzpzeQ8-_K-BJMqslpc1w>
 <xmx:SLsMY3BJU9XSYE6OTtJ4zzcX26aPmdNuF3gX2mxsMAg4V1V1rDA0EA>
 <xmx:SLsMYwKBl_wQzBqXxHxx_3TxT5w4DE7RzumDzeSMjHMpxYQaGCQkLQ>
 <xmx:SbsMY96LzhuRFb3zG-puQ9jsIH6L1jKdlMK3QLeUnW8JPciZ-VsfXYPASDE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:39 -0400 (EDT)
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
Subject: [PATCH v2 06/41] drm/connector: Rename legacy TV property
Date: Mon, 29 Aug 2022 15:11:20 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-6-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=7447; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Vj71Vu7PJT9/n1eGtgjzDPlxAX4nAfOPbqCcT6vghwY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+QrX04u/7d+e22QwOzul7v+8bx80+e/qI7nxZE9zr4/
 L75y7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBELDcz/LOfkNpR88L7TVJUZoNwi5
 839/pl6o3/7FLeBh9Z8fOCURXDP7OT05uuLF6lZO3yTG2uvHJfyt4jy28qza2TYtxdfWqnKC8A
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

The current tv_mode has driver-specific values that don't allow to=0D
easily share code using it, either at the userspace or kernel level.=0D
=0D
Since we're going to introduce a new, generic, property that fit the=0D
same purpose, let's rename this one to legacy_tv_mode to make it=0D
obvious we should move away from it.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c=0D
index c06d0639d552..7f2b9a07fbdf 100644=0D
--- a/drivers/gpu/drm/drm_atomic_uapi.c=0D
+++ b/drivers/gpu/drm/drm_atomic_uapi.c=0D
@@ -698,8 +698,8 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,=0D
 		state->tv.margins.top =3D val;=0D
 	} else if (property =3D=3D config->tv_bottom_margin_property) {=0D
 		state->tv.margins.bottom =3D val;=0D
-	} else if (property =3D=3D config->tv_mode_property) {=0D
-		state->tv.mode =3D val;=0D
+	} else if (property =3D=3D config->legacy_tv_mode_property) {=0D
+		state->tv.legacy_mode =3D val;=0D
 	} else if (property =3D=3D config->tv_brightness_property) {=0D
 		state->tv.brightness =3D val;=0D
 	} else if (property =3D=3D config->tv_contrast_property) {=0D
@@ -808,8 +808,8 @@ drm_atomic_connector_get_property(struct drm_connector =
*connector,=0D
 		*val =3D state->tv.margins.top;=0D
 	} else if (property =3D=3D config->tv_bottom_margin_property) {=0D
 		*val =3D state->tv.margins.bottom;=0D
-	} else if (property =3D=3D config->tv_mode_property) {=0D
-		*val =3D state->tv.mode;=0D
+	} else if (property =3D=3D config->legacy_tv_mode_property) {=0D
+		*val =3D state->tv.legacy_mode;=0D
 	} else if (property =3D=3D config->tv_brightness_property) {=0D
 		*val =3D state->tv.brightness;=0D
 	} else if (property =3D=3D config->tv_contrast_property) {=0D
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c=0D
index e3142c8142b3..ede6025638d7 100644=0D
--- a/drivers/gpu/drm/drm_connector.c=0D
+++ b/drivers/gpu/drm/drm_connector.c=0D
@@ -1686,14 +1686,14 @@ int drm_mode_create_tv_properties(struct drm_device=
 *dev,=0D
 	if (drm_mode_create_tv_margin_properties(dev))=0D
 		goto nomem;=0D
 =0D
-	dev->mode_config.tv_mode_property =3D=0D
+	dev->mode_config.legacy_tv_mode_property =3D=0D
 		drm_property_create(dev, DRM_MODE_PROP_ENUM,=0D
 				    "mode", num_modes);=0D
-	if (!dev->mode_config.tv_mode_property)=0D
+	if (!dev->mode_config.legacy_tv_mode_property)=0D
 		goto nomem;=0D
 =0D
 	for (i =3D 0; i < num_modes; i++)=0D
-		drm_property_add_enum(dev->mode_config.tv_mode_property,=0D
+		drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,=0D
 				      i, modes[i]);=0D
 =0D
 	dev->mode_config.tv_brightness_property =3D=0D
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_=
connector.c=0D
index fa636206f232..caf82e9095b4 100644=0D
--- a/drivers/gpu/drm/gud/gud_connector.c=0D
+++ b/drivers/gpu/drm/gud/gud_connector.c=0D
@@ -424,7 +424,7 @@ gud_connector_property_lookup(struct drm_connector *con=
nector, u16 prop)=0D
 	case GUD_PROPERTY_TV_BOTTOM_MARGIN:=0D
 		return config->tv_bottom_margin_property;=0D
 	case GUD_PROPERTY_TV_MODE:=0D
-		return config->tv_mode_property;=0D
+		return config->legacy_tv_mode_property;=0D
 	case GUD_PROPERTY_TV_BRIGHTNESS:=0D
 		return config->tv_brightness_property;=0D
 	case GUD_PROPERTY_TV_CONTRAST:=0D
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_=
drv.c=0D
index b91e48d2190d..d29b63fd6178 100644=0D
--- a/drivers/gpu/drm/i2c/ch7006_drv.c=0D
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c=0D
@@ -264,7 +264,7 @@ static int ch7006_encoder_create_resources(struct drm_e=
ncoder *encoder,=0D
 				      priv->hmargin);=0D
 	drm_object_attach_property(&connector->base, conf->tv_bottom_margin_prope=
rty,=0D
 				      priv->vmargin);=0D
-	drm_object_attach_property(&connector->base, conf->tv_mode_property,=0D
+	drm_object_attach_property(&connector->base, conf->legacy_tv_mode_propert=
y,=0D
 				      priv->norm);=0D
 	drm_object_attach_property(&connector->base, conf->tv_brightness_property=
,=0D
 				      priv->brightness);=0D
@@ -315,7 +315,7 @@ static int ch7006_encoder_set_property(struct drm_encod=
er *encoder,=0D
 		ch7006_load_reg(client, state, CH7006_POV);=0D
 		ch7006_load_reg(client, state, CH7006_VPOS);=0D
 =0D
-	} else if (property =3D=3D conf->tv_mode_property) {=0D
+	} else if (property =3D=3D conf->legacy_tv_mode_property) {=0D
 		if (connector->dpms !=3D DRM_MODE_DPMS_OFF)=0D
 			return -EINVAL;=0D
 =0D
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/no=
uveau/dispnv04/tvnv17.c=0D
index be28e7bd7490..1a15534adc60 100644=0D
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c=0D
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c=0D
@@ -662,7 +662,7 @@ static int nv17_tv_create_resources(struct drm_encoder =
*encoder,=0D
 					conf->tv_subconnector_property,=0D
 					tv_enc->subconnector);=0D
 	drm_object_attach_property(&connector->base,=0D
-					conf->tv_mode_property,=0D
+					conf->legacy_tv_mode_property,=0D
 					tv_enc->tv_norm);=0D
 	drm_object_attach_property(&connector->base,=0D
 					conf->tv_flicker_reduction_property,=0D
@@ -722,7 +722,7 @@ static int nv17_tv_set_property(struct drm_encoder *enc=
oder,=0D
 		if (encoder->crtc)=0D
 			nv17_tv_update_rescaler(encoder);=0D
 =0D
-	} else if (property =3D=3D conf->tv_mode_property) {=0D
+	} else if (property =3D=3D conf->legacy_tv_mode_property) {=0D
 		if (connector->dpms !=3D DRM_MODE_DPMS_OFF)=0D
 			return -EINVAL;=0D
 =0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index 4a788c1c9058..dc33b7b9ce5e 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -366,7 +366,7 @@ static int vc4_vec_connector_init(struct drm_device *de=
v, struct vc4_vec *vec)=0D
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);=0D
 =0D
 	drm_object_attach_property(&connector->base,=0D
-				   dev->mode_config.tv_mode_property,=0D
+				   dev->mode_config.legacy_tv_mode_property,=0D
 				   VC4_VEC_TV_MODE_NTSC);=0D
 	vec->tv_mode =3D &vc4_vec_tv_modes[VC4_VEC_TV_MODE_NTSC];=0D
 =0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 1d5e3cccb9e3..5cfad8b6ad83 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -695,7 +695,7 @@ struct drm_connector_tv_margins {=0D
  * @select_subconnector: selected subconnector=0D
  * @subconnector: detected subconnector=0D
  * @margins: TV margins=0D
- * @mode: TV mode=0D
+ * @legacy_mode: Legacy TV mode, driver specific value=0D
  * @brightness: brightness in percent=0D
  * @contrast: contrast in percent=0D
  * @flicker_reduction: flicker reduction in percent=0D
@@ -707,7 +707,7 @@ struct drm_tv_connector_state {=0D
 	enum drm_mode_subconnector select_subconnector;=0D
 	enum drm_mode_subconnector subconnector;=0D
 	struct drm_connector_tv_margins margins;=0D
-	unsigned int mode;=0D
+	unsigned int legacy_mode;=0D
 	unsigned int brightness;=0D
 	unsigned int contrast;=0D
 	unsigned int flicker_reduction;=0D
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h=
=0D
index 6b5e01295348..35a827175c24 100644=0D
--- a/include/drm/drm_mode_config.h=0D
+++ b/include/drm/drm_mode_config.h=0D
@@ -714,11 +714,13 @@ struct drm_mode_config {=0D
 	 * between different TV connector types.=0D
 	 */=0D
 	struct drm_property *tv_select_subconnector_property;=0D
+=0D
 	/**=0D
-	 * @tv_mode_property: Optional TV property to select=0D
+	 * @legacy_tv_mode_property: Optional TV property to select=0D
 	 * the output TV mode.=0D
 	 */=0D
-	struct drm_property *tv_mode_property;=0D
+	struct drm_property *legacy_tv_mode_property;=0D
+=0D
 	/**=0D
 	 * @tv_left_margin_property: Optional TV property to set the left=0D
 	 * margin (expressed in pixels).=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
