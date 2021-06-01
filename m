Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28264396F06
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 10:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E106E990;
	Tue,  1 Jun 2021 08:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527B6E990
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 08:35:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so986154wmk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=exqhHDB9OWwzPgQNBo/nfEe3b0GTN3OiWqDlKeYLWp4=;
 b=mXuDKvO6bXBk7T2JmxneEl9rq47krazgEEbzwQNZoSuRkSIiqKfaMoDDZ2vHxjXwaY
 IDJl/LODuiYBj1TuX3CEsArYILhwv8SPnACtWKKhzWrfNyiQZz3kL646MdCQlEWX9l5l
 LtailsD3u87D7DdyHLEXmEen73QeNoYd0SIOzna/9cyRQA/pCTwixnMhS7+zNzm2gRPE
 PKL5MGcmSpTiUas1pRBKS4XRl5bxg3qzKFGzqcbg1c6X3Iq/Qalve60jsI7Z1IcYuSyV
 iIcmIJwxfMHAF4wLXgFuTqYfuKf0rkesHYfwTYbrFrGOyP4mvGJ5gEyffo786f2RM1Kp
 PvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=exqhHDB9OWwzPgQNBo/nfEe3b0GTN3OiWqDlKeYLWp4=;
 b=J2+4lWZUDgyaTRHzrwqGP+z3ljIYzLTeRxmYusfpdSk6OoJVNaFLkHtxDRfBO9ljGL
 j2cO0xNYOeA3fY/vxraGKXmc6HY5EjDx/HAron8UQvYhfU3emJoaiXTGVFxeZ/WYknS7
 5HlbE3pf7jCki06BjrD6+MoWI/elm6373dV0yyvkrNdA4S1jap0bEOhYCvUib+3+TnZU
 3BNB3/VwVFFOpyVClBXpDG4kRIYev2Pm0GfoyfeorlF4yxNYWLKQAO1Di+t9Cg1PDznT
 aUTi/iJpA7Jei9R255oUHotrjG2lcBVHvwyy7SmqWXypMK64nF/DNN83qdCcuq/OpNM+
 Gy3w==
X-Gm-Message-State: AOAM532f66oLtYGM5ICcR/4IH4mt1ypTnjRYBEiE0UFZI7a4ET2EdJo3
 zk9uVMnTNa7l6/4BA32IdMei/A==
X-Google-Smtp-Source: ABdhPJyQb1pkiKbmg2hfmvO018+KRwd+wXWlJmJFUKLMKl4gTZmQTZums/t3lY9OG3aUAbuiqtptjg==
X-Received: by 2002:a05:600c:243:: with SMTP id 3mr785928wmj.35.1622536533550; 
 Tue, 01 Jun 2021 01:35:33 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b8sm2361875wrx.15.2021.06.01.01.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 01:35:32 -0700 (PDT)
Date: Tue, 1 Jun 2021 09:35:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: ktd253: Stabilize backlight
Message-ID: <20210601083531.ed6d4h3fcikbqmnw@maple.lan>
References: <20210530194238.2172318-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530194238.2172318-1-linus.walleij@linaro.org>
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

On Sun, May 30, 2021 at 09:42:38PM +0200, Linus Walleij wrote:
> Remove interrupt disablement during backlight setting. It is
> way to dangerous and makes platforms instable by having it
> miss vblank IRQs leading to the graphics derailing.
> 
> The code is using ndelay() which is not available on
> platforms such as ARM and will result in 32 * udelay(1)
> which is substantial.
> 
> Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Reported-by: newbyte@disroot.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/video/backlight/ktd253-backlight.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
> index a7df5bcca9da..b79a47c2801f 100644
> --- a/drivers/video/backlight/ktd253-backlight.c
> +++ b/drivers/video/backlight/ktd253-backlight.c
> @@ -40,7 +40,6 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
>  	int brightness = backlight_get_brightness(bl);
>  	u16 target_ratio;
>  	u16 current_ratio = ktd253->ratio;
> -	unsigned long flags;
>  
>  	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
>  
> @@ -69,13 +68,9 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
>  	}
>  
>  	/*
> -	 * WARNING:
> -	 * The loop to set the correct current level is performed
> -	 * with interrupts disabled as it is timing critical.
>  	 * The maximum number of cycles of the loop is 32
>  	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
>  	 */
> -	local_irq_save(flags);
>  	while (current_ratio != target_ratio) {
>  		/*
>  		 * These GPIO operations absolutely can NOT sleep so no
> @@ -92,7 +87,6 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
>  		else
>  			current_ratio--;
>  	}
> -	local_irq_restore(flags);

IIUC if this code is prevented from progressing for 3ms or longer then
we risk deactivating the backlight instead of setting it. Does there need
to be a retrospective timeout check and recovery loop?


Daniel.


>  	ktd253->ratio = current_ratio;
>  
>  	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
> -- 
> 2.31.1
> 
