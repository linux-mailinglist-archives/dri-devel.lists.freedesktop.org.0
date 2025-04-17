Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B3A91935
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DB710EAA8;
	Thu, 17 Apr 2025 10:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUp1zkGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2965110EAA5;
 Thu, 17 Apr 2025 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744885370; x=1776421370;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=RadWXUmtMHWMpX2QiOTnp7UaQOFBBAwg9JKQ6I1Pka0=;
 b=LUp1zkGO8rLRzOw/Jbp+HZHEjCnGvsLKuDjyNaJqmADAS5iQLP81qAqc
 BikYudiJ2OLqvVfyWdMzFXT0EC/KDNWev8i1O20WjDXYMDvrdd2AT3kdK
 v5KpfhzhbYd7cT/cDU26dyES4yocKScNxOcYK2kSCNeBaIzG18obSaOLm
 7a20cu8UFp0aVZMSE2+V6QRHP+Os/MW5OtsW+44PvSW+kCKEJzYLg34Bz
 ZdJQEziXFmKef+hb8My/eURCX8Jf6Uil05FNECJMbo5+I1dpm3umDdr76
 WqWyq6YQnqoudQSYDg6tLoH1hXGBN3aIrazgnEibCIFDexltM45DawVL/ A==;
X-CSE-ConnectionGUID: q1orj9yXR8KY+QyxSUCJ/A==
X-CSE-MsgGUID: ynMmeZLrR2iLHwtyzqH6ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56651804"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="56651804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:22:49 -0700
X-CSE-ConnectionGUID: bx6KdGBBSPu78s4R0IRWyg==
X-CSE-MsgGUID: JNDVs24QR3mK9svTwv0SkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135863389"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.168])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:22:44 -0700
Date: Thu, 17 Apr 2025 12:22:32 +0200
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
Message-ID: <aADWaEFKVmxSnDLo@fedora>
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

The first drm-xe-next PR towards 6.16 Nothing major worth pointing out,
a lot of work and improvents all over the drivers. There is a drm_gpusvm
kernel-doc fix that touches core drm.

Thanks,
Thomas

drm-xe-next-2025-04-17:
Core Changes:
Fix drm_gpusvm kernel-doc (Lucas)

Driver Changes:
- Release guc ids before cancelling work (Tejas)
- Remove a duplicated pc_start_call (Rodrigo)
- Fix an incorrect assert in previous userptr fixes (Thomas)
- Remove gen11 assertions and prefixes (Lucas)
- Drop sentinels from arg to xe_rtp_process_to_src (Lucas)
- Temporarily disable D3Cold on BMG (Rodrigo)
- Fix MOCS debugfs LNCF readout (Tvrtko)
- Some ring flush cleanups (Tvrtko)
- Use unsigned int for alignment in fb pinning code (Tvrtko)
- Retry and wait longer for GuC PC start (Rodrigo)
- Recognize 3DSTATE_COARSE_PIXEL in LRC dumps (Matt Roper)
- Remove reduntant check in xe_vm_create_ioctl() (Xin)
- A bunch of SRIOV updates (Michal)
- Add stats for SVM page-faults (Francois)
- Fix an UAF (Harish)
- Expose fan speed (Raag)
- Fix exporting xe buffer objects multiple times (Tomasz)
- Apply a workaround (Vinay)
- Simplify pinned bo iteration (Thomas)
- Remove an incorrect "static" keywork (Lucas)
- Add support for separate firmware files on each GT (Lucas)
- Survivability handling fixes (Lucas)
- Allow to inject error in early probe (Lucas)
- Fix unmet direct dependencies warning (Yue Haibing)
- More error injection during probe (Francois)
- Coding style fix (Maarten)
- Additional stats support (Riana)
- Add fault injection for xe_oa_alloc_regs (Nakshrtra)
- Add a BMG PCI ID (Matt Roper)
- Some SVM fixes and preliminary SVM multi-device work (Thomas)
- Switch the migrate code from drm managed to dev managed (Aradhya)
- Fix an out-of-bounds shift when invalidating TLB (Thomas)
- Ensure fixed_slice_mode gets set after ccs_mode change (Niranjana)
- Use local fence in error path of xe_migrate_clear (Matthew Brost)
- More Workarounds (Julia)
- Define sysfs_ops on all directories (Tejas)
- Set power state to D3Cold during s2idle/s3 (Badal)
- Devcoredump output fix (John)
- Avoid plain 64-bit division (Arnd Bergmann)
- Reword a debug message (John)
- Don't print a hwconfig error message when forcing execlists (Stuart)
- Restore an error code to avoid a smatch warning (Rodrigo)
- Invalidate L3 read-only cachelines for geometry streams too (Kenneth)
- Make PPHWSP size explicit in xe_gt_lrc_size() (Gustavo)
- Add GT frequency events (Vinay)
- Fix xe_pt_stage_bind_walk kerneldoc (Thomas)
- Add a workaround (Aradhya)
- Rework pinned save/restore (Matthew Auld, Matthew Brost)
- Allow non-contig VRAM kernel BO (Matthew Auld)
- Support non-contig VRAM provisioning for SRIOV (Matthew Auld)
- Allow scratch-pages for unmapped parts of page-faulting VMs. (Oak)
- Ensure XE_BO_FLAG_CPU_ADDR_MIRROR had a unique value (Matt Roper)
- Fix taking an invalid lock on wedge (Lucas)
- Configs and documentation for survivability mode (Riana)
- Remove an unused macro (Shuicheng)
- Work around a page-fault full error (Matt Brost)
- Enable a SRIOV workaround (John)
- Bump the recommended GuC version (John)
- Allow to drop VRAM resizing (Lucas)
- Don't expose privileged debugfs files if VF (Michal)
- Don't show GGTT/LMEM debugfs files under media GT (Michal)
- Adjust ring-buffer emission for maximum possible size (Tvrtko)
- Fix notifier vs folio lock deadlock (Matthew Auld)
- Stop relying on placement for dma-buf unmap Matthew Auld)


The following changes since commit 5da39dce1fa3c81dc6552a16a9f748ba2980d630:

  Merge tag 'drm-xe-next-fixes-2025-03-12' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-03-14 17:02:11 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-04-17

for you to fetch changes up to d755887f8e5a2a18e15e6632a5193e5feea18499:

  drm/xe/dma_buf: stop relying on placement in unmap (2025-04-16 09:59:24 +0100)

----------------------------------------------------------------
Core Changes:
Fix drm_gpusvm kernel-doc (Lucas)

Driver Changes:
- Release guc ids before cancelling work (Tejas)
- Remove a duplicated pc_start_call (Rodrigo)
- Fix an incorrect assert in previous userptr fixes (Thomas)
- Remove gen11 assertions and prefixes (Lucas)
- Drop sentinels from arg to xe_rtp_process_to_src (Lucas)
- Temporarily disable D3Cold on BMG (Rodrigo)
- Fix MOCS debugfs LNCF readout (Tvrtko)
- Some ring flush cleanups (Tvrtko)
- Use unsigned int for alignment in fb pinning code (Tvrtko)
- Retry and wait longer for GuC PC start (Rodrigo)
- Recognize 3DSTATE_COARSE_PIXEL in LRC dumps (Matt Roper)
- Remove reduntant check in xe_vm_create_ioctl() (Xin)
- A bunch of SRIOV updates (Michal)
- Add stats for SVM page-faults (Francois)
- Fix an UAF (Harish)
- Expose fan speed (Raag)
- Fix exporting xe buffer objects multiple times (Tomasz)
- Apply a workaround (Vinay)
- Simplify pinned bo iteration (Thomas)
- Remove an incorrect "static" keywork (Lucas)
- Add support for separate firmware files on each GT (Lucas)
- Survivability handling fixes (Lucas)
- Allow to inject error in early probe (Lucas)
- Fix unmet direct dependencies warning (Yue Haibing)
- More error injection during probe (Francois)
- Coding style fix (Maarten)
- Additional stats support (Riana)
- Add fault injection for xe_oa_alloc_regs (Nakshrtra)
- Add a BMG PCI ID (Matt Roper)
- Some SVM fixes and preliminary SVM multi-device work (Thomas)
- Switch the migrate code from drm managed to dev managed (Aradhya)
- Fix an out-of-bounds shift when invalidating TLB (Thomas)
- Ensure fixed_slice_mode gets set after ccs_mode change (Niranjana)
- Use local fence in error path of xe_migrate_clear (Matthew Brost)
- More Workarounds (Julia)
- Define sysfs_ops on all directories (Tejas)
- Set power state to D3Cold during s2idle/s3 (Badal)
- Devcoredump output fix (John)
- Avoid plain 64-bit division (Arnd Bergmann)
- Reword a debug message (John)
- Don't print a hwconfig error message when forcing execlists (Stuart)
- Restore an error code to avoid a smatch warning (Rodrigo)
- Invalidate L3 read-only cachelines for geometry streams too (Kenneth)
- Make PPHWSP size explicit in xe_gt_lrc_size() (Gustavo)
- Add GT frequency events (Vinay)
- Fix xe_pt_stage_bind_walk kerneldoc (Thomas)
- Add a workaround (Aradhya)
- Rework pinned save/restore (Matthew Auld, Matthew Brost)
- Allow non-contig VRAM kernel BO (Matthew Auld)
- Support non-contig VRAM provisioning for SRIOV (Matthew Auld)
- Allow scratch-pages for unmapped parts of page-faulting VMs. (Oak)
- Ensure XE_BO_FLAG_CPU_ADDR_MIRROR had a unique value (Matt Roper)
- Fix taking an invalid lock on wedge (Lucas)
- Configs and documentation for survivability mode (Riana)
- Remove an unused macro (Shuicheng)
- Work around a page-fault full error (Matt Brost)
- Enable a SRIOV workaround (John)
- Bump the recommended GuC version (John)
- Allow to drop VRAM resizing (Lucas)
- Don't expose privileged debugfs files if VF (Michal)
- Don't show GGTT/LMEM debugfs files under media GT (Michal)
- Adjust ring-buffer emission for maximum possible size (Tvrtko)
- Fix notifier vs folio lock deadlock (Matthew Auld)
- Stop relying on placement for dma-buf unmap Matthew Auld)

----------------------------------------------------------------
Aradhya Bhatia (2):
      drm/xe/migrate: Switch from drm to dev managed actions
      drm/xe/xe2hpg: Add Wa_16025250150

Arnd Bergmann (1):
      drm/xe: avoid plain 64-bit division

Badal Nilawar (1):
      drm/xe/d3cold: Set power state to D3Cold during s2idle/s3

Francois Dugast (2):
      drm/xe/svm: Add stats for SVM page faults
      drm/xe/hw_engine_class_sysfs: Allow to inject error during probe

Gustavo Sousa (1):
      drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()

Harish Chegondi (1):
      drm/xe/eustall: Fix a possible pointer dereference after free

John Harrison (4):
      drm/xe/guc: Reformat dead CT reason string to be devcoredump compatible
      drm/xe/guc: Re-word message about ADS size changes
      drm/xe/guc: Enable w/a 16026508708
      drm/xe/guc: Bump the recommended GuC version to 70.44.1

Julia Filipchuk (1):
      drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406

Kenneth Graunke (1):
      drm/xe: Invalidate L3 read-only cachelines for geometry streams too

Lucas De Marchi (12):
      drm/gpusvm: Fix kernel-doc
      drm/xe: Remove pointless gen11 assertions
      drm/xe: Remove GEN11 prefixes from documentation
      drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()
      drm/xe/uc: Remove static from loop variable
      drm/xe/uc: Add support for different firmware files on each GT
      drm/xe: Move survivability back to xe
      drm/xe: Set survivability mode before heci init
      drm/xe: Allow to inject error in early probe
      drm/xe: Fix taking invalid lock on wedge
      drm/xe: Allow to drop vram resizing
      drm/xe: Set LRC addresses before guc load

Maarten Lankhorst (1):
      drm/xe: Remove extra spaces in xe_vm.c

Matt Roper (3):
      drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL in LRC dumps
      drm/xe/bmg: Add one additional PCI ID
      drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value

Matthew Auld (8):
      drm/xe: use backup object for pinned save/restore
      drm/xe/migrate: ignore CCS for kernel objects
      drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
      drm/xe: unconditionally apply PINNED for pin_map()
      drm/xe: allow non-contig VRAM kernel BO
      drm/xe/sriov: support non-contig VRAM provisioning
      drm/xe/userptr: fix notifier vs folio deadlock
      drm/xe/dma_buf: stop relying on placement in unmap

Matthew Brost (3):
      drm/xe: Use local fence in error path of xe_migrate_clear
      drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
      drm/xe: Add page queue multiplier

Michal Wajdeczko (14):
      drm/xe: Add MI_LOAD_REGISTER_REG command definition
      drm/xe: Add MI_MATH and ALU instruction definitions
      drm/xe: Avoid reading RMW registers in emit_wa_job
      drm/xe/vf: Stop applying save-restore MMIOs if VF
      drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
      drm/xe: Prefer USEC_PER_SEC over MICRO
      drm/xe/vf: Don't try Driver-FLR if VF
      drm/xe/vf: Catch all unexpected register reads
      drm/xe/vf: Don't check CTC_MODE[0] if VF
      drm/xe/pf: Drop CTC_MODE from VF runtime register list
      drm/xe/guc: Refactor GuC debugfs initialization
      drm/xe/guc: Don't expose GuC privileged debugfs files if VF
      drm/xe/vf: Don't expose privileged GT debugfs files if VF
      drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT

Nakshtra Goyal (1):
      drm/xe: Add fault injection for xe_oa_alloc_regs

Niranjana Vishwanathapura (1):
      drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change

Oak Zeng (3):
      drm/xe: Introduced needs_scratch bit in device descriptor
      drm/xe: Clear scratch page on vm_bind
      drm/xe: Allow scratch page under fault mode for certain platform

Raag Jadav (1):
      drm/xe/hwmon: expose fan speed

Riana Tauro (6):
      drm/xe: Add support for per-function engine activity
      drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
      drm/xe/pf: Enable per-function engine activity stats
      drm/xe: Add configfs to enable survivability mode
      drm/xe: Add documentation for survivability mode
      drm/xe: Enable configfs support for survivability mode

Rodrigo Vivi (4):
      drm/xe/guc_pc: Remove duplicated pc_start call
      drm/xe/pm: Temporarily disable D3Cold on BMG
      drm/xe/guc_pc: Retry and wait longer for GuC PC start
      drm/xe: Restore EIO errno return when GuC PC start fails

Shuicheng Lin (1):
      drm/xe: remove unused LE_COS

Stuart Summers (1):
      drm/xe: Don't print error about hwconfig when using execlists

Tejas Upadhyay (2):
      drm/xe: Release guc ids before cancelling work
      drm/xe/hw_engine: define sysfs_ops on all directories

Thomas Hellström (10):
      drm/xe/userptr: Fix an incorrect assert
      Merge drm/drm-next into drm-xe-next
      drm/xe: Simplify pinned bo iteration
      drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
      drm/xe/svm: Fix a potential bo UAF
      drm/xe/bo: Add a bo remove callback
      drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
      drm/xe: Make the PT code handle placement per PTE rather than per vma / range
      drm/xe: Fix an out-of-bounds shift when invalidating TLB
      drm/xe: Fix xe_pt_stage_bind_walk kerneldoc

Tomasz Rusinowicz (1):
      drm/xe: Fix exporting xe buffers multiple times

Tvrtko Ursulin (5):
      drm/xe: Fix MOCS debugfs LNCF readout
      drm/xe: Fix ring flush invalidation
      drm/xe: Pass flags directly to emit_flush_imm_ggtt
      drm/xe: Use correct type width for alignment in fb pinning code
      drm/xe: Adjust ringbuf emission for maximum possible size

Vinay Belgaumkar (2):
      drm/xe: Apply Wa_16023105232
      drm/xe/pmu: Add GT frequency events

Xin Wang (1):
      drm/xe: remove redundant check in xe_vm_create_ioctl()

Yue Haibing (1):
      drm/xe: Fix unmet direct dependencies warning

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  24 ++
 Documentation/gpu/xe/index.rst                     |   1 +
 Documentation/gpu/xe/xe_configfs.rst               |  10 +
 Documentation/gpu/xe/xe_pcode.rst                  |   7 +
 drivers/gpu/drm/xe/Kconfig                         |  18 +-
 drivers/gpu/drm/xe/Makefile                        |   3 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   2 +-
 drivers/gpu/drm/xe/instructions/xe_alu_commands.h  |  79 ++++
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |   1 +
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |   1 +
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   8 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  13 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   9 +-
 drivers/gpu/drm/xe/xe_bo.c                         | 429 ++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                         |  25 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   | 313 ++++++++-------
 drivers/gpu/drm/xe/xe_bo_evict.h                   |   7 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_configfs.c                   | 250 ++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h                   |  24 ++
 drivers/gpu/drm/xe/xe_device.c                     |  44 ++-
 drivers/gpu/drm/xe/xe_device_types.h               |  32 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   7 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |   6 -
 drivers/gpu/drm/xe/xe_ggtt.c                       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                         |  84 +++-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |  54 ++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  30 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   3 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  20 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |  66 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |   6 -
 drivers/gpu/drm/xe/xe_gt_stats.c                   |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |   1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  12 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_guc.c                        |   3 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  87 +++--
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   5 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                | 154 ++++----
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        | 200 ++++++++--
 drivers/gpu/drm/xe/xe_guc_engine_activity.h        |   7 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h  |  12 +-
 drivers/gpu/drm/xe/xe_guc_log.c                    |   3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  72 +++-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  11 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |   5 +
 drivers/gpu/drm/xe/xe_hmm.c                        |  30 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  45 ++-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      | 109 +++---
 drivers/gpu/drm/xe/xe_hwmon.c                      | 125 +++++-
 drivers/gpu/drm/xe/xe_lmtt.c                       |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  28 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |  30 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  11 +-
 drivers/gpu/drm/xe/xe_module.c                     |   9 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   1 +
 drivers/gpu/drm/xe/xe_pci.c                        |  27 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |  20 +
 drivers/gpu/drm/xe/xe_pcode.c                      |   2 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   3 +
 drivers/gpu/drm/xe/xe_pm.c                         |  21 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |  77 +++-
 drivers/gpu/drm/xe/xe_pt.c                         | 238 +++++++-----
 drivers/gpu/drm/xe/xe_query.c                      |   2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   3 +
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  13 +-
 drivers/gpu/drm/xe/xe_ring_ops_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   3 -
 drivers/gpu/drm/xe/xe_sa.c                         |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |  82 +++-
 drivers/gpu/drm/xe/xe_survivability_mode.h         |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  30 +-
 drivers/gpu/drm/xe/xe_svm.h                        |  80 ++--
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  90 +++--
 drivers/gpu/drm/xe/xe_vm.c                         |  42 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_vram.c                       |   5 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  18 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   6 +
 include/drm/intel/pciids.h                         |   1 +
 include/uapi/drm/xe_drm.h                          |   6 +-
 92 files changed, 2408 insertions(+), 957 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_configfs.rst
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
