Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEED1D7E4B
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196C06E42D;
	Mon, 18 May 2020 16:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506926E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:22:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m12so135745wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h21pn6leaS0udA+6sZ78ZisTbB55GhG4Y4hXmjrbCNk=;
 b=jtq+ZxtjGw+wtB+PoQzf2Zy8k44Nvyst4cTaGBxSsLBiGNiFcdcwYCggaUNSXBTHbP
 C6xsjI4bHaWGTLU7uc45ahTni5fXJFj9fncUXM8sIJwXflk6HJO3GUczzmfXouSR+Q+A
 +BIYwtjcvefIcztkcvZfFJsPGXItC1IEoOL/Yz5oK8angtsjM1jVg+6nOPwtcb/0Ss/c
 ngKNRig/r38qSKmbIBBoMCzWvMayHMJ/cu/eDzQhPltuwHLrGHouCWx8Ge+U2NnNouo3
 Tv6KjvptIZ2Sd4TOC91xAkTRpKVAj+cHXvrhpvgkpOQLuzFhoRRngdKp30A2z0kRd5cE
 w3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h21pn6leaS0udA+6sZ78ZisTbB55GhG4Y4hXmjrbCNk=;
 b=Odh9SINe5QWKqoLkYXnLsCLTjRVp/77KaBn0tDfqzsEmNvArRQEzFVNhDlWCOuXFHC
 v7+PcK3oCE9KKWkvxsEFVDoTjP4fW004e0GPuIpZanvuGKhHL2hmF2crD19TP8RpvF3N
 gm49cKR5VtpohRAtYIn9tW1RNfMVa1pxW/cAg87ouLLkS4QIu+jlqICHkBHiYTFBDFJk
 OLcIo8cBmLt3Z3sQoQ87zBgI38J4AhQhuTpY/6GFPSbza+KBvwEpPrt3ptBC4oNxQYS5
 yu2lDQo10NShzm+H/cEoLAVNzBUoEQq/Jy0oLznKyvZAgN5rxlY4mSiUJAGQrykmDACW
 veyQ==
X-Gm-Message-State: AOAM531C6ehgp5xRs5qPnFWhn+UTskhStq03r4Cl21xP6+zYxLLoIfCF
 E8OTSFDrP8lsOFFldAEUR/f2Dw==
X-Google-Smtp-Source: ABdhPJxo15H/x7EEu/9WMN/iuxjvzEmsBbPIXj17etTJA8QzpdJAzwsllFGjEWc6leX17MJxQrFDtw==
X-Received: by 2002:a1c:9989:: with SMTP id b131mr164743wme.176.1589818957967; 
 Mon, 18 May 2020 09:22:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w13sm16554687wrm.28.2020.05.18.09.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:22:37 -0700 (PDT)
Date: Mon, 18 May 2020 17:22:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 10/16] backlight: drop extern from prototypes
Message-ID: <20200518162235.nn4zuv3uuteaq36k@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-11-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:33PM +0200, Sam Ravnborg wrote:
> No need to put "extern" in front of prototypes.
> While touching the prototypes adjust indent to follow
> the kernel style.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>



> ---
>  include/linux/backlight.h | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index eae7a5e66248..308aec67fa4f 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -444,22 +444,25 @@ static inline bool backlight_is_blank(struct backlight_device *bd)
>  	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
>  }
>  
> -extern struct backlight_device *backlight_device_register(const char *name,
> -	struct device *dev, void *devdata, const struct backlight_ops *ops,
> -	const struct backlight_properties *props);
> -extern struct backlight_device *devm_backlight_device_register(
> -	struct device *dev, const char *name, struct device *parent,
> -	void *devdata, const struct backlight_ops *ops,
> -	const struct backlight_properties *props);
> -extern void backlight_device_unregister(struct backlight_device *bd);
> -extern void devm_backlight_device_unregister(struct device *dev,
> -					struct backlight_device *bd);
> -extern void backlight_force_update(struct backlight_device *bd,
> -				   enum backlight_update_reason reason);
> -extern int backlight_register_notifier(struct notifier_block *nb);
> -extern int backlight_unregister_notifier(struct notifier_block *nb);
> -extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> -extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
> +struct backlight_device *
> +backlight_device_register(const char *name, struct device *dev, void *devdata,
> +			  const struct backlight_ops *ops,
> +			  const struct backlight_properties *props);
> +struct backlight_device *
> +devm_backlight_device_register(struct device *dev, const char *name,
> +			       struct device *parent, void *devdata,
> +			       const struct backlight_ops *ops,
> +			       const struct backlight_properties *props);
> +void backlight_device_unregister(struct backlight_device *bd);
> +void devm_backlight_device_unregister(struct device *dev,
> +				      struct backlight_device *bd);
> +void backlight_force_update(struct backlight_device *bd,
> +			    enum backlight_update_reason reason);
> +int backlight_register_notifier(struct notifier_block *nb);
> +int backlight_unregister_notifier(struct notifier_block *nb);
> +struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> +int backlight_device_set_brightness(struct backlight_device *bd,
> +				    unsigned long brightness);
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
>  
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
