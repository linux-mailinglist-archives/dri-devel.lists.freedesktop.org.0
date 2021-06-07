Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53D39DAD4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 13:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDF46E8A3;
	Mon,  7 Jun 2021 11:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296F6E8A3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 11:11:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y7so12490273wrh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CkczDQTx7sA6Eb4aOUQqT7ftbLrt+PlWKIe5W6K0DH4=;
 b=JdKI0Ij56uOiQC3paKRrGTjeNURxrjLogWcxiWty1nxGmmvbmV0DU9XxEWQfdKIBUN
 oVKVpGWxwdRIFe4omIHlG+yuDnyCQzjDdtrmzb+uVALF9wKr45O6HwZWSQrzISZhksHI
 j9Iy/uoPYnWHaJlp5R9rbyQkb7xcsOodhFtzqQaUh1PJOykQ4ZjhJV9hEY1u7Vo8M8U4
 NuX+P3cjR5Y4zArdagnX8o+JnzQyO+OimBrw0HSxs0Cm36ypzQPoSe0C0dhz9xvRacSo
 4Bcz9+xKeS+X3OBd43yOd0gbLR6532i2Lg5GOdRxW5beF9waDWwIo/VwkkP+DUpPdeev
 omyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CkczDQTx7sA6Eb4aOUQqT7ftbLrt+PlWKIe5W6K0DH4=;
 b=hLJaaxFQkl8RRBxO68VAzsXdCHC/3QKLtrbbHOBm+MAgaKgPfFYV/MjNbxAAG2jxSg
 kdS0uFD9dJRPXTY+sDmKWnpFar9Gm3wqM+n17TZn2jBu8yylBWTuasvIgEST1PUYZhoN
 hp7A3J/tQwoxed0NaLVIDaCGcWyzevPgOz3ETkEiIen6t0V0lAODSv/n+HEhiQiZbb21
 mr9+FK9qpdIAZ0JKEsV5o20OSwlxU+Rkfdy40BziNrt5KMOhCzeDon5HKRm0IxPLZ7Ej
 NicdPEglAxEjDP+XOT5FdrnXmOJEB+wSqEjTig+h27ALoY0btQIOfD06qfbszVLHaKKu
 BEOA==
X-Gm-Message-State: AOAM530x0r40JnWOeiO+XuujjvCxJyyeq5gQFNvXdwIeVW7Gc5jS7ENy
 bjMEQNlyra8q+2LO03dKDwl/zg==
X-Google-Smtp-Source: ABdhPJzx6u6AGAxmW2P69GjKgCYsgvss9Aet/+mV9NMH6cpXr5pUHLFnSBFqobRncWwRsS55gtggog==
X-Received: by 2002:a5d:5243:: with SMTP id k3mr16794577wrc.19.1623064297013; 
 Mon, 07 Jun 2021 04:11:37 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id 32sm17125659wrs.5.2021.06.07.04.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 04:11:36 -0700 (PDT)
Date: Mon, 7 Jun 2021 12:11:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: ktd253: Stabilize backlight
Message-ID: <20210607111135.n7rsxokvifrplkux@maple.lan>
References: <20210604063201.3235245-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604063201.3235245-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, newbyte@disroot.org,
 Lee Jones <lee.jones@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 08:32:01AM +0200, Linus Walleij wrote:
> Remove interrupt disablement during backlight setting. It is
> way to dangerous and makes platforms instable by having it
> miss vblank IRQs leading to the graphics derailing.
> 
> The code is using ndelay() which is not available on
> platforms such as ARM and will result in 32 * udelay(1)
> which is substantial.
> 
> Add some code to detect if an interrupt occurs during the
> tight loop and in that case just redo it from the top.
> 
> Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Reported-by: newbyte@disroot.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
> ChangeLog v2->v3:
> - Read my own patch and realized a bug: when we get a timeout
>   we bounce back to max period, but still count down the pwm
>   with one leading to an off-by-one error. Fix it by extending
>   some else clauses.
> ChangeLog v1->v2:
> - Alter the dimming code to check for how many ns the pulse
>   is low, and if it gets to ~100 us then redo from start.
>   This is to account for the advent that an IRQ arrives while
>   setting backlight and hits the low pulse making it way
>   too long.
> ---
>  drivers/video/backlight/ktd253-backlight.c | 75 ++++++++++++++++------
>  1 file changed, 55 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
> index a7df5bcca9da..37aa5a669530 100644
> --- a/drivers/video/backlight/ktd253-backlight.c
> +++ b/drivers/video/backlight/ktd253-backlight.c
> @@ -25,6 +25,7 @@
>  
>  #define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
>  #define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
> +#define KTD253_T_OFF_CRIT_NS 100000 /* 100 us, now it doesn't look good */
>  #define KTD253_T_OFF_MS 3
>  
>  struct ktd253_backlight {
> @@ -34,13 +35,50 @@ struct ktd253_backlight {
>  	u16 ratio;
>  };
>  
> +static void ktd253_backlight_set_max_ratio(struct ktd253_backlight *ktd253)
> +{
> +	gpiod_set_value_cansleep(ktd253->gpiod, 1);
> +	ndelay(KTD253_T_HIGH_NS);
> +	/* We always fall back to this when we power on */
> +}
> +
> +static int ktd253_backlight_stepdown(struct ktd253_backlight *ktd253)
> +{
> +	/*
> +	 * These GPIO operations absolutely can NOT sleep so no _cansleep
> +	 * suffixes, and no using GPIO expanders on slow buses for this!
> +	 *
> +	 * The maximum number of cycles of the loop is 32  so the time taken
> +	 * should nominally be:
> +	 * (T_LOW_NS + T_HIGH_NS + loop_time) * 32
> +	 *
> +	 * Architectures do not always support ndelay() and we will get a few us
> +	 * instead. If we get to a critical time limit an interrupt has likely
> +	 * occured in the low part of the loop and we need to restart from the
> +	 * top so we have the backlight in a known state.
> +	 */
> +	u64 ns;
> +
> +	ns = ktime_get_ns();
> +	gpiod_set_value(ktd253->gpiod, 0);
> +	ndelay(KTD253_T_LOW_NS);
> +	gpiod_set_value(ktd253->gpiod, 1);
> +	ns = ktime_get_ns() - ns;
> +	if (ns >= KTD253_T_OFF_CRIT_NS) {
> +		dev_err(ktd253->dev, "PCM on backlight took too long (%llu ns)\n", ns);
> +		return -EAGAIN;
> +	}
> +	ndelay(KTD253_T_HIGH_NS);
> +	return 0;
> +}
> +
>  static int ktd253_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct ktd253_backlight *ktd253 = bl_get_data(bl);
>  	int brightness = backlight_get_brightness(bl);
>  	u16 target_ratio;
>  	u16 current_ratio = ktd253->ratio;
> -	unsigned long flags;
> +	int ret;
>  
>  	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
>  
> @@ -62,37 +100,34 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
>  	}
>  
>  	if (current_ratio == 0) {
> -		gpiod_set_value_cansleep(ktd253->gpiod, 1);
> -		ndelay(KTD253_T_HIGH_NS);
> -		/* We always fall back to this when we power on */
> +		ktd253_backlight_set_max_ratio(ktd253);
>  		current_ratio = KTD253_MAX_RATIO;
>  	}
>  
> -	/*
> -	 * WARNING:
> -	 * The loop to set the correct current level is performed
> -	 * with interrupts disabled as it is timing critical.
> -	 * The maximum number of cycles of the loop is 32
> -	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
> -	 */
> -	local_irq_save(flags);
>  	while (current_ratio != target_ratio) {
>  		/*
>  		 * These GPIO operations absolutely can NOT sleep so no
>  		 * _cansleep suffixes, and no using GPIO expanders on
>  		 * slow buses for this!
>  		 */
> -		gpiod_set_value(ktd253->gpiod, 0);
> -		ndelay(KTD253_T_LOW_NS);
> -		gpiod_set_value(ktd253->gpiod, 1);
> -		ndelay(KTD253_T_HIGH_NS);
> -		/* After 1/32 we loop back to 32/32 */
> -		if (current_ratio == KTD253_MIN_RATIO)
> +		ret = ktd253_backlight_stepdown(ktd253);
> +		if (ret == -EAGAIN) {
> +			/*
> +			 * Something disturbed the backlight setting code when
> +			 * running so we need to bring the PWM back to a known
> +			 * state. This shouldn't happen too much.
> +			 */
> +			gpiod_set_value_cansleep(ktd253->gpiod, 0);
> +			msleep(KTD253_T_OFF_MS);
> +			ktd253_backlight_set_max_ratio(ktd253);
> +			current_ratio = KTD253_MAX_RATIO;
> +		} else if (current_ratio == KTD253_MIN_RATIO) {
> +			/* After 1/32 we loop back to 32/32 */
>  			current_ratio = KTD253_MAX_RATIO;
> -		else
> +		} else {
>  			current_ratio--;
> +		}
>  	}
> -	local_irq_restore(flags);
>  	ktd253->ratio = current_ratio;
>  
>  	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
> -- 
> 2.31.1
> 
