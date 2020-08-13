Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E755B2438C7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2516E1F9;
	Thu, 13 Aug 2020 10:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5A46E1F9;
 Thu, 13 Aug 2020 10:41:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFEBFB66A;
 Thu, 13 Aug 2020 10:42:15 +0000 (UTC)
Subject: Re: [PATCH 12/20] drm/radeon: Introduce GEM object functions
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
 <20200813083644.31711-13-tzimmermann@suse.de>
 <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5372b2ef-b7cf-f4e9-9199-6dee5bf6696f@suse.de>
Date: Thu, 13 Aug 2020 12:41:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1068910524=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1068910524==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dvpyWKt9GfZXVkJReqmxwaKg1xVlNTKmH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dvpyWKt9GfZXVkJReqmxwaKg1xVlNTKmH
Content-Type: multipart/mixed; boundary="oRxCNe57YCRejXLT0jiYdnWGOkpGgvM5x";
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
Message-ID: <5372b2ef-b7cf-f4e9-9199-6dee5bf6696f@suse.de>
Subject: Re: [PATCH 12/20] drm/radeon: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-13-tzimmermann@suse.de>
 <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>
In-Reply-To: <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>

--oRxCNe57YCRejXLT0jiYdnWGOkpGgvM5x
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 12:24 schrieb Christian K=C3=B6nig:
> Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in radeon.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/radeon/radeon_drv.c=C2=A0=C2=A0=C2=A0 | 23 +---=
-------------------
>> =C2=A0 drivers/gpu/drm/radeon/radeon_object.c | 26 +++++++++++++++++++=
+++++++
>> =C2=A0 2 files changed, 27 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c
>> b/drivers/gpu/drm/radeon/radeon_drv.c
>> index 4cd30613fa1d..65061c949aee 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct
>> drm_device *dev);
>> =C2=A0 int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
>> =C2=A0 void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
>> =C2=A0 irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
>> -void radeon_gem_object_free(struct drm_gem_object *obj);
>> -int radeon_gem_object_open(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> -void radeon_gem_object_close(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> -struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int flags);
>> =C2=A0 extern int radeon_get_crtc_scanoutpos(struct drm_device *dev,
>> unsigned int crtc,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsign=
ed int flags, int *vpos, int *hpos,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_=
t *stime, ktime_t *etime,
>> @@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>> =C2=A0 int radeon_mode_dumb_create(struct drm_file *file_priv,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mode_create_dumb *args);
>> -struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object
>> *obj);
>> =C2=A0 struct drm_gem_object *radeon_gem_prime_import_sg_table(struct
>> drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sg);
>> -int radeon_gem_prime_pin(struct drm_gem_object *obj);
>> -void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
>> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)=
;
>> =C2=A0 =C2=A0 /* atpx handler */
>> =C2=A0 #if defined(CONFIG_VGA_SWITCHEROO)
>> @@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_ioctl(filp, cmd, arg=
);
>> -=C2=A0=C2=A0=C2=A0
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_mark_last_busy(dev->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_put_autosuspend(dev->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> @@ -609,22 +597,13 @@ static struct drm_driver kms_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irq_uninstall =3D radeon_driver_irq_un=
install_kms,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irq_handler =3D radeon_driver_irq_hand=
ler_kms,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctls =3D radeon_ioctls_kms,
>> -=C2=A0=C2=A0=C2=A0 .gem_free_object_unlocked =3D radeon_gem_object_fr=
ee,
>> -=C2=A0=C2=A0=C2=A0 .gem_open_object =3D radeon_gem_object_open,
>> -=C2=A0=C2=A0=C2=A0 .gem_close_object =3D radeon_gem_object_close,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_create =3D radeon_mode_dumb_creat=
e,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_map_offset =3D radeon_mode_dumb_m=
map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &radeon_driver_kms_fops,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_=
prime_handle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_export =3D radeon_gem_prime_export,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_pin =3D radeon_gem_prime_pin,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_unpin =3D radeon_gem_prime_unpin,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_get_sg_table =3D radeon_gem_prime_get_s=
g_table,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import_sg_table =3D radeon_g=
em_prime_import_sg_table,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vmap =3D radeon_gem_prime_vmap,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vunmap =3D radeon_gem_prime_vunmap,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .desc =3D DRIVER_DESC,
>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c
>> b/drivers/gpu/drm/radeon/radeon_object.c
>> index bb7582afd803..882390e15dfe 100644
>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>> @@ -45,6 +45,19 @@ int radeon_ttm_init(struct radeon_device *rdev);
>> =C2=A0 void radeon_ttm_fini(struct radeon_device *rdev);
>> =C2=A0 static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>> =C2=A0 +void radeon_gem_object_free(struct drm_gem_object *obj);
>> +int radeon_gem_object_open(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> +void radeon_gem_object_close(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> +struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int flags);
>> +struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object
>> *obj);
>> +int radeon_gem_prime_pin(struct drm_gem_object *obj);
>> +void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>> +void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
>> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)=
;
>> +
>> =C2=A0 /*
>> =C2=A0=C2=A0 * To exclude mutual BO access we rely on bo_reserve exclu=
sion, as all
>> =C2=A0=C2=A0 * function are calling it.
>> @@ -180,6 +193,18 @@ void radeon_ttm_placement_from_domain(struct
>> radeon_bo *rbo, u32 domain)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 +static const struct drm_gem_object_funcs radeon_gem_object_fun=
cs =3D {
>> +=C2=A0=C2=A0=C2=A0 .free =3D radeon_gem_object_free,
>> +=C2=A0=C2=A0=C2=A0 .open =3D radeon_gem_object_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D radeon_gem_object_close,
>> +=C2=A0=C2=A0=C2=A0 .export =3D radeon_gem_prime_export,
>> +=C2=A0=C2=A0=C2=A0 .pin =3D radeon_gem_prime_pin,
>> +=C2=A0=C2=A0=C2=A0 .unpin =3D radeon_gem_prime_unpin,
>> +=C2=A0=C2=A0=C2=A0 .get_sg_table =3D radeon_gem_prime_get_sg_table,
>> +=C2=A0=C2=A0=C2=A0 .vmap =3D radeon_gem_prime_vmap,
>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D radeon_gem_prime_vunmap,
>> +};
>> +
>=20
> Same comment as for amdgpu, please put that into radeon_gem.c instead.

There's no good header file to put the declarations, right? I'm asking
because checkpatch warns about declarations in the source files.

Best regards
Thomas

>=20
> Christian.
>=20
>> =C2=A0 int radeon_bo_create(struct radeon_device *rdev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long size, int byte_align, bool kernel,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u32 domain, u32 flags, struct sg_table *sg,
>> @@ -209,6 +234,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D kzalloc(sizeof(struct radeon_bo)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> +=C2=A0=C2=A0=C2=A0 bo->tbo.base.funcs =3D &radeon_gem_object_funcs;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(rdev->ddev,=
 &bo->tbo.base, size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->rdev =3D rdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->surface_reg =3D -1;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oRxCNe57YCRejXLT0jiYdnWGOkpGgvM5x--

--dvpyWKt9GfZXVkJReqmxwaKg1xVlNTKmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81GO8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOA6ggAuUVnmM68uUP4+aYhVogVE45exMl2
eaX7AfXNkklfKJwgOpnqu8g00U134y52xRGfOU1teV/kar0YzgqlKL2Af+YLw5Yp
7QFKDQpwjXX+MQzei9GtyC9OMfz6nwQgt28MqaMrkaSPyIvqibwF4fzR/nXSTDCQ
1PpwCVQ1TWGST7SZFdUfHo+v3vdJuOyw0ucRceiJoEX4RQorEqFWXOHx/kR4Z1em
POPUqdQAxWu8nlX+VUsN9ga3/QtTQ82ZEKfinfr0+ZNobJDIMznNeNTA1uDOwi8O
RaXxxoYxdOEfvAZatFluUpOPE5T5zrt45Y1jpksTKhfmKPbSZ8ItAAqDhA==
=qHmz
-----END PGP SIGNATURE-----

--dvpyWKt9GfZXVkJReqmxwaKg1xVlNTKmH--

--===============1068910524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1068910524==--
