Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FF17DA15
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 08:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1376E228;
	Mon,  9 Mar 2020 07:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8496E228
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:55:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CF7BAC5C;
 Mon,  9 Mar 2020 07:55:10 +0000 (UTC)
Subject: Re: [PATCH 01/22] drm/arc: Use simple encoder
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-2-tzimmermann@suse.de>
 <20200306211802.GA17369@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <2cded827-de52-6110-505d-eacab9f28772@suse.de>
Date: Mon, 9 Mar 2020 08:55:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306211802.GA17369@ravnborg.org>
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 tomi.valkeinen@ti.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, ludovic.desroches@microchip.com,
 kgene@kernel.org, linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============1283179534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1283179534==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MGskBhwtfwJu2ES79w1QlBRF0CsXl3V4l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MGskBhwtfwJu2ES79w1QlBRF0CsXl3V4l
Content-Type: multipart/mixed; boundary="dfC3HwP1w1SRemUUkRjXLmFHcLkGVwl1e";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jingoohan1@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <2cded827-de52-6110-505d-eacab9f28772@suse.de>
Subject: Re: [PATCH 01/22] drm/arc: Use simple encoder
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-2-tzimmermann@suse.de>
 <20200306211802.GA17369@ravnborg.org>
In-Reply-To: <20200306211802.GA17369@ravnborg.org>

--dfC3HwP1w1SRemUUkRjXLmFHcLkGVwl1e
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 06.03.20 um 22:18 schrieb Sam Ravnborg:
> On Thu, Mar 05, 2020 at 04:59:29PM +0100, Thomas Zimmermann wrote:
>> The arc driver uses empty implementations for its encoders. Replace
>> the code with the generic simple encoder.
>=20
> We should , as a follow-up patch, embed the encoder in
> arcgpu_drm_private.
> Then we drop the kzalloc() and avoid that life-time challenge.

You're right, there's a devm_kzalloc() for the encoder. I didn't notice
before. And from what I learned from the drmm_ patches, this doesn't
work reliably.

I'll drop this patch, as the series is supposed to handle embedded
encoders. arcgpu will be fixed later when the managed API is ready.

Best regards
Thomas

>=20
> This patch looks good for what it does.
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 10 +++-------
>>  drivers/gpu/drm/arc/arcpgu_sim.c  |  8 ++------
>>  2 files changed, 5 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/a=
rcpgu_hdmi.c
>> index 52839934f2fb..780911765e2e 100644
>> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
>> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
>> @@ -7,15 +7,12 @@
>> =20
>>  #include <drm/drm_bridge.h>
>>  #include <drm/drm_crtc.h>
>> -#include <drm/drm_encoder.h>
>>  #include <drm/drm_device.h>
>> +#include <drm/drm_encoder.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "arcpgu.h"
>> =20
>> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs =3D {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *=
np)
>>  {
>>  	struct drm_encoder *encoder;
>> @@ -34,8 +31,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, str=
uct device_node *np)
>> =20
>>  	encoder->possible_crtcs =3D 1;
>>  	encoder->possible_clones =3D 0;
>> -	ret =3D drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
>> -			       DRM_MODE_ENCODER_TMDS, NULL);
>> +	ret =3D drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS)=
;
>>  	if (ret)
>>  		return ret;
>> =20
>> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/ar=
cpgu_sim.c
>> index 37d961668dfe..66ca2c26e339 100644
>> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
>> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
>> @@ -8,6 +8,7 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "arcpgu.h"
>> =20
>> @@ -50,10 +51,6 @@ static const struct drm_connector_funcs arcpgu_drm_=
connector_funcs =3D {
>>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=

>>  };
>> =20
>> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs =3D {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *n=
p)
>>  {
>>  	struct arcpgu_drm_connector *arcpgu_connector;
>> @@ -68,8 +65,7 @@ int arcpgu_drm_sim_init(struct drm_device *drm, stru=
ct device_node *np)
>>  	encoder->possible_crtcs =3D 1;
>>  	encoder->possible_clones =3D 0;
>> =20
>> -	ret =3D drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
>> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	ret =3D drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_VIRTU=
AL);
>>  	if (ret)
>>  		return ret;
>> =20
>> --=20
>> 2.25.1

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dfC3HwP1w1SRemUUkRjXLmFHcLkGVwl1e--

--MGskBhwtfwJu2ES79w1QlBRF0CsXl3V4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5l9lgACgkQaA3BHVML
eiMBRAgApqR+Law2DXZaFiuIJ24c8VPSKEu7Giq7JYiLOVGmKsm1p0fLKQq8TmFi
bwgTe5PfO3G5rI3dzNv1j7u/c5JmQoOr5HqaKBFYz212GbEf25k2r2I9QDiO4yOb
y37Fc7QVRj2rGJXyS9Zal6hvTZKpHBGlxCNBW0xuL5xwNiIUXHKta+13mqb3+PEg
Td2cB8ln0K0sQG6kHgzlc3abvBRu1s8z0hXfpIkxlwvBdq/w0bgNxKcPf51KkbZX
JW6WnFBik8AmFzdbOueul3n0oR+ax7JhtbFqbgi3sipfBbVep3SptrkVgUG4XVqR
yxbVG3sywas5MF21bJOKVgiEQP3f7A==
=tCLj
-----END PGP SIGNATURE-----

--MGskBhwtfwJu2ES79w1QlBRF0CsXl3V4l--

--===============1283179534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1283179534==--
