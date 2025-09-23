Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C32B93CC3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60C10E1E3;
	Tue, 23 Sep 2025 01:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="V2QIHfNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BB010E1E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758589905; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NFg3LQWxA1UmU7Ak8jKz+fooj5egjX9HHWX4GoSgSa5uwpaUn0MBmjbXLYy5QsVT7yuYF9Nf62XhpT7xGVEdheqBf1Ef9UULW8+8p30Z6yCHrmvyomrwkesu5oHcFHzYBrgrsY2lBNeLyR2obl6v+7xvcda4nmEQ0Z7N64r1wjE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758589905;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=G3BTeKbCEo6cpwHUel1neO0iH1pphQDlpTU10jPnRBM=; 
 b=XQicDcPi6TLj1SxUJWdmldwnslfj7OfQCw6srU8CFF0Qa2/21xHDOMf2eVd4UeWYYQgWql0DBORRTuhDQNV9kEM0abigHnbubMXpz5pnNyk+ZLQm+CcWw2Pb1QQyhVN5NS9kGsqURm0ohkQd6vxKtjYaxnZDOsMX2ynE5weEGSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758589905; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=G3BTeKbCEo6cpwHUel1neO0iH1pphQDlpTU10jPnRBM=;
 b=V2QIHfNnz44bR3+FgF2gcRZL6iVu83JSTiusr7TzOAPg+7NdjNAUX2H3EwfPgnTm
 4J0y6qBODWIs0fZoNyUB/pBjMBhBcnvFMpOAcC0rH3/Tn2KTN9HNKQzANZZwgeBWp++
 vHNev3hs/6DfpY8n6ulXEKRmKUBL0z0M82VZAlGFqutXnDgqoLEJc/XZUl65DiWJ6za
 smP5x0QcvJHt1MB+ye5DiQ5pwwSanuNk4RyXpIGZS93nBM50Kdg2iKh5leehmRjTYaG
 v+e+i2S78Qpy4vnoApVwLdvHMbHg1+j+bKK1M/9naLDQF/LUAlxnldt4urxEPfztBXD
 kVC5zXDsAw==
Received: by mx.zohomail.com with SMTPS id 1758589902265666.4484766540672;
 Mon, 22 Sep 2025 18:11:42 -0700 (PDT)
Message-ID: <d8240b212b9557878a12ee835a1c8b4840236580.camel@icenowy.me>
Subject: Re: [PATCH v2 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Tue, 23 Sep 2025 09:11:35 +0800
In-Reply-To: <yy57lh5rmbubtqscpquoy3np65tm465cqbtmjw5pqiwxjnecsh@d4qbxe3d4sc5>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-6-uwu@icenowy.me>
 <yy57lh5rmbubtqscpquoy3np65tm465cqbtmjw5pqiwxjnecsh@d4qbxe3d4sc5>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-09-23=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 04:00 +0300=EF=BC=
=8CDmitry Baryshkov=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Sep 21, 2025 at 04:34:43PM +0800, Icenowy Zheng wrote:
> > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller
> > (paired
> > with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from
> > the
> > display controller.
> >=20
> > Add a driver for this controller utilizing the common DesignWare
> > HDMI
> > code in the kernel.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > Changes in v2:
> > - Created a new function to set PHY parameters and refactored the
> > =C2=A0 control flow of the configure_phy callback.
> >=20
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/bridge/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> > =C2=A0drivers/gpu/drm/bridge/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173
> > ++++++++++++++++++++++++
> > =C2=A04 files changed, 185 insertions(+)
> > =C2=A0create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f6206963efbf0..98af9dd3664f5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21759,6 +21759,7 @@
> > F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings=
/reset/thead,th1520-
> > reset.yaml
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/riscv/boot/dts/thead/
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/clk/thead/clk-th1520-ap.c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/firmware/thead,th1520-aon=
.c
> > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/bridge/th1520-dw-hdmi.=
c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/mailbox/mailbox-th1520.c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/net/ethernet/stmicro/stmm=
ac/dwmac-thead.c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/pinctrl/pinctrl-th1520.c
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > b/drivers/gpu/drm/bridge/Kconfig
> > index b9e0ca85226a6..f75e6ad04179f 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -322,6 +322,16 @@ config DRM_THINE_THC63LVD1024
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thine THC63LVD10=
24 LVDS/parallel converter driver.
> > =C2=A0
> > +config DRM_THEAD_TH1520_DW_HDMI
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "T-Head TH1520 Desi=
gnWare HDMI bridge"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on COMMON_CLK
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ARCH_THEAD || COM=
PILE_TEST
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_DW_HDMI
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this to enable=
 support for the internal HDMI
> > bridge found
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on the T-Head TH1520 =
SoC.
> > +
> > =C2=A0config DRM_TOSHIBA_TC358762
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "TC358762 DSI/=
DPI bridge"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile
> > b/drivers/gpu/drm/bridge/Makefile
> > index 245e8a27e3fc5..421e445ff1cd9 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-sii8620.o
> > =C2=A0obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
> > =C2=A0obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> > =C2=A0obj-$(CONFIG_DRM_SIMPLE_BRIDGE) +=3D simple-bridge.o
> > +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) +=3D th1520-dw-hdmi.o
> > =C2=A0obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd1024.o
> > =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358762) +=3D tc358762.o
> > =C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o
> > diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > new file mode 100644
> > index 0000000000000..efb27d37ff652
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > + *
> > + * Based on rcar_dw_hdmi.c, which is:
> > + *=C2=A0=C2=A0 Copyright (C) 2016 Renesas Electronics Corporation
> > + * Based on imx8mp-hdmi-tx.c, which is:
> > + *=C2=A0=C2=A0 Copyright (C) 2022 Pengutronix, Lucas Stach
> > <kernel@pengutronix.de>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include <drm/bridge/dw_hdmi.h>
> > +#include <drm/drm_modes.h>
> > +
> > +#define TH1520_HDMI_PHY_OPMODE_PLLCFG=C2=A0=C2=A00x06=C2=A0=C2=A0=C2=
=A0=C2=A0/* Mode of
> > operation and PLL dividers */
> > +#define TH1520_HDMI_PHY_CKSYMTXCTRL=C2=A0=C2=A0=C2=A0=C2=A00x09=C2=A0=
=C2=A0=C2=A0=C2=A0/* Clock Symbol and
> > Transmitter Control Register */
> > +#define TH1520_HDMI_PHY_VLEVCTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x0e=C2=A0=C2=A0=C2=A0=C2=A0/* Voltage Level
> > Control Register */
> > +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL=C2=A00x10=C2=A0=C2=A0=C2=A0=C2=
=A0/* PLL current and
> > Gmp (conductance) */
> > +#define TH1520_HDMI_PHY_PLLDIVCTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x11=
=C2=A0=C2=A0=C2=A0=C2=A0/* PLL dividers */
> > +#define TH1520_HDMI_PHY_TXTERM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x19=C2=A0=C2=A0=C2=A0=C2=A0/* Transmission
> > Termination Register */
> > +
> > +struct th1520_hdmi_phy_params {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long mpixelclock;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 opmode_pllcfg;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 pllcurrgmpctrl;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 plldivctrl;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 cksymtxctrl;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 vlevctrl;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 txterm;
> > +};
> > +
> > +static const struct th1520_hdmi_phy_params
> > th1520_hdmi_phy_params[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 35500000,=C2=A0 0x0003, 0x=
0283, 0x0628, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 44900000,=C2=A0 0x0003, 0x=
0285, 0x0228, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 71000000,=C2=A0 0x0002, 0x=
1183, 0x0614, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 90000000,=C2=A0 0x0002, 0x=
1142, 0x0214, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 121750000, 0x0001, 0x20c0,=
 0x060a, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 165000000, 0x0001, 0x2080,=
 0x020a, 0x8088, 0x01a0, 0x0007
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 198000000, 0x0000, 0x3040,=
 0x0605, 0x83c8, 0x0120, 0x0004
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 297000000, 0x0000, 0x3041,=
 0x0205, 0x81dc, 0x0200, 0x0005
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 371250000, 0x0640, 0x3041,=
 0x0205, 0x80f6, 0x0140, 0x0000
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 495000000, 0x0640, 0x3080,=
 0x0005, 0x80f6, 0x0140, 0x0000
> > },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 594000000, 0x0640, 0x3080,=
 0x0005, 0x80fa, 0x01e0, 0x0004
> > },
> > +};
> > +
> > +struct th1520_hdmi {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dw_hdmi_plat_data pla=
t_data;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dw_hdmi *dw_hdmi;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk *pixclk;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct reset_control *mainrs=
t, *prst;
> > +};
> > +
> > +static enum drm_mode_status
> > +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_=
display_info *info,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_=
display_mode *mode)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The maximum supported clo=
ck frequency is 594 MHz, as
> > shown in the PHY
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * parameters table.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (mode->clock > 594000)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return MODE_CLOCK_HIGH;
>=20
> Is it the limitation for the pixel clock or for the TMDS char clock
> (the
> difference makes sense for non-8-bpc modes.

I have no idea, the BSP driver didn't consider non-8bpc modes, and I
have no non-8bpc devices to test.

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return MODE_OK;
> > +}
> > +
>=20

