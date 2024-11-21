Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DB9D5618
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 00:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169B510EA82;
	Thu, 21 Nov 2024 23:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F4s2626t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2151110EA7F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 23:13:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53a007743e7so1634386e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732230837; x=1732835637; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dQ3M7O1CKkB0KcH+SACfFEVocdkwnvDh589hVTyunko=;
 b=F4s2626t6EO4HGjqYUDXBm/o9NmIMq4K0WnglK3/a1Ir+sHRastV5Yy+WnOIvqbOY6
 W0OFAI31QuD+vC30avaP8kwQjlALztJbRozo1ZKeS1Df+KfL4QW0KoTqejCh7HEwAXxT
 5MoJM47EUSDx8wC1Ob1X6CtFE/EZdcGtlmuAjvEBpYeqHUrT9waM0yMvuX7+iBe81sQ9
 5mvpfatJc0we1/N9i9tJXQrU4XVmWUf5G4s8FSfxcvwg52wttd9+1PHu3RAxC1gx9M7h
 ZIccTsMtlfCNKovB9LRFLu7kSzMjFLWDC0TliLDeRYBHhIJU7Q35RUVav0t0j38Xpa1R
 Ma0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732230837; x=1732835637;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQ3M7O1CKkB0KcH+SACfFEVocdkwnvDh589hVTyunko=;
 b=azwuU5SaujfPgZjIOVGhgweuQ5docaqgmiN/4AZMeRHQVbUAEah7PqCnFMZGohnwmI
 gnHh1iRXjx/rRFV3yl2gk+rnbzpcxEIAAcmxRrU1ScKwgrJwqIoYkyamYj66Bp3RFkPj
 lMxeza305e+W+tOKQqneuyjPVw8HAHcYbwx63W9v0PnKmqu2Hc0S9nK05jztjq1uJYKB
 fQxoi3zKIatAsjZSaULlxm9E8JBeAf3tsjqRQTC1/u4WZBnAlOVcp3sIoJBw1lNLoVZG
 m/r6JmlX9OCBKr1MXXrxVpEAE5q/taUN08pl21VEcNfmA+c6Ds6OQV/nmy85kTbkC08C
 kQeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVek693mUapy6SzdDc+rvIbPcJKFWy4kkiiLvn855erpUhqNfGKrkfZO28Wuzsvp3eVjM66Q46HHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/NL7fWvq0P/X+cC9oV8Iky/0jbZ2rEOIgOumSfG57brocgAhh
 7DXQ21QRvd7Qi+DxaMUyvnuuEB0bL/HUpCz8cTcRSXhgsp447T0VpxJuskTo5lw=
X-Gm-Gg: ASbGncvL/+UJjtqOzuyyxnUF18yfEjcqgRfxwtJKiIgHlH9lDHh/xcHfko0CGoNOCgF
 TFvpnJ0ltgYHiefmNaXdryLbw1nZz8GVOOfNVTbySKzi792JIQfyagce78QIsaLolKJEj0oybQ0
 9p4KwUbyDbP+r0wcUbYAZpQbwPP8duSPsdM2006Ays+a21PGwaKXJdgS7Krl1HjHLOYPzomogtx
 6p2Xv9yL6zS3Lsd4POOAzttNDZy9TV2G0FLkX6M7IKq7reNe/s9cvaKzYtnnzzYh+RsgPIovAnc
 /K66TfnsueB+DFhEAlG8QJcBE1JwmQ==
X-Google-Smtp-Source: AGHT+IGiYeiOYxBaZWAyM/cNUOd4OU262iTOBGAhsDxF1H2njzHI98/8XdlOQisbezp9NEOO3/s7Wg==
X-Received: by 2002:a05:6512:b97:b0:53d:d278:d31d with SMTP id
 2adb3069b0e04-53dd36a032dmr285294e87.16.1732230836592; 
 Thu, 21 Nov 2024 15:13:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd248130dsm107836e87.154.2024.11.21.15.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 15:13:55 -0800 (PST)
Date: Fri, 22 Nov 2024 01:13:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Message-ID: <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-6-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121122603.736267-6-arun.r.murthy@intel.com>
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

On Thu, Nov 21, 2024 at 05:56:00PM +0530, Arun R Murthy wrote:
> CRTC properties have been added for enable/disable histogram, reading
> the histogram data and writing the IET data.
> "HISTOGRAM_EN" is the crtc property to enable/disable the global
> histogram and takes a value 0/1 accordingly.
> "Histogram" is a crtc property to read the binary histogram data.
> "Global IET" is a crtc property to write the IET binary LUT data.
> 
> v2: Read the histogram blob data before sending uevent (Jani)
> v3: use drm_property_replace_blob_from_id (Vandita)
>     Add substruct for histogram in intel_crtc_state (Jani)
> v4:  Rebased after addressing comments on patch 1
> v5: histogram check with old/new crtc_state (Suraj)
> v6: Rebase
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     | 166 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  16 ++
>  .../drm/i915/display/intel_display_types.h    |  13 ++
>  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
>  6 files changed, 210 insertions(+), 1 deletion(-)

Please provide the documentation for these properties: binary format,
etc. Also, ideally such a properties should be defined in a
vendor-neutral way, so that other drivers also can implement support for
similar functionality.

> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 03dc54c802d3..a0d64a20b01e 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  
>  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
>  
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_get(crtc_state->histogram.global_iet);
>  	/* copy color blobs */
>  	if (crtc_state->hw.degamma_lut)
>  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> @@ -278,6 +280,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color_vblank = NULL;
>  	crtc_state->dsb_commit = NULL;
>  	crtc_state->use_dsb = false;
> +	crtc_state->histogram.histogram_enable_changed = false;
>  
>  	return &crtc_state->uapi;
>  }
> @@ -314,6 +317,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_commit);
>  
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_put(crtc_state->histogram.global_iet);
>  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
>  	intel_crtc_free_hw_state(crtc_state);
>  	if (crtc_state->dp_tunnel_ref.tunnel)
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index a2c528d707f4..2ace7a8c20d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_vblank_work.h>
> +#include <drm/drm_atomic_uapi.h>
>  
>  #include "i915_vgpu.h"
>  #include "i9xx_plane.h"
> @@ -27,6 +28,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
>  static void intel_crtc_free(struct intel_crtc *crtc)
>  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>  
> @@ -229,6 +232,64 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
>  	return 0;
>  }
>  
> +static int intel_crtc_get_property(struct drm_crtc *crtc,
> +				   const struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t *val)
> +{
> +	const struct intel_crtc_state *intel_crtc_state =
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
> +
> +	if (property == intel_crtc->histogram_en_property) {
> +		*val = intel_crtc_state->histogram.histogram_enable;
> +	} else if (property == intel_crtc->global_iet_property) {
> +		*val = (intel_crtc_state->histogram.global_iet) ?
> +			intel_crtc_state->histogram.global_iet->base.id : 0;
> +	} else if (property == intel_crtc->histogram_property) {
> +		*val = (intel_crtc_state->histogram.histogram) ?
> +			intel_crtc_state->histogram.histogram->base.id : 0;
> +	} else {
> +		drm_err(crtc->dev,
> +			"Unknown property [PROP:%d:%s]\n",
> +			property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_crtc_set_property(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   u64 val)
> +{
> +	struct intel_crtc_state *intel_crtc_state =
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
> +	bool replaced = false;
> +
> +	if (property == intel_crtc->histogram_en_property) {
> +		intel_crtc_state->histogram.histogram_enable = val;
> +		return 0;
> +	}
> +
> +	if (property == intel_crtc->global_iet_property) {
> +		drm_property_replace_blob_from_id(crtc->dev,
> +						  &intel_crtc_state->histogram.global_iet,
> +						  val,
> +						  sizeof(uint32_t) * HISTOGRAM_IET_LENGTH,
> +						  -1, &replaced);
> +		if (replaced)
> +			intel_crtc_state->histogram.global_iet_changed = true;
> +		return 0;
> +	}
> +
> +	drm_dbg_atomic(crtc->dev, "Unknown property [PROP:%d:%s]\n",
> +		       property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
>  #define INTEL_CRTC_FUNCS \
>  	.set_config = drm_atomic_helper_set_config, \
>  	.destroy = intel_crtc_destroy, \
> @@ -238,7 +299,9 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
>  	.set_crc_source = intel_crtc_set_crc_source, \
>  	.verify_crc_source = intel_crtc_verify_crc_source, \
>  	.get_crc_sources = intel_crtc_get_crc_sources, \
> -	.late_register = intel_crtc_late_register
> +	.late_register = intel_crtc_late_register, \
> +	.atomic_set_property = intel_crtc_set_property, \
> +	.atomic_get_property = intel_crtc_get_property
>  
>  static const struct drm_crtc_funcs bdw_crtc_funcs = {
>  	INTEL_CRTC_FUNCS,
> @@ -383,6 +446,10 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
> +	intel_histogram_init(crtc);
> +
> +	/* Initialize crtc properties */
> +	intel_crtc_add_property(crtc);
>  
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> @@ -737,3 +804,100 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
>  out:
>  	intel_psr_unlock(new_crtc_state);
>  }
> +
> +static const struct drm_prop_enum_list histogram_enable_names[] = {
> +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> +	{ INTEL_HISTOGRAM_ENABLE, "Enable" },
> +};
> +
> +/**
> + * intel_attach_histogram_en_property() - add property to enable/disable histogram
> + * @intel_crtc: pointer to the struct intel_crtc on which the global histogram is to
> + *		be enabled/disabled
> + *
> + * "Histogram_Enable" is the crtc propety to enable/disable global histogram
> + */
> +void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop = intel_crtc->histogram_en_property;
> +	if (!prop) {
> +		prop = drm_property_create_enum(dev, 0,
> +						"Histogram_Enable",
> +						histogram_enable_names,
> +						ARRAY_SIZE(histogram_enable_names));
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_en_property = prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +}
> +
> +/**
> + * intel_attach_global_iet_property() - add property to write Image Enhancement data
> + * @intel_crtc: pointer to the struct intel_crtc on which global histogram is enabled
> + *
> + * "Global IET" is the crtc property to write the Image Enhancement LUT binary data
> + */
> +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop = intel_crtc->global_iet_property;
> +	if (!prop) {
> +		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_ATOMIC,
> +					   "Global IET", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->global_iet_property = prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +}
> +
> +/**
> + * intel_attach_histogram_property() - crtc property to read the histogram.
> + * @intel_crtc: pointer to the struct intel_crtc on which the global histogram
> + *		was enabled.
> + * "Global Histogram" is the crtc property to read the binary histogram data.
> + */
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +	struct drm_property_blob *blob;
> +
> +	prop = intel_crtc->histogram_property;
> +	if (!prop) {
> +		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
> +					   DRM_MODE_PROP_ATOMIC |
> +					   DRM_MODE_PROP_IMMUTABLE,
> +					   "Global Histogram", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_property = prop;
> +	}
> +	blob = drm_property_create_blob(dev, sizeof(uint32_t) * HISTOGRAM_BIN_COUNT, NULL);
> +	intel_crtc->config->histogram.histogram = blob;
> +
> +	drm_object_attach_property(&crtc->base, prop, blob->base.id);
> +}
> +
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc)
> +{
> +	intel_attach_histogram_en_property(intel_crtc);
> +	intel_attach_histogram_property(intel_crtc);
> +	intel_attach_global_iet_property(intel_crtc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
> index de54ae1deedf..91c351506a6e 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> @@ -59,4 +59,9 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
>  				     enum pipe pipe);
>  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
>  
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc);
> +void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc);
> +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc);
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index e790a2de5b3d..3ee462b479d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4607,6 +4608,9 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> +	if (crtc_state->histogram.histogram_enable_changed)
> +		return intel_histogram_atomic_check(crtc);
> +
>  	return 0;
>  }
>  
> @@ -6826,6 +6830,11 @@ int intel_atomic_check(struct drm_device *dev,
>  		if (new_crtc_state->uapi.scaling_filter !=
>  		    old_crtc_state->uapi.scaling_filter)
>  			new_crtc_state->uapi.mode_changed = true;
> +
> +		/* Histogram updates */
> +		if (old_crtc_state->histogram.histogram_enable !=
> +		    new_crtc_state->histogram.histogram_enable)
> +			new_crtc_state->histogram.histogram_enable_changed = true;
>  	}
>  
>  	intel_vrr_check_modeset(state);
> @@ -7892,6 +7901,13 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank = fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_commit = fetch_and_zero(&new_crtc_state->dsb_commit);
> +
> +		if (new_crtc_state->histogram.histogram_enable_changed)
> +			intel_histogram_update(crtc,
> +					       new_crtc_state->histogram.histogram_enable);
> +		if (new_crtc_state->histogram.global_iet_changed)
> +			intel_histogram_set_iet_lut(crtc,
> +						    (u32 *)new_crtc_state->histogram.global_iet->data);
>  	}
>  
>  	/* Underruns don't always raise interrupts, so check manually */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 351441efd10a..300e90998463 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1306,6 +1306,15 @@ struct intel_crtc_state {
>  
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	/* Histogram data */
> +	struct {
> +		int histogram_enable;
> +		struct drm_property_blob *global_iet;
> +		struct drm_property_blob *histogram;
> +		bool global_iet_changed;
> +		bool histogram_enable_changed;
> +	} histogram;
>  };
>  
>  enum intel_pipe_crc_source {
> @@ -1415,6 +1424,10 @@ struct intel_crtc {
>  	struct pm_qos_request vblank_pm_qos;
>  
>  	struct intel_histogram *histogram;
> +	/* HISTOGRAM properties */
> +	struct drm_property *histogram_en_property;
> +	struct drm_property *global_iet_property;
> +	struct drm_property *histogram_property;
>  
>  #ifdef CONFIG_DEBUG_FS
>  	struct intel_pipe_crc pipe_crc;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 243469c8ea80..9148665747ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -68,6 +68,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
>  		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
>  	for (retry = 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++) {
>  		if (intel_histogram_get_data(intel_crtc)) {
> +			drm_property_replace_global_blob(display->drm,
> +				&intel_crtc->config->histogram.histogram,
> +				sizeof(histogram->bin_data),
> +				histogram->bin_data, &intel_crtc->base.base,
> +				intel_crtc->histogram_property);
>  			/* Notify user for Histogram rediness */
>  			if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
>  					       KOBJ_CHANGE, histogram_event))
> @@ -194,6 +199,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
>  
>  	cancel_delayed_work(&histogram->work);
>  	histogram->enable = false;
> +	intel_crtc->config->histogram.histogram_enable = false;
>  }
>  
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
