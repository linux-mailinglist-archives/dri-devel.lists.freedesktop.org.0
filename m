Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A545C9A3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380966E904;
	Wed, 24 Nov 2021 16:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2A6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637770414;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=DHZz12DQBMlAJvH9ZOVHnvWKXxwPVpFpNQoe05qyLcs=;
 b=ZjDkMqnhHlKt/0eqkx1gqSB3p/+jE+gf78ab6a+0Bb2aS2mhtaDL0AFqxbF+SoyH4q
 cP/86PP5h+vOfjQ5f/oK+VxurG+P2CMmgprYeMx0eGW0X9o61iRMUmgrj1sMQMR1HM+1
 /JOPEDOzvxEdI52IsRKUSvDW9Z4QII102RVC26/nwtqmchNJL7JTAB4UWhAYjPBSauqO
 DBJKzSk7P8XFCcTIAEVx+HKq9kCZ2bEdzT5jYXBzYCgwJdHlJdHWyTPhNLbt7RjneI71
 HB+qxlz7mAsv3S4+vhrhrlnXriYbyE5p9rTygZJXjiY16xF0OpHg06j27R+39yD2z36W
 E1Jw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGDV3iz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:13:31 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <GTJ13R.RSQAWZX83DUZ2@crapouillou.net>
Date: Wed, 24 Nov 2021 17:13:30 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <016973B0-B7F0-4E63-BF4F-2643611A6351@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <64c6ab288d4d7159f633c860f1b23b3395491ae1.1637691240.git.hns@goldelico.com>
 <GTJ13R.RSQAWZX83DUZ2@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 23.11.2021 um 21:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> I keep seeing a few things, sorry.

no problem.

>=20
>=20
> Le mar., nov. 23 2021 at 19:13:57 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> A specialisation of the generic Synopsys HDMI driver is employed for
>> JZ4780 HDMI support. This requires a new driver, plus device tree and
>> configuration modifications.
>> Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>> drivers/gpu/drm/ingenic/Makefile          |   1 +
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 129 =
++++++++++++++++++++++
>> 3 files changed, 139 insertions(+)
>> create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> diff --git a/drivers/gpu/drm/ingenic/Kconfig =
b/drivers/gpu/drm/ingenic/Kconfig
>> index 3b57f8be007c4..4efc709d77b0a 100644
>> --- a/drivers/gpu/drm/ingenic/Kconfig
>> +++ b/drivers/gpu/drm/ingenic/Kconfig
>> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
>> 	  The Image Processing Unit (IPU) will appear as a second =
primary plane.
>> +config DRM_INGENIC_DW_HDMI
>> +	tristate "Ingenic specific support for Synopsys DW HDMI"
>> +	depends on MACH_JZ4780
>> +	select DRM_DW_HDMI
>> +	help
>> +	  Choose this option to enable Synopsys DesignWare HDMI based =
driver.
>> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you =
should
>> +	  select this option..
>> +
>> endif
>> diff --git a/drivers/gpu/drm/ingenic/Makefile =
b/drivers/gpu/drm/ingenic/Makefile
>> index d313326bdddbb..f10cc1c5a5f22 100644
>> --- a/drivers/gpu/drm/ingenic/Makefile
>> +++ b/drivers/gpu/drm/ingenic/Makefile
>> @@ -1,3 +1,4 @@
>> obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>> ingenic-drm-y =3D ingenic-drm-drv.o
>> ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
>> +obj-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c =
b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> new file mode 100644
>> index 0000000000000..c14890d6b9826
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> @@ -0,0 +1,129 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
>> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
>> + *
>> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
>> + * Probe and remove operations derived from rcar_dw_hdmi.c.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <drm/bridge/dw_hdmi.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_print.h>
>> +
>> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] =3D {
>> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, =
0x0000 } } },
>> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, =
0x0005 } } },
>> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, =
0x000a } } },
>> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, =
0x000f } } },
>> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, =
0x0000 } } }
>> +};
>> +
>> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] =3D {
>> +	/*pixelclk     bpp8    bpp10   bpp12 */
>> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
>> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
>> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
>> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
>> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
>> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
>> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
>> +};
>> +
>> +/*
>> + * Resistance term 133Ohm Cfg
>> + * PREEMP config 0.00
>> + * TX/CK level 10
>> + */
>> +static const struct dw_hdmi_phy_config ingenic_phy_config[] =3D {
>> +	/*pixelclk   symbol   term   vlev */
>> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
>> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
>> +};
>> +
>> +static enum drm_mode_status
>> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>> +			   const struct drm_display_info *info,
>> +			   const struct drm_display_mode *mode)
>> +{
>> +	if (mode->clock < 13500)
>> +		return MODE_CLOCK_LOW;
>> +	/* FIXME: Hardware is capable of 270MHz, but setup data is =
missing. */
>> +	if (mode->clock > 216000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data =3D {
>> +	.mpll_cfg   =3D ingenic_mpll_cfg,
>> +	.cur_ctr    =3D ingenic_cur_ctr,
>> +	.phy_config =3D ingenic_phy_config,
>> +	.mode_valid =3D ingenic_dw_hdmi_mode_valid,
>> +	.output_port	=3D 1,
>> +};
>> +
>> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] =3D {
>> +	{ .compatible =3D "ingenic,jz4780-dw-hdmi" },
>> +	{ /* Sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
>> +
>> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
>> +{
>> +	struct dw_hdmi *hdmi;
>> +	struct regulator *regulator;
>> +	int ret;
>> +
>> +	hdmi =3D dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>> +	if (IS_ERR(hdmi))
>> +		return PTR_ERR(hdmi);
>> +
>> +	platform_set_drvdata(pdev, hdmi);
>> +
>> +	regulator =3D devm_regulator_get_optional(&pdev->dev, =
"hdmi-5v");
>> +
>=20
> Nit - you can remove this blank line.

ok.

>=20
>> +	if (IS_ERR(regulator)) {
>> +		ret =3D PTR_ERR(regulator);
>> +
>> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: =
%s (%d)\n",
>> +			      "hdmi-5v", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D regulator_enable(regulator);
>=20
> You used devm_regulator_get_optional(), so you are not guaranteed to =
obtain anything; your "regulator" variable might be a NULL pointer, so =
you can't just call regulator_enable() without checking it first.

right. I forgot about that.

>=20
>> +	if (ret) {
>> +		DRM_DEV_ERROR(&pdev->dev, "Failed to enable hpd =
regulator: %d\n",
>> +			      ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
>> +{
>> +	struct dw_hdmi *hdmi =3D platform_get_drvdata(pdev);
>> +
>> +	dw_hdmi_remove(hdmi);
>=20
> You probably should disable the regulator (if not NULL) here.

Indeed. Would it be ok to make struct regulator *regulator static
or do we need dynamically allocated memory?

>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver ingenic_dw_hdmi_driver =3D {
>> +	.probe  =3D ingenic_dw_hdmi_probe,
>> +	.remove =3D ingenic_dw_hdmi_remove,
>> +	.driver =3D {
>> +		.name =3D "dw-hdmi-ingenic",
>> +		.of_match_table =3D ingenic_dw_hdmi_dt_ids,
>> +	},
>> +};
>> +
>=20
> Nit - remove this blank line too.

ok.

>=20
> Cheers,
> -Paul
>=20
>> +module_platform_driver(ingenic_dw_hdmi_driver);
>> +
>> +MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:dwhdmi-ingenic");
>> --
>> 2.33.0
>=20
>=20

