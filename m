Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0D8084A8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DAB10E838;
	Thu,  7 Dec 2023 09:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10710E836;
 Thu,  7 Dec 2023 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701941330; x=1733477330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hsR2HbN+TYZ4DLIENWemu4QzEovr2xHVTwTXOtJ8qYU=;
 b=DGijXljT/sBYS5D29XNHYWJ9sOtGcjBwZgE8GMVJzuuo2EMid4uaHDQf
 uN5l4eJcYBzKd9TXZqjTun5b1b6NSKy5JYpkuSvZUo3E2y5yQ/dto3gLS
 b3YhhKhJgOXx+tbHjuI2ueNRxbcCwR8Nq73dkVVBFsku8MHCXfzCoEAKn
 KHOOYzK8YzbDcdCxIXLpEWC66GsqHpfn1TVgIQ+tgG+XbkBXsi/TJP9EH
 PhXocpM1Il1cWH6FgTQB0iZyRJNwnDZRvRW/H7qldpeTPzvPpG50OhGY6
 EFz379jj1LyppnawdedFF+n7vFAiK1I/7kjgqLe3XLzgybzbgCOdLzI7N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384607989"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="384607989"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800676746"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800676746"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:28:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 07 Dec 2023 11:28:43 +0200
Message-ID: <87msum1hv8.fsf@intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

Fixes for -rc5. This includes [1] from last week.

BR,
Jani.


[1] https://lore.kernel.org/r/87fs0m48ol.fsf@intel.com




drm-intel-fixes-2023-12-07:
drm/i915 fixes for v6.7-rc5:
- d21a3962d304 ("drm/i915: Call intel_pre_plane_updates() also for pipes
  getting enabled") in the previous fixes pull depends on a change that
  wasn't included. Pick it up.
- Relax BXT/GLK DSI transcoder hblank limits
- Fix DP MST .mode_valid_ctx() return values
- Reject DP MST modes that require bigjoiner (as it's not yet supported on =
DP MST)
- Fix _intel_dsb_commit() variable type to allow negative values

BR,
Jani.

The following changes since commit d21a3962d3042e6f56ad324cf18bdd64a1e6ecfa:

  drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled (=
2023-11-29 10:23:25 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-12-=
07

for you to fetch changes up to 9f269070abe9c45dc60abc84e29326f855317eac:

  drm/i915: correct the input parameter on _intel_dsb_commit() (2023-12-05 =
10:43:07 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc5:
- d21a3962d304 ("drm/i915: Call intel_pre_plane_updates() also for pipes
  getting enabled") in the previous fixes pull depends on a change that
  wasn't included. Pick it up.
- Relax BXT/GLK DSI transcoder hblank limits
- Fix DP MST .mode_valid_ctx() return values
- Reject DP MST modes that require bigjoiner (as it's not yet supported on =
DP MST)
- Fix _intel_dsb_commit() variable type to allow negative values

----------------------------------------------------------------
Ville Syrj=C3=A4l=C3=A4 (4):
      drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling=
}()
      drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
      drm/i915/mst: Fix .mode_valid_ctx() return values
      drm/i915/mst: Reject modes that require the bigjoiner

heminhong (1):
      drm/i915: correct the input parameter on _intel_dsb_commit()

 drivers/gpu/drm/i915/display/icl_dsi.c       |  7 +++++++
 drivers/gpu/drm/i915/display/intel_crt.c     |  5 +++++
 drivers/gpu/drm/i915/display/intel_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c      |  4 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dsb.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c     |  6 ++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 ++++
 drivers/gpu/drm/i915/display/intel_lvds.c    |  5 +++++
 drivers/gpu/drm/i915/display/intel_sdvo.c    |  8 +++++++-
 drivers/gpu/drm/i915/display/intel_tv.c      |  8 +++++++-
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 18 +++++++++++++++++-
 13 files changed, 104 insertions(+), 8 deletions(-)

--=20
Jani Nikula, Intel
