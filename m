Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9C442C61
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 12:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C446E936;
	Tue,  2 Nov 2021 11:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA46E936
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 11:19:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d24so2135908wra.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BV8Q7dK1iGHktSvqteqNvvvCLpO0ziqstJ96eN7bGFk=;
 b=A1gsw59Vbk/Jh1FfF8wS+fZtmmzy1sG243dqu4q2SMzGM5qQYUYDVZP2dsnTKhumxp
 vrtteRbXOpg23prSjFtAQLzUZ87X+FU+3hZTiIHXw5q/3zwPu4dQy9u51X8K0YAyrMGo
 xhWx511b8CXLTsotaAbOw+sK5xJoworEZpNaugvmeVuFgX1eXUZv0pyUqdmY+kCnQrnk
 Uh33ILG3NHJlqOpoEK6UFl3JpyIXOLufPjgM5H+AbuWCao8XS7cc1+f2GSCmJkpgiJvh
 zbHVUrhxO5aenN6OxX7Yg7+wjZ/Om+tKDR9iv2klL8KHDMv25Ssm2sSWftq0LJ4eEJbP
 1TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BV8Q7dK1iGHktSvqteqNvvvCLpO0ziqstJ96eN7bGFk=;
 b=cTc+6Pd0KwEe8zFbr1wiqxu2PqTfP3kKe3t5Bo8nBmHBmDscp5BBBHFHF3xEKlUA6e
 SW3RZYGp1FA3XV+7LEXB72QwtDLRTZxQdbrwlT5CsX6mGoDgeNOsnsHle6ZGx19lyyZh
 K9hpoE8wzfzOhXM9mykFHqMselEBVCnyB+yYJj+r/Ny7FavYYvtLIAQh2kph7LhnmpK7
 ZXziaoQY3rTrIMdMicUjtlfYnEMXuIFSf63NXtlHjxetCCj57OkD+EDVelpmVXGEJ4eb
 Zv7+U3Hr54642y1/YZAxUpTcBooKSyW5No7KHPR9NFHL6radW41ZZDyxVfJhXQo7kuyW
 6MgA==
X-Gm-Message-State: AOAM533C9OIA0p872wni8lJELMETEjXLs5JV04Rv46d2yNN03f48HGgl
 wjeu6CpEo3tf5SSd0rkUNeSKqw==
X-Google-Smtp-Source: ABdhPJzsgj6uVqgv7RqK4Hm+cJXI2XbHFrlQVJx51sEeWWeqYjbui2a8pf8Adkd1Tw4XyS+ZlRtJEg==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr30689564wra.43.1635851984882; 
 Tue, 02 Nov 2021 04:19:44 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id e3sm3783843wrp.8.2021.11.02.04.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:19:44 -0700 (PDT)
Date: Tue, 2 Nov 2021 11:19:42 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Corentin LABBE <clabbe@baylibre.com>
Subject: Re: [PATCH] backlight: led_bl: Add support for an "enable" GPIO
Message-ID: <20211102111942.xd7eqz2zrtb7zotc@maple.lan>
References: <20211102100455.2016610-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102100455.2016610-1-clabbe@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, khilman@baylibre.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 10:04:55AM +0000, Corentin LABBE wrote:
> From: Jean-Jacques Hiblot <jjhiblot@ti.com>
> 
> This patch adds support for an "enable GPIO".

Before taking this kind of change is there a good reason why backlight
should manage the GPIO? I thought that the LED subsystem was a sub
system for LEDs (not LED controllers). In other words if you direct
that the LED be lit up then isn't it the LED driver's job to manage
the GPIO and ensure that it lights up?


Daniel.


> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> ---
>  drivers/video/backlight/led_bl.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index f54d256e2d54..ebd7acc32980 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/backlight.h>
>  #include <linux/leds.h>
> +#include <linux/gpio.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> @@ -15,6 +16,7 @@ struct led_bl_data {
>  	struct device		*dev;
>  	struct backlight_device	*bl_dev;
>  	struct led_classdev	**leds;
> +	struct gpio_desc        *enable_gpio;
>  	bool			enabled;
>  	int			nb_leds;
>  	unsigned int		*levels;
> @@ -35,6 +37,9 @@ static void led_bl_set_brightness(struct led_bl_data *priv, int level)
>  	for (i = 0; i < priv->nb_leds; i++)
>  		led_set_brightness(priv->leds[i], bkl_brightness);
>  
> +	if (!priv->enabled)
> +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> +
>  	priv->enabled = true;
>  }
>  
> @@ -48,6 +53,9 @@ static void led_bl_power_off(struct led_bl_data *priv)
>  	for (i = 0; i < priv->nb_leds; i++)
>  		led_set_brightness(priv->leds[i], LED_OFF);
>  
> +	if (priv->enabled)
> +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> +
>  	priv->enabled = false;
>  }
>  
> @@ -209,6 +217,11 @@ static int led_bl_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->bl_dev);
>  	}
>  
> +	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->enable_gpio))
> +		return PTR_ERR(priv->enable_gpio);
> +
>  	for (i = 0; i < priv->nb_leds; i++)
>  		led_sysfs_disable(priv->leds[i]);
>  
> -- 
> 2.25.1
> 
