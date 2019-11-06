Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A222F1610
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA9F6ED11;
	Wed,  6 Nov 2019 12:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82C6ED11
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:30:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62316B4FA;
 Wed,  6 Nov 2019 12:30:34 +0000 (UTC)
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
Message-ID: <fdf618fb-0d17-6b44-9228-7e2a49055990@suse.de>
Date: Wed, 6 Nov 2019 13:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
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
Content-Type: multipart/mixed; boundary="===============1991057519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1991057519==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pQnZKY5vqHj23lJHb2VcaJSS5dY5QKRrY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pQnZKY5vqHj23lJHb2VcaJSS5dY5QKRrY
Content-Type: multipart/mixed; boundary="b5RlZr8R5bckYhCajfplJsXSsdA363jmb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fdf618fb-0d17-6b44-9228-7e2a49055990@suse.de>
Subject: Re: [PATCH v2 4/4] drm/udl: Remove struct udl_gem_object and
 functions
References: <20191106104722.19700-1-tzimmermann@suse.de>
 <20191106104722.19700-5-tzimmermann@suse.de>
 <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>
In-Reply-To: <e5d62b16-3984-45bb-eb86-92023b437a95@tronnes.org>

--b5RlZr8R5bckYhCajfplJsXSsdA363jmb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

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

Thanks! Switching to SHMEM disables caching on these pages. The logic
around dma_map/unmap_sg() is the same in udl and generic prime functions
from what I can tell.

Actually, I've never seen any difference in display performance when
modifying these settings. (DisplayLink is always slow.) I'd like to
throw away the caching optimization and rather tell userspace to
allocate a shadow buffer if necessary.

Best regards
Thomas

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


--b5RlZr8R5bckYhCajfplJsXSsdA363jmb--

--pQnZKY5vqHj23lJHb2VcaJSS5dY5QKRrY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3CvOkACgkQaA3BHVML
eiMQOAgAhzMMzCl3hzNo/HGcCEKbl1mpfJHBB9HNOips380GuodQ/Vzn7pq8dZ/p
/jQJxlqnNzhNAXdBgFuGwkz8ZHTtFrdJJeQvjaX5cYJo5G7x90ntl52N+V6z+QHj
2aUlCl6LHc5kL/pReNxOmdtSQ2WsZo4xkR79fNb5dZQjBvT/v4NsAZo7UmnS3Xo0
e1S1xcwZLTqBdDoNGWw5T+nY8QdO9R4rMcKvUqf8vHPWmBh5p3L3iXaAeIFjv4I6
hJRtROZbaEE7MwnABFsomFW4p+zl6dimIw11oPqP0NXlsRrFXc+q335o56Rz7iK/
ca3zmk0/l1fszsTXAZU7pG2MjvtyCw==
=lzng
-----END PGP SIGNATURE-----

--pQnZKY5vqHj23lJHb2VcaJSS5dY5QKRrY--

--===============1991057519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1991057519==--
