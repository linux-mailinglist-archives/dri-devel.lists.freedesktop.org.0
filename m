Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6E1CFD1E
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6216E964;
	Tue, 12 May 2020 18:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819AC6E960;
 Tue, 12 May 2020 18:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7FFA7B120;
 Tue, 12 May 2020 18:20:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/radeon: remove AGP support
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
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
Message-ID: <d0314d28-7ef3-e158-ee05-4802e16c0ecc@suse.de>
Date: Tue, 12 May 2020 20:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511171722.96576-2-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1343129628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1343129628==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0pBMGTWQsV6s2HpzTYNLFGIWqImJ3CuU9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0pBMGTWQsV6s2HpzTYNLFGIWqImJ3CuU9
Content-Type: multipart/mixed; boundary="NbA2eOA4R5k0IXPLJryz8nnkswo7VcVPO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <d0314d28-7ef3-e158-ee05-4802e16c0ecc@suse.de>
Subject: Re: [PATCH 1/3] drm/radeon: remove AGP support
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
In-Reply-To: <20200511171722.96576-2-christian.koenig@amd.com>

--NbA2eOA4R5k0IXPLJryz8nnkswo7VcVPO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christian

Am 11.05.20 um 19:17 schrieb Christian K=C3=B6nig:
> AGP is deprecated for 10+ years now and not used any more on modern har=
dware.
>=20
> Old hardware should continue to work in PCI mode.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/Makefile        |   4 +-
>  drivers/gpu/drm/radeon/evergreen.c     |   7 -
>  drivers/gpu/drm/radeon/r100.c          |  10 +-
>  drivers/gpu/drm/radeon/r300.c          |   9 -
>  drivers/gpu/drm/radeon/r420.c          |   9 -
>  drivers/gpu/drm/radeon/r520.c          |   8 -
>  drivers/gpu/drm/radeon/r600.c          |   6 -
>  drivers/gpu/drm/radeon/radeon.h        |  11 -
>  drivers/gpu/drm/radeon/radeon_agp.c    | 290 -------------------------=

>  drivers/gpu/drm/radeon/radeon_device.c |  23 +-
>  drivers/gpu/drm/radeon/radeon_drv.c    |   9 -

In radeon_drv.c, the field drm_device.agp is still being initialized in
radeon_pci_probe() and cleaned up in radeon_driver_unload_kms(). Is this
intentional?

Best regards
Thomas

>  drivers/gpu/drm/radeon/radeon_ttm.c    |  39 ----
>  drivers/gpu/drm/radeon/rv515.c         |   9 -
>  drivers/gpu/drm/radeon/rv770.c         |   7 -
>  14 files changed, 4 insertions(+), 437 deletions(-)
>  delete mode 100644 drivers/gpu/drm/radeon/radeon_agp.c
>=20
> diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/M=
akefile
> index c693b2ca0329..77429cfd303e 100644
> --- a/drivers/gpu/drm/radeon/Makefile
> +++ b/drivers/gpu/drm/radeon/Makefile
> @@ -61,8 +61,8 @@ radeon-y :=3D radeon_drv.o
> =20
>  # add KMS driver
>  radeon-y +=3D radeon_device.o radeon_asic.o radeon_kms.o \
> -	radeon_atombios.o radeon_agp.o atombios_crtc.o radeon_combios.o \
> -	atom.o radeon_fence.o radeon_ttm.o radeon_object.o radeon_gart.o \
> +	radeon_atombios.o atombios_crtc.o radeon_combios.o atom.o \
> +	radeon_fence.o radeon_ttm.o radeon_object.o radeon_gart.o \
>  	radeon_legacy_crtc.o radeon_legacy_encoders.o radeon_connectors.o \
>  	radeon_encoders.o radeon_display.o radeon_cursor.o radeon_i2c.o \
>  	radeon_clocks.o radeon_fb.o radeon_gem.o radeon_ring.o radeon_irq_kms=
=2Eo \
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeo=
n/evergreen.c
> index 14d90dc376e7..66b3d9a2c6dd 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -5216,12 +5216,6 @@ int evergreen_init(struct radeon_device *rdev)
>  	r =3D radeon_fence_driver_init(rdev);
>  	if (r)
>  		return r;
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r)
> -			radeon_agp_disable(rdev);
> -	}
>  	/* initialize memory controller */
>  	r =3D evergreen_mc_init(rdev);
>  	if (r)
> @@ -5315,7 +5309,6 @@ void evergreen_fini(struct radeon_device *rdev)
>  	r600_vram_scratch_fini(rdev);
>  	radeon_gem_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_bo_fini(rdev);
>  	radeon_atombios_fini(rdev);
>  	kfree(rdev->bios);
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r10=
0.c
> index 24c8db673931..320b1b40a30a 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -3382,7 +3382,7 @@ void r100_bandwidth_update(struct radeon_device *=
rdev)
> =20
>  	if (rdev->flags & RADEON_IS_AGP) {
>  		fixed20_12 agpmode_ff;
> -		agpmode_ff.full =3D dfixed_const(radeon_agpmode);
> +		agpmode_ff.full =3D dfixed_const(0);
>  		temp_ff.full =3D dfixed_const_666(16);
>  		sclk_eff_ff.full -=3D dfixed_mul(agpmode_ff, temp_ff);
>  	}
> @@ -3992,7 +3992,6 @@ void r100_fini(struct radeon_device *rdev)
>  	radeon_gem_fini(rdev);
>  	if (rdev->flags & RADEON_IS_PCI)
>  		r100_pci_gart_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_irq_kms_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
>  	radeon_bo_fini(rdev);
> @@ -4068,13 +4067,6 @@ int r100_init(struct radeon_device *rdev)
>  	r100_errata(rdev);
>  	/* Initialize clocks */
>  	radeon_get_clock_info(rdev->ddev);
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r) {
> -			radeon_agp_disable(rdev);
> -		}
> -	}
>  	/* initialize VRAM */
>  	r100_mc_init(rdev);
>  	/* Fence driver */
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r30=
0.c
> index 3b7ead5be5bf..afd688629cf9 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -1498,7 +1498,6 @@ void r300_fini(struct radeon_device *rdev)
>  		rv370_pcie_gart_fini(rdev);
>  	if (rdev->flags & RADEON_IS_PCI)
>  		r100_pci_gart_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_irq_kms_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
>  	radeon_bo_fini(rdev);
> @@ -1547,13 +1546,6 @@ int r300_init(struct radeon_device *rdev)
>  	r300_errata(rdev);
>  	/* Initialize clocks */
>  	radeon_get_clock_info(rdev->ddev);
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r) {
> -			radeon_agp_disable(rdev);
> -		}
> -	}
>  	/* initialize memory controller */
>  	r300_mc_init(rdev);
>  	/* Fence driver */
> @@ -1592,7 +1584,6 @@ int r300_init(struct radeon_device *rdev)
>  			rv370_pcie_gart_fini(rdev);
>  		if (rdev->flags & RADEON_IS_PCI)
>  			r100_pci_gart_fini(rdev);
> -		radeon_agp_fini(rdev);
>  		rdev->accel_working =3D false;
>  	}
>  	return 0;
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r42=
0.c
> index 1d4c04e0a449..3cb337dacd56 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -366,7 +366,6 @@ void r420_fini(struct radeon_device *rdev)
>  		rv370_pcie_gart_fini(rdev);
>  	if (rdev->flags & RADEON_IS_PCI)
>  		r100_pci_gart_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_irq_kms_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
>  	radeon_bo_fini(rdev);
> @@ -419,13 +418,6 @@ int r420_init(struct radeon_device *rdev)
> =20
>  	/* Initialize clocks */
>  	radeon_get_clock_info(rdev->ddev);
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r) {
> -			radeon_agp_disable(rdev);
> -		}
> -	}
>  	/* initialize memory controller */
>  	r300_mc_init(rdev);
>  	r420_debugfs(rdev);
> @@ -470,7 +462,6 @@ int r420_init(struct radeon_device *rdev)
>  			rv370_pcie_gart_fini(rdev);
>  		if (rdev->flags & RADEON_IS_PCI)
>  			r100_pci_gart_fini(rdev);
> -		radeon_agp_fini(rdev);
>  		rdev->accel_working =3D false;
>  	}
>  	return 0;
> diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r52=
0.c
> index fc78e64ae727..76ac87d72406 100644
> --- a/drivers/gpu/drm/radeon/r520.c
> +++ b/drivers/gpu/drm/radeon/r520.c
> @@ -288,13 +288,6 @@ int r520_init(struct radeon_device *rdev)
>  	}
>  	/* Initialize clocks */
>  	radeon_get_clock_info(rdev->ddev);
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r) {
> -			radeon_agp_disable(rdev);
> -		}
> -	}
>  	/* initialize memory controller */
>  	r520_mc_init(rdev);
>  	rv515_debugfs(rdev);
> @@ -324,7 +317,6 @@ int r520_init(struct radeon_device *rdev)
>  		radeon_ib_pool_fini(rdev);
>  		radeon_irq_kms_fini(rdev);
>  		rv370_pcie_gart_fini(rdev);
> -		radeon_agp_fini(rdev);
>  		rdev->accel_working =3D false;
>  	}
>  	return 0;
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r60=
0.c
> index d9a33ca768f3..4a5ac15893c2 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -3286,11 +3286,6 @@ int r600_init(struct radeon_device *rdev)
>  	r =3D radeon_fence_driver_init(rdev);
>  	if (r)
>  		return r;
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r)
> -			radeon_agp_disable(rdev);
> -	}
>  	r =3D r600_mc_init(rdev);
>  	if (r)
>  		return r;
> @@ -3353,7 +3348,6 @@ void r600_fini(struct radeon_device *rdev)
>  	radeon_irq_kms_fini(rdev);
>  	r600_pcie_gart_fini(rdev);
>  	r600_vram_scratch_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_gem_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
>  	radeon_bo_fini(rdev);
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> index 30e32adc1fc6..377e1403b134 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -91,7 +91,6 @@ extern int radeon_no_wb;
>  extern int radeon_modeset;
>  extern int radeon_dynclks;
>  extern int radeon_r4xx_atom;
> -extern int radeon_agpmode;
>  extern int radeon_vram_limit;
>  extern int radeon_gart_size;
>  extern int radeon_benchmarking;
> @@ -1116,16 +1115,6 @@ typedef int (*radeon_packet0_check_t)(struct rad=
eon_cs_parser *p,
>  typedef int (*radeon_packet3_check_t)(struct radeon_cs_parser *p,
>  				      struct radeon_cs_packet *pkt);
> =20
> -
> -/*
> - * AGP
> - */
> -int radeon_agp_init(struct radeon_device *rdev);
> -void radeon_agp_resume(struct radeon_device *rdev);
> -void radeon_agp_suspend(struct radeon_device *rdev);
> -void radeon_agp_fini(struct radeon_device *rdev);
> -
> -
>  /*
>   * Writeback
>   */
> diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/rade=
on/radeon_agp.c
> deleted file mode 100644
> index 0aca7bdf54c7..000000000000
> --- a/drivers/gpu/drm/radeon/radeon_agp.c
> +++ /dev/null
> @@ -1,290 +0,0 @@
> -/*
> - * Copyright 2008 Red Hat Inc.
> - * Copyright 2009 Jerome Glisse.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> - * copy of this software and associated documentation files (the "Soft=
ware"),
> - * to deal in the Software without restriction, including without limi=
tation
> - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> - * and/or sell copies of the Software, and to permit persons to whom t=
he
> - * Software is furnished to do so, subject to the following conditions=
:
> - *
> - * The above copyright notice and this permission notice shall be incl=
uded in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *    Dave Airlie
> - *    Jerome Glisse <glisse@freedesktop.org>
> - */
> -
> -#include <linux/pci.h>
> -
> -#include <drm/drm_agpsupport.h>
> -#include <drm/drm_device.h>
> -#include <drm/radeon_drm.h>
> -
> -#include "radeon.h"
> -
> -#if IS_ENABLED(CONFIG_AGP)
> -
> -struct radeon_agpmode_quirk {
> -	u32 hostbridge_vendor;
> -	u32 hostbridge_device;
> -	u32 chip_vendor;
> -	u32 chip_device;
> -	u32 subsys_vendor;
> -	u32 subsys_device;
> -	u32 default_mode;
> -};
> -
> -static struct radeon_agpmode_quirk radeon_agpmode_quirk_list[] =3D {
> -	/* Intel E7505 Memory Controller Hub / RV350 AR [Radeon 9600XT] Needs=
 AGPMode 4 (deb #515326) */
> -	{ PCI_VENDOR_ID_INTEL, 0x2550, PCI_VENDOR_ID_ATI, 0x4152, 0x1458, 0x4=
038, 4},
> -	/* Intel 82865G/PE/P DRAM Controller/Host-Hub / Mobility 9800 Needs A=
GPMode 4 (deb #462590) */
> -	{ PCI_VENDOR_ID_INTEL, 0x2570, PCI_VENDOR_ID_ATI, 0x4a4e, PCI_VENDOR_=
ID_DELL, 0x5106, 4},
> -	/* Intel 82865G/PE/P DRAM Controller/Host-Hub / RV280 [Radeon 9200 SE=
] Needs AGPMode 4 (lp #300304) */
> -	{ PCI_VENDOR_ID_INTEL, 0x2570, PCI_VENDOR_ID_ATI, 0x5964,
> -		0x148c, 0x2073, 4},
> -	/* Intel 82855PM Processor to I/O Controller / Mobility M6 LY Needs A=
GPMode 1 (deb #467235) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4c59,
> -		PCI_VENDOR_ID_IBM, 0x052f, 1},
> -	/* Intel 82855PM host bridge / Mobility 9600 M10 RV350 Needs AGPMode =
1 (lp #195051) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4e50,
> -		PCI_VENDOR_ID_IBM, 0x0550, 1},
> -	/* Intel 82855PM host bridge / RV250/M9 GL [Mobility FireGL 9000/Rade=
on 9000] needs AGPMode 1 (Thinkpad T40p) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4c66,
> -		PCI_VENDOR_ID_IBM, 0x054d, 1},
> -	/* Intel 82855PM host bridge / Mobility M7 needs AGPMode 1 */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4c57,
> -		PCI_VENDOR_ID_IBM, 0x0530, 1},
> -	/* Intel 82855PM host bridge / FireGL Mobility T2 RV350 Needs AGPMode=
 2 (fdo #20647) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4e54,
> -		PCI_VENDOR_ID_IBM, 0x054f, 2},
> -	/* Intel 82855PM host bridge / Mobility M9+ / VaioPCG-V505DX Needs AG=
PMode 2 (fdo #17928) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x5c61,
> -		PCI_VENDOR_ID_SONY, 0x816b, 2},
> -	/* Intel 82855PM Processor to I/O Controller / Mobility M9+ Needs AGP=
Mode 8 (phoronix forum) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x5c61,
> -		PCI_VENDOR_ID_SONY, 0x8195, 8},
> -	/* Intel 82830 830 Chipset Host Bridge / Mobility M6 LY Needs AGPMode=
 2 (fdo #17360)*/
> -	{ PCI_VENDOR_ID_INTEL, 0x3575, PCI_VENDOR_ID_ATI, 0x4c59,
> -		PCI_VENDOR_ID_DELL, 0x00e3, 2},
> -	/* Intel 82852/82855 host bridge / Mobility FireGL 9000 RV250 Needs A=
GPMode 1 (lp #296617) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3580, PCI_VENDOR_ID_ATI, 0x4c66,
> -		PCI_VENDOR_ID_DELL, 0x0149, 1},
> -	/* Intel 82855PM host bridge / Mobility FireGL 9000 RV250 Needs AGPMo=
de 1 for suspend/resume */
> -	{ PCI_VENDOR_ID_INTEL, 0x3340, PCI_VENDOR_ID_ATI, 0x4c66,
> -		PCI_VENDOR_ID_IBM, 0x0531, 1},
> -	/* Intel 82852/82855 host bridge / Mobility 9600 M10 RV350 Needs AGPM=
ode 1 (deb #467460) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3580, PCI_VENDOR_ID_ATI, 0x4e50,
> -		0x1025, 0x0061, 1},
> -	/* Intel 82852/82855 host bridge / Mobility 9600 M10 RV350 Needs AGPM=
ode 1 (lp #203007) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3580, PCI_VENDOR_ID_ATI, 0x4e50,
> -		0x1025, 0x0064, 1},
> -	/* Intel 82852/82855 host bridge / Mobility 9600 M10 RV350 Needs AGPM=
ode 1 (lp #141551) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3580, PCI_VENDOR_ID_ATI, 0x4e50,
> -		PCI_VENDOR_ID_ASUSTEK, 0x1942, 1},
> -	/* Intel 82852/82855 host bridge / Mobility 9600/9700 Needs AGPMode 1=
 (deb #510208) */
> -	{ PCI_VENDOR_ID_INTEL, 0x3580, PCI_VENDOR_ID_ATI, 0x4e50,
> -		0x10cf, 0x127f, 1},
> -	/* ASRock K7VT4A+ AGP 8x / ATI Radeon 9250 AGP Needs AGPMode 4 (lp #1=
33192) */
> -	{ 0x1849, 0x3189, PCI_VENDOR_ID_ATI, 0x5960,
> -		0x1787, 0x5960, 4},
> -	/* VIA K8M800 Host Bridge / RV280 [Radeon 9200 PRO] Needs AGPMode 4 (=
fdo #12544) */
> -	{ PCI_VENDOR_ID_VIA, 0x0204, PCI_VENDOR_ID_ATI, 0x5960,
> -		0x17af, 0x2020, 4},
> -	/* VIA KT880 Host Bridge / RV350 [Radeon 9550] Needs AGPMode 4 (fdo #=
19981) */
> -	{ PCI_VENDOR_ID_VIA, 0x0269, PCI_VENDOR_ID_ATI, 0x4153,
> -		PCI_VENDOR_ID_ASUSTEK, 0x003c, 4},
> -	/* VIA VT8363 Host Bridge / R200 QL [Radeon 8500] Needs AGPMode 2 (lp=
 #141551) */
> -	{ PCI_VENDOR_ID_VIA, 0x0305, PCI_VENDOR_ID_ATI, 0x514c,
> -		PCI_VENDOR_ID_ATI, 0x013a, 2},
> -	/* VIA VT82C693A Host Bridge / RV280 [Radeon 9200 PRO] Needs AGPMode =
2 (deb #515512) */
> -	{ PCI_VENDOR_ID_VIA, 0x0691, PCI_VENDOR_ID_ATI, 0x5960,
> -		PCI_VENDOR_ID_ASUSTEK, 0x004c, 2},
> -	/* VIA VT82C693A Host Bridge / RV280 [Radeon 9200 PRO] Needs AGPMode =
2 */
> -	{ PCI_VENDOR_ID_VIA, 0x0691, PCI_VENDOR_ID_ATI, 0x5960,
> -		PCI_VENDOR_ID_ASUSTEK, 0x0054, 2},
> -	/* VIA VT8377 Host Bridge / R200 QM [Radeon 9100] Needs AGPMode 4 (de=
b #461144) */
> -	{ PCI_VENDOR_ID_VIA, 0x3189, PCI_VENDOR_ID_ATI, 0x514d,
> -		0x174b, 0x7149, 4},
> -	/* VIA VT8377 Host Bridge / RV280 [Radeon 9200 PRO] Needs AGPMode 4 (=
lp #312693) */
> -	{ PCI_VENDOR_ID_VIA, 0x3189, PCI_VENDOR_ID_ATI, 0x5960,
> -		0x1462, 0x0380, 4},
> -	/* VIA VT8377 Host Bridge / RV280 Needs AGPMode 4 (ati ML) */
> -	{ PCI_VENDOR_ID_VIA, 0x3189, PCI_VENDOR_ID_ATI, 0x5964,
> -		0x148c, 0x2073, 4},
> -	/* ATI Host Bridge / RV280 [M9+] Needs AGPMode 1 (phoronix forum) */
> -	{ PCI_VENDOR_ID_ATI, 0xcbb2, PCI_VENDOR_ID_ATI, 0x5c61,
> -		PCI_VENDOR_ID_SONY, 0x8175, 1},
> -	{ 0, 0, 0, 0, 0, 0, 0 },
> -};
> -#endif
> -
> -int radeon_agp_init(struct radeon_device *rdev)
> -{
> -#if IS_ENABLED(CONFIG_AGP)
> -	struct radeon_agpmode_quirk *p =3D radeon_agpmode_quirk_list;
> -	struct drm_agp_mode mode;
> -	struct drm_agp_info info;
> -	uint32_t agp_status;
> -	int default_mode;
> -	bool is_v3;
> -	int ret;
> -
> -	/* Acquire AGP. */
> -	ret =3D drm_agp_acquire(rdev->ddev);
> -	if (ret) {
> -		DRM_ERROR("Unable to acquire AGP: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D drm_agp_info(rdev->ddev, &info);
> -	if (ret) {
> -		drm_agp_release(rdev->ddev);
> -		DRM_ERROR("Unable to get AGP info: %d\n", ret);
> -		return ret;
> -	}
> -
> -	if (rdev->ddev->agp->agp_info.aper_size < 32) {
> -		drm_agp_release(rdev->ddev);
> -		dev_warn(rdev->dev, "AGP aperture too small (%zuM) "
> -			"need at least 32M, disabling AGP\n",
> -			rdev->ddev->agp->agp_info.aper_size);
> -		return -EINVAL;
> -	}
> -
> -	mode.mode =3D info.mode;
> -	/* chips with the agp to pcie bridge don't have the AGP_STATUS regist=
er
> -	 * Just use the whatever mode the host sets up.
> -	 */
> -	if (rdev->family <=3D CHIP_RV350)
> -		agp_status =3D (RREG32(RADEON_AGP_STATUS) | RADEON_AGPv3_MODE) & mod=
e.mode;
> -	else
> -		agp_status =3D mode.mode;
> -	is_v3 =3D !!(agp_status & RADEON_AGPv3_MODE);
> -
> -	if (is_v3) {
> -		default_mode =3D (agp_status & RADEON_AGPv3_8X_MODE) ? 8 : 4;
> -	} else {
> -		if (agp_status & RADEON_AGP_4X_MODE) {
> -			default_mode =3D 4;
> -		} else if (agp_status & RADEON_AGP_2X_MODE) {
> -			default_mode =3D 2;
> -		} else {
> -			default_mode =3D 1;
> -		}
> -	}
> -
> -	/* Apply AGPMode Quirks */
> -	while (p && p->chip_device !=3D 0) {
> -		if (info.id_vendor =3D=3D p->hostbridge_vendor &&
> -		    info.id_device =3D=3D p->hostbridge_device &&
> -		    rdev->pdev->vendor =3D=3D p->chip_vendor &&
> -		    rdev->pdev->device =3D=3D p->chip_device &&
> -		    rdev->pdev->subsystem_vendor =3D=3D p->subsys_vendor &&
> -		    rdev->pdev->subsystem_device =3D=3D p->subsys_device) {
> -			default_mode =3D p->default_mode;
> -		}
> -		++p;
> -	}
> -
> -	if (radeon_agpmode > 0) {
> -		if ((radeon_agpmode < (is_v3 ? 4 : 1)) ||
> -		    (radeon_agpmode > (is_v3 ? 8 : 4)) ||
> -		    (radeon_agpmode & (radeon_agpmode - 1))) {
> -			DRM_ERROR("Illegal AGP Mode: %d (valid %s), leaving at %d\n",
> -				  radeon_agpmode, is_v3 ? "4, 8" : "1, 2, 4",
> -				  default_mode);
> -			radeon_agpmode =3D default_mode;
> -		} else {
> -			DRM_INFO("AGP mode requested: %d\n", radeon_agpmode);
> -		}
> -	} else {
> -		radeon_agpmode =3D default_mode;
> -	}
> -
> -	mode.mode &=3D ~RADEON_AGP_MODE_MASK;
> -	if (is_v3) {
> -		switch (radeon_agpmode) {
> -		case 8:
> -			mode.mode |=3D RADEON_AGPv3_8X_MODE;
> -			break;
> -		case 4:
> -		default:
> -			mode.mode |=3D RADEON_AGPv3_4X_MODE;
> -			break;
> -		}
> -	} else {
> -		switch (radeon_agpmode) {
> -		case 4:
> -			mode.mode |=3D RADEON_AGP_4X_MODE;
> -			break;
> -		case 2:
> -			mode.mode |=3D RADEON_AGP_2X_MODE;
> -			break;
> -		case 1:
> -		default:
> -			mode.mode |=3D RADEON_AGP_1X_MODE;
> -			break;
> -		}
> -	}
> -
> -	mode.mode &=3D ~RADEON_AGP_FW_MODE; /* disable fw */
> -	ret =3D drm_agp_enable(rdev->ddev, mode);
> -	if (ret) {
> -		DRM_ERROR("Unable to enable AGP (mode =3D 0x%lx)\n", mode.mode);
> -		drm_agp_release(rdev->ddev);
> -		return ret;
> -	}
> -
> -	rdev->mc.agp_base =3D rdev->ddev->agp->agp_info.aper_base;

The field agp_base seems to be used to program HW registers. Yet I
cannot find its initialization after applying the patchset. Does some of
this removed setup code need to be moved elsewhere instead?

Best regards
Thomas

> -	rdev->mc.gtt_size =3D rdev->ddev->agp->agp_info.aper_size << 20;
> -	rdev->mc.gtt_start =3D rdev->mc.agp_base;
> -	rdev->mc.gtt_end =3D rdev->mc.gtt_start + rdev->mc.gtt_size - 1;
> -	dev_info(rdev->dev, "GTT: %lluM 0x%08llX - 0x%08llX\n",
> -		rdev->mc.gtt_size >> 20, rdev->mc.gtt_start, rdev->mc.gtt_end);
> -
> -	/* workaround some hw issues */
> -	if (rdev->family < CHIP_R200) {
> -		WREG32(RADEON_AGP_CNTL, RREG32(RADEON_AGP_CNTL) | 0x000e0000);
> -	}
> -	return 0;
> -#else
> -	return 0;
> -#endif
> -}
> -
> -void radeon_agp_resume(struct radeon_device *rdev)
> -{
> -#if IS_ENABLED(CONFIG_AGP)
> -	int r;
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r)
> -			dev_warn(rdev->dev, "radeon AGP reinit failed\n");
> -	}
> -#endif
> -}
> -
> -void radeon_agp_fini(struct radeon_device *rdev)
> -{
> -#if IS_ENABLED(CONFIG_AGP)
> -	if (rdev->ddev->agp && rdev->ddev->agp->acquired) {
> -		drm_agp_release(rdev->ddev);
> -	}
> -#endif
> -}
> -
> -void radeon_agp_suspend(struct radeon_device *rdev)
> -{
> -	radeon_agp_fini(rdev);
> -}
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/r=
adeon/radeon_device.c
> index 266e3cbbd09b..12e5c5d81c47 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1145,22 +1145,6 @@ static void radeon_check_arguments(struct radeon=
_device *rdev)
>  	}
>  	rdev->mc.gtt_size =3D (uint64_t)radeon_gart_size << 20;
> =20
> -	/* AGP mode can only be -1, 1, 2, 4, 8 */
> -	switch (radeon_agpmode) {
> -	case -1:
> -	case 0:
> -	case 1:
> -	case 2:
> -	case 4:
> -	case 8:
> -		break;
> -	default:
> -		dev_warn(rdev->dev, "invalid AGP mode %d (valid mode: "
> -				"-1, 0, 1, 2, 4, 8)\n", radeon_agpmode);
> -		radeon_agpmode =3D 0;
> -		break;
> -	}
> -
>  	if (!radeon_check_pot_argument(radeon_vm_size)) {
>  		dev_warn(rdev->dev, "VM size (%d) must be a power of 2\n",
>  			 radeon_vm_size);
> @@ -1348,9 +1332,8 @@ int radeon_device_init(struct radeon_device *rdev=
,
>  		rdev->flags &=3D ~RADEON_IS_AGP;
>  	}
> =20
> -	if (rdev->flags & RADEON_IS_AGP && radeon_agpmode =3D=3D -1) {
> +	if (rdev->flags & RADEON_IS_AGP)
>  		radeon_agp_disable(rdev);
> -	}
> =20
>  	/* Set the internal MC address mask
>  	 * This is the max address of the GPU's
> @@ -1636,8 +1619,6 @@ int radeon_suspend_kms(struct drm_device *dev, bo=
ol suspend,
>  	 */
>  	radeon_bo_evict_vram(rdev);
> =20
> -	radeon_agp_suspend(rdev);
> -
>  	pci_save_state(dev->pdev);
>  	if (freeze && rdev->family >=3D CHIP_CEDAR && !(rdev->flags & RADEON_=
IS_IGP)) {
>  		rdev->asic->asic_reset(rdev, true);
> @@ -1687,8 +1668,6 @@ int radeon_resume_kms(struct drm_device *dev, boo=
l resume, bool fbcon)
>  			return -1;
>  		}
>  	}
> -	/* resume AGP if in use */
> -	radeon_agp_resume(rdev);
>  	radeon_resume(rdev);
> =20
>  	r =3D radeon_ib_ring_tests(rdev);
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
> index bbb0883e8ce6..62a5dfaf990b 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -171,12 +171,6 @@ int radeon_no_wb;
>  int radeon_modeset =3D -1;
>  int radeon_dynclks =3D -1;
>  int radeon_r4xx_atom =3D 0;
> -#ifdef __powerpc__
> -/* Default to PCI on PowerPC (fdo #95017) */
> -int radeon_agpmode =3D -1;
> -#else
> -int radeon_agpmode =3D 0;
> -#endif
>  int radeon_vram_limit =3D 0;
>  int radeon_gart_size =3D -1; /* auto */
>  int radeon_benchmarking =3D 0;
> @@ -220,9 +214,6 @@ module_param_named(r4xx_atom, radeon_r4xx_atom, int=
, 0444);
>  MODULE_PARM_DESC(vramlimit, "Restrict VRAM for testing, in megabytes")=
;
>  module_param_named(vramlimit, radeon_vram_limit, int, 0600);
> =20
> -MODULE_PARM_DESC(agpmode, "AGP Mode (-1 =3D=3D PCI)");
> -module_param_named(agpmode, radeon_agpmode, int, 0444);
> -
>  MODULE_PARM_DESC(gartsize, "Size of PCIE/IGP gart to setup in megabyte=
s (32, 64, etc., -1 =3D auto)");
>  module_param_named(gartsize, radeon_gart_size, int, 0600);
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index 5d50c9edbe80..21bb3706c13c 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -86,20 +86,6 @@ static int radeon_init_mem_type(struct ttm_bo_device=
 *bdev, uint32_t type,
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> -#if IS_ENABLED(CONFIG_AGP)
> -		if (rdev->flags & RADEON_IS_AGP) {
> -			if (!rdev->ddev->agp) {
> -				DRM_ERROR("AGP is not enabled for memory type %u\n",
> -					  (unsigned)type);
> -				return -EINVAL;
> -			}
> -			if (!rdev->ddev->agp->cant_use_aperture)
> -				man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> -			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
> -						 TTM_PL_FLAG_WC;
> -			man->default_caching =3D TTM_PL_FLAG_WC;
> -		}
> -#endif
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
> @@ -411,14 +397,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo=
_device *bdev, struct ttm_mem_
>  		/* system memory */
>  		return 0;
>  	case TTM_PL_TT:
> -#if IS_ENABLED(CONFIG_AGP)
> -		if (rdev->flags & RADEON_IS_AGP) {
> -			/* RADEON_IS_AGP is set only if AGP is active */
> -			mem->bus.offset =3D mem->start << PAGE_SHIFT;
> -			mem->bus.base =3D rdev->mc.agp_base;
> -			mem->bus.is_iomem =3D !rdev->ddev->agp->cant_use_aperture;
> -		}
> -#endif
>  		break;
>  	case TTM_PL_VRAM:
>  		mem->bus.offset =3D mem->start << PAGE_SHIFT;
> @@ -631,12 +609,6 @@ static struct ttm_tt *radeon_ttm_tt_create(struct =
ttm_buffer_object *bo,
>  	struct radeon_ttm_tt *gtt;
> =20
>  	rdev =3D radeon_get_rdev(bo->bdev);
> -#if IS_ENABLED(CONFIG_AGP)
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		return ttm_agp_tt_create(bo, rdev->ddev->agp->bridge,
> -					 page_flags);
> -	}
> -#endif
> =20
>  	gtt =3D kzalloc(sizeof(struct radeon_ttm_tt), GFP_KERNEL);
>  	if (gtt =3D=3D NULL) {
> @@ -683,11 +655,6 @@ static int radeon_ttm_tt_populate(struct ttm_tt *t=
tm,
>  	}
> =20
>  	rdev =3D radeon_get_rdev(ttm->bdev);
> -#if IS_ENABLED(CONFIG_AGP)
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		return ttm_agp_tt_populate(ttm, ctx);
> -	}
> -#endif
> =20
>  #ifdef CONFIG_SWIOTLB
>  	if (rdev->need_swiotlb && swiotlb_nr_tbl()) {
> @@ -714,12 +681,6 @@ static void radeon_ttm_tt_unpopulate(struct ttm_tt=
 *ttm)
>  		return;
> =20
>  	rdev =3D radeon_get_rdev(ttm->bdev);
> -#if IS_ENABLED(CONFIG_AGP)
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		ttm_agp_tt_unpopulate(ttm);
> -		return;
> -	}
> -#endif
> =20
>  #ifdef CONFIG_SWIOTLB
>  	if (rdev->need_swiotlb && swiotlb_nr_tbl()) {
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv=
515.c
> index 147e5cf8348d..8a2f16320869 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -622,7 +622,6 @@ void rv515_fini(struct radeon_device *rdev)
>  	radeon_ib_pool_fini(rdev);
>  	radeon_gem_fini(rdev);
>  	rv370_pcie_gart_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_irq_kms_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
>  	radeon_bo_fini(rdev);
> @@ -667,13 +666,6 @@ int rv515_init(struct radeon_device *rdev)
>  		return -EINVAL;
>  	/* Initialize clocks */
>  	radeon_get_clock_info(rdev->ddev);
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r) {
> -			radeon_agp_disable(rdev);
> -		}
> -	}
>  	/* initialize memory controller */
>  	rv515_mc_init(rdev);
>  	rv515_debugfs(rdev);
> @@ -703,7 +695,6 @@ int rv515_init(struct radeon_device *rdev)
>  		radeon_ib_pool_fini(rdev);
>  		radeon_irq_kms_fini(rdev);
>  		rv370_pcie_gart_fini(rdev);
> -		radeon_agp_fini(rdev);
>  		rdev->accel_working =3D false;
>  	}
>  	return 0;
> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv=
770.c
> index 21f653ae1e1b..20bf54266f24 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -1943,12 +1943,6 @@ int rv770_init(struct radeon_device *rdev)
>  	r =3D radeon_fence_driver_init(rdev);
>  	if (r)
>  		return r;
> -	/* initialize AGP */
> -	if (rdev->flags & RADEON_IS_AGP) {
> -		r =3D radeon_agp_init(rdev);
> -		if (r)
> -			radeon_agp_disable(rdev);
> -	}
>  	r =3D rv770_mc_init(rdev);
>  	if (r)
>  		return r;
> @@ -2015,7 +2009,6 @@ void rv770_fini(struct radeon_device *rdev)
>  	r600_vram_scratch_fini(rdev);
>  	radeon_gem_fini(rdev);
>  	radeon_fence_driver_fini(rdev);
> -	radeon_agp_fini(rdev);
>  	radeon_bo_fini(rdev);
>  	radeon_atombios_fini(rdev);
>  	kfree(rdev->bios);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NbA2eOA4R5k0IXPLJryz8nnkswo7VcVPO--

--0pBMGTWQsV6s2HpzTYNLFGIWqImJ3CuU9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl666PEACgkQaA3BHVML
eiO8NQf/S3fe6dJBGCPXrOelimQpQz3gewcGkiBKIwC1bSqMocbIUNqxQEu2H0QE
I/flHE0nfA1fQe+9+LgIkY2ezKYtg9NWh7xSPsyh7GsDULyxLrFdMTa8RLleXj9f
iQaPNSy/3CmV4C7J1JRgvazlGhDSpO39M0sX/l7tZNNGQDNLNhOsuerNfJ9wjt+U
s8o7P65nCfuVFp1jGlUzr7YM3EIrvAOHZCZeqXU7kDVkyNzat9elO/a2JaTr9v7l
JmEqdZZCTKJv197ZXKqvbwlBhcvMowQhhkvQ7C6q9WSWthDLAqgfufSUxKR1pxeW
iJMYc2nR4aXqgi6ao8fU6gg4Dzh67Q==
=uj40
-----END PGP SIGNATURE-----

--0pBMGTWQsV6s2HpzTYNLFGIWqImJ3CuU9--

--===============1343129628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1343129628==--
