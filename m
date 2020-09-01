Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE2258F42
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A0A6E146;
	Tue,  1 Sep 2020 13:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA96E146
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 13:37:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so1580799wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eBYdOcprhdSXUkuni6N46ReU6XUpYC9nSnLaegsMVcs=;
 b=XH1XpJHysroQ+n/48BeXCA0jc3ZtqCa1V+g8Vj5rEHWgEM/8BBd89SteInaRcLixBT
 yLfmHImWQqmqeTZEovoAjYWZQtO23tSrDWKcttDBlmTaXaSJPYcxSIwPQTkFmIF9l4fz
 4+pyM6/WNgPYAa0l2YIg6bdXgXPMLIfbT6ctwjslZqrPkJTNTE0ixLO4tUF/8+BFR3Il
 3BFBufGG1XFDGbgDqVL8uTxIgA2BtFnKokBvVGTfMzyB1iVJQNHZbXfwgflpM/oSy7DY
 +/sVHpTc62Va3hyXgq4nMBkUVgl4oA7AaVKTcbwLWCbnJSX9KQdqd+64yjUaYCIaG6CM
 /UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eBYdOcprhdSXUkuni6N46ReU6XUpYC9nSnLaegsMVcs=;
 b=jZbGt/FPJRsfxETlznQyJ2c70QF6PNyccB3fguUqP7I3G23Z/N87hp9qGRaCCMycPk
 MgoX2DSGcH5gX4t+fu/1EqjPSRluIWylGgbqmZDHmacYjrIVBUk6gFg8ulC/uRrlKNnk
 1Iw0cGi1zsNFJY7YhCh142UkmJ/5fC4t9VNu0/eJ9hJq1knKdxgNJ7jpDx0TWAjs5Swi
 gHReOSB7qufhDwy0OubHbl0TVqkqq3QkRbeNgDhu4isnUjs/XcaPFKavlLOMMHWpdZMe
 oeDBq5Ck2y+YmZxKrfDAufhq08e9rCdUqdOz86IhYSomIC/WgAUvACHdd5dLuEj+Jq6P
 AqqA==
X-Gm-Message-State: AOAM533Du/xR/E2IGfE5H03uEyC1M21lEIiZq9E61rqZY9MFYC3/qPAj
 eegFoHaL7sOQobh4tZc0VYm/lA==
X-Google-Smtp-Source: ABdhPJxOHIw6bRt9lY0883KV0X/g6pqSHtca11VVjMpZuJm8AbD9RDYsnzG4TMkvES5HnlCiMzaXaw==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr1976344wrm.120.1598967450676; 
 Tue, 01 Sep 2020 06:37:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w21sm1926823wmk.34.2020.09.01.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 06:37:30 -0700 (PDT)
Date: Tue, 1 Sep 2020 14:37:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: tosa_lcd: Include the right header
Message-ID: <20200901133728.7q4gsh4gxs6pyqxb@holly.lan>
References: <20200826070917.100717-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826070917.100717-1-linus.walleij@linaro.org>
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

On Wed, Aug 26, 2020 at 09:09:17AM +0200, Linus Walleij wrote:
> The Tosa backlight LCDE driver was converted to use GPIO descriptors
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
>  drivers/video/backlight/tosa_lcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
> index 113116d3585c..38765544345b 100644
> --- a/drivers/video/backlight/tosa_lcd.c
> +++ b/drivers/video/backlight/tosa_lcd.c
> @@ -12,7 +12,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/lcd.h>
>  #include <linux/fb.h>
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
