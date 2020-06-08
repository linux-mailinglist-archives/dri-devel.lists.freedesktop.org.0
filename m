Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81581F1975
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 14:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411B56E4EA;
	Mon,  8 Jun 2020 12:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D356E4EA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 12:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07E17AD7D;
 Mon,  8 Jun 2020 12:57:52 +0000 (UTC)
Subject: Re: [PATCH 07/14] drm/mgag200: Switch to managed MM
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-8-tzimmermann@suse.de>
 <20200605162229.GV20149@phenom.ffwll.local>
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
Message-ID: <ed52f9b3-40d0-e7e9-cb36-fc856d66bb7b@suse.de>
Date: Mon, 8 Jun 2020 14:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605162229.GV20149@phenom.ffwll.local>
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
Cc: airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0063157685=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0063157685==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7wy6VURznnKo5gIi6HlanPgxrYMDvg9cC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7wy6VURznnKo5gIi6HlanPgxrYMDvg9cC
Content-Type: multipart/mixed; boundary="cbkvIzhjInEPCRBP6ul9MjEIrYAMXPy2n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Message-ID: <ed52f9b3-40d0-e7e9-cb36-fc856d66bb7b@suse.de>
Subject: Re: [PATCH 07/14] drm/mgag200: Switch to managed MM
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-8-tzimmermann@suse.de>
 <20200605162229.GV20149@phenom.ffwll.local>
In-Reply-To: <20200605162229.GV20149@phenom.ffwll.local>

--cbkvIzhjInEPCRBP6ul9MjEIrYAMXPy2n
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.20 um 18:22 schrieb Daniel Vetter:
> On Fri, Jun 05, 2020 at 03:57:56PM +0200, Thomas Zimmermann wrote:
>> The memory-management code now cleans up automatically as part of
>> device destruction.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
>>  drivers/gpu/drm/mgag200/mgag200_main.c |  5 +----
>>  drivers/gpu/drm/mgag200/mgag200_mm.c   | 28 ++++++++++++++-----------=
-
>>  3 files changed, 16 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index cd786ffe319b8..7b6e6827a9a21 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -198,6 +198,5 @@ void mgag200_i2c_destroy(struct mga_i2c_chan *i2c)=
;
>> =20
>>  				/* mgag200_mm.c */
>>  int mgag200_mm_init(struct mga_device *mdev);
>> -void mgag200_mm_fini(struct mga_device *mdev);
>> =20
>>  #endif				/* __MGAG200_DRV_H__ */
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index e9ad783c2b44d..49bcdfcb40a4e 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -57,13 +57,11 @@ int mgag200_driver_load(struct drm_device *dev, un=
signed long flags)
>>  	ret =3D mgag200_modeset_init(mdev);
>>  	if (ret) {
>>  		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
>> -		goto err_mgag200_mm_fini;
>> +		goto err_mm;
>>  	}
>> =20
>>  	return 0;
>> =20
>> -err_mgag200_mm_fini:
>> -	mgag200_mm_fini(mdev);
>>  err_mm:
>>  	dev->dev_private =3D NULL;
>>  	return ret;
>> @@ -75,6 +73,5 @@ void mgag200_driver_unload(struct drm_device *dev)
>> =20
>>  	if (mdev =3D=3D NULL)
>>  		return;
>> -	mgag200_mm_fini(mdev);
>>  	dev->dev_private =3D NULL;
>>  }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mg=
ag200/mgag200_mm.c
>> index f56b0456994f4..1b1e5ec5d1ceb 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mm.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
>> @@ -28,6 +28,8 @@
>> =20
>>  #include <linux/pci.h>
>> =20
>> +#include <drm/drm_managed.h>
>> +
>>  #include "mgag200_drv.h"
>> =20
>>  static size_t mgag200_probe_vram(struct mga_device *mdev, void __iome=
m *mem,
>> @@ -73,6 +75,18 @@ static size_t mgag200_probe_vram(struct mga_device =
*mdev, void __iomem *mem,
>>  	return offset - 65536;
>>  }
>> =20
>> +static void mgag200_mm_release(struct drm_device *dev, void *ptr)
>> +{
>> +	struct mga_device *mdev =3D to_mga_device(dev);
>> +
>> +	mdev->vram_fb_available =3D 0;
>> +	iounmap(mdev->vram);
>> +	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
>> +				pci_resource_len(dev->pdev, 0));
>> +	arch_phys_wc_del(mdev->fb_mtrr);
>> +	mdev->fb_mtrr =3D 0;
>> +}
>> +
>>  int mgag200_mm_init(struct mga_device *mdev)
>>  {
>>  	struct drm_device *dev =3D mdev->dev;
>> @@ -104,22 +118,10 @@ int mgag200_mm_init(struct mga_device *mdev)
>> =20
>>  	mdev->vram_fb_available =3D mdev->mc.vram_size;
>> =20
>> -	return 0;
>> +	return drmm_add_action_or_reset(dev, mgag200_mm_release, NULL);
>> =20
>>  err_arch_phys_wc_del:
>>  	arch_phys_wc_del(mdev->fb_mtrr);
>>  	arch_io_free_memtype_wc(start, len);
>=20
> Btw I think devm versions of these two would benefit a bunch of drivers=
 in
> their cleanup code. devm_ not drmm_ since it's hw resource cleanup. In

Yup, I was looking and couldn't find them. Their non-existence is the
reason for the release function. Having them would make sense.

> case you ever run out of ideas :-)

I already have patches for further mgag200 mode-setting cleanups and ast
managed initialization. So no shortage of idea here. :)

Best regards
Thomas

>=20
> Cheeres, Daniel
>=20
>>  	return ret;
>>  }
>> -
>> -void mgag200_mm_fini(struct mga_device *mdev)
>> -{
>> -	struct drm_device *dev =3D mdev->dev;
>> -
>> -	mdev->vram_fb_available =3D 0;
>> -	iounmap(mdev->vram);
>> -	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
>> -				pci_resource_len(dev->pdev, 0));
>> -	arch_phys_wc_del(mdev->fb_mtrr);
>> -	mdev->fb_mtrr =3D 0;
>> -}
>> --=20
>> 2.26.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cbkvIzhjInEPCRBP6ul9MjEIrYAMXPy2n--

--7wy6VURznnKo5gIi6HlanPgxrYMDvg9cC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7eNcsACgkQaA3BHVML
eiNUIwgAiwnTpK33OpGu9/rA3mEDwEIk/AdX8o5NY3RDfqMaHcPy0Z6MVrWxetzf
KljygVc7UUCqxzkfms2cLJhzleZ3uBy9jmvTOCgTi+mgTFjnertt4nHEAZfct/vk
miMFHJ1fo0pcL9coCVLsDJAmM5DpL8ZsQeOjHYvB5xx3wFlXoUoBw7xgFIGtnzE/
y/yCx0Y7JmHCfJJmh8qxu9CWO7aNJjqu1JieT97cEV9wd0XX26Y6pFRBwiwIFocQ
y+eMGREARk8S0lxr6sowfwQLf5rQQgGiudaTWAfh14gUW+BvwqmkZ3YsRhhY+xvd
iCt9JI2BbM35DNTuOotLCfqbHhLTaA==
=8G6c
-----END PGP SIGNATURE-----

--7wy6VURznnKo5gIi6HlanPgxrYMDvg9cC--

--===============0063157685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0063157685==--
