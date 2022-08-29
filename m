Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABECF5A4D3F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5910F223;
	Mon, 29 Aug 2022 13:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75A10F208
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 50F762B06051;
 Mon, 29 Aug 2022 09:13:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778781; x=
 1661785981; bh=pUcO8T1pRwVJWUV8j5AkJO7nJ/phgtzS7l6oijEk91k=; b=h
 jk77p72PHGwqdvEqsHEDJdrp59h9UVzI4KyqYLcBOusFW5OUwh2WxIopUiZEJZEb
 A7rJHnP2caSC+4AtlMk+IahxrWomMpNX4ZzZm+8WC8cgznTps1HzPbdPTtGMYFJk
 9Z+E6kvgNMam9sNTsVVt/27/Y6XSd8b14Io+0F1wYV6A+oV06Q373O7cg/98YWF4
 QC5YfoFiyFrpS474bfT4V+n0ox9tzkU4KGIdxtHe07Ko3WESplL0Z2VZasehYSM8
 Pfmc/ANOTJrUFaxUtCfEf101vXS63YS4p3BM50RUj6TEeQFc8HeZCkVM/OVL+zK/
 foCTww06TxuT1OWKdaiSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778781; x=
 1661785981; bh=pUcO8T1pRwVJWUV8j5AkJO7nJ/phgtzS7l6oijEk91k=; b=Y
 xREWxW9XhwrXljndhgR4ufOrG6NShB8SW5oLtNps8h7Xl9eJdide4pX4jCYGIHAn
 ogpI2Aggdgnv/EsAdSmRVvUhx8V6AmuPEB20Js4jTCBuJCBdxA3KuY2C38Iy6pOv
 26EgWBIIZkYPe57SDvDrnlocVM/0VeAsecBCL+scrBSDRqubuiPQYVtVTxeVErQA
 tHGguaMYQKnFJ7U6qB44j5B8KqzJjoJH5p+JT0yHrZMp1bhJbuqt2kWtdzyEYI5M
 vi+S0bFPBNBMdEHU9sgtAlwa4GEAJCFigcv6XLW2T97vH8w6/MhyMx0QFSXpeq4S
 e3PrtU58lkQKhj2KjCsZQ==
X-ME-Sender: <xms:XbsMY1IOm06iklowNKvXiOFGxFeuPBL4ciNk-OuatR2pABhqIeqQpQ>
 <xme:XbsMYxLhcF4jjLhgbZcFCxiZhpd9rfCTwBU8mP7OcgQK4oklHLPzdVDMS8zGZardk
 42GQ_4tzOczloVXYYk>
X-ME-Received: <xmr:XbsMY9tYPrClzLNcxPqSsb5FwWc1U3SXxM3o7-sk_lbfjHNhHmPx8vmBOAAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XbsMY2YDKCeAFL5B0MUOOpJksiZ8d4G3zttS6QQt2xPnaqgRP5YmmA>
 <xmx:XbsMY8baYnFQanNCA6oalQRlhyiCrr9Gu_nyxsd-6jsgP4HxShxhlQ>
 <xmx:XbsMY6CmE_ubcd-CkJXp8hIYzKzBXXS2EQbJAJvjcRV_iVKwiPu06A>
 <xmx:XbsMY6wk-RLUvqxjqwv3sSjZ6C6zHgThlFMKYSIt9w-zXutRqp1s6JPI4Ak>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:00 -0400 (EDT)
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
Subject: [PATCH v2 09/41] drm/connector: Add TV standard property
Date: Mon, 29 Aug 2022 15:11:23 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=11994; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0imIXTKfc8i6bjpLPiDjTCY1QehnDS9P83WB+hmMDZk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+Q/JdoJu7KuXb828Py/u8+Ytsa/9dr5ZOaWss9fHgak
 cSfbdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiN5IYGWZIaBw4P4XB9paW4IIpnY
 tFc1ZEH7zvnXj2o7/62vrJE64zMtxr+Hw1s/dsQeq64P6L651XiFyVOxxRv3v31YWBnYeVj7IAAA==
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

The TV mode property has been around for a while now to select and get the=
=0D
current TV mode output on an analog TV connector.=0D
=0D
Despite that property name being generic, its content isn't and has been=0D
driver-specific which makes it hard to build any generic behaviour on top=0D
of it, both in kernel and user-space.=0D
=0D
Let's create a new bitmask tv norm property, that can contain any of the=0D
analog TV standards currently supported by kernel drivers. Each driver can=
=0D
then pass in a bitmask of the modes it supports.=0D
=0D
We'll then be able to phase out the older tv mode property.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c=0D
index 7f2b9a07fbdf..d867e7f9f2cd 100644=0D
--- a/drivers/gpu/drm/drm_atomic_uapi.c=0D
+++ b/drivers/gpu/drm/drm_atomic_uapi.c=0D
@@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,=0D
 		state->tv.margins.bottom =3D val;=0D
 	} else if (property =3D=3D config->legacy_tv_mode_property) {=0D
 		state->tv.legacy_mode =3D val;=0D
+	} else if (property =3D=3D config->tv_mode_property) {=0D
+		state->tv.mode =3D val;=0D
 	} else if (property =3D=3D config->tv_brightness_property) {=0D
 		state->tv.brightness =3D val;=0D
 	} else if (property =3D=3D config->tv_contrast_property) {=0D
@@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector =
*connector,=0D
 		*val =3D state->tv.margins.bottom;=0D
 	} else if (property =3D=3D config->legacy_tv_mode_property) {=0D
 		*val =3D state->tv.legacy_mode;=0D
+	} else if (property =3D=3D config->tv_mode_property) {=0D
+		*val =3D state->tv.mode;=0D
 	} else if (property =3D=3D config->tv_brightness_property) {=0D
 		*val =3D state->tv.brightness;=0D
 	} else if (property =3D=3D config->tv_contrast_property) {=0D
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c=0D
index 4e4fbc9e0049..b1fcacd150e8 100644=0D
--- a/drivers/gpu/drm/drm_connector.c=0D
+++ b/drivers/gpu/drm/drm_connector.c=0D
@@ -980,6 +980,29 @@ static const struct drm_prop_enum_list drm_dvi_i_subco=
nnector_enum_list[] =3D {=0D
 DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,=0D
 		 drm_dvi_i_subconnector_enum_list)=0D
 =0D
+static const struct drm_prop_enum_list drm_tv_mode_enum_list[] =3D {=0D
+	{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },=0D
+	{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },=0D
+	{ DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },=0D
+	{ DRM_MODE_TV_MODE_PAL_60, "PAL-60" },=0D
+	{ DRM_MODE_TV_MODE_PAL_B, "PAL-B" },=0D
+	{ DRM_MODE_TV_MODE_PAL_D, "PAL-D" },=0D
+	{ DRM_MODE_TV_MODE_PAL_G, "PAL-G" },=0D
+	{ DRM_MODE_TV_MODE_PAL_H, "PAL-H" },=0D
+	{ DRM_MODE_TV_MODE_PAL_I, "PAL-I" },=0D
+	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },=0D
+	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },=0D
+	{ DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },=0D
+	{ DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },=0D
+};=0D
+DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)=0D
+=0D
 static const struct drm_prop_enum_list drm_tv_select_enum_list[] =3D {=0D
 	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */=
=0D
 	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */=0D
@@ -1645,6 +1668,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);=
=0D
  * responsible for allocating a list of format names and passing them to=0D
  * this routine.=0D
  *=0D
+ * NOTE: This functions registers the deprecated "mode" connector=0D
+ * property to select the analog TV mode (ie, NTSC, PAL, etc.). New=0D
+ * drivers must use drm_mode_create_tv_properties() instead.=0D
+ *=0D
  * Returns:=0D
  * 0 on success or a negative error code on failure.=0D
  */=0D
@@ -1686,7 +1713,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_d=
evice *dev,=0D
 	if (drm_mode_create_tv_margin_properties(dev))=0D
 		goto nomem;=0D
 =0D
-=0D
 	if (num_modes) {=0D
 		dev->mode_config.legacy_tv_mode_property =3D=0D
 			drm_property_create(dev, DRM_MODE_PROP_ENUM,=0D
@@ -1735,6 +1761,46 @@ int drm_mode_create_tv_properties_legacy(struct drm_=
device *dev,=0D
 }=0D
 EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);=0D
 =0D
+/**=0D
+ * drm_mode_create_tv_properties - create TV specific connector properties=
=0D
+ * @dev: DRM device=0D
+ * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MOD=
E_*)=0D
+=0D
+ * Called by a driver's TV initialization routine, this function creates=0D
+ * the TV specific connector properties for a given device.  Caller is=0D
+ * responsible for allocating a list of format names and passing them to=0D
+ * this routine.=0D
+ *=0D
+ * Returns:=0D
+ * 0 on success or a negative error code on failure.=0D
+ */=0D
+int drm_mode_create_tv_properties(struct drm_device *dev,=0D
+				  unsigned int supported_tv_modes)=0D
+{=0D
+	struct drm_prop_enum_list tv_mode_list[DRM_MODE_TV_MODE_MAX];=0D
+	struct drm_property *tv_mode;=0D
+	unsigned int i, len =3D 0;=0D
+=0D
+	for (i =3D 0; i < DRM_MODE_TV_MODE_MAX; i++) {=0D
+		if (!(supported_tv_modes & BIT(i)))=0D
+			continue;=0D
+=0D
+		tv_mode_list[len].type =3D i;=0D
+		tv_mode_list[len].name =3D drm_get_tv_mode_name(i);=0D
+		len++;=0D
+	}=0D
+=0D
+	tv_mode =3D drm_property_create_enum(dev, 0, "TV mode",=0D
+					   tv_mode_list, len);=0D
+	if (!tv_mode)=0D
+		return -ENOMEM;=0D
+=0D
+	dev->mode_config.tv_mode_property =3D tv_mode;=0D
+=0D
+	return drm_mode_create_tv_properties_legacy(dev, 0, NULL);=0D
+}=0D
+EXPORT_SYMBOL(drm_mode_create_tv_properties);=0D
+=0D
 /**=0D
  * drm_mode_create_scaling_mode_property - create scaling mode property=0D
  * @dev: DRM device=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index d566b4a4709c..7d3881f35e7c 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -143,6 +143,144 @@ enum subpixel_order {=0D
 =0D
 };=0D
 =0D
+/**=0D
+ * enum drm_connector_tv_mode - Analog TV output mode=0D
+ *=0D
+ * This enum is used to indicate the TV output mode used on an analog TV=0D
+ * connector.=0D
+ *=0D
+ * WARNING: The values of this enum is uABI since they're exposed in the=0D
+ * "TV mode" connector property.=0D
+ */=0D
+enum drm_connector_tv_mode {=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_NTSC_443: Variant of=0D
+	 * @DRM_MODE_TV_MODE_NTSC_M. Uses a color subcarrier frequency=0D
+	 * of 4.43 MHz.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_NTSC_443 =3D 0,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_NTSC_J: Variant of @DRM_MODE_TV_MODE_NTSC_M=0D
+	 * used in Japan. Uses a black level equals to the blanking=0D
+	 * level.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_NTSC_J,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_NTSC_M: CCIR System M (aka 525-lines)=0D
+	 * together with the NTSC Color Encoding.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_NTSC_M,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_60: CCIR System M (aka 525-lines)=0D
+	 * together with the PAL color encoding and color subcarrier=0D
+	 * frequency.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_60,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_B: CCIR System B together with the PAL=0D
+	 * color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_B,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_D: CCIR System D together with the PAL=0D
+	 * color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_D,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_G: CCIR System G together with the PAL=0D
+	 * color system. Similar to @DRM_MODE_TV_MODE_PAL_B but uses a=0D
+	 * different channel bandwidth and transmission band.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_G,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_H: CCIR System H together with the PAL=0D
+	 * color system. Similar to @DRM_MODE_TV_MODE_PAL_G but uses a=0D
+	 * narrower lower side band.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_H,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_I: CCIR System I together with the PAL=0D
+	 * color system. Similar to @DRM_MODE_TV_MODE_PAL_B, but with a=0D
+	 * different audio encoding.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_I,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_M: CCIR System M (aka 525-lines)=0D
+	 * together with the PAL color encoding=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_M,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_N: CCIR System N together with the PAL=0D
+	 * color encoding. It uses 625 lines, but has a color subcarrier=0D
+	 * frequency of 3.58MHz, the SECAM color space, and narrower=0D
+	 * channels compared to most of the other PAL variants.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_N,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_PAL_NC: Seems equivalent to=0D
+	 * @DRM_MODE_TV_MODE_PAL_N.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_PAL_NC,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_60: CCIR System M (aka 525-lines)=0D
+	 * together with the SECAM color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_60,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_B: CCIR System B together with the=0D
+	 * SECAM color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_B,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_D: CCIR System D together with the=0D
+	 * SECAM color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_D,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_G: CCIR System G together with the=0D
+	 * SECAM color system. Similar to @DRM_MODE_TV_MODE_SECAM_B but=0D
+	 * uses a different channel bandwidth and transmission band.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_G,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_K: CCIR System G together with the=0D
+	 * SECAM color system. Similar to @DRM_MODE_TV_MODE_SECAM_G but=0D
+	 * with different channels.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_K,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_K1: CCIR System G together with the=0D
+	 * SECAM color system. Similar to @DRM_MODE_TV_MODE_SECAM_G and=0D
+	 * @DRM_MODE_TV_MODE_SECAM_K but with different channels.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_K1,=0D
+=0D
+	/**=0D
+	 * @DRM_MODE_TV_MODE_SECAM_L: CCIR System L together with the=0D
+	 * SECAM color system.=0D
+	 */=0D
+	DRM_MODE_TV_MODE_SECAM_L,=0D
+=0D
+	DRM_MODE_TV_MODE_MAX,=0D
+};=0D
+=0D
 /**=0D
  * struct drm_scrambling: sink's scrambling support.=0D
  */=0D
@@ -696,6 +834,7 @@ struct drm_connector_tv_margins {=0D
  * @subconnector: detected subconnector=0D
  * @margins: TV margins=0D
  * @legacy_mode: Legacy TV mode, driver specific value=0D
+ * @mode: TV mode=0D
  * @brightness: brightness in percent=0D
  * @contrast: contrast in percent=0D
  * @flicker_reduction: flicker reduction in percent=0D
@@ -708,6 +847,7 @@ struct drm_tv_connector_state {=0D
 	enum drm_mode_subconnector subconnector;=0D
 	struct drm_connector_tv_margins margins;=0D
 	unsigned int legacy_mode;=0D
+	unsigned int mode;=0D
 	unsigned int brightness;=0D
 	unsigned int contrast;=0D
 	unsigned int flicker_reduction;=0D
@@ -1789,6 +1929,7 @@ const char *drm_get_subpixel_order_name(enum subpixel=
_order order);=0D
 const char *drm_get_dpms_name(int val);=0D
 const char *drm_get_dvi_i_subconnector_name(int val);=0D
 const char *drm_get_dvi_i_select_name(int val);=0D
+const char *drm_get_tv_mode_name(int val);=0D
 const char *drm_get_tv_subconnector_name(int val);=0D
 const char *drm_get_tv_select_name(int val);=0D
 const char *drm_get_dp_subconnector_name(int val);=0D
@@ -1802,6 +1943,8 @@ int drm_mode_create_tv_margin_properties(struct drm_d=
evice *dev);=0D
 int drm_mode_create_tv_properties_legacy(struct drm_device *dev,=0D
 					 unsigned int num_modes,=0D
 					 const char * const modes[]);=0D
+int drm_mode_create_tv_properties(struct drm_device *dev,=0D
+				  unsigned int supported_tv_modes);=0D
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn)=
;=0D
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);=0D
 int drm_connector_attach_content_type_property(struct drm_connector *dev);=
=0D
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h=
=0D
index 35a827175c24..10a6f7d1df0d 100644=0D
--- a/include/drm/drm_mode_config.h=0D
+++ b/include/drm/drm_mode_config.h=0D
@@ -718,9 +718,17 @@ struct drm_mode_config {=0D
 	/**=0D
 	 * @legacy_tv_mode_property: Optional TV property to select=0D
 	 * the output TV mode.=0D
+	 *=0D
+	 * Superseeded by @tv_mode_property=0D
 	 */=0D
 	struct drm_property *legacy_tv_mode_property;=0D
 =0D
+	/**=0D
+	 * @tv_mode_property: Optional TV property to select the TV=0D
+	 * standard output on the connector.=0D
+	 */=0D
+	struct drm_property *tv_mode_property;=0D
+=0D
 	/**=0D
 	 * @tv_left_margin_property: Optional TV property to set the left=0D
 	 * margin (expressed in pixels).=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
