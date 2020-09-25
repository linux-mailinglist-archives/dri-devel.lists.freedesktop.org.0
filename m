Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A42782F6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3396EC55;
	Fri, 25 Sep 2020 08:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FBF6E0D7;
 Fri, 25 Sep 2020 08:40:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75502ACAC;
 Fri, 25 Sep 2020 08:40:15 +0000 (UTC)
Subject: Re: [PATCH v3 00/22] Convert all remaining drivers to GEM object
 functions
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
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
References: <20200923102159.24084-1-tzimmermann@suse.de>
 <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6c6b429c-8f74-99f3-73de-920dad26197a@suse.de>
Date: Fri, 25 Sep 2020 10:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1283307012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1283307012==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb
Content-Type: multipart/mixed; boundary="YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7";
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
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <6c6b429c-8f74-99f3-73de-920dad26197a@suse.de>
Subject: Re: [PATCH v3 00/22] Convert all remaining drivers to GEM object
 functions
References: <20200923102159.24084-1-tzimmermann@suse.de>
 <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>
In-Reply-To: <f6ee9aab-1568-1896-ef07-a4de6ceec989@amd.com>

--YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.09.20 um 16:33 schrieb Christian K=C3=B6nig:
> Feel free to add an Acked-by: Christian K=C3=B6nig <christian.koenig@am=
d.com>
> to all patches which I haven't explicitly reviewed.

Done, thanks.

>=20
> I would say we should just push this to drm-misc-next now.

It's merged now.

Best regards
Thomas

>=20
> Thanks for the nice cleanup,
> Christian.
>=20
> Am 23.09.20 um 12:21 schrieb Thomas Zimmermann:
>> The GEM and PRIME related callbacks in struct drm_driver are
>> deprecated in
>> favor of GEM object functions in struct drm_gem_object_funcs. This
>> patchset
>> converts the remaining drivers to object functions and removes most of=

>> the
>> obsolete interfaces.
>>
>> Version 3 of this patchset mostly fixes drm_gem_prime_handle_to_fd and=

>> updates i.MX's dcss driver. The driver was missing from earlier versio=
ns
>> and still needs review.
>>
>> Patches #1 to #6, #8 to #17 and #19 to #20 convert DRM drivers to GEM
>> object
>> functions, one by one. Each patch moves existing callbacks from struct=

>> drm_driver to an instance of struct drm_gem_object_funcs, and sets the=
se
>> funcs when the GEM object is initialized. The expection is
>> .gem_prime_mmap.
>> There are different ways of how drivers implement the callback, and
>> moving
>> it to GEM object functions requires a closer review for each.
>>
>> Patch #18 fixes virtgpu to use GEM object functions where possible. Th=
e
>> driver recently introduced a function for one of the deprecated
>> callbacks.
>>
>> Patches #7 and #20 convert i.MX's dcss and xlnx to CMA helper macros.
>> There's
>> no apparent reason why the drivers do the GEM setup on their's own.
>> Using CMA
>> helper macros adds GEM object functions implicitly.
>>
>> With most of the GEM and PRIME moved to GEM object functions, related
>> code
>> in struct drm_driver and in the DRM core/helpers is being removed by
>> patch
>> #22.
>>
>> Further testing is welcome. I tested the drivers for which I have HW
>> available. These are gma500, i915, nouveau, radeon and vc4. The consol=
e,
>> Weston and Xorg apparently work with the patches applied.
>>
>> v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0* restore default call to drm_gem_prime_export=
() in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_prime_handle_to_fd()
>> =C2=A0=C2=A0=C2=A0=C2=A0* return -ENOSYS if get_sg_table is not set
>> =C2=A0=C2=A0=C2=A0=C2=A0* drop all checks for obj->funcs
>> =C2=A0=C2=A0=C2=A0=C2=A0* clean up TODO list and documentation
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* moved code in amdgpu and radeon
>> =C2=A0=C2=A0=C2=A0=C2=A0* made several functions static in various dri=
vers
>> =C2=A0=C2=A0=C2=A0=C2=A0* updated TODO-list item
>> =C2=A0=C2=A0=C2=A0=C2=A0* fix virtgpu
>>
>> Thomas Zimmermann (22):
>> =C2=A0=C2=A0 drm/amdgpu: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/armada: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/etnaviv: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/exynos: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/gma500: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/i915: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/imx/dcss: Initialize DRM driver instance with CMA hel=
per macro
>> =C2=A0=C2=A0 drm/mediatek: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/msm: Introduce GEM object funcs
>> =C2=A0=C2=A0 drm/nouveau: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/omapdrm: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/pl111: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/radeon: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/rockchip: Convert to drm_gem_object_funcs
>> =C2=A0=C2=A0 drm/tegra: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/vc4: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/vgem: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/virtgpu: Set PRIME export function in struct drm_gem_=
object_funcs
>> =C2=A0=C2=A0 drm/vkms: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/xen: Introduce GEM object functions
>> =C2=A0=C2=A0 drm/xlnx: Initialize DRM driver instance with CMA helper =
macro
>> =C2=A0=C2=A0 drm: Remove obsolete GEM and PRIME callbacks from struct =
drm_driver
>>
>> =C2=A0 Documentation/gpu/drm-mm.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 4 +-
>> =C2=A0 Documentation/gpu/todo.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 9 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 --
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 23 +++--
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 --
>> =C2=A0 drivers/gpu/drm/armada/armada_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++-
>> =C2=A0 drivers/gpu/drm/armada/armada_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 53 ++++--------
>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
>> =C2=A0 drivers/gpu/drm/drm_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 14 +--
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 13 ---
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 ++++-
>> =C2=A0 drivers/gpu/drm/exynos/exynos_drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 ---
>> =C2=A0 drivers/gpu/drm/exynos/exynos_drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++++
>> =C2=A0 drivers/gpu/drm/gma500/framebuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/gma500/gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +=
++-
>> =C2=A0 drivers/gpu/drm/gma500/gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 +
>> =C2=A0 drivers/gpu/drm/gma500/psb_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/gma500/psb_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_object.c=C2=A0=C2=A0=C2=A0 | =
21 ++++-
>> =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_object.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 -
>> =C2=A0 drivers/gpu/drm/i915/i915_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 -
>> =C2=A0 .../gpu/drm/i915/selftests/mock_gem_device.c=C2=A0 |=C2=A0 3 -
>> =C2=A0 drivers/gpu/drm/imx/dcss/dcss-kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +--
>> =C2=A0 drivers/gpu/drm/mediatek/mtk_drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 5 --
>> =C2=A0 drivers/gpu/drm/mediatek/mtk_drm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 +++
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ---
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/msm/msm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++-
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 13 +++
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/nouveau/nouveau_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 --
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++-
>> =C2=A0 drivers/gpu/drm/omapdrm/omap_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/pl111/pl111_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
>> =C2=A0 drivers/gpu/drm/radeon/radeon_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +----
>> =C2=A0 drivers/gpu/drm/radeon/radeon_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 ++++++-
>> =C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_drv.c=C2=A0=C2=A0 |=C2=A0=
 5 --
>> =C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_gem.c=C2=A0=C2=A0 | 12 ++=
-
>> =C2=A0 drivers/gpu/drm/tegra/drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 -
>> =C2=A0 drivers/gpu/drm/tegra/gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 8 ++
>> =C2=A0 drivers/gpu/drm/vc4/vc4_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +=
+++-
>> =C2=A0 drivers/gpu/drm/vc4/vc4_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ---
>> =C2=A0 drivers/gpu/drm/vc4/vc4_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/vgem/vgem_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++--
>> =C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/virtio/virtgpu_object.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/vkms/vkms_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 --
>> =C2=A0 drivers/gpu/drm/vkms/vkms_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 ++++------
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 drivers/gpu/drm/xen/xen_drm_front_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++++
>> =C2=A0 drivers/gpu/drm/xlnx/zynqmp_dpsub.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +--
>> =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 85 +------------------
>> =C2=A0 include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 59 files changed, 333 insertions(+), 375 deletions(-)
>>
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YrgllsXxrG3yDVk9eYt3PnZ2tiJ3YeTQ7--

--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9trOsUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOxhwgAkAYiN5cpH8HCfFm3pzUjLe2BtrJz
k+Vt8Wd5qvXc3y7iQBBR9qx0E6z51ZNcxHhULFx+Wyw10/EVyYFJHNJO2440itG5
nHcvl5zihIXi5kx82/2AhYI0rWUDgvkNFz4tiqTYfdyEFW2RWBYNb0cAhJPGpVQN
7GRODf0jQdkZK3W79ZKSzjqq2lx3dlwviA0EYCWhe6yKDyUXC9/3oWiJlmf4Mlp5
mHUlNVt+QVbdOxtYtGJ9nBC6iRxS2xUPfAVJPTPELlCphnxroZPrkNd1x+O+zMNv
5giRN+hDTtrRwlH+XPkgqtpwt/LD2tMSFBAZscDhhifadDzYXOKCgjfQvg==
=AWHl
-----END PGP SIGNATURE-----

--LabGFb9cZphJ6FpQUA9KWxOwS9aPh02zb--

--===============1283307012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1283307012==--
