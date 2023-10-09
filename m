Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC67BE9B9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5090710E2C5;
	Mon,  9 Oct 2023 18:38:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20E210E2B2;
 Mon,  9 Oct 2023 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696876703; x=1728412703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/oiTJPGtL8cjmzkxr2nxNGQGC4B/IjsEU/ytqB3FHwk=;
 b=KOl1AV/TTZJXjc5gXX+Qd3OYF7Gr4kFXm6NXOp4nxYLeXZwu2M0Jrf4l
 Q1c+CuJGELuIyCngRYpF7JcwMpyALGUioN9EUtOQ6/ZZ2N2NfLhNqM/c3
 aCk64/fxw5aWNxUTB6ZlaAnQq77ghlMCuvSQtiDNTesN7WEiB8IrOuf6W
 NgpxNmuOTMKmWt7uYcpzhRmTrgUn3BZA1wyO8WMB1yG25BEwvV4KfxFrS
 NO7Hg85eU32E4+Nz+VK8wXE4MvrDDxiQ8GkGomdykHglMwLeqAgodVPVW
 fsXRpoqKK8fizZartVzd6EhfvD5W2l8Pwvgiw0f/Me8A0vmYE1Aq13L9E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384079350"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="384079350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 11:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756804145"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="756804145"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga007.fm.intel.com with ESMTP; 09 Oct 2023 11:38:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] More print message helper updates
Date: Mon,  9 Oct 2023 11:38:00 -0700
Message-ID: <20231009183802.673882-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

There was an update a while back to use sub-system specific print
helpers that implicitly add sub-system specific information to the
print. It seems a bunch of GT related messages got missed in that
update. So update them now.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/gt: More use of GT specific print helpers
  drm/i915: More use of GT specific print helpers

 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 29 +++++++++------------
 drivers/gpu/drm/i915/gt/intel_gsc.c         | 11 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_print.h    |  3 +++
 drivers/gpu/drm/i915/gt/intel_reset.c       | 26 ++++++++----------
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 13 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c   |  8 +++---
 drivers/gpu/drm/i915/i915_driver.c          |  3 ++-
 drivers/gpu/drm/i915/i915_perf.c            |  8 +++---
 8 files changed, 48 insertions(+), 53 deletions(-)

-- 
2.41.0

