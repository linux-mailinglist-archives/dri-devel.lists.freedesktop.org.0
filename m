Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15772C688B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3010E470;
	Tue, 18 Nov 2025 09:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUnRm41U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534E10E45E;
 Tue, 18 Nov 2025 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763458309; x=1794994309;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=R637sS7zhdN+1hHtA2wizA4LgxZgSd3R4hHpkgt9J3I=;
 b=PUnRm41UXE/JA2xJCGzyC6qoE0haeNDwBo0yP/A8jqRLS5lymX9yc3bc
 iec4YEt8GddE8b64SqQ5gKtGRmywZNq7yXLBkEd67QMREWujk8llbm7Vp
 bZ5jvIPfVOmTmiR81CugO2EVRkeQuaAkd7ROwzY3OWOCgdRCVBIxiSLD4
 os6F/K7C5KYSv0sflblh1BFqKrzMzgY1bTmkk9+txwlCk8e8qyDS98Fkn
 bsI4xWp+8UvgSpGLRrEFH+5aGOsWaE6VOJOcttGbEG1EodwOXRIKuaGnN
 alzyv91IoV2JcECmVaH1tTPwbIX8UAv1fDOFWXbOucKIK2Geq2ZJRR2t3 g==;
X-CSE-ConnectionGUID: hsgoxFuART6xdc/j/qtKGA==
X-CSE-MsgGUID: RzeuXBVMTaG/MrFhk6h/rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65413227"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65413227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:31:48 -0800
X-CSE-ConnectionGUID: 6MtOVqx8QRanVCeY1eJcCQ==
X-CSE-MsgGUID: znhjBJxAQTilW08EV7u9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191480016"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.100])
 ([10.245.245.100])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:31:43 -0800
Message-ID: <bd0d03a73dc831ea206dcb5d4a9d912e96729861.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/17] Dynamic drm_pagemaps and Initial multi-device SVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com, Simona Vetter	
 <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Matthew Brost	
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dakr@kernel.org, "Mrozek, Michal"	
 <michal.mrozek@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Tue, 18 Nov 2025 10:31:41 +0100
In-Reply-To: <gdveezxmqazqdyuyy6kpca7kfppxkackmcms6xrfcya2acqzat@jd2yjghp5bcm>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <gdveezxmqazqdyuyy6kpca7kfppxkackmcms6xrfcya2acqzat@jd2yjghp5bcm>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-11-18 at 17:15 +1100, Alistair Popple wrote:
> On 2025-11-12 at 03:43 +1100, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote...
> > This series aims at providing an initial implementation of multi-
> > device
> > SVM, where communitcation with peers (migration and direct
> > execution out
> > of peer memory) uses some form of fast interconnect. In this series
> > we're using pcie p2p.
> >=20
> > In a multi-device environment, the struct pages for device-private
> > memory
> > (the dev_pagemap) may take up a significant amount of system
> > memory. We
> > therefore want to provide a means of revoking / removing the
> > dev_pagemaps
> > not in use. In particular when a device is offlined, we want to
> > block
> > migrating *to* the device memory and migrate data already existing
> > in the
> > devices memory to system. The dev_pagemap then becomes unused and
> > can be
> > removed.
> >=20
> > Removing and setting up a large dev_pagemap is also quite time-
> > consuming,
> > so removal of unused dev_pagemaps only happens on system memory
> > pressure
> > using a shrinker.
>=20
> Agree it is quite time-consuming, we have run into this problem as
> well
> including with the pcie p2p dma pages. On the mm side I've started
> looking
> at if/how we can remove the need for struct pages at all for
> supporting this.
> Doesn't help you at all now of course, but hopefully one day we can
> avoid the
> need for this. I will be discussing this at LPC if you happen to be
> there.

Yeah that sounds great. Will not be at LPC in person but will make sure
to join remotely.

Thanks,
Thomas




>=20
> =C2=A0- Alistair
>=20
> > Patch 1 is a small debug printout fix.
> > Patches 2-7 deals with dynamic drm_pagemaps as described above.
> > Patches 8-12 adds infrastructure to handle remote drm_pagemaps with
> > fast interconnects.
> > Patch 13 extends the xe madvise() UAPI to handle remote
> > drm_pagemaps.
> > Patch 14 adds a pcie-p2p dma SVM interconnect to the xe driver.
> > Patch 15 adds some SVM-related debug printouts for xe.
> > Patch 16 adds direct interconnect migration.
> > Patch 17 adds some documentation.
> >=20
> > What's still missing is implementation of migration policies.
> > That will be implemented in follow-up series.=20
> >=20
> > v2:
> > - Address review comments from Matt Brost.
> > - Fix compilation issues reported by automated testing
> > - Add patch 1, 17.
> > - What's now patch 16 was extended to support p2p migration.
> >=20
> > Thomas Hellstr=C3=B6m (17):
> > =C2=A0 drm/xe/svm: Fix a debug printout
> > =C2=A0 drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
> > =C2=A0 drm/pagemap: Add a refcounted drm_pagemap backpointer to struct
> > =C2=A0=C2=A0=C2=A0 drm_pagemap_zdd
> > =C2=A0 drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
> > =C2=A0 drm/pagemap: Add a drm_pagemap cache and shrinker
> > =C2=A0 drm/xe: Use the drm_pagemap cache and shrinker
> > =C2=A0 drm/pagemap: Remove the drm_pagemap_create() interface
> > =C2=A0 drm/pagemap_util: Add a utility to assign an owner to a set of
> > =C2=A0=C2=A0=C2=A0 interconnected gpus
> > =C2=A0 drm/xe: Use the drm_pagemap_util helper to get a svm pagemap
> > owner
> > =C2=A0 drm/xe: Pass a drm_pagemap pointer around with the memory advise
> > =C2=A0=C2=A0=C2=A0 attributes
> > =C2=A0 drm/xe: Use the vma attibute drm_pagemap to select where to
> > migrate
> > =C2=A0 drm/xe: Simplify madvise_preferred_mem_loc()
> > =C2=A0 drm/xe/uapi: Extend the madvise functionality to support foreign
> > =C2=A0=C2=A0=C2=A0 pagemap placement for svm
> > =C2=A0 drm/xe: Support pcie p2p dma as a fast interconnect
> > =C2=A0 drm/xe/vm: Add a couple of VM debug printouts
> > =C2=A0 drm/pagemap, drm/xe: Support migration over interconnect
> > =C2=A0 drm/xe/svm: Document how xe keeps drm_pagemap references
> >=20
> > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 354 ++++++++++++---
> > =C2=A0drivers/gpu/drm/drm_pagemap_util.c=C2=A0=C2=A0 | 568
> > ++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 20 +
> > =C2=A0drivers/gpu/drm/xe/xe_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 5 +
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 631 ++++++++++++++++++++++-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 82 +++-
> > =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 34 +-
> > =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 21 +
> > =C2=A0drivers/gpu/drm/xe/xe_userptr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 65 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c=C2=A0=C2=A0 | 106 ++++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
21 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vram_types.h=C2=A0=C2=A0 |=C2=A0 15 +-
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 91 +++-
> > =C2=A0include/drm/drm_pagemap_util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 92 ++++
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
> > =C2=A020 files changed, 1898 insertions(+), 237 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
> > =C2=A0create mode 100644 include/drm/drm_pagemap_util.h
> >=20
> > --=20
> > 2.51.1
> >=20

