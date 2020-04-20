Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510231B101B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463E76E5C6;
	Mon, 20 Apr 2020 15:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD56E5C6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 15:29:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x18so12747812wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rRuKmbK6PwqWVFEf4NCbIZ/sdAUEPs0XWhgaR5GQdu4=;
 b=BjfHQm3+4hBnp0JqjA408JQJh9WCU7VabxE1gH4uXEabh4Q8spOIaCWnHW/wrQ/LEX
 sCdl+8F3kzeSqsBYpYWgEbubA1mzRerxIXe3RDe6BzwNiSYvCHpv5Gh7/z84PsNpOiaM
 dHoWhTlrSuDUdGdPsQ84He3cMDcPVACyp5/HK24uY/plpHIc/vCy3f5Q5K5TqajFUmoX
 nMQOJoF761TJ6+NxwFYY78i7yrgv93k5yPso2cw+keCvT6rb2mJ7luHUOr9+IKBmW3zD
 xWi4VTqxq5eqk7/hUtukRnXrxuKbnhrbvIwgiiiXWlzfompI10Vq4KpsfvdSewGnfFcT
 37Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rRuKmbK6PwqWVFEf4NCbIZ/sdAUEPs0XWhgaR5GQdu4=;
 b=fpk4PLFPjH+wuOQTUSOx94IQlLrBXW2VnhPWghTeil816VChqJXSGxor1ovOtnLiXA
 c4I2vHfzNt9rE8ylcIliFXPpQZkIjygljgIUPnBKsITynK/ge1XOMxpwpCFJwXjmcoT9
 zuCqqYGQvhDFoMryWb3w3urQXLc8iy5GZzaw9U+cqucRxdWhnNfRbQdVzKxuLBAciBm8
 Ji1wO/OA/2ESTIWBsW3v4AX3vyKBcitNawoNWTX2FBERmUk8FZx8I6jiaqvKWXfOQv7l
 3NJH7Y5vtC8Dx7F9szL6ynIFCOFFocD3vuAwb49p7wjhAGZUUE65bAkeG0G50xEGw6i3
 9kLA==
X-Gm-Message-State: AGi0PuYyASKE15SY5zI7QFEHFMDLU7mldrKvO9BlrlQpDLKvJvDr0Bqf
 52ywdibw7DRmOmIW1wx7u3C4Bw==
X-Google-Smtp-Source: APiQypK5RfbPvKdwfP8P/l0O9IIsLTzCSbRFf/E1gHpNWUtZ8QfVvGc/PqRja08Oj+g7RQAo24Q2Cg==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr21185532wru.219.1587396592213; 
 Mon, 20 Apr 2020 08:29:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l4sm1622167wrv.60.2020.04.20.08.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 08:29:51 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:29:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/5] backlight: led_bl: drop useless NULL initialization
Message-ID: <20200420152950.hbc54fzxta7lq5ug@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417113312.24340-2-tomi.valkeinen@ti.com>
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

On Fri, Apr 17, 2020 at 02:33:09PM +0300, Tomi Valkeinen wrote:
> There's no need to set 'levels' to NULL.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/led_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index d4e1ce684366..c46ecdfe8b0a 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -140,7 +140,7 @@ static int led_bl_parse_levels(struct device *dev,
>  	if (num_levels > 1) {
>  		int i;
>  		unsigned int db;
> -		u32 *levels = NULL;
> +		u32 *levels;
>  
>  		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
>  				      GFP_KERNEL);
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
