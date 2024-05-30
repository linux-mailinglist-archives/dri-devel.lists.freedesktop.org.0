Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D58D461F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 09:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ABD10E431;
	Thu, 30 May 2024 07:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btisPHTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7885110E115;
 Thu, 30 May 2024 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717054237; x=1748590237;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gGdyNg4FvsZRt+gYXxxil25JxaTzvHtWbFhW+Oghm7A=;
 b=btisPHTsWP8P4/512zuYmiwN+oqU8Z/z29HjbX8R+kaLnteBAvA34mDh
 VIK6/2OHMiJfTHRNvh7IMPQo7KcTtXv/4f1gSQEqaqA+Alq80sMQGpMn0
 JbBkOg2RCcH24fhlXFkz80qz5jjD+8uIzIrSaWpOVfo/36wWDuOhXNHMH
 5ITRajhDYP160zWI+lRZvyOEoMvaloQQOA4QG5pK3LJYW5ThrbzTbUoD1
 HiQvEnsccVPdpntdJunM5noWPimKAEWjisj+barZksj94h/U0mtRtCXiO
 5fbJvve65uv1uv9FbFTk07XLFldGFgtZSH3d88jzfhgurDAV8tCHr5iBK Q==;
X-CSE-ConnectionGUID: kG8+u2AbToSVZmlpm3twSA==
X-CSE-MsgGUID: IGXA0YaeSR+U8qS0eR7ffQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13458988"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13458988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 00:30:35 -0700
X-CSE-ConnectionGUID: aHg2+l0IQ2CBC+byeNs8JQ==
X-CSE-MsgGUID: JkumP6+MRmCZPgwY0OUIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66585859"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 00:30:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Date: Thu, 30 May 2024 10:30:26 +0300
Message-ID: <87a5k7iwod.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

drm-intel-fixes-2024-05-30:
drm/i915 fixes for v6.10-rc2:
- Fix a race in audio component by registering it later
- Make DPT object unshrinkable to avoid shrinking when framebuffer has
  not shrunk
- Fix CCS id calculation to fix a perf regression
- Fix selftest caching mode
- Fix FIELD_PREP compiler warnings
- Fix indefinite wait for GT wakeref release
- Revert overeager multi-gt pm reference removal

BR,
Jani.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-05-30

for you to fetch changes up to 75800e2e4203ea83bbc9d4f63ad97ea582244a08:

  drm/i915: Fix audio component initialization (2024-05-29 11:35:48 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.10-rc2:
- Fix a race in audio component by registering it later
- Make DPT object unshrinkable to avoid shrinking when framebuffer has
  not shrunk
- Fix CCS id calculation to fix a perf regression
- Fix selftest caching mode
- Fix FIELD_PREP compiler warnings
- Fix indefinite wait for GT wakeref release
- Revert overeager multi-gt pm reference removal

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Fix CCS id's calculation for CCS mode setting

Arnd Bergmann (1):
      drm/i915/guc: avoid FIELD_PREP warning

Chris Wilson (1):
      drm/i915/gt: Disarm breadcrumbs if engines are already idle

Imre Deak (1):
      drm/i915: Fix audio component initialization

Janusz Krzysztofik (1):
      Revert "drm/i915: Remove extra multi-gt pm-references"

Nirmoy Das (1):
      drm/i915/selftests: Set always_coherent to false when reading from CPU

Vidya Srinivas (1):
      drm/i915/dpt: Make DPT object unshrinkable

 drivers/gpu/drm/i915/display/intel_audio.c         | 32 ++++++++++++++--------
 drivers/gpu/drm/i915/display/intel_audio.h         |  1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 18 ++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  4 ++-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        | 15 +++++-----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  6 ++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  8 ++++++
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |  6 ++--
 11 files changed, 71 insertions(+), 25 deletions(-)

-- 
Jani Nikula, Intel
