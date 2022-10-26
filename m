Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366060E488
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFFA10E301;
	Wed, 26 Oct 2022 15:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9BE10E2DA;
 Wed, 26 Oct 2022 15:33:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7BB4758025D;
 Wed, 26 Oct 2022 11:33:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 26 Oct 2022 11:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798416; x=
 1666805616; bh=8wpLFvZYSQ/uDuDcd/0UszwrlkV34BWHsEHg7Vs3dpQ=; b=k
 hLxn4JbYa0WL3KqQHvmX1gOhql6f5ZMHNs8pNsvgt3zLqLQBsPRqXePng3CKKwg9
 E9IY7YmEeKNeaW+LUiQvm369iK4lkWouALks91z5LJUXkxzCNenSWM2AtfRdJmUL
 0unPyFQZIheIRPfYbwI6cvP0Vx6sUpgA4Vv4flUWgg/Lq1692R65PNz1ppFGOrD3
 B78bL7VqT2q/RJ8neSvHwF+NJvnINDtrKzt1nxPuR7vZ772LuRvmJL/nb1g0yV5A
 u+A16XQCk8YZ+x/byy0G1dqPYXu6ZzjArU/662o7M+/PEqKrVnk2+bJuGJXF+IkL
 qDr4FUpSUubK8qTNNZPrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798416; x=
 1666805616; bh=8wpLFvZYSQ/uDuDcd/0UszwrlkV34BWHsEHg7Vs3dpQ=; b=F
 cju/Djo6fQYYQbLnX/Ijpe92XNYcZ1ninrIO11cydRFArDfuxJNJgfdOtOO0miCB
 lLEoHlzEv6CcgFg3Kf/AzvaFD5AiBHPnZjZhKiksyGP5Xnz7DqR3p2bNDDdgHvI0
 3b/HqeP+W0h0GLsG6s/njOJP2yLFe5Dkf00LIoFOSHFiWviCfM9nMGIfck+BG3z1
 QAxcxCBwvH/qQKjxwVrT458kKIGRww2kIeXTfYB67M8lg4T4TVq8NuIgVJ/F/ECE
 yDyXQpv1CnYP4vcomNKdeSHgq8Ytd4QRIfyld67eDGbrQ/3/kQqPTEu4ydPkhRSd
 gjvoVQkaMk62meG2nsUfw==
X-ME-Sender: <xms:UFNZY7jR6pFpIFJupRzLVp7RFu98bIGtIkVQdLvzV8qAn1VlIcyX_A>
 <xme:UFNZY4C3_Ea89634PpXl1hA8BQ2BtrzFtr_RN9kr6UZD4CQaYXxOqRXgnckjWx4xM
 7nIySZhdIynRJL6Poc>
X-ME-Received: <xmr:UFNZY7F512fLkeXFWLSZMbHHSrnidFqy2v3pR3mWcTBSj1hCss7K_xy9FEXBQj0X1rxip-S4avteV_0-cyCfcco8cs7mk3VniH89X3jamezM1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeegudevgeehgedtheeuff
 egledugfetveevveeivdfhtedvhfduffeuudetkeevgeenucffohhmrghinhepmhgrrhhg
 ihhnshdrthhophenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UFNZY4RCI8B--6qfH3jvmtN-4kn0Zp2bV9QK3mi9_dxW7KrLYtj2_A>
 <xmx:UFNZY4yuuYIYTDhfNQtJaInX9-X8JaQrCxzvBXhOecw-619T9DpXCg>
 <xmx:UFNZY-61100v139D7ruJ3u8AlEEzCK8HMk9I6spVdNYKKYt0BFsVqQ>
 <xmx:UFNZYwdjJs4QCeGYrfNeoDZUR-LrI1JhbHZeLBhwlPAHdK6mlUcLoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:35 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:21 +0200
Subject: [PATCH v6 02/23] drm/connector: Rename legacy TV property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-2-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=10911; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=WoUTSUurxmxtkfur6YS9c7sw9Fm3hf3dmndakf2g2aQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW7Ka1d73mycZfXh8qHyDr7jtct3mTrFRpp8emyvqXa4
 9qN3RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYy8yIjw7rN4p1hLvr/d97XS5zHs/
 3YpuOnY2V3PL+wRW9bgn/in0sMf3h9D+9Yx9f1I+doBkvsNpYPJ6be/VUicO/g1ijVji9hkiwA
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_uapi.c         | 8 ++++----
 drivers/gpu/drm/drm_connector.c           | 6 +++---
 drivers/gpu/drm/gud/gud_connector.c       | 6 +++---
 drivers/gpu/drm/i2c/ch7006_drv.c          | 4 ++--
 drivers/gpu/drm/i915/display/intel_tv.c   | 3 ++-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_vec.c             | 8 ++++----
 include/drm/drm_connector.h               | 4 ++--
 include/drm/drm_mode_config.h             | 6 ++++--
 9 files changed, 26 insertions(+), 23 deletions(-)

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
index 578b738859b9..ef69f9bdeace 100644
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
index dcf89d701f0f..b2f42bf929e2 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1997,7 +1997,8 @@ intel_tv_init(struct drm_i915_private *dev_priv)
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
index b1b2df48d42c..f93f83161ed5 100644
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
