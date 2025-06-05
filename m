Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58BACEAFE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DC810E804;
	Thu,  5 Jun 2025 07:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+k0oFLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A733A10E22A;
 Thu,  5 Jun 2025 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749109213; x=1780645213;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P3n6HoaRyVI696Is2Kgtmac3OEkBW5JfMs7SwAafK/8=;
 b=A+k0oFLAGfUyS+p1qd4tVP3S+iI8lb2jBlu0UL+HHI55gXseehvZZubw
 UHbiipM8dVnsEau7tnMndziHDohF36OquoJbGvoj0+NipqDO9HzSfdaZO
 WxbgfE4znoMy+eVyGwPlBNRf7eYcyePX6pU1fdxK0MF1pGJOqyn6vWIMr
 HU//yZ1MfjfX0kg9krQ0LW86ZhQ8Yagat+QR2oVovovbJ2Ehpf+uPq6cQ
 UoGGczlBWStPpa7Q4sZvc1cOuWNpXDZyxkGlfi7qtZAbZ5C18I5Jg3W52
 WKLj1hbWidpPdF2Ek+/YBUmudxJYAb1xIqQLhs7MdhRUOi6Xk03HK6GTH A==;
X-CSE-ConnectionGUID: 99Xt++lpR02Q6g6gf2ealg==
X-CSE-MsgGUID: 7CU21dOQQGePq+3ov6mTjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68655207"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68655207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 00:40:11 -0700
X-CSE-ConnectionGUID: m0tEiTGBQ/muGoZkK++ZWw==
X-CSE-MsgGUID: hNxOBgfxQp2mub0Qms4JFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145930089"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.59])
 ([10.245.244.59])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 00:40:07 -0700
Message-ID: <24bc8917db8f376ba2560fa69335d1ce4f0b2d9e.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/pagemap: Add a populate_mm op
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Thu, 05 Jun 2025 09:40:05 +0200
In-Reply-To: <aEDDLUdBQNXwcjKm@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
 <aEDDLUdBQNXwcjKm@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-06-04 at 15:05 -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 11:35:35AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Add an operation to populate a part of a drm_mm with device
> > private memory.
> >=20
>=20
> With the kernel doc fixed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for reviewing,
Thomas

>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0 |=C2=A0 7 ++-----
> > =C2=A0drivers/gpu/drm/drm_pagemap.c | 34
> > ++++++++++++++++++++++++++++++++++
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0 | 34
> > ++++++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 70 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index ef81381609de..51afc8a9704d 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -175,11 +175,8 @@
> > =C2=A0 *		}
> > =C2=A0 *
> > =C2=A0 *		if (driver_migration_policy(range)) {
> > - *			mmap_read_lock(mm);
> > - *			devmem =3D driver_alloc_devmem();
> > - *			err =3D
> > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > gpuva_end, driver_pgmap_owner());
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_unlo=
ck(mm);
> > + *			err =3D
> > drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpuva_start,
> > gpuva_end, gpusvm->mm);
> > =C2=A0 *			if (err)	// CPU mappings may have
> > changed
> > =C2=A0 *				goto retry;
> > =C2=A0 *		}
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 3551a50d7381..25395685a9b8 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -6,6 +6,7 @@
> > =C2=A0#include <linux/dma-mapping.h>
> > =C2=A0#include <linux/migrate.h>
> > =C2=A0#include <linux/pagemap.h>
> > +#include <drm/drm_drv.h>
> > =C2=A0#include <drm/drm_pagemap.h>
> > =C2=A0
> > =C2=A0/**
> > @@ -809,3 +810,36 @@ struct drm_pagemap
> > *drm_pagemap_page_to_dpagemap(struct page *page)
> > =C2=A0	return zdd->devmem_allocation->dpagemap;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> > +
> > +/**
> > + * drm_pagemap_populate_mm() - Populate a virtual range with
> > device memory pages
> > + * @dpagemap: Pointer to the drm_pagemap managing the device
> > memory
> > + * @start: Start of the virtual range to populate.
> > + * @end: End of the virtual range to populate.
> > + * @mm: Pointer to the virtual address space.
> > + *
> > + * Attempt to populate a virtual range with device memory pages,
> > + * clearing them or migrating data from the existing pages if
> > necessary.
> > + * The function is best effort only, and implementations may vary
> > + * in how hard they try to satisfy the request.
> > + *
> > + * Return: 0 on success, negative error code on error. If the
> > hardware
> > + * device was removed / unbound the function will return -ENODEV;
> > + */
> > +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned long
> > end,
> > +			=C2=A0=C2=A0=C2=A0 struct mm_struct *mm,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms)
> > +{
> > +	int err;
> > +
> > +	if (!mmget_not_zero(mm))
> > +		return -EFAULT;
> > +	mmap_read_lock(mm);
> > +	err =3D dpagemap->ops->populate_mm(dpagemap, start, end, mm,
> > +					 timeslice_ms);
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +
> > +	return err;
> > +}
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index dabc9c365df4..e5f20a1235be 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -92,6 +92,35 @@ struct drm_pagemap_ops {
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_device_addr addr);
> > =C2=A0
> > +	/**
> > +	 * @populate_mm: Populate part of the mm with @dpagemap
> > memory,
> > +	 * migrating existing data.
> > +	 * @dpagemap: The struct drm_pagemap managing the memory.
> > +	 * @start: The virtual start address in @mm
> > +	 * @end: The virtual end address in @mm
> > +	 * @mm: Pointer to a live mm. The caller must have an
> > mmget()
> > +	 * reference.
> > +	 *
> > +	 * The caller will have the mm lock at least in read mode.
> > +	 * Note that there is no guarantee that the memory is
> > resident
> > +	 * after the function returns, it's best effort only.
> > +	 * When the mm is not using the memory anymore,
> > +	 * it will be released. The struct drm_pagemap might have
> > a
> > +	 * mechanism in place to reclaim the memory and the data
> > will
> > +	 * then be migrated. Typically to system memory.
> > +	 * The implementation should hold sufficient runtime
> > power-
> > +	 * references while pages are used in an address space and
> > +	 * should ideally guard against hardware device unbind in
> > +	 * a way such that device pages are migrated back to
> > system
> > +	 * followed by device page removal. The implementation
> > should
> > +	 * return -ENODEV after device removal.
> > +	 *
> > +	 * Return: 0 if successful. Negative error code on error.
> > +	 */
> > +	int (*populate_mm)(struct drm_pagemap *dpagemap,
> > +			=C2=A0=C2=A0 unsigned long start, unsigned long end,
> > +			=C2=A0=C2=A0 struct mm_struct *mm,
> > +			=C2=A0=C2=A0 unsigned long timeslice_ms);
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > @@ -205,4 +234,9 @@ void drm_pagemap_devmem_init(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem_ops
> > *ops,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > size);
> > =C2=A0
> > +int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned long
> > end,
> > +			=C2=A0=C2=A0=C2=A0 struct mm_struct *mm,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms);
> > +
> > =C2=A0#endif
> > --=20
> > 2.49.0
> >=20

