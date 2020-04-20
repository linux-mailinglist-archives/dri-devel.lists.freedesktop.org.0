Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D51B10DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 18:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4526E588;
	Mon, 20 Apr 2020 16:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD7E6E588
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 16:01:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k1so12872556wrx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IMezaVorfzWAZ5yeIdxf4Ausp6aB2BLNNEifQh5SkWY=;
 b=bfonvl29r9uts8Xx8gfv7LMJyNxovCHoJSFIxE8RWvJJ6+blEswwjU5N1hA17W6C5H
 gKMHFTbrP00nq9Mn7bzgtME7pphzpGBaaCjZjrZPVkom+UVDIKQXqUajP+QW6A4HdddY
 rNHjqexUnIz8eQw6YAAndd9loKWUOPXNMYlEYraF7CyBIubMnTek+J9CqVh8E9vBzICd
 XqAkZMEm0i9zTOFtwe1/Zk7aod/5pelm7e/ZG0z3ir/YjkEscI5iHrt4x+txDo+fejUZ
 jqqw3CDC3kRtJYd38TjTfQcVJVJWKA1LAjPjcXr6drNg7zmTcHRKbYAA5pa4hCC5k6o/
 VRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IMezaVorfzWAZ5yeIdxf4Ausp6aB2BLNNEifQh5SkWY=;
 b=EUSxcSE/wK7vDOFLPEuNYd6j8z3ISyepsRyHjcv1G1A9bMm75HAvOx+uC8uOLUkDzX
 DckXwzLumlT+UtvG852f+z+QoEob/TLL2Eg4vu1hxQY4BY/Hr4AAQN7+H9m4kaQ2dCN4
 WyLtWp35f/ovkcLBlQ6py72+fVIKYOG/DfXo9PcJ6P+iQjNG5JE4hY1Tn7MnPF2Edh8D
 luF9MVTz5Mem+diBfxPfV56WZvQ2g337NqfQs66GyZs2uMn3rgcqQGfBnxBtYz86SSyE
 TYFRAvo0r5OSB0m9e1z/Fl93PZEjN9FRiBZJzxU1iO6ZFFqSsw+COyqSSlR03v68lu7y
 B3lw==
X-Gm-Message-State: AGi0PubUpncyKpEZys7MqNFDBrzzJbUmKV1XbbFW4dSeGwtzIsHCYJ7n
 0f7ELa9YZDpNcV7BWLCf2oY4bQ==
X-Google-Smtp-Source: APiQypL807DBomjCdoSGoqFBRQixL7aAWGyJgpt3/rhDhHVtNEJ2X8Z4Jo1x5Xfj9OZhfdd1B/MXzA==
X-Received: by 2002:adf:a15d:: with SMTP id r29mr18316346wrr.134.1587398516436; 
 Mon, 20 Apr 2020 09:01:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h5sm1815470wrp.97.2020.04.20.09.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:01:55 -0700 (PDT)
Date: Mon, 20 Apr 2020 17:01:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
Message-ID: <20200420160154.4xxv37fofx37ow7q@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-5-tomi.valkeinen@ti.com>
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

On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
> led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
> more obvious code flow.

... that introduces new behaviour.

There's a couple of new behaviours here but the one that particular
attracted my attention is the disregarding the "default-brightness-level" if
there is no table. That looks like a bug to me.

Please can you add any intended changes of behaviour in the patch
header?


Daniel.




> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/video/backlight/led_bl.c | 63 ++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 021b5edd895c..7b3889035540 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -132,50 +132,51 @@ static int led_bl_parse_levels(struct device *dev,
>  	int num_levels;
>  	u32 value;
>  	int ret;
> +	int i;
> +	u32 *levels;
>  
>  	if (!node)
>  		return -ENODEV;
>  
>  	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> -	if (num_levels > 1) {
> -		int i;
> -		unsigned int db;
> -		u32 *levels;
> -
> -		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> -				      GFP_KERNEL);
> -		if (!levels)
> -			return -ENOMEM;
> -
> -		ret = of_property_read_u32_array(node, "brightness-levels",
> -						 levels,
> -						 num_levels);
> -		if (ret < 0)
> -			return ret;
> -
> -		/*
> -		 * Try to map actual LED brightness to backlight brightness
> -		 * level
> -		 */
> -		db = priv->default_brightness;
> +
> +	if (num_levels < 0)
> +		return 0;
> +
> +	if (num_levels == 0) {
> +		dev_warn(dev, "No brightness-levels defined\n");
> +		return -EINVAL;
> +	}
> +
> +	levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> +			      GFP_KERNEL);
> +	if (!levels)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(node, "brightness-levels",
> +					 levels,
> +					 num_levels);
> +	if (ret < 0)
> +		return ret;
> +
> +	priv->max_brightness = num_levels - 1;
> +	priv->levels = levels;
> +
> +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret) {
> +		priv->default_brightness = min(value, priv->max_brightness);
> +	} else {
> +		/* Map LED default-brightness to backlight brightness level */
> +		unsigned int db = priv->default_brightness;
> +
>  		for (i = 0 ; i < num_levels; i++) {
>  			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
>  				break;
>  		}
>  
>  		priv->default_brightness = i < num_levels ? i : 0;
> -		priv->max_brightness = num_levels - 1;
> -		priv->levels = levels;
> -	} else if (num_levels >= 0) {
> -		dev_warn(dev, "Not enough levels defined\n");
>  	}
>  
> -	ret = of_property_read_u32(node, "default-brightness-level", &value);
> -	if (!ret && value <= priv->max_brightness)
> -		priv->default_brightness = value;
> -	else if (!ret  && value > priv->max_brightness)
> -		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> -
>  	return 0;
>  }
>  
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
