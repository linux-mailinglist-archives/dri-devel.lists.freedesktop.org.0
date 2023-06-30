Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0D74320A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFA510E436;
	Fri, 30 Jun 2023 00:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC910E434
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:59:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so2181212e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688086779; x=1690678779;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zoYdkdv2/OutCTcovec52gr8aSf/SvvOZ7kly3VUKmU=;
 b=URMpqQ/B0jODA46sLTtWGi7eA3FHVg3ysmasmi0uRNPCc40oB17iSbHkB9EuwXKqt6
 lYolEh1OHSBMobkDHS+p56nYa+2eEXpvzg58LPnBqrQobSvHfk9vHowK4ZOLwC4eJHxl
 K+SsmrU7drH4jBdt6ykcYnIvoxXMQ07XL+rWnAos8t8UA7CzrOV7DcrJrf1O22XTObvM
 J6ULBDd2HBuKqXhhnmV7qkzDP1+n6YZWR6YOQPTh+ITWXU5Dt1m4ZOMGhC7oqyoxoCte
 nXtf+Bq2GyCPC2A5OgMSlZWszvUiY8d5R+HQHKQ5gwmXPa10TI0XGCsAF15eRscufYsA
 px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688086779; x=1690678779;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zoYdkdv2/OutCTcovec52gr8aSf/SvvOZ7kly3VUKmU=;
 b=UFydqDT4bjYCWhO82pCjaYF895OZUHM2UFQEFFviTNcW5RTtbkxXgzEclSdTfYjYAY
 +ocFPLLfKxgppRheqF4RxzfErq4AzxyYz63JaQj8xqDQb+GRN5WPs9GjiWOXptStCUH0
 OvPjE6j24dV2jC2aPucML8m3kZZc8YFJPx8U7ktDof92w5g3+/Nual5GIB7U/aOIxi2B
 2CDbusoVaa8l5JoQv4rqVc3RRTcdrF1Mm2a0xALw7BsPWuD75612SF+uak63HtSmexTW
 ZHhc7DsUAgcA9pEYpHnMso16i+U98FgzA3tF6gcTTNhefhLpCCFbBbZYj0Ua074xolYE
 QNHQ==
X-Gm-Message-State: ABy/qLY+4rga+wwVqOVazNkmwdb+ZOG556nTsBHJkzEDuyhqQ0PkkSZ5
 wNT4aSTWGIa4BltUlV/XJVJcEg==
X-Google-Smtp-Source: APBJJlEg6iCQC+TSL2nuh3dd1+J655NCf9q2KkuUDaitZTBiZEIYObwaxIxm3gCm0H29/6bPnPfytg==
X-Received: by 2002:a05:6512:1094:b0:4f1:3d7d:409e with SMTP id
 j20-20020a056512109400b004f13d7d409emr1321712lfg.0.1688086779192; 
 Thu, 29 Jun 2023 17:59:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac246e5000000b004fb94c6f5c4sm745002lfo.247.2023.06.29.17.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:59:38 -0700 (PDT)
Message-ID: <572ecc01-71c1-6f64-d26c-145b870584d1@linaro.org>
Date: Fri, 30 Jun 2023 03:59:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
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
> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
> determine if the plane is solid fill. In addition drop the DPU plane
> color_fill field as we can now use drm_plane_state.solid_fill instead,
> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
> allow userspace to configure the alpha value for the solid fill color.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor suggestion below.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4476722f03bb..11d4fb771a1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,7 +42,6 @@
>   #define SHARP_SMOOTH_THR_DEFAULT	8
>   #define SHARP_NOISE_THR_DEFAULT	2
>   
> -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>   #define DPU_ZPOS_MAX 255
>   
>   /*
> @@ -82,7 +81,6 @@ struct dpu_plane {
>   
>   	enum dpu_sspp pipe;
>   
> -	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
>   	const struct dpu_mdss_cfg *catalog;
> @@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>   	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
>   }
>   
> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)

Please consider accepting drm_plane_state instead and handling alpha 
here. Then _dpu_color_fill can accept rgba colour instead of separate 
RGB and alpha values.

> +{
> +	uint32_t ret = 0;
> +
> +	ret |= ((uint8_t) solid_fill.b) << 16;
> +	ret |= ((uint8_t) solid_fill.g) << 8;
> +	ret |= ((uint8_t) solid_fill.r);
> +
> +	return ret;
> +}
> +
>   /**
>    * _dpu_plane_color_fill - enables color fill on plane
>    * @pdpu:   Pointer to DPU plane object
> @@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	if (pdpu->is_error)
>   		/* force white frame with 100% alpha pipe output on error */
>   		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> -		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +	else if (drm_plane_solid_fill_enabled(plane->state))
> +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
> +				plane->state->alpha);
>   	else {
>   		dpu_plane_flush_csc(pdpu, &pstate->pipe);
>   		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> @@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   	}
>   
>   	/* override for color fill */
> -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> +	if (drm_plane_solid_fill_enabled(plane->state)) {
>   		_dpu_plane_set_qos_ctrl(plane, pipe, false);
>   
>   		/* skip remaining processing on color fill */
> 

-- 
With best wishes
Dmitry

