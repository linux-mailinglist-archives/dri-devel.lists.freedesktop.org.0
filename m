Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9E23BEA4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 19:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B118E6E271;
	Tue,  4 Aug 2020 17:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107806E271
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:10:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k8so3670011wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pIjUIO1iC7D1XllCsgBNUcv/k5ymZtbPUqDn6P/O3Q0=;
 b=PxNBgihlhUgUVbJqLZXhIOpC9PPrcH2Pa5KPQjOui5mPnVV8ucZzBORBgBiq5iTdCd
 lsXgCRAIpQJwTdx27a2Yp2eutrpb/GI0220K7XBy1YyhXhxQdisUy6Wt7y9NsCf2bKkz
 EeDsPXPZ2PEy3uxBu/8Lo277gKB/tz5Va/9CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pIjUIO1iC7D1XllCsgBNUcv/k5ymZtbPUqDn6P/O3Q0=;
 b=rWmFDiv4FoUf+iwb8dSHclB3Zn9a+r1ciQpiAbWcVJyHHEgCuSfdxJrZUO75M98IAb
 3g6v+rLUFEZ2yyuURni6A5mgEZwTp6hPiOHbPESOpy6h/lebgEsceXJRwqzreVfFGojo
 TEOVY527s6q+rfc9BzclwH74GPx7aazZX0zDoIStdznTnakzCZcZqaNtpgtiClVVVG+c
 XTQGZlMQvsTx9LjAMofKfigP3EYtgdk94u03JI9Q3zYEIfV+/QtFCAlTNgmKXjg8pdB/
 p+Rzscn3pwhoMChj7MWQP10KNF/VEU4Kj9ezCYxDSPaDweV+UHnsJF7KiBNxfe329I9s
 c/+g==
X-Gm-Message-State: AOAM5322hJq/eMZRg7HVvi54v31ncG1Lab157NcL6bZE3mtZmL836zVp
 CiP/GmjiH5W/gq5TSLmhiVX+Fg==
X-Google-Smtp-Source: ABdhPJxuTcuVkjr3hCbtzyJllrtf5NapEEJjdFyu0WgMkKhYJfYrdEbp+surpZjMERggfQrGj0FjCg==
X-Received: by 2002:a1c:6087:: with SMTP id u129mr4773404wmb.157.1596561002454; 
 Tue, 04 Aug 2020 10:10:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm29974448wrv.40.2020.08.04.10.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 10:10:01 -0700 (PDT)
Date: Tue, 4 Aug 2020 19:09:59 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 15/22] drm/panel: sony-acx565akm: Backlight update
Message-ID: <20200804170959.GP6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-16-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 02, 2020 at 01:06:29PM +0200, Sam Ravnborg wrote:
> - Use backlight_get_brightness() helper
> - Use backlight_is_blank() helper
> - Use macro for initialization
> - Drop direct access to backlight properties
> - Use the devm_ variant for registering backlight device, and drop
>   all explicit unregistering of the backlight device.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 44 +++++++-------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index 5c4b6f6e5c2d..3fc572d1de13 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -298,13 +298,7 @@ static void acx565akm_set_brightness(struct acx565akm_panel *lcd, int level)
>  static int acx565akm_bl_update_status_locked(struct backlight_device *dev)
>  {
>  	struct acx565akm_panel *lcd = dev_get_drvdata(&dev->dev);
> -	int level;
> -
> -	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> -	    dev->props.power == FB_BLANK_UNBLANK)
> -		level = dev->props.brightness;
> -	else
> -		level = 0;
> +	int level = backlight_get_brightness(dev);
>  
>  	acx565akm_set_brightness(lcd, level);
>  
> @@ -330,8 +324,7 @@ static int acx565akm_bl_get_intensity(struct backlight_device *dev)
>  
>  	mutex_lock(&lcd->mutex);
>  
> -	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> -	    dev->props.power == FB_BLANK_UNBLANK)
> +	if (backlight_is_blank(dev))
>  		intensity = acx565akm_get_actual_brightness(lcd);
>  	else
>  		intensity = 0;
> @@ -348,39 +341,34 @@ static const struct backlight_ops acx565akm_bl_ops = {
>  
>  static int acx565akm_backlight_init(struct acx565akm_panel *lcd)
>  {
> -	struct backlight_properties props = {
> -		.fb_blank = FB_BLANK_UNBLANK,
> -		.power = FB_BLANK_UNBLANK,
> -		.type = BACKLIGHT_RAW,
> -	};
>  	int ret;
> -
> -	lcd->backlight = backlight_device_register(lcd->name, &lcd->spi->dev,
> -						   lcd, &acx565akm_bl_ops,
> -						   &props);
> -	if (IS_ERR(lcd->backlight)) {
> -		ret = PTR_ERR(lcd->backlight);
> -		lcd->backlight = NULL;
> +	struct backlight_device *bd;
> +	DECLARE_BACKLIGHT_INIT_RAW(props, 0, 255);
> +
> +	bd = devm_backlight_device_register(&lcd->spi->dev, lcd->name,
> +					    &lcd->spi->dev, lcd,
> +					    &acx565akm_bl_ops, &props);

It's been in a bunch of earlier patches already, but devm_bl freaks me out
a bit with our long-term goal of storing a backlight pointer into
drm_connector->backlight.

Since drm_connector and the underlying backlight device have different
lifetimes that would mean we need to refcount somewhere, or protect
drm_connector->backlight with some lock. The lock might not work because
the drm connector property paths come from the other direction than the
backlight driver unload ... so probably needs to be refcounting.
-Daniel

> +	if (IS_ERR(bd)) {
> +		ret = PTR_ERR(bd);
>  		return ret;
>  	}
>  
> +	lcd->backlight = bd;
>  	if (lcd->has_cabc) {
> -		ret = sysfs_create_group(&lcd->backlight->dev.kobj,
> +		ret = sysfs_create_group(&bd->dev.kobj,
>  					 &acx565akm_cabc_attr_group);
>  		if (ret < 0) {
>  			dev_err(&lcd->spi->dev,
>  				"%s failed to create sysfs files\n", __func__);
> -			backlight_device_unregister(lcd->backlight);
>  			return ret;
>  		}
>  
>  		lcd->cabc_mode = acx565akm_get_hw_cabc_mode(lcd);
>  	}
>  
> -	lcd->backlight->props.max_brightness = 255;
> -	lcd->backlight->props.brightness = acx565akm_get_actual_brightness(lcd);
> -
> -	acx565akm_bl_update_status_locked(lcd->backlight);
> +	backlight_set_brightness(bd, acx565akm_get_actual_brightness(lcd));
> +	backlight_set_power_on(bd);
> +	backlight_update_status(bd);
>  
>  	return 0;
>  }
> @@ -390,8 +378,6 @@ static void acx565akm_backlight_cleanup(struct acx565akm_panel *lcd)
>  	if (lcd->has_cabc)
>  		sysfs_remove_group(&lcd->backlight->dev.kobj,
>  				   &acx565akm_cabc_attr_group);
> -
> -	backlight_device_unregister(lcd->backlight);
>  }
>  
>  /* -----------------------------------------------------------------------------
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
