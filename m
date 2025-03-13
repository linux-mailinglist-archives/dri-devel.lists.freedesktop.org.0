Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9EA5F4F2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1105810E882;
	Thu, 13 Mar 2025 12:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4RQattC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A86210E87F;
 Thu, 13 Mar 2025 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741870304; x=1773406304;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zdmiOd/7fFG8DoU8rIN/52fESisiMgo0r1UeJUgYGBI=;
 b=G4RQattCK5pUN56FP2MT33Ik57DKNScZAG5IlFRmDhuDWICeqtvywnhD
 7a43TjDdtDYNQ6XjZlu8ubqg9jvoz26p/+KlswpHprJnvt+S/JskPUryQ
 5oQKVqfHKXsiiuJ3b3Z1S/3QIgALpyyfLkngIHZGDpk2UOcdBImsAKanv
 wqN5bzGvszN1CHMDxhSRch9Odd2prZWATYJ9edSmWeKCUpdo9h0JxKsCf
 70zsC8bnnpPR6HOXvh087iz8DsGCrEszm8/1FgRICDva/ILcvFOE9Hm4L
 FJXEErHQoFS2Hz618dhsvyrLKX55PHwr3xvnCsWDuQuE8hPJSduPpg8Y9 Q==;
X-CSE-ConnectionGUID: XD2hx1auSW6tIGRe9ZgIAA==
X-CSE-MsgGUID: PjAaOY0BSFSw4ekA0f8yJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42891745"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="42891745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:53 -0700
X-CSE-ConnectionGUID: +mptwAGBQRaPoaxR8/rQOg==
X-CSE-MsgGUID: lOFtg1h9Qfmz338lSHpXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="125123323"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.73])
 ([10.245.246.73])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:50 -0700
Message-ID: <466cdc46b81b4e1a51fa1accee8f56487cce1268.camel@linux.intel.com>
Subject: Re: [RFC PATCH 00/19] drm, drm/xe: Multi-device GPUSVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Matthew
 Brost <matthew.brost@intel.com>, 	dakr@kernel.org, "Mrozek, Michal"
 <michal.mrozek@intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>
Date: Thu, 13 Mar 2025 13:50:39 +0100
In-Reply-To: <3c7950d8-75bd-48d0-9713-b76feea87a37@amd.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
 <3c7950d8-75bd-48d0-9713-b76feea87a37@amd.com>
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

Hi, Christian

On Thu, 2025-03-13 at 11:19 +0100, Christian K=C3=B6nig wrote:
> Am 12.03.25 um 22:03 schrieb Thomas Hellstr=C3=B6m:
> > This RFC implements and requests comments for a way to handle SVM
> > with multi-device,
> > typically with fast interconnects. It adds generic code and helpers
> > in drm, and
> > device-specific code for xe.
> >=20
> > For SVM, devices set up maps of device-private struct pages, using
> > a struct dev_pagemap,
> > The CPU virtual address space (mm), can then be set up using
> > special page-table entries
> > to point to such pages, but they can't be accessed directly by the
> > CPU, but possibly
> > by other devices using a fast interconnect. This series aims to
> > provide helpers to
> > identify pagemaps that take part in such a fast interconnect and to
> > aid in migrating
> > between them.
> >=20
> > This is initially done by augmenting the struct dev_pagemap with a
> > struct drm_pagemap,
> > and having the struct drm_pagemap implement a "populate_mm" method,
> > where a region of
> > the CPU virtual address space (mm) is populated with device_private
> > pages from the
> > dev_pagemap associated with the drm_pagemap, migrating data from
> > system memory or other
> > devices if necessary. The drm_pagemap_populate_mm() function is
> > then typically called
> > from a fault handler, using the struct drm_pagemap pointer of
> > choice. It could be
> > referencing a local drm_pagemap or a remote one. The migration is
> > now completely done
> > by drm_pagemap callbacks, (typically using a copy-engine local to
> > the dev_pagemap local
> > memory).
>=20
> Up till here that makes sense. Maybe not necessary to be put into the
> DRM layer, but that is an implementation detail.
>=20
> > In addition there are helpers to build a drm_pagemap UAPI using
> > file-descripors
> > representing struct drm_pagemaps, and a helper to register devices
> > with a common
> > fast interconnect. The UAPI is intended to be private to the
> > device, but if drivers
> > agree to identify struct drm_pagemaps by file descriptors one could
> > in theory
> > do cross-driver multi-device SVM if a use-case were found.
>=20
> But this completely eludes me.
>=20
> Why would you want an UAPI for representing pagemaps as file
> descriptors? Isn't it the kernel which enumerates the interconnects
> of the devices?
>=20
> I mean we somehow need to expose those interconnects between devices
> to userspace, e.g. like amdgpu does with it's XGMI connectors. But
> that is static for the hardware (unless HW is hot removed/added) and
> so I would assume exposed through sysfs.

Thanks for the feedback.

The idea here is not to expose the interconnects but rather have a way
for user-space to identify a drm_pagemap and some level of access- and
lifetime control.

For Xe, If an application wants to use a particular drm_pagemap it
calls an ioctl:

pagemap_fd =3D drm_xe_ioctl_pagemap_open(exporting_device_fd,
memory_region);

And then when it's no longer used
close(pagemap_fd)

To use it for a memory range, the intended idea is call gpu madvise
ioctl:
=20
err =3D drm_xe_ioctl_gpu_madvise(local_device_fd, range, pagemap_fd);

Now, if there is no fast interconnect between the two, the madvise call
could just return an error. All this ofc assumes that user-space is
somehow aware of the fast interconnect topology but how that is exposed
is beyond the scope of this first series. (Suggestions welcome).

The advantage of the above approach is
1) We get some level of access control. If the user doesn't have access
to the exporting device, he/she can't obtain a pagemap file descriptor.

2) Lifetime control. The pagemaps are memory hungry, but also take
considerable time to set up and tear down.

3) It's a driver-independent approach.

One could ofc use a different approach by feeding the gpu_madvise()
ioctl with a remote device file descriptor and whatever information is
needed for the remote device to identify the drm_pagemap. That would
not be driver independent, though. Not sure how important that is.

/Thomas


>=20
> Thanks,
> Christian.
>=20
> > The implementation for the Xe driver uses dynamic pagemaps which
> > are created on first
> > use and removed 5s after the last reference is gone. Pagemaps are
> > revoked on
> > device unbind, and data is then migrated to system.
> >=20
> > Status:
> > This is a POC series. It has been tested with an IGT test soon to
> > be published, with a
> > DG1 drm_pagemap and a BattleMage SVM client. There is separate work
> > ongoing for the
> > gpu_madvise functionality.
> >=20
> > The Xe implementation of the "populate_mm()" callback is
> > still rudimentary and doesn't migrate from foreign devices. It
> > should be tuned to do
> > smarter choices.
> >=20
> > Any feedback appreciated.
> >=20
> > Patch overview:
> > Patch 1:
> > - Extends the way the Xe driver can compile out SVM support and
> > pagemaps.
> > Patch 2:
> > - Fixes an existing potential UAF in the Xe SVM code.
> > Patch 3:
> > - Introduces the drm_pagemap.c file and moves drm_pagemap
> > functionality to it.
> > Patch 4:
> > - Adds a populate_mm op to drm_pagemap.
> > Patch 5:
> > - Implement Xe's version of the populate_mm op.
> > Patch 6:
> > - Refcount struct drm_pagemap.
> > Patch 7:
> > - Cleanup patch.
> > Patch 8:
> > - Add a bo_remove callback for Xe, Used during device unbind.
> > Patch 9:
> > - Add a drm_pagemap utility to calculate a common owner structure
> > Patch 10:
> > - Adopt GPUSVM to a (sort of) dynamic owner.
> > Patch 11:
> > - Xe calculates the dev_private owner using the drm_pagemap
> > utility.
> > Patch 12:
> > - Update the Xe page-table code to handle per range mixed system /
> > device_private placement.
> > Patch 13:
> > - Modify GPUSVM to allow such placements.
> > Patch 14:
> > - Add a preferred pagemap to use by the Xe fault handler.
> > Patch 15:
> > - Add a utility that converts between drm_pagemaps and file-
> > descriptors and back.
> > Patch 16:
> > - Fix Xe so that also devices without fault capability can publish
> > drm_pagemaps.
> > Patch 17:
> > - Add the devmem_open UAPI, creating a drm_pagemap file descriptor
> > from a
> > =C2=A0 (device, region) pair.
> > Patch 18:
> > - (Only for POC) Add an GPU madvise prefer_devmem IOCTL.
> > Patch 19:
> > - (Only for POC) Implement pcie p2p DMA as a fast interconnect and
> > test.
> >=20
> > Matthew Brost (1):
> > =C2=A0 drm/gpusvm, drm/pagemap: Move migration functionality to
> > drm_pagemap
> >=20
> > Thomas Hellstr=C3=B6m (18):
> > =C2=A0 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
> > =C2=A0 drm/xe/svm: Fix a potential bo UAF
> > =C2=A0 drm/pagemap: Add a populate_mm op
> > =C2=A0 drm/xe: Implement and use the drm_pagemap populate_mm op
> > =C2=A0 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and
> > manage
> > =C2=A0=C2=A0=C2=A0 lifetime
> > =C2=A0 drm/pagemap: Get rid of the struct
> > =C2=A0=C2=A0=C2=A0 drm_pagemap_zdd::device_private_page_owner field
> > =C2=A0 drm/xe/bo: Add a bo remove callback
> > =C2=A0 drm/pagemap_util: Add a utility to assign an owner to a set of
> > =C2=A0=C2=A0=C2=A0 interconnected gpus
> > =C2=A0 drm/gpusvm, drm/xe: Move the device private owner to the
> > =C2=A0=C2=A0=C2=A0 drm_gpusvm_ctx
> > =C2=A0 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap
> > owner
> > =C2=A0 drm/xe: Make the PT code handle placement per PTE rather than pe=
r
> > vma
> > =C2=A0=C2=A0=C2=A0 / range
> > =C2=A0 drm/gpusvm: Allow mixed mappings
> > =C2=A0 drm/xe: Add a preferred dpagemap
> > =C2=A0 drm/pagemap/util: Add file descriptors pointing to struct
> > drm_pagemap
> > =C2=A0 drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault
> > capable
> > =C2=A0=C2=A0=C2=A0 devices
> > =C2=A0 drm/xe/uapi: Add the devmem_open ioctl
> > =C2=A0 drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
> > =C2=A0 drm/xe: HAX: Use pcie p2p dma to test fast interconnect
> >=20
> > =C2=A0Documentation/gpu/rfc/gpusvm.rst=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
12 +-
> > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 782 +---------------------
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 940
> > +++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/drm_pagemap_util.c=C2=A0=C2=A0 | 203 ++++++
> > =C2=A0drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +-
> > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 65 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 30 +-
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 112 ++--
> > =C2=A0drivers/gpu/drm/xe/xe_query.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 716 +++++++++++++++++---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 158 ++++-
> > =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 20 +-
> > =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 33 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 7 +
> > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 102 +--
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 190 +++++-
> > =C2=A0include/drm/drm_pagemap_util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 59 ++
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 39 ++
> > =C2=A025 files changed, 2458 insertions(+), 1071 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
> > =C2=A0create mode 100644 include/drm/drm_pagemap_util.h
> >=20
>=20

