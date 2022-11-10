Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B48624639
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531C110E044;
	Thu, 10 Nov 2022 15:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF17710E72C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1668095020; x=1699631020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYLGaDnpSTa+hBky9y2DL/Rk7aM21JDVALYnKX5xEho=;
 b=ejYJ1CJej1pNf7NyKMGQnfvEWhkBZn9QqAxtriXsl0RbMsUvwDraEFh4
 30hjPOBCC3wLs/pVgty47MGtLLAcZAM11s3u1he3YUsgQfIqlII+AGoZH
 4SDGUFmURHAYuk+/RFziiOjUNVeva+Lknk58zTmEKhNb9PImbG8NFZuwo
 xJwZqgqANer2KXhIJuNIdwdA4+lYylGxekLaOu/7ldAFFIqJ8M5BzJ1JW
 Tk5riPmVtk/rmX9wTHSo+qWz0q48IDR2D0yfb25s8eYNBJcrMPkwznAgp
 N0OqvRH3EivLqfAcMknUG/D3BENi8BfKuLhwtJvAHfgOM5IUvoozPaMc4 w==;
X-IronPort-AV: E=Sophos;i="5.96,154,1665439200"; d="scan'208";a="27286475"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Nov 2022 16:43:38 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 10 Nov 2022 16:43:38 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 10 Nov 2022 16:43:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1668095018; x=1699631018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYLGaDnpSTa+hBky9y2DL/Rk7aM21JDVALYnKX5xEho=;
 b=qCGG0K9WZb/kBudo6+SPe1g7idk15tmlDLagQZQXE1Lp+CH+gOGPv6YU
 rjaMwxwUnKs0B3Zz2kxp86MBRmb4Tlc/rpNPXRDod3RQqsbqlsQJSHAFX
 W2haAV0tMw6TW5EyI2V8GkP4ZEebT9UN+3ju5tsYLCIjV3J/dVQJ+fsKN
 XWfYZDqfck2Oj6YDyH6uNOeX/nIjSmf0YYyU9ypylYWudJYIjHXM75IpM
 aqjlPD2IVhUpt5RS90n4ywEc0Ai1iRbg5HOvtTcxLuZlewfW6wz+/vfbs
 Z1hRLObv9ilVRzArrsZFXM1O3fAKkHELAZPv5s2GfFsZmx9RkrnATqLQ9 w==;
X-IronPort-AV: E=Sophos;i="5.96,154,1665439200"; d="scan'208";a="27286474"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Nov 2022 16:43:38 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B93C3280056;
 Thu, 10 Nov 2022 16:43:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sandor Yu <sandor.yu@nxp.com>
Subject: RE: [EXT] Re: [v2 06/10] drm: bridge: cadence: Add MHDP HDMI driver
 for i.MX8MQ
Date: Thu, 10 Nov 2022 16:43:33 +0100
Message-ID: <4784052.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB944896907B3C8EFFAC1714A9F43E9@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <3205191.44csPzL39Z@steina-w>
 <PAXPR04MB944896907B3C8EFFAC1714A9F43E9@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "javierm@redhat.
 com" <javierm@redhat.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "kishon@ti.com" <kishon@ti.com>, dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "p.yadav@ti.com" <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

Am Mittwoch, 9. November 2022, 14:26:14 CET schrieb Sandor Yu:
> Thanks for your comments.
>=20
>=20
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: 2022=E5=B9=B411=E6=9C=888=E6=97=A5 21:17
> > To: jonas@kwiboo.se; Sandor Yu <sandor.yu@nxp.com>
> > Cc: dri-devel@lists.freedesktop.org; devicetree@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > linux-phy@lists.infradead.org; andrzej.hajda@intel.com;
> > neil.armstrong@linaro.org; robert.foss@linaro.org;
> > Laurent.pinchart@ideasonboard.com; jernej.skrabec@gmail.com;
> > kishon@ti.com; vkoul@kernel.org; Oliver Brown <oliver.brown@nxp.com>;
> > krzysztof.kozlowski+dt@linaro.org; sam@ravnborg.org;
> > jani.nikula@intel.com;
 tzimmermann@suse.de; s.hauer@pengutronix.de;
> > javierm@redhat.com;
> > penguin-kernel@i-love.sakura.ne.jp; robh+dt@kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; kernel@pengutronix.de; Sandor Yu
> > <sandor.yu@nxp.com>; shawnguo@kernel.org; p.yadav@ti.com;
> > maxime@cerno.tech
> > Subject: [EXT] Re: [v2 06/10] drm: bridge: cadence: Add MHDP HDMI driver
> > for i.MX8MQ
> >=20
> > Caution: EXT Email
> >=20
> > Hello,
> >=20
> > thanks for working on this and the updated version.
> >=20
> > Am Freitag, 4. November 2022, 07:44:56 CET schrieb Sandor Yu:
> >=20
> > > Add a new DRM HDMI bridge driver for Candence MHDP used in i.MX8MQ
> > > SOC. MHDP IP could support HDMI or DisplayPort standards according
> > > embedded Firmware running in the uCPU.
> > >
> > >
> > >
> > > For iMX8MQ SOC, the HDMI FW was loaded and activated by SOC ROM
> >=20
> > code.
> >=20
> > > Bootload binary included HDMI FW was required for the driver.
> > >
> > >
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/bridge/cadence/Kconfig        |   12 +
> > >  .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 1038
> >=20
> > +++++++++++++++++
> >=20
> > >  2 files changed, 1050 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
> > >
> > >
> > >
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > > e79ae1af3765..377452d09992
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig

[snip]

> > > +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> > > +                       u32 block, size_t length) {
> > > +     struct cdns_mhdp_device *mhdp =3D data;
> > > +     u8 msg[2], reg[5], i;
> > > +     int ret;
> > > +
> > > +     mutex_lock(&mhdp->mbox_mutex);
> > > +
> > > +     for (i =3D 0; i < 4; i++) {
> >=20
> >=20
> > What is i? It is not used inside the loop.
>=20
> EDID data read by HDMI firmware are not guarantee 100% successful.
> Base on experiments, try 4 times if EDID read failed.

Mh, 4 times sounds a bit too arbitrary to me. How about using a timeout in =
ms,=20
like 50ms, for retrying to read the EDID?

[snip]

> > > +static int cdns_mhdp_imx_probe(struct platform_device *pdev) {
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct cdns_mhdp_device *mhdp;
> > > +     struct platform_device_info pdevinfo;
> > > +     struct resource *res;
> > > +     u32 reg;
> > > +     int ret;
> > > +
> > > +     mhdp =3D devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> > > +     if (!mhdp)
> > > +             return -ENOMEM;
> > > +
> > > +     mutex_init(&mhdp->lock);
> > > +     mutex_init(&mhdp->mbox_mutex);
> > > +
> > > +     INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> > > +
> > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +     if (!res)
> > > +             return -ENODEV;
> > > +     mhdp->regs =3D devm_ioremap(dev, res->start, resource_size(res)=
);
> > > +     if (IS_ERR(mhdp->regs))
> > > +             return PTR_ERR(mhdp->regs);
> >=20
> >=20
> > Please use devm_platform_get_and_ioremap_resource.
>=20
> Both HDMI PHY driver and mhdp HDMI driver should access same APB base
> register offset for mailbox.
 devm_ioremap_resource could not support such
> feature.

Oh I see, both remap the same range. To be honest I do not like this. Is th=
ere=20
a need to map overlapping ranges in both drivers? How can you avoid race=20
conditions due to simultaneous accesses?

> > > +     mhdp->phy =3D devm_of_phy_get_by_index(dev, pdev->dev.of_node,
> >=20
> > 0);
> >=20
> > > +     if (IS_ERR(mhdp->phy)) {
> > > +             dev_err(dev, "no PHY configured\n");
> > > +             return PTR_ERR(mhdp->phy);
> > > +     }
> >=20
> >=20
> > Please use dev_err_probe().
>=20
> OK.
>=20
> >=20
> >=20
> > > +     mhdp->irq[IRQ_IN] =3D platform_get_irq_byname(pdev, "plug_in");
> > > +     if (mhdp->irq[IRQ_IN] < 0) {
> > > +             dev_info(dev, "No plug_in irq number\n");
> > > +             return -EPROBE_DEFER;
> > > +     }
> >=20
> >=20
> > Please use dev_err_probe().
>=20
> OK.
>=20
> >=20
> >=20
> > > +     mhdp->irq[IRQ_OUT] =3D platform_get_irq_byname(pdev,
> >=20
> > "plug_out");
> >=20
> > > +     if (mhdp->irq[IRQ_OUT] < 0) {
> > > +             dev_info(dev, "No plug_out irq number\n");
> > > +             return -EPROBE_DEFER;
> > > +     }
> >=20
> >=20
> > Please use dev_err_probe().
>=20
> OK.
>=20
> >=20
> >=20
> > > +     /*
> > > +      * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > > +      * Updated each sched "tick" (~2ms)
> > > +      */
> > > +     ret =3D readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> > > +                              reg & CDNS_KEEP_ALIVE_MASK,
> >=20
> > 500,
> >=20
> > > +                              CDNS_KEEP_ALIVE_TIMEOUT);
> >=20
> >=20
> > This freezes my board TQMa8MQ
> > (arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-
> > mba8mx.dts) completly if this and the PHY driver are compiled in. I have
> > "pd_ignore_unused clk_ignore_unused" passed to kernel command line, so I
> > have no idea what's wrong here.
>=20
> Here is the first time in the driver to access hdmi register when driver
> probe.
 For imx8mq hdmi/dp, mdhp hdmi apb clock and core clock are managed
> by ROM code, they are always on when device bootup. Could you dump the
> clock tree without "pd_ignore_unused clk_ignore_unused" ?

I noticed too this is the 1st access, so I have no idea what's wrong here.=
=20
Here is my /sys/kernel/debug/clk/clk_summary from using the regular DT with=
out=20
enabling 'dcss', 'hdmi_phy' and 'mhdp_hdmi':

                                 enable  prepare  protect                  =
             =20
duty  hardware
   clock                          count    count    count        rate  =20
accuracy phase  cycle    enable
=2D------------------------------------------------------------------------=
=2D-----------------------------
 sys2_pll_out                         7        7        0  1000000000      =
   =20
0     0  50000         Y
    sys_pll2_out_monitor              0        0        0  1000000000      =
   =20
0     0  50000         Y
    sys2_pll_1000m                    0        0        0  1000000000      =
   =20
0     0  50000         Y
    sys2_pll_500m                     1        2        0   500000000      =
   =20
0     0  50000         Y
       audio_ahb                      0        1        0   500000000      =
   =20
0     0  50000         N
          ipg_audio_root              0        1        0   250000000      =
   =20
0     0  50000         Y
             sdma2_clk                0        2        0   250000000      =
   =20
0     0  50000         N
             sai6_ipg_clk             0        0        0   250000000      =
   =20
0     0  50000         N
             sai5_ipg_clk             0        0        0   250000000      =
   =20
0     0  50000         N
             sai4_ipg_clk             0        0        0   250000000      =
   =20
0     0  50000         N
             sai1_ipg_clk             0        0        0   250000000      =
   =20
0     0  50000         N
       nand                           0        0        0   500000000      =
   =20
0     0  50000         N
          nand_root_clk               0        0        0   500000000      =
   =20
0     0  50000         N
       usb_bus                        2        2        0   500000000      =
   =20
0     0  50000         Y
          usb2_ctrl_root_clk          1        1        0   500000000      =
   =20
0     0  50000         Y
          usb1_ctrl_root_clk          1        1        0   500000000      =
   =20
0     0  50000         Y
    sys2_pll_333m                     1        1        0   333333333      =
   =20
0     0  50000         Y
       main_axi                       1        1        0   333333333      =
   =20
0     0  50000         Y
    sys2_pll_250m                     2        2        0   250000000      =
   =20
0     0  50000         Y
       pcie1_ctrl                     1        1        0   250000000      =
   =20
0     0  50000         Y
          pcie1_root_clk              1        1        0   250000000      =
   =20
0     0  50000         Y
       pcie2_ctrl                     1        1        0   250000000      =
   =20
0     0  50000         Y
          pcie2_root_clk              1        1        0   250000000      =
   =20
0     0  50000         Y
    sys2_pll_200m                     3        3        0   200000000      =
   =20
0     0  50000         Y
       ecspi3                         0        0        0   200000000      =
   =20
0     0  50000         N
          ecspi3_root_clk             0        0        0   200000000      =
   =20
0     0  50000         N
       ecspi2                         1        1        0   200000000      =
   =20
0     0  50000         Y
          ecspi2_root_clk             2        2        0   200000000      =
   =20
0     0  50000         Y
       ecspi1                         1        1        0   200000000      =
   =20
0     0  50000         Y
          ecspi1_root_clk             2        2        0   200000000      =
   =20
0     0  50000         Y
       gic                            1        1        0   200000000      =
   =20
0     0  50000         Y
       arm_m4_core                    0        0        0   200000000      =
   =20
0     0  50000         N
    sys2_pll_166m                     0        0        0   166666666      =
   =20
0     0  50000         Y
    sys2_pll_125m                     1        1        0   125000000      =
   =20
0     0  50000         Y
       enet_ref                       1        1        0   125000000      =
   =20
0     0  50000         Y
    sys2_pll_100m                     3        3        0   100000000      =
   =20
0     0  50000         Y
       pcie1_phy                      1        1        0   100000000      =
   =20
0     0  50000         Y
       pcie2_phy                      1        1        0   100000000      =
   =20
0     0  50000         Y
       enet_timer                     1        1        0   100000000      =
   =20
0     0  50000         Y
    sys2_pll_50m                      1        1        0    50000000      =
   =20
0     0  50000         Y
       enet_phy                       1        1        0    50000000      =
   =20
0     0  50000         Y
 sys1_pll_out                         5        5        0   800000000      =
   =20
0     0  50000         Y
    sys_pll1_out_monitor              0        0        0   800000000      =
   =20
0     0  50000         Y
    sys1_pll_800m                     2        2        0   800000000      =
   =20
0     0  50000         Y
       vpu_bus                        0        0        0   800000000      =
   =20
0     0  50000         N
          vpu_dec_root_clk            0        0        0   800000000      =
   =20
0     0  50000         N
       arm_a53_div                    0        0        0   800000000      =
   =20
0     0  50000         N
       dram_apb                       1        1        0   160000000      =
   =20
0     0  50000         Y
       noc                            1        1        0   800000000      =
   =20
0     0  50000         Y
       disp_rtrm                      0        0        0   400000000      =
   =20
0     0  50000         N
          disp_rtrm_root_clk          0        0        0   400000000      =
   =20
0     0  50000         N
       disp_apb                       0        0        0   133333334      =
   =20
0     0  50000         N
          disp_apb_root_clk           0        0        0   133333334      =
   =20
0     0  50000         N
       disp_axi                       0        0        0   800000000      =
   =20
0     0  50000         N
          disp_axi_root_clk           0        0        0   800000000      =
   =20
0     0  50000         N
    sys1_pll_400m                     0        0        0   400000000      =
   =20
0     0  50000         Y
       usdhc2                         0        0        0   400000000      =
   =20
0     0  50000         N
          usdhc2_root_clk             0        0        0   400000000      =
   =20
0     0  50000         N
       usdhc1                         0        0        0   400000000      =
   =20
0     0  50000         N
          usdhc1_root_clk             0        0        0   400000000      =
   =20
0     0  50000         N
    sys1_pll_266m                     1        1        0   266666666      =
   =20
0     0  50000         Y
       nand_usdhc_bus                 0        0        0   266666666      =
   =20
0     0  50000         N
          nand_usdhc_rawnand_clk       0        0        0   266666666     =
    =20
0     0  50000         N
       enet_axi                       1        1        0   266666666      =
   =20
0     0  50000         Y
          enet1_root_clk              2        2        0   266666666      =
   =20
0     0  50000         Y
    sys1_pll_200m                     0        0        0   200000000      =
   =20
0     0  50000         Y
    sys1_pll_160m                     0        0        0   160000000      =
   =20
0     0  50000         Y
    sys1_pll_133m                     1        1        0   133333333      =
   =20
0     0  50000         Y
       ahb                            9        4        0   133333333      =
   =20
0     0  50000         Y
          ipg_root                    8        8        0    66666667      =
   =20
0     0  50000         Y
             sdma1_clk                6        1        0    66666667      =
   =20
0     0  50000         Y
             tmu_root_clk             1        1        0    66666667      =
   =20
0     0  50000         Y
             sai3_ipg_clk             0        0        0    66666667      =
   =20
0     0  50000         N
             sai2_ipg_clk             0        0        0    66666667      =
   =20
0     0  50000         N
             ocotp_root_clk           0        0        0    66666667      =
   =20
0     0  50000         N
             mu_root_clk              0        0        0    66666667      =
   =20
0     0  50000         N
             gpio5_root_clk           1        1        0    66666667      =
   =20
0     0  50000         Y
             gpio4_root_clk           1        1        0    66666667      =
   =20
0     0  50000         Y
             gpio3_root_clk           1        1        0    66666667      =
   =20
0     0  50000         Y
             gpio2_root_clk           1        1        0    66666667      =
   =20
0     0  50000         Y
             gpio1_root_clk           1        1        0    66666667      =
   =20
0     0  50000         Y
    sys1_pll_100m                     2        2        0   100000000      =
   =20
0     0  50000         Y
       usb_phy_ref                    2        2        0   100000000      =
   =20
0     0  50000         Y
          usb2_phy_root_clk           1        1        0   100000000      =
   =20
0     0  50000         Y
          usb1_phy_root_clk           1        1        0   100000000      =
   =20
0     0  50000         Y
       usb_core_ref                   2        2        0   100000000      =
   =20
0     0  50000         Y
       qspi                           0        0        0   100000000      =
   =20
0     0  50000         N
          qspi_root_clk               0        0        0   100000000      =
   =20
0     0  50000         N
       dram_alt                       0        0        0   100000000      =
   =20
0     0  50000         N
          dram_alt_root               0        0        0    25000000      =
   =20
0     0  50000         Y
    sys1_pll_80m                      2        2        0    80000000      =
   =20
0     0  50000         Y
       pcie1_aux                      1        1        0    10000000      =
   =20
0     0  50000         Y
       pcie2_aux                      1        1        0    10000000      =
   =20
0     0  50000         Y
       uart2                          0        0        0    80000000      =
   =20
0     0  50000         N
          uart2_root_clk              0        0        0    80000000      =
   =20
0     0  50000         N
       uart1                          0        0        0    80000000      =
   =20
0     0  50000         N
          uart1_root_clk              0        0        0    80000000      =
   =20
0     0  50000         N
    sys1_pll_40m                      0        0        0    40000000      =
   =20
0     0  50000         Y
       wrclk                          0        0        0    40000000      =
   =20
0     0  50000         N
 dummy                                0        0        0           0      =
   =20
0     0  50000         Y
 clk-xtal25                           2        2        0    25000000      =
   =20
0     0  50000         Y
    DIF3                              0        0        0   100000000      =
   =20
0     0  50000         Y
    DIF2                              1        1        0   100000000      =
   =20
0     0  50000         Y
    DIF1                              0        0        0   100000000      =
   =20
0     0  50000         Y
    DIF0                              1        1        0   100000000      =
   =20
0     0  50000         Y
 clock                                0        0        0       32768      =
   =20
0     0  50000         Y
 clk_ext4                             0        0        0   133000000      =
   =20
0     0  50000         Y
 clk_ext3                             0        0        0   133000000      =
   =20
0     0  50000         Y
 clk_ext2                             0        0        0   133000000      =
   =20
0     0  50000         Y
 clk_ext1                             0        0        0   133000000      =
   =20
0     0  50000         Y
 hdmi_phy_27m                         0        0        0    27000000      =
   =20
0     0  50000         Y
 osc_27m                              0        0        0    27000000      =
   =20
0     0  50000         Y
 osc_25m                              7       11        0    25000000      =
   =20
0     0  50000         Y
    gpt_3m                            0        0        0     3125000      =
   =20
0     0  50000         Y
    csi2_esc                          0        0        0    25000000      =
   =20
0     0  50000         N
    csi2_phy_ref                      0        0        0    25000000      =
   =20
0     0  50000         N
    csi2_core                         0        0        0    25000000      =
   =20
0     0  50000         N
       csi2_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    csi1_esc                          0        0        0    25000000      =
   =20
0     0  50000         N
    csi1_phy_ref                      0        0        0    25000000      =
   =20
0     0  50000         N
    csi1_core                         0        0        0    25000000      =
   =20
0     0  50000         N
       csi1_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    dsi_ahb                           0        0        0    25000000      =
   =20
0     0  50000         N
       dsi_ipg_div                    0        0        0    12500000      =
   =20
0     0  50000         Y
    dsi_esc                           0        0        0    25000000      =
   =20
0     0  50000         N
    dsi_dbi                           0        0        0    25000000      =
   =20
0     0  50000         N
    dsi_phy_ref                       0        0        0    25000000      =
   =20
0     0  50000         N
    dsi_core                          0        0        0    25000000      =
   =20
0     0  50000         N
    clko2                             0        0        0    25000000      =
   =20
0     0  50000         N
    clko1                             0        0        0    25000000      =
   =20
0     0  50000         N
    wdog                              1        1        0    25000000      =
   =20
0     0  50000         Y
       wdog3_root_clk                 0        0        0    25000000      =
   =20
0     0  50000         N
       wdog2_root_clk                 0        0        0    25000000      =
   =20
0     0  50000         N
       wdog1_root_clk                 1        1        0    25000000      =
   =20
0     0  50000         Y
    gpt1                              0        0        0    25000000      =
   =20
0     0  50000         N
       gpt1_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    pwm4                              0        0        0    25000000      =
   =20
0     0  50000         N
       pwm4_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    pwm3                              0        0        0    25000000      =
   =20
0     0  50000         N
       pwm3_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    pwm2                              0        0        0    25000000      =
   =20
0     0  50000         N
       pwm2_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    pwm1                              0        0        0    25000000      =
   =20
0     0  50000         N
       pwm1_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    uart4                             0        0        0    25000000      =
   =20
0     0  50000         N
       uart4_root_clk                 0        0        0    25000000      =
   =20
0     0  50000         N
    uart3                             1        1        0    25000000      =
   =20
0     0  50000         Y
       uart3_root_clk                 4        4        0    25000000      =
   =20
0     0  50000         Y
    i2c4                              0        0        0    25000000      =
   =20
0     0  50000         N
       i2c4_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    i2c3                              0        1        0    25000000      =
   =20
0     0  50000         N
       i2c3_root_clk                  0        1        0    25000000      =
   =20
0     0  50000         N
    i2c2                              0        1        0    25000000      =
   =20
0     0  50000         N
       i2c2_root_clk                  0        1        0    25000000      =
   =20
0     0  50000         N
    i2c1                              0        1        0    25000000      =
   =20
0     0  50000         N
       i2c1_root_clk                  0        1        0    25000000      =
   =20
0     0  50000         N
    spdif2                            0        0        0    25000000      =
   =20
0     0  50000         N
    spdif1                            0        0        0    25000000      =
   =20
0     0  50000         N
    sai6                              0        0        0    25000000      =
   =20
0     0  50000         N
       sai6_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    sai5                              0        0        0    25000000      =
   =20
0     0  50000         N
       sai5_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    sai4                              0        0        0    25000000      =
   =20
0     0  50000         N
       sai4_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    sai2                              0        0        0    25000000      =
   =20
0     0  50000         N
       sai2_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    sai1                              0        0        0    25000000      =
   =20
0     0  50000         N
       sai1_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    lcdif_pixel                       0        0        0    25000000      =
   =20
0     0  50000         N
    disp_dc8000                       0        0        0    25000000      =
   =20
0     0  50000         N
       disp_root_clk                  0        0        0    25000000      =
   =20
0     0  50000         N
    disp_dtrc                         0        0        0    25000000      =
   =20
0     0  50000         N
    noc_apb                           1        1        0    25000000      =
   =20
0     0  50000         Y
    video2_pll1_ref_sel               0        0        0    25000000      =
   =20
0     0  50000         Y
       video2_pll_out                 0        0        0    25000000      =
   =20
0     0  50000         Y
          video_pll2_out_monitor       0        0        0    25000000     =
    =20
0     0  50000         Y
    dram_pll1_ref_sel                 1        1        0    25000000      =
   =20
0     0  50000         Y
       dram_pll_out                   2        2        0   800000000      =
   =20
0     0  50000         Y
          dram_core_clk               1        1        0   800000000      =
   =20
0     0  50000         Y
          dram_pll_out_monitor        0        0        0   800000000      =
   =20
0     0  50000         Y
    sys3_pll1_ref_sel                 1        1        0    25000000      =
   =20
0     0  50000         Y
       sys3_pll_out                   1        1        0    25000000      =
   =20
0     0  50000         Y
          sys_pll3_out_monitor        0        0        0    25000000      =
   =20
0     0  50000         Y
    video_pll1_ref_sel                0        0        0    25000000      =
   =20
0     0  50000         Y
       video_pll1_bypass              0        0        0    25000000      =
   =20
0     0  50000         Y
          video_pll1_out_monitor       0        0        0    25000000     =
    =20
0     0  50000         Y
          video_pll1_out              0        0        0    25000000      =
   =20
0     0  50000         N
             dc_pixel                 0        0        0     5000000      =
   =20
0     0  50000         N
       video_pll1_ref_div             0        0        0     5000000      =
   =20
0     0  50000         Y
          video_pll1                  0        0        0   650000000      =
   =20
0     0  50000         Y
    audio_pll2_ref_sel                0        0        0    25000000      =
   =20
0     0  50000         Y
       audio_pll2_ref_div             0        0        0     5000000      =
   =20
0     0  50000         Y
          audio_pll2                  0        0        0   722534397      =
   =20
0     0  50000         Y
             audio_pll2_bypass        0        0        0   722534397      =
   =20
0     0  50000         Y
                audio_pll2_out_monitor       0        0        0   72253439=
7         =20
0     0  50000         Y
                audio_pll2_out        0        0        0   722534397      =
   =20
0     0  50000         N
    audio_pll1_ref_sel                0        0        0    25000000      =
   =20
0     0  50000         Y
       audio_pll1_ref_div             0        0        0     5000000      =
   =20
0     0  50000         Y
          audio_pll1                  0        0        0   786431998      =
   =20
0     0  50000         Y
             audio_pll1_bypass        0        0        0   786431998      =
   =20
0     0  50000         Y
                audio_pll1_out_monitor       0        0        0   78643199=
8         =20
0     0  50000         Y
                audio_pll1_out        0        0        0   786431998      =
   =20
0     0  50000         N
                   sai3               0        0        0    49152000      =
   =20
0     0  50000         N
                      sai3_root_clk       0        0        0    49152000  =
       =20
0     0  50000         N
                         pll          0        0        0   196608000      =
   =20
0     0  50000         Y
                            codec_clkin       0        0        0   1966080=
00         =20
0     0  50000         Y
                               nadc       0        0        0   196608000  =
       =20
0     0  50000         Y
                                  madc       0        0        0   19660800=
0         =20
0     0  50000         Y
                               ndac       0        0        0   196608000  =
       =20
0     0  50000         Y
                                  mdac       0        0        0   19660800=
0         =20
0     0  50000         Y
                                     bdiv         0        0        0  =20
196608000          0     0  50000         Y
    vpu_pll_ref_sel                   0        1        0    25000000      =
   =20
0     0  50000         Y
       vpu_pll_ref_div                0        1        0     5000000      =
   =20
0     0  50000         Y
          vpu_pll                     0        1        0   600000000      =
   =20
0     0  50000         Y
             vpu_pll_bypass           0        1        0   600000000      =
   =20
0     0  50000         Y
                vpu_pll_out_monitor       0        0        0   600000000  =
       =20
0     0  50000         Y
                vpu_pll_out           0        2        0   600000000      =
   =20
0     0  50000         N
                   vpu_g2             0        1        0   600000000      =
   =20
0     0  50000         N
                      vpu_g2_root_clk       0        1        0   600000000=
         =20
0     0  50000         N
                   vpu_g1             0        1        0   600000000      =
   =20
0     0  50000         N
                      vpu_g1_root_clk       0        1        0   600000000=
         =20
0     0  50000         N
    gpu_pll_ref_sel                   0        0        0    25000000      =
   =20
0     0  50000         Y
       gpu_pll_ref_div                0        0        0     5000000      =
   =20
0     0  50000         Y
          gpu_pll                     0        0        0   800000000      =
   =20
0     0  50000         Y
             gpu_pll_bypass           0        0        0   800000000      =
   =20
0     0  50000         Y
                gpu_pll_out_monitor       0        0        0   800000000  =
       =20
0     0  50000         Y
                   pllout_monitor_sel       0        0        0   800000000=
         =20
0     0  50000         Y
                      pllout_monitor_clk2       0        0        0  =20
800000000          0     0  50000         N
                gpu_pll_out           0        0        0   800000000      =
   =20
0     0  50000         N
                   gpu_ahb            0        0        0   800000000      =
   =20
0     0  50000         N
                   gpu_axi            0        0        0   800000000      =
   =20
0     0  50000         N
                   gpu_shader         0        0        0   800000000      =
   =20
0     0  50000         N
                   gpu_core           0        0        0   800000000      =
   =20
0     0  50000         N
                      gpu_root_clk       0        0        0   800000000   =
      =20
0     0  50000         N
    arm_pll_ref_sel                   1        1        0    25000000      =
   =20
0     0  50000         Y
       arm_pll_ref_div                1        1        0     5000000      =
   =20
0     0  50000         Y
          arm_pll                     1        1        0   800000000      =
   =20
0     0  50000         Y
             arm_pll_bypass           1        1        0   800000000      =
   =20
0     0  50000         Y
                arm_pll_out_monitor       0        0        0   800000000  =
       =20
0     0  50000         Y
                arm_pll_out           1        1        0   800000000      =
   =20
0     0  50000         Y
                   arm_a53_core       1        1        0   800000000      =
   =20
0     0  50000         Y
                      arm             1        1        0   800000000      =
   =20
0     0  50000         Y
                   vpu_core           0        0        0   800000000      =
   =20
0     0  50000         N
 ckil                                 2        2        0       32768      =
   =20
0     0  50000         Y

Thanks and best regards
Alexander



