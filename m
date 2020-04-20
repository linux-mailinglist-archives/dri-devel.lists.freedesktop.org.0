Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC21B10CA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24AF6E7D3;
	Mon, 20 Apr 2020 15:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273F46E7D3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 15:55:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u13so12832788wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r/n+TXVCwahJ0neSAd5S8H3U44t9W/OjkN1updrJWzI=;
 b=XaSx+Z8Z17VeODBS+IkDozGo5ztRVFa3cLc1gtDiqsF1OtSUz3iqkL5Je2kgCxDQOY
 kAIdyHL6ZrzqeQ70pYZTQN1wOtodyaQUzIZhVGZrKhytocOY4qiDuYGZm5wyA5uec91E
 JP+jqUQnjW1mzIKdwpfHnQ0O9lIC2M8yTGDZ3qOO48PsaPjvuyPey7Ga+SMy4FVX1GBf
 erBsrNedmMIP/kT+Dz7oEPIO6XoXNziGbdX7fzSgj6bWAN8z9seMVIfw9fFasJTLteMK
 HIe+dhrc+JpFF550IBM2Z+8rj00dcisG133pLC6eIGhq7K+bxDr5JI2tiKEa95rUhQC/
 sUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r/n+TXVCwahJ0neSAd5S8H3U44t9W/OjkN1updrJWzI=;
 b=tqwtDq5XWVWpPTkEvTAayHh32gOr1RSjufYZ7ba2vzp6D4ul1IaN65ummhlBrJfsZP
 Ig8o8nzn04ZYPRML7Cwg63zjM1MDpVQPW5bHyXYMbowptq09rC0+Yyia/Z+GiIWuK0w3
 as8wyD3QSi/QxKadtCspvYKFyD7kgp1wucDcKJnkpoCpavxKaL0sh8MbgGMcwdhv/vhc
 d1wurMs/Xfd3I9rf1XUs1hDcgdHATQEzU+HAEH86JQtRIf4OFXfgnNESY7x+gAYL+sxJ
 KFsELvpguOj69xgAXMPwdgbrcQzVwA8qteHvOQIgKMT0vIny1NZEl/IY7pQ9BSR3K/07
 BGdg==
X-Gm-Message-State: AGi0PubwZHsI61CMeAx2YuiChQYXF3Y+sRfhQT1a1JPAqb5dbQyGPqYR
 DoT6V/cdWXHgWwJ+GASYNW+Q3g==
X-Google-Smtp-Source: APiQypKBVr8BbuF4rTT3qTRXc0+2UdFaONraKBrKV8Q/Mi2GDFqPgs1Wu1UiKkhz5WL5XPPXRXq+gA==
X-Received: by 2002:adf:e552:: with SMTP id z18mr19026705wrm.244.1587398116801; 
 Mon, 20 Apr 2020 08:55:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d7sm1605548wrn.78.2020.04.20.08.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 08:55:16 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:55:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 4/5] backlight: led_bl: fix led -> backlight brightness
 mapping
Message-ID: <20200420155514.lyb73ujf5fzgpvp4@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-4-tomi.valkeinen@ti.com>
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

On Fri, Apr 17, 2020 at 02:33:11PM +0300, Tomi Valkeinen wrote:
> The code that maps the LED default brightness to backlight levels has
> two issues: 1) if the default brightness is the first backlight level
> (usually 0), the code fails to find it, and 2) when the code fails to
> find a backlight level, it ends up using max_brightness + 1 as the
> default brightness.
> 
> Fix these two issues.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/video/backlight/led_bl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 63693c4f0883..021b5edd895c 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -159,10 +159,11 @@ static int led_bl_parse_levels(struct device *dev,
>  		 */
>  		db = priv->default_brightness;
>  		for (i = 0 ; i < num_levels; i++) {
> -			if ((i && db > levels[i - 1]) && db <= levels[i])
> +			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
>  				break;
>  		}
> -		priv->default_brightness = i;
> +
> +		priv->default_brightness = i < num_levels ? i : 0;

This seems a bit odd. If the LED is currently set to brighter than the
maximum brightness level why would we choose a default brightness of
zero?


Daniel.


>  		priv->max_brightness = num_levels - 1;
>  		priv->levels = levels;
>  	} else if (num_levels >= 0) {
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
