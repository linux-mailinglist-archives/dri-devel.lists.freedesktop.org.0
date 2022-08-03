Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47529588749
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 08:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A910F98F;
	Wed,  3 Aug 2022 06:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E310F62E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 06:20:45 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJ7kF-0003De-Qv; Wed, 03 Aug 2022 08:20:39 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJ7k0-0002E4-PY; Wed, 03 Aug 2022 08:20:24 +0200
Date: Wed, 3 Aug 2022 08:20:24 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220803062024.vn7awasmifkp5xow@pengutronix.de>
References: <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
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

On 22-08-02, Adam Ford wrote:

...

> > I did some reading about the internal timing generator.  It appears
> > that it's required when video formats use fractional bytes, and it's
> > preconfigured to run at 720p by default, but registers 28h through 37h
> > configure it for other video modes.
>
> I think there may still be some issues with the DSIM since some of the
> clock frequencies are set in the device tree.
> 
> From what I can tell, the pixel rate is calculated based on the

By pixel rate you mean the HDMI pixel rate from the ADV? If so then yes.
The ADV has an divider which is already configured by the driver but
meaningless since the driver is lacking of setting the "manual-divider"
bit within the same register.

> burst-clock-frequency and that generates a byte clock.  For 891000000,
> the byte clock is 111375000.

The burst-clock-frequency is the hs-clk and DDR. So the MIPI-DSI clock
is burst-clock-frequency/2 which is in your case: 891000000/2 =
445500000. This clock is than divided by 3 within the ADV and you get
your 148500000 pixel clock. This divide by 3 is detected automatically
by the ADV due to the missing bit (see above).

> Modetest timings for 1080p show:
> 
> index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
>   #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
> flags: nhsync, nvsync; type: driver
> 
> 
> When looking at modetest, there is a clock for 1080p which appears to be 148500.
> 111375000/148500 = 750.

Please see above.

> The rest of the entries in my table do not divide evenly.  I don;t
> know if that explains the lack of display, but it's something to note.
> It seems to me that instead of fixing the
> samsung,burst-clock-frequency to 891000000, we should make the desired
> PLL related to the desired pixel clock so it divides evenly.

Please see above.

> Looking at NXP's kernel, I also noticed that their esc_prescaler is
> based on the byte clock divided by 20MHz.  With some small code
> changes to get the PLL based on the desired pixel clock instead of
> hard-coded,  I was able to set
> 
> samsung,burst-clock-frequency = <1500000000>;

This is not correct since the burst-clock-freq. specifies the hs-clock
for the data lanes (see above).

> samsung,esc-clock-frequency = <20000000>;

This is correct, we also use a esc-clock of 20MHz.

> With these settings and the above mentioned code changes, 1080p still
> appears, however when attempting other modes, the display still fails
> to load.  I also noticed that the phy ref clock is set to 27MHz
> instead of NXP's 12MHz. 

That's interesting, I didn't noticed that NXP uses 12 MHz as refclock
but I don't think that this is the problem. Since we have other
converter chips using the bridge driver and they work fine. I still
think that the main problem is within the ADV driver.

> I attempted to play with that setting, but I couldn't get 1080p to
> work again, so I backed it out.
> 
> Maybe I am headed in the wrong direction, but I'm going to examine the
> P/M/S calculation of the timing on NXP's kernel to see how the DSIM in
> this code compares.

I think the pms values are fine.

> If someone who understands the interactions between these different
> components has suggestions, I'm willing to run some experiments.

Did managed to get access to the ADV7535 programming guide? This is the
black box here. Let me check if I can provide you a link with our repo
so you can test our current DSIM state if you want.

Regards,
  Marco
