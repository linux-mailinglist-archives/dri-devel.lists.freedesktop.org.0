Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7768CEAF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 06:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2CF10E44F;
	Tue,  7 Feb 2023 05:07:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489510E2E2;
 Tue,  7 Feb 2023 05:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675746428; x=1707282428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kHKMB3auQYQ3FHq7vV/Tp3ibj9lN1JwjBzdI/0x81vk=;
 b=KeK0gF/7bHXhSQg4+6yMpuwsKAsZkT5gSg2V7NursMhexaMdYH+n9jqQ
 CMsmGpWg1tDFLgySXBRjrNg4Kt4aBgnKruyfEEr/sYlajLRxGaPdC20yN
 6CKQCV49q9hx9p0DLdTWIWeUUk6QSm9Lh/eWVx9EcUGHJ86emXNWZg4kW
 4/pzXenWQlhpwjdZDCmgPQZ7eXtTtZr2k+vywO/pO0BriqyQmzZcFL4kF
 XzeZ7OriOxvYBtMTz9HRUHRMMz/Z+VLJ1kuPFoSWLlndUIJqPWvRHMCte
 EDNe+Z1ja+UQ81gHcGLuJEohAXua9fU/fY1XRajls5xVc01VBQY1fWqms w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309049934"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="309049934"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 21:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840631488"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="840631488"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 21:07:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/6] More drm_dbg to guc_dbg changes
Date: Mon,  6 Feb 2023 21:07:11 -0800
Message-Id: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
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

Update more print messages to the new scheme.

v2: Also change all errors to %pe rather than %d (MichalW).
Few other tweaks.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/i915/guc: More debug print updates - UC firmware
  drm/i915/guc: More debug print updates - GSC firmware
  drm/i915/guc: More debug print updates - GuC reg capture
  drm/i915/guc: More debug print updates - GuC selftests
  drm/i915/guc: More debug print updates - GuC SLPC
  drm/i915/guc: More debug print updates - GuC logging

 drivers/gpu/drm/i915/gt/intel_gt_print.h      |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |   7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  51 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  61 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  42 +++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 116 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  42 ++++---
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  23 ++--
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  11 +-
 13 files changed, 174 insertions(+), 205 deletions(-)

-- 
2.39.1

