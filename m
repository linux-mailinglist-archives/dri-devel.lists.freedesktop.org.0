Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268020AF2B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D26EC4D;
	Fri, 26 Jun 2020 09:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812596EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:44:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k6so8858755wrn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9jcpUTjaiwEq5d6ZYMtoMfwtdH3YQtVucbFJ+U/tZKM=;
 b=Kvu8cN+vj4+/nUrwwHBmCZWfsYnCv61XT7WjrvEMZTEYjT+blGu4Awr1hqRA8RBp1B
 HKM/Tre6fg5aWuzMxsUsg+Edz3AdyZszYk9qokib83cz6LwyIkZ9M8HlBYyotL81jumH
 lw052trE4YbToq0xNHz4MFU5nKqh1V89rlc/lwRHSo/a4bxGUH6rScn0CTA99AD0TCqo
 mV+csrRrAhzyMhXFh6N/Ieqj6SgGSKfjbu5KUl93j6TjJynDKvFwEsS38ZMahkyxLB29
 AU/UIGEEBzlOjo0o5Wqa4stutx1g1uoFsIDC9HR6b5BhaKpCWK/k5mw7hidLaI5MiZRt
 Fa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9jcpUTjaiwEq5d6ZYMtoMfwtdH3YQtVucbFJ+U/tZKM=;
 b=e8kqnUywUg05F+8A65AmVN4YoNyRukSGzoSnaDQ44VNmyW0MGQG7ctPQ3utaAUb5jh
 TaXORZieNWZcvfnL29fNZKuhTwe2790eyvF4N73ViprGWHT95Pc0gEQTRuBudU5L/7oZ
 SKbB+61rkDJFE4ZVjfW1pxuaiPOnPYtHoJI4Z7GHTZ8PK7xli5+cOl0VkRWxNsjMUdtG
 kemcz9shuSswj1F5lW6RSMyQgvRt8+PKKhBgZJfga7U/ShutQeybNJNKlL6qBtrKQwYO
 sYrGki88bI0EyzmBSG9lcaL0mLY/clzgQ4ZZP+HDZxYtJ+QgmAE81faL/zzpQbbrO76R
 qkNQ==
X-Gm-Message-State: AOAM531YZdT0xwgS2EV09YtaGUoLW25XezIr85arsYSM6/SmyQhxQGoI
 np46mSm0KwMCE5JsOE66NLN3iA==
X-Google-Smtp-Source: ABdhPJwma8kndCszat7tb1dYbaisxJ1ygDiBFBJTjk6ibuAoqtVq51ABJRe8P/Hm/PP4CXUWnauR/Q==
X-Received: by 2002:adf:ef46:: with SMTP id c6mr2824602wrp.34.1593164670102;
 Fri, 26 Jun 2020 02:44:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r3sm5004067wmh.36.2020.06.26.02.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 02:44:29 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:44:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: lms501kf03: Drop unused include
Message-ID: <20200626094427.erlmdtgxuren4ktn@holly.lan>
References: <20200625232512.282178-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625232512.282178-1-linus.walleij@linaro.org>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 01:25:12AM +0200, Linus Walleij wrote:
> This driver includes <linux/gpio.h> but does not use any
> symbols from that file, drop the include.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lms501kf03.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
> index 8ae32e3573c1..52d3ee6c3f7f 100644
> --- a/drivers/video/backlight/lms501kf03.c
> +++ b/drivers/video/backlight/lms501kf03.c
> @@ -9,7 +9,6 @@
>  #include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/fb.h>
> -#include <linux/gpio.h>
>  #include <linux/lcd.h>
>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
> -- 
> 2.25.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
