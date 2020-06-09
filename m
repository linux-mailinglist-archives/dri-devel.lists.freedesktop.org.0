Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C31F3735
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 11:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B248F89F08;
	Tue,  9 Jun 2020 09:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B52E89F08
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 09:45:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EA39CAD4A;
 Tue,  9 Jun 2020 09:45:29 +0000 (UTC)
Subject: Re: [PATCH v3 03/43] drm/cma-helper: Add DRM_GEM_CMA_DRIVER_OPS to
 set default GEM CMA functions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-4-tzimmermann@suse.de>
 <20200605081613.GA9325@pendragon.ideasonboard.com>
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
Message-ID: <ea77f730-935a-d03d-c50e-5e8cf17b949c@suse.de>
Date: Tue, 9 Jun 2020 11:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605081613.GA9325@pendragon.ideasonboard.com>
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
 philippe.cornu@st.com, paul@crapouillou.net, mihail.atanassov@arm.com,
 sam@ravnborg.org, alexandre.torgue@st.com, marex@denx.de,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au,
 Emil Velikov <emil.velikov@collabora.com>, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: multipart/mixed; boundary="===============0253855145=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0253855145==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SmcaaNWJpORcJZ0NDs2BJX1ND2NVQakn1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SmcaaNWJpORcJZ0NDs2BJX1ND2NVQakn1
Content-Type: multipart/mixed; boundary="y9kZjpbACODEKQLEWFSE3W7iC1GnpABfM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 kieran.bingham+renesas@ideasonboard.com, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, wens@csie.org,
 jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <ea77f730-935a-d03d-c50e-5e8cf17b949c@suse.de>
Subject: Re: [PATCH v3 03/43] drm/cma-helper: Add DRM_GEM_CMA_DRIVER_OPS to
 set default GEM CMA functions
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-4-tzimmermann@suse.de>
 <20200605081613.GA9325@pendragon.ideasonboard.com>
In-Reply-To: <20200605081613.GA9325@pendragon.ideasonboard.com>

--y9kZjpbACODEKQLEWFSE3W7iC1GnpABfM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.20 um 10:16 schrieb Laurent Pinchart:
> Hi Thomas,
>=20
> Thank you for the patch.
>=20
> On Fri, Jun 05, 2020 at 09:32:07AM +0200, Thomas Zimmermann wrote:
>> The macro to DRM_GEM_CMA_DRIVER_OPS sets GEM callbacks in struct drm_d=
river
>> to their defaults for CMA. An variant of the macro is provided for dri=
vers
>=20
> s/An variant/A variant/
>=20
>> that override the default .dumb_create callback. Adapt drivers to the =
changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Emil Velikov <emil.velikov@collabora.com>
>> ---
>>  include/drm/drm_gem_cma_helper.h | 46 +++++++++++++++++++++++++++++--=
-
>>  1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cm=
a_helper.h
>> index 2cdf333ae585d..5e1e595c0e72d 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -109,6 +109,42 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_obje=
ct *obj, void *vaddr);
>>  struct drm_gem_object *
>>  drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_=
t size);
>> =20
>> +/**
>> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operation=
s
>> + * @dumb_create_func: callback function for .dumb_create
>> + *
>> + * This macro provides a shortcut for setting the default GEM operati=
ons in the
>> + * &drm_driver structure.
>> + *
>> + * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that=

>> + * override the default implementation of &struct rm_driver.dumb_crea=
te. Use
>> + * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual=
 address
>> + * on imported buffers should use
>> + * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
>> + */
>> +#define DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
>> +	.gem_create_object	=3D drm_gem_cma_create_object_default_funcs, \
>> +	.dumb_create		=3D (dumb_create_func), \
>=20
> Do we need parentheses here ?

That can probably be removed.

Best regards
Thomas

>=20
>> +	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
>> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
>> +	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table, \
>> +	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap
>> +
>> +/**
>> + * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>> + *
>> + * This macro provides a shortcut for setting the default GEM operati=
ons in the
>> + * &drm_driver structure.
>> + *
>> + * Drivers that come with their own implementation of
>> + * &struct drm_driver.dumb_create should use
>> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead. Use
>> + * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual=
 address
>> + * on imported buffers should use DRM_GEM_CMA_DRIVER_OPS_VMAP instead=
=2E
>> + */
>> +#define DRM_GEM_CMA_DRIVER_OPS \
>> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
>> +
>>  /**
>>   * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE - CMA GEM driver oper=
ations
>>   *                                                ensuring a virtual =
address
>> @@ -120,8 +156,10 @@ drm_gem_cma_create_object_default_funcs(struct dr=
m_device *dev, size_t size);
>>   * imported buffers.
>>   *
>>   * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS_VMAP for drivers=
 that
>> - * override the default implementation of &struct rm_driver.dumb_crea=
te. Use
>> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
>> + * override the default implementation of &struct drm_driver.dumb_cre=
ate. Use
>> + * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not requi=
re a
>> + * virtual address on imported buffers should use
>> + * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
>>   */
>>  #define DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func=
) \
>>  	.gem_create_object	=3D drm_gem_cma_create_object_default_funcs, \
>> @@ -142,7 +180,9 @@ drm_gem_cma_create_object_default_funcs(struct drm=
_device *dev, size_t size);
>>   * Drivers that come with their own implementation of
>>   * &struct drm_driver.dumb_create should use
>>   * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead. Use
>> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible.
>> + * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not requi=
re a
>> + * virtual address on imported buffers should use DRM_GEM_CMA_DRIVER_=
OPS
>> + * instead.
>>   */
>>  #define DRM_GEM_CMA_DRIVER_OPS_VMAP \
>>  	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_cma_dumb_create=
)
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--y9kZjpbACODEKQLEWFSE3W7iC1GnpABfM--

--SmcaaNWJpORcJZ0NDs2BJX1ND2NVQakn1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7fWi4ACgkQaA3BHVML
eiMstgf+N9PIYd4kyadzHq682lzKB7P+3SfsCCsZ1G1Qo8FNqMfbOb88J5jyoxry
oJfVsqu8XvX+RNjuW2UjPmF+0E3fBVpyBiiereMp4Uc/01OWlUji3XrKe2KHpdN+
pwZmoX9PfBC7CCgZk8es2zHbyAUAeg3a89zJ4C9yHDnUBYCJ7OGh0pJLqu26qbO7
0oJ5LpSWP/0fMno2nFf2BBkTZjTGDCGidnMqsb5FxG1TNc8veK20RXMGGlIJsR/L
GgBcDJFvDB6TivCFRd4CXT/XkLl4JJ+G+bc7nHw9ig5DAcn4c0T39izJyN5a9uSZ
tg3m/goGuHr2enMSfPgRhYuO2fSfVQ==
=2NtE
-----END PGP SIGNATURE-----

--SmcaaNWJpORcJZ0NDs2BJX1ND2NVQakn1--

--===============0253855145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0253855145==--
