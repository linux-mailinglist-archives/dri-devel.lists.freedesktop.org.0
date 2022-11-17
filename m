Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520462D6D5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275E810E59D;
	Thu, 17 Nov 2022 09:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338D710E596;
 Thu, 17 Nov 2022 09:29:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 781EA2B069CC;
 Thu, 17 Nov 2022 04:29:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 04:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677351; x=
 1668684551; bh=+Spd56/gHd5EymxN/suT2t6HSnx4p8qKikhn7jcCbyI=; b=K
 km+iIuN8heNbyo2C6OnS8zuPfShY2A08cDYIw5COjvfhM7+vTGVWnZ2olf1yIbkm
 lL9fJXsmDbMT129Gz8S06e9V25lcuMG/ZScNTc4kByeQtPIYwIJJmuf/0R3Yp+z9
 H9/2917GugEDmNjjhyP2CYCSEVbRTzAPDV2ur/lFoDgSlnKjK3QfYqeKj9ctX1k6
 xv3bDI5Y4vXkOHZwBrzS5RKyZhBBxXrhTDWrJ3ZgIgEDhvaUto/wdD1QHEcMfGK0
 xCLHlwxAkGlBrix0rHQonX6dSMOl8n1S6cCvslf9uIDOF7Tvb2JPsZipB82rv/y0
 mezXJyBlGFe0A3cq6IrIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677351; x=
 1668684551; bh=+Spd56/gHd5EymxN/suT2t6HSnx4p8qKikhn7jcCbyI=; b=D
 KzQeMKR5GNQrV7gsWID69lzqGsob/2Br8qWk5WMFrIdT5ulIg2DbtquIqlSzRqlc
 rk7WvB9l7tebv08LTMyRACzMUHjX3ULvHohaIk00nLZ23YVv8QkSgKDxE9Dofcav
 XFXhh0qEPheANVx2pXoglSzAaexz6BCiJzJAoT2SpZc0Kgom+tYF4jD0hypezkMt
 7DgE8AM9zOgSaVS70HodMablprJkpdUN2mmNrLNbsB5wKJLpA6HomJ1lC9I8m+cu
 FT3pRMsRlJyIg9Z1sXJmfX6Jve0EVvnkZilmHhq/I6j2GjTQjtUw90LG9i+URwbu
 9f5kRUZw7tZIT6nC9E7RA==
X-ME-Sender: <xms:5v51Y_G9BeXGQf5E8wyJn-BY2thjjzM9G9DEprsTYW8qXhT05fFljg>
 <xme:5v51Y8WBOgxnUOB_72ahIP-ynTUlgfN2uaPdQr84ckGMk9eQxA-ey_IR1GLY8Xv0c
 BfsGO3fEmXYnO2gvVk>
X-ME-Received: <xmr:5v51YxKXfDSXVXid9AfsCYoyF2o1fO0NzCP75KkDbuB5VgfS2nDvR98NwUujpfPNF-rl7EOi7Xhq77NPrD86zM6cdTAluAylt3N8xv3iXlDVig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5v51Y9HqQW6eaDsNdQ_eD4RShVe-w8kX6IfMxKt_P-hI2b9UEXAqhg>
 <xmx:5v51Y1WF-B246gxN8N86uvfe3RYuQdVXNE9zQYFdLtE1KNXGne524Q>
 <xmx:5v51Y4O_3StHLTqE3WgcXRdzcjRaV8p4nxm_EH2-Y4mITE928gQBhQ>
 <xmx:5_51Y_hhN3e2Q2XYoeFanujgok5WtbEfqF520sffdhJKDm9yS9F4_cgqn0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:47 +0100
Subject: [PATCH v10 04/19] drm/connector: Rename drm_mode_create_tv_properties
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-4-256dad125326@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7326; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=zljsquhBhpe+mf3M/BH4YyDBy4qSxnf+fIvGUTPhROE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y5Efr4jUPfT8MnBwL8qm+eKl/z6UlxxuK7O9MTzdJ9c
 rnL9jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkshrD/+j2JbeiYyKniPp6T/nmf3
 zmMlszv16f3NwFT4KKDC6mnGdk+Lisi+sMo2/Evzt567/n3TP+f3xD3cQbGwVmH08p8ZN0YgIA
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

drm_mode_create_tv_properties(), among other things, will create the
"mode" property that stores the analog TV mode that connector is
supposed to output.

However, that property is getting deprecated, so let's rename that
function to mention it's deprecated. We'll introduce a new variant of
that function creating the property superseeding it in a later patch.

Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
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
index 78fcffae100b..06e737ed15f5 100644
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
index 9aff24e8e3b2..b9788218b2ec 100644
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
index 95b021da5a11..0affbc80ba89 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1903,7 +1903,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
 
 		tv_format_names[i] = tv_modes[i].name;
 	}
-	drm_mode_create_tv_properties(&i915->drm, i, tv_format_names);
+	drm_mode_create_tv_properties_legacy(&i915->drm, i, tv_format_names);
 
 	drm_object_attach_property(&connector->base,
 				   i915->drm.mode_config.legacy_tv_mode_property,
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
index 3d9a3ae33d3c..15cb58117a94 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1814,9 +1814,9 @@ int drm_mode_create_dvi_i_properties(struct drm_device *dev);
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
