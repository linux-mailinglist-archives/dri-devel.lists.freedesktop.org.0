Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB585F694
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC310E03A;
	Thu, 22 Feb 2024 11:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lb0tLQVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0F10E25B;
 Thu, 22 Feb 2024 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708600398; x=1740136398;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6mY7amn0xbeZUMVa77tyrpin6OBztF/JoIRQ7PFk2IY=;
 b=lb0tLQVtpLJPEGi92AOJoHheGXcY5hNztXugXjFoe7NxudGYHMus67Um
 OQyEQS3gXfwJ4b0FxTRs2/VqE8qZQLjowrFI2P5srR1bflSe8z4Mrs1cJ
 mHHsmTZEUrhYaMp/nCOrPnKTpVx2vpB16tj7NA8MhTYgJHxgtApC4Ir5+
 ubsktLACpeP0IXGU36tb9ZL/Zvxx+RH/CYSCn0bzzydMRspR0KlEgDT25
 2G2P4X1yv120J5SWposO8H30T4DuQgDOrPufe0TBbNcyZ2EHw2YxSZ/6j
 3qW1QA/+gp/GtmLNZCnIdIg6aCTNKg15ZkS8Vq/G0EkGAgbLo+OOXIG0C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13947580"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13947580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5365803"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora)
 ([10.249.254.168])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:13:12 -0800
Date: Thu, 22 Feb 2024 12:12:54 +0100
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
Message-ID: <ZdcsNrxdWMMM417v@fedora>
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

Hi, Dave Sima

The Xe pull request for 6.8-rc6
The uAPI fixes / adjustments we've been discussing
are starting to appear, and I will hopefully have the rest
for next week's PR. In addition two driver fixes.

drm-xe-fixes-2024-02-22:
UAPI Changes:
- Remove support for persistent exec_queues
- Drop a reduntant sysfs newline printout

Cross-subsystem Changes:

Core Changes:

Driver Changes:
- A three-patch fix for a VM_BIND rebind optimization path
- Fix a modpost warning on an xe KUNIT module

/Thomas

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-02-22

for you to fetch changes up to 6650d23f3e20ca00482a71a4ef900f0ea776fb15:

  drm/xe: Fix modpost warning on xe_mocs kunit module (2024-02-21 11:06:52 +0100)

----------------------------------------------------------------
UAPI Changes:
- Remove support for persistent exec_queues
- Drop a reduntant sysfs newline printout

Cross-subsystem Changes:

Core Changes:

Driver Changes:
- A three-patch fix for a VM_BIND rebind optimization path
- Fix a modpost warning on an xe KUNIT module

----------------------------------------------------------------
Ashutosh Dixit (2):
      drm/xe/xe_gt_idle: Drop redundant newline in name
      drm/xe: Fix modpost warning on xe_mocs kunit module

Matthew Brost (3):
      drm/xe: Fix xe_vma_set_pte_size
      drm/xe: Add XE_VMA_PTE_64K VMA flag
      drm/xe: Return 2MB page size for compact 64k PTEs

Thomas Hellström (1):
      drm/xe/uapi: Remove support for persistent exec_queues

 drivers/gpu/drm/xe/tests/xe_mocs_test.c  |  1 +
 drivers/gpu/drm/xe/xe_device.c           | 39 --------------------------------
 drivers/gpu/drm/xe/xe_device.h           |  4 ----
 drivers/gpu/drm/xe/xe_device_types.h     |  8 -------
 drivers/gpu/drm/xe/xe_exec_queue.c       | 33 ++++-----------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 --------
 drivers/gpu/drm/xe/xe_execlist.c         |  2 --
 drivers/gpu/drm/xe/xe_gt_idle.c          |  4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 --
 drivers/gpu/drm/xe/xe_pt.c               | 11 ++++++---
 drivers/gpu/drm/xe/xe_vm.c               | 14 ++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h         |  2 ++
 include/uapi/drm/xe_drm.h                |  1 -
 13 files changed, 28 insertions(+), 103 deletions(-)
