Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80908079C2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 21:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EB110E158;
	Wed,  6 Dec 2023 20:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A3410E158;
 Wed,  6 Dec 2023 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895710; x=1733431710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q4oZK6mNhAuBdkV8C4Kgzvy+Q5d05fjkri7NkgkKj7s=;
 b=kBQD53kQT2VrrIzqEXsCVlECjmb79vmVqIOSGqqjBYWjn0XIZgqCeYGN
 BEOlWBrZqQ7WNS7sEnc+UwLnRA8mi7t4Np7X2zjjSr19eijWJxGkEHsMz
 adx2Ul6Taf/Gv6aGaWavv9CkMlHyG0ZV6fK6LBsfzrDYPVsmrFSCrlfdz
 Fn0YweSuJJKvoOWVRFb9c50WUWgxMK72MerVqgW/aqlRmeiXrezfq4UrZ
 lQeiafEUQwIFVdIpmQ8Qq026kGRfOTs15kDWwRJl2wfgGcGkpE3HpptB4
 iq7uajJ6ZsNOEXSJ4vgsdRaVwEnKGEkuyukS5/LOxkn/MEsR2sJQD+Bx/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396914494"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="396914494"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775139855"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775139855"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:04 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/4] Add gt_to_guc() helper
Date: Wed,  6 Dec 2023 21:46:40 +0100
Message-ID: <20231206204644.105064-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is just a resend of this series:

https://patchwork.freedesktop.org/series/125583/

but I removed patch one that introduces guc_to_i915()

Thanks,
Andi

Changelog:
==========
v2 -> v3:
 - Remove patch 1 that contained guc_to_i915()
v1 -> v2:
 - add the gt_to_guc() helper and change files in:
    - i915/gt/
    - i915/gt/uc
    - i915/

Andi Shyti (4):
  drm/i915/gt: Create the gt_to_guc() wrapper
  drm/i915/guc: Use the new gt_to_guc() wrapper
  drm/i915: Use the new gt_to_guc() wrapper
  drm/i915/guc: Use the ce_to_guc() wrapper whenever possible

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  9 ++----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  5 ++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  6 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  8 ++---
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +--
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  6 ++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  6 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 30 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  4 +--
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c    |  2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |  4 +--
 21 files changed, 57 insertions(+), 54 deletions(-)

-- 
2.43.0

