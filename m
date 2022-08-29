Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD25A4D33
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCE610F212;
	Mon, 29 Aug 2022 13:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E625510F208
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BDAC82B05FE1;
 Mon, 29 Aug 2022 09:12:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778774; x=
 1661785974; bh=si1bxfjnPtaos7SJL98QtkJ8dTa2iY1UsDoYupVOIdM=; b=I
 w1oPqsTN19R6VHLf19/FJnFt4RFNQ7A+zkVzHAn/IZj5EUerbJqWSnksBaGzaBw/
 pRjAjqGEYh513ztuCGUa3gZxIj1SZ8xhDxH3vlAvfm89rxW1hOVhOyRQwWwWgylz
 1ZlQly0e/ZHrVo4OJr6mDftH34oOp52tz/CGNXSVRfx2A/a/3y777FgDFh0MsCsN
 AswcV0i+rqV2dPLd8pHxiJP7mX8zI5BCW5tLFQoLaeLFDFoWFs81Fo58qwswMug6
 xjTQIDG1R8WR+VEvXbg1M18mCUjLR8dOReFyhNafBSyu6jOPxG66bxnXBuTF51xz
 PVBFmdFKxu4bjtSpS2X1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778774; x=
 1661785974; bh=si1bxfjnPtaos7SJL98QtkJ8dTa2iY1UsDoYupVOIdM=; b=m
 y2C5fajjs/QBAychTGS3E74Kj9nKt8Q73wTijKEJB/JbotqX0VZdf+1RrSD1daqj
 KS6iHQQp/p/ZnYdWIRmHvuWKADD1zcEoPV7qtibW7gzY0KOOCIcdLTPc4sZP5Hwr
 3zjj+yJGfIkO8wo8FB4vnAzU/z7kncaGVVJHrsWH0aFFMYf6z9R0FP+GNKkUW+Ap
 uiC6W/ul6HQjZbNYQQvY5RkVOD1j5h3W9MSbKFubLLPJSvrMDHd/1u/AMsKs+NsO
 3u5OehM/X35ZuyMsrgBKRKov8WS+yLctRs/KAOcdVnYifauiG6C3DCFYbOcJREnR
 5K+iPz3pRk8kW7sWcRHOA==
X-ME-Sender: <xms:VrsMY9QGb75OwOCR69hhjWd4FMo2mU5rwJWPibE_oVIQbTVCIavPeQ>
 <xme:VrsMY2x8zkBAOb2NWj5BiN8lwie4M45T1G2SHRVl2ySgzJkggnvVshZL_7Siy4fCX
 KJNJ7RLftARVtsIVBA>
X-ME-Received: <xmr:VrsMYy1apG67uWeYixoT_Yvh0G28mOU2MjiHfTwJ-yEhFY_6KxDu4Tc5134_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VrsMY1A_XjFN6p2yzhWmy9qYpITusdg3NCPQ-NDVbtpqTVNnEA_ysQ>
 <xmx:VrsMY2iZBqz4isnfskUqRfbiaosWsgXU5DO1yutoYfEzvjYOAkDxpg>
 <xmx:VrsMY5pdaUmwe3txiLqC4j-tbzX8JMVHvSZ3DwymDC9W3Db_NGo_ag>
 <xmx:VrsMYzYC_AEK1IXU3cFnMBRmRclYxXF7vIFp-NmAjf1RC-IQr7Z6-6dG-Bo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:53 -0400 (EDT)
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
Subject: [PATCH v2 08/41] drm/connector: Rename drm_mode_create_tv_properties
Date: Mon, 29 Aug 2022 15:11:22 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-8-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=6689; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+iw2nStSubC0VD5uVsPkdKLlphYI/bRQ+mbI4HQjANY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+Q3e27PFroTff9lujFHUW/LBjnD5PmP9tloZWy5ru8s
 O9ero5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOpz2RkWLqy2+yn6oznd6UYNoe/Nl
 jKsd5bd9KxHO2s/i0GW38fv8LI8K2j58o0BY3gm31TnA7nRa+9++mH1r8ART/e/V7e57yvsQMA
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

drm_mode_create_tv_properties(), among other things, will create the=0D
"mode" property that stores the analog TV mode that connector is=0D
supposed to output.=0D
=0D
However, that property is getting deprecated, so let's rename that=0D
function to mention it's deprecated. We'll introduce a new variant of=0D
that function creating the property superseeding it in a later patch.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c=0D
index 17a5913cefe3..4e4fbc9e0049 100644=0D
--- a/drivers/gpu/drm/drm_connector.c=0D
+++ b/drivers/gpu/drm/drm_connector.c=0D
@@ -1600,7 +1600,7 @@ EXPORT_SYMBOL(drm_connector_attach_tv_margin_properti=
es);=0D
  * Called by a driver's HDMI connector initialization routine, this functi=
on=0D
  * creates the TV margin properties for a given device. No need to call th=
is=0D
  * function for an SDTV connector, it's already called from=0D
- * drm_mode_create_tv_properties().=0D
+ * drm_mode_create_tv_properties_legacy().=0D
  *=0D
  * Returns:=0D
  * 0 on success or a negative error code on failure.=0D
@@ -1635,7 +1635,7 @@ int drm_mode_create_tv_margin_properties(struct drm_d=
evice *dev)=0D
 EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);=0D
 =0D
 /**=0D
- * drm_mode_create_tv_properties - create TV specific connector properties=
=0D
+ * drm_mode_create_tv_properties_legacy - create TV specific connector pro=
perties=0D
  * @dev: DRM device=0D
  * @num_modes: number of different TV formats (modes) supported=0D
  * @modes: array of pointers to strings containing name of each format=0D
@@ -1648,9 +1648,9 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);=
=0D
  * Returns:=0D
  * 0 on success or a negative error code on failure.=0D
  */=0D
-int drm_mode_create_tv_properties(struct drm_device *dev,=0D
-				  unsigned int num_modes,=0D
-				  const char * const modes[])=0D
+int drm_mode_create_tv_properties_legacy(struct drm_device *dev,=0D
+					 unsigned int num_modes,=0D
+					 const char * const modes[])=0D
 {=0D
 	struct drm_property *tv_selector;=0D
 	struct drm_property *tv_subconnector;=0D
@@ -1733,7 +1733,7 @@ int drm_mode_create_tv_properties(struct drm_device *=
dev,=0D
 nomem:=0D
 	return -ENOMEM;=0D
 }=0D
-EXPORT_SYMBOL(drm_mode_create_tv_properties);=0D
+EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);=0D
 =0D
 /**=0D
  * drm_mode_create_scaling_mode_property - create scaling mode property=0D
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_=
connector.c=0D
index caf82e9095b4..4026eb0132bd 100644=0D
--- a/drivers/gpu/drm/gud/gud_connector.c=0D
+++ b/drivers/gpu/drm/gud/gud_connector.c=0D
@@ -400,7 +400,7 @@ static int gud_connector_add_tv_mode(struct gud_device =
*gdrm, struct drm_connect=0D
 	for (i =3D 0; i < num_modes; i++)=0D
 		modes[i] =3D &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];=0D
 =0D
-	ret =3D drm_mode_create_tv_properties(connector->dev, num_modes, modes);=
=0D
+	ret =3D drm_mode_create_tv_properties_legacy(connector->dev, num_modes, m=
odes);=0D
 free:=0D
 	kfree(buf);=0D
 	if (ret < 0)=0D
@@ -539,7 +539,7 @@ static int gud_connector_add_properties(struct gud_devi=
ce *gdrm, struct gud_conn=0D
 			fallthrough;=0D
 		case GUD_PROPERTY_TV_HUE:=0D
 			/* This is a no-op if already added. */=0D
-			ret =3D drm_mode_create_tv_properties(drm, 0, NULL);=0D
+			ret =3D drm_mode_create_tv_properties_legacy(drm, 0, NULL);=0D
 			if (ret)=0D
 				goto out;=0D
 			break;=0D
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_=
drv.c=0D
index d29b63fd6178..506f6f932518 100644=0D
--- a/drivers/gpu/drm/i2c/ch7006_drv.c=0D
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c=0D
@@ -250,7 +250,7 @@ static int ch7006_encoder_create_resources(struct drm_e=
ncoder *encoder,=0D
 	struct drm_device *dev =3D encoder->dev;=0D
 	struct drm_mode_config *conf =3D &dev->mode_config;=0D
 =0D
-	drm_mode_create_tv_properties(dev, NUM_TV_NORMS, ch7006_tv_norm_names);=0D
+	drm_mode_create_tv_properties_legacy(dev, NUM_TV_NORMS, ch7006_tv_norm_na=
mes);=0D
 =0D
 	priv->scale_property =3D drm_property_create_range(dev, 0, "scale", 0, 2)=
;=0D
 	if (!priv->scale_property)=0D
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915=
/display/intel_tv.c=0D
index 9379f3463344..7fd2c6f01ad6 100644=0D
--- a/drivers/gpu/drm/i915/display/intel_tv.c=0D
+++ b/drivers/gpu/drm/i915/display/intel_tv.c=0D
@@ -1984,7 +1984,7 @@ intel_tv_init(struct drm_i915_private *dev_priv)=0D
 =0D
 		tv_format_names[i] =3D tv_modes[i].name;=0D
 	}=0D
-	drm_mode_create_tv_properties(dev, i, tv_format_names);=0D
+	drm_mode_create_tv_properties_legacy(dev, i, tv_format_names);=0D
 =0D
 	drm_object_attach_property(&connector->base, dev->mode_config.tv_mode_pro=
perty,=0D
 				   state->tv.mode);=0D
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/no=
uveau/dispnv04/tvnv17.c=0D
index 1a15534adc60..e5480dab55e3 100644=0D
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c=0D
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c=0D
@@ -653,7 +653,7 @@ static int nv17_tv_create_resources(struct drm_encoder =
*encoder,=0D
 			tv_enc->tv_norm =3D i;=0D
 	}=0D
 =0D
-	drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);=0D
+	drm_mode_create_tv_properties_legacy(dev, num_tv_norms, nv17_tv_norm_name=
s);=0D
 =0D
 	drm_object_attach_property(&connector->base,=0D
 					conf->tv_select_subconnector_property,=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index dc33b7b9ce5e..d5140fe0be4f 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -573,8 +573,9 @@ static int vc4_vec_bind(struct device *dev, struct devi=
ce *master, void *data)=0D
 	struct vc4_vec *vec;=0D
 	int ret;=0D
 =0D
-	ret =3D drm_mode_create_tv_properties(drm, ARRAY_SIZE(tv_mode_names),=0D
-					    tv_mode_names);=0D
+	ret =3D drm_mode_create_tv_properties_legacy(drm,=0D
+						   ARRAY_SIZE(tv_mode_names),=0D
+						   tv_mode_names);=0D
 	if (ret)=0D
 		return ret;=0D
 =0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 5cfad8b6ad83..d566b4a4709c 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -1799,9 +1799,9 @@ int drm_mode_create_dvi_i_properties(struct drm_devic=
e *dev);=0D
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *c=
onnector);=0D
 =0D
 int drm_mode_create_tv_margin_properties(struct drm_device *dev);=0D
-int drm_mode_create_tv_properties(struct drm_device *dev,=0D
-				  unsigned int num_modes,=0D
-				  const char * const modes[]);=0D
+int drm_mode_create_tv_properties_legacy(struct drm_device *dev,=0D
+					 unsigned int num_modes,=0D
+					 const char * const modes[]);=0D
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn)=
;=0D
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);=0D
 int drm_connector_attach_content_type_property(struct drm_connector *dev);=
=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
