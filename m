Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C26F3892DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0D46EE02;
	Wed, 19 May 2021 15:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87526EE02
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 15:44:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3707262wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4nu3OSdvPAQ7VkA5Lu/t0kQYvXnt9HghzAhj6ZR5wXc=;
 b=KW4jncRtsVJ0qOZ8xXM9WdklXP/wPTxhSi5g4UQZUOyLMg5rF0WFjn6wOI3G5tB1X+
 wvH5LtDvcBr0gj+jyw9Y3DzVQek2meyK5G0iRkndiLobnkoEtVdKkjvUNIeTGF5xJ29D
 HeXVJcFy+WVxXf8muJp4RNBPVa9e2hShFmstZsEZLy7NWK0rJCnuDNTHdAGXh3vhGGwD
 V+zB7FaW6abbE218yv3F3NKmajccjq4im07xAPAB2M6E8GOjs6wzmBmDrChrbi/4PGUR
 WH/qzpOQISHnWW7+DMT4j9Emc+1TFBFXtARDDrlJX7Mm7im/5w68aG63BPt+IFfe6XyF
 xqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4nu3OSdvPAQ7VkA5Lu/t0kQYvXnt9HghzAhj6ZR5wXc=;
 b=H7OYrJlNSJYM//yvPYnS/lN3fF61jgwVB7w6Xt4Ces+V6X9IItKqefLWDdWX9T5ixP
 7zNZKYuZ9xMzqyHKIrY3f7wI9EF3MYf2ML7NZHORhSlsbWslQodvuD17B3CnT2spiO9E
 0BmEoYqxkLWChhPLmwX8OX+jiKXGZrHTCjV72T5nDSFvaqLPObvBpR2SXX4vYXCPa6NO
 2AGB8jRtUQz2fXE5ayCqPOu/e/wWY6/ZmPKH45JYmax5Mkn+ptFrwDUPNXAGZuIhH0Rl
 hlVUZbB3JjPIJXZeQmClVHoYTxRM7gCjbBu+ulwivWJL43PPAq5O+l5Z3zAwzfYw/ZBf
 w62w==
X-Gm-Message-State: AOAM530zmOzdMv/0YdcQeWEH2HtD2admtaTbGBto0MM7fYaOrx7jckwk
 yOC2DwkXAzO1XJYKj2bxvMTxMA==
X-Google-Smtp-Source: ABdhPJxm3DicWObRp7AE2/siDsEzYxCeS+fBjpBkSEKmMtJQ29aNWO0Wp4a8UD/rCQih9Wz3T4VICQ==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr11921329wmh.183.1621439061770; 
 Wed, 19 May 2021 08:44:21 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q1sm6200684wmq.48.2021.05.19.08.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:44:21 -0700 (PDT)
Date: Wed, 19 May 2021 16:44:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2] backlight: Kconfig whitespace and indentation cleanups
Message-ID: <20210519154419.n74hcf7lnqvmuuvf@maple.lan>
References: <20210517095839.81833-1-juergh@canonical.com>
 <20210519110300.17918-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519110300.17918-1-juergh@canonical.com>
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
 Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 01:03:00PM +0200, Juerg Haefliger wrote:
> Remove leading whitespaces, replace multi spaces with tabs, and fix help
> text indentation.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
>  drivers/video/backlight/Kconfig | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b902c1..c887338de386 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -128,12 +128,12 @@ config LCD_HX8357
>  	  If you have a HX-8357 LCD panel, say Y to enable its LCD control
>  	  driver.
>  
> -  config LCD_OTM3225A
> -  	tristate "ORISE Technology OTM3225A support"
> -  	depends on SPI
> -  	help
> -  	  If you have a panel based on the OTM3225A controller
> -  	  chip then say y to include a driver for it.
> +config LCD_OTM3225A
> +	tristate "ORISE Technology OTM3225A support"
> +	depends on SPI
> +	help
> +	  If you have a panel based on the OTM3225A controller
> +	  chip then say y to include a driver for it.
>  
>  endif # LCD_CLASS_DEVICE
>  
> @@ -269,11 +269,11 @@ config BACKLIGHT_MAX8925
>  	  WLED output, say Y here to enable this driver.
>  
>  config BACKLIGHT_APPLE
> -       tristate "Apple Backlight Driver"
> -       depends on X86 && ACPI
> -       help
> -	 If you have an Intel-based Apple say Y to enable a driver for its
> -	 backlight.
> +	tristate "Apple Backlight Driver"
> +	depends on X86 && ACPI
> +	help
> +	  If you have an Intel-based Apple say Y to enable a driver for its
> +	  backlight.
>  
>  config BACKLIGHT_TOSA
>  	tristate "Sharp SL-6000 Backlight Driver"
> -- 
> 2.27.0
> 
