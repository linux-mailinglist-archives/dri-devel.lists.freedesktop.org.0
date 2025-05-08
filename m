Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5FFAAF3A1
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 08:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2710E895;
	Thu,  8 May 2025 06:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAZyX9+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3E410E88D;
 Thu,  8 May 2025 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746685290; x=1778221290;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=369fNYmztQjOk16YQ3+hBiFn3BvnOwUqdHf/qFeRDi0=;
 b=EAZyX9+7Sq/YnmtWfw1aUPKpa/LYtK8zjx96jpugvq0gv6j0l8CQZ93I
 4J0A7Y/zHcaAgAIQI8ZA13WbVU62T9KGeKrNi5DgN4DD90UBjOQwiZcwY
 H79//XxF8i+P/7TFC7n6Bicj4dj3ITvS+x4SC2UaWB/fei4oCthuLzi2p
 +yMkNb82GpjrIWy41aAH3WZVn2JCkL5AGfjAv+Ga2Np52kvsKYxEhJBlX
 RZlhWHoEpYcg7sGh0YreMD2dzrWxGwoh7IQvglMsvwom6kdksesSrN1lk
 WxRIqCgq7aozvdU3gPdAUEtZ6Pqgtop4QV1vbm+lGH40V90AIM11VaCH/ w==;
X-CSE-ConnectionGUID: jz7enB7KRhK+58S0E6K/yQ==
X-CSE-MsgGUID: q5J+joHeQKeH2Bdw28tiqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51108636"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="51108636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:21:29 -0700
X-CSE-ConnectionGUID: zej2lHO/SkeetEj6U7vnWQ==
X-CSE-MsgGUID: VUqObYIvQM2qhhPgQYIYVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136129312"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:21:25 -0700
Date: Thu, 8 May 2025 09:21:22 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <aBxNYp0IviE23zy-@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Here goes the drm-intel-gt-next PR towards 6.16. No new features, just fixes.

SLPC wait boost fix for DG1/DG2, engine reset fix for HSW.
Move to usleep_range for <20ms timeouts and fix splats on early probe
errors.

The rest is usual cleanups and improvements to selftests.

Regards, Joonas

***

drm-intel-gt-next-2025-05-08-1:

Driver Changes:

- Fix SLPC wait boosting reference counting to avoid getting stuck on non-boost
  frequency on power saving profile on DG1/DG2 (Vinay)
- Add 20ms delay to engine reset for robustness on HSW (Nitin)

- Use proper sleeping functions for timeouts shorter than 20ms (Andi)
- Fix fence not released on early probe errors for HuC (Janusz)

- Remove const from struct i915_wa list allocation (Kees)
- Apply SPDX license format where missing and use single-line format (Andi)
- Whitespace fixes (Dan, Andi)
- Selftest improvements (Mikolaj, Badal, Sk,

The following changes since commit bfef148f3680e6b9d28e7fca46d9520f80c5e50e:

  drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps (2025-03-11 07:04:51 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-05-08-1

for you to fetch changes up to b2602a84ff85926be8d1fb7186128976c9f76c3f:

  drm/i915/gt: Remove const from struct i915_wa list allocation (2025-05-07 12:34:59 +0200)

----------------------------------------------------------------
Driver Changes:

- Fix SLPC wait boosting reference counting to avoid getting stuck on non-boost
  frequency on power saving profile on DG1/DG2 (Vinay)
- Add 20ms delay to engine reset for robustness on HSW (Nitin)

- Use proper sleeping functions for timeouts shorter than 20ms (Andi)
- Fix fence not released on early probe errors for HuC (Janusz)

- Remove const from struct i915_wa list allocation (Kees)
- Apply SPDX license format where missing and use single-line format (Andi)
- Whitespace fixes (Dan, Andi)
- Selftest improvements (Mikolaj, Badal, Sk,

----------------------------------------------------------------
Andi Shyti (4):
      drm/i915/gt: Fix SPDX license format
      drm/i915/gt: Remove trailing blank lines
      drm/i915/gt: Use proper sleeping functions for timeouts shorter than 20ms
      drm/i915/gem: Convert SPDX headers to single-line format

Badal Nilawar (1):
      drm/i915: Disable RPG during live selftest

Dan Carpenter (1):
      drm/i915/gsc: delete a stray tab in intel_gsc_fw_get_binary_info()

Janusz Krzysztofik (1):
      drm/i915/huc: Fix fence not released on early probe errors

Kees Cook (1):
      drm/i915/gt: Remove const from struct i915_wa list allocation

Mikolaj Wasiak (2):
      i915/selftest/igt_mmap: let mmap tests run in kthread
      i915/gt/selftests: Disable lrc_timestamp test

Nitin Gote (1):
      drm/i915/gt: Add delay to let engine resumes properly

Sk Anirban (1):
      drm/i915/selftests: Refactor RC6 power measurement and error handling

Vinay Belgaumkar (1):
      drm/i915/slpc: Balance the inc/dec for num_waiters

 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.h        |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h           |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.h             |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  3 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |  3 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.h              |  3 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 14 +++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  1 -
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  1 -
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  1 -
 drivers/gpu/drm/i915/gt/intel_rc6.c                | 19 ++------
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  8 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c                | 14 ++++--
 drivers/gpu/drm/i915/gt/intel_wopcm.h              |  3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  9 ++++
 drivers/gpu/drm/i915/gt/selftest_rc6.c             | 54 +++++++++++++++-------
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             | 11 ++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  1 +
 drivers/gpu/drm/i915/selftests/i915_selftest.c     | 18 ++++++++
 46 files changed, 140 insertions(+), 108 deletions(-)
