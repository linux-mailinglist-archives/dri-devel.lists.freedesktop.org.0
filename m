Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8B131064
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85526E227;
	Mon,  6 Jan 2020 10:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9346E227
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:20:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF738B164;
 Mon,  6 Jan 2020 10:20:48 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191212074117.29283-1-tzimmermann@suse.de>
 <20191212074117.29283-4-tzimmermann@suse.de>
 <20191213102748.GG624164@phenom.ffwll.local>
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
Message-ID: <561a1d96-5ce2-cdd3-6080-c7aca1a7839d@suse.de>
Date: Mon, 6 Jan 2020 11:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191213102748.GG624164@phenom.ffwll.local>
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 airlied@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1882272236=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1882272236==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z1iEInLWnwiZrDCsqz7trSnD3eQBOlQNV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Z1iEInLWnwiZrDCsqz7trSnD3eQBOlQNV
Content-Type: multipart/mixed; boundary="0O4eyYcMAqReHQGfmdjPPrVAl8oXsj5Mr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <561a1d96-5ce2-cdd3-6080-c7aca1a7839d@suse.de>
Subject: Re: [PATCH v2 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
References: <20191212074117.29283-1-tzimmermann@suse.de>
 <20191212074117.29283-4-tzimmermann@suse.de>
 <20191213102748.GG624164@phenom.ffwll.local>
In-Reply-To: <20191213102748.GG624164@phenom.ffwll.local>

--0O4eyYcMAqReHQGfmdjPPrVAl8oXsj5Mr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.12.19 um 11:27 schrieb Daniel Vetter:
> On Thu, Dec 12, 2019 at 08:41:17AM +0100, Thomas Zimmermann wrote:
>> Drivers that what to allocate VRAM GEM objects with additional fields
>> can now do this by implementing struct drm_driver.gem_create_object.
>>
>> v2:
>> 	* only cast to gbo within if branch; set gbo directly
>> 	  in else branch
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index b760fd27f3c0..baa49d1e9538 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -2,6 +2,7 @@
>> =20
>>  #include <drm/drm_debugfs.h>
>>  #include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_framebuffer.h>
>>  #include <drm/drm_gem_ttm_helper.h>
>> @@ -145,7 +146,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(s=
truct drm_device *dev,
>>  	struct drm_gem_vram_object *gbo;
>>  	int ret;
>> =20
>> -	gbo =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
>> +	if (dev->driver->gem_create_object) {
>> +		struct drm_gem_object *gem =3D
>> +			dev->driver->gem_create_object(dev, size);
>> +		gbo =3D drm_gem_vram_of_gem(gem);
>> +	} else {
>> +		gbo =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
>> +	}
>>  	if (!gbo)
>=20
> See my other mail, I'd move the check too into if/else blocks. ERR_PTR
> after an upcast is always a bit scary.

What a stupid mistake. I should have seen that myself. Will be fixed in
the next iteration.

Best regards
Thomas

> -Daniel
>=20
>>  		return ERR_PTR(-ENOMEM);
>> =20
>> --=20
>> 2.24.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0O4eyYcMAqReHQGfmdjPPrVAl8oXsj5Mr--

--Z1iEInLWnwiZrDCsqz7trSnD3eQBOlQNV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4TCf8ACgkQaA3BHVML
eiPJTgf/ZJsyxJCOwCDmhjlEMuVKYX8u4pcGGVNouM5UNr0MewEGgHCbL/n0pBBn
sHAMELrEAN+MFNxlvClORdqu9mUGH6mocj9cyhERCVHTYVTF0cIKJ2iidELHv5UD
MhEOO8+aB0n4kkoayt1OmDcphc2W4DuflHnw7P68VJ/Dp9yuuoZoE2MowFCR5uBs
KcpPEYJOcElJdexatCRo8wJThpUjQlAff85SV9CDDfGbkED9YG8YV1TSv8H+i7cs
DXxzcBdMGq6jRVTqOM5eD4IXdz7qa5hykHTPAJJch3ay4FwkIme/Pj39pP1Fd2hO
BW/nc46OJD2P2amMl5V87QmPId+sDA==
=Ij+p
-----END PGP SIGNATURE-----

--Z1iEInLWnwiZrDCsqz7trSnD3eQBOlQNV--

--===============1882272236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1882272236==--
