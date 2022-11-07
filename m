Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429361F54F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F1F10E330;
	Mon,  7 Nov 2022 14:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48D110E31E;
 Mon,  7 Nov 2022 14:17:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id E4CE82B06318;
 Mon,  7 Nov 2022 09:16:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 09:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830617; x=
 1667837817; bh=msfJMapGH6U3A7FDfBMTcdE+OzX3IjKl/LKtjHQsy2o=; b=l
 /z/bS6JIkpxFH86cvyQf1JA6XzO4rEnpt+Np02ww7x2aQu8yKHf3DCnx/RxSCN5x
 tg8Yp8RREIvR/aH+Pedwzh6w7QwsdjV1HWzMqSklmtCudwv4BW89Nhj6m0/+JSKS
 PkoTo4Ak7S0a/KstmdU/7qxBGondo7iyr4KeZCsc/rfKRnBGKnnopBeSW334WH2C
 JLeK7y943Yb/rtNJYi4ANnOHK/ft1VvJswWfD3zn0pu4Bvls05jmG9YKSsYtdVCc
 qoDPHdTfDuSvSIfKiloI/PSbvjpkIR1UMMV9fkDWAsY6C2a2bDPWyvwICWob/vKn
 mYV6rQHOsEJq5xADFnhzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830617; x=
 1667837817; bh=msfJMapGH6U3A7FDfBMTcdE+OzX3IjKl/LKtjHQsy2o=; b=G
 IZTTR9ucFsgrqKN4Io7CQaKTyUlCvJtkEM9dZIBeEUDmwu3U3uMk9XSjSVSS2FIZ
 Rr9u1/GaAXqZbKMkBDdADsEa7O1uPmYGGSSbZiz1EUTAGmclYGpmJUvyUxF2g4XL
 k06PE3gQTGUkYESlYoToLfDQskDKLopWEiAWK9qC5WEI/8SZo04XMIH5jxSQo2FS
 BJFr2t0xsD6HJjc0WZ0XR93/3RGxERZxzNzIyzqQ06kora4JqeE8nJy8aZtylz+b
 c+iO75+Sb88vPRbJhhX8ZwBIq2Gg6/k1ctPcP69z9uTSNzwP6/7yYYmxuc3UIsg4
 BjYfv5BsjJ2+txxKXJjoQ==
X-ME-Sender: <xms:WRNpY3FKHAYVPdn4VqXo9TfSpRIu7dNOYA8nnOjy-CmAdhuCpnS7bA>
 <xme:WRNpY0VUD-uBVJzSuuFozg1ypOe0u3i9m-jCs93k7F9y3d7yIIsRULu9soVZjchUc
 3OsfwzXwqdA_1Raz10>
X-ME-Received: <xmr:WRNpY5I3OVhZQPJfqUjgBFz4m9qC-sRajgzP6AuTqHNpqTpGnZ3t6un4YERX3RBsxqkez3dPyydtjbY79ZJY-wvufGxWUujV3_Ti9FOR3EwvjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WRNpY1FBxRPxp4XSIjuxzCv-NqhHpOGkIxGndwn3Kb6VVExoJXus-g>
 <xmx:WRNpY9VZm1QBJmRYc5cP3gM8kRZMOiMZs8Fb3BOPkSose3m8hYQ3xA>
 <xmx:WRNpYwM6HaAbOIPTWoEr-PoFkDttsOPXsVUSUOxDJ6lgJy3cu-7cnw>
 <xmx:WRNpY3jKC7FnWNabonnYhpnNQYgLuscsJqYR9ho8tMbVBPEK96zy5ND73HM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:16:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:30 +0100
Subject: [PATCH v7 04/23] drm/connector: Rename drm_mode_create_tv_properties
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-4-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=7225; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dKTjO3LF6yOUx2eeP7WqLfAhx4ccm5/DpLghW0Uwz+0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwvY7WTgk/qRU/8r4uStzX8rGx1EPRSbv+Mqq0huecDZM
 +U1RRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZyIIzhv2vzauGM2bEnvfvZJinlJN
 ysnL/e4X9cwsuPRptlnvwQ+sTIcFBlwjvR3JBn5QKmZ7OO5T48VbrZ4uWb1Vm8pd2Tgr1amAA=
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
index 6e9e2f96f3a8..cd01850c66f7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1604,7 +1604,7 @@ EXPORT_SYMBOL(drm_connector_attach_tv_margin_properties);
  * Called by a driver's HDMI connector initialization routine, this function
  * creates the TV margin properties for a given device. No need to call this
  * function for an SDTV connector, it's already called from
- * drm_mode_create_tv_properties().
+ * drm_mode_create_tv_properties_legacy().
  *
  * Returns:
  * 0 on success or a negative error code on failure.
@@ -1639,7 +1639,7 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev)
 EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
 
 /**
- * drm_mode_create_tv_properties - create TV specific connector properties
+ * drm_mode_create_tv_properties_legacy - create TV specific connector properties
  * @dev: DRM device
  * @num_modes: number of different TV formats (modes) supported
  * @modes: array of pointers to strings containing name of each format
@@ -1652,9 +1652,9 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
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
@@ -1737,7 +1737,7 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
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
index f18c2ba113d7..5913b8415137 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1807,9 +1807,9 @@ int drm_mode_create_dvi_i_properties(struct drm_device *dev);
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
