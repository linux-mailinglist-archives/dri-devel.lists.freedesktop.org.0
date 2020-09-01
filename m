Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C470258F3F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942666E25B;
	Tue,  1 Sep 2020 13:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCA6E146
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 13:36:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x14so1556459wrl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QfSBx3xxSxuQ1vU6sjW29f0YHsyyNeVdCZRL3jBVqVk=;
 b=c27FLRiBAZBt5I0+D5h7MYwrpVUd0GZiizOw/Kdqe4JbN5CL1qvUNHPj1WoAUpzHQK
 WwBQv82FpPPj6wRsKa6DcqI/Y4WmrumYQj1ZyhEjNMLmHp5tT/igmOEQzFkeNaRfzjdY
 V2XUEWOsq5WCaBJNUrbnX9LgTBCvd5I6AMZ4QdYP6nIxCw+HFG9vwMaVpaYf93vSvAbj
 uzvNSgk/8NOqFks37AJYZAaKxs+7p0it0eqa2mazper1kL2kKv2+ULNuBy6cYnys8ZQp
 6YZU8DwW3W7H6CY1+XUewhUzWviBxWzTfy4Jr15mM1gU763w9RxgLen5l0DH3M+Rz4yc
 GGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QfSBx3xxSxuQ1vU6sjW29f0YHsyyNeVdCZRL3jBVqVk=;
 b=cGunHJtZewhU2tTgErq1cibSy3dLWlIEqKwDvidJRIoKKtDiwgOb348udFxZnPlqhM
 TH8CBFInAa7mk8tihOLo+LFGlV4GFzkVVeE1IIR2oivGGAlikGNvAKZv0AX0j6lEY9MK
 DG/fWugEEbWHqeHUwqLcBbAXRNtOeTt3pMfATiW1dwgaS6bU+5E52Vjd1YpSJ1iMstIP
 DahYOj94sjlejrhcbBmht+HwARYKinlK1z4ZXCMKH1wb0ASMX610tQaE2oczDFmor/8x
 CgBs2T+w33swA6rsqFEfEbZlVba3WgywParet8SmFuUvswqHn+78DCGpX5sm/kOOpoGX
 Bq3Q==
X-Gm-Message-State: AOAM532TETr0+5mOyua8yHZCjpILM/0GKFXJL9h+ZhEByvn1jTM2fFwF
 PLSO4f8HavWblOxNxF7F1HZKdA==
X-Google-Smtp-Source: ABdhPJxwOmiYYzLb+h8KUlMoRTO24YdVxSxXLxlZgkZf1f4/x2OTdOCtOJ3lE1AU2jDU7ss1cqkpoQ==
X-Received: by 2002:adf:f6c2:: with SMTP id y2mr1928836wrp.79.1598967416010;
 Tue, 01 Sep 2020 06:36:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n11sm2308499wrx.91.2020.09.01.06.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 06:36:55 -0700 (PDT)
Date: Tue, 1 Sep 2020 14:36:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: tosa_bl: Include the right header
Message-ID: <20200901133653.s7dsq6osmknixn5v@holly.lan>
References: <20200826070540.100158-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826070540.100158-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 09:05:40AM +0200, Linus Walleij wrote:
> The Tosa backlight driver was converted to use GPIO descriptors
> in 0b0cb52bd80eda76c4b9921f5cf9c1b709d44e83
> ("video: backlight: tosa: Use GPIO lookup table") but
> still includes <linux/gpio.h> rather than <linux/gpio/consumer.h>.
> Fix it.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/tosa_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/tosa_bl.c
> index cff5e96fd988..6df6fcd132e3 100644
> --- a/drivers/video/backlight/tosa_bl.c
> +++ b/drivers/video/backlight/tosa_bl.c
> @@ -11,7 +11,7 @@
>  #include <linux/device.h>
>  #include <linux/spi/spi.h>
>  #include <linux/i2c.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/fb.h>
>  #include <linux/backlight.h>
>  #include <linux/slab.h>
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
