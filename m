Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA67BB03DB
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1210810E36A;
	Wed,  1 Oct 2025 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X5l8hx87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84510E36A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:50:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 68513C0246F;
 Wed,  1 Oct 2025 11:50:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C5F9606BF;
 Wed,  1 Oct 2025 11:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2651E102F1A1E; 
 Wed,  1 Oct 2025 13:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759319436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=thD7SZCFM3vhx0DXtfp5Lkl8MGtcfqEOGFMFsSqTFj8=;
 b=X5l8hx87gAi+i91lKsPWkSS9KERiR1evaPxG6gHG9kvsJsJZrKrwASDpine85o0GIpXUQn
 +nhK1DvnYUfbvkBpw2ckoqvtzyWKs70YPl/BGkOgmPlAkaaAZT+qHrl/na+OPAOoFK0t5W
 sqXXv7/0qodVwx3Ul99wOqmrgqjKCdvg2AA8qnzWRjt93Jwuoea8ldnW2GSxMtDiQ32emf
 04aEpx9cH1CgICqj9mYJj4Ph+baRZt7zi2BA1SyV97/MYUvs7+PBXgqk6ucQtSvQ4LTzcg
 VH+FlYIVmYT++FLMMRGW+tXIqKyKElXq8XBb3SD1hEGtJaQFpFixjyBuHAOBvQ==
Message-ID: <869d9aa4-f92f-4ddb-a1dd-343e3775471d@bootlin.com>
Date: Wed, 1 Oct 2025 13:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v1 1/5] drm: Add WRITEBACK_COLOR_ENCODING and
 WRITEBACK_COLOR_RANGE properties
To: Robert Mader <robert.mader@collabora.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>, Melissa Wen
 <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-2-robert.mader@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250813170542.331206-2-robert.mader@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 13/08/2025 à 19:05, Robert Mader a écrit :
> Essentially copying the COLOR_ENCODING and COLOR_RANGE plane properties,
> reusing the drm_color_encoding and drm_color_range enums. This
> allows us to advertise and configure the matrix coefficients and ranges
> used to convert between RGB and YCbCr formats and thus helps writeback
> connector implementations that want to advertise YCbCr formats.
 >
> Signed-off-by: Robert Mader <robert.mader@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/drm_atomic_uapi.c |  8 +++
>   drivers/gpu/drm/drm_color_mgmt.c  | 90 +++++++++++++++++++++++++++++++
>   include/drm/drm_color_mgmt.h      |  7 +++
>   include/drm/drm_connector.h       | 17 ++++++
>   include/drm/drm_mode_config.h     | 14 +++++
>   5 files changed, 136 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ecc73d52bfae..12379673dea1 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -774,6 +774,10 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>   
>   		return set_out_fence_for_connector(state->state, connector,
>   						   fence_ptr);
> +	} else if (property == config->writeback_color_encoding) {
> +		state->writeback_color_encoding = val;
> +	} else if (property == config->writeback_color_range) {
> +		state->writeback_color_range = val;
>   	} else if (property == connector->max_bpc_property) {
>   		state->max_requested_bpc = val;
>   	} else if (property == connector->privacy_screen_sw_state_property) {
> @@ -859,6 +863,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>   		*val = 0;
>   	} else if (property == config->writeback_out_fence_ptr_property) {
>   		*val = 0;
> +	} else if (property == config->writeback_color_encoding) {
> +		*val = state->writeback_color_encoding;
> +	} else if (property == config->writeback_color_range) {
> +		*val = state->writeback_color_range;
>   	} else if (property == connector->max_bpc_property) {
>   		*val = state->max_requested_bpc;
>   	} else if (property == connector->privacy_screen_sw_state_property) {
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 37a3270bc3c2..04444c215bf4 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -29,6 +29,7 @@
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_writeback.h>
>   #include <kunit/visibility.h>
>   
>   #include "drm_crtc_internal.h"
> @@ -592,6 +593,95 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>   }
>   EXPORT_SYMBOL(drm_plane_create_color_properties);
>   
> +/**
> + * drm_writeback_create_color_properties - color encoding related writeback connector properties
> + * @wb_connector: writeback connector object
> + * @supported_encodings: bitfield indicating supported color encodings
> + * @supported_ranges: bitfileld indicating supported color ranges
> + * @default_encoding: default color encoding
> + * @default_range: default color range
> + *
> + * Create and attach writeback connector specific WRITEBACK_COLOR_ENCODING and
> + * WRITEBACK_COLOR_RANGE properties to @wb_connector. The supported encodings
> + * and ranges should be provided in supported_encodings and supported_ranges
> + * bitmasks. Each bit set in the bitmask indicates that its number as enum
> + * value is supported.
> + */
> +int drm_writeback_create_color_properties(struct drm_writeback_connector *wb_connector,
> +					  u32 supported_encodings,
> +					  u32 supported_ranges,
> +					  enum drm_color_encoding default_encoding,
> +					  enum drm_color_range default_range)
> +{
> +	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +	struct drm_prop_enum_list enum_list[MAX_T(int, DRM_COLOR_ENCODING_MAX,
> +						       DRM_COLOR_RANGE_MAX)];
> +	int i, len;
> +
> +	if (WARN_ON(supported_encodings == 0 ||
> +		    (supported_encodings & -BIT(DRM_COLOR_ENCODING_MAX)) != 0 ||
> +		    (supported_encodings & BIT(default_encoding)) == 0))
> +		return -EINVAL;
> +
> +	if (WARN_ON(supported_ranges == 0 ||
> +		    (supported_ranges & -BIT(DRM_COLOR_RANGE_MAX)) != 0 ||
> +		    (supported_ranges & BIT(default_range)) == 0))
> +		return -EINVAL;
> +
> +	if (!dev->mode_config.writeback_color_encoding) {
> +		len = 0;
> +		for (i = 0; i < DRM_COLOR_ENCODING_MAX; i++) {
> +			if ((supported_encodings & BIT(i)) == 0)
> +				continue;
> +
> +			enum_list[len].type = i;
> +			enum_list[len].name = color_encoding_name[i];
> +			len++;
> +		}
> +
> +		prop = drm_property_create_enum(dev, 0,
> +						"WRITEBACK_COLOR_ENCODING",
> +						enum_list, len);
> +		if (!prop)
> +			return -ENOMEM;
> +		dev->mode_config.writeback_color_encoding = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.writeback_color_encoding,
> +				   default_encoding);
> +	if (connector->state)
> +		connector->state->writeback_color_encoding = default_encoding;
> +
> +	if (!dev->mode_config.writeback_color_range) {
> +		len = 0;
> +		for (i = 0; i < DRM_COLOR_RANGE_MAX; i++) {
> +			if ((supported_ranges & BIT(i)) == 0)
> +				continue;
> +
> +			enum_list[len].type = i;
> +			enum_list[len].name = color_range_name[i];
> +			len++;
> +		}
> +
> +		prop = drm_property_create_enum(dev, 0, "WRITEBACK_COLOR_RANGE",
> +						enum_list, len);
> +		if (!prop)
> +			return -ENOMEM;
> +		dev->mode_config.writeback_color_range = prop;
> +	}
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.writeback_color_range,
> +				   default_range);
> +	if (connector->state)
> +		connector->state->writeback_color_range = default_range;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_writeback_create_color_properties);
> +
>   /**
>    * drm_color_lut_check - check validity of lookup table
>    * @lut: property blob containing LUT to check
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 6cb577f6dba6..60146e3063fd 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -29,6 +29,7 @@
>   
>   struct drm_crtc;
>   struct drm_plane;
> +struct drm_writeback_connector;
>   
>   /**
>    * drm_color_lut_extract - clamp and round LUT entries
> @@ -91,6 +92,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>   				      enum drm_color_encoding default_encoding,
>   				      enum drm_color_range default_range);
>   
> +int drm_writeback_create_color_properties(struct drm_writeback_connector *wb_connector,
> +					  u32 supported_encodings,
> +					  u32 supported_ranges,
> +					  enum drm_color_encoding default_encoding,
> +					  enum drm_color_range default_range);
> +
>   /**
>    * enum drm_color_lut_tests - hw-specific LUT tests to perform
>    *
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..178bfbcb13e3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -28,6 +28,7 @@
>   #include <linux/ctype.h>
>   #include <linux/hdmi.h>
>   #include <linux/notifier.h>
> +#include <drm/drm_color_mgmt.h>
>   #include <drm/drm_mode_object.h>
>   #include <drm/drm_util.h>
>   #include <drm/drm_property.h>
> @@ -1120,6 +1121,22 @@ struct drm_connector_state {
>   	 */
>   	struct drm_writeback_job *writeback_job;
>   
> +	/**
> +	 * @writeback_color_encoding:
> +	 *
> +	 * Color encoding for non RGB formats used by writeback connectors.
> +	 * See also: drm_writeback_create_color_properties()
> +	 */
> +	enum drm_color_encoding writeback_color_encoding;
> +
> +	/**
> +	 * @writeback_color_range:
> +	 *
> +	 * Color encoding for non RGB formats used by writeback connectors.
> +	 * See also: drm_writeback_create_color_properties()
> +	 */
> +	enum drm_color_range writeback_color_range;
> +
>   	/**
>   	 * @max_requested_bpc: Connector property to limit the maximum bit
>   	 * depth of the pixels.
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2e848b816218..1d2a7cb6d410 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -863,6 +863,20 @@ struct drm_mode_config {
>   	 */
>   	struct drm_property *writeback_out_fence_ptr_property;
>   
> +	/**
> +	 * @writeback_color_encoding: Optional property for writeback
> +	 * connectors, color encoding for non RGB formats.
> +	 * See also: drm_writeback_create_color_properties()
> +	 */
> +	struct drm_property *writeback_color_encoding;
> +
> +	/**
> +	 * @writeback_color_range: Optional property for writeback connectors,
> +	 * color range for non RGB formats.
> +	 * See also: drm_writeback_create_color_properties()
> +	 */
> +	struct drm_property *writeback_color_range;
> +
>   	/**
>   	 * @hdr_output_metadata_property: Connector property containing hdr
>   	 * metatada. This will be provided by userspace compositors based

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



