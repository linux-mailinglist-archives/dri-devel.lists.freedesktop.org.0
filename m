Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA899263E9C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEC66E266;
	Thu, 10 Sep 2020 07:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EA46E094
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:43:36 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id z23so4989144ejr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VfN64tSOGeP7ex6MQ1qLJK62hgHjPavCUX84aVCHqYU=;
 b=ggEyuPM2at4cZym3o7YnP1kWeACf1A6Gzyf6R67Do2SkEc2O4Is3QDDRCJP5ee5H5s
 dqlEbhjuIJRjrKi25j6Mc8DUJ5Sz0mo5RxmSanuYmQTrFXKhj7t3w4Oh9DP6K6qOJPAX
 lzxxI9BQ4WLYaCt6rXfLNN1Nu66pUQK7u39vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VfN64tSOGeP7ex6MQ1qLJK62hgHjPavCUX84aVCHqYU=;
 b=fZLr76zGC58hJDRfdOY1VcpzlYiYIQ0wTZygEuUX8BRT+WL+dm8L4kzHtpi+5F05Yd
 j+cQRyGkJ/Sj0+bfeFKtCB2KcMKElH1Yz4dVziSBhoOOlgPeNPCirU/R6bXDL9Ip21C5
 pok3oFr+1Lt4JHIAAi5HzTl0MyHUxn+tFAwZvhi28i5JPVp/BiwDGXGBFUXe1oAm6fLl
 mdLsbdbec+ADEkHO1c8S7uC8bXnAaak3Bg+Jy4EN6wfvjBMoVowyxnEMeJMel6HCgrVr
 7d7ytCMMGi11gZQARRDEvwHoXFVXyT4IxJvA4Qxh0aQm/GKuxFhaaEQftjeB4kIJk/I2
 UUZQ==
X-Gm-Message-State: AOAM53218MNfv972IowvZEBWM7t2aaube+LSElWWJ4bLxCNGptGQxw6W
 Jv07w6nmXYNUnm6pYo6deGewa2/JD8fFBA==
X-Google-Smtp-Source: ABdhPJyy0IDUvuz0vpFmrbBhZfp/eruG/AYgjif+UJLB4vqZNIW5cSkcYK6ibX8NBM11QnC3XWNt5w==
X-Received: by 2002:a17:907:72c5:: with SMTP id
 du5mr5191481ejc.469.1599677015111; 
 Wed, 09 Sep 2020 11:43:35 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53])
 by smtp.gmail.com with ESMTPSA id v23sm3357451ejh.84.2020.09.09.11.43.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 11:43:33 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id nw23so5049707ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 11:43:33 -0700 (PDT)
X-Received: by 2002:a17:906:bb0e:: with SMTP id
 jz14mr5218995ejb.525.1599677012842; 
 Wed, 09 Sep 2020 11:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
 <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
In-Reply-To: <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
From: Alexandru M Stan <amstan@chromium.org>
Date: Wed, 9 Sep 2020 11:42:56 -0700
X-Gmail-Original-Message-ID: <CAHNYxRw5t67-A4sf719+hQ51K-oRZZLt5W5P3Hej0ynvS9-V5Q@mail.gmail.com>
Message-ID: <CAHNYxRw5t67-A4sf719+hQ51K-oRZZLt5W5P3Hej0ynvS9-V5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 4, 2020 at 4:38 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> > Some displays need the low end of the curve cropped in order to make
> > them happy. In that case we still want to have the 0% point, even though
> > anything between 0% and 5%(example) would be skipped.
>
> For backlights it is not defined that 0 means off and, to be honest, 0
> means off is actually rather weird for anything except transflexive
> or front lit reflective displays[1]. There is a problem on several
> systems that when the backlight slider is reduced to zero you can't
> see the screen properly to turn it back up. This patch looks like it
> would make that problem worse by hurting systems with will written
> device trees.
>
> There is some nasty legacy here: some backlight displays that are off
> at zero and that sucks because userspace doesn't know whether zero is
> off or lowest possible setting.
>
> Nevertheless perhaps a better way to handle this case is for 0 to map to
> 5% power and for the userspace to turn the backlight on/off as final
> step in an animated backlight fade out (and one again for a fade in).

Hello

Apologies for my delay. Thanks for the responses!

Yeah, I felt pretty sketchy about this 0% patch as well. But I figured
it's better to send my suggestion and get corrected than lose the
fixed interpolation patch.

Turns out there's no reason to need 2/3. I was mistaken:
echo "4" > /sys/devices/platform/backlight/backlight/backlight/bl_power
seems to work just fine to turn the backlight off, nothing special
about my device (pwm comes from cros_ec).
Chrome OS user space already makes full use of that knob
(https://source.chromium.org/chromiumos/chromiumos/codesearch/+/master:src/platform2/power_manager/powerd/system/internal_backlight.cc;l=169)
I wanted to try X11 on the same device but I haven't gotten to it yet,
perhaps I'll post my results in the next cover letter.
So it seems I didn't have to worry about "not breaking userspace" on
the existing devices.

I'll respin this patch set: keep 1/3 and 3/3, remove 2/3, and
potentially add another one to update trogdor's dtsi (since that's
where I want this fixed linear interpolation to happen).

Thank you,
Alexandru Stan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
