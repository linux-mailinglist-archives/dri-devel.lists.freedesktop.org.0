Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95202209C17
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E69F890C5;
	Thu, 25 Jun 2020 09:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BAC890C5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:43:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 17so5236546wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j45b6+I6ZWwo5WxhN+GENPgTL8D/dlpGydw4pkMbgwU=;
 b=FhgGj3eWSC1oHWyWzjIGtgCX9lx/ezhW5C4SRbb+zwdkKsAS/VCcdVQA7zvlH5L6bB
 xns15Dvy1K/2RZ75ELM9TI7FxopbjabZM6Rs6CpC1uStJ0up/tSvBTOKWuRLn0hp8dqi
 n3clD9tw81MhCHAdhAuOAM1a64/PP/E6Pj9iPIJ4mm/iU3uc8/BeX0ksXQXsDI2VQsOH
 72hia9pGoU1ngj60SObkuiwJYCdTRpIiX//NlUpSzT6UJY8PaQsezchlhDANZ5yPP9KC
 b+fAAhyEzRbO0sHF9OsxR034UrLImypDaYP40RaxKWK6q4rGvojBowjVVQJWLxLPwedB
 LMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j45b6+I6ZWwo5WxhN+GENPgTL8D/dlpGydw4pkMbgwU=;
 b=B0RdKSs6L4oZWIpITDtG+3K7MSvCkKCcAeEVhm2kH6TRiACda+wQ3GAhnsZJUhLUlQ
 0Vuk4LmQ5c40Riz58L2U9RdcNddb3yNjkQMSdHPWYCHkjx9a7e/eNaoIYy+gapC8CBAP
 qpt5UBrzU9Ov3m+ubKB/8NrToJQhposPmPdsCR4vzzq4O0E6X/TNlYf35EqB8uw7l6V/
 0e/vw4AYM4aBDvMbRJKjthGnHlagBK9odhcgbqj1Ud8kPhDF+aJyECTbFTA6vx5f+fEW
 C9GSCOxX7Qk8D3/BvJKfL7hQ0TERkddjOH3JnngDOZHVOpT5zTc/P31V7/3CqI8m3KhA
 XzOQ==
X-Gm-Message-State: AOAM5322oC6s/6HKLvMUY8SYqEdSkxbwGzcVmoUNcUTYXdVyCJ73JNVd
 b0KgXRpUWGk7V6tHm2eDLee7ig==
X-Google-Smtp-Source: ABdhPJyVh2/u8gPyZu7/vGbROSHCxcfYm8e4mf1Wh34YtHnJmRVH7cCnSRaIAX6Gp4xYZgro0tnotA==
X-Received: by 2002:a1c:2402:: with SMTP id k2mr2437451wmk.138.1593078200289; 
 Thu, 25 Jun 2020 02:43:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t188sm11873191wmt.27.2020.06.25.02.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:43:19 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:43:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 5/8] backlight: ili922x: Add missing kerneldoc
 description for ili922x_reg_dump()'s arg
Message-ID: <20200625094318.h6t22gkgi5d7wbv4@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-6-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 03:57:18PM +0100, Lee Jones wrote:
> Kerneldoc syntax is used, but not complete.  Descriptions required.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:298: warning: Function parameter or member 'spi' not described in 'ili922x_reg_dump'
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Software Engineering <sbabic@denx.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/backlight/ili922x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> index cd41433b87aeb..26193f38234e7 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -295,6 +295,8 @@ static int ili922x_write(struct spi_device *spi, u8 reg, u16 value)
>  #ifdef DEBUG
>  /**
>   * ili922x_reg_dump - dump all registers
> + *
> + * @spi: pointer to the controller side proxy for an SPI slave device

Similar to previous... and I also noticed that there are several other
existing @spi descriptions in this file and it would be good to make
them consistent.


Daniel.

>   */
>  static void ili922x_reg_dump(struct spi_device *spi)
>  {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
