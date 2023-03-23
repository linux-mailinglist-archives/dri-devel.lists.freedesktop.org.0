Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2006C658B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376D110EA67;
	Thu, 23 Mar 2023 10:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4DB10EA67;
 Thu, 23 Mar 2023 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679568408; x=1711104408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zqptxoHBj1y0QzJJ2dmSL14dLsiskN3gAsLDV0E9o0Q=;
 b=VquCJnMzWxfThKA74v1lj2hJl4unX7N8CG0oWANFZbMs9cKeOai8ZPLk
 ljCFT55cEL4rQXx4n9mPZSPEMgeAxlo1Lwgt/ydtiB3XIAJk3WvElmGfe
 16SMeHRa3m+GAsTpX53rh9lCCbh1GSIrfOtIiVhiPZvixt5Ztms6Hp1aw
 J6BiQ9V2SU8YvKXMoVVRaKTcPYVcO0xGkTEjmgpGYKvH6Xo5cgIDAUEu0
 Lwa+iUvOw0B0RGbKkQdXYxzbs4b5TiZNWg6TmmPun12XQsxQn4bvitKtn
 kzT8pG42mgZITytDWetgHzkZ9gaEp7mPsQHE0fKUCJJ5fMS9GNTtuuW+N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319841877"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="319841877"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 03:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682264634"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682264634"
Received: from rkiss-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.51])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:46:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 23 Mar 2023 12:46:27 +0200
Message-ID: <878rfn7njw.fsf@intel.com>
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

Otherwise a fairly regular fixes pull, except for two things:

First, I have not gotten CI results on this. I don't know what gives.

Second, I missed adding the hwmon revert to the tag. I accidentally
picked up the commit for the previous pull, and it shouldn't have been
there.


BR,
Jani.



drm-intel-fixes-2023-03-23:
drm/i915 fixes for v6.3-rc4:
- Fix an MTL workaround
- Fix fbdev obj locking before vma pin
- Fix state inheritance tracking in initial commit
- Fix missing GuC error capture codes
- Fix missing debug object activation
- Fix uc init late order relative to probe error injection
- Fix perf limit reasons formatting
- Fix vblank timestamp update on seamless M/N changes

BR,
Jani.

The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-03-=
23

for you to fetch changes up to 22aa20e4c5dcbe6fdc480eb4fb27039b1f43217f:

  Revert "drm/i915/hwmon: Enable PL1 power limit" (2023-03-20 12:31:01 +020=
0)

----------------------------------------------------------------
drm/i915 fixes for v6.3-rc4:
- Fix an MTL workaround
- Fix fbdev obj locking before vma pin
- Fix state inheritance tracking in initial commit
- Fix missing GuC error capture codes
- Fix missing debug object activation
- Fix uc init late order relative to probe error injection
- Fix perf limit reasons formatting
- Fix vblank timestamp update on seamless M/N changes

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/gt: perform uc late init after probe error injection

Ashutosh Dixit (1):
      Revert "drm/i915/hwmon: Enable PL1 power limit"

Badal Nilawar (1):
      drm/i915/mtl: Disable MC6 for MTL A step

John Harrison (1):
      drm/i915/guc: Fix missing ecodes

Nirmoy Das (1):
      drm/i915/active: Fix missing debug object activation

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix Wa_16015201720 implementation

Tejas Upadhyay (1):
      drm/i915/fbdev: lock the fbdev obj before vma pin

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Preserve crtc_state->inherited during state clearing
      drm/i915: Update vblank timestamping stuff on seamless M/N change

Vinay Belgaumkar (1):
      drm/i915: Fix format for perf_limit_reasons

 drivers/gpu/drm/i915/display/intel_crtc.c      |  8 ++++++++
 drivers/gpu/drm/i915/display/intel_display.c   |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c       | 26 ++++++++++++++++++++--=
---
 drivers/gpu/drm/i915/display/intel_fbdev.c     | 24 +++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt.c             |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c          | 27 ----------------------=
----
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c            |  8 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 22 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c      | 13 +------------
 drivers/gpu/drm/i915/i915_active.c             |  3 +--
 drivers/gpu/drm/i915/i915_hwmon.c              |  5 -----
 drivers/gpu/drm/i915/i915_reg.h                | 17 +++++-----------
 13 files changed, 88 insertions(+), 72 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
