Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD454BBFCE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE5410E764;
	Fri, 18 Feb 2022 18:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7E310E685;
 Fri, 18 Feb 2022 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210058; x=1676746058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DSeQDU9OL37Ajr3okMKsZ6dbEgBuHePZ6iXJN1tbKwo=;
 b=ZzdbQ7Vs7ksUGpMiZ08lnk61qWr3rFLLLlVQlf0Rg5vldVio5Q7ggLv4
 sdXDvdIeNQoZGw1ixyZC4ir/8bDih4WbLUzdVnHdTJi5ih/ijb2XaYVPf
 90FL2DMRRXzdQ9UHin6rDh1rRCpJCcUEXSO6JmLKewTXQFK94HT+MAlVW
 QqcCp6fhMbEbFeae1liEGCgh00er7xjog+PPI2nvy96/K9z/cq5ViqjZ3
 Ki3hfxI7Ke3So9bDgwvFTTJmiy5rUhNnauuVTJWjfie3M8skFHOsmX1Xk
 aBfbkrgeOSewMGokI7PVsI+IGVjyN1+pKg+3DlOiLHyIL5vLeeraSt6n5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238592896"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238592896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489641970"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:36 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/15] drm/i915: Enable DG2
Date: Sat, 19 Feb 2022 00:17:37 +0530
Message-Id: <20220218184752.7524-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling the Dg2 on drm/i915.

This series adds support for 64k pagesize and documents the uapi
impacts. And also adds basic flat-ccs enabling patches to
support the local memory initialization and object creation. Kdoc is
added to document the Flat-ccs support.

Flat-ccs modifiers will be enabled in upcoming patches.

Note:
This is subset of https://patchwork.freedesktop.org/series/95686/ The
remaining patches of the series will be pursued in subsequent series.

And few patches are reviewed at and pulled from many series like
https://patchwork.freedesktop.org/series/99119/
https://patchwork.freedesktop.org/series/100373/
https://patchwork.freedesktop.org/series/97544/

Abdiel Janulgue (1):
  drm/i915/lmem: Enable lmem for platforms with Flat CCS

Ayaz A Siddiqui (1):
  drm/i915/gt: Clear compress metadata for Xe_HP platforms

CQ Tang (1):
  drm/i915/xehpsdv: Add has_flat_ccs to device info

John Harrison (1):
  drm/i915/dg2: Define GuC firmware version for DG2

Jouni Högander (1):
  drm/i915: Fix for PHY_MISC_TC1 offset

Matt Roper (2):
  drm/i915/dg2: Drop 38.4 MHz MPLLB tables
  drm/i915/dg2: Enable 5th port

Matthew Auld (6):
  drm/i915: enforce min GTT alignment for discrete cards
  drm/i915: support 64K GTT pages for discrete cards
  drm/i915/gtt: allow overriding the pt alignment
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/migrate: add acceleration support for DG2
  drm/i915/uapi: document behaviour for DG2 64K support

Ramalingam C (1):
  drm/i915: add needs_compact_pt flag

Robert Beckett (1):
  drm/i915: add gtt misalignment test

 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  16 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 210 +----------
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 ++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  21 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 158 +++++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  15 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  19 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  35 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 337 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  17 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   1 +
 drivers/gpu/drm/i915/i915_drv.h               |  17 +-
 drivers/gpu/drm/i915/i915_irq.c               |   5 +-
 drivers/gpu/drm/i915/i915_pci.c               |   3 +
 drivers/gpu/drm/i915/i915_reg.h               |   7 +-
 drivers/gpu/drm/i915/i915_vma.c               |   9 +
 drivers/gpu/drm/i915/intel_device_info.h      |   2 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 222 ++++++++++--
 include/uapi/drm/i915_drm.h                   |  45 ++-
 24 files changed, 934 insertions(+), 308 deletions(-)

-- 
2.20.1

