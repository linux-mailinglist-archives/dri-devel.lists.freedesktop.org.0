Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E485EFAA5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9925710EAD0;
	Thu, 29 Sep 2022 16:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E8D10EAD0;
 Thu, 29 Sep 2022 16:31:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E7782580804;
 Thu, 29 Sep 2022 12:31:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469092; x=
 1664476292; bh=A+sS3I0hegu6sYrA9j71SlzBPxMAUYMSLyq1Y0VmBlA=; b=s
 fKcywChy6F/KsmmQ652gn26CU74C4vh/gv5d5AlVVijGKHY++1MwXoN7tYUxp9/P
 ItFE5jY72gi9ZRdCd+4sh8KBMcKp2Yr08M/9mMgwIHW7XAPrEIJdqTG7cPE2FJcy
 IKZP11Ex3ZHUTYWNe+lt+KoHnt5W3uFyWshJdEuOs0RpwpZpS1L5MnYbgowMMC4i
 ynp0no1HE8QXSMWa1XcWACZVHhEIKOBNv5uUz3qG5jRdUgh5n3UfgJC233QjgpFE
 CYpWPI0n4om5jDvGqWqCOIu3ZEQCdLCUKDxaPe+qGzEmIfDYJXVCA8ZQgtAaWC0u
 FMIPC0NUcdZx2K+xDx71w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469092; x=
 1664476292; bh=A+sS3I0hegu6sYrA9j71SlzBPxMAUYMSLyq1Y0VmBlA=; b=I
 kNQ+AoJyRldkTcWizFAdijwH//v9oUWrJsR7nlCc0HIsKDYX5SVJ3elNFOcRtiQx
 8WpMjz0sF7x2k70UYJFBdSzv3dcjm+fxThlzMCz99bm46E2g6iiVZRh40/fpYf/X
 t+1ZkJnpsax9UNvmla1dbXtdxgGiJS1XyYfOgprAJDXCp5I38NxtQJpSQJb4qV58
 qqf2pvfMZwrf7HDB9QS4FpyH6EUfkf3LhgEqgbeczoDFbEO8KZ5qJxijLa0Rgz/C
 rb4uHgmzKXfYBVFLLyLat05AhA5Y9WjrydW5wU6jmHw7O0wU6SJZGIL/A8K8lmTN
 AlJCZk+qLP3uEiSHxJvUA==
X-ME-Sender: <xms:ZMg1Y1GkxRpAbYAMqxfVaz7cMqtdNA_sxkki9vjKCErn_OvVXdfVeg>
 <xme:ZMg1Y6XYafjhYR32Tz65EkL0E9q7MNBxJceO6UEqauVL7GcP9payzvGJ1ucJGShOv
 a28fynsJ4_uwvnwgu4>
X-ME-Received: <xmr:ZMg1Y3LUMaPiZM8x8f7nQ8UaPzzroZ_n_KGS3DVK-qLKE_NJa6yyzdczbb-t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZMg1Y7FMETvKee7MXWKxPNvmiLynDXBli22KVvqiw3v7Dt8ozpyefw>
 <xmx:ZMg1Y7VxtB5EV99spILCsTeV0735VXRLy9zlOXGh7AoMLQ9EyJYQ5g>
 <xmx:ZMg1Y2Okv3r3RA9JYGwBQqK53MGGvr2aEsodfwmO7PAEbjinbcNKFw>
 <xmx:ZMg1Y1hFRHE073xH3qnRJux744ipff17Dki9zgZXSCT2x_OdVrcIrg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:04 +0200
Subject: [PATCH v4 10/30] drm/connector: Add TV standard property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-10-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=10588; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sR/x4XRAGKNKLTlKQiWw4o+ODGNQ8EVhmUgdOv5A0cE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9w/tExrz+22evfPqvrGw2VmTq8l5tdfvrb2lIfl17ur
 dSIndpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAii80YGZbsd/vdMvtE4DfVLas2rW
 vNsvHfMcXuMHeVCccJk4tOvmIM/5NyrWPF2FWaDqozzXmR8/jAi1W/tx954b37+eNVCQeW2fEAAA==
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

---
Changes in v4:
- Add property documentation to kms-properties.csv
- Fix documentation
---
 Documentation/gpu/kms-properties.csv |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c    |  4 +++
 drivers/gpu/drm/drm_connector.c      | 57 +++++++++++++++++++++++++++++++-
 include/drm/drm_connector.h          | 64 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h        |  8 +++++
 5 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
index 45c12e3e82f4..3498bd5d5856 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -91,6 +91,7 @@ omap,Generic,“zorder”,RANGE,"Min=0, Max=3","CRTC, Plane",TBD
 qxl,Generic,"“hotplug_mode_update""",RANGE,"Min=0, Max=1",Connector,TBD
 radeon,DVI-I,“coherent”,RANGE,"Min=0, Max=1",Connector,TBD
 ,DAC enable load detect,“load detection”,RANGE,"Min=0, Max=1",Connector,TBD
+,TV Mode,"""TV Mode""",ENUM,"{ ""NTSC"", ""NTSC-443"", ""NTSC-J"", ""PAL"", ""PAL-M"", ""PAL-N"", ""SECAM"" }",Connector,TBD
 ,legacy TMDS PLL detect,"""tmds_pll""",ENUM,"{ ""driver"", ""bios"" }",-,TBD
 ,Underscan,"""underscan""",ENUM,"{ ""off"", ""on"", ""auto"" }",Connector,TBD
 ,,"""underscan hborder""",RANGE,"Min=0, Max=128",Connector,TBD
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
index 4e4fbc9e0049..8edc347ef664 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -980,6 +980,17 @@ static const struct drm_prop_enum_list drm_dvi_i_subconnector_enum_list[] = {
 DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,
 		 drm_dvi_i_subconnector_enum_list)
 
+static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
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
@@ -1645,6 +1656,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
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
@@ -1686,7 +1701,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-
 	if (num_modes) {
 		dev->mode_config.legacy_tv_mode_property =
 			drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -1735,6 +1749,47 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);
 
+/**
+ * drm_mode_create_tv_properties - create TV specific connector properties
+ * @dev: DRM device
+ * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
+
+ * Called by a driver's TV initialization routine, this function creates
+ * the TV specific connector properties for a given device.
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
index d566b4a4709c..ef5f1c779de3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -143,6 +143,65 @@ enum subpixel_order {
 
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
@@ -696,6 +755,7 @@ struct drm_connector_tv_margins {
  * @subconnector: detected subconnector
  * @margins: TV margins
  * @legacy_mode: Legacy TV mode, driver specific value
+ * @mode: TV mode
  * @brightness: brightness in percent
  * @contrast: contrast in percent
  * @flicker_reduction: flicker reduction in percent
@@ -708,6 +768,7 @@ struct drm_tv_connector_state {
 	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int legacy_mode;
+	unsigned int mode;
 	unsigned int brightness;
 	unsigned int contrast;
 	unsigned int flicker_reduction;
@@ -1789,6 +1850,7 @@ const char *drm_get_subpixel_order_name(enum subpixel_order order);
 const char *drm_get_dpms_name(int val);
 const char *drm_get_dvi_i_subconnector_name(int val);
 const char *drm_get_dvi_i_select_name(int val);
+const char *drm_get_tv_mode_name(int val);
 const char *drm_get_tv_subconnector_name(int val);
 const char *drm_get_tv_select_name(int val);
 const char *drm_get_dp_subconnector_name(int val);
@@ -1802,6 +1864,8 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev);
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
b4 0.11.0-dev-7da52
