Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F01CA3E0
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02756EA7B;
	Fri,  8 May 2020 06:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8BF6EA7B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:30:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 251E5AD48;
 Fri,  8 May 2020 06:30:09 +0000 (UTC)
Subject: Re: [PATCH 21/36] drm/mgag200: remove _unlocked suffix in
 drm_object_put_unlocked
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-22-emil.l.velikov@gmail.com>
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
Message-ID: <82ae45bc-f4f0-836e-2fd6-ceff3a664f37@suse.de>
Date: Fri, 8 May 2020 08:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507150822.114464-22-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1838973337=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1838973337==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="esEjuaxAjDF6kxRbmrgjyOSzOABznXfQE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--esEjuaxAjDF6kxRbmrgjyOSzOABznXfQE
Content-Type: multipart/mixed; boundary="S2mXI0cmQyVYkjYtZ17yZ6jboQM5v0CsY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>
Message-ID: <82ae45bc-f4f0-836e-2fd6-ceff3a664f37@suse.de>
Subject: Re: [PATCH 21/36] drm/mgag200: remove _unlocked suffix in
 drm_object_put_unlocked
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-22-emil.l.velikov@gmail.com>
In-Reply-To: <20200507150822.114464-22-emil.l.velikov@gmail.com>

--S2mXI0cmQyVYkjYtZ17yZ6jboQM5v0CsY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.05.20 um 17:08 schrieb Emil Velikov:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
>=20
> Just drop the suffix. It makes the API cleaner.
>=20
> Done via the following script:
>=20
> __from=3Ddrm_gem_object_put_unlocked
> __to=3Ddrm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
>=20
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm=
/mgag200/mgag200_cursor.c
> index d491edd317ff..1a50836e003e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -286,7 +286,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, =
struct drm_file *file_priv,
>  		ret =3D PTR_ERR(src);
>  		dev_err(&dev->pdev->dev,
>  			"failed to map user buffer updates\n");
> -		goto err_drm_gem_object_put_unlocked;
> +		goto err_drm_gem_object_put;
>  	}
> =20
>  	ret =3D mgag200_show_cursor(mdev, src, width, height);
> @@ -295,13 +295,13 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc=
, struct drm_file *file_priv,
> =20
>  	/* Now update internal buffer pointers */
>  	drm_gem_vram_vunmap(gbo, src);
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	return 0;
>  err_drm_gem_vram_vunmap:
>  	drm_gem_vram_vunmap(gbo, src);
> -err_drm_gem_object_put_unlocked:
> -	drm_gem_object_put_unlocked(obj);
> +err_drm_gem_object_put:
> +	drm_gem_object_put(obj);
>  	return ret;
>  }
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--S2mXI0cmQyVYkjYtZ17yZ6jboQM5v0CsY--

--esEjuaxAjDF6kxRbmrgjyOSzOABznXfQE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl60/G0ACgkQaA3BHVML
eiN9WggAvhuXPHsEJTk8seKlBd1UgjOjxSvoprWgbAR5M29w4Lc6QH1D46HTfhr2
+rsD9fk2yD6g8RB9FRNfRc+gJvwsBXhLJIn/zTBDUS+RVMiA/pQ06DUdG8u7RCnY
NWOF8NjzkeJf+w0bwE1A3k0TsL5jsTlKVynVx1D/YJC7DkTVHvmopQNgYcoxhXgb
pflMEkUxZJMdbOtDEziXSpHsleZLs9S8FfS34ssrWxRS78eoWi7OTeU5p/Yx/EOB
RIvakiwDCyK+f2yTXkPdcNNRjMNzaIdCoq2uJ2Ou/VOK350D2cFfSZ0i2ZJo6obH
evXq2+TT6VBUqlArzdPkdGoAmnEbhw==
=j5au
-----END PGP SIGNATURE-----

--esEjuaxAjDF6kxRbmrgjyOSzOABznXfQE--

--===============1838973337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1838973337==--
