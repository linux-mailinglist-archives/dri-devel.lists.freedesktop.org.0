Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211A5E8E2D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 17:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63B10E623;
	Sat, 24 Sep 2022 15:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2874910E0FA;
 Sat, 24 Sep 2022 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl/EkK4Jsie8hOn3DIyAp+lhBrA+QwGp/EnPgaDUSgU=; b=L42JHZz4V3wZoYF2pOkkEIEkJm
 cxjcz+xk/OLVLFmqew8U+AYRHrJg3l1E+CY5ss0Hwrmsq4srirUjZD8qeE3ibeykGg6EDWTIRIOzZ
 OxOcQ/I5udFaFPrmnvBTkDeIZhgaT6nI4nr4qYlxnOkPiU116iZXm2CQpdqGoVkhPX1acCVY/LVeZ
 J6RAeiD5pYDeIPVspsn64uWim8nAhT5QYYljqaKRCB3qwi4MBxUdAkP88AkfBjYoRcPc21Vhut4DH
 0ZyQh2P4497oMFU7AcT8d5vsQjc4RSTWKcAWXp6zyVnaPRhKtLQ9rGQsPDlx7RWWcaHmKOHJsZk+s
 7wo514Jw==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=52904)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oc7SF-0007Oc-Ed; Sat, 24 Sep 2022 17:52:35 +0200
Message-ID: <80138f62-faec-5f7e-a8bd-235318a4e4c2@tronnes.org>
Date: Sat, 24 Sep 2022 17:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 09/33] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-9-f733a0ed9f90@cerno.tech>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 22.09.2022 16.25, skrev Maxime Ripard:
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
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Please can you add per patch changelogs, it's hard to review when I have
to recall what might have happened with each patch. If you do it drm
style and put in the commit message it should be easy enough to do.

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4e4fbc9e0049..e7aa8de08f5b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -980,6 +980,18 @@ static const struct drm_prop_enum_list drm_dvi_i_subconnector_enum_list[] = {
>  DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,
>  		 drm_dvi_i_subconnector_enum_list)
>  
> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> +	{ DRM_MODE_TV_MODE_NONE, "None" },
> +	{ DRM_MODE_TV_MODE_NTSC, "NTSC" },

I think going back to plain NTSC and PAL is a good choice for the common
variants.

> +	{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> +	{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> +	{ DRM_MODE_TV_MODE_PAL, "PAL" },
> +	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> +	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> +	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
> +};
> +DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> +
>  static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
>  	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
>  	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
> @@ -1645,6 +1657,10 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
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
> @@ -1686,7 +1702,6 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  	if (drm_mode_create_tv_margin_properties(dev))
>  		goto nomem;
>  
> -
>  	if (num_modes) {
>  		dev->mode_config.legacy_tv_mode_property =
>  			drm_property_create(dev, DRM_MODE_PROP_ENUM,
> @@ -1735,6 +1750,49 @@ int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_mode_create_tv_properties_legacy);
>  
> +/**
> + * drm_mode_create_tv_properties - create TV specific connector properties
> + * @dev: DRM device
> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
> +
> + * Called by a driver's TV initialization routine, this function creates
> + * the TV specific connector properties for a given device.  Caller is
> + * responsible for allocating a list of format names and passing them to
> + * this routine.

Copy-paste error, there are no format names in this version.

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
> index d566b4a4709c..fffacbfd0a45 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -143,6 +143,71 @@ enum subpixel_order {
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
> +	 * @DRM_MODE_TV_MODE_NONE: Placeholder to not default on one
> +	 * variant or the other when nothing is set.
> +	 */
> +	DRM_MODE_TV_MODE_NONE = 0,

How is this supposed to be used?

Noralf.

> +
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
> @@ -696,6 +761,7 @@ struct drm_connector_tv_margins {
>   * @subconnector: detected subconnector
>   * @margins: TV margins
>   * @legacy_mode: Legacy TV mode, driver specific value
> + * @mode: TV mode
>   * @brightness: brightness in percent
>   * @contrast: contrast in percent
>   * @flicker_reduction: flicker reduction in percent
> @@ -708,6 +774,7 @@ struct drm_tv_connector_state {
>  	enum drm_mode_subconnector subconnector;
>  	struct drm_connector_tv_margins margins;
>  	unsigned int legacy_mode;
> +	unsigned int mode;
>  	unsigned int brightness;
>  	unsigned int contrast;
>  	unsigned int flicker_reduction;
> @@ -1789,6 +1856,7 @@ const char *drm_get_subpixel_order_name(enum subpixel_order order);
>  const char *drm_get_dpms_name(int val);
>  const char *drm_get_dvi_i_subconnector_name(int val);
>  const char *drm_get_dvi_i_select_name(int val);
> +const char *drm_get_tv_mode_name(int val);
>  const char *drm_get_tv_subconnector_name(int val);
>  const char *drm_get_tv_select_name(int val);
>  const char *drm_get_dp_subconnector_name(int val);
> @@ -1802,6 +1870,8 @@ int drm_mode_create_tv_margin_properties(struct drm_device *dev);
>  int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
>  					 unsigned int num_modes,
>  					 const char * const modes[]);
> +int drm_mode_create_tv_properties(struct drm_device *dev,
> +				  unsigned int supported_tv_modes);
>  void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
>  int drm_mode_create_scaling_mode_property(struct drm_device *dev);
>  int drm_connector_attach_content_type_property(struct drm_connector *dev);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 35a827175c24..10a6f7d1df0d 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -718,9 +718,17 @@ struct drm_mode_config {
>  	/**
>  	 * @legacy_tv_mode_property: Optional TV property to select
>  	 * the output TV mode.
> +	 *
> +	 * Superseeded by @tv_mode_property
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
