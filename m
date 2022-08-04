Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE0589B0C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 13:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15BB9664D;
	Thu,  4 Aug 2022 11:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AC212AC08
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 11:31:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b16so17449577edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZCMUxfbvhV8KUF7AQQe3QbS9+vNWbCElynU3LR9VS4=;
 b=iXLRL5Vm95CI/aiauBsLd6V9ZtUPLX/NJy6pPlAWa63XnDQ1oALPg0Atx2OmS+T9ff
 tA1MdiuOx3RVaDyTQDz4AMqZp5EsmK0QRLCbpXXaLovQdmjY3oJKTZTMC4LUQVRMyauh
 T3wC3dKYWV/6wwYwxF8TeVSGMgeCUCGZ1ffcyiB7LFTm/T1irGOAJbJJGOqE6OWl0SNM
 0mLzl9jRmeaXDAmAK7DsmwqdtKaWcgngvTKrm8aykT80GFGBCVCf86QXBKfRjTov+wRz
 cjCwEU1SoxYzeA8nCxVDSAQMtzgtcKaSx8Q34mE+gBcWgDiKAMpm7oW8jBGIQ0R1zikC
 plwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZCMUxfbvhV8KUF7AQQe3QbS9+vNWbCElynU3LR9VS4=;
 b=fB66jqXQfbjTub9Q0bVp4pmkKRlUwhHrrP6JUMKQ9z1oF/6tZueNzdHgMQ+USRwhAJ
 YHNWNMqXmHUt2fkyS8l0p1jKyihV4rV+THpDm+fkZY3IyrZa+qnzBiT1rPUigzhmI2f6
 7FuJdbz2dlv8Lu/KybUd99L90+mexJ69YrtGWn+KKOMcu843kVTpug2wMgoAA/e4UBoK
 roZGHneHR+yh8CBSx46NR2di0eO4DgtnK+98vU6qWevSOb/a3WZj1wlzLCAJKLus2Cz6
 dI2JhkUbd09bh3zIwrEcOhjQWQMxLcnjIu0BOr2qI1LkpJsB82+m+BwXgEIoGhG0fT7q
 8lhQ==
X-Gm-Message-State: ACgBeo0JqkblyVi465GVAzyvGEm2rw9cxddg92XX0JkAlW8vgc+qOpaN
 98U9LcSvDNFTd5jf93mulnXMlnug8px8eaBHqEzpIsDtRUHRrQ==
X-Google-Smtp-Source: AA6agR6jUWiPc/C5Il2dX+DC2AF25v7K7TwLUJuBM4tCoPL9sZdF5zUQjMNMM2BDJZnBG4JfUpt9r5mFE4uxW+gju7U=
X-Received: by 2002:a05:6402:1771:b0:43d:3fab:dd73 with SMTP id
 da17-20020a056402177100b0043d3fabdd73mr1596394edb.136.1659612677847; Thu, 04
 Aug 2022 04:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <20220804093829.42kdelp7u4r743nv@pengutronix.de>
In-Reply-To: <20220804093829.42kdelp7u4r743nv@pengutronix.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 4 Aug 2022 12:31:01 +0100
Message-ID: <CAPY8ntBovVq1HVt_UneDF8OB9KBdEBv52o=4BCTmf9VpiODxVg@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 laurentiu.palcu@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, robert.chiras@nxp.com,
 Robert Foss <robert.foss@linaro.org>, Adam Ford <aford173@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marco

On Thu, 4 Aug 2022 at 10:38, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi Dave, Adam,
>
> On 22-08-03, Dave Stevenson wrote:
> > Hi Adam
> >
> > On Wed, 3 Aug 2022 at 12:03, Adam Ford <aford173@gmail.com> wrote:
>
> ...
>
> > > > Did managed to get access to the ADV7535 programming guide? This is the
> > > > black box here. Let me check if I can provide you a link with our repo
> > > > so you can test our current DSIM state if you want.
> > >
> > > I do have access to the programming guide, but it's under NDA, but
> > > I'll try to answer questions if I can.
> >
> > Not meaning to butt in, but I have datasheets for ADV7533 and 7535
> > from previously looking at these chips.
>
> Thanks for stepping into :)
>
> > Mine fairly plainly states:
> > "The DSI receiver input supports DSI video mode operation only, and
> > specifically, only supports nonburst mode with sync pulses".
>
> I've read this also, and we are working in nonburst mode with sync
> pulses. I have no access to an MIPI-DSI analyzer therefore I can't
> verify it.
>
> > Non-burst mode meaning that the DSI pixel rate MUST be the same as the
> > HDMI pixel rate.
>
> On DSI side you don't have a pixel-clock instead there is bit-clock.

You have an effective pixel clock, with a fixed conversion for the
configuration.

DSI bit-clock * number of lanes / bits_per_pixel = pixel rate.
891Mbit/s * 4 lanes / 24bpp = 148.5 Mpixels/s

As noted elsewhere, the DSI is DDR, so the clock lane itself is only
running at 891 / 2 = 445.5MHz.

> > Section 6.1.1 "DSI Input Modes" of adv7533_hardware_user_s_guide is
> > even more explicit about the requirement of DSI timing matching
>
> Is it possible to share the key points of the requirements?

"Specifically the ADV7533 supports the Non-Burst Mode with syncs. This
mode requires real time data generation as a pulse packet received
becomes a pulse generated. Therefore this mode requires a continuous
stream of data with correct video timing to avoid any visual
artifacts."

LP mode is supported on data lanes. Clock lane must remain in HS mode.

"... the goal is to accurately convey DPI-type timing over DSI. This
includes matching DPI pixel-transmission rates, and widths of timing
events."

> > The NXP kernel switching down to an hs_clk of 445.5MHz would therefore
> > be correct for 720p operation.
>
> It should be absolute no difference if you work on 891MHz with 2 lanes
> or on 445.5 MHz with 4 lanes. What must be ensured is that you need the
> minimum required bandwidth which is roughly: 1280*720*24*60 = 1.327
> GBps.

Has someone changed the number of lanes in use? I'd missed that if so,
but I'll agree that 891MHz over 2 lanes should work for 720p60.

I have just noted that 720p59.94 at 24bpp on 4 lanes is listed as one
of the modes that is mandatory to use the timing generator (reg 0x27
bit 7 = 1). On 2 lanes it is not required.
I don't know why it's referencing the 1000/1001 pixel clock rates and
not the base one, as it's only a base clock change with the same
timing (74.176MHz clock instead of 74.25MHz).

> > If you do program the manual DSI divider register to allow a DSI pixel
> > rate of 148.5MHz vs HDMI pixel rate of 74.25MHz, you'd be relying on
>
> There is no such DSI pixel rate to be precise, we only have a DSI bit
> clock/rate.
>
> > the ADV753x having at least a half-line FIFO between DSI rx and HDMI
> > tx to compensate for the differing data rates. I see no reference to
> > such, and I'd be surprised if it was more than a half dozen pixels to
> > compensate for the jitter in the cases where the internal timing
> > generator is mandatory due to fractional bytes.
>
> This is interesting and would proofs our assumption that the device
> don't have a FIFO :)
>
> Our assumptions (we don't have the datasheet/programming manual):
>   - HDMI part is fetching 3 bytes per HDMI pixclk
>   - Ratio between dsi-clk and hdmi-pixelclk must be 3 so the DSI and
>     HDMI are in sync. So from bandwidth pov there are no differences
>     between:
>       - HDMI: 74.25 MHz * 24 Bit  = 1782.0 MBit/s
>       - DSI:    891 MHz * 2 lanes = 1782.0 MBit/s (dsi-clock: 445.5 )
>       - DSI:  445.5 MHz * 4 lanes = 1782.0 MBit/s (dsi-clock: 222.75)
>
>     But the ratio is different and therefore the faster clocking option
>     let something 'overflow'.

I'll agree that all looks consistent.

> Anyway, but all this means that Adam should configure the
> burst-clock-rate to 445.5 and set the lanes to 4. But this doesn't work
> either and now we are back on my initial statement -> the driver needs
> some attention.

Things always need attention :-)
I suspect that it's the use of the timing generator that is the issue.
The programming guide does recommend using it for all modes, so that
would be a sensible first step.

I will say that we had a number of issues getting this chip to do
anything, and it generally seemed happier on 2 or 3 lanes instead of
4. Suffice to say that we abandoned trying to use it, despite some
assistance from ADI.

  Dave
