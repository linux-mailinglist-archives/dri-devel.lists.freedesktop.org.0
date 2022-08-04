Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF640589C6D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A49D98814;
	Thu,  4 Aug 2022 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58F987F7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 13:17:03 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJaii-0005to-S6; Thu, 04 Aug 2022 15:17:00 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oJaig-0003Yp-IU; Thu, 04 Aug 2022 15:16:58 +0200
Date: Thu, 4 Aug 2022 15:16:58 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220804131658.7iynxxvajqjtgh5k@pengutronix.de>
References: <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <CAHCN7x+HSPJpYYDgV_F91ZsPHW9Uwze8KRAqWE-XAyp5yzB9Hw@mail.gmail.com>
 <CAPY8ntCeUXRqNVyxU7ey6P99pZ3XAXcVHL65bdb3f0qbcK+rBA@mail.gmail.com>
 <20220804102757.pc7hljonea43ytwg@pengutronix.de>
 <CAPY8ntBqdv=yPZy3g8Pw=wYA39y88esT4dVH9Fkq-=V2cS56Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBqdv=yPZy3g8Pw=wYA39y88esT4dVH9Fkq-=V2cS56Nw@mail.gmail.com>
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

Hi Dave,

On 22-08-04, Dave Stevenson wrote:
> Hi Marco
> 
> On Thu, 4 Aug 2022 at 11:28, Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 22-08-03, Dave Stevenson wrote:
> > > On Wed, 3 Aug 2022 at 13:31, Adam Ford <aford173@gmail.com> wrote:
> >
> > ...
> >
> > > > Mine also states the DSI source needs to provide correct video timing
> > > > with start and stop sync packets.
> > > >
> > > > If I remember correctly, it seemed like Marek V wanted the hard coded
> > > > samsung,burst-clock-frequency to go away so the clock frequency could
> > > > be set dynamically.
> > >
> > > I've never worked with Exynos or imx8, but my view would be that
> > > samsung,burst-clock-frequency should only be used if
> > > MIPI_DSI_MODE_VIDEO_BURST is set in the mode_flags (it isn't for
> > > adv7533/5).
> >
> > Some notes on that. The samsung,burst-clock-frequency is the
> > hs-bit-clock-rate which is twice the dsi-clock-rate. This has nothing to
> > do with the MIPI_DSI_MODE_VIDEO_BURST.
> >
> > > Without that flag the DSI link frequency should be running at the rate
> > > defined by the mode clock, number of lanes, bpp, etc.
> >
> > IMHO the DSI link have only to guarantee the bandwidth is sufficient for
> > the mode.
> 
> DSI spec 8.11.3 Non-Burst Mode with Sync Events
> "This mode is a simplification of the format described in Section
> 8.11.2 (Non-Burst Mode with Sync Pulses)
> ...
> Pixels are transmitted at the same rate as they would in a
> corresponding parallel display interface such as DPI-2."
> 
> If you are running the DSI clock at anything other than that rate,
> then AIUI you are in a burst mode (although you may choose not to drop
> into LP mode).

Yes, that makes sense to me. The bandwidth on the DSI side should match
the one required on the other side (HDMI). Apart the fact that the ADV
is working in mode 8.11.2 (Non-Burst Mode with Sync Pulses).

> (One of my pet peeves that there is no documentation as to exactly
> what MIPI_DSI_MODE_VIDEO_BURST is meant to mean. Seeing as in the DSI
> spec all modes of 8.11 say that the host can drop to LP during
> blanking if time allows, it surely has to be the time compression
> element of 8.11.4 Burst Mode).

Hm.. I don't have the DSI spec either but I thought that BURST mode
allows the host to send the data as fast as possible and enter LP
afterwards.

> > > From the DSI spec (v 1.1 section 8.11.1):
> > > "Non-Burst Mode with Sync Pulses – enables the peripheral to
> > > accurately reconstruct original video timing, including sync pulse
> > > widths."
> > > "RGB pixel packets are time-compressed, leaving more time during a
> > > scan line for LP mode (saving power) or for multiplexing other
> > > transmissions onto the DSI link."
> > > How can the peripheral reconstruct the video timing off a quirky link frequency?
> >
> > If the ADV couldn't reconstruct the sync signals, then we should not get
> > any mode working but we get the 1080P mode working.
> >
> > > Unless the Exynos DSIM_CONFIG_REG register bit DSIM_BURST_MODE [1]
> > > reconfigures the clock setup of the DSI block, then I don't see how
> > > the Exynos driver can follow the DSI spec in that regard.
> >
> > Why do you think that the Exynos driver isn't following the spec? We
> > configure the host into video mode with sync signals which is working
> > for the 1080P mode.
> 
> 1080p is working with samsung,burst-clock-frequency setting?

Yes.

> As I say, I've not worked with this IP, I'm only looking at it from
> the outside having spent far too much time recently on the Pi DSI
> interface.

Good to know :)

> exynos_drm_dsi.c seems to be doing a lot of PLL computation around
> burst-clock-frequency, and nothing with the pixel clock rate.

Yes currently there is just this setting for setting the PLL freq. but
as you said for the "Non-Burst Mode with Sync Pulses" we need to
reconfigure it according the required bandwidth or the dsi-device tells
us about which dsi-link settings should be applied.

> Without knowledge of what that DSIM_BURST_MODE bit in DSIM_CONFIG_REG
> actually does in the hardware, I can only make guesses.

8<----------------------------------------------
   Selects Burst mode in Video mode

   In Non-burst mode, RGB data area is filled with RGB data and Null
   packets, according to input bandwidth of RGB interface.
   
   In Burst mode, RGB data area is filled with RGB data only.

   0 = Non-burst mode
   1 = Burst mode
8<----------------------------------------------

According the current implementation we are in Non-burst mode.

Regards,
  Marco

> Perhaps it does ditch the burst clock and switch the bit clock to be
> derived from the pixel clock of the upstream block, but that seems
> unlikely.
> 
>   Dave
> 
