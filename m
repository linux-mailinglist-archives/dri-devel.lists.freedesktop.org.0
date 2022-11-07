Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAE61F557
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939D510E32B;
	Mon,  7 Nov 2022 14:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE310E329;
 Mon,  7 Nov 2022 14:17:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E5B812B05E60;
 Mon,  7 Nov 2022 09:17:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830622; x=
 1667837822; bh=h2gKtv9TgvmJ1eOnqWa2DbPhmsrxD5H1bKTSfBv0Ze4=; b=A
 dGnp+NfgQ7JL+ylQFGbbyRMzsSFaECM4pGZK16xGZjV4SpdD8ahKW5uq64kiq+wQ
 kJ0xKfEd8jAF4IBwLnRBtC33swllZnDS/rZmJBEMrXWRgx8T+6G04cAAkRtHK1+4
 9Hp3Ie11VfgHL24smh5BdOOEMPEeZEnn3U+7Os79jeUJTDWQHB4Z7I3e27S9tZrr
 gtjsPag46Nisar6DxV9kok/ui9sMTYZ3cqUn2Dkma5GzwAasgtjvc76bXepYLGg+
 Mkm4EAzYfA5NUzoEgtrvdA+jNKIaSbzdRwYl6sA5Ta4nSDUAmQdqWVSD7O/s6MjO
 xXzJADvna9HwbYyqTix2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830622; x=
 1667837822; bh=h2gKtv9TgvmJ1eOnqWa2DbPhmsrxD5H1bKTSfBv0Ze4=; b=t
 N6na1fMVf2W1KSCLvNrBZZqLLXFcjfGhRsiut+iDUPdqzPwYzUrF2ss/XAxgDk1d
 2aH/pa5uZujUi9nTyDsfg/7jKy+cu/w2sKzEnco80B+WkNSKf50PxSBXfC66PtVo
 sQZSKKbV5InXbVRsknmsk3/lmpst4VzWV1Pldgw85IkL8t6QsuXi7m4+qWPIMp02
 JFyQBRMRJ2SFDUA2W0fD2mhUP1OS8Z+17IAvOHaZX181PsZRFP1akIeImBWxR2tp
 f+winV3iqEsyKEXucIxaZwWp/Sq69RKbeMDd8Abft6VbYsKihsaisHoPF8D0i8BV
 nFOSoHZ9WK/kT/5pu+qug==
X-ME-Sender: <xms:XRNpY1qvenwmIp6oZB5nLjBT3qxa4X9dHrDbvfV5hocJTyYf2U5OdQ>
 <xme:XRNpY3qhtTT0s4EWyAr6d2fstbvQ83Po9ixqX5We9Hyqb0zhU2534Z30IIDNapRGo
 Z3abGE6-P7p57s1kkI>
X-ME-Received: <xmr:XRNpYyO1QUBi8cd3roae5Mgv17DSYRTX77NbSDdmamYDxUCmJHRdBX3WRSpp-4LfUnxxoNGNC7jR_YO7odSc7pMZjPYPfGoL2NRAjMizq8GUoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XRNpYw7-3v8yj7Hp-lnnqoz13V9JpZBT6OmuF8pKJV63yrOiOuXXkg>
 <xmx:XRNpY06EXt9EBIEMmlFrKLJ8V4G45EC3_QF1HcTsi3hskHuCR9bpEQ>
 <xmx:XRNpY4gF6yLmUih3uuwqcyY2fSUd_DfaPyzr_vP_c21mytwUD9uRrA>
 <xmx:XhNpY5lUsU0RejGpCW-7-PEsIZjaaZ1NIxYXvApcjuZy85PsDwYdEeb7uEs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:31 +0100
Subject: [PATCH v7 05/23] drm/connector: Add TV standard property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v7-5-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12323; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=e9bRCC/Bp1zmbItPR+xUii5lHnyjT0/h9ut1EP69GYs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwvY8E5//TS4Ld9SW+1bpqGB16ef0ytmMK/89yl9wZfcp
 loneHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhISCXDf4+WDcuW/rVLNupOORA52/
 n1KpXVR5zPfszPf9C2Nv2H0mdGhvbrh2e7rr45U1ppnfbPqet5V/v48F8/YlNcMHmJ+05uAV4A
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
Changes in v5:
- Create an analog TV properties documentation section, and document TV
  Mode there instead of the csv file

Changes in v4:
- Add property documentation to kms-properties.csv
- Fix documentation
---
 Documentation/gpu/drm-kms.rst     |   6 ++
 drivers/gpu/drm/drm_atomic_uapi.c |   4 ++
 drivers/gpu/drm/drm_connector.c   | 122 +++++++++++++++++++++++++++++++++++++-
 include/drm/drm_connector.h       |  64 ++++++++++++++++++++
 include/drm/drm_mode_config.h     |   8 +++
 5 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index b4377a545425..321f2f582c64 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -520,6 +520,12 @@ HDMI Specific Connector Properties
 .. kernel-doc:: drivers/gpu/drm/drm_connector.c
    :doc: HDMI connector properties
 
+Analog TV Specific Connector Properties
+----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_connector.c
+   :doc: Analog TV Connector Properties
+
 Standard CRTC Properties
 ------------------------
 
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
index cd01850c66f7..f9a6cb792bda 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -984,6 +984,17 @@ static const struct drm_prop_enum_list drm_dvi_i_subconnector_enum_list[] = {
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
@@ -1552,6 +1563,71 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
  *	infoframe values is done through drm_hdmi_avi_infoframe_content_type().
  */
 
+/*
+ * TODO: Document the properties:
+ *   - left margin
+ *   - right margin
+ *   - top margin
+ *   - bottom margin
+ *   - brightness
+ *   - contrast
+ *   - flicker reduction
+ *   - hue
+ *   - mode
+ *   - overscan
+ *   - saturation
+ *   - select subconnector
+ *   - subconnector
+ */
+/**
+ * DOC: Analog TV Connector Properties
+ *
+ * TV Mode:
+ *	Indicates the TV Mode used on an analog TV connector. The value
+ *	of this property can be one of the following:
+ *
+ *	NTSC:
+ *		TV Mode is CCIR System M (aka 525-lines) together with
+ *		the NTSC Color Encoding.
+ *
+ *	NTSC-443:
+ *
+ *		TV Mode is CCIR System M (aka 525-lines) together with
+ *		the NTSC Color Encoding, but with a color subcarrier
+ *		frequency of 4.43MHz
+ *
+ *	NTSC-J:
+ *
+ *		TV Mode is CCIR System M (aka 525-lines) together with
+ *		the NTSC Color Encoding, but with a black level equal to
+ *		the blanking level.
+ *
+ *	PAL:
+ *
+ *		TV Mode is CCIR System B (aka 625-lines) together with
+ *		the PAL Color Encoding.
+ *
+ *	PAL-M:
+ *
+ *		TV Mode is CCIR System M (aka 525-lines) together with
+ *		the PAL Color Encoding.
+ *
+ *	PAL-N:
+ *
+ *		TV Mode is CCIR System N together with the PAL Color
+ *		Encoding, a color subcarrier frequency of 3.58MHz, the
+ *		SECAM color space, and narrower channels than other PAL
+ *		variants.
+ *
+ *	SECAM:
+ *
+ *		TV Mode is CCIR System B (aka 625-lines) together with
+ *		the SECAM Color Encoding.
+ *
+ *	Drivers can set up this property by calling
+ *	drm_mode_create_tv_properties().
+ */
+
 /**
  * drm_connector_attach_content_type_property - attach content-type property
  * @connector: connector to attach content type property on.
@@ -1649,6 +1725,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
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
@@ -1690,7 +1770,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-
 	if (num_modes) {
 		dev->mode_config.legacy_tv_mode_property =
 			drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -1739,6 +1818,47 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
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
index 5913b8415137..9afc7956fdc6 100644
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
@@ -1797,6 +1858,7 @@ const char *drm_get_subpixel_order_name(enum subpixel_order order);
 const char *drm_get_dpms_name(int val);
 const char *drm_get_dvi_i_subconnector_name(int val);
 const char *drm_get_dvi_i_select_name(int val);
+const char *drm_get_tv_mode_name(int val);
 const char *drm_get_tv_subconnector_name(int val);
 const char *drm_get_tv_select_name(int val);
 const char *drm_get_dp_subconnector_name(int val);
@@ -1810,6 +1872,8 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev);
 int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 					 unsigned int num_modes,
 					 const char * const modes[]);
+int drm_mode_create_tv_properties(struct drm_device *dev,
+				  unsigned int supported_tv_modes);
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);
 int drm_connector_attach_content_type_property(struct drm_connector *dev);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index c47b29e80108..1a8bcc3fd14e 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -716,9 +716,17 @@ struct drm_mode_config {
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
b4 0.11.0-dev-99e3a
