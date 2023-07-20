Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4475ACF0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346EF10E0FE;
	Thu, 20 Jul 2023 11:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70610E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:27:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so5751605e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689852465; x=1690457265;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VitHHB/j4E2FbQyt3l4ZXhmBatL++1XQcdyfy56E4ks=;
 b=UP81D3FUZEgZ5vwArWBUB2oJ88gWEaslSg7iBpzTMCFOc2160r9S55a8+tJIRrg037
 G5V97G5DRX+lKnaXrGKPR4RkO26UxgJt8jjwXdNoWrBHL9PMNAnsv0e2pzeSOz6aayAl
 GgHsnvFzVOsygWLwFJrdshYMfLP8UiNe4w6rUzgm251Sl9KOMlBgnslNsEBK92R63K79
 3CBeIc618P5Q76O+MlGW2BwMj9/tyMlJO+D9K+D0MgAqOTCENCbPUWR85mnkqQMb4Vqf
 aaL/+oCGdDcwftsor9jyjkuAV3UbRIyt6R1E0aYe/V07wxOs59hppx63/8unc4uvHjCe
 s/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689852465; x=1690457265;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VitHHB/j4E2FbQyt3l4ZXhmBatL++1XQcdyfy56E4ks=;
 b=JAGKJbHhT4HQyLJAkhSjAGjLx+JoipeZvw1YB0fYK+zfSL2PqYgQKGc0DMTEdU5Dta
 5OotZSWq+4Mp4LHeJL3z0KTOirxlZzjmfVrt331qQ9DvI0YWg1Q8zArip277rmnhPfiQ
 +gZSoM/DaRNQ7xLFAa5dWYUg+1ftkAXYrzXnGdGjSeTq95zC+pecZTgI9ISx1edM745e
 9KrwDFrp6r6WmGex6IqzRkNq8ne+95d6v/dx32cYZ1HlsAGdUV20RsOdDI5oD0I0+Vvo
 EeiWyjLdiU9hgBnetn9opH88wc8BwruJV0JuSFr+Fih9OqXx18JVdUfC9+hoyCSdAcpc
 ZjSw==
X-Gm-Message-State: ABy/qLZOMYqB8IkX5sTTY+mgXjgbYjvMWj9rlxelfNlu0YniKXqvDKIT
 kwXwKFmE1Ea4xC+5pWf5enMNOA==
X-Google-Smtp-Source: APBJJlGRfFt2W2jdIn2r2U6UBgB1doiBi48U/0KDhjcLc5ca7PK5H7HtFWHizlOq4SYZw6yBJM3y0A==
X-Received: by 2002:a05:600c:294a:b0:3fc:182:7eac with SMTP id
 n10-20020a05600c294a00b003fc01827eacmr7015134wmd.33.1689852464852; 
 Thu, 20 Jul 2023 04:27:44 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003fbbe41fd78sm973423wmr.10.2023.07.20.04.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 04:27:44 -0700 (PDT)
Date: Thu, 20 Jul 2023 12:27:42 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Message-ID: <20230720112742.GA2525277@aspen.lan>
References: <20230720061105.154821-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720061105.154821-1-victor.liu@nxp.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> Bootloader may leave gpio direction as input and gpio value as logical low.
> It hints that initial backlight power state should be FB_BLANK_POWERDOWN
> since the gpio value is literally logical low.

To be honest this probably "hints" that the bootloader simply didn't
consider the backlight at all :-) . I'd rather the patch description
focus on what circumstances lead to the current code making a bad
decision. More like:

  If the GPIO pin is in the input state but the backlight is currently
  off due to default pull downs then ...

> So, let's drop output gpio
> direction check and only check gpio value to set the initial power state.

This check was specifically added by Bartosz so I'd be interested in his
opinion of this change (especially since he is now a GPIO maintainer)!

What motivates (or motivated) the need to check the direction rather
than just read that current logic level on the pin?


Daniel.
[I'm done but since Bartosz and Linus were not on copy of the original
thread I've left the rest of the patch below as a convenience ;-) ]


> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index d3bea42407f1..d28c30b2a35d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -87,8 +87,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  		/* Not booted with device tree or no phandle link to the node */
>  		bl->props.power = def_value ? FB_BLANK_UNBLANK
>  					    : FB_BLANK_POWERDOWN;
> -	else if (gpiod_get_direction(gbl->gpiod) == 0 &&
> -		 gpiod_get_value_cansleep(gbl->gpiod) == 0)
> +	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
>  		bl->props.power = FB_BLANK_POWERDOWN;
>  	else
>  		bl->props.power = FB_BLANK_UNBLANK;
> --
> 2.37.1
>
