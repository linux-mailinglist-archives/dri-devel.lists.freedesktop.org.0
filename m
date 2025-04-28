Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08BA9F51A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEBA10E5FC;
	Mon, 28 Apr 2025 16:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF/qAgSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22D10E5FF;
 Mon, 28 Apr 2025 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745856219; x=1777392219;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9MVOWoUBnHaDYw7OejNBwzP4OLieGeOiM9uL1QginAo=;
 b=cF/qAgSX7mDU6sKyLnQyU9fMDRgNSyD6d/WaZrPRPOLXjINcBDtg0DEV
 6kTG4x3ODoZlbE8m1vcRe2M3i8bcXtY0e92YIsZSfZsQIunP/v7eYQSin
 GBrlaHwi0A6Mki4/20N2wlxhDhE6bbNx45KXmLjjIMV6k+Y1sWWoHIj/p
 PnPlYYh1veRtF+Gp5MwBSxUM8YOX/q/Lq5qx1FgjQxZzcmVcBixn/eOmv
 qJTfmIRfDBo5ncQlQSjSGIbUtjccr77SSAHVcPhX/IeHy1/TN9MO/hKag
 3MNZOUYB1X4KZVyKCuR+oO/uDcPVNtfgBPXEa47bQoWFfMG81RJ7JH7f8 Q==;
X-CSE-ConnectionGUID: 1me9+WYzTkmgU6k1AaN4qg==
X-CSE-MsgGUID: 6SrubAexSfiAMYtw082tgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51124651"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="51124651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:03:30 -0700
X-CSE-ConnectionGUID: 9MaCJbWySiWG7N/A9Y1wrw==
X-CSE-MsgGUID: NG5gqInUREubMEn3V1rQHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="133524997"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.179])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:03:25 -0700
Date: Mon, 28 Apr 2025 18:03:09 +0200
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
Message-ID: <aA-mvTb6s909V8hu@fedora>
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

An additional drm-xe-next PR as requested on IRC.
Take 2, This time with a normal-looking diffstat.

A lot of fixes but some new stuff as detailed below.

Please note that the top commit,

"Drop force_alloc from xe_bo_evict in selftests"

carries a Fixes tag that is not an ancestor, but that
commit is in drm-next so should not be a problem once
merged, I hope.

Thanks,
Thomas

drm-xe-next-2025-04-28-1:
Core Changes:
- Add drm_coredump_printer_is_full() (Matt Brost)

Driver Changes:
- Do not queue unneeded terminations from debugfs (Daniele)
- Fix out-of-bound while enabling engine activity stats (Michal)
- Use GT oriented message to report engine activity error (Michal)
- Some fault-injection additions (Satyanarayana)
- Fix an error pointer dereference (Harshit)
- Fix capture of steering registers (John)
- Use the steering flag when printing registers (John)
- Cache DSS info when creating capture register list (John)
- Backup VRAM in PM notifier instead of in the suspend / freeze
  callbacks (Matt Auld)
- Fix CFI violation when accessing sysfs files (Jeevaka)
- Fix kernel version docs for temperature and fan speed (Lucas)
- Add devcoredump chunking (Matt Brost)
- Update xe_ttm_access_memory to use GPU for non-visible access
  (Matt Brost)
- Abort printing coredump in VM printer output if full (Matt Brost)
- Resolve a possible circular locking dependency (Harish)
- Don't support EU stall on SRIOV VF (Harish)
- Drop force_alloc from xe_bo_evict in selftests (Matt Brost)
The following changes since commit d2b9e2f8a15d53121ae8f2c67b69cf06b6fa586c:

  Merge tag 'drm-xe-next-2025-04-17' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-04-26 08:06:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-04-28-1

for you to fetch changes up to 1bb53d05ba71b684f61bd11df8b99fe75ce52754:

  Merge drm/drm-next into drm-xe-next (2025-04-28 17:42:49 +0200)

----------------------------------------------------------------
Core Changes:
- Add drm_coredump_printer_is_full() (Matt Brost)

Driver Changes:
- Do not queue unneeded terminations from debugfs (Daniele)
- Fix out-of-bound while enabling engine activity stats (Michal)
- Use GT oriented message to report engine activity error (Michal)
- Some fault-injection additions (Satyanarayana)
- Fix an error pointer dereference (Harshit)
- Fix capture of steering registers (John)
- Use the steering flag when printing registers (John)
- Cache DSS info when creating capture register list (John)
- Backup VRAM in PM notifier instead of in the suspend / freeze
  callbacks (Matt Auld)
- Fix CFI violation when accessing sysfs files (Jeevaka)
- Fix kernel version docs for temperature and fan speed (Lucas)
- Add devcoredump chunking (Matt Brost)
- Update xe_ttm_access_memory to use GPU for non-visible access
  (Matt Brost)
- Abort printing coredump in VM printer output if full (Matt Brost)
- Resolve a possible circular locking dependency (Harish)
- Don't support EU stall on SRIOV VF (Harish)
- Drop force_alloc from xe_bo_evict in selftests (Matt Brost)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/xe/pxp: do not queue unneeded terminations from debugfs

Harish Chegondi (2):
      drm/xe/eustall: Resolve a possible circular locking dependency
      drm/xe/eustall: Do not support EU stall on SRIOV VF

Harshit Mogalapalli (1):
      drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()

Jeevaka Prabu Badrappan (1):
      drm/xe: Fix CFI violation when accessing sysfs files

John Harrison (3):
      drm/xe/guc: Fix capture of steering registers
      drm/xe/guc: Use the steering flag when printing registers
      drm/xe/guc: Cache DSS info when creating capture register list

Lucas De Marchi (2):
      drm/xe/hwmon: Fix kernel version documentation for temperature
      drm/xe/hwmon: Fix kernel version documentation for fan speed

Matthew Auld (3):
      drm/xe: evict user memory in PM notifier
      drm/xe: share bo dma-resv with backup object
      drm/xe: handle pinned memory in PM notifier

Matthew Brost (5):
      drm/xe: Add devcoredump chunking
      drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
      drm/print: Add drm_coredump_printer_is_full
      drm/xe: Abort printing coredump in VM printer output if full
      drm/xe: Drop force_alloc from xe_bo_evict in selftests

Michal Wajdeczko (2):
      drm/xe/guc: Fix out-of-bound while enabling engine activity stats
      drm/xe: Use GT oriented message to report engine activity error

Satyanarayana K V P (2):
      drm/xe: Introduce fault injection for guc mmio send/recv.
      drm/xe: Introduce fault injection for guc CTB send/recv

Thomas Hellström (2):
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  10 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         | 152 +++++++++++---
 drivers/gpu/drm/xe/xe_bo.h                         |   2 +
 drivers/gpu/drm/xe/xe_bo_evict.c                   |  96 +++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h                   |   3 +
 drivers/gpu/drm/xe/xe_bo_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |  57 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   3 +
 drivers/gpu/drm/xe/xe_eu_stall.c                   |  14 +-
 drivers/gpu/drm/xe/xe_eu_stall.h                   |   3 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |  82 ++++----
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  28 +--
 drivers/gpu/drm/xe/xe_gt_throttle.c                |  90 ++++-----
 drivers/gpu/drm/xe/xe_guc.c                        |   1 +
 drivers/gpu/drm/xe/xe_guc_capture.c                | 102 +++++-----
 drivers/gpu/drm/xe/xe_guc_capture_types.h          |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c                    | 218 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h                    |   4 +
 drivers/gpu/drm/xe/xe_pci.c                        |   2 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |   5 +-
 drivers/gpu/drm/xe/xe_pm.c                         |  68 ++++++-
 drivers/gpu/drm/xe/xe_pm.h                         |   2 +-
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |  13 +-
 drivers/gpu/drm/xe/xe_svm.c                        |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   3 +
 include/drm/drm_print.h                            |  20 ++
 32 files changed, 756 insertions(+), 244 deletions(-)
