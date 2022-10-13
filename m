Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3D5FDA6B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DAC10E8B3;
	Thu, 13 Oct 2022 13:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA6110E241;
 Thu, 13 Oct 2022 13:19:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D677D580364;
 Thu, 13 Oct 2022 09:19:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 09:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667155; x=
 1665674355; bh=FFBPwicVOfdovTWgwGcmoNNnCSzKLqhiWMVMHuCzd40=; b=W
 mmsg/bejvVcgyo2Fv+H5d9VSASBtL2/4dOoxGgK7VkpUnB8WaN/UwR3cMLeG9lC8
 zil5q2uwhibi06a2h8U+oqnHohD/wz7bCBRJnlpOCB1JVYKuAOp92lm/ZAseMvIx
 s/YGKV4hBnERAsO62zinfhah5kYzJs+pJ2OuROowa2VI/9eNMESOQZOZFnEP7Hjc
 L+PNB6ticHQqQQ8j4qHK4t4no+wCj41oxu8r3mlnCAWOi2YbpI5UWlIRWKh4txNK
 z9f4GRIv9SSEVKTqY+kYrhgWRrX7OfuXnPAqMCMHEPZRGaslQywrYjaoqbgaAbPQ
 OphEppfAGuTpUdcElfeHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667155; x=
 1665674355; bh=FFBPwicVOfdovTWgwGcmoNNnCSzKLqhiWMVMHuCzd40=; b=g
 Da421L1TttjNxUUXY7cAzuJurWIx/4t+AppzA7uVi0Gwe4Kbx1HmQnVU0t0dCC9S
 g1lRKkTDmzhzo4Z39Jf2YXEKKPOYjBeDWx3XSa4Idy8NIDb/XRt3rtvhzv7wyAhr
 z22EdlKJPrp2EbSJk8s+suFircn/lrcaZzRuQ8H8UsbRe2VDsjn9ykf8JxOwiez6
 SLAyvvubUpW2XM2gVqtwTcZ1MUFsa2vcrRYx4AzsjRusGoc3KKMDiRdqfbePpkLp
 W09Cqcv24d+LWivWuz8YDdIwppaxl4x0nSa6UZKSlo9+oU5iZfWKl1rHZuXc6AWi
 Uo+kEgqXu7zUqsmafBTLA==
X-ME-Sender: <xms:UxBIY1oZuYcykRmuvIzkmo8jHCGG5HTivnOu-2Mx6cDc8dcELWnUyQ>
 <xme:UxBIY3rDhMnE2ZjFYP4dghl-pBmPMgMQOsjvrABn4Hqe1sCNKwdyXohVHRoVrM64M
 WqqRy1MsvRRuBMyon4>
X-ME-Received: <xmr:UxBIYyMv_wxNJFP3XL7hGWD0Uu_GEn5wSTVxyO63_i1ir3APiEgDSG_g128MwHuM8REwfItqX8blAeLnbLHBvokugB8Yw2S4UMMo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UxBIYw7wJ-BfUfwGrFzdbRvOEC9BXfL7CpRzHnb_hJw2O2_d3xWojg>
 <xmx:UxBIY06O2f_q8AOFBSLGcKfRQe703-VqkiFQNPJz-1rAwqXpgyUJIQ>
 <xmx:UxBIY4hHSrrZwET2eCbvnhA38Dd365fDr8mgtlvYvlVdANdw6NWlOg>
 <xmx:UxBIY5luIcw3C9r3GHmNeQaQ1ir3SaXdzqBDV-Oty9wUMK0Tp_xY5w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:48 +0200
Subject: [PATCH v5 04/22] drm/connector: Rename drm_mode_create_tv_properties
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v5-4-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=7225; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=h7WmiwOsGyhmJIXHBTRS5lsEIUYHcOKAtPc75t+bTb4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm5+y6SaNIR+tOgk/74+R2F+zYaDq+WLdopUtFgfVOU9
 9cino5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOx/cjwPzizNVM6cU+96dk5Fwt6Q8
 31HylMOTt7YvGbfZMfftx0tIaRofOcr4T6usKmy4t/nzxtn3QvZPKH7fMunHEq0rlwzuaPHQMA
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
b4 0.11.0-dev-7da52
