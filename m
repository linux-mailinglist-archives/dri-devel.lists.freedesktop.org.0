Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C608365E2AB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 02:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD810E61F;
	Thu,  5 Jan 2023 01:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AF410E61E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 01:50:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f34so53028102lfv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 17:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6JDNPCrXmgVUWvMzL7JdWByPNqCXxjnlLiCHyIsb4kU=;
 b=MvaUMjaJgMgogTaacRoSynDVgkj06uukHo/MD2z+5IKJUn5ddI3edBpdukapU+GNFX
 6ypyeNilAq9BdEAFcbm3oZSE+VEDJfJqZy7kZafaqNhWUFwqQbtLI+HdDPKGY9KRLoVC
 0ywIj0Krq8CzVKhAF8UqmpPZ1sA/Z6+K1yFI4n73sHf74kgvGtk2ewVf9uRm+2YOurAO
 vnOv7OEi/d+6lpFWzxvvKeSn8zjTda6i4BOgXIT2Ua8HPpV00OEF2vM9bF42gbgOdtwF
 cadxsNWk7KXNJNEsfn/XN86Po5FfMU/Do8NcA3M61vBgrynDInMr/3U/U2fa3xG0J4Zj
 X8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JDNPCrXmgVUWvMzL7JdWByPNqCXxjnlLiCHyIsb4kU=;
 b=MaNLREU6fC0nzCKgjhU11uXfWEsyoMQ4bDxx3kv6yRmcWjcvWmqgqfTWIuEJ9PNVle
 PXFYaX6eHVErcQ01fmxPRamPTxex8fCOSo87yWbA+q2jlCVhO5JiYTmau8ietKoFiBXG
 bg4nkicUP2PAB5FIbXQaw5zM5coUu5fKw/c3MdtAQXzJhQiApWGB9TcwSCH5NgS+JUVo
 zuqu532R3JLUZyI5bgWWDvYeRU2xsNp+L51/zjn7CAkfEWvZPZs6TPCvR4LT6fisPMk8
 Gu1dI6P4SO8VOm+DMqKMZ30cl64QrEdEhERVIau10C8CVTMr+CcSqpdhtHDtrccChVXA
 GCxA==
X-Gm-Message-State: AFqh2kqq+mGZg2hyYvTyQubrf01ohiMW0r4PnKWCSqnmRPFNLrpTUicx
 D3wMiAnBqoBoRJKEQPQMEamJGCphDkBfz6KZ
X-Google-Smtp-Source: AMrXdXsuFEYRr6EwDYQOpFrUvRBJvSb4+lVgH/TIoeA9bHBB3WC18mdaNSHT2ipWR36asubCvVkgbg==
X-Received: by 2002:a05:6512:ea2:b0:4b5:5bcc:cbcd with SMTP id
 bi34-20020a0565120ea200b004b55bcccbcdmr13948131lfb.0.1672883434145; 
 Wed, 04 Jan 2023 17:50:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f23-20020ac25337000000b004a27d2ea029sm5273648lfh.172.2023.01.04.17.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 17:50:33 -0800 (PST)
Message-ID: <9d1be5e6-b2eb-3238-c562-9bc1c8c375bc@linaro.org>
Date: Thu, 5 Jan 2023 03:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104234036.636-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 01:40, Jessica Zhang wrote:
> Add support for solid_fill property to drm_plane. In addition, add
> support for setting and getting the values for solid_fill.
> 
> solid_fill holds data for supporting solid fill planes. The property
> accepts an RGB323232 value and the driver data is formatted as such:
> 
> struct drm_solid_fill {
> 	u32 r;
> 	u32 g;
> 	u32 b;
> };

This description is unnecessary (and confusing), since you describe 
drm_solid_fill_info below.

> 
> To enable solid fill planes, userspace must assigned solid_fill to a

must assign. Also the phrasing seems strange. The blob is assigned to 
the 'solid_fill' property, not the other way around.

> property blob containing the following information:

This should clearly describe if solid_fill overrides FB or if FB 
overrides solid_fill. Also please extend properties documentation in 
Documentation/gpu/drm-kms.rst.

> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;
> };
> 
> Changes in V2:
> - Changed solid_fill property to a property blob (Simon, Dmitry)
> - Added drm_solid_fill struct (Simon)
> - Added drm_solid_fill_info struct (Simon)
> 
> Changes in V3:
> - Corrected typo in drm_solid_fill struct documentation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>   drivers/gpu/drm/drm_blend.c               | 17 +++++++
>   include/drm/drm_blend.h                   |  1 +
>   include/drm/drm_plane.h                   | 43 +++++++++++++++++
>   5 files changed, 129 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index dfb57217253b..c96fd1f2ad99 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>   	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>   	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>   
> +	if (plane_state->solid_fill_blob) {
> +		drm_property_blob_put(plane_state->solid_fill_blob);
> +		plane_state->solid_fill_blob = NULL;
> +	}
> +
>   	if (plane->color_encoding_property) {
>   		if (!drm_object_property_get_default_value(&plane->base,
>   							   plane->color_encoding_property,
> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>   	if (state->fb)
>   		drm_framebuffer_get(state->fb);
>   
> +	if (state->solid_fill_blob)
> +		drm_property_blob_get(state->solid_fill_blob);
> +
>   	state->fence = NULL;
>   	state->commit = NULL;
>   	state->fb_damage_clips = NULL;
> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>   		drm_crtc_commit_put(state->commit);
>   
>   	drm_property_blob_put(state->fb_damage_clips);
> +	drm_property_blob_put(state->solid_fill_blob);
>   }
>   EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>   
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c06d0639d552..8a1d2fb7a757 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>   }
>   EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>   
> +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
> +		struct drm_solid_fill_info *in)

No need for a separate function, you can inline this.

> +{
> +	out->r = in->r;
> +	out->g = in->g;
> +	out->b = in->b;
> +}
> +
> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
> +		struct drm_property_blob *blob)
> +{
> +	int ret = 0;
> +	int blob_version;
> +
> +	if (blob == state->solid_fill_blob)
> +		return 0;
> +
> +	drm_property_blob_put(state->solid_fill_blob);
> +	state->solid_fill_blob = NULL;
> +
> +	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
> +
> +	if (blob) {
> +		if (blob->length != sizeof(struct drm_solid_fill_info)) {
> +			drm_dbg_atomic(state->plane->dev,
> +					"[PLANE:%d:%s] bad solid fill blob length: %zu\n",
> +					state->plane->base.id, state->plane->name,
> +					blob->length);
> +			return -EINVAL;
> +		}
> +
> +		blob_version = ((struct drm_solid_fill_info *)blob->data)->version;

Please assign blob->data to temporary var.

> +
> +		/* Append with more versions if necessary */

s/Append/Add/

> +		if (blob_version == 1) {
> +			drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
> +		} else {
> +			drm_dbg_atomic(state->plane->dev,
> +					"[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
> +					state->plane->base.id, state->plane->name,
> +					ret);
> +			return -EINVAL;
> +		}
> +		state->solid_fill_blob = drm_property_blob_get(blob);
> +	}
> +
> +	return ret;
> +}
> +
>   static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>   				   struct drm_crtc *crtc, s32 __user *fence_ptr)
>   {
> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		state->src_w = val;
>   	} else if (property == config->prop_src_h) {
>   		state->src_h = val;
> +	} else if (property == plane->solid_fill_property) {
> +		struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
> +
> +		ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
> +		drm_property_blob_put(solid_fill);
> +
> +		return ret;
>   	} else if (property == plane->alpha_property) {
>   		state->alpha = val;
>   	} else if (property == plane->blend_mode_property) {
> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   		*val = state->src_w;
>   	} else if (property == config->prop_src_h) {
>   		*val = state->src_h;
> +	} else if (property == plane->solid_fill_property) {
> +		*val = state->solid_fill_blob ?
> +			state->solid_fill_blob->base.id : 0;
>   	} else if (property == plane->alpha_property) {
>   		*val = state->alpha;
>   	} else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index b4c8cab7158c..17ab645c8309 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create(plane->dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
> +			"solid_fill", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->solid_fill_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..0338a860b9c8 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>   			      struct drm_atomic_state *state);
>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>   					 unsigned int supported_modes);
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>   #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 447e664e49d5..3b9da06f358b 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>   	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>   };
>   
> +/**
> + * struct drm_solid_fill_info - User info for solid fill planes
> + */
> +struct drm_solid_fill_info {
> +	__u8 version;
> +	__u32 r, g, b;
> +};
> +
> +/**
> + * struct solid_fill_property - RGB values for solid fill plane
> + *
> + * Note: This is the V1 for this feature
> + */
> +struct drm_solid_fill {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +};
> +
>   /**
>    * struct drm_plane_state - mutable plane state
>    *
> @@ -116,6 +135,23 @@ struct drm_plane_state {
>   	/** @src_h: height of visible portion of plane (in 16.16) */
>   	uint32_t src_h, src_w;
>   
> +	/**
> +	 * @solid_fill_blob:
> +	 *
> +	 * Blob containing relevant information for a solid fill plane
> +	 * including pixel format and data. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_property_blob *solid_fill_blob;
> +
> +	/**
> +	 * @solid_fill:
> +	 *
> +	 * Pixel data for solid fill planes. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_solid_fill solid_fill;
> +
>   	/**
>   	 * @alpha:
>   	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -699,6 +735,13 @@ struct drm_plane {
>   	 */
>   	struct drm_plane_state *state;
>   
> +	/*
> +	 * @solid_fill_property:
> +	 * Optional solid_fill property for this plane. See
> +	 * drm_plane_create_solid_fill_property().
> +	 */
> +	struct drm_property *solid_fill_property;
> +
>   	/**
>   	 * @alpha_property:
>   	 * Optional alpha property for this plane. See

-- 
With best wishes
Dmitry

