Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B5B55040
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426F310EC5D;
	Fri, 12 Sep 2025 14:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Bnit0//5";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="aG4bUBut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1059 seconds by postgrey-1.36 at gabe;
 Fri, 12 Sep 2025 14:03:21 UTC
Received: from a7-40.smtp-out.eu-west-1.amazonses.com
 (a7-40.smtp-out.eu-west-1.amazonses.com [54.240.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A8110EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1757684740;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=muGnsUiM/N7Mikr+iKfQWFkO3KfES5kdEfUpVh3SFOw=;
 b=Bnit0//5cvKTUb+sZCklbrOlghqleNU+AowJf6h6PocGLQUavJ9DWN0Fuw1Aqjq0
 F2wyFdC6KyBlimsqyswfqGMxTyOcqHtS2NUBStBnDeCgMvI130R8Fz5itOL2htaHWZj
 WWn9PcVftlrUi9C7IKPMp2VSwsV46qIJzYDVlPvTeoxFG0W1Gxmnj1VgaNBbZXTCjbG
 AHjiY9TcKL0VmJCnnqOBpKJ6eHjH3Fvfc1YkWx+0zEfC1DZ4ndCdDmQQNfQwDiGs4P+
 i3ilPwE8Udq+msY/jyl1E1QYyReYhNoVZM4aVxUxNPzY9wz9o6pTsNWzE1h2crMZVaS
 3OSHDe5TIw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1757684740;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=muGnsUiM/N7Mikr+iKfQWFkO3KfES5kdEfUpVh3SFOw=;
 b=aG4bUButDPYBhOGFo7ru0AwI4WvojHVWAPqSam7bq2VfbXSKC/GVMmSMdWoAiTKN
 QbMXfAyrZVKWSRDJdlItwd0liWWqIf0mU6rKYvsD6f+ErWSeFIddD4XkCDVok8ZsEyl
 SimEk2QcIbi2yqIxPVVTA2zX9ZdZHVzooeZuyEnY=
Message-ID: <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
Date: Fri, 12 Sep 2025 13:45:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Chuanyu Tseng <Chuanyu.Tseng@amd.com>, dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, Mario.Limonciello@amd.com, xaver.hugl@gmail.com, 
 mdaenzer@redhat.com, victoria@system76.com, seanpaul@google.com, 
 Sunpeng.Li@amd.com
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.09.12-54.240.7.40
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

On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
> Introduce a DRM interface for DRM clients to further restrict the
> VRR Range within the panel supported VRR range on a per-commit
> basis.
>
> The goal is to give DRM client the ability to do frame-doubling/
> ramping themselves, or to set lower static refresh rates for power
> savings.

I'm interested in limiting the range of VRR to enable HDMI's 
QMS/CinemaVRR features - ie: switching to a fixed rate for media 
playback without incurring screen blackouts/resyncs/"bonks" during the 
switch.

I could see using an interface such as this to do the frame rate 
limiting, by setting the lower and upper bounds both to a media file's 
framerate. However for that use case it's not precise enough, as video 
may have a rate like 23.9760239... FPS.

Would it be better to expose the limits as a numerator/denominator pair 
so a rate can be something like 24000/1001fps?

Thanks,
Derek

> This is done through 2 new CRTC properties, along with a client
> cap. See the docstrings in patch for details.
>
> This RFC doesn't include a driver-side implementation yet; that is
> coming soon. Currently, looking to get some comments on whether this
> interface makes sense for both compositor and drivers
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 30 +++++++++++++++++++++---
>   drivers/gpu/drm/drm_connector.c   | 25 ++++++++++++++++++++
>   drivers/gpu/drm/drm_file.c        |  2 ++
>   drivers/gpu/drm/drm_ioctl.c       |  7 ++++++
>   drivers/gpu/drm/drm_mode_config.c | 14 ++++++++++++
>   include/drm/drm_connector.h       |  1 +
>   include/drm/drm_crtc.h            | 38 +++++++++++++++++++++++++++++++
>   include/drm/drm_file.h            | 10 ++++++++
>   include/drm/drm_mode_config.h     | 18 +++++++++++++++
>   include/uapi/drm/drm.h            | 17 ++++++++++++++
>   10 files changed, 159 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 85dbdaa4a2e2..73f929cff4e1 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -365,8 +365,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
>   }
>   
>   static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state, struct drm_property *property,
> -		uint64_t val)
> +		struct drm_crtc_state *state, struct drm_file *file_priv,
> +		struct drm_property *property, uint64_t val)
>   {
>   	struct drm_device *dev = crtc->dev;
>   	struct drm_mode_config *config = &dev->mode_config;
> @@ -421,6 +421,26 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		state->scaling_filter = val;
>   	} else if (crtc->funcs->atomic_set_property) {
>   		return crtc->funcs->atomic_set_property(crtc, state, property, val);
> +	} else if (property == config->prop_vrr_range_control_min) {
> +		if (file_priv->vrr_range_control) {
> +			drm_dbg_atomic(dev, "Setting vrr_range_min crtc property not"
> +				"permitted with DRM_CLIENT_CAP_VRR_RANGE_CONTROL"
> +				"client cap\n");
> +			return -EINVAL;
> +		}
> +		if (!val)
> +			return -EINVAL;
> +		state->vrr_range_min = val;
> +	} else if (property == config->prop_vrr_range_control_max) {
> +		if (file_priv->vrr_range_control) {
> +			drm_dbg_atomic(dev,"Setting vrr_range_max crtc property not"
> +				"permitted with DRM_CLIENT_CAP_VRR_RANGE_CONTROL"
> +				"client cap\n");
> +			return -EINVAL;
> +		}
> +		if (!val)
> +			return -EINVAL;
> +		state->vrr_range_max = val;
>   	} else {
>   		drm_dbg_atomic(crtc->dev,
>   			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
> @@ -446,6 +466,10 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>   		*val = (state->mode_blob) ? state->mode_blob->base.id : 0;
>   	else if (property == config->prop_vrr_enabled)
>   		*val = state->vrr_enabled;
> +	else if (property == config->prop_vrr_range_control_min)
> +		*val = state->vrr_range_min;
> +	else if (property == config->prop_vrr_range_control_max)
> +		*val = state->vrr_range_max;
>   	else if (property == config->degamma_lut_property)
>   		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
>   	else if (property == config->ctm_property)
> @@ -1062,7 +1086,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		}
>   
>   		ret = drm_atomic_crtc_set_property(crtc,
> -				crtc_state, prop, prop_value);
> +				crtc_state, file_priv, prop, prop_value);
>   		break;
>   	}
>   	case DRM_MODE_OBJECT_PLANE: {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..dc4b50ff5fe0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2866,6 +2866,31 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>   }
>   EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>   
> +/**
> + * drm_connector_attach_vrr_range_control_property - attach "VRR_RANGE_CONTROL_MIN" and
> + * "VRR_RANGE_CONTROL_MAX" property
> + *
> + * @connector: connector to attach the property on.
> + *
> + * This is used to allow the userspace to send VRR range control min and max value to the
> + * driver.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop_min = dev->mode_config.prop_vrr_range_control_min;
> +	struct drm_property *prop_max = dev->mode_config.prop_vrr_range_control_max;
> +
> +	drm_object_attach_property(&connector->base, prop_min, 0);
> +	drm_object_attach_property(&connector->base, prop_max, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_vrr_range_control_property);
> +
>   /**
>    * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
>    * @connector: connector to attach the property on.
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index eebd1a05ee97..7ed28e94544a 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -157,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	init_waitqueue_head(&file->event_wait);
>   	file->event_space = 4096; /* set aside 4k for event buffer */
>   
> +	file->vrr_range_control = false; /* set as false for init */
> +
>   	spin_lock_init(&file->master_lookup_lock);
>   	mutex_init(&file->event_read_lock);
>   	mutex_init(&file->client_name_lock);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d8a24875a7ba..273139688ba1 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -373,6 +373,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   			return -EINVAL;
>   		file_priv->supports_virtualized_cursor_plane = req->value;
>   		break;
> +	case DRM_CLIENT_CAP_VRR_RANGE_CONTROL:
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value == 0)
> +			return -EINVAL;
> +		file_priv->vrr_range_control = req->value;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 25f376869b3a..1f74284208c6 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -340,6 +340,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>   		return -ENOMEM;
>   	dev->mode_config.prop_vrr_enabled = prop;
>   
> +	prop = drm_property_create_range(dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
> +			"VRR-RANGE-CONTROL-MIN", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.prop_vrr_range_control_min = prop;
> +
> +	prop = drm_property_create_range(dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
> +			"VRR-RANGE-CONTROL-MAX", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.prop_vrr_range_control_max = prop;
> +
>   	prop = drm_property_create(dev,
>   			DRM_MODE_PROP_BLOB,
>   			"DEGAMMA_LUT", 0);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..dd2c3337235a 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2451,6 +2451,7 @@ int drm_connector_attach_vrr_capable_property(
>   int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
>   int drm_connector_attach_colorspace_property(struct drm_connector *connector);
>   int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
> +int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector);
>   bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
>   					     struct drm_connector_state *new_state);
>   int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2..39d1bf66f713 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -299,6 +299,44 @@ struct drm_crtc_state {
>   	 */
>   	bool vrr_enabled;
>   
> +	/** @vrr_range_min:
> +	 *
> +	 * This is desired minimal FPS number.
> +	 *
> +	 * Default state is 'vrr_range_min = 0', (and 'vrr_range_max = 0'),
> +	 * indicating legacy VRR_ENABLED behavior. if both are set to a non-zeo
> +	 * value, the new VRR range control behavior will be active.  See
> +	 * &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
> +	 *
> +	 * If setting a non-zero value, the driver should check that:
> +	 *
> +	 * 1. Both vrr_range_min and vrr_range_max are set to a non-zero value.
> +	 *    This indicates the driver to switch the new VRR range control
> +	 *    behavior.
> +	 * 2. Both vrr_rage_min and vrr_range_max are within the panel's supported
> +	 *    FPS range.
> +	 * 3. vrr_range_min is less-than-or-equal-to vrr_range_max.
> +	 */
> +	uint16_t vrr_range_min;
> +
> +	/** @vrr_range_max:
> +	 *
> +	 * Default state is 'vrr_range_max = 0', (and 'vrr_range_min = 0'),
> +	 * indicating legacy VRR_ENABLED behavior. if both are set to a non-zeo
> +	 * value, the new VRR range control behavior will be active.  See
> +	 * &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
> +	 *
> +	 * If setting a non-zero value, the driver should check that:
> +	 *
> +	 * 1. Both vrr_range_min and vrr_range_max are set to a non-zero value.
> +	 *    This indicates the driver to switch the new VRR range control
> +	 *    behavior.
> +	 * 2. Both vrr_rage_min and vrr_range_max are within the panel's supported
> +	 *    FPS range.
> +	 * 3. vrr_range_min is less-than-or-equal-to vrr_range_max.
> +	 */
> +	uint16_t vrr_range_max;
> +
>   	/**
>   	 * @self_refresh_active:
>   	 *
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 115763799625..4cb57a503a02 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -240,6 +240,16 @@ struct drm_file {
>   	 */
>   	bool supports_virtualized_cursor_plane;
>   
> +	/**
> +	 * @vrr_range_control:
> +	 *
> +	 * If set to true, the DRM driver will allow setting of the
> +	 * &drm_mode_config.prop_vrr_range_control_min_property and
> +	 * &drm_mode_config.prop_vrr_range_control_max_property CRTC
> +	 * properties, if the properties are supported by the driver.
> +	 */
> +	bool vrr_range_control;
> +
>   	/**
>   	 * @master:
>   	 *
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2e848b816218..e02dd46ca5c2 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -680,6 +680,24 @@ struct drm_mode_config {
>   	 */
>   	struct drm_property *prop_vrr_enabled;
>   
> +	/**
> +	 * @prop_vrr_range_control_min_property: Optional CRTC properties to
> +	 * further limit the minimum allowed refresh rate within the panel's
> +	 * supported refresh rate range. It's invalid to set unless the
> +	 * client advertises &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
> +	 * See also &drm_ctrc_state.vrr_range_min.
> +	 */
> +	struct drm_property *prop_vrr_range_control_min;
> +
> +	/**
> +	 * @prop_vrr_range_control_max_property: Optional CRTC properties to
> +	 * further limit the maximum allowed refresh rate within the panel's
> +	 * supported refresh rate range. It's invalid to set unless the
> +	 * client advertises &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
> +	 * See also &drm_ctrc_state.vrr_range_max.
> +	 */
> +	struct drm_property *prop_vrr_range_control_max;
> +
>   	/**
>   	 * @dvi_i_subconnector_property: Optional DVI-I property to
>   	 * differentiate between analog or digital mode.
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3cd5cf15e3c9..e4d918342e67 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -906,6 +906,23 @@ struct drm_get_cap {
>    */
>   #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>   
> +/**
> + * DRM_CLIENT_CAP_VRR_RANGE_CONTROL
> + *
> + * The driver shall not program a refresh rate that is:
> + * - Below the &drm_crtc_state.vrr_range_min, nor
> + * - Above the &drm_crtc_state.vrr_range_max
> + * Even if the panel supports a wider range than the range requested.
> + *
> + * Once set, the driver will allow setting of the
> + *
> + * - &drm_mode_config.prop_vrr_range_control_min and
> + * - &drm_mode_config.prop_vrr_range_control_max properties.
> + *
> + * Otherwise, setting them will be invalid.
> + */
> +#define DRM_CLIENT_CAP_VRR_RANGE_CONTROL 7
> +
>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>   struct drm_set_client_cap {
>   	__u64 capability;
