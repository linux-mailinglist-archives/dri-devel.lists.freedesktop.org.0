Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7793637A05
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 14:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911110E097;
	Thu, 24 Nov 2022 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DF210E068;
 Thu, 24 Nov 2022 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3q6RWR2v4j9zd3mF33OR8DtfinEVMVbu5MhzvMj3OOA=; b=qIn2d+Ple2l3OT7b96XKPWuurI
 Vo5I2QPhlShuDKDJV57/z3LUYUOb0O06ph0X4Zndbhx3DdGKsQv6Y7X1X65DmdW6jwv/AvGAzf3U4
 RK+vIn646i3jc2tyoMYkgzkwL7soVAdhitNCYJj8FLoy5mUAf9yF8ZIscGv0oTv7fia91TnhzMlAP
 Z0J2xB+CXk8oKZKfxeCH8vgl/e11ygUKVfMPcXDkVG0ugc5T4u8Q0S0CRFOR+qwlVJPIJK17V02MF
 CorKNB9kp4ZFNuMrxpTsPxA95lOZ1q20GGYndVLylB6ncQihgb/zeKenSN/I8sSMyNCLiRcRCqcs1
 Ap4J58PA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=54060)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oyCLu-00026c-7q; Thu, 24 Nov 2022 14:33:18 +0100
Message-ID: <1506bcb7-fbdf-95e4-7ac3-945e9e24649d@tronnes.org>
Date: Thu, 24 Nov 2022 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v10 05/19] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-5-256dad125326@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-5-256dad125326@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 17.11.2022 10.28, skrev Maxime Ripard:
> The TV mode property has been around for a while now to select and get the
> current TV mode output on an analog TV connector.
> 
> Despite that property name being generic, its content isn't and has been
> driver-specific which makes it hard to build any generic behaviour on top
> of it, both in kernel and user-space.
> 
> Let's create a new enum tv norm property, that can contain any of the
> analog TV standards currently supported by kernel drivers. Each driver can
> then pass in a bitmask of the modes it supports, and the property
> creation function will filter out the modes not supported.
> 
> We'll then be able to phase out the older tv mode property.
> 
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v10:
> - Fix checkpatch warning
> 
> Changes in v5:
> - Create an analog TV properties documentation section, and document TV
>   Mode there instead of the csv file
> 
> Changes in v4:
> - Add property documentation to kms-properties.csv
> - Fix documentation
> ---
>  Documentation/gpu/drm-kms.rst     |   6 ++
>  drivers/gpu/drm/drm_atomic_uapi.c |   4 ++
>  drivers/gpu/drm/drm_connector.c   | 122 +++++++++++++++++++++++++++++++++++++-
>  include/drm/drm_connector.h       |  64 ++++++++++++++++++++
>  include/drm/drm_mode_config.h     |   8 +++
>  5 files changed, 203 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index b4377a545425..321f2f582c64 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -520,6 +520,12 @@ HDMI Specific Connector Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_connector.c
>     :doc: HDMI connector properties
>  
> +Analog TV Specific Connector Properties
> +----------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_connector.c
> +   :doc: Analog TV Connector Properties
> +
>  Standard CRTC Properties
>  ------------------------
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 7f2b9a07fbdf..d867e7f9f2cd 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->tv.margins.bottom = val;
>  	} else if (property == config->legacy_tv_mode_property) {
>  		state->tv.legacy_mode = val;
> +	} else if (property == config->tv_mode_property) {
> +		state->tv.mode = val;
>  	} else if (property == config->tv_brightness_property) {
>  		state->tv.brightness = val;
>  	} else if (property == config->tv_contrast_property) {
> @@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->tv.margins.bottom;
>  	} else if (property == config->legacy_tv_mode_property) {
>  		*val = state->tv.legacy_mode;
> +	} else if (property == config->tv_mode_property) {
> +		*val = state->tv.mode;
>  	} else if (property == config->tv_brightness_property) {
>  		*val = state->tv.brightness;
>  	} else if (property == config->tv_contrast_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 06e737ed15f5..07d449736956 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -984,6 +984,17 @@ static const struct drm_prop_enum_list drm_dvi_i_subconnector_enum_list[] = {
>  DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,
>  		 drm_dvi_i_subconnector_enum_list)
>  
> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> +	{ DRM_MODE_TV_MODE_NTSC, "NTSC" },
> +	{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> +	{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> +	{ DRM_MODE_TV_MODE_PAL, "PAL" },
> +	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> +	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> +	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
> +};
> +DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> +

This patch looks good but since I'm no TV standards expert I can't say
if the content of this list is a good choice for reflecting the world of
TV standards.

Acked-by: Noralf Trønnes <noralf@tronnes.org>

>  static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
>  	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
>  	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
> @@ -1552,6 +1563,71 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>   *	infoframe values is done through drm_hdmi_avi_infoframe_content_type().
>   */
>  
> +/*
> + * TODO: Document the properties:
> + *   - left margin
> + *   - right margin
> + *   - top margin
> + *   - bottom margin
> + *   - brightness
> + *   - contrast
> + *   - flicker reduction
> + *   - hue
> + *   - mode
> + *   - overscan
> + *   - saturation
> + *   - select subconnector
> + *   - subconnector
> + */
> +/**
> + * DOC: Analog TV Connector Properties
> + *
> + * TV Mode:
> + *	Indicates the TV Mode used on an analog TV connector. The value
> + *	of this property can be one of the following:
> + *
> + *	NTSC:
> + *		TV Mode is CCIR System M (aka 525-lines) together with
> + *		the NTSC Color Encoding.
> + *
> + *	NTSC-443:
> + *
> + *		TV Mode is CCIR System M (aka 525-lines) together with
> + *		the NTSC Color Encoding, but with a color subcarrier
> + *		frequency of 4.43MHz
> + *
> + *	NTSC-J:
> + *
> + *		TV Mode is CCIR System M (aka 525-lines) together with
> + *		the NTSC Color Encoding, but with a black level equal to
> + *		the blanking level.
> + *
> + *	PAL:
> + *
> + *		TV Mode is CCIR System B (aka 625-lines) together with
> + *		the PAL Color Encoding.
> + *
> + *	PAL-M:
> + *
> + *		TV Mode is CCIR System M (aka 525-lines) together with
> + *		the PAL Color Encoding.
> + *
> + *	PAL-N:
> + *
> + *		TV Mode is CCIR System N together with the PAL Color
> + *		Encoding, a color subcarrier frequency of 3.58MHz, the
> + *		SECAM color space, and narrower channels than other PAL
> + *		variants.
> + *
> + *	SECAM:
> + *
> + *		TV Mode is CCIR System B (aka 625-lines) together with
> + *		the SECAM Color Encoding.
> + *
> + *	Drivers can set up this property by calling
> + *	drm_mode_create_tv_properties().
> + */
> +
>  /**
>   * drm_connector_attach_content_type_property - attach content-type property
>   * @connector: connector to attach content type property on.
> @@ -1649,6 +1725,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>   * responsible for allocating a list of format names and passing them to
>   * this routine.
>   *
> + * NOTE: This functions registers the deprecated "mode" connector
> + * property to select the analog TV mode (ie, NTSC, PAL, etc.). New
> + * drivers must use drm_mode_create_tv_properties() instead.
> + *
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> @@ -1690,7 +1770,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  	if (drm_mode_create_tv_margin_properties(dev))
>  		goto nomem;
>  
> -
>  	if (num_modes) {
>  		dev->mode_config.legacy_tv_mode_property =
>  			drm_property_create(dev, DRM_MODE_PROP_ENUM,
> @@ -1739,6 +1818,47 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);
>  
> +/**
> + * drm_mode_create_tv_properties - create TV specific connector properties
> + * @dev: DRM device
> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
> +
> + * Called by a driver's TV initialization routine, this function creates
> + * the TV specific connector properties for a given device.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_mode_create_tv_properties(struct drm_device *dev,
> +				  unsigned int supported_tv_modes)
> +{
> +	struct drm_prop_enum_list tv_mode_list[DRM_MODE_TV_MODE_MAX];
> +	struct drm_property *tv_mode;
> +	unsigned int i, len = 0;
> +
> +	if (dev->mode_config.tv_mode_property)
> +		return 0;
> +
> +	for (i = 0; i < DRM_MODE_TV_MODE_MAX; i++) {
> +		if (!(supported_tv_modes & BIT(i)))
> +			continue;
> +
> +		tv_mode_list[len].type = i;
> +		tv_mode_list[len].name = drm_get_tv_mode_name(i);
> +		len++;
> +	}
> +
> +	tv_mode = drm_property_create_enum(dev, 0, "TV mode",
> +					   tv_mode_list, len);
> +	if (!tv_mode)
> +		return -ENOMEM;
> +
> +	dev->mode_config.tv_mode_property = tv_mode;
> +
> +	return drm_mode_create_tv_properties_legacy(dev, 0, NULL);
> +}
> +EXPORT_SYMBOL(drm_mode_create_tv_properties);
> +
>  /**
>   * drm_mode_create_scaling_mode_property - create scaling mode property
>   * @dev: DRM device
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 15cb58117a94..4927dcb2573f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -143,6 +143,65 @@ enum subpixel_order {
>  
>  };
>  
> +/**
> + * enum drm_connector_tv_mode - Analog TV output mode
> + *
> + * This enum is used to indicate the TV output mode used on an analog TV
> + * connector.
> + *
> + * WARNING: The values of this enum is uABI since they're exposed in the
> + * "TV mode" connector property.
> + */
> +enum drm_connector_tv_mode {
> +	/**
> +	 * @DRM_MODE_TV_MODE_NTSC: CCIR System M (aka 525-lines)
> +	 * together with the NTSC Color Encoding.
> +	 */
> +	DRM_MODE_TV_MODE_NTSC,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_NTSC_443: Variant of
> +	 * @DRM_MODE_TV_MODE_NTSC. Uses a color subcarrier frequency
> +	 * of 4.43 MHz.
> +	 */
> +	DRM_MODE_TV_MODE_NTSC_443,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_NTSC_J: Variant of @DRM_MODE_TV_MODE_NTSC
> +	 * used in Japan. Uses a black level equals to the blanking
> +	 * level.
> +	 */
> +	DRM_MODE_TV_MODE_NTSC_J,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_PAL: CCIR System B together with the PAL
> +	 * color system.
> +	 */
> +	DRM_MODE_TV_MODE_PAL,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_PAL_M: CCIR System M (aka 525-lines)
> +	 * together with the PAL color encoding
> +	 */
> +	DRM_MODE_TV_MODE_PAL_M,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_PAL_N: CCIR System N together with the PAL
> +	 * color encoding. It uses 625 lines, but has a color subcarrier
> +	 * frequency of 3.58MHz, the SECAM color space, and narrower
> +	 * channels compared to most of the other PAL variants.
> +	 */
> +	DRM_MODE_TV_MODE_PAL_N,
> +
> +	/**
> +	 * @DRM_MODE_TV_MODE_SECAM: CCIR System B together with the
> +	 * SECAM color system.
> +	 */
> +	DRM_MODE_TV_MODE_SECAM,
> +
> +	DRM_MODE_TV_MODE_MAX,
> +};
> +
>  /**
>   * struct drm_scrambling: sink's scrambling support.
>   */
> @@ -696,6 +755,7 @@ struct drm_connector_tv_margins {
>   * @subconnector: detected subconnector
>   * @margins: TV margins
>   * @legacy_mode: Legacy TV mode, driver specific value
> + * @mode: TV mode
>   * @brightness: brightness in percent
>   * @contrast: contrast in percent
>   * @flicker_reduction: flicker reduction in percent
> @@ -708,6 +768,7 @@ struct drm_tv_connector_state {
>  	enum drm_mode_subconnector subconnector;
>  	struct drm_connector_tv_margins margins;
>  	unsigned int legacy_mode;
> +	unsigned int mode;
>  	unsigned int brightness;
>  	unsigned int contrast;
>  	unsigned int flicker_reduction;
> @@ -1804,6 +1865,7 @@ const char *drm_get_subpixel_order_name(enum subpixel_order order);
>  const char *drm_get_dpms_name(int val);
>  const char *drm_get_dvi_i_subconnector_name(int val);
>  const char *drm_get_dvi_i_select_name(int val);
> +const char *drm_get_tv_mode_name(int val);
>  const char *drm_get_tv_subconnector_name(int val);
>  const char *drm_get_tv_select_name(int val);
>  const char *drm_get_dp_subconnector_name(int val);
> @@ -1817,6 +1879,8 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev);
>  int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  					 unsigned int num_modes,
>  					 const char * const modes[]);
> +int drm_mode_create_tv_properties(struct drm_device *dev,
> +				  unsigned int supported_tv_modes);
>  void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
>  int drm_mode_create_scaling_mode_property(struct drm_device *dev);
>  int drm_connector_attach_content_type_property(struct drm_connector *dev);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index c47b29e80108..e5b053001d22 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -716,9 +716,17 @@ struct drm_mode_config {
>  	/**
>  	 * @legacy_tv_mode_property: Optional TV property to select
>  	 * the output TV mode.
> +	 *
> +	 * Superseded by @tv_mode_property
>  	 */
>  	struct drm_property *legacy_tv_mode_property;
>  
> +	/**
> +	 * @tv_mode_property: Optional TV property to select the TV
> +	 * standard output on the connector.
> +	 */
> +	struct drm_property *tv_mode_property;
> +
>  	/**
>  	 * @tv_left_margin_property: Optional TV property to set the left
>  	 * margin (expressed in pixels).
> 
