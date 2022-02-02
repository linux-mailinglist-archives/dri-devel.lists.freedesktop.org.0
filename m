Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601F4A7061
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6910E247;
	Wed,  2 Feb 2022 11:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7FC89B05
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643802997;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=P1UU9/Rd4PWE6S/mNmRynY70CMbHTFJdQ7fBfwQCW4Q=;
 b=EFC+nZZfHUsltYdOFwdou7RTL0skLnR4kDUCYa9O2IwgpkayuqowhnH/j7gd3wRB9J
 ye0BJgdgh5yoZUt4KcPkSUMF8eufiGc3YbrHzysjBJ/j/1lI+eXmmwCEgUj7w3Tvqt1F
 NPeBbsWIN7F5dLVI/nRLKZ+SqxLm8eu+b7FkVxctQw/0REqHDlPTwFrKgTJaf/7qTcJ/
 AyjKjzECdRXD+ZqqVXCy0/e1rFZujH2VkFJzOGIAujCDBXrnxRuvW86C0X6YoJ1LUhYe
 wt11AWneSPalu8dn1Zl7jgKLdSVJWP9F6KLRPyNlMHINxqyAW9pPWFxQ+bQzT+JkAjxD
 GC9w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDCocQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12Bua9kq
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 12:56:36 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v12 2/9] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <N7AO6R.7I6FABF106MT1@crapouillou.net>
Date: Wed, 2 Feb 2022 12:56:35 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F27171F-DFCA-4707-8F50-D1A343F6D78E@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <6a7b188769a7ad477bf8cb71e1b9bc086b92388d.1643632014.git.hns@goldelico.com>
 <N7AO6R.7I6FABF106MT1@crapouillou.net>
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
thanks for the reviews. Looks as if we are close to making a goal.

> Am 02.02.2022 um 11:23 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le lun., janv. 31 2022 at 13:26:48 +0100, H. Nikolaus Schaller =
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
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 61 =
++++++++++++++++++++++-
>> drivers/gpu/drm/ingenic/ingenic-drm.h     | 38 ++++++++++++++
>> 2 files changed, 98 insertions(+), 1 deletion(-)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index 9c60fc4605e4b..ccdb9eedd9247 100644
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
>> @@ -59,7 +65,9 @@ struct ingenic_dma_hwdescs {
>> struct jz_soc_info {
>> 	bool needs_dev_clk;
>> 	bool has_osd;
>> +	bool has_alpha;
>> 	bool map_noncoherent;
>> +	bool use_extended_hwdesc;
>> 	unsigned int max_width, max_height;
>> 	const u32 *formats_f0, *formats_f1;
>> 	unsigned int num_formats_f0, num_formats_f1;
>> @@ -446,6 +454,9 @@ static int ingenic_drm_plane_atomic_check(struct =
drm_plane *plane,
>> 	if (!crtc)
>> 		return 0;
>> +	if (plane =3D=3D &priv->f0)
>> +		return -EINVAL;
>=20
> This will break JZ4725B -> JZ4770 SoCs, the f0 plane is perfectly =
usable there.

Hm. I think it was your request/proposal to add this [1]?

What I have forgotten is why the f0 plane should not be usable for =
jz4780.

BR and thanks,
Nikolaus

[1] end of =
https://patchwork.kernel.org/project/dri-devel/patch/2c7d0aa7d3ef480ebb996=
d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com/#24578683


>=20
> Cheers,
> -Paul
>=20
>> +
>> 	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
>> 							crtc);
>> 	if (WARN_ON(!crtc_state))
>> @@ -662,6 +673,33 @@ static void =
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
>> +			hwdesc->cpos |=3D (JZ_LCD_CPOS_COEFFICIENT_1 <<
>> +					 =
JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>> +			hwdesc->dessize =3D
>> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK, =
height - 1) |
>> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK, =
width - 1);
>> +		}
>> +
>> 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> 			fourcc =3D newstate->fb->format->format;
>> @@ -693,6 +731,9 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>> 	}
>> +	if (priv->soc_info->use_extended_hwdesc)
>> +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
>> +
>> 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> 		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>> 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> @@ -1015,6 +1056,7 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 	long parent_rate;
>> 	unsigned int i, clone_mask =3D 0;
>> 	int ret, irq;
>> +	u32 osdc =3D 0;
>> 	soc_info =3D of_device_get_match_data(dev);
>> 	if (!soc_info) {
>> @@ -1272,7 +1314,10 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>> 	/* Enable OSD if available */
>> 	if (soc_info->has_osd)
>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +		osdc |=3D JZ_LCD_OSDC_OSDEN;
>> +	if (soc_info->has_alpha)
>> +		osdc |=3D JZ_LCD_OSDC_ALPHAEN;
>> +	regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);
>> 	mutex_init(&priv->clk_mutex);
>> 	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>> @@ -1468,10 +1513,24 @@ static const struct jz_soc_info =
jz4770_soc_info =3D {
>> 	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>> };
>> +static const struct jz_soc_info jz4780_soc_info =3D {
>> +	.needs_dev_clk =3D true,
>> +	.has_osd =3D true,
>> +	.has_alpha =3D true,
>> +	.use_extended_hwdesc =3D true,
>> +	.max_width =3D 4096,
>> +	.max_height =3D 2048,
>> +	.formats_f1 =3D jz4770_formats_f1,
>> +	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>> +	.formats_f0 =3D jz4770_formats_f0,
>> +	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>> +};
>> +
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
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h =
b/drivers/gpu/drm/ingenic/ingenic-drm.h
>> index 22654ac1dde1c..cb1d09b625881 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
>> @@ -44,8 +44,11 @@
>> #define JZ_REG_LCD_XYP1				0x124
>> #define JZ_REG_LCD_SIZE0			0x128
>> #define JZ_REG_LCD_SIZE1			0x12c
>> +#define JZ_REG_LCD_PCFG				0x2c0
>> #define JZ_LCD_CFG_SLCD				BIT(31)
>> +#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
>> +#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
>> #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>> #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
>> #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
>> @@ -63,6 +66,7 @@
>> #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
>> #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
>> #define JZ_LCD_CFG_18_BIT			BIT(7)
>> +#define JZ_LCD_CFG_24_BIT			BIT(6)
>> #define JZ_LCD_CFG_PDW				(BIT(5) | =
BIT(4))
>> #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
>> @@ -132,6 +136,7 @@
>> #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
>> #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
>> #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
>> +#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
>> #define JZ_LCD_SYNC_MASK			0x3ff
>> @@ -153,6 +158,7 @@
>> #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
>> #define JZ_LCD_OSDC_OSDEN			BIT(0)
>> +#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
>> #define JZ_LCD_OSDC_F0EN			BIT(3)
>> #define JZ_LCD_OSDC_F1EN			BIT(4)
>> @@ -176,6 +182,38 @@
>> #define JZ_LCD_SIZE01_WIDTH_LSB			0
>> #define JZ_LCD_SIZE01_HEIGHT_LSB		16
>> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
>> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
>> +#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
>> +
>> +#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
>> +#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
>> +#define JZ_LCD_CPOS_BPP_30			(7 << 27)
>> +#define JZ_LCD_CPOS_RGB555			BIT(30)
>> +#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
>> +#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
>> +#define JZ_LCD_CPOS_COEFFICIENT_0		0
>> +#define JZ_LCD_CPOS_COEFFICIENT_1		1
>> +#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
>> +#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
>> +
>> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
>> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
>> +#define JZ_LCD_RGBC_422				BIT(8)
>> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
>> +
>> +#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
>> +#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
>> +#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
>> +#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
>> +#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
>> +#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
>> +
>> struct device;
>> struct drm_plane;
>> struct drm_plane_state;
>> --
>> 2.33.0
>=20
>=20

