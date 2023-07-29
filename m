Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB27767957
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241AA10E7A8;
	Sat, 29 Jul 2023 00:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78AF10E7A8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 00:05:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so3691297a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690589134; x=1691193934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6AoRC5Ze9gLmlNt0sk++x0v2iDf5h30oOIYuEKlSQk0=;
 b=z47WAlqmDTVf/lInB/LW9WNv1MS1ADhXSxrgyVvTpp2StYDR8K4r3oFp+kP/sjcywG
 GSJKLr6uyGsjxhof28IRJhmzzKaY7I+7voI+YEcDxwJEigCiCFTLijWwTw+CxbO47v2c
 l5RfCCL5HvIjnFPgrkPt/qk7rFM4fSlKnUahrDoA+hDWPDc7VgOATEaJk+R+PhjVtKCH
 qPirqh89elNF5X/I+5OEsDGFkI6vs25Q/NI7meErMcCgz60poRETrltK7su9hz/FsX+5
 /fK3CSVy75CGaQ/F4RDljJFqV+eeNaC/sJnABHk6rPjbbX72+zdOUjTOxJoLIZ58nQ35
 G40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690589134; x=1691193934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AoRC5Ze9gLmlNt0sk++x0v2iDf5h30oOIYuEKlSQk0=;
 b=Q8zrW0AzK0DGcrONOWkEJPD6zf7bBbBeKlWd3/8fMAaCOk6+z3rzXhdHMHc41KfZTC
 72qeolIVPdqRS94FejeaILTxdpip1fiu19nHw9svxY1FeYfC+ZfdviJQH28Hctqypn94
 eBU77TCR3YNWwzWc1w3JQ69ctEtw7FK7kL7hfMgFm5UGUamllV/Rt8B5PBV0Nl5+Zjxh
 4qKIeprWJfYFFWOC6m5b/z8/fmcZpkJbC1huLhu5j0yK9DRJmIKn5QPiw3CVNHy1TR+h
 lqcW5L5Bw11QMjXRvaaSGGFed8B+vYYyncpjwc1kBvq3SwLgSTyZN6MR+y/W811qhiEW
 PY1A==
X-Gm-Message-State: ABy/qLZ2BhLtvPQHD7E0ufiskolw9mCmwY4tSs9CHHVKNcQz0XK6IIpp
 swQcb99oOOVqMqBfrO3TNtbENg==
X-Google-Smtp-Source: APBJJlHwGV/fV5tcFX+2wVYvsCriro0EemjtEEYhiKr/RV/iLJYNeYugWZaYhJnNMgQmctjIwpD2Wg==
X-Received: by 2002:a17:906:2d6:b0:993:ec0b:1a27 with SMTP id
 22-20020a17090602d600b00993ec0b1a27mr801948ejk.24.1690589134205; 
 Fri, 28 Jul 2023 17:05:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a1709062b4e00b0099290e2c163sm2615799ejg.204.2023.07.28.17.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 17:05:33 -0700 (PDT)
Message-ID: <b3407550-164c-b148-461d-a353eb1ee398@linaro.org>
Date: Sat, 29 Jul 2023 03:05:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 05/10] drm/atomic: Add solid fill data to plane
 state dump
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
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

On 28/07/2023 20:02, Jessica Zhang wrote:
> Add solid_fill property data to the atomic plane state dump.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c |  4 ++++
>   drivers/gpu/drm/drm_plane.c  | 10 ++++++++++
>   include/drm/drm_plane.h      |  3 +++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c38014abc590..1ee7d08041bc 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -717,6 +717,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>   	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
>   	if (state->fb)
>   		drm_framebuffer_print_info(p, 2, state->fb);
> +	drm_printf(p, "\tsolid_fill=%u\n",
> +			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
> +	if (state->solid_fill_blob)
> +		drm_plane_solid_fill_print_info(p, 2, state);
>   	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
>   	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
>   	drm_printf(p, "\trotation=%x\n", state->rotation);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4188b3491625..009d3ebd9b39 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1494,11 +1494,21 @@ const char *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_so
>   		return "NONE";
>   	case DRM_PLANE_PIXEL_SOURCE_FB:
>   		return "fb";
> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> +		return "solid_fill";
>   	default:
>   		return "";
>   	}
>   }

This chunk should be a part of the previous commit. Or dropped 
completely once DRM_ENUM_NAME_FN is used.

The rest LGTM.

>   
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
> +				     const struct drm_plane_state *state)
> +{
> +	drm_printf_indent(p, indent, "r=0x%x\n", state->solid_fill.r);
> +	drm_printf_indent(p, indent, "g=0x%x\n", state->solid_fill.g);
> +	drm_printf_indent(p, indent, "b=0x%x\n", state->solid_fill.b);
> +}
> +
>   /**
>    * drm_plane_get_damage_clips - Returns damage clips.
>    * @state: Plane state.
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 234fee3d5a95..303f01f0588c 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -1000,6 +1000,9 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
>   struct drm_mode_rect *
>   drm_plane_get_damage_clips(const struct drm_plane_state *state);
>   
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
> +				     const struct drm_plane_state *state);
> +
>   int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>   					     unsigned int supported_filters);
>   
> 

-- 
With best wishes
Dmitry

