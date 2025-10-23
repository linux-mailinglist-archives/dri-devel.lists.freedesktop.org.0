Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB0C001BC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0A510E16F;
	Thu, 23 Oct 2025 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6rmehwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34E810E16F;
 Thu, 23 Oct 2025 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210532; x=1792746532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tPdbH23x5snHIq0xLrYIxXUofyN9cOczbIj0uqqNkZM=;
 b=f6rmehwxpDGgKkm/0hvJWHVgByIj4wyHw2gIkTNuFyMFagi5EnS/C7NQ
 3id0lz9k43Tn+r3PUAAWUsp1pp/I2k8aVFAwqrrJawfDG+C8Sf9Roh7kH
 emuiRxr2BNd/+CegrWVso+5e0u3xrO3nDWTHPJT6pmDglAZG2eBeotyN0
 rnP3kh5ECKBgGsUIyT7C00NPi7ywBJ+OIUnqJA3jM3zIOuD9EyCR8JXLu
 eVl/0NTh50UB0M8H5RqgE4jzPQ8OUZTy7JRbX4rnuLpmqrFn4JicR5BlX
 QjQVXg9RgYCMtgpWuMcJUPIAKi00dc2HIGcd4AIGNUxzNW/LsZmeOtC8r g==;
X-CSE-ConnectionGUID: PpoHWih0RZmA5bCILyIffw==
X-CSE-MsgGUID: YWy76/HxQOChczfdafAAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020590"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:08:51 -0700
X-CSE-ConnectionGUID: 9acEZqpHREWkPxJnI0H+Dw==
X-CSE-MsgGUID: gg0r5eVWTBa9HIJ1Y+dYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329373"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:08:49 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/8] Enable DP2.1 alpm
Date: Thu, 23 Oct 2025 14:11:39 +0530
Message-Id: <20251023084147.572535-1-animesh.manna@intel.com>
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

Animesh Manna (8):
  drm/i915/alpm: Add dpcd definition for DP2.1 alpm capability
  drm/i915/alpm: alpm_init() for DP2.1
  drm/i915/alpm: Replace is_edp() with alpm_is_possible()
  drm/i915/alpm: Enable debugfs for DP2.1
  drm/i915/alpm: Auxless wake time calculation for Xe3p
  drm/i915/alpm: Half LFPS cycle calculation
  drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf
  drm/i915/alpm: Program lttpr count for DP 2.1 alpm

 drivers/gpu/drm/i915/display/intel_alpm.c     | 141 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h     |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   6 +-
 .../drm/i915/display/intel_dp_link_training.c |  12 ++
 drivers/gpu/drm/i915/display/intel_psr.c      |  23 ++-
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 -
 include/drm/display/drm_dp.h                  |   4 +-
 8 files changed, 145 insertions(+), 45 deletions(-)

-- 
2.29.0

