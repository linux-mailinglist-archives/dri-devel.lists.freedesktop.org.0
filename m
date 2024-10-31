Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908499B7A03
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 12:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C9E10E86C;
	Thu, 31 Oct 2024 11:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jm0a5bQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02410E867;
 Thu, 31 Oct 2024 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730375442; x=1761911442;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Ctrbtp+cRdPBYo+Y5mWgrxyd9BgzfYXm5AYPcHjHJnY=;
 b=jm0a5bQVM2WNASKuEi325ieVopTJtGbfXR53HijN0eSGz3ObvrW3Lh0T
 4e9TfYi/wtd4q2k82EJea0oCL/UN73vpp7qpicdqCqM7DiNeWFX9z0ynT
 LefJRtNnGFVIt0/hpv5TQnlTeAqmU72QTu9sdmaTc7Ra3XCoZvKDFOsE2
 zQEnGWHIAFAuamxIa6WeYE5xRK/Ko6DCQBQpKlZjSnrrX/6CPQ8uw2cPc
 uuOMtDHRTM43KzxGhwqa3ZHvZbGvu9wbDen/SIvCUCxQqUJaAO3lW+8Np
 DB26OIO21R6lZQ/rAERcNAo/RJdtDLM/g3TtrUsygsIEvkFSFGidx5i3o Q==;
X-CSE-ConnectionGUID: vyHRga3jQ5mx5D7lTFxteQ==
X-CSE-MsgGUID: clApZPrhT9OA/rUGdWyHiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17749745"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17749745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:50:42 -0700
X-CSE-ConnectionGUID: RDudHY/eTiGTiMFy2ID+GA==
X-CSE-MsgGUID: 7VOkQBYiQVi4GHOyhLId+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87203910"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.206])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:50:37 -0700
Date: Thu, 31 Oct 2024 12:50:27 +0100
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
Message-ID: <ZyNvA_vZZYR-1eWE@fedora>
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

Hi, Dave, Simona

This week's drm-xe-next pull request, including also the
changes that we decided not to pull last week.

Note that this PR introduces a run-time warning when flushing
xe workqueues. That is fixed by the patch
746ae46c11137ba21f0c0c68f082a9d8c1222c78
currently present in drm-misc-fixes. So to avoid propagating that
warning into drm-next, the ideal merge-flow would be:

- drm-misc-fixes -> drm-fixes
- backmerge drm-fixes->drm-next
- drm-xe-next->drm-next

But from our POW it's ok to pull as-is, although a backmerge from
drm-fixes into drm-next containing that patch as soon as possible
would be desired.

Thanks,
Thomas

drm-xe-next-2024-10-31:
UAPI Changes:
- Define and parse OA sync properties (Ashutosh)

Driver Changes:
- Add caller info to xe_gt_reset_async (Nirmoy)
- A large forcewake rework / cleanup (Himal)
- A g2h response timeout fix (Badal)
- A PTL workaround (Vinay)
- Handle unreliable MMIO reads during forcewake (Shuicheng)
- Ufence user-space access fixes (Nirmoy)
- Annotate flexible arrays (Matthew Brost)
- Enable GuC lite restore (Fei)
- Prevent GuC register capture on VF (Zhanjun)
- Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
- Parallel queues fix on GT reset (Nirmoy)
- Move reference grabbing to a job's dma-fence (Matt Brost)
- Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
- OA synchronization support (Ashutosh)
- Capture all available bits of GuC timestamp to GuC log (John)
- Increase readability of guc_info debugfs (John)
- Add a mmio barrier before GGTT invalidate (Matt Brost)
- Don't short-circuit TDR on jobs not started (Matt Brost)

The following changes since commit 2eb460ab9f4bc5b575f52568d17936da0af681d8:

  drm/xe: Enlarge the invalidation timeout from 150 to 500 (2024-10-16 16:11:10 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-10-31

for you to fetch changes up to 35d25a4a0012e690ef0cc4c5440231176db595cc:

  drm/xe: Don't short circuit TDR on jobs not started (2024-10-30 22:14:06 -0700)

----------------------------------------------------------------
UAPI Changes:
- Define and parse OA sync properties (Ashutosh)

Driver Changes:
- Add caller info to xe_gt_reset_async (Nirmoy)
- A large forcewake rework / cleanup (Himal)
- A g2h response timeout fix (Badal)
- A PTL workaround (Vinay)
- Handle unreliable MMIO reads during forcewake (Shuicheng)
- Ufence user-space access fixes (Nirmoy)
- Annotate flexible arrays (Matthew Brost)
- Enable GuC lite restore (Fei)
- Prevent GuC register capture on VF (Zhanjun)
- Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
- Parallel queues fix on GT reset (Nirmoy)
- Move reference grabbing to a job's dma-fence (Matt Brost)
- Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
- OA synchronization support (Ashutosh)
- Capture all available bits of GuC timestamp to GuC log (John)
- Increase readability of guc_info debugfs (John)
- Add a mmio barrier before GGTT invalidate (Matt Brost)
- Don't short-circuit TDR on jobs not started (Matt Brost)

----------------------------------------------------------------
Ashutosh Dixit (8):
      drm/xe/oa: Separate batch submission from waiting for completion
      drm/xe/oa/uapi: Define and parse OA sync properties
      drm/xe/oa: Add input fence dependencies
      drm/xe/oa: Signal output fences
      drm/xe/oa: Move functions up so they can be reused for config ioctl
      drm/xe/oa: Add syncs support to OA config ioctl
      drm/xe/oa: Allow only certain property changes from config
      Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"

Badal Nilawar (1):
      drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

Fei Yang (1):
      drm/xe: enable lite restore

Himal Prasad Ghimiray (26):
      drm/xe: Add member initialized_domains to xe_force_wake()
      drm/xe/forcewake: Change awake_domain datatype
      drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
      drm/xe: Error handling in xe_force_wake_get()
      drm/xe: Modify xe_force_wake_put to handle _get returned mask
      drm/xe/device: Update handling of xe_force_wake_get return
      drm/xe/hdcp: Update handling of xe_force_wake_get return
      drm/xe/gsc: Update handling of xe_force_wake_get return
      drm/xe/gt: Update handling of xe_force_wake_get return
      drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
      drm/xe/devcoredump: Update handling of xe_force_wake_get return
      drm/xe/tests/mocs: Update xe_force_wake_get() return handling
      drm/xe/mocs: Update handling of xe_force_wake_get return
      drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
      drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
      drm/xe/guc: Update handling of xe_force_wake_get return
      drm/xe/huc: Update handling of xe_force_wake_get return
      drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
      drm/xe/pat: Update handling of xe_force_wake_get return
      drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
      drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
      drm/xe/query: Update handling of xe_force_wake_get return
      drm/xe/vram: Update handling of xe_force_wake_get return
      drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
      drm/xe: Ensure __must_check for xe_force_wake_get() return
      drm/xe: Change return type to void for xe_force_wake_put

John Harrison (2):
      drm/xe/guc: Capture all available bits of GuC timestamp
      drm/xe/guc: Separate full CTB content from guc_info debugfs

Jonathan Cavitt (1):
      drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs

Matthew Brost (7):
      drm/xe: Use __counted_by for flexible arrays
      drm/xe: Take ref to job's fence in arm
      drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
      drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
      drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
      drm/xe: Add mmio read before GGTT invalidate
      drm/xe: Don't short circuit TDR on jobs not started

Michal Wajdeczko (1):
      drm/xe/pf: Show VFs LMEM provisioning summary over debugfs

Nirmoy Das (4):
      drm/xe: Add caller info to xe_gt_reset_async
      drm/xe/ufence: Prefetch ufence addr to catch bogus address
      drm/xe/ufence: Warn if mmget_not_zero() fails
      drm/xe: Don't restart parallel queues multiple times on GT reset

Shuicheng Lin (1):
      drm/xe: Handle unreliable MMIO reads during forcewake

Vinay Belgaumkar (1):
      drm/xe/ptl: Apply Wa_14022866841

Zhanjun Dong (1):
      drm/xe/guc: Prevent GuC register capture running on VF

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |   1 +
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   6 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h       |   3 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c          |  18 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  27 +-
 drivers/gpu/drm/xe/xe_devcoredump.c         |  16 +-
 drivers/gpu/drm/xe/xe_device.c              |  25 +-
 drivers/gpu/drm/xe/xe_drm_client.c          |   8 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |   2 +-
 drivers/gpu/drm/xe/xe_force_wake.c          | 134 ++++--
 drivers/gpu/drm/xe/xe_force_wake.h          |  23 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h    |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  12 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |  23 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c           |   9 +-
 drivers/gpu/drm/xe/xe_gt.c                  | 110 +++--
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_idle.c             |  26 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  35 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |   5 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   5 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  20 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |   5 +
 drivers/gpu/drm/xe/xe_guc_capture.c         |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  74 +--
 drivers/gpu/drm/xe/xe_guc_ct.h              |   5 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c         |  14 +
 drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
 drivers/gpu/drm/xe/xe_guc_log.c             |  15 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h       |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  50 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  47 +-
 drivers/gpu/drm/xe/xe_huc.c                 |   8 +-
 drivers/gpu/drm/xe/xe_mocs.c                |  14 +-
 drivers/gpu/drm/xe/xe_oa.c                  | 678 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_oa_types.h            |  12 +
 drivers/gpu/drm/xe/xe_pat.c                 |  65 ++-
 drivers/gpu/drm/xe/xe_query.c               |  10 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |  24 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |   2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   3 +-
 drivers/gpu/drm/xe/xe_sync.c                |   5 +-
 drivers/gpu/drm/xe/xe_vram.c                |  12 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules          |   2 +
 include/uapi/drm/xe_drm.h                   |  17 +
 47 files changed, 1074 insertions(+), 529 deletions(-)
