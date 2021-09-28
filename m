Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373441B0E9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 15:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620A6E0D5;
	Tue, 28 Sep 2021 13:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069CA6E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632836146;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=LUurXEgafzjScNeibCl5rkGHmB+KK9bQjsUcLLkRirY=;
 b=aDfzXYr1A8nH2WwW3WkrIisbXTUoATb/ibMZyNUcAiH+x8u7vO45Ev8vOy9BDJmkW3
 z8mCCoTK/1oEDJxvSmYCgxyb9o3hdTb7TnBMTa0KUhx0ayxP30t7DHTReGL8wQTvoSLI
 wqi+8G+xdk8/sXzQGjD6zpN6egMFthMR8XajUUwpkZp3nr0kCcmHHVlGNNXy8suvVEDv
 Nw5EMnq7G0K2Bj/Eg5D3bVyEDo8XLtZTTGR29Zd84kODwzaTn7DSzLdYh2Ey/cXaEgz5
 d6/fRNmvyvvuVAwypKqAlctb2PlI//8+WFEprg7MJSk+HQpAb2aJ4go5dXe1rI5vhzHd
 wuYA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8SDZieyb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Sep 2021 15:35:44 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 06/10] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <86c61519-697f-9ca8-4257-074173656c38@baylibre.com>
Date: Tue, 28 Sep 2021 15:35:43 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E12CA58-78A7-4E23-BC41-64F0963D4C3A@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
 <86c61519-697f-9ca8-4257-074173656c38@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,


> Am 28.09.2021 um 15:02 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
> On 27/09/2021 18:44, H. Nikolaus Schaller wrote:
>> From: Paul Boddie <paul@boddie.org.uk>
>>=20
>> A specialisation of the generic Synopsys HDMI driver is employed for =
JZ4780
>> HDMI support. This requires a new driver, plus device tree and =
configuration
>> modifications.
>>=20
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>> drivers/gpu/drm/ingenic/Makefile          |   1 +
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 142 =
++++++++++++++++++++++
>> 3 files changed, 152 insertions(+)
>> create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>>=20
>> diff --git a/drivers/gpu/drm/ingenic/Kconfig =
b/drivers/gpu/drm/ingenic/Kconfig
>> index 3b57f8be007c..4c7d311fbeff 100644
>> --- a/drivers/gpu/drm/ingenic/Kconfig
>> +++ b/drivers/gpu/drm/ingenic/Kconfig
>> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
>>=20
>> 	  The Image Processing Unit (IPU) will appear as a second =
primary plane.
>>=20
>> +config DRM_INGENIC_DW_HDMI
>> +	bool "Ingenic specific support for Synopsys DW HDMI"
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
>> index d313326bdddb..3db9888a6c04 100644
>> --- a/drivers/gpu/drm/ingenic/Makefile
>> +++ b/drivers/gpu/drm/ingenic/Makefile
>> @@ -1,3 +1,4 @@
>> obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>> ingenic-drm-y =3D ingenic-drm-drv.o
>> ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
>> +ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c =
b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> new file mode 100644
>> index 000000000000..dd9c94ae842e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> @@ -0,0 +1,142 @@
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
>> +static bool
>> +ingenic_dw_hdmi_mode_fixup(struct drm_bridge *bridge,
>> +			   const struct drm_display_mode *mode,
>> +			   struct drm_display_mode *adjusted_mode)
>> +{
>> +	adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | =
DRM_MODE_FLAG_PVSYNC);
>> +	adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | =
DRM_MODE_FLAG_NVSYNC);
>> +
>> +	return true;
>> +}
>> +
>> +static const struct drm_bridge_timings ingenic_dw_hdmi_timings =3D {
>> +	.input_bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>> +};
>=20
> These should go in the intermediate encoder bridge callbacks Paul =
introduces in his patch at [1].
>=20
> With that patch 4 can be dropped.
>=20
> [1] =
https://lore.kernel.org/r/20210922205555.496871-7-paul@crapouillou.net
>=20
> Neil

Sorry, but I can't follow you here. Our patch set is on top of Paul's =
patch [1]
and requires Paul's work to be merged first.

And our 4/10 is needed to specialize dw-hdmi to the jz4780 like it is =
done for
other SoC integration. It addresses a different stage of the jz4780 HDMI =
chain
than [1].

BR,
Nikolaus

