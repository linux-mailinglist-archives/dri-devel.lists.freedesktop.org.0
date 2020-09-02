Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B425AA24
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9511A89A1E;
	Wed,  2 Sep 2020 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7153F89A1E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:21:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a17so4814880wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cdmxsSW1Q8PGLog1XKp8J5OXKPRn0AMTDXbAprPQm2k=;
 b=XDDZsQYprbWp/X33ZuBv55aiHdOq5NX3mPVPPAdP6O12HjnCzJI/Rc6BmMXw3wM36W
 cWgxS77oFYppFBUCPSOWc/0xf6cwm3y3Oar3aVhubVgvfdOe9wCb5ZbXBIxPoIu+A6AL
 Ekfd1PYG/TxvFd+6+MNysn4jEgE0EwnwwIv+PIxZbGsBKufUeGyKGL3hJ1wCeWzzaadJ
 PkO8BoQ4oORcfgqSKLieIIHl20/4EoZWwL1plnQrxWdi0AeTnnnCy8bLA/XXW0Z3KV2j
 +YA7K8lluYJ8BiFAB0DtzCQh0dcD4b/gVgo4pP5WFzBGrxzcdKAIOWwG4WQ6PhVkV2m3
 7Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cdmxsSW1Q8PGLog1XKp8J5OXKPRn0AMTDXbAprPQm2k=;
 b=XKHrOf+7Tqz62cQt66iD7vq6yNfHwUNC55NMsY/YNe5xdv6oWmz4u0Mq/tJnQkNwBl
 YODYshC9cz+H5kLMK2fgzZ01Gu9lmU6dEQGSSaFSGXbWFnfPTa96wBgqsth2I/rB8LeS
 /vBOc4l34yy7CgPjLV3e/vgbKxU6mEmfXX0NELJbkiQjNwKfBhZpTVsy6at10OWMDMP+
 f0Y0u01nXxXa5uCgPmDtWz146mqdEZDPSL8BJ77S4JVhhSKq8a4NTNvJUcJSg0izRhAk
 f1y4P1z+GZ6FlgBXO3rP2tPr1K+OK7/m236D4f2QTbAq/FCB542iuusUor3KBuyKr7sr
 XkEA==
X-Gm-Message-State: AOAM533dzd1AuG75/58f7A1D/S2HGMm8dTyElQdsdADfvWBdEoGBnoHE
 25o9tpFANGJQcXv/ZravDwU6OQ==
X-Google-Smtp-Source: ABdhPJwAJPBiLsKku8vt6PxGS5k1YR39WcPk9EePq/tfkZgIB+6deEgdFvOHiUjD1ASnIYfFCKKQLQ==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr7051353wrl.313.1599045678077; 
 Wed, 02 Sep 2020 04:21:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a15sm3828810wrn.3.2020.09.02.04.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:21:17 -0700 (PDT)
Date: Wed, 2 Sep 2020 12:21:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 06/24] backlight: gpio: Use DECLARE_BACKLIGHT_INIT_RAW
Message-ID: <20200902112115.fy65ervuc2dee5sx@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-7-sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:45:14PM +0200, Sam Ravnborg wrote:
> Introduce use of DECLARE_BACKLIGHT_INIT_RAW when registering the
> backlight.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 1d509b626b12..13d44417446a 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -49,7 +49,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>  	struct device_node *of_node = dev->of_node;
> -	struct backlight_properties props;
> +	DECLARE_BACKLIGHT_INIT_RAW(props, 1, 1);

Other than the existing comment about wanting a scale this looks fine.

Curiously I think no value of scale would be wrong for this driver...
but I'd be tempted to mark it as logarithmic (e.g. hint that userspace
should expose it directly on a slider without any remapping).

However since no value is wrong then whatever you choose is OK and this
will be:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	int ret, init_brightness, def_value;
> @@ -69,9 +69,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
>  				     "The gpios parameter is missing or invalid.\n");
>  
> -	memset(&props, 0, sizeof(props));
> -	props.type = BACKLIGHT_RAW;
> -	props.max_brightness = 1;
>  	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
>  					    &gpio_backlight_ops, &props);
>  	if (IS_ERR(bl)) {
> @@ -96,8 +93,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	else
>  		backlight_disable(bl);
>  
> -	bl->props.brightness = 1;
> -
>  	init_brightness = backlight_get_brightness(bl);
>  	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
>  	if (ret) {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
