Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A73CD3A9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D826E0FE;
	Mon, 19 Jul 2021 11:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6DE6E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:22:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g16so21579164wrw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=19Ti1NA8xVHCqT+B8GYPMXpjdTLfZFTkg7dVmDYiAEs=;
 b=jAyCwfKi2yqyRkfxA82+bQyCTExzPurK7LDyypufme3eSHYHBzPBWBBBnUzo9GBfRs
 NJ3jnlfG8TJxNXEc/L4SnQfF9D7h7uBmkJLc1cdMiJ7RbSW4WKDeZpSy9zsDkUjHxqmb
 8nrIEwuTsY4HuqFcbixvcihqEuKWBMazj63bwpma3KAtWLMewuGZZJq2u4pH2tQaznkh
 nJiP/BSTiYrXkBeS5bWQcjpr5T8xEePeNmxEmxVEpmqHWjOFynRLzTAQMTrsBNumWF9g
 6iAReWVOaKoSOJpTMYTewADer5Nk0IgOlnR1I+sw76QkwhtfZzvMNtas7DZebVVSdYNo
 QzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=19Ti1NA8xVHCqT+B8GYPMXpjdTLfZFTkg7dVmDYiAEs=;
 b=ECZdYBvig6iNFnCIKuzsF6TBt4dGgnyNUYrD6tr9+uFfYPh7jiCwC2sZyx8YlWWovA
 Kdk+zSMpas52Xm1/BNk4xceFR7gpPgxJ/Ipxk9Qz5YVFLSEhJyMnjmyyNzppMUHF7HIE
 FwEx5qoS+Ch7Q1pbISPFzvzcxM1vqUpKswtWV6g3eWMtQNIz3qwNqXPTvEvuBFjsmQpG
 jnMk20cXqHjZPnTgtguqG/l2rnLNkUIydCZFNjW8HLUoYe3cA897Y1kqv7b0KuYCEyjy
 EdMw0CCpGZzJcGGWBQojEuaG4yKxO0QRC9iw2QP/AMKziRowC0UvcKqI2LIaDO8GrJ63
 XncQ==
X-Gm-Message-State: AOAM531nvWjlAa71RwkexN9EplOsnKy9fGdaOGWmD2VDHflrpmFra6o8
 YS1Slj0fURa2LjIy+GBG3eMq/w==
X-Google-Smtp-Source: ABdhPJx1HmRU4Pb7pJdzPw2qozjXr9k8BAezOmNqwPaNbmc9C7dUNiBMx3ODTUPKpcXItKDcBZArEg==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr29237501wri.199.1626693725475; 
 Mon, 19 Jul 2021 04:22:05 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d67sm20703707wmd.9.2021.07.19.04.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:22:04 -0700 (PDT)
Date: Mon, 19 Jul 2021 12:22:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210719112202.4fvmn57ibgy3yesa@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210718211415.143709-1-marex@denx.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 18, 2021 at 11:14:15PM +0200, Marek Vasut wrote:
> If the backlight enable GPIO is configured as input, the driver currently
> unconditionally forces the GPIO to output-enable. This can cause backlight
> flicker on boot e.g. in case the GPIO should not be enabled before the PWM
> is configured and is correctly pulled low by external resistor.
> 
> Fix this by extending the current check to differentiate between backlight
> GPIO enable set as input and set as direction unknown. In case of input,
> read the GPIO value to determine the pull resistor placement, set the GPIO
> as output, and drive that exact value it was pulled to. In case of unknown
> direction, retain previous behavior, that is set the GPIO as output-enable.
> 
> Fixes: 3698d7e7d221 ("backlight: pwm_bl: Avoid backlight flicker when probed from DT")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> NOTE: I think this whole auto-detection scheme should just be replaced by a
>       DT prop, because it is very fragile.

I have some sympathy for this view... although I think the boat has
already set sail.

However, on the basis of making things less fragile, I think the
underlying problem here is the assumption that it is safe to modify
enable_gpio before the driver has imposed state upon the PWM (this
assumption has always been made and, in addition to systems where the BL
has a phandle will also risks flicker problems on systems where
power_pwm_on_delay is not zero).

This patch does not change the assumption that we can configure the
GPIO before we modify the PWM state. This means it won't fix the problem
for cases there the pin is HiZ by default but whose GPIOD_ASIS state is
neither input nor output.

I wonder if it might be better to move the code to configure the
direction of enable_gpio out of the probe function and into
pwm_backlight_power_on():

	if (pb->enable_gpio) {
		if (gpiod_get_direction(pb->enable_gpio) != 0))
			gpiod_direction_output(pb->enable_gpio, 1);
		else
			gpiod_set_value_can_sleep(pb->enable_gpio, 1);
	}

By the time we reach this function the driver explicitly applies state
to the GPIO then we know what the value must be.


Daniel.

> ---
>  drivers/video/backlight/pwm_bl.c | 35 +++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index e48fded3e414..7ec992b722eb 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -445,7 +445,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  	struct device_node *node = pdev->dev.of_node;
>  	struct pwm_bl_data *pb;
>  	struct pwm_state state;
> -	unsigned int i;
> +	unsigned int i, dir, val;
>  	int ret;
>  
>  	if (!data) {
> @@ -487,16 +487,31 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  	}
>  
>  	/*
> -	 * If the GPIO is not known to be already configured as output, that
> -	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
> -	 * direction to output and set the GPIO as active.
> -	 * Do not force the GPIO to active when it was already output as it
> -	 * could cause backlight flickering or we would enable the backlight too
> -	 * early. Leave the decision of the initial backlight state for later.
> +	 * If the GPIO is not known to be already configured as output, then:
> +	 * - if the GPIO direction is input, read its current value to find out
> +	 *   whether the pin is pulled high or low (it is backlight control, so
> +	 *   it cannot be floating), change the direction to output and set the
> +	 *   GPIO such that it drives this strapped value.
> +	 *   Do not force the GPIO to state which is different than that to
> +	 *   which the GPIO was pulled to, this could cause backlight flicker
> +	 *   on boot e.g. in case the PWM is not ready yet.
> +	 * - if the GPIO direction is unknown, tahat is, if gpiod_get_direction
> +	 *   returns -EINVAL, change the direction to output and set the GPIO
> +	 *   as active.
> +	 *   Do not force the GPIO to active when it was already output as it
> +	 *   could cause backlight flickering or we would enable the backlight
> +	 *   too early. Leave the decision of the initial backlight state for
> +	 *   later.
>  	 */
> -	if (pb->enable_gpio &&
> -	    gpiod_get_direction(pb->enable_gpio) != 0)
> -		gpiod_direction_output(pb->enable_gpio, 1);
> +	if (pb->enable_gpio) {
> +		dir = gpiod_get_direction(pb->enable_gpio);
> +		if (dir != 0) {
> +			val = 1;
> +			if (dir == 1)
> +				val = gpiod_get_value_cansleep(pb->enable_gpio);
> +			gpiod_direction_output(pb->enable_gpio, val);
> +		}
> +	}
>  
>  	pb->power_supply = devm_regulator_get(&pdev->dev, "power");
>  	if (IS_ERR(pb->power_supply)) {
> -- 
> 2.30.2
> 
