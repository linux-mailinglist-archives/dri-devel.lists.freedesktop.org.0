Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817EDC2E470
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736AE10E4D0;
	Mon,  3 Nov 2025 22:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+ENRt1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E23D10E4CE;
 Mon,  3 Nov 2025 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209441; x=1793745441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vi4WiJ9nnEk7TTDLvMrIe/3L9lSyxjEbTfgwyMTsKWI=;
 b=Z+ENRt1Hf4d5EdLtiIW+kJ2z8whewksK83WJkzEi69HJcDVjJdq4wdgy
 6B2WCjS1oYxBn9n1e+heN/mGiVtsGF/t2j5u0+aKP4qtk8cPUS/PsQurH
 4bvj45vsBu+6DqB9UU7V1CSOKkomn/ZS/vveJO8FxRN0Xyxt/HWmKnebE
 2KOkRHcLlBUw5pu12LDceS7y+AdCdeJPttOVYpUr7kapnXW1QnAJN4FiE
 APtMl/ye83QjruF/mnhxdA8pGcU/byprizd0sW1WQpcV80xmyCNL7pGXj
 SHlUlJWwKPNHKba7T2wGy1+5wgSRba/H7NwEgZAZgcyc3HOt24P63aie2 Q==;
X-CSE-ConnectionGUID: VvrB1a0VQTiu9zmPOuzKBg==
X-CSE-MsgGUID: po9pttUeSnGUNpSoouvcag==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899601"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:21 -0800
X-CSE-ConnectionGUID: SJeUUDl6Q42nToRPpGofxg==
X-CSE-MsgGUID: wbf1KA8hTZui5L/4cGk0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707489"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:19 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 00/10] Enable DP2.1 alpm
Date: Tue,  4 Nov 2025 03:39:47 +0530
Message-Id: <20251103220957.1229608-1-animesh.manna@intel.com>
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
  drm/i915/alpm: Add dpcd definition for DP2.1 alpm capability
  drm/i915/alpm: alpm_init() for DP2.1
  drm/i915/alpm: Enable debugfs for DP2.1
  drm/i915/alpm: Refactor Auxless wake time calculation
  drm/i915/alpm: Auxless wake time calculation for Xe3p
  drm/i915/alpm: Half LFPS cycle calculation
  drm/i915/alpm: Program lttpr count for DP 2.1 alpm
  drm/i915/alpm: Enable MAC Transmitting LFPS for LT phy
  drm/i915/alpm: Replace is_edp() with alpm_is_possible()
  drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf

 drivers/gpu/drm/i915/display/intel_alpm.c     | 148 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h     |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +-
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
 .../drm/i915/display/intel_dp_link_training.c |  12 ++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  35 +++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  23 ++-
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 -
 include/drm/display/drm_dp.h                  |   4 +-
 12 files changed, 197 insertions(+), 50 deletions(-)

-- 
2.29.0

