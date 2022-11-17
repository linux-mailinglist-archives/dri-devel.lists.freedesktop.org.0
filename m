Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70F62D6D4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB310E59B;
	Thu, 17 Nov 2022 09:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFCC10E59B;
 Thu, 17 Nov 2022 09:29:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 286E92B069CB;
 Thu, 17 Nov 2022 04:29:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Nov 2022 04:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677341; x=
 1668684541; bh=W8VmJIfTmI+k6RYJoU9LPWPAn+H/KyhsUswP7suxtSA=; b=k
 ieN9uDmdjAbTzxYrA5pmIZx4iGLOQiLN9kJcfzomf2xk7zlrROF+rlPkaTLq979I
 KGzQuUTBvT7z4aMp2YakEDWOgs5wtKpCKAKFctAWQ9FsdWLF1TUKeoaVRZlJE/Fq
 mk5AywyAt9oEokUtZ95kmpm3xAyUZNsRe+gulnbylX90QzyEFzY0qcsu43y8ZVa0
 5Ds6I0D4qCkJS6f9ILod/1g8kHUXZFK20ikt6nwOU04IdMbO9twzbH7eQHP9qP6H
 AyfUc2puwsEi3mgF3LNSvoDs6MXQ2wPAlSlTdpB9XFqBjM/4cDseYG+7Bl6Tfw6N
 m/VRylMy9+TG7dfG2PYnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677341; x=
 1668684541; bh=W8VmJIfTmI+k6RYJoU9LPWPAn+H/KyhsUswP7suxtSA=; b=C
 Ta0sn3WXGOFZhWO7G/vreZFAPI7aQNGsuLsOPPRdnxZsox9b5f4F3xtYyDD7eMg3
 GrdiW7881HFctfPzujkBgt0shPI+RaB48NMXuECuBtUnPjcs/rDLU+nSZkkoQdT2
 PHlJ0lRd1cZRc+q0ftT+O2Pi8cJU7Qeh8D7BGKYBz6l3QObSjIzEWTTPs2yphTBk
 6R+8pyve4MV1kN/RAqPqySA56SN0C4KrZ07oitA324hpra2xLeIMRu670rMTYv9P
 9iSjgs+oA8+LzI34xmwui/Lfrb2aZWUy9X7sjs3/bRjVHTmfPNpJWNQG+P68q1jC
 nzZRCYH0ewMQZMaO/jWdw==
X-ME-Sender: <xms:3f51Y6sm9OPkObnKcf3IazrlqBYKkXdF-tPbZ0EDlXkMfX0NfU4tyA>
 <xme:3f51Y_c0TKHBEs5zu77krSmc_GAOqHDVbOw-HnVqbmxBLRaZEcv9pYU337nQqCB8t
 p6PDBEdzT6IifP8Pqc>
X-ME-Received: <xmr:3f51Y1zPHCK3XHbFsqCcVNhsNLBXgEnY2G8YxN1PAgZZB3bAWN3GXb29OcKXuhxQa41bqGl7yr97Rh15i8F0gWh3XwK1oDWDt12h5eJ8D-OZuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevjedukeetveevfefhhfdufeektdfgteetgfeijedtffeiffehueehtdeh
 ieekueenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:3f51Y1NeRJ4lK35_2LcIZJyzEFdp9_5GpoknE1ac_5ZKLyCIZlVsCw>
 <xmx:3f51Y69_ovp5Ed_LoeO0RXMA4vPhp83UlqlUSZRmnOd10UTzKXhenA>
 <xmx:3f51Y9UzIq4dM5A5S603VVV07giEHwXLA6AEltoWIglTOuID2N9aYQ>
 <xmx:3f51Y-JRrBwznRjPrLt-YJoAEwydBany2ujfQ-Wr6nNgAShvxhrm-0jcGA8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:45 +0100
Subject: [PATCH v10 02/19] drm/connector: Rename legacy TV property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-2-256dad125326@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11125; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=l1Ox0IfiU6WWTZiRE7QkASU2ES3zA2vXLXWHucVY4TE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y7of/3ywOYd671jMze+9Lq4X997zdFLr/ZNvrZ54l7L
 IvPzkzpKWRjEuBhkxRRZYoTNl8SdmvW6k41vHswcViaQIQxcnAIwkdoQhv+xKduM1DPmNhf+e7tzxl
 aLNZ8OMi7VTlqfuKbrwqw1EwvKGf5H6Xofmlx8Y9FSqUdT4l6Z+pTqFm86MeGqwh52m6g1+h68AA==
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

The current tv_mode has driver-specific values that don't allow to
easily share code using it, either at the userspace or kernel level.

Since we're going to introduce a new, generic, property that fit the
same purpose, let's rename this one to legacy_tv_mode to make it
obvious we should move away from it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v10:
- Fix checkpatch warning
---
 drivers/gpu/drm/drm_atomic_uapi.c         | 8 ++++----
 drivers/gpu/drm/drm_connector.c           | 6 +++---
 drivers/gpu/drm/gud/gud_connector.c       | 6 +++---
 drivers/gpu/drm/i2c/ch7006_drv.c          | 6 +++---
 drivers/gpu/drm/i915/display/intel_tv.c   | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_vec.c             | 8 ++++----
 include/drm/drm_connector.h               | 4 ++--
 include/drm/drm_mode_config.h             | 6 ++++--
 9 files changed, 26 insertions(+), 24 deletions(-)

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
index 547356e00341..05edff79d312 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1690,14 +1690,14 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
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
index 578b738859b9..9aff24e8e3b2 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -264,8 +264,8 @@ static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
 				      priv->hmargin);
 	drm_object_attach_property(&connector->base, conf->tv_bottom_margin_property,
 				      priv->vmargin);
-	drm_object_attach_property(&connector->base, conf->tv_mode_property,
-				      priv->norm);
+	drm_object_attach_property(&connector->base, conf->legacy_tv_mode_property,
+				   priv->norm);
 	drm_object_attach_property(&connector->base, conf->tv_brightness_property,
 				      priv->brightness);
 	drm_object_attach_property(&connector->base, conf->tv_contrast_property,
@@ -315,7 +315,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 		ch7006_load_reg(client, state, CH7006_POV);
 		ch7006_load_reg(client, state, CH7006_VPOS);
 
-	} else if (property == conf->tv_mode_property) {
+	} else if (property == conf->legacy_tv_mode_property) {
 		if (connector->dpms != DRM_MODE_DPMS_OFF)
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index cf7d5c1ab406..95b021da5a11 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1906,7 +1906,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
 	drm_mode_create_tv_properties(&i915->drm, i, tv_format_names);
 
 	drm_object_attach_property(&connector->base,
-				   i915->drm.mode_config.tv_mode_property,
+				   i915->drm.mode_config.legacy_tv_mode_property,
 				   conn_state->tv.mode);
 	drm_object_attach_property(&connector->base,
 				   i915->drm.mode_config.tv_left_margin_property,
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
index 92c07e31d632..e6043cf5d40e 100644
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
@@ -361,7 +361,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	const struct vc4_vec_tv_mode *tv_mode =
-		&vc4_vec_tv_modes[conn_state->tv.mode];
+		&vc4_vec_tv_modes[conn_state->tv.legacy_mode];
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
@@ -449,7 +449,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	const struct vc4_vec_tv_mode *vec_mode;
 
-	vec_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
+	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
 
 	if (conn_state->crtc &&
 	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f1cba187e551..3d9a3ae33d3c 100644
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
index 5362702fffe1..c47b29e80108 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -712,11 +712,13 @@ struct drm_mode_config {
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
b4 0.11.0-dev-99e3a
