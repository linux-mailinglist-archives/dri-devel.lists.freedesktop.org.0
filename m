Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A847ABC34D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65E910E277;
	Mon, 19 May 2025 15:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePBT80xY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497C010E2F7;
 Mon, 19 May 2025 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747670246; x=1779206246;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=l+mteNSdDecqGv7wrPEgKgil/6iuC0qVUBLg28HQDTs=;
 b=ePBT80xYoX3Y37jOW3eR0brIXrarmUoXUrdAzHkMEtERmcO25HyXyIuJ
 cIbj88qrQj8c2wBW5HJ+jMdzrIXlPS/Y8RUJdur1l2B66+hxToGJsvQAL
 T7UmegzwgbOLeHD0OPL9MKJgV9QMrKJTY639yaRp0xDkeikGCfIvNkxIl
 Xwi6RUOO2nC4M7rgdZfxWRiuf8baSWgc1+EhFQ/ItEgg+8xYumxz35Lzq
 27fmBL8C8zhmehVmz5BaNdrpC8qmsCAmDLVJj1XcL2WRhjCX+DB0GPMJb
 hAN1VwJBwm28kLz0nojx1R5oYcvIxylzNcWLu6/mNXAxPcf78WrObFalI A==;
X-CSE-ConnectionGUID: RWBvYtadROK4iLHXv6o1jQ==
X-CSE-MsgGUID: vLdFXmRLQqGS+Lgj5rM9FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60211394"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60211394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:57:26 -0700
X-CSE-ConnectionGUID: m/Vb/VAQQXK+HXKhrJo2Iw==
X-CSE-MsgGUID: I5A+EdO0TW+4sbOMaTs5Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144663109"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.201])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:57:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [RFC 1/2] drm/i915: Expose local memory information via sysfs
In-Reply-To: <20250519153418.44543-2-krzysztof.niemiec@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <20250519153418.44543-2-krzysztof.niemiec@intel.com>
Date: Mon, 19 May 2025 18:57:20 +0300
Message-ID: <87wmactwyn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 May 2025, Krzysztof Niemiec <krzysztof.niemiec@intel.com> wrote:
> Introduce sysfs entries regarding basic local memory information
> (unallocated memory and total memory, for both the entire region and the
> CPU visible part). This simplifies how external tools might read this
> information, which at the point of writing this patch is only accessible
> via the i915_query() ioctl.
>
> This change exposes that information to users without CAP_PERFMON.
>
> This change was requested in [1] by a developer of one such external
> tool, with the sysfs idea surfacing in a corresponding request for xe [2].
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_sysfs.c          |   6 ++
>  drivers/gpu/drm/i915/intel_memory_region.c | 106 +++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_memory_region.h |   3 +
>  3 files changed, 115 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i91=
5_sysfs.c
> index f936e8f1f129..048d6da2f6db 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -35,6 +35,8 @@
>  #include "gt/intel_rps.h"
>  #include "gt/sysfs_engines.h"
>=20=20
> +#include "intel_memory_region.h"
> +
>  #include "i915_drv.h"
>  #include "i915_sysfs.h"
>=20=20
> @@ -182,6 +184,8 @@ void i915_setup_sysfs(struct drm_i915_private *dev_pr=
iv)
>=20=20
>  	i915_gpu_error_sysfs_setup(dev_priv);
>=20=20
> +	intel_memory_region_setup_sysfs(dev_priv);
> +
>  	intel_engines_add_sysfs(dev_priv);
>  }
>=20=20
> @@ -189,6 +193,8 @@ void i915_teardown_sysfs(struct drm_i915_private *dev=
_priv)
>  {
>  	struct device *kdev =3D dev_priv->drm.primary->kdev;
>=20=20
> +	intel_memory_region_teardown_sysfs();
> +
>  	i915_gpu_error_sysfs_teardown(dev_priv);
>=20=20
>  	device_remove_bin_file(kdev, &dpf_attrs_1);
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm=
/i915/intel_memory_region.c
> index 59bd603e6deb..9558e300209b 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -3,14 +3,19 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> +#include <linux/kobject.h>
>  #include <linux/prandom.h>
> +#include <linux/sysfs.h>
>=20=20
>  #include <uapi/drm/i915_drm.h>
>=20=20
>  #include "intel_memory_region.h"
>  #include "i915_drv.h"
> +#include "i915_sysfs.h"
>  #include "i915_ttm_buddy_manager.h"
>=20=20
> +static struct kobject *memory_info_dir;

This can't be per module.

BR,
Jani.


> +
>  static const struct {
>  	u16 class;
>  	u16 instance;
> @@ -423,6 +428,107 @@ void intel_memory_regions_driver_release(struct drm=
_i915_private *i915)
>  	}
>  }
>=20=20
> +static ssize_t
> +vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char =
*buf)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +
> +	mr =3D intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMOR=
Y_LOCAL);
> +
> +	return sysfs_emit(buf, "%llu\n", mr->total);
> +}
> +
> +static const struct kobj_attribute vram_total_attr =3D
> +__ATTR(vram_total, 0444, vram_total_show, NULL);
> +
> +static ssize_t
> +vram_avail_show(struct kobject *kobj, struct kobj_attribute *attr, char =
*buf)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +	u64 unallocated_size;
> +	u64 dummy;
> +
> +	mr =3D intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMOR=
Y_LOCAL);
> +	intel_memory_region_avail(mr, &unallocated_size, &dummy);
> +
> +	return sysfs_emit(buf, "%llu\n", unallocated_size);
> +}
> +
> +static const struct kobj_attribute vram_avail_attr =3D
> +__ATTR(vram_available, 0444, vram_avail_show, NULL);
> +
> +
> +static ssize_t
> +vram_total_visible_show(struct kobject *kobj, struct kobj_attribute *att=
r, char *buf)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +
> +	mr =3D intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMOR=
Y_LOCAL);
> +
> +	return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
> +}
> +
> +static const struct kobj_attribute vram_total_visible_attr =3D
> +__ATTR(vram_total_cpu_visible, 0444, vram_total_visible_show, NULL);
> +
> +static ssize_t
> +vram_avail_visible_show(struct kobject *kobj, struct kobj_attribute *att=
r, char *buf)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +	u64 unallocated_cpu_visible_size;
> +	u64 dummy;
> +
> +	mr =3D intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMOR=
Y_LOCAL);
> +	intel_memory_region_avail(mr, &dummy, &unallocated_cpu_visible_size);
> +
> +	return sysfs_emit(buf, "%llu\n", unallocated_cpu_visible_size);
> +}
> +
> +static const struct kobj_attribute vram_avail_visible_attr =3D
> +__ATTR(vram_available_cpu_visible, 0444, vram_avail_visible_show, NULL);
> +
> +int intel_memory_region_setup_sysfs(struct drm_i915_private *i915)
> +{
> +	static const struct attribute *const files[] =3D {
> +		&vram_total_attr.attr,
> +		&vram_avail_attr.attr,
> +		&vram_total_visible_attr.attr,
> +		&vram_avail_visible_attr.attr,
> +		NULL
> +	};
> +	struct device *kdev =3D i915->drm.primary->kdev;
> +	int err;
> +
> +	/* Skip this function completely if the system does not support lmem */
> +	if(!intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL))
> +		return 0;
> +
> +	memory_info_dir =3D kobject_create_and_add("memory_info", &kdev->kobj);
> +	if (!memory_info_dir) {
> +		drm_warn(&i915->drm, "Failed to create memory_info sysfs directory\n");
> +		return -EAGAIN;
> +	}
> +
> +	err =3D sysfs_create_files(memory_info_dir, files);
> +	if (err) {
> +		drm_warn(&i915->drm, "Failed to create memory info sysfs files: %d\n",=
 err);
> +		kobject_put(memory_info_dir);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +int intel_memory_region_teardown_sysfs(void)
> +{
> +	kobject_put(memory_info_dir);
> +	return 0;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftests/intel_memory_region.c"
>  #include "selftests/mock_region.c"
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm=
/i915/intel_memory_region.h
> index b3b75be9ced5..9838eca9344c 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -132,4 +132,7 @@ struct intel_memory_region *
>  i915_gem_shmem_setup(struct drm_i915_private *i915,
>  		     u16 type, u16 instance);
>=20=20
> +int intel_memory_region_setup_sysfs(struct drm_i915_private *i915);
> +int intel_memory_region_teardown_sysfs(void);
> +
>  #endif

--=20
Jani Nikula, Intel
