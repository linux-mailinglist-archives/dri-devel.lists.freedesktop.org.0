Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD631D7F41
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4551B89F47;
	Mon, 18 May 2020 16:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EC989F47
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:53:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f134so224214wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JZljDjXdGvVcob0eXcjhvZ4PFqonlurPBCPzjrXqKZA=;
 b=hZzUaez0ovSogobBcHeVE3JqvDDeQMiT2oySUlSbDtmIyawYcpRbOxI8hmJl6s0c7y
 SMDE9ezNqr+N/9vHDKmKtscSIV3/46SmW1u6Vq++dUh+uhgOUuHX6Xj04Q3aVGrwaB5m
 iazdzARoDWGjOdFQArlRlraF18SoTNOim4fkNXz02bTpTJFWq05pigk2PHK4c1Y7ujnx
 l71NFbdDYj1OEGBd+ZaW3ES3Yxcyjj1cCXJf7RofcMVwCMaPoGKxjOXhIp3vvjlx8Pok
 5DsBbZ0E3vC9mwPJTNG/O57sHnsAYbhj+DxU62Dq0t1KXAYfdrvDIXb0PEw3ZP81v+7Y
 0ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JZljDjXdGvVcob0eXcjhvZ4PFqonlurPBCPzjrXqKZA=;
 b=Y91PtYqG7B40PtYGUdkA4Vj4CLgQw4AyMlWPkNa5ErCixHkqng2LiKeSz3vU9xoAFM
 Sq/FrOJNSdV9zZow8OMRiuZH6sSg70Rn3dnUhEgO/3KSoPuvCcmtpAT14UybDT+IMpY6
 ND9OjwW3H0y6c7ll7GTG8Y6TzZpYtb/7c2hxy0X72q3AscqWuyLpF6RSNH9pSdSWJ4sw
 ph2ddleaND8ff/W23L74bs18OVj+8/Hg4JQU4986QvbxzH7xHdgqsHoOxErvqnATyNUO
 hHjughYiAgD8NxTr1wPK8S1hdsYRWEUWZFHBzexK9MYKkBfS9F4v6Zlh5ZkVGe3v6FQW
 ya8A==
X-Gm-Message-State: AOAM533hPncidjbs5+t53t/AJeKQx6J3YL5tAbIMG4c5NRdR63rIoYWq
 dHu3kE15YXAY8XtEtE1EP8C2Og==
X-Google-Smtp-Source: ABdhPJwhRx8RRhwphNyGm2WHfgeB6JDjOUORJEh8rgps117/wjR+DQtjjESzr3UU9vVN/OuGBYL+hg==
X-Received: by 2002:a05:600c:147:: with SMTP id w7mr273163wmm.89.1589820833064; 
 Mon, 18 May 2020 09:53:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m23sm146314wmg.45.2020.05.18.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:53:52 -0700 (PDT)
Date: Mon, 18 May 2020 17:53:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 14/16] backlight: drop backlight_put()
Message-ID: <20200518165350.batfdp2tp4rvamzb@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-15-sam@ravnborg.org>
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
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 09:01:37PM +0200, Sam Ravnborg wrote:
> There are no external users of backlight_put().
> Drop it and open code the two users in backlight.c.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/backlight.c |  7 +++++--
>  include/linux/backlight.h           | 10 ----------
>  2 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index e23b09d03a65..7f3eecaf8317 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -679,7 +679,10 @@ static struct backlight_device *of_find_backlight(struct device *dev)
>  
>  static void devm_backlight_release(void *data)
>  {
> -	backlight_put(data);
> +	struct backlight_device *bd = data;
> +
> +	if (bd)
> +		put_device(&bd->dev);
>  }
>  
>  /**
> @@ -707,7 +710,7 @@ struct backlight_device *devm_of_find_backlight(struct device *dev)
>  		return bd;
>  	ret = devm_add_action(dev, devm_backlight_release, bd);
>  	if (ret) {
> -		backlight_put(bd);
> +		put_device(&bd->dev);
>  		return ERR_PTR(ret);
>  	}
>  	return bd;
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 99e7cdace2be..d92e523650ec 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -415,16 +415,6 @@ static inline int backlight_disable(struct backlight_device *bd)
>  	return backlight_update_status(bd);
>  }
>  
> -/**
> - * backlight_put - Drop backlight reference
> - * @bd: the backlight device to put
> - */
> -static inline void backlight_put(struct backlight_device *bd)
> -{
> -	if (bd)
> -		put_device(&bd->dev);
> -}
> -
>  /**
>   * backlight_is_blank - Return true if display is expected to be blank
>   * @bd: the backlight device
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
