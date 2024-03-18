Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F187E919
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 13:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2C110F607;
	Mon, 18 Mar 2024 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qm/k5G7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AC910F607
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:06:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso974107f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710763595; x=1711368395; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eHGPA8dgPTqYeKubjV9R4JW3cUfS+CCAqVnDiKpMYxc=;
 b=Qm/k5G7Crg/urcs28zSR0cDw/ikD3LU2CDUUvXwJnFJg6mliFwldpCS4cVcoEprJIg
 HNJpeA9v1a0/HupRBFibVEPnUpO015WJPYZEkJBdPe+r/QgvWCb+WuAHlaJ6Iuhn6xoU
 q55mSwDkqYkx9e6u2td9DK+5CAebOWu349MMJIk/+4CvmQiEr6usCPqfU5ceEHG7K98m
 /lGrbgMjJY/QAIpBvCi/hehBrnBKsZhq4olUzJ5Riug5BvSEdGq6ht/XrZbFYOFh5kLA
 9pSrWpqErcFVpVU0CQTn9fE4dkV16aFR+oa7rGKboiSZpSv39sTmb2L7/RnHUBMwZFzN
 FF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710763595; x=1711368395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHGPA8dgPTqYeKubjV9R4JW3cUfS+CCAqVnDiKpMYxc=;
 b=ejE7dKvtUrhUjrpFJ95cHWKyvlS72O2QTkNNgbVT2T7q9WpR8BLgJFpqcjZz5VmolJ
 UshayIE5Qoz6ToEmTro0Gc97Gzq00ws+wYymaIOyO5xZTiYegERecLAhEVeW9oXyzgIG
 iyl+8EJKbpYo5mNDlSSWh4cbC3ELgiToMMd3zSNuImTgOtcIlOdvpBDuAKDA5jxFTtB1
 bxqusfnkyXqeYfzcTmHeOfcJnhsfz5pKMI3xhqIJhzSkdWXUVXmKzHQj/N1DPVCpnSvi
 d+SEJGwxYUbeYhiaBZeNvYkfD0xpF4PAzAux2aMlv7RCmk+EjboZUDcZ5tYISVG30m7A
 wGiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhU4vN4mc85e7dQd1MwQhDkHVb3XfIs7diBwFzOhwOXcSTibMDwaa/mhkdjUWrPF+QKjn/ogJt2gr1KUbkZddKws/Bm+of+G76oqPU+jQP
X-Gm-Message-State: AOJu0YwD2UFE9FFhaRI+Z22G8RMnqlQ07LZNCc4VpqCVWVWs9JKLMi0m
 +r/I61zMKMFPTiD1gruCisGwjoyt7U+qJoccEcM+32sQs1T3dE8WCQ0ejr7ZtiI=
X-Google-Smtp-Source: AGHT+IEMesT0g6EwJo8XKWWsj5lGZcP15znRyUjF4kLCBSkASIwGULeoWki8V8Svi3DzX0aQUU2RlQ==
X-Received: by 2002:adf:fd4d:0:b0:33e:9b42:b9f with SMTP id
 h13-20020adffd4d000000b0033e9b420b9fmr9549400wrs.4.1710763595268; 
 Mon, 18 Mar 2024 05:06:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfe4d2000000b0033ec9936909sm9636114wrm.39.2024.03.18.05.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 05:06:34 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:06:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/6] backlight/omap1-bl: Replace FB_BLANK_ states with
 simple on/off
Message-ID: <20240318120632.GD16260@aspen.lan>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-4-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:02PM +0100, Thomas Zimmermann wrote:
> The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
> any other value in fb_blank. But the field fb_blank in struct
> backlight_properties is deprecated and should not be used any
> longer.
>
> Replace the test for fb_blank in omap's backlight code with a
> simple boolean parameter and push the test into the update_status
> helper. Instead of reading fb_blank directly, decode the backlight
> device's status with backlight_is_blank().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/omap1_bl.c | 46 ++++++++++++++----------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
> index 84d148f385951..3fd8bbb7f5877 100644
> --- a/drivers/video/backlight/omap1_bl.c
> +++ b/drivers/video/backlight/omap1_bl.c
> @@ -9,7 +9,6 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> -#include <linux/fb.h>
>  #include <linux/backlight.h>
>  #include <linux/slab.h>
>  #include <linux/platform_data/omap1_bl.h>
> @@ -20,7 +19,7 @@
>  #define OMAPBL_MAX_INTENSITY		0xff
>
>  struct omap_backlight {
> -	int powermode;
> +	bool power;

The new name is hard to read in several of the conditionals below (which
were previously "documented" by the comparisons to constants.

This boolean effectively controls what we send to omapbl_send_enable().
On that basis I'd rather it was called something like "enabled".


>  	int current_intensity;
>
>  	struct device *dev;
> @@ -37,21 +36,14 @@ static inline void omapbl_send_enable(int enable)
>  	omap_writeb(enable, OMAP_PWL_CLK_ENABLE);
>  }
>
> -static void omapbl_blank(struct omap_backlight *bl, int mode)
> +static void omapbl_power(struct omap_backlight *bl, bool on)

As above omapbl_enable would be better.


>  {
> -	switch (mode) {
> -	case FB_BLANK_NORMAL:
> -	case FB_BLANK_VSYNC_SUSPEND:
> -	case FB_BLANK_HSYNC_SUSPEND:
> -	case FB_BLANK_POWERDOWN:
> -		omapbl_send_intensity(0);
> -		omapbl_send_enable(0);
> -		break;
> -
> -	case FB_BLANK_UNBLANK:
> +	if (on) {
>  		omapbl_send_intensity(bl->current_intensity);
>  		omapbl_send_enable(1);
> -		break;
> +	} else {
> +		omapbl_send_intensity(0);
> +		omapbl_send_enable(0);
>  	}
>  }
>
> @@ -61,7 +53,7 @@ static int omapbl_suspend(struct device *dev)
>  	struct backlight_device *bl_dev = dev_get_drvdata(dev);
>  	struct omap_backlight *bl = bl_get_data(bl_dev);
>
> -	omapbl_blank(bl, FB_BLANK_POWERDOWN);
> +	omapbl_power(bl, false);
>  	return 0;
>  }
>
> @@ -70,33 +62,37 @@ static int omapbl_resume(struct device *dev)
>  	struct backlight_device *bl_dev = dev_get_drvdata(dev);
>  	struct omap_backlight *bl = bl_get_data(bl_dev);
>
> -	omapbl_blank(bl, bl->powermode);
> +	omapbl_power(bl, bl->power);
>  	return 0;
>  }
>  #endif
>
> -static int omapbl_set_power(struct backlight_device *dev, int state)
> +static void omapbl_set_power(struct backlight_device *dev, bool on)

May also like a new name...


>  {
>  	struct omap_backlight *bl = bl_get_data(dev);
>
> -	omapbl_blank(bl, state);
> -	bl->powermode = state;
> -
> -	return 0;
> +	omapbl_power(bl, on);
> +	bl->power = on;
>  }
>
>  static int omapbl_update_status(struct backlight_device *dev)
>  {
>  	struct omap_backlight *bl = bl_get_data(dev);
> +	bool power;
>
>  	if (bl->current_intensity != dev->props.brightness) {
> -		if (bl->powermode == FB_BLANK_UNBLANK)
> +		if (bl->power)
>  			omapbl_send_intensity(dev->props.brightness);
>  		bl->current_intensity = dev->props.brightness;
>  	}
>
> -	if (dev->props.fb_blank != bl->powermode)
> -		omapbl_set_power(dev, dev->props.fb_blank);
> +	if (backlight_is_blank(dev))
> +		power = false;
> +	else
> +		power = true;

I'd be happy with:

    enable = !backlight_is_blank()


Daniel.
