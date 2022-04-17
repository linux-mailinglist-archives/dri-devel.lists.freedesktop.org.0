Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AAC504910
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 20:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32CB10EF77;
	Sun, 17 Apr 2022 18:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CB10EF77
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 18:52:42 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id d19so2102880qko.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKPqe4vxsfpDCAxr6uDwyU8L0kabjODZzJ2aaWg93X4=;
 b=SJAS0tTJ0yUp7FKnGhO8wDRBkGapS6ydq8XHGhxspU5t05aFLNRyJxz+d1bW9cjn/b
 8iP2X8URvIeICAlM5UTPtqPGEUlSllS0NbLsD1D6FXsQRjacX/CBy7YBjlNG0x6TBwOa
 WB7g0jw59grOHGX1lI33Rfjp1R/5PX4fgTlP2Gf5uIQ/zgssNc7yN9raiAPuZv57jI8g
 Pbl33BZKSPQl1wbsBAXlZdcVyw3iN7aJb8OehTqYnabyxn18qitmyEqQAP7B8F6jsVhg
 tCcKTGEyN79RxgjKfzCQ/4S4A+dWCLVfAi814LxDOTl8kRN8fnXh/37miEU4zMRF1LkP
 o7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKPqe4vxsfpDCAxr6uDwyU8L0kabjODZzJ2aaWg93X4=;
 b=csCF1IJannLx5e4VDBoRKQeCDO1ucHCvz9Dj42QMRr43ZIcMdF2oC63WHfQdxXldTs
 P7P0+sX9Iis8wn3uHdDa4Y4u/0IyLzADaAYF4zsDb7jdrcL2vBxGQEIk8X4bFFTQPnRs
 MoRbtFjP6/Z1fm5tlkbMHYGvSo/e+4jwnYigNYvlb1Ys3r6B4LklLS2NczLB32iVLzOE
 UpAvLHXsCkgnJpGWJPLRQ16sOsoQYZ6Bq6T8ZhWT6dyAB1VW4KXdQP4xQ6CVWs9dd19Q
 Xo9DRZ8fAZZ1krNju7NelFTCuHEil/oFll+TgtSCxzFR4S9c1+KSwAy/6trRjniJNEnY
 BnDA==
X-Gm-Message-State: AOAM530g8uMlG0YOwbBrqQT/O4LXOwsN7UdaxCFYDKWkf+mlwrZK3EQe
 UnUnAxlLkyLKFBEp8ojl6GrR0RNirT23HrTJmkI=
X-Google-Smtp-Source: ABdhPJw5ioWuK6KYOxB+eNIYwXCpLUNlLGzQO3ZUkgmzLjhz6PEg7Q7CP3vXuI2wIu09bFHApK/bAErbQoGYGdI0ze4=
X-Received: by 2002:a05:620a:4009:b0:69c:62ad:5673 with SMTP id
 h9-20020a05620a400900b0069c62ad5673mr4788279qko.420.1650221560575; Sun, 17
 Apr 2022 11:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220417181538.57fa1303@blackhole>
In-Reply-To: <20220417181538.57fa1303@blackhole>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 17 Apr 2022 11:52:14 -0700
Message-ID: <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
To: Torsten Duwe <duwe@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 9:15 AM Torsten Duwe <duwe@lst.de> wrote:
>
> Align the power-up sequence with the known-good procedure documented in [1]:
> un-swap dvdd12 and dvdd25, and allow a little extra time for them to settle
> before de-asserting reset.

Hi Torsten,

Interesting find! I tried to fix the issue several times by playing
with the delays to no avail.

What's interesting, ANX6345 datasheet allows DVDD12 to come up either
earlier or later than DVDD25 with the delay of T1 (2ms typical)
between them, and actually bringing up DVDD12 first works fine in
u-boot.

The datasheet also requires reset to be deasserted no earlier than T2
(2-5ms) after all the rails are stable.

Another thing it mentions is that the system clock must be stable for
T3 (1-3ms) before reset is deasserted, T3 is already a part of T2,
however it cannot be gated on Pinebook, see [1], page 15

The change looks good to me, but I'll need some time to actually test
it. If you don't hear from me for longer than a week please ping me.

[1] https://files.pine64.org/doc/pinebook/pinebook_mainboard_schematic_3.0.pdf

Regards,
Vasily

> Fixes: 6aa192698089b ("drm/bridge: Add Analogix anx6345 support")
>
> [1] https://github.com/OLIMEX/DIY-LAPTOP/blob/master/
> HARDWARE/A64-TERES/TERES-PCB1-A64-MAIN/Rev.C/TERES_PCB1-A64-MAIN_Rev.C.pdf
> (page 5, blue comment down left)
>
> Reported-by: Harald Geyer <harald@ccbib.org>
> Signed-off-by: Torsten Duwe <duwe@lst.de>
> Cc: stable@vger.kernel.org
> ---
>
> This fixes the problem that e.g. X screensaver turns the screen black,
> and it stays black until the next reboot; definitely on the Teres-I,
> probably on the pinebook64, too.

You should probably move this comment up to be included in the commit message.



>
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -309,27 +309,27 @@ static void anx6345_poweron(struct anx63
>         gpiod_set_value_cansleep(anx6345->gpiod_reset, 1);
>         usleep_range(1000, 2000);
>
> -       err = regulator_enable(anx6345->dvdd12);
> +       err = regulator_enable(anx6345->dvdd25);
>         if (err) {
> -               DRM_ERROR("Failed to enable dvdd12 regulator: %d\n",
> +               DRM_ERROR("Failed to enable dvdd25 regulator: %d\n",
>                           err);
>                 return;
>         }
>
> -       /* T1 - delay between VDD12 and VDD25 should be 0-2ms */
> +       /* T1 - delay between VDD25 and VDD12 should be 0-2ms */
>         usleep_range(1000, 2000);
>
> -       err = regulator_enable(anx6345->dvdd25);
> +       err = regulator_enable(anx6345->dvdd12);
>         if (err) {
> -               DRM_ERROR("Failed to enable dvdd25 regulator: %d\n",
> +               DRM_ERROR("Failed to enable dvdd12 regulator: %d\n",
>                           err);
>                 return;
>         }
>
>         /* T2 - delay between RESETN and all power rail stable,
> -        * should be 2-5ms
> +        * should be at least 2-5ms, 10ms to be safe.
>          */
> -       usleep_range(2000, 5000);
> +       usleep_range(9000, 11000);
>
>         gpiod_set_value_cansleep(anx6345->gpiod_reset, 0);
>
