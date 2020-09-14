Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40772268EFE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 17:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579E56E30F;
	Mon, 14 Sep 2020 15:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960FB89F2A;
 Mon, 14 Sep 2020 15:05:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FFDAB1DD;
 Mon, 14 Sep 2020 15:06:10 +0000 (UTC)
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
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
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
Date: Mon, 14 Sep 2020 17:05:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0525593728=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0525593728==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f
Content-Type: multipart/mixed; boundary="zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx";
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
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <c445493b-9914-63f2-1cf2-c3c1de14e3e5@suse.de>
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
 <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
In-Reply-To: <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>

--zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:22 schrieb Christian K=C3=B6nig:
> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap=
,
>> which is non-trivial to convert.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
>> =C2=A0 2 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 81a79760ca61..51525b8774c9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver =3D {
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
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 43f4966331dd..ca2b79f94e99 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -36,6 +36,7 @@
>> =C2=A0 #include <drm/amdgpu_drm.h>
>> =C2=A0 #include <drm/drm_cache.h>
>> =C2=A0 #include "amdgpu.h"
>> +#include "amdgpu_dma_buf.h"
>> =C2=A0 #include "amdgpu_trace.h"
>> =C2=A0 #include "amdgpu_amdkfd.h"
>> =C2=A0 @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
>> =C2=A0 #endif
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
>=20
> Wrong file, this belongs into amdgpu_gem.c
>=20
>> =C2=A0 static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo_param *=
bp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo **bo_pt=
r)
>> @@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct
>> amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D kzalloc(sizeof(struct amdgpu_bo)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> +
>> +=C2=A0=C2=A0=C2=A0 bo->tbo.base.funcs =3D &amdgpu_gem_object_funcs;
>=20
> And this should probably go into amdgpu_gem_object_create().

I'm trying to understand what amdgpu does.  What about all the places
where amdgpu calls amdgpu_bo_create() internally? Wouldn't these miss
the free callback for the GEM object?

Best regards
Thomas

>=20
> Apart from that looks like a good idea to me.
>=20
> Christian.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(adev->ddev,=
 &bo->tbo.base, size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&bo->shadow_list);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->vm_bo =3D NULL;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zniUnHMaoWytGRm2jwIkKjV0oPt2fa9bx--

--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9fhs0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPJNAgAlfJhPTx8SHwyCGcF7SoXCxqFUag5
/hXG2aWBOQj0PGNIWjEqH/FwrQApUbBmpbBWXncgOJjyevY1bY3RXSi+ibAW263g
1lb0Cf5fR55oudCzfJIiQhM5nXHpnbDTdEq1kVtVf4mD3cn1eyPWtOgpXIklFs+w
YSnklFEtZsXQnHs9whrVXf1UPUoecKtVRfIflZBfGttuRdODIknW+9iFA/+QYggh
4WsKIHEpME3IpnfYOqS6yZ3oqcKeROalr2HZ6EUy/NaixshxCZxnLQVMNWx7saKP
aygn2TEK3CwcBwiYGlPcx3/VFCRdviSNuxDmkZ5CV3ceT5gUjE0suBVVaA==
=QxSN
-----END PGP SIGNATURE-----

--MeVdSsKebthdc7DC8hvgqWlLwpjnz0H9f--

--===============0525593728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0525593728==--
