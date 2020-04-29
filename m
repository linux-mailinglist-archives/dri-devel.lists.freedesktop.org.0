Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C91BDAB4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 13:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8446E452;
	Wed, 29 Apr 2020 11:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBA76E452
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 11:33:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k1so2100365wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nNZt9aacMDBZbV2JYwW99z+PYx7llX74X2cVeipq6io=;
 b=fq435gIbQMSGuenSHUAWuKzRLVWW7EQl2dhanTI0sjaq5KjNm4jEeDy4UG8HWqnnRS
 cDcwpr3VYokZoB/cySW1rqm88CBSimjzTcSLyHOR/ZcRrnzkPA1oP6VpiytMef9AS/Nc
 uHNNL3A0VwvV78D/pcZLpFuOrPWtXSa5cQo+bywMdplmmWgdN2eEV6UqDkO6Y8/OAod8
 fysphVj4FFoLhx5zId6Xa2GPz+L9pJJ5EWdD+Op01MC8/wJaeZ1TSVG4Y4VfWG7DesZb
 xSlWJK6R02qluhRiz60AkUBoMw13QKxazk6XjMKCNn0ODW1XKnRCTuYqgCNgPSkfzl+3
 6tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNZt9aacMDBZbV2JYwW99z+PYx7llX74X2cVeipq6io=;
 b=WujxmDRrA7hovy+axK6mzC52COFcXmJmZ4Y/zpWz7RWz3PNMjERijVEQZI7tI411xJ
 inpVIsBv24XB84eaC3F2WI4a2v/E5AztMcwOAWnah+jvNsnjypJjvOJiFyHUd4Palxed
 4TyM7j6Sp7nlTqelkBKx1wFKyO1y7oGIOqp0bfjtP7U6vk+g1J1gNVI46sa48bE/yuCc
 Av2wJ50HVcscqTxjAtCNbtZIyUw9NxdezCKlOEYdXfboaOIiPfyPCCio5mEOGUTvgCtM
 UDFuppJ19uuXtL3/m/2+8ifO8Ka1kv1x8J20IwHUhf1+3b+IjKmBKAM3Nk7jI7lxXK2j
 oLDA==
X-Gm-Message-State: AGi0PuZveyV52pNQ4JYYcQyZM8J2GQdvGrxacQFm0txc5/s6sBh60wL+
 QWAWZVIlEcrAg1ykmmuQSeK/oA==
X-Google-Smtp-Source: APiQypKZIW7+ETyqJNZ6EDtjbxTHIqn6HITL6TaMvR+IphB/OSWDDy8eoFLGO/kfOYfzvovQIzkehg==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr38646590wrw.412.1588159988851; 
 Wed, 29 Apr 2020 04:33:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d5sm29992433wrp.44.2020.04.29.04.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 04:33:08 -0700 (PDT)
Date: Wed, 29 Apr 2020 12:33:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: lms283gf05: Convert to GPIO descriptors
Message-ID: <20200429113305.tl35n2uws3hoxgvt@holly.lan>
References: <20200429082631.925461-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429082631.925461-1-linus.walleij@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, dri-devel@lists.freedesktop.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 10:26:31AM +0200, Linus Walleij wrote:
> This converts the lms283gf05 backlight driver to use GPIO
> descriptors and switches the single PXA Palm Z2 device
> over to defining these.
> 
> Since the platform data was only used to convey GPIO
> information we can delete the platform data header.
> 
> Notice that we define the proper active low semantics in
> the board file GPIO descriptor table (active low) and
> assert the reset line by bringing it to "1" (asserted).
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Marek: I saw this was written by you, are you regularly
> testing the Z2 device?
> ---
>  arch/arm/mach-pxa/z2.c               | 12 ++++++---
>  drivers/video/backlight/lms283gf05.c | 39 +++++++++++-----------------
>  include/linux/spi/lms283gf05.h       | 16 ------------
>  3 files changed, 23 insertions(+), 44 deletions(-)
>  delete mode 100644 include/linux/spi/lms283gf05.h
> 
> diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
> index 0e45685bcc1c..71a26b8b7d3f 100644
> --- a/drivers/video/backlight/lms283gf05.c
> +++ b/drivers/video/backlight/lms283gf05.c
> @@ -150,18 +147,12 @@ static struct lcd_ops lms_ops = {
>  static int lms283gf05_probe(struct spi_device *spi)
>  {
>  	struct lms283gf05_state *st;
> -	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
>  	struct lcd_device *ld;
>  	int ret = 0;
>  
> -	if (pdata != NULL) {
> -		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
> -				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
> -				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
> -				"LMS283GF05 RESET");
> -		if (ret)
> -			return ret;
> -	}
> +	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_HIGH);

Isn't this a change of behaviour w.r.t. to the initial state of the pin?

To be honest I suspect it is harmless because we launch into the reset
sequence shortly after anyway. More that that I think I prefer it this
way since it is better aligned with the behaviour of
lms283gf05_power_set().

However if it is an intentional change of behaviour then it would be
good to spell that out in the description for the benefit of future
archaeologists.


Daniel.


> +	if (st->reset)
> +		gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");
>  
>  	st = devm_kzalloc(&spi->dev, sizeof(struct lms283gf05_state),
>  				GFP_KERNEL);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
