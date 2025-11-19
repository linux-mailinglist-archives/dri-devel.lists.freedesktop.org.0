Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E2C6CAFB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 05:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F189810E563;
	Wed, 19 Nov 2025 04:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CpbMVCAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493B710E098;
 Wed, 19 Nov 2025 04:16:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE4D2DD9;
 Wed, 19 Nov 2025 05:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763525637;
 bh=qMLgqQQc8+yO1Lu7xOaqtAqII2BdNA7YWFTM8pTjuTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CpbMVCAJdx4r6GeCZy2mNuNAc/VsDWlY7nMsG5ROPfam2r27A3XRzg48182RrLvXl
 DtvYB8LZnL4RXTvWdfNJn3g4YHdtKD7dItrCzqco8q4XuIqDVvDMgBb17UWSZXOmz0
 CbzS5mXp+npODHP/QdKYq/2lPINLHhBUn5r3acuM=
Date: Wed, 19 Nov 2025 13:15:32 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v4 02/10] drm: Add new general DRM property "color format"
Message-ID: <20251119041532.GB10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-2-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-2-0ded72bd1b00@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 17, 2025 at 08:11:46PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
> 
> Adds a new general DRM property named "color format" which can be used by

s/Adds/Add/

> userspace to force the display driver output a particular color format.
> 
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
> 
> Drivers should advertise from this list the formats which they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c   |   4 +
>  drivers/gpu/drm/drm_connector.c     | 180 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         |  54 ++++++++++-
>  4 files changed, 238 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e641fcf8c568..25f354b2cc0d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -736,6 +736,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			if (old_connector_state->max_requested_bpc !=
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed = true;
> +
> +			if (old_connector_state->color_format !=
> +			    new_connector_state->color_format)
> +				new_crtc_state->connectors_changed = true;
> +
>  		}
>  
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index b2cb5ae5a139..2f093b0d1628 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -784,6 +784,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->privacy_screen_sw_state = val;
>  	} else if (property == connector->broadcast_rgb_property) {
>  		state->hdmi.broadcast_rgb = val;
> +	} else if (property == connector->color_format_property) {
> +		state->color_format = drm_color_format_enum_to_color_format(val);
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -869,6 +871,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->privacy_screen_sw_state;
>  	} else if (property == connector->broadcast_rgb_property) {
>  		*val = state->hdmi.broadcast_rgb;
> +	} else if (property == connector->color_format_property) {
> +		*val = drm_color_format_to_color_format_enum(state->color_format);
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..0ad7be0a2d09 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1348,6 +1348,55 @@ static const char * const colorspace_names[] = {
>  	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
>  };
>  
> +u32
> +drm_color_format_to_color_format_enum(enum drm_color_format fmt)
> +{
> +	switch (fmt) {
> +	default:
> +	case DRM_COLOR_FORMAT_AUTO:
> +		return DRM_MODE_COLOR_FORMAT_AUTO;
> +	case DRM_COLOR_FORMAT_RGB444:
> +		return DRM_MODE_COLOR_FORMAT_RGB444;
> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		return DRM_MODE_COLOR_FORMAT_YCBCR444;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		return DRM_MODE_COLOR_FORMAT_YCBCR422;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		return DRM_MODE_COLOR_FORMAT_YCBCR420;
> +	}
> +}
> +
> +u32
> +drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum)
> +{
> +	switch (fmt_enum) {
> +	default:
> +	case DRM_MODE_COLOR_FORMAT_RGB444:
> +		return DRM_COLOR_FORMAT_RGB444;
> +	case DRM_MODE_COLOR_FORMAT_AUTO:
> +		return DRM_COLOR_FORMAT_AUTO;
> +	case DRM_MODE_COLOR_FORMAT_YCBCR444:
> +		return DRM_COLOR_FORMAT_YCBCR444;
> +	case DRM_MODE_COLOR_FORMAT_YCBCR422:
> +		return DRM_COLOR_FORMAT_YCBCR422;
> +	case DRM_MODE_COLOR_FORMAT_YCBCR420:
> +		return DRM_COLOR_FORMAT_YCBCR420;
> +	}

It seems this could be simplified to

	return BIT(fmt_enum);

The above function could also be simplified by using ffs().

> +}
> +
> +/**
> + * drm_get_color_format_name - return a string for color format
> + * @colorspace: color format to compute name of

s/colorspace/color_fmt/

Please make sure to compile the documentation and check for warnings in
the next iteration.

> + *
> + */
> +const char *drm_get_color_format_name(enum drm_color_format color_fmt)
> +{
> +	u32 conv_color_fmt = drm_color_format_to_color_format_enum(color_fmt);
> +
> +	return drm_hdmi_connector_get_output_format_name(conv_color_fmt);
> +}
> +EXPORT_SYMBOL(drm_get_color_format_name);

Could we flip that and make drm_hdmi_connector_get_output_format_name()
a wrapper around drm_get_color_format_name() ?

> +
>  /**
>   * drm_get_colorspace_name - return a string for color encoding
>   * @colorspace: color space to compute name of
> @@ -1377,6 +1426,22 @@ static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
>  	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
>  
> +/* already bit-shifted */
> +static const u32 hdmi_colorformats =
> +	DRM_COLOR_FORMAT_AUTO |
> +	DRM_COLOR_FORMAT_RGB444 |
> +	DRM_COLOR_FORMAT_YCBCR444 |
> +	DRM_COLOR_FORMAT_YCBCR422 |
> +	DRM_COLOR_FORMAT_YCBCR420;
> +
> +/* already bit-shifted */
> +static const u32 dp_colorformats =
> +	DRM_COLOR_FORMAT_AUTO |
> +	DRM_COLOR_FORMAT_RGB444 |
> +	DRM_COLOR_FORMAT_YCBCR444 |
> +	DRM_COLOR_FORMAT_YCBCR422 |
> +	DRM_COLOR_FORMAT_YCBCR420;
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
>   * Format Table 2-120
> @@ -2628,6 +2693,101 @@ int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>  
> +static int drm_mode_create_color_format_property(struct drm_connector *connector,
> +						 u32 supported_color_formats)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_prop_enum_list enum_list[DRM_MODE_COLOR_FORMAT_COUNT];
> +	int i, len;

Neither can be negative, you can use unsigned int.

> +
> +	if (connector->color_format_property)
> +		return 0;
> +
> +	if (!supported_color_formats) {
> +		drm_err(dev, "No supported color formats provded on [CONNECTOR:%d:%s]\n",

s/provded/provided/

> +			    connector->base.id, connector->name);

Incorrect alignment.

> +		return -EINVAL;
> +	}
> +
> +	if ((supported_color_formats & -BIT(DRM_MODE_COLOR_FORMAT_COUNT)) != 0) {

GENMASK(DRM_MODE_COLOR_FORMAT_COUNT - 1, 0)

would be clearer than

-BIT(DRM_MODE_COLOR_FORMAT_COUNT)

> +		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",

s/colorspace/color format/
s/provded/provided/

> +			    connector->base.id, connector->name);
> +		return -EINVAL;
> +	}
> +
> +	len = 0;
> +	for (i = 0; i < DRM_MODE_COLOR_FORMAT_COUNT; i++) {
> +		if (!(supported_color_formats & BIT(i)))
> +			continue;
> +
> +		enum_list[len].type = i;
> +		if (i != DRM_MODE_COLOR_FORMAT_AUTO)
> +			enum_list[len].name = output_format_str[i];
> +		else
> +			enum_list[len].name = "AUTO";
> +		len++;
> +	}
> +
> +	connector->color_format_property =
> +		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
> +					enum_list, len);
> +
> +	if (!connector->color_format_property)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_mode_create_hdmi_color_format_property - create hdmi color format property
> + * @connector: connector to create the color format property on.
> + * @supported_color_formats: bitmap of supported color formats

You don't document that supported_color_formats can be 0. I think I'd
actually drop that possibility, it's not used by drivers in this series,
and it seems to be error-prone. If a later version of HDMI or DP adds
support for more color formats, those would get automatically advertised
while not supported by drivers.

> + *
> + * Called by a driver the first time it's needed, must be attached to desired
> + * HDMI connectors.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_hdmi_color_format_property(struct drm_connector *connector,
> +					       u32 supported_color_formats)
> +{
> +	u32 color_formats;
> +
> +	if (supported_color_formats)
> +		color_formats = supported_color_formats & hdmi_colorformats;
> +	else
> +		color_formats = hdmi_colorformats;
> +
> +	return drm_mode_create_color_format_property(connector, color_formats);
> +}
> +EXPORT_SYMBOL(drm_mode_create_hdmi_color_format_property);

I think we could simplify the API here by picking the defaults based on
the connector type:

int drm_mode_create_color_format_property(struct drm_connector *connector,
					  u32 supported_color_formats)
{
	struct drm_device *dev = connector->dev;
	struct drm_prop_enum_list enum_list[DRM_MODE_COLOR_FORMAT_COUNT];
	unsigned int i, len;

	if (connector->color_format_property)
		return 0;

	switch (connector->type) {
	case DRM_MODE_CONNECTOR_HDMIA:
	case DRM_MODE_CONNECTOR_HDMIB:
		supported_color_formats &= hdmi_colorformats;
		break;

	case DRM_MODE_CONNECTOR_DisplayPort:
	case DRM_MODE_CONNECTOR_eDP:
		supported_color_formats &= dp_colorformats;
		break;

	default:
		drm_err(dev, ...);
		return -EINVAL;
	}

	if (!supported_color_formats) {
		drm_err(dev, "No supported color formats provided on [CONNECTOR:%d:%s]\n",
			connector->base.id, connector->name);
		return -EINVAL;
	}

	...
}

> +
> +/**
> + * drm_mode_create_dp_color_format_property - create dp color format property
> + * @connector: connector to create the Colorspace property on.
> + * @supported_color_formats: bitmap of supported color formats
> + *
> + * Called by a driver the first time it's needed, must be attached to desired
> + * DP connectors.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_dp_color_format_property(struct drm_connector *connector,
> +					     u32 supported_color_formats)
> +{
> +	u32 color_formats;
> +
> +	if (supported_color_formats)
> +		color_formats = supported_color_formats & dp_colorformats;
> +	else
> +		color_formats = dp_colorformats;
> +
> +	return drm_mode_create_color_format_property(connector, color_formats);
> +}
> +EXPORT_SYMBOL(drm_mode_create_dp_color_format_property);
> +
>  /**
>   * drm_mode_create_dp_colorspace_property - create dp colorspace property
>   * @connector: connector to create the Colorspace property on.
> @@ -2845,6 +3005,26 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>  
> +/**
> + * drm_connector_attach_color_format_property - attach "force color format" property
> + * @connector: connector to attach force color format property on.
> + *
> + * This is used to add support for selecting a color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_color_format_property(struct drm_connector *connector)
> +{
> +	struct drm_property *prop = connector->color_format_property;
> +
> +	drm_object_attach_property(&connector->base, prop, DRM_COLOR_FORMAT_AUTO);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> +
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..a071079fd3ad 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -556,6 +556,26 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
>  
> +enum drm_color_format_enum {

Please document this.

> +	DRM_MODE_COLOR_FORMAT_RGB444		= HDMI_COLORSPACE_RGB,
> +	DRM_MODE_COLOR_FORMAT_YCBCR422		= HDMI_COLORSPACE_YUV422,
> +	DRM_MODE_COLOR_FORMAT_YCBCR444		= HDMI_COLORSPACE_YUV444,
> +	DRM_MODE_COLOR_FORMAT_YCBCR420		= HDMI_COLORSPACE_YUV420,
> +	/* auto case, driver will set the color_format */
> +	DRM_MODE_COLOR_FORMAT_AUTO,
> +	DRM_MODE_COLOR_FORMAT_COUNT
> +};
> +
> +enum drm_color_format {
> +	DRM_COLOR_FORMAT_NONE			= 0,
> +	DRM_COLOR_FORMAT_RGB444			= (1 << 0),
> +	DRM_COLOR_FORMAT_YCBCR422		= (1 << 1),
> +	DRM_COLOR_FORMAT_YCBCR444		= (1 << 2),
> +	DRM_COLOR_FORMAT_YCBCR420		= (1 << 3),
> +	/* auto case, driver will set the color_format */
> +	DRM_COLOR_FORMAT_AUTO			= (1 << 4),
> +};

It would be nicer to have a single enum, and use
BIT(DRM_MODE_COLOR_FORMAT_*) wherever a mask is used.

> +
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
>   *
> @@ -699,11 +719,6 @@ struct drm_display_info {
>  	 */
>  	enum subpixel_order subpixel_order;
>  
> -#define DRM_COLOR_FORMAT_RGB444		(1<<0)
> -#define DRM_COLOR_FORMAT_YCBCR444	(1<<1)
> -#define DRM_COLOR_FORMAT_YCBCR422	(1<<2)
> -#define DRM_COLOR_FORMAT_YCBCR420	(1<<3)
> -
>  	/**
>  	 * @panel_orientation: Read only connector property for built-in panels,
>  	 * indicating the orientation of the panel vs the device's casing.
> @@ -1107,6 +1122,13 @@ struct drm_connector_state {
>  	 */
>  	enum drm_colorspace colorspace;
>  
> +	/**
> +	 * @color_format: State variable for Connector property to request
> +	 * color format change on Sink. This is most commonly used to switch
> +	 * between RGB to YUV and vice-versa.
> +	 */
> +	enum drm_color_format color_format;
> +
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors
>  	 *
> @@ -2060,6 +2082,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *colorspace_property;
>  
> +	/**
> +	 * @color_format_property: Connector property to set the suitable
> +	 * color format supported by the sink.
> +	 */
> +	struct drm_property *color_format_property;
> +
>  	/**
>  	 * @path_blob_ptr:
>  	 *
> @@ -2461,6 +2489,12 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>  int drm_mode_create_content_type_property(struct drm_device *dev);
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
>  
> +int drm_mode_create_hdmi_color_format_property(struct drm_connector *connector,
> +					       u32 supported_color_formats);
> +
> +int drm_mode_create_dp_color_format_property(struct drm_connector *connector,
> +					     u32 supported_color_formats);
> +
>  int drm_connector_set_path_property(struct drm_connector *connector,
>  				    const char *path);
>  int drm_connector_set_tile_property(struct drm_connector *connector);
> @@ -2542,6 +2576,16 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>  					struct drm_encoder *encoder);
>  const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>  
> +int drm_connector_attach_color_format_property(struct drm_connector *connector);
> +
> +const char *drm_get_color_format_name(enum drm_color_format color_fmt);
> +
> +u32
> +drm_color_format_to_color_format_enum(enum drm_color_format fmt);

This holds on a single line.

> +
> +u32
> +drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum);

I'd avoid the line break here too.

> +
>  /**
>   * drm_for_each_connector_iter - connector_list iterator macro
>   * @connector: &struct drm_connector pointer used as cursor

-- 
Regards,

Laurent Pinchart
