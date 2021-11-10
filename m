Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B944C6C4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 19:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276CB6EE52;
	Wed, 10 Nov 2021 18:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C5B6EE52
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 18:28:29 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m14so14462120edd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/WLu8RX9+xl8RqHYV5cjf4mY+9HpmgdbUmDUWKA72w=;
 b=lZeHvPBUPThZctbjFEkE6deqngPECcufvK4pTIPsCKOlv3Ucn3Gwx5mPP9GV6NcsZG
 9T/vX6CpzwhWNygmnbW48XQZHvSlirQky7QEX4E10Urs8GzNyn0r7LIbPyhD1y9/6x9R
 WkWGKy/dG5ZvMKM1U1lAKbQr1nyq+n9xhLg04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/WLu8RX9+xl8RqHYV5cjf4mY+9HpmgdbUmDUWKA72w=;
 b=BvA5udGPwfM3g/2Cw+WE77299oVi0lMZ0qgJ/iefWgEDYk1o9oTb/mS1cv1A6eZiaq
 HugKpfZdS3ZRiFGC+Jd1A95TGxrYa2OXpt7s+NKxWEanjPnTKqv68nOUA8RTsFiVpmic
 i728q1vQ5bpuwt8yzrBcds41BdxQIahgQYBm3XLiaPM+5IJdvv96ZkvL5/GKkB9CbrG9
 +J+cxoNQT5yRfVRA90TEqJObPTtvoL4Y8m4GnYAmjRJ4liYM9n5qfvv0KtKZ4Hk6jJNx
 1g3FW3dTnZtgJ0beYtIlWD30Fq0I/LgowD9t3HgiLeGTE5HZmJ/6WcOf3zjQ34Gke/xK
 odsw==
X-Gm-Message-State: AOAM531Lzdf8zLUeYYnJO/SWeVL76cUMjSeVyay8/bf8hYeUJxCUpRWV
 gZViTYrjhrujNcfTlLV7mFVFcGLWplYzlqRx1j77zw==
X-Google-Smtp-Source: ABdhPJwBvwGxd5fqOP/ePLOf4L2HeVAjy4fuKeXiy9MhxS5SMLLdtyHXnLpl5BsVj/Rdw3H/PpKZS8WiG1sDyhJBsEI=
X-Received: by 2002:a17:907:1c82:: with SMTP id
 nb2mr1473905ejc.218.1636568907435; 
 Wed, 10 Nov 2021 10:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
 <aa73406a-7007-0d66-40ba-dd1d71780249@denx.de>
 <CAJ+vNU1fJwimBO3t42wmgBzS8t2iyj=TfL9=chPW-OMbFz1S0A@mail.gmail.com>
In-Reply-To: <CAJ+vNU1fJwimBO3t42wmgBzS8t2iyj=TfL9=chPW-OMbFz1S0A@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 10 Nov 2021 23:58:16 +0530
Message-ID: <CAMty3ZAEdtMG2cco0DN93MO0De3fUAhsQVpi_qQ2r8grQbCdpg@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tomm.merciai@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 2:24 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Tue, Nov 9, 2021 at 12:39 PM Marek Vasut <marex@denx.de> wrote:
> >
> > On 11/9/21 8:35 PM, Adam Ford wrote:
> >
> > [...]
> >
> > >> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > >> index 208a0ed840f4..195dcbff7058 100644
> > >> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > >> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > >> @@ -188,6 +188,12 @@
> > >>                  clock-output-names = "clk_ext4";
> > >>          };
> > >>
> > >> +       mipi_phy: mipi-video-phy {
> > >> +               compatible = "fsl,imx8mm-mipi-video-phy";
> > >> +               syscon = <&disp_blk_ctrl>;
> > >> +               #phy-cells = <1>;
> > >> +       };
> > >> +
> > >>          psci {
> > >>                  compatible = "arm,psci-1.0";
> > >>                  method = "smc";
> > >> @@ -1068,6 +1074,68 @@
> > >>                          #size-cells = <1>;
> > >>                          ranges = <0x32c00000 0x32c00000 0x400000>;
> > >>
> > >> +                       lcdif: lcdif@32e00000 {
> > >> +                               #address-cells = <1>;
> > >> +                               #size-cells = <0>;
> > >> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
> > >
> > > The compatible "imx6sx-lcdif" implies MXSFB_V6.  FWICT, it is like
> > > MXSFB_V4, but with overlays and those overlays have more registers
> > > configured in the mxsfb_kms driver.  Have you tried using imx28-lcdif
> > > to see if it makes a difference?
> >
> > Indeed, MX6SX has AS overlay plane support, MX{2,}8 does not.
> >
> > LCDIFv3 (as NXP calls it) in MX8MP is like LCDIFv6 (in MX6SX) with
> > slightly reordered register bits, but nothing like LCDIF rev3 (in MX23)
> > ... just to make sure there is no confusion.
> >
> > [...]
> >
> > >> +                       mipi_dsi: mipi_dsi@32e10000 {
> > >> +                               #address-cells = <1>;
> > >> +                               #size-cells = <0>;
> > >> +                               compatible = "fsl,imx8mm-mipi-dsim";
> > >> +                               reg = <0x32e10000 0x400>;
> > >> +                               clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > >> +                                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > >> +                               clock-names = "bus_clk", "sclk_mipi";
> > >> +                               assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > >> +                                                 <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > >> +                                                 <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > >> +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> > >> +                                                        <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> > >> +                                                        <&clk IMX8MM_VIDEO_PLL1_OUT>;
> > >> +                               assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> > >> +                               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > >> +                               phys = <&mipi_phy 0>;
> > >> +                               phy-names = "dsim";
> > >> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> > >> +                               samsung,burst-clock-frequency = <891000000>;
> > >> +                               samsung,esc-clock-frequency = <54000000>;
> > >> +                               samsung,pll-clock-frequency = <27000000>;
> >
> > This 27 MHz is really IMX8MM_CLK_DSI_PHY_REF and
> > samsung,burst-clock-frequency is really the DSI link clock which is
> > panel/bridge specific ... but, why do we need to specify such policy in
> > DT rather than have the panel/bridge drivers negotiate the best clock
> > settings with DSIM bridge driver ? This should be something which should
> > be implemented in the DRM subsystem, not hard-coded in DT. These ad-hoc
> > samsung,*-clock-frequency properties shouldn't even be needed then.
> >
> > Also, are the DSIM bindings stable now ?
>
> Thanks Marek.
>
> No, there is no dsim driver yet. I'm not clear if there is still
> dissagreement on if the drm/exynos driver can be split up or if a
> whole new somewhat duplicate driver needs to be made. I know Jagan
> also has a series he is working on that uses drm/exynos which I
> believe he will share an update on in a day or so.
>
> I'm still using the work that Michael [1] and you [2] did a long time back.
>
> I had this solution working on a 5.10 kernel but it was based on the
> old unapproved IMX8MM blk-ctl and pd drivers. Therefore I believe the
> issue I'm having is something not setup correctly with blk-ctl per my
> dt settings or perhaps something missing from the blk-ctl driver like
> Adam found [3]
>
> I am hanging at:
> [    1.064088] imx_pgc_power_up gpumix
> [    1.077506] imx_pgc_power_down gpumix
> [    1.097685] imx8m_blk_ctrl_power_on dispblk-mipi-dsi
> [    1.102682] imx_pgc_power_up dispmix
> [    1.106825] imx_pgc_power_up mipi
> [    1.110232] imx-dsim-dsi 32e10000.mipi_dsi: supply vddcore not
> found, using dummy regulator
> [    1.118760] imx-dsim-dsi 32e10000.mipi_dsi: supply vddio not found,
> using dummy regulator
> [    1.127361] imx-dsim-dsi 32e10000.mipi_dsi: [drm] *ERROR* modalias
> failure on /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0
> [    1.138676] imx8m_blk_ctrl_power_off dispblk-mipi-dsi
> [    1.143788] imx_pgc_power_down mipi
> [    1.145278] imx8m_blk_ctrl_power_on dispblk-lcdif
> [    1.147316] imx_pgc_power_down dispmix
> [    1.155804] imx_pgc_power_up dispmix
> [    1.159820] [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> /soc@0/bus@32c00000/mipi_dsi@32e10000 to encoder None-34: -517
> ^^^ this is just a defer
> [    1.171789] imx8m_blk_ctrl_power_off dispblk-lcdif
> [    1.176655] imx_pgc_power_down dispmix
> [    1.181790] libphy: fec_enet_mii_bus: probed
> [    3.915806] panel-simple panel: Expected bpc in {6,8} but got: 0
> ^^^ not sure what this is but had it back in my 5.10 solution as well
> so did not investigate
> [    3.921912] imx8m_blk_ctrl_power_on dispblk-mipi-dsi
> [    3.926936] imx_pgc_power_up dispmix
> [    3.931109] imx_pgc_power_up mipi
> [    3.935409] imx8m_blk_ctrl_power_on dispblk-lcdif
> [    3.940547] imx8m_blk_ctrl_power_off dispblk-lcdif
> [    3.945626] [drm] Initialized mxsfb-drm 1.0.0 20160824 for
> 32e00000.lcdif on minor 0
> ^^^ not clear why dispblk-lcdif got disabled here

I've reproduced this. look like lcdif power-domains are not notified
ON. checking on the power-sequence for lcdif side. old patches from
Lucas on v5.13 seems working as expected.

Jagan.
