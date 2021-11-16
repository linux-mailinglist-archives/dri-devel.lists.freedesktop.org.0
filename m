Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C545390A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 18:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1376E114;
	Tue, 16 Nov 2021 17:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D416E102;
 Tue, 16 Nov 2021 17:58:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233606386"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="233606386"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="672056345"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] i915: Additional DG2 workarounds
Date: Tue, 16 Nov 2021 09:48:13 -0800
Message-Id: <20211116174818.2128062-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a few more DG2 workarounds that weren't included in the initial
batch.

v2:
 - Apply pipe control workaround to rcs indirect context rather than xcs
   indirect context.

v3:
 - s/IS_DG2_DISP_STEP/IS_DG2_DISPLAY_STEPPING/ for consistency with
   other platforms.


Matt Atwood (1):
  drm/i915/dg2: extend Wa_1409120013 to DG2

Matt Roper (3):
  drm/i915/dg2: s/DISP_STEPPING/DISPLAY_STEPPING/
  drm/i915/dg2: Add Wa_14010547955
  drm/i915/dg2: Add Wa_16011777198

Ramalingam C (1):
  drm/i915/dg2: Add Wa_16013000631

 drivers/gpu/drm/i915/display/intel_display.c |  4 ++++
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  5 +++++
 drivers/gpu/drm/i915/gt/intel_rc6.c          | 15 +++++++++++----
 drivers/gpu/drm/i915/i915_drv.h              |  2 +-
 drivers/gpu/drm/i915/i915_reg.h              |  5 +++--
 drivers/gpu/drm/i915/intel_pm.c              |  4 ++--
 6 files changed, 26 insertions(+), 9 deletions(-)

-- 
2.33.0

