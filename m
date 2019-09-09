Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85465AD956
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 14:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBA6898CA;
	Mon,  9 Sep 2019 12:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94DC898CA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 12:46:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 467D0AFA5;
 Mon,  9 Sep 2019 12:46:58 +0000 (UTC)
Subject: Re: [PATCH v3 1/7] drm: add drm_print_bits
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-2-kraxel@redhat.com>
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
Message-ID: <66258358-b27e-4eb1-44a4-c90aa342293c@suse.de>
Date: Mon, 9 Sep 2019 14:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904054740.20817-2-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1192422077=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1192422077==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2skgr6sFYrh1Z5EQHu05feTjEDtqucFhH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2skgr6sFYrh1Z5EQHu05feTjEDtqucFhH
Content-Type: multipart/mixed; boundary="cvmaHfE2YJqR393NckYCCAwLsnpy2D3uw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Message-ID: <66258358-b27e-4eb1-44a4-c90aa342293c@suse.de>
Subject: Re: [PATCH v3 1/7] drm: add drm_print_bits
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-2-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-2-kraxel@redhat.com>

--cvmaHfE2YJqR393NckYCCAwLsnpy2D3uw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.09.19 um 07:47 schrieb Gerd Hoffmann:
> New helper to print named bits of some value (think flags fields).
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_print.h     |  3 +++
>  drivers/gpu/drm/drm_print.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 112165d3195d..12d4916254b4 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -89,6 +89,9 @@ __printf(2, 3)
>  void drm_printf(struct drm_printer *p, const char *f, ...);
>  void drm_puts(struct drm_printer *p, const char *str);
>  void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32=
 *regset);
> +void drm_print_bits(struct drm_printer *p,
> +		    unsigned long value, const char *bits[],
> +		    unsigned int from, unsigned int to);
> =20
>  __printf(2, 0)
>  /**
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index ad302d71eeee..dfa27367ebb8 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -185,6 +185,39 @@ void drm_printf(struct drm_printer *p, const char =
*f, ...)
>  }
>  EXPORT_SYMBOL(drm_printf);
> =20
> +/**
> + * drm_print_bits - print bits to a &drm_printer stream
> + *
> + * Print bits (in flag fields for example) in human readable form.
> + * The first name in the @bits array is for the bit indexed by @from.
> + *
> + * @p: the &drm_printer
> + * @value: field value.
> + * @bits: Array with bit names.
> + * @from: start of bit range to print (inclusive).
> + * @to: end of bit range to print (exclusive).
> + */
> +void drm_print_bits(struct drm_printer *p,
> +		    unsigned long value, const char *bits[],
> +		    unsigned int from, unsigned int to)
> +{
> +	bool first =3D true;
> +	unsigned int i;
> +
> +	for (i =3D from; i < to; i++) {
> +		if (!(value & (1 << i)))
> +			continue;
> +		if (WARN_ON_ONCE(!bits[i-from]))
> +			continue;
> +		drm_printf(p, "%s%s", first ? "" : ",",
> +			   bits[i-from]);
> +		first =3D false;
> +	}
> +	if (first)
> +		drm_printf(p, "(none)");
> +}
> +EXPORT_SYMBOL(drm_print_bits);
> +
>  void drm_dev_printk(const struct device *dev, const char *level,
>  		    const char *format, ...)
>  {
>=20

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--cvmaHfE2YJqR393NckYCCAwLsnpy2D3uw--

--2skgr6sFYrh1Z5EQHu05feTjEDtqucFhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl12SbcACgkQaA3BHVML
eiOgMQf+OLBhvRiFKKfSph9H1t6UnHvMrW1HxM+GGcoPTfz8kjSr+9E1QE1vdLGs
XaU+2xBkVL38+Jo8CzwtFqAqiqhzc1nV1JECpzLcmnFSEjRKvBTZWz0Fv4OWhfCl
FFXwTqgkVAU2aZXzJWdIgQRsdMc3R352tvt+m+tkNQElmGUoTMQYcOKG6sR8sEru
w4veeSUGSowctfDrX2CsyFL635utCLwBcSg/PMXt2q4dbF00hP5h6M3f10SWUViM
OtsUksUXdjOGKLwyCoP2Wtgojl6VPTPlQTV273WOjlBy8htLPpeFa6tW9Srbj7Bm
qFeTeVXG6UptWfQBbVFzVIV4EPq7Bw==
=tGTV
-----END PGP SIGNATURE-----

--2skgr6sFYrh1Z5EQHu05feTjEDtqucFhH--

--===============1192422077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1192422077==--
