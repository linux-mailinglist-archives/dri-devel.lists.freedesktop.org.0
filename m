Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42061E8BE
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565DA894E0;
	Wed, 15 May 2019 07:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F428894D7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:05:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BCF9AE52;
 Wed, 15 May 2019 07:05:57 +0000 (UTC)
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
 noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
References: <20190508082630.15116-1-tzimmermann@suse.de>
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
Message-ID: <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
Date: Wed, 15 May 2019 09:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508082630.15116-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============1277283025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1277283025==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KJTTDM2tRLl5hDaHbT7BFpqPcNGxPjHZh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KJTTDM2tRLl5hDaHbT7BFpqPcNGxPjHZh
Content-Type: multipart/mixed; boundary="hPxYpMJ0U06bKQ6OnglNUguNq7CEZCcEa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
 noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
References: <20190508082630.15116-1-tzimmermann@suse.de>
In-Reply-To: <20190508082630.15116-1-tzimmermann@suse.de>

--hPxYpMJ0U06bKQ6OnglNUguNq7CEZCcEa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

most of this patch set still needs reviews.

If it's too large for merging or reviewing at once, I could move the
driver changes into separate patch sets. The vbox driver's changes have
been accepted by Hans already. So only keeping the core changes plus
vbox would be an option.

Best regards
Thomas

Am 08.05.19 um 10:26 schrieb Thomas Zimmermann:
> Several simple framebuffer drivers copy most of the TTM code from each
> other. The implementation is always the same; except for the name of
> some data structures.
>=20
> As recently discussed, this patch set provides generic memory-managemen=
t
> code for simple framebuffers with dedicated video memory. It further
> converts the respective drivers to the generic code. The shared code
> is basically the same implementation as the one copied among individual=

> drivers.
>=20
> The patch set contains two major changes: first, it introduces
> |struct drm_gem_vram_object| and helpers (GEM VRAM). It's a GEM object
> that is backed by VRAM. The type's purpose is somewhat similar to
> |struct drm_gem_{cma, shmem}_object|: it provides an commom implementat=
ion
> that handles all the basic cases. Second, the patch set introduces
> |struct drm_vram_mm| and helpers (VRAM MM). It's an implementation of a=

> basic memory manager for VRAM.
>=20
> Both, GEM VRAM and VRAM MM, support buffer placement in VRAM and system=

> memory. Both can be used independedly from each other if desired by the=

> DRM driver.
>=20
> Currently ast, bochs, mgag200, vboxvideo and hisilicon/hibmc can use
> these helpers.
>=20
> Future directions: with these changes, the respective drivers can also
> share some of their mode-setting or fbdev code. GEM VRAM's PRIME helper=
s
> allow for using the generic fbcon emulation.
>=20
> The patch set is against a recent drm-tip.
>=20
> v5:
> 	* move bochs PRIME functions to GEM VRAM helpers
> 	* always set struct file_operations.llseek to no_llseek()
> 	* add WARN_ON_ONCE for pin-count mismatches
> 	* only allocate 2 entries in placements array
> v4:
> 	* cleanups from checkpatch.pl
> 	* add more documentation for VRAM helpers
> 	* remove several fixed-size types from interfaces
> 	* don't make drivers depend on DRM_TTM; auto-selected if necessary
> 	* use single config optiom DRM_VRAM_HELPER
> v3:
> 	* share VRAM MM callback structure among drivers
> 	* move VRAM MM instances to drm_device and share rsp. code
> v2:
> 	* rename |struct drm_gem_ttm_object| to |struct drm_gem_vram_object|
> 	* rename |struct drm_simple_ttm| to |struct drm_vram_mm|
> 	* make drm_is_gem_ttm() an internal helper
> 	* add drm_gem_vram_kmap_at()
> 	* return is_iomem from kmap functions
> 	* redefine TTM placement flags for public interface
> 	* add drm_vram_mm_mmap() helper
> 	* replace almost all of driver's TTM code with these helpers
> 	* documentation fixes
>=20
> Thomas Zimmermann (20):
>   drm: Add |struct drm_gem_vram_object| and helpers
>   drm: Add |struct drm_gem_vram_object| callbacks for |struct
>     ttm_bo_driver|
>   drm: Add |struct drm_gem_vram_object| callbacks for |struct
>     drm_driver|
>   drm: Add drm_gem_vram_fill_create_dumb() to create dumb buffers
>   drm: Add simple PRIME helpers for GEM VRAM
>   drm: Add VRAM MM, a simple memory manager for dedicated VRAM
>   drm: Add default instance for VRAM MM callback functions
>   drm: Integrate VRAM MM into struct drm_device
>   drm/ast: Convert AST driver to |struct drm_gem_vram_object|
>   drm/ast: Convert AST driver to VRAM MM
>   drm/ast: Replace mapping code with drm_gem_vram_{kmap/kunmap}()
>   drm/bochs: Convert bochs driver to |struct drm_gem_vram_object|
>   drm/bochs: Convert bochs driver to VRAM MM
>   drm/mgag200: Convert mgag200 driver to |struct drm_gem_vram_object|
>   drm/mgag200: Convert mgag200 driver to VRAM MM
>   drm/mgag200: Replace mapping code with drm_gem_vram_{kmap/kunmap}()
>   drm/vboxvideo: Convert vboxvideo driver to |struct
>     drm_gem_vram_object|
>   drm/vboxvideo: Convert vboxvideo driver to VRAM MM
>   drm/hisilicon: Convert hibmc-drm driver to |struct
>     drm_gem_vram_object|
>   drm/hisilicon: Convert hibmc-drm driver to VRAM MM
>=20
>  Documentation/gpu/drm-mm.rst                  |  34 +-
>  drivers/gpu/drm/Kconfig                       |   7 +
>  drivers/gpu/drm/Makefile                      |   5 +
>  drivers/gpu/drm/ast/Kconfig                   |   3 +-
>  drivers/gpu/drm/ast/ast_drv.c                 |  13 +-
>  drivers/gpu/drm/ast/ast_drv.h                 |  71 +-
>  drivers/gpu/drm/ast/ast_fb.c                  |  34 +-
>  drivers/gpu/drm/ast/ast_main.c                |  77 +-
>  drivers/gpu/drm/ast/ast_mode.c                | 124 +--
>  drivers/gpu/drm/ast/ast_ttm.c                 | 302 +-------
>  drivers/gpu/drm/bochs/Kconfig                 |   2 +-
>  drivers/gpu/drm/bochs/bochs.h                 |  54 +-
>  drivers/gpu/drm/bochs/bochs_drv.c             |  22 +-
>  drivers/gpu/drm/bochs/bochs_kms.c             |  18 +-
>  drivers/gpu/drm/bochs/bochs_mm.c              | 426 +----------
>  drivers/gpu/drm/drm_gem_vram_helper.c         | 713 ++++++++++++++++++=

>  drivers/gpu/drm/drm_vram_helper_common.c      |  98 +++
>  drivers/gpu/drm/drm_vram_mm_helper.c          | 295 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig       |   2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  21 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  33 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  30 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 341 +--------
>  drivers/gpu/drm/mgag200/Kconfig               |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c      |  88 ++-
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |  13 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h         |  74 +-
>  drivers/gpu/drm/mgag200/mgag200_fb.c          |  34 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c        |  87 +--
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |  53 +-
>  drivers/gpu/drm/mgag200/mgag200_ttm.c         | 301 +-------
>  drivers/gpu/drm/vboxvideo/Kconfig             |   2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  12 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.h          |  75 +-
>  drivers/gpu/drm/vboxvideo/vbox_fb.c           |  22 +-
>  drivers/gpu/drm/vboxvideo/vbox_main.c         |  75 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  36 +-
>  drivers/gpu/drm/vboxvideo/vbox_ttm.c          | 355 +--------
>  include/drm/drm_device.h                      |   4 +
>  include/drm/drm_gem_vram_helper.h             | 160 ++++
>  include/drm/drm_vram_mm_helper.h              | 102 +++
>  42 files changed, 1797 insertions(+), 2437 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_gem_vram_helper.c
>  create mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
>  create mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
>  create mode 100644 include/drm/drm_gem_vram_helper.h
>  create mode 100644 include/drm/drm_vram_mm_helper.h
>=20
> --
> 2.21.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--hPxYpMJ0U06bKQ6OnglNUguNq7CEZCcEa--

--KJTTDM2tRLl5hDaHbT7BFpqPcNGxPjHZh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzbulIACgkQaA3BHVML
eiOS6wf/TT7ypWHmYfT8+m6Hmr6tz4svrpSc6O3X2BDPy+oeIDUUjkOme5SdxiDG
pqWNOUnBVCU+yHkP4MFL0W6lUR6MQOq5pbgCaMmCTp5zcHPPtv7qBU2YQLiUyylX
K2uF07mAhMy3BHRk97O0hq5tbPHK/WecZluhtTAFHUh6byFgGClydOQqIM6ShfgZ
ai5WCQ/b77ei0p4bbXx2G7jSCL5Th1Vs0O6Hoq1xcF2JQT2Pfwhp7eeKwSqX6vaQ
Qp9HJ6dCL+EeeSEfZdDugTPUn8FJCuS05/yWzMaJ7Jv7drrI3TT3EDbFHdvCfRXX
TXTemiaHod52IXBfvs570yiRurcNUA==
=4EhR
-----END PGP SIGNATURE-----

--KJTTDM2tRLl5hDaHbT7BFpqPcNGxPjHZh--

--===============1277283025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1277283025==--
