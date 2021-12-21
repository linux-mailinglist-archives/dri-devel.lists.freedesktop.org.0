Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95947B693
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 01:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73A10E1AD;
	Tue, 21 Dec 2021 00:52:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B077C10E1AD;
 Tue, 21 Dec 2021 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640047942; x=1671583942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XCCGziIQ++WY6elBCGpBCKNv+fmkD46UEwfyq1dszhQ=;
 b=BNM4OUvQZ6TzbzYOlX27VDuI1mh6+/BXUV9iyHlPeZruGtFIRr5eGWrf
 JEWblPOXOCWYbI/nZb2qo9pnfeudXauwMiRRCJCBH9AdvsN0QZHOYzjiS
 9ZJhN6HvY2o5/ZFodEgiK/2s8om8n3uca8I61Js21gkJ0wAJE/0G6FzlW
 gpkPF3C/SF+wYdX2ep6X8ODSXZt16XQbLkBqjrOaT/5Q+xleqgXlN3T37
 f2DnxlRgbxp449aV/1tQG2FkrqnKuGsq5YapWIyBEBI7MztgIaLK/6WXq
 epPYC/lrXtpVqzMdnv8j2UA+RZN8hN4qve17iqPIueXGoKWpbMJ4GMj5i g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264483623"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="264483623"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 16:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="547739314"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 16:52:21 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Update to GuC version 69.0.3
Date: Mon, 20 Dec 2021 16:52:18 -0800
Message-Id: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

Update to the latest GuC version. This includes a suite of interface
changes and new features with corresponding i915 side changes.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>



John Harrison (3):
  drm/i915/guc: Temporarily bump the GuC load timeout
  drm/i915/guc: Update to GuC version 69.0.3
  drm/i915/guc: Improve GuC loading status check/error reports

 Documentation/gpu/i915.rst                    |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  80 +++++-----
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  23 +++
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  82 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 126 +++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 141 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  30 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  37 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  31 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 -
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  18 +++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  31 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  30 ++--
 17 files changed, 493 insertions(+), 194 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h

-- 
2.25.1

