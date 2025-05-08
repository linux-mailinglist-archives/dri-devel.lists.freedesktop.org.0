Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2331AAFFD2
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 18:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2132C10E934;
	Thu,  8 May 2025 16:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGDbjDS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246D810E934;
 Thu,  8 May 2025 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746720099; x=1778256099;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UPUn/xG3EsmQopC202RngQuC8r7hb7R3pxypDlmBwpo=;
 b=eGDbjDS2lMhow3i0mbRTNmKuYdXABTmxbiE/nCCMnDkxuGdQ5ZntIAlL
 8X7YaSscZYlp+tEJpBrPdO/iCRqD1K8lgt9Jytvbf2DADoI1/59o2ee9W
 lKo8JR+DgGlSXAg7FanukrmVU6lY0hbRK7quLLiXUOl9873YLVw9oq/92
 JbUgdV/OhiSLZTdg28mjgUw4TfdbgmxkMW+r51xEI01FptSOZitAVAV5N
 MgLkx28lDfEXpGgOBSVwxbcpFfOvN4Z5e1bVpbT5+b/tpAc3SSLmkLERA
 m6RZ8feUbbS7IBdcGDzjW4NILlmta55Vxmb1hdoXTupYQUttYcr9/bOWv Q==;
X-CSE-ConnectionGUID: wtQEexElTn2oyjbJP3WkKQ==
X-CSE-MsgGUID: xNB4ONsaSP6R03p1dRwWhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48225265"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48225265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 09:01:37 -0700
X-CSE-ConnectionGUID: nWo9roGqRBqypNsuUiw2LQ==
X-CSE-MsgGUID: DyZ3l572QRu2S8YA2Sva+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="141458338"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO fedora) ([10.124.222.207])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 09:01:19 -0700
Date: Thu, 8 May 2025 18:01:07 +0200
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
Message-ID: <aBzUwbzCzz7Qo7fA@fedora>
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

Hi Dave, Simona

The probably last drm-xe-next PR towards 6.16.
Almost only fixes, except for the PCIe link downgrade attributes.

Thanks,
Thomas

drm-xe-next-2025-05-08:
UAPI Changes:
- Expose PCIe link downgrade attributes (Raag)

Cross-subsystem Changes:

Core Changes:
- gpusvm has_dma_mapping fix (Dafna)

Driver Changes:
- Forcewake hold fix (Tejas)
- Fix guc_info debugfs for VFs (Daniele)
- Fix devcoredump chunk alignment calculation (Arnd)
- Don't print timedout job message on killed exec queues (Matt Brost)
- Don't flush the GSC worker from the reset path (Daniele)
- Use copy_from_user() instead of __copy_from_user() (Harish)
- Only flush SVM garbage collector if CONFIG_DRM_XE_GPUSVM (Shuicheng)
- Fix forcewake vs runtime pm ref release ordering (Shuicheng)
- Move xe_device_sysfs_init() to xe_device_probe() (Raag)
- Append PCIe Gen5 limitations to xe_firmware document (Raag)
The following changes since commit 1bb53d05ba71b684f61bd11df8b99fe75ce52754:

  Merge drm/drm-next into drm-xe-next (2025-04-28 17:42:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-05-08

for you to fetch changes up to 252c4711973de4e4f3ecddcc18912aecfd4e537c:

  drm/xe/doc: Wire up PCIe Gen5 limitations (2025-05-07 15:31:11 -0400)

----------------------------------------------------------------
UAPI Changes:
- Expose PCIe link downgrade attributes (Raag)

Cross-subsystem Changes:

Core Changes:
- gpusvm has_dma_mapping fix (Dafna)

Driver Changes:
- Forcewake hold fix (Tejas)
- Fix guc_info debugfs for VFs (Daniele)
- Fix devcoredump chunk alignment calculation (Arnd)
- Don't print timedout job message on killed exec queues (Matt Brost)
- Don't flush the GSC worker from the reset path (Daniele)
- Use copy_from_user() instead of __copy_from_user() (Harish)
- Only flush SVM garbage collector if CONFIG_DRM_XE_GPUSVM (Shuicheng)
- Fix forcewake vs runtime pm ref release ordering (Shuicheng)
- Move xe_device_sysfs_init() to xe_device_probe() (Raag)
- Append PCIe Gen5 limitations to xe_firmware document (Raag)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe: fix devcoredump chunk alignmnent calculation

Dafna Hirschfeld (1):
      drm/gpusvm: set has_dma_mapping inside mapping loop

Daniele Ceraolo Spurio (2):
      drm/xe/vf: Fix guc_info debugfs for VFs
      drm/xe/gsc: do not flush the GSC worker from the reset path

Harish Chegondi (1):
      drm/xe: Use copy_from_user() instead of __copy_from_user()

Matthew Brost (1):
      drm/xe: Do not print timedout job message on killed exec queues

Raag Jadav (3):
      drm/xe: Move xe_device_sysfs_init() to xe_device_probe()
      drm/xe: Expose PCIe link downgrade attributes
      drm/xe/doc: Wire up PCIe Gen5 limitations

Shuicheng Lin (2):
      drm/xe: Add config control for svm flush work
      drm/xe: Release force wake first then runtime power

Tejas Upadhyay (1):
      drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

 Documentation/gpu/xe/xe_firmware.rst |   6 ++
 drivers/gpu/drm/drm_gpusvm.c         |   2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c   |   7 ++-
 drivers/gpu/drm/xe/xe_bo.c           |   4 +-
 drivers/gpu/drm/xe/xe_devcoredump.c  |  13 +++--
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_eu_stall.c     |   4 +-
 drivers/gpu/drm/xe/xe_exec.c         |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c   |   9 ++-
 drivers/gpu/drm/xe/xe_gsc.c          |  22 ++++++++
 drivers/gpu/drm/xe/xe_gsc.h          |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c    |  11 ++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h    |   1 +
 drivers/gpu/drm/xe/xe_gt.c           |   2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |   9 +--
 drivers/gpu/drm/xe/xe_guc.c          |  40 +++++++-------
 drivers/gpu/drm/xe/xe_guc_submit.c   |   9 ++-
 drivers/gpu/drm/xe/xe_oa.c           |   6 +-
 drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
 drivers/gpu/drm/xe/xe_pm.c           |   8 +--
 drivers/gpu/drm/xe/xe_svm.c          |  13 ++++-
 drivers/gpu/drm/xe/xe_svm.h          |   6 ++
 drivers/gpu/drm/xe/xe_uc.c           |   8 ++-
 drivers/gpu/drm/xe/xe_uc.h           |   1 +
 drivers/gpu/drm/xe/xe_vm.c           |   9 ++-
 26 files changed, 241 insertions(+), 68 deletions(-)
