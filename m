Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA697243882
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B774E6E99E;
	Thu, 13 Aug 2020 10:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335AD6E99E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:30:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so4577695wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gD19KcsF4B6xl+8H3nz+6GJn6USH1n2veT4i6mZ60nw=;
 b=doNwoFoDELUfMAJtFAh5MV20DZ1gNgWd9MHb5XD6XQIoeBdP6UrUAbi/77dLWSxyy1
 XQKoEbxmHFS3eJGODEGTge/Oa1weY2I1zRHtXGvnWyFYLjNaBq6hmFMd5seHcJyvGE0l
 /QAdNFqPwOS8HD8FxInMNiPcxdvK8laVFqDsVg3yJc7aWSQOvTfBnysJF8oCVexBhj37
 8z+PBam+vWy18uGduk61c9a9blWnoeY98B2ysO/FEi3xbNHzrYkI9Jd/ORTFMgrVGbip
 ys5xZ4RtmA/Gb6iJT4ClQ+2sz+q0otObvBzxpJ3SuMjt7NkmRdO11rrJdkbBUk2eLPwB
 vCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gD19KcsF4B6xl+8H3nz+6GJn6USH1n2veT4i6mZ60nw=;
 b=kqRzkyWCLo1odCpQOmpNPBe+PLQ6qBhOVZ1Ppxm1jYfeKGJcUrxKMFUARzIpB8BsZr
 xpRTDUbEQBhzko2OuYOPAwQ+fbCWmdDQnsjXOTPwDkNDqQvoK6hpQpBvHQxcHagM4Z7A
 TvW3m6Om1Ob6KbmYfA+f15B4nPqd1BPb/4tjSAD7iWsiTJ25BjvfzE72LyuBnXiE60HE
 BLBc93f1TCvj+//odAAEYWaUcyaUkj4J+GDDOfabFnGcQYBwmcJ37LHl4ZpY2dU+GOZp
 oc8ZnXEqmw4sqz3f+SGFN5F6K+SZgtAOKEPhdQP9e12ti5OW+ce6/m1zvRqw0iII1FdT
 A0Jw==
X-Gm-Message-State: AOAM531vBlA2mEZdn6+lljpK7tIQnTwXiiZQP2OQf6eNmr3hTk9aSwiG
 xoHJjFfSOfhWHzZBHHaEXlRl2g==
X-Google-Smtp-Source: ABdhPJxuXlBAYnv751MjNRd93gnW0/JI7YHFQBe5RN0k3pbKHUBa2RFdamUvS/YdSfmKfWsSjobeVg==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr3515088wmb.96.1597314649657; 
 Thu, 13 Aug 2020 03:30:49 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
 by smtp.gmail.com with ESMTPSA id k204sm9291754wma.21.2020.08.13.03.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 03:30:48 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:30:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3 v2] backlight: Add Kinetic KTD253 backlight driver
Message-ID: <20200813103046.gu4xplfoki7b4sgy@holly.lan>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
 <20200812085850.2643820-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812085850.2643820-3-linus.walleij@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 10:58:50AM +0200, Linus Walleij wrote:
> The Kinetic KTD253 backlight driver is controlled with a
> single GPIO line, but still supports a range of brightness
> settings by sending fast pulses on the line.
> 
> This is based off the source code release for the Samsung
> GT-S7710 mobile phone.
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

(although note that Sam has some patches that introduce new
APIs that this driver should, but cannot yet, use)


Daniel.

> ---
> ChangeLog v1->v2:
> - Expose the 32 actual hardware levels of brightness directly
>   instead of using an interpolated "brightness" table.
> - Use the new backlight_get_brightness() helper.
> - Call backlight_update_status() in probe instead of calling
>   local functions to sync brightness.
> - Sort includes alphabetically.
> - Name the GPIO line "enable" and grab that in accordance
>   with the change to the DT bindings.
> ---
>  MAINTAINERS                                |   6 +
>  drivers/video/backlight/Kconfig            |   8 +
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/ktd253-backlight.c | 198 +++++++++++++++++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 drivers/video/backlight/ktd253-backlight.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e627ed60d75a..4c93e3a7be11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9711,6 +9711,12 @@ F:	Documentation/admin-guide/auxdisplay/ks0108.rst
>  F:	drivers/auxdisplay/ks0108.c
>  F:	include/linux/ks0108.h
>  
> +KTD253 BACKLIGHT DRIVER
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> +F:	drivers/video/backlight/ktd253-backlight.c
> +
>  L3MDEV
>  M:	David Ahern <dsahern@kernel.org>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 87f9fc238d28..d83c87b902c1 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -182,6 +182,14 @@ config BACKLIGHT_IPAQ_MICRO
>  	  computers. Say yes if you have one of the h3100/h3600/h3700
>  	  machines.
>  
> +config BACKLIGHT_KTD253
> +	tristate "Backlight Driver for Kinetic KTD253"
> +	depends on GPIOLIB || COMPILE_TEST
> +	help
> +	  Say y to enabled the backlight driver for the Kinetic KTD253
> +	  which is a 1-wire GPIO-controlled backlight found in some mobile
> +	  phones.
> +
>  config BACKLIGHT_LM3533
>  	tristate "Backlight Driver for LM3533"
>  	depends on MFD_LM3533
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 13463b99f1f9..685f3f1ca4df 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>  obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
>  obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
> +obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
>  obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
> diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
> new file mode 100644
> index 000000000000..e3fee3f1f582
> --- /dev/null
> +++ b/drivers/video/backlight/ktd253-backlight.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for the Kinetic KTD253
> + * Based on code and know-how from the Samsung GT-S7710
> + * Gareth Phillips <gareth.phillips@samsung.com>
> + */
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/fb.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +/* Current ratio is n/32 from 1/32 to 32/32 */
> +#define KTD253_MIN_RATIO 1
> +#define KTD253_MAX_RATIO 32
> +#define KTD253_DEFAULT_RATIO 13
> +
> +#define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
> +#define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
> +#define KTD253_T_OFF_MS 3
> +
> +struct ktd253_backlight {
> +	struct device *dev;
> +	struct backlight_device *bl;
> +	struct gpio_desc *gpiod;
> +	u16 ratio;
> +};
> +
> +static int ktd253_backlight_update_status(struct backlight_device *bl)
> +{
> +	struct ktd253_backlight *ktd253 = bl_get_data(bl);
> +	int brightness = backlight_get_brightness(bl);
> +	u16 target_ratio;
> +	u16 current_ratio = ktd253->ratio;
> +	unsigned long flags;
> +
> +	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
> +
> +	target_ratio = brightness;
> +
> +	if (target_ratio == current_ratio)
> +		/* This is already right */
> +		return 0;
> +
> +	if (target_ratio == 0) {
> +		gpiod_set_value_cansleep(ktd253->gpiod, 0);
> +		/*
> +		 * We need to keep the GPIO low for at least this long
> +		 * to actually switch the KTD253 off.
> +		 */
> +		msleep(KTD253_T_OFF_MS);
> +		ktd253->ratio = 0;
> +		return 0;
> +	}
> +
> +	if (current_ratio == 0) {
> +		gpiod_set_value_cansleep(ktd253->gpiod, 1);
> +		ndelay(KTD253_T_HIGH_NS);
> +		/* We always fall back to this when we power on */
> +		current_ratio = KTD253_MAX_RATIO;
> +	}
> +
> +	/*
> +	 * WARNING:
> +	 * The loop to set the correct current level is performed
> +	 * with interrupts disabled as it is timing critical.
> +	 * The maximum number of cycles of the loop is 32
> +	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
> +	 */
> +	local_irq_save(flags);
> +	while (current_ratio != target_ratio) {
> +		/*
> +		 * These GPIO operations absolutely can NOT sleep so no
> +		 * _cansleep suffixes, and no using GPIO expanders on
> +		 * slow buses for this!
> +		 */
> +		gpiod_set_value(ktd253->gpiod, 0);
> +		ndelay(KTD253_T_LOW_NS);
> +		gpiod_set_value(ktd253->gpiod, 1);
> +		ndelay(KTD253_T_HIGH_NS);
> +		/* After 1/32 we loop back to 32/32 */
> +		if (current_ratio == KTD253_MIN_RATIO)
> +			current_ratio = KTD253_MAX_RATIO;
> +		else
> +			current_ratio--;
> +	}
> +	local_irq_restore(flags);
> +	ktd253->ratio = current_ratio;
> +
> +	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops ktd253_backlight_ops = {
> +	.options	= BL_CORE_SUSPENDRESUME,
> +	.update_status	= ktd253_backlight_update_status,
> +};
> +
> +static int ktd253_backlight_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct backlight_device *bl;
> +	struct ktd253_backlight *ktd253;
> +	u32 max_brightness;
> +	u32 brightness;
> +	int ret;
> +
> +	ktd253 = devm_kzalloc(dev, sizeof(*ktd253), GFP_KERNEL);
> +	if (!ktd253)
> +		return -ENOMEM;
> +	ktd253->dev = dev;
> +
> +	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
> +	if (ret)
> +		max_brightness = KTD253_MAX_RATIO;
> +	if (max_brightness > KTD253_MAX_RATIO) {
> +		/* Clamp brightness to hardware max */
> +		dev_err(dev, "illegal max brightness specified\n");
> +		max_brightness = KTD253_MAX_RATIO;
> +	}
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = KTD253_DEFAULT_RATIO;
> +	if (brightness > max_brightness) {
> +		/* Clamp default brightness to max brightness */
> +		dev_err(dev, "default brightness exceeds max brightness\n");
> +		brightness = max_brightness;
> +	}
> +
> +	if (brightness)
> +		/* This will be the default ratio when the KTD253 is enabled */
> +		ktd253->ratio = KTD253_MAX_RATIO;
> +	else
> +		ktd253->ratio = 0;
> +
> +	ktd253->gpiod = devm_gpiod_get(dev, "enable",
> +				       brightness ? GPIOD_OUT_HIGH :
> +				       GPIOD_OUT_LOW);
> +	if (IS_ERR(ktd253->gpiod)) {
> +		ret = PTR_ERR(ktd253->gpiod);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "gpio line missing or invalid.\n");
> +		return ret;
> +	}
> +	gpiod_set_consumer_name(ktd253->gpiod, dev_name(dev));
> +
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ktd253,
> +					    &ktd253_backlight_ops, NULL);
> +	if (IS_ERR(bl)) {
> +		dev_err(dev, "failed to register backlight\n");
> +		return PTR_ERR(bl);
> +	}
> +	bl->props.max_brightness = max_brightness;
> +	/* When we just enable the GPIO line we set max brightness */
> +	if (brightness) {
> +		bl->props.brightness = brightness;
> +		bl->props.power = FB_BLANK_UNBLANK;
> +	} else {
> +		bl->props.brightness = 0;
> +		bl->props.power = FB_BLANK_POWERDOWN;
> +	}
> +
> +	ktd253->bl = bl;
> +	platform_set_drvdata(pdev, bl);
> +	backlight_update_status(bl);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ktd253_backlight_of_match[] = {
> +	{ .compatible = "kinetic,ktd253" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ktd253_backlight_of_match);
> +
> +static struct platform_driver ktd253_backlight_driver = {
> +	.driver = {
> +		.name = "ktd253-backlight",
> +		.of_match_table = ktd253_backlight_of_match,
> +	},
> +	.probe		= ktd253_backlight_probe,
> +};
> +module_platform_driver(ktd253_backlight_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Kinetic KTD253 Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ktd253-backlight");
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
