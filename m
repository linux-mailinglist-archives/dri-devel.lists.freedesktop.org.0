Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA7A82523
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FC610E880;
	Wed,  9 Apr 2025 12:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGl65+hs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4872210E87F;
 Wed,  9 Apr 2025 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744202528; x=1775738528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcBEDxc3UFjM2IvAJWbkeGpycvYvSpWyy2nNS3glL60=;
 b=fGl65+hsb/FhlERdqinJ7GvPngegoAsKDfq/AyL5ZoqJupLw18k8g6hK
 Mva1BQFXmbYtp8S1+AEoMVisZaxRFrcnmW0dhkk8bonHEntl6JiZXROkd
 zOIgl4uYR88G2sFXk6wAIUS7fJO+oAZj1AgSpl6aVqcuZgaQy3n+zfrq0
 ranQODLBpSRKfJax9vCqOlB8JGAoA3vsWo4gFXF+NjC2M4/YARlknSqyQ
 sfcCzQRDpGqvNIp/9RbMBHs0HXDB30dfwGOZodFDwC3t/63MxworZK2SG
 nG0weLYkw+8lWn9WguwjjBRlmG5OYZdI7VDaGfaAozDDvKGvfkz3ON7AV Q==;
X-CSE-ConnectionGUID: ei0COZ0YSeSHnD7lgqje8Q==
X-CSE-MsgGUID: nTUnddjYRl2bKMp2FQ3cEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45389632"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45389632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:42:00 -0700
X-CSE-ConnectionGUID: JHvqkLsdRwaObxUBTuSsqg==
X-CSE-MsgGUID: 0Mpacw9zS+6UsJMkZqbShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133708369"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:41:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 09 Apr 2025 15:41:53 +0300
Message-ID: <87lds9wlpq.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

Fixes for v6.15-rc2.


drm-intel-fixes-2025-04-09:
drm/i915 fixes for v6.15-rc2:
- Fix scanline offset for LNL+ and BMG+
- Fix GVT unterminated-string-initialization build warning
- Fix DP rate limit when sink doesn't support TPS4
- Handle GDDR + ECC memory type detection
- Fix VRR parameter change check
- Fix fence not released on early probe errors
- Disable render power gating during live selftests

BR,
Jani.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2=
025-04-09

for you to fetch changes up to e3ea2eae70692a455e256787e4f54153fb739b90:

  drm/i915/huc: Fix fence not released on early probe errors (2025-04-09 10=
:50:51 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.15-rc2:
- Fix scanline offset for LNL+ and BMG+
- Fix GVT unterminated-string-initialization build warning
- Fix DP rate limit when sink doesn't support TPS4
- Handle GDDR + ECC memory type detection
- Fix VRR parameter change check
- Fix fence not released on early probe errors
- Disable render power gating during live selftests

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed

Badal Nilawar (1):
      drm/i915: Disable RPG during live selftest

Jani Nikula (1):
      drm/i915/gvt: fix unterminated-string-initialization warning

Janusz Krzysztofik (1):
      drm/i915/huc: Fix fence not released on early probe errors

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Fix scanline_offset for LNL+ and BMG+
      drm/i915/dp: Reject HBR3 when sink doesn't support TPS4

Vivek Kasireddy (1):
      drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC

 drivers/gpu/drm/i915/display/intel_bw.c        | 14 ++++++-
 drivers/gpu/drm/i915/display/intel_display.c   |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c        | 51 ++++++++++++++++++++++=
----
 drivers/gpu/drm/i915/display/intel_vblank.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c            | 19 ++--------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c         | 11 +++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h         |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c          |  1 +
 drivers/gpu/drm/i915/gvt/opregion.c            |  7 ++--
 drivers/gpu/drm/i915/i915_drv.h                |  1 +
 drivers/gpu/drm/i915/selftests/i915_selftest.c | 18 +++++++++
 drivers/gpu/drm/i915/soc/intel_dram.c          |  4 ++
 drivers/gpu/drm/xe/xe_device_types.h           |  1 +
 13 files changed, 101 insertions(+), 35 deletions(-)

--=20
Jani Nikula, Intel
