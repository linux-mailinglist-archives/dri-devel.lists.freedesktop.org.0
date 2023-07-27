Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337C765435
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 14:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28F810E0E6;
	Thu, 27 Jul 2023 12:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D14410E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:41:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so4585586a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690461687; x=1691066487;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HjBJjl/cCX4vEWyKNms/km6uOt5DMZJukD+50VeOffY=;
 b=ExnaZyrwtLvkYGT/AkVSjMfJGskxoE/UoCJAV4cKlbqVlRwstKt7QgzM+symK3mwmM
 +Xb9W1oNW/WbmKRFPCNO7qRzfFZvLd4TNlDQeyQ5Y1gcZbzcO+0+x0RG6kyvQzN/emvP
 lSiM6rWh0JrFVK6YmO/4yZjvWQrloanNH2i7FEzSrc6qvYx+tKrCEdK3/963vcf4XQ6X
 FS9TySWj85WGkHtyAqVyIPb1zru0MtCDLJjeyJuXkNWyx0StTFQwZoqZNlxi268cEIXz
 A4xBWIl90YmblX+PGPt+i/L9sbHjE2hp3pfKYfNiQ8JY4A/6CU8lhb3nZkhGthHEyTSG
 uYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690461687; x=1691066487;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HjBJjl/cCX4vEWyKNms/km6uOt5DMZJukD+50VeOffY=;
 b=bR9+aCVT80/LiSRXEkNGG02BKGihXxbwxp4eTqHP8bbpZFl+rwek3YdXCijeoUq26l
 yTuhN0iMW4ABbHFfueZL6/Dt5lMyQ0buFpEsrSFrYUhK1RugKNsMQvPyOBFeeWFhY8ND
 feDlXuftf82PPn4MUNgq5dbIFzpvIgaEenpoYavF4w2SFv6G+0m7v1PSDLKJrD2Z2vaX
 5zaf1wGTWZlgzduk/PxeRCF9oaFByjN0++wVq4rJAqsBEwkrMoIxu0xQGd7yNI/Evc8n
 Y6mOtOyRcoNG3M5FfPpK/9vP2Wm1TaUdxYLeqdulcBhgCtFR/zfFD2LvdzWCHEeK3b46
 X/Aw==
X-Gm-Message-State: ABy/qLadGQ7EJIFOSriXZSv8NAPVVHncFEolb0cHudcXA1UbAH7ych/I
 z4+i5CoiedpY7nLfdyRDAahr2Q==
X-Google-Smtp-Source: APBJJlF0eTncr47QXn2NfX9KjZxGJ70nljJprgIhEG8JAZC8IUT1oV70c9ZTz81ZXKwDDdcebClONw==
X-Received: by 2002:a17:907:7e94:b0:96a:2dd7:2ee0 with SMTP id
 qb20-20020a1709077e9400b0096a2dd72ee0mr2453345ejc.5.1690461687099; 
 Thu, 27 Jul 2023 05:41:27 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 qq5-20020a17090720c500b009882e53a42csm734454ejb.81.2023.07.27.05.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 05:41:26 -0700 (PDT)
Message-ID: <9fe65e98-6f53-030f-c68c-45537e892e40@linaro.org>
Date: Thu, 27 Jul 2023 15:41:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/drv: propagate errors from drm_modeset_register_all()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230521173410.4163983-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521173410.4163983-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2023 20:34, Dmitry Baryshkov wrote:
> In case the drm_modeset_register_all() function fails, its error code
> will be ignored. Instead make the drm_dev_register() bail out in case of
> such an error.
> 
> Fixes: 79190ea2658a ("drm: Add callbacks for late registering")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Colleagues, gracious ping.

> ---
>   drivers/gpu/drm/drm_drv.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c6eb8972451a..dc4a496795ee 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -938,8 +938,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>   			goto err_minors;
>   	}
>   
> -	if (drm_core_check_feature(dev, DRIVER_MODESET))
> -		drm_modeset_register_all(dev);
> +	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> +		ret = drm_modeset_register_all(dev);
> +		if (ret)
> +			goto err_unload;
> +	}
>   
>   	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
>   		 driver->name, driver->major, driver->minor,
> @@ -949,6 +952,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>   
>   	goto out_unlock;
>   
> +err_unload:
> +	if (dev->driver->unload)
> +		dev->driver->unload(dev);
>   err_minors:
>   	remove_compat_control_link(dev);
>   	drm_minor_unregister(dev, DRM_MINOR_ACCEL);

-- 
With best wishes
Dmitry

