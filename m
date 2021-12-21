Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07147C83A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 21:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CAB112CE5;
	Tue, 21 Dec 2021 20:29:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D5A112993;
 Tue, 21 Dec 2021 20:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640118567; x=1671654567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XCCGziIQ++WY6elBCGpBCKNv+fmkD46UEwfyq1dszhQ=;
 b=Aos8U2ScZxTEN9utf7b2C+H8gh67nma9zfOS2h6/tF7D4N5y5d6ckluM
 4c1hSagXx4WS3VDpQ9PpoGPOG2zuGEutlOEl/JANo4cmlhC4tCVaOYQxu
 o7UiMoHx7v3XYatv6yU/dVZ10hEYGGViZxh1dVJDqER63Qcllttm4uq2w
 IlP6zMrpW0bOhIBqJ2+2WPbwHsdCrHDWDggwDp6c2UQ2SLTwAVkErUkFR
 OSCd8N/WqHNoKw41uo1fDUTlFByl6QWGDP5dphX4dJOnvR9ZzyUPNq+nx
 VT1KzALCzlMr6Elcysujs4v6mvkzCu0rZO5cnsYow+sA798j6VuYtxjZb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227782074"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="227782074"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="607182365"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2021 12:29:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Update to GuC version 69.0.3
Date: Tue, 21 Dec 2021 12:28:59 -0800
Message-Id: <20211221202902.1395588-1-John.C.Harrison@Intel.com>
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

