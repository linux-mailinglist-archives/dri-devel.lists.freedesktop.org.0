Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BF7431EF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919AE10E42E;
	Fri, 30 Jun 2023 00:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC0510E42D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:49:30 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so21265531fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688086168; x=1690678168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tFpLak+ksDCCGqs4Q41iM6CskPw8vvBNcPkt1q5XiVo=;
 b=Z8m9kZR+kmnsKSB4RSKFLIPkp5LPw5fvjf5TqHgFG7C/7yPFBnu5hMy3Mubv7x1ahy
 g/vRh4OtRtQaAEu5q8WI87khK6uAO47Q/2dahRTWnvUGoOhkKH/aGDw8dg7+W6B4YRc3
 9MyfleiKMJigPvyhUnRAPqNC7OU93hpxG3UKegXL2y/5hnpyY8+y9jr+UpMJKzSSfNsJ
 aubju0tNSyBfBAigNqwtUYX59KANAQXEpgZI8TACn8UxNFAHgd3K5x1hKdApgsfmzPRq
 Hmd5EpIeZ0z9osR2ZxjTahwsOiVJSmzjqWAvX9oSVZPcL6809XcYkH9p9fvla6o1UIgT
 BCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688086168; x=1690678168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tFpLak+ksDCCGqs4Q41iM6CskPw8vvBNcPkt1q5XiVo=;
 b=JvxGm24ZbJmNeg8+Uyzy82Jfrgsl9ywjU1RZq3hRO5sn4GrwuycWiuXr4sGLCv4Rnf
 3NnvcS+kGXRHGHSTpTbhiYLA3DxSwQvLp5x3nTm+EPZtk3koMyk7Hx0cubTgvL1fyUhV
 vtRQndq8xCROfEBi841UN2u+/laZRU8tofkTruw5cP3vN5rhkl6cL7Nt1wkQe4G/Aw9m
 ynyS+sDGTG2ldSrpSfwuLDtSPzuO0oANv589p8V9LNR5p0tipQhUJ0ujnRJZLEwmFP+5
 NCg91wb4rrbd+2q7tvoVX/3klYkL17HnDwARWfmB4FTfEwbm/7LFQsc7DIaer5E+XCSQ
 EHzg==
X-Gm-Message-State: ABy/qLa0HC1afxJPtTOBUz7V8/JhgiPucq2K7mWd8Zwqfhw6JlH2RCW3
 7FX5cPSOh8JErehfOHuzdLuTvA==
X-Google-Smtp-Source: APBJJlE9oItsWMthbV8omjfXiAQTh2vXUK/RQwRur2Evwvh6gw4NolcCwOkvAf0UxCWDXp/r/rcjPg==
X-Received: by 2002:a2e:9659:0:b0:2b6:c16a:db06 with SMTP id
 z25-20020a2e9659000000b002b6c16adb06mr876985ljh.39.1688086168437; 
 Thu, 29 Jun 2023 17:49:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a2e9886000000b002b69f44646bsm2391329ljj.17.2023.06.29.17.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:49:28 -0700 (PDT)
Message-ID: <39ee5eac-1452-1c08-c24f-6c70c13ce804@linaro.org>
Date: Fri, 30 Jun 2023 03:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 5/7] drm/msm/dpu: Add solid fill and pixel source
 properties
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-5-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-5-f4ec0caa742d@quicinc.com>
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
> Add solid_fill and pixel_source properties to DPU plane
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 ++
>   1 file changed, 2 insertions(+)

This should be the last commit.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..5f0984ce62b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1429,6 +1429,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
>   	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_solid_fill_property(plane);
> +	drm_plane_create_pixel_source_property(plane, BIT(DRM_PLANE_PIXEL_SOURCE_COLOR));
>   	drm_plane_create_blend_mode_property(plane,
>   			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>   			BIT(DRM_MODE_BLEND_PREMULTI) |
> 

-- 
With best wishes
Dmitry

