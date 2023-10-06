Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE56F7BB336
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82B610E4C4;
	Fri,  6 Oct 2023 08:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C1110E4C3;
 Fri,  6 Oct 2023 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696581072; x=1728117072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jIGTwxTgVIRKiq6P16B+Z0vVnqxgS0dfATKUrrulTOc=;
 b=BYtsSKFy3Utq/pZyDTLxZ76QPTp2j2pD2SHTLYLHbI+cYE0FPVNIa/Xu
 MlfuttECkC/l7CSaoPQty+4WiJ7k9eNDPUjnpignCspXjZEG9e9frPOCF
 KM3KuL+jzd/0ASDlfd8Cy5Gt0ctnhAuhCuM3HanLyd24gCQCG0rG74xNC
 3d7FA431sYdMid3cb09v0M9d48MrlHw5NsAep092j72mh+vQ4Tu6QsYix
 NgKmkZe/vwfkTSllrGgA/zQjbD7dpZU5K2Ktl7uLcxi6uAgXO9rbAOlGJ
 e7W8UZIHDn7kbMm9nofKusDzFboJZ/960dEcEdbNX6mcFOTrMWYhDtwMR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363984166"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363984166"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="822432174"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="822432174"
Received: from stevegr-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.79])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:31:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Trim some pre-production code
Date: Fri,  6 Oct 2023 09:31:00 +0100
Message-Id: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A little bit of house keeping, trimming off some pre-production hardware and
incomplete platform support.

Tvrtko Ursulin (3):
  drm/i915: Remove early/pre-production Haswell code
  drm/i915: Remove incomplete PVC plumbing
  drm/i915: Remove xehpsdv support

 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   3 -
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  15 --
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  47 +----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   1 -
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  20 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  50 -----
 drivers/gpu/drm/i915/gt/intel_rps.c           |   6 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c          |   9 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 176 +-----------------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 -
 drivers/gpu/drm/i915/i915_debugfs.c           |  12 --
 drivers/gpu/drm/i915/i915_driver.c            |   1 -
 drivers/gpu/drm/i915/i915_drv.h               |  15 --
 drivers/gpu/drm/i915/i915_hwmon.c             |   6 -
 drivers/gpu/drm/i915/i915_pci.c               |  52 ------
 drivers/gpu/drm/i915/i915_perf.c              |   4 +-
 drivers/gpu/drm/i915/i915_reg.h               |   2 -
 drivers/gpu/drm/i915/intel_clock_gating.c     |  26 +--
 drivers/gpu/drm/i915/intel_device_info.c      |   2 -
 drivers/gpu/drm/i915/intel_device_info.h      |   2 -
 drivers/gpu/drm/i915/intel_step.c             |  80 +-------
 drivers/gpu/drm/i915/intel_uncore.c           | 142 --------------
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 -
 24 files changed, 15 insertions(+), 664 deletions(-)

-- 
2.39.2

