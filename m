Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4D1D7E20
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658D6E42B;
	Mon, 18 May 2020 16:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DEF6E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:17:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n5so151527wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z0f8x9O/zHxL58ErQekbYNbB+b0vXLeqYxeXczK2D84=;
 b=X9m00R+UtvJhbdc65EwBUp0wWDlzW8rz2XmMcC8a28tr6jEv9pyePujvfNfy+RJCv9
 nccW4XHCOE54s3k8pXYVj8QBvdz8jhXU+GeUCnYNEZTfs6QpbfBeUIKteNxmah7P3gbk
 CqMncb9KiPgsFSylDsCr+bCfq4HTO6J2JbbDsm5yuZkyOYm3SIayVnIaYIWmGncrfMRG
 0pEo9pb75uwX9lKfCCurSdJvKE1047JChQCT4nlMPC7JpLAw25YtnWMbJTF+WEqOxBiU
 zzKimUBAETQI/K5OIUHZ9OkhzOrhcRGBPjuQvepCunnuox2dBun/UXWzZ4qK+3n1rMag
 dFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z0f8x9O/zHxL58ErQekbYNbB+b0vXLeqYxeXczK2D84=;
 b=ZHSU2nOoFoRrXfk3Qr/KET9mTiT4/mDH6wG9fdd2D/aTkgZ8RudnkEW88qTl+x6dUK
 DbDgDsmscaag5sL6Kwf5G8TIHg/0frR0Uw3Cjw10jUz3xVpwINP3wIvXqfymOLEV0dXv
 V0q9Q4FfglSgTQPQz3g9LfePpzc3PAYZw1BYR6ZyL98Z9u7z9gxQAQVV6CPYQcmxKEvC
 7g+LVDMT0jKN8/rwFmhia58S9V3gzYGVZsV0YGic2tbf3nKE64gboRQcPWLdzL2+bqFS
 yy78Z81fMh8ZFi49uvvwhCCr/1VP0dHVuSVFZ9pEfbyxL3OkyDDia7M0s5eXVzcm93zk
 JWpQ==
X-Gm-Message-State: AOAM533qp30VbMAWxvRCkeZOY5qNim6xDcFjl9Sxqi6HYGG4pb6oRcut
 eIg6huoaXc2lGlg0a3XZG/ElMw==
X-Google-Smtp-Source: ABdhPJwvj56IQBaQRCPFjp1p3Oj55LJxes0VYp96LUjQ87Yns3LqD49oYT7muIAPMbyivQ9KBLcJbQ==
X-Received: by 2002:a1c:e908:: with SMTP id q8mr154811wmc.116.1589818643067;
 Mon, 18 May 2020 09:17:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o26sm17630940wro.83.2020.05.18.09.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:17:22 -0700 (PDT)
Date: Mon, 18 May 2020 17:17:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 09/16] backlight: remove the unused backlight_bl driver
Message-ID: <20200518161720.n4pjjhiomv7bd27x@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-10-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-10-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 09:01:32PM +0200, Sam Ravnborg wrote:
> The driver required initialization using struct generic_bl_info.
> As there are no more references to this struct there is no users left.
> So it is safe to delete the driver.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/Kconfig      |   8 --
>  drivers/video/backlight/Makefile     |   1 -
>  drivers/video/backlight/generic_bl.c | 110 ---------------------------
>  include/linux/backlight.h            |   9 ---
>  4 files changed, 128 deletions(-)
>  delete mode 100644 drivers/video/backlight/generic_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 7d22d7377606..14abfeee8868 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -173,14 +173,6 @@ config BACKLIGHT_EP93XX
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called ep93xx_bl.
>  
> -config BACKLIGHT_GENERIC
> -	tristate "Generic (aka Sharp Corgi) Backlight Driver"
> -	default y
> -	help
> -	  Say y to enable the generic platform backlight driver previously
> -	  known as the Corgi backlight driver. If you have a Sharp Zaurus
> -	  SL-C7xx, SL-Cxx00 or SL-6000x say y.
> -
>  config BACKLIGHT_IPAQ_MICRO
>  	tristate "iPAQ microcontroller backlight driver"
>  	depends on MFD_IPAQ_MICRO
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 0c1a1524627a..9b998cfdc56d 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
> -obj-$(CONFIG_BACKLIGHT_GENERIC)		+= generic_bl.o
>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>  obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
> diff --git a/drivers/video/backlight/generic_bl.c b/drivers/video/backlight/generic_bl.c
> deleted file mode 100644
> index 8fe63dbc8590..000000000000
> --- a/drivers/video/backlight/generic_bl.c
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  Generic Backlight Driver
> - *
> - *  Copyright (c) 2004-2008 Richard Purdie
> - */
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
> -#include <linux/mutex.h>
> -#include <linux/fb.h>
> -#include <linux/backlight.h>
> -
> -static int genericbl_intensity;
> -static struct backlight_device *generic_backlight_device;
> -static struct generic_bl_info *bl_machinfo;
> -
> -static int genericbl_send_intensity(struct backlight_device *bd)
> -{
> -	int intensity = bd->props.brightness;
> -
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -	if (bd->props.state & BL_CORE_FBBLANK)
> -		intensity = 0;
> -	if (bd->props.state & BL_CORE_SUSPENDED)
> -		intensity = 0;
> -
> -	bl_machinfo->set_bl_intensity(intensity);
> -
> -	genericbl_intensity = intensity;
> -
> -	if (bl_machinfo->kick_battery)
> -		bl_machinfo->kick_battery();
> -
> -	return 0;
> -}
> -
> -static int genericbl_get_intensity(struct backlight_device *bd)
> -{
> -	return genericbl_intensity;
> -}
> -
> -static const struct backlight_ops genericbl_ops = {
> -	.options = BL_CORE_SUSPENDRESUME,
> -	.get_brightness = genericbl_get_intensity,
> -	.update_status  = genericbl_send_intensity,
> -};
> -
> -static int genericbl_probe(struct platform_device *pdev)
> -{
> -	struct backlight_properties props;
> -	struct generic_bl_info *machinfo = dev_get_platdata(&pdev->dev);
> -	const char *name = "generic-bl";
> -	struct backlight_device *bd;
> -
> -	bl_machinfo = machinfo;
> -	if (!machinfo->limit_mask)
> -		machinfo->limit_mask = -1;
> -
> -	if (machinfo->name)
> -		name = machinfo->name;
> -
> -	memset(&props, 0, sizeof(struct backlight_properties));
> -	props.type = BACKLIGHT_RAW;
> -	props.max_brightness = machinfo->max_intensity;
> -	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
> -					NULL, &genericbl_ops, &props);
> -	if (IS_ERR(bd))
> -		return PTR_ERR(bd);
> -
> -	platform_set_drvdata(pdev, bd);
> -
> -	bd->props.power = FB_BLANK_UNBLANK;
> -	bd->props.brightness = machinfo->default_intensity;
> -	backlight_update_status(bd);
> -
> -	generic_backlight_device = bd;
> -
> -	dev_info(&pdev->dev, "Generic Backlight Driver Initialized.\n");
> -	return 0;
> -}
> -
> -static int genericbl_remove(struct platform_device *pdev)
> -{
> -	struct backlight_device *bd = platform_get_drvdata(pdev);
> -
> -	bd->props.power = 0;
> -	bd->props.brightness = 0;
> -	backlight_update_status(bd);
> -
> -	dev_info(&pdev->dev, "Generic Backlight Driver Unloaded\n");
> -	return 0;
> -}
> -
> -static struct platform_driver genericbl_driver = {
> -	.probe		= genericbl_probe,
> -	.remove		= genericbl_remove,
> -	.driver		= {
> -		.name	= "generic-bl",
> -	},
> -};
> -
> -module_platform_driver(genericbl_driver);
> -
> -MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
> -MODULE_DESCRIPTION("Generic Backlight Driver");
> -MODULE_LICENSE("GPL");
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index b779c29142fd..eae7a5e66248 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -480,15 +480,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
>  	return dev_get_drvdata(&bl_dev->dev);
>  }
>  
> -struct generic_bl_info {
> -	const char *name;
> -	int max_intensity;
> -	int default_intensity;
> -	int limit_mask;
> -	void (*set_bl_intensity)(int intensity);
> -	void (*kick_battery)(void);
> -};
> -
>  #ifdef CONFIG_OF
>  struct backlight_device *of_find_backlight_by_node(struct device_node *node);
>  #else
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
