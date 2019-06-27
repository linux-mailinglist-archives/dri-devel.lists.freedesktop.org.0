Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5B57D8A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB7D6E7FD;
	Thu, 27 Jun 2019 07:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21D6E7FD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 07:57:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84075AF46;
 Thu, 27 Jun 2019 07:57:57 +0000 (UTC)
Subject: Re: [PATCH][next] drm/mgag200: add in missing { } around if block
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20190614143911.21806-1-colin.king@canonical.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <23172c52-424f-747a-fa2d-117772759345@suse.de>
Date: Thu, 27 Jun 2019 09:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614143911.21806-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0966337771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0966337771==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o
Content-Type: multipart/mixed; boundary="Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <23172c52-424f-747a-fa2d-117772759345@suse.de>
Subject: Re: [PATCH][next] drm/mgag200: add in missing { } around if block
References: <20190614143911.21806-1-colin.king@canonical.com>
In-Reply-To: <20190614143911.21806-1-colin.king@canonical.com>

--Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

The code still used to work because mgag200 and userspace switch to a
software cursor if the HW cursor is not available. Thank you for fixing
this bug.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 14.06.19 um 16:39 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is an if block that is missing the { } curly brackets. Add
> these in.
>=20
> Addresses-Coverity: ("Structurally dead code")
> Fixes: 94dc57b10399 ("drm/mgag200: Rewrite cursor handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm=
/mgag200/mgag200_cursor.c
> index f0c61a92351c..117eaedec7aa 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -99,10 +99,11 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
> =20
>  	/* Pin and map up-coming buffer to write colour indices */
>  	ret =3D drm_gem_vram_pin(pixels_next, 0);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&dev->pdev->dev,
>  			"failed to pin cursor buffer: %d\n", ret);
>  		goto err_drm_gem_vram_kunmap_src;
> +	}
>  	dst =3D drm_gem_vram_kmap(pixels_next, true, NULL);
>  	if (IS_ERR(dst)) {
>  		ret =3D PTR_ERR(dst);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb--

--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0UdwMACgkQaA3BHVML
eiOSLwf/a25IYHnoB4UAQsiNGDE1rr7BxI7lFDeTm9EOR5//0qkYdxov8KisuA2Y
w111Trf+aFo2nurCKVfidDfrtTjLpz9/KOQDctmzQlFGGzXsHQf+bAA0Q1ZrJaJH
J9bJCVXUWCVh4LLaoaB7fA+XHscjXgzSpQxJ/pbRA9e1r18LFQEa+5KqQ/Bvvafn
vMubMLLNiBY1wz4nTU0GlnOgmLgcOK1GobBRZwkMVgE7CjSc46ZcKy2rLxjzTe7p
nrfE0g7eE2YfKhy9npTllokI/mOb4ydJt6Wr3WLhvaxfOMxDrwYOhdT3CS1jjkuu
NxuypRhJOl0GVMv1Y5DOvXroedOexA==
=wTRU
-----END PGP SIGNATURE-----

--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o--

--===============0966337771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0966337771==--
