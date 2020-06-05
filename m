Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D51F0EF1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A786E3AE;
	Sun,  7 Jun 2020 19:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311356E46C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:43:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A5C7A6BB;
 Fri,  5 Jun 2020 13:43:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Jun 2020 13:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WMk4cZ8CCM0b/pfUL0BH7baqjdR
 ucxL+84Vpn6IsfUQ=; b=bvlNidqDJbPOQc+JVZLFFvml3/3XI/C/BI7dod+B4DT
 i8XiwuDt4co66Zi21cf+CQoxoSAn0yyjJNkB4Yk5zmwzPIBoL57FNmBMgNOvbMzB
 uEJgwEw+RcFfUvZfHPVL1uR0h14SUw9/ERIIpKatvEPE0MhOh5xAfCUiPYsYYPNG
 HLj7ktMG0za0HxIauawH5IaScFr6iDCvcLmL7LEcWTKmReCikdfZtT2yP5XfG0jt
 1lNy9kIZE9bUsRuBFhe+p8VPbF5MnCiaSoodY7ao11qCwmGHfPF1u99yJdUbvgOd
 nbT937mJVZePCIcyAr3sOFcdLLqicpfFhZ+FQqLlHCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WMk4cZ
 8CCM0b/pfUL0BH7baqjdRucxL+84Vpn6IsfUQ=; b=lfHCfSJ3N1DJxagNccbw38
 AsiXVoY1a/iDGhA+QssTz8bscruwPr0JO0e9G73X+gLFR2vGsMmS6OsWCqmpZX4X
 rkrSVdwtgQPoPQzENv59PbDg0IFGg66Xn3tIY9ysxnzgIDIWSMkHbVBADyWxLR/P
 O11Fpxl7Ov1C5zff6SGSf346icx2Sf6UmRqE9t5zQmxZUfa+LB5GYc/uCPQVke7o
 od0OfE0+zhG61jmp7RtniPc0mOYtVOPQLNYD5l9+dv7ofWAzRqSXwf2Ou2gPhwcE
 Os0BkXtma0HFdymkL/HhVD+5PwvWHPya0TdqRwer1BtOtjlq3tnt2ebM0zfmGV0g
 ==
X-ME-Sender: <xms:Q4TaXtU3L7oT5o_Pzjwk3bubp5CcN59PaHhfqXD0WQKwk98r6GfDQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q4TaXtk_liicAKU3UCwewFgW99Ab3HDcLu9YbY5OUkEH4GfXQhGnvw>
 <xmx:Q4TaXpZ9wkbT-G4D8jiSb_Nju0pvQOAnq0ccMwzYQDA00-Nvwliuog>
 <xmx:Q4TaXgWpz_ziZ3vramJc4I6tN6CYqPFbjRX4tr2S3Grl3jcbx_SBqw>
 <xmx:RYTaXldBOfLEfkQRsYH2XVbhgEV5nkOaG777A2kHryWTwOpyCNxcpcvX3uY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23408328005E;
 Fri,  5 Jun 2020 13:43:31 -0400 (EDT)
Date: Fri, 5 Jun 2020 19:43:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
Message-ID: <20200605174329.hf5d6oulmcewzw63@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
 <faacbc33174e77500e04e609a654c5810045cb42.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <faacbc33174e77500e04e609a654c5810045cb42.camel@suse.de>
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1937605360=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1937605360==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ipra6vk67wtkckt"
Content-Disposition: inline


--7ipra6vk67wtkckt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu, Jun 04, 2020 at 07:26:07PM +0200, Nicolas Saenz Julienne wrote:
> On Wed, 2020-05-27 at 17:47 +0200, Maxime Ripard wrote:
> > The HDMI block has a block that controls clocks and reset signals to the
> > HDMI0 and HDMI1 controllers.
>=20
> Why not having two separate drivers?

They share the same address space, so it wouldn't really make sense to
split it into two drivers and an MFD, especially when the clock/reset
association is fairly common.

> > Let's expose that through a clock driver implementing a clock and reset
> > provider.
> >=20
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/bcm/Kconfig           |  11 +++-
> >  drivers/clk/bcm/Makefile          |   1 +-
> >  drivers/clk/bcm/clk-bcm2711-dvp.c | 127 ++++++++++++++++++++++++++++++=
+-
> >  3 files changed, 139 insertions(+)
> >  create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
> >=20
> > diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> > index 8c83977a7dc4..784f12c72365 100644
> > --- a/drivers/clk/bcm/Kconfig
> > +++ b/drivers/clk/bcm/Kconfig
> > @@ -1,4 +1,15 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config CLK_BCM2711_DVP
> > +	tristate "Broadcom BCM2711 DVP support"
> > +	depends on ARCH_BCM2835 ||COMPILE_TEST
> > +	depends on COMMON_CLK
> > +	default ARCH_BCM2835
> > +	select RESET_SIMPLE
> > +	help
> > +	  Enable common clock framework support for the Broadcom BCM2711
> > +	  DVP Controller.
> > +
> >  config CLK_BCM2835
> >  	bool "Broadcom BCM2835 clock support"
> >  	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
> > diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> > index 0070ddf6cdd2..2c1349062147 100644
> > --- a/drivers/clk/bcm/Makefile
> > +++ b/drivers/clk/bcm/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-kona-setup.o
> >  obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-bcm281xx.o
> >  obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-bcm21664.o
> >  obj-$(CONFIG_COMMON_CLK_IPROC)	+=3D clk-iproc-armpll.o clk-iproc-pll.o
> > clk-iproc-asiu.o
> > +obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2711-dvp.o
> >  obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2835.o
> >  obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2835-aux.o
> >  obj-$(CONFIG_CLK_RASPBERRYPI)	+=3D clk-raspberrypi.o
> > diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bc=
m2711-
> > dvp.c
> > new file mode 100644
> > index 000000000000..c1c4b5857d32
> > --- /dev/null
> > +++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright 2020 Cerno
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/reset/reset-simple.h>
> > +
> > +#define DVP_HT_RPI_SW_INIT	0x04
> > +#define DVP_HT_RPI_MISC_CONFIG	0x08
> > +
> > +#define NR_CLOCKS	2
> > +#define NR_RESETS	6
> > +
> > +struct clk_dvp {
> > +	struct clk_hw_onecell_data	*data;
> > +	struct reset_simple_data	reset;
> > +};
> > +
> > +static const struct clk_parent_data clk_dvp_parent =3D {
> > +	.index	=3D 0,
> > +};
> > +
> > +static int clk_dvp_probe(struct platform_device *pdev)
> > +{
> > +	struct clk_hw_onecell_data *data;
> > +	struct resource *res;
> > +	struct clk_dvp *dvp;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	dvp =3D devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
> > +	if (!dvp)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, dvp);
> > +
> > +	dvp->data =3D devm_kzalloc(&pdev->dev,
> > +				 struct_size(dvp->data, hws, NR_CLOCKS),
> > +				 GFP_KERNEL);
> > +	if (!dvp->data)
> > +		return -ENOMEM;
> > +	data =3D dvp->data;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	base =3D devm_ioremap_resource(&pdev->dev, res);
>=20
> I think the cool function to use these days is
> devm_platform_get_and_ioremap_resource().

i'll change it, thanks!
Maxime

--7ipra6vk67wtkckt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtqEQQAKCRDj7w1vZxhR
xY5mAQDVIp7zbi+ewOH9lRQtT6mT0kXC3wcPHV4azd4wEgYNHQEApS2uztox9Lg3
gUmCsE+8074PSmEh8QNJt+9oXNccVw0=
=CXpA
-----END PGP SIGNATURE-----

--7ipra6vk67wtkckt--

--===============1937605360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1937605360==--
