Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91245681C1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B6411277D;
	Wed,  6 Jul 2022 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F02611277C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:38:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so20969737wrc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jvy9fZnYZOoUrKY4T2EHzyax/+pT0S6ZamgoWmCY7lI=;
 b=Nrhlvi6Z3KY701t0TfH8JnJ1eqEH2mzMamvFfXkAzFp4yCik2wthX5b3eiGElyvktY
 twrPjYnxH4Az3+UmhZZyi4kamjX7dmvkLuZ3fe6Y1Zwwi7fdAUSUWpMsVoLnc6Q6rzvW
 qQU61MwwrRJzMAfPB1T4+5euhuz6TkkhTHBkZjlLyqQmV3/u0RSXtgyy89UsQGTSptFa
 rbxm5yZOIAAt2gicjScl7bUX2ZcLzlqji8MJM9Bzs/Mo7PsrQ05mNlXrxDJiUjYMLehx
 AwXhr7GPmcZZgqAmb6q2D5c6t6TBjdN1QLyjaESLYjidadwhnFPeBL/fEiaKbpTIE6rX
 PlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jvy9fZnYZOoUrKY4T2EHzyax/+pT0S6ZamgoWmCY7lI=;
 b=npwh+RD8rZI2flZxb8w5DqJqPd4osSpeRwL5NblhDGbuyHKkSozOjv/XhVaT9OimiF
 KyAHTPZyYnwpWkRA5iP81whW+KodYBIkxM5GeB/aMNAQBzewl2gO6oLmFIQtyNDE/Vsy
 zOL8NShUtwH1lG+QRynGtmJdfeqNwwNWL9u7iIWgacUutHopwbMfMKC/kcAJVtteiSXc
 13sAEm+I8qSrMSuWs8MmgWoXHxm/6wL5LJ+xSzoOcDQi0qKxJtI7FvhDnx4x/91PEGpd
 LJZ1zKbA6/0DGFoQvru9EXlPlJ1sc/Doh44LZVGe1k1Jpqzp4UYFwpo/AyhPCoA18xkK
 UKFg==
X-Gm-Message-State: AJIora9EiSHyKMU/BGRwd4etTCiWUZEDZEbBrj0l282KfpC+2oCopnoK
 dG1ZC4zP7CYHmGl2O0mnT05+Tg==
X-Google-Smtp-Source: AGRyM1u3aF0xlinqVbRSOVIwu8dj8kY7lVCFFrYuXzoizRjf/6/698o7/GM5e2My59isg+g9TMgrJg==
X-Received: by 2002:a05:6000:1e10:b0:21b:98c7:d35e with SMTP id
 bj16-20020a0560001e1000b0021b98c7d35emr38383139wrb.30.1657096706860; 
 Wed, 06 Jul 2022 01:38:26 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003a046549a85sm21339238wms.37.2022.07.06.01.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:38:26 -0700 (PDT)
Date: Wed, 6 Jul 2022 09:38:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Revert "drivers/video/backlight/platform_lcd.c: add
 support for device tree based probe"
Message-ID: <20220706083824.yow4e2hqthoqffol@maple.lan>
References: <20220629210024.815761-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629210024.815761-1-robh@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 03:00:23PM -0600, Rob Herring wrote:
> This reverts commit 52e842432f36d5b15227d0ee0d2aa3d2bc3cc0b2.
> 
> The DT support never would have worked because there's no platform_data
> providing ops. There's not any documented binding for it either.
> 
> Cc: Jingoo Han <jg1.han@samsung.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/platform_lcd.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
> index b2bfbf070200..dc37494baf42 100644
> --- a/drivers/video/backlight/platform_lcd.c
> +++ b/drivers/video/backlight/platform_lcd.c
> @@ -12,7 +12,6 @@
>  #include <linux/fb.h>
>  #include <linux/backlight.h>
>  #include <linux/lcd.h>
> -#include <linux/of.h>
>  #include <linux/slab.h>
>  
>  #include <video/platform_lcd.h>
> @@ -133,19 +132,10 @@ static int platform_lcd_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(platform_lcd_pm_ops, platform_lcd_suspend,
>  			platform_lcd_resume);
>  
> -#ifdef CONFIG_OF
> -static const struct of_device_id platform_lcd_of_match[] = {
> -	{ .compatible = "platform-lcd" },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, platform_lcd_of_match);
> -#endif
> -
>  static struct platform_driver platform_lcd_driver = {
>  	.driver		= {
>  		.name	= "platform-lcd",
>  		.pm	= &platform_lcd_pm_ops,
> -		.of_match_table = of_match_ptr(platform_lcd_of_match),
>  	},
>  	.probe		= platform_lcd_probe,
>  };
> -- 
> 2.34.1
> 
