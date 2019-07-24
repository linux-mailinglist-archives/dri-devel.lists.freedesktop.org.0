Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C67291D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 09:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E36E487;
	Wed, 24 Jul 2019 07:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168B6E487
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 07:40:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94042AF35;
 Wed, 24 Jul 2019 07:40:30 +0000 (UTC)
Subject: Re: [PATCH -next] drm/mga: remove set but not used variable 'buf_priv'
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
References: <20190724014619.32665-1-yuehaibing@huawei.com>
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
Message-ID: <14af485d-a73f-d6bc-a93b-8d44bb64112a@suse.de>
Date: Wed, 24 Jul 2019 09:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724014619.32665-1-yuehaibing@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0573723141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0573723141==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w08pszPqwMWrvXc6cnxtdPDspNYAOpysW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW
Content-Type: multipart/mixed; boundary="keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>
Message-ID: <14af485d-a73f-d6bc-a93b-8d44bb64112a@suse.de>
Subject: Re: [PATCH -next] drm/mga: remove set but not used variable
 'buf_priv'
References: <20190724014619.32665-1-yuehaibing@huawei.com>
In-Reply-To: <20190724014619.32665-1-yuehaibing@huawei.com>

--keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 24.07.19 um 03:46 schrieb YueHaibing:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/mga/mga_state.c: In function 'mga_dma_iload':
> drivers/gpu/drm/mga/mga_state.c:945:22: warning:
>  variable 'buf_priv' set but not used [-Wunused-but-set-variable]
>=20
> It is never used, so can be removed.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/mga/mga_state.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_=
state.c
> index 77a0b006f066..0dec4062e5a2 100644
> --- a/drivers/gpu/drm/mga/mga_state.c
> +++ b/drivers/gpu/drm/mga/mga_state.c
> @@ -942,7 +942,6 @@ static int mga_dma_iload(struct drm_device *dev, vo=
id *data, struct drm_file *fi
>  	struct drm_device_dma *dma =3D dev->dma;
>  	drm_mga_private_t *dev_priv =3D dev->dev_private;
>  	struct drm_buf *buf;
> -	drm_mga_buf_priv_t *buf_priv;
>  	drm_mga_iload_t *iload =3D data;
>  	DRM_DEBUG("\n");
> =20
> @@ -959,7 +958,6 @@ static int mga_dma_iload(struct drm_device *dev, vo=
id *data, struct drm_file *fi
>  		return -EINVAL;
> =20
>  	buf =3D dma->buflist[iload->idx];
> -	buf_priv =3D buf->dev_private;
> =20
>  	if (mga_verify_iload(dev_priv, iload->dstorg, iload->length)) {
>  		mga_freelist_put(dev, buf);
>=20

Thanks!

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp--

--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04C20ACgkQaA3BHVML
eiOUewf/Qnu3ijQ7oRow2rPhHQLuyjtcMtyhMV6IHBrlSJ4caVNeUT7WchUEEpgH
dfrV7e4ozjQoUoRRjIkgmtyF9VIgTaC7f8DUXPaHbdKdFto4eqxHkzq9Qvlahj/L
yLvA3vqNO2Xqqg4ImipzD5+NdyLb6+XUg3qlqR0Io5qq9/1jgwC1+thVchD3KHT6
qbFeEF7cwV5+EkZr8Mu8dnu0zNn5pR844LBkTgIEnTHO5IcwDJcxUNabQTvu3hXx
/WW49SYOwBW+ImQofxlQaegzuoxoF0mfZlaB13tszTP7LQzp4W4zdA2UeZG0zw3r
sVW38ZbC5iyfbj1ZO/72ezcBH+7w4Q==
=bbRi
-----END PGP SIGNATURE-----

--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW--

--===============0573723141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0573723141==--
