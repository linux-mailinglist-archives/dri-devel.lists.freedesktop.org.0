Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A31D7F3B
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77789F31;
	Mon, 18 May 2020 16:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDD989F31
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:53:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so12779276wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ijBAqWhjVT2LjRwjHCsApAQ5X0eCT7RC7hJgLAkyqw8=;
 b=wgPUN3+2/K0kG4HK1mqjblfGmptTaw2oeUN7NSXv6BL7pOrux4WPaa0WU849PQB3TD
 wAeOYNkGKELEztGhwlrSxxaOgMkAtov0DVH1Y+Rfl+NbKuW+iZSawH2gTraEW2M2rFcv
 IKi3OseZdHVsvG87ZueXMlEotysdOgqJXfkaNGZ0GVLu5LABAzTWdL7CyrGwKZLLohQs
 +oBLX40blfzWsC5DK56HRy2F0lD0/jWW0yZhZex2k/VP0rOypoCUIMSFTT/RqcCs7NXI
 G0IFpvEwO3mzCp0yRW118dCUuTAgNeerRl6HbTg2RVUtoHdILMZ1Zx9jz3PPo3MW1Mtx
 kxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ijBAqWhjVT2LjRwjHCsApAQ5X0eCT7RC7hJgLAkyqw8=;
 b=F12tooPwaYTwtnnCFgfqNVYvlvp/g1LkbtjklYEIWKhz/p7tHyKC6ThwjB7+XQDnGP
 cwT0pWSkxnjrnzRzHYH7YGLAYig0lq/FMmmpwEeKkFNo8MA9SWIJiC+4IUvGZCRFAEBa
 B3turcg9i0dccg9Pxf62H1uyFuvOCZ7mcuFGLTEzcE/VYudY25F8RvHvz0xjh/MAn6hd
 qA5YOsBTcF6+pJiZCUwOVZU4DGOvV4/aRNUcweGQuZS03czOOTU5qRqrA1dv7HP6qsLC
 CgbNlvw3lkTPwVuiJ5j9RHp/1JbFU6YXZulQ0OoW0peV1UBOHb+RYVHfc5yQfmId4SdO
 Idlw==
X-Gm-Message-State: AOAM533k1KGc/lyQFW8v168zzcJdeQF+bO8jCY7JW/oeT2SR0C03LsZe
 NmOxh8pb6qrcgMyXSArcStRtmQ==
X-Google-Smtp-Source: ABdhPJwXbF7kj+gBYCRIblwP4oXxUs4NfAF8BsL5zMjdb2Km2HpvTtBro/yU94ectqx4vHKNdUFiqg==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr20068342wrt.286.1589820786103; 
 Mon, 18 May 2020 09:53:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x24sm18288668wrd.51.2020.05.18.09.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:53:05 -0700 (PDT)
Date: Mon, 18 May 2020 17:53:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/16] backlight: make of_find_backlight static
Message-ID: <20200518165302.4andpp27rxj5ub2x@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-14-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:36PM +0200, Sam Ravnborg wrote:
> There are no external users of of_find_backlight,
> as they have all changed to use the managed version.
> Make of_find_backlight static to prevent new external users.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

In principle I'm OK with this... just a couple of tiny nitpicks in the
new documentation.


Daniel.


> ---
>  drivers/video/backlight/backlight.c | 31 ++++++++++-------------------
>  include/linux/backlight.h           |  6 ------
>  2 files changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 2212f0e3570e..e23b09d03a65 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -650,22 +650,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
>  EXPORT_SYMBOL(of_find_backlight_by_node);
>  #endif
>  
> -/**
> - * of_find_backlight - Get backlight device
> - * @dev: Device
> - *
> - * This function looks for a property named 'backlight' on the DT node
> - * connected to @dev and looks up the backlight device.
> - *
> - * Call backlight_put() to drop the reference on the backlight device.
> - *
> - * Returns:
> - * A pointer to the backlight device if found.
> - * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
> - * device is found.
> - * NULL if there's no backlight property.
> - */
> -struct backlight_device *of_find_backlight(struct device *dev)
> +static struct backlight_device *of_find_backlight(struct device *dev)
>  {
>  	struct backlight_device *bd = NULL;
>  	struct device_node *np;
> @@ -691,7 +676,6 @@ struct backlight_device *of_find_backlight(struct device *dev)
>  
>  	return bd;
>  }
> -EXPORT_SYMBOL(of_find_backlight);
>  
>  static void devm_backlight_release(void *data)
>  {
> @@ -702,9 +686,16 @@ static void devm_backlight_release(void *data)
>   * devm_of_find_backlight - find backlight for a device
>   * @dev: the device
>   *
> - * Device managed version of of_find_backlight().
> - * The reference on the backlight device is automatically
> - * dropped on driver detach.
> + * This function looks for a property named 'backlight' on the DT node
> + * connected to @dev and looks up the backlight device.

Should this be a full paragraph?

> + * The lookup is device managed so the reference to the backlight device
> + * is automatically dropped on driver detach.
> + *
> + * Returns:

Wasn't this upper case everywhere else?


> + * A pointer to the backlight device if found.
> + * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
> + * device is found.
> + * NULL if there's no backlight property.
>   */
>  struct backlight_device *devm_of_find_backlight(struct device *dev)
>  {
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 308aec67fa4f..99e7cdace2be 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -494,14 +494,8 @@ of_find_backlight_by_node(struct device_node *node)
>  #endif
>  
>  #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> -struct backlight_device *of_find_backlight(struct device *dev);
>  struct backlight_device *devm_of_find_backlight(struct device *dev);
>  #else
> -static inline struct backlight_device *of_find_backlight(struct device *dev)
> -{
> -	return NULL;
> -}
> -
>  static inline struct backlight_device *
>  devm_of_find_backlight(struct device *dev)
>  {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
