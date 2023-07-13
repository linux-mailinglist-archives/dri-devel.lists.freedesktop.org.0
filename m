Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D37519ED
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19DF10E60E;
	Thu, 13 Jul 2023 07:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EF710E60D;
 Thu, 13 Jul 2023 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689233296; x=1720769296;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9NYx/YyOAo3XxlPiXm5jdCZsFrSJVXJKbqcBKmFsCQQ=;
 b=W2Ll2WTXLfyjgXgKSQYglhTZQFKCqcxHSJoM4KfMz50s5Oug3KtYGzmm
 DNA486CaR0nVWDV9xapzVsAU88wIcMPaL9hVoEUs6JARCQu1xrH4BBFKu
 Mk8hBbQeaWAAC290otMLZy2DLZBC9WZTWHQ8Y8s2pE+c0+RBXO5awuZqi
 MvQrcTGgAXrq3yaDGOy7JM9b/S6zZ+UedWECNm6a/+GrVjw0riihjKcYF
 PHkwclnR9VgiM6a3J/Rq0xEFkzVyeoeBMUaY3DCOyWZF6o6IRX5IArXVZ
 +UttX3hhaOyd5p8nFb9UxyT/lxzZFc5aRENsBqUyHpTxTlG8gHaC/rxej A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395914972"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="395914972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 00:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835468324"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="835468324"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.206.56])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 00:26:51 -0700
Date: Thu, 13 Jul 2023 08:26:49 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZK+nHLCltaxoxVw/@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Daniel,

Just a few small fixes for the 6.5 RC this week - one functional fixup for
reading of perf/OA buffers and some code cleanups elsewhere.

Regards,

Tvrtko

drm-intel-fixes-2023-07-13:
- Don't preserve dpll_hw_state for slave crtc in Bigjoiner (Stanislav Lisovskiy)
- Consider OA buffer boundary when zeroing out reports [perf] (Umesh Nerlige Ramappa)
- Remove dead code from gen8_pte_encode (Tvrtko Ursulin)
- Fix one wrong caching mode enum usage (Tvrtko Ursulin)
The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-07-13

for you to fetch changes up to 113899c2669dff148b2a5bea4780123811aecc13:

  drm/i915: Fix one wrong caching mode enum usage (2023-07-11 09:21:32 +0100)

----------------------------------------------------------------
- Don't preserve dpll_hw_state for slave crtc in Bigjoiner (Stanislav Lisovskiy)
- Consider OA buffer boundary when zeroing out reports [perf] (Umesh Nerlige Ramappa)
- Remove dead code from gen8_pte_encode (Tvrtko Ursulin)
- Fix one wrong caching mode enum usage (Tvrtko Ursulin)

----------------------------------------------------------------
Stanislav Lisovskiy (1):
      drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner

Tvrtko Ursulin (2):
      drm/i915: Remove dead code from gen8_pte_encode
      drm/i915: Fix one wrong caching mode enum usage

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Consider OA buffer boundary when zeroing out reports

 drivers/gpu/drm/i915/display/intel_display.c |  1 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c         |  3 ---
 drivers/gpu/drm/i915/gt/intel_gtt.c          |  2 +-
 drivers/gpu/drm/i915/i915_perf.c             | 11 ++++++++++-
 4 files changed, 11 insertions(+), 6 deletions(-)
