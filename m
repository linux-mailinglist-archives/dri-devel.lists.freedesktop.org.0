Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D844E366
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 09:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A36B6EB92;
	Fri, 12 Nov 2021 08:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94A36EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 08:42:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1mlS8G-0007Yx-Uq; Fri, 12 Nov 2021 09:42:00 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1mlS8F-0000Aj-W6; Fri, 12 Nov 2021 09:41:59 +0100
Date: Fri, 12 Nov 2021 09:41:59 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Tim Harvey <tharvey@gateworks.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
Message-ID: <20211112084159.GA9119@pengutronix.de>
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
 <aa73406a-7007-0d66-40ba-dd1d71780249@denx.de>
 <CAJ+vNU1fJwimBO3t42wmgBzS8t2iyj=TfL9=chPW-OMbFz1S0A@mail.gmail.com>
 <CAMty3ZAEdtMG2cco0DN93MO0De3fUAhsQVpi_qQ2r8grQbCdpg@mail.gmail.com>
 <CAMty3ZAGtZaqaU0BhW3Usbmk7FUVMT3MTzH6kcDL_7st2oecSA@mail.gmail.com>
 <CAJ+vNU2MFj5rS8pRW4+7VAdXfnjBgVECb2SDSP=KAeKZf5WYqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2MFj5rS8pRW4+7VAdXfnjBgVECb2SDSP=KAeKZf5WYqQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:35:41 up 267 days, 11:59, 129 users,  load average: 0.61, 0.34,
 0.28
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Nov 2021 13:21:03 -0800, Tim Harvey wrote:
> On Thu, Nov 11, 2021 at 2:19 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > On Wed, Nov 10, 2021 at 11:58 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > On Wed, Nov 10, 2021 at 2:24 AM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > On Tue, Nov 9, 2021 at 12:39 PM Marek Vasut <marex@denx.de> wrote:
> > > > > On 11/9/21 8:35 PM, Adam Ford wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > >> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > > >> index 208a0ed840f4..195dcbff7058 100644
> > > > > >> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > > >> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > > >> @@ -188,6 +188,12 @@
> > > > > >>                  clock-output-names = "clk_ext4";
> > > > > >>          };
> > > > > >>
> > > > > >> +       mipi_phy: mipi-video-phy {
> > > > > >> +               compatible = "fsl,imx8mm-mipi-video-phy";
> > > > > >> +               syscon = <&disp_blk_ctrl>;
> > > > > >> +               #phy-cells = <1>;
> > > > > >> +       };
> > > > > >> +
> > > > > >>          psci {
> > > > > >>                  compatible = "arm,psci-1.0";
> > > > > >>                  method = "smc";
> > > > > >> @@ -1068,6 +1074,68 @@
> > > > > >>                          #size-cells = <1>;
> > > > > >>                          ranges = <0x32c00000 0x32c00000 0x400000>;
> > > > > >>
> > > > > >> +                       lcdif: lcdif@32e00000 {
> > > > > >> +                               #address-cells = <1>;
> > > > > >> +                               #size-cells = <0>;
> > > > > >> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
> > > > > >
> > > > > > The compatible "imx6sx-lcdif" implies MXSFB_V6.  FWICT, it is like
> > > > > > MXSFB_V4, but with overlays and those overlays have more registers
> > > > > > configured in the mxsfb_kms driver.  Have you tried using imx28-lcdif
> > > > > > to see if it makes a difference?
> > > > >
> > > > > Indeed, MX6SX has AS overlay plane support, MX{2,}8 does not.
> > > > >
> > > > > LCDIFv3 (as NXP calls it) in MX8MP is like LCDIFv6 (in MX6SX) with
> > > > > slightly reordered register bits, but nothing like LCDIF rev3 (in MX23)
> > > > > ... just to make sure there is no confusion.
> > > > >
> > > > > [...]
> > > > >
> > > > > >> +                       mipi_dsi: mipi_dsi@32e10000 {
> > > > > >> +                               #address-cells = <1>;
> > > > > >> +                               #size-cells = <0>;
> > > > > >> +                               compatible = "fsl,imx8mm-mipi-dsim";
> > > > > >> +                               reg = <0x32e10000 0x400>;
> > > > > >> +                               clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > > > > >> +                                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > > > > >> +                               clock-names = "bus_clk", "sclk_mipi";
> > > > > >> +                               assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > > > > >> +                                                 <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > > > > >> +                                                 <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > > > > >> +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> > > > > >> +                                                        <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> > > > > >> +                                                        <&clk IMX8MM_VIDEO_PLL1_OUT>;
> > > > > >> +                               assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> > > > > >> +                               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > > > > >> +                               phys = <&mipi_phy 0>;
> > > > > >> +                               phy-names = "dsim";
> > > > > >> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> > > > > >> +                               samsung,burst-clock-frequency = <891000000>;
> > > > > >> +                               samsung,esc-clock-frequency = <54000000>;
> > > > > >> +                               samsung,pll-clock-frequency = <27000000>;
> > > > >
> > > > > This 27 MHz is really IMX8MM_CLK_DSI_PHY_REF and
> > > > > samsung,burst-clock-frequency is really the DSI link clock which is
> > > > > panel/bridge specific ... but, why do we need to specify such policy in
> > > > > DT rather than have the panel/bridge drivers negotiate the best clock
> > > > > settings with DSIM bridge driver ? This should be something which should
> > > > > be implemented in the DRM subsystem, not hard-coded in DT. These ad-hoc
> > > > > samsung,*-clock-frequency properties shouldn't even be needed then.
> > > > >
> > > > > Also, are the DSIM bindings stable now ?
> > > >
> > > > Thanks Marek.
> > > >
> > > > No, there is no dsim driver yet. I'm not clear if there is still
> > > > dissagreement on if the drm/exynos driver can be split up or if a
> > > > whole new somewhat duplicate driver needs to be made. I know Jagan
> > > > also has a series he is working on that uses drm/exynos which I
> > > > believe he will share an update on in a day or so.
> > > >
> > > > I'm still using the work that Michael [1] and you [2] did a long time back.
> > > >
> > > > I had this solution working on a 5.10 kernel but it was based on the
> > > > old unapproved IMX8MM blk-ctl and pd drivers. Therefore I believe the
> > > > issue I'm having is something not setup correctly with blk-ctl per my
> > > > dt settings or perhaps something missing from the blk-ctl driver like
> > > > Adam found [3]
> > > >
> > > > I am hanging at:
> > > > [    1.064088] imx_pgc_power_up gpumix
> > > > [    1.077506] imx_pgc_power_down gpumix
> > > > [    1.097685] imx8m_blk_ctrl_power_on dispblk-mipi-dsi
> > > > [    1.102682] imx_pgc_power_up dispmix
> > > > [    1.106825] imx_pgc_power_up mipi
> > > > [    1.110232] imx-dsim-dsi 32e10000.mipi_dsi: supply vddcore not
> > > > found, using dummy regulator
> > > > [    1.118760] imx-dsim-dsi 32e10000.mipi_dsi: supply vddio not found,
> > > > using dummy regulator
> > > > [    1.127361] imx-dsim-dsi 32e10000.mipi_dsi: [drm] *ERROR* modalias
> > > > failure on /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0
> > > > [    1.138676] imx8m_blk_ctrl_power_off dispblk-mipi-dsi
> > > > [    1.143788] imx_pgc_power_down mipi
> > > > [    1.145278] imx8m_blk_ctrl_power_on dispblk-lcdif
> > > > [    1.147316] imx_pgc_power_down dispmix
> > > > [    1.155804] imx_pgc_power_up dispmix
> > > > [    1.159820] [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> > > > /soc@0/bus@32c00000/mipi_dsi@32e10000 to encoder None-34: -517
> > > > ^^^ this is just a defer
> > > > [    1.171789] imx8m_blk_ctrl_power_off dispblk-lcdif
> > > > [    1.176655] imx_pgc_power_down dispmix
> > > > [    1.181790] libphy: fec_enet_mii_bus: probed
> > > > [    3.915806] panel-simple panel: Expected bpc in {6,8} but got: 0
> > > > ^^^ not sure what this is but had it back in my 5.10 solution as well
> > > > so did not investigate
> > > > [    3.921912] imx8m_blk_ctrl_power_on dispblk-mipi-dsi
> > > > [    3.926936] imx_pgc_power_up dispmix
> > > > [    3.931109] imx_pgc_power_up mipi
> > > > [    3.935409] imx8m_blk_ctrl_power_on dispblk-lcdif
> > > > [    3.940547] imx8m_blk_ctrl_power_off dispblk-lcdif
> > > > [    3.945626] [drm] Initialized mxsfb-drm 1.0.0 20160824 for
> > > > 32e00000.lcdif on minor 0
> > > > ^^^ not clear why dispblk-lcdif got disabled here
> > >
> > > I've reproduced this. look like lcdif power-domains are not notified
> > > ON. checking on the power-sequence for lcdif side. old patches from
> > > Lucas on v5.13 seems working as expected.
> >
> > I've found the issue on lcdif atomic_enable, where the bus format is
> > retrieved from NULL bus_state. Here is the diff for it.
> >
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -359,13 +359,14 @@ static void mxsfb_crtc_atomic_enable(struct
> > drm_crtc *crtc,
> >         drm_crtc_vblank_on(crtc);
> >
> >         /* If there is a bridge attached to the LCDIF, use its bus format */
> > -       if (mxsfb->bridge) {
> > +       if (mxsfb->bridge && state) {
> >                 bridge_state =
> >                         drm_atomic_get_new_bridge_state(state,
> >                                                         mxsfb->bridge);
> > -               bus_format = bridge_state->input_bus_cfg.format;
> > +               if (bridge_state)
> > +                       bus_format = bridge_state->input_bus_cfg.format;
> >'
> > I believe this can be fixed via DSIM bridge. working on for those
> > changes, the key challenges is to make the DSIM to work even for
> > exynos, which indeed blocker for me to validate in hardware (i don't
> > have DSI based exynos).
> >
> > Meanwhile, I have posed RFC for DSIM DTS changes, please check it here.
> > https://patchwork.kernel.org/project/dri-devel/cover/20211111101456.584061-1-jagan@amarulasolutions.com/
> >
> 
> Jagan,
> 
> Thank you! This does resolve the hang on my end as well. I will look
> at your 'arm64: imx8mm: Add MIPI DSI support' series.
> 
> There was some discussion regarding giving up on trying to split up
> the exynos driver such that it could work with IMX8MM vs just
> duplicating it. I thought the recommendation was to duplicate it as it
> wasn't clear if there was a way to split it out without breaking
> current exynos DSI but I'll have to see if I can find the thread.

The thread is here:

https://lore.kernel.org/all/CAKMK7uF0B1TrtVX+9Whasz49quha_is+77z2wX3c06BsWRiPcQ@mail.gmail.com/

Duplicating seems to be the best way forward, because the Exynos driver
exposes some special behavior (discussed earlier in the same thread), which
isn't compatible with how bridges work.

Michael
