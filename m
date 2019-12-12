Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6011C586
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 06:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0B6EC59;
	Thu, 12 Dec 2019 05:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA5D6EC59
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 05:39:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D0FEB17C;
 Thu, 12 Dec 2019 05:39:09 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-4-tzimmermann@suse.de>
 <20191211191128.GA8889@ravnborg.org>
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
Message-ID: <c9ae9948-06b7-377a-7b4e-35ed60a344b6@suse.de>
Date: Thu, 12 Dec 2019 06:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211191128.GA8889@ravnborg.org>
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
 z.liuxinliang@hisilicon.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 zourongrong@gmail.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0118423285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0118423285==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UUl3GiSOLkL6wjYs9thwOXfR2lUZlh1YU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UUl3GiSOLkL6wjYs9thwOXfR2lUZlh1YU
Content-Type: multipart/mixed; boundary="TRD6ZB2zBiEoT6JJL7DNxgCL8ERPYlGYZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Message-ID: <c9ae9948-06b7-377a-7b4e-35ed60a344b6@suse.de>
Subject: Re: [PATCH 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-4-tzimmermann@suse.de>
 <20191211191128.GA8889@ravnborg.org>
In-Reply-To: <20191211191128.GA8889@ravnborg.org>

--TRD6ZB2zBiEoT6JJL7DNxgCL8ERPYlGYZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 11.12.19 um 20:11 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Wed, Dec 11, 2019 at 07:08:32PM +0100, Thomas Zimmermann wrote:
>> Drivers that what to allocate VRAM GEM objects with additional fields
>> can now do this by implementing struct drm_driver.gem_create_object.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index b760fd27f3c0..d475d94e2e3e 100644
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
>> @@ -142,13 +143,19 @@ struct drm_gem_vram_object *drm_gem_vram_create(=
struct drm_device *dev,
>>  						size_t size,
>>  						unsigned long pg_align)
>>  {
>> +	struct drm_gem_object *gem;
>>  	struct drm_gem_vram_object *gbo;
>>  	int ret;
>> =20
>> -	gbo =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
>> -	if (!gbo)
>> +	if (dev->driver->gem_create_object)
>> +		gem =3D dev->driver->gem_create_object(dev, size);
>> +	else
>> +		gem =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
> The size is (*gbo) but you assume it is a gem.
> Looks wrong at first glance???

The conversion to gbo is...

>=20
> 	Sam
>=20
>=20
>> +	if (!gem)
>>  		return ERR_PTR(-ENOMEM);
>> =20
>> +	gbo =3D drm_gem_vram_of_gem(gem);
>> +

=2E..here. This could be pushed into the if branch, but I found it more
readable to put the statement here. For the else branch, it doesn't
matter as 'gem' goes first in the structure.

I'll move it into the if branch, so it's more obvious what's going on
and doesn't break accidentally.

Best regards
Thomas

>>  	ret =3D drm_gem_vram_init(dev, gbo, size, pg_align);
>>  	if (ret < 0)
>>  		goto err_kfree;
>> --=20
>> 2.24.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TRD6ZB2zBiEoT6JJL7DNxgCL8ERPYlGYZ--

--UUl3GiSOLkL6wjYs9thwOXfR2lUZlh1YU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3x0nsACgkQaA3BHVML
eiP9cwgAsEVOGgsAKcqvA3N1qluGBJYZ80P9W3GK59uFh7xtAHH65LNKkgj6fjYV
M7GR/sAtsoZ9U8il9pnCbw0GpRvbrzvnRVnEsTOy5NWMuRLKyqvpwTwiCRAmTbYQ
3oYOqJUkAjxP2hk0ivZajfLBTTfrVsUwn5a3s3RRzITemnTh6Q2OtHHXIKcXKbt4
KIVRMFHcuqRfAOE6lrKPC16lixj+vxJCXiqv4byolLf0Aly/uPwkN8PHOzBqVKMN
jZyPCx9zK+/tHPXHqkMjtXBlqkuN82BvkQ6kQ4y1Wzt7bhNO9pF4I09uleA9LbW0
SiG7cSZN0PUFHWZW8/4hn7Bfw4v5Dw==
=EbtJ
-----END PGP SIGNATURE-----

--UUl3GiSOLkL6wjYs9thwOXfR2lUZlh1YU--

--===============0118423285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0118423285==--
