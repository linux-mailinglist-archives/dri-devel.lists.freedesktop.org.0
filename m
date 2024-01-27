Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85283EA44
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 03:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67C1121CC;
	Sat, 27 Jan 2024 02:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D5F1121C9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 02:58:02 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5ce9555d42eso836826a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706324219; x=1706929019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AL25Cgmp65Z4nugzUiRaGUI1/k9OMV61U5cI0oX2Yhc=;
 b=j9pTl1GHVLPWGRinEAjsG/gugx5uYGNw1BUVXMg7rsuWHllUWJM3LY5Yv4hBB2dJsw
 SteypHA8SalhydmMiviJulrsyUa/sVXcWUr5rluvJsnYaHhFSQaiA+i72/0WKsG6oZ+R
 RkoOK6ZwVJYzB4D8DPRiUXFphv1q9FQWJdcOKBkH4RQo7HF3xrs+6V6ZInyHowKTWQrL
 Dq1Qu3/xWC77KLYsJLkf/IgYTZ1f/c55wEokZ1aLjBNUNmm8mPt9Wzxf1kb3xlaxGLRE
 0Rub9ASBSZZaC+xTjIt07UeebVn+tcLs/K6oukEzsJCGbP9QzqDBBPf1x72bYSUS2D7Q
 uQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706324219; x=1706929019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AL25Cgmp65Z4nugzUiRaGUI1/k9OMV61U5cI0oX2Yhc=;
 b=V9O2W4mkpHD6tCkpI8ri3MoT09EXUDBhka1sw2asc1HKSvi4Eqt3vdfTZeTFHlo79x
 7MPTIWC4dECm96VCyLMyT4Iloxo0nzaMgc5q7nMER+z1TnWKIoNpkIpVemuS0G5xzSHp
 hb781NKl+JG/5VJph4Z4tW0K88SoLetjQwa/kpP5FzypQ2njByDFjnukxmVi7KRbe4Le
 SaP/HtQZO/rwJv1Ze9MS4XVBksQFSPRa6cVwgj7n8FHQNLUMGPAumzlD9+QeDYdJzPu+
 G0tTDCpCyJ6mvmlU34xkF2J/csDATjmFNV6qdURrFqqTgrUQGxNvGK1BnkYaTwegdP3O
 Ldvg==
X-Gm-Message-State: AOJu0YwcQ2pihlpyVgfPbGwbbyQ7sgSd9b+4CBMpuygjruD8LKSELRxJ
 /+4bo5OoMfq3srRa74LTl88Ui34pWT7pM8hX5CCY6jQl8WTmf8Pn0/lV3JNbzYzlCi2uhd546st
 a98DJTXDxh9ZssnFgueF0NMYnzd0=
X-Google-Smtp-Source: AGHT+IEF1Zw4IcNrJv2meCpYlZEjakZVYWQiEvWlydUinf+M6VOyFuJ4RxjJJUPz5t8zNR7LHtVIVj8g/ogXTl9F+Ag=
X-Received: by 2002:a05:6a20:7f92:b0:19c:6ec0:33d0 with SMTP id
 d18-20020a056a207f9200b0019c6ec033d0mr972394pzj.37.1706324218699; Fri, 26 Jan
 2024 18:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20240106221907.325127-1-aford173@gmail.com>
 <20240106221907.325127-2-aford173@gmail.com>
 <13783659.uLZWGnKmhe@steina-w>
In-Reply-To: <13783659.uLZWGnKmhe@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 26 Jan 2024 20:56:47 -0600
Message-ID: <CAHCN7xLJ7fXePrjuXOo4WJovAG1vZm1LjJGJP29aEfPO8oJL+g@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] phy: freescale: add Samsung HDMI PHY
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 8, 2024 at 9:03=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Adam,
>
> thanks for pushing this forward.
>
> Am Samstag, 6. Januar 2024, 23:19:05 CET schrieb Adam Ford:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the driver for the Samsung HDMI PHY found on the
> > i.MX8MP SoC.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V2:  Fixed some whitespace found from checkpatch
> >      Change error handling when enabling apbclk to use dev_err_probe
> >      Rebase on Linux-Next
> >
> >      I (Adam) tried to help move this along, so I took Lucas' patch and
> >      attempted to apply fixes based on feedback.  I don't have
> >      all the history, so apologies for that.
> >
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kcon=
fig
> > index 853958fb2c06..5c2b73042dfc 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -35,6 +35,12 @@ config PHY_FSL_IMX8M_PCIE
> >         Enable this to add support for the PCIE PHY as found on
> >         i.MX8M family of SOCs.
> >
> > +config PHY_FSL_SAMSUNG_HDMI_PHY
> > +     tristate "Samsung HDMI PHY support"
> > +     depends on OF && HAS_IOMEM
> > +     help
> > +       Enable this to add support for the Samsung HDMI PHY in i.MX8MP.
> > +
> >  endif
> >
> >  config PHY_FSL_LYNX_28G
> > diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Mak=
efile
> > index cedb328bc4d2..dbcafdcc8751 100644
> > --- a/drivers/phy/freescale/Makefile
> > +++ b/drivers/phy/freescale/Makefile
> > @@ -3,4 +3,5 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)      +=3D phy-fsl-imx8=
mq-usb.o
> >  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)     +=3D phy-fsl-imx8qm-lvds-phy.o
> >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)    +=3D phy-fsl-imx8-mipi-dphy.o
> >  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)     +=3D phy-fsl-imx8m-pcie.o
> > +obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)  +=3D phy-fsl-samsung-hdmi.o
> >  obj-$(CONFIG_PHY_FSL_LYNX_28G)               +=3D phy-fsl-lynx-28g.o
>
> I don't know if there was different feedback already. But I would have ad=
ded
> the entry sorted alphabetically, thus after CONFIG_PHY_FSL_LYNX_28G. Same=
 goes,
> for Kconfig as well.

The Makefile is easy to rearrange, but Kconfig is already out of
alphabetical order, and PHY_FSL_SAMSUNG_HDMI_PHY is encapsulated in an
if statement, so it cannot go after PHY_FSL_LYNX_28G.  It is
alphabetical after PHY_FSL_IMX8M.

>
> > diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c new file mode 100644
> > index 000000000000..54e93ea898f7
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > @@ -0,0 +1,1078 @@
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
> > +#define HDMI_TX_CONTROL0             0x200
> > +#define  HDMI_TX_CONTROL_PHY_PWRDWN  BIT(3)
>
> These defines are unused here.

I can drop these.
>
> > +
> > +#define PHY_REG_33           0x84
> > +#define  REG33_MODE_SET_DONE BIT(7)
> > +#define  REG33_FIX_DA                BIT(1)
> > +
> > +#define PHY_REG_34           0x88
> > +#define  REG34_PHY_READY     BIT(7)
> > +#define  REG34_PLL_LOCK              BIT(6)
> > +#define  REG34_PHY_CLK_READY BIT(5)
> > +
> > +
> > +#define PHY_PLL_REGS_NUM 48
> > +
> > +struct phy_config {
> > +     u32     clk_rate;
> > +     u8 regs[PHY_PLL_REGS_NUM];
>
> Shouldn't reg be aligned along clk_rate?

Why so?  They appear to just be structures where individual parts are
read/written individually.  Looking at another HDMI phy driver, it's
not really any different.

>
> Despite that. Tested on TQMa8MPQL/MBa8MPxL + Full-HD HDMI monitor.
>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>

Thanks for testing.

adam
> Best regards,
> Alexander
>
<snip>

>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
