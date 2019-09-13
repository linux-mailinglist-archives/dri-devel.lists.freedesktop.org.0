Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B242B1E90
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ECB6F3A9;
	Fri, 13 Sep 2019 13:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32946F3A9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:11:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B61AAF77;
 Fri, 13 Sep 2019 13:11:28 +0000 (UTC)
Subject: Re: [PATCH 7/8] drm/vram: drop verify_access
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-8-kraxel@redhat.com>
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
Message-ID: <03fc182c-c9fd-d43f-66ac-7e0e3c3d34c5@suse.de>
Date: Fri, 13 Sep 2019 15:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913122908.784-8-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2055876791=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2055876791==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B4ubPbblfygnnrPXdd669gDn5RYdmiFuB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B4ubPbblfygnnrPXdd669gDn5RYdmiFuB
Content-Type: multipart/mixed; boundary="TAKKNywCAPAMOgux3zEvO2oPBgSoQ11vE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <03fc182c-c9fd-d43f-66ac-7e0e3c3d34c5@suse.de>
Subject: Re: [PATCH 7/8] drm/vram: drop verify_access
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-8-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-8-kraxel@redhat.com>

--TAKKNywCAPAMOgux3zEvO2oPBgSoQ11vE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.09.19 um 14:29 schrieb Gerd Hoffmann:
> Not needed any more.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index e100b97ea6e3..42ee80414273 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -469,13 +469,6 @@ static void drm_gem_vram_bo_driver_evict_flags(str=
uct drm_gem_vram_object *gbo,
>  	*pl =3D gbo->placement;
>  }
> =20
> -static int drm_gem_vram_bo_driver_verify_access(struct drm_gem_vram_ob=
ject *gbo,
> -						struct file *filp)
> -{
> -	return drm_vma_node_verify_access(&gbo->bo.base.vma_node,
> -					  filp->private_data);
> -}
> -
>  static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_obj=
ect *gbo,
>  					       bool evict,
>  					       struct ttm_mem_reg *new_mem)
> @@ -767,20 +760,6 @@ static void bo_driver_evict_flags(struct ttm_buffe=
r_object *bo,
>  	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
>  }
> =20
> -static int bo_driver_verify_access(struct ttm_buffer_object *bo,
> -				   struct file *filp)
> -{
> -	struct drm_gem_vram_object *gbo;
> -
> -	/* TTM may pass BOs that are not GEM VRAM BOs. */
> -	if (!drm_is_gem_vram(bo))
> -		return -EINVAL;
> -
> -	gbo =3D drm_gem_vram_of_bo(bo);
> -
> -	return drm_gem_vram_bo_driver_verify_access(gbo, filp);
> -}
> -
>  static void bo_driver_move_notify(struct ttm_buffer_object *bo,
>  				  bool evict,
>  				  struct ttm_mem_reg *new_mem)
> @@ -837,7 +816,6 @@ static struct ttm_bo_driver bo_driver =3D {
>  	.init_mem_type =3D bo_driver_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D bo_driver_evict_flags,
> -	.verify_access =3D bo_driver_verify_access,
>  	.move_notify =3D bo_driver_move_notify,
>  	.io_mem_reserve =3D bo_driver_io_mem_reserve,
>  	.io_mem_free =3D bo_driver_io_mem_free,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--TAKKNywCAPAMOgux3zEvO2oPBgSoQ11vE--

--B4ubPbblfygnnrPXdd669gDn5RYdmiFuB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl17lX8ACgkQaA3BHVML
eiMhmQf/aQRBU6TX24aYux0DF9HFWQPuS0iR0IGsNMyTwRDU74bgaxO8ioZgpItR
saRSvuXmIHT7iQxONAvEvFOj8ja1U2TkabxLb91YoYnz0TGMQ2j2qE7CufVSs0O+
bFmtaQL21LUFo/rTNNzpwlsqkkEPK4Uu8XaVT07PE20FzPWgCRJ7zm0hCXlg02ww
RIoCb02cUURq8t/41qICQ/O1orm1WPsKeOn2KIcZ8IW6wIlSGnd3E3utkqodWLtz
ZMKfoZ5zgsljXS4CbnmZZPhP6mbuLGZHE9OGwrJZRpTyLg1UBrh2hSROXxaLiC5e
N6YwncTh9AmhUpuQS2v5CPpqYxbGMQ==
=YT4g
-----END PGP SIGNATURE-----

--B4ubPbblfygnnrPXdd669gDn5RYdmiFuB--

--===============2055876791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2055876791==--
