Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12671CF2EBA
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 11:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E57F10E133;
	Mon,  5 Jan 2026 10:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zuDLOZAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F210E133
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 10:09:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so90522475e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 02:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767607794; x=1768212594;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NvKDos4fJsou+PSfhxPxHl5xgEuLiCmh0jj1etHYyZs=;
 b=zuDLOZARYctr7jXvsh4KVqT16BgwaBFdXjUmoZl309TiIm+CC8D8T2d+N0YHRDYfu/
 elbc5SFhKfA8oTldXFTjElsXGqgQ4xZyRVcx9n/ooFC5In7s6CLb4iFYX3e/9B5lNROg
 z/Zj9vWW4WhiAZYplKTaxQ/fKOlz5Bmu3mYGcDnJJUCmfHETOc2yeq9I3C8lVBVhNP0G
 EVitjefXpeeW73SNuafKZoHmsGhuZoR6bzsEynyQsTdhZbtFy8iw96LJTV7NPNxwtdkL
 LvUrqt3D1IUzhNgaBNYSyVWyZe82CKNqgdi4voRlAIbVO6vtaSWLl8q43vAjRVZ+qeYC
 mIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767607794; x=1768212594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvKDos4fJsou+PSfhxPxHl5xgEuLiCmh0jj1etHYyZs=;
 b=J+yVLih8mpaQqIFlb9vqsIv8b72JwBmSO5sSakjI2voUBQMtK1Kf0kIOBZ6d0v+XwK
 EOZ3LcoUwRT0c/Zin/FX0U/OD9homZpn6pOm0MczbFBjqOu1fQl5r7ZRF8kZ2usdTZny
 8enjddDci4z2HNxGHaG9wp/J6h/0SjzJSyZL0hE7lV50VcvcG6pfD6riEU/RLgp781EM
 PXcpRi6UjJjOSHsysNlnHoppnhOk8swH1PT1dzTYj/MhTtaH9w9OGBmHJZGNs3P8+n96
 Zo6XNTkniSuju0qLXH5vOJPv0r01pBQWYQ/oRvrCUj6VzsqwvFxZPtekJKvjGRKMotwA
 0hGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX3+8Dx2epFTgrGKyKO6ipgUZfb+OBeLiPBaMeVfHtQr2Gg/D9WPQnMJ8+FU/g8Mc/V07ZQKFRy50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKtaHvk3GPIY9GoEWyK6+OSMbLM0kquK4vKbrlc3ZbaHs+4F5x
 gNisZsNVEJjds+LxNl8t/Wdk3X39uILXdDmvjGqtnz42JmyM/4wJxzSA/BdJSsaXphY=
X-Gm-Gg: AY/fxX7PLa/wsLgN1sG2xsTUFvyvoQBIvGK8l2/juug4PydrVIBjDmoHMWSGSO8b15R
 malz1ekPe78L8j43o4N9jq7V2d9Cke3aTa6nxnUXcd+8ZbF14JviHLmwnPZ3E6WKXMwkI1Z9Dr7
 V9EFoF7kuBefbZnNc2UbY6BKO2cPA9hdgY0CEZV1q4o7g9jQvR/lLszaNcdC1dPGL+3ptFaXXr+
 WdtDSdo2Iv6WLE3pfGGdj4J2Hl43pWNFg86vR3LNWjg/bbIcKVKGTL6EmVYUstdVv92brKTzRLd
 UGvzFd6GX0NlMyRf7hK11zHg81RxfGYruYSWGXlAAftfNgfqsYQH3v6yxo1okiQ9PFDStvBCVjS
 VH5hHAd4vCe2QREKgdlM64Eh5yB2NZNLVOBLqSiNIhD1ONOj6S7hrY3p7L2hSZEul5FY1T3lT/j
 dq+YDAw3zil68j92FS156hxk5FvxUoDNbnBwYpq7jCY0fi65Cmt1R1+H8xVbMCM3oZWJNx419Yd
 cZcr4G2vdeh2sh4RSv2WGNn4e9RAGL9RZFLVjZpZYYvqA4amZXeTkdmeepQAHbRMRdeHsux
X-Google-Smtp-Source: AGHT+IGE2qcg6xcM7QfR3K1EbPQJ77qbf+cnZNCN9Ov6K1/H31yxXIcb9M1Xw2mnMf6vzDPPoCfzWA==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-47d19557183mr677320615e9.15.1767607794105; 
 Mon, 05 Jan 2026 02:09:54 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d13e2e0sm176557595e9.1.2026.01.05.02.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 02:09:53 -0800 (PST)
Date: Mon, 5 Jan 2026 10:09:51 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aVuN7zVUWJ1qsVh8@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105085120.230862-3-tessolveupstream@gmail.com>
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

On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
> single one. This allows panels that require driving several enable pins
> to be controlled by the backlight framework.
>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>  1 file changed, 45 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 728a546904b0..037e1c111e48 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -17,14 +17,18 @@
>
>  struct gpio_backlight {
>  	struct device *dev;
> -	struct gpio_desc *gpiod;
> +	struct gpio_desc **gpiods;
> +	unsigned int num_gpios;

Why not use struct gpio_descs for this?

Once you do that, then most of the gbl->num_gpios loops can be replaced with
calls to the array based accessors.


>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct gpio_backlight *gbl = bl_get_data(bl);
> +	unsigned int i;
> +	int br = backlight_get_brightness(bl);
>
> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
> +	for (i = 0; i < gbl->num_gpios; i++)
> +		gpiod_set_value_cansleep(gbl->gpiods[i], br);
>
>  	return 0;
>  }
> @@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	int ret, init_brightness, def_value;
> +	unsigned int i;
>
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
> @@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>
>  	def_value = device_property_read_bool(dev, "default-on");
>
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod))
> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> -				     "The gpios parameter is missing or invalid\n");
> +	gbl->num_gpios = gpiod_count(dev, NULL);
> +	if (gbl->num_gpios == 0)
> +		return dev_err_probe(dev, -EINVAL,
> +			"The gpios parameter is missing or invalid\n");
> +	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
> +				   GFP_KERNEL);
> +	if (!gbl->gpiods)
> +		return -ENOMEM;

This is definitely easier if you simply use devm_get_array().


> +
> +	for (i = 0; i < gbl->num_gpios; i++) {
> +		gbl->gpiods[i] =
> +			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
> +		if (IS_ERR(gbl->gpiods[i]))
> +			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
> +					"Failed to get GPIO at index %u\n", i);
> +	}
>
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
> @@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	}
>
>  	/* Set the initial power state */
> -	if (!of_node || !of_node->phandle)
> +	if (!of_node || !of_node->phandle) {
>  		/* Not booted with device tree or no phandle link to the node */
>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
> -					    : BACKLIGHT_POWER_OFF;
> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> -		bl->props.power = BACKLIGHT_POWER_OFF;
> -	else
> -		bl->props.power = BACKLIGHT_POWER_ON;
> +						    : BACKLIGHT_POWER_OFF;
> +	} else {
> +		bool all_high = true;
> +
> +		for (i = 0; i < gbl->num_gpios; i++) {
> +			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {

Why is there a != here?


> +				all_high = false;
> +				break;
> +			}
> +		}
> +
> +		bl->props.power =
> +			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
> +	}
>
>  	bl->props.brightness = 1;
>
>  	init_brightness = backlight_get_brightness(bl);
> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
> -	if (ret) {
> -		dev_err(dev, "failed to set initial brightness\n");
> -		return ret;
> +
> +	for (i = 0; i < gbl->num_gpios; i++) {
> +		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					"failed to set gpio %u direction\n",
> +					i);
>  	}
>
>  	platform_set_drvdata(pdev, bl);


Daniel.
