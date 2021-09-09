Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21454053A0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3C6E85C;
	Thu,  9 Sep 2021 12:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404F86E853;
 Thu,  9 Sep 2021 12:52:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208009613"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208009613"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="539614232"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 00/13] drm/i915/dp: dp 2.0 enabling prep work
Date: Thu,  9 Sep 2021 15:51:52 +0300
Message-Id: <cover.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

v3 of https://patchwork.freedesktop.org/series/93800/ with minor tweaks
and the already merged patches obviously dropped.

Jani Nikula (13):
  drm/dp: add DP 2.0 UHBR link rate and bw code conversions
  drm/dp: use more of the extended receiver cap
  drm/dp: add LTTPR DP 2.0 DPCD addresses
  drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
  drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP 2.0 128b/132b mode
  drm/i915/dp: add helper for checking for UHBR link rate
  drm/i915/dp: use 128b/132b TPS2 for UHBR+ link rates
  drm/i915/dp: select 128b/132b channel encoding for UHBR rates
  drm/i915/dg2: configure TRANS_DP2_CTL for DP 2.0
  drm/i915/dp: add HAS_DP20 macro
  drm/i915/dg2: use 128b/132b transcoder DDI mode
  drm/i915/dg2: configure TRANS_DP2_VFREQ{HIGH,LOW} for 128b/132b
  drm/i915/dg2: update link training for 128b/132b

 drivers/gpu/drm/drm_dp_helper.c               | 42 +++++++-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 61 +++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c       |  6 ++
 drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
 .../drm/i915/display/intel_dp_link_training.c | 99 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 11 +++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               |  2 +-
 include/drm/drm_dp_helper.h                   |  6 ++
 9 files changed, 180 insertions(+), 49 deletions(-)

-- 
2.30.2

