Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC678C4E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 15:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FC710E041;
	Tue, 29 Aug 2023 13:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11010E041
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 13:08:08 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26d2b3860daso2785898a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1693314487; x=1693919287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lMzioqTsoNXGmKZGJbVP1TBBbkNDV2hfjqYL6wRSgqs=;
 b=c+FpYRALBeg7I+Z+7kuLoCwfpw8BOk2eF1lsRA5Szi47n5IHs+ou/tMbuEcKtqhU1s
 h1fVruNdN+3sfVEpgyecITrfnL+d71pX9bYX+LuSLjmsnWd2YFyO9LbFIpb7SpzQQ0rk
 IHbaeLRRKRZh7d8sRXFq3Bp8V3YYbpoFitfLffy6I6Ipn40qHSE+u7D0dFo0Bm6UYr1I
 Vfru68wZMQPSu9AHJYJNjycKwNnlMs7Ri38QpotWAUGezc9HCxL2zBvA79GYPbyP0Ukf
 i2lMldORJCVVLFLpgbuyRJiBmU+b84y3H1HjoNKlMmJMQS4a8vmw1AdJoRaTpiHiL4Ql
 vudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693314487; x=1693919287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMzioqTsoNXGmKZGJbVP1TBBbkNDV2hfjqYL6wRSgqs=;
 b=lO+2agrEaN1StI52rkjJDXObYb35n58M4/ktjd5vGTvSdFqYmdkYrSCyh3Q1TBNRt6
 H+YhNEZ9+ZweIwX/szuONSkPvZJ+goL7xqHsxl8jkaWQqV/w2yNwE/lYJqeY7voUfKcM
 L2fx5JERfz9d1bCc42hniBZqjNo3IaUltK3LwJ4dEUWgNusBr7n29GPtgOWUMni7CVPA
 sING8Ecta4y8MkBJeUpNeOqd45vWvrc4sQftikYQFSq6xPU/ab9chVsJQrTwWs8iarhR
 H21xiTk8Nxod8iQ8VIqxmJaoBF+7mKsfIXZcKNaVaWAkdfQpiacvpn3Czg865R9iHKbm
 o/gA==
X-Gm-Message-State: AOJu0Yz+GkO32ENuB6r4v3AYRuWfG1tNwKAsqMHZ1YttlOIGnn3ChL7d
 +rdL+afA3uJQOebc1bxkdk3bZ3fWPOeo1dvCT1/hfg==
X-Google-Smtp-Source: AGHT+IHhlgMF5LYwhTh0L70364SfFxtJggo4z5RhQ1y+ueLCKD9r2eJBOpzHC2CGCegAAY5YT5cY7cnMQisk+46hlus=
X-Received: by 2002:a17:90b:3753:b0:267:eefe:d0b5 with SMTP id
 ne19-20020a17090b375300b00267eefed0b5mr26959715pjb.46.1693314487499; Tue, 29
 Aug 2023 06:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230826095516.81387-1-git@mimoja.de>
 <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
 <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
 <1ef18921-2f21-9970-3cd4-aa9680d44127@denx.de>
In-Reply-To: <1ef18921-2f21-9970-3cd4-aa9680d44127@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 29 Aug 2023 14:07:50 +0100
Message-ID: <CAPY8ntD76yjV3mKHynf_1f2MZoJpWem+0PqWCB+RVujeXJiVeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
To: Marek Vasut <marex@denx.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, mimoja@aachen.ccc.de,
 dri-devel@lists.freedesktop.org, Mimoja <mimoja@mimoja.de>,
 Thierry Reding <thierry.reding@gmail.com>, Mimoja <git@mimoja.de>,
 alu@fffuego.com, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek & Mimoja

On Sat, 26 Aug 2023 at 22:02, Marek Vasut <marex@denx.de> wrote:
>
> On 8/26/23 20:33, Mimoja wrote:
>
> Hi,
>
> +CC Dave , he might be able to help with the last part.
>
> > I appreciate you taking the time to respond!
> >
> > On 26.08.23 17:18, Marek Vasut wrote:
> >> On 8/26/23 11:55, Mimoja wrote:
> >>> "The .prepare() function is typically called before the display
> >>> controller
> >>> starts to transmit video data."
> >>> and
> >>> "After the display controller has started transmitting video data,
> >>> it's safe
> >>>   to call the .enable() function."
> >>
> >> DSI commands are not DSI video, so this should be OK ?
> >
> > You are correct, my commit message is mixing things up here. I wanted to
> > emphasize roughly the thought of
> > "when enable() is called the dsi core is expected to have its clock
> > initialized". Will take note to clarify this if I succeed to
> > make a case for this patch below :)
>
> I vaguely recall there was this flag in include/drm/drm_bridge.h which
> might be related:
>
> 748 /**
> 749  * @pre_enable_prev_first: The bridge requires that the prev
> 750  * bridge @pre_enable function is called before its @pre_enable,
> 751  * and conversely for post_disable. This is most frequently a
> 752  * requirement for DSI devices which need the host to be initialised
> 753  * before the peripheral.
> 754  */
> 755 bool pre_enable_prev_first;
>
> Could it be, this is what you need ?

drm_panel has prepare_prev_first, which maps to drm_bridge's
pre_enable_prev_first, but same concept.
Most likely this is what you're after, but only got added in 6.3.

> >>> While generally fine this can lead to a fillup of the transmission
> >>> queue before
> >>> the transmission is set up on certain dsi bridges.
> >>> This issue can also be seen on downstream imx8m* kernels.
> >>
> >> Can you reproduce this with current mainline Linux or linux-next tree ?
> >> I recall the display pipeline in the NXP downstream stuff is very
> >> different from mainline .
> >
> > You are very much correct. The NXP downstream kernel is completely
> > different from the upstream one
> > and is really a great example to show the issue (code cleaned up for
> > readability):
> >
> > https://github.com/varigit/linux-imx/blob/5.15-2.0.x-imx_var01/drivers/gpu/drm/bridge/sec-dsim.c#L1368
> > ```
> >      ret = drm_panel_prepare(dsim->panel);
> >      if (unlikely(ret)) [...]
> >
> >      /* config esc clock, byte clock and etc */
> >      sec_mipi_dsim_config_clkctrl(dsim);
> >
> >      ret = drm_panel_enable(dsim->panel);
> >      if (unlikely(ret)) [...]
> >
> > ```

That DSI host driver looks very strange, or perhaps just outdated. It
implements atomic_enable and atomic_disable, but not atomic_pre_enable
or atomic_post_disable. Any attached panel or bridge drivers therefore
don't get called in the expected way by the bridge chain.
You are on 5.15 which may predate some of the reworking, but should
still support panel_bridge so that calling one of the of_get_bridge
functions gives you a bridge irregardless of whether it is a bridge or
panel. I'd question why the DSI host driver is making calls down the
bridge chain for itself - either it results in calling functions
multiple times, or you break the bridge chain (as vc4 used to do) but
mess up atomic states as the core can't add the state of the removed
nodes.

> >
> >> Which SoC does have this problem ?
> > Sadly I don't have any SoCs available which would work perfectly with
> > linux-next, let alone are confirmed affected :/
> >
> > I were able to make my Kingway Panel work (Custom one and so far
> > unsupported by the st7701 driver) with this
> > patch on downstream 5.4 and 5.15 imx8mn as well as on a raspberry pi CM4
> > with 6.1. However raspberrypi/linux brings
> > SPI support to the st7701 driver which should not affect this but I
> > would just like to document it here.

DPI video with SPI for configuration was added to the Pi kernel to
support the Pimoroni HyperPixel 2 round display[1].

If you have the panel attached to a CM4, and prepare_prev_first is
set, then I would expect it to work on the Pi.
The docs[2] state that transfer can be called in any state, however I
know that is an issue in vc4 that I need to address at some point. If
fixed, then no change should be required.

[1] https://shop.pimoroni.com/products/hyperpixel-round?variant=39381081882707
[2] https://github.com/torvalds/linux/blob/master/include/drm/drm_mipi_dsi.h#L84-L87

> > I could not find any success story with st7701 and the rpi on 6.1 online
> > after a short search (and only one
> > reference with 5.10 which seems to me a bit different in a short
> > comparison)  but again I can only offer
> > circumstantial evidence. Sorry :/
>
> Maybe Dave can help with this part .

I don't recall having had an ST7701 panel using DSI, so I'm afraid I
can't really help there.

  Dave
