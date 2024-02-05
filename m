Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D54849531
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458711243B;
	Mon,  5 Feb 2024 08:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9FA11243B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:17:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1rWuAM-0004z9-Gn; Mon, 05 Feb 2024 09:17:22 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1rWuAJ-004at0-OU; Mon, 05 Feb 2024 09:17:19 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1rWuAJ-00Cft2-23;
 Mon, 05 Feb 2024 09:17:19 +0100
Date: Mon, 5 Feb 2024 09:17:19 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Adam Ford <aford173@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 alexander.stein@ew.tq-group.com, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V8 02/12] phy: freescale: add Samsung HDMI PHY
Message-ID: <20240205081719.z2uqa4dwn5ucsymv@pengutronix.de>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-3-aford173@gmail.com>
 <CAA8EJpo4omXogg48urEMzxQ+CA7DNTSf66pA6hoO8wpmtn_-MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpo4omXogg48urEMzxQ+CA7DNTSf66pA6hoO8wpmtn_-MQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-02-04, Dmitry Baryshkov wrote:
> On Sat, 3 Feb 2024 at 17:53, Adam Ford <aford173@gmail.com> wrote:
> >
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the driver for the Samsung HDMI PHY found on the
> > i.MX8MP SoC.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > V4:  Make lookup table hex values lower case.
> >
> > V3:  Re-order the Makefile to keep it alphabetical
> >      Remove unused defines
> >
> > V2:  Fixed some whitespace found from checkpatch
> >      Change error handling when enabling apbclk to use dev_err_probe
> >      Rebase on Linux-Next
> >
> >      I (Adam) tried to help move this along, so I took Lucas' patch and
> >      attempted to apply fixes based on feedback.  I don't have
> >      all the history, so apologies for that.
> > ---
> >  drivers/phy/freescale/Kconfig                |    6 +
> >  drivers/phy/freescale/Makefile               |    1 +
> >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 1075 ++++++++++++++++++
> >  3 files changed, 1082 insertions(+)
> >  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> >
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index 853958fb2c06..5c2b73042dfc 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -35,6 +35,12 @@ config PHY_FSL_IMX8M_PCIE
> >           Enable this to add support for the PCIE PHY as found on
> >           i.MX8M family of SOCs.
> >
> > +config PHY_FSL_SAMSUNG_HDMI_PHY
> > +       tristate "Samsung HDMI PHY support"
> > +       depends on OF && HAS_IOMEM
> > +       help
> > +         Enable this to add support for the Samsung HDMI PHY in i.MX8MP.
> > +
> >  endif
> >
> >  config PHY_FSL_LYNX_28G
> > diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
> > index cedb328bc4d2..79e5f16d3ce8 100644
> > --- a/drivers/phy/freescale/Makefile
> > +++ b/drivers/phy/freescale/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)        += phy-fsl-imx8qm-lvds-phy.o
> >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)      += phy-fsl-imx8-mipi-dphy.o
> >  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)       += phy-fsl-imx8m-pcie.o
> >  obj-$(CONFIG_PHY_FSL_LYNX_28G)         += phy-fsl-lynx-28g.o
> > +obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)  += phy-fsl-samsung-hdmi.o
> > diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > new file mode 100644
> > index 000000000000..bf0e2299d00f
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > @@ -0,0 +1,1075 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2020 NXP
> > + * Copyright 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#define PHY_REG_33             0x84
> > +#define  REG33_MODE_SET_DONE   BIT(7)
> > +#define  REG33_FIX_DA          BIT(1)
> > +
> > +#define PHY_REG_34             0x88
> > +#define  REG34_PHY_READY       BIT(7)
> > +#define  REG34_PLL_LOCK                BIT(6)
> > +#define  REG34_PHY_CLK_READY   BIT(5)
> > +
> > +
> > +#define PHY_PLL_REGS_NUM 48
> > +
> > +struct phy_config {
> > +       u32     clk_rate;
> > +       u8 regs[PHY_PLL_REGS_NUM];
> > +};
> > +
> > +const struct phy_config phy_pll_cfg[] = {
> > +       {       22250000, {
> > +                       0x00, 0xd1, 0x4b, 0xf1, 0x89, 0x88, 0x80, 0x40,
> > +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x15, 0x25, 0x80,
> > +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> > +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> > +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> > +               },
> > +       }, {
> > +               23750000, {
> > +                       0x00, 0xd1, 0x50, 0xf1, 0x86, 0x85, 0x80, 0x40,
> > +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x03, 0x25, 0x80,
> > +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> > +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> > +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> > +               },
> 
> Generally I see that these entries contain a high level of duplication.
> Could you please extract the common part and a rate-dependent part.
> Next, it would be best if instead of writing the register values via
> the rate LUT, the driver could calculate those values.
> This allows us to support other HDMI modes if the need arises at some point.

Hi Adam,

can you please have a look at: https://lore.kernel.org/all/4830698.GXAFRqVoOG@steina-w/

there we have fixed this already. Not sure which version you picked for
your work.

Regards,
  Marco

> 
> > +       }, {
> > +               24000000, {
> > +                       0x00, 0xd1, 0x50, 0xf0, 0x00, 0x00, 0x80, 0x00,
> > +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x01, 0x25, 0x80,
> > +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> > +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> > +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> > +               },
> 
> 
> -- 
> With best wishes
> Dmitry
> 
> 
