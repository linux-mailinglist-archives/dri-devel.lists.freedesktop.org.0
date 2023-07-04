Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A87474B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34C10E1A9;
	Tue,  4 Jul 2023 15:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A77310E1A9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso6265252f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482992; x=1691074992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EcaXmJ0ZrICymslbk6PHQsJRg8vS8+RojA0LAwyT/zQ=;
 b=KouPo65iu0hK7fuVBBpGDmUPRt2tU/GtFDp4hNAhFyjGhVMSOnJO3v6UetUjJ/p6pN
 N8SQknxPbCQOi66PLf7HcR5rUk41b3iuIwxQxNbtNXOqNFljVaaYzrqHRE/72sEhfIPM
 w5BUNfb19B9J+TNm12rbC8YqvK+khMGgHMxXq+5vjRVdGA7cCtuuyJYHA1UuJuIIAI3M
 D5Afj5+LBOeCDk2+TNC53DYEYHk3VXgtWQqAM4rcOZgCWGp24zcOk7P9qUgsG7Bq/Cv3
 xIlgpdiKy+I3gRN7OOKSAThu3oVLP/QMr4VVZrdYJWu7zargCQEIZ25aCQ275/O3Njct
 wELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482992; x=1691074992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcaXmJ0ZrICymslbk6PHQsJRg8vS8+RojA0LAwyT/zQ=;
 b=VuIAM0xZ6LT9d71oeL30v3XbzyRBnQjItk7yyvU1bdPOZ8ilwvIVCcpP9M+0wcGoaT
 TVz6ueZD44rUiknAKbjmGSs/XY3beJlrEYMFzTEzXb2aps2Zvongi6P40hnjHX4oSho+
 taa9KWEOvS++YcWgEzISw1wZYIfmsJ16Q3yIGtAjgG5UzbbryHuXP/DC7jEit6gbiK14
 TQHgRf5L8arBZiBSlT6xqOoRxtlmdlZyPe3763JWd2zBapSiCl1GHzcIt+fouaQbguZI
 LQgHqgBhl6FgCdVaSyLkJ2mmpF77/oafy1tB1LfHLjSGZSxai5WA7IhqiQEGVaBoougg
 89AA==
X-Gm-Message-State: ABy/qLb4qoZ1SMh7cAebIQyQXHbKLqTAaKKiHm/jUo0TTC1iouadTw8v
 111cBbOyU0KLyHroRufDbWpudw==
X-Google-Smtp-Source: APBJJlFlpjmrGdYueJJZlk/MoDzzq+L7FJYJ5eNl3AHPcCI5YjZgfpfSpd50V3Uqhy3K7ai28M4Z/Q==
X-Received: by 2002:a5d:6850:0:b0:313:eb4d:6a0e with SMTP id
 o16-20020a5d6850000000b00313eb4d6a0emr11332569wrw.9.1688482992243; 
 Tue, 04 Jul 2023 08:03:12 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a5d54c2000000b003142439c7bcsm11555831wrv.80.2023.07.04.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:11 -0700 (PDT)
Date: Tue, 4 Jul 2023 16:03:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230704150310.GA385243@aspen.lan>
References: <20230704140750.25799-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704140750.25799-1-mans@mansr.com>
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
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 03:07:50PM +0100, Mans Rullgard wrote:
> The condition for the initial power state based on the default
> brightness value is reversed.  Fix it.
>
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  drivers/video/backlight/led_bl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 3259292fda76..28e83618a296 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = priv->max_brightness;
>  	props.brightness = priv->default_brightness;
> -	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> -		      FB_BLANK_UNBLANK;
> +	props.power = (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
> +		      FB_BLANK_POWERDOWN;

The logic was wrong before but I think will still be wrong after the
change too (e.g. the bogus logic is probably avoiding backlight flicker
in some use cases).

The logic here needs to be similar to what pwm_bl.c implements in
pwm_backlight_initial_power_state(). Whilst it might be better
to implement this in led_bl_get_leds() let me show what I mean
in code that fits in the current line:

	/*
	 * Activate the backlight if the LEDs are already lit *or*
	 * there is no phandle link (meaning the backlight power
	 * state cannot be synced with the display state).
	 */
	props.power = (active_at_boot || !dev->node->phandle) ?
			FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;

Note that active_at_boot is not the same as (priv->default_brightness > 0)
since the value read by led_bl_get_leds() can be clobbered when we
parse the properties.


Daniel.
