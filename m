Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30F2A84DE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 18:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF16E044;
	Thu,  5 Nov 2020 17:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2816E044;
 Thu,  5 Nov 2020 17:29:05 +0000 (UTC)
IronPort-SDR: qhdRp0V8Ap6CvUCoLQrGGBaysMTV9balK6IvvLA72tjIoHSfr2fxkTGMPrD8Sf1WWU1RWi/5j8
 8vL6w0hXR3Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="168644492"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="168644492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 09:29:05 -0800
IronPort-SDR: LufDWyrTC2UGWHsRoSYt5zO5A+F4nwDOopTQxrfioWRwT3ilOZ8LYnPrqNUI0CqgRZw76caLxY
 YxDKIDOzTVCQ==
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; d="scan'208";a="306925694"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 09:29:05 -0800
Date: Thu, 5 Nov 2020 12:30:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20201105173026.GA858446@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

This includes gvt-fixes that had come last week, now with clean tags
for dim.

Also, 306bb61d6bb3 ("drm/i915/gt: Expose more parameters for emitting writes into the ring") is only a dependency of its following patch.

In summary:

drm-intel-fixes-2020-11-05:
- GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
- Fix set domain's cache coherency (Chris)
- Fixes around breadcrumbs (Chris)
- Fix encoder lookup during PSR atomic (Imre)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)

Thanks,
Rodrigo.

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-05

for you to fetch changes up to 537457a979a02a410b555fab289dcb28b588f33b:

  drm/i915: Hold onto an explicit ref to i915_vma_work.pinned (2020-11-03 19:22:42 -0500)

----------------------------------------------------------------
- GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
- Fix set domain's cache coherency (Chris)
- Fixes around breadcrumbs (Chris)
- Fix encoder lookup during PSR atomic (Imre)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915/gem: Flush coherency domains on first set-domain-ioctl
      drm/i915/gt: Use the local HWSP offset during submission
      drm/i915/gt: Expose more parameters for emitting writes into the ring
      drm/i915/gt: Flush xcs before tgl breadcrumbs
      drm/i915: Hold onto an explicit ref to i915_vma_work.pinned

Colin Xu (4):
      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
      drm/i915/gvt: Only pin/unpin intel_context along with workload
      drm/i915/gvt: Fix mmio handler break on BXT/APL.

Imre Deak (1):
      drm/i915: Fix encoder lookup during PSR atomic check

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2020-10-30' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zhenyu Wang (1):
      Merge tag 'drm-intel-fixes-2020-10-29' into gvt-fixes

 drivers/gpu/drm/i915/display/intel_psr.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c     | 28 ++++++-------
 drivers/gpu/drm/i915/gt/intel_engine.h         | 55 ++++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_lrc.c            | 31 ++++++++++-----
 drivers/gpu/drm/i915/gt/intel_timeline.c       | 18 +++++----
 drivers/gpu/drm/i915/gt/intel_timeline_types.h |  2 +
 drivers/gpu/drm/i915/gvt/handlers.c            | 47 ++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/scheduler.c           | 15 +++----
 drivers/gpu/drm/i915/i915_vma.c                |  6 ++-
 9 files changed, 139 insertions(+), 65 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
