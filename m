Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3884DF5A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 12:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4510E63E;
	Thu,  8 Feb 2024 11:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIrqQ72r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188010E63E;
 Thu,  8 Feb 2024 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707390541; x=1738926541;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Jz5fnD+jREj51S11/azW+TZ3mNwy4PtiPm9X6xYtW/4=;
 b=DIrqQ72rZTUH3XLKXbllNmeoDNh9H9M9jKaatvCQkJudehlBFv8dinzb
 d93pp0MbK3TavFGucV2VmNVc5psD7I9lCtcBJzMR7Lqo8V4+AE6JsMg63
 cfFSbm33eujW5W3g186Rx8KwLKw5emK12RxIyLvJm/Q9tZF8eyL9qT8Ux
 yF7Ctm93BWYVA2XlJRYfoQe3d3GKPvouw0CTVs0xFqnunJJ/Z58ifX3DB
 Sa76Y1R1E7gLZvz0HB1PNQGgq23o2uFKUa4jwV4MBYu1DA/Bnxux5zpXd
 IG+ishdYlDSVDO4qEi00WfYq4TMkCcMXGnG/M8y81hpmD8eK0327Jduu9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="23675561"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="23675561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 03:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="24872336"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora)
 ([10.249.254.149])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 03:08:55 -0800
Date: Thu, 8 Feb 2024 12:08:30 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <ZcS2LllawGifubsk@fedora>
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

Dave, Sima

The drm-xe-fixes pull for -rc4.

Thanks,
Thomas

drm-xe-fixes-2024-02-08:
Driver Changes:
- Fix a loop in an error path
- Fix a missing dma-fence reference
- Fix a retry path on userptr REMAP
- Workaround for a false gcc warning
- Fix missing map of the usm batch buffer
  in the migrate vm.
- Fix a memory leak.
- Fix a bad assumption of used page size
- Fix hitting a BUG() due to zero pages to map.
- Remove some leftover async bind queue relics
The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-02-08

for you to fetch changes up to bf4c27b8267d7848bb81fd41e6aa07aa662f07fb:

  drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR (2024-02-08 09:51:19 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix a loop in an error path
- Fix a missing dma-fence reference
- Fix a retry path on userptr REMAP
- Workaround for a false gcc warning
- Fix missing map of the usm batch buffer
  in the migrate vm.
- Fix a memory leak.
- Fix a bad assumption of used page size
- Fix hitting a BUG() due to zero pages to map.
- Remove some leftover async bind queue relics

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe: circumvent bogus stringop-overflow warning

Matthew Auld (1):
      drm/xe/vm: don't ignore error when in_kthread

Matthew Brost (6):
      drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
      drm/xe: Take a reference in xe_exec_queue_last_fence_get()
      drm/xe: Pick correct userptr VMA to repin on REMAP op failure
      drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
      drm/xe: Assume large page size if VMA not yet bound
      drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR

Xiaoming Wang (1):
      drm/xe/display: Fix memleak in display initialization

 drivers/gpu/drm/xe/xe_display.c      |  6 ----
 drivers/gpu/drm/xe/xe_exec_queue.c   |  8 +++--
 drivers/gpu/drm/xe/xe_gt.c           |  5 ++-
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 28 ++++++++++++----
 drivers/gpu/drm/xe/xe_sched_job.c    |  1 -
 drivers/gpu/drm/xe/xe_sync.c         |  2 --
 drivers/gpu/drm/xe/xe_vm.c           | 62 ++++++++++++++----------------------
 drivers/gpu/drm/xe/xe_vm_types.h     |  8 -----
 9 files changed, 57 insertions(+), 65 deletions(-)
