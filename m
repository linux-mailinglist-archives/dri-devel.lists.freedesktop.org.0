Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6EC4E090
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0BD10E565;
	Tue, 11 Nov 2025 13:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXM0RbdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972E310E046;
 Tue, 11 Nov 2025 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866644; x=1794402644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rjbfUJFmbKUgpA/Nf7y1+bSeIFnd/V/WxhH1KFtkYPY=;
 b=mXM0RbdIhdEQVSJbIdLhl9CHn9ASZutQx5GItTS21lRMPdpm53DuFT9h
 XGfGQKAi+KJqxOCsKM0ZPaGghAkQUn/k5PhNndbQUQQSYTB82vbleNpoW
 K853Ux5ybnyfsm9LaQgZrLPYZF1lMJe+ce8CdQ27CEf5VX93AkiE9MrfO
 l13VB115hba20P0A0cS5XYczTL5nnUfXeoCA7G0m97iFr2S/1hj7Wl+bS
 zIYQpmknytNcwYDy4k8kHfkfEHVAf+Nn7Fq8B1QF2RJ59VlueHVx1gLVQ
 6nHszpiT1saNYx+ZNk+VXaiHrz6CNI/wvemNovkb8YvYbfEE6VqQD6ghl Q==;
X-CSE-ConnectionGUID: z6fnBYFtRweQQHH7WOz2dQ==
X-CSE-MsgGUID: HYd97rFGRaGvL0+qC36Npw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967455"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:43 -0800
X-CSE-ConnectionGUID: kwihojWqQLCjnLP/p+/SIA==
X-CSE-MsgGUID: 6auE+D5sQeWY923yzydOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129188"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:41 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 00/10] Enable DP2.1 alpm
Date: Tue, 11 Nov 2025 18:13:06 +0530
Message-Id: <20251111124316.1421013-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ALPM support added on DP2.1 and xe3p will support DP2.1 alpm.
This patch series extending alpm supoort for DP2.1.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (10):
  drm/i915/alpm: Add DPCD definition for DP2.1 ALPM capability
  drm/i915/alpm: alpm_init() for DP2.1
  drm/i915/alpm: Enable debugfs for DP2.1
  drm/i915/alpm: Refactor Auxless wake time calculation
  drm/i915/alpm: Auxless wake time calculation for Xe3p
  drm/i915/alpm: Half LFPS cycle calculation
  drm/i915/alpm: Program lttpr count for DP 2.1 alpm
  drm/i915/alpm: Enable MAC Transmitting LFPS for LT phy
  drm/i915/alpm: Replace is_edp() with alpm_is_possible()
  drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf

 drivers/gpu/drm/i915/display/intel_alpm.c     | 157 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h     |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +-
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   8 +-
 .../drm/i915/display/intel_dp_link_training.c |  12 ++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  26 +++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  23 +--
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 -
 include/drm/display/drm_dp.h                  |   4 +-
 12 files changed, 194 insertions(+), 53 deletions(-)

-- 
2.29.0

