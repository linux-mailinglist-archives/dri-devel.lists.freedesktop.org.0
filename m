Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53567589A71
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 12:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35C949AA;
	Thu,  4 Aug 2022 10:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678CC94942
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 10:28:02 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJY59-0003UY-H3; Thu, 04 Aug 2022 12:27:59 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJY57-0001fs-D1; Thu, 04 Aug 2022 12:27:57 +0200
Date: Thu, 4 Aug 2022 12:27:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220804102757.pc7hljonea43ytwg@pengutronix.de>
References: <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
 <CAPY8ntCeUXRqNVyxU7ey6P99pZ3XAXcVHL65bdb3f0qbcK+rBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntCeUXRqNVyxU7ey6P99pZ3XAXcVHL65bdb3f0qbcK+rBA@mail.gmail.com>
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

On 22-08-03, Dave Stevenson wrote:
> On Wed, 3 Aug 2022 at 13:31, Adam Ford <aford173@gmail.com> wrote:

...

> > Mine also states the DSI source needs to provide correct video timing
> > with start and stop sync packets.
> >
> > If I remember correctly, it seemed like Marek V wanted the hard coded
> > samsung,burst-clock-frequency to go away so the clock frequency could
> > be set dynamically.
> 
> I've never worked with Exynos or imx8, but my view would be that
> samsung,burst-clock-frequency should only be used if
> MIPI_DSI_MODE_VIDEO_BURST is set in the mode_flags (it isn't for
> adv7533/5).

Some notes on that. The samsung,burst-clock-frequency is the
hs-bit-clock-rate which is twice the dsi-clock-rate. This has nothing to
do with the MIPI_DSI_MODE_VIDEO_BURST.

> Without that flag the DSI link frequency should be running at the rate
> defined by the mode clock, number of lanes, bpp, etc.

IMHO the DSI link have only to guarantee the bandwidth is sufficient for
the mode.

> From the DSI spec (v 1.1 section 8.11.1):
> "Non-Burst Mode with Sync Pulses – enables the peripheral to
> accurately reconstruct original video timing, including sync pulse
> widths."
> "RGB pixel packets are time-compressed, leaving more time during a
> scan line for LP mode (saving power) or for multiplexing other
> transmissions onto the DSI link."
> How can the peripheral reconstruct the video timing off a quirky link frequency?

If the ADV couldn't reconstruct the sync signals, then we should not get
any mode working but we get the 1080P mode working.

> Unless the Exynos DSIM_CONFIG_REG register bit DSIM_BURST_MODE [1]
> reconfigures the clock setup of the DSI block, then I don't see how
> the Exynos driver can follow the DSI spec in that regard.

Why do you think that the Exynos driver isn't following the spec? We
configure the host into video mode with sync signals which is working
for the 1080P mode.

Regards,
  Marco
