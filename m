Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215852165F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 07:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EED6E0EA;
	Tue,  7 Jul 2020 05:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549FC6E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 05:42:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g10so932125wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 22:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WHUZR2EXdhW5czPcHt04KOGgCe/6SbN/TGw1pfVyle4=;
 b=aTHuMDpSIuntpboIlpD3+77prmvJYYBBCxxD8NinelcUFG+j+dj3KN9GoisfRWfdS5
 8DT2xsmwMpRRwEGaZffv128mMoXufFWvGv/mGoFtuO8pHa5b2EaJRMF60gQCwpnnCuqf
 wX8vfS3h5dhWybSyzG9dP/DbtH+U1M75DY9HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WHUZR2EXdhW5czPcHt04KOGgCe/6SbN/TGw1pfVyle4=;
 b=M+/Svq0bvhL9hIEdhgJMZiAsgWKDUYcempKaujsJdpUGooc2SX4fFqMYMLNReUft9Y
 0RxwYHqPeAvc8y18qjtOikjSJHYJZCNgWK5hmlYvTBDSkfn7XVHlFqOX5PmoIpAZ+OpU
 BRy8b5D1IWir4Cevfvs3oMIIcqxee3oMYYedmFhmpqFonPDO3RFnu5R0tqew68zOcpaG
 iaJYRuoXBIjY6CHhWD7nkx6IFZH9t1pVTxdkKXc5hhgkSaob3CBTRTfzbF1GtVah1AvR
 /02c65gw1mO1qa+jp/dxXGwYzVyjhVTOfL6FZyiZ6EIy4WUtWcfbgJIMvqtrbB1OUGki
 SPTw==
X-Gm-Message-State: AOAM532F4QHYjXc1F1A+z92lvTEbOwml1TkBKBigKC7blnckp8bbp/zU
 Q+cAiTWLWYdq2LND0P8nb55YoQ==
X-Google-Smtp-Source: ABdhPJxkzyQbd3f6f/x660/A1DZO543mIEmlw2oJzEFOVcvYB/zIx1BH7NEm8rYT7UByGGvzuOEFfw==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr2297120wma.73.1594100539918; 
 Mon, 06 Jul 2020 22:42:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 65sm2051126wma.48.2020.07.06.22.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 22:42:19 -0700 (PDT)
Date: Tue, 7 Jul 2020 07:42:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 02/20] backlight: add backlight_is_blank()
Message-ID: <20200707054216.GE3278063@phenom.ffwll.local>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-3-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:28PM +0200, Sam Ravnborg wrote:
> The backlight support has two properties that express the state:
> - power
> - state

Tiny nit, but please add "fb_blank" here too, commit message doesn't match
the code anymore. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler
> for drivers to get the check of the state correct.
> 
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> and thus not needed in this helper function.
> But added anyway to avoid introducing subtle bugs
> due to the creative use of fb_blank in some drivers.
> Introducing this helper will for some drivers results in
> added support for fb_blank. This will be a change in
> functionality, which will improve the backlight driver.
> 
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.
> 
> v4:
>   - struct backlight_device * is now const
> 
> v3:
>   - Clarified that the fb_blank support in
>     backlight_is_blank() may result in functionality
>     changes for the users (Emil)
> 
> v2:
>   - Added fb_blank condition (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 56e4580d4f55..56e51ebab740 100644
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
> +static inline bool backlight_is_blank(const struct backlight_device *bd)
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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
