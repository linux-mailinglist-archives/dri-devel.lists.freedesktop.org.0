Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5762C36D2E
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6010E77E;
	Wed,  5 Nov 2025 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIxk7raY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405C010E2EC;
 Wed,  5 Nov 2025 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762361633; x=1793897633;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HsJUcm+EmPCewu1JaIC6Yxh28fkOGW7hVpxoRaypTbc=;
 b=UIxk7raYtPfOAMvDTBH98qIVitIBCePYt3wa7y9TTBC/8nNbzGBhETEF
 rHgMeRjFteQYUaMeLa6j0Sq3cMkJeMJjQkUDPKJ1A5H+oUdWizlLUzSTz
 FkoAA6JJAg9dUxtlkSbp1sBUzx3CP3itS347s921Jal3p1e2nEYlkqIbn
 YhiAWawg971NMUy8FhHUg8uPBCwUZN5kO4OREkYe+Uao+MeZjO9/wdRbr
 owVZyPLAL233XmyznpwRLKigOmLJFVD9N/tTmYDSo8nCnVrwaMnQYvHQh
 z/fL2nD96Sb7A3Z9FDiwHaxuW1QReIMdG3RdWYjCdbyxgnpDI1Rr5weoJ Q==;
X-CSE-ConnectionGUID: iDvpEkrqSJ+q1J3gjXiDsw==
X-CSE-MsgGUID: Vl8BEab5TmuYCJCS4p6RBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63493326"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="63493326"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:53:53 -0800
X-CSE-ConnectionGUID: voAz+o5zQBC+NGPpwInjSA==
X-CSE-MsgGUID: FQKXZNcZRdmmc7aqg/FPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187673583"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:53:49 -0800
Date: Wed, 5 Nov 2025 17:53:36 +0100
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
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next
Message-ID: <aQuBECxNOhudc0Bz@fedora>
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

This week's drm-xe-next PR,

Thanks,
Thomas

drm-xe-next-2025-11-05:
UAPI Changes:

Limit number of jobs per exec queue (Shuicheng)
Add sriov_admin sysfs tree (Michal)

Driver Changes:

Fix an uninitialized value (Thomas)
Expose a residency counter through debugfs (Mohammed Thasleem)
Workaround enabling and improvement (Tapani, Tangudu)
More Crescent Island-specific support (Sk Anirban, Lucas)
PAT entry dump imprement (Xin)
Inline gt_reset in the worker (Lucas)
Synchronize GT reset with device unbind (Balasubramani)
Do clean shutdown also when using flr (Jouni)
Fix serialization on burst of unbinds (Matt Brost)
Pagefault Refactor (Matt Brost)
Remove some unused code (Gwan-gyeong)

The following changes since commit 4504e780689245f01bee6ee4c19c74051bd87593:

  drm/xe/pf: Access VF's register using dedicated MMIO view (2025-10-27 17:22:18 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-11-05

for you to fetch changes up to 424e2cce078255c1ccaf7d30ec1508ea5d1b89b1:

  drm/xe: Remove never used code in xe_vm_create() (2025-11-05 16:45:26 +0100)

----------------------------------------------------------------
UAPI Changes:

Limit number of jobs per exec queue (Shuicheng)
Add sriov_admin sysfs tree (Michal)

Driver Changes:

Fix an uninitialized value (Thomas)
Expose a residency counter through debugfs (Mohammed Thasleem)
Workaround enabling and improvement (Tapani, Tangudu)
More Crescent Island-specific support (Sk Anirban, Lucas)
PAT entry dump imprement (Xin)
Inline gt_reset in the worker (Lucas)
Synchronize GT reset with device unbind (Balasubramani)
Do clean shutdown also when using flr (Jouni)
Fix serialization on burst of unbinds (Matt Brost)
Pagefault Refactor (Matt Brost)
Remove some unused code (Gwan-gyeong)

----------------------------------------------------------------
Balasubramani Vivekanandan (2):
      drm/xe/gt: Synchronize GT reset with device unbind
      drm/xe/guc: Synchronize Dead CT worker with unbind

Gwan-gyeong Mun (1):
      drm/xe: Remove never used code in xe_vm_create()

Jouni Högander (1):
      drm/xe: Do clean shutdown also when using flr

Lucas De Marchi (7):
      drm/xe/gt_throttle: Tidy up perf reasons reading
      drm/xe/gt_throttle: Always read and mask
      drm/xe/gt_throttle: Add throttle_to_gt()
      drm/xe/gt_throttle: Tidy up attribute definition
      drm/xe: Improve freq and throttle documentation
      drm/xe/gt_throttle: Drop individual show functions
      drm/xe: Inline gt_reset in the worker

Matthew Brost (13):
      drm/xe: Enforce correct user fence signaling order using
      drm/xe: Attach last fence to TLB invalidation job queues
      drm/xe: Decouple bind queue last fence from TLB invalidations
      drm/xe: Skip TLB invalidation waits in page fault binds
      drm/xe: Disallow input fences on zero batch execs and zero binds
      drm/xe: Remove last fence dependency check from binds and execs
      drm/xe: Stub out new pagefault layer
      drm/xe: Implement xe_pagefault_init
      drm/xe: Implement xe_pagefault_reset
      drm/xe: Implement xe_pagefault_handler
      drm/xe: Implement xe_pagefault_queue_work
      drm/xe: Add xe_guc_pagefault layer
      drm/xe: Remove unused GT page fault code

Michal Wajdeczko (17):
      drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
      drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
      drm/xe/pf: Add _locked variants of the VF EQ config functions
      drm/xe/pf: Add _locked variants of the VF PT config functions
      drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
      drm/xe/pf: Relax report helper to accept PF in bulk configs
      drm/xe/pf: Fix signature of internal config helpers
      drm/xe/pf: Add functions to bulk configure EQ/PT on GT
      drm/xe/pf: Add functions to bulk provision EQ/PT
      drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
      drm/xe/pf: Add functions to provision scheduling priority
      drm/xe/pf: Allow bulk change all VFs priority using sysfs
      drm/xe/pf: Allow change PF scheduling priority using sysfs
      drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
      drm/xe/pf: Add sysfs device symlinks to enabled VFs
      drm/xe/pf: Allow to stop the VF using sysfs
      drm/xe/pf: Add documentation for sriov_admin attributes

Mohammed Thasleem (1):
      drm/xe/xe_debugfs: Expose G7 package state residency counter through debugfs

Shuicheng Lin (1):
      drm/xe: Limit number of jobs per exec queue

Sk Anirban (1):
      drm/xe/cri: Add new performance limit reasons bits

Tangudu Tilak Tirumalesh (1):
      drm/xe/xe3: Extend wa_14023061436

Tapani Pälli (1):
      drm/xe/xe3: Apply wa_14024997852

Thomas Hellström (1):
      drm/xe: Fix uninitialized return value from xe_validation_guard()

Xin Wang (1):
      drm/xe: highlight reserved PAT entries in dump output

 .../ABI/testing/sysfs-driver-intel-xe-sriov        | 159 +++++
 Documentation/gpu/xe/xe_gt_freq.rst                |   3 +
 drivers/gpu/drm/xe/Makefile                        |   4 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  13 +
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                     |  23 +-
 drivers/gpu/drm/xe/xe_device_types.h               |  11 +
 drivers/gpu/drm/xe/xe_exec.c                       |  14 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 | 124 +++-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |  23 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  17 +
 drivers/gpu/drm/xe/xe_gt.c                         |  44 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |  30 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               | 679 ---------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h               |  19 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 208 +++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |  10 +
 drivers/gpu/drm/xe/xe_gt_throttle.c                | 331 +++++-----
 drivers/gpu/drm/xe/xe_gt_types.h                   |  65 --
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   9 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c              |  95 +++
 drivers/gpu/drm/xe/xe_guc_pagefault.h              |  15 +
 drivers/gpu/drm/xe/xe_migrate.c                    |  14 +
 drivers/gpu/drm/xe/xe_migrate.h                    |   8 +
 drivers/gpu/drm/xe/xe_oa.c                         |  45 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |   8 +
 drivers/gpu/drm/xe/xe_pagefault.c                  | 445 ++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h                  |  19 +
 drivers/gpu/drm/xe/xe_pagefault_types.h            | 136 +++++
 drivers/gpu/drm/xe/xe_pat.c                        |  15 +-
 drivers/gpu/drm/xe/xe_pat.h                        |   5 +
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |  41 +-
 drivers/gpu/drm/xe/xe_pci_sriov.h                  |   1 +
 drivers/gpu/drm/xe/xe_pt.c                         |  80 +--
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |   7 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |  19 +-
 drivers/gpu/drm/xe/xe_sched_job.h                  |   1 -
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c         | 284 +++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h         |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             | 647 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h             |  16 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h             |  11 +
 drivers/gpu/drm/xe/xe_svm.c                        |   3 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  95 +--
 drivers/gpu/drm/xe/xe_sync.h                       |   3 +
 drivers/gpu/drm/xe/xe_sync_types.h                 |   3 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |  31 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h              |   5 +-
 drivers/gpu/drm/xe/xe_trace.h                      |  23 +
 drivers/gpu/drm/xe/xe_validation.h                 |   8 +-
 drivers/gpu/drm/xe/xe_vm.c                         | 101 +--
 drivers/gpu/drm/xe/xe_vm_types.h                   |   6 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   2 +
 55 files changed, 2731 insertions(+), 1268 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
