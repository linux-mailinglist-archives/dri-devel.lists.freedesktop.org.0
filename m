Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C315D492
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44C06F8DD;
	Fri, 14 Feb 2020 09:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCA76E57A;
 Fri, 14 Feb 2020 09:19:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9EB32B1AA;
 Fri, 14 Feb 2020 09:19:29 +0000 (UTC)
Subject: Re: [RFC PATCH 0/6] do not store GPU address in TTM
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200213120203.29368-1-nirmoy.das@amd.com>
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
Message-ID: <f536d419-9fe3-97c0-0abd-2fb5b26c891a@suse.de>
Date: Fri, 14 Feb 2020 10:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1717052608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1717052608==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SRBP2UyuM59cFR3edbw6izyOmNDxYJaHx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SRBP2UyuM59cFR3edbw6izyOmNDxYJaHx
Content-Type: multipart/mixed; boundary="tDwvXPjsTOTgHFADmDEs3YTnlecgJM5vx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Message-ID: <f536d419-9fe3-97c0-0abd-2fb5b26c891a@suse.de>
Subject: Re: [RFC PATCH 0/6] do not store GPU address in TTM
References: <20200213120203.29368-1-nirmoy.das@amd.com>
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>

--tDwvXPjsTOTgHFADmDEs3YTnlecgJM5vx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.02.20 um 13:01 schrieb Nirmoy Das:
> With this patch series I am trying to remove GPU address dependency in
> TTM and moving GPU address calculation to individual drm drivers.
> This is required[1] to continue the work started by Brian Welty to crea=
te
> struct drm_mem_region which can be leverage by DRM cgroup controller to=
 manage memory
> limits.
>=20
>=20
> I have only manage to test amdgpu driver as I only have GPU for that.
> I might be doing something really stupid while calculeting gpu offset f=
or
> some of the drivers so please be patient and let me know how can I impr=
ove
> that.
>=20
> [1] https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg272=
238.html
>=20
> Nirmoy Das (6):
>   drm/amdgpu: move ttm bo->offset to amdgpu_bo
>   drm/radeon: don't use ttm bo->offset
>   drm/vmwgfx: don't use ttm bo->offset
>   drm/nouveau: don't use ttm bo->offset
>   drm/qxl: don't use ttm bo->offset
>   drm/ttm: do not keep GPU dependent addresses

I think VRAM helpers are missing from this patchset. [1] You can use
bochs in qemu to test them.

Best regards
Thomas

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_gem_vram_helper.c?h=3Dv5.6-rc1#n217

>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----=

>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 ++---
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 ++---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 +++---
>  drivers/gpu/drm/nouveau/nouveau_bo.c        |  1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++----
>  drivers/gpu/drm/qxl/qxl_drv.h               |  6 ++---
>  drivers/gpu/drm/qxl/qxl_kms.c               |  3 +++
>  drivers/gpu/drm/qxl/qxl_object.h            |  5 ----
>  drivers/gpu/drm/qxl/qxl_ttm.c               |  9 -------
>  drivers/gpu/drm/radeon/radeon.h             |  1 +
>  drivers/gpu/drm/radeon/radeon_object.h      | 16 +++++++++++-
>  drivers/gpu/drm/radeon/radeon_ttm.c         |  4 +--
>  drivers/gpu/drm/ttm/ttm_bo.c                |  7 -----
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  2 --
>  include/drm/ttm/ttm_bo_api.h                |  2 --
>  include/drm/ttm/ttm_bo_driver.h             |  1 -
>  33 files changed, 99 insertions(+), 72 deletions(-)
>=20
> --
> 2.25.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--tDwvXPjsTOTgHFADmDEs3YTnlecgJM5vx--

--SRBP2UyuM59cFR3edbw6izyOmNDxYJaHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5GZh8ACgkQaA3BHVML
eiPTBwgAr/jlTykHDqF7eY+nhC72kGXczdwRNy/tse0r5FyOkI6BUGXoKJniOcOo
CPIY8/fOIwWlQRp+KtxkNfv2dreF/baw1DAj/4tLxmtPyb2Hr0aluw9R1cQ4+Y1n
ZRjviy/Qtp/oF4ULdWTxNYkyI5kU4TliHPQeSGW3SQ2CzipoG7tyd0MXe/x6fQi/
0GcITpNPBkIFqxm8oEj6/BNO6n6tmYTHOUFBs7GtCqDA0yKSWZCpeId588jUj8t2
Lyjo5ZhFk1K7PQ/OgtBy/0WU9/RdzAYAVJzKG8Cxwq/RXlc2Je2t0b/2Ma76E/w2
NabWE7Tczo0wubc/OswpuZNL4sd5OA==
=aufy
-----END PGP SIGNATURE-----

--SRBP2UyuM59cFR3edbw6izyOmNDxYJaHx--

--===============1717052608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1717052608==--
