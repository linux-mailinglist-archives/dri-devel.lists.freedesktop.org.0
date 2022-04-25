Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397650E067
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 14:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A28310E7B6;
	Mon, 25 Apr 2022 12:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3382B10E5FD;
 Mon, 25 Apr 2022 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650890028; x=1682426028;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=r0l2WSi/geJto2hldgc6pDAmCOPQ1t0VXDDCEuWzHWc=;
 b=jUGTJXfIK13sDvRzXNI4Z6uiuHtX7kDG5xmwfwzF0qcon5Kj9KXDDtXc
 XGgY19X4fSZ4iIDpYPlzvqpuNQVOOmPqjwyfTU5TY5dSl0S4lAbJ7m24d
 2nZTFFCSE+K3k/nxor1PvcSSrh4Jn95jub4KXC+Jbs6IQ8TdyBdljwbSA
 wbwPAni5hYcVrRM2tX+Y9Jv1VO9KDXfCZmkxY9LoM+XtQXBCNnZYYJEMl
 neu+PCYiQMriWYjsySOb6w/i7rsEV/ZMBWIVxz8do3SddFlm4/Tir4kXq
 uhV+g1tGfPMgwFgSA85vpf0R3Ied6ZIccjRAZGDs1vUOOE25nmvG3daO+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265035819"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="265035819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:33:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557708700"
Received: from tgiecew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.131.125])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:33:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL v3] gvt-next
In-Reply-To: <87o80pv1qd.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <25a713cd-0b7d-4c09-7d91-4f4ef6c9eb11@intel.com>
 <87o80pv1qd.fsf@intel.com>
Date: Mon, 25 Apr 2022 15:33:40 +0300
Message-ID: <87ilqxuyu3.fsf@intel.com>
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
Cc: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 21 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi folks:
>>
>> Here is the PR of gvt-next. Thanks so much for the patience.
>
> Thanks, pulled to drm-intel-next, applied the below fix for the silent
> conflict on top, and pushed out. Should show up in linux-next shortly.

Aww crap, this breaks debug builds.

ERROR: modpost: "intel_runtime_pm_put" [drivers/gpu/drm/i915/kvmgt.ko] unde=
fined!
ERROR: modpost: "i915_fence_ops" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
make[1]: *** Deleting file 'modules-only.symvers'
make: *** [Makefile:1749: modules] Error 2

The first is triggered with CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dy, the
latter with CONFIG_DRM_I915_DEBUG_GEM=3Dy.

Please add the proper fix on top of the topic branch, and send an
additional pull request. Looks like exports will do it.

On that note, I'm wondering about the use of
EXPORT_SYMBOL_NS_GPL(). It's between two MIT licensed modules after
all. Maybe just EXPORT_SYMBOL_NS()?

BR,
Jani.


>
> BR,
> Jani.
>
>>
>> Mostly it includes the patch bundle of GVT-g re-factor patches for adapt=
ing the GVT-g with the
>> new MDEV interfaces:
>>
>> - Separating the MMIO table from GVT-g. (Zhi)
>> - GVT-g re-factor. (Christoph)
>> - GVT-g mdev API cleanup. (Jason)
>> - GVT-g trace/makefile cleanup. (Jani)
>>
>> Thanks so much for making this happen.
>>
>> This PR has been tested as following and no problem shows up:
>>
>> $dim update-branches
>> $dim apply-pull drm-intel-next < this_email.eml
>>
>> When merging this pull to drm-intel-next, please include the following c=
ode in the merge commit:
>>
>> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/d=
rm/i915/intel_gvt_mmio_table.c
>> index 03a7fcd0f904..72dac1718f3e 100644
>> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>> @@ -3,6 +3,7 @@
>>   * Copyright =C2=A9 2020 Intel Corporation
>>   */
>>=20=20
>> +#include "display/intel_dmc_regs.h"
>>  #include "display/vlv_dsi_pll_regs.h"
>>  #include "gt/intel_gt_regs.h"
>>  #include "gvt/gvt.h"
>>
>>
>> The following changes since commit 3123109284176b1532874591f7c81f3837bbd=
c17:
>>
>>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-21-for-christ=
oph
>>
>> for you to fetch changes up to 2917f53113be3b7a0f374e02cebe6d6b749366b5:
>>
>>   vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)
>>
>> ----------------------------------------------------------------
>> gvt-next-2022-04-21-for-christoph
>>
>> - Separating the MMIO table from GVT-g. (Zhi)
>> - GVT-g re-factor. (Christoph)
>> - GVT-g mdev API cleanup. (Jason)
>> - GVT-g trace/makefile cleanup. (Jani)
>>
>> ----------------------------------------------------------------
>> Christoph Hellwig (27):
>>       drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register=
_hypervisor
>>       drm/i915/gvt: remove enum hypervisor_type
>>       drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
>>       drm/i915/gvt: move the gvt code into kvmgt.ko
>>       drm/i915/gvt: remove intel_gvt_ops
>>       drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
>>       drm/i915/gvt: remove the unused from_virt_to_mfn op
>>       drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
>>       drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
>>       drm/i915/gvt: remove vgpu->handle
>>       drm/i915/gvt: devirtualize ->{read,write}_gpa
>>       drm/i915/gvt: devirtualize ->{get,put}_vfio_device
>>       drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
>>       drm/i915/gvt: devirtualize ->detach_vgpu
>>       drm/i915/gvt: devirtualize ->inject_msi
>>       drm/i915/gvt: devirtualize ->is_valid_gfn
>>       drm/i915/gvt: devirtualize ->gfn_to_mfn
>>       drm/i915/gvt: devirtualize ->{enable,disable}_page_track
>>       drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
>>       drm/i915/gvt: devirtualize dma_pin_guest_page
>>       drm/i915/gvt: remove struct intel_gvt_mpt
>>       drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
>>       drm/i915/gvt: streamline intel_vgpu_create
>>       drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write help=
ers
>>       drm/i915/gvt: remove kvmgt_guest_{init,exit}
>>       drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
>>       drm/i915/gvt: merge gvt.c into kvmgvt.c
>>
>> Jani Nikula (2):
>>       drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
>>       drm/i915/gvt: better align the Makefile with i915 Makefile
>>
>> Jason Gunthorpe (5):
>>       vfio/mdev: Remove vfio_mdev.c
>>       vfio/mdev: Remove mdev_parent_ops dev_attr_groups
>>       vfio/mdev: Remove mdev_parent_ops
>>       vfio/mdev: Use the driver core to create the 'remove' file
>>       vfio/mdev: Remove mdev drvdata
>>
>> Zhi Wang (3):
>>       i915/gvt: Separate the MMIO tracking table from GVT-g
>>       i915/gvt: Save the initial HW state snapshot in i915
>>       i915/gvt: Use the initial HW state snapshot saved in i915
>>
>>  Documentation/driver-api/vfio-mediated-device.rst |   27 +-
>>  drivers/gpu/drm/i915/Kconfig                      |   36 +-
>>  drivers/gpu/drm/i915/Makefile                     |    8 +-
>>  drivers/gpu/drm/i915/gvt/Makefile                 |   30 +-
>>  drivers/gpu/drm/i915/gvt/cfg_space.c              |   89 +-
>>  drivers/gpu/drm/i915/gvt/cmd_parser.c             |    4 +-
>>  drivers/gpu/drm/i915/gvt/dmabuf.c                 |   36 +-
>>  drivers/gpu/drm/i915/gvt/execlist.c               |   12 +-
>>  drivers/gpu/drm/i915/gvt/firmware.c               |   25 +-
>>  drivers/gpu/drm/i915/gvt/gtt.c                    |   55 +-
>>  drivers/gpu/drm/i915/gvt/gvt.c                    |  340 ------
>>  drivers/gpu/drm/i915/gvt/gvt.h                    |  128 +-
>>  drivers/gpu/drm/i915/gvt/handlers.c               | 1033 +++-----------=
---
>>  drivers/gpu/drm/i915/gvt/hypercall.h              |   82 --
>>  drivers/gpu/drm/i915/gvt/interrupt.c              |   40 +-
>>  drivers/gpu/drm/i915/gvt/kvmgt.c                  | 1097 +++++++++-----=
---
>>  drivers/gpu/drm/i915/gvt/mmio.c                   |    4 +-
>>  drivers/gpu/drm/i915/gvt/mmio.h                   |    1 -
>>  drivers/gpu/drm/i915/gvt/mpt.h                    |  400 -------
>>  drivers/gpu/drm/i915/gvt/opregion.c               |  148 +--
>>  drivers/gpu/drm/i915/gvt/page_track.c             |    8 +-
>>  drivers/gpu/drm/i915/gvt/reg.h                    |    9 +-
>>  drivers/gpu/drm/i915/gvt/scheduler.c              |   37 +-
>>  drivers/gpu/drm/i915/gvt/trace.h                  |    2 +-
>>  drivers/gpu/drm/i915/gvt/vgpu.c                   |   22 +-
>>  drivers/gpu/drm/i915/i915_driver.c                |    7 -
>>  drivers/gpu/drm/i915/i915_drv.h                   |    3 +
>>  drivers/gpu/drm/i915/intel_gvt.c                  |  248 +++-
>>  drivers/gpu/drm/i915/intel_gvt.h                  |   32 +-
>>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c       | 1291 ++++++++++++++=
+++++++
>>  drivers/s390/cio/vfio_ccw_ops.c                   |    7 +-
>>  drivers/s390/crypto/vfio_ap_ops.c                 |    9 +-
>>  drivers/vfio/mdev/Makefile                        |    2 +-
>>  drivers/vfio/mdev/mdev_core.c                     |   52 +-
>>  drivers/vfio/mdev/mdev_driver.c                   |   10 -
>>  drivers/vfio/mdev/mdev_private.h                  |    6 +-
>>  drivers/vfio/mdev/mdev_sysfs.c                    |   37 +-
>>  drivers/vfio/mdev/vfio_mdev.c                     |  152 ---
>>  include/linux/mdev.h                              |   82 +-
>>  samples/vfio-mdev/mbochs.c                        |    9 +-
>>  samples/vfio-mdev/mdpy.c                          |    9 +-
>>  samples/vfio-mdev/mtty.c                          |   39 +-
>>  42 files changed, 2530 insertions(+), 3138 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
>>  delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
>>  delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
>>  create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>>  delete mode 100644 drivers/vfio/mdev/vfio_mdev.c

--=20
Jani Nikula, Intel Open Source Graphics Center
