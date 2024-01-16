Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C582EF6A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119B10E512;
	Tue, 16 Jan 2024 13:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFDE10E4F2;
 Tue, 16 Jan 2024 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410465; x=1736946465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WrWCScCkq6/IIBGeJNWgH5pNBm3gK5BqAktItdbOh8Q=;
 b=jvYEhGmIxMg1QTTIOLofRq3p1gNfUHL1tdj1XoKK0bJH3c/GScQFOwjC
 RaMrBjrcG9mlOQsD+avUFT32KzZIKtSP1MaZBrIAyrj7reM1aXfaN5XQI
 zuamq9DGySsRawpEZYh1bUhsHf0gxQLrKYh77m95kM70CbdxHXUX3Af54
 BnnA42yBW01cov711rpdSYHLHCHrpvsmnXsSf4Z5BT/A6r05QBSAyJ5iX
 23ly7IZaQ6XRQW+cny9XoML6+8KCAvM+91JXIWxm/slsEKqUETYfAIqK3
 qLt3u98xPg9QsuwyzAA9Y6G+5onYD1il/RwA33eJWE7Q/7E08vxgG3Bhw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6949032"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6949032"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="777046372"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777046372"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] drm: drm debug and error logging improvements
Date: Tue, 16 Jan 2024 15:07:25 +0200
Message-Id: <cover.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is resend and more patches on top of [1]. I don't think I've
changed anything since then.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/126873/


Jani Nikula (10):
  drm/print: make drm_err_printer() device specific by using drm_err()
  drm/print: move enum drm_debug_category etc. earlier in drm_print.h
  drm/print: add drm_dbg_printer() for drm device specific printer
  drm/dp_mst: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/mode: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
  drm/i915: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
  drm/xe: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm: remove drm_debug_printer in favor of drm_dbg_printer

 drivers/gpu/drm/display/drm_dp_helper.c       |  17 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 +-
 drivers/gpu/drm/drm_mode_config.c             |   2 +-
 drivers/gpu/drm/drm_modeset_lock.c            |   2 +-
 drivers/gpu/drm/drm_print.c                   |  29 ++-
 .../drm/i915/display/intel_crtc_state_dump.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  27 ++-
 .../drm/i915/display/intel_display_driver.c   |   3 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   3 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  10 +-
 drivers/gpu/drm/i915/i915_driver.c            |   3 +-
 drivers/gpu/drm/i915/selftests/i915_active.c  |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c           |   4 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |   2 +-
 include/drm/display/drm_dp_helper.h           |   3 +-
 include/drm/drm_print.h                       | 220 +++++++++---------
 21 files changed, 206 insertions(+), 168 deletions(-)

-- 
2.39.2

