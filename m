Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7B26D4E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3F16E9BE;
	Thu, 17 Sep 2020 07:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ED46E186;
 Thu, 17 Sep 2020 07:40:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C72DEAB5C;
 Thu, 17 Sep 2020 07:40:49 +0000 (UTC)
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
 <835ba167-3576-1af6-5421-552075588796@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <41eebda8-bf90-7b5c-8af2-e96b8fd0cea2@suse.de>
Date: Thu, 17 Sep 2020 09:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <835ba167-3576-1af6-5421-552075588796@amd.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0193263870=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0193263870==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0
Content-Type: multipart/mixed; boundary="mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <41eebda8-bf90-7b5c-8af2-e96b8fd0cea2@suse.de>
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
 <835ba167-3576-1af6-5421-552075588796@amd.com>
In-Reply-To: <835ba167-3576-1af6-5421-552075588796@amd.com>

--mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.09.20 um 17:05 schrieb Christian K=C3=B6nig:
> Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap=
,
>> which is non-trivial to convert.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* move object-function instance to amdgpu_gem.=
c (Christian)
>> =C2=A0=C2=A0=C2=A0=C2=A0* set callbacks in amdgpu_gem_object_create() =
(Christian)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0 | 23 =
+++++++++++++++++-----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 -----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |=C2=A0 1 +
>> =C2=A0 4 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 6edde2b9e402..840ca8f9c1e1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lastclose =3D amdgpu_driver_lastclose_=
kms,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irq_handler =3D amdgpu_irq_handler,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctls =3D amdgpu_ioctls_kms,
>> -=C2=A0=C2=A0=C2=A0 .gem_free_object_unlocked =3D amdgpu_gem_object_fr=
ee,
>> -=C2=A0=C2=A0=C2=A0 .gem_open_object =3D amdgpu_gem_object_open,
>> -=C2=A0=C2=A0=C2=A0 .gem_close_object =3D amdgpu_gem_object_close,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_create =3D amdgpu_mode_dumb_creat=
e,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_map_offset =3D amdgpu_mode_dumb_m=
map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &amdgpu_driver_kms_fops,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_=
prime_handle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_export =3D amdgpu_gem_prime_export,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import =3D amdgpu_gem_prime_=
import,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vmap =3D amdgpu_gem_prime_vmap,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vunmap =3D amdgpu_gem_prime_vunmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D amdgpu_gem_prime_mm=
ap,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index aa7f230c71bf..aeecd5dc3ce4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -36,9 +36,12 @@
>> =C2=A0 =C2=A0 #include "amdgpu.h"
>> =C2=A0 #include "amdgpu_display.h"
>> +#include "amdgpu_dma_buf.h"
>> =C2=A0 #include "amdgpu_xgmi.h"
>> =C2=A0 -void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
>> +
>> +static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj =3D gem_to_amdgp=
u_bo(gobj);
>> =C2=A0 @@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_de=
vice
>> *adev, unsigned long size,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *obj =3D &bo->tbo.base;
>> +=C2=A0=C2=A0=C2=A0 (*obj)->funcs =3D &amdgpu_gem_object_funcs;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> @@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device=

>> *adev)
>> =C2=A0=C2=A0 * Call from drm_gem_handle_create which appear in both ne=
w and open
>> ioctl
>> =C2=A0=C2=A0 * case.
>> =C2=A0=C2=A0 */
>> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> +static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *abo =3D gem_to_amdgpu=
_bo(obj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_t=
tm_adev(abo->tbo.bdev);
>> @@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object
>> *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 -void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> +static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)=

>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_=
bo(obj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_t=
tm_adev(bo->tbo.bdev);
>> @@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct
>> drm_gem_object *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_eu_backoff_reservation(&ticket, &li=
st);
>> =C2=A0 }
>> =C2=A0 +static const struct drm_gem_object_funcs amdgpu_gem_object_fun=
cs =3D {
>> +=C2=A0=C2=A0=C2=A0 .free =3D amdgpu_gem_object_free,
>> +=C2=A0=C2=A0=C2=A0 .open =3D amdgpu_gem_object_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D amdgpu_gem_object_close,
>> +=C2=A0=C2=A0=C2=A0 .export =3D amdgpu_gem_prime_export,
>> +=C2=A0=C2=A0=C2=A0 .vmap =3D amdgpu_gem_prime_vmap,
>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D amdgpu_gem_prime_vunmap,
>> +};
>> +
>> =C2=A0 /*
>> =C2=A0=C2=A0 * GEM ioctls.
>> =C2=A0=C2=A0 */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> index e0f025dd1b14..637bf51dbf06 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> @@ -33,11 +33,6 @@
>> =C2=A0 #define AMDGPU_GEM_DOMAIN_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3
>> =C2=A0 #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct
>> amdgpu_bo, tbo.base)
>> =C2=A0 -void amdgpu_gem_object_free(struct drm_gem_object *obj);
>> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> -void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> =C2=A0 unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
>> =C2=A0 =C2=A0 /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index ac043baac05d..c4e82a8fa53f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -561,6 +561,7 @@ static int amdgpu_bo_do_create(struct
>> amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D kzalloc(sizeof(struct amdgpu_bo)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> +
>=20
> The newline is not unrelated.
>=20
> Apart from that the patch is Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>=20
> But I think we need some smoke testing of it.

I gave it a try on the HW/drivers that I listed in the cover letter.
Appears to be working there. There was a bug reported by CI that will be
fixed in the next iteration.

Best regards
Thomas

>=20
> Christian.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(adev_to_drm=
(adev), &bo->tbo.base,
>> size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&bo->shadow_list);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->vm_bo =3D NULL;
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub--

--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jEuwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPyiggAh/BO7SFe5ZVkcBfrX0+omcib+uvq
wUfAVwNVPgP4GrDtDXLr4zKuk59o62DKt31reEMSrNQm0ZVv4oYlt9YTXUIBc0fb
Kfg1G/YdZEH4gl6Xnb1Y6bhK0lFKESQonYcCM20uUfgcfhIL71bxo6IQzNkLLXNl
Gvbkj8qnJhHFWO8PunW5ufHbKHG+ywye5TnGplv1ubKtNKZuIbC+3zb7gf/+ysCT
+8ttQ5BqdlF1Mc31bYqBTR0GwyfdofspCeDjdA6jDGN3Wq2Be+Y/E6/Pt7ANwWn8
+pRLfFQYnt1aj5BKBvxQ4zLmOtqu3DJtik5oXtau5wp3407kMunsBYib0A==
=Cl71
-----END PGP SIGNATURE-----

--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0--

--===============0193263870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0193263870==--
