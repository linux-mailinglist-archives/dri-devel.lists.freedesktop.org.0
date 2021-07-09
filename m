Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6093C2286
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 13:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102216EA08;
	Fri,  9 Jul 2021 11:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689F96EA08
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 11:03:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so6018174wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yUs8PRqylG5pw2F+BSj/uHB4lBzrI+dmhEpI9HrKsag=;
 b=NYu6MKv1ag5T/qtvOwA/cfvzMKCB5yuwT5NiD6948QjCdLPrGjv0KsU4OvGQV67iP/
 a/AHnu7lGmAKDDtYJMcjn9n6LBofnmB0biDO529GkiieIDco/Ik80e2BjJNc4zack0+X
 ViAtQMG+4IDkQGuWEQ3/K0k2ehkLa/SQEIxxK/RFugV0cCM4T9AhKFEzG8kDTk9TflnD
 fhyOvykMho/pOxVI+Gatlsj4yypkMMyGqujiHDaLqPaIXSEE+hAvI99TomM9PymBjVcT
 faVdx8Bh1QbOhcSv1RNKlBmnRXcblW67iM/jObcqLHHOi4iYQtXXHeyJN8DbjoJbJkA7
 mf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yUs8PRqylG5pw2F+BSj/uHB4lBzrI+dmhEpI9HrKsag=;
 b=HFcH41AcAdh0aXkMRZioq9nPwiFlG2CdiANon+bFn473bgfwJHRI5o9EGvON4CqsUK
 ocQlYdUrWsDzu6l35rdqQ0Enh/rAgRRMzxaBcbrUVUnzTW5FWPpOQhaXUH78DLPXqq00
 nzncZfNx/7aJTwoBsva/FEJlol1NM4C6RiOYcaw/KijTQLOBbDDyX5UH4hFS1vanlG2K
 0a1xSypThTSI/4Xd4L4PXQFCBpobrIALaCWU190ZuqWVSRvVMehY9+n37DrcjtFlLKW/
 sbCe2695X32gpab2GHTJJvvC44iEIA5Eid+W6HK8dVAo0lypaK0HXMuGgc0J7p5etFZi
 SMBg==
X-Gm-Message-State: AOAM530H+SBJ9HK1J51nr5HOY8WHMoJbqhge+6xhg9pTmWZr0h24IfZh
 S7zH5iK90ABEZvTtBZEqV25SyQ==
X-Google-Smtp-Source: ABdhPJyZQQZc0WhhxvN/Ijm638MsRc29LHo+mO3AHTNG3zDfdq5v1bDjYbFsAwqY6Suc0lXW4MlnuQ==
X-Received: by 2002:a1c:7ec3:: with SMTP id z186mr38687689wmc.83.1625828598023; 
 Fri, 09 Jul 2021 04:03:18 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v206sm4176653wmg.37.2021.07.09.04.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 04:03:17 -0700 (PDT)
Date: Fri, 9 Jul 2021 12:03:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] video: backlight: Only set maximum brightness for
 gpio-backlight
Message-ID: <20210709110315.vv5hbngg26o4vj63@maple.lan>
References: <20210708091058.56317-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708091058.56317-1-marex@denx.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sean Paul <seanpaul@chromium.org>,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 08, 2021 at 11:10:58AM +0200, Marek Vasut wrote:
> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> in backlight.c") says that gpio-backlight uses brightness as power state.
> Other backlight drivers do not, so limit this workaround to gpio-backlight.
> 
> This fixes the case where e.g. pwm-backlight can perfectly well be set to
> brightness 0 on boot in DT, which without this patch leads to the display
> brightness to be max instead of off.
> 
> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>

I have to admit that this patch really does makes it clear just how
nasty the hack in of_find_backlight() currently is.

Moreover I think it is also be obsolete. gpio-backlight power mode
handling was pretty broken when this code was introduced. It was fixed
in 2019 by ec665b756e6f ("backlight: gpio backlight: Correct initial
power state handling") by trying to match the behaviour of PWM
backlight.  The new code always sets the brightness to 1 so I think we
can just remove the hack from of_find_backlight() since I think it is
unreachable.


Daniel.



> ---
>  drivers/video/backlight/backlight.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad7..dfb66171dec41 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -676,6 +676,7 @@ EXPORT_SYMBOL(of_find_backlight_by_node);
>  static struct backlight_device *of_find_backlight(struct device *dev)
>  {
>  	struct backlight_device *bd = NULL;
> +	bool is_gpio_backlight = false;
>  	struct device_node *np;
>  
>  	if (!dev)
> @@ -685,6 +686,8 @@ static struct backlight_device *of_find_backlight(struct device *dev)
>  		np = of_parse_phandle(dev->of_node, "backlight", 0);
>  		if (np) {
>  			bd = of_find_backlight_by_node(np);
> +			is_gpio_backlight =
> +				of_device_is_compatible(np, "gpio-backlight");
>  			of_node_put(np);
>  			if (!bd)
>  				return ERR_PTR(-EPROBE_DEFER);
> @@ -692,7 +695,7 @@ static struct backlight_device *of_find_backlight(struct device *dev)
>  			 * Note: gpio_backlight uses brightness as
>  			 * power state during probe
>  			 */
> -			if (!bd->props.brightness)
> +			if (is_gpio_backlight && !bd->props.brightness)
>  				bd->props.brightness = bd->props.max_brightness;
>  		}
>  	}
> -- 
> 2.30.2
