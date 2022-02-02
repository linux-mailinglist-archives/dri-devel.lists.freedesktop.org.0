Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0024A702F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AA310EA1C;
	Wed,  2 Feb 2022 11:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36D410EA14
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643802160;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=n/+OoiD2EtJ/gyEyNk035kAVFiSn2QxqLnT+ENLSWd4=;
 b=ds8F5aCDXZ8u4Nf7Kmb+iqGPNf+z6oUXosCOsjFngM7JzOaLqHskBecB6SpRRMjb8j
 z9n4kYIsMiHzr2XHDFNtiY7GIa286UkewAItxFZpAAq6tmpBwOA5KB6Pum5x3874MhcX
 04WDxtoa+cRgXP4F+YAq7z/HPUpYP+MFYk8nap3bikD4ph8vsyssD28dz4okwcdLll5u
 7L6V/9wwdzP5QNhXqmJzP8Xj2YAn2clxtTU7fAVIgjFa+fdc7U2Eyx3S6iDVXQQsgknt
 mmlWeaGaf0coKdCp6bIe0DFVWBZxqFe+SGQh/f5APxIOJsdKizXD+x/gqWw14jS3YZ61
 6GwQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDCocQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12Bgc9fi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 12:42:38 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v12 4/9] drm/ingenic: Add dw-hdmi driver specialization
 for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1W9O6R.U3T9L7GOJNE81@crapouillou.net>
Date: Wed, 2 Feb 2022 12:42:37 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <8126F638-201E-4EB4-A0D9-847A6A6609EF@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <d723efc7c2544db945698246ae4644ecb8fae1a3.1643632014.git.hns@goldelico.com>
 <1W9O6R.U3T9L7GOJNE81@crapouillou.net>
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
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 02.02.2022 um 11:16 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le lun., janv. 31 2022 at 13:26:50 +0100, H. Nikolaus Schaller =
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
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 104 =
++++++++++++++++++++++
>> 3 files changed, 114 insertions(+)
>> create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> diff --git a/drivers/gpu/drm/ingenic/Kconfig =
b/drivers/gpu/drm/ingenic/Kconfig
>> index 001f59fb06d56..ba4a650869cd8 100644
>> --- a/drivers/gpu/drm/ingenic/Kconfig
>> +++ b/drivers/gpu/drm/ingenic/Kconfig
>> @@ -24,4 +24,13 @@ config DRM_INGENIC_IPU
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
>=20
> One dot is enough.

Ok, will fix.

>=20
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
>> index 0000000000000..34e986dd606cf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
>> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
>> + *
>> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
>> + * Probe and remove operations derived from rcar_dw_hdmi.c.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
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
>> +static void ingenic_dw_hdmi_cleanup(void *data)
>> +{
>> +	struct dw_hdmi *hdmi =3D (struct dw_hdmi *)data;
>> +
>> +	dw_hdmi_remove(hdmi);
>> +}
>> +
>> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
>> +{
>> +	struct dw_hdmi *hdmi;
>> +
>> +	hdmi =3D dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>> +	if (IS_ERR(hdmi))
>> +		return PTR_ERR(hdmi);
>> +
>> +	return devm_add_action_or_reset(&pdev->dev, =
ingenic_dw_hdmi_cleanup, hdmi);
>=20
> Nitpick, but your probe function is so simple, you could just have a =
.remove callback

Well, we did have one in v5 or so (haven't looked back) and it was your =
suggestion to
add an action handler. Well at that point it was a little more to do.

> instead of registering a devm action. Then you can just return =
PTR_ERR_OR_ZERO(hdmi).
>=20
> Cheers,
> -Paul

