Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4665729F2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9F0976BF;
	Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24869976B9;
 Tue, 12 Jul 2022 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668697; x=1689204697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/N+w7CWzfFnhFX9IrB4iV9IVfEftLd8nd3KCWhApDZg=;
 b=TD+p7Zld+y0i28t4RscxPP9O7hKVN5F5YHo/+TkfPbj07AZ9rJwu+cum
 P0aMgBJNYo81DNMjLqGZH7z2MZjyPsReaFo0IaDxT823wzvDau0BhDO/b
 9LVpd43DT1Is233dBIisoRUFikqAOMUtPHSw74XTvTYKmVQxuKXdDpkpo
 nZaWLhIyIZYt5Ggt8iviVgavQJbGdn+fngpG3d5mxp7C3M3NMFNNQzG4Y
 FFKlpEsmykDIb3+FV/21iutv+SfwA8ZAFevQFSz96ZyfN4BdUTlDEW7Ur
 HLggveVnAld3GozumfA0bZRZfrNgi1VII3pbHYLbGaN0BzUl8UJ4o/gjV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812560"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812560"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137751"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 00/12] Random assortment of (mostly) GuC related patches
Date: Tue, 12 Jul 2022 16:31:24 -0700
Message-Id: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Pushing a bunch of patches which had gotten forgotten about.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Alan Previn (1):
  drm/i915/guc: Add a helper for log buffer size

Chris Wilson (1):
  drm/i915/guc: Use streaming loads to speed up dumping the guc log

John Harrison (4):
  drm/i915/guc: Add GuC <-> kernel time stamp translation information
  drm/i915/guc: Record CTB info in error logs
  drm/i915/selftest: Cope with not having an RCS engine
  drm/i915/guc: Don't abort on CTB_UNUSED status

Matthew Brost (4):
  drm/i915: Remove bogus GEM_BUG_ON in unpark
  drm/i915/guc: Don't call ring_is_idle in GuC submission
  drm/i915/guc: Fix issues with live_preempt_cancel
  drm/i915/guc: Support larger contexts on newer hardware

Michał Winiarski (1):
  drm/i915/guc: Route semaphores to GuC for Gen12+

Rahul Kumar Singh (1):
  drm/i915/guc: Add selftest for a hung GuC

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  13 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   2 -
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  12 +-
 .../gt/uc/abi/guc_communication_ctb_abi.h     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  19 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  75 ++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 ++
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 159 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_debugfs.c           |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  67 +++++++-
 drivers/gpu/drm/i915/i915_gpu_error.h         |  21 ++-
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 19 files changed, 393 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c

-- 
2.36.0

