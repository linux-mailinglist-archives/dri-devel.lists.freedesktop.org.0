Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2D25AA1D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5AD89A35;
	Wed,  2 Sep 2020 11:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BBD6E455
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:17:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k15so4796062wrn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I8lisqjXnVPd7oRSj+l+s5qKEYhf2IhPS4SsdWiGYdI=;
 b=sGpwRUc9qEepgDRqIsq4ElaPkTVhx1hdMICAY5Bswyk14y3uDZUJHbY/n/Hq2RI6cL
 PHUBE3XAjsVkmbOfI37a7L/zly/vd+Wk22lfuZKUHu2o8YLdvtAicrO3F4BscwUBOPma
 d2djS7qlO0lqkP4XVniSFyXx9DClEajgjOtHRPIBLsrb5a/TuB8R4oWsWYoO6BN3choV
 E/AcfBhEBKc+Ihhl8J+lj5QzjUa89SqvlGrsoobHSoR7TVOypHZpBW+XEIWZ1l2I7itz
 3oYDhueT1mpjEnjwbyd1MG/I8bdO7zjQNVQAPRTl8WSNOhk5lGRkTKIdF7mtr7MQH7IC
 cZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I8lisqjXnVPd7oRSj+l+s5qKEYhf2IhPS4SsdWiGYdI=;
 b=n48mlLxB2jpWo3rdI/o/uMdkVne5r4RVnuXDaMXgOPf4a+Oqd35jOOE2xS2ZVv9SAk
 nDbnNieMlKSo4SPkW38HXOXyyQVSgufvNx2fgtvSQoGNFvVA2C13/Ovq+qiQKE+mr8KF
 l03aCtpAXy8do2o9i8z+78KSbv1MpolGT8R1phQjEEo4QF3c/VSyadjIcNuh+JZg0TbV
 A4UqR/UeVT05vwCOgOi+P0NKCPJ/O+bGoJwKEfIFy16w9hhlZC/apkPIS1mDjlaC9S27
 bwsFPn2/r8pQsHA401nJvlVpzGrIYFTnNTuUVzfL7gcb0FR1eChcfrjGMGbLzwsuPQyW
 Zyng==
X-Gm-Message-State: AOAM532pNIZzjfuTCvQ0osMKLHnG4RL/RHVHUNOUug8hM9zZDE/fuNPf
 89ifKhULAIRq3iEJzmxRSehQ6A==
X-Google-Smtp-Source: ABdhPJzASJ17XOJsaTpXhoAfoYdk25Wux3CAxGBlUGZfqO5d7WAnjoayl0iR3d/C1EqXDqdtA4K5iQ==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr2986770wrs.260.1599045439929; 
 Wed, 02 Sep 2020 04:17:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u17sm5850261wmm.4.2020.09.02.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:17:19 -0700 (PDT)
Date: Wed, 2 Sep 2020 12:17:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 05/24] backlight: gpio: Use dev_err_probe()
Message-ID: <20200902111717.cehahh2j7vlbcgyp@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-6-sam@ravnborg.org>
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

On Sun, Aug 23, 2020 at 12:45:13PM +0200, Sam Ravnborg wrote:
> Use dev_err_probe() to make some of the error handling
> simpler in the probe function.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/gpio_backlight.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index dc9354dc5e6a..1d509b626b12 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -65,13 +65,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	def_value = device_property_read_bool(dev, "default-on");
>  
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		return ret;
> -	}
> +	if (IS_ERR(gbl->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> +				     "The gpios parameter is missing or invalid.\n");
>  
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
