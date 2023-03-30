Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8966D032F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7310EDDA;
	Thu, 30 Mar 2023 11:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0010EDD6;
 Thu, 30 Mar 2023 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680175836; x=1711711836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9C852zKIffDwA5pItVl/7+d0XEbihSnDZhWoKGzGhY8=;
 b=cfXNnlGTrEV0BrHC5BGxaj2gwpZs/+4tYOnzrMc+wsQzg1hT664k+ByI
 VM1IxdOK7QNZcOhamh+y9xbxakXJsX7/tiY3sa6jxN+E3Cme3XcdIZdZT
 IyX0Nu4c7CPjy1SYPxhbvgWqecqzWGYa2Tlsp8OHHF32qLsSuRxGli6LV
 Yn4G+Bc19EZxQLgchSdLa6E3uJy85WS/Ye+xlrJtp4P8ODLGC5AIZddIZ
 vfH6G/jLn1vVAIWTM0aI5LDsj2zbb7Q9aGRS/qqrnV0zZ6wgG5xT8RyFH
 j6gfJd7I6taU/a2Glz3HmoQd50iOAj3tpvTEVouM5YcLqK/qwtMkkW0xL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368920557"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="368920557"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014398526"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="1014398526"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:30:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 30 Mar 2023 14:30:29 +0300
Message-ID: <87355m4gtm.fsf@intel.com>
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

drm-intel-fixes-2023-03-30:
drm/i915 fixes for v6.3-rc5:
- Fix PMU support by reusing functions with sysfs
- Fix a number of issues related to color, PSR and arm/noarm
- Fix state check related to ICL PHY ownership check in TC-cold state
- Flush lmem contents after construction
- Fix hibernate oops related to DPT BO
- Fix perf stream error path wakeref balance

BR,
Jani.

The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa:

  Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-03-=
30

for you to fetch changes up to 5c95b2d5d44fa250ce8aeee27bdb39b381d03857:

  drm/i915/perf: Drop wakeref on GuC RC error (2023-03-27 13:22:24 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.3-rc5:
- Fix PMU support by reusing functions with sysfs
- Fix a number of issues related to color, PSR and arm/noarm
- Fix state check related to ICL PHY ownership check in TC-cold state
- Flush lmem contents after construction
- Fix hibernate oops related to DPT BO
- Fix perf stream error path wakeref balance

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915/pmu: Use functions common with sysfs to read actual freq

Chris Wilson (2):
      drm/i915/gem: Flush lmem contents after construction
      drm/i915/perf: Drop wakeref on GuC RC error

Imre Deak (1):
      drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state

Ville Syrj=C3=A4l=C3=A4 (6):
      drm/i915: Split icl_color_commit_noarm() from skl_color_commit_noarm()
      drm/i915: Move CSC load back into .color_commit_arm() when PSR is ena=
bled on skl/glk
      drm/i915: Add a .color_post_update() hook
      drm/i915: Workaround ICL CSC_MODE sticky arming
      drm/i915: Disable DC states for all commits
      drm/i915/dpt: Treat the DPT BO as a framebuffer

 drivers/gpu/drm/i915/display/intel_color.c       | 101 +++++++++++++++++++=
+++-
 drivers/gpu/drm/i915/display/intel_color.h       |   1 +
 drivers/gpu/drm/i915/display/intel_display.c     |  31 ++++++-
 drivers/gpu/drm/i915/display/intel_dpt.c         |   2 +
 drivers/gpu/drm/i915/display/intel_tc.c          |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |   3 +
 drivers/gpu/drm/i915/gt/intel_rps.c              |  38 +++++----
 drivers/gpu/drm/i915/gt/intel_rps.h              |   4 +-
 drivers/gpu/drm/i915/i915_perf.c                 |  14 ++--
 drivers/gpu/drm/i915/i915_perf_types.h           |   6 ++
 drivers/gpu/drm/i915/i915_pmu.c                  |  10 +--
 13 files changed, 177 insertions(+), 42 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
