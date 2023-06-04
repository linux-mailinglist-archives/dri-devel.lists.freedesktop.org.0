Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D890721840
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 17:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1D310E14A;
	Sun,  4 Jun 2023 15:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B88810E14A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 15:44:50 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id 5puJqUJl3xbtx5puJqV5WT; Sun, 04 Jun 2023 17:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1685893488;
 bh=4MVPujWGEC2Hbr//Xyamq+0YVn6N8CNGZocur4O5qgA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WgnLOsZnQ0uUapvPl9OVnQvD2I/zNbKmRWJ1GXclXg7Alpp8751PpITUE4RtsSJiL
 InZLFVeCEtJkJbUNxjf1E+WS6aLhATHITZHgD3PAp4frjWOlMqrEO53s6Eef8MUuNC
 wD+Bjg7O6kI76uiHo5rRAy/4pj8zQfBmwVcCK1Css5Sg5Xd5f7Edq4/Ub1k35j7J6T
 ph8kLyzqzPL+yOukLEJr/PjtMLLpuxjz4JvgWAbivPVrkyET0WPlot4QKe/4B2W/VN
 Gmxhe28+9GYJ3BjflsZZdPm/Kr5ZWPcMapN6YNjDGe5+VCHdwdITzd9IJT/wPBl5Qp
 KmTbuW2T35xIQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 17:44:48 +0200
X-ME-IP: 86.243.2.178
Message-ID: <ac6ef7f2-0d7a-ba43-4b63-0a23d899230f@wanadoo.fr>
Date: Sun, 4 Jun 2023 17:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
Content-Language: fr
To: Linus Walleij <linus.walleij@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown
 <broonie@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andreas Kemnade <andreas@kemnade.info>, Helge Deller <deller@gmx.de>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 08/05/2023 à 23:20, Linus Walleij a écrit :
> The Nokia 770 is using GPIOs from the global numberspace on the
> CBUS node to pass down to the LCD controller. This regresses when we
> let the OMAP GPIO driver use dynamic GPIO base.
> 
> The Nokia 770 now has dynamic allocation of IRQ numbers, so this
> needs to be fixed for it to work.
> 
> As this is the only user of LCD MIPID we can easily augment the
> driver to use a GPIO descriptor instead and resolve the issue.
> 
> The platform data .shutdown() callback wasn't even used in the
> code, but we encode a shutdown asserting RESET in the remove()
> callback for completeness sake.
> 
> The CBUS also has the ADS7846 touchscreen attached.
> 
> Populate the devices on the Nokia 770 CBUS I2C using software
> nodes instead of platform data quirks. This includes the LCD
> and the ADS7846 touchscreen so the conversion just brings the LCD
> along with it as software nodes is an all-or-nothing design
> pattern.
> 
> The ADS7846 has some limited support for using GPIO descriptors,
> let's convert it over completely to using device properties and then
> fix all remaining boardfile users to provide all platform data using
> software nodes.
> 
> Dump the of includes and of_match_ptr() in the ADS7846 driver as part
> of the job.
> 
> Since we have to move ADS7846 over to obtaining the GPIOs it is
> using exclusively from descriptors, we provide descriptor tables
> for the two remaining in-kernel boardfiles using ADS7846:
> 
> - PXA Spitz
> - MIPS Alchemy DB1000 development board
> 
> It was too hard for me to include software node conversion of
> these two remaining users at this time: the spitz is using a
> hscync callback in the platform data that would require further
> GPIO descriptor conversion of the Spitz, and moving the hsync
> callback down into the driver: it will just become too big of
> a job, but it can be done separately.
> 
> The MIPS Alchemy DB1000 is simply something I cannot test, so take
> the easier approach of just providing some GPIO descriptors in
> this case as I don't want the patch to grow too intrusive.
> 
> As we see that several device trees have incorrect polarity flags
> and just expect to bypass the gpiolib polarity handling, fix up
> all device trees too, in a separate patch.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[...]

> diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
> index 03cff39d392d..e4a7f0b824ff 100644
> --- a/drivers/video/fbdev/omap/lcd_mipid.c
> +++ b/drivers/video/fbdev/omap/lcd_mipid.c
> @@ -7,6 +7,7 @@
>    */
>   #include <linux/device.h>
>   #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/workqueue.h>
>   #include <linux/spi/spi.h>
> @@ -41,6 +42,7 @@ struct mipid_device {
>   						   when we can issue the
>   						   next sleep in/out command */
>   	unsigned long	hw_guard_wait;		/* max guard time in jiffies */
> +	struct gpio_desc	*reset;
>   
>   	struct omapfb_device	*fbdev;
>   	struct spi_device	*spi;
> @@ -556,6 +558,12 @@ static int mipid_spi_probe(struct spi_device *spi)
>   		return -ENOMEM;
>   	}
>   
> +	/* This will de-assert RESET if active */
> +	md->reset = gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(md->reset))
> +		return dev_err_probe(&spi->dev, PTR_ERR(md->reset),
> +				     "no reset GPIO line\n");
> +
>   	spi->mode = SPI_MODE_0;
>   	md->spi = spi;
>   	dev_set_drvdata(&spi->dev, md);
> @@ -574,6 +582,8 @@ static void mipid_spi_remove(struct spi_device *spi)
>   {
>   	struct mipid_device *md = dev_get_drvdata(&spi->dev);
>   
> +	/* Asserts RESET */
> +	gpiod_set_value(md->reset, 1);

Hi,

should this also be done in the probe if mipid_detect() fails?

If yes, please also look at [1], that I've just sent, which introduces 
an error handling path in the probe.

CJ

[1]: 
https://lore.kernel.org/all/8b82e34724755b69f34f15dddb288cd373080390.1620505229.git.christophe.jaillet@wanadoo.fr/

>   	mipid_disable(&md->panel);
>   	kfree(md);
>   }

[...]
