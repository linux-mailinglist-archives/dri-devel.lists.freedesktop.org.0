Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA4589969
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417B91756;
	Thu,  4 Aug 2022 08:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573478EF05
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 08:41:32 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJWQ2-0007xA-P9; Thu, 04 Aug 2022 10:41:26 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJWPw-00043J-Kr; Thu, 04 Aug 2022 10:41:20 +0200
Date: Thu, 4 Aug 2022 10:41:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220804084120.in435n4ofdw6ksfj@pengutronix.de>
References: <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-08-03, Adam Ford wrote:
> On Wed, Aug 3, 2022 at 1:20 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 22-08-02, Adam Ford wrote:
> >
> > ...
> >
> > > > I did some reading about the internal timing generator.  It appears
> > > > that it's required when video formats use fractional bytes, and it's
> > > > preconfigured to run at 720p by default, but registers 28h through 37h
> > > > configure it for other video modes.
> > >
> > > I think there may still be some issues with the DSIM since some of the
> > > clock frequencies are set in the device tree.
> > >
> > > From what I can tell, the pixel rate is calculated based on the
> >
> > By pixel rate you mean the HDMI pixel rate from the ADV? If so then yes.
> > The ADV has an divider which is already configured by the driver but
> > meaningless since the driver is lacking of setting the "manual-divider"
> > bit within the same register.
> 
> I was thinking about the pixel clock from the DSI to the ADV.  I did
> see the manual-divider bit was missing.  I tried enabling that bit,
> but it didn't appear to make much difference.

This depends, e.g. I saw that the HDMI pixel clock is correct if I had
set this bit, set the divider manually to 6 and configured the dsi-host
burst clock to 891MHz:
  -> 891MHz / 2 = 445.5 (DSI-Clock) -> 445.5 / 6 = 74.25 (HDMI pixel
  clock for 720P)

Of course this doesn't happen automatically yet :( I also find it a bit
of too reduce the lane line, I had removed this logic too. But as I
said, I got no frames shown on my HDMI monitor.

...

> > > samsung,burst-clock-frequency = <1500000000>;
> >
> > This is not correct since the burst-clock-freq. specifies the hs-clock
> > for the data lanes (see above).
> 
> But I don't think the clock should be fixed. I think it should vary as
> the resolution changes. 

You're right and this is something we have on our TODO list as well. But
this needs a bit more work within the DRM framework. So the client and
the host can negotiate the frequency.

Remember our main problem: with a correct burst-clock-frequency set and
lane number set for 720P, the ADV don't display anything.

> From what I can tell, NXP's DSI code doesn't
> hard code this value, but it does appear to cap it at 1.5G.  I did
> soom looking into the NXP frequency calculation

Can you provide me a link? There are a lot frequencies involved in this
discussion ^^ Just that I look at the same location.

> and it is capable of adjusting resolutions to some extent and from
> what I can see the 891MHz clock is only set when 1080p.  At 720p,
> thier kernel shows the output frequency at  445.5 MHz. 

Yes, we need the dynamic handling but hardcoding it isn't the way we
should go either. We have the dynamic PLL calculation, so we can
configure it to all possible values not just a few VESA standards.

> The way the DSIM is currently configured, it's fixed at 891MHz, so I
> don't expect the output feeding the adv7535 to be correct for the
> different resolutions.

Why not? The ADV can work with that hs-clock and for 720P@60 we need a
bandwidth of roughly (only pixels no package header/footer overhead):

  1280x720x24x60 = 1327104000 Bit/s = 1327.104 MBit/s

With 891MHz and 2 lanes we have

  891MBps * 2 = 1782000000 Bit/s = 1782 MBit/s

So this should be fine. With 445.5 MHz and 2 lanes we have not enough
bandwidth and with 445.5 MHz and 4 lanes we have exactly the same
bandwidth.

Therefore I still think that there is problem within the ADV.

...

> > > With these settings and the above mentioned code changes, 1080p still
> > > appears, however when attempting other modes, the display still fails
> > > to load.  I also noticed that the phy ref clock is set to 27MHz
> > > instead of NXP's 12MHz.
> >
> > That's interesting, I didn't noticed that NXP uses 12 MHz as refclock
> > but I don't think that this is the problem. Since we have other
> > converter chips using the bridge driver and they work fine. I still
> > think that the main problem is within the ADV driver.
> 
> Do the other converter chips work fine at different resolutions?

Yes.

> 
> >
> > > I attempted to play with that setting, but I couldn't get 1080p to
> > > work again, so I backed it out.
> > >
> > > Maybe I am headed in the wrong direction, but I'm going to examine the
> > > P/M/S calculation of the timing on NXP's kernel to see how the DSIM in
> > > this code compares.
> >
> > I think the pms values are fine.
> 
> I compared the P/M/S values between this driver and NXP's and they
> calculate different values of PMS when running at 1080P.

NXP don't calculate anything if I remember correctly, they just provide
PLL values so they reach the frequency. On the other hand with the
patches from Jagan we can configure the PLL to what-ever value :)

> NXP @ 1080p:
> fout = 891000, fin = 12000, m = 297, p = 2, s = 1, best_delta = 0
> 
> This kernel @ 1080p:
> 
> PLL freq 891000000, (p 3, m 99, s 0)

As you said, we use a differnet fin value 27MHz instead of the 12MHz so
those values must be different.

> at 720P, the NXP Kernel
> fout = 445500, fin = 12000, m = 297, p = 2, s = 2, best_delta = 0
> (working)
> 
> at 720P, this kernel:
> PLL freq 891000000, (p 3, m 99, s 0)
> hs_clk = 891000000, byte_clk = 111375000, esc_clk = 18562500
> (not working)

Yes, as I said you need to configure the PLL manually (see above).

> > > If someone who understands the interactions between these different
> > > components has suggestions, I'm willing to run some experiments.
> >
> > Did managed to get access to the ADV7535 programming guide? This is the
> > black box here. Let me check if I can provide you a link with our repo
> > so you can test our current DSIM state if you want.
> 
> I do have access to the programming guide, but it's under NDA, but
> I'll try to answer questions if I can.

Thanks a lot for your work :)

Regards,
  Marco
