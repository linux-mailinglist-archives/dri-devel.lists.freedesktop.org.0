Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C357CC144F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D9310E38D;
	Tue, 28 Oct 2025 11:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhuKsopp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195710E1D9;
 Tue, 28 Oct 2025 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761650181; x=1793186181;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=dI1rzBa7ds/3W/v9SECEKeI/r7j/lqEjo7QIszR9sKU=;
 b=hhuKsoppiRuJapuNsVv+UD9PPJ5gMr1zGeOzJM8u9dvdvPXGi/XRDI8B
 VQ+2rQRmBsAq9WTCr1PjTZR0nPLWfZZ0jxhL2VGH98V5ilLpmtIbs5tQC
 geJRUq7D8lEwpPdY9ZUazhKtogxn6wgDfqSFwifK1aVpoOSlFgoTlu4pF
 fTi9EF6OVQ/apBZ7ToUOaJDmQmkS4busApvIMA4FFvorWaJEZ7iXJJB7L
 SltIDjv+o9NO7wCp9MeFRcuSeWRsuLe2nIE8T9oxkiIm46S688kHOgA5B
 kbtXGRT/RsIuiuYRZ6fwQuVtOLO+VSMel3ZCvpTh6MEGxHpciCc9zTC5q g==;
X-CSE-ConnectionGUID: fQzq2dg6TIOqj/lDomvOYg==
X-CSE-MsgGUID: WvivcIPBSniXosheg6PQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51320065"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="51320065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 04:16:20 -0700
X-CSE-ConnectionGUID: ryapZbfhREixWD+l6PxmzQ==
X-CSE-MsgGUID: qow/7ryiSx+k3eS+STijjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184948414"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 04:16:16 -0700
Date: Tue, 28 Oct 2025 12:16:06 +0100
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
Message-ID: <aQCl9uJxN6CWJ8Vg@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Simona!

This weeks drm-xe-next PR.

drm-xe-next-2025-10-28:
Driver Changes:
More xe3p support (Harish, Brian, Balasubramani, Matt Roper)
Make panic support work on VRAM for display (Maarten)
Fix stolen size check (Shuicheng)
xe_pci_test update (Gustavo)
VF migration updates (Tomasz)
A couple of fixes around allocation and PM references (Matt Brost)
Migration update for the MEM_COPY instruction (Matt Auld)
Initial CRI support (Balasubramani, Matt Roper)
Use SVM range helpers in PT layer (Matt Brost)
Drop MAX_GT_TYPE_CHARS constant (Matt Roper)
Fix spelling and typos (Sanjay)
Fix VF FLR synchronization between all GTs (Michal)
Add a Workaround (Nitin)
Access VF's register using dedicated MMIO view (Michal)
The following changes since commit d104d7ea864c1b9d8ffb3d93a58d49f9395be670:

  drm/xe/xe3p: Add xe3p EU stall data format (2025-10-18 19:45:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-10-28

for you to fetch changes up to 4504e780689245f01bee6ee4c19c74051bd87593:

  drm/xe/pf: Access VF's register using dedicated MMIO view (2025-10-27 17:22:18 +0100)

----------------------------------------------------------------
Driver Changes:
More xe3p support (Harish, Brian, Balasubramani, Matt Roper)
Make panic support work on VRAM for display (Maarten)
Fix stolen size check (Shuicheng)
xe_pci_test update (Gustavo)
VF migration updates (Tomasz)
A couple of fixes around allocation and PM references (Matt Brost)
Migration update for the MEM_COPY instruction (Matt Auld)
Initial CRI support (Balasubramani, Matt Roper)
Use SVM range helpers in PT layer (Matt Brost)
Drop MAX_GT_TYPE_CHARS constant (Matt Roper)
Fix spelling and typos (Sanjay)
Fix VF FLR synchronization between all GTs (Michal)
Add a Workaround (Nitin)
Access VF's register using dedicated MMIO view (Michal)

----------------------------------------------------------------
Balasubramani Vivekanandan (2):
      drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
      drm/xe/cri: Add CRI platform definition

Brian Welty (1):
      drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT

Gustavo Sousa (2):
      drm/xe/tests/pci: Convert GT count check to general device check
      drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level

Maarten Lankhorst (2):
      drm/xe: Extract xe_bo_is_visible_vram
      drm/xe/display: Make panic support work on vram.

Matt Roper (4):
      drm/xe/cri: Setup MOCS table
      drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as "INSTANCE0"
      drm/xe/xe3p_xpc: Add MCR steering for NODE and L3BANK ranges
      drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant

Matthew Auld (7):
      drm/xe/migrate: fix offset and len check
      drm/xe/migrate: rework size restrictions for sram pte emit
      drm/xe/migrate: fix chunk handling for 2M page emit
      drm/xe/migrate: fix batch buffer sizing
      drm/xe/migrate: trim batch buffer sizing
      drm/xe/migrate: support MEM_COPY instruction
      drm/xe/migrate: skip bounce buffer path on xe2

Matthew Brost (4):
      drm/xe: Check return value of GGTT workqueue allocation
      drm/xe: Do not wake device during a GT reset
      drm/xe: Avoid PM wake reference during VF migration
      drm/xe: Use SVM range helpers in PT layer

Michal Wajdeczko (2):
      drm/xe/pf: Fix VF FLR synchronization between all GTs
      drm/xe/pf: Access VF's register using dedicated MMIO view

Nitin Gote (1):
      drm/xe/xe3: Add WA_14024681466 for Xe3_LPG

Sanjay Yadav (1):
      drm/xe: Fix spelling and typos across Xe driver files

Shuicheng Lin (1):
      drm/xe: Fix stolen size check to allow equal WOPCM size

Tomasz Lis (4):
      drm/xe/vf: Revert logic of vf.migration.enabled
      drm/xe/vf: Fix GuC FW check for VF migration support
      drm/xe: Assert that VF will never use fixed placement of BOs
      drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/display/xe_panic.c             |  50 +++++---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h              |  10 ++
 drivers/gpu/drm/xe/tests/xe_pci_test.c            |  16 ++-
 drivers/gpu/drm/xe/xe_bo.c                        |  29 ++++-
 drivers/gpu/drm/xe/xe_bo.h                        |   1 +
 drivers/gpu/drm/xe/xe_bo_doc.h                    |   8 +-
 drivers/gpu/drm/xe/xe_configfs.c                  |   5 +-
 drivers/gpu/drm/xe/xe_device.c                    |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h              |  10 +-
 drivers/gpu/drm/xe/xe_exec.c                      |   2 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                      |   3 +
 drivers/gpu/drm/xe/xe_gt.c                        |  19 ++--
 drivers/gpu/drm/xe/xe_gt_freq.c                   |   2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                    |  35 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c               |  36 ++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |   7 +-
 drivers/gpu/drm/xe/xe_gt_topology.c               |   7 ++
 drivers/gpu/drm/xe/xe_gt_topology.h               |   2 +
 drivers/gpu/drm/xe/xe_gt_types.h                  |   9 +-
 drivers/gpu/drm/xe/xe_guc.c                       |  46 ++++++++
 drivers/gpu/drm/xe/xe_guc.h                       |   1 +
 drivers/gpu/drm/xe/xe_guc_ads.c                   |   6 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                  |   1 +
 drivers/gpu/drm/xe/xe_guc_log_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c             |   2 +-
 drivers/gpu/drm/xe/xe_map.h                       |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c                   | 132 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate_doc.h               |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c                      |  29 +++++
 drivers/gpu/drm/xe/xe_mmio.h                      |   4 +
 drivers/gpu/drm/xe/xe_mocs.c                      |  26 +++++
 drivers/gpu/drm/xe/xe_pci.c                       |  20 ++++
 drivers/gpu/drm/xe/xe_pci_types.h                 |   1 +
 drivers/gpu/drm/xe/xe_platform_types.h            |   1 +
 drivers/gpu/drm/xe/xe_pm.c                        |   2 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h       |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                        |  28 ++---
 drivers/gpu/drm/xe/xe_range_fence.h               |   4 +-
 drivers/gpu/drm/xe/xe_sched_job.c                 |   6 +-
 drivers/gpu/drm/xe/xe_sched_job.h                 |  12 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h           |   2 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                  |  39 +++----
 drivers/gpu/drm/xe/xe_sriov_vf.h                  |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c              |  46 +++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h            |   6 +-
 drivers/gpu/drm/xe/xe_svm.c                       |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.h                 |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c            |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h        |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h               |   6 +-
 drivers/gpu/drm/xe/xe_uc_types.h                  |   2 +-
 drivers/gpu/drm/xe/xe_validation.h                |   6 +-
 drivers/gpu/drm/xe/xe_vm.c                        |  10 +-
 drivers/gpu/drm/xe/xe_vm_doc.h                    |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h                  |   4 +-
 drivers/gpu/drm/xe/xe_wa.c                        |   4 +
 include/drm/intel/pciids.h                        |   4 +
 63 files changed, 534 insertions(+), 216 deletions(-)
