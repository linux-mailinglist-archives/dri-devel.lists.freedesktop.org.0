Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9083AE6FA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431AF8933D;
	Mon, 21 Jun 2021 10:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19458932A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:23:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j2so8461660wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oiKVdmJOnVuPvDX95e842EXPabwHvh6iizPWqy5O4cs=;
 b=uWF9SfuZfnwNkSZw5Cp0c3l2zOmGbMqlhxp2YX0gLtPVFoa+/o89ayPaAl8wAI2UPj
 8FPFc59d7ZeeE5RcxZV0KQpfyASOO/DOxr3T7fRVdiL8xfGTMsr5lcgELYZ+aKR4vaxI
 d/GkuP+6C/kqb3uRqTw563MqnDryNEtm2d5gqUWHDPhRlZ+ySRTeqlE1nKHYiSQlDJeu
 lwg/olZTjDFm4wiYKu74YdwEDvqFjOiGFGaD9StboJ8cYG1FjiqMjlxLE8zZ0jdBcukq
 ojZ5HLdxjMizPNgNNGh3N9yQvZvPZk8wHkUwBnlQAH9r4FZHLgI9sGyU9Y4+24uuMnBZ
 R1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oiKVdmJOnVuPvDX95e842EXPabwHvh6iizPWqy5O4cs=;
 b=iLRGQmwWW4Tz2eJw4kwIANkh+uTaNARYaSYFqCJFGzOGqABZWtt8ewcqiETG/QR0vc
 aIHVQ7d4MFytZGN4mLtDPQWtwrHSDXdPP04DZXdh23xw5WvK/Kxqu8mMzh0Rdk2cDCXz
 0kHI5Nl1UcyF3l0cXZpxSKoUj4cbXTBpCrO+qO5lKctxLJmyXmM1RtG95FdVPAbpydEU
 v1Se/1SKKbSpp9KysrWFw/6eMkBlL5qmYW7ubVVGHd9k39DrJ0ZWf5mm1oMpfKfxOm7d
 G5lLWjpsfAhtmpBOFDwmLdxxgEVnsYcAY/Yzq5/Ij7tTWyJU8IHoGsPFZAOge2EqDdC8
 XdRw==
X-Gm-Message-State: AOAM531sbA9y4MYCvhyqwIIe/VQDqokAdKLARRPjRucFbsfWGLprK0YP
 nSv7NkQnCz0VLijDdl4XrDtGew==
X-Google-Smtp-Source: ABdhPJyE5bHZgsVdfdJv6AqwKtG5oeiVjg5mqAlQ2MLSnSagaYHt7MonCyQJqu3Ku62Q6Z4QkYETgw==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr17079859wrq.402.1624271033599; 
 Mon, 21 Jun 2021 03:23:53 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id u15sm18477761wmq.48.2021.06.21.03.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 03:23:53 -0700 (PDT)
Date: Mon, 21 Jun 2021 11:23:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] backlight: lm3630a: fix return code of
 .update_status() callback
Message-ID: <20210621102351.45m2oznsmg5nfv6t@maple.lan>
References: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 20, 2021 at 09:39:27PM +0200, Uwe Kleine-König wrote:
> According to <linux/backlight.h> .update_status() is supposed to
> return 0 on success and a negative error code otherwise. Adapt
> lm3630a_bank_a_update_status() to actually do it.
> 
> While touching that also add the error code to the failure message.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks for this!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/lm3630a_bl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index e88a2b0e5904..16a2658a72e1 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -190,7 +190,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
>  		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
>  				 bl->props.max_brightness);
> -		return bl->props.brightness;
> +		return 0;
>  	}
>  
>  	/* disable sleep */
> @@ -210,8 +210,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	return 0;
>  
>  out_i2c_err:
> -	dev_err(pchip->dev, "i2c failed to access\n");
> -	return bl->props.brightness;
> +	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
> +	return ret;
>  }
>  
>  static int lm3630a_bank_a_get_brightness(struct backlight_device *bl)
> 
> base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
> -- 
> 2.30.2
> 
