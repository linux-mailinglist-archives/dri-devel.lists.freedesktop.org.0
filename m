Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6222F5F50
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 11:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB789208;
	Thu, 14 Jan 2021 10:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B15A891EC;
 Thu, 14 Jan 2021 10:55:03 +0000 (UTC)
IronPort-SDR: e9mtSoTYEmeajIM5pM+VeM9sJ/Qo9RroTPO896M5IcLJOG7bDaDtpQzdiyQRGqzsFg/V93P9iD
 qBASdbfwdzsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="196997142"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="196997142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 02:55:00 -0800
IronPort-SDR: 5NS0vfQB0197Xd+J0LCoQhDUHrAQbMSjeqMN8WENRipU7pApqTkW+T799tTWiIo8G7tXXHQdKy
 ZeDm1TWrXKFg==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="424911372"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 02:54:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 14 Jan 2021 12:54:53 +0200
Message-ID: <87sg73pz42.fsf@intel.com>
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

drm-intel-fixes-2021-01-14:
drm/i915 fixes for v5.11-rc4:
- Allow the sysadmin to override security mitigations
- Restore clear-residual mitigations for ivb/byt
- Limit VFE threads based on GT
- GVT: fix vfio edid and full display detection
- Fix DSI DSC power refcounting
- Fix LPT CPU mode backlight takeover
- Disable RPM wakeref assertions during driver shutdown
- Fix DSI sequence sleeps

BR,
Jani.

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-01-14

for you to fetch changes up to 984cadea032b103c5824a5f29d0a36b3e9df6333:

  drm/i915: Allow the sysadmin to override security mitigations (2021-01-12 19:03:40 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.11-rc4:
- Allow the sysadmin to override security mitigations
- Restore clear-residual mitigations for ivb/byt
- Limit VFE threads based on GT
- GVT: fix vfio edid and full display detection
- Fix DSI DSC power refcounting
- Fix LPT CPU mode backlight takeover
- Disable RPM wakeref assertions during driver shutdown
- Fix DSI sequence sleeps

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915: Disable RPM wakeref assertions during driver shutdown
      drm/i915/gt: Limit VFE threads based on GT
      drm/i915/gt: Restore clear-residual mitigations for Ivybridge, Baytrail
      drm/i915: Allow the sysadmin to override security mitigations

Colin Xu (1):
      drm/i915/gvt: Fix vfio_edid issue for BXT/APL

Hans de Goede (1):
      drm/i915/dsi: Use unconditional msleep for the panel_on_delay when there is no reset-deassert MIPI-sequence

Imre Deak (1):
      drm/i915/icl: Fix initing the DSI DSC power refcount during HW readout

Jani Nikula (2):
      drm/i915/backlight: fix CPU mode backlight takeover on LPT
      Merge tag 'gvt-fixes-2020-01-08' of https://github.com/intel/gvt-linux into drm-intel-fixes

 drivers/gpu/drm/i915/Makefile                   |   1 +
 drivers/gpu/drm/i915/display/icl_dsi.c          |   4 -
 drivers/gpu/drm/i915/display/intel_panel.c      |   9 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c          |  16 ++-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c      | 157 ++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |   6 +-
 drivers/gpu/drm/i915/gvt/display.c              |  81 ++++++++----
 drivers/gpu/drm/i915/gvt/vgpu.c                 |   5 +-
 drivers/gpu/drm/i915/i915_drv.c                 |   4 +
 drivers/gpu/drm/i915/i915_mitigations.c         | 146 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_mitigations.h         |  13 ++
 11 files changed, 339 insertions(+), 103 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_mitigations.c
 create mode 100644 drivers/gpu/drm/i915/i915_mitigations.h

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
