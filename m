Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4C8114B4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC8310E7B0;
	Wed, 13 Dec 2023 14:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BB710E7A6;
 Wed, 13 Dec 2023 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702478096; x=1734014096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J0BqJq9CJ9TaC4soa04LF4xElaPUOtIWx1uYwbt70Y8=;
 b=HBBi/qaD7+KVb1W6kP9D8IGGqUy37FEvrLR2To5v/2fooEg3u+vbB3Bm
 rpNb6crqFmoO6msedZY5MSf1S5RjTLWCkrZVzlsaUMMuIEVnrvhycyIWk
 ZS4Mvreh0TRvGD5CoXHv8aoSE8G7eLoxD1+TBacrKTHtrqS+70YLolNCo
 dL2EvcNvMSbFdVepq4n6ZP92VIhquscU26i9L7bCKsBIUpP5x72d+hV1X
 0L8T3ZDDzM3+lNhIFy7GWHjiyX3MPsaXhwW7SjgLbY+Sx3RptRHTzr4tx
 H2sxDOTP5TZtG+12RNVH8GhIG8zPE4dyGZSBnbzkQVbNjHiNdmyUQt2U0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374478222"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="374478222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 06:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1021135845"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="1021135845"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.15])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 06:33:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 13 Dec 2023 16:33:55 +0200
Message-ID: <871qbqw4rw.fsf@intel.com>
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

Fixes for -rc6, majority of them stable material.

drm-intel-fixes-2023-12-13:
drm/i915 fixes for v6.7-rc6:
- Fix selftest engine reset count storage for multi-tile
- Fix out-of-bounds reads for engine reset counts
- Fix ADL+ remapped stride with CCS
- Fix intel_atomic_setup_scalers() plane_state handling
- Fix ADL+ tiled plane stride when the POT stride is smaller than the origi=
nal
- Fix eDP 1.4 rate select method link configuration

BR,
Jani.

The following changes since commit a39b6ac3781d46ba18193c9dbb2110f31e9bffe9:

  Linux 6.7-rc5 (2023-12-10 14:33:40 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-12-=
13

for you to fetch changes up to e6861d8264cd43c5eb20196e53df36fd71ec5698:

  drm/i915/edp: don't write to DP_LINK_BW_SET when using rate select (2023-=
12-11 13:15:35 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc6:
- Fix selftest engine reset count storage for multi-tile
- Fix out-of-bounds reads for engine reset counts
- Fix ADL+ remapped stride with CCS
- Fix intel_atomic_setup_scalers() plane_state handling
- Fix ADL+ tiled plane stride when the POT stride is smaller than the origi=
nal
- Fix eDP 1.4 rate select method link configuration

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/edp: don't write to DP_LINK_BW_SET when using rate select

Tvrtko Ursulin (2):
      drm/i915/selftests: Fix engine reset count storage for multi-tile
      drm/i915: Use internal class when counting engine resets

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Fix remapped stride with CCS on ADL+
      drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
      drm/i915: Fix ADL+ tiled plane stride when the POT stride is smaller =
than the original

 .../gpu/drm/i915/display/intel_dp_link_training.c  | 31 +++++++++++++++---=
----
 drivers/gpu/drm/i915/display/intel_fb.c            | 19 ++++++++++---
 drivers/gpu/drm/i915/display/skl_scaler.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  5 ++--
 drivers/gpu/drm/i915/i915_gpu_error.h              | 12 +++++++--
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |  9 ++++---
 drivers/gpu/drm/i915/selftests/igt_live_test.h     |  3 ++-
 8 files changed, 59 insertions(+), 24 deletions(-)

--=20
Jani Nikula, Intel
