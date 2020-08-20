Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFE24B233
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 11:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125916E92C;
	Thu, 20 Aug 2020 09:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6794E6E92D;
 Thu, 20 Aug 2020 09:25:35 +0000 (UTC)
IronPort-SDR: BWmeXACircjc8vMl4zkSOdDHHr4RPvJlZbGhKYK/Xm/BlYOOepJlUMlSFr9zvwWOUe068MnZCq
 e2dzWr6IxwHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="156331747"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="156331747"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 02:25:34 -0700
IronPort-SDR: d0JeQtZs4BGW2Gkjx4jD3dQQPVJPCV9U3qL1UWVCgPwU8rGJLT2JLI2rzEahMd22R/FLyhVoYR
 v6QKfXT2Ps7w==
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="472579789"
Received: from mkrishn3-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.32.35])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 02:25:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 20 Aug 2020 12:25:28 +0300
Message-ID: <87a6yp7jp3.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

This is a fairly ordinary looking set of i915 fixes for v5.9-rc2.

Of course, the out of the ordinary is what's *not* here. This replaces
the earlier pull request [1]. The dinq branch has since been split and
rebased, with a new topic/drm-intel-gem-next. The fixes in this pull
request come from dinq as usual. The topic branch is, alas, still in a
bit of a flux, and contains some of the commits you rejected in [1], so
I'm not including any of the fixes from there.

I'm aware of the reported regression [2], and to me it looks like the
reverts would be the right course of action. However, I don't want to
postpone this pull request any longer. Hopefully we'll have it sorted by
next week.


[1] http://lore.kernel.org/r/20200730162652.GA90813@jlahtine-desk.ger.corp.intel.com
[2] http://lore.kernel.org/r/20200817161132.GA4711@amd



drm-intel-fixes-2020-08-20:
drm/i915 fixes for v5.9-rc2:
- GVT fixes
- Fix device parameter usage for selftest mock i915 device
- Fix LPSP capability debugfs NULL dereference
- Fix buddy register pagemask table
- Fix intel_atomic_check() non-negative return value
- Fix selftests passing a random 0 into ilog2()
- Fix TGL power well enable/disable ordering
- Switch to PMU module refcounting

BR,
Jani.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-08-20

for you to fetch changes up to 4a4064ad79699ee41b74c12fa4f9f960a5bf9b2d:

  drm/i915/tgl: Make sure TC-cold is blocked before enabling TC AUX power wells (2020-08-19 15:23:43 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.9-rc2:
- GVT fixes
- Fix device parameter usage for selftest mock i915 device
- Fix LPSP capability debugfs NULL dereference
- Fix buddy register pagemask table
- Fix intel_atomic_check() non-negative return value
- Fix selftests passing a random 0 into ilog2()
- Fix TGL power well enable/disable ordering
- Switch to PMU module refcounting

----------------------------------------------------------------
Chris Wilson (3):
      drm/i915: Provide the perf pmu.module
      drm/i915: Copy default modparams to mock i915_device
      drm/i915/display: Check for an LPSP encoder before dereferencing

Colin Xu (2):
      drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
      drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0

George Spelvin (1):
      drm/i915/selftests: Avoid passing a random 0 into ilog2

Imre Deak (1):
      drm/i915/tgl: Make sure TC-cold is blocked before enabling TC AUX power wells

Jani Nikula (1):
      Merge tag 'gvt-next-fixes-2020-08-05' of https://github.com/intel/gvt-linux into drm-intel-fixes

Matt Roper (1):
      drm/i915: Update bw_buddy pagemask table

Tianjia Zhang (1):
      drm/i915: Fix wrong return value in intel_atomic_check()

 drivers/gpu/drm/i915/display/intel_display.c       |  2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  7 +++++--
 drivers/gpu/drm/i915/display/intel_display_power.c | 14 ++++++-------
 drivers/gpu/drm/i915/gvt/cfg_space.c               | 24 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c                     |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.h                     |  2 ++
 drivers/gpu/drm/i915/gvt/gvt.h                     |  3 +++
 drivers/gpu/drm/i915/gvt/vgpu.c                    | 20 +++++++++++++++---
 drivers/gpu/drm/i915/i915_pmu.c                    |  7 ++-----
 drivers/gpu/drm/i915/selftests/i915_buddy.c        | 18 ++++++++--------
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  3 +++
 11 files changed, 75 insertions(+), 27 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
