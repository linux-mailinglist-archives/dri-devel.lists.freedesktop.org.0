Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE45849B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D3D6E4E1;
	Thu, 27 Jun 2019 14:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7676E4E1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:37:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D104CAF31;
 Thu, 27 Jun 2019 14:37:27 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] gem/vram: pin to vram in vmap
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190627122348.5833-1-kraxel@redhat.com>
 <20190627122348.5833-2-kraxel@redhat.com>
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
Message-ID: <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
Date: Thu, 27 Jun 2019 16:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627122348.5833-2-kraxel@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0829657603=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0829657603==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FgEBem4jKFe78ayhhpxGcdcl9SQIEMWeE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FgEBem4jKFe78ayhhpxGcdcl9SQIEMWeE
Content-Type: multipart/mixed; boundary="r18lT2MUcokctyjlOfA4f4xehRVx11tdy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Message-ID: <8a52b578-b255-3e11-3a0c-0b68f0cb649e@suse.de>
Subject: Re: [PATCH v3 1/5] gem/vram: pin to vram in vmap
References: <20190627122348.5833-1-kraxel@redhat.com>
 <20190627122348.5833-2-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-2-kraxel@redhat.com>

--r18lT2MUcokctyjlOfA4f4xehRVx11tdy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.06.19 um 14:23 schrieb Gerd Hoffmann:
> drm clients like the generic framebuffer emulation keep a permanent
> vmap active, which in turn has a permanent pin.  This pin needs to
> be in vram, otherwise we can't display the framebuffer.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 4de782ca26b2..c724876c6f2a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -592,7 +592,7 @@ void *drm_gem_vram_driver_gem_prime_vmap(struct drm=
_gem_object *gem)
>  	int ret;
>  	void *base;
> =20
> -	ret =3D drm_gem_vram_pin(gbo, 0);
> +	ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);

I have a patch set that converts ast and mgag200 to generic framebuffer
emulation with a shadow FB. The actual BO is mapped by the fbdev code on
demand to update its content. Permanently mapping the fb console's BO
would consume too much display memory. This requires the pin function's
placement flag to be 0, so the BO is mapped in system memory by default.
The proposed patch breaks this.

Some ideas for solving this:

 1) Introduce a default_placement field in struct drm_gem_vram_helper
where this flag can be configured. I'd favor this option.

 2) Introduce a separate callback function for pinning to vram. The
driver would have to set the correct function pointers.

 3) Pin the fb console buffer manually from within the bochs driver.

Best regards
Thomas

>  	if (ret)
>  		return NULL;
>  	base =3D drm_gem_vram_kmap(gbo, true, NULL);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--r18lT2MUcokctyjlOfA4f4xehRVx11tdy--

--FgEBem4jKFe78ayhhpxGcdcl9SQIEMWeE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0U1KYACgkQaA3BHVML
eiNZ/Af9GJVlB6AmshA0bhFsXcLcJtL2JFVBIrT7KVI2N+SzdNurOHEjgebgrtJW
a/QtPZNj/LuCy47s7CgCPPkd8zLuT05B2gwCGGvoUUs6TOQluBvk0LVj5LQjtju9
zfZMP2JadLLFRtIcZxrRBJhdY6V22mz9F9TyUzrRjjSx58ANWWnd3oEmJoFZObaG
qqmxtNCnzkYWZSkDhGyXIIHRKMmUOyaoGbibKX2JIAs45shwplnPDiNtrOQQf86R
Z3jzEWgqlvQIWO0GqWvcSmH/Dn7Ehrci0nSPAJ/8+ubT0rkJui1mXwoLO83C099i
V9pNLzX4xn/6M3kzmiqNqzrD1edpAg==
=XfiM
-----END PGP SIGNATURE-----

--FgEBem4jKFe78ayhhpxGcdcl9SQIEMWeE--

--===============0829657603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0829657603==--
