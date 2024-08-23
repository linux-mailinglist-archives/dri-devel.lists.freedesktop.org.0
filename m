Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FF95C9C1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 11:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EB410E35B;
	Fri, 23 Aug 2024 09:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1+kFxuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276D910E35B;
 Fri, 23 Aug 2024 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724406916; x=1755942916;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Cl7YjbcxIzNVDWbi/qEvJ+hTovTwb/+D9pcPj2GK56A=;
 b=Z1+kFxuKtmv0KAcn33wbHMq90vEEhlXavi7tZbZyDPKBiliNvJUq5wAD
 DfG0j3j55dOkTv2iWaFG9pfFcubybJylKMuPZJmAQKhkZnNhzPLvxnRHr
 MYw1UTLrtja16I2K1nf53ohGJKz7fYEKLpBDCM5J/uX8tYumOvmyZddCX
 WysYRVol+Jfxa0imG3Qre2tkWLaRpMEm0U9XLvz5YKwfKZkIervAykFGU
 53rTpwpIgQ78lzcJAKJWaZTRz3cEum8k6tJQkzaNMT+3CpEjMnHFd0gpa
 D/ybJDrZu7Q1Qhna1Ed39u+e2pMb1o19Rax1ylkXzVrTCohBS/oYPba4L A==;
X-CSE-ConnectionGUID: oE+cWrbsSYaWN8ZxSl6Alg==
X-CSE-MsgGUID: rGxPXYgWT82xw2HS8uZXcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22388572"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22388572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:55:16 -0700
X-CSE-ConnectionGUID: rRBpjhBrR0mlRtrDOG6M9g==
X-CSE-MsgGUID: Y+k3G+8rQzyPpUz0BEy+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="92541366"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:55:11 -0700
Date: Fri, 23 Aug 2024 12:55:09 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <ZshcfSqgfnl8Mh4P@jlahtine-mobl.ger.corp.intel.com>
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

Mostly fixes in this drm-intel-gt-next PR at this time.

One thing to pay attention is the limitation of number of relocations to
INT_MAX which might impact synthetic tests, but no real workloads.

Regards, Joonas

***

drm-intel-gt-next-2024-08-23:

UAPI Changes:

- drm/i915: 2 GiB of relocations ought to be enough for anybody*

  Limit the number of relocations to INT_MAX.

  Only impact should be onsynthetic tests.

Driver Changes:

- Fix for #11396: GPU Hang and rcs0 reset on Cherrytrail platform
- Fix Virtual Memory mapping boundaries calculation (Andi)
- Fix for #11255: Long hangs in buddy allocator with DG2/A380 without
  Resizable BAR since 6.9 (David)
- Mark the GT as dead when mmio is unreliable (Chris, Andi)
- Workaround additions / fixes for MTL, ARL and DG2 (John H, Nitin)
- Enable partial memory mapping of GPU virtual memory (Andi, Chris)

- Prevent NULL deref on intel_memory_regions_hw_probe (Jonathan, Dan)
- Avoid UAF on intel_engines_release (Krzysztof)

- Don't update PWR_CLK_STATE starting Gen12 (Umesh)
- Code and dmesg cleanups (Andi, Jesus, Luca)

The following changes since commit 3b85152cb167bd24fe84ceb91b719b5904ca354f:

  drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace (2024-06-28 00:11:01 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-08-23

for you to fetch changes up to 255fc1703e42321b5afdedc8259ad03c7cc533ec:

  drm/i915/gem: Calculate object page offset for partial memory mapping (2024-08-21 15:28:33 +0200)

----------------------------------------------------------------
UAPI Changes:

- Limit the number of relocations to INT_MAX (Tvrtko)

  Only impact should be synthetic tests.

Driver Changes:

- Fix for #11396: GPU Hang and rcs0 reset on Cherrytrail platform
- Fix Virtual Memory mapping boundaries calculation (Andi)
- Fix for #11255: Long hangs in buddy allocator with DG2/A380 without
  Resizable BAR since 6.9 (David)
- Mark the GT as dead when mmio is unreliable (Chris, Andi)
- Workaround additions / fixes for MTL, ARL and DG2 (John H, Nitin)
- Enable partial memory mapping of GPU virtual memory (Andi, Chris)

- Prevent NULL deref on intel_memory_regions_hw_probe (Jonathan, Dan)
- Avoid UAF on intel_engines_release (Krzysztof)

- Don't update PWR_CLK_STATE starting Gen12 (Umesh)
- Code and dmesg cleanups (Andi, Jesus, Luca)

----------------------------------------------------------------
Andi Shyti (6):
      drm/i915/gem: Adjust vma offset for framebuffer mmap offset
      drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
      drm/i915/gem: Improve pfn calculation readability in vm_fault_gtt()
      drm/i915: Replace double blank with single blank after comma in gem/ and gt/
      drm/i915/gem: Do not look for the exact address in node
      drm/i915/gem: Calculate object page offset for partial memory mapping

Chris Wilson (1):
      drm/i915/gt: Mark the GT as dead when mmio is unreliable

David Gow (2):
      drm/i915: Allow evicting to use the requested placement
      drm/i915: Attempt to get pages without eviction first

Jesus Narvaez (1):
      drm/i915/guc: Change GEM_WARN_ON to guc_err to prevent taints in CI

John Harrison (2):
      drm/i915/arl: Enable Wa_14019159160 for ARL
      drm/i915/guc: Extend w/a 14019159160

Jonathan Cavitt (1):
      drm/i915: Allow NULL memory region

Krzysztof Niemiec (1):
      drm/i915/gt: Empty uabi engines list during intel_engines_release()

Luca Coelho (1):
      drm/i915/gt: remove stray declaration of intel_gt_release_all()

Nitin Gote (2):
      drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
      drm/i915/gt: Add Wa_14019789679

Tvrtko Ursulin (1):
      drm/i915: 2 GiB of relocations ought to be enough for anybody*

Umesh Nerlige Ramappa (1):
      i915/perf: Remove code to update PWR_CLK_STATE for gen12

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           | 73 +++++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 13 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  2 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  6 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.h                 |  7 ++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  2 +
 drivers/gpu/drm/i915/gt/intel_reset.c              | 12 +++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 16 ++++-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 18 +++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  2 +-
 drivers/gpu/drm/i915/i915_mm.c                     | 12 +++-
 drivers/gpu/drm/i915/i915_mm.h                     |  3 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 33 ----------
 drivers/gpu/drm/i915/intel_memory_region.c         |  6 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  7 ++-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  2 +-
 23 files changed, 150 insertions(+), 81 deletions(-)
