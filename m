Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D86F886B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7E210E652;
	Fri,  5 May 2023 18:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8F610E652
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:08:56 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso21576869b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683310135; x=1685902135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3jmjCmOGhJKcTExgQHxoFdrZdNhIimvrG1KlJ+O2CnA=;
 b=K0PiobN2K0CD1x/aK0LGxU/27Ndiiy3fP21rS2BmtRQcHEefRBzEKjTsRLJYEahi6T
 0p6efnM3dGeXACImp1TH/0sv7ROoQguhATGB15wUfaJqt6NnRkN4yS4tvwXkq6JfGvKb
 d6QPkljAU+BM2MzUZJLhEOlAA23YvvJKD6IPmyzANrbKlv6Vcsq1o67/Z2h4ICSmHJU9
 pZmZk0xCt3FMh5MDlyo49MrZFNEQ6eoBpv4J2oFk+YjFJpqrfuLYbhBguRIZm3bztujZ
 wSGZQkiG5PKBU9dUjNN//Zm+y0wc6Jj3mMr45r8z60uFXLcgftWIyJIku59qkOuRtlg/
 3Qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683310135; x=1685902135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jmjCmOGhJKcTExgQHxoFdrZdNhIimvrG1KlJ+O2CnA=;
 b=JqtGrBTkqMMzflMs9PxYPvJUbr1iUEZspF2L3Qsi0Jt7DovVFTdMCbCXm3JfnIjadF
 RSOy2+JlnqvJHxGduavpOv3QFv84K0kr0VDukoBzV3KTLnC46LBMev9qthbRTmw9Yhju
 JyAUCSya0RnQTqBmVWDVbobdSl0Hpk3snT+okGHJlOxI8F4WZ93thgf6urF7JjBW009l
 zdUQb4fRaTAqt2LGvKTBPUZvw6Ggmw+Z/DL1L4bUJYFrdJpsRBXxZm9t+9i2axIbvytr
 E2sw4tvwlAe3hJgu8zcUEbdOdnmOz1ZDTDZzLuw78fKjWfFPIIkJFkbLi1GLs8jEir0A
 c+wg==
X-Gm-Message-State: AC+VfDyWXbzrHEbJ0iDX6F5yrEJNDrJ/5Qf6juAb6eNHWk5r5UiXHpEF
 cfHmbl9nPRsnbqytM5letfE=
X-Google-Smtp-Source: ACHHUZ7Li5NhkqOE1+eiPls/+snjqcBfxl+Gcf+qRka4n1VUPtkhMwlUzgkzNuivRGulByJQdOt0tA==
X-Received: by 2002:a17:90a:a595:b0:247:14ac:4d3a with SMTP id
 b21-20020a17090aa59500b0024714ac4d3amr2917795pjq.20.1683310135403; 
 Fri, 05 May 2023 11:08:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5658:95c:e1cf:a1b0])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090aeb0600b002500df72713sm3186230pjz.7.2023.05.05.11.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 11:08:54 -0700 (PDT)
Date: Fri, 5 May 2023 11:08:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
Message-ID: <ZFVGMiuRT+e2eVXw@google.com>
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-spi@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,
On Fri, May 05, 2023 at 01:16:55PM +0200, Linus Walleij wrote:
> 
> Populate the devices on the Nokia 770 CBUS I2C using software
> nodes instead of platform data quirks. This includes the LCD
> and the ADS7846 touchscreen so the conversion just brings the LCD
> along with it as software nodes is an all-or-nothing design
> pattern.

Wow, so that worked , awesome!

> +static const struct property_entry nokia770_ads7846_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 4096),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 4096),
> +	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 256),
> +	PROPERTY_ENTRY_U32("touchscreen-average-samples", 10),
> +	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
> +	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
> +	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
> +	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
> +			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_HIGH),

Looking at the driver this actually needs to be GPIO_ACTIVE_LOW.

>  
> +static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
> +	.dev_id = "spi2.0",
> +	.table = {
> +		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
> +			    "pendown", GPIO_ACTIVE_HIGH),

GPIO_ACTIVE_LOW here too.

> +static struct gpiod_lookup_table db1100_touch_gpio_table = {
> +	.dev_id = "spi0.0",
> +	.table = {
> +		GPIO_LOOKUP("alchemy-gpio2", 21,
> +			    "pendown", GPIO_ACTIVE_HIGH),

And here as well.

> @@ -223,7 +220,7 @@ static int get_pendown_state(struct ads7846 *ts)
>  	if (ts->get_pendown_state)
>  		return ts->get_pendown_state();
>  
> -	return !gpio_get_value(ts->gpio_pendown);
> +	return !gpiod_get_value(ts->gpio_pendown);

This needs to be

	return !gpiod_get_value_raw(ts->gpio_pendown);

I looked at various DTSes we have and they use a mix of active high and
active low annotations, so we have to go with the "raw" variant for now,
and then update to normal one once we update bad DTSes.

Thanks!

-- 
Dmitry
