Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F823D77D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F28B6E881;
	Thu,  6 Aug 2020 07:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF26E838
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 21:04:49 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o18so47908537eje.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
 b=aPqJee4+/II1pDeHm6YJT9N8szJtyfH8/u0a/mb/rUh0XKwrO9/lI6mAKg/YUjZsap
 p0B7nL/zuMyT3EsRGWbvq29/0Lc9irQLp5boKwUO0dgr7wICe4bQ/VVNo2zfxFQFtKUF
 aTAuAP1cEHDioLUgDXQmFNnV10RJlUC2CPrZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
 b=TVa5j9XdXNKH82NPXYRZeUwkiHEzcHFZii+YuU6ijFKMKzJPmZaTTpHYtfI8g2tZad
 rmbGgJbhC91TgwKXLiWjP5I/QmjbLKYBBg3PM1TU/XYOjOR82z0wHMSVfA3Cuo/QWBed
 P+Ao6Mbgyq9Kc5jlcmJXi4u9PldPONsKoFyXQ17lU4r9YjH3H5sYmm2dcWBDZKITG2d8
 LgiYRhJk4Y+go7GqWzrUM4qsACCwy7LfD0CZiyqm4akanz3puOLFFTmPGFaIK3Hb+IpQ
 ayXoqZlu87oWxO16jce9we7036tH8sQWRZP+bPA7nf416uSRY8xsi2i03PG1Vw95UP1q
 zQaA==
X-Gm-Message-State: AOAM533AEQCF5ZC6ARFGqvL5sO6b+5y8wqgYNWbYSL14hchi/oniCmv8
 eXrv5U1D/YVH/N4OmhYu6FPX2lYe8BY=
X-Google-Smtp-Source: ABdhPJxLyU5ndM8oMwqMkCxDfO6PjiOfB9ZPhUFDXm3URmm9fEIJlPJwy1ICQc9KuGrK1siaIgUITw==
X-Received: by 2002:a17:906:a18e:: with SMTP id
 s14mr1215787ejy.168.1596661487774; 
 Wed, 05 Aug 2020 14:04:47 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54])
 by smtp.gmail.com with ESMTPSA id a16sm2241775ejy.78.2020.08.05.14.04.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 14:04:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id i26so30242549edv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
X-Received: by 2002:a05:6402:28f:: with SMTP id
 l15mr1118783edv.233.1596661486208; 
 Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org>
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Wed, 5 Aug 2020 14:04:09 -0700
X-Gmail-Original-Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] PWM backlight interpolation adjustments
To: Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 9:27 PM Alexandru Stan <amstan@chromium.org> wrote:
>
> I was trying to adjust the brightness for a new chromebook:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
> Like a lot of panels, the low end needs to be cropped,
> and now that we have the interpolation stuff I wanted to make use of it
> and bake in even the curve.
>
> I found the behavior a little unintuitive and non-linear. See patch 1
> for a suggested fix for this.
>
> Unfortunatelly a few veyron dts files were relying on this
> (perhaps weird) behavior. Those devices also want a minimum brightness.
> The issue is that they also want the 0% point for turning off the
> display.
> https://github.com/torvalds/linux/commit/6233269bce47bd450196a671ab28eb1ec5eb88d9#diff-e401ae20091bbfb311a062c464f4f47fL23
>
> So the idea here is to change those dts files to only say <3 255> (patch
> 3), and add in a virtual 0% point at the bottom of the scale (patch 2).
>
> We have to do this conditionally because it seems some devices like to
> have the scale inverted:
>   % git grep "brightness-levels\s*=\s*<\s*[1-9]"|cat
>   arch/arm/boot/dts/tegra124-apalis-eval.dts:             brightness-levels = <255 231 223 207 191 159 127 0>;
>
>
> Alexandru Stan (3):
>   backlight: pwm_bl: Fix interpolation
>   backlight: pwm_bl: Artificially add 0% during interpolation
>   ARM: dts: rockchip: Remove 0 point in backlight
>
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts    |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-tiger.dts  |  2 +-
>  drivers/video/backlight/pwm_bl.c           | 78 +++++++++++-----------
>  4 files changed, 42 insertions(+), 42 deletions(-)
>
> --
> 2.27.0
>

Hello,

Friendly ping.
Let me know if you would like me to make any changes to my patches.

Thanks,
Alexandru M Stan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
