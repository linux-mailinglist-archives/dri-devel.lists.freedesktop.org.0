Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3658ACF799
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 21:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEE610E2C8;
	Thu,  5 Jun 2025 19:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBuaDEEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884410E2DC;
 Thu,  5 Jun 2025 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749150449; x=1780686449;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=C/XhCzNvGRMw8779oAUL0VkITURez1r6nZ1DhVNYE6I=;
 b=lBuaDEEq6bywA0xAgTzTWZzn3Dpu38U/cZGN0lLYRDN5FwRWp7JeqDMO
 ZKxjDyZSATLFLPJy+ElNsPTt24tm/Pg2MKbfzHWD+RZxfcXdbMFI+QHqb
 0tePRIq81KToSOneDJoJKUOEBkCupx5+cZ4RJxl0uoz+t3el2UlJLGd2O
 g8kuoW8r9T2e92I78URmvd1/eYE/i3UiE/VHvBBfHZ68WSGvOd1MwJP2b
 mvgbdo9NripLTvoWonPS/BlDG1tAwezQtI3s5jK1BewGacB8AY7g3vJSS
 MkOt3YtjiLndansFIjRpJAGmWRm5jUCYhCxrND4wrwtIl6E3D4WGhKryq g==;
X-CSE-ConnectionGUID: kmPtGtd/QBGO5CVUpNpDBg==
X-CSE-MsgGUID: HggPSvfHSWWWdlIwEYJPCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38919376"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38919376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 12:07:28 -0700
X-CSE-ConnectionGUID: GrC4chEyQ3qeeacC8p+QEg==
X-CSE-MsgGUID: bpy3oorHTruEV22QO8mP9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="149451753"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 12:07:26 -0700
Date: Thu, 5 Jun 2025 21:07:15 +0200
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aEHq44uIAZwfK-mG@fedora>
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

Dave, Simona
This week's drm-xe-next-fixes pull. Quite a few this week.

One thing to be aware of is a conflict in "Create LRC bo without VM",
Looks like a commit got pulled into drm-xe-fixes that is not in drm-xe-next-fixes,
and pulling this branch will likely conflict with that once Linus merges.

Thanks,
Thomas

drm-xe-next-fixes-2025-06-05:
Driver Changes:
- A couple of vm init fixes (Matt Auld)
- Hwmon fixes (Karthik)
- Drop reduntant conversion to bool (Raag)
- Fix CONFIG_INTEL_VSEC dependency (Arnd)
- Rework eviction rejection of bound external bos (Thomas)
- Stop re-submitting signalled jobs (Matt Auld)
- A couple of pxp fixes (Daniele)
- Add back a fix that got lost in a merge (Matt Auld)
- Create LRC bo without VM (Niranjana)
- Fix for the above fix (Maciej)

The following changes since commit 40493d97b329f8185c0f04dc0ef2b9ffc58e7f3b:

  drm/xe: Add missing documentation of rpa_freq (2025-05-28 17:23:13 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-06-05

for you to fetch changes up to 7c7c5cb5b5bf9d8ccc6a51b28687c9e7ff7f1890:

  drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init() (2025-06-05 18:55:46 +0200)

----------------------------------------------------------------
Driver Changes:
- A couple of vm init fixes (Matt Auld)
- Hwmon fixes (Karthik)
- Drop reduntant conversion to bool (Raag)
- Fix CONFIG_INTEL_VSEC dependency (Arnd)
- Rework eviction rejection of bound external bos (Thomas)
- Stop re-submitting signalled jobs (Matt Auld)
- A couple of pxp fixes (Daniele)
- Add back a fix that got lost in a merge (Matt Auld)
- Create LRC bo without VM (Niranjana)
- Fix for the above fix (Maciej)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency

Daniele Ceraolo Spurio (2):
      drm/xe/pxp: Use the correct define in the set_property_funcs array
      drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready

Karthik Poosa (2):
      drm/xe/hwmon: Add support to manage power limits though mailbox
      drm/xe/hwmon: Move card reactive critical power under channel card

Maciej Patelczyk (1):
      drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()

Matthew Auld (4):
      drm/xe/vm: move rebind_work init earlier
      drm/xe/vm: move xe_svm_init() earlier
      drm/xe/sched: stop re-submitting signalled jobs
      drm/xe/guc_submit: add back fix

Niranjana Vishwanathapura (1):
      drm/xe: Create LRC BO without VM

Raag Jadav (1):
      drm/xe: drop redundant conversion to bool

Thomas Hellström (1):
      drm/xe: Rework eviction rejection of bound external bos

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  20 +-
 drivers/gpu/drm/xe/Kconfig                         |   3 +-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   4 -
 drivers/gpu/drm/xe/xe_bo.c                         |  48 ++-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   4 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  15 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  11 +
 drivers/gpu/drm/xe/xe_hwmon.c                      | 388 +++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.c                        |  23 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                      |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                      |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   7 +
 drivers/gpu/drm/xe/xe_pxp.c                        |   8 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  27 +-
 drivers/gpu/drm/xe/xe_vm.h                         |  69 ++++
 drivers/gpu/drm/xe/xe_vm_types.h                   |   8 +
 include/uapi/drm/xe_drm.h                          |   5 +
 21 files changed, 493 insertions(+), 188 deletions(-)
