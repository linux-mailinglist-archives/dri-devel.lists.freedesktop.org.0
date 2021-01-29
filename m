Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F8309049
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 23:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEDB6EC4A;
	Fri, 29 Jan 2021 22:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22436EC4A;
 Fri, 29 Jan 2021 22:53:31 +0000 (UTC)
IronPort-SDR: bmdP3U8tpyQDh4QkymMEnCIIOxSp5pN4WNi47G0SORApPwluTuBSgY4BEBn9+Cs0N73d6bW+79
 qW47ANyShCTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="177931811"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="177931811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 14:53:31 -0800
IronPort-SDR: sQFfmvVZ2YLwD9n/YznvPRFA/qK4m9lUfJoAouXb4dVaNoq5OrO3C5g9K4zBKIEjSMr9cAjSYx
 l7AuWiJwWFcg==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="389491949"
Received: from amendonc-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.97.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 14:53:28 -0800
Date: Fri, 29 Jan 2021 17:53:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20210129225328.GA1041349@intel.com>
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

On my last pull request I incorrectly stated that
Async flips were enabled for all ilk+ platforms, while it
was only on SKL. I'm sorry about that.

I hope there's still time to include a few changes including
the actual patches that make this statement true for 5.12.

Along with other fixes and clean-up as described below:

Here goes drm-intel-next-2021-01-29:
- WARN if plane src coords are too big (Ville)
- Prevent double YUV range correction on HDR planes (Andres)
- DP MST related Fixes (Sean, Imre)
- More clean-up around DRAM detection code (Jose)
- Actually async flips enable for all ilk+ platforms (Ville)

Sorry and Thanks,
Rodrigo.

The following changes since commit 784953a46589276b38d7e6dcb5ebf7e29db72ff1:

  drm/i915/display/vrr: Skip the VRR HW state readout on DSI transcoder (20=
21-01-26 16:34:53 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-01-29

for you to fetch changes up to 3b7bbb3619d2cc92f04ba10ad27d3b616aabf175:

  drm/i915/dp: Prevent setting the LTTPR LT mode if no LTTPRs are detected =
(2021-01-29 22:00:07 +0200)

----------------------------------------------------------------
- WARN if plane src coords are too big (Ville)
- Prevent double YUV range correction on HDR planes (Andres)
- DP MST related Fixes (Sean, Imre)
- More clean-up around DRAM detection code (Jose)
- Actually async flips enable for all ilk+ platforms (Ville)

----------------------------------------------------------------
Andres Calderon Jaramillo (1):
      drm/i915/display: Prevent double YUV range correction on HDR planes

Imre Deak (3):
      drm/dp/mst: Export drm_dp_get_vc_payload_bw()
      drm/i915: Fix the MST PBN divider calculation
      drm/i915/dp: Prevent setting the LTTPR LT mode if no LTTPRs are detec=
ted

Jos=E9 Roberto de Souza (3):
      drm/i915: Nuke not needed members of dram_info
      drm/i915/gen11+: Only load DRAM information from pcode
      drm/i915: Rename is_16gb_dimm to wm_lv_0_adjust_needed

Sean Paul (1):
      drm/i915/hdcp: Disable the QSES check for HDCP 1.4 over MST

Ville Syrj=E4l=E4 (6):
      drm/i915: WARN if plane src coords are too big
      drm/i915: Limit plane stride to below TILEOFF.x limit
      drm/i915: Implement async flips for bdw
      drm/i915: Implement async flip for ivb/hsw
      drm/i915: Implement async flip for ilk/snb
      drm/i915: Implement async flips for vlv/chv

 drivers/gpu/drm/drm_dp_mst_topology.c              |  24 ++-
 drivers/gpu/drm/i915/display/i9xx_plane.c          | 213 +++++++++++++++++=
+++-
 drivers/gpu/drm/i915/display/i9xx_plane.h          |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  80 +-------
 drivers/gpu/drm/i915/display/intel_display.c       |  16 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  12 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  36 ++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  98 ++++------
 drivers/gpu/drm/i915/i915_drv.c                    |   9 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   6 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  39 ++--
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +
 drivers/gpu/drm/i915/intel_dram.c                  | 136 +++++++++----
 drivers/gpu/drm/i915/intel_pm.c                    |   2 +-
 include/drm/drm_dp_mst_helper.h                    |   1 +
 16 files changed, 434 insertions(+), 247 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
