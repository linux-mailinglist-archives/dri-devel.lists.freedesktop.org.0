Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92688612253
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 13:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62A210E291;
	Sat, 29 Oct 2022 11:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D65610E287
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 11:23:15 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id j14so11264566ljh.12
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2m2Jxq3gKGU0JnFmc/Do/Sg5oHX2DP+MMfqJOrJE74=;
 b=s4rf9sqIIgwxSVLj0LRzbaeT9TcekLMo0PuzxvfuW7Zv+xfUaq36xQVH5xojfhPZwe
 9QuwCltJsYeSPfx6zoOM8dMYZwejwRTWDyK0OLwXFo5iKQgR1WBvhUNoTojfNWS5EYAJ
 X4CSOlZ3+GrDsxeQQ2kJvoMV3YqLqeF4tu5gmYOf4fDDAXjKQ5hTBlcqfCm5goPb18Pp
 AkrAk03ZNHzZvqExDvxakxlhI4xU34U5lJRfYLNBSJqgrh84ElhrvhFw2wNZb5ikuGxT
 BoEh71e5HufiV8Rk8gi8JuoqZ3IBzN9+tp6Lgb9PP4EKLtvBLD640FsOhKIRR3L3WwXB
 jDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2m2Jxq3gKGU0JnFmc/Do/Sg5oHX2DP+MMfqJOrJE74=;
 b=t6IKweA6BeyuK09dA0iju25XHMj6VBTPTYH4011+WrZjy/k9DpHAtTF9LH9ST9P/co
 /KnDAMUOWaTaVmcua4V5OBdHZ23HxKeZLRMRYeY/SNwt2VkQCiI5o+8wNiKA7AchFwqd
 fuM4siCNiHuwNpT0JEoxXpfQoHyYJ4XDDucS0cHvHMtDPf+0oaJLuFsu6einTP9bJcBb
 9hP9hPaWDWV0sSex1NLu/n24EXa4+b3aqb8cutn3c6RP4fq506eES5goCcaSCW+uzb/Y
 MWc2h6fuo1f8/JoubS3HIg897762mXA/2kbIlE3MvbQ3+Vx6bnHEVfYklgV5IPWjPhxe
 Ui0A==
X-Gm-Message-State: ACrzQf1xw+WAkRudmxUUssdUxrpuRQYTjD+XVeJvt4IEyyMqNVhCGvdm
 wFQTRWP9e6nD7zQjBMcfw2pQ8g==
X-Google-Smtp-Source: AMsMyM475S54d28dmlf48ycynAt7vF/tSapLEbMKM3ZqHNp00m5ah5/rL1Wtemmgrz0XVp7u+pf3lg==
X-Received: by 2002:a05:651c:1102:b0:26f:c343:f378 with SMTP id
 e2-20020a05651c110200b0026fc343f378mr1349596ljo.261.1667042593045; 
 Sat, 29 Oct 2022 04:23:13 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a2e5054000000b0026fa73565b3sm180705ljd.112.2022.10.29.04.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 04:23:12 -0700 (PDT)
Message-ID: <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
Date: Sat, 29 Oct 2022 14:23:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028225952.160-2-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2022 01:59, Jessica Zhang wrote:
> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> drm_plane. In addition, add support for setting and getting the values
> of these properties.
> 
> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> represents the format of the color fill. Userspace can set enable solid
> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> framebuffer to NULL.

I suppose that COLOR_FILL should override framebuffer rather than 
requiring that FB is set to NULL. In other words, if color_filL_format 
is non-zero, it would make sense to ignore the FB. Then one can use the 
color_fill_format property to quickly switch between filled plane and 
FB-backed one.

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++
>   drivers/gpu/drm/drm_blend.c       | 38 +++++++++++++++++++++++++++++++
>   include/drm/drm_blend.h           |  2 ++
>   include/drm/drm_plane.h           | 28 +++++++++++++++++++++++
>   4 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 79730fa1dd8e..e1664463fca4 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -544,6 +544,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		state->src_w = val;
>   	} else if (property == config->prop_src_h) {
>   		state->src_h = val;
> +	} else if (property == plane->color_fill_format_property) {
> +		state->color_fill_format = val;
> +	} else if (property == plane->color_fill_property) {
> +		state->color_fill = val;
>   	} else if (property == plane->alpha_property) {
>   		state->alpha = val;
>   	} else if (property == plane->blend_mode_property) {
> @@ -616,6 +620,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   		*val = state->src_w;
>   	} else if (property == config->prop_src_h) {
>   		*val = state->src_h;
> +	} else if (property == plane->color_fill_format_property) {
> +		*val = state->color_fill_format;
> +	} else if (property == plane->color_fill_property) {
> +		*val = state->color_fill;
>   	} else if (property == plane->alpha_property) {
>   		*val = state->alpha;
>   	} else if (property == plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index b4c8cab7158c..b8c2b263fa51 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -616,3 +616,41 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +int drm_plane_create_color_fill_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create_range(plane->dev, 0, "color_fill",
> +					 0, 0xffffffff);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->color_fill_property = prop;
> +
> +	if (plane->state)
> +		plane->state->color_fill = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_color_fill_property);
> +
> +int drm_plane_create_color_fill_format_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop = drm_property_create_range(plane->dev, 0, "color_fill_format",
> +					 0, 0xffffffff);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->color_fill_format_property = prop;
> +
> +	if (plane->state)
> +		plane->state->color_fill_format = 0;

Don't you also need to reset these properties in 
__drm_atomic_helper_plane_state_reset() ?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_color_fill_format_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..3e96f5e83cce 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>   			      struct drm_atomic_state *state);
>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>   					 unsigned int supported_modes);
> +int drm_plane_create_color_fill_property(struct drm_plane *plane);
> +int drm_plane_create_color_fill_format_property(struct drm_plane *plane);
>   #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89ea54652e87..dcbfdb0e1f71 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -116,6 +116,20 @@ struct drm_plane_state {
>   	/** @src_h: height of visible portion of plane (in 16.16) */
>   	uint32_t src_h, src_w;
>   
> +	/**
> +	 * @color_fill_format:
> +	 * Format of the color fill value.
> +	 */
> +	uint32_t color_fill_format;
> +
> +	/**
> +	 * @color_fill:
> +	 * Fill color of the plane with 0 as black and 0xffffffff as white.
> +	 * Can be set by user by setting the COLOR_FILL property. See
> +	 * drm_plane_create_color_fill_property() for more details.
> +	 */
> +	uint32_t color_fill;
> +
>   	/**
>   	 * @alpha:
>   	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -699,6 +713,20 @@ struct drm_plane {
>   	 */
>   	struct drm_plane_state *state;
>   
> +	/*
> +	 * @color_fill_format_property:
> +	 * Optional color fill format property for this plane. See
> +	 * drm_plane_create_color_fill_format_property().
> +	 */
> +	struct drm_property *color_fill_format_property;
> +
> +	/*
> +	 * @color_fill_property:
> +	 * Optional color fill property for this plane. See
> +	 * drm_plane_create_color_fill_property().
> +	 */
> +	struct drm_property *color_fill_property;
> +
>   	/**
>   	 * @alpha_property:
>   	 * Optional alpha property for this plane. See

-- 
With best wishes
Dmitry

