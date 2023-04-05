Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1C6D77B1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47E210E89C;
	Wed,  5 Apr 2023 09:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C862F10E893;
 Wed,  5 Apr 2023 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680685451; x=1712221451;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=h7MndRAnPBMPnSq16jHLloJq0l8VtomsGxG8JgeQFfI=;
 b=G7fDNnKxQbPvoujRCeAqLQ4AUtlnndvnCTIsGjd9ktsFaVJVuiIUZTsy
 8XOO4N1VkiPSUvNAJGjRhJetOHGwmVI8eJcJzCbqGoapQZvnbnhuznOxo
 pYkz8GmwlO3kBvjC3FbovYS1nFR095lnanGpgIw6tuJJqlvtNb0k93wnT
 etSR1m6blnlPtGvF4k4w0uIZgfhwmrYuxjoP68Gm8XmlVpDea75NiNOfl
 28cndiczAjlqyfD/QLb88YIBF42RszjRtEyc0hPqM9918MKnryuoUtp06
 unqiyGsveSsiMeLnnJGmTspghzsldto4222Ag6QKfj5cWZV7mWRNgy1Vb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344982167"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="344982167"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 02:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689198031"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="689198031"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 02:04:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 05 Apr 2023 12:04:04 +0300
Message-ID: <87zg7mzomz.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2023-04-05:
drm/i915 fixes for v6.3-rc6:
- Fix DP MST DSC M/N calculation to use compressed bpp
- Fix racy use-after-free in perf ioctl
- Fix context runtime accounting
- Fix handling of GT reset during HuC loading
- Fix use of unsigned vm_fault_t for error values

BR,
Jani.

The following changes since commit 7e364e56293bb98cae1b55fd835f5991c4e96e7d:

  Linux 6.3-rc5 (2023-04-02 14:29:29 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-04-05

for you to fetch changes up to dc3421560a67361442f33ec962fc6dd48895a0df:

  drm/i915: Fix context runtime accounting (2023-04-03 11:37:00 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.3-rc6:
- Fix DP MST DSC M/N calculation to use compressed bpp
- Fix racy use-after-free in perf ioctl
- Fix context runtime accounting
- Fix handling of GT reset during HuC loading
- Fix use of unsigned vm_fault_t for error values

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/i915/huc: Cancel HuC delayed load timer on reset.

Matthew Auld (1):
      drm/i915/ttm: fix sparse warning

Min Li (1):
      drm/i915: fix race condition UAF in i915_perf_add_config_ioctl

Stanislav Lisovskiy (1):
      drm/i915: Use compressed bpp when calculating m/n value for DP MST DSC

Tvrtko Ursulin (1):
      drm/i915: Fix context runtime accounting

 drivers/gpu/drm/i915/display/intel_dp_mst.c          |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c              |  5 +++--
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 ++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c               |  7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.h               |  7 +------
 drivers/gpu/drm/i915/i915_perf.c                     |  6 +++---
 6 files changed, 25 insertions(+), 14 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
