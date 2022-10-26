Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3F60E498
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CE010E2E1;
	Wed, 26 Oct 2022 15:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4DB10E491;
 Wed, 26 Oct 2022 15:33:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1889A580391;
 Wed, 26 Oct 2022 11:33:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Oct 2022 11:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798423; x=
 1666805623; bh=da5p7h+nAxeT7i0HKDEXyERGBqo+la++iRdEuZuzv6k=; b=b
 Z3dKoOQNk9sU79kaP20m4DYHruR/ltDIaC5T1LwkZSxhRIHCGF4xkv8iQrpeS+ns
 A4aO7KGLRWe+20lw4gucx1+48nf004gITlJB+mWpdO3D4VIfzsAVZNUszQijMULj
 0Mf1ztM7owjc+2RgSIJcvzQcAcoG8xsJyHBFmdPYzcQdpOG5Ii/LYWBPqho9UB+w
 rzuUDUvot29OcOWSBRveTklTwSVfEWuFxozJOHJ78EPSKNZsyhHv2J4eSgPckkkr
 a30G0m6oP/d3PUIqX7lw8HlSZoo6AxjcnRUl9lwVdBqTCx4RZhZ3wM96YXJYqSjA
 dJIG4e3gMs1No5BD7G/MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798423; x=
 1666805623; bh=da5p7h+nAxeT7i0HKDEXyERGBqo+la++iRdEuZuzv6k=; b=L
 uUP+mc4vzyg5e3QQD7O7S3ljrobAhykqft4ju2e/gjBX23HkowRwRiLhc6UysjSG
 HBscm69TACyXc5fTaeH8bYLxDOBp+YF4KpmRURFCgZq9IA1DnO+LVi2wQSnR1woc
 7bTfgdkGAPzmTycrEVcxyCdV3Ec/WdrrKQ0wDtTBHhwd6DUDNkogrWt10uPaNdOa
 KzczYdTG6L2m19Xu9ZUXrAhSrZUxaXx/l2f8wU/EDXl9jwFuEgpJVhOvwa8PhFxK
 Gc5BoJaiC/Surdv5YRqGVzfJfZwPb92uP20JKowac4eLie7QHRR/7Ke0Cy8/ocyC
 827bVHywV+r/XZqSOdVFw==
X-ME-Sender: <xms:VlNZY-FdoW7P8y4yE0eU7ISnSoE5_evpL3ZFiN6pOed7vCK7TAWNbQ>
 <xme:VlNZY_U6bwZWYgWnQoa-h-Msu6IQG-SMHvgvyG8DrjOIzRNRneA3z9H8z3Y3kZzhm
 q6VlIEI7tQXSkiEMe4>
X-ME-Received: <xmr:VlNZY4KQkHMjOlOr-Tx1b63RaWv6mff3h2Zck7yYOQtrGIPvTopBHLhCKHmW6nCmIuINa_uQn5ZkPaolbdmYqolBTyrVVE-3icl3Azhpio7Ujw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:VlNZY4G_HU_B5kE3pElTvoSjeSYS7WMEGP3-4m0dZXFUUvaZA49pTg>
 <xmx:VlNZY0U06A5TlfPMK5sg9thmb6han-LbK-1adenmo7xmWyuUx6natQ>
 <xmx:VlNZY7PbVn4uhi55dSUOlg5O6LcSvbVk5BSWoL0U-mX3Lxtto8Mu0w>
 <xmx:V1NZY2h6pMwSpmuY9skOYoJabPrhPSQl1fNoveredD1bZl4tVK00qQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:41 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:24 +0200
Subject: [PATCH v6 05/23] drm/connector: Add TV standard property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-5-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12323; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=j4xTCTdhhds4AAeoOgL8qcWT4t/V/A+CQ68kONq/Fgg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4rPNd/Spz1WNS5cvPPwFevVF3Tjhsedn91Zde/ivDP
 z9U0OkpYGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRKRsYGWYfVFc+vy5+drfKMbatzX
 13/4c+C+hr3lYV6XFqwck5V0UYPjJKeh3eZlF51/3aj+NH7u6pdjz6gG+54fOjYQKNEtyT+QE=
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
index 4e4fbc9e0049..820f4c730b38 100644
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
@@ -1548,6 +1559,71 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
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
@@ -1645,6 +1721,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
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
@@ -1686,7 +1766,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-
 	if (num_modes) {
 		dev->mode_config.legacy_tv_mode_property =
 			drm_property_create(dev, DRM_MODE_PROP_ENUM,
@@ -1735,6 +1814,47 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
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
index e1c88ae0149a..96b2e4e12334 100644
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
