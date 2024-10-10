Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA359982F4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B1910E8B9;
	Thu, 10 Oct 2024 09:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkBltsjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DEC10E8AB;
 Thu, 10 Oct 2024 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728554208; x=1760090208;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TY9ePVg8u5qy9gBnmmQpvToIZFGIBxXE+ud4RRxmWms=;
 b=ZkBltsjY0SIERndlFAsMoMq38yqg2/UiNYVvi1hcrM8E5o9k26/F+VW1
 Na+tv8WBej6MPFhCf0uTCDCz2qT2zxoRavTKIS9YfFtB1OVfKrSPtNu8P
 OqbCdDtRaGYApChHu43QPD9U/tpYrXmQ8PXK5omrOWowM+4pwNhNUtNCZ
 mUMtjyqe/wtkKQP8iRKEcDqF6SVOSVM6C6z3bbh5uNDTfInoxpgHgt5+K
 Zu1b36xnvXDODXZHoNvIDobkZdYnoqSwT2HnhNm2szQuVW6+FvkWiuISL
 GuGtfJhjLC6s7kMzPl2GyJu+B+GfEPJwJyIBBG8PYhvt+cW7HNxhWPCGS g==;
X-CSE-ConnectionGUID: DBZdBTuVSpWBBFCFOxUZ6g==
X-CSE-MsgGUID: MqxngMrXSnKFPNK8W4JWiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38488125"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="38488125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:56:48 -0700
X-CSE-ConnectionGUID: EdO4aiSwQEe4+WvchPNCUw==
X-CSE-MsgGUID: oCIsBP/WRAGMom8GeB511Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="77018911"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.227])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:56:44 -0700
Date: Thu, 10 Oct 2024 11:56:18 +0200
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next
Message-ID: <Zwekwrak12c5SSgo@fedora>
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

Hi Dave & Simona

First drm-xe-next pull request for 6.13

Thanks,
Thomas

drm-xe-next-2024-10-10:
Cross-subsystem Changes:
- Add drm_line_printer (Michal)

Driver Changes:
- Fix an UAF (Matt Auld)
- Sanity check compression and coherency mode (Matt Auld)
- Some PIC-ID work (Jani)
- Use IS_ENABLED() instead of defined() on config options.
- gt powergating work (Riana)
- Suppress missing out ter rpm protection warning (Rodrigo)
- Fix a vm leak  (Dafna)
- Clean up and update 'has_flat_ccs' handling (Lucas)
- Fix arg to pci_iomap (Lucas)
- Mark reserved engines in shapshot (Lucas)
- Don't keep stale pointer (Michal)
- Fix build warning with CONFIG_PM=n (Arnd)
- Add a xe_bo subtest for shrinking / swapping (Thomas)
- Add a warkaround (Tejas)
- Some display PM work (Maarten)
- Enable Xe2 + PES disaggregation (Ashutosh)
- Large xe_mmio rework / cleanup (Matt Roper)
- A couple of fixes / cleanups in the xe client code (Matt Auld)
- Fix page-fault handling on closed VMs  (Matt Brost)
- Fix overflow in OA batch buffer (José)
- Style fixes (Lucas, Jiapeng, Nitin)
- Fixes and new development around SRIOV (Michal)
- Use devm_add_action_or_reset() in gt code (He)
- Fix CCS offset calculation (Matt Auld)
- Remove i915_drv.h include (Rodrigo)
- Restore PCI state on resume (Rodrigo)
- Fix DSB buffer coherency / Revert DSB disabling (Maarten / Animesh)
- Convert USM lock to rwsem (Matt Brost)
- Defer gt-mmio intialization (Matt Roper)
- meemirq changes (Ilia)
- Move some PVC related code out of xe-for-CI and to the driver (Rodrigo / Jani)
- Use a helper for ASID->VM lookup (Matt Brost)
- Add new PCI id for ARL (Dnyaneshwar)
- Use Xe2_LPM steering tables for Xe2_HPM (Gustavo)
- Performance tuning work for media GT and L3 cache flushing (Gustavo)
- Clean up VM- and exec queue file lock usage (Matt Brost)
- GuC locking fix (Matt Auld)
- Fix UAF around queue destruction (Matt Auld)
- Move IRQ-related registers to dedicated header (Matt Roper)
- Resume TDR after GT reset (Matt Brost)
- Move xa_alloc to prevent UAF (Matt Auld)
- Fix OA stream close (José)
- Remove unused i915_gpu_error.h (Jani)
- Prevent null pointer access in xe_migrate_copy (Zhanjun)
- Fix memory leak when aborting binds (Matt Brost)
- Prevent UAF in send_recv() (Matt Auld)
- Fix xa_store() error checking (Matt Auld)
- drop irq disabling around xa_erase in guc code (Matt Auld)
- Use fault injection infrastructure to find issues as probe time (Francois)
- Fix a workaround implementation. (Vinay)
- Mark wedged_mode debugfs writable (Matt Roper)
- Fix for prviewous memirq work (Michal)
- More SRIOV work (Michal)
- Devcoredump work (John)
- GuC logging + devcoredump support (John)
- Don't report L3 bank availability on PTL (Shekhar)
- Replicate Xe2 PAT settings on Xe2 (Matt Roper)
- Define Xe3 feature flags (Haridhar)
- Reuse Xe2 MOCS table on on PTL (Haridhar)
- Add PTL platform definition (Haridhar)
- Add MCR steering for Xe3 (Matt)
- More work around GuC capture for devcoredump (Zhanjun)
- Improve cache flushing behaviour on bmg (Matt Auld)
- Fix shrinker test compiler warnings on 32-bit (Thomas)
- Initial set of workarounds for Xe3 (Gustavo)
- Extend workaround for xe2lpg (Aradhya)
- Fix unbalanced rpm put x 2 (Matt Auld)

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-10-10

for you to fetch changes up to a187c1b0a800565a4db6372268692aff99df7f53:

  drm/xe: fix unbalanced rpm put() with declare_wedged() (2024-10-10 09:15:59 +0100)

----------------------------------------------------------------
Cross-subsystem Changes:
- Add drm_line_printer (Michal)

Driver Changes:
- Fix an UAF (Matt Auld)
- Sanity check compression and coherency mode (Matt Auld)
- Some PIC-ID work (Jani)
- Use IS_ENABLED() instead of defined() on config options.
- gt powergating work (Riana)
- Suppress missing out ter rpm protection warning (Rodrigo)
- Fix a vm leak  (Dafna)
- Clean up and update 'has_flat_ccs' handling (Lucas)
- Fix arg to pci_iomap (Lucas)
- Mark reserved engines in shapshot (Lucas)
- Don't keep stale pointer (Michal)
- Fix build warning with CONFIG_PM=n (Arnd)
- Add a xe_bo subtest for shrinking / swapping (Thomas)
- Add a warkaround (Tejas)
- Some display PM work (Maarten)
- Enable Xe2 + PES disaggregation (Ashutosh)
- Large xe_mmio rework / cleanup (Matt Roper)
- A couple of fixes / cleanups in the xe client code (Matt Auld)
- Fix page-fault handling on closed VMs  (Matt Brost)
- Fix overflow in OA batch buffer (José)
- Style fixes (Lucas, Jiapeng, Nitin)
- Fixes and new development around SRIOV (Michal)
- Use devm_add_action_or_reset() in gt code (He)
- Fix CCS offset calculation (Matt Auld)
- Remove i915_drv.h include (Rodrigo)
- Restore PCI state on resume (Rodrigo)
- Fix DSB buffer coherency / Revert DSB disabling (Maarten / Animesh)
- Convert USM lock to rwsem (Matt Brost)
- Defer gt-mmio intialization (Matt Roper)
- meemirq changes (Ilia)
- Move some PVC related code out of xe-for-CI and to the driver (Rodrigo / Jani)
- Use a helper for ASID->VM lookup (Matt Brost)
- Add new PCI id for ARL (Dnyaneshwar)
- Use Xe2_LPM steering tables for Xe2_HPM (Gustavo)
- Performance tuning work for media GT and L3 cache flushing (Gustavo)
- Clean up VM- and exec queue file lock usage (Matt Brost)
- GuC locking fix (Matt Auld)
- Fix UAF around queue destruction (Matt Auld)
- Move IRQ-related registers to dedicated header (Matt Roper)
- Resume TDR after GT reset (Matt Brost)
- Move xa_alloc to prevent UAF (Matt Auld)
- Fix OA stream close (José)
- Remove unused i915_gpu_error.h (Jani)
- Prevent null pointer access in xe_migrate_copy (Zhanjun)
- Fix memory leak when aborting binds (Matt Brost)
- Prevent UAF in send_recv() (Matt Auld)
- Fix xa_store() error checking (Matt Auld)
- drop irq disabling around xa_erase in guc code (Matt Auld)
- Use fault injection infrastructure to find issues as probe time (Francois)
- Fix a workaround implementation. (Vinay)
- Mark wedged_mode debugfs writable (Matt Roper)
- Fix for prviewous memirq work (Michal)
- More SRIOV work (Michal)
- Devcoredump work (John)
- GuC logging + devcoredump support (John)
- Don't report L3 bank availability on PTL (Shekhar)
- Replicate Xe2 PAT settings on Xe2 (Matt Roper)
- Define Xe3 feature flags (Haridhar)
- Reuse Xe2 MOCS table on on PTL (Haridhar)
- Add PTL platform definition (Haridhar)
- Add MCR steering for Xe3 (Matt)
- More work around GuC capture for devcoredump (Zhanjun)
- Improve cache flushing behaviour on bmg (Matt Auld)
- Fix shrinker test compiler warnings on 32-bit (Thomas)
- Initial set of workarounds for Xe3 (Gustavo)
- Extend workaround for xe2lpg (Aradhya)
- Fix unbalanced rpm put x 2 (Matt Auld)

----------------------------------------------------------------
Animesh Manna (1):
      drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"

Aradhya Bhatia (1):
      drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg

Arnd Bergmann (1):
      drm/xe: fix build warning with CONFIG_PM=n

Ashutosh Dixit (1):
      drm/xe/oa: Enable Xe2+ PES disaggregation

Dafna Hirschfeld (1):
      drm/xe: fix missing 'xe_vm_put'

Dnyaneshwar Bhadane (1):
      drm/xe/pciid: Add new PCI id for ARL

Francois Dugast (1):
      drm/xe: Use fault injection infrastructure to find issues at probe time

Gustavo Sousa (5):
      drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
      drm/xe/xe2: Extend performance tuning to media GT
      drm/xe/xe2: Assume tuning settings also apply for future media GT
      drm/xe/xe2: Add performance tuning for L3 cache flushing
      drm/xe/xe3: Add initial set of workarounds

Haridhar Kalvala (3):
      drm/xe/xe3: Define Xe3 feature flags
      drm/xe/ptl: PTL re-uses Xe2 MOCS table
      drm/xe/ptl: Add PTL platform definition

He Lugang (1):
      drm/xe: use devm_add_action_or_reset() helper

Ilia Levi (5):
      drm/xe: Introduce dedicated config for memirq debug
      drm/xe: Introduce xe_device_uses_memirq()
      drm/xe: move memirq out of VF
      drm/xe: memirq infra changes for MSI-X
      drm/xe: memirq handler changes

Jani Nikula (5):
      drm/xe/pciids: add some missing ADL-N PCI IDs
      drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
      drm/xe/pciids: separate ARL and MTL PCI IDs
      drm/xe: use IS_ENABLED() instead of defined() on config options
      drm/xe/compat: remove unused i915_gpu_error.h

Jiapeng Chong (1):
      drm/xe/irq: Remove unneeded semicolon

John Harrison (10):
      drm/xe/guc: Remove spurious line feed in debug print
      drm/xe/devcoredump: Use drm_puts and already cached local variables
      drm/xe/devcoredump: Improve section headings and add tile info
      drm/xe/devcoredump: Add ASCII85 dump helper function
      drm/xe/guc: Copy GuC log prior to dumping
      drm/xe/guc: Use a two stage dump for GuC logs and add more info
      drm/xe/guc: Dead CT helper
      drm/xe/guc: Dump entire CTB on errors
      drm/xe/guc: Add GuC log to devcoredump captures
      drm/xe/guc: Add a helper function for dumping GuC log to dmesg

José Roberto de Souza (2):
      drm/xe/oa: Fix overflow in oa batch buffer
      drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close

Lucas De Marchi (6):
      drm/xe: Cleanup has_flat_ccs handling
      drm/xe: Update runtime detection of has_flat_ccs
      drm/xe: Fix arg to pci_iomap()
      drm/xe: Mark reserved engines in snapshot
      Merge drm/drm-next into drm-xe-next
      drm/xe/rtp: Remove unneeded semicolon

Maarten Lankhorst (4):
      drm/xe: Fix missing conversion to xe_display_pm_runtime_resume
      drm/xe: Remove runtime argument from display s/r functions
      drm/xe: Wire up device shutdown handler
      drm/xe: Fix DSB buffer coherency

Matt Roper (48):
      drm/xe: Move forcewake to 'gt.pm' substructure
      drm/xe: Create dedicated xe_mmio structure
      drm/xe: Clarify size of MMIO region
      drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
      drm/xe: Populate GT's mmio iomap from tile during init
      drm/xe: Switch mmio_ext to use 'struct xe_mmio'
      drm/xe: Add xe_tile backpointer to xe_mmio
      drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
      drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
      drm/xe/irq: Convert register access to use xe_mmio
      drm/xe/pcode: Convert register access to use xe_mmio
      drm/xe/hwmon: Convert register access to use xe_mmio
      drm/xe/vram: Convert register access to use xe_mmio
      drm/xe/compat-i915: Convert register access to use xe_mmio
      drm/xe/lmtt: Convert register access to use xe_mmio
      drm/xe/stolen: Convert register access to use xe_mmio
      drm/xe/device: Convert register access to use xe_mmio
      drm/xe/pci: Convert register access to use xe_mmio
      drm/xe/wa: Convert register access to use xe_mmio
      drm/xe/uc: Convert register access to use xe_mmio
      drm/xe/guc: Convert register access to use xe_mmio
      drm/xe/huc: Convert register access to use xe_mmio
      drm/xe/gsc: Convert register access to use xe_mmio
      drm/xe/query: Convert register access to use xe_mmio
      drm/xe/mcr: Convert register access to use xe_mmio
      drm/xe/mocs: Convert register access to use xe_mmio
      drm/xe/hw_engine: Convert register access to use xe_mmio
      drm/xe/gt_throttle: Convert register access to use xe_mmio
      drm/xe/pat: Convert register access to use xe_mmio
      drm/xe/wopcm: Convert register access to use xe_mmio
      drm/xe/oa: Convert register access to use xe_mmio
      drm/xe/topology: Convert register access to use xe_mmio
      drm/xe/execlist: Convert register access to use xe_mmio
      drm/xe/gt_clock: Convert register access to use xe_mmio
      drm/xe/reg_sr: Convert register access to use xe_mmio
      drm/xe/gt: Convert register access to use xe_mmio
      drm/xe/sriov: Convert register access to use xe_mmio
      drm/xe/tlb: Convert register access to use xe_mmio
      drm/xe/gt_idle: Convert register access to use xe_mmio
      drm/xe/forcewake: Convert register access to use xe_mmio
      drm/xe/ggtt: Convert register access to use xe_mmio
      drm/xe/ccs_mode: Convert register access to use xe_mmio
      drm/xe/mmio: Drop compatibility macros
      drm/xe: Defer gt->mmio initialization until after multi-tile setup
      drm/xe: Move IRQ-related registers to dedicated header
      drm/xe: Make wedged_mode debugfs writable
      drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
      drm/xe/xe3lpm: Add new "instance0" steering table

Matthew Auld (18):
      drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
      drm/xe/pat: sanity check compression and coh_mode
      drm/xe/client: fix deadlock in show_meminfo()
      drm/xe/client: add missing bo locking in show_meminfo()
      drm/xe/client: use mem_type from the current resource
      drm/xe/bo: add some annotations in bo_put()
      drm/xe/vram: fix ccs offset calculation
      drm/xe/guc_submit: add missing locking in wedged_fini
      drm/xe: fix UAF around queue destruction
      drm/xe/vm: move xa_alloc to prevent UAF
      drm/xe/queue: move xa_alloc to prevent UAF
      drm/xe/ct: prevent UAF in send_recv()
      drm/xe/ct: fix xa_store() error checking
      drm/xe/guc_submit: fix xa_store() error checking
      drm/xe/ct: drop irq usage of xa_erase()
      drm/xe/bmg: improve cache flushing behaviour
      drm/xe: fix unbalanced rpm put() with fence_fini()
      drm/xe: fix unbalanced rpm put() with declare_wedged()

Matthew Brost (6):
      drm/xe: Do not run GPU page fault handler on a closed VM
      drm/xe: Convert to USM lock to rwsem
      drm/xe: Use helper for ASID -> VM in GPU faults and access counters
      drm/xe: Clean up VM / exec queue file lock usage.
      drm/xe: Resume TDR after GT reset
      drm/xe: Fix memory leak when aborting binds

Michal Wajdeczko (15):
      drm/xe/pf: Sanitize VF scratch registers on FLR
      drm/xe: Don't keep stale pointer to bo->ggtt_node
      drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
      drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
      drm/xe/pf: Add functions to save and restore VF GuC state
      drm/xe/pf: Save VF GuC state when pausing VF
      drm/xe/pf: Allow to view and replace VF GuC state over debugfs
      drm/xe/pf: Allow to trigger VF GuC state restore from debugfs
      drm/xe: Add memirq report page address helpers
      drm/xe/guc: Add yet another helper macro for threshold
      drm/xe/pf: Update success code of pf_validate_vf_config()
      drm/xe/pf: Allow to encode subset of VF configuration KLVs
      drm/xe/pf: Add functions to save and restore VF configuration blob
      drm/xe/pf: Allow to save and restore VF config blob from debugfs
      drm/print: Introduce drm_line_printer

Nitin Gote (1):
      drm/xe: Replace double space with single space after comma

Riana Tauro (2):
      drm/xe/xe_gt_idle: modify powergate enable condition
      drm/xe/xe_gt_idle: add debugfs entry for powergating info

Rodrigo Vivi (4):
      drm/xe: Suppress missing outer rpm protection warning
      drm/xe/display: Remove i915_drv.h include
      drm/xe: Restore pci state upon resume
      drm/xe/pciids: Add PVC's PCI device ID macros

Shekhar Chauhan (1):
      drm/xe/ptl: L3bank mask is not available on the media GT

Tejas Upadhyay (1):
      drm/xe/xe2hpg: Add Wa_15016589081

Thomas Hellström (3):
      drm/xe: Add a xe_bo subtest for shrinking / swapping
      Merge drm/drm-next into drm-xe-next
      drm/xe/tests: Fix the shrinker test compiler warnings.

Vinay Belgaumkar (1):
      drm/xe: Restore GT freq on GSC load error

Yu Jiaoliang (1):
      drm/xe: Use ERR_CAST to return an error-valued pointer

Zhanjun Dong (7):
      drm/xe: Prevent null pointer access in xe_migrate_copy
      drm/xe/guc: Prepare GuC register list and update ADS size for error capture
      drm/xe/guc: Add XE_LP steered register lists
      drm/xe/guc: Add capture size check in GuC log buffer
      drm/xe/guc: Extract GuC error capture lists
      drm/xe/guc: Plumb GuC-capture into dev coredump
      drm/xe/guc: Save manual engine capture into capture list

 drivers/gpu/drm/drm_print.c                        |   14 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |    4 -
 drivers/gpu/drm/xe/Kconfig.debug                   |   12 +
 drivers/gpu/drm/xe/Makefile                        |    2 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |    8 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |   61 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h           |  186 ++
 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |    1 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h               |   75 +
 .../drm/xe/compat-i915-headers/i915_gpu_error.h    |   17 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   36 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   95 +-
 drivers/gpu/drm/xe/display/xe_display.h            |   12 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    9 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   81 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |    1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |   82 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |    2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |   14 -
 drivers/gpu/drm/xe/tests/xe_bo.c                   |  240 +++
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |    4 +-
 drivers/gpu/drm/xe/xe_assert.h                     |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   38 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |    2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |  157 +-
 drivers/gpu/drm/xe/xe_devcoredump.h                |    6 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   21 +-
 drivers/gpu/drm/xe/xe_device.c                     |  118 +-
 drivers/gpu/drm/xe/xe_device.h                     |   15 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   81 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    6 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   19 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |    4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   10 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |    5 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |    2 +
 drivers/gpu/drm/xe/xe_gsc.c                        |   24 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |    4 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   44 +-
 drivers/gpu/drm/xe/xe_gt.h                         |    2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |    2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |    6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   13 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |    6 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  125 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |    2 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h              |    2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   68 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |    1 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   39 +-
 drivers/gpu/drm/xe/xe_gt_printk.h                  |    2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   56 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |    1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  204 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |   44 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |  127 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |  419 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h      |   24 +
 .../gpu/drm/xe/xe_gt_sriov_pf_migration_types.h    |   40 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |    6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |    2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |    2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   37 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |    1 -
 drivers/gpu/drm/xe/xe_gt_topology.c                |   22 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   22 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   72 +-
 drivers/gpu/drm/xe/xe_guc.h                        |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  164 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c                | 1972 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h                |   61 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h          |   68 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  486 +++--
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   10 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   29 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |   26 +-
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h     |    7 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |  320 +++-
 drivers/gpu/drm/xe/xe_guc_log.h                    |   15 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h              |   34 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   34 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |    2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  131 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h                  |    4 +
 drivers/gpu/drm/xe/xe_huc.c                        |    6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  305 +--
 drivers/gpu/drm/xe/xe_hw_engine.h                  |    6 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |   68 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   16 +-
 drivers/gpu/drm/xe/xe_irq.c                        |   78 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |    2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   26 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |   19 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |  203 +-
 drivers/gpu/drm/xe/xe_memirq.h                     |    6 +-
 drivers/gpu/drm/xe/xe_memirq_types.h               |    4 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  139 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |   35 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |   17 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   57 +-
 drivers/gpu/drm/xe/xe_pat.c                        |   23 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   61 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |    4 +-
 drivers/gpu/drm/xe/xe_platform_types.h             |    1 +
 drivers/gpu/drm/xe/xe_pm.c                         |    8 +-
 drivers/gpu/drm/xe/xe_pt.c                         |    2 +-
 drivers/gpu/drm/xe/xe_query.c                      |   49 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   17 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |    2 +-
 drivers/gpu/drm/xe/xe_sa.c                         |    2 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |    5 +-
 drivers/gpu/drm/xe/xe_tile.c                       |    3 +
 drivers/gpu/drm/xe/xe_trace.h                      |    7 +-
 drivers/gpu/drm/xe/xe_trace_bo.h                   |    2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    8 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |   30 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   19 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   36 +-
 drivers/gpu/drm/xe/xe_vram.c                       |    7 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   57 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    2 +
 drivers/gpu/drm/xe/xe_wopcm.c                      |   15 +-
 include/drm/drm_print.h                            |   64 +
 include/drm/intel/xe_pciids.h                      |   46 +-
 include/uapi/drm/xe_drm.h                          |    4 +-
 134 files changed, 6402 insertions(+), 1322 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_irq_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h
