Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395EF435A30
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 07:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397CC6EAAB;
	Thu, 21 Oct 2021 05:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF86E409;
 Thu, 21 Oct 2021 05:07:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="229215250"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="229215250"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:05 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="484048420"
Received: from gmherteg-mobl2.amr.corp.intel.com (HELO
 kialmah1-mobl1.amr.corp.intel.com) ([10.251.20.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:07:05 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: [RFC PATCH 0/4] drm/dp: Use DP2.0 DPCD 248h updated register/field
 names for DP PHY CTS
Date: Wed, 20 Oct 2021 22:07:09 -0700
Message-Id: <20211021050713.836498-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series updates DPCD 248h register name and PHY test patterns names to follow DP 2.0 Specs.
Also updates the DP PHY CTS codes of the affected drivers (i915, amd, msm)
No functional changes expected.
 
Reference: “DPCD 248h/10Bh/10Ch/10Dh/10Eh Name/Description Consistency”
https://groups.vesa.org/wg/AllMem/documentComment/2738

Khaled Almahallawy (4):
  drm/dp: Rename DPCD 248h according to DP 2.0 specs
  drm/i915/dp: Use DP 2.0 LINK_QUAL_PATTERN_* Phy test pattern
    definitions
  drm/amd/dc: Use DPCD 248h DP 2.0 new name
  drm/msm/dp: Use DPCD 248h DP 2.0 new names/definitions

 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |  2 +-
 drivers/gpu/drm/drm_dp_helper.c                  |  6 +++---
 drivers/gpu/drm/i915/display/intel_dp.c          | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.c              | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.c                 | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_link.c                 | 16 ++++++++--------
 include/drm/drm_dp_helper.h                      | 13 +++----------
 7 files changed, 33 insertions(+), 40 deletions(-)

-- 
2.25.1

