Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE33281F79E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 12:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C42B10E0DC;
	Thu, 28 Dec 2023 11:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584710E083;
 Thu, 28 Dec 2023 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703762171; x=1735298171;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=19Ojl5bDPVEokFYVcT38PKNoHAV7wiNJywhB4niWWiw=;
 b=Ja2FdiZR1kXLYn9ym2IDhY5RZSk+fJT5AUIAlSexp8Sv7fsBFTOmIUSz
 hYlbJ/kLG8AIXKoAKlOBtboeYKe43HjoyRaFJKsitQlxmroBuxK9N8imD
 lIghJQ2iHx2Yd6UXLNA6bevdc+Td6M2Vw5nEKObMtRp77IWaTJe7mYu7G
 mtepB91A9UW3nGhUOp3E1XlTtAjQPADAriH6qDFtRWGP8g6zTKAWn8evJ
 jLGnQ2LrU6nUapYtPgiFIzXZgdFG6+DovYOZbsGEEgmZrxxKdG0N4HhGM
 jGIQA/wL9ZR6FuhhQQAlWvn9lXAM5uSXwpXGlytOJ62wdhCQxMh1L8x+6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3833715"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="3833715"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="897175972"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="897175972"
Received: from piotrfor-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.87])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:16:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 28 Dec 2023 13:16:03 +0200
Message-ID: <87cyuqk26k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

A couple of more fixes towards v6.7.

drm-intel-fixes-2023-12-28:
drm/i915 fixes for v6.7-rc8:
- Fix bogus DPCD rev usage for DP phy test pattern setup
- Fix handling of MMIO triggered reports in the OA buffer

BR,
Jani.

The following changes since commit 861deac3b092f37b2c5e6871732f3e11486f7082:

  Linux 6.7-rc7 (2023-12-23 16:25:56 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-12-28

for you to fetch changes up to ee11d2d37f5c05bd7bf5ccc820a58f48423d032b:

  drm/i915/perf: Update handling of MMIO triggered reports (2023-12-27 12:50:15 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc8:
- Fix bogus DPCD rev usage for DP phy test pattern setup
- Fix handling of MMIO triggered reports in the OA buffer

----------------------------------------------------------------
Khaled Almahallawy (1):
      drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Update handling of MMIO triggered reports

 drivers/gpu/drm/i915/display/intel_dp.c |  2 +-
 drivers/gpu/drm/i915/i915_perf.c        | 39 ++++++++++++++++++++++++++++-----
 2 files changed, 35 insertions(+), 6 deletions(-)

-- 
Jani Nikula, Intel
