Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D553E38C0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 07:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1489C89;
	Sun,  8 Aug 2021 05:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6589C89
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399043;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=7Ert+s0r6KUBPq4wN+OBE+a/bMzoIeSXq2yqFx3EB5E=;
 b=SkvVCbFxLriRCW4y1rbsTQshrAIwVglUA8fRATL8f/w1B3iWirUcZAdn7hbT+5dSoQ
 zQQ/Q4yIWSCRVL+sxNciPOXM90GCIlEsAlxBsofT8P5BaLkO/hYZDMh2KrfE8aqqVsK3
 nn1Xm4yuhynrjxIUbebwNEQ2m/mwmoCnGMry0fq4CiG50caiyoa1qrO65MiCMwXnX30R
 qTWpn+R/RPEt6Zia8BJB82/d+zNVgu4jbVM4mN2Q4t3Vo4dXWtwoJT3dPIUyJ0kmqWSa
 Mn17Ub8slTlqgoh4I7ShsjWmpLmzX9POur7eWhHZbjdkG4/442EewV5V2M9wesn0dwEE
 Oi8A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u3mM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x78542EyS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 07:04:02 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 3/8] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
Date: Sun, 8 Aug 2021 07:04:01 +0200
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
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B36D62BF-E4AF-46D5-BBD1-B73F66584F99@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
 <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
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

Hi Paul,
we have v3 ready and I'll post soon.
Before, here are some feedback to your comments.

> Am 05.08.2021 um 17:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus & Paul,
>> +
>> +		if (priv->soc_info->hwdesc_size =3D=3D sizeof(struct =
ingenic_dma_hwdesc_ext)) {
>=20
> I'd prefer a boolean flag, e.g. "soc_info->use_extended_hwdesc"

Done.

>> +			hwdesc_ext->cpos |=3D =
JZ_LCD_CPOS_PREMULTIPLY_LCD |
>> +					    (3 << =
JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>=20
> Where's that magic value '3' coming from?

We have defined a constant.

>=20
>> +
>> +			hwdesc_ext->dessize =3D
>> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>> +				(((height - 1) & =
JZ_LCD_DESSIZE_HEIGHT_MASK) <<
>> +						 =
JZ_LCD_DESSIZE_HEIGHT_OFFSET) |
>> +				(((width - 1) & =
JZ_LCD_DESSIZE_WIDTH_MASK) <<
>> +						=
JZ_LCD_DESSIZE_WIDTH_OFFSET);
>=20
> Use FIELD_PREP() from <linux/bitfield.h>.

Changed.

>=20
>> +		}
>> 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> 			fourcc =3D newstate->fb->format->format;
>> @@ -612,8 +657,12 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>> 	struct drm_connector *conn =3D conn_state->connector;
>> 	struct drm_display_info *info =3D &conn->display_info;
>> +	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
>> 	unsigned int cfg, rgbcfg =3D 0;
>> +	if (info->num_bus_formats)
>> +		bus_format =3D info->bus_formats[0];
>> +
>=20
> That code is going to change really soon, as I have my own PR ready to =
convert the ingenic-drm driver to use a top-level bridge for bus format =
/ flags negociation.
>=20
> The HDMI driver should therefore implement it as well; see for =
instance drivers/gpu/drm/bridge/ite-it66121.c for an example of how the =
bus format is negociated.
>=20
> I'll be sure to Cc you as soon as I send it upstream - should be just =
in a couple of days.

This one is still open.

>=20
>> 	priv->panel_is_sharp =3D info->bus_flags & =
DRM_BUS_FLAG_SHARP_SIGNALS;
>> 	if (priv->panel_is_sharp) {
>> @@ -623,6 +672,13 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>> 	}
>> +	if (priv->soc_info->has_recover)
>> +		cfg |=3D JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
>=20
> Seems out of place. Does it not work without?

Yes. We have moved it into a separate patch which enables additional =
jz4780 features.

>=20
>> +
>> +	/* CI20: set use of the 8-word descriptor and OSD foreground =
usage. */
>=20
> Not really CI20-specific though.

CI20 reference removed.

>=20
>> +	switch (conn_state->connector->connector_type) {
>> +	case DRM_MODE_CONNECTOR_TV:
>> +	case DRM_MODE_CONNECTOR_HDMIA:
>> +		return 0;
>> +	}
>=20
> This switch should move after the check on "num_bus_formats".
> (I understand why you did it, but with proper bus format negociation =
this won't be needed).

Not yet included since it breaks initialization. I think your proposed =
series will fix it.

>=20
>> +
>> 	if (info->num_bus_formats !=3D 1)
>> 		return -EINVAL;
>> -	drm->mode_config.max_height =3D 4095;
>> +	drm->mode_config.max_height =3D soc_info->max_height;
>=20
> The drm->mode_config.max_height is different from =
soc_info->max_height; the former is the maximum framebuffer size, the =
latter is the maximum size that the SoC can display. The framebuffer can =
be bigger than what the SoC can display.

Change removed.

>=20
>> 	drm->mode_config.funcs =3D &ingenic_drm_mode_config_funcs;
>> 	drm->mode_config.helper_private =3D =
&ingenic_drm_mode_config_helpers;
>> @@ -934,6 +994,7 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 		return PTR_ERR(base);
>> 	}
>> +	ingenic_drm_regmap_config.max_register =3D soc_info->max_reg;
>=20
> Avoid modifying a global variable; instead copy it to a local copy of =
ingenic_drm_regmap_config, and use this one in the regmap_init_mmio =
below.

modifies now a local copy on stack in v3.

>=20
>> 	priv->map =3D devm_regmap_init_mmio(dev, base,
>> 					  &ingenic_drm_regmap_config);
>> 	if (IS_ERR(priv->map)) {
>> @@ -966,7 +1027,6 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 	if (!priv->dma_hwdescs)
>> 		return -ENOMEM;
>> -
>=20
> Cosmetic change - not needed.

removed.

>=20
>> 	/* Configure DMA hwdesc for foreground0 plane */
>> 	dma_hwdesc_phys_f0 =3D priv->dma_hwdescs_phys
>> 		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
>> @@ -1147,7 +1207,26 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>> 	/* Enable OSD if available */
>> 	if (soc_info->has_osd)
>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +
>> +	if (soc_info->has_alpha)
>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_ALPHAEN);
>=20
> Do you need alpha blending support between planes, in this patch =
related to HDMI?

No. We have moved it into a separate patch which enables additional =
jz4780 features.

>=20
>> +
>> +	/* Magic values from the vendor kernel for the priority =
thresholds. */
>> +	if (soc_info->has_pcfg)
>> +		regmap_write(priv->map, JZ_REG_LCD_PCFG,
>> +			     JZ_LCD_PCFG_PRI_MODE |
>> +			     JZ_LCD_PCFG_HP_BST_16 |
>> +			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
>> +			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
>> +			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
>=20
> And why is that needed in this patch? Doesn't HDMI work without it?

Yes, works without. We have moved it into a separate patch which enables =
additional jz4780 features.

>=20
>> +
>> +	/* RGB output control may be superfluous. */
>> +	if (soc_info->has_rgbc)
>> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
>> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
>> +			     JZ_LCD_RGBC_ODD_LINE_RGB |
>> +			     JZ_LCD_RGBC_EVEN_LINE_RGB);
>=20
> The last two macros set the subpixel ordering on the bus for serial =
(3x8) 24-bit panels - completely unrelated to HDMI.

Yes. We have moved it into a separate patch which enables additional =
jz4780 features.

>=20
>> 	mutex_init(&priv->clk_mutex);
>> 	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>> @@ -1296,41 +1375,75 @@ static const struct jz_soc_info =
jz4740_soc_info =3D {
>> 	.needs_dev_clk =3D true,
>> 	.has_osd =3D false,
>> 	.map_noncoherent =3D false,
>> +	.has_pcfg =3D false,
>> +	.has_recover =3D false,
>> +	.has_rgbc =3D false,
>> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc),

...

>> +	.has_alpha =3D true,
>> +	.has_pcfg =3D true,
>> +	.has_recover =3D true,
>> +	.has_rgbc =3D true,
>> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc_ext),

We have moved it into a separate patch which enables additional jz4780 =
features.

>> +	.max_width =3D 4096,
>> +	.max_height =3D 4096,
>=20
> The PM says that the display is up to 4096x2048-30Hz; so this is =
wrong.

Changed max_height to 2048.

>> -	return platform_driver_register(&ingenic_drm_driver);
>> +	err =3D platform_driver_register(&ingenic_drm_driver);
>> +	if (err)
>> +		goto err_ipu_unreg;
>=20
> That's actually a change of behaviour - before it would return on =
error without calling platform_driver_unregister on the IPU.
>=20
> It is not necesarily bad, but it belongs in a separate commit.

We have added a separate commit at the beginning of the v3 series to fix =
IPU unregister.
And then add the hdmi register/unregister.

>> +#define JZ_LCD_RGBC_ODD_LINE_MASK		(0x7 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_RGB		(0 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_RBG		(1 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_GRB		(2 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_GBR		(3 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_BRG		(4 << 4)
>> +#define JZ_LCD_RGBC_ODD_LINE_BGR		(5 << 4)
>> +#define JZ_LCD_RGBC_EVEN_LINE_MASK		(0x7 << 0)
>> +#define JZ_LCD_RGBC_EVEN_LINE_RGB		0
>> +#define JZ_LCD_RGBC_EVEN_LINE_RBG		1
>> +#define JZ_LCD_RGBC_EVEN_LINE_GRB		2
>> +#define JZ_LCD_RGBC_EVEN_LINE_GBR		3
>> +#define JZ_LCD_RGBC_EVEN_LINE_BRG		4
>> +#define JZ_LCD_RGBC_EVEN_LINE_BGR		5
>=20
> We already have these in ingenic-drm.h...
>=20
> Please only add the macros that you need and are missing.

removed and made use of JZ_LCD_RGBC_EVEN_RGB etc.

>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus

