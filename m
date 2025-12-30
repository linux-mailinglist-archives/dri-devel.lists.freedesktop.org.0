Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD72CE946C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5F10E89B;
	Tue, 30 Dec 2025 09:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5FtMii4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0D10E897;
 Tue, 30 Dec 2025 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767088735; x=1798624735;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6hjWL5QL8wGDUOiUcePbFH7DcnNaoPrQM5xxOTjP4To=;
 b=E5FtMii4ULopC2cAs1a5VaWjFMF0aoA4xlOQ4UnkLbrvgu2rr3iJ7HSc
 bKMyZ5cfcl9aLU1zGdjltXodW4AdWrHoxkvHLRPJAg/Ac3/BKoDVsLhO+
 DXQX3sntZrSfA8JOlGmPePy9bud/lEqWtaRlp7MnhxUqjDIulDhkJcHMa
 2dCFpPZbj7Ise8OYLv3ipLRMBgtAKE9aaSBNXyf6+Fo+3pxxE76CXbaLV
 RdtPchAuE6N2zlwFElWbmm2bOFdaBQxKy0KgrY7sk54tbh9y66dkO+z4M
 KwEHME14t38ZfzH1V8CQijWQD2ozU9z2MkSFChezItvK+kx0kq/EOhqSv A==;
X-CSE-ConnectionGUID: tLgUQmMtTH+dUorMFCCZLw==
X-CSE-MsgGUID: 6/Cwxuf0Q1i4VCEFkDpWKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80050583"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="80050583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 01:58:55 -0800
X-CSE-ConnectionGUID: BtCBFEIzSGq+jY6IeswX/Q==
X-CSE-MsgGUID: yIj7F5h0Roezf2PUrIJAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="238618323"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 01:58:51 -0800
Date: Tue, 30 Dec 2025 10:58:40 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next
Message-ID: <aVOiULyYdnFbq-JB@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi Dave, Simona

This week's drm-xe-next PR (Rodrigo is out this week).

Two big series, the SRIOV scheduler groups, and
multi-device SVM. The latter may conflict somewhat with
fixes, but conflict resolutions are in drm-rerere and
should be resolved to the -next code anyway.

The multi-device SVM also touches UAPI.

Thanks,
Thomas

drm-xe-next-2025-12-30:
Core Changes:
- Dynamic pagemaps and multi-device SVM (Thomas)

Driver Changes:
- Introduce SRIOV scheduler Groups (Daniele)
- Configure migration queue as low latency (Francois)
- Don't use absolute path in generated header comment (Calvin Owens)
- Add SoC remapper support for system controller (Umesh)
- Insert compiler barriers in GuC code (Jonathan)
- Rebar updates (Lucas)
The following changes since commit 844758bd99a86e6a07247784727fb337c4b979ca:

  drm/xe: Print GuC queue submission state on engine reset (2025-12-19 11:45:29 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-12-30

for you to fetch changes up to 0b075f82935e82fc9fff90d06d2a161caaebd9c3:

  drm/xe: Improve rebar log messages (2025-12-24 07:59:35 -0800)

----------------------------------------------------------------
Core Changes:
- Dynamic pagemaps and multi-device SVM (Thomas)

Driver Changes:
- Introduce SRIOV scheduler Groups (Daniele)
- Configure migration queue as low latency (Francois)
- Don't use absolute path in generated header comment (Calvin Owens)
- Add SoC remapper support for system controller (Umesh)
- Insert compiler barriers in GuC code (Jonathan)
- Rebar updates (Lucas)

----------------------------------------------------------------
Calvin Owens (1):
      drm/xe: Don't use absolute path in generated header comment

Daniele Ceraolo Spurio (12):
      drm/xe/gt: Add engine masks for each class
      drm/gt/guc: extract scheduler-related defines from guc_fwif.h
      drm/xe/pf: Initialize scheduler groups
      drm/xe/pf: Add support for enabling scheduler groups
      drm/xe/pf: Scheduler groups are incompatible with multi-lrc
      drm/xe/vf: Check if scheduler groups are enabled
      drm/xe/pf: Add debugfs to enable scheduler groups
      drm/xe/pf: Add debugfs with scheduler groups information
      drm/xe/pf: Prep for multiple exec quantums and preemption timeouts
      drm/xe/pf: Add functions to set exec quantums for each group
      drm/xe/pf: Add functions to set preempt timeouts for each group
      drm/xe/pf: Add debugfs to set EQ and PT for scheduler groups

Francois Dugast (1):
      drm/xe/migrate: Configure migration queue as low latency

Jonathan Cavitt (2):
      drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
      drm/xe/guc: READ/WRITE_ONCE ct->state

Lucas De Marchi (2):
      drm/xe: Move rebar to its own file
      drm/xe: Improve rebar log messages

Thomas Hellström (24):
      drm/xe/svm: Fix a debug printout
      drm/pagemap: Remove some dead code
      drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use
      drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
      drm/pagemap: Add a refcounted drm_pagemap backpointer to struct drm_pagemap_zdd
      drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
      drm/pagemap: Add a drm_pagemap cache and shrinker
      drm/xe: Use the drm_pagemap cache and shrinker
      drm/pagemap: Remove the drm_pagemap_create() interface
      drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus
      drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
      drm/xe: Pass a drm_pagemap pointer around with the memory advise attributes
      drm/xe: Use the vma attibute drm_pagemap to select where to migrate
      drm/xe: Simplify madvise_preferred_mem_loc()
      drm/xe/uapi: Extend the madvise functionality to support foreign pagemap placement for svm
      drm/xe: Support pcie p2p dma as a fast interconnect
      drm/xe/vm: Add a couple of VM debug printouts
      drm/xe/svm: Document how xe keeps drm_pagemap references
      drm/pagemap, drm/xe: Clean up the use of the device-private page owner
      drm/gpusvm: Introduce a function to scan the current migration state
      drm/xe: Use drm_gpusvm_scan_mm()
      drm/pagemap, drm/xe: Support destination migration over interconnect
      drm/pagemap: Support source migration over interconnect
      drm/xe/svm: Serialize migration to device if racing

Umesh Nerlige Ramappa (3):
      drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
      drm/xe/soc_remapper: Use SoC remapper helper from VSEC code
      drm/xe/soc_remapper: Add system controller config for SoC remapper

 drivers/gpu/drm/Makefile                         |   3 +-
 drivers/gpu/drm/drm_gpusvm.c                     | 124 ++++
 drivers/gpu/drm/drm_pagemap.c                    | 563 +++++++++++++++---
 drivers/gpu/drm/drm_pagemap_util.c               | 568 ++++++++++++++++++
 drivers/gpu/drm/xe/Makefile                      |   2 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h            |  64 ++
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h       |  57 ++
 drivers/gpu/drm/xe/regs/xe_pmt.h                 |   3 -
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h   |  14 +
 drivers/gpu/drm/xe/xe_device.c                   |  25 +
 drivers/gpu/drm/xe/xe_device.h                   |   2 +
 drivers/gpu/drm/xe/xe_device_types.h             |  21 +
 drivers/gpu/drm/xe/xe_exec_queue.c               |  19 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c               |   3 +-
 drivers/gpu/drm/xe/xe_gt.h                       |  12 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c              |   8 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h              |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c              |  20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h              |   8 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 279 ++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h       |  10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c      | 295 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c       | 329 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h       |  10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h |  39 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c              |  67 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h              |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h        |   2 +
 drivers/gpu/drm/xe/xe_guc.c                      |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.h              |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                   |  21 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                   |   6 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                 |  54 +-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c          |   9 +
 drivers/gpu/drm/xe/xe_guc_submit.c               |  40 +-
 drivers/gpu/drm/xe/xe_guc_submit.h               |   2 +
 drivers/gpu/drm/xe/xe_migrate.c                  |  32 +-
 drivers/gpu/drm/xe/xe_migrate.h                  |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                      |   8 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c                | 106 ++++
 drivers/gpu/drm/xe/xe_pci_rebar.h                |  13 +
 drivers/gpu/drm/xe/xe_pci_types.h                |   2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c             |  52 ++
 drivers/gpu/drm/xe/xe_soc_remapper.h             |  13 +
 drivers/gpu/drm/xe/xe_svm.c                      | 727 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h                      |  85 ++-
 drivers/gpu/drm/xe/xe_tile.c                     |  34 +-
 drivers/gpu/drm/xe/xe_tile.h                     |  21 +
 drivers/gpu/drm/xe/xe_userptr.c                  |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                       |  65 +-
 drivers/gpu/drm/xe/xe_vm.h                       |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c               | 106 +++-
 drivers/gpu/drm/xe/xe_vm_types.h                 |  21 +-
 drivers/gpu/drm/xe/xe_vram.c                     |  91 ---
 drivers/gpu/drm/xe/xe_vram.h                     |   1 -
 drivers/gpu/drm/xe/xe_vram_types.h               |  15 +-
 drivers/gpu/drm/xe/xe_vsec.c                     |   6 +-
 include/drm/drm_gpusvm.h                         |  29 +
 include/drm/drm_pagemap.h                        | 128 +++-
 include/drm/drm_pagemap_util.h                   |  92 +++
 include/uapi/drm/xe_drm.h                        |  18 +-
 62 files changed, 3880 insertions(+), 485 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
 create mode 100644 include/drm/drm_pagemap_util.h
