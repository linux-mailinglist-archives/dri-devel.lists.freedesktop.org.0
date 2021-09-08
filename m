Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5814D403D6D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFE36E204;
	Wed,  8 Sep 2021 16:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392376E204
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:13:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z4so4111385wrr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otJIaIZEIwpUP1sL+L4KgyYMZE4bOcczh+iqfbaQBAw=;
 b=WPSFbvJU0+Jm7BfUh8RUdYJu7SgseAXjg+zCuY/jFI/DmFCHSHDm6++MhW7f1X389W
 0GPQbQauiKOAoquN834zbRgaihl0IiIL+aaT6l6hCbmwvoOVMMB85tXEOPTNKRt5wWis
 US7U37Ei4VxQu3aJ+NCbVN1031RcttbP2UxJ71juu6SLQUOKAZwCK5bLBzXQS+0Spcag
 o5xns6XrhabernhyUCSAoqOqn5GB1agNrSB5yVgzd5XDuaXxjNKFn6VxxYG4P5m3PhNd
 e8F7BrqxCNcEejl6b/7XpHrHKFNss8tVHGTPVBzcvNwbptliSz1pfcV0KsC5u2vafxjV
 K6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otJIaIZEIwpUP1sL+L4KgyYMZE4bOcczh+iqfbaQBAw=;
 b=eTp5U4s0TqUbf95B7fPe/5skM7VWVbh5Jnx2UkJ1z4ffnc+QtrzMNyQlAyIqvQs6kG
 XQDDa/qbR+IHM4GhgGEsWoVO3bvJ2/HqdQQj4oy652WxogAdGRc8Uxt1+vf6gE4pa+s4
 Bqo7cQ5SOpOggieUMwCbI0RiH6bcx3YV5gG+pICC5G1G7qliqjyPXvyW+jQ6MFz9timu
 MvaZMuieHntcc+QDSkSXKDEcbGhvhkVlr1XmsyhcFCtfI0e4H9obn3596rK8Hb2YLWmX
 L9xLOyaxR8H976FiRjZUVjsEHT/cgaMZwMjM/f+2/Xn472cxYaOYl5nl0Ffm875zjxZq
 Aijw==
X-Gm-Message-State: AOAM531ElivOctVnXiG1426EdH1LWt1Frpy9q1YOc0xxL0tU7WgrRIBV
 LBV/IqL64S8/AojknpBIEuG1eiDHPSR3yR9pg5JqiA==
X-Google-Smtp-Source: ABdhPJzE41ItDvcz2jBLOuUeQvDPWoHfBis4KfqDpGWKW/93P9IJ34MOVuRFUNvDd7b7STqbUwTYYLTjappUWXgwcEw=
X-Received: by 2002:a5d:424c:: with SMTP id s12mr5039823wrr.8.1631117605635;
 Wed, 08 Sep 2021 09:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
 <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
 <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
 <13ecc7df-37b9-a686-9314-04a26359fc0d@denx.de>
In-Reply-To: <13ecc7df-37b9-a686-9314-04a26359fc0d@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 8 Sep 2021 17:13:09 +0100
Message-ID: <CAPY8ntAWYivHeAi0-srQ21vh=MJSbi2yw8oDSf+7ZP_Ak9NtdA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Sept 2021 at 16:26, Marek Vasut <marex@denx.de> wrote:
>
> On 9/8/21 1:11 PM, Dave Stevenson wrote:
> > Hi Marek and Andrzej
>
> Hello Dave,
>
> skipping the protocol discussion, which I hope Andrej will pick up.
>
> [...]
>
> >>> Usually video transmission starts in crtc->enable (CRTC->Encoder), and
> >>> in encoder->enable (encoder->bridge), so in bridges->enable it would be
> >>> too late for LP11 state - transmission can be already in progress.
> >>>
> >>> It shows well that this order of calls does not fit well to DSI, and
> >>> probably many other protocols.
> >>>
> >>> Maybe moving most of the bridge->enable code to bridge->pre_enable would
> >>> help, but I am not sur if it will not pose another issues.
> >>
> >> Yep, that won't work e.g. with the exynos DSIM, because
> >> exynos_dsi_set_display_mode() sets the data lanes to LP11.
> >
> > Isn't the bigger question for SN65DSI8[3|4|5] whether the clock lane
> > is running or not in pre_enable?
>
> I think the bigger question really is -- how do we cater for all the
> different bridges with different init-time requirements.
>
> >>> This is quick analysis, so please fix me if I am wrong.
> >>
> >> I pretty much agree that the current state of things does not fit with
> >> DSI too well.
> >
> > That was why I was questioning how DSI was meant to be implemented in
> > https://lore.kernel.org/dri-devel/CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com/
> >
> > The need to have the DSI host in a defined idle state (often LP-11,
> > but varying whether the clock lane is in HS) before powering up the
> > panel/bridge is incredibly common, but currently undefined in DRM.
> >
> > Taking the SN65DSI83 as an example, the datasheet [1] section 7.4.2
> > states that the clock lane must be in HS mode, and data lanes in LP-11
> > when coming out of reset. That means that we can't be "enable" as that
> > will have the data lanes in HS mode and sending video, and as we can't
> > be in "pre_enable" as the DSI PHY will be powered down and so we won't
> > have the clock lanes in HS mode.
> >
> > I've hit a similar one with the Toshiba TC358762 where it seems to get
> > upset if it is receiving video data when it gets configured.
> > panel-raspberrypi-touchscreen[2] which drives that chip is
> > intermittent when using panel enable, whereas panel prepare is
> > significantly more reliable but relies on the DSI host being
> > initialised to LP-11 by breaking the chain.
>
> Right
>
> To make it worse, not initing the DSI bridge exactly per spec leads to
> intermittent failures, not consistently occuring ones.

Yes, I suspect it's been just down to timing as to whether the display
side starts producing video data before or after all the configuration
has been sent, and I get random LP commands timing out. (We're only
dropping to LP in vertical blanking, so there isn't a huge amount of
time).

> >    Dave
> >
> > [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> > [2] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
>
> Unrelated to this discussion -- there is a tc358762 driver, driver for
> that attiny88 regulator, and driver for the touchscreen chip, on that
> rpi 7" display, in upstream. You can use those to replace the composite
> panel driver (it works at least against stm32mp1 DSI host with the rpi
> 7" panel). Sadly there is little documentation for that attiny88
> protocol or firmware, that's what I don't like about that panel.

Thank you, I know they exist, and I'm looking at exactly that problem
at the moment!

panel-raspberrypi-touchscreen doesn't expose any form of regulator
control, so trying to hook edt-ft54x6 on for the touchscreen sees it
getting the power yanked from under it. I'm trying to switch to those
drivers so that the two play nicely.

The Atmel is a bit nasty in trying to initialise the bridge, panel,
and touch all at the same time. The edt-ft54x6 driver generally probes
first and powers everything up when the DSI host isn't initialised.
This seems to upset the TC358762 and it then won't initialise.
It is possible to poke most things manually through the PORTA, PORTB
and PORTC commands, but I'm currently failing to create a reliable
mechanism :-( I have the advantage that I have the source code for the
Atmel (it's not nice)

  Dave
