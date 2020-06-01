Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15581EA1EB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188B46E22A;
	Mon,  1 Jun 2020 10:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E62B6E22A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:35:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j10so10936083wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3yMprJOB6nqOhrN9jr1CF0yapMmZvuaPTqFeKcrw+2Y=;
 b=fsw1L05Qz/4FDV8NzCwmgd24FTeN28K+QoS34P7sLlUDVcWvQzTF46QJ8D54tpZ+pK
 Zqru6wXiRVK45evrX8qENtf06g41rzGGo/nZeEobKUEe30CKm8I7EU4CbGx/ZEhbpRvR
 bnw7PX2ghTL7/gm7A3+DKDOCuFuxMWaKILZpTbWFeCrKIbr/hSd9LkAdZAcKb+l29KI9
 AQ6s7mglmQKCN6Us6VPNjmp8KvzLsRSMOMvO96k4bjlyfTc2VFdd7EJwbr4fTeunD47s
 5rVP4836MSuKRtKApwBdvlfDrWXWbgvbffz7Ntxi5Fehbr1btqKhIIdhHxMB9HRA51i+
 KspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3yMprJOB6nqOhrN9jr1CF0yapMmZvuaPTqFeKcrw+2Y=;
 b=EZUQWPvP89nMj0w/mgtT+XWmbNINsR/2RJsiSp5gmr8y+S+//fUFGDDp2NrtFTaeFJ
 ke7Xuqd8GOSH4qZHZaSfTH+UfGJUDvk3aD36B0Y10XY6Bck8+MhT4aKwdVpPpmdxqgSs
 EDjJMYP5/81VQwZevO8CQ7buWr9M1uaM2KbljdB779wMvmxKCYgpkYzjg2/tm2ro7iax
 NsTKXwe/2bFtdYqNCWPlZzPhSpBqWo1dKG8PG0mpZ5VokND8Y+nb5ksAqunNQ4vf1oF/
 W/WlEhXK5XhekGK/qR0h+ZwnDRUaFEGf5chPPjEgSQHpA5G8BU2K//OLgHCpHg8aPC7J
 Zbcg==
X-Gm-Message-State: AOAM531OhuRow3sXyI6naJk0eK+MwnGDvbKWJh+DbEhQ/t/nDK3ItcRs
 f8DQpERtSQBvZsOTcidQKUpYcg==
X-Google-Smtp-Source: ABdhPJz1z5Xyl0EPe0FMzDrgOajVzdCQh/7ByOZrzFwdH9HFfHFURa8zQ834mH8R2xVkmWzkakVlyw==
X-Received: by 2002:a5d:4390:: with SMTP id i16mr20377364wrq.186.1591007727070; 
 Mon, 01 Jun 2020 03:35:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i10sm4557577wrw.51.2020.06.01.03.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 03:35:26 -0700 (PDT)
Date: Mon, 1 Jun 2020 11:35:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 12/13] backlight: as3711_bl: introduce
 backlight_is_blank()
Message-ID: <20200601103524.7s6523ijpfqcolrm@holly.lan>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <20200601065207.492614-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601065207.492614-13-sam@ravnborg.org>
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

On Mon, Jun 01, 2020 at 08:52:06AM +0200, Sam Ravnborg wrote:
> Replaces the open-coded checks of the state, with the
> backlight_is_blank() helper. This increases readability
> of the code and aling the functionality across the drivers.
> 
> Futhermore drop the debug prints in update_status().
> If we need debug printing then we can add it to the backlight core.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/video/backlight/as3711_bl.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
> index 33f0f0f2e8b3..cc5628beaffd 100644
> --- a/drivers/video/backlight/as3711_bl.c
> +++ b/drivers/video/backlight/as3711_bl.c
> @@ -107,13 +107,7 @@ static int as3711_bl_update_status(struct backlight_device *bl)
>  	int brightness = bl->props.brightness;
>  	int ret = 0;
>  
> -	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
> -		__func__, bl->props.brightness, bl->props.power,
> -		bl->props.fb_blank, bl->props.state);
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(bl))
>  		brightness = 0;
>  
>  	if (data->type == AS3711_BL_SU1) {
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
