Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777025AA11
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5DB6E301;
	Wed,  2 Sep 2020 11:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CB86E301
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:11:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t10so3946780wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=keVZMCICgeU2XikucdaT5d7AeU13SWerTWFxli6hKbo=;
 b=ZiogOXR70AZ1m97hk21ZptAp2nSRq17mLLZbjNyzbtYvSmxmRJ+AeETmfSkcx+ReTH
 VnwXceAEQT3uVVQWoj3nTielax2uIzA4L8lggAiG4Xolcdc/3DWKSyC4dZYXDyUbFtXr
 DIqBEvZ6wn3bmCrqJFp0nWEBOi4mMLMyoOH+unBvfozVVe9nO2ocYxlgIFVGtkRJMDaV
 fpyhsF865lhmWRI1V8o17bf+Tfh79B3MnUEPKiKwEj9JCrPdoK4xrI5B00qeSENXwO0i
 mNlvbxRsLy5L3Dui7Enh5nLH0JcEH0u0CXPf2wdpeJVyxj8X+b0bMKhhhxrrVO4zW1MN
 xwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=keVZMCICgeU2XikucdaT5d7AeU13SWerTWFxli6hKbo=;
 b=d9OprtHHk7o/8yqSyX7E3YnXrXlwsys6HvOJezc1OJTsN6D8WIiKBcQWZJYmC+ZU8I
 87Pjx9uce/0baNI6AjLNrijKAtu+iBpWqNsqIJb90LjkCdAvUyoqGfnUqMF/VG06Wkbi
 22b0vXjnXOVG1y9rr5iTo2mWrudGJOZXsijQS4ofhgHqnDa+zJjWcMSuTTxP9qTd326W
 YZ0OTiv3yfhnIhX01eu39mw90+qYewiMMMXyKyhqc5x42q/IJpF3dCUyff43iy5+cB+1
 zGc6QLooYuhazSWuZTzR3S6G5OnU4K0Dbt4LwAtHtjPs2l6cnxIem7qmS7RiNF1qM+x4
 nSWg==
X-Gm-Message-State: AOAM530I4/kOw0voWqKgdbdbyASmms6U+AVLEPsOvjnUniZcd8oi2D3Y
 zPqPIPHSW8KwuqdiFPPCJbKS2g==
X-Google-Smtp-Source: ABdhPJzwZTeCGGMhybZrW8VCoySCzbLQVt8E/fc9TzqEfMu7v+CTUuX9V3sWBgqZqGM6Qu/j5Mfojg==
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr7160730wrx.55.1599045097114;
 Wed, 02 Sep 2020 04:11:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 33sm7288473wri.16.2020.09.02.04.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:11:36 -0700 (PDT)
Date: Wed, 2 Sep 2020 12:11:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 04/24] backlight: gpio: Introduce
 backlight_{enable,disable}
Message-ID: <20200902111134.jx5hbv7wphvzbcoe@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-5-sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:45:12PM +0200, Sam Ravnborg wrote:
> Use backlight_{enable,disable} in the probe function to
> avoid hardcoding power handling in the driver.
> 
> Move platform_set_drvdata() up as the enable/disable call
> will trigger a callback to the driver.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/gpio_backlight.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6f78d928f054..dc9354dc5e6a 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	int ret, init_brightness, def_value;
> +	bool enable = false;
>  
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
> @@ -82,16 +83,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return PTR_ERR(bl);
>  	}
>  
> -	/* Set the initial power state */
> -	if (!of_node || !of_node->phandle)
> +	platform_set_drvdata(pdev, bl);
> +
> +	/* Set the initial state */
> +	if (!of_node || !of_node->phandle) {
>  		/* Not booted with device tree or no phandle link to the node */
> -		bl->props.power = def_value ? FB_BLANK_UNBLANK
> -					    : FB_BLANK_POWERDOWN;
> -	else if (gpiod_get_direction(gbl->gpiod) == 0 &&
> -		 gpiod_get_value_cansleep(gbl->gpiod) == 0)
> -		bl->props.power = FB_BLANK_POWERDOWN;
> +		if (def_value)
> +			enable = true;
> +	} else if (!(gpiod_get_direction(gbl->gpiod) == 0 &&
> +		   gpiod_get_value_cansleep(gbl->gpiod) == 0)) {
> +		enable = true;
> +	}
> +
> +	if (enable)
> +		backlight_enable(bl);
>  	else
> -		bl->props.power = FB_BLANK_UNBLANK;
> +		backlight_disable(bl);
>  
>  	bl->props.brightness = 1;
>  
> @@ -102,7 +109,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	platform_set_drvdata(pdev, bl);
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
