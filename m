Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EDB532BCD
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 15:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289B010FB5F;
	Tue, 24 May 2022 13:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A900F10FAB6;
 Tue, 24 May 2022 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653400772; x=1684936772;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DWP4K8RM2mu8DZwjHl/7wCvLiLDftHm3FY6MfNKdy2g=;
 b=Yhf7enozxOEfsDgQYCRjwYZQAblkYGV/hVGUDDKZcdJM2ijxSp+CBmIi
 H8hU9zLcy9p7Iu26knJDN9+7FVocLTASMjJp+Va/YfnJ4hMLriq3PmAfD
 E6n/+W8Dqc3Ug9pxqWsucAvqM8lydlRmUYPZbtSqlm2MoU9Ih5hF0CYYN
 4d/yLev8G5MJILxuXshQ+AVLExrJzQZrl43TEEa1g8oUPMhg16kH6m/hE
 9w/dok9NdCSb7ff5Wzf+rZgXo6tMAWDvUK+vgzttuDgLLo+RdIlMDuBXZ
 slQbXtZG9lgWarL8Cf4WHXEkrjrNKjLuMTIPqdcXl+dHxIIM6PVnZUxRJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="334182471"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="334182471"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:59:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="572668421"
Received: from bdunajsk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.147.125])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:59:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 24 May 2022 16:59:23 +0300
Message-ID: <87sfozuj44.fsf@intel.com>
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

Some i915 fixes for v5.19 merge window.

drm-intel-next-fixes-2022-05-24:
drm/i915 fixes for v5.19 merge window:
- Build, sparse, UB, and CFI fixes
- Variable scope fix
- Audio pipe logging fix
- ICL+ DSI NULL dereference fix

BR,
Jani.

The following changes since commit f83493f7d34da258310ecd3d07f0cc78f884c954:

  Merge tag 'drm-msm-next-2022-05-09' of https://gitlab.freedesktop.org/drm/msm into drm-next (2022-05-11 12:40:47 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-05-24

for you to fetch changes up to 0ea917819d12fed41ea4662cc26ffa0060a5c354:

  drm/i915/dsi: fix VBT send packet port selection for ICL+ (2022-05-23 12:08:58 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.19 merge window:
- Build, sparse, UB, and CFI fixes
- Variable scope fix
- Audio pipe logging fix
- ICL+ DSI NULL dereference fix

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Fix use of static in macro mismatch

Borislav Petkov (1):
      drm/i915/uc: Fix undefined behavior due to shift overflowing the constant

Imre Deak (1):
      drm/i915: Fix 'mixing different enum types' warnings in intel_display_power.c

Jani Nikula (3):
      drm/i915/audio: fix audio code enable/disable pipe logging
      drm/i915/reg: fix undefined behavior due to shift overflowing the constant
      drm/i915/dsi: fix VBT send packet port selection for ICL+

Nathan Chancellor (1):
      drm/i915: Fix CFI violation with show_dynamic_id()

YueHaibing (1):
      drm/i915/gt: Fix build error without CONFIG_PM

 drivers/gpu/drm/i915/display/intel_audio.c         |  4 +--
 drivers/gpu/drm/i915/display/intel_display_power.c |  8 +++---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       | 33 ++++++++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        | 23 +++++++--------
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  2 +-
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |  2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |  2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  4 +--
 drivers/gpu/drm/i915/i915_perf_types.h             |  2 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 32 ++++++++++-----------
 11 files changed, 63 insertions(+), 51 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
