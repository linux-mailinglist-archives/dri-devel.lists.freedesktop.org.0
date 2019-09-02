Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B115BA5974
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEB089AAD;
	Mon,  2 Sep 2019 14:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DDD89AAD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F1ECACC1;
 Mon,  2 Sep 2019 14:34:22 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/vram: add vram-mm debugfs file
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-4-kraxel@redhat.com>
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
Message-ID: <2110d38c-1793-a5c9-921c-94ccfe2205cb@suse.de>
Date: Mon, 2 Sep 2019 16:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902124126.7700-4-kraxel@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0495931710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0495931710==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ty7EolgmgMi7PUCVX4JOqvFLPWILMuQsR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ty7EolgmgMi7PUCVX4JOqvFLPWILMuQsR
Content-Type: multipart/mixed; boundary="AiPHD99NNUU2MnskSqaW30ED4b2qI6h7C";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Message-ID: <2110d38c-1793-a5c9-921c-94ccfe2205cb@suse.de>
Subject: Re: [PATCH 3/5] drm/vram: add vram-mm debugfs file
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-4-kraxel@redhat.com>
In-Reply-To: <20190902124126.7700-4-kraxel@redhat.com>

--AiPHD99NNUU2MnskSqaW30ED4b2qI6h7C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.09.19 um 14:41 schrieb Gerd Hoffmann:
> Wire up drm_mm_print() for vram helpers, using a new
> debugfs file, so one can see how vram is used:
>=20
>    # cat /sys/kernel/debug/dri/0/vram-mm
>    0x0000000000000000-0x0000000000000300: 768: used
>    0x0000000000000300-0x0000000000000600: 768: used
>    0x0000000000000600-0x0000000000000900: 768: used
>    0x0000000000000900-0x0000000000000c00: 768: used
>    0x0000000000000c00-0x0000000000004000: 13312: free
>    total: 16384, used 3072 free 13312
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_vram_helper.h    |  1 +
>  include/drm/drm_vram_mm_helper.h     |  1 +
>  drivers/gpu/drm/drm_vram_mm_helper.c | 33 ++++++++++++++++++++++++++++=

>  3 files changed, 35 insertions(+)
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 17f160dd6e7d..d48fdf90b254 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -123,6 +123,7 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm=
_file *file,
>   * &struct drm_driver with default functions.
>   */
>  #define DRM_GEM_VRAM_DRIVER \
> +	.debugfs_init             =3D drm_vram_mm_debugfs_init, \

This line seems to be the reason for putting the include statement into
the header in patch [2/5]. I suggest to merge both patches into one.

>  	.dumb_create		  =3D drm_gem_vram_driver_dumb_create, \
>  	.dumb_map_offset	  =3D drm_gem_vram_driver_dumb_mmap_offset, \
>  	.gem_prime_mmap		  =3D drm_gem_prime_mmap
> diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm=
_helper.h
> index 2aacfb1ccfae..9e0ac9aaac7d 100644
> --- a/include/drm/drm_vram_mm_helper.h
> +++ b/include/drm/drm_vram_mm_helper.h
> @@ -60,6 +60,7 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev=
(
>  	return container_of(bdev, struct drm_vram_mm, bdev);
>  }
> =20
> +int drm_vram_mm_debugfs_init(struct drm_minor *minor);

I cannot find a caller of this function. Will this be called form
drm_debugfs_init()?

>  int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>  		     uint64_t vram_base, size_t vram_size,
>  		     const struct drm_vram_mm_funcs *funcs);
> diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/drm=
_vram_mm_helper.c
> index c911781d6728..486061b83a73 100644
> --- a/drivers/gpu/drm/drm_vram_mm_helper.c
> +++ b/drivers/gpu/drm/drm_vram_mm_helper.c
> @@ -1,7 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> =20
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_vram_mm_helper.h>
> =20
>  #include <drm/ttm/ttm_page_alloc.h>
> @@ -148,6 +150,37 @@ static struct ttm_bo_driver bo_driver =3D {
>   * struct drm_vram_mm
>   */
> =20
> +#if defined(CONFIG_DEBUG_FS)
> +static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
> +	struct drm_vram_mm *vmm =3D node->minor->dev->vram_mm;
> +	struct drm_mm *mm =3D vmm->bdev.man[TTM_PL_VRAM].priv;
> +	struct ttm_bo_global *glob =3D vmm->bdev.glob;
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +	spin_lock(&glob->lru_lock);
> +	drm_mm_print(mm, &p);
> +	spin_unlock(&glob->lru_lock);
> +	return 0;
> +}
> +
> +static struct drm_info_list drm_vram_mm_debugfs_list[] =3D {

Can this be made 'static const'?

> +	{ "vram-mm", drm_vram_mm_debugfs, 0, NULL },
> +};
> +#endif
> +
> +int drm_vram_mm_debugfs_init(struct drm_minor *minor)

Documentation is missing.

With these points addressed

 Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +{
> +#if defined(CONFIG_DEBUG_FS)
> +	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> +				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
> +				 minor->debugfs_root, minor);
> +#endif
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
> +
>  /**
>   * drm_vram_mm_init() - Initialize an instance of VRAM MM.
>   * @vmm:	the VRAM MM instance to initialize
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--AiPHD99NNUU2MnskSqaW30ED4b2qI6h7C--

--ty7EolgmgMi7PUCVX4JOqvFLPWILMuQsR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1tKGkACgkQaA3BHVML
eiPIsQgAj7EohnBSGerBpXBjHVE+wsZwtarkOw3mOSnGN40Wto80tttDXnztpEAI
OZlEND78f/bcQYxBdgjUHvF3u7KKzgR8BVi2cLgv6cw+uu45cEq23RfgfBEvGXQ5
OpnQiVJriOobLZ5MxnCRA36AUhokswf08BkVoTn1EBxmm3jvIyAiq9ofhEK+8aK5
ZHieFMmmHWc5eGLTNDSifUZ+iMHrSXydakDX8r4ZRpd4ZxU7dadj1GBTdDqEgRJV
l3bp7+6rmi53qaREgYz6r0T9YO94POKfJsGNCktLe4m13ZDXEOA796YlndTygFm7
rTbrKY64UvsBDC7Zb/0YeNyTUm0eCQ==
=clvt
-----END PGP SIGNATURE-----

--ty7EolgmgMi7PUCVX4JOqvFLPWILMuQsR--

--===============0495931710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0495931710==--
