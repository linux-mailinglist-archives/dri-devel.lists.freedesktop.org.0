Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D584CB81E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 08:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C44F10EE6D;
	Thu,  3 Mar 2022 07:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401D010EE6D;
 Thu,  3 Mar 2022 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646293866; x=1677829866;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6vu7jwICaIjBKxr7YS729bTNYb1reo2wCqOYNlefcIU=;
 b=lw+gRR1jSIBZ8kbRMsvbgRrl6Gbaerf9u4OXOxwxuxWjYheTEd7tKNwh
 F+mGlllo4XXs1UN0JbF7WKy80Bm8A87zKE1KPw5/rINswj97wp8Xn4FpP
 CIMm4dVSCNnoBOHjkWk+LPlMS76jCKQ3GqeP//BX6frt1yVUIAJB37fZx
 P9DXex+nNYSj1d6NC1gVaa/1pf7eG8e0CssGjKjpqS/exDe5YDjqtHqxq
 UjqiEDMFXFp/1s66lLOE+LDaIWIz10iHv/zLselvDxyeX6pBrIXGvAUNs
 kgJstdNhIjCzmVZ1cjzMhceVdmZLMT/XYqVK29owTApOw+3loxPQB2FOt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="316823667"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="316823667"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 23:51:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="551639080"
Received: from duttaman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.69])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 23:51:01 -0800
Date: Thu, 3 Mar 2022 09:50:59 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YiBzY1dM7bKwMQ3H@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here is the last feature PR for v5.18.

For new platforms we have got more DG2 enabling: small BAR foundations,
64K page support and accelerated migration. For XeHP SDV we've got flat
CCS detection and compute command streamer being added.

Disabling i915 build on PREEMPT_RT for now due to deadlocks and
warnings. Fixes to GuC data structure accesses on ARM platforms.
A couple of other GuC init and SLPC fixes.

Then the usual bits of cleanup and smaller fixes.

Regards, Joonas

***

drm-intel-gt-next-2022-03-03:

Cross-subsystem Changes:

- drm-next backmerge for buddy allocator changes

Driver Changes:

- Skip i915_perf init for DG2 as it is not yet enabled (Ram)
- Add missing workarounds for DG2 (Clint)
- Add 64K page/align support for platforms like DG2 that require it (Matt A, Ram, Bob)
- Add accelerated migration support for DG2 (Matt A)
- Add flat CCS support for XeHP SDV (Abdiel, Ram)
- Add Compute Command Streamer (CCS) engine support for XeHP SDV (Michel,
  Daniele, Aravind, Matt R)
- Don't support parallel submission on compute / render (Matt B, Matt R)

- Disable i915 build on PREEMPT_RT until RT behaviour fixed (Sebastian)
- Remove RPS interrupt support for TGL+ (Jose)
- Fix S/R with PM_EARLY for non-GTT mappable objects on DG2 (Matt, Lucas)
- Skip stolen memory init if it is fully reserved (Jose)
- Use iosys_map for GuC data structures that may be in LMEM BAR or SMEM (Lucas)
- Do not complain about stale GuC reset notifications for banned contexts (John)

- Move context descriptor fields to intel_lrc.h (Matt R)
- Start adding support for small BAR (Matt A)
- Clarify vma lifetime (Thomas)
- Simplify subplatform detection on TGL (Jose)
- Correct the param count for unset GuC SLPC param (Vinay, Umesh)
- Read RP_STATE_CAP correctly on Gen12 with GuC SLPC (Vinay)
- Initialize GuC submission locks and queues early (Daniele)
- Fix GuC flag query helper function to not modify state (John)

- Drop fake lmem support now we have real hardware available (Lucas)
- Move misplaced W/A to their correct locations (Srinivasan)
- Use get_reset_domain() helper (Tejas)
- Move context descriptor fields to intel_lrc.h (Matt R)
- Selftest improvements (Matt A)

The following changes since commit 54f43c17d681f6d9523fcfaeefc9df77993802e1:

  Merge tag 'drm-misc-next-2022-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-02-25 05:50:18 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-03-03

for you to fetch changes up to b2006061ae28fe7e84af6c9757ee89c4e505e92b:

  drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds (2022-03-02 06:52:42 -0800)

----------------------------------------------------------------
Cross-subsystem Changes:

- drm-next backmerge for buddy allocator changes

Driver Changes:

- Skip i915_perf init for DG2 as it is not yet enabled (Ram)
- Add missing workarounds for DG2 (Clint)
- Add 64K page/align support for platforms like DG2 that require it (Matt A, Ram, Bob)
- Add accelerated migration support for DG2 (Matt A)
- Add flat CCS support for XeHP SDV (Abdiel, Ram)
- Add Compute Command Streamer (CCS) engine support for XeHP SDV (Michel,
  Daniele, Aravind, Matt R)
- Don't support parallel submission on compute / render (Matt B, Matt R)

- Disable i915 build on PREEMPT_RT until RT behaviour fixed (Sebastian)
- Remove RPS interrupt support for TGL+ (Jose)
- Fix S/R with PM_EARLY for non-GTT mappable objects on DG2 (Matt, Lucas)
- Skip stolen memory init if it is fully reserved (Jose)
- Use iosys_map for GuC data structures that may be in LMEM BAR or SMEM (Lucas)
- Do not complain about stale GuC reset notifications for banned contexts (John)

- Move context descriptor fields to intel_lrc.h
- Start adding support for small BAR (Matt A)
- Clarify vma lifetime (Thomas)
- Simplify subplatform detection on TGL (Jose)
- Correct the param count for unset GuC SLPC param (Vinay, Umesh)
- Read RP_STATE_CAP correctly on Gen12 with GuC SLPC (Vinay)
- Initialize GuC submission locks and queues early (Daniele)
- Fix GuC flag query helper function to not modify state (John)

- Drop fake lmem support now we have real hardware available (Lucas)
- Move misplaced W/A to their correct locations (Srinivasan)
- Use get_reset_domain() helper (Tejas)
- Move context descriptor fields to intel_lrc.h (Matt R)
- Selftest improvements (Matt A)

----------------------------------------------------------------
Abdiel Janulgue (1):
      drm/i915/lmem: Enable lmem for platforms with Flat CCS

CQ Tang (1):
      drm/i915/xehpsdv: Add has_flat_ccs to device info

Clint Taylor (1):
      drm/i915/dg2: add Wa_14014947963

Daniele Ceraolo Spurio (4):
      drm/i915/guc: Initialize GuC submission locks and queues early
      drm/i915/xehp: compute engine pipe_control
      drm/i915/xehp/guc: enable compute engine inside GuC
      drm/i915/xehp: handle fused off CCS engines

John Harrison (2):
      drm/i915/guc: Fix flag query helper function to not modify state
      drm/i915/guc: Do not complain about stale reset notifications

José Roberto de Souza (3):
      drm/i915/tgl: Simply subplatform detection
      drm/i915/rps/tgl+: Remove RPS interrupt support
      drm/i915: Check stolen memory size before calling drm_mm_init

Lucas De Marchi (15):
      drm/i915: Kill the fake lmem support
      drm/i915/gt: Add helper for shmem copy to iosys_map
      drm/i915/guc: Keep iosys_map of ads_blob around
      drm/i915/guc: Add read/write helpers for ADS blob
      drm/i915/guc: Convert golden context init to iosys_map
      drm/i915/guc: Convert policies update to iosys_map
      drm/i915/guc: Convert engine record to iosys_map
      drm/i915/guc: Convert guc_ads_private_data_reset to iosys_map
      drm/i915/guc: Convert golden context prep to iosys_map
      drm/i915/guc: Replace check for golden context size
      drm/i915/guc: Convert mapping table to iosys_map
      drm/i915/guc: Convert capture list to iosys_map
      drm/i915/guc: Convert guc_mmio_reg_state_init to iosys_map
      drm/i915/guc: Convert __guc_ads_init to iosys_map
      drm/i915/guc: Remove plain ads_blob pointer

Matt Roper (8):
      drm/i915/xehp: Define compute class and engine
      drm/i915/xehp: CCS shares the render reset domain
      drm/i915/xehp: Add Compute CS IRQ handlers
      drm/i915/xehp: CCS should use RCS setup functions
      drm/i915: Move context descriptor fields to intel_lrc.h
      drm/i915/xehp: Define context scheduling attributes in lrc descriptor
      drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
      drm/i915/xehp: Add compute workarounds

Matthew Auld (19):
      drm/i915: enforce min GTT alignment for discrete cards
      drm/i915: support 64K GTT pages for discrete cards
      drm/i915/gtt: allow overriding the pt alignment
      drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
      drm/i915/migrate: add acceleration support for DG2
      drm/i915/uapi: document behaviour for DG2 64K support
      drm/i915/ttm: fixup the mock_bo
      drm/i915: apply PM_EARLY for non-GTT mappable objects
      drm/i915: add io_size plumbing
      drm/i915/ttm: require mappable by default
      drm/i915: add I915_BO_ALLOC_GPU_ONLY
      drm/i915/buddy: track available visible size
      drm/i915/buddy: adjust res->start
      drm/i915/buddy: tweak 2big check
      drm/i915/selftests: mock test io_size
      drm/i915/ttm: make eviction mappable aware
      drm/i915/ttm: mappable migration on fault
      drm/i915/selftests: handle allocation failures
      drm/i915/selftests: exercise mmap migration

Matthew Brost (1):
      drm/i915/xehp: Don't support parallel submission on compute / render

Ramalingam C (2):
      drm/i915/perf: Skip the i915_perf_init for dg2
      drm/i915: add needs_compact_pt flag

Robert Beckett (1):
      drm/i915: add gtt misalignment test

Sebastian Andrzej Siewior (1):
      drm/i915: Depend on !PREEMPT_RT.

Srinivasan Shanmugam (2):
      drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list
      drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds

Tejas Upadhyay (1):
      drm/i915/gt: use get_reset_domain() helper

Thomas Hellström (1):
      drm/i915: Clarify vma lifetime

Tvrtko Ursulin (1):
      Merge drm/drm-next into drm-intel-gt-next

Vinay Belgaumkar (2):
      drm/i915/guc/slpc: Correct the param count for unset param
      drm/i915/guc/slpc: Use wrapper for reading RP_STATE_CAP

 drivers/gpu/drm/i915/Kconfig                       |   1 +
 drivers/gpu/drm/i915/Kconfig.unstable              |   8 -
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  10 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |  16 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 128 +++++++-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  64 +++-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  21 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   8 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 333 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  34 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               | 158 +++++++++-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 157 ++++++++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  11 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   5 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  11 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  15 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  25 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  48 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  29 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  35 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  12 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |  51 ++++
 drivers/gpu/drm/i915/gt/intel_migrate.c            | 196 ++++++++++--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  17 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        | 140 ++-------
 drivers/gpu/drm/i915/gt/intel_region_lmem.h        |   3 -
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  17 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 138 ++++++---
 drivers/gpu/drm/i915/gt/shmem_utils.c              |  32 ++
 drivers/gpu/drm/i915/gt/shmem_utils.h              |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 238 ++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  32 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  63 ++--
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |   4 +
 drivers/gpu/drm/i915/i915_driver.c                 |  15 -
 drivers/gpu/drm/i915/i915_drv.h                    |  30 +-
 drivers/gpu/drm/i915/i915_params.c                 |   5 -
 drivers/gpu/drm/i915/i915_params.h                 |   1 -
 drivers/gpu/drm/i915/i915_pci.c                    |   3 +
 drivers/gpu/drm/i915/i915_perf.c                   |   4 +
 drivers/gpu/drm/i915/i915_reg.h                    |  24 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  87 +++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |  13 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  86 +++++-
 drivers/gpu/drm/i915/i915_vma.h                    |   3 +
 drivers/gpu/drm/i915/intel_device_info.c           |  26 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   5 +
 drivers/gpu/drm/i915/intel_memory_region.c         |  10 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   7 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  21 +-
 drivers/gpu/drm/i915/intel_step.c                  |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      | 222 ++++++++++++--
 .../gpu/drm/i915/selftests/intel_memory_region.c   | 159 +++++++++-
 drivers/gpu/drm/i915/selftests/mock_region.c       |  13 +-
 drivers/gpu/drm/i915/selftests/mock_region.h       |   3 +-
 include/uapi/drm/i915_drm.h                        |  45 ++-
 71 files changed, 2318 insertions(+), 627 deletions(-)
