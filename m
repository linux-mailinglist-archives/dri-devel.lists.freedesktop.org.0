Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099468AE70F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 14:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68211337A;
	Tue, 23 Apr 2024 12:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fY0/JoS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8BC10F80E;
 Tue, 23 Apr 2024 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713876902; x=1745412902;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=k8tXSR0NCc321xbVkY4yH+G2xzkE9yqvte9Ldhy1Kzs=;
 b=fY0/JoS5BPC0zFrmq5AIDy2B8buOv/mqxw+e0+kXYSqMSfdHU7/498Gw
 TefCGOa5mjx0wTNPidOz7lLq1qaVVDs71/ezI1lKk4Py3m8sSfrPJDr6x
 rk5auPwSne/mtYdTF1pYejhp+r7HsQv/p7t2A8ps2jV0GkC2wnnEaPhvf
 NaTyC/+4mDV5yKLbdKwk5zAfnWZavzoUjaBshDloaCUuTXXcuWAOpodZo
 qLiEQtC1Y8EcH7IM4Dw3ScH2LzyCHbJGXE4SMej1/lBNrf0eZ4jBzMZrv
 DlYIJIZ/GdYxt5Oyf4gKYxUV6URfm3YwCH9QqsHumgYcDpWIpcImh1/6S g==;
X-CSE-ConnectionGUID: XP5AeLpRQDGibm0dM2C8QQ==
X-CSE-MsgGUID: 9eeP9fyuQt6PDBCgNMUm9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20858756"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20858756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:55:01 -0700
X-CSE-ConnectionGUID: ZDpCnFbkSUW9jhSHVij8rw==
X-CSE-MsgGUID: WSzYIZJPRxGtXQLzTw4VZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24866865"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora)
 ([10.249.254.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:54:58 -0700
Date: Tue, 23 Apr 2024 14:54:45 +0200
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <Zievlb1wvqDg1ovi@fedora>
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

Hi, Dave, Sima

The main -next 6.10 pull request for the xe driver. I scanned through the patches and
tried to provide a somewhat condensed log below.

Nothing spectacular in the uAPI changes. Among other things there are some flags
that are reinstated now that we have published UMD for them. Unfortunately some
of the underlying implementation got somehow lost in a backmerge but there is a
patch pending to reinstate that. Will send another pull-request this week, or
if you want I can resend this one when the patch passes review and CI with the
patch included.

Some hickups unfortunately in that we carry a couple of i915 patches.
One that got mistakenly commited to drm-xe-next, but was later acked-by
Rodrigo for carrying in drm-xe-next to simplify handling. There is also one
that was part of the PM rework, and a fix for that patch.

Thanks,
Thomas

drm-xe-next-2024-04-23:
UAPI Changes:
- Remove unused flags (Francois Dugast)
- Extend uAPI to query HuC micro-controler firmware version (Francois Dugast)
- drm/xe/uapi: Define topology types as indexes rather than masks
  (Francois Dugast)
- drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
  (Francois Dugast)
- devcoredump updates. Some touching the output format.
  (José Roberto de Souza, Matthew Brost)
- drm/xe/hwmon: Add infra to support card power and energy attributes
- Improve LRC, HWSP and HWCTX error capture. (Maarten Lankhorst)
- drm/xe/uapi: Add IP version and stepping to GT list query (Matt roper)
- Invalidate userptr VMA on page pin fault (Matthew Brost)
- Improve xe_bo_move tracepoint (Priyanka Danamudi)
- Align fence output format in ftrace log

Cross-driver Changes:
- drm/i915/hwmon: Get rid of devm (Ashutosh Dixit)
  (Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>)
- drm/i915/display: convert inner wakeref get towards get_if_in_use
  (SOB Rodrigo Vivi)
- drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref
  (Committer, SOB Jani Nikula)

Driver Changes:
- Fix for unneeded CCS metadata allocation (Akshata Jahagirdar)
- Fix for fix multicast support for Xe_LP platforms (Andrzej Hajda)
- A couple of build fixes (Arnd Bergmann)
- Fix register definition (Ashutosh Dixit)
- Add BMG mocs table (Balasubramani Vivekanandan)
- Replace sprintf() across driver (Bommu Krishnaiah)
- Add an xe2 workaround (Bommu Krishnaiah)
- Makefile fix (Dafna Hirschfeld)
- force_wake_get error value check (Daniele Ceraolo Spurio)
- Handle GSCCS ER interrupt (Daniele Ceraolo Spurio)
- GSC Workaround (Daniele Ceraolo Spurio)
- Build error fix (Dawei Li)
- drm/xe/gt: Add L3 bank mask to GT topology (Francois Dugast)
- Implement xe2- and GuC workarounds (Gustavo Sousa, Haridhar Kalvala,
  Himal rasad Ghimiray, John Harrison, Matt Roper, Radhakrishna Sripada,
  Vinay Belgaumkar, Badal Nilawar)
- xe2hpg compression (Himal Ghimiray Prasad)
- Error code cleanups and fixes (Himal Prasad Ghimiray)
- struct xe_device cleanup (Jani Nikula)
- Avoid validating bos when only requesting an exec dma-fence
  (José Roberto de Souza)
- Remove debug message from migrate_clear (José Roberto de Souza)
- Nuke EXEC_QUEUE_FLAG_PERSISTENT leftover internal flag (José Roberto de Souza)
- Mark dpt and related vma as uncached (Juha-Pekka Heikkila)
- Hwmon updates (Karthik Poosa)
- KConfig fix when ACPI_WMI selcted (Lu Yao)
- Update intel_uncore_read*() return types (Luca Coelho)
- Mocs updates (Lucas De Marchi, Matt Roper)
- Drop dynamic load-balancing workaround (Lucas De Marchi)
- Fix a PVC workaround (Lucas De Marchi)
- Group live kunit tests into a single module (Lucas De Marchi)
- Various code cleanups (Lucas De Marchi)
- Fix a ggtt init error patch and move ggtt invalidate out of ggtt lock
  (Maarten Lankhorst)
- Fix a bo leak (Marten Lankhorst)
- Add LRC parsing for more GPU instructions (Matt Roper)
- Add various definitions for hardware and IP (Matt Roper)
- Define all possible engines in media IP descriptors (Matt Roper)
- Various cleanups, asserts and code fixes (Matthew Auld)
- Various cleanups and code fixes (Matthew Brost)
- Increase VM_BIND number of per-ioctl Ops (Matthew Brost, Paulo Zanoni)
- Don't support execlists in xe_gt_tlb_invalidation layer (Matthew Brost)
- Handle timing out of already signaled jobs gracefully (Matthew Brost)
- Pipeline evict / restore of pinned BOs during suspend / resume (Matthew Brost)
- Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
  (Matthew Brost)
- Drop ggtt invalidate from display code (Matthew Brost)
- drm/xe: Add XE_BO_GGTT_INVALIDATE flag (Matthew Brost)
- Add debug messages for MMU notifier and VMA invalidate (Matthew Brost)
- Use ordered wq for preempt fence waiting (Matthew Brost)
- Initial development for SR-IOV support including some refactoring
  (Michal Wajdeczko)
- Various GuC- and GT- related cleanups and fixes (Michal Wajdeczko)
- Move userptr over to start using hmm_range_fault (Oak Zeng)
- Add new PCI IDs to DG2 platform (Ravi Kumar Vodapalli)
- Pcode - and VRAM initialization check update (Riana Tauro)
- Large PM update including i915 display patches, and a fix for one of those.
  (Rodrigo Vivi)
- Introduce performance tuning changes for Xe2_HPG (Shekhar Chauhan)
- GSC / HDCP updates (Suraj Kandpal)
- Minor code cleanup (Tejas Upadhyay)
- Rework / fix rebind TLB flushing and move rebind into the drm_exec locking loop
  (Thomas Hellström)
- Backmerge (Thomas Hellström)
- GuC updates and fixes (Vinay Belgaumkar, Zhanjun Dong)

The following changes since commit 6e1f415e7129f7cd4c2394af83b35cdcdd40baf7:

  Merge tag 'drm-misc-next-2024-04-10' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-04-11 13:36:01 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-04-23

for you to fetch changes up to 48c64d495fbef343c59598a793d583dfd199d389:

  drm/xe/guc: Fix arguments passed to relay G2H handlers (2024-04-22 20:08:04 +0200)

----------------------------------------------------------------
UAPI Changes:
- Remove unused flags (Francois Dugast)
- Extend uAPI to query HuC micro-controler firmware version (Francois Dugast)
- drm/xe/uapi: Define topology types as indexes rather than masks
  (Francois Dugast)
- drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
  (Francois Dugast)
- devcoredump updates. Some touching the output format.
  (José Roberto de Souza, Matthew Brost)
- drm/xe/hwmon: Add infra to support card power and energy attributes
- Improve LRC, HWSP and HWCTX error capture. (Maarten Lankhorst)
- drm/xe/uapi: Add IP version and stepping to GT list query (Matt roper)
- Invalidate userptr VMA on page pin fault (Matthew Brost)
- Improve xe_bo_move tracepoint (Priyanka Danamudi)
- Align fence output format in ftrace log

Cross-driver Changes:
- drm/i915/hwmon: Get rid of devm (Ashutosh Dixit)
  (Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>)
- drm/i915/display: convert inner wakeref get towards get_if_in_use
  (SOB Rodrigo Vivi)
- drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref
  (Committer, SOB Jani Nikula)

Driver Changes:
- Fix for unneeded CCS metadata allocation (Akshata Jahagirdar)
- Fix for fix multicast support for Xe_LP platforms (Andrzej Hajda)
- A couple of build fixes (Arnd Bergmann)
- Fix register definition (Ashutosh Dixit)
- Add BMG mocs table (Balasubramani Vivekanandan)
- Replace sprintf() across driver (Bommu Krishnaiah)
- Add an xe2 workaround (Bommu Krishnaiah)
- Makefile fix (Dafna Hirschfeld)
- force_wake_get error value check (Daniele Ceraolo Spurio)
- Handle GSCCS ER interrupt (Daniele Ceraolo Spurio)
- GSC Workaround (Daniele Ceraolo Spurio)
- Build error fix (Dawei Li)
- drm/xe/gt: Add L3 bank mask to GT topology (Francois Dugast)
- Implement xe2- and GuC workarounds (Gustavo Sousa, Haridhar Kalvala,
  Himal rasad Ghimiray, John Harrison, Matt Roper, Radhakrishna Sripada,
  Vinay Belgaumkar, Badal Nilawar)
- xe2hpg compression (Himal Ghimiray Prasad)
- Error code cleanups and fixes (Himal Prasad Ghimiray)
- struct xe_device cleanup (Jani Nikula)
- Avoid validating bos when only requesting an exec dma-fence
  (José Roberto de Souza)
- Remove debug message from migrate_clear (José Roberto de Souza)
- Nuke EXEC_QUEUE_FLAG_PERSISTENT leftover internal flag (José Roberto de Souza)
- Mark dpt and related vma as uncached (Juha-Pekka Heikkila)
- Hwmon updates (Karthik Poosa)
- KConfig fix when ACPI_WMI selcted (Lu Yao)
- Update intel_uncore_read*() return types (Luca Coelho)
- Mocs updates (Lucas De Marchi, Matt Roper)
- Drop dynamic load-balancing workaround (Lucas De Marchi)
- Fix a PVC workaround (Lucas De Marchi)
- Group live kunit tests into a single module (Lucas De Marchi)
- Various code cleanups (Lucas De Marchi)
- Fix a ggtt init error patch and move ggtt invalidate out of ggtt lock
  (Maarten Lankhorst)
- Fix a bo leak (Marten Lankhorst)
- Add LRC parsing for more GPU instructions (Matt Roper)
- Add various definitions for hardware and IP (Matt Roper)
- Define all possible engines in media IP descriptors (Matt Roper)
- Various cleanups, asserts and code fixes (Matthew Auld)
- Various cleanups and code fixes (Matthew Brost)
- Increase VM_BIND number of per-ioctl Ops (Matthew Brost, Paulo Zanoni)
- Don't support execlists in xe_gt_tlb_invalidation layer (Matthew Brost)
- Handle timing out of already signaled jobs gracefully (Matthew Brost)
- Pipeline evict / restore of pinned BOs during suspend / resume (Matthew Brost)
- Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
  (Matthew Brost)
- Drop ggtt invalidate from display code (Matthew Brost)
- drm/xe: Add XE_BO_GGTT_INVALIDATE flag (Matthew Brost)
- Add debug messages for MMU notifier and VMA invalidate (Matthew Brost)
- Use ordered wq for preempt fence waiting (Matthew Brost)
- Initial development for SR-IOV support including some refactoring
  (Michal Wajdeczko)
- Various GuC- and GT- related cleanups and fixes (Michal Wajdeczko)
- Move userptr over to start using hmm_range_fault (Oak Zeng)
- Add new PCI IDs to DG2 platform (Ravi Kumar Vodapalli)
- Pcode - and VRAM initialization check update (Riana Tauro)
- Large PM update including i915 display patches, and a fix for one of those.
  (Rodrigo Vivi)
- Introduce performance tuning changes for Xe2_HPG (Shekhar Chauhan)
- GSC / HDCP updates (Suraj Kandpal)
- Minor code cleanup (Tejas Upadhyay)
- Rework / fix rebind TLB flushing and move rebind into the drm_exec locking loop
  (Thomas Hellström)
- Backmerge (Thomas Hellström)
- GuC updates and fixes (Vinay Belgaumkar, Zhanjun Dong)

----------------------------------------------------------------
Akshata Jahagirdar (1):
      drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx

Andrzej Hajda (1):
      drm/xe: fix multicast support for Xe_LP platforms

Arnd Bergmann (3):
      drm/xe/kunit: fix link failure with built-in xe
      drm/xe/mmio: fix build warning for BAR resize on 32-bit
      drm/xe/xe2: fix 64-bit division in pte_update_size

Ashutosh Dixit (2):
      drm/xe: Label RING_CONTEXT_CONTROL as masked
      drm/i915/hwmon: Get rid of devm

Badal Nilawar (2):
      drm/xe/guc: Add support for workaround KLVs
      drm/xe/lnl: Enable GuC Wa_14019882105

Balasubramani Vivekanandan (1):
      drm/xe/bmg: Add BMG mocs table

Bommu Krishnaiah (3):
      drm/xe: prefer snprintf over sprintf
      drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()
      drm/xe/xe2: Add workaround 18034896535

Dafna Hirschfeld (1):
      drm/xe: Replace 'grouped target' in Makefile with pattern rule

Daniele Ceraolo Spurio (6):
      drm/xe/gsc: Handle GSCCS ER interrupt
      drm/xe/guc: Don't support older GuC 70.x releases
      drm/xe: Always check force_wake_get return code
      drm/xe/uc: Use u64 for offsets for which we use upper_32_bits()
      drm/xe/guc: Check error code when initializing the CT mutex
      drm/xe/gsc: Implement WA 14018094691

Dawei Li (1):
      drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused

Francois Dugast (5):
      drm/xe/uapi: Remove unused flags
      drm/xe: Extend uAPI to query HuC micro-controler firmware version
      drm/xe/uapi: Define topology types as indexes rather than masks
      drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
      drm/xe/gt: Add L3 bank mask to GT topology

Gustavo Sousa (2):
      drm/xe/xe2hpm: Add initial set of workarounds
      drm/xe/xe2lpg: Extend Wa_14020338487

Haridhar Kalvala (1):
      drm/xe/xe2hpg: Add initial GT workarounds

Himal Prasad Ghimiray (15):
      drm/xe: Return if kobj creation is failed
      drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
      drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag.
      drm/xe: Use USEC_PER_MSEC rather than the hard coding
      drm/xe/xe_devcoredump: Check NULL before assignments
      drm/xe/xe2: Add workaround 18033852989
      drm/xe/xe_migrate: Cast to output precision before multiplying operands
      drm/xe/xe2hpg: Determine flat ccs offset for vram
      drm/xe: Simplify function return using drmm_add_action_or_reset()
      drm/xe: Remove sysfs only once on action add failure
      drm/xe: call free_gsc_pkt only once on action add failure
      drm/xe: Return NULL in case of drmm_add_action_or_reset failure
      drm/xe/gt: Abort driver load for sysfs creation failure
      drm/xe/tile: Abort driver load for sysfs creation failure
      drm/xe/pm: Capture errors and handle them

Jani Nikula (1):
      drm/xe: remove unused struct xe_device members

John Harrison (2):
      drm/xe/lnl: Enable more GuC based workarounds
      drm/xe/bmg: Some LNL workarounds also apply to BMG

José Roberto de Souza (7):
      drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC
      drm/xe: Make devcoredump VM error state print consistent
      drm/xe/devcoredump: Print errno if VM snapshot was not captured
      drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
      drm/xe: Remove debug message from migrate_clear()
      devcoredump: Add dev_coredump_put()
      drm/xe: Remove devcoredump during driver release

Juha-Pekka Heikkila (1):
      drm/xe/display: Mark dpt and related vma as uncached

Karthik Poosa (4):
      drm/xe/hwmon: Add infra to support card power and energy attributes
      drm/xe: Define xe_reg_is_valid
      drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
      drm/xe/hwmon: Cast result to output precision on left shift of operand

Lu Yao (1):
      drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected

Luca Coelho (1):
      drm/xe/display: fix type of intel_uncore_read*() functions

Lucas De Marchi (15):
      drm/xe/mocs: Refactor mocs/l3cc loop
      drm/xe/mocs: Be explicit when logging number of entries
      drm/xe/mocs: Move warn/assertion up
      drm/xe/mocs: Allow odd number of entries on test
      drm/xe/mocs: Fix DG2 kunit
      drm/xe: Drop WA 16015675438
      drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
      drm/xe/pvc: Fix WA 18020744125
      drm/xe: Group live kunit tests
      drm/xe: Fix END redefinition
      drm/xe: Remove redundant functions to get xe
      drm/xe: Stop passing user flag to xe_bo_create_user()
      drm/xe: Normalize bo flags macros
      drm/xe/display: Fix double mutex initialization
      drm/xe: Remove dead clock code

Maarten Lankhorst (6):
      drm/xe: Move lrc snapshot capturing to xe_lrc.c
      drm/xe: Add infrastructure for delayed LRC capture
      drm/xe: Implement capture of HWSP and HWCTX
      drm/xe: Fix NULL check in xe_ggtt_init()
      drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
      drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init

Matt Roper (12):
      drm/xe: Add LRC parsing for more GPU instructions
      drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
      drm/xe/xelpg: Extend some workarounds to graphics version 12.74
      drm/xe/arl: Add Arrow Lake H support
      drm/xe/uapi: Add IP version and stepping to GT list query
      drm/xe/mocs: Determine MCR separately for primary/media GT in kunit test
      drm/xe/mocs: Clarify which GT is being operated on
      drm/xe/xe2: Recognize Xe2_HPG IP
      drm/xe/xe2: Recognize Xe2_HPM IP
      drm/xe/bmg: Add BMG platform definition
      drm/xe/bmg: Program an additional discrete-specific PAT setting
      drm/xe: Define all possible engines in media IP descriptors

Matthew Auld (16):
      drm/xe/guc_submit: use jiffies for job timeout
      drm/xe/client: remove bogus rcu list usage
      drm/xe/client: drop bogus bo NULL check
      drm/xe/vm: fix xe_assert()
      drm/xe/queue: fix engine_class bounds check
      drm/xe/device: fix XE_MAX_GT_PER_TILE check
      drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
      drm/xe/display: mark DPT with XE_BO_PAGETABLE
      drm/xe/bb: assert width in xe_bb_create_job()
      drm/xe/bb: assert width in xe_bb_create_migration_job()
      drm/xe/query: fix gt_id bounds check
      drm/xe/stolen: lower the default alignment
      drm/xe/stolen: ignore first page for FBC
      drm/xe/vm: prevent UAF with asid based lookup
      drm/xe/vm: drop vm->destroy_work
      drm/xe/vm: don't include xe_gt.h

Matthew Brost (17):
      drm/xe: Fix execlist splat
      drm/xe: Cleanup some layering in GGTT
      drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
      drm/xe: Use vmalloc for array of bind allocation in bind IOCTL
      drm/xe/guc: Handle timing out of signaled jobs gracefully
      drm/xe: Fix build error in xe_ggtt.c
      drm/xe: Fix ref counting leak on page fault
      drm/xe: Pipeline evict / restore of pinned BOs during suspend / resume
      drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
      drm/xe: Invalidate userptr VMA on page pin fault
      drm/xe: Use xe_assert in xe_device_assert_mem_access
      drm/xe: Drop ggtt invalidate from display code
      drm/xe: Add XE_BO_GGTT_INVALIDATE flag
      drm/xe: Add debug messages for MMU notifier and VMA invalidate
      drm/xe: Use ordered wq for preempt fence waiting
      drm/xe: Always capture exec queues on snapshot
      drm/xe: Capture GuC CT snapshot when stopped

Michal Wajdeczko (53):
      drm/xe: Assert size of the struct xe_reg
      drm/xe: Define XE_REG_OPTION_VF
      drm/xe: Mark VF accessible GuC registers
      drm/xe: Mark VF accessible global registers
      drm/xe: Mark VF accessible interrupt registers
      drm/xe: Make xe_mmio_read|write() functions non-inline
      drm/xe: Allow VRAM BO allocations aligned to 64K
      drm/xe/pf: Request 64K aligned allocations for LMTT PD
      drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+
      drm/xe: Move HW GGTT definitions to dedicated file
      drm/xe/guc: Fix include guard for SR-IOV ABI
      drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI header
      drm/xe/guc: Introduce GuC context ID Manager
      drm/xe/kunit: Add basic tests for GuC context ID Manager
      drm/xe/guc: Use GuC ID Manager in submission code
      drm/xe: Separate pure MMIO init from VRAM checkout
      drm/xe: Move SR-IOV probe to xe_device_probe_early()
      drm/xe/vf: Add proper detection of the SR-IOV VF mode
      drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
      drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events
      drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
      drm/xe: Define helper for GT specific debugfs files
      drm/xe: Refactor GT debugfs
      drm/xe/guc: Prefer GT oriented logs for GuC messages
      drm/xe/guc: Reuse code while debugging GuC params
      drm/xe: Move PTE/PDE bit definitions to proper header
      drm/xe: Drop xe_vm_assert_held() macro definition from xe_bo.h
      drm/xe/guc: Use drm_device-managed version of mutex_init()
      drm/xe/guc: Initialize GuC ID manager sooner
      drm/xe/vf: Don't emit access to Global HWSP if VF
      drm/xe/vf: Don't try to program MOCS if VF
      drm/xe/vf: Don't try to read legacy GuC MMIO notification if VF
      drm/xe/vf: Mark supported firmwares as preloaded
      drm/xe: Assert pat.ops function pointers
      drm/xe: Check pat.ops before dumping PAT settings
      drm/xe: Add max_vfs module parameter
      drm/xe: Add proper detection of the SR-IOV PF mode
      drm/xe: Add SR-IOV info attribute to debugfs
      drm/xe/guc: Prefer GT oriented logs in GuC CTB code
      drm/xe/guc: Prefer GT oriented asserts in CTB code
      drm/xe/pf: Introduce mutex to protect VFs configurations
      drm/xe/pf: Introduce helper functions for use by PF
      drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
      drm/xe/guc: Add helpers for GuC KLVs
      drm/xe/pf: Add support to configure GuC SR-IOV policies
      drm/xe: Add helper to format SR-IOV function name
      drm/xe: Allow to assign GGTT region to the VF
      drm/xe: Add xe_ttm_vram_get_avail
      drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
      drm/xe/pf: Add SR-IOV PF specific early GT initialization
      drm/xe/pf: Add support to configure SR-IOV VFs
      drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
      drm/xe/guc: Fix arguments passed to relay G2H handlers

Mika Kuoppala (3):
      drm/xe: Expose user fence from xe_sync_entry
      drm/xe: Deny unbinds if uapi ufence pending
      drm/xe: Remove obsolete async_ops from struct xe_vm

Nathan Chancellor (1):
      drm/xe: Add xe_guc_ads.c to uses_generated_oob

Niranjana Vishwanathapura (4):
      drm/xe: Separate out sched/deregister_done handling
      drm/xe: Streamline exec queue freeing path
      drm/xe: Use correct function pointer type
      drm/xe: Use FIELD_PREP for lrc descriptor

Nirmoy Das (7):
      drm/xe: Remove unused 'create' parameter from queue property logic
      drm/xe: Remove unused xe_bo->props struct
      drm/xe: Fix potential integer overflow in page size calculation
      drm/xe: Drop bogus vma NULL check
      drm/xe: Remove usage of unsafe strcpy
      drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init
      drm/xe: Create a helper function to init job's user fence

Oak Zeng (2):
      drm/xe: Introduce helper to populate userptr
      drm/xe: Use hmm_range_fault to populate user pages

Paulo Zanoni (1):
      drm/xe: get rid of MAX_BINDS

Priyanka Dandamudi (1):
      drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace

Radhakrishna Sripada (1):
      drm/xe/xelpg: Add Wa_14020495402

Ravi Kumar Vodapalli (1):
      drm/xe: Add new PCI IDs to DG2 platform

Riana Tauro (2):
      drm/xe: check pcode init status only on root gt of root tile
      drm/xe: re-order lmem init check and wait for initialization to complete

Rodrigo Vivi (33):
      drm/xe: Document Xe PM component
      drm/xe: Convert mem_access assertion towards the runtime_pm state
      drm/xe: Runtime PM wake on every IOCTL
      drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
      drm/xe: Runtime PM wake on every sysfs call
      drm/xe: Remove mem_access from guc_pc calls
      drm/xe: Runtime PM wake on every debugfs call
      drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
      drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
      drm/xe: Remove useless mem_access protection for query ioctls
      drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
      drm/xe: Remove mem_access from suspend and resume functions
      drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
      drm/xe: Remove useless mem_access on PAT dumps
      drm/xe: Fix display runtime_pm handling
      drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
      drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
      drm/xe: Return immediately on tile_init failure
      drm/xe: Convert gt suspend/resume messages to debug
      drm/xe: Add dbg messages on the suspend resume functions.
      drm/xe: Protect devcoredump access after unbind
      drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
      drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
      drm/i915/display: convert inner wakeref get towards get_if_in_use
      drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
      drm/xe: Remove useless mem_access during probe
      drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
      drm/xe: Removing extra mem_access protection from runtime pm
      drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
      drm/xe: Ensure all the inner access are using the _noresume variant
      drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
      drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref
      drm/xe: Kill xe_device_mem_access_{get*,put}

Shekhar Chauhan (1):
      drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.

Shuicheng Lin (1):
      drm/xe/xe_tracer: Align fence output format in ftrace log

Suraj Kandpal (6):
      drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
      drm/xe/hdcp: Use xe_device struct
      drm/xe: Use gsc_proxy_init_done to check proxy status
      drm/xe/hdcp: Enable HDCP for XE
      drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id
      drm/xe/hdcp: Fix condition for hdcp gsc cs requirement

Tejas Upadhyay (1):
      drm/xe/gt: Remove continue statement which has no effect

Thomas Hellström (5):
      drm/xe: Use ring ops TLB invalidation for rebinds
      drm/xe: Rework rebinding
      drm/xe: Make TLB invalidation fences unordered
      drm/xe: Move vma rebinding to the drm_exec locking loop
      Merge drm/drm-next into drm-xe-next

Vinay Belgaumkar (3):
      drm/xe/guc: Add some failure checks
      drm/xe/guc: Remove explicit shutdown of SLPC
      drm/xe/lnl: Apply GuC Wa_13011645652

Zhanjun Dong (2):
      drm/xe/guc: Fix missing topology init
      drm/xe: Add helper macro to loop each DSS

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   94 +-
 drivers/base/devcoredump.c                         |   23 +
 drivers/gpu/drm/i915/display/intel_display_power.c |    8 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |    6 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    7 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   46 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   14 +-
 drivers/gpu/drm/xe/Kconfig                         |    2 +
 drivers/gpu/drm/xe/Makefile                        |   13 +-
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |  200 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   10 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   17 +-
 .../drm/xe/compat-i915-headers/i915_gem_stolen.h   |    9 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |    6 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   16 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   16 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   13 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   39 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |  240 ++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    7 +-
 .../drm/xe/instructions/xe_gfx_state_commands.h    |   18 +
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |    3 +
 drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    5 +-
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   65 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h              |   37 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |   15 +-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |   19 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |    2 +-
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |    3 +
 drivers/gpu/drm/xe/tests/Makefile                  |    3 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   12 +-
 drivers/gpu/drm/xe/tests/xe_bo_test.c              |    5 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   57 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c         |    5 -
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c      |  136 ++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |   10 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   27 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c         |    5 -
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |   96 +-
 drivers/gpu/drm/xe/tests/xe_mocs_test.c            |    5 -
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |    1 +
 drivers/gpu/drm/xe/xe_bb.c                         |    6 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  137 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   74 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |    4 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |   23 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |   47 +-
 drivers/gpu/drm/xe/xe_devcoredump.h                |    6 +
 drivers/gpu/drm/xe/xe_device.c                     |  236 ++-
 drivers/gpu/drm/xe/xe_device.h                     |    9 -
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   16 +-
 drivers/gpu/drm/xe/xe_device_sysfs.h               |    2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   15 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |    7 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    8 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   93 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   74 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   13 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  136 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |    8 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |  100 +-
 drivers/gpu/drm/xe/xe_gsc.h                        |    2 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   15 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |    1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |   15 +
 drivers/gpu/drm/xe/xe_gsc_submit.h                 |    1 +
 drivers/gpu/drm/xe/xe_gsc_types.h                  |    1 +
 drivers/gpu/drm/xe/xe_gt.c                         |   63 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |   19 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h                |    2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |    5 -
 drivers/gpu/drm/xe/xe_gt_clock.h                   |    2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  240 ++-
 drivers/gpu/drm/xe/xe_gt_debugfs.h                 |    2 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   63 +-
 drivers/gpu/drm/xe/xe_gt_freq.h                    |    2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   43 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |    2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   39 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |   14 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |    3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   52 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |   20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 1977 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   56 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |   54 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |  257 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |   27 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h        |   35 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |  418 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h         |   25 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h   |   31 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |   34 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |   14 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.h                   |    2 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c          |   16 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |    2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   44 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |    2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |  115 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |   11 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |   29 +-
 drivers/gpu/drm/xe/xe_guc.c                        |  122 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  137 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |    2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  135 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |    9 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |    7 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |    7 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                 |  279 +++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h                 |   22 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |  134 ++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h            |   51 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |    5 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  116 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  230 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |    6 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |   13 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |   21 +-
 drivers/gpu/drm/xe/xe_hmm.c                        |  253 +++
 drivers/gpu/drm/xe/xe_hmm.h                        |   11 +
 drivers/gpu/drm/xe/xe_huc.c                        |   13 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |    5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   46 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  155 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h      |    7 +
 drivers/gpu/drm/xe/xe_hw_fence.c                   |    2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |  270 +--
 drivers/gpu/drm/xe/xe_irq.c                        |    3 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |    6 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  174 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |    5 +
 drivers/gpu/drm/xe/xe_lrc_types.h                  |    2 +
 drivers/gpu/drm/xe/xe_memirq.c                     |    9 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |   16 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  144 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |   82 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |   66 +-
 drivers/gpu/drm/xe/xe_module.c                     |    7 +
 drivers/gpu/drm/xe/xe_module.h                     |    3 +
 drivers/gpu/drm/xe/xe_pat.c                        |   23 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   43 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |  117 +-
 drivers/gpu/drm/xe/xe_pcode.h                      |    6 +-
 drivers/gpu/drm/xe/xe_platform_types.h             |    1 +
 drivers/gpu/drm/xe/xe_pm.c                         |  327 +++-
 drivers/gpu/drm/xe/xe_pm.h                         |   13 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c              |    2 +-
 drivers/gpu/drm/xe/xe_pt.c                         |   38 +-
 drivers/gpu/drm/xe/xe_query.c                      |   53 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   22 +-
 drivers/gpu/drm/xe/xe_sa.c                         |    5 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |   33 +-
 drivers/gpu/drm/xe/xe_sched_job.h                  |    3 +
 drivers/gpu/drm/xe/xe_sched_job_types.h            |    2 +
 drivers/gpu/drm/xe/xe_sriov.c                      |   62 +-
 drivers/gpu/drm/xe/xe_sriov.h                      |    6 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |  104 +
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |   30 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |   46 +
 drivers/gpu/drm/xe/xe_sriov_types.h                |   19 +
 drivers/gpu/drm/xe/xe_sync.c                       |    7 +-
 drivers/gpu/drm/xe/xe_sync.h                       |    1 -
 drivers/gpu/drm/xe/xe_tile.c                       |   17 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   17 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.h                 |    2 +-
 drivers/gpu/drm/xe/xe_trace.h                      |    6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   15 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |    5 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   14 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h               |    1 +
 drivers/gpu/drm/xe/xe_tuning.c                     |   10 +-
 drivers/gpu/drm/xe/xe_uc.c                         |   11 -
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   53 +-
 drivers/gpu/drm/xe/xe_uc_fw.h                      |    8 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |    3 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  341 ++--
 drivers/gpu/drm/xe/xe_vm.h                         |    8 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |   15 +-
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   20 +-
 drivers/gpu/drm/xe/xe_vram_freq.h                  |    2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  135 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   11 +-
 include/drm/xe_pciids.h                            |    7 +-
 include/linux/devcoredump.h                        |    5 +
 include/uapi/drm/xe_drm.h                          |   25 +-
 189 files changed, 8136 insertions(+), 2229 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gtt_defs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_live_test_mod.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
