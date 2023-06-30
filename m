Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A17431D5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA6510E41B;
	Fri, 30 Jun 2023 00:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5537310E41B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:42:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so2130067e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688085750; x=1690677750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jjm4S8tG5ar4dri84IyFq2aA45fAaCrDTlaVzsiNzbo=;
 b=mN3NuBGWnQ2SuxJaFBhmmjVC+MXXA0giXpScNEDb4nIeSFOQ60ALerou5cZ+hiFrES
 Sulh7ojdUp05iydiPSuJndBLNn2iLruMGotwIf1QIRLVCmBesWrjI7kAnWuTxb1FQE/9
 YxVzMd1j+/ggqz6eqp6SH8JcUi1f+O1vmaeGy/C75YOvEBF4DECL4J10WsxsVSwztTzs
 4pR5T//zLgJUY250fHfWo1IH8Bn0nWNdeZ0gf/tLsMUCudbmWTInl7rhpsV55uAQCRXG
 kjokiKsniSBwaMxVvIIKUSa2nVvRGTJSyO9pQrqYE1/jaVj8JOBur7SWfY3iJDsP08I2
 t5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688085750; x=1690677750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jjm4S8tG5ar4dri84IyFq2aA45fAaCrDTlaVzsiNzbo=;
 b=ghFajkWfU1rwrC4eEDAbWWzCNePRNSl7b0N1uEUNKpWahd4B4sa0Gtevy4u1p4hS2N
 2G/Ma86N/e+OKqnDYA7wFQww/x+h7wySLBZn6Dc/ujJshuKS19eY2TAxcAv3ku0+n4iN
 rNJyvB5hQVjZUA17j4Pst2JSC3AiEpVjWm3v7BAAC4qsM/JTN54sjX1NhGtub832CzOG
 tYvW3+rBuM+TDlIZGR67jE2d3dazO52g2ASVBEt1dKsey72n00UyceqKE3Yy0ZtdWtEr
 VprrihkLwDMSo44FLstqPJi6aOtLyrDLVZm5/4yDxURvegnjuJlgBhhhWe+qYFCkU/xC
 HGEA==
X-Gm-Message-State: ABy/qLZ1T/SLQSmouKFkjVyedH1FcuV8NeExHZ8Iy+rDE5u3va9EOQVB
 TQhTyx0hw6dQFZrGWKClNeyjyg==
X-Google-Smtp-Source: APBJJlEJ2CiwHv/FrZfhQCcNFXdKPNnUYnKvmANONrrK4G8sHc+/6DfAQzra4mNEtJn4Ti8GWJ8i9Q==
X-Received: by 2002:a05:6512:202c:b0:4fb:889c:c53d with SMTP id
 s12-20020a056512202c00b004fb889cc53dmr931672lfs.10.1688085749897; 
 Thu, 29 Jun 2023 17:42:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a18-20020ac25212000000b004fb8f4df9bdsm897490lfl.226.2023.06.29.17.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:42:29 -0700 (PDT)
Message-ID: <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
Date: Fri, 30 Jun 2023 03:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2023 03:25, Jessica Zhang wrote:
> Add support for pixel_source property to drm_plane and related
> documentation.
> 
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
> 
> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.

I think, this should come before the solid fill property addition. First 
you tell that there is a possibility to define other pixel sources, then 
additional sources are defined.

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>   drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++++++++
>   include/drm/drm_blend.h                   |  2 +
>   include/drm/drm_plane.h                   | 21 ++++++++
>   5 files changed, 109 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index fe14be2bd2b2..86fb876efbe6 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>   
>   	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>   	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> +	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>   
>   	if (plane_state->solid_fill_blob) {
>   		drm_property_blob_put(plane_state->solid_fill_blob);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index a28b4ee79444..6e59c21af66b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		drm_property_blob_put(solid_fill);
>   
>   		return ret;
> +	} else if (property == plane->pixel_source_property) {
> +		state->pixel_source = val;
>   	} else if (property == plane->alpha_property) {
>   		state->alpha = val;
>   	} else if (property == plane->blend_mode_property) {

I think, it was pointed out in the discussion that drm_mode_setplane() 
(a pre-atomic IOCTL to turn the plane on and off) should also reset 
pixel_source to FB.

> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   	} else if (property == plane->solid_fill_property) {
>   		*val = state->solid_fill_blob ?
>   			state->solid_fill_blob->base.id : 0;
> +	} else if (property == plane->pixel_source_property) {
> +		*val = state->pixel_source;
>   	} else if (property == plane->alpha_property) {
>   		*val = state->alpha;
>   	} else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 38c3c5d6453a..8c100a957ee2 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -189,6 +189,18 @@
>    *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>    *	contains pixel data that drivers can use to fill a plane.
>    *
> + * pixel_source:
> + *	pixel_source is set up with drm_plane_create_pixel_source_property().
> + *	It is used to toggle the source of pixel data for the plane.
> + *
> + *	Possible values:
> + *
> + *	"FB":
> + *		Framebuffer source
> + *
> + *	"COLOR":
> + *		solid_fill source
> + *
>    * Note that all the property extensions described here apply either to the
>    * plane or the CRTC (e.g. for the background color, which currently is not
>    * exposed and assumed to be black).
> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> +
> +/**
> + * drm_plane_create_pixel_source_property - create a new pixel source property
> + * @plane: drm plane
> + * @supported_sources: bitmask of supported pixel_sources for the driver (NOT
> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will be supported
> + *                     by default).

I'd say this is too strong. I'd suggest either renaming this to 
extra_sources (mentioning that FB is enabled for all the planes) or 
allowing any source bitmask (mentioning that FB should be enabled by the 
caller, unless there is a good reason not to do so).

> + *
> + * This creates a new property describing the current source of pixel data for the
> + * plane.
> + *
> + * The property is exposed to userspace as an enumeration property called
> + * "pixel_source" and has the following enumeration values:
> + *
> + * "FB":
> + *	Framebuffer pixel source
> + *
> + * "COLOR":
> + *	Solid fill color pixel source
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +					   unsigned int supported_sources)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct drm_property *prop;
> +	const struct drm_prop_enum_list enum_list[] = {
> +		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +		{ DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> +	};
> +	unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
> +				       BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);


static const?

> +	int i;
> +
> +	/* FB is supported by default */
> +	supported_sources |= BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +
> +	if (WARN_ON(supported_sources & ~valid_source_mask))
> +		return -EINVAL;
> +
> +	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_source",
> +			hweight32(supported_sources));
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
> +		int ret;
> +
> +		if (!(BIT(enum_list[i].type) & supported_sources))

test_bit?

> +			continue;
> +
> +		ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
> +

No need for an empty line in such cases. Please drop it.

> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ret;
> +		}
> +	}
> +
> +	drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
> +	plane->pixel_source_property = prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 0338a860b9c8..31af7cfa5b1b 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>   					 unsigned int supported_modes);
>   int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +					   unsigned int supported_sources);
>   #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index f6ab313cb83e..73fb6cf8a5d9 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -59,6 +59,12 @@ struct drm_solid_fill {
>   	uint32_t b;
>   };
>   
> +enum drm_plane_pixel_source {
> +	DRM_PLANE_PIXEL_SOURCE_FB,
> +	DRM_PLANE_PIXEL_SOURCE_COLOR,
> +	DRM_PLANE_PIXEL_SOURCE_MAX
> +};
> +
>   /**
>    * struct drm_plane_state - mutable plane state
>    *
> @@ -152,6 +158,14 @@ struct drm_plane_state {
>   	 */
>   	struct drm_solid_fill solid_fill;
>   
> +	/*
> +	 * @pixel_source:
> +	 *
> +	 * Source of pixel information for the plane. See
> +	 * drm_plane_create_pixel_source_property() for more details.
> +	 */
> +	enum drm_plane_pixel_source pixel_source;
> +
>   	/**
>   	 * @alpha:
>   	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -742,6 +756,13 @@ struct drm_plane {
>   	 */
>   	struct drm_property *solid_fill_property;
>   
> +	/*
> +	 * @pixel_source_property:
> +	 * Optional pixel_source property for this plane. See
> +	 * drm_plane_create_pixel_source_property().
> +	 */
> +	struct drm_property *pixel_source_property;
> +
>   	/**
>   	 * @alpha_property:
>   	 * Optional alpha property for this plane. See
> 

-- 
With best wishes
Dmitry

