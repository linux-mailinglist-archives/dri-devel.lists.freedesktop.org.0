Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57707BEFF79
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549B10E276;
	Mon, 20 Oct 2025 08:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qo4x9Pxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110BC10E03E;
 Mon, 20 Oct 2025 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760949124; x=1792485124;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=x+0RC7RQH+1rkA9AspXIWHdOThxWLWlqumwgsCbqmy8=;
 b=Qo4x9PxhWT0Atg4IdVCr3x0te2usyngjg6RZc9coZLSQxhw3q4Wct8ob
 np2V5u5ek/qfZzDT4EguyXXmWYvdmgytlMFk1E5URwmcJEb+hKtU+bFc5
 kGhtz8Td4XDvdgXh/BnMGLAnesauBNs+7etJrUvHM3+OFCiHEnZg+PHmO
 /QekDqCSG42mBwSXnp6z16AyckUAiXIwNuQzUsPNaM0Z8hCW9NfkV2U7t
 CkRFvMgzz8sw97dAKjg5NHHQ1qXcr/TaDPBSWPIOuZfJ/fZDnhN3Jkv9b
 ZMF8m35CL7MFSUnM8SJ7IunG6c5QGXNTfBmLGwRsyNfm8uAma/gEQ8dxr g==;
X-CSE-ConnectionGUID: JK3RLo+aRE6+2ZT/4hoEMA==
X-CSE-MsgGUID: vziHMcGTRAq/K43GPjWQBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73665445"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="73665445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 01:32:04 -0700
X-CSE-ConnectionGUID: DbSgpAt3RCi/Fid8k1gwIw==
X-CSE-MsgGUID: yPtFUuGFRMO4Y+6vu3JJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187690890"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora) ([10.245.245.4])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 01:31:58 -0700
Date: Mon, 20 Oct 2025 10:31:40 +0200
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
Message-ID: <aPXzbOb7eGbkgMrr@fedora>
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

Hi, Dave, Simona.

The first drm-xe-next PR towards 6.19.
Below are the highlights, but in addition a number of fixes and
documentation updates.

Worth mentioning are a couple of reverts that are due to a redesign
of VF migration recovery.

drm-xe-next-2025-10-20:
Highlights:

UAPI Changes:
Loosen used tracking restriction (Matthew Auld)
New SR-IOV debugfs structure and debugfs updates (Michal Wajdeczko)
Hide the GPU madvise flag behind a VM_BIND flag (Thomas Hellström)
Always expose VRAM provisioning data on discrete GPUs (Lukasz Laguna)

Cross-subsystem Changes:
Allow VRAM mappings for userptr when used with SVM (Matthew Brost)

Driver Changes:
Allow pinning of p2p dma-buf (Thomas Hellstrom)
Use per-tile debugfs where appropriate (Michal Wajdeczko)
Add documentation for Execution Queues (Niranjana Vishwanathapura)
PF improvements (Michal Wajdeczko)
VF migration recovery redesign work (Matthew Brost)
User / Kernel VRAM partitioning (Piotr Piórkowski)
Update Tile-based messages (Michal Wajdeczko)
Allow configfs to disable specific GT types (Matt Roper)
VF provisioning improvements (Michal Wajdeczko)
Initial Xe3P support (Various people)
The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-10-20

for you to fetch changes up to d104d7ea864c1b9d8ffb3d93a58d49f9395be670:

  drm/xe/xe3p: Add xe3p EU stall data format (2025-10-18 19:45:14 -0700)

----------------------------------------------------------------
Highlights:

UAPI Changes:
Loosen used tracking restriction (Matthew Auld)
New SR-IOV debugfs structure and debugfs updates (Michal Wajdeczko)
Hide the GPU madvise flag behind a VM_BIND flag (Thomas Hellström)
Always expose VRAM provisioning data on discrete GPUs (Lukasz Laguna)

Cross-subsystem Changes:
Allow VRAM mappings for userptr when used with SVM (Matthew Brost)

Driver Changes:
Allow pinning of p2p dma-buf (Thomas Hellstrom)
Use per-tile debugfs where appropriate (Michal Wajdeczko)
Add documentation for Execution Queues (Niranjana Vishwanathapura)
PF improvements (Michal Wajdeczko)
VF migration recovery redesign work (Matthew Brost)
User / Kernel VRAM partitioning (Piotr Piórkowski)
Update Tile-based messages (Michal Wajdeczko)
Allow configfs to disable specific GT types (Matt Roper)
VF provisioning improvements (Michal Wajdeczko)
Initial Xe3P support (Various people)

----------------------------------------------------------------
Arun Abhishek Chowhan (1):
      drm/xe: Sort include files alphabetically.

Badal Nilawar (1):
      drm/xe: Prevent runtime PM wake while reading rp0 frequency

Balasubramani Vivekanandan (3):
      drm/xe: Drop CTC_MODE register read
      drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
      drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition

Colin Ian King (1):
      drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset

Dnyaneshwar Bhadane (1):
      drm/xe/nvls: Attach MOCS table for NVL-S

Fei Yang (1):
      drm/xe/xe3p_xpc: Add L3 bank mask

Harish Chegondi (1):
      drm/xe/xe3p: Add xe3p EU stall data format

Kenneth Graunke (1):
      drm/xe: Increase global invalidation timeout to 1000us

Lucas De Marchi (15):
      drm/xe/psmi: Do not return NULL
      drm/xe/configfs: Fix engine class parsing
      drm/xe/configfs: Improve doc for ctx_restore* attributes
      drm/xe/device: Use poll_timeout_us() to wait for lmem
      drm/xe/guc_pc: Use poll_timeout_us() for waiting
      drm/xe/guc: Drop helper to read freq
      drm/xe/guc: Extract function to print load error
      drm/xe/guc: Refactor GuC load to use poll_timeout_us()
      drm/xe: Move rebar to be done earlier
      drm/xe: Add GT_VER() to check version specific to gt type
      drm/xe/irq: Rename fuse mask variables
      drm/xe/irq: Split irq mask per engine class
      drm/xe/irq: Rename bits used with all engines
      drm/xe/irq: Check fuse mask for media engines
      drm/xe/xe3p_xpc: Add support for compute walker for non-MSIx

Lukasz Laguna (1):
      drm/xe/pf: Always expose VRAM provisioning data on discrete GPUs

Mallesh Koujalagi (1):
      drm/xe/xe_late_bind_fw: Initialize uval variable in xe_late_bind_fw_num_fans()

Matt Roper (31):
      drm/xe/kunit: Fix kerneldoc for parameterized tests
      drm/xe/huc: Adjust HuC check on primary GT
      drm/xe: Drop GT parameter to xe_display_irq_postinstall()
      drm/xe: Move 'va_bits' flag back to platform descriptor
      drm/xe: Move 'vm_max_level' flag back to platform descriptor
      drm/xe: Move 'vram_flags' flag back to platform descriptor
      drm/xe: Move 'has_flatccs' flag back to platform descriptor
      drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
      drm/xe: Move primary GT allocation from xe_tile_init_early to xe_tile_init
      drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
      drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
      drm/xe/pmu: Initialize PMU event types based on first available GT
      drm/xe: Check for primary GT before looking up Wa_22019338487
      drm/xe: Make display part of Wa_22019338487 a device workaround
      drm/xe/irq: Don't try to lookup engine masks for non-existent primary GT
      drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds
      drm/xe/rtp: Pass xe_device parameter to FUNC matches
      drm/xe: Bypass Wa_14018094691 when primary GT is disabled
      drm/xe: Correct lineage for Wa_22014953428 and only check with valid GT
      drm/xe: Check that GT is not NULL before testing Wa_16023588340
      drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
      drm/xe: Break GT setup out of xe_info_init()
      drm/xe/configfs: Add attribute to disable GT types
      drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
      drm/xe/xe3p_lpm: Handle MCR steering
      drm/xe/xe3p: Stop programming RCU_MODE's fixed slice mode setting
      drm/xe/xe3p: Determine service copy availability from fuse
      drm/xe/nvl: Define NVL-S platform
      drm/xe/xe3p_xpc: Add MCR steering
      drm/xe/xe3p_xpc: Skip compression tuning on platforms without flatccs
      drm/xe/xe3p_xpc: Setup PAT table

Matthew Auld (3):
      drm/xe/uapi: loosen used tracking restriction
      drm/xe/migrate: don't misalign current bytes
      drm/xe/evict: drop bogus assert

Matthew Brost (40):
      Revert "drm/xe/vf: Rebase exec queue parallel commands during migration recovery"
      Revert "drm/xe/vf: Post migration, repopulate ring area for pending request"
      Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
      drm/xe: Add NULL checks to scratch LRC allocation
      drm/xe: Save off position in ring in which a job was programmed
      drm/xe/guc: Track pending-enable source in submission state
      drm/xe: Track LR jobs in DRM scheduler pending list
      drm/xe: Return first unsignaled job first pending job helper
      drm/xe: Don't change LRC ring head on job resubmission
      drm/xe: Make LRC W/A scratch buffer usage consistent
      drm/xe/vf: Add xe_gt_recovery_pending helper
      drm/xe/vf: Make VF recovery run on per-GT worker
      drm/xe/vf: Abort H2G sends during VF post-migration recovery
      drm/xe/vf: Remove memory allocations from VF post migration recovery
      drm/xe: Move GGTT lock init to alloc
      drm/xe/vf: Move LMEM config to tile layer
      drm/xe/vf: Close multi-GT GGTT shift race
      drm/xe/vf: Teardown VF post migration worker on driver unload
      drm/xe/vf: Don't allow GT reset to be queued during VF post migration recovery
      drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
      drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration
      drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
      drm/xe/vf: Flush and stop CTs in VF post migration recovery
      drm/xe/vf: Reset TLB invalidations during VF post migration recovery
      drm/xe/vf: Kickstart after resfix in VF post migration recovery
      drm/xe: Add CTB_H2G_BUFFER_OFFSET define
      drm/xe/vf: Start CTs before resfix VF post migration recovery
      drm/xe/vf: Abort VF post migration recovery on failure
      drm/xe/vf: Replay GuC submission state on pause / unpause
      drm/xe: Move queue init before LRC creation
      drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
      drm/xe/vf: Workaround for race condition in GuC firmware during VF pause
      drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
      drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
      drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
      drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
      drm/xe: Handle mixed mappings and existing VRAM on atomic faults
      drm/xe: Fix build_pt_update_batch_sram for non-4K PAGE_SIZE
      drm/xe: Enable 2M pages in xe_migrate_vram
      drm/gpusvm, drm/xe: Allow mixed mappings for userptr

Michal Wajdeczko (37):
      drm/xe/debugfs: Make ggtt file per-tile
      drm/xe/debugfs: Improve .show() helper for GT-based attributes
      drm/xe/tests: Fix build break on clang 16.0.6
      drm/xe/vf: Rename sriov_update_device_info
      drm/xe/vf: Don't claim support for firmware late-bind if VF
      drm/xe/pf: Promote PF debugfs function to its own file
      drm/xe/pf: Create separate debugfs tree for SR-IOV files
      drm/xe/pf: Populate SR-IOV debugfs tree with tiles
      drm/xe/pf: Move SR-IOV GT debugfs files to new tree
      drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
      drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
      drm/xe/debugfs: Update xe_gt_topology_dump signature
      drm/xe/debugfs: Update xe_wa_dump signature
      drm/xe/debugfs: Update xe_tuning_dump signature
      drm/xe/debugfs: Update xe_mocs_dump signature
      drm/xe/debugfs: Update xe_pat_dump signature
      drm/xe: Detect GT workqueue allocation failure
      drm/xe/pf: Add top level functions to control VFs
      drm/xe/pf: Log only top level VF state changes
      drm/xe/pf: Expose VF control operations over debugfs
      drm/xe/pf: Unify VF state tracking log
      drm/xe/pf: Split VF FLR processing function
      drm/xe/pf: Synchronize VF FLR between all GTs
      drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
      drm/xe/xe_late_bind_fw: Fix and simplify parsing user input
      drm/xe/pf: Make the late-initialization really late
      drm/xe: Update SRIOV printk macros
      drm/xe: Add tile-based SRIOV printk macros
      drm/xe/pf: Update LMTT to use tile-based messages
      drm/xe: Update MEMIRQ to use tile-based printk macros
      drm/xe/guc: Ratelimit diagnostic messages from the relay
      drm/xe/pf: Improve reading VF config blob from debugfs
      drm/xe/pf: Add max_vfs configfs attribute to control PF mode
      drm/xe/pf: Promote VFs provisioning helpers
      drm/xe/pf: Automatically provision VFs only in auto-mode
      drm/xe/pf: Disable auto-provisioning if changed using debugfs
      drm/xe/pf: Allow to restore auto-provisioning mode

Niranjana Vishwanathapura (1):
      drm/xe/doc: Add documentation for Execution Queues

Piotr Piórkowski (5):
      drm/xe: Add initial support for separate kernel VRAM region on the tile
      drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
      drm/xe: Force user context allocations in user VRAM
      drm/xe/pf: Force use user VRAM for LMEM provisioning
      drm/xe: Combine userspace context check

Raag Jadav (5):
      drm/xe/hwmon: Drop redundant runtime PM usage
      drm/xe/sysfs: Drop redundant runtime PM usage
      drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path
      drm/xe/i2c: Introduce xe_i2c_irq_present()
      drm/xe/i2c: Wire up reset/postinstall for I2C IRQ

Sanjay Yadav (1):
      drm/xe/uapi: Add documentation for DRM_XE_GEM_CREATE_FLAG_SCANOUT

Satyanarayana K V P (2):
      drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
      drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC

Shekhar Chauhan (2):
      drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05
      drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03

Shuicheng Lin (7):
      drm/xe/hw_engine_group: Fix double write lock release in error path
      drm/xe: Fix copyright and function naming in xe_ttm_vram_mgr
      drm/xe: Fix copyright and function naming in xe_ttm_sys_mgr
      drm/xe: Fix copyright in xe_ttm_stolen_mgr
      drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64
      drm/xe/guc: Check GuC running state before deregistering exec queue
      drm/xe: Fix comments in xe_gt struct

Tejas Upadhyay (1):
      drm/xe: Move declarations under conditional branch

Thomas Hellström (13):
      Merge drm/drm-next into drm-xe-next
      drm/xe: Don't copy pinned kernel bos twice on suspend
      drm/xe: Pre-allocate system memory for pinned external bos in the pm notfier
      drm/xe/dma-buf: Allow pinning of p2p dma-buf
      drm/xe/pm: Hold the validation lock around evicting user-space bos for suspend
      drm/xe/pm: Add lockdep annotation for the pm_block completion
      drm/xe/bo: Fix an idle assertion for local bos
      drm/gpusvm, drm/xe: Fix userptr to not allow device private pages
      drm/xe/migrate: Fix an error path
      Merge drm/drm-next into drm-xe-next
      drm/xe/svm: Ensure data will be migrated to system if indicated by madvise.
      drm/xe: Retain vma flags when recreating and splitting vmas for madvise
      drm/xe/uapi: Hide the madvise autoreset behind a VM_BIND flag

Tomasz Lis (1):
      drm/xe/ct: Separate waiting for retry from ct send function

Vinay Belgaumkar (1):
      drm/xe: Enable media sampler power gating

Wang Xin (2):
      drm/xe: Dump CURRENT_LRCA register
      drm/xe/xe3p: Dump CSMQDEBUG register

 Documentation/gpu/xe/index.rst                    |   1 +
 Documentation/gpu/xe/xe_exec_queue.rst            |  20 +
 drivers/gpu/drm/drm_gpusvm.c                      |   6 +-
 drivers/gpu/drm/xe/Kconfig.debug                  |  22 +-
 drivers/gpu/drm/xe/Makefile                       |   6 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h          |   8 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c       |   4 +-
 drivers/gpu/drm/xe/display/xe_display.c           |   5 +-
 drivers/gpu/drm/xe/display/xe_display.h           |   4 +-
 drivers/gpu/drm/xe/display/xe_display_wa.c        |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c     |   4 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h          |   4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h              |   8 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h             |   3 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h             |   8 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c             |  17 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                 |  11 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c            |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                        |  78 ++-
 drivers/gpu/drm/xe/xe_bo.h                        |   3 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                  |  17 +-
 drivers/gpu/drm/xe/xe_configfs.c                  | 282 ++++++++++
 drivers/gpu/drm/xe/xe_configfs.h                  |   8 +
 drivers/gpu/drm/xe/xe_debugfs.c                   |  15 +-
 drivers/gpu/drm/xe/xe_device.c                    |  78 +--
 drivers/gpu/drm/xe/xe_device_sysfs.c              |  10 +-
 drivers/gpu/drm/xe/xe_device_types.h              |  15 +-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules         |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c                   |  41 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                  |  28 +-
 drivers/gpu/drm/xe/xe_exec.c                      |  15 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                | 120 +++--
 drivers/gpu/drm/xe/xe_exec_queue.h                |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h          |   3 +
 drivers/gpu/drm/xe/xe_execlist.c                  |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                      |  70 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c             |  27 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h             |  29 +-
 drivers/gpu/drm/xe/xe_gsc.c                       |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                        |  53 +-
 drivers/gpu/drm/xe/xe_gt.h                        |  19 +
 drivers/gpu/drm/xe/xe_gt_clock.c                  |  19 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c                | 159 ++----
 drivers/gpu/drm/xe/xe_gt_debugfs.h                |   1 +
 drivers/gpu/drm/xe/xe_gt_freq.c                   |   7 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                   |   8 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                    |  67 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       |  98 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h       |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c       | 440 ++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h           |   7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c               | 470 ++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h               |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h         |  34 +-
 drivers/gpu/drm/xe/xe_gt_topology.c               |  17 +-
 drivers/gpu/drm/xe/xe_gt_topology.h               |   2 +-
 drivers/gpu/drm/xe/xe_gt_types.h                  |  25 +-
 drivers/gpu/drm/xe/xe_guc.c                       | 273 +++++-----
 drivers/gpu/drm/xe/xe_guc_ads.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c               |  29 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                    | 371 +++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h                    |  13 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h      |  15 +
 drivers/gpu/drm/xe/xe_guc_pc.c                    |  47 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                 |  17 +-
 drivers/gpu/drm/xe/xe_guc_relay_types.h           |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c                | 617 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h                |   7 +-
 drivers/gpu/drm/xe/xe_huc.c                       |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                 |  62 ++-
 drivers/gpu/drm/xe/xe_hwmon.c                     |   8 -
 drivers/gpu/drm/xe/xe_i2c.c                       |  28 +-
 drivers/gpu/drm/xe/xe_i2c.h                       |   4 +
 drivers/gpu/drm/xe/xe_irq.c                       | 136 +++--
 drivers/gpu/drm/xe/xe_lmtt.c                      |  11 +-
 drivers/gpu/drm/xe/xe_lrc.c                       |  20 +-
 drivers/gpu/drm/xe/xe_lrc.h                       |  16 +-
 drivers/gpu/drm/xe/xe_map.h                       |  18 -
 drivers/gpu/drm/xe/xe_memirq.c                    |  57 +-
 drivers/gpu/drm/xe/xe_memirq.h                    |   2 +
 drivers/gpu/drm/xe/xe_migrate.c                   | 113 +++-
 drivers/gpu/drm/xe/xe_mocs.c                      |  16 +-
 drivers/gpu/drm/xe/xe_mocs.h                      |   8 +-
 drivers/gpu/drm/xe/xe_oa.c                        |   3 +-
 drivers/gpu/drm/xe/xe_pat.c                       | 136 ++++-
 drivers/gpu/drm/xe/xe_pat.h                       |   7 +-
 drivers/gpu/drm/xe/xe_pci.c                       | 266 +++++++---
 drivers/gpu/drm/xe/xe_pci_sriov.c                 |  53 +-
 drivers/gpu/drm/xe/xe_pci_types.h                 |  10 +-
 drivers/gpu/drm/xe/xe_platform_types.h            |   2 +
 drivers/gpu/drm/xe/xe_pm.c                        |  66 +++
 drivers/gpu/drm/xe/xe_pm.h                        |   2 +
 drivers/gpu/drm/xe/xe_pmu.c                       |  11 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c             |  11 +
 drivers/gpu/drm/xe/xe_psmi.c                      |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                        |   6 +-
 drivers/gpu/drm/xe/xe_query.c                     |   2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c             |   3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                  |  23 +-
 drivers/gpu/drm/xe/xe_rtp.c                       |  31 +-
 drivers/gpu/drm/xe/xe_rtp.h                       |  30 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                 |   4 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h           |   9 +
 drivers/gpu/drm/xe/xe_sriov.c                     |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf.c                  |  70 +--
 drivers/gpu/drm/xe/xe_sriov_pf.h                  |  18 +-
 drivers/gpu/drm/xe/xe_sriov_pf_control.c          | 151 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h          |  17 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c          | 264 +++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h          |  18 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h          |  11 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c        | 154 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h        |  31 ++
 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h  |  36 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h            |   4 +
 drivers/gpu/drm/xe/xe_sriov_printk.h              |  12 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                  | 243 ---------
 drivers/gpu/drm/xe/xe_sriov_vf.h                  |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c              |  28 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h            |   4 -
 drivers/gpu/drm/xe/xe_svm.c                       |  22 +-
 drivers/gpu/drm/xe/xe_tile.c                      |  14 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c              |  19 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.h              |   3 +
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c     | 253 +++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h     |  15 +
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h         |  33 ++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c             | 114 +++-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h             |   9 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h       |  23 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c               |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c              |   6 +-
 drivers/gpu/drm/xe/xe_tuning.c                    |  26 +-
 drivers/gpu/drm/xe/xe_tuning.h                    |   2 +-
 drivers/gpu/drm/xe/xe_userptr.c                   |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                        | 159 +++---
 drivers/gpu/drm/xe/xe_vm_types.h                  |  11 +-
 drivers/gpu/drm/xe/xe_vram.c                      |  46 +-
 drivers/gpu/drm/xe/xe_vram.h                      |   1 +
 drivers/gpu/drm/xe/xe_wa.c                        |  27 +-
 drivers/gpu/drm/xe/xe_wa.h                        |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                |  17 +-
 include/drm/drm_gpusvm.h                          |   4 +
 include/drm/intel/pciids.h                        |  16 +-
 include/uapi/drm/xe_drm.h                         |  21 +-
 150 files changed, 4810 insertions(+), 2140 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_exec_queue.rst
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
