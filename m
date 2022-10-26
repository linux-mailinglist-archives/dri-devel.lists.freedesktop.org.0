Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C160E494
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F31110E3DA;
	Wed, 26 Oct 2022 15:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766E010E39A;
 Wed, 26 Oct 2022 15:33:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D722758020E;
 Wed, 26 Oct 2022 11:33:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Oct 2022 11:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798420; x=
 1666805620; bh=aJFPwKqNB5FMyAfZaSz4ZtKCShLvfWWgS0ATLNLSh3Y=; b=I
 yy3ncwq/IFGKyB7y8bScrR/I6yoaE2FvfZk3uCEIqbh896mKCq2SsFLHifQ9tMvb
 Xfww4CJNSFqpnZOrI0hKqmzNTSqG18SsbUJyeHJxOTB0+yl2JniwyYaunBhWGcEq
 LQ6dr6Olw1xsc7yvoEZc3ZOuJAssukmljODuBvi32CqtnFW6ugc5LQ/HB6vtwvDY
 mK8c7gPxBRLwUZ3AhBwKwx88lLCVxERRjzxICp+1JN0x8XQU9C/ICFd8ggBrU8Ex
 XR5iLx7xOH4L1b82o3czoqvExaUO7n8FhzFkomG/QPTauV1b74BG9E8BTNk3TTV6
 i6BQ1OH7Fg4MFXX62pV2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798420; x=
 1666805620; bh=aJFPwKqNB5FMyAfZaSz4ZtKCShLvfWWgS0ATLNLSh3Y=; b=f
 1AF2EnevOam07VS4Y6lFAR/zNlixu3IEPxV9TBaq5Mzbg2y0dnF+4UhilZsBjqLn
 EmHWnaxEMpgBY37pGpMhAm7+LG5/tdTT9lVjTZrBUQPxfveAgYBeMHfKSsY0Uasy
 PZy1Zl3mgzrRi9UQGpII5WnK99VqWvrqi6iwjoc62G8PMz0Cn+mnyORNxD6c2YzH
 iYLxcRnpq5H92si9f9f4U8cjbAByQIJs2IAV2pyntn9EUsu4iK1UgxMBR0gaFSx9
 fP/AvqP3GY1OALnw6hdBfYhyb/E+FP24Uv6ytB9Znr0GDbW3ZSAoHdi1ZXhqB0RC
 h1o6UynQIOUNi9Hi6gM9w==
X-ME-Sender: <xms:VFNZY_KqFcl5oz3KfEr9FeWsAM4vePgQMRtGbYO2-ODuxvo7DBA3aQ>
 <xme:VFNZYzJR3dDiWfSR1jUjY-fWFNHWCihs9UOyJEJ9Qn_BJrlXiQV6kYQmWQ1NzxDml
 w9dHDvqqU5YAvnTwig>
X-ME-Received: <xmr:VFNZY3vWpvL4aLCYcQC1NXvl2A1VMk97YTA0OeVdmOTEENmZrAAf4wKhw2ql-bgi6WwWpZP62FEs62dGKRFRHMe1Z4wi8iM6SKtmV5g7z7Ce6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:VFNZY4ZAA97899PWyGs8JXJM6s9wXxhA9PZ482z06qMi8TDWm8lmMQ>
 <xmx:VFNZY2ahJl_IANtUKOTpCq-7gy77ICfnFONIvyQpVUL2tArdGqkqyg>
 <xmx:VFNZY8D4YveHQ798TDIhnWNbPXUdzUc_fkv89eQFIxOOUc6v6OzVZg>
 <xmx:VFNZY3F_uPNmDwnF4s3jyQkgl73aYrsQzST_bv5tLjSLIIfk9rLnwg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:39 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:23 +0200
Subject: [PATCH v6 04/23] drm/connector: Rename drm_mode_create_tv_properties
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-4-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7225; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=LAHuDhiCCvcHX74pAAH7nyY5O1gAlCgceYdUnZcqbdE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4ZHQ/sF7x6WbfZQPTgm1n2Qttb9P+eaXjjfHJn6rGN
 F5fYdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiJh2MDD8UwtsUni4P/7F/RUnZ4q
 MqCo5VG8QYjni9/mM9P1Qs5jcjw98vm86XXZD+smtZyLVLDFsX9l27a7mIuYftnFxtO+fL5dwA
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

drm_mode_create_tv_properties(), among other things, will create the
"mode" property that stores the analog TV mode that connector is
supposed to output.

However, that property is getting deprecated, so let's rename that
function to mention it's deprecated. We'll introduce a new variant of
that function creating the property superseeding it in a later patch.

Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c           | 12 ++++++------
 drivers/gpu/drm/gud/gud_connector.c       |  4 ++--
 drivers/gpu/drm/i2c/ch7006_drv.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_tv.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c |  2 +-
 drivers/gpu/drm/vc4/vc4_vec.c             |  5 +++--
 include/drm/drm_connector.h               |  6 +++---
 7 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 17a5913cefe3..4e4fbc9e0049 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1600,7 +1600,7 @@ EXPORT_SYMBOL(drm_connector_attach_tv_margin_properties);
  * Called by a driver's HDMI connector initialization routine, this function
  * creates the TV margin properties for a given device. No need to call this
  * function for an SDTV connector, it's already called from
- * drm_mode_create_tv_properties().
+ * drm_mode_create_tv_properties_legacy().
  *
  * Returns:
  * 0 on success or a negative error code on failure.
@@ -1635,7 +1635,7 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev)
 EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
 
 /**
- * drm_mode_create_tv_properties - create TV specific connector properties
+ * drm_mode_create_tv_properties_legacy - create TV specific connector properties
  * @dev: DRM device
  * @num_modes: number of different TV formats (modes) supported
  * @modes: array of pointers to strings containing name of each format
@@ -1648,9 +1648,9 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_mode_create_tv_properties(struct drm_device *dev,
-				  unsigned int num_modes,
-				  const char * const modes[])
+int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
+					 unsigned int num_modes,
+					 const char * const modes[])
 {
 	struct drm_property *tv_selector;
 	struct drm_property *tv_subconnector;
@@ -1733,7 +1733,7 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 nomem:
 	return -ENOMEM;
 }
-EXPORT_SYMBOL(drm_mode_create_tv_properties);
+EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);
 
 /**
  * drm_mode_create_scaling_mode_property - create scaling mode property
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 86e992b2108b..034e78360d4f 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -400,7 +400,7 @@ static int gud_connector_add_tv_mode(struct gud_device *gdrm, struct drm_connect
 	for (i = 0; i < num_modes; i++)
 		modes[i] = &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];
 
-	ret = drm_mode_create_tv_properties(connector->dev, num_modes, modes);
+	ret = drm_mode_create_tv_properties_legacy(connector->dev, num_modes, modes);
 free:
 	kfree(buf);
 	if (ret < 0)
@@ -539,7 +539,7 @@ static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_conn
 			fallthrough;
 		case GUD_PROPERTY_TV_HUE:
 			/* This is a no-op if already added. */
-			ret = drm_mode_create_tv_properties(drm, 0, NULL);
+			ret = drm_mode_create_tv_properties_legacy(drm, 0, NULL);
 			if (ret)
 				goto out;
 			break;
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index ef69f9bdeace..b63bad04b09d 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -250,7 +250,7 @@ static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
 	struct drm_device *dev = encoder->dev;
 	struct drm_mode_config *conf = &dev->mode_config;
 
-	drm_mode_create_tv_properties(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
+	drm_mode_create_tv_properties_legacy(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
 
 	priv->scale_property = drm_property_create_range(dev, 0, "scale", 0, 2);
 	if (!priv->scale_property)
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index b2f42bf929e2..748821ebdf65 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1995,7 +1995,7 @@ intel_tv_init(struct drm_i915_private *dev_priv)
 
 		tv_format_names[i] = tv_modes[i].name;
 	}
-	drm_mode_create_tv_properties(dev, i, tv_format_names);
+	drm_mode_create_tv_properties_legacy(dev, i, tv_format_names);
 
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.legacy_tv_mode_property,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 1a15534adc60..e5480dab55e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -653,7 +653,7 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
 			tv_enc->tv_norm = i;
 	}
 
-	drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
+	drm_mode_create_tv_properties_legacy(dev, num_tv_norms, nv17_tv_norm_names);
 
 	drm_object_attach_property(&connector->base,
 					conf->tv_select_subconnector_property,
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index e6043cf5d40e..adc9bf99e3fd 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -514,8 +514,9 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_vec *vec;
 	int ret;
 
-	ret = drm_mode_create_tv_properties(drm, ARRAY_SIZE(tv_mode_names),
-					    tv_mode_names);
+	ret = drm_mode_create_tv_properties_legacy(drm,
+						   ARRAY_SIZE(tv_mode_names),
+						   tv_mode_names);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f93f83161ed5..e1c88ae0149a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1799,9 +1799,9 @@ int drm_mode_create_dvi_i_properties(struct drm_device *dev);
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
 
 int drm_mode_create_tv_margin_properties(struct drm_device *dev);
-int drm_mode_create_tv_properties(struct drm_device *dev,
-				  unsigned int num_modes,
-				  const char * const modes[]);
+int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
+					 unsigned int num_modes,
+					 const char * const modes[]);
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);
 int drm_connector_attach_content_type_property(struct drm_connector *dev);

-- 
b4 0.11.0-dev-99e3a
