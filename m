Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB1688B85
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757E10E6B8;
	Fri,  3 Feb 2023 00:11:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D2910E6AF;
 Fri,  3 Feb 2023 00:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675383101; x=1706919101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5djIHtQjl9Xae0sI91bqeuEN1fgt79EofqHgIdFktpE=;
 b=WjCgZa66ljcJCKwMSKQjkzOc+VdR122pnlRX4K0YtxRCA9OAGFH9d9oA
 KY3iGvfZzJpu8O3pCsFBaAGeqPh/IC/dq6PjHsQ01hG8X0LLgfN6VTi0E
 F84O6BFs6OgCxl0KXTm5/5VXdaw4MldgnGrOi7GrgUG4tXJJo9OgkEVP/
 2g1/h4Eo4yE9HOnqEIiwBDGyHOEwInYk6IP/rhQgKPEUL5rgnKhTulR2b
 +XC+iRH2gU4r/A22Xdpc/69whVdY2Geh8U2mKHGdYX3U6vj/xnKOD8YSK
 W23P1pQiaE29X64zHF7Yd/4SKo3KWE+/ALPeBGOexOJ04rhcsY9Grox9z g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393204043"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393204043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789487428"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="789487428"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 16:11:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/6] More drm_dbg to guc_dbg changes
Date: Thu,  2 Feb 2023 16:11:37 -0800
Message-Id: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/i915/guc: More debug print updates - UC firmware
  drm/i915/guc: More debug print updates - GSC firmware
  drm/i915/guc: More debug print updates - GuC reg capture
  drm/i915/guc: More debug print updates - GuC selftests
  drm/i915/guc: More debug print updates - GuC SLPC
  drm/i915/guc: More debug print updates - GuC logging

 drivers/gpu/drm/i915/gt/intel_gt_print.h      |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |   7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  51 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  60 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  42 +++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 116 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  35 +++---
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  23 ++--
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  11 +-
 13 files changed, 169 insertions(+), 201 deletions(-)

-- 
2.39.1

