Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156A1D7C27
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 17:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD76E420;
	Mon, 18 May 2020 15:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6636E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:01:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g14so205262wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8++mCf4jSObKvczsPrCihMEuKhSX0mbSobsPe+OlqoE=;
 b=b1KoRPzh9KeASUfJshq63jbOp9jg3g/1rpHNd1w/o+KQuz4BhUdHMX05yfqVsWYET4
 HWW1Mpp4YrWFk67arh4A2bp+D+x9YrUAJr/tgsIAjZJUb6vepsGF6L3fMH55zsUrFIJJ
 0mSRpAxHlAsHOcYM7awxP5nAJX3vNXuaewFgbEE/Hvb/P6FI263krXKqG4gsb/p58602
 4K8Vm/tZRVERoDDdHDD4wyRS1FQHHf2xLhg532Qj8v0QFQpgmlSBqNl6gRqp2Yf+6yyv
 4yJ79yABAK+WKH83YZfPZ9vmS3WqBCP17g2A7bVa+J/erzwnI8YSkmsnjUUgCuiCKS2S
 jqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8++mCf4jSObKvczsPrCihMEuKhSX0mbSobsPe+OlqoE=;
 b=a1DqQYsmScbxr5118/1j8vwV6u9th1UT1mqrwRKYe6BCUyY5+Fn3QboR7GRDl+AOfm
 2lJM/+uEh3dZAXY/bLYQo2MinIUnucVgh1nCnch92gq95L83sE+h5FITrhiO2Z49Kp9U
 6StpZ+p8cg5di81sxxx//QaWzNuykiQq7/MhwIonOXiIJuxzv1g+yM61Q3Iiq7EDuSNM
 G/P43+1GFJr/c9yApT+ptiTwkRoakvKaKCfU24Z1NUUEhI6/TE6WW4yiXzJV7QYvsxbL
 +7RkAch1YQ5e5lwpB4dv2+vlsGmn0fjm2Fn7qnYZrAt3GQTsinUchD8EZmOY3qXuZpsf
 fAlQ==
X-Gm-Message-State: AOAM533xX8+fPCk0R2E4TqmaCzMePX5SvFDYoeg4T3zRpciN9GGj6UaA
 yGYpkddMWSYsOy0f8Igqdf68oA==
X-Google-Smtp-Source: ABdhPJwVYyW+g2DU5vF2SFs8kROpaXsS+0st9Moezr7mqbpA2jZeUyxRLI/bkAyeZ7mLDzH+DnX7+w==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr20423003wmi.86.1589814058651; 
 Mon, 18 May 2020 08:00:58 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j2sm16678993wrp.47.2020.05.18.08.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:00:57 -0700 (PDT)
Date: Mon, 18 May 2020 16:00:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 03/16] backlight: add backlight_is_blank()
Message-ID: <20200518150055.2vaaoucf4nodwoz5@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-4-sam@ravnborg.org>
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

On Sun, May 17, 2020 at 09:01:26PM +0200, Sam Ravnborg wrote:
> The backlight support has two properties that express the state:
> - power
> - state
> 
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler for drivers
> to get the check of the state correct.
> 
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> and thus not needed in this helper function.
> But added anyway to avoid introducing subtle bug
> due to the creative use in some drivers.
> 
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.
> 
> v2:
>   - Added fb_blank condition (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/backlight.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..a0a083b35c47 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -175,6 +175,25 @@ static inline void backlight_put(struct backlight_device *bd)
>  		put_device(&bd->dev);
>  }
>  
> +/**
> + * backlight_is_blank - Return true if display is expected to be blank
> + * @bd: the backlight device
> + *
> + * Display is expected to be blank if any of these is true::
> + *
> + *   1) if power in not UNBLANK
> + *   2) if fb_blank is not UNBLANK
> + *   3) if state indicate BLANK or SUSPENDED
> + *
> + * Returns true if display is expected to be blank, false otherwise.
> + */
> +static inline bool backlight_is_blank(struct backlight_device *bd)
> +{
> +	return bd->props.power != FB_BLANK_UNBLANK ||
> +	       bd->props.fb_blank != FB_BLANK_UNBLANK ||
> +	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
> +}
> +
>  extern struct backlight_device *backlight_device_register(const char *name,
>  	struct device *dev, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props);
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
