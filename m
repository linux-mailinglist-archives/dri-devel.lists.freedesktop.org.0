Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E309C5E6536
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE0F10EB65;
	Thu, 22 Sep 2022 14:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BAF10EB66;
 Thu, 22 Sep 2022 14:26:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BD3272B05B1B;
 Thu, 22 Sep 2022 10:26:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856788; x=
 1663863988; bh=xCOQtVW6tJaOXeb7kZe07M5hPdvjo9hC/bd/4Xqxv5M=; b=F
 ycq+AaaskJrUTBwrP+7umu2Da9bWrZ27O2mhJkQZGaZDyV4ww625Rb/kT4CKfi36
 /IVzz1qi67oHU3128IpzbwJx3GRNoZIo/0FtztvTHcPh9vEYSYyJjAWk/Ouv5aeb
 dASLPPMnCmuX/Avb0HtGqWf/lvI/f7Mt4aHdJcXgJ9ts2OOPFuDEIjRrmV/q0d/K
 pri69IGg7K9pi2ib+vff/i+f1vEqraVkr/UTa+egrtCGav+ilvLdFwFEhXmVY/LW
 3YaONJcn+fgOrzTnMlUbYnIMFcBAYnaSvyhW4mC5F2iIY3u0JnSpcv+sNh3XjlLr
 Rsn+284sazz6XCaCW13Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856788; x=
 1663863988; bh=xCOQtVW6tJaOXeb7kZe07M5hPdvjo9hC/bd/4Xqxv5M=; b=R
 w4Cgf8F52EUuWNkjZRh4MkAJg4WVniHDTTY6IVXlAxJ7GMTLZCumhVi9DVd7kfTo
 YzsYMEX7VILwckHOmcpbfm3bu5fBi+stYxTpxiyFNBCOvx9zSr5jmWV6zEc32UFo
 Y0VJuUMH5CfbewNBEJHIBQCZtH6uXPOTBVAfqinhrihOca5tFy+3eb6TX9XTavFb
 uGihDOR4dpB3J5w5rtKtTiQLWMvWz30y9egNab1VcebUGKq0uP0fZKAxrzBsczn2
 Vpwh8ihzQhJQm62EyoKffp4yNzcjlXqr3SSAz+XqwS2AGrmLQBkqLCBAW24nWO0K
 iCfLmTHmwFvuTxonuxXtg==
X-ME-Sender: <xms:lHAsY7V_ZuUDc-Mx1brGJA7Z9QZ2uRfaCE-55hBvoDdZT5XpFhtUBw>
 <xme:lHAsYzkaM7xAT0Czr0tob8Ghh2Khl3jD3BY2_hjg4gyRPvWqgcb6qVYDzE87lKjNi
 WKg_kKw6O4_8AEkYvY>
X-ME-Received: <xmr:lHAsY3a4PZ1lZLP8Mipn4_iUKFvhSMfnYjqvCd8wtgWdevwyDRQRsWRBQos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lHAsY2X6rAxl-q1bVAJIcFKsa00q_v3jTRckIeVi6LW19X3JcZiyOw>
 <xmx:lHAsY1kf_XVNagVHqn9GfzhCYHD8iHvIjBOHlk3bG-eJ8gqT69KHXA>
 <xmx:lHAsYzfr4ju-D3emVgyh_hBSr6eQe5YSwOo_8QCs0HB4pfLngtSSTA>
 <xmx:lHAsY5xXpe20VLpahSa6nftE2Zxph-DcN6fFpLhA06t404vwOE_KN71RQk4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:25 +0200
Subject: [PATCH v2 08/33] drm/connector: Rename drm_mode_create_tv_properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-8-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6669; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sbhktNdaVKnHJ3MQxkK/mjJ+RzYyXsAOcMURsaQVMOs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQEcTN1xvgEzVrDqKkn+n6n+4O3R3U9z7NesDblte2Wu
 /DGVjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkSQojw8Kp/nz/1Z2uci04k908I9
 WgTuCivKTLw0d5rgazYhd1FTD8L0g0nrLuSfyd9dyyclOVI9QlH3YmnfBa/LBEzzLZ/bI2DwA=
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

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
index d29b63fd6178..506f6f932518 100644
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
index abaf9ded942d..5e88da8185ee 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1984,7 +1984,7 @@ intel_tv_init(struct drm_i915_private *dev_priv)
 
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
index 77c50ecb0309..f31fef938f11 100644
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
index 5cfad8b6ad83..d566b4a4709c 100644
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
b4 0.10.0
