Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338205E6538
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5610EB66;
	Thu, 22 Sep 2022 14:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F6010EB67;
 Thu, 22 Sep 2022 14:26:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 17D1D2B05B1D;
 Thu, 22 Sep 2022 10:26:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Sep 2022 10:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856795; x=
 1663863995; bh=tV2yc3EZpFToTHAc3rLpWp8kLQb5xK+ucBkyIPLx9qA=; b=D
 TiuzyJvvDv8dQcJ9DKgArXAvkmuwTzY6AcqIeX1uYacTThNB9Yp5pBk1vB1AyMy+
 GDaDiXXZfpQA8+Mqfo+eEVb3L89HZHZmAQKbbcO47hbEsxzs5ui35FwDcpxCMCWJ
 vRJE3QkGBVA0Y0JYcfC9dL5FiXcpdXwm1eH8VVeQXWoG3Nz1J+xsyWtD5B/ymJEm
 F80zRj57/PrWPBVEbXo6U8qKlvmFOkKxPlmOfMRDLWMpqqND5QetqlW9GaUmH2hX
 XGlmOevb8Ionm6msYO0kk3Ob+R3S5wme4av4LKKsP8AfcP1EI3h1mKROyfeTrCHH
 5tSCH0nA1N5ocYUFo86UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856795; x=
 1663863995; bh=tV2yc3EZpFToTHAc3rLpWp8kLQb5xK+ucBkyIPLx9qA=; b=O
 hqgutTZKYjnyllquwVmGFBlAmgE1PYmgdmo6tYp8b/UeHgcqX3eZYiJ9assYCX92
 PMdR0OdHOMqPNci3JUQ+6TaY5IfEgcEXVYLNkc0CcaYGVxX1ERo22x1tCDljHeYD
 pHKYR4nsiFLIKl9ZMKCZrCGJqPu0ZbidP8UwWZrMHhJ0w7fKB1xbGWtwJAkX2myq
 jmcshg8zwgBQN10XlmGwcMMHV6V0gbQnI6pHDEFcDUn367KUBRDEYzGHW2e7QVk1
 LRMCPYJzUnXwtKUaxhk8o8flioi6jHGirEY3OBwwF5UgX8JIKT9iqC99/Fw6l0zJ
 ffpyOrEowYWk8pSAnaIHQ==
X-ME-Sender: <xms:m3AsYyzRkaZzzFgLPa0l09Qdz8-6ilY3wc6gdJ5Aki3LlgB_ikUkQQ>
 <xme:m3AsY-SziTKb73uhK2_bdyeOHnoHuZBAHbEgKh8i0zsHRHDyk1H8h6Pj-LwdJFe_C
 6cAUb_IZeL47_36wHg>
X-ME-Received: <xmr:m3AsY0XI0MESrlgtXDvtAKKhobSXY1OnImeg97budnqG7Yo4Hz7BPxEaYfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:m3AsY4ivUtSc0bU7hdGTKzuBdVNJQlF8Wk3s8GzAgLtZaiZBsMHE-Q>
 <xmx:m3AsY0CxjK7Qk-1H5sy0lT9xNrf5mEYaMktny6h9Jn0p07VE-zzJCg>
 <xmx:m3AsY5KUDSGA3YWQRPse0YMq1MHHN_iqRNyXbcJ-PW-QDKNIkT9fSg>
 <xmx:m3AsY9sA8K5aQmbxOPClA2LVLS1kHJdVk80-x8O4qfkwjexyB1kuewiQrG4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:26 +0200
Subject: [PATCH v2 09/33] drm/connector: Add TV standard property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-9-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9548; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=BIsPokfQPt+am42KHiiQMKtBHhDUgZqrU7zUZAs1ZU0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQFyB9vyIySTP5+4E3x2buRvf7FXv263+xl7PU54fXKW
 9NE3HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI7UFGhs5DTNaXZ6ruL3ubG6HdFh
 n8bp62tnanlbxtyC7dZ1fvTGJkmNXZe8Rg3YrmGNcfLx0bNZhfOq+YvnD5lBkWDmff71bsZgUA
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

The TV mode property has been around for a while now to select and get the
current TV mode output on an analog TV connector.

Despite that property name being generic, its content isn't and has been
driver-specific which makes it hard to build any generic behaviour on top
of it, both in kernel and user-space.

Let's create a new enum tv norm property, that can contain any of the
analog TV standards currently supported by kernel drivers. Each driver can
then pass in a bitmask of the modes it supports, and the property
creation function will filter out the modes not supported.

We'll then be able to phase out the older tv mode property.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7f2b9a07fbdf..d867e7f9f2cd 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->tv.margins.bottom = val;
 	} else if (property == config->legacy_tv_mode_property) {
 		state->tv.legacy_mode = val;
+	} else if (property == config->tv_mode_property) {
+		state->tv.mode = val;
 	} else if (property == config->tv_brightness_property) {
 		state->tv.brightness = val;
 	} else if (property == config->tv_contrast_property) {
@@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->tv.margins.bottom;
 	} else if (property == config->legacy_tv_mode_property) {
 		*val = state->tv.legacy_mode;
+	} else if (property == config->tv_mode_property) {
+		*val = state->tv.mode;
 	} else if (property == config->tv_brightness_property) {
 		*val = state->tv.brightness;
 	} else if (property == config->tv_contrast_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4e4fbc9e0049..e7aa8de08f5b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -980,6 +980,18 @@ static const struct drm_prop_enum_list drm_dvi_i_subconnector_enum_list[] = {
 DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,
 		 drm_dvi_i_subconnector_enum_list)
 
+static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
+	{ DRM_MODE_TV_MODE_NONE, "None" },
+	{ DRM_MODE_TV_MODE_NTSC, "NTSC" },
+	{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
+	{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
+	{ DRM_MODE_TV_MODE_PAL, "PAL" },
+	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
+	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
+	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
+};
+DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
+
 static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
 	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
@@ -1645,6 +1657,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
  * responsible for allocating a list of format names and passing them to
  * this routine.
  *
+ * NOTE: This functions registers the deprecated "mode" connector
+ * property to select the analog TV mode (ie, NTSC, PAL, etc.). New
+ * drivers must use drm_mode_create_tv_properties() instead.
+ *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
@@ -1686,7 +1702,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-
 	if (num_modes) {
 		dev->mode_config.legacy_tv_mode_property =
 			drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -1735,6 +1750,49 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);
 
+/**
+ * drm_mode_create_tv_properties - create TV specific connector properties
+ * @dev: DRM device
+ * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
+
+ * Called by a driver's TV initialization routine, this function creates
+ * the TV specific connector properties for a given device.  Caller is
+ * responsible for allocating a list of format names and passing them to
+ * this routine.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_mode_create_tv_properties(struct drm_device *dev,
+				  unsigned int supported_tv_modes)
+{
+	struct drm_prop_enum_list tv_mode_list[DRM_MODE_TV_MODE_MAX];
+	struct drm_property *tv_mode;
+	unsigned int i, len = 0;
+
+	if (dev->mode_config.tv_mode_property)
+		return 0;
+
+	for (i = 0; i < DRM_MODE_TV_MODE_MAX; i++) {
+		if (!(supported_tv_modes & BIT(i)))
+			continue;
+
+		tv_mode_list[len].type = i;
+		tv_mode_list[len].name = drm_get_tv_mode_name(i);
+		len++;
+	}
+
+	tv_mode = drm_property_create_enum(dev, 0, "TV mode",
+					   tv_mode_list, len);
+	if (!tv_mode)
+		return -ENOMEM;
+
+	dev->mode_config.tv_mode_property = tv_mode;
+
+	return drm_mode_create_tv_properties_legacy(dev, 0, NULL);
+}
+EXPORT_SYMBOL(drm_mode_create_tv_properties);
+
 /**
  * drm_mode_create_scaling_mode_property - create scaling mode property
  * @dev: DRM device
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d566b4a4709c..fffacbfd0a45 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -143,6 +143,71 @@ enum subpixel_order {
 
 };
 
+/**
+ * enum drm_connector_tv_mode - Analog TV output mode
+ *
+ * This enum is used to indicate the TV output mode used on an analog TV
+ * connector.
+ *
+ * WARNING: The values of this enum is uABI since they're exposed in the
+ * "TV mode" connector property.
+ */
+enum drm_connector_tv_mode {
+	/**
+	 * @DRM_MODE_TV_MODE_NONE: Placeholder to not default on one
+	 * variant or the other when nothing is set.
+	 */
+	DRM_MODE_TV_MODE_NONE = 0,
+
+	/**
+	 * @DRM_MODE_TV_MODE_NTSC: CCIR System M (aka 525-lines)
+	 * together with the NTSC Color Encoding.
+	 */
+	DRM_MODE_TV_MODE_NTSC,
+
+	/**
+	 * @DRM_MODE_TV_MODE_NTSC_443: Variant of
+	 * @DRM_MODE_TV_MODE_NTSC. Uses a color subcarrier frequency
+	 * of 4.43 MHz.
+	 */
+	DRM_MODE_TV_MODE_NTSC_443,
+
+	/**
+	 * @DRM_MODE_TV_MODE_NTSC_J: Variant of @DRM_MODE_TV_MODE_NTSC
+	 * used in Japan. Uses a black level equals to the blanking
+	 * level.
+	 */
+	DRM_MODE_TV_MODE_NTSC_J,
+
+	/**
+	 * @DRM_MODE_TV_MODE_PAL: CCIR System B together with the PAL
+	 * color system.
+	 */
+	DRM_MODE_TV_MODE_PAL,
+
+	/**
+	 * @DRM_MODE_TV_MODE_PAL_M: CCIR System M (aka 525-lines)
+	 * together with the PAL color encoding
+	 */
+	DRM_MODE_TV_MODE_PAL_M,
+
+	/**
+	 * @DRM_MODE_TV_MODE_PAL_N: CCIR System N together with the PAL
+	 * color encoding. It uses 625 lines, but has a color subcarrier
+	 * frequency of 3.58MHz, the SECAM color space, and narrower
+	 * channels compared to most of the other PAL variants.
+	 */
+	DRM_MODE_TV_MODE_PAL_N,
+
+	/**
+	 * @DRM_MODE_TV_MODE_SECAM: CCIR System B together with the
+	 * SECAM color system.
+	 */
+	DRM_MODE_TV_MODE_SECAM,
+
+	DRM_MODE_TV_MODE_MAX,
+};
+
 /**
  * struct drm_scrambling: sink's scrambling support.
  */
@@ -696,6 +761,7 @@ struct drm_connector_tv_margins {
  * @subconnector: detected subconnector
  * @margins: TV margins
  * @legacy_mode: Legacy TV mode, driver specific value
+ * @mode: TV mode
  * @brightness: brightness in percent
  * @contrast: contrast in percent
  * @flicker_reduction: flicker reduction in percent
@@ -708,6 +774,7 @@ struct drm_tv_connector_state {
 	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int legacy_mode;
+	unsigned int mode;
 	unsigned int brightness;
 	unsigned int contrast;
 	unsigned int flicker_reduction;
@@ -1789,6 +1856,7 @@ const char *drm_get_subpixel_order_name(enum subpixel_order order);
 const char *drm_get_dpms_name(int val);
 const char *drm_get_dvi_i_subconnector_name(int val);
 const char *drm_get_dvi_i_select_name(int val);
+const char *drm_get_tv_mode_name(int val);
 const char *drm_get_tv_subconnector_name(int val);
 const char *drm_get_tv_select_name(int val);
 const char *drm_get_dp_subconnector_name(int val);
@@ -1802,6 +1870,8 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev);
 int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 					 unsigned int num_modes,
 					 const char * const modes[]);
+int drm_mode_create_tv_properties(struct drm_device *dev,
+				  unsigned int supported_tv_modes);
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);
 int drm_connector_attach_content_type_property(struct drm_connector *dev);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 35a827175c24..10a6f7d1df0d 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -718,9 +718,17 @@ struct drm_mode_config {
 	/**
 	 * @legacy_tv_mode_property: Optional TV property to select
 	 * the output TV mode.
+	 *
+	 * Superseeded by @tv_mode_property
 	 */
 	struct drm_property *legacy_tv_mode_property;
 
+	/**
+	 * @tv_mode_property: Optional TV property to select the TV
+	 * standard output on the connector.
+	 */
+	struct drm_property *tv_mode_property;
+
 	/**
 	 * @tv_left_margin_property: Optional TV property to set the left
 	 * margin (expressed in pixels).

-- 
b4 0.10.0
