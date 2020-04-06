Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C976D19F4B2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE89F6E339;
	Mon,  6 Apr 2020 11:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64C96E339;
 Mon,  6 Apr 2020 11:37:02 +0000 (UTC)
IronPort-SDR: CCVQ6ZTeb/YOfvQry8CSu/+H98zFSyBqW0YikziTGRxjauUW8yluy2HjaHrBpTQwy/G7pWmvr7
 RmlbtpnOWrtQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:01 -0700
IronPort-SDR: 40Yyg5QUYx1xPr2VsubGHN5WLwquLvqJVJaULjJuIWqYJkjVf6PFQ6odiDKQ7Q+StddruG450/
 Gzm4aQO3QZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192191"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:36:59 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 00/18] Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:57:42 +0530
Message-Id: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now we have struct drm_device specific drm_WARN* macros which include
device information in the backtrace, so we know what device the
warnings originate from.

This series converts WARN* with drm_WARN* where struct drm_device
pointer can be extracted.

This series is the continuation of:
https://patchwork.freedesktop.org/series/72035/

Pankaj Bharadiya (18):
  drm/i915/display/icl_dsi: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/atomic_plane: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/ddi: Prefer drm_WARN* over WARN*
  drm/i915/display/display: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/display: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/dp: Prefer drm_WARN* over WARN*
  drm/i915/display/dpll_mgr: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/frontbuffer: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/global_state: Prefer drm_WARN* over WARN*
  drm/i915/display/overlay: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
  drm/i915/display/tc: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/vlv_dsi: Prefer drm_WARN_ON over WARN_ON
  drm/i915/gem: Prefer drm_WARN* over WARN*
  drm/i915/i915_drv: Prefer drm_WARN_ON over WARN_ON
  drm/i915/pmu: Prefer drm_WARN_ON over WARN_ON
  drm/i915/pm: Prefer drm_WARN_ON over WARN_ON
  drm/i915/runtime_pm: Prefer drm_WARN* over WARN*

 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 14 +++--
 drivers/gpu/drm/i915/display/intel_display.c  | 24 ++++----
 .../drm/i915/display/intel_display_power.c    | 35 ++++++++----
 drivers/gpu/drm/i915/display/intel_dp.c       | 26 ++++++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  8 +--
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  6 +-
 .../gpu/drm/i915/display/intel_global_state.c |  4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  6 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 16 +++---
 drivers/gpu/drm/i915/display/intel_tc.c       | 12 ++--
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  3 +-
 drivers/gpu/drm/i915/i915_pmu.c               | 11 +++-
 drivers/gpu/drm/i915/intel_pm.c               | 57 +++++++++++--------
 drivers/gpu/drm/i915/intel_runtime_pm.c       | 39 +++++++++----
 20 files changed, 170 insertions(+), 106 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
