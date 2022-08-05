Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25A58A410
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 02:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D689702C;
	Fri,  5 Aug 2022 00:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D8DAB54D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 00:05:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x21so1560299edd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gsGGPxAFQbPGQpDuay5H4e/BwFqybiw3htx2qLQDm2I=;
 b=QHjb3Zuo//MXAKQPKfrs3vVH4nTMd0bBCbL4DfX2tbvLKoOuc/v7D3JDqfKZuFrcIr
 Br7A5LH6vv+AAh2ocrAqCp9a8MSbMrdwCdgCi5aqv2ByzPWlDQ2kl6jcF2V80BKjFqEZ
 EKh56TkJ7xWxhONlwjZ7BhOtC6np6I7ck/1aNMd0JZT+OR5jfAnADYJm+BiPlo3PY5Ir
 3U6D4XixXxxPX3RxmxLciAnEA/9dgcs5jiHppdSoOvsaoFKOoU4r97KwS0Ia2xt7BLGh
 +7v5cyFtfWU953toeK0uqgHvPejnNRUIhIm7IE1Fls4PsImtRlRhc9NyJiI+5JQbKTwN
 n1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gsGGPxAFQbPGQpDuay5H4e/BwFqybiw3htx2qLQDm2I=;
 b=WD+RBuo/ULk7owD08uN0Fs4v5hfavVNcn6vIPxRR/TiAxqbu1KEpEy+p1637qz807W
 u42wtwHzWFAk10c1szgiSSnvEQt0ZqkSnMN7B8+LoUUTKapBQdcnGv9igzZWLSo6MnZu
 umU5rXW2ZSRwaqVswqr+yVlM9sSIQR8m6eJWchmwIRgliIJFsCRvrgibIsFUrJtIB/Pp
 1byqgI3YwTnOQReKA5pg5rNU+dmrShugGBX05jTw1SwVuniBIsf+0PmGpKAqkRfAGRVz
 A/piz2xpru0M3yxcm5VmYX3qDXs28Xw0M8ThRQFva2g8JnTeQJutBhtBvLBl9eI40Hcv
 SHTw==
X-Gm-Message-State: ACgBeo3Y7BrcumxSnyn65KA7UwO6sxMOiY3R+vIXpzpEjZP5+LITIq0F
 pyJaQBcZS/0qACeCqGxMtxTvIadh2vY2jOpVFxk=
X-Google-Smtp-Source: AA6agR4k06l9foPALtOj13OoPQfcUaayxqlXJ/Lve/9Ril1KTiLOakYyVvgJ/x9mpM5i4lhnFV+wo4bJUMMI9lSTJ7I=
X-Received: by 2002:a05:6402:2079:b0:43d:a218:9b8a with SMTP id
 bd25-20020a056402207900b0043da2189b8amr4190111edb.357.1659657958138; Thu, 04
 Aug 2022 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <20220804093829.42kdelp7u4r743nv@pengutronix.de>
 <CAPY8ntBovVq1HVt_UneDF8OB9KBdEBv52o=4BCTmf9VpiODxVg@mail.gmail.com>
 <20220804125152.idyzetjqkjzgbbm2@pengutronix.de>
 <CAPY8ntAatYvbf5ehfsj4qcSDC=sODeN1Cj0vDjn6p0M=k320NA@mail.gmail.com>
In-Reply-To: <CAPY8ntAatYvbf5ehfsj4qcSDC=sODeN1Cj0vDjn6p0M=k320NA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 Aug 2022 19:05:46 -0500
Message-ID: <CAHCN7x+DkJgGvMLnYBXscSMDmTCeaHeJKK6T9eLUm+rXSx=NQA@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, robert.chiras@nxp.com,
 NXP Linux Team <linux-imx@nxp.com>, laurentiu.palcu@nxp.com,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 9:52 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Thu, 4 Aug 2022 at 13:51, Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi Dave,
> >
> > On 22-08-04, Dave Stevenson wrote:
> > > Hi Marco
> > >
> > > On Thu, 4 Aug 2022 at 10:38, Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > >
> > > > Hi Dave, Adam,
> > > >
> > > > On 22-08-03, Dave Stevenson wrote:
> > > > > Hi Adam
> > > > >
> > > > > On Wed, 3 Aug 2022 at 12:03, Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > Did managed to get access to the ADV7535 programming guide? This is the
> > > > > > > black box here. Let me check if I can provide you a link with our repo
> > > > > > > so you can test our current DSIM state if you want.
> > > > > >
> > > > > > I do have access to the programming guide, but it's under NDA, but
> > > > > > I'll try to answer questions if I can.
> > > > >
> > > > > Not meaning to butt in, but I have datasheets for ADV7533 and 7535
> > > > > from previously looking at these chips.
> > > >
> > > > Thanks for stepping into :)
> > > >
> > > > > Mine fairly plainly states:
> > > > > "The DSI receiver input supports DSI video mode operation only, and
> > > > > specifically, only supports nonburst mode with sync pulses".
> > > >
> > > > I've read this also, and we are working in nonburst mode with sync
> > > > pulses. I have no access to an MIPI-DSI analyzer therefore I can't
> > > > verify it.
> > > >
> > > > > Non-burst mode meaning that the DSI pixel rate MUST be the same as the
> > > > > HDMI pixel rate.
> > > >
> > > > On DSI side you don't have a pixel-clock instead there is bit-clock.
> > >
> > > You have an effective pixel clock, with a fixed conversion for the
> > > configuration.
> > >
> > > DSI bit-clock * number of lanes / bits_per_pixel = pixel rate.
> > > 891Mbit/s * 4 lanes / 24bpp = 148.5 Mpixels/s
> >
> > Okay, I just checked the bandwidth which must equal.
> >
> > > As noted elsewhere, the DSI is DDR, so the clock lane itself is only
> > > running at 891 / 2 = 445.5MHz.
> > >
> > > > > Section 6.1.1 "DSI Input Modes" of adv7533_hardware_user_s_guide is
> > > > > even more explicit about the requirement of DSI timing matching
> > > >
> > > > Is it possible to share the key points of the requirements?
> > >
> > > "Specifically the ADV7533 supports the Non-Burst Mode with syncs. This
> > > mode requires real time data generation as a pulse packet received
> > > becomes a pulse generated. Therefore this mode requires a continuous
> > > stream of data with correct video timing to avoid any visual
> > > artifacts."
> > >
> > > LP mode is supported on data lanes. Clock lane must remain in HS mode.
> > >
> > > "... the goal is to accurately convey DPI-type timing over DSI. This
> > > includes matching DPI pixel-transmission rates, and widths of timing
> > > events."
> >
> > Thanks for sharing.
> >
> > > > > The NXP kernel switching down to an hs_clk of 445.5MHz would therefore
> > > > > be correct for 720p operation.
> > > >
> > > > It should be absolute no difference if you work on 891MHz with 2 lanes
> > > > or on 445.5 MHz with 4 lanes. What must be ensured is that you need the
> > > > minimum required bandwidth which is roughly: 1280*720*24*60 = 1.327
> > > > GBps.
> > >
> > > Has someone changed the number of lanes in use? I'd missed that if so,
> > > but I'll agree that 891MHz over 2 lanes should work for 720p60.
> >
> > The ADV driver is changing it autom. but this logic is somehow odd and
> > there was already a approach to stop the driver doing this.
>
> I'd missed that bit in the driver where it appears to drop to 3 lanes
> for pixel clock < 80000 via a mipi_dsi_detach and _attach. Quirky, but
> probably the only way it can be achieved in the current framework.
>
> > To sync up: we have two problems:
> >   1) The 720P mode with static DSI host configuration isn't working
> >      without hacks.
> >   2) The DSI link frequency should changed as soon as required
> >      automatically. So we can provide all modes.
> >
> > I would concentrate on problem 1 first before moving on to the 2nd.
>
> If you change your link frequency, it may be worth trying a lower
> resolution again such as 720x480 @ 60fps on 2 lanes. (720480@60 on 4
> lanes is again listed as mandatory for using the timing generator).
>
> > > I have just noted that 720p59.94 at 24bpp on 4 lanes is listed as one
> > > of the modes that is mandatory to use the timing generator (reg 0x27
> > > bit 7 = 1). On 2 lanes it is not required.
> > > I don't know why it's referencing the 1000/1001 pixel clock rates and
> > > not the base one, as it's only a base clock change with the same
> > > timing (74.176MHz clock instead of 74.25MHz).
> >
> > Interesting! I would like to know how the HDMI block gets fetched by the
> > DSI block and how the timing-generator can influence this in good/bad
> > way. So that we know what DSI settings (freq, lanes) are sufficient.
> >
> > > > > If you do program the manual DSI divider register to allow a DSI pixel
> > > > > rate of 148.5MHz vs HDMI pixel rate of 74.25MHz, you'd be relying on
> > > >
> > > > There is no such DSI pixel rate to be precise, we only have a DSI bit
> > > > clock/rate.
> > > >
> > > > > the ADV753x having at least a half-line FIFO between DSI rx and HDMI
> > > > > tx to compensate for the differing data rates. I see no reference to
> > > > > such, and I'd be surprised if it was more than a half dozen pixels to
> > > > > compensate for the jitter in the cases where the internal timing
> > > > > generator is mandatory due to fractional bytes.
> > > >
> > > > This is interesting and would proofs our assumption that the device
> > > > don't have a FIFO :)
> > > >
> > > > Our assumptions (we don't have the datasheet/programming manual):
> > > >   - HDMI part is fetching 3 bytes per HDMI pixclk
> > > >   - Ratio between dsi-clk and hdmi-pixelclk must be 3 so the DSI and
> > > >     HDMI are in sync. So from bandwidth pov there are no differences
> > > >     between:
> > > >       - HDMI: 74.25 MHz * 24 Bit  = 1782.0 MBit/s
> > > >       - DSI:    891 MHz * 2 lanes = 1782.0 MBit/s (dsi-clock: 445.5 )
> > > >       - DSI:  445.5 MHz * 4 lanes = 1782.0 MBit/s (dsi-clock: 222.75)
> > > >
> > > >     But the ratio is different and therefore the faster clocking option
> > > >     let something 'overflow'.
> > >
> > > I'll agree that all looks consistent.
> > >
> > > > Anyway, but all this means that Adam should configure the
> > > > burst-clock-rate to 445.5 and set the lanes to 4. But this doesn't work
> > > > either and now we are back on my initial statement -> the driver needs
> > > > some attention.
> > >
> > > Things always need attention :-)
> >
> > ^^
> >
> > > I suspect that it's the use of the timing generator that is the issue.
> > > The programming guide does recommend using it for all modes, so that
> > > would be a sensible first step.
> >
> > But I tested it without the timing-generator too. Can you or Adam verify
> > the timing-generator diable logic?
>
> Sorry, running without the use of the timing generator is the issue.
> It is mandatory in some modes, but supported in all modes. Always
> using it should therefore avoid not using it in one of the mandatory
> modes (the list looks a little arbitrary).
>
> > > I will say that we had a number of issues getting this chip to do
> > > anything, and it generally seemed happier on 2 or 3 lanes instead of
> > > 4. Suffice to say that we abandoned trying to use it, despite some
> > > assistance from ADI.
> >
> > Even more interessting, what is your alternative to this chip?
>
> BCM2711 which supported dual HDMI natively.
> Our investigation of ADV7535 was when trying to build what became
> Pi400 using BCM2710/BCM2837 (only has a single HDMI output). Whilst I
> do have the prototype, the ADV was wired up weirdly with I2C so I
> never really got it running with Linux.

I think I have convinced myself that the DSIM is working good enough
to match that of the NXP.

I've gone through and made a list of the register differences between
a working display using NXP's kernel and
the non-working display.  I've identified a small handful of registers
on both the CEC bank of registers and main set of registers.

I noticed that the working NXP version doesn't rescale the number of
lanes based on the clock rate, and it stays fixed at 4 lanes.

That might actually explain some of the issues I am seeing on their
kernel still not syncing at low resolutions.

I'm going to try to go through the code and identify other differences
and see if I can hack this version of the ADv7535 driver to get it
into a similar working state as the NXP one (not that theirs is the
best).  With a couple of the hacks, I can get my screen to sync, but
it just displays blue, so I think I am making some progress.

I should have a few more hours tomorrow to work on this.  It's a
side-project for me, but I have time over the weekend too.

adam
>
>   Dave
