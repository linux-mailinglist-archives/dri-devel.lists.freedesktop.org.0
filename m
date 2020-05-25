Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D34981E0E24
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BA46E02C;
	Mon, 25 May 2020 12:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE686E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:10:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E258DB039;
 Mon, 25 May 2020 12:10:46 +0000 (UTC)
Subject: Re: [PATCH 05/21] drm/atmel-hlcdc: Use GEM CMA object functions
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-6-tzimmermann@suse.de>
 <20200522180824.GB1087580@ravnborg.org>
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
Message-ID: <8a1de3a8-05d2-9abc-57e9-e29928b777d3@suse.de>
Date: Mon, 25 May 2020 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522180824.GB1087580@ravnborg.org>
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
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 paul@crapouillou.net, laurent.pinchart@ideasonboard.com,
 mihail.atanassov@arm.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, joel@jms.id.au,
 alexandre.torgue@st.com, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, jsarha@ti.com, wens@csie.org, vincent.abriou@st.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, philippe.cornu@st.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 kernel@pengutronix.de, zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: multipart/mixed; boundary="===============1851613839=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1851613839==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U38GpDWG8bqu4o38LChG0KZAd8Ymn4NmD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U38GpDWG8bqu4o38LChG0KZAd8Ymn4NmD
Content-Type: multipart/mixed; boundary="iw0wNETVyIEdJKlpwKb8224o7ZPVboqAx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 philippe.cornu@st.com, paul@crapouillou.net,
 laurent.pinchart@ideasonboard.com, mihail.atanassov@arm.com,
 alexandre.torgue@st.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, james.qian.wang@arm.com, joel@jms.id.au,
 linux-imx@nxp.com, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, jsarha@ti.com, wens@csie.org, vincent.abriou@st.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bbrezillon@kernel.org, andrew@aj.id.au,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Message-ID: <8a1de3a8-05d2-9abc-57e9-e29928b777d3@suse.de>
Subject: Re: [PATCH 05/21] drm/atmel-hlcdc: Use GEM CMA object functions
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-6-tzimmermann@suse.de>
 <20200522180824.GB1087580@ravnborg.org>
In-Reply-To: <20200522180824.GB1087580@ravnborg.org>

--iw0wNETVyIEdJKlpwKb8224o7ZPVboqAx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.05.20 um 20:08 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Fri, May 22, 2020 at 03:52:30PM +0200, Thomas Zimmermann wrote:
>> The atmel-hlcdc driver uses the default implementation for CMA functio=
ns. The
>> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_dri=
ver.
>> All remaining operations are provided by CMA GEM object functions.
>=20
> A nice side-effect of introducing the defualt implementation
> of CMA functions is that this driver is now migrated over to use
> drm_gem_object_funcs, which is why we can replace all these
> helpers with a simple macro that defined only 6 helpers.
>=20
> With an improved changelog:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> And as I said in the other mail, this is really nice.
> It is now much more obvious that this drivers uses
> all the default helpers for CMA.
>=20
> And I can drop one item from my TODO list on top of that.

There's still more to do. The current macro still sets
=2Egem_object_create to a CMA default. But that pointer is the interface
where drivers can override some of the CMA object defaults, so it should
not be set by CMA helpers.

After the other CMA drivers have been converted to GEM object functions,
this setting can be kept to zero and __drm_gem_cma_create() can set the
default object functions. SHMEM and VRAM helpers already work this way.

Best regards
Thomas

>=20
> 	Sam
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gp=
u/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 112aa5066ceed..871293d1aeeba 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -821,16 +821,7 @@ static struct drm_driver atmel_hlcdc_dc_driver =3D=
 {
>>  	.irq_preinstall =3D atmel_hlcdc_dc_irq_uninstall,
>>  	.irq_postinstall =3D atmel_hlcdc_dc_irq_postinstall,
>>  	.irq_uninstall =3D atmel_hlcdc_dc_irq_uninstall,
>> -	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
>> -	.gem_vm_ops =3D &drm_gem_cma_vm_ops,
>> -	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>> -	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
>> -	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
>> -	.gem_prime_vmap =3D drm_gem_cma_prime_vmap,
>> -	.gem_prime_vunmap =3D drm_gem_cma_prime_vunmap,
>> -	.gem_prime_mmap =3D drm_gem_cma_prime_mmap,
>> -	.dumb_create =3D drm_gem_cma_dumb_create,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.fops =3D &fops,
>>  	.name =3D "atmel-hlcdc",
>>  	.desc =3D "Atmel HLCD Controller DRM",
>> --=20
>> 2.26.2
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


--iw0wNETVyIEdJKlpwKb8224o7ZPVboqAx--

--U38GpDWG8bqu4o38LChG0KZAd8Ymn4NmD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7Ltb8ACgkQaA3BHVML
eiPDQQf+LLWilJwCpadkL31CKP+yGXfzoxgqIEyM2LBJZ+bRCVyhvyY05jJNfyHR
AFJvBw5uc6c0nHd2Tjll5lwBfDlC8nYfXT5UuQB5LqN7/bz0m04rbkCsmy2RJe6b
3pnrWkyP8ubuMDv7SPY8p6gvVk4w3D7b6zBkznsrtxkvLevXVoHUmLce/6w+fvQ5
ubkKQQZ+T5dKwkcQzFNv08obQesd1nyND+Q5BWRp8/r6fGnnfIAKonI9rLe0gL18
n+RGtq5zm6SZcQnzkxOT08L1ct5dP6p2zxX1K1rZ31TBNRBbFEuFWYGfWACMB5MX
/rGGppCA11bS0KyMk5OZe51d08++Ng==
=bdN1
-----END PGP SIGNATURE-----

--U38GpDWG8bqu4o38LChG0KZAd8Ymn4NmD--

--===============1851613839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1851613839==--
