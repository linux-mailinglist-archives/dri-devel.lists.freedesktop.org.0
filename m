Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E262DE5E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601710E609;
	Thu, 17 Nov 2022 14:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5110E609;
 Thu, 17 Nov 2022 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668695786; x=1700231786;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yh1vQtNHN6llzq1Dyn3Pw9I09GTqkyaQhV2cPEB6AzQ=;
 b=g4bypIXzpBD2a451d7VFD/AeqmHg9jPHWyiUf7cy8Cw7pc8LZ6KX3jBo
 7BXLdd1zzhP6UMsU+faGaOL3olsy+SA8NtjRAasmkyqp3MT+5bFNIHDU/
 KCczf/ehED2VCjneSSRBkeuYUlZjUhsl3/y4NIMSxTt4P9kSU/XT0eOAO
 pAE80HXLJPXekpbCZSy2MC7Yeg/EM8ZqUFG1zhuPOeSFO6YpR365Salse
 gIMFZayerhaYuTv3ZnkmShltOCz4p77x898zyZ45m1sZQ7V/3JOQPMxxR
 U0XGYwbW+AaklFMvT2rVg0Sspx/zr/6dk5f8KtNVIY5/wKtZ4roBqGItY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="310494361"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="310494361"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 06:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="670941025"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="670941025"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 17 Nov 2022 06:36:21 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.249.130.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 738DB580DFD;
 Thu, 17 Nov 2022 06:36:03 -0800 (PST)
Date: Thu, 17 Nov 2022 15:35:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v10 05/19] drm/connector: Add TV standard property
Message-ID: <20221117153557.75c5dba1@maurocar-mobl2>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-5-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-5-256dad125326@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Nov 2022 10:28:48 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

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

Nack. It sounds a very bad idea to have standards as generic as 
NTSC, PAL, SECAM. 

If you take a look at the CCIR/ITU-R specs that define video standards, 
you'll see that the standard has actually two components:

1. the composite color TV signal: PAL, NTSC, SECAM, defined in ITU-R BT1700[1]

2. and the conventional analogue TV (the "monochromatic" part),
as defined in ITU-R BT.1701[2], which is, basically, a letter from A to N
(with some country-specific variants, like Nc). Two of those standards
(M and J) are used on Countries with a power grid of 60Hz, as they have
a frame rate of either 30fps or 29.997fps.

[1] https://www.itu.int/rec/R-REC-BT.1700-0-200502-I/en
[2] https://www.itu.int/rec/R-REC-BT.1701-1-200508-I/en

The actual combination is defined within Country-specific laws, which
selects a conventional analogue signal with a composite color one.

So, for instance, US uses NTSC/M (because it uses a 60Hz power grid).
There is a 50Hz variant, called NTSC/443 (not used on any Country, but
present on some European VCR equipments capable of recording at 25fps,
using NTSC).

Btw, some VCR equipments in US may also have PAL/60 with has the
same timings as NTSC, but uses PAL instead.

What happens is that, in Europe, different PAL standards got used, but:

- most TV sets and their chipsets were developed to auto-detect and
  support the differences between different systems PAL/B, PAL/G, PAL/D,...
- several of those standards have a difference only at the audio
  sub-carriers. So, they look identical for the video decoding part.
- standards may have a different inter-channel space (it can vary from
  5 to 8 MHz) to minimize cross-signal interference.

---

Anyway, I strongly suggest to either:

1. align the standards there to what we defined in V4L2. See:
	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-enumstd.html#v4l2-std-id
and:
	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/standard.html

You can probably start with a subset of those, e. g. with:

 - PAL/I, PAL/BG, PAL/DK, PAL/M, PAL/N, PAL/Nc, PAL/60
 - NTSC/M, NTSC/M Japan, NTSC/M Korea, NTSC/443
 - SECAM/BG, SECAM/DK, SECAM/I, SECAM/L, SECAM/LP

Btw, for decoders, this should actually be a bitmask, as most decoding
chipsets can auto-detect among several different video standards.

2. split into two different properties:
	- the "monochromatic" one: A to N, M_Japan, M_Korea,
	  Nc, 60 and 443;
	- the composite signal encoding: NTSC, PAL, SECAM.

If I were to design V4L2 again back the days where commercial digital TV
were not present, I would probably have opted to have two different 
properties.

Regards,
Mauro

> +DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> +
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
