Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB6218587
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798816E05A;
	Wed,  8 Jul 2020 11:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B446E05A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:06:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so48502534wrv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 04:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ImpRCPSvgLqMxrUg0iAeiMjdkq4+obVp/Tu68Rhv9qc=;
 b=dzg63SjeULrmJhDxL8oKzRPZhWxj3EwrGLCJkdfVGWK3+eDZAcBkKKcNi7FhyOsJmR
 R0bT/qSyr/oLnAnTpD7VGWPScsbm6+Tvu71v7v+YL3pHIZnJEH3A1gD7B9DPbkjQ9wPR
 ZzcMGiVya0YZHlGZ40/3T/tYDZLcEWW24sHvnyFrbnuxX379TdFv3OYzLjnU2h2OUCnx
 0l0Y3bkv27deB8KlLWt6wUsz/Nd9Ts5UL+ztgChIt2H7ws+el4VzasVuk0iibQnmX8aZ
 gcYagZ/ED1P+e07pyBdGwMf34U6BPCJvlmQknI7bsFa08ARh+Jtyxbm8EtYa4x9+npH2
 EPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ImpRCPSvgLqMxrUg0iAeiMjdkq4+obVp/Tu68Rhv9qc=;
 b=EizbyNOfAWI5iKhMRGba9hGcIrVThUKQcRf3oFNKzNtwfOexQIb+StBr/m1gUvlAxm
 fQAa1D3b7Lq7DeFjtt5teY8dzOkI9V19RP1RiSbH15CEmED9IZux0bFv9cfk/R3iib0L
 1O2hOHGLPEZmhEtTNgxXMrAwhXyQBl0xCSqeutGyQo72obHUPCBJ2SLystnMoJocUlUh
 JSd2iq8ZzCbIWOVI9AWtHc7A+0Af5o5JPUI8yaTxJJlpFos4hCLIUFdi3OGQIn2BozsJ
 HXUc5dFoP+8TlVhmt4VFy+G2/fi4ZuRURHa3Jh/Ks5gCoZ2e5s4OaHxzCYw7AccaQK9d
 /6Mg==
X-Gm-Message-State: AOAM531/vZEISJZFlovfS5hrNoxgjolbkGQOD7W9H0Sy7o7ABMVf5iFf
 oTKj0W1t/qnUqCCqfluQUBgVrxeu4HY=
X-Google-Smtp-Source: ABdhPJxi7daTZkwF42cpVndoj6tcyAW+kTFLSAwZxlk89Uel0hIhqGsVN4LZGU6LdRiIBXikdzafbw==
X-Received: by 2002:adf:c542:: with SMTP id s2mr31759067wrf.132.1594206390255; 
 Wed, 08 Jul 2020 04:06:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c25sm5221919wml.46.2020.07.08.04.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 04:06:29 -0700 (PDT)
Date: Wed, 8 Jul 2020 12:06:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 14/20] backlight: cr_bllcd: introduce
 backlight_is_blank()
Message-ID: <20200708110627.z5ofexh4llk66jey@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-15-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:40PM +0200, Sam Ravnborg wrote:
> The cr_bllcd uses the FB_BLANK states as brightness.
> This results in brightness value equals 0 that turn on
> the display and 4 that turn off the display.

max_brightness is 0 which makes it impossible to set the brightness to
4.


> Simplify the logic but keep current behaviour
> as userspace may expect brightness set to 0 to turn on the display.

I don't deny the possibility but we'd be talking about a userspace
custom enough to explicitly configure the module loader (otherwise
the module wouldn't load and the backlight would be inherited from
the BIOS) and that also contains an explicit write to the brightness
property that sets it to what is already the default (and only
possible) value.

In other words I'm very sceptical such a userspace exists and would be
happy to see this driver modified to use the new helpers and behave
like gpio-backlight (which can be regarded as our reference 1-bit
backlight driver).


Daniel.

> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/cr_bllcd.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
> index 4624b7b7c6a6..edca5fee9689 100644
> --- a/drivers/video/backlight/cr_bllcd.c
> +++ b/drivers/video/backlight/cr_bllcd.c
> @@ -63,22 +63,16 @@ static int cr_backlight_set_intensity(struct backlight_device *bd)
>  	u32 addr = gpio_bar + CRVML_PANEL_PORT;
>  	u32 cur = inl(addr);
>  
> -	if (bd->props.power == FB_BLANK_UNBLANK)
> -		intensity = FB_BLANK_UNBLANK;
> -	if (bd->props.fb_blank == FB_BLANK_UNBLANK)
> -		intensity = FB_BLANK_UNBLANK;
> -	if (bd->props.power == FB_BLANK_POWERDOWN)
> -		intensity = FB_BLANK_POWERDOWN;
> -	if (bd->props.fb_blank == FB_BLANK_POWERDOWN)
> +	if (backlight_is_blank(bd))
>  		intensity = FB_BLANK_POWERDOWN;
>  
> -	if (intensity == FB_BLANK_UNBLANK) { /* FULL ON */
> +	if (intensity != FB_BLANK_POWERDOWN) { /* FULL ON */
>  		cur &= ~CRVML_BACKLIGHT_OFF;
>  		outl(cur, addr);
> -	} else if (intensity == FB_BLANK_POWERDOWN) { /* OFF */
> +	} else { /* OFF */
>  		cur |= CRVML_BACKLIGHT_OFF;
>  		outl(cur, addr);
> -	} /* anything else, don't bother */
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
