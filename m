Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BF589A32
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6914A406;
	Thu,  4 Aug 2022 09:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BE789DB0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 09:57:20 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJXbR-000870-GW; Thu, 04 Aug 2022 11:57:17 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJXbP-0007zS-7a; Thu, 04 Aug 2022 11:57:15 +0200
Date: Thu, 4 Aug 2022 11:57:15 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220804095715.d3ay7yvn2adxdo4x@pengutronix.de>
References: <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
 <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
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

On 22-08-03, Adam Ford wrote:
> On Wed, Aug 3, 2022 at 7:17 AM Dave Stevenson

...

> > Not meaning to butt in, but I have datasheets for ADV7533 and 7535
> > from previously looking at these chips.
> 
> Thanks for the feedback.
> 
> > Mine fairly plainly states:
> > "The DSI receiver input supports DSI video mode operation only, and
> > specifically, only supports nonburst mode with sync pulses".
> > Non-burst mode meaning that the DSI pixel rate MUST be the same as the
> > HDMI pixel rate.
> 
> Mine also states the DSI source needs to provide correct video timing
> with start and stop sync packets.
> 
> If I remember correctly, it seemed like Marek V wanted the hard coded
> samsung,burst-clock-frequency to go away so the clock frequency could
> be set dynamically.

As previously said, this is something on our TODO list too :) but needs
a bit more infrastructure work.

> I have attempted to do some of this work based on what I am seeing in
> the NXP kernel, and I get get my monitor to sync at some resolutions,
> but the screen is usually all green or all blue, so it's not really a
> success. The clock part appears to be good enough to make the monitor
> see some sort of signal, so I am going to investigate the calculation
> of the rest of the video timings to see if I can fix the color issue.

Please don't pay to much attention to the NXP kernel. No one have a glue
where those porches came from. If I specify the burst-clock-freq. to
445.5 and set the lane number to 4 and hack in the porches values from
NXP, than I get a 720P output too. But this isn't the way to go instead
we should calc the porches settings and the burst-clock-frequency
dynamiclly to provide more than just a few resolutions. But for that we
need a clear understanding of how the ADV is working.

I will prepare a repo to day and will send you a link with the hack
patches in it, so you can test it :)

Regards,
  Marco
