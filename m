Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B42A3EA1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A44C6EC3B;
	Tue,  3 Nov 2020 08:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C90D6E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:53:28 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id o21so13278993ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlGtTyawZz1U+foaHuQJleVoISpzv2DwJ6xp8D1Hwk4=;
 b=dIaNxAccndYlWhHDapF/MDgfnKgAGECRY/zIOGm650eR7riKJDY+LJNCZbF3ThLlRr
 +jEuZq6zopeOu3FTISuAv02VhSA429Uhgs7h9o100X+Jy67bARpU0p7k6SJahy6TgPZQ
 vl8C5qfffPSjxCQ+Z0E5TUGJki8xexMTou9E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlGtTyawZz1U+foaHuQJleVoISpzv2DwJ6xp8D1Hwk4=;
 b=NJVUVgr/b+vMz/llbl701peQlT5890iqG14w+XBouyeWe/Q+NEYYywELqWkRHkhgsd
 V+TEtYCLzQmzzJIi0UTskx2G/w879PW5YybSkyAiZ/+CDhXZn6RCJ+A7DFgIUfOuCLUb
 flGTOffNPytNUnd8QddE1bs73Y+SgWvoapUPMp8PymUiyUyhcP31uE6NdcwphGHvB+fm
 tIHPiEgUg5c5U4zQL8eIYkEfsS/eBZOgXAC+OPrHbwYQKVm6e+7AvKZHWcFG4gUtSYQq
 2NWN0CuxgnB7OXz98fNH9ITIty1WgYnu8zJfCf+ASBX/XEZznecImWHjXD2KHOTbsyb6
 3d8A==
X-Gm-Message-State: AOAM5319I2xxBBhjWPsKOJPqz5yXTnOSmuPSjD6Q32b36G6v6JKsLfAV
 XutG2d0Pj+ljnWWgGayeB7n20uvcIU0Bvw==
X-Google-Smtp-Source: ABdhPJwXuug8PUI8dOJhkp7fScA1+1vdCMKN66foGomXJOmRBsw9snWFs/jUQCTkTL2/Vi10pfrLAw==
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr14034953ejb.472.1604343206555; 
 Mon, 02 Nov 2020 10:53:26 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43])
 by smtp.gmail.com with ESMTPSA id t3sm10649917edv.59.2020.11.02.10.53.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 10:53:25 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id a71so10047059edf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:53:25 -0800 (PST)
X-Received: by 2002:a05:6402:a57:: with SMTP id
 bt23mr6977135edb.62.1604343204920; 
 Mon, 02 Nov 2020 10:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20201022050445.930403-1-amstan@chromium.org>
 <20201021220404.v3.3.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
 <20201028151210.7e765hbq2k7i3url@holly.lan>
In-Reply-To: <20201028151210.7e765hbq2k7i3url@holly.lan>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 2 Nov 2020 10:52:49 -0800
X-Gmail-Original-Message-ID: <CAHNYxRy4hg4rZsc-xi3MzK+RapMq76+=hGj0_E-aGcFUPB1wMA@mail.gmail.com>
Message-ID: <CAHNYxRy4hg4rZsc-xi3MzK+RapMq76+=hGj0_E-aGcFUPB1wMA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] backlight: pwm_bl: Fix interpolation
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 8:12 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Oct 21, 2020 at 10:04:45PM -0700, Alexandru Stan wrote:
> > The previous behavior was a little unexpected, its properties/problems:
> > 1. It was designed to generate strictly increasing values (no repeats)
> > 2. It had quantization errors when calculating step size. Resulting in
> > unexpected jumps near the end of some segments.
> >
> > Example settings:
> >       brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
> >       num-interpolated-steps = <16>;
> >
> > Whenever num-interpolated-steps was larger than the distance
> > between 2 consecutive brightness levels the table would get really
> > discontinuous. The slope of the interpolation would stick with
> > integers only and if it was 0 the whole line segment would get skipped.
> >
> > The distances between 1 2 4 and 8 would be 1 (property #1 fighting us),
> > and only starting with 16 it would start to interpolate properly.
> >
> > Property #1 is not enough. The goal here is more than just monotonically
> > increasing. We should still care about the shape of the curve. Repeated
> > points might be desired if we're in the part of the curve where we want
> > to go slow (aka slope near 0).
> >
> > Problem #2 is plainly a bug. Imagine if the 64 entry was 63 instead,
> > the calculated slope on the 32-63 segment will be almost half as it
> > should be.
> >
> > The most expected and simplest algorithm for interpolation is linear
> > interpolation, which would handle both problems.
> > Let's just implement that!
> >
> > Take pairs of points from the brightness-levels array and linearly
> > interpolate between them. On the X axis (what userspace sees) we'll
> > now have equally sized intervals (num-interpolated-steps sized,
> > as opposed to before where we were at the mercy of quantization).
> >
> > END
>
> INTERESTING.
>
> I guess this a copy 'n paste error from some internal log book?
> Better removed... but I won't lose sleep over it.

Sorry! Yeah, I mistakenly duplicated the "END" line in patman.

>
>
> > Signed-off-by: Alexandru Stan <amstan@chromium.org>
>
> I've waited a bit to see how strong the feelings were w.r.t. getting rid
> of the division from the table initialization. It was something I was
> aware of during an earlier review but it was below my personal nitpicking
> threshold (which could be badly calibrated... hence waiting). However
> it's all been quiet so:
>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
>
> Daniel.


Alexandru Stan (amstan)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
