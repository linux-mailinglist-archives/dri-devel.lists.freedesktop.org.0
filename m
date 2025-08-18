Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873FB2AC50
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873DE10E46E;
	Mon, 18 Aug 2025 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sh5mHvoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 335 seconds by postgrey-1.36 at gabe;
 Mon, 18 Aug 2025 07:52:18 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.73.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64910E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
 s=mxsw2412; t=1755503520;
 bh=ZoS2EI4Zzr8UNkvT28OeXQyqNfv81mVfEDuYTE9zSb4=;
 h=Date:From:To:Subject:Message-ID:MIME-Version;
 b=sh5mHvoqzy4la93+5hLNkN/ye/wrVxsgVJJpJ7VDSuYvjjpzZ5BFjlybqJ5eeXunf
 2JW2bjXmGaTAEJqxRc9tYmDFJXRuvca/UNvXeawKb+kXCYIzpBp7k2r1zSQweBOf6q
 Lo88jZh5s+k2KpdJbW+3SpnhddfhoEbjOLB3KjoE=
X-QQ-mid: esmtpgz14t1755503147t6aaf9395
X-QQ-Originating-IP: yP/GhzIIW7KtDXl1ugZehVOJ05GCdTxziUtHS3a2AF8=
Received: from = ( [61.145.255.150]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 18 Aug 2025 15:45:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7680891694613958301
EX-QQ-RecipientCnt: 29
Date: Mon, 18 Aug 2025 15:45:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Icenowy Zheng <uwu@icenowy.me>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <F2C43938B17FA1E1+aKLaKQfN1Ax8Blcx@LT-Guozexi>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-6-uwu@icenowy.me>
 <sp2pdifimqych5zn3mt7pnba3vl25qflgiys76s7dwmyt3jd72@bmwkc7s6p6c4>
 <63b2ac72fe1d15d214e880f223bb3035e177a07b.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63b2ac72fe1d15d214e880f223bb3035e177a07b.camel@icenowy.me>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQ/DUTij+F6rLa7n5WUd27DhTfVu4bR8aaSVswMJaKz3bl
 0hZR0nv/TRx5CoTTdnush+XGBH1Fu7jpiwsFlp6Ba3STLKrBJGNvfa87tdzXysl+8ca6+d7
 rfWmChaL1R9ItnRWpG26+EX6RV8W9YGwdm/VrQhX6uNp30J1JJ+79nNIOCa+1nSn1WnNtCB
 hRZU/aSGmmdjeHCPibVbKEN1o6dBXBYeXgk0Gxra/K6ZefnR+1UpC6Wy2a4Izl2HlY3zmOf
 6AczelDSg50FcWscIHDQHJ08ZqrxH8P34XC7Ia8Ake4zmKXgARXUm7v6C/xDElwmn7phxBB
 GwMH9Wq+0E/GEGoXfUWVQSnuVDK6V3addlMrju0knv/B9BSxcMaXNtw+UiWJwr58TNfst0A
 CedNyoycbf6HmDv7GR5mQAnTObAkC3Cz7LWBMDTQtDVMsPV2WoHbrdz1cgbrFBOESASjPDv
 1xLZHp7hEB8Ml/43Hpp53fbXol9X+wthFS15gUP65FpcBPo/UaSJYB1dqfxW4L55aTsp7sx
 ezq3+c1t6EfQNeg6W4dXyj2wyMMFA6nrnwIJSXLnQmlZ7iUSJ9aOc62zId1YDxLDttrFfPz
 jIxlf245CucMcpzQbwU+gJidso3zW4xrz1fIzcmlQYBMalRC+zTlB5Aa0yant45l7cGWMNR
 7EpoHUkwNKv4naCGRfeqiBACL4SLpwqp/+3i0sp6HG5ffqMKSixeRyvR0KipaFy+sCRWrLV
 63H4EuA1BLvl9gmk1ly/lmjspYwpECglp0f4L0tUOyhU5MPvYKq/bQro5+Rzj6ShJ60Pavq
 lNtLZ0OlbbaGg2fplj3oqUJuu7V8RBYKbqtUbsuF/JMbhEIJvz6mRgW4bU3GIjVJ/a9YDzu
 4J9qPz5OVl7xCrGJlfIhUBsteSHCdW/9w986O4n68OaMQ2mIJiZoFBCnCLvTgls44BIHrMd
 vxGZ+BRlyx/IYuTApX1VdJ+e5/s2EM2tgWoS13A9LkqyvveoEyQGV+LawUjAyQ4Ikrgzyat
 SSRxqNWx/w5RXF6138Gplh104X20BXP0u8DNTwoHVwSmYprXiuQp1Yj+blOXOH9MPxL28vn
 mFt7ryeDMm3Bc2EKJAZDMVstCMmAWisYSUHENccKosa
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Mon, 18 Aug 2025 15:16:13 +0000
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

On Sun, Aug 17, 2025 at 01:10:44AM +0800, Icenowy Zheng wrote:
> 在 2025-08-16星期六的 19:24 +0300，Dmitry Baryshkov写道：
> > On Fri, Aug 15, 2025 at 12:40:45AM +0800, Icenowy Zheng wrote:
> > > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller
> > > (paired
> > > with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from
> > > the
> > > display controller.
> > > 
> > > Add a driver for this controller utilizing the common DesignWare
> > > HDMI
> > > code in the kernel.
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  MAINTAINERS                             |   1 +
> > >  drivers/gpu/drm/bridge/Kconfig          |  10 ++
> > >  drivers/gpu/drm/bridge/Makefile         |   1 +
> > >  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 170
> > > ++++++++++++++++++++++++
> > >  4 files changed, 182 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index fe168477caa45..eb84e36ded6d5 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -21728,6 +21728,7 @@
> > > F:      Documentation/devicetree/bindings/reset/thead,th1520-
> > > reset.yaml
> > >  F:     arch/riscv/boot/dts/thead/
> > >  F:     drivers/clk/thead/clk-th1520-ap.c
> > >  F:     drivers/firmware/thead,th1520-aon.c
> > > +F:     drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > >  F:     drivers/mailbox/mailbox-th1520.c
> > >  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > >  F:     drivers/pinctrl/pinctrl-th1520.c
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > > b/drivers/gpu/drm/bridge/Kconfig
> > > index b9e0ca85226a6..f75e6ad04179f 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -322,6 +322,16 @@ config DRM_THINE_THC63LVD1024
> > >         help
> > >           Thine THC63LVD1024 LVDS/parallel converter driver.
> > >  
> > > +config DRM_THEAD_TH1520_DW_HDMI
> > > +       tristate "T-Head TH1520 DesignWare HDMI bridge"
> > > +       depends on OF
> > > +       depends on COMMON_CLK
> > > +       depends on ARCH_THEAD || COMPILE_TEST
> > > +       select DRM_DW_HDMI
> > > +       help
> > > +         Choose this to enable support for the internal HDMI
> > > bridge found
> > > +         on the T-Head TH1520 SoC.
> > > +
> > >  config DRM_TOSHIBA_TC358762
> > >         tristate "TC358762 DSI/DPI bridge"
> > >         depends on OF
> > > diff --git a/drivers/gpu/drm/bridge/Makefile
> > > b/drivers/gpu/drm/bridge/Makefile
> > > index 245e8a27e3fc5..421e445ff1cd9 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
> > >  obj-$(CONFIG_DRM_SII902X) += sii902x.o
> > >  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> > >  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> > > +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
> > >  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
> > >  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
> > >  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> > > diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > new file mode 100644
> > > index 0000000000000..f8dddf3cb0cca
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > @@ -0,0 +1,170 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + *
> > > + * Based on rcar_dw_hdmi.c, which is:
> > > + *   Copyright (C) 2016 Renesas Electronics Corporation
> > > + * Based on imx8mp-hdmi-tx.c, which is:
> > > + *   Copyright (C) 2022 Pengutronix, Lucas Stach
> > > <kernel@pengutronix.de>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > > +
> > > +#include <drm/bridge/dw_hdmi.h>
> > > +#include <drm/drm_modes.h>
> > > +
> > > +#define TH1520_HDMI_PHY_OPMODE_PLLCFG  0x06    /* Mode of
> > > operation and PLL dividers */
> > > +#define TH1520_HDMI_PHY_CKSYMTXCTRL    0x09    /* Clock Symbol and
> > > Transmitter Control Register */
> > > +#define TH1520_HDMI_PHY_VLEVCTRL       0x0e    /* Voltage Level
> > > Control Register */
> > > +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL 0x10    /* PLL current and
> > > Gmp (conductance) */
> > > +#define TH1520_HDMI_PHY_PLLDIVCTRL     0x11    /* PLL dividers */
> > > +#define TH1520_HDMI_PHY_TXTERM         0x19    /* Transmission
> > > Termination Register */
> > > +
> > > +struct th1520_hdmi_phy_params {
> > > +       unsigned long mpixelclock;
> > > +       u16 opmode_pllcfg;
> > > +       u16 pllcurrgmpctrl;
> > > +       u16 plldivctrl;
> > > +       u16 cksymtxctrl;
> > > +       u16 vlevctrl;
> > > +       u16 txterm;
> > > +};
> > > +
> > > +static const struct th1520_hdmi_phy_params
> > > th1520_hdmi_phy_params[] = {
> > > +       { 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007
> > > },
> > > +       { 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004
> > > },
> > > +       { 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005
> > > },
> > > +       { 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000
> > > },
> > > +       { 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000
> > > },
> > > +       { 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004
> > > },
> > > +       { ~0UL,      0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
> > > }
> > > +};
> > > +
> > > +struct th1520_hdmi {
> > > +       struct dw_hdmi_plat_data plat_data;
> > > +       struct dw_hdmi *dw_hdmi;
> > > +       struct clk *pixclk;
> > > +       struct reset_control *mainrst, *prst;
> > > +};
> > > +
> > > +static enum drm_mode_status
> > > +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> > > +                      const struct drm_display_info *info,
> > > +                      const struct drm_display_mode *mode)
> > > +{
> > > +       /*
> > > +        * The maximum supported clock frequency is 594 MHz, as
> > > shown in the PHY
> > > +        * parameters table.
> > > +        */
> > > +       if (mode->clock > 594000)
> > > +               return MODE_CLOCK_HIGH;
> > 
> > We should rewrite DW bridge into HDMI ops. It would help us to get
> > rid
> > of such functions. With it in place it will be handled by the generic
> > TMDS clock rate check.
> 
> Yes, but this mode_valid hook here is part of the private interface of
> DW bridge, instead of implementing anything for other parts of DRM
> subsystem.
> 
> Even if the TMDS clock rate check is utilized by the DW bridge, the
> bridge's interface should be modified to expose something to set the
> maximum clock rate.
> 
> > 
> > > +
> > > +       return MODE_OK;
> > > +}
> > > +
> > > +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void
> > > *data,
> > > +                                    unsigned long mpixelclock)
> > > +{
> > > +       const struct th1520_hdmi_phy_params *params =
> > > th1520_hdmi_phy_params;
> > > +
> > > +       for (; params->mpixelclock != ~0UL; ++params) {
> > > +               if (mpixelclock <= params->mpixelclock)
> > > +                       break;
> > 
> > for (...) {
> >         if (mpixelclock <= params->mpixelclock)
> >                 return th1520_program_phy();
> 
> There's no such a function here, and this check isn't used for another
> time, so having the matching code and programming code extracted out
> can help nothing.
I think Dmitry meant that the following code should be moved into
a new function, th1520_program_phy().  

This makes the code cleaner and also avoids one extra if check.

                - Troy
> 
> > }
> > 
> > return -EINVAL;
> > 
> > > +       }
> > > +
> > > +       if (params->mpixelclock == ~0UL)
> > > +               return -EINVAL;
> > > +
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
> > > +                             TH1520_HDMI_PHY_OPMODE_PLLCFG);
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
> > > +                             TH1520_HDMI_PHY_PLLCURRGMPCTRL);
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
> > > +                             TH1520_HDMI_PHY_PLLDIVCTRL);
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
> > > +                             TH1520_HDMI_PHY_VLEVCTRL);
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
> > > +                             TH1520_HDMI_PHY_CKSYMTXCTRL);
> > > +       dw_hdmi_phy_i2c_write(hdmi, params->txterm,
> > > +                             TH1520_HDMI_PHY_TXTERM);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int th1520_dw_hdmi_probe(struct platform_device *pdev)
> > > +{
> > > +       struct th1520_hdmi *hdmi;
> > > +       struct dw_hdmi_plat_data *plat_data;
> > > +       struct device *dev = &pdev->dev;
> > > +
> > > +       hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > > +       if (!hdmi)
> > > +               return -ENOMEM;
> > > +
> > > +       plat_data = &hdmi->plat_data;
> > > +
> > > +       hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
> > > +       if (IS_ERR(hdmi->pixclk))
> > > +               return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> > > +                                    "Unable to get pixel
> > > clock\n");
> > > +
> > > +       hdmi->mainrst =
> > > devm_reset_control_get_exclusive_deasserted(dev, "main");
> > > +       if (IS_ERR(hdmi->mainrst))
> > > +               return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
> > > +                                    "Unable to get main reset\n");
> > > +
> > > +       hdmi->prst =
> > > devm_reset_control_get_exclusive_deasserted(dev, "apb");
> > > +       if (IS_ERR(hdmi->prst))
> > > +               return dev_err_probe(dev, PTR_ERR(hdmi->prst),
> > > +                                    "Unable to get apb reset\n");
> > > +
> > > +       plat_data->output_port = 1;
> > > +       plat_data->mode_valid = th1520_hdmi_mode_valid;
> > > +       plat_data->configure_phy = th1520_hdmi_phy_configure;
> > > +       plat_data->priv_data = hdmi;
> > > +
> > > +       hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> > > +       if (IS_ERR(hdmi))
> > > +               return PTR_ERR(hdmi);
> > > +
> > > +       platform_set_drvdata(pdev, hdmi);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void th1520_dw_hdmi_remove(struct platform_device *pdev)
> > > +{
> > > +       struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> > > +
> > > +       dw_hdmi_remove(hdmi);
> > > +}
> > > +
> > > +static const struct of_device_id th1520_dw_hdmi_of_table[] = {
> > > +       { .compatible = "thead,th1520-dw-hdmi" },
> > > +       { /* Sentinel */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
> > > +
> > > +static struct platform_driver th1520_dw_hdmi_platform_driver = {
> > > +       .probe          = th1520_dw_hdmi_probe,
> > > +       .remove         = th1520_dw_hdmi_remove,
> > > +       .driver         = {
> > > +               .name   = "th1520-dw-hdmi",
> > > +               .of_match_table = th1520_dw_hdmi_of_table,
> > > +       },
> > > +};
> > > +
> > > +module_platform_driver(th1520_dw_hdmi_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> > > +MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
> > > +MODULE_LICENSE("GPL");
> > > -- 
> > > 2.50.1
> > > 
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
