Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB7165B74
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E646E8AF;
	Thu, 20 Feb 2020 10:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0AD6E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:26:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so3990412wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0SjM4+tGyLJdpAvHJhil82UVY+xeu/HNke3gVzHrgP0=;
 b=FqRElPJEJ9+L15VHLk7U6ZXUzHX0dDhwxH7PXRGGoN3Uc957+fIPzhbRzEDZXa0bA5
 yWk7hhWG1u66/4FSEVBJNdQk4uyCRb70bHQWfhlS0/bUPmcZd23ewGdU3BKhBvOiR2g0
 W6erHesdmZ0KlQrnlKkTdMM66IPqFTJ4kUIOMJuYt/+R+CNMdGqirOPAKNbL6TD/3vbn
 2gxnvsMfHc2ljLsZ61GmqKYqFIO+faK+H2Y7dTWrvXpvqTMcANDpPnTXf2eEVERGd8CF
 elPOXfTE5v3Mqjvy64sPpJlujSBeYEaZKy2McUJ9ttgwGE9KApPq6x6wZpPECJ5fB6Mb
 a8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SjM4+tGyLJdpAvHJhil82UVY+xeu/HNke3gVzHrgP0=;
 b=GOpQXa0H1yee5NvMWVy1WPTUcLPIW+diV9uZzB+EF5mUtqzYN3EIrTxdotVv2y4+4g
 6sVWT9BD1jYehFWXutvQYmkToDSx7mwts6QFF4dnfS9C7Aak/yuSbeJOvGlVJ50TPGR4
 SG/YmdwhtqalW1j9EzWnBpANCyQSlqp4gKCmQ2sTZ0qyGxeMW/9S9fTDLiHghOLIxw/a
 R+eSR0jh53Zssy/rCuRwgOnI71Z9Wcy52YjaqLRsvPF0x1eJ+GWsWZPmnvqhzUXhBiJ7
 C94WZ+NnrrRyOKKS99sominFXJEmhFmM3j3HYhwoTgeHkSJ+2waDVuOX11Q454jtbCxF
 cv4A==
X-Gm-Message-State: APjAAAWat6e1XQd8SiW+/+rmpQdYWG0c47Z3an3o5A5UPUXPiNS5Q9X9
 Wfp9HW8D6x5oGaEvCl3eV/Qg/w==
X-Google-Smtp-Source: APXvYqz7q6TvWGVolCpYll/J4Qex3Im80j4ZYFrEhkJ0NUjnho8nkqMrGyHFjwAVAqMHaXqaqu4Etg==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr44958905wrw.60.1582194409694; 
 Thu, 20 Feb 2020 02:26:49 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h2sm4002996wrt.45.2020.02.20.02.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 02:26:49 -0800 (PST)
Date: Thu, 20 Feb 2020 10:26:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: corgi: Convert to use GPIO descriptors
Message-ID: <20200220102647.vlkfcntez6yxfoe4@holly.lan>
References: <20200220090032.6635-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220090032.6635-1-linus.walleij@linaro.org>
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:00:32AM +0100, Linus Walleij wrote:
> The code in the Corgi backlight driver can be considerably
> simplified by moving to GPIO descriptors and lookup tables
> from the board files instead of passing GPIO numbers using
> the old API.
> 
> Make sure to encode inversion semantics for the Akita and
> Spitz platforms inside the GPIO lookup table and drop the
> custom inversion semantics from the driver.
> 
> All in-tree users are converted in this patch.
> 
> Cc: Andrea Adami <andrea.adami@gmail.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

So... I'm still not 100% sure about the bus names. The code is
confusing and made more so by what I think is probably a misleading
comment! So test reports welcome but nevertheless this is...

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
> ChangeLog v2->v3:
> - Switch the SPI bus name to "spi1.1" rather than "spi0.1" for
>   Corgi and "spi2.1" rather than "spi0.1" for Spitz, as
>   pxa2xx_set_spi_info() sets the bus number to 1 and 2
>   respectively.
> ChangeLog v1->v2:
> - Collect Robert's ACK.
> ---
>  arch/arm/mach-pxa/corgi.c           | 12 ++++-
>  arch/arm/mach-pxa/spitz.c           | 34 +++++++++++----
>  drivers/video/backlight/corgi_lcd.c | 68 ++++++++---------------------
>  include/linux/spi/corgi_lcd.h       |  3 --
>  4 files changed, 54 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
> index f2d73289230f..593c7f793da5 100644
> --- a/arch/arm/mach-pxa/corgi.c
> +++ b/arch/arm/mach-pxa/corgi.c
> @@ -563,13 +563,20 @@ static void corgi_bl_kick_battery(void)
>  	}
>  }
>  
> +static struct gpiod_lookup_table corgi_lcdcon_gpio_table = {
> +	.dev_id = "spi1.1",
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", CORGI_GPIO_BACKLIGHT_CONT,
> +			    "BL_CONT", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>  static struct corgi_lcd_platform_data corgi_lcdcon_info = {
>  	.init_mode		= CORGI_LCD_MODE_VGA,
>  	.max_intensity		= 0x2f,
>  	.default_intensity	= 0x1f,
>  	.limit_mask		= 0x0b,
> -	.gpio_backlight_cont	= CORGI_GPIO_BACKLIGHT_CONT,
> -	.gpio_backlight_on	= -1,
>  	.kick_battery		= corgi_bl_kick_battery,
>  };
>  
> @@ -609,6 +616,7 @@ static struct spi_board_info corgi_spi_devices[] = {
>  static void __init corgi_init_spi(void)
>  {
>  	pxa2xx_set_spi_info(1, &corgi_spi_info);
> +	gpiod_add_lookup_table(&corgi_lcdcon_gpio_table);
>  	spi_register_board_info(ARRAY_AND_SIZE(corgi_spi_devices));
>  }
>  #else
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index a4fdc399d152..371008e9bb02 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -525,13 +525,33 @@ static void spitz_bl_kick_battery(void)
>  	}
>  }
>  
> +static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
> +	.dev_id = "spi2.1",
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_CONT,
> +			    "BL_CONT", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_BACKLIGHT_ON,
> +			    "BL_ON", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table akita_lcdcon_gpio_table = {
> +	.dev_id = "spi2.1",
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_CONT,
> +			    "BL_CONT", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_BACKLIGHT_ON,
> +			    "BL_ON", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
>  static struct corgi_lcd_platform_data spitz_lcdcon_info = {
>  	.init_mode		= CORGI_LCD_MODE_VGA,
>  	.max_intensity		= 0x2f,
>  	.default_intensity	= 0x1f,
>  	.limit_mask		= 0x0b,
> -	.gpio_backlight_cont	= SPITZ_GPIO_BACKLIGHT_CONT,
> -	.gpio_backlight_on	= SPITZ_GPIO_BACKLIGHT_ON,
>  	.kick_battery		= spitz_bl_kick_battery,
>  };
>  
> @@ -574,12 +594,10 @@ static struct pxa2xx_spi_controller spitz_spi_info = {
>  
>  static void __init spitz_spi_init(void)
>  {
> -	struct corgi_lcd_platform_data *lcd_data = &spitz_lcdcon_info;
> -
> -	if (machine_is_akita()) {
> -		lcd_data->gpio_backlight_cont = AKITA_GPIO_BACKLIGHT_CONT;
> -		lcd_data->gpio_backlight_on = AKITA_GPIO_BACKLIGHT_ON;
> -	}
> +	if (machine_is_akita())
> +		gpiod_add_lookup_table(&akita_lcdcon_gpio_table);
> +	else
> +		gpiod_add_lookup_table(&spitz_lcdcon_gpio_table);
>  
>  	pxa2xx_set_spi_info(2, &spitz_spi_info);
>  	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
> diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
> index 68f7592c5060..25ef0cbd7583 100644
> --- a/drivers/video/backlight/corgi_lcd.c
> +++ b/drivers/video/backlight/corgi_lcd.c
> @@ -15,7 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/fb.h>
>  #include <linux/lcd.h>
>  #include <linux/spi/spi.h>
> @@ -90,9 +90,8 @@ struct corgi_lcd {
>  	int	mode;
>  	char	buf[2];
>  
> -	int	gpio_backlight_on;
> -	int	gpio_backlight_cont;
> -	int	gpio_backlight_cont_inverted;
> +	struct gpio_desc *backlight_on;
> +	struct gpio_desc *backlight_cont;
>  
>  	void (*kick_battery)(void);
>  };
> @@ -403,13 +402,13 @@ static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
>  	corgi_ssp_lcdtg_send(lcd, DUTYCTRL_ADRS, intensity);
>  
>  	/* Bit 5 via GPIO_BACKLIGHT_CONT */
> -	cont = !!(intensity & 0x20) ^ lcd->gpio_backlight_cont_inverted;
> +	cont = !!(intensity & 0x20);
>  
> -	if (gpio_is_valid(lcd->gpio_backlight_cont))
> -		gpio_set_value_cansleep(lcd->gpio_backlight_cont, cont);
> +	if (lcd->backlight_cont)
> +		gpiod_set_value_cansleep(lcd->backlight_cont, cont);
>  
> -	if (gpio_is_valid(lcd->gpio_backlight_on))
> -		gpio_set_value_cansleep(lcd->gpio_backlight_on, intensity);
> +	if (lcd->backlight_on)
> +		gpiod_set_value_cansleep(lcd->backlight_on, intensity);
>  
>  	if (lcd->kick_battery)
>  		lcd->kick_battery();
> @@ -482,48 +481,17 @@ static int setup_gpio_backlight(struct corgi_lcd *lcd,
>  				struct corgi_lcd_platform_data *pdata)
>  {
>  	struct spi_device *spi = lcd->spi_dev;
> -	int err;
> -
> -	lcd->gpio_backlight_on = -1;
> -	lcd->gpio_backlight_cont = -1;
> -
> -	if (gpio_is_valid(pdata->gpio_backlight_on)) {
> -		err = devm_gpio_request(&spi->dev, pdata->gpio_backlight_on,
> -					"BL_ON");
> -		if (err) {
> -			dev_err(&spi->dev,
> -				"failed to request GPIO%d for backlight_on\n",
> -				pdata->gpio_backlight_on);
> -			return err;
> -		}
> -
> -		lcd->gpio_backlight_on = pdata->gpio_backlight_on;
> -		gpio_direction_output(lcd->gpio_backlight_on, 0);
> -	}
>  
> -	if (gpio_is_valid(pdata->gpio_backlight_cont)) {
> -		err = devm_gpio_request(&spi->dev, pdata->gpio_backlight_cont,
> -					"BL_CONT");
> -		if (err) {
> -			dev_err(&spi->dev,
> -				"failed to request GPIO%d for backlight_cont\n",
> -				pdata->gpio_backlight_cont);
> -			return err;
> -		}
> -
> -		lcd->gpio_backlight_cont = pdata->gpio_backlight_cont;
> -
> -		/* spitz and akita use both GPIOs for backlight, and
> -		 * have inverted polarity of GPIO_BACKLIGHT_CONT
> -		 */
> -		if (gpio_is_valid(lcd->gpio_backlight_on)) {
> -			lcd->gpio_backlight_cont_inverted = 1;
> -			gpio_direction_output(lcd->gpio_backlight_cont, 1);
> -		} else {
> -			lcd->gpio_backlight_cont_inverted = 0;
> -			gpio_direction_output(lcd->gpio_backlight_cont, 0);
> -		}
> -	}
> +	lcd->backlight_on = devm_gpiod_get_optional(&spi->dev,
> +						    "BL_ON", GPIOD_OUT_LOW);
> +	if (IS_ERR(lcd->backlight_on))
> +		return PTR_ERR(lcd->backlight_on);
> +
> +	lcd->backlight_cont = devm_gpiod_get_optional(&spi->dev, "BL_CONT",
> +						      GPIOD_OUT_LOW);
> +	if (IS_ERR(lcd->backlight_cont))
> +		return PTR_ERR(lcd->backlight_cont);
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/spi/corgi_lcd.h b/include/linux/spi/corgi_lcd.h
> index edf4beccdadb..0b857616919c 100644
> --- a/include/linux/spi/corgi_lcd.h
> +++ b/include/linux/spi/corgi_lcd.h
> @@ -11,9 +11,6 @@ struct corgi_lcd_platform_data {
>  	int	default_intensity;
>  	int	limit_mask;
>  
> -	int	gpio_backlight_on;	/* -1 if n/a */
> -	int	gpio_backlight_cont;	/* -1 if n/a */
> -
>  	void (*notify)(int intensity);
>  	void (*kick_battery)(void);
>  };
> -- 
> 2.24.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
