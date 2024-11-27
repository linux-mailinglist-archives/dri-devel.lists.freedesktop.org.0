Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E659DA8DA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDC510EAD0;
	Wed, 27 Nov 2024 13:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CoKZ+Hmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1E10EAD6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 13:43:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso3386641e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732714999; x=1733319799; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LIXGs4fTwSxjqXemGFw9+p2YdwTHf2NnHZwaHRGF6Nc=;
 b=CoKZ+HmkKQJhpm/3cKRXQzrzZHSrqzm87AxWyPPhH04wt+yNDu8o36Ip/6kuQVQPet
 rxef94W2fgsgaVVKHEtaTT7BquYA1WA5YMrCKOEUqdmAvgc59CpeRTmPKWrMqvkE9nR8
 t2yYnyP1ouA4JTVMfrZ7jGkzV6LIh+Y2XhNc/r+OlYTH0+Se3y6vmomAlyNKLaRpV9l2
 wxtTJheeOkjYir91k00uQXJs1J9CYvraHzkXxUx392WFTwNhhjV4+BZISw83FlmkJG+w
 iTg+z49G9l21ez8ZiW0HzR0tOQB8yIz3XSxEkj77baR0IRhdSQa//4CBiAnunT/pChz3
 J7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732714999; x=1733319799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIXGs4fTwSxjqXemGFw9+p2YdwTHf2NnHZwaHRGF6Nc=;
 b=C/YmZkedlvemxoWZVNvE8FwpWfbaLY5lqOLynuPAqtg7n1xMMS+Lzik45MnxABwW0d
 MOJEtTBGXs1ThWUbVMMlMUPdSPgGXPkiCoKhgJn3gDsHJIC5uGsExB3nnD1LW0WgXm86
 4VJr7SwfSpypQSPOFXRiVTrdO5nUONH4iHep8guicswanO5KZLk1UDd22jmyhjcrzpFA
 bBkWolh7VMhlhgJ/K1s5PsanafOdkFo6wnqsx3Y7Mbw8Q73MAYwf7oivJkoVV1FxxOCW
 eGmKjzXJNhTC8TRao/ioHY8HL5Ds1+GdzacnXziwKrU/ERvPIwKy2rCqvsGsLgTeEG6a
 51Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWAywihGpzfuvJnSF2Qn7XHwjU2dw+5nMZWcom2IoB0nCO1bxSeCkmkl7nUOGV17itv/rZojyCfic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx98ELpY3MGfEnCDf2lbIHrPt6f9m0odvlFc/zk2A8yMPMI92BC
 sj/n6OJtwOisRCYz3Gfj+DBJG4qg4VI4RlKmBjSdyqwVcUlw9MgcG1anzPM2vns=
X-Gm-Gg: ASbGncu6mLcnCgAsT/yUqw8Ivh4E51D/F0SZbsRYBwvhjU1QaaA5UVh/gUPTn2gLFz2
 p7nIJ/PCIQ8WI7rKG1efg3mwrN+qhW6mEd0LXqtmBfMx2PhdKjUUI/L8HnoNuEj18IMe6OsOZOa
 hjClaOcd1E3hkTUkmTqBIOip8uqkdhyk3lISwh3x2Tf6/+iO5MyfoyywcVY0Ghuh+SawCjjNxp3
 z+ReoRlXMaYUh1sh11YoS5AYJOWRWKmcBTgO2nOYJRiIXPvCV3ixLl6zDrKOPsHD7EkdchykgHU
 t9LZsplPC0xQTi4wx2swegxIVsMszQ==
X-Google-Smtp-Source: AGHT+IHl4xTqfFayy6N/PMSQFKk1zMBlFF166s3qCjZQxpVTE21zLDuT/xgWMcxx1dKM+yaLNkjIHg==
X-Received: by 2002:a05:6512:313a:b0:53d:f177:51d0 with SMTP id
 2adb3069b0e04-53df177526amr1071412e87.9.1732714998834; 
 Wed, 27 Nov 2024 05:43:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53ddbfc2b7dsm1721318e87.129.2024.11.27.05.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:43:18 -0800 (PST)
Date: Wed, 27 Nov 2024 15:43:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
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

On Wed, Nov 27, 2024 at 04:15:51PM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with a DisplayPort controller
> with same base offset with SA8775P, add support for this in the
> DisplayPort driver.

Can we reuse SA8775P config then? And SA8775p compatible as a fallback,
not requiring any driver modifications.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,6 +118,11 @@ struct msm_dp_desc {
>  	bool wide_bus_supported;
>  };
>  
> +static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{}
> +};
> +
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> @@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>  };
>  
>  static const struct of_device_id msm_dp_dt_match[] = {
> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
>  	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>  	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
