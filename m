Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D11D7F56
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168E989F5B;
	Mon, 18 May 2020 16:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9B889F5B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:56:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so12755391wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MI77nvduHcUEFR5h39BzcKEVaiC5rMh/0ylmJoyI1Vs=;
 b=VZWgVl1KvLlwIX3XrdZCLQKZkHIivxsfSRdtvNdwsNHbcFWc6qkNFzGAeOfVdkNGrB
 gBTfikOmQSYAmSgWGrNmf8zRL2dRv6gxWDmFkamshug52waAMtbKNUVit0mPUztiO/T1
 Z1q2ICpInHqTjREWBgA3ftowAVaBHv+Y0nuyfMeXxMMdV936xkeJrQ/W1Glq3M+ycr9v
 DW9yMc993zWeKmuhy/+KPCe/vS9+nEtpKrj7lIBnN30QTMJxZwtVpIelAepMmxdklyod
 6Zpt5t9HANOq56zupfI2xqR1byQevmWR74fEZH3TynfwILGrXcIhzS5D8cumOAjEWSL2
 A6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MI77nvduHcUEFR5h39BzcKEVaiC5rMh/0ylmJoyI1Vs=;
 b=HUqvCe3nnBwXjxuDL6+TJFWgsHqReO3XWPhvV5LPc+QlxoQhaTordy2/C/S+rs9Phy
 1BbVbSsYaqO6pdkM5rlS1Of4W1jj374cs8jyN/yqRgR4Rk7Y3J1AeKY5dnclizUWabpp
 maN3EaNS4N2glHyh/g4eh2zDPS3gEUvJg6SuWFMeY7sIjHhaadPHXpkppTDPbQ/upS6z
 Hz2fo/0X00NxPTAjqxHxA4o2M/lP1KOYwl16aFthOAmtdEN+YpvACBuzINkYb7eHB6XL
 pWrqU3YeHwH01NOLLsndfTYOkaePF8EcjmtlHmDAIvFEwx6kdt9za9r47KANkwtEkSJP
 Jg9A==
X-Gm-Message-State: AOAM531XHSLwWEajeCGgIvSJbB5SpaYyGvzMg8WSffR/RNpj4yrqj68s
 3CdWN3RRSCiviW2cQMHGmjeFUg==
X-Google-Smtp-Source: ABdhPJwsLOgKVS1hifBRbXRWcQPAiQ+mQn9zlFvWVEvr1FCeXG5OKvyMJpSPopHmvFfle26BUkevGw==
X-Received: by 2002:adf:e688:: with SMTP id r8mr20448984wrm.274.1589821011478; 
 Mon, 18 May 2020 09:56:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c140sm213453wmd.18.2020.05.18.09.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:56:50 -0700 (PDT)
Date: Mon, 18 May 2020 17:56:48 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/16] backlight: make of_find_backlight_by_node()
 static
Message-ID: <20200518165648.ltgtofjsteyyse4j@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-16-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:38PM +0200, Sam Ravnborg wrote:
> There are no external users of of_find_backlight_by_node().
> Make it static so we keep it that way.
> 
> v2:
>   - drop EXPORT of of_find_backlight_by_node
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Assuming the 0day-ci comments are because some of the patches have
already been sucked up in a different tree then:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/backlight.c | 23 +++++++++--------------
>  include/linux/backlight.h           | 10 ----------
>  2 files changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 7f3eecaf8317..3fa29330a820 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -627,19 +627,9 @@ static int of_parent_match(struct device *dev, const void *data)
>  	return dev->parent && dev->parent->of_node == data;
>  }
>  
> -/**
> - * of_find_backlight_by_node() - find backlight device by device-tree node
> - * @node: device-tree node of the backlight device
> - *
> - * Returns a pointer to the backlight device corresponding to the given DT
> - * node or NULL if no such backlight device exists or if the device hasn't
> - * been probed yet.
> - *
> - * This function obtains a reference on the backlight device and it is the
> - * caller's responsibility to drop the reference by calling put_device() on
> - * the backlight device's .dev field.
> - */
> -struct backlight_device *of_find_backlight_by_node(struct device_node *node)
> +/* Find backlight device by device-tree node */
> +static struct backlight_device *
> +of_find_backlight_by_node(struct device_node *node)
>  {
>  	struct device *dev;
>  
> @@ -647,7 +637,12 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
>  
>  	return dev ? to_backlight_device(dev) : NULL;
>  }
> -EXPORT_SYMBOL(of_find_backlight_by_node);
> +#else
> +static struct backlight_device *
> +of_find_backlight_by_node(struct device_node *node)
> +{
> +	return NULL;
> +}
>  #endif
>  
>  static struct backlight_device *of_find_backlight(struct device *dev)
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index d92e523650ec..1e29ab43f4f6 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -473,16 +473,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
>  	return dev_get_drvdata(&bl_dev->dev);
>  }
>  
> -#ifdef CONFIG_OF
> -struct backlight_device *of_find_backlight_by_node(struct device_node *node);
> -#else
> -static inline struct backlight_device *
> -of_find_backlight_by_node(struct device_node *node)
> -{
> -	return NULL;
> -}
> -#endif
> -
>  #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  struct backlight_device *devm_of_find_backlight(struct device *dev);
>  #else
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
