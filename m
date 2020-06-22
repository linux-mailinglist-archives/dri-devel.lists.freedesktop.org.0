Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06B203A66
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F626E827;
	Mon, 22 Jun 2020 15:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090716E826
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:12:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E8B7C1C3;
 Mon, 22 Jun 2020 15:12:04 +0000 (UTC)
Subject: Re: [PATCH] drm/mgag200: Enable caching for SHMEM pages
To: Rong Chen <rong.a.chen@intel.com>
References: <20200618133435.25425-1-tzimmermann@suse.de>
 <20200622150050.GV5535@shao2-debian>
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
Message-ID: <31025445-7ffd-7feb-5af9-097f8c657410@suse.de>
Date: Mon, 22 Jun 2020 17:12:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622150050.GV5535@shao2-debian>
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1909525160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1909525160==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5GBMt4anNZub42ozroysUYfoXgctCiksn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5GBMt4anNZub42ozroysUYfoXgctCiksn
Content-Type: multipart/mixed; boundary="r6KDF286KeeQcAQx319IqjmgqKp3hOud0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski
 <krzk@kernel.org>, John Donnelly <john.p.donnelly@Oracle.com>
Message-ID: <31025445-7ffd-7feb-5af9-097f8c657410@suse.de>
Subject: Re: [PATCH] drm/mgag200: Enable caching for SHMEM pages
References: <20200618133435.25425-1-tzimmermann@suse.de>
 <20200622150050.GV5535@shao2-debian>
In-Reply-To: <20200622150050.GV5535@shao2-debian>

--r6KDF286KeeQcAQx319IqjmgqKp3hOud0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.06.20 um 17:00 schrieb Rong Chen:
> Hi Thomas,
>=20
> I tested the patch based on commit 24b806b0a1dd3, the regression

Thanks!

> of phoronix-test-suite.glmark2.1024x768.score still exists:

I expected that the test is related to drawing onto the screen. Do you
know what exactly it is testing?

Best regards
Thomas

>=20
> 1f58fcaf27cb7 drm/mgag200: Enable caching for SHMEM pages              =
                              2 2 2
> 24b806b0a1dd3 drm-tip: 2020y-06m-22d-07h-52m-06s UTC integration manife=
st                            2 2 2 2 2
> 913ec479bb5cc drm/mgag200: Replace VRAM helpers with SHMEM helpers     =
                              2 2 2 2 2
> 88fabb75ea9ed drm/mgag200: Convert to simple KMS helper                =
                              165 168 167 165 164
>=20
> Best Regards,
> Rong Chen
>=20
> On Thu, Jun 18, 2020 at 03:34:35PM +0200, Thomas Zimmermann wrote:
>> We've had reports about performance regressions after switching
>> mgag200 from VRAM helpers to SHMEM helpers. SHMEM pages use
>> writecombine caching by default, but can also use the platform's
>> default page caching. Doing so improves the performance of I/O
>> on the framebuffer.
>>
>> Mgag200's hardware does not access framebuffer pages directly (i.e.,
>> via DMA), so enabling caching does not have an effect on consistency
>> of the framebuffer memory or the displayed data.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 913ec479bb5c ("drm/mgag200: Replace VRAM helpers with SHMEM hel=
pers")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Emil Velikov <emil.velikov@collabora.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Rong Chen <rong.a.chen@intel.com>
>> Cc: John Donnelly <john.p.donnelly@Oracle.com>
>> Link: https://lore.kernel.org/dri-devel/20200617092252.GA5279@shao2-de=
bian/
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/m=
gag200/mgag200_drv.c
>> index e19660f4a637..7189c7745baf 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -36,6 +36,7 @@ static struct drm_driver mgag200_driver =3D {
>>  	.major =3D DRIVER_MAJOR,
>>  	.minor =3D DRIVER_MINOR,
>>  	.patchlevel =3D DRIVER_PATCHLEVEL,
>> +	.gem_create_object =3D drm_gem_shmem_create_object_cached,
>>  	DRM_GEM_SHMEM_DRIVER_OPS,
>>  };
>> =20
>> --=20
>> 2.27.0
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--r6KDF286KeeQcAQx319IqjmgqKp3hOud0--

--5GBMt4anNZub42ozroysUYfoXgctCiksn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7wykMACgkQaA3BHVML
eiPbZQgAoZsWiIfNhgN73XrUh47n5G2gfnPaovEPnSTEax7+CqHf3rjK/b1zleqF
q9QzSb5tiOUphopGxO7Cbt6lBg69jSf8qWNHkmWbnHb06p8ENnWns/tsOXDIjzCh
0LU7jGyP1y+J5MVFtLSSp05Y112BEfJIs/VZGOwJcVUjKmn03V/nikvegc1oPUXH
Q4NMWPp/wAcKhka6RHbXXvKnI7MM7v3C15ln8XwcFmezXjkcH21KoE5SXAPUFai2
eKDa09Ews1+gM6j0sKKEmiHhmGQLTGA/fWqn8qG6PCejRa8z2xnXG78ia8eMvezM
0gxaQTeXUwrZh00hWrLDxdKUIp6RZQ==
=ffFO
-----END PGP SIGNATURE-----

--5GBMt4anNZub42ozroysUYfoXgctCiksn--

--===============1909525160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1909525160==--
