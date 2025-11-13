Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F56C57661
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA5F10E7F2;
	Thu, 13 Nov 2025 12:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUan4Dmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97010E057;
 Thu, 13 Nov 2025 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036929; x=1794572929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZmAF3j0/+fOdU29f+yTQPVoVn9cxvMyokKZjf3wQX7s=;
 b=PUan4DmyuZiBlGj14+wIiyY7+Qjlj8Vb4lqRKMJAt7PPGm02U7zdTMgl
 VoqmkyQ0kyGzVHkSh2Lh87Jr+xmav5CnN5EtjQnXF+zpXIvP+68VdZxBI
 lcE5yQYW7JRhHmzDdhXnl9h/tQI83pdVpXR/zWMgCcuT1sb0fyFXEHACn
 xIBzNsxYxG6xq6ScuzR85ed9IV7MA7n5T6ZW+tCH37eAK3RTjPuA29qZQ
 2WbIup8INL5iQ+Wvz32SsJbInxF8fDcHd7WHLAAEFGIXvkCowCUj1iGSD
 iHLgNJXEDP1HzSjcregQLcyIHg5J7r8zxsJu33EK+ERXhKr4Wl6OtJuQC g==;
X-CSE-ConnectionGUID: cwhWAjWjQOORORSQu0rKtA==
X-CSE-MsgGUID: PO4ZMpkpQGyRbGDhTgSTtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677882"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:28:49 -0800
X-CSE-ConnectionGUID: BVA4dMVwSyCvdZInfyUnAg==
X-CSE-MsgGUID: +l3IvRu0RnKvhrZTS1ej0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757721"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:28:47 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 00/10] Enable DP2.1 alpm
Date: Thu, 13 Nov 2025 17:31:09 +0530
Message-Id: <20251113120119.1437955-1-animesh.manna@intel.com>
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
  drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
  drm/i915/alpm: Enable MAC Transmitting LFPS for LT PHY
  drm/i915/alpm: Replace is_edp() with alpm_is_possible()
  drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf

 drivers/gpu/drm/i915/display/intel_alpm.c     | 139 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h     |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +-
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   8 +-
 .../drm/i915/display/intel_dp_link_training.c |  16 ++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  27 ++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  23 ++-
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 -
 include/drm/display/drm_dp.h                  |   4 +-
 12 files changed, 188 insertions(+), 46 deletions(-)

-- 
2.29.0

