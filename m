Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2DACCDECA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 00:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5965510EB5F;
	Thu, 18 Dec 2025 23:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d55NgwoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B901D10E0E6;
 Thu, 18 Dec 2025 23:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766100133; x=1797636133;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Yc5ry7tKnM/1QEq86kCfisDn0LKAW9a/SI6+beQPLDw=;
 b=d55NgwoEpfyh99UIWOEKsa4SIp8BfLPhQwZv6qFaCJeYjkYUvCpcCH8B
 d4pOv9mNLRZ+mmZnkcbps+4kkDTQYFcYOGLVqxwxlWzQ787Jpbu1MmzuB
 PcxRYBP957nQBwcQxiyaPpi093ti5EnJlkxWvj0s5r6AaKVjnB3k4BIl/
 cJh+UQ8P7XFKx3CbieH95PgZ5FJKV26sXCGmx1Xn8G4BmkZFj8f3HxbuA
 bDrwHSgoLrQ833B6mCbYFqcLb11NhenStqXh/DSiOjdO9dl0kAy7z1WBZ
 xq0rNu9Po/ZK3GAwxtI9niovE6mWAyR+td4JC6L6zxyZ5MXHf6mvHGWah A==;
X-CSE-ConnectionGUID: MxH/KFRXQzWHlF9yqtWgiQ==
X-CSE-MsgGUID: CLbACNg4T+yztdzO8SJS9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78777773"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78777773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:22:12 -0800
X-CSE-ConnectionGUID: BQcMEa6LRBq6BoCnFxo8Sg==
X-CSE-MsgGUID: TmY+s24bQduABORJmzGuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197970062"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:22:08 -0800
Date: Fri, 19 Dec 2025 00:21:57 +0100
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
Subject: [PULL] drm-xe-fixes
Message-ID: <aUSMlQ4iruzm0NQR@fedora>
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

The drm-xe-fixes PR for 6.19-rc2. Nothing that stands out except some additional
UAPI sanitizing.

Thanks,
Thomas

drm-xe-fixes-2025-12-19:

UAPI Changes:
- Limit num_syncs to prevent oversized kernel allocations (Shuicheng)
- Disallow 0 OA property values (Ashutosh)
- Disallow 0 EU stall property values (Ashutosh)

Driver Changes:
- Fix kobject leak (Shuicheng)
- Workaround (Vinay)
- Loop variable reference fix (Matt Brost)
- Fix a CONFIG corner-case incorrect number of arguments (Arnd Bergmann)
- Skip reason prefix while emitting array (Raag)
- VF migration fix (Tomasz)
- Fix context in mei interrupt top half (Junxiao)
- Don't include the CCS metadata in the dma-buf sg-table (Thomas)
- VF queueing recovery work fix (Satyanarayana)
- Increase TDF timeout (Jagmeet)
- GT reset registers vs scheduler ordering fix (Jan)
- Adjust long-running workload timeslices (Matt Brost)
- Always set OA_OAGLBCTXCTRL_COUNTER_RESUME (Ashutosh)
- Fix a return value (Dan Carpenter)
- Drop preempt-fences when destroying imported dma-bufs (Thomas)
- Use usleep_range for accurate long-running workload timeslicing (Matthew)
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-12-19

for you to fetch changes up to 80f9c601d9c4d26f00356c0a9c461650e7089273:

  drm/xe: Use usleep_range for accurate long-running workload timeslicing (2025-12-18 18:25:42 +0100)

----------------------------------------------------------------
UAPI Changes:
- Limit num_syncs to prevent oversized kernel allocations (Shuicheng)
- Disallow 0 OA property values (Ashutosh)
- Disallow 0 EU stall property values (Ashutosh)

Driver Changes:
- Fix kobject leak (Shuicheng)
- Workaround (Vinay)
- Loop variable reference fix (Matt Brost)
- Fix a CONFIG corner-case incorrect number of arguments (Arnd Bergmann)
- Skip reason prefix while emitting array (Raag)
- VF migration fix (Tomasz)
- Fix context in mei interrupt top half (Junxiao)
- Don't include the CCS metadata in the dma-buf sg-table (Thomas)
- VF queueing recovery work fix (Satyanarayana)
- Increase TDF timeout (Jagmeet)
- GT reset registers vs scheduler ordering fix (Jan)
- Adjust long-running workload timeslices (Matt Brost)
- Always set OA_OAGLBCTXCTRL_COUNTER_RESUME (Ashutosh)
- Fix a return value (Dan Carpenter)
- Drop preempt-fences when destroying imported dma-bufs (Thomas)
- Use usleep_range for accurate long-running workload timeslicing (Matthew)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe: fix drm_gpusvm_init() arguments

Ashutosh Dixit (3):
      drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
      drm/xe/oa: Disallow 0 OA property values
      drm/xe/eustall: Disallow 0 EU stall property values

Dan Carpenter (1):
      drm/xe/xe_sriov_vfio: Fix return value in xe_sriov_vfio_migration_supported()

Jagmeet Randhawa (1):
      drm/xe: Increase TDF timeout

Jan Maslak (1):
      drm/xe: Restore engine registers before restarting schedulers after GT reset

Junxiao Chang (1):
      drm/me/gsc: mei interrupt top half should be in irq disabled context

Matthew Brost (3):
      drm/xe: Do not reference loop variable directly
      drm/xe: Adjust long-running workload timeslices to reasonable values
      drm/xe: Use usleep_range for accurate long-running workload timeslicing

Raag Jadav (1):
      drm/xe/throttle: Skip reason prefix while emitting array

Satyanarayana K V P (1):
      drm/xe/vf: Fix queuing of recovery work

Shuicheng Lin (3):
      drm/xe: Fix freq kobject leak on sysfs_create_files failure
      drm/xe: Limit num_syncs to prevent oversized allocations
      drm/xe/oa: Limit num_syncs to prevent oversized allocations

Thomas Hellström (2):
      drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
      drm/xe: Drop preempt-fences when destroying imported dma-bufs.

Tomasz Lis (1):
      drm/xe/vf: Stop waiting for ring space on VF post migration recovery

Vinay Belgaumkar (1):
      drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()

 drivers/gpu/drm/xe/xe_bo.c          | 15 ++++-----------
 drivers/gpu/drm/xe/xe_device.c      |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c     |  2 +-
 drivers/gpu/drm/xe/xe_eu_stall.c    |  2 +-
 drivers/gpu/drm/xe/xe_exec.c        |  3 ++-
 drivers/gpu/drm/xe/xe_gt.c          |  7 ++++---
 drivers/gpu/drm/xe/xe_gt_freq.c     |  4 +++-
 drivers/gpu/drm/xe/xe_gt_idle.c     |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 35 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_heci_gsc.c    |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c          | 12 ++++++++----
 drivers/gpu/drm/xe/xe_sriov_vfio.c  |  2 +-
 drivers/gpu/drm/xe/xe_svm.h         |  2 +-
 drivers/gpu/drm/xe/xe_vm.c          |  8 +++++++-
 drivers/gpu/drm/xe/xe_vm_types.h    |  2 +-
 drivers/gpu/drm/xe/xe_wa.c          |  8 --------
 drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
 include/uapi/drm/xe_drm.h           |  1 +
 20 files changed, 76 insertions(+), 46 deletions(-)
