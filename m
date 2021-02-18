Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B731F278
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 23:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D776E89C;
	Thu, 18 Feb 2021 22:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8836E89C;
 Thu, 18 Feb 2021 22:46:28 +0000 (UTC)
IronPort-SDR: WaU/KIcI5/uGECBYHPu8eZaEwM0A8piC5yTa+ePeinbTvFuvGWGF20/osY9BkL7NABCbuiClWs
 ajFpikkgZ93A==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="268522365"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="268522365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:46:27 -0800
IronPort-SDR: D/VqrzSx3R25NMONmjXpQtg25mwc1NjwV2iMeRa4lQwqGEIrD0vre6bsdxNXSFgJgbuOQS8qEz
 74DzGhFfuglQ==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="495785854"
Received: from arohrbax-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.140.4])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:46:26 -0800
Date: Thu, 18 Feb 2021 17:46:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YC7uQY1kt6w0tRp+@intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2021-02-18:

- Restrict DRM_I915_DEBUG to developer builds (Chris)
- Fix return and error codes (Dan)
- Suspend/Resume fix (Chris)
- Disable atomics in L3 for gen9 (Chris)
- Flush before changing register state (Chris)
- Fix for GLK's HDMI (Ville)
- Fix ILK+'s plane strides with Xtiling (Ville)
- Correct surface base address for renderclear (Chris)

Thanks,
Rodrigo.

The following changes since commit 4c3a3292730c56591472717d8c5c0faf74f6c6bb:

  drm/amd/display: fix unused variable warning (2021-02-05 09:49:44 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
1-02-18

for you to fetch changes up to 81ce8f04aa96f7f6cae05770f68b5d15be91f5a2:

  drm/i915/gt: Correct surface base address for renderclear (2021-02-17 06:=
19:04 -0500)

----------------------------------------------------------------
- Restrict DRM_I915_DEBUG to developer builds (Chris)
- Fix return and error codes (Dan)
- Suspend/Resume fix (Chris)
- Disable atomics in L3 for gen9 (Chris)
- Flush before changing register state (Chris)
- Fix for GLK's HDMI (Ville)
- Fix ILK+'s plane strides with Xtiling (Ville)
- Correct surface base address for renderclear (Chris)

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915: Restrict DRM_I915_DEBUG to developer builds
      drm/i915/gem: Move freeze/freeze_late next to suspend/suspend_late
      drm/i915: Disable atomics in L3 for gen9
      drm/i915/gt: Flush before changing register state
      drm/i915/gt: Correct surface base address for renderclear

Dan Carpenter (2):
      drm/i915/gvt: fix uninitialized return in intel_gvt_update_reg_whitel=
ist()
      drm/i915/gem: Fix oops in error handling code

Ville Syrj=E4l=E4 (2):
      drm/i915: Reject 446-480MHz HDMI clock on GLK
      drm/i915: Disallow plane x+w>stride on ilk+ with X-tiling

 drivers/gpu/drm/i915/Kconfig.debug           |  2 ++
 drivers/gpu/drm/i915/display/i9xx_plane.c    | 27 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++----
 drivers/gpu/drm/i915/display/intel_display.h |  6 ++++
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  6 +++-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c       | 41 ++++++++++++++++++++++++=
++++
 drivers/gpu/drm/i915/gem/i915_gem_pm.h       |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c   | 12 +++-----
 drivers/gpu/drm/i915/gt/gen7_renderclear.c   |  3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  8 ++++++
 drivers/gpu/drm/i915/gvt/cmd_parser.c        |  3 +-
 drivers/gpu/drm/i915/i915_drv.c              |  1 +
 drivers/gpu/drm/i915/i915_drv.h              |  2 --
 drivers/gpu/drm/i915/i915_gem.c              | 41 ------------------------=
----
 drivers/gpu/drm/i915/i915_reg.h              |  7 +++++
 drivers/gpu/drm/i915/selftests/i915_gem.c    |  1 +
 16 files changed, 115 insertions(+), 60 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
