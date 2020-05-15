Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED61D4DA9
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 14:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157166EC8B;
	Fri, 15 May 2020 12:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CF16EC8B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:27:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFC5EB13C;
 Fri, 15 May 2020 12:27:22 +0000 (UTC)
Subject: Re: [PATCH v2 00/38] Fareless gem_free_object
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Message-ID: <088758a8-51bc-b978-a821-6bbfe2b7798d@suse.de>
Date: Fri, 15 May 2020 14:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2102174956=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2102174956==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yNdX7e2BCAHkSQYfngaJUaL008xnTVGbg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yNdX7e2BCAHkSQYfngaJUaL008xnTVGbg
Content-Type: multipart/mixed; boundary="mpuwfbY7z1jJwOi9wxoKAriIfL8BaQJ4Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <088758a8-51bc-b978-a821-6bbfe2b7798d@suse.de>
Subject: Re: [PATCH v2 00/38] Fareless gem_free_object
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>

--mpuwfbY7z1jJwOi9wxoKAriIfL8BaQJ4Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I have reviewed some of these patches. For the rest of the series you
can add

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

Am 15.05.20 um 11:50 schrieb Emil Velikov:
> Hi all,
>=20
> Here is v2 of the series, with the requested minor tweaks.
>=20
>  - Add new WARNING in the struct_mutex doc (Daniel)
>  - Drop a few more struct_mutex references (Daniel)
>  - Missing space in the drm_object_put doc (Jani)
>  - Keep drm_object_put_unlocked removal as separate patch (Sam, Thomas)=

>=20
> Considering other have pending work, which may clash with this series
> and the overall positive feedback (thanks everyone), I'm inclined to
> merge the series to drm-misc-next on Monday evening.
>=20
> -Emil
>=20
> Emil Velikov (38):
>   drm: remove unused drm_gem.h include
>   drm/gem: use _unlocked reference in drm_gem_objects_lookup docs
>   drm/todo: mention i915 in the struct_mutex section
>   drm/doc: drop struct_mutex references
>   drm/doc: add WARNING for drm_device::struct_mutex
>   drm/doc: drop struct_mutex reference for drm_gem_object_free
>   drm/amdgpu: use the unlocked drm_gem_object_put
>   drm/gma500: Use lockless gem BO free callback
>   drm: remove drm_driver::gem_free_object
>   drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_object_put()
>   drm/gem: add _locked suffix to drm_object_put
>   drm/gem: add drm_object_put helper
>   drm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/amd: remove _unlocked suffix in drm_object_put_unlocked
>   drm/arm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/armada: remove _unlocked suffix in drm_object_put_unlocked
>   drm/etnaviv: remove _unlocked suffix in drm_object_put_unlocked
>   drm/exynos: remove _unlocked suffix in drm_object_put_unlocked
>   drm/gma500: remove _unlocked suffix in drm_object_put_unlocked
>   drm/i915: remove _unlocked suffix in drm_object_put_unlocked
>   drm/lima: remove _unlocked suffix in drm_object_put_unlocked
>   drm/mediatek: remove _unlocked suffix in drm_object_put_unlocked
>   drm/mgag200: remove _unlocked suffix in drm_object_put_unlocked
>   drm/msm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/nouveau: remove _unlocked suffix in drm_object_put_unlocked
>   drm/omapdrm: remove _unlocked suffix in drm_object_put_unlocked
>   drm/panfrost: remove _unlocked suffix in drm_object_put_unlocked
>   drm/qxl: remove _unlocked suffix in drm_object_put_unlocked
>   drm/radeon: remove _unlocked suffix in drm_object_put_unlocked
>   drm/rockchip: remove _unlocked suffix in drm_object_put_unlocked
>   drm/tegra: remove _unlocked suffix in drm_object_put_unlocked
>   drm/v3d: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vc4: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vgem: remove _unlocked suffix in drm_object_put_unlocked
>   drm/virtio: remove _unlocked suffix in drm_object_put_unlocked
>   drm/vkms: remove _unlocked suffix in drm_object_put_unlocked
>   drm/xen: remove _unlocked suffix in drm_object_put_unlocked
>   drm: remove transient drm_object_put_unlocked()
>=20
>  Documentation/gpu/drm-mm.rst                  |  5 +-
>  Documentation/gpu/todo.rst                    |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 20 +++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  6 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  6 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |  6 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
>  drivers/gpu/drm/armada/armada_crtc.c          |  8 +--
>  drivers/gpu/drm/armada/armada_fb.c            |  4 +-
>  drivers/gpu/drm/armada/armada_fbdev.c         |  6 +-
>  drivers/gpu/drm/armada/armada_gem.c           | 10 +--
>  drivers/gpu/drm/drm_client.c                  |  2 +-
>  drivers/gpu/drm/drm_gem.c                     | 70 +++++--------------=

>  drivers/gpu/drm/drm_gem_cma_helper.c          |  8 +--
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  6 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  4 +-
>  drivers/gpu/drm/drm_gem_ttm_helper.c          |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         | 10 +--
>  drivers/gpu/drm/drm_prime.c                   |  6 +-
>  drivers/gpu/drm/drm_vm.c                      |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  8 +--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  6 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.h       |  2 +-
>  drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
>  drivers/gpu/drm/gma500/gem.c                  |  2 +-
>  drivers/gpu/drm/gma500/gma_display.c          |  6 +-
>  drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
>  drivers/gpu/drm/lima/lima_gem.c               | 10 +--
>  drivers/gpu/drm/lima/lima_sched.c             |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c      |  8 +--
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c            |  2 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |  8 +--
>  drivers/gpu/drm/msm/msm_fb.c                  |  4 +-
>  drivers/gpu/drm/msm/msm_gem.c                 | 18 ++---
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c                 |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  8 +--
>  drivers/gpu/drm/nouveau/nouveau_gem.c         | 14 ++--
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c             |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c            |  4 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 10 +--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  4 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  4 +-
>  drivers/gpu/drm/qxl/qxl_cmd.c                 |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
>  drivers/gpu/drm/qxl/qxl_dumb.c                |  2 +-
>  drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
>  drivers/gpu/drm/qxl/qxl_ioctl.c               |  4 +-
>  drivers/gpu/drm/qxl/qxl_object.c              |  4 +-
>  drivers/gpu/drm/radeon/radeon_cs.c            |  2 +-
>  drivers/gpu/drm/radeon/radeon_cursor.c        |  6 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  8 +--
>  drivers/gpu/drm/radeon/radeon_fb.c            |  4 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           | 30 ++++----
>  drivers/gpu/drm/radeon/radeon_object.c        |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
>  drivers/gpu/drm/tegra/drm.c                   | 12 ++--
>  drivers/gpu/drm/tegra/fb.c                    |  6 +-
>  drivers/gpu/drm/tegra/gem.c                   |  4 +-
>  drivers/gpu/drm/v3d/v3d_bo.c                  |  6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 |  4 +-
>  drivers/gpu/drm/v3d/v3d_irq.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                  | 14 ++--
>  drivers/gpu/drm/vc4/vc4_gem.c                 | 14 ++--
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +-
>  drivers/gpu/drm/vgem/vgem_drv.c               |  6 +-
>  drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |  6 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  6 +-
>  drivers/gpu/drm/vkms/vkms_gem.c               |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front.c           |  4 +-
>  include/drm/drm_device.h                      |  3 +
>  include/drm/drm_drv.h                         | 10 ---
>  include/drm/drm_gem.h                         | 27 +++----
>  100 files changed, 271 insertions(+), 327 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mpuwfbY7z1jJwOi9wxoKAriIfL8BaQJ4Q--

--yNdX7e2BCAHkSQYfngaJUaL008xnTVGbg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6+iqcACgkQaA3BHVML
eiMWMQf/fLIgqv4thrHeAThclRFjMRLE37pJyYHhyZxe8LS6NnQra1JkQ4eoXPvS
QNSenkT62fUbCCVcnSV2ja4p8C3MFNbf6K9VJklrYVJRh1gxw7aNX40aocBBmtPx
98/V9pqvC/e9g85y9g47I2k7lpR/KHYQmFveAaUKXv4gtjx6oR5F3YT26iIX2TKu
xlf4sTRC+PrO9AKqx2HkLnGqKS8rVu8tjt5w+RioUFc7rnmG5bhAp2NUsr3KLWQL
IZzVDCNkFUhx3TRHdspQI+Fr8vIeoGlvf5fq7ukPDQrxJQ3JbclV+4mkLfhwZ3Qy
0T/GRH7ZOE27+YbT8QrKCtQVyZW+bA==
=1sQ2
-----END PGP SIGNATURE-----

--yNdX7e2BCAHkSQYfngaJUaL008xnTVGbg--

--===============2102174956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2102174956==--
