Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA1F2AD6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2586E02C;
	Thu,  7 Nov 2019 09:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BB86E02C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:37:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE8B3AC9D;
 Thu,  7 Nov 2019 09:37:49 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] drm/udl: Remove struct udl_gem_object and functions
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
References: <20191106104722.19700-1-tzimmermann@suse.de>
 <20191106104722.19700-5-tzimmermann@suse.de>
 <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>
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
Message-ID: <ceaa2d95-11c9-a22e-0816-b9d95578bad0@suse.de>
Date: Thu, 7 Nov 2019 10:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0769887514=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0769887514==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OYT2joHFae1mkbIzaWIxE0tcFfcChOtyU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OYT2joHFae1mkbIzaWIxE0tcFfcChOtyU
Content-Type: multipart/mixed; boundary="pjbzoN3EoTqIhm3hhTjHfxFH1nk5VyL0t";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ceaa2d95-11c9-a22e-0816-b9d95578bad0@suse.de>
Subject: Re: [PATCH v2 4/4] drm/udl: Remove struct udl_gem_object and
 functions
References: <20191106104722.19700-1-tzimmermann@suse.de>
 <20191106104722.19700-5-tzimmermann@suse.de>
 <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>
In-Reply-To: <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>

--pjbzoN3EoTqIhm3hhTjHfxFH1nk5VyL0t
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noralf

Am 06.11.19 um 12:48 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 06.11.2019 11.47, skrev Thomas Zimmermann:
>> Simply removes all the obsolete GEM code from udl. No functional
>> changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/udl/Makefile     |   2 +-
>>  drivers/gpu/drm/udl/udl_dmabuf.c | 254 ------------------------------=
-
>>  drivers/gpu/drm/udl/udl_drv.h    |  29 ----
>>  drivers/gpu/drm/udl/udl_gem.c    | 206 -------------------------
>>  4 files changed, 1 insertion(+), 490 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/udl/udl_dmabuf.c
>>
>=20
> <snip>
>=20
>> -int udl_gem_vmap(struct udl_gem_object *obj)
>> -{
>> -	int page_count =3D obj->base.size / PAGE_SIZE;
>> -	int ret;
>> -
>> -	if (obj->base.import_attach) {
>> -		obj->vmapping =3D dma_buf_vmap(obj->base.import_attach->dmabuf);
>> -		if (!obj->vmapping)
>> -			return -ENOMEM;
>> -		return 0;
>> -	}
>> -
>> -	ret =3D udl_gem_get_pages(obj);
>> -	if (ret)
>> -		return ret;
>> -
>> -	obj->vmapping =3D vmap(obj->pages, page_count, 0, PAGE_KERNEL);
>=20
> This differs from the shmem helper vmap:
>=20
> 	shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> 			    VM_MAP, pgprot_writecombine(PAGE_KERNEL));
>=20
> Boris added the WC in be7d9f05c53e:
>=20
>  drm/gem_shmem: Use a writecombine mapping for ->vaddr
>=20
>  Right now, the BO is mapped as a cached region when ->vmap() is called=

>  and the underlying object is not a dmabuf.
>  Doing that makes cache management a bit more complicated (you'd need
>  to call dma_map/unmap_sg() on the ->sgt field everytime the BO is abou=
t
>  to be passed to the GPU/CPU), so let's map the BO with writecombine
>  attributes instead (as done in most drivers).
>=20
> I don't know what the implications of this are, just pointing out a
> difference.

After some testing, I added an udl vmap function that enables caching on
the pages. I think I see a performance improvement for full-screen update=
s.

Best regards
Thomas

>=20
> Noralf.
>=20
>> -	if (!obj->vmapping)
>> -		return -ENOMEM;
>> -	return 0;
>> -}
>=20
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


--pjbzoN3EoTqIhm3hhTjHfxFH1nk5VyL0t--

--OYT2joHFae1mkbIzaWIxE0tcFfcChOtyU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3D5ekACgkQaA3BHVML
eiME5QgAo5xtlxJRY6P9JsniezxljR6ZCatLVkgLiSzALlz9PUZ1fOHxH+zS8Z7z
C6Ktepeg5J55ofAIvjej7RatF55LRigAQM2mZTlTbQgM2VHc1EVMmg1fJ9owZlxP
OprABr0yVUyzxD8Ud7CVyj86ofsCw6QSrPVMwgBNJkZrR7feVk7ykTnWNsvcGhRU
g8X4+1gJJ7WwYDnDSlAB2P5dnj7qtfxtCd5xnvn/FsLixp0b4+nCcUfEl1EVWt0Y
ZKwGH9qF4TPrHNKrf8OnKzEkbCzzb5DTzRday1/CAiz5WJ4dWA6sGDP/dpBdmEEk
CyBKSFipE+njhdXZ5uFZV4IyOhy8og==
=Seq1
-----END PGP SIGNATURE-----

--OYT2joHFae1mkbIzaWIxE0tcFfcChOtyU--

--===============0769887514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0769887514==--
