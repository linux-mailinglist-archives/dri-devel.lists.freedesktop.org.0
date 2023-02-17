Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A065F69AB65
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726610EFA4;
	Fri, 17 Feb 2023 12:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407F10EFB7;
 Fri, 17 Feb 2023 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676636676; x=1708172676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fohFRf4ky8BzUUod0wl6yyQp55taY4mQFvCQTTqlNW4=;
 b=nINMUmP6Adc3PyBaewYfhEQ0vnlnzCaAuSKBLZCbM1uQhJ/0pfjSPgwv
 pfXtPkSbbGRNSIPmVQFro4QFu9Hd5ZJJdZ9vyKJ6SJ0VEkfqrLNlKK11r
 oQ2UiOTAr90qbdalriR+/6i9jn0g+llBxQ0ULRmLVIsSFN5Wzys2Jlq7j
 qjBPMgq03mehVSDE8pBAtoPgwYZeFCbpGoXXQw+kxAgQ6lsChEbKjAstW
 BS/3Mhcj3XGWq5FAHLOprDLPwqHs5ezpKKr86tTk6KPBOh+j1NzOeLb1W
 cRx0siMreqwEYHKMW7VzvFwrbxh8vqmGKZ4zzy19MBpgjoT46kywV77q9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359423401"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="359423401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:24:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670525503"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670525503"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:24:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 17 Feb 2023 14:24:23 +0200
Message-ID: <87v8k0xyx4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Fixes for drm-next and the upcoming merge window.

drm-intel-next-fixes-2023-02-17:
drm/i915 fixes for the v6.3 merge window:
- Fix eDP+DSI dual panel systems
- Fix system suspend when fbdev isn't initialized
- Fix memory leaks in scatterlist
- Fix some MCR register annotations
- Fix documentation build warnings

BR,
Jani.

The following changes since commit 48075a66fca613477ac1969b576a93ef5db0164f:

  Merge branch 'etnaviv/next' of https://git.pengutronix.de/git/lst/linux i=
nto drm-next (2023-02-09 16:16:44 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
3-02-17

for you to fetch changes up to 8038510b1fe443ffbc0e356db5f47cbb8678a594:

  drm/i915: Fix system suspend without fbdev being initialized (2023-02-15 =
17:33:07 +0200)

----------------------------------------------------------------
drm/i915 fixes for the v6.3 merge window:
- Fix eDP+DSI dual panel systems
- Fix system suspend when fbdev isn't initialized
- Fix memory leaks in scatterlist
- Fix some MCR register annotations
- Fix documentation build warnings

----------------------------------------------------------------
Bagas Sanjaya (1):
      drm/i915/doc: Escape wildcard in method names

Imre Deak (1):
      drm/i915: Fix system suspend without fbdev being initialized

Jani Nikula (1):
      drm/i915/bios: set default backlight controller index

Lucas De Marchi (1):
      drm/i915: Fix GEN8_MISCCPCTL

Matt Atwood (1):
      drm/i915: Fix memory leaks in scatterlist

Matt Roper (1):
      drm/i915/pvc: Annotate two more workaround/tuning registers as MCR

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Fix VBT DSI DVO port handling
      drm/i915: Populate encoder->devdata for DSI on icl+
      drm/i915: Pick the backlight controller based on VBT on ICP+

 drivers/gpu/drm/i915/display/icl_dsi.c         |  3 +-
 drivers/gpu/drm/i915/display/intel_backlight.c | 34 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_bios.c      | 49 +++++++++++++++++++---=
----
 drivers/gpu/drm/i915/display/intel_fbdev.c     |  8 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h        |  9 ++---
 drivers/gpu/drm/i915/gt/intel_workarounds.c    | 24 ++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c      |  5 ++-
 drivers/gpu/drm/i915/i915_scatterlist.c        |  8 +++--
 drivers/gpu/drm/i915/intel_pm.c                | 10 +++---
 9 files changed, 107 insertions(+), 43 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
