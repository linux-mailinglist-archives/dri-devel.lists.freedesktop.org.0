Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2921E0E9C
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357FD89AC9;
	Mon, 25 May 2020 12:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E1289AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:41:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BFCEAD17;
 Mon, 25 May 2020 12:41:59 +0000 (UTC)
Subject: Re: [PATCH 07/21] drm/hisilicon/kirin: Use GEM CMA object functions
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
 <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
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
Message-ID: <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
Date: Mon, 25 May 2020 14:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, nicolas.ferre@microchip.com,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>, khilman@baylibre.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, ludovic.desroches@microchip.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, joel@jms.id.au,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, Philippe Cornu <philippe.cornu@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sascha Hauer <kernel@pengutronix.de>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1256767290=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1256767290==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wfm2x9SGhUN4Mvdvt7GUgmDbtTSXZIr0q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wfm2x9SGhUN4Mvdvt7GUgmDbtTSXZIr0q
Content-Type: multipart/mixed; boundary="UjtqkFMbXJVAAv0qq3332iJaBv8R2fCJM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg
 <sam@ravnborg.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, ludovic.desroches@microchip.com,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 joel@jms.id.au, NXP Linux Team <linux-imx@nxp.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Jyri Sarha <jsarha@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Vincent Abriou <vincent.abriou@st.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bbrezillon@kernel.org,
 andrew@aj.id.au, ML dri-devel <dri-devel@lists.freedesktop.org>,
 nicolas.ferre@microchip.com, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 khilman@baylibre.com, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Message-ID: <ccee78e2-8930-2de6-0b7c-0f1ad1e636f8@suse.de>
Subject: Re: [PATCH 07/21] drm/hisilicon/kirin: Use GEM CMA object functions
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-8-tzimmermann@suse.de>
 <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>
In-Reply-To: <CACvgo51cYh4iLKEfrLSbgOGQM4=ojsBq54gW9VJBPoX+p04o+g@mail.gmail.com>

--UjtqkFMbXJVAAv0qq3332iJaBv8R2fCJM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 22.05.20 um 20:11 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Fri, 22 May 2020 at 14:53, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> The kirin driver uses the default implementation for CMA functions; ex=
cept
>> for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro now =
sets
>> these defaults and .dumb_create in struct drm_driver. All remaining
>> operations are provided by CMA GEM object functions.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 12 +-----------
>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers=
/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
>> index c339e632522a9..b1ffd7d43e562 100644
>> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
>> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
>> @@ -921,17 +921,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
>>  static struct drm_driver ade_driver =3D {
>>         .driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOM=
IC,
>>         .fops =3D &ade_fops,
>> -       .gem_free_object_unlocked =3D drm_gem_cma_free_object,
>> -       .gem_vm_ops =3D &drm_gem_cma_vm_ops,
>> -       .dumb_create =3D drm_gem_cma_dumb_create_internal,
>=20
> This doesn't seem right. The _internal documentation explicitly says
> that this should _not_ be used as .dumb_create. Instead drivers should
> use it to implement their callback.
>=20
> Since it yields the same result as drm_gem_cma_dumb_create we can use
> the default macro below.

I noticed this and thought that the driver authors probably had their
reasons. Changing the driver to the default macro is probably still a
good idea.

Best regards
Thomas

>=20
> Weather to the .dumb_create in separate patch, or squash it here -
> I'll leave to you.
> In case of the latter, please mentioned it in the commit message.
>=20
> -Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UjtqkFMbXJVAAv0qq3332iJaBv8R2fCJM--

--wfm2x9SGhUN4Mvdvt7GUgmDbtTSXZIr0q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7LvRIACgkQaA3BHVML
eiN2ewgAkmuMplpbC5LqXdnzF4LkOCBNUM3nULyjENDhH0jEKFZpowHxLheYo0vV
Zf9EyZpbvv95uQoGWm8qPPHPhrG5BKaiQGB4tubCG6zAtFsBbZagjfDrkMJescxs
h5Qpqse1JSgmgsAq4GBpcRgy45RiHq96ElO9eHv4uAqtiAbIxmAvklofRnK2XbgL
g/xsE/9RfatntMan7tSmAY9Td1OucpPBPY3WGB/Md7/DMPvPh2kxXGYLN2+7LN4Y
GWhx7w7hMIZRSGU7dF++C+qwJjsda2Ri3AeaP9uNgQ36OXLvrBXwdTjJ+idRY8nb
rE+KZtVpNj7pd2lYizLKbHDiLJixHg==
=aTLc
-----END PGP SIGNATURE-----

--wfm2x9SGhUN4Mvdvt7GUgmDbtTSXZIr0q--

--===============1256767290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1256767290==--
