Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E125D790
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2F46EB40;
	Fri,  4 Sep 2020 11:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6F6EB40
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:38:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so5767042wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zBTRNjzB5mPzhMVyXQWz7MNu1O+zSDEFEFHnoBhDYZc=;
 b=WtXR/0sltULRHVCaC8HhLbBR6SIHL5piDWOv3CHxtHHHPnSqQYEf25q1QTSFYE5zf7
 gdWSs8a+2WHWhbJHSIBA1GkGmShfElAMK7OVV9CUYUBgk9R6/BkndkZ+llRZRKOCjgdY
 QuYRCjx+JGzaomOmsTvuvLaLt/FWRjGb6H0U7xOWxh8TQpnhDUykaRdcZGX2lifAbDKo
 3t+uVzuMJydLR8u7eonGsIYYfPje0wKasCBg1diomCO/dcYyU5MfVzqY0uXMkdoXk2Yu
 cdoSyzhfjwQ5WxrXfjAgoTvLYoHlW8zWTZ5egE9QOdCcVOW04/EMMiJX781OkiYDi2UO
 Oahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zBTRNjzB5mPzhMVyXQWz7MNu1O+zSDEFEFHnoBhDYZc=;
 b=HhmoMubQ7YXwVQt7kDPCAinBc6bGflF2679FwC3SBBAALz4Qft9nf7ff6Ygi94AXnB
 qn1CAvOlhhdRU02zc03AqY0n7261e8980sch5mc4OfDhs/fACPnoZt0oiDIptNGxZPWa
 sZuOveD/S2Rki4Vc9cUnVZTHPgk84lpeTVOOFDo8Hh5I7/X4FD1sJtMfJKnJGY/V34mH
 PaU37ie1CXwcNrsIZX2meB5SXn9s4A63GYKqnIgfeW84SbnkKvgp115gHXeCGS7d8GA/
 IN1UmeZ86HxuVmWdRqgzIIWly/bDj1l4ReOo9b/+Jsd9FHYiAeUgeyC/o+BzsLZujsNz
 tY+g==
X-Gm-Message-State: AOAM531Q9xOApsUSd8z7yKKveFcGgqHU5bN94hnC85LdeLC+SjQsqZjq
 FiHBf81bRQ0JZfz3cVIWLQGGMw==
X-Google-Smtp-Source: ABdhPJx8d1p6vyslMOjVsOadjvrrKIpOa1vfRvm5f4PLcqxuLfSM0sJjG+WOSWjoXpgYJJW1oaxM+g==
X-Received: by 2002:a1c:1b8f:: with SMTP id b137mr7618389wmb.151.1599219505621; 
 Fri, 04 Sep 2020 04:38:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j14sm11125993wrr.66.2020.09.04.04.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 04:38:24 -0700 (PDT)
Date: Fri, 4 Sep 2020 12:38:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Stan <amstan@chromium.org>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
Message-ID: <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> Some displays need the low end of the curve cropped in order to make
> them happy. In that case we still want to have the 0% point, even though
> anything between 0% and 5%(example) would be skipped.

For backlights it is not defined that 0 means off and, to be honest, 0
means off is actually rather weird for anything except transflexive
or front lit reflective displays[1]. There is a problem on several
systems that when the backlight slider is reduced to zero you can't
see the screen properly to turn it back up. This patch looks like it
would make that problem worse by hurting systems with will written
device trees.

There is some nasty legacy here: some backlight displays that are off
at zero and that sucks because userspace doesn't know whether zero is
off or lowest possible setting.

Nevertheless perhaps a better way to handle this case is for 0 to map to
5% power and for the userspace to turn the backlight on/off as final
step in an animated backlight fade out (and one again for a fade in).


Daniel.

> 
> Signed-off-by: Alexandru Stan <amstan@chromium.org>
> ---
> 
>  drivers/video/backlight/pwm_bl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 5193a72305a2..b24711ddf504 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  			/* Fill in the last point, since no line starts here. */
>  			table[x2] = y2;
>  
> +			/*
> +			 * If we don't start at 0 yet we're increasing, assume
> +			 * the dts wanted to crop the low end of the range, so
> +			 * insert a 0 to provide a display off mode.
> +			 */
> +			if (table[0] > 0 && table[0] < table[num_levels - 1])
> +				table[0] = 0;
> +
>  			/*
>  			 * As we use interpolation lets remove current
>  			 * brightness levels table and replace for the
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
