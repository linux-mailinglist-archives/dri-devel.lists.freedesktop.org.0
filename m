Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEA447314
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 14:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AE894E0;
	Sun,  7 Nov 2021 13:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA34894E0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636292481;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Q/iuGcb2LgHieQOGjNHXXeQz4fzitIgIiGMS6RAJfas=;
 b=AcYIFBUVfwc6RY8NrqOooR423mdZRSscuXZHEUtjrOPgobsjCqmMRtAC0ILV6Y4DjB
 qWTp7BOBsDw4kUq25C82jFcafKC7OcskFd8DGHhm3gVuYGPpDraH9C3+snVf+tc5Ty5/
 e+2cOacSW+cSIq1nVwA8gPNKWuFrRuF789IicO075oTkYieqp2HBCgJhkV6BADm8PVr0
 9dF3JVmPhfP86uVhVnVVtXFa78uj0x0prKbN5bXpEEWP038aZ/J5YUV9wtN+czd4p+h2
 q2NG9Bk1K8TlydbceJz3pt8+cC1l3Hju0TTSC7XdwIbUaizd9wfgsANvoZw+IFAQujqf
 PtZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA7DfIFnz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 7 Nov 2021 14:41:18 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
Date: Sun, 7 Nov 2021 14:41:18 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
sorry for the delay in getting back to this, but I was distracted by =
more urgent topics.

> Am 05.10.2021 um 22:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller =
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

>> 			case DRM_FORMAT_XRGB8888:
>> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
>> +				break;
>> +			}
>> +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
>> +					    =
(JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>> +					     =
JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>=20
> Knowing that OSD mode doesn't really work with this patch, I doubt you =
need to configure per-plane alpha blending.

Well, we can not omit setting some CPOS_COEFFICIENT different from 0.

This would mean to multiply all values with 0, i.e. gives a black =
screen.

So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.

But then, why not do it right from the beginning?

>=20
>> +
>> +			hwdesc->dessize =3D
>> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
>=20
> Same here.
>=20
>> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
>> +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, =
height - 1) |
>> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
>> +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, =
width - 1);
>=20
> Better pre-shift your *_MASK macros (and use GENMASK() in them) and =
remove the *_OFFSET macros.

Ok, I see. Nice. Makes code and definitions much cleaner.
Changed for v6.

>=20
>> +		}
>> +
>> 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> 			fourcc =3D newstate->fb->format->format;
>> @@ -694,6 +732,10 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>> 	}
>> +	/* set use of the 8-word descriptor and OSD foreground usage. */
>=20
> I think you can remove this comment - this code doesn't actually set =
OSD mode, but it does enable the use of the extended hardware descriptor =
format, and I think it is already self-explanatory.

Agreed and removed.

>=20
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
> I remember saying to split this change into its own patch :)

Yes, I remember as well, but it does not make sense to me.

A first patch would introduce regmap_config. This needs =
soc_info->max_reg
to be defined as a struct component.

This requires all soc_info to be updated for all SoC (w/o =
jz4780_soc_info
in this first patch because it has not been added yet) to a constant (!)
JZ_REG_LCD_SIZE1.

And the second patch would then add jz4780_soc_info and set its max_reg =
to
a different value.

IMHO, such a separate first patch has no benefit independent from adding
jz4780 support, as far as I can see.

If your fear issues with bisectability:
- code has been tested
- if this fails, bisect will still point to this patch, where it is easy =
to locate

So I leave it in v6 unsplitted.

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
> This change is unrelated to this patch, and I'm not even sure it's a =
valid change. The driver shouldn't rely on previous register values.

I think I already commented that I think the driver should also not =
reset
previous register values to zero.

If I counted correctly this register has 18 bits which seem to include
some interrupt masks (which could be initialized somewhere else) and we
write a constant 0x1.

Of course most other bits are clearly OSD related (alpha blending),
i.e. they can have any value (incl. 0) if OSD is disabled. But here we
enable it. I think there may be missing some setting for the other bits.

So are you sure, that we can unconditionally reset *all* bits
except JZ_LCD_OSDC_OSDEN for the jz4780?

Well I have no experience with OSD being enabled at all. I.e. I have no
test scenario.

So we can leave it out in v6.

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
>=20
> =46rom a quick look at the PMs, it doesn't seem so.

Fine. I'll remove the comment in v6.

>=20
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
> As I said in your v4... You don't need to add this here. The =
ingenic-dw-hdmi.c should take care of registering its driver.

Well, I can not identify any difference in code structure to the IPU =
code.

The Makefile (after our patch) looks like:

obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
ingenic-drm-y =3D ingenic-drm-drv.o
ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o

which means that ingenic-dw-hdmi.o is also compiled into ingenic-drm,
like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not, there
are these IS_ENABLED() tests to guard against compiler errors.

Is there any technical reason to request a driver structure and =
registration
different from IPU here?

Why not having ingenic-ipu.c taking care of registering its driver as =
well?

As soon as this is clarified, I can post a v6.

>=20
> As for the overall change... I am a bit annoyed that this only =
supports the F1 plane at the screen's resolution. Anything else (F1 =
plane at specific coordinates, F0 plane alone, or F0+F1) does not work.

Yes, having two planes working would be interesting.

> I think at least the F1 plane's position should be easy to do (just =
setting the cpos field in the hwdesc).
>=20
> It is OK to leave the rest for later (I'm not asking you to do all =
that). However it would be a good idea to add a check in =
ingenic_drm_crtc_atomic_check(), which would return -EINVAL if anything =
else than the working configuration is attempted.

Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
would be notified about planes. Which configuration parameters
should be checked for?

>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus

