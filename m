Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAC768A8A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 06:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D7610E178;
	Mon, 31 Jul 2023 04:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387EA10E170
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:02:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso58527101fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690776145; x=1691380945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajHG4BBw8iHuUvtNYJ0qqb7Yvyp0zkUGuOzCXpR5oEM=;
 b=TLosVwAEYjCsImmgqiqb/tuWYyQQrOf+9i1YGcKBHX3A56WIrq4wXLtuinW/c86mJr
 +eBv3iXgJzd+BAcuGBVF9cYuPpGWy5IsH/FqkTEimIDACLW3UiSpqemlQOPv195BDdvn
 tZSbQfxzX4byxDUReBx7P+rFcKIR7I7BfaseeyA3hymFGP/+gp1EGy7ufeIJEm15eDAJ
 NwCgU9jB7tPIyiSOwb/sS8gd/b01S+LfRtoHBow9GORRNsUfHU62a7vADaxJA21O60dl
 8rI1VRYN6Q2ePoDAXnMSKr1kfl5iCRPlJo5gznBBtHhy1YR0YO7aXkqx0xJGfKc6zEkM
 tr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690776145; x=1691380945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajHG4BBw8iHuUvtNYJ0qqb7Yvyp0zkUGuOzCXpR5oEM=;
 b=XcBRnwyIvseHcly+EEXN2PufhJBmoSM1IM2bFmGRZjXLD1fvIhKt5Ztjmhdq3GeXK5
 +R8LEhduq+Uue21pTIgFUaCujO5N39OHKRAgZEn1W13hqxOdosdZ07JeaHopJJaRSlWA
 FukCS3jrw5s7XTehddNvXf+n2n7UjvZ86Ia6YOW2JwJVvFJSG2edB5qwyA3zPUJpnV8J
 nZculGFkdC1FNrNRO6GBdbL9dYtebSbm/V75KOb+hX4PXa29S7Hc6wyIiYAfiFSWP8rK
 iZntosFvO4AgoKK9juaRER0nFhnw/rEIvP+iFn7sUQRTcVm35HyVslzVJG1oCy2AN2ml
 6vww==
X-Gm-Message-State: ABy/qLblUnIFNgUT8Cr2h6ZHbzuypobJEUxw8utvi132oyC/5ms/OpP0
 c9WUNncXj7Zt1HqcN3EMRMWpHg==
X-Google-Smtp-Source: APBJJlGKQ1Z4HFuQYySXiLXimDp4RK2g+LfSMrRqiLrLLgoGdIRiuHNA4gnfoy9Umg1ujp6nx6YBxQ==
X-Received: by 2002:a2e:81c3:0:b0:2b6:d9dd:f65f with SMTP id
 s3-20020a2e81c3000000b002b6d9ddf65fmr5289913ljg.17.1690776145555; 
 Sun, 30 Jul 2023 21:02:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a2e330d000000b002b6cb40e9aasm2288593ljc.103.2023.07.30.21.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 21:02:24 -0700 (PDT)
Message-ID: <a3f6a213-574e-7351-1d4f-a698116d6c95@linaro.org>
Date: Mon, 31 Jul 2023 07:02:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 03/10] drm: Add solid fill pixel source
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-3-053dbefa909c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-3-053dbefa909c@quicinc.com>
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
> Add "SOLID_FILL" as a valid pixel source. If the pixel_source property is
> set to "SOLID_FILL", it will display data from the drm_plane "solid_fill"
> blob property.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_blend.c | 10 +++++++++-
>   include/drm/drm_plane.h     |  1 +
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index c632dfcd8a9b..34b1fd3e2310 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -200,6 +200,9 @@
>    *	"FB":
>    *		Framebuffer source set by the "FB_ID" property.
>    *
> + *	"SOLID_FILL":
> + *		Solid fill color source set by the "solid_fill" property.
> + *
>    * solid_fill:
>    *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>    *	contains pixel data that drivers can use to fill a plane.
> @@ -657,6 +660,9 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>    * "FB":
>    *	Framebuffer pixel source
>    *
> + * "SOLID_FILL":
> + * 	Solid fill color pixel source
> + *
>    * Returns:
>    * Zero on success, negative errno on failure.
>    */
> @@ -668,8 +674,10 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>   	static const struct drm_prop_enum_list enum_list[] = {
>   		{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
>   		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +		{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
>   	};
> -	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
> +						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
>   	int i;
>   
>   	/* FB is supported by default */
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index abf1458fa099..234fee3d5a95 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -43,6 +43,7 @@ enum drm_scaling_filter {
>   enum drm_plane_pixel_source {
>   	DRM_PLANE_PIXEL_SOURCE_NONE,
>   	DRM_PLANE_PIXEL_SOURCE_FB,
> +	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
>   	DRM_PLANE_PIXEL_SOURCE_MAX
>   };
>   
> 

-- 
With best wishes
Dmitry

