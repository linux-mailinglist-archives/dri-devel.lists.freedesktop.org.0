Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB72F37A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 18:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BCD89C96;
	Tue, 12 Jan 2021 17:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3E589C48;
 Tue, 12 Jan 2021 17:51:56 +0000 (UTC)
IronPort-SDR: XbxYJ02w+m44SOK6xd4htH0OQNqIn+RQ9eFCD0valeWcCW64nLkc/sPAX+M7E9AMJiXmZVfQ6j
 OanNQklwWPyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="174573677"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="174573677"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:51:56 -0800
IronPort-SDR: RJkzVKGTBXwSk8oFuJzvz0ogJPL8wRI/HDp+7Yl3EOub2WsSuMJyB0itSTM4kdplOzMWBCMfZo
 pV06r24VuoFQ==
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="569165583"
Received: from jdcole-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.105.166])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:51:53 -0800
Date: Tue, 12 Jan 2021 12:51:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20210112175151.GA90999@intel.com>
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

A very short collection of patches, mostly with display fixes. Plus GVT.
The goal is to get both drm-intel-next and drm-intel-gt-next in sync again
through drm-next backports so we can continue with ADL enabling in a topic
branch.

Please be aware that there's a drm only patch here:
commit 7d8ac172d7f1 ("drm: Add function to convert rect in 16.16 fixed form=
at to regular format")

Here goes drm-intel-next-2021-01-12:
- PSR fixes and improvements for selective fetch (Jose)
- GVT build fixed and cleanup (Jani)
- RKL display fixes (Lee, Matt)
- DSI fix (Hans)
- Panel Power and Backlight fixes (Anshuman, Jani)
- RPM fix (Chris)
- Fix HTI port checking (Jose)
- Clean-up in cursor code (Ville)
- Once again, trying to use fast+narrow link on eDP (Ville)
- DG1 display fix (Matt)

Thanks,
Rodrigo.

The following changes since commit cb3cfbf79aff7decb4e5ee69a7c74864497f61dc:

  Merge tag 'drm-misc-next-2021-01-06' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2021-01-07 13:40:20 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-01-12

for you to fetch changes up to cce73665eae238791f4342b29ca54188227717c8:

  drm/i915/dg1: Update voltage swing tables for DP (2021-01-11 19:20:18 -08=
00)

----------------------------------------------------------------
- PSR fixes and improvements for selective fetch (Jose)
- GVT build fixed and cleanup (Jani)
- RKL display fixes (Lee, Matt)
- DSI fix (Hans)
- Panel Power and Backlight fixes (Anshuman, Jani)
- RPM fix (Chris)
- Fix HTI port checking (Jose)
- Clean-up in cursor code (Ville)
- Once again, trying to use fast+narrow link on eDP (Ville)
- DG1 display fix (Matt)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/pps: Reuse POWER_DOMAIN_DISPLAY_CORE in pps_{lock, unlock}

Chris Wilson (1):
      drm/i915: Disable RPM wakeref assertions during driver shutdown

Hans de Goede (1):
      drm/i915/dsi: Use unconditional msleep for the panel_on_delay when th=
ere is no reset-deassert MIPI-sequence

Jani Nikula (10):
      drm/i915/gvt: avoid useless use of inline
      drm/i915/gvt: make execlist.h self-contained
      drm/i915/gvt: make fb_decoder.h self-contained
      drm/i915/gvt: make gtt.h self-contained
      drm/i915/gvt: make interrupt.h self-contained
      drm/i915/gvt: make mmio_context.h self-contained
      drm/i915/gvt: make gvt.h self-contained
      drm/i915/gvt: make scheduler.h self-contained
      drm/i915/gvt: make mpt.h self-contained
      drm/i915/backlight: fix CPU mode backlight takeover on LPT

Jos=E9 Roberto de Souza (5):
      drm: Add function to convert rect in 16.16 fixed format to regular fo=
rmat
      drm/i915/display/psr: Use plane damage clips to calculate damaged area
      drm/i915/display: Split and export main surface calculation from skl_=
check_main_surface()
      drm/i915/display/psr: Program plane's calculated offset to plane SF r=
egister
      drm/i915: Fix HTI port checking

Lee Shawn C (1):
      drm/i915/rkl: new rkl ddc map for different PCH

Matt Roper (2):
      drm/i915/rkl: Add DP vswing programming tables
      drm/i915/dg1: Update voltage swing tables for DP

Rodrigo Vivi (2):
      Merge tag 'gvt-next-fixes-2020-12-25' of https://github.com/intel/gvt=
-linux into drm-intel-next
      Merge drm/drm-next into drm-intel-next

Ville Syrj=E4l=E4 (2):
      drm/i915: Fix checkpatch warns in cursor code
      drm/i915: Try to use fast+narrow link on eDP again and fall back to t=
he old max strategy on failure

 drivers/gpu/drm/i915/Makefile                      |  10 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  10 ++
 drivers/gpu/drm/i915/display/intel_cursor.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  79 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.c       |  78 ++++++++-----
 drivers/gpu/drm/i915/display/intel_display.h       |   2 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  83 +++++++++++---
 drivers/gpu/drm/i915/display/intel_panel.c         |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 127 +++++++++++++++++=
+---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   2 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  16 ++-
 drivers/gpu/drm/i915/gvt/execlist.h                |   3 -
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |   6 +-
 drivers/gpu/drm/i915/gvt/gtt.h                     |  11 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |   4 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   3 +-
 drivers/gpu/drm/i915/gvt/interrupt.h               |   5 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |  11 ++
 drivers/gpu/drm/i915/gvt/mpt.h                     |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.h               |   5 +
 drivers/gpu/drm/i915/i915_drv.c                    |   4 +
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +-
 include/drm/drm_rect.h                             |  13 +++
 24 files changed, 396 insertions(+), 97 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
