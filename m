Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E1798500
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC0410E00A;
	Fri,  8 Sep 2023 09:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E28010E00A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 09:48:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeY5q-0006z5-7k; Fri, 08 Sep 2023 11:48:02 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeY5m-004qk7-Ut; Fri, 08 Sep 2023 11:47:58 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeY5m-003H19-Ih; Fri, 08 Sep 2023 11:47:58 +0200
Date: Fri, 8 Sep 2023 11:47:58 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
Subject: Re: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
Message-ID: <20230908094758.GB767994@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
 <CAAQKjZODcKE_O-Nb_qym0BqAZymUu9j24d+8-UXFsFQekJ=unw@mail.gmail.com>
 <CGME20230904111544epcas1p13a72637ff0351af5760ad958e5d11de9@epcas1p1.samsung.com>
 <20230904111520.GC224131@pengutronix.de>
 <001001d9dfd8$3444bbb0$9cce3310$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001001d9dfd8$3444bbb0$9cce3310$@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>,
 'Robert Foss' <rfoss@kernel.org>, kernel@pengutronix.de,
 'Jonas Karlman' <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 'Jagan Teki' <jagan@amarulasolutions.com>,
 'Jernej Skrabec' <jernej.skrabec@gmail.com>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 'Marek Szyprowski' <m.szyprowski@samsung.com>,
 'Laurent Pinchart' <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Sep 2023 18:06:06 +0900, 대인기/Tizen Platform Lab(SR)/삼성전자 wrote:
> 
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Michael Tretter
> > Sent: Monday, September 4, 2023 8:15 PM
> > To: Inki Dae <daeinki@gmail.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss
> > <rfoss@kernel.org>; Jonas Karlman <jonas@kwiboo.se>; dri-
> > devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Jernej Skrabec
> > <jernej.skrabec@gmail.com>; Laurent Pinchart
> > <Laurent.pinchart@ideasonboard.com>; Andrzej Hajda
> > <andrzej.hajda@intel.com>; Marek Szyprowski <m.szyprowski@samsung.com>;
> > kernel@pengutronix.de; Jagan Teki <jagan@amarulasolutions.com>
> > Subject: Re: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference
> > clock
> > 
> > On Mon, 04 Sep 2023 14:44:41 +0900, Inki Dae wrote:
> > > 2023년 8월 29일 (화) 오전 12:59, Michael Tretter <m.tretter@pengutronix.de>
> > 님이 작성:
> > > >
> > > > The PLL requires a clock between 2 MHz and 30 MHz after the pre-
> > divider.
> > > > The reference clock for the PLL may change due to changes to it's
> > parent
> > > > clock. Thus, the frequency may be out of range or unsuited for
> > > > generating the high speed clock for MIPI DSI.
> > > >
> > > > Try to keep the pre-devider small, and set the reference clock close
> > to
> > > > 30 MHz before recalculating the PLL configuration. Use a divider with
> > a
> > > > power of two for the reference clock as this seems to work best in
> > > > my tests.
> > >
> > > Clock frequency is specific to SoC architecture so we have to handle
> > > it carefully because samsung-dsim.c is a common module for I.MX and
> > > Exynos series.
> > > You mentioned "The PLL requires a clock between 2 MHz and 3MHz after
> > > pre-divider", and the clock means that fin_pll - PFD input frequency -
> > > which can be calculated with oscillator clock frequency / P value?
> > > According to Exynos datasheet, the fin_pll should be 6 ~ 12Mhz.
> > >
> > > For example,
> > > In case of Exyhos, we use 24MHz as oscillator clock frequency, so
> > > fin_pll frequency, 8MHz = 24MHz / P(3).
> > >
> > > Can you tell me the source of the constraint that clocks must be
> > > between 2MHz and 30MHz?
> > 
> > The source is the i.MX8M Nano reference manual, Table 13-40. DPHY PLL
> > Parameters. It documents that the P divider frequency (fin_pll) has a
> > frequency range of 2 MHz to 30 MHz. According to the same table, the input

Small clarification: These are the corrected limits of TRM rev. 1. In TRM rev.
0 the limits are incorrectly specified as 6 MHz to 12 MHz.

> 
> In case of Exynos, the range is from 6MHz to 12MHz according to Exynos4212 reference manual, Table 1-5.
> 
> > frequency (fin) has a range of 6 MHz to 300 MHz.
> 
> In case of Exynos, the range is from 6MHz to 200MHz.
> 
> > 
> > Is the table incorrect?
> 

> It's correct for I.MX but incorrect for Exynos. I think it would mean that
> the valid range depends on SoC architecture. So I'd say that this patch is
> specific to I.MX.

I understand.

> This was one of what I concerted about when trying to move
> samsung-dsim.c module to bridge directory for common use between I.MX and
> Exynos Platforms, and this will be what we have to solve together - I.MX and
> Exynos engineers. How about using platform specific data -
> samsung_dsim_driver_data structure?
> 
> I.e,
> 
> static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
>     ...
>     .min_fin_pll = 2,
>     .max_fin_pll = 30,
>     ...
> };
> 
> static const struct samsung_dsim_driver_data exynosxxxx_dsi_driver_data = {
>     ...
>     .min_fin_pll = 6,
>     .max_fin_pll = 12,
>     ...
> };

Extending the samsung_dsim_driver_data sounds reasonable. There are already
other frequency limits specified. I will implement this in v2.

> 
> And then,
> 
> while (fin > driver_data->max_fin_pll * MHZ)
>     fin = fin / 2;
> 
> > 
> > I also tried to always set the reference clock to 24 MHz, but depending on
> > the
> > display clock this isn't always possible.
> 

> According to dt binding, if samsung,pll-clock-frequency exists then we have
> to use it first. I'm not sure but could we check if the pll_clk_rate is
> valid or not depending on the given display clock in advance? If so then
> maybe we could update the pll_clk_rate correctly by reading the pll_clk
> frequency again.

If samsung,pll-clock-frequency is set, the driver will neither check nor
update the pll_clk, but assume that the clocks are configured correctly. Thus,
the author of the device tree is responsible for selecting and configuring
valid clocks.

I observed that if I set pll_clk to any fixed value for different modes, the
clock framework may use a different clock rate depending on what is possible.
This may result in a reference clock that uses a fractional divider to get the
pll_clk_rate or cannot exactly produce the hs_clock. These situations cause
sync issues on the display.

Checking, if the current pll_clk_rate would involve the pix_clk, the hs_clock,
and the parent of the pll_clk. It may be possible, but I don't see a problem
with calculating a suitable pll_clk_rate, updating the pll_clk, and then
configuring the PLL to generate the hs_clock.

Michael

> 
> Thanks,
> Inki Dae
> 
> > 
> > Michael
> > 
> > >
> > > To other I.MX and Exynos engineers, please do not merge this patch
> > > until two SoC platforms are tested correctly.
> > >
> > > Thanks,
> > > Inki Dae
> > >
> > > >
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > ---
> > > >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++++++--
> > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > index da90c2038042..4de6e4f116db 100644
> > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > @@ -611,10 +611,21 @@ static unsigned long samsung_dsim_set_pll(struct
> > samsung_dsim *dsi,
> > > >         u16 m;
> > > >         u32 reg;
> > > >
> > > > -       if (dsi->pll_clk)
> > > > +       if (dsi->pll_clk) {
> > > > +               /*
> > > > +                * Ensure that the reference clock is generated with a
> > power of
> > > > +                * two divider from its parent, but close to the PLLs
> > upper
> > > > +                * limit of the valid range of 2 MHz to 30 MHz.
> > > > +                */
> > > > +               fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
> > > > +               while (fin > 30 * MHZ)
> > > > +                       fin = fin / 2;
> > > > +               clk_set_rate(dsi->pll_clk, fin);
> > > > +
> > > >                 fin = clk_get_rate(dsi->pll_clk);
> > > > -       else
> > > > +       } else {
> > > >                 fin = dsi->pll_clk_rate;
> > > > +       }
> > > >         dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> > > >
> > > >         fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
> > > >
> > > > --
> > > > 2.39.2
> > > >
> > >
> 
> 
> 
