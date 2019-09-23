Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A241DBAE2D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A476E10B;
	Mon, 23 Sep 2019 06:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37446E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:57:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E41CAFDB;
 Mon, 23 Sep 2019 06:57:57 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm: Fix duplicate const warning in
 drm_gem_ttm_helper.c
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <20190920193558.89815-1-sean@poorly.run>
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
Message-ID: <02fda717-5e7b-292d-f5a1-fd85d9f6ffbc@suse.de>
Date: Mon, 23 Sep 2019 08:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920193558.89815-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0753455067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0753455067==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SD7XTMlBMkSWjprbP8GbYYn2oBXCemYAP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SD7XTMlBMkSWjprbP8GbYYn2oBXCemYAP
Content-Type: multipart/mixed; boundary="6XnHIHHsqt2Qfzo8pOsUBWgdGw5yc6i5W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul
 <seanpaul@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <02fda717-5e7b-292d-f5a1-fd85d9f6ffbc@suse.de>
Subject: Re: [PATCH 1/2] drm: Fix duplicate const warning in
 drm_gem_ttm_helper.c
References: <20190920193558.89815-1-sean@poorly.run>
In-Reply-To: <20190920193558.89815-1-sean@poorly.run>

--6XnHIHHsqt2Qfzo8pOsUBWgdGw5yc6i5W
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.09.19 um 21:35 schrieb Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> For the warning
> ../drivers/gpu/drm/drm_gem_ttm_helper.c:26:20: warning: duplicate =E2=80=
=98const=E2=80=99 declaration specifier [-Wduplicate-decl-specifier]
>=20
> Reading between the lines, I think the double const is to preserve both=

> the values and the pointers in the array (which makes total sense). Thi=
s

Yes it is. Thanks for fixing.

Reviewed-By: Thomas Zimmermann <tzimmermann@suse.de>

> patch moves the second const to achieve this (and fix the warning).
>=20
> Fixes: ff540b76f14a ("drm/ttm: add drm gem ttm helpers, starting with d=
rm_gem_ttm_print_info()")
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_gem_ttm_helper.c | 2 +-
>  drivers/gpu/drm/drm_print.c          | 2 +-
>  include/drm/drm_print.h              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> index 9a4bafcf20df..ae7ba0052959 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -23,7 +23,7 @@
>  void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent=
,
>  			    const struct drm_gem_object *gem)
>  {
> -	static const char const *plname[] =3D {
> +	static const char * const plname[] =3D {
>  		[ TTM_PL_SYSTEM ] =3D "system",
>  		[ TTM_PL_TT     ] =3D "tt",
>  		[ TTM_PL_VRAM   ] =3D "vram",
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index dfa27367ebb8..20c49c85b7a2 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -198,7 +198,7 @@ EXPORT_SYMBOL(drm_printf);
>   * @to: end of bit range to print (exclusive).
>   */
>  void drm_print_bits(struct drm_printer *p,
> -		    unsigned long value, const char *bits[],
> +		    unsigned long value, const char * const bits[],
>  		    unsigned int from, unsigned int to)
>  {
>  	bool first =3D true;
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 12d4916254b4..1e6a4ee8a6b2 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -90,7 +90,7 @@ void drm_printf(struct drm_printer *p, const char *f,=
 ...);
>  void drm_puts(struct drm_printer *p, const char *str);
>  void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32=
 *regset);
>  void drm_print_bits(struct drm_printer *p,
> -		    unsigned long value, const char *bits[],
> +		    unsigned long value, const char * const bits[],
>  		    unsigned int from, unsigned int to);
> =20
>  __printf(2, 0)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--6XnHIHHsqt2Qfzo8pOsUBWgdGw5yc6i5W--

--SD7XTMlBMkSWjprbP8GbYYn2oBXCemYAP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2IbPMACgkQaA3BHVML
eiNl8wf7BCQyRk/47EUqFhBXTBJKnYSXS0H2w4yHAl8fjyzEzbUDY2WsoJ4FFOav
fzHCIau3OiM6E+ZS0cO3ga4IdvTF07iOvkG+g7MoBG64GpwhNkwzLlR6Z+iulJ25
wTDI2Du0C7BRAfk3081VBO7bTE1BDEkq3LFmIrMGKBaR3lK8DLZZEDPWjtpqHCVh
cYsDMrKaIoYwDVerEmfFdWGt1nwLuEG8sMQJl57ikzvavas3KWW8q52OVcac2aHy
5koahwlDzjQDGQ0jtDXRtEjen/cT8xYrbPRoc1kxddniwQCTbjoob+bpf74x7o2w
1zIpI5PeKkVk1KbQJMN2dmNTjyGtTg==
=2J0b
-----END PGP SIGNATURE-----

--SD7XTMlBMkSWjprbP8GbYYn2oBXCemYAP--

--===============0753455067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0753455067==--
