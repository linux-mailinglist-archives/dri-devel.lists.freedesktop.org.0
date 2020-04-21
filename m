Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3AA1B2B87
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 17:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319896E1B8;
	Tue, 21 Apr 2020 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD36E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 15:47:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so17026490wrp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k+3fqnUIb47ny4XuS/cO5bm+055JkF8KuM1XMcQ87Wc=;
 b=qRfiPmWl7eFIrY0GWgIwQF1S0Xq96aDE6g2y/HqjHuDn7jVIaZSaX0OI++QEV/ZqN4
 SHXu/6Ormo0Y+lMPQthYujoZUGViaMTsZyLtZ3T1gI6kvDmcCxEHtUjQtRqd/VSNevlP
 WOk77j4jSu72aSfegezNFxI88b70yOktd/yAxY8IuO7AAF1aWKmcXc3moS4qSErw7kV6
 LAcRk3im/wlipzkcCYYVzPNP2/I0q2p/42gUbpEp3QFyV32Mn+lB5Hzt6/azOKR83/hr
 FVfPhkY28alubEoSXf77ZtdKsuK8JRB4CngqiYxZEPdIKK7jeYuT47Hrrn0YkgINjXB9
 HFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k+3fqnUIb47ny4XuS/cO5bm+055JkF8KuM1XMcQ87Wc=;
 b=Y+vJx7MqAEn4Kgm/MXxDig9MoyXhWefr8xxlSfrNNnHcmS+REUlWe3XANmyQkCC+l8
 897c5g9Ugjre8nh/WB7dsMxp9fMgkL83u+WNPzKbafyqxTtowlW34a9n65UAHtFp95pt
 9DMmIbAnmhG05yj3SrZSmAfymu5RCC6ywN81kloH3EBonnZAOiRGkHvixy1fhZkjLOaM
 wI61/rsPkbSc/tAcHeqTE3m+KPEdOSeFvD2PkVrUpC5jEXiThAZnPOK0Tpts6vPrMAT2
 Uf7h/SbghXWl3ht9xGc8d3doAsJXAzin96p3MNzor9gjPf09xh4qG3iPGPYsJuAQmYbZ
 95sA==
X-Gm-Message-State: AGi0PuZNFj4EvL7vPOshzDvYQPaQNMwN8m2HpHPqVL4jCll3+Rx1Y1AI
 a6bxK3L9EDsTcuGNyy/z1Jx7kA==
X-Google-Smtp-Source: APiQypJfzjD/qb9Uf1L/3iQEZgnTPgII7dm2JKkqv8hYlHkbmpVo/PKuCEmFFiTMCJPl4XVba4AzAw==
X-Received: by 2002:adf:f0d2:: with SMTP id x18mr24421255wro.259.1587484058126; 
 Tue, 21 Apr 2020 08:47:38 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y70sm4302396wmc.36.2020.04.21.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 08:47:37 -0700 (PDT)
Date: Tue, 21 Apr 2020 16:47:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 4/4] backlight: led_bl: fix led -> backlight brightness
 mapping
Message-ID: <20200421154735.byedkij5bry76trd@holly.lan>
References: <20200421124629.20977-1-tomi.valkeinen@ti.com>
 <20200421124629.20977-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421124629.20977-5-tomi.valkeinen@ti.com>
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

On Tue, Apr 21, 2020 at 03:46:29PM +0300, Tomi Valkeinen wrote:
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
> index 63693c4f0883..43a5302f163a 100644
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

I looked at this loop again and realized the entire check of
levels[i-1] is pointless anyway: we already know that db is greater
then levels[i-1] otherwise the loop would have exited on its previous
iteration.


> -		priv->default_brightness = i;
> +
> +		priv->default_brightness = min(i, num_levels - 1);

Perhaps this min() also tells us the loop exit condition is wrong as
well...  and whilst we are at it the final comparison is arguably
not in the best order (since to describe what the loop does we have to
a complex clauses like "such that").

In natural English what the code is trying to do is "find the first
value in the lookup table that is larger than or equal to db or, if that
does not exist, choose the brightest value".

In other words:

		for (i=0; i<num_levels-1; i++)
			if (levels[i] >= db)
				break;


Daniel.


> -                     if ((i && db > levels[i - 1]) && db <=
> levels[i])
> +                     if ((i == 0 || db > levels[i - 1]) && db <=
> levels[i])
>                               break;
>               }

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
