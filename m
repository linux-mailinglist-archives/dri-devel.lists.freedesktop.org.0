Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7008157567
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 13:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D909C6E97B;
	Mon, 10 Feb 2020 12:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17456EC19
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 12:40:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u6so7548641wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J20aokLE/FnFgsF4J/f1w1FTiWTgMwqY6FvWt826aac=;
 b=i+vpCT8SElm6MIPIVaan9xBwab65cXp61K2EiHSdkmqKtlkomh65hl61u0hojsEtVj
 oh4hHjFqg+ZG5ZcTqE292BXnxsCy3+p0wLy73ranLpRLhFZHpUkGdfTAAwSHwR/uDkPO
 v2sTUlROFZrTqDpNPL8A7iRMSIm6eUofgDLwkUQi1rbZPGumVihkEVTbWzyWz45+G4yL
 uiAisFiOH6z+heEsm9cwuuJEnbLNwWaBpwemvr+jo3c9IW0dNwywN/CHJxQXdE7yF4PI
 j7p7QlBhQ3aBawDW2A/D9bMZX1/+HZjCQ/3wFwYl+1ZdX3KdLJdNL6R09cSlzFPQqiQ7
 npLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J20aokLE/FnFgsF4J/f1w1FTiWTgMwqY6FvWt826aac=;
 b=ijAAmGn/xHLZBrqVyx+94bzCHWnAu4LPmKKjFjKPKeLzjt4QSRoKYiwA9ONUZ/uCpM
 4MCdOL1JWMZ80udlwkrPMmKCo5p9uQ6GjSeQ2G9R5XHWwOm2sChdnBWND8RyittCR2PA
 AGZ8ptobuXQLpKkdpzVZOfBi35AQ9zniRAG5/3Lc33gQ5ozjH4u+hrjL2mKmolit2NXw
 6wOgPSrID//8tiypU49/SSnw6pYIItcfNc4I/vo4nHx6mYAYyuHUx4+m5woCP3DMN4sX
 JJli39bBeUSyaCwuZfaC6McKsIcXpJtlj0t6/9WsQJEkSXEx8dUXup+67xZTHNRFP4zS
 14Hg==
X-Gm-Message-State: APjAAAXtqTS4VhCMg85jSQ6wiZoB8V4vu5y/f9f8bI1fDLtSP6Uhfgb9
 BZYoKD917Yi9UfQ6j5GXDAxnig==
X-Google-Smtp-Source: APXvYqxiuhA2Q6uJVC0Fc/mZX1zNCJf/soOjJOE+Tk/eZ5pzBG7p1xhstgbBjakfGWwT89G01GaWXg==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr1849885wrs.184.1581338450384; 
 Mon, 10 Feb 2020 04:40:50 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l132sm486344wmf.16.2020.02.10.04.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 04:40:49 -0800 (PST)
Date: Mon, 10 Feb 2020 12:40:48 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] backlight: corgi: Convert to use GPIO descriptors
Message-ID: <20200210124048.o72zuo3tnlncoatq@holly.lan>
References: <20200210101504.287366-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210101504.287366-1-linus.walleij@linaro.org>
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

On Mon, Feb 10, 2020 at 11:15:04AM +0100, Linus Walleij wrote:
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
> ---
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
> index f2d73289230f..c9625dcae27c 100644
> --- a/arch/arm/mach-pxa/corgi.c
> +++ b/arch/arm/mach-pxa/corgi.c
> @@ -563,13 +563,20 @@ static void corgi_bl_kick_battery(void)
>  	}
>  }
>  
> +static struct gpiod_lookup_table corgi_lcdcon_gpio_table = {
> +	.dev_id = "spi0.1",

How did you arrive at this dev_id?

corgi_spi_devices set the bus num for corgi-lcd to 1.


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
> index a4fdc399d152..82e80a257c0f 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -525,13 +525,33 @@ static void spitz_bl_kick_battery(void)
>  	}
>  }
>  
> +static struct gpiod_lookup_table spitz_lcdcon_gpio_table = {
> +	.dev_id = "spi0.1",

Similar to above, spitz_spi_devices set the bus number to 2.


Daniel.


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
> +	.dev_id = "spi0.1",
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
> 2.23.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
