Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588B7112F07
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D910F6E91D;
	Wed,  4 Dec 2019 15:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB56E91D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:54:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89FA6B06A;
 Wed,  4 Dec 2019 15:54:34 +0000 (UTC)
Subject: Re: [PATCH 3/7] drm/udl: Vmap framebuffer after all tests succeeded
 in damage handling
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191204132430.16874-1-tzimmermann@suse.de>
 <20191204132430.16874-4-tzimmermann@suse.de>
 <20191204142544.GA20926@ravnborg.org>
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
Message-ID: <8fe45822-c34a-e18c-4f01-77ea710ab8e1@suse.de>
Date: Wed, 4 Dec 2019 16:54:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191204142544.GA20926@ravnborg.org>
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
Cc: airlied@redhat.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0428419101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0428419101==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6TEL3EZ5dILgVdkFb9mmNyTXMVhDGQeaq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6TEL3EZ5dILgVdkFb9mmNyTXMVhDGQeaq
Content-Type: multipart/mixed; boundary="2GPMINAdsBrsFDuDq5a8TbIvIScwncUMV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 emil.velikov@collabora.com
Message-ID: <8fe45822-c34a-e18c-4f01-77ea710ab8e1@suse.de>
Subject: Re: [PATCH 3/7] drm/udl: Vmap framebuffer after all tests succeeded
 in damage handling
References: <20191204132430.16874-1-tzimmermann@suse.de>
 <20191204132430.16874-4-tzimmermann@suse.de>
 <20191204142544.GA20926@ravnborg.org>
In-Reply-To: <20191204142544.GA20926@ravnborg.org>

--2GPMINAdsBrsFDuDq5a8TbIvIScwncUMV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 04.12.19 um 15:25 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> I did a casual browse of the patches.
> Looks like some nice cleanup.
>=20
> On Wed, Dec 04, 2019 at 02:24:26PM +0100, Thomas Zimmermann wrote:
>> We now do the fast tests before the potentially expensive vmap operati=
on.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/udl/udl_fb.c       | 19 +++++++------------
>>  drivers/gpu/drm/udl/udl_transfer.c |  1 -
>>  2 files changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb=
=2Ec
>> index ed6d9476b25b..dd7ba7f63214 100644
>> --- a/drivers/gpu/drm/udl/udl_fb.c
>> +++ b/drivers/gpu/drm/udl/udl_fb.c
>> @@ -85,12 +85,6 @@ int udl_handle_damage(struct drm_framebuffer *fb, i=
nt x, int y,
>>  	}
>>  	spin_unlock(&udl->active_fb_16_lock);
>> =20
>> -	vaddr =3D drm_gem_shmem_vmap(fb->obj[0]);
>> -	if (IS_ERR(vaddr)) {
>> -		DRM_ERROR("failed to vmap fb\n");
>> -		return 0;
>> -	}
>> -
>>  	aligned_x =3D DL_ALIGN_DOWN(x, sizeof(unsigned long));
>>  	width =3D DL_ALIGN_UP(width + (x-aligned_x), sizeof(unsigned long));=

>>  	x =3D aligned_x;
>> @@ -98,8 +92,13 @@ int udl_handle_damage(struct drm_framebuffer *fb, i=
nt x, int y,
>>  	if ((width <=3D 0) ||
>>  	    (x + width > fb->width) ||
>>  	    (y + height > fb->height)) {
>> -		ret =3D -EINVAL;
>> -		goto err_drm_gem_shmem_vunmap;
>> +		return -EINVAL;
>> +	}
>> +
>> +	vaddr =3D drm_gem_shmem_vmap(fb->obj[0]);
>> +	if (IS_ERR(vaddr)) {
>> +		DRM_ERROR("failed to vmap fb\n");
>> +		return 0;
>>  	}
>> =20
>>  	urb =3D udl_get_urb(dev);
>> @@ -131,10 +130,6 @@ int udl_handle_damage(struct drm_framebuffer *fb,=
 int x, int y,
>>  	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
>> =20
>>  	return 0;
>> -
>> -err_drm_gem_shmem_vunmap:
>> -	drm_gem_shmem_vunmap(fb->obj[0], vaddr);
>> -	return ret;
> This label is reintroduced two patches later.
> Is this on purpose it is gone and reintroduced?

This label is for rollback during error handling. The label in [6/7] is
called out_drm_gem_shmem_vunmap and it's part of the regular flow.

Admittedly, it's a bit unfortunate. OTOH the alternative is to add
dma-buf calls before moving around the vmap call. That seems like the
worse option.

Best regards
Thomas

>=20
> 	Sam
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


--2GPMINAdsBrsFDuDq5a8TbIvIScwncUMV--

--6TEL3EZ5dILgVdkFb9mmNyTXMVhDGQeaq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3n1rYACgkQaA3BHVML
eiPgdQgAmwonE3RR6p/qfc9Y7WT8MtDwn6+6YZ/77oSWUSqvtILKSfeOz7pVRZ0+
OZvF5SZlPNi5t621TV5n1o+f7iB6eseq9MFcUgACkvKj83tzxcWPXuW6kmT8WgOo
ubzGM6kLoUeoGW0egV0aOG56EUYJmBHFUQGCNTfZ8HEsrkAxZr6c9Q2qWIdXc1bb
jYa6ZlQLcXkh8u41z5cXWozffQ495Rcz/eWYt0LsCs1qpYTiNy407I9x8J4TRD9q
gH+ePU4oNYmzz8lck6UcHxyKmuU8VlsNOsZBGjV1WFhhdAhTHquTzmfvdnyem4ax
Culpe5Ds9ZmOwC3LvV12jpzyGJSlQg==
=OMNi
-----END PGP SIGNATURE-----

--6TEL3EZ5dILgVdkFb9mmNyTXMVhDGQeaq--

--===============0428419101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0428419101==--
