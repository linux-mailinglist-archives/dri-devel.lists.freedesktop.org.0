Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF766656C0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 14:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB0B6E209;
	Thu, 11 Jul 2019 12:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398D86E209
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 12:23:10 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 26EE260093;
 Thu, 11 Jul 2019 12:23:03 +0000 (UTC)
Date: Thu, 11 Jul 2019 12:01:00 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
Message-ID: <20190711100100.cty3s6rs3w27low6@flea>
References: <20190201143102.rcvrxstc365mezvx@flea>
 <CAMty3ZC3_+z1upH4Y08R1z=Uq1C=OpWETNrBO8nGRoHhuNrHSA@mail.gmail.com>
 <20190605064933.6bmskkxzzgn35xz7@flea>
 <CAMty3ZCCP=oCqm5=49BsjwoxdDETgBfU_5g8fQ=bz=iWApV0tw@mail.gmail.com>
 <20190614142406.ybdiqfppo5mc5bgq@flea>
 <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea>
 <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea>
 <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0220686917=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0220686917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zbkqgrivmn6xbgfb"
Content-Disposition: inline


--zbkqgrivmn6xbgfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2019 at 07:52:27PM +0200, Michael Nazzareno Trimarchi wrote:
> On Wed, Jul 3, 2019 at 1:49 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, Jun 25, 2019 at 09:00:36PM +0530, Jagan Teki wrote:
> > > On Tue, Jun 25, 2019 at 8:19 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > On Thu, Jun 20, 2019 at 11:57:44PM +0530, Jagan Teki wrote:
> > > > > On Fri, Jun 14, 2019 at 7:54 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 05, 2019 at 01:03:16PM +0530, Jagan Teki wrote:
> > > > > > > On Wed, Jun 5, 2019 at 12:19 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I've reordered the mail a bit to work on chunks
> > > > > > > >
> > > > > > > > On Fri, May 24, 2019 at 03:37:42PM +0530, Jagan Teki wrote:
> > > > > > > > > > I wish it was in your commit log in the first place, instead of having
> > > > > > > > > > to exchange multiple mails over this.
> > > > > > > > > >
> > > > > > > > > > However, I don't think that's quite true, and it might be a bug in
> > > > > > > > > > Allwinner's implementation (or rather something quite confusing).
> > > > > > > > > >
> > > > > > > > > > You're right that the lcd_rate and pll_rate seem to be generated from
> > > > > > > > > > the pixel clock, and it indeed looks like the ratio between the pixel
> > > > > > > > > > clock and the TCON dotclock is defined through the number of bits per
> > > > > > > > > > lanes.
> > > > > > > > > >
> > > > > > > > > > However, in this case, dsi_rate is actually the same than lcd_rate,
> > > > > > > > > > since pll_rate is going to be divided by dsi_div:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L791
> > > > > > > > > >
> > > > > > > > > > Since lcd_div is 1, it also means that in this case, dsi_rate ==
> > > > > > > > > > dclk_rate.
> > > > > > > > > >
> > > > > > > > > > The DSI module clock however, is always set to 148.5 MHz. Indeed, if
> > > > > > > > > > we look at:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L804
> > > > > > > > > >
> > > > > > > > > > We can see that the rate in clk_info is used if it's different than
> > > > > > > > > > 0. This is filled by disp_al_lcd_get_clk_info, which, in the case of a
> > > > > > > > > > DSI panel, will hardcode it to 148.5 MHz:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L164
> > > > > > > > >
> > > > > > > > > Let me explain, something more.
> > > > > > > > >
> > > > > > > > > According to bsp there are clk_info.tcon_div which I will explain below.
> > > > > > > > > clk_info.dsi_div which is dynamic and it depends on bpp/lanes, so it
> > > > > > > > > is 6 for 24bpp and 4 lanes devices.
> > > > > > > > >
> > > > > > > > > PLL rate here depends on dsi_div (not tcon_div)
> > > > > > > > >
> > > > > > > > > Code here
> > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L784
> > > > > > > > >
> > > > > > > > > is computing the actual set rate, which depends on dsi_rate.
> > > > > > > > >
> > > > > > > > > lcd_rate = dclk_rate * clk_info.dsi_div;
> > > > > > > > > dsi_rate = pll_rate / clk_info.dsi_div;
> > > > > > > > >
> > > > > > > > > Say if the dclk_rate 148MHz then the dsi_rate is 888MHz which set rate
> > > > > > > > > for above link you mentioned.
> > > > > > > > >
> > > > > > > > > Here are the evidence with some prints.
> > > > > > > > >
> > > > > > > > > https://gist.github.com/openedev/9bae2d87d2fcc06b999fe48c998b7043
> > > > > > > > > https://gist.github.com/openedev/700de2e3701b2bf3ad1aa0f0fa862c9a
> > > > > > > >
> > > > > > > > Ok, so we agree up to this point, and the prints confirm that the
> > > > > > > > analysis above is the right one.
> > > > > > > >
> > > > > > > > > > So, the DSI clock is set to this here:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L805
> > > > > > > >
> > > > > > > > Your patch doesn't address that, so let's leave that one alone.
> > > > > > >
> > > > > > > Basically this is final pll set rate when sun4i_dotclock.c called the
> > > > > > > desired rate with ccu_nkm.c so it ended the final rate with parent as
> > > > > > > Line 8 of
> > > > > > > https://gist.github.com/openedev/700de2e3701b2bf3ad1aa0f0fa862c9a
> > > > > >
> > > > > > If that's important to the driver, it should be set explicitly then,
> > > > > > and not work by accident.
> > > > > >
> > > > > > > > > > The TCON *module* clock (the one in the clock controller) has been set
> > > > > > > > > > to lcd_rate (so the pixel clock times the number of bits per lane) here:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L800
> > > > > > > > > >
> > > > > > > > > > And the PLL has been set to the same rate here:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L794
> > > > > > > > > >
> > > > > > > > > > Let's take a step back now: that function we were looking at,
> > > > > > > > > > lcd_clk_config, is called by lcd_clk_enable, which is in turn called
> > > > > > > > > > by disp_lcd_enable here:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L1328
> > > > > > > > > >
> > > > > > > > > > The next function being called is disp_al_lcd_cfg, and that function
> > > > > > > > > > will hardcode the TCON dotclock divider to 4, here:
> > > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/disp_al.c#L240
> > > > > > > > >
> > > > > > > > > tcon_div from BSP point-of-view of there are two variants
> > > > > > > > > 00) clk_info.tcon_div which is 4 and same is set the divider position
> > > > > > > > > in SUN4I_TCON0_DCLK_REG (like above link refer)
> > > > > > > > > 01) tcon_div which is 4 and used for edge timings computation
> > > > > > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c#L12
> > > > > > > > >
> > > > > > > > > The real reason for 01) is again 4 is they set the divider to 4 in 00)
> > > > > > > > > which is technically wrong because the dividers which used during
> > > > > > > > > dotclock in above (dsi_div) should be used here as well. Since there
> > > > > > > > > is no dynamic way of doing this BSP hard-coding these values.
> > > > > > > > >
> > > > > > > > > Patches 5,6,7 on this series doing this
> > > > > > > > > https://patchwork.freedesktop.org/series/60847/
> > > > > > > > >
> > > > > > > > > Hope this explanation helps?
> > > > > > > >
> > > > > > > > It doesn't.
> > > > > > > >
> > > > > > > > The clock tree is this one:
> > > > > > > >
> > > > > > > > PLL(s) -> TCON module clock -> TCON dotclock.
> > > > > > > >
> > > > > > > > The links I mentioned above show that the clock set to lcd_rate is the
> > > > > > > > TCON module clocks (and it should be the one taking the bpp and lanes
> > > > > > > > into account), while the TCON dotclock uses a fixed divider of 4.
> > > > > > >
> > > > > > > Sorry, I can argue much other-than giving some code snips, according to [1]
> > > > > > >
> > > > > > > 00) Line 785, 786 with dclk_rate 148000000
> > > > > > >
> > > > > > > lcd_rate = dclk_rate * clk_info.dsi_div;
> > > > > > > pll_rate = lcd_rate * clk_info.lcd_div;
> > > > > > >
> > > > > > > Since dsi_div is 6 (bpp/lanes), lcd_div 1
> > > > > > >
> > > > > > > lcd_rate = 888000000, pll_rate = 888000000
> > > > > > >
> > > > > > > 01)  Line 801, 804 are final rates computed as per clock driver (say
> > > > > > > ccu_nkm in mainline)
> > > > > > >
> > > > > > > lcd_rate_set=891000000
> > > > > > >
> > > > > > > As per your comments if it would be 4 then the desired numbers are
> > > > > > > would be 592000000 not 888000000.
> > > > > > >
> > > > > > > This is what I'm trying to say in all mails, and same as verified with
> > > > > > > 2-lanes devices as well where the dsi_div is 12 so the final rate is
> > > > > > > 290MHz * 12
> > > > > >
> > > > > > In the code you sent, you're forcing a divider on the internal TCON
> > > > > > clock, while that one is fixed in the BSP.
> > > > > >
> > > > > > There's indeed the bpp / lanes divider, but it's used in the *parent*
> > > > > > clock of the one you're changing.
> > > > > >
> > > > > > And the dsi0_clk clock you pointed out in the code snippet is yet
> > > > > > another clock, the MIPI DSI module clock.
> > > > >
> > > > > Correct, look like I refereed wrong reference in the above mail. sorry
> > > > > for the noise.
> > > > >
> > > > > Actually I'm trying to explain about pll_rate here which indeed
> > > > > depends on dsi.div
> > > > > https://github.com/BPI-SINOVOIP/BPI-M64-bsp/blob/master/linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c#L786
> > > > >
> > > > > lcd_rate = dclk_rate * clk_info.dsi_div;
> > > > > pll_rate = lcd_rate * clk_info.lcd_div;
> > > > >
> > > > > Say
> > > > >
> > > > > 1) For 148MHz dclk_rate with dsi_div is 6 (24/4) lcd_div is 1 which
> > > > > resulting pll_rate is 888MHz.
> > > > >
> > > > > 2) For 30MHz dclk_rate with 4 lane and 24 RGB the resulting pll_rate is 180MHz
> > > > >
> > > > > 3) For 27.5MHz dclk_rate with 2 lane and 24 RGB the resulting pll_rate is 330MHz
> > > > >
> > > > > Here is the few more logs in code, for case 2)
> > > > >
> > > > > [    1.920441] sun4i_dclk_round_rate: min_div = 6 max_div = 6, rate = 30000000
> > > > > [    1.920505] ideal = 180000000, rounded = 178200000
> > > > > [    1.920509] sun4i_dclk_round_rate: div = 6 rate = 29700000
> > > > > [    1.920514] sun4i_dclk_round_rate: min_div = 6 max_div = 6, rate = 30000000
> > > > > [    1.920532] ideal = 1800ls and one DSI-RGB bridge. All of them do use
> > > PLL_MIPI (pll_rate) and it indeed depends on bpp/lanes
> > >00000, rounded = 178200000
> > > > > [    1.920535] sun4i_dclk_round_rate: div = 6 rate = 29700000
> > > > > [    1.920572] sun4i_dclk_recalc_rate: val = 1, rate = 178200000
> > > > > [    1.920576] sun4i_dclk_recalc_rate: val = 1, rate = 178200000
> > > > > [    1.920597] rate = 178200000
> > > > > [    1.920599] parent_rate = 297000000
> > > > > [    1.920602] reg = 0x90c00000
> > > > > [    1.920605] _nkm.n = 3, nkm->n.offset = 0x1, nkm->n.shift = 8
> > > > > [    1.920609] _nkm.k = 2, nkm->k.offset = 0x1, nkm->k.shift = 4
> > > > > [    1.920612] _nkm.m = 10, nkm->m.offset = 0x1, nkm->m.shift = 0
> > > > > [    1.920958] sun4i_dclk_set_rate div 6
> > > > > [    1.920966] sun4i_dclk_recalc_rate: val = 6, rate = 29700000
> > > > >
> > > > > and clk_summary:
> > > > >
> > > > >     pll-video0                        1        1        1   297000000
> > > > >         0     0  50000
> > > > >        hdmi                           0        0        0   297000000
> > > > >         0     0  50000
> > > > >        tcon1                          0        0        0   297000000
> > > > >         0     0  50000
> > > > >        pll-mipi                       1        1        1   178200000
> > > > >         0     0  50000
> > > > >           tcon0                       2        2        1   178200000
> > > > >         0     0  50000
> > > > >              tcon-pixel-clock         1        1        1    29700000
> > > > >         0     0  50000
> > > > >        pll-video0-2x                  0        0        0   594000000
> > > > >         0     0  50000
> > > >
> > > > This discussion is going nowhere. I'm telling you that your patch
> > > > doesn't apply the divider you want on the proper clock, and you're
> > > > replying that indeed, you're applying it on the wrong clock.
> > > >
> > > > It might work by accident in your case, but the board I have here
> > > > clearly indicates otherwise, so there's two possible way out here:
> > > >
> > > >   - Either you apply that divider to the TCON *module* clock, and not
> > > >     the dclk
> > > >
> > > >   - Or you point to somewhere in the allwinner code where the bpp /
> > > >     lanes divider is used for the dclk divider.
> > >
> > > I don't know how to proceed further on this, as you say it might work
> > > in accident but I have tested this in A33, A64 and R40 with 4
> > > different DSI panels and one DSI-RGB bridge. All of them do use
> > > PLL_MIPI (pll_rate) and it indeed depends on bpp/lanes
> > >
> > > 4-lane, 24-bit: Novatek NT35596 panel
> > > 4-lane, 24-bit: Feiyang, FY07024di26a30d panel
> > > 4-lane, 24-bit: Bananapi-s070wv20 panel
> > > 2-lane, 24-bit: Techstar,ts8550b panel
> > >
> > > and
> > >
> > > 4-lane, 24-bit, ICN6211 DSI-to-RGB bridge panel
> > >
> > > All above listed panels and bridges are working as per BSP and do
> > > follow bpp/lanes and for DIVIDER 4 no panel is working.
> >
> > Look. I'm not saying that there's no issue, I'm saying that your
> > patch, applied to the clock you're applying it to, doesn't make sense
> > and isn't what the BSP does.
>
> tcon-pixel clock is the rate that you want to achive on display side
> and if you have 4 lanes 32bit or lanes and different bit number that
> you need to have a clock that is able to put outside bits and speed
> equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> the display.

So this is what the issue is then?

This one does make sense, and you should just change the rate in the
call to clk_set_rate in sun4i_tcon0_mode_set_cpu.

I'm still wondering why that hasn't been brought up in either the
discussion or the commit log before though.

> Now in burst mode I don't know how should work the calculation of
> the clock for the require bandwidth and even I understand your
> comment I would like to have your clock tree after you boot on the
> display side and if it is possible I want to assemble a kit like you
> have.

The setup is probably going to be a bit difficult to reproduce, it's a
prototype that I have that can't really be found anywhere. Jagan asked
me on IRC for the reference, and he found the part, but it's unclear
to me if it can be easily adapted to a common board.

However, I'm not even sure we need this. I'll test the next version
and let you know if it works.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zbkqgrivmn6xbgfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXScI3AAKCRDj7w1vZxhR
xUbaAP4xJOkVcsTU6YsP7PgrbEEVYCxfND5F3dzzY7CYkSmGmAD8CWI81jn1Cfqz
2/GeGO1J8aRi/AB2z0tHebbRQkgByg0=
=rDWa
-----END PGP SIGNATURE-----

--zbkqgrivmn6xbgfb--

--===============0220686917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0220686917==--
