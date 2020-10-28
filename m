Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC129D092
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5E6E573;
	Wed, 28 Oct 2020 15:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914F6E570
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:12:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so6062727wrp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l4u4x3wqcamFjVhNhf6xSDsxJDF4ia7ZULeYQGII8mw=;
 b=ILXuE1FuPImvS0DqL5IMRBIlL6RZds+hGRxbUKX2fa3Jb+p0i0FfZNnJbTmkYt64BZ
 IkBsZrgp2cHPDVPsSjnIKqN1/P4dJLa0IwrECAb23FygPzfJRHZ/TqvwLlSC+OYLopST
 mfZn/1onAzkuNMiuX+7fJo9bwL6hP0R8JObt3U6IID7loQ4hX1w7QFMw3tUm6koym7hw
 EwdWEE7k8ny3zQeSSZLwuWBrKgTCDDAVsOg+Sjxd2sy3jS9T6gTXbCA2TZLmddXiOWUa
 PG9DUcWHtS11SC1hHzAy/UElkE9HmhHcxPVrEM9fBOj4yvK6Fill0qfq3iJIcENygqOT
 lu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l4u4x3wqcamFjVhNhf6xSDsxJDF4ia7ZULeYQGII8mw=;
 b=P3C8QxVyjXUFonBxQifqlom2RjeU8k5nD5o417txD9vJggow1Z3pQgcz6+Dvl9/pgo
 aX2kgrZIUlFbFHLWPxtJ5RB8iyqLneQzvqRgSr2PGtlfnWaHWh4OGZwy3QtzsAA9dkVM
 tYro4eXnc60ug21oam4GJTmQR/7zLNSytqm9Laa7aW89nB3cAuMEHr3bOHfvPJDle+kk
 Bzv1hCP757JkJy0PelVEoCy9FT/BbdF0FgtGWdCyBFlXUqNGij34lbTcqfLgepYAqavk
 v5pJ35e0XKXoea00+mO2GSl+4MwNFMc/OaCCFe375hfIh76KMWkuUj5YZAibNtlX115f
 RzEg==
X-Gm-Message-State: AOAM533BTQLjPGY2HYl8D5KFvgj7yKSsDCm+Eklnkif+C+NEMuxoBjx7
 21Cf5kW0WrRIzmMXOBcdjsKnHw==
X-Google-Smtp-Source: ABdhPJwyi+wHXJ2cOvhZn68n5CD1XcT8uEuh3II80NOAVMoEVT9S3UDw7HAkoUOuK4zYQVybjj4JCA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr9768069wrl.415.1603897934446; 
 Wed, 28 Oct 2020 08:12:14 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id u5sm8619996wru.63.2020.10.28.08.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:12:13 -0700 (PDT)
Date: Wed, 28 Oct 2020 15:12:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Stan <amstan@chromium.org>
Subject: Re: [PATCH v3 3/3] backlight: pwm_bl: Fix interpolation
Message-ID: <20201028151210.7e765hbq2k7i3url@holly.lan>
References: <20201022050445.930403-1-amstan@chromium.org>
 <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
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
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 10:04:45PM -0700, Alexandru Stan wrote:
> The previous behavior was a little unexpected, its properties/problems:
> 1. It was designed to generate strictly increasing values (no repeats)
> 2. It had quantization errors when calculating step size. Resulting in
> unexpected jumps near the end of some segments.
> 
> Example settings:
> 	brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
> 	num-interpolated-steps = <16>;
> 
> Whenever num-interpolated-steps was larger than the distance
> between 2 consecutive brightness levels the table would get really
> discontinuous. The slope of the interpolation would stick with
> integers only and if it was 0 the whole line segment would get skipped.
> 
> The distances between 1 2 4 and 8 would be 1 (property #1 fighting us),
> and only starting with 16 it would start to interpolate properly.
> 
> Property #1 is not enough. The goal here is more than just monotonically
> increasing. We should still care about the shape of the curve. Repeated
> points might be desired if we're in the part of the curve where we want
> to go slow (aka slope near 0).
> 
> Problem #2 is plainly a bug. Imagine if the 64 entry was 63 instead,
> the calculated slope on the 32-63 segment will be almost half as it
> should be.
> 
> The most expected and simplest algorithm for interpolation is linear
> interpolation, which would handle both problems.
> Let's just implement that!
> 
> Take pairs of points from the brightness-levels array and linearly
> interpolate between them. On the X axis (what userspace sees) we'll
> now have equally sized intervals (num-interpolated-steps sized,
> as opposed to before where we were at the mercy of quantization).
> 
> END

INTERESTING.

I guess this a copy 'n paste error from some internal log book?
Better removed... but I won't lose sleep over it.


> Signed-off-by: Alexandru Stan <amstan@chromium.org>

I've waited a bit to see how strong the feelings were w.r.t. getting rid
of the division from the table initialization. It was something I was
aware of during an earlier review but it was below my personal nitpicking
threshold (which could be badly calibrated... hence waiting). However
it's all been quiet so:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
