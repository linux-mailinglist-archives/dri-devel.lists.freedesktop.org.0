Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AE243768
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987A06E979;
	Thu, 13 Aug 2020 09:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9176E977;
 Thu, 13 Aug 2020 09:13:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 328C2B601;
 Thu, 13 Aug 2020 09:13:32 +0000 (UTC)
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-7-tzimmermann@suse.de> <877du2j4lf.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ce599990-7b0e-d0b1-8df2-ae3499560510@suse.de>
Date: Thu, 13 Aug 2020 11:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877du2j4lf.fsf@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1373960787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1373960787==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy
Content-Type: multipart/mixed; boundary="yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <ce599990-7b0e-d0b1-8df2-ae3499560510@suse.de>
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-7-tzimmermann@suse.de> <877du2j4lf.fsf@intel.com>
In-Reply-To: <877du2j4lf.fsf@intel.com>

--yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 11:08 schrieb Jani Nikula:
> On Thu, 13 Aug 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in i915.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c       |  9 ++++++++-
>>  drivers/gpu/drm/i915/i915_drv.c                  | 10 ++++++----
>>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>>  drivers/gpu/drm/i915/selftests/mock_gem_device.c |  3 ---
>>  4 files changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/=
drm/i915/gem/i915_gem_object.c
>> index c8421fd9d2dc..bc15ee4f2bd5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -41,7 +41,14 @@ static struct i915_global_object {
>> =20
>>  struct drm_i915_gem_object *i915_gem_object_alloc(void)
>>  {
>> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
>> +	struct drm_i915_gem_object *obj;
>> +
>> +	obj =3D kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
>> +	if (!obj)
>> +		return NULL;
>> +	obj->base.funcs =3D &i915_gem_object_funcs;
>> +
>> +	return obj;
>>  }
>> =20
>>  void i915_gem_object_free(struct drm_i915_gem_object *obj)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i9=
15_drv.c
>> index 068447f565a9..b09eee11c540 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -1840,6 +1840,12 @@ static const struct drm_ioctl_desc i915_ioctls[=
] =3D {
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DR=
M_RENDER_ALLOW),
>>  };
>> =20
>> +const struct drm_gem_object_funcs i915_gem_object_funcs =3D {
>> +	.free =3D i915_gem_free_object,
>> +	.close =3D i915_gem_close_object,
>> +	.export =3D i915_gem_prime_export,
>> +};
>> +
>=20
> Any reason not to make this static in i915_gem_object.c next to its onl=
y
> user?

That is just an oversight. Will be fixed in the next iteration. Thanks.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20
>>  static struct drm_driver driver =3D {
>>  	/* Don't use MTRRs here; the Xserver or userspace app should
>>  	 * deal with them for Intel hardware.
>> @@ -1853,12 +1859,8 @@ static struct drm_driver driver =3D {
>>  	.lastclose =3D i915_driver_lastclose,
>>  	.postclose =3D i915_driver_postclose,
>> =20
>> -	.gem_close_object =3D i915_gem_close_object,
>> -	.gem_free_object_unlocked =3D i915_gem_free_object,
>> -
>>  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_export =3D i915_gem_prime_export,
>>  	.gem_prime_import =3D i915_gem_prime_import,
>> =20
>>  	.dumb_create =3D i915_gem_dumb_create,
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h
>> index bacb4c762f5b..666db65fe69e 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1736,6 +1736,7 @@ intel_ggtt_update_needs_vtd_wa(struct drm_i915_p=
rivate *dev_priv)
>> =20
>>  /* i915_drv.c */
>>  extern const struct dev_pm_ops i915_pm_ops;
>> +extern const struct drm_gem_object_funcs i915_gem_object_funcs;
>> =20
>>  int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_i=
d *ent);
>>  void i915_driver_remove(struct drm_i915_private *i915);
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/driver=
s/gpu/drm/i915/selftests/mock_gem_device.c
>> index ce4d4303229c..4725dad63e0a 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -86,9 +86,6 @@ static struct drm_driver mock_driver =3D {
>>  	.name =3D "mock",
>>  	.driver_features =3D DRIVER_GEM,
>>  	.release =3D mock_device_release,
>> -
>> -	.gem_close_object =3D i915_gem_close_object,
>> -	.gem_free_object_unlocked =3D i915_gem_free_object,
>>  };
>> =20
>>  static void release_dev(struct device *dev)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yYJlHp22f67rhAArb1qx5xbB6QTfa6gjL--

--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81BCAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiN1ywf/TqGV8rsRsYb3ww1QippHM0DMEqo+
g5vm+Ctnvb+7yYo55pBoy8VEA970jCg0p6DPFL/qs1Tgtbcz3OD7CTs31iLaYKHU
ERKsFVmG/Hu80m0rBZDTZkRoTxqe3YdsVWT0f5Xit6uCvLLVC3A7bkuVP7CmMC6p
F4csWP6RkD3FCCqZQTSgCJqnhy2Y3BuD3oeVumqDUfeLWSf8fh3cd45Oy3vn990a
L8lS7mR1NTADuYO/AmVtxTgU42KttCnazOpd79Zluy8poPpVtfKdGp1sKdLuUKWf
yNcvr8w6ucWFKZ6eqBOVGvTgmNIsF1v1JXcFuizVX8HnDY0pSs27p4kt3w==
=BuPp
-----END PGP SIGNATURE-----

--2y1rj4S6iEPyEIbObjrxB2iAqUSpEnhqy--

--===============1373960787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1373960787==--
