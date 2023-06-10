Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929672A9F6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 09:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4E110E181;
	Sat, 10 Jun 2023 07:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825C10E17F;
 Sat, 10 Jun 2023 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686382801; x=1717918801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNYI3/ZjVbLV6RkAi0pCoPJjIphIboYzwRjWVM0MRnU=;
 b=al9yQ2ZPXLvZHJ9F7unn5VKnmcMN1bFzoQPEyKtaT72Ms9adpOY+ybbZ
 ENTH8+WkKAR4CfgJxVRgdaHSDdNxhj4MTiQ9UkMlkPyj6nhC5nI7/OhkP
 lQI80OrfpUGZPSdlt3j593D8vcoG2kIJNzO1lMNeCpm3gHsZrWBQeBcAn
 Trf2VHIYTpfoDTWJPVoy4QGCyQoPiLuUbsWvlHLrugitlsOH98ZHNAAWa
 1GK4QGLGI/h5/MRyiGvzczUPtgSNtH/W5ggEQNw2iuI/qdNjX99dyeAjx
 nlM09inM6HADxBMdfwb4ofsNabueVNH/4FGTQr+ekHMcaYql1ju4G5gZb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342420539"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; d="scan'208";a="342420539"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884834031"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; d="scan'208";a="884834031"
Received: from mnovakov-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.60.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:39:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next #2 for v6.5
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Sat, 10 Jun 2023 10:39:45 +0300
Message-ID: <87o7lnpxz2.fsf@intel.com>
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
 dim-tools@lists.freedesktop.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

This is the last drm-intel-next feature pull for v6.5. Fairly small, as
the previous one was this week too.

I guess the highlight is the removal of the last flush_scheduled_work()
user in kernel, so Tetsuo can proceed to remove it altogether once this
lands upstream.

BR,
Jani.


drm-intel-next-2023-06-10:
drm/i915 feature pull #2 for v6.5:

Features and functionality:
- Meteorlake PM demand (Vinod, Mika)
- Switch to dedicated workqueues to stop using flush_scheduled_work() (Luca)

Refactoring and cleanups:
- Move display runtime init under display/ (Matt)
- Async flip error message clarifications (Arun)

Fixes:
- Remove 10bit gamma on desktop gen3 parts, they don't support it (Ville)
- Fix driver probe error handling if driver creation fails (Matt)
- Fix all -Wunused-but-set-variable warnings, and enable it for i915 (Jani)
- Stop using edid_blob_ptr (Jani)
- Fix log level for "CDS interlane align done" (Khaled)
- Fix an unnecessary include prefix (Matt)

Merges:
- Backmerge drm-next to sync with drm-intel-gt-next (Jani)

BR,
Jani.

The following changes since commit ba57b9b11f78530146f02b776854b2b6b6d344a4:

  Merge tag 'drm-intel-gt-next-2023-06-08' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2023-06-09 16:43:36 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-06-10

for you to fetch changes up to 69f06e4fa098420e94f6970332e84f0ed493271c:

  Merge drm/drm-next into drm-intel-next (2023-06-10 10:04:00 +0300)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.5:

Features and functionality:
- Meteorlake PM demand (Vinod, Mika)
- Switch to dedicated workqueues to stop using flush_scheduled_work() (Luca)

Refactoring and cleanups:
- Move display runtime init under display/ (Matt)
- Async flip error message clarifications (Arun)

Fixes:
- Remove 10bit gamma on desktop gen3 parts, they don't support it (Ville)
- Fix driver probe error handling if driver creation fails (Matt)
- Fix all -Wunused-but-set-variable warnings, and enable it for i915 (Jani)
- Stop using edid_blob_ptr (Jani)
- Fix log level for "CDS interlane align done" (Khaled)
- Fix an unnecessary include prefix (Matt)

Merges:
- Backmerge drm-next to sync with drm-intel-gt-next (Jani)

----------------------------------------------------------------
Arun R Murthy (1):
      drm/i915/display: Print useful information on error

Jani Nikula (16):
      drm/i915/debugfs: stop using edid_blob_ptr
      drm/i915/plane: warn on non-zero plane offset
      drm/i915/ddi: drop unused but set variable intel_dp
      drm/i915/dsi: drop unused but set variable data
      drm/i915/dsi: drop unused but set variable vbp
      drm/i915/dpll: drop unused but set variables bestn and bestm1
      drm/i915/fb: drop unused but set variable cpp
      drm/i915/irq: drop unused but set variable tmp
      drm/i915/gt/uc: drop unused but set variable sseu
      drm/i915/gem: drop unused but set variable unpinned
      drm/i915/gem: annotate maybe unused but set variable c
      drm/i915/selftest: annotate maybe unused but set variable unused
      drm/i915: annotate maybe unused but set intel_plane_state variables
      drm/i915: annotate maybe unused but set intel_crtc_state variables
      drm/i915: re-enable -Wunused-but-set-variable
      Merge drm/drm-next into drm-intel-next

Khaled Almahallawy (1):
      drm/i915/dp: Fix log level for "CDS interlane align done"

Luca Coelho (3):
      drm/i915: use pointer to i915 instead of rpm in wakeref
      drm/i915: add a dedicated workqueue inside drm_i915_private
      drm/i915/selftests: add local workqueue for SW fence selftest

Matt Roper (3):
      drm/i915/display: Extract display init from intel_device_info_runtime=
_init
      drm/i915: Fix error handling if driver creation fails during probe
      drm/i915/display: Include of display limits doesn't need 'display/'

Mika Kahola (1):
      drm/i915/mtl: Add support for PM DEMAND

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: No 10bit gamma on desktop gen3 parts

Vinod Govindapillai (6):
      drm/i915: fix the derating percentage for MTL
      drm/i915: update the QGV point frequency calculations
      drm/i915: store the peak bw per QGV point
      drm/i915: extract intel_bw_check_qgv_points()
      drm/i915: modify max_bw to return index to intel_bw_info
      drm/i915/mtl: find the best QGV point for the SAGV configuration

Zhi Wang (1):
      drm/i915/gvt: remove unused variable gma_bottom in command parser

 drivers/gpu/drm/i915/Makefile                      |   3 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   3 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            | 345 ++++++++----
 drivers/gpu/drm/i915/display/intel_bw.h            |   6 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   4 -
 drivers/gpu/drm/i915/display/intel_display.c       |  39 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  11 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 143 ++++-
 .../gpu/drm/i915/display/intel_display_device.h    |   3 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   9 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  27 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  14 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   3 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  |  12 +
 drivers/gpu/drm/i915/display/intel_global_state.h  |   2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  23 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  18 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  32 ++
 drivers/gpu/drm/i915/display/intel_opregion.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      | 620 +++++++++++++++++=
++++
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |  67 +++
 drivers/gpu/drm/i915/display/intel_pps.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   8 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   1 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   4 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |  10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  20 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   2 -
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   6 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  17 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  10 +
 drivers/gpu/drm/i915/i915_reg.h                    |  26 +-
 drivers/gpu/drm/i915/i915_request.c                |   2 +-
 drivers/gpu/drm/i915/intel_device_info.c           | 148 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   2 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  22 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |  12 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   2 +-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c     |  16 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   7 +
 60 files changed, 1397 insertions(+), 389 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pmdemand.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pmdemand.h

--=20
Jani Nikula, Intel Open Source Graphics Center
