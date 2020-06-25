Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C5209C14
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9869C6E9E2;
	Thu, 25 Jun 2020 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF97D6E9E2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:41:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so5101877wrs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o1jD7J8NDVqOQc9AKq7CATicHwQZYtpzJ7cR9sOfFqw=;
 b=KHHYFSoy24G/mXyVtLft9wFkNpYC2Pktesf5tHqTuFFWhOYFY1uLmbdKS9K7U4hBvQ
 n7iwkmWESbQO2d3LySeThLR8EMVDTCNtpIF/0NoRbndmxwkd59b0E0TEA+EScemuQz3w
 BUZ82dIyTxeMrB+/XJg38uVhDfKVznLpqjf27nHqgvNpoAAyXfuX13zFn/cepgtKDKVf
 gos2hUBI6fOo+KynmRO1otG/CrSzPyazUoownlH2w66Xl1P2qh4QDEfkz8iC7yhmbao2
 hjyaIoRYWZwRMfSxsu5SExtGw8xmz9TPS5M3MyRUnRgnD5xIqmw7hKs5YJrpFIDnV4Uy
 gJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o1jD7J8NDVqOQc9AKq7CATicHwQZYtpzJ7cR9sOfFqw=;
 b=qaZ9D7vR+DW3rifvKFQYY/khJAGgBJ+Oxf/mRzcX0SscU6RM1IIwyc2vQaw16yN9B/
 Plln6Uuo811lM3k1kFwN6OySCZAqOPKdWLz6JkK2pn/pVZ+pRO2mT5DULHwsSbG1aolx
 Rxwb26tUv5aHAPZy/h6wuZyU+XUpavaV5gMAg82WOzkojneqzf6NekycldpNcjiQJayM
 rG12FbbldskzT9K5U/gEfeveVQe+3b61EtS8FUIEbmPE38AufHJq1iNXR/PCaz6Q9t0u
 rcSuRKnJO9R13Sa+MrraVSyCX8C0SqNvWRGERON9SuLT957vd2IMG7NjZ5H23u+XwvXI
 EtCg==
X-Gm-Message-State: AOAM530hnTga6NSXYLFhsH0B+UglhUMIEe9jXNPdkOHiOdVPN1JSitO9
 QZtbNXa+VsB0YxZI9EdSj8hmpw==
X-Google-Smtp-Source: ABdhPJwqVIF3U4RpHKFRh/x+HzkKFYCTnP8uQGV7G4OL1b+Bw0pR+kNSz0MBfG7un3od3TOn8lviaA==
X-Received: by 2002:adf:8462:: with SMTP id 89mr20649914wrf.420.1593078088492; 
 Thu, 25 Jun 2020 02:41:28 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o7sm9921492wmb.9.2020.06.25.02.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:41:27 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:41:26 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/8] backlight: ili922x: Remove invalid use of kerneldoc
 syntax
Message-ID: <20200625094126.jp5e7x64sjdu7med@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-5-lee.jones@linaro.org>
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

On Wed, Jun 24, 2020 at 03:57:17PM +0100, Lee Jones wrote:
> Kerneldoc is for documenting function arguments and return values.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:127: warning: cannot understand function prototype: 'int ili922x_id = 1; '
>  drivers/video/backlight/ili922x.c:136: warning: cannot understand function prototype: 'struct ili922x '
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Software Engineering <sbabic@denx.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/ili922x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> index 8cb4b9d3c3bba..cd41433b87aeb 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -123,7 +123,7 @@
>  
>  #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
>  
> -/**
> +/*
>   * ili922x_id - id as set by manufacturer
>   */
>  static int ili922x_id = 1;
> @@ -132,7 +132,7 @@ module_param(ili922x_id, int, 0);
>  static int tx_invert;
>  module_param(tx_invert, int, 0);
>  
> -/**
> +/*
>   * driver's private structure
>   */
>  struct ili922x {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
