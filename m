Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D716240CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E9810E6D9;
	Thu, 10 Nov 2022 11:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8382110E138;
 Thu, 10 Nov 2022 11:07:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6C87580281;
 Thu, 10 Nov 2022 06:07:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 06:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078443; x=
 1668085643; bh=qzOHmI2A/jX7HxLCkrQBtN7wbBEAnfznrNCOjTbq/Fc=; b=k
 tieW/jnkamfGa05JosldGuZeF0W4MjZ8Bc9lleNc7fQsIYIxw/h8hofZdj3GHG1Q
 8IsqBX/kO2URiGJQ4gzqpI1+BvjjHvxTVlbcsQgRH/0RMvEjYnhCVTEFbqx8l86h
 C9bzI+UQCxQC+Zpsdv9H82A6xTIAym6uuJufumbbsbQI0p3BS1c48MLc970glK1G
 5UzZcA/5PvQIuFURRaaqUkhDUEVTWTPcqPEkAsVjIYq0sy3hhE1kXwZkU6d/Cmfg
 lQVEAyvoM8drhKcuY3BzJEyZVicpkOcMvMgcrt1z5YvcU0682uGdTTzzqV4gkHdf
 xmAd3BYwSILRubp17JwEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078443; x=
 1668085643; bh=qzOHmI2A/jX7HxLCkrQBtN7wbBEAnfznrNCOjTbq/Fc=; b=V
 eXQbvOnV/K29yAtFwfR1hx2K07mjtu7oGw7F7hE7L1/3KGPtSzqlyuPtXrHqPXI1
 5YChZmpb4+6H8hJtC95ffcVhWycxR0VF/pPkeVAYXjNxISbq82/dxKVnmqvWk2Yk
 0eq0NEPKEu0GA6fjXwst7QuR+nCgFs066sZjTyh7wV6bQebKFm5Bkl/ceIBi9LoY
 1YI8JIiWY4m+JqpweS2dp9zz5nm0nR4GkrgLvVnxj1d4agXev0WBlVpOH3asQGSF
 Ci/PeiLzR0le3saPGC7TXVs3uwAMPNWWHNO1bjJINtjDKrPD7NQl0AS2uq3ds2pR
 0JE3QQoOzKEcTmpwY2KrA==
X-ME-Sender: <xms:a9tsY_F5X6GveEJ5Jc_MK35DgWWQFfu2syPC__C2igccov-WjUT4eQ>
 <xme:a9tsY8WNVy2AF82L-Ua3njeQKroddTggm8llIGdbMxbXmud8n5AJq-RZEWA4EottP
 2SnB_yk8g0WPZsMvlg>
X-ME-Received: <xmr:a9tsYxKzonYqxkG6chGkDNw7sAZtFakuZZxJJgtgFzli9cPweKkFMa1BcK6Ve-KOxdzJvS3rpfpSg7j7sypafTAY8pbvsLIR0bSE347ae8baSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevjedukeetveevfefhhfdufeektdfgteetgfeijedtffeiffehueehtdeh
 ieekueenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:a9tsY9HWo6VA9YK1bCbZFdGJSehJKDki7ljYX4mQwrICLPe5ohpp1A>
 <xmx:a9tsY1UBsjw8qxnHlkqyi1qgEAVKrvERZ6R9hTr1mucHJwCMz-JSPg>
 <xmx:a9tsY4OLPzbzwY0esKno3Mnu7btf5bLl5KVBk_jH6kJM5EU1ZWgkSg>
 <xmx:a9tsY_g9QV-Kw1khtO0-vI9JqLHReyYQbzzZcv5EPUObM8vNhMinrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:14 +0100
Subject: [PATCH v8 02/24] drm/connector: Rename legacy TV property
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-2-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=10975; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=4/v6ZZkuOFO0GrAnt42Qzl6TxX9oTDP+dViD12JztH8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1MOXTZb/c6tJVogvvfM7NvvrzkLxG9aVfbloJ5n49U+
 s5M2HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI/StGhvMXFbMfsskUXrFosTZZUL
 hAPN1p6bk1HodcZAWsZsyfvp7hf6rY5seJXdqnQ8+vWff8FdMJHstbM0LMxcuvRk55d2JmIxsA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/drm_atomic_uapi.c         | 8 ++++----
 drivers/gpu/drm/drm_connector.c           | 6 +++---
 drivers/gpu/drm/gud/gud_connector.c       | 6 +++---
 drivers/gpu/drm/i2c/ch7006_drv.c          | 4 ++--
 drivers/gpu/drm/i915/display/intel_tv.c   | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_vec.c             | 8 ++++----
 include/drm/drm_connector.h               | 4 ++--
 include/drm/drm_mode_config.h             | 6 ++++--
 9 files changed, 25 insertions(+), 23 deletions(-)

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
index e641a4725f99..f18c2ba113d7 100644
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
