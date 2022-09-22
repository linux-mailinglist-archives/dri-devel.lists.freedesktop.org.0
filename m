Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58F5E6532
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073F810EB60;
	Thu, 22 Sep 2022 14:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EB610EB5D;
 Thu, 22 Sep 2022 14:26:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CCED62B05B1C;
 Thu, 22 Sep 2022 10:26:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856773; x=
 1663863973; bh=sA9EhaZI6M2r1hnuJVGduEFvajBQuaCA071tF6Bkn1o=; b=p
 c95+qgh/O772hYGo/pBqfjAOjPSMyka6iTdfXbwJg3FyxEcHvcv4dUV+yNx0xkXi
 81rnkMPBVsAD8luvCDoIyHZfCv3iKxPa/dDNhMtdExX6Di0gDXVEy17XlNr/mpmY
 abUj5AJ08t72Wb3F9COLCyLOnj3FdSR2MaIArRq0yMHqntSEteixeeBa1r/dXTAY
 6GW0iq9VOT7ppxPQ2Pgxz07LQTxm/PBMqsWgtxhgzoUdKfdwbr9dRM6YpJayDbHr
 wWgivjIZmVwJVFPpN9Qf51cYxoq1ocvQ2kvHrV3RGz78fkko8JruOzjnspjzTlo/
 eWR7VWrxa0jfWfDWuuqIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856773; x=
 1663863973; bh=sA9EhaZI6M2r1hnuJVGduEFvajBQuaCA071tF6Bkn1o=; b=D
 N5g/KFNGc7xBCfHVRIOK72zkGIWgYyUyMEYno1C9vjyiBm3/4gczTXgzNO0TJLUw
 LSyI2TFp6tGdwg6knkI+IepPafEPepV2Eh0VKtccH1U4ovivoe2BkMPFLi96m8LC
 Otol5xGWHlAIEJJRguD5QA33gN4ZoAat6GLnroUN5a6dU6rb8EwghTCAt/4zX9YR
 moPBTWobRGyE/sfnLeqUApt5WB6YhrABT87R3CYVqq+J41YzOVCiMtPrKi7Lf+FS
 /Q7IG+o/Auv8m7OyoRf1pWWTZBSMaVNSCypapp2yNNpliXLXndTcmo8VtI2dnFNf
 3s655uMKGygW0961oRIvA==
X-ME-Sender: <xms:hXAsYyP-go28UQ1kumwCNQAS9hlahb2yH1x0TW0XMxJB2-w-eQ_DbA>
 <xme:hXAsYw_DU9t0LbxfIg7XFJbuxNB3ccJP5CesOMlytBPiZwXOd-AdZEUeZLnLa3RPb
 6U_7L56sAt61_u8si4>
X-ME-Received: <xmr:hXAsY5TfHW-RyeLdv-n5oZ8cPWZzgx2zpaHlUXKQQO9m7eofedVIM3LGm6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepfeejteejhfdvhfeukeekudevjedvheelteeigffgudetfeduuddvvddv
 keeklefgnecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:hXAsYyuW6t_fVD2C13Fnv70DK2knjBxGDO0Vk8_z0pyMwRYOfeQnTQ>
 <xmx:hXAsY6dWtA8ECQLVoG536bTpOnT-tfuA2oPyiVj1ZagPBpM7HoFlIg>
 <xmx:hXAsY22LfeqV7rhCIJALhf1RytpPN-zlnKdw6OtfdUCvnjLdGoCldA>
 <xmx:hXAsY5ppUy6UITmMiKIbbnqyyptGT4lIvyrE-otBRU7TqDtcYBMRt5oZxrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:23 +0200
Subject: [PATCH v2 06/33] drm/connector: Rename legacy TV property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9818; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3UvOfa1TpUUqsOT3A3Tgkj+cYjZVTP+CUe9TUNwG1Vk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQGlPzNMHYP39d82YOF5Y8u9r/gif86LqinGD18y3VGa
 0feoo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNJX8XwP0d06r9peTel4vsSZJjezt
 y7X5KrOnVmy7mOJeflrjNOP83wT1U0ZV9srMTHovcP2EW0sp2TQ9xzQgyi3FUireaaLrnCDgA=
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

The current tv_mode has driver-specific values that don't allow to
easily share code using it, either at the userspace or kernel level.

Since we're going to introduce a new, generic, property that fit the
same purpose, let's rename this one to legacy_tv_mode to make it
obvious we should move away from it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c06d0639d552..7f2b9a07fbdf 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -698,8 +698,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->tv.margins.top = val;
 	} else if (property == config->tv_bottom_margin_property) {
 		state->tv.margins.bottom = val;
-	} else if (property == config->tv_mode_property) {
-		state->tv.mode = val;
+	} else if (property == config->legacy_tv_mode_property) {
+		state->tv.legacy_mode = val;
 	} else if (property == config->tv_brightness_property) {
 		state->tv.brightness = val;
 	} else if (property == config->tv_contrast_property) {
@@ -808,8 +808,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->tv.margins.top;
 	} else if (property == config->tv_bottom_margin_property) {
 		*val = state->tv.margins.bottom;
-	} else if (property == config->tv_mode_property) {
-		*val = state->tv.mode;
+	} else if (property == config->legacy_tv_mode_property) {
+		*val = state->tv.legacy_mode;
 	} else if (property == config->tv_brightness_property) {
 		*val = state->tv.brightness;
 	} else if (property == config->tv_contrast_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3142c8142b3..ede6025638d7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1686,14 +1686,14 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-	dev->mode_config.tv_mode_property =
+	dev->mode_config.legacy_tv_mode_property =
 		drm_property_create(dev, DRM_MODE_PROP_ENUM,
 				    "mode", num_modes);
-	if (!dev->mode_config.tv_mode_property)
+	if (!dev->mode_config.legacy_tv_mode_property)
 		goto nomem;
 
 	for (i = 0; i < num_modes; i++)
-		drm_property_add_enum(dev->mode_config.tv_mode_property,
+		drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
 				      i, modes[i]);
 
 	dev->mode_config.tv_brightness_property =
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index fa636206f232..86e992b2108b 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -303,7 +303,7 @@ static int gud_connector_atomic_check(struct drm_connector *connector,
 	    old_state->tv.margins.right != new_state->tv.margins.right ||
 	    old_state->tv.margins.top != new_state->tv.margins.top ||
 	    old_state->tv.margins.bottom != new_state->tv.margins.bottom ||
-	    old_state->tv.mode != new_state->tv.mode ||
+	    old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
 	    old_state->tv.brightness != new_state->tv.brightness ||
 	    old_state->tv.contrast != new_state->tv.contrast ||
 	    old_state->tv.flicker_reduction != new_state->tv.flicker_reduction ||
@@ -424,7 +424,7 @@ gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
 	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
 		return config->tv_bottom_margin_property;
 	case GUD_PROPERTY_TV_MODE:
-		return config->tv_mode_property;
+		return config->legacy_tv_mode_property;
 	case GUD_PROPERTY_TV_BRIGHTNESS:
 		return config->tv_brightness_property;
 	case GUD_PROPERTY_TV_CONTRAST:
@@ -454,7 +454,7 @@ static unsigned int *gud_connector_tv_state_val(u16 prop, struct drm_tv_connecto
 	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
 		return &state->margins.bottom;
 	case GUD_PROPERTY_TV_MODE:
-		return &state->mode;
+		return &state->legacy_mode;
 	case GUD_PROPERTY_TV_BRIGHTNESS:
 		return &state->brightness;
 	case GUD_PROPERTY_TV_CONTRAST:
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index b91e48d2190d..d29b63fd6178 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -264,7 +264,7 @@ static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
 				      priv->hmargin);
 	drm_object_attach_property(&connector->base, conf->tv_bottom_margin_property,
 				      priv->vmargin);
-	drm_object_attach_property(&connector->base, conf->tv_mode_property,
+	drm_object_attach_property(&connector->base, conf->legacy_tv_mode_property,
 				      priv->norm);
 	drm_object_attach_property(&connector->base, conf->tv_brightness_property,
 				      priv->brightness);
@@ -315,7 +315,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 		ch7006_load_reg(client, state, CH7006_POV);
 		ch7006_load_reg(client, state, CH7006_VPOS);
 
-	} else if (property == conf->tv_mode_property) {
+	} else if (property == conf->legacy_tv_mode_property) {
 		if (connector->dpms != DRM_MODE_DPMS_OFF)
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 9379f3463344..abaf9ded942d 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1986,7 +1986,8 @@ intel_tv_init(struct drm_i915_private *dev_priv)
 	}
 	drm_mode_create_tv_properties(dev, i, tv_format_names);
 
-	drm_object_attach_property(&connector->base, dev->mode_config.tv_mode_property,
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.legacy_tv_mode_property,
 				   state->tv.mode);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.tv_left_margin_property,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index be28e7bd7490..1a15534adc60 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -662,7 +662,7 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
 					conf->tv_subconnector_property,
 					tv_enc->subconnector);
 	drm_object_attach_property(&connector->base,
-					conf->tv_mode_property,
+					conf->legacy_tv_mode_property,
 					tv_enc->tv_norm);
 	drm_object_attach_property(&connector->base,
 					conf->tv_flicker_reduction_property,
@@ -722,7 +722,7 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 		if (encoder->crtc)
 			nv17_tv_update_rescaler(encoder);
 
-	} else if (property == conf->tv_mode_property) {
+	} else if (property == conf->legacy_tv_mode_property) {
 		if (connector->dpms != DRM_MODE_DPMS_OFF)
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 0b3333865702..77c50ecb0309 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -274,7 +274,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(connector->dev,
-				  vc4_vec_tv_modes[state->tv.mode].mode);
+				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
 	if (!mode) {
 		DRM_ERROR("Failed to create a new display mode\n");
 		return -ENOMEM;
@@ -312,7 +312,7 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
-				   dev->mode_config.tv_mode_property,
+				   dev->mode_config.legacy_tv_mode_property,
 				   VC4_VEC_TV_MODE_NTSC);
 
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
@@ -449,7 +449,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	const struct vc4_vec_tv_mode *vec_mode;
 
-	vec_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
+	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
 
 	if (conn_state->crtc &&
 	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1d5e3cccb9e3..5cfad8b6ad83 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -695,7 +695,7 @@ struct drm_connector_tv_margins {
  * @select_subconnector: selected subconnector
  * @subconnector: detected subconnector
  * @margins: TV margins
- * @mode: TV mode
+ * @legacy_mode: Legacy TV mode, driver specific value
  * @brightness: brightness in percent
  * @contrast: contrast in percent
  * @flicker_reduction: flicker reduction in percent
@@ -707,7 +707,7 @@ struct drm_tv_connector_state {
 	enum drm_mode_subconnector select_subconnector;
 	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
-	unsigned int mode;
+	unsigned int legacy_mode;
 	unsigned int brightness;
 	unsigned int contrast;
 	unsigned int flicker_reduction;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6b5e01295348..35a827175c24 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -714,11 +714,13 @@ struct drm_mode_config {
 	 * between different TV connector types.
 	 */
 	struct drm_property *tv_select_subconnector_property;
+
 	/**
-	 * @tv_mode_property: Optional TV property to select
+	 * @legacy_tv_mode_property: Optional TV property to select
 	 * the output TV mode.
 	 */
-	struct drm_property *tv_mode_property;
+	struct drm_property *legacy_tv_mode_property;
+
 	/**
 	 * @tv_left_margin_property: Optional TV property to set the left
 	 * margin (expressed in pixels).

-- 
b4 0.10.0
