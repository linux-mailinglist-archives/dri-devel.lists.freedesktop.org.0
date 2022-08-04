Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D17589C89
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6697E29;
	Thu,  4 Aug 2022 13:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7298769
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 13:23:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJaoZ-0006jS-Kq; Thu, 04 Aug 2022 15:23:03 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJaoW-0003qA-73; Thu, 04 Aug 2022 15:23:00 +0200
Date: Thu, 4 Aug 2022 15:23:00 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220804132300.suvbmppxm4osaniy@pengutronix.de>
References: <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <20220804093829.42kdelp7u4r743nv@pengutronix.de>
 <CAPY8ntBovVq1HVt_UneDF8OB9KBdEBv52o=4BCTmf9VpiODxVg@mail.gmail.com>
 <20220804125152.idyzetjqkjzgbbm2@pengutronix.de>
 <CAHCN7xKXe14z1QxrdLHNkNOmpR=txUZAt3BsEry7TymbjtDsjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKXe14z1QxrdLHNkNOmpR=txUZAt3BsEry7TymbjtDsjA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, robert.chiras@nxp.com,
 Shawn Guo <shawnguo@kernel.org>, laurentiu.palcu@nxp.com,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On 22-08-04, Adam Ford wrote:
> On Thu, Aug 4, 2022 at 7:52 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
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
> >
> > To sync up: we have two problems:
> >   1) The 720P mode with static DSI host configuration isn't working
> >      without hacks.
> 
> can you share your hacks with me about getting 720p to work?  I've
> been struggling to get 720 to work.

Here you go: https://git.pengutronix.de/cgit/mfe/linux

It has just one branch, so very easy. If you use a 8MMini-EVK with the
NXP-Adapter than you only need a proper defconfig.

> >   2) The DSI link frequency should changed as soon as required
> >      automatically. So we can provide all modes.
> >
> > I would concentrate on problem 1 first before moving on to the 2nd.
> 
> I do have some code that does #2 already. 

Unfortunately no, since we want to fix problem 1 first.

> I can clean it up and share if you want.  I've been bouncing back and
> forth between the NXP kernel and the Jagan/Fabio kernel to compare and
> with my clock change, it appears to be generating similar clocks to
> the NXP, yet it still won't sync at 720P.
> 
> >
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
> The internal timing generator is enabled by setting bit 7 of register 27.
> 
> After the timings bits are set, the generator must be reset by
> toggling bit 6.  Bits [5:0] must be 001011b
> 
> So going between CB and 8B does this task.  From what I can tell, this
> code is correct.

Okay, thanks for checking.

Regards,
  Marco

> The NXP kernel which appears to sync at a few additional resolutions
> appears to do this as well.
> 
> >
> > > I will say that we had a number of issues getting this chip to do
> > > anything, and it generally seemed happier on 2 or 3 lanes instead of
> > > 4. Suffice to say that we abandoned trying to use it, despite some
> > > assistance from ADI.
> 
> Ideally, I'd like to experiment with 2-lane as well.  Part of me
> wonders if this could be dynamic to help further adjust timings.  When
> I try to get clock settings for slower rates, it seems like the clock
> generation is off.
> 
> adam
> >
> > Even more interessting, what is your alternative to this chip?
> >
> > Regards,
> >   Marco
> 
