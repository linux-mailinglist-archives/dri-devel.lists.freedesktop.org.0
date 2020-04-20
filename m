Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21841B1080
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCEE6E5D5;
	Mon, 20 Apr 2020 15:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670FE6E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 15:45:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x18so12815747wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PTNNEmCRenBa+/gabP9o5qvz1IO1aOxWgqhpmwXuNCw=;
 b=gXlROUMWwWERLyx3EEn5gqLTpGpbSZc6Mar0UI1HdJDdfjvqXJsnX8MIgqgE3At71l
 GzMOcgmYLa+qAfrAXpDalgTdjldYU8Wk93dCZ/OqoBfnjw4eZnohyy+FN3iQ6fxNWqtz
 Mo6U425nAZIQzOPajyhKkxYPiRa0N9qI4P9ybINCik9zbvqc1H0/nU4tOes0LxIwsPxr
 7q2b1HORpXXzfGjngOUJriYl3ldqx0n9ojqmaFq8UbRSXIoIEBaTdKciqc39xNj60a7E
 yPJJI1lELti15biybkg8T8kqZ1a+OIWH7F7c5pUqFN0XD2jpbEdRJxUUlZNGYVcKrJzN
 /Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PTNNEmCRenBa+/gabP9o5qvz1IO1aOxWgqhpmwXuNCw=;
 b=b/OnVDOy8+hbsQbTm1Fl8jqHrxZIdycc8ggF4m/HBMjWYlRHtCE9iZt9dO+GfB873F
 tLoZ9BlzImlTTYjV6XOrRN61gVVEl9IGTsM/d2N6PV4JOh9nSTVIk/BI47T27VyZ5tBj
 ZXLmQDCsoXbD+GwsNhkAOmD5VJO3aEIy3v5BXVeUMS+S0xLIcMZmpXQLWPXZJflmYCmw
 K9DxR9qteR2IF2sDilhRQ7oXSjM2nBCNVkRNPAFuZTPJ3HR7l2K29kXC8dW1sgL2UrBz
 80ZD7jGonUhxWv+6OmRigUA+kD5CsSpbQUVYrrrbRgangpMg4CP/kDHF72fhcN9EfM5r
 xGkA==
X-Gm-Message-State: AGi0PuZowYTBZJXusYdcNtbFneFuHv/WsKMF2lp8tiBSLrUaryPnu2FV
 Gi3Fx3fWeogJg3j/NsgfGLUhbQ==
X-Google-Smtp-Source: APiQypIMRuiaM3+lPbOnBrNsY2RZOsgIiOlSVW9cnmG6bbn7R/teekRaSuhN0JWQCSxdAHNUgU7ikA==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr20970772wrg.105.1587397540007; 
 Mon, 20 Apr 2020 08:45:40 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z22sm2206wma.20.2020.04.20.08.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 08:45:39 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:45:37 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/5] backlight: led_bl: add led_access locking
Message-ID: <20200420154537.ul37aq733guergda@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-3-tomi.valkeinen@ti.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 02:33:10PM +0300, Tomi Valkeinen wrote:
> led_bl does not lock 'led_access' when calling led_sysfs_disable and
> led_sysfs_enable, causing the below WARN. Add the locking.
> 
> WARNING: CPU: 0 PID: 223 at drivers/leds/led-core.c:353 led_sysfs_disable+0x4c/0x5c
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I did wonder if it might be better to provide self-locking API from the
LED sub-sys but it looks like elsewhere led_sysfs_disable() is
frequently paired with led_trigger_set() (and both under the same
lock)...

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/led_bl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index c46ecdfe8b0a..63693c4f0883 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -216,8 +216,11 @@ static int led_bl_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->bl_dev);
>  	}
>  
> -	for (i = 0; i < priv->nb_leds; i++)
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		mutex_lock(&priv->leds[i]->led_access);
>  		led_sysfs_disable(priv->leds[i]);
> +		mutex_unlock(&priv->leds[i]->led_access);
> +	}
>  
>  	backlight_update_status(priv->bl_dev);
>  
> @@ -233,8 +236,11 @@ static int led_bl_remove(struct platform_device *pdev)
>  	backlight_device_unregister(bl);
>  
>  	led_bl_power_off(priv);
> -	for (i = 0; i < priv->nb_leds; i++)
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		mutex_lock(&priv->leds[i]->led_access);
>  		led_sysfs_enable(priv->leds[i]);
> +		mutex_unlock(&priv->leds[i]->led_access);
> +	}
>  
>  	return 0;
>  }
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
