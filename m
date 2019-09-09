Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16214AD958
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 14:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8E89935;
	Mon,  9 Sep 2019 12:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6FB89935
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 12:48:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 122AEAEB3;
 Mon,  9 Sep 2019 12:48:00 +0000 (UTC)
Subject: Re: [PATCH v3 7/7] drm/vram: fix Kconfig
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-8-kraxel@redhat.com>
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
Message-ID: <bf878fb7-416a-ba41-c1a4-d1c95bd3a4ee@suse.de>
Date: Mon, 9 Sep 2019 14:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904054740.20817-8-kraxel@redhat.com>
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
 Chen Feng <puck.chen@hisilicon.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1220602028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1220602028==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="47bhEdBPYH43lCBuMRYtaXkG7ni6nsatf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--47bhEdBPYH43lCBuMRYtaXkG7ni6nsatf
Content-Type: multipart/mixed; boundary="OxFJn0wfhCczI7Nqkb3gSMltDAonUXRjh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen Feng <puck.chen@hisilicon.com>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Message-ID: <bf878fb7-416a-ba41-c1a4-d1c95bd3a4ee@suse.de>
Subject: Re: [PATCH v3 7/7] drm/vram: fix Kconfig
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-8-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-8-kraxel@redhat.com>

--OxFJn0wfhCczI7Nqkb3gSMltDAonUXRjh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.09.19 um 07:47 schrieb Gerd Hoffmann:
> select isn't recursive, so we can't turn on DRM_TTM + DRM_TTM_HELPER
> in config DRM_VRAM_HELPER, we have to select them on the vram users
> instead.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig                 | 2 --
>  drivers/gpu/drm/ast/Kconfig             | 2 ++
>  drivers/gpu/drm/bochs/Kconfig           | 2 ++
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 3 ++-
>  drivers/gpu/drm/mgag200/Kconfig         | 2 ++
>  drivers/gpu/drm/vboxvideo/Kconfig       | 2 ++
>  6 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1be8ad30d8fe..cd11a3bde19c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -168,8 +168,6 @@ config DRM_TTM
>  config DRM_VRAM_HELPER
>  	tristate
>  	depends on DRM
> -	select DRM_TTM
> -	select DRM_TTM_HELPER
>  	help
>  	  Helpers for VRAM memory management
> =20
> diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
> index 829620d5326c..fbcf2f45cef5 100644
> --- a/drivers/gpu/drm/ast/Kconfig
> +++ b/drivers/gpu/drm/ast/Kconfig
> @@ -4,6 +4,8 @@ config DRM_AST
>  	depends on DRM && PCI && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
>  	help
>  	 Say yes for experimental AST GPU driver. Do not enable
>  	 this driver without having a working -modesetting,
> diff --git a/drivers/gpu/drm/bochs/Kconfig b/drivers/gpu/drm/bochs/Kcon=
fig
> index 32b043abb668..7bcdf294fed8 100644
> --- a/drivers/gpu/drm/bochs/Kconfig
> +++ b/drivers/gpu/drm/bochs/Kconfig
> @@ -4,6 +4,8 @@ config DRM_BOCHS
>  	depends on DRM && PCI && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
>  	help
>  	  Choose this option for qemu.
>  	  If M is selected the module will be called bochs-drm.
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/=
hisilicon/hibmc/Kconfig
> index f20eedf0073a..8ad9a5b12e40 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -4,7 +4,8 @@ config DRM_HISI_HIBMC
>  	depends on DRM && PCI && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> -
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
>  	help
>  	  Choose this option if you have a Hisilicon Hibmc soc chipset.
>  	  If M is selected the module will be called hibmc-drm.
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/=
Kconfig
> index 76fee0fbdcae..aed11f4f4c55 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -4,6 +4,8 @@ config DRM_MGAG200
>  	depends on DRM && PCI && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
>  	help
>  	 This is a KMS driver for the MGA G200 server chips, it
>           does not support the original MGA G200 or any of the desktop
> diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvi=
deo/Kconfig
> index 56ba510f21a2..45fe135d6e43 100644
> --- a/drivers/gpu/drm/vboxvideo/Kconfig
> +++ b/drivers/gpu/drm/vboxvideo/Kconfig
> @@ -4,6 +4,8 @@ config DRM_VBOXVIDEO
>  	depends on DRM && X86 && PCI
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
>  	select GENERIC_ALLOCATOR
>  	help
>  	  This is a KMS driver for the virtual Graphics Card used in
>=20

Thanks for fixing the Kconfigs for VRAM helpers.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--OxFJn0wfhCczI7Nqkb3gSMltDAonUXRjh--

--47bhEdBPYH43lCBuMRYtaXkG7ni6nsatf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl12Sf8ACgkQaA3BHVML
eiPh6AgAl0mzBwbaxMhxqlfZNPq3tFs4h1Py9aWi3/+VF7K75pm8zhBl9y2q4TD+
7DVEpJM5xzY5O9KivyzLr53y/q5Ilzp18oNlaO/gjCBMFgtB81IizFtm67yIdkLA
AfrdR3IaWU/s01Fbs5fHUysMWXdKFNdcWWRvJTBoYAcrCO2VvVuyiTkatPmVBoNd
AizqjzvMlv8m/cLFSEuOLotgG0+lQuUu5kYsTlv/9NG4BmU+n3r27Tjh/X1PSHU1
xqFld4QRloIm+xusum2R8R/tZvzGnPf7wV7HBvZioqs6JQ9llc3agnyKoRRszTJz
FKrHDtGQT3NuI8677j2ombzXIp3gtA==
=V8zx
-----END PGP SIGNATURE-----

--47bhEdBPYH43lCBuMRYtaXkG7ni6nsatf--

--===============1220602028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1220602028==--
