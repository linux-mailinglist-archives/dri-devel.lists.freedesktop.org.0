Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50A3F841A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1166E580;
	Thu, 26 Aug 2021 09:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8C6E56D;
 Thu, 26 Aug 2021 09:03:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281422765"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="281422765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:03:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="527763933"
Received: from jwhogabo-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.249.45.163])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:03:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org, 
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 26 Aug 2021 12:03:43 +0300
Message-ID: <87r1egd1cg.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Some pretty straightforward fixes for the merge window.

drm-intel-next-fixes-2021-08-26:
drm/i915 fixes for v5.15-rc1:
- Disable underrun recovery with eDP MSO panels on ADL-P
- Use designated initializers for init/exit table
- Fix some error pointer usages

BR,
Jani.

The following changes since commit 397ab98e2d69cede84444a28eab77a171983d14e:

  Merge tag 'drm-msm-next-2021-08-12' of https://gitlab.freedesktop.org/drm/msm into drm-next (2021-08-17 10:53:52 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2021-08-26

for you to fetch changes up to fb43ebc83e069625cfeeb2490efc3ffa0013bfa4:

  drm/i915/selftest: Fix use of err in igt_reset_{fail, nop}_engine() (2021-08-24 17:23:10 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.15-rc1:
- Disable underrun recovery with eDP MSO panels on ADL-P
- Use designated initializers for init/exit table
- Fix some error pointer usages

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gt: Potential error pointer dereference in pinned_context()

Kees Cook (1):
      drm/i915: Use designated initializers for init/exit table

Matt Roper (1):
      drm/i915/adl_p: Also disable underrun recovery with MSO

Nathan Chancellor (1):
      drm/i915/selftest: Fix use of err in igt_reset_{fail, nop}_engine()

 drivers/gpu/drm/i915/display/intel_display.c |  3 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c      |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c |  4 +--
 drivers/gpu/drm/i915/i915_module.c           | 37 ++++++++++++++++++----------
 4 files changed, 30 insertions(+), 16 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
