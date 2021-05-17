Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D838360D
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95689244;
	Mon, 17 May 2021 15:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B548982E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:28:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v12so6856984wrq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0JwxGBKfDoUxq2NZLsErnRvzPdT2eYfu4gWuQeo9vCM=;
 b=j1J70RTbH+qyRmD8QqmKri5WuNEcnX+J4adv/ycgORjHO5/WAJsOeJ65SrOYzUnVTP
 VG3uUlqBj/EQMg9qfGG/nXtfTlY6ZLKRp2SQEaQiSmH7R+0WfsT2Otk71jl9cXMr2uWs
 lv6P0aLshi5yaJ3YHGy4YH6gXZ6eGOOlkuT0VEtB5JwR0vRjFyyOx2BIq3tTJwrSyva3
 zXyVDwm4utj0rSUQQR5h6hnEpgIu/WmZEkVoXxNdOE0mLuayt8biCpIw1qRCJ023YzUF
 RF+nlucQSrsui7y4n+FDQuWg4Km5I/qb/leF70mGmkreZNJuKjKpFUJY2lxeMlL4uxYJ
 aNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0JwxGBKfDoUxq2NZLsErnRvzPdT2eYfu4gWuQeo9vCM=;
 b=D3YF9n8Fn4cdyzmdZeLKki6W4M/rngtfGR5IYZXJi4nBzQExpr3ty/0kTLqHcJJ65u
 fWp2hykUSnCpEAtBGjoTIGfbb0auS+OT+oH+eKCOcIL726aNlfcUrRCGBldiZnbkSLAS
 KNncrZ27ikkkARkDy1p8clj8ufixPwOFgkXBNycx4cMRUW4vbdAScxwfZfIVFRk0MKde
 shwzvRvTQUPmhyUq/RHrFAUnhiRp1uxXg7fAVElMTlFQo2CVh9yJHktolB+Q6ToQ/rWX
 kd9N3gyN50w0QNUmGAU4AfO+2BmMo3ZQq074TCLliqTpsBl7tLggLEufB7ffZO3yU6LX
 LhHg==
X-Gm-Message-State: AOAM531SO9dAwDQq3bfROC1JmU177UyHC4cr7Kzfgtdl6PfDG2Q0iEGB
 8hzvI6zoOnzLBotwkbnP08upPA==
X-Google-Smtp-Source: ABdhPJwuwOUHqhdgm9HQRD81VC7JS4eqLC5JQc4toY1qtK7WE6GphAF3qIqwNcqwalRX4HpnUsEzSA==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr296464wru.396.1621265280618; 
 Mon, 17 May 2021 08:28:00 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f13sm14745840wrt.86.2021.05.17.08.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 08:27:59 -0700 (PDT)
Date: Mon, 17 May 2021 16:27:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] backlight: Remove leading spaces in Kconfig
Message-ID: <20210517152758.lqwmborindqvavwo@maple.lan>
References: <20210517095839.81833-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517095839.81833-1-juergh@canonical.com>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, juergh@canonical.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 11:58:39AM +0200, Juerg Haefliger wrote:
> Remove leading spaces before tabs in Kconfig file(s) by running the
> following command:
> 
>   $ find drivers/video/backlight -name 'Kconfig*' | \
>     xargs sed -r -i 's/^[ ]+\t/\t/'
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> ---
>  drivers/video/backlight/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b902c1..a967974f6cd6 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -129,11 +129,11 @@ config LCD_HX8357
>  	  driver.
>  
>    config LCD_OTM3225A

Whilst removing the unwanted spaces (two of them on each line) could we
also remove the two unwanted spaces from the config line as well.


Daniel.


> -  	tristate "ORISE Technology OTM3225A support"
> -  	depends on SPI
> -  	help
> -  	  If you have a panel based on the OTM3225A controller
> -  	  chip then say y to include a driver for it.
> +	tristate "ORISE Technology OTM3225A support"
> +	depends on SPI
> +	help
> +	  If you have a panel based on the OTM3225A controller
> +	  chip then say y to include a driver for it.
>  
>  endif # LCD_CLASS_DEVICE
>  
> -- 
> 2.27.0
> 
