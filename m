Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3E1BDFC4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 15:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834156EE93;
	Wed, 29 Apr 2020 13:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0A6EE93
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 13:58:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 188so2139985wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3JWN8PCbkw11lHqpu69GaINuVt5HXdjUFCbeunE7xjs=;
 b=YneZ+oUDARxNn93Id7QGdgE86PDCupMMSOmZXYuGzy3brWVGqNetDD1ACJpsMiNCIh
 0eBXtQRdmmoRRKifRXw0FKXFQI/QX0njmFpxz0nrpzOO0Z3rBGlgsx8OQx4a7NJmr82X
 xvdpSBKaFXvpmQygIYcUYfFEqW79dB0THKAAWqc+qIRtTPLpF37O2+EkKOOy6h8csh43
 4j5Yut5jKCDVbL/0+o7CjXkXebpQv6aY2XQwJkCyDC+DQmWmly3r3PSbzg4+sTnjl3v+
 I5qUWvC+hlJQ3EaFMS8ymhBbrfO8vP9ORJJDabdxRCGo4pubhiwggEH46amfZLCKyMBa
 w4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3JWN8PCbkw11lHqpu69GaINuVt5HXdjUFCbeunE7xjs=;
 b=ESwoUPo24iY1dXrY2jNHF8kkxZamP4vmOQGTJMkIn6fpYp/TRQS8sBZ4/pShiaBOu4
 nZXoq2qe7G+vA9GNhHhr4b/fO9SIsPyhL9kVfmTWP00hJjtFUJ/XB371zGOCck+luWeA
 FuGtDHSI0JyNE8pecZBydpicLJEHrd71Jo0o2b+BU66HOHgRIxxX6jwKCJ+UAPEghh4N
 PAqcPCqu8ANkgE5agBiE72CHqjKj+pHcn1BncEEY+gW4u/QV035zna9UjSQ8KXBmxvg/
 NHScyg2xTccGng04sP/nycdM9BhngSw58EaFUSTFWAYeCItBXEibSp3sR+lifp+KpbKl
 3qCQ==
X-Gm-Message-State: AGi0PuYes/f8TbSYuF3P6GSsjj8j2ZmquyIYfqeJU1XI3t2y3YM90lr6
 mh+wtaohADm5UccD1r6Zx0jGYA==
X-Google-Smtp-Source: APiQypJcg90MGK+tvvRopWdw4GEAi76fq3kdqs2d8ZfONqkMOcQi1qYRwtAvAmLheNgtseOw7mPmHg==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr3457177wmt.153.1588168683069; 
 Wed, 29 Apr 2020 06:58:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n9sm30158965wrx.61.2020.04.29.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 06:58:02 -0700 (PDT)
Date: Wed, 29 Apr 2020 14:58:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: lms283gf05: Convert to GPIO descriptors
Message-ID: <20200429135800.eys7yanmv6v7es2s@holly.lan>
References: <20200429124354.946167-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429124354.946167-1-linus.walleij@linaro.org>
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

On Wed, Apr 29, 2020 at 02:43:54PM +0200, Linus Walleij wrote:
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
> ChangeLog v2->v3:
> - Fix a use-before-allocated bug discovered by compile tests.
> - Remove unused ret variable as autobuilders complained.
> ChangeLog v1->v2:
> - Bring up the GPIO de-asserted in probe()
> 
> Marek: I saw this was written by you, are you regularly
> testing the Z2 device?
> ---
>  arch/arm/mach-pxa/z2.c               | 12 +++++---
>  drivers/video/backlight/lms283gf05.c | 42 +++++++++++-----------------
>  include/linux/spi/lms283gf05.h       | 16 -----------
>  3 files changed, 24 insertions(+), 46 deletions(-)
>  delete mode 100644 include/linux/spi/lms283gf05.h
> 
> diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
> index 0e45685bcc1c..529c415eb03b 100644
> --- a/drivers/video/backlight/lms283gf05.c
> +++ b/drivers/video/backlight/lms283gf05.c
> @@ -150,24 +147,17 @@ static struct lcd_ops lms_ops = {
>  static int lms283gf05_probe(struct spi_device *spi)
>  {
>  	struct lms283gf05_state *st;
> -	struct lms283gf05_pdata *pdata = dev_get_platdata(&spi->dev);
>  	struct lcd_device *ld;
> -	int ret = 0;
> -
> -	if (pdata != NULL) {
> -		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
> -				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
> -				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
> -				"LMS283GF05 RESET");
> -		if (ret)
> -			return ret;
> -	}
>  
>  	st = devm_kzalloc(&spi->dev, sizeof(struct lms283gf05_state),
>  				GFP_KERNEL);
>  	if (st == NULL)
>  		return -ENOMEM;
>  
> +	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	if (st->reset)
> +		gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");
> +


Sorry, I should have picked this up before but shouldn't st->reset have
an IS_ERR() check. There are certainly no other examples of this API
within the kernel that are not followed by an IS_ERR() check!

In fact I understood that the gpiod API is intended to tolerate NULLs
so I would have expected this code to be:

	st->reset = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(st->reset))
		return PTR_ERR(st->reset);
	gpiod_set_consumer_name(st->reset, "LMS283GF05 RESET");


>  	ld = devm_lcd_device_register(&spi->dev, "lms283gf05", &spi->dev, st,
>  					&lms_ops);
>  	if (IS_ERR(ld))


Daniel.
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
