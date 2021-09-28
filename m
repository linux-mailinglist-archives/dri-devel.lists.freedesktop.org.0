Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C941ACD9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A36E0B6;
	Tue, 28 Sep 2021 10:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96889CBE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632824516;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=lIE+6NI+6gHXoIKYxSeCXrUSNgd4aDwsNn3eAUHjKFg=;
 b=S/ykKYLIkGyxwpbfGJ7Ht7ipHSPviElE+Y8ShkcizVi5gh1dCE8kYwffOxAdM4/S6v
 hErVS1O2hYoUsR6mGIXGh+S5XdRoyZ9QGbxT5Dg4ZExnT64SBxL8Lct5cisH3tTD5fGz
 INpGUEJcZB9g0pWg4hVSv9kZJvt6fAa5DAghiYpD3663Ejlde45VUq4UUFdQ+6uuRgx5
 10F+zrUk4Q0Gl9GGUWEQ5oZQPXaIzqT9pzStgwqJV5NS5Ac7OQydZjo/u3KHtnIdkB9d
 CLjsIDP2uwrZ7CbEK91nOlDXMrnDJqNGXzaA301RZSnJ/wejynpqTL251gq9bhWrYcTT
 JziQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8SALtddb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Sep 2021 12:21:55 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
Date: Tue, 28 Sep 2021 12:21:54 +0200
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
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
Message-Id: <1E10A04A-4A78-4B47-B0FB-1E8C99456DA1@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
 <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Am 28.09.2021 um 11:35 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus / Paul,
>=20
> Le lun., sept. 27 2021 at 18:44:20 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> Add support for the LCD controller present on JZ4780 SoCs.
>> This SoC uses 8-byte descriptors which extend the current
>> 4-byte descriptors used for other Ingenic SoCs.
>> Tested on MIPS Creator CI20 board.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85 =
+++++++++++++++++++++--
>> drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>> 2 files changed, 122 insertions(+), 5 deletions(-)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index f73522bdacaa..e2df4b085905 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -6,6 +6,7 @@
>> #include "ingenic-drm.h"
>> +#include <linux/bitfield.h>
>> #include <linux/component.h>
>> #include <linux/clk.h>
>> #include <linux/dma-mapping.h>
>> @@ -49,6 +50,11 @@ struct ingenic_dma_hwdesc {
>> 	u32 addr;
>> 	u32 id;
>> 	u32 cmd;
>> +	/* extended hw descriptor for jz4780 */
>> +	u32 offsize;
>> +	u32 pagewidth;
>> +	u32 cpos;
>> +	u32 dessize;
>> } __aligned(16);
>> struct ingenic_dma_hwdescs {
>> @@ -60,9 +66,11 @@ struct jz_soc_info {
>> 	bool needs_dev_clk;
>> 	bool has_osd;
>> 	bool map_noncoherent;
>> +	bool use_extended_hwdesc;
>> 	unsigned int max_width, max_height;
>> 	const u32 *formats_f0, *formats_f1;
>> 	unsigned int num_formats_f0, num_formats_f1;
>> +	unsigned int max_reg;
>> };
>> struct ingenic_drm_private_state {
>> @@ -168,12 +176,11 @@ static bool ingenic_drm_writeable_reg(struct =
device *dev, unsigned int reg)
>> 	}
>> }
>> -static const struct regmap_config ingenic_drm_regmap_config =3D {
>> +static struct regmap_config ingenic_drm_regmap_config =3D {
>> 	.reg_bits =3D 32,
>> 	.val_bits =3D 32,
>> 	.reg_stride =3D 4,
>> -	.max_register =3D JZ_REG_LCD_SIZE1,
>> 	.writeable_reg =3D ingenic_drm_writeable_reg,
>> };
>> @@ -663,6 +670,37 @@ static void =
ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>> 		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * =
cpp / 4);
>> 		hwdesc->next =3D dma_hwdesc_addr(priv, next_id);
>> +		if (priv->soc_info->use_extended_hwdesc) {
>> +			hwdesc->cmd |=3D JZ_LCD_CMD_FRM_ENABLE;
>> +
>> +			/* Extended 8-byte descriptor */
>> +			hwdesc->cpos =3D 0;
>> +			hwdesc->offsize =3D 0;
>> +			hwdesc->pagewidth =3D 0;
>> +
>> +			switch (newstate->fb->format->format) {
>> +			case DRM_FORMAT_XRGB1555:
>> +				hwdesc->cpos |=3D JZ_LCD_CPOS_RGB555;
>> +				fallthrough;
>> +			case DRM_FORMAT_RGB565:
>> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_15_16;
>> +				break;
>> +			case DRM_FORMAT_XRGB8888:
>> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
>> +				break;
>> +			}
>> +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
>> +					    =
(JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>> +					     =
JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>> +
>> +			hwdesc->dessize =3D
>> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
>> +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, =
height - 1) |
>> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
>> +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, =
width - 1);
>> +		}
>> +
>> 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> 			fourcc =3D newstate->fb->format->format;
>> @@ -694,6 +732,10 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>> 	}
>> +	/* set use of the 8-word descriptor and OSD foreground usage. */
>> +	if (priv->soc_info->use_extended_hwdesc)
>> +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
>> +
>> 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> 		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>> 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> @@ -1010,6 +1052,7 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 	struct drm_encoder *encoder;
>> 	struct ingenic_drm_bridge *ib;
>> 	struct drm_device *drm;
>> +	struct regmap_config regmap_config;
>> 	void __iomem *base;
>> 	long parent_rate;
>> 	unsigned int i, clone_mask =3D 0;
>> @@ -1063,8 +1106,10 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>> 		return PTR_ERR(base);
>> 	}
>> +	regmap_config =3D ingenic_drm_regmap_config;
>> +	regmap_config.max_register =3D soc_info->max_reg;
>> 	priv->map =3D devm_regmap_init_mmio(dev, base,
>> -					  &ingenic_drm_regmap_config);
>> +					  &regmap_config);
>=20
> Could you split the code that makes .max_reg configurable per-SoC into =
its own patch?

Yes.

>=20
>> 	if (IS_ERR(priv->map)) {
>> 		dev_err(dev, "Failed to create regmap\n");
>> 		return PTR_ERR(priv->map);
>> @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 	/* Enable OSD if available */
>> 	if (soc_info->has_osd)
>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>=20
> Why?

If I remember we should not assume that all others bits in =
JZ_REG_LCD_OSDC
can be safely overwritten by 0, although their reset state is 0 as well.

These are several alpha-blending bits and interrupt masks in the same =
register.
Apparently only in jz4780.

>=20
>> 	mutex_init(&priv->clk_mutex);
>> 	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>> @@ -1444,6 +1489,7 @@ static const struct jz_soc_info jz4740_soc_info =
=3D {
>> 	.formats_f1 =3D jz4740_formats,
>> 	.num_formats_f1 =3D ARRAY_SIZE(jz4740_formats),
>> 	/* JZ4740 has only one plane */
>> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>> };
>> static const struct jz_soc_info jz4725b_soc_info =3D {
>> @@ -1456,6 +1502,7 @@ static const struct jz_soc_info =
jz4725b_soc_info =3D {
>> 	.num_formats_f1 =3D ARRAY_SIZE(jz4725b_formats_f1),
>> 	.formats_f0 =3D jz4725b_formats_f0,
>> 	.num_formats_f0 =3D ARRAY_SIZE(jz4725b_formats_f0),
>> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>> };
>> static const struct jz_soc_info jz4770_soc_info =3D {
>> @@ -1468,12 +1515,28 @@ static const struct jz_soc_info =
jz4770_soc_info =3D {
>> 	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>> 	.formats_f0 =3D jz4770_formats_f0,
>> 	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>> +};
>> +
>> +static const struct jz_soc_info jz4780_soc_info =3D {
>> +	.needs_dev_clk =3D true,
>> +	.has_osd =3D true,
>> +	.use_extended_hwdesc =3D true,
>> +	.max_width =3D 4096,
>> +	.max_height =3D 2048,
>> +	/* REVISIT: do we support formats different from jz4770? */
>> +	.formats_f1 =3D jz4770_formats_f1,
>> +	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>> +	.formats_f0 =3D jz4770_formats_f0,
>> +	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>> +	.max_reg =3D JZ_REG_LCD_PCFG,
>> };
>> static const struct of_device_id ingenic_drm_of_match[] =3D {
>> 	{ .compatible =3D "ingenic,jz4740-lcd", .data =3D =
&jz4740_soc_info },
>> 	{ .compatible =3D "ingenic,jz4725b-lcd", .data =3D =
&jz4725b_soc_info },
>> 	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D =
&jz4770_soc_info },
>> +	{ .compatible =3D "ingenic,jz4780-lcd", .data =3D =
&jz4780_soc_info },
>> 	{ /* sentinel */ },
>> };
>> MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
>> @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>> {
>> 	int err;
>> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>> +		err =3D =
platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>> +		if (err)
>> +			return err;
>> +	}
>=20
> I don't see why you need to register the ingenic-dw-hdmi driver here. =
Just register it in the ingenic-dw-hdmi driver.

Ok, I never though about this (as the code was not from me). We =
apparently just followed the IPU code pattern (learning by example).

It indeed looks not necessary and would also avoid the =
ingenic_dw_hdmi_driver_ptr dependency.

But: what is ingenic_ipu_driver_ptr then good for?

If we can get rid of this as well, we can drop patch 1/10 ("drm/ingenic: =
Fix drm_init error path if IPU was registered") completely.

>=20
> Cheers,
> -Paul
>=20

BR,
Nikolaus

