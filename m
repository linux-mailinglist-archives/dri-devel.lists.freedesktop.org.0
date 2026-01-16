Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD4D2DCC4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D9E10E823;
	Fri, 16 Jan 2026 08:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBNWkPjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BB910E823;
 Fri, 16 Jan 2026 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768551246; x=1800087246;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=OuoqOOo/707Go4x/0zDg1+lOhJlBCiPNnMWeAo+ATLU=;
 b=gBNWkPjRbMZbc1D6pkDsbM5zh1f/aq+ygMZ1xj2O7Biu47vI+bIVj/X6
 mLhF/6ohrM7wfnmqMJZMaym0l8XzBeUSR15bok9vSE3bqVnqBhVeJeICX
 2/H0KX15oqFneHGVioY/K97RsE5hXCsGQx+VLQXExV+YStdbCNgmwIgGU
 xdgJX54v8cV1S4o3Bnt9KESztmEHP5TyF3GMPu7ojbkaobUryLpMnkmW8
 NtrxfSwpFKQRPDxBJ6LInZWNCRAhn85FxD84Rf3m3GXsM1YBZzfac+Tui
 lX+qS2Jhe3boqJuRg4aVaS0YKOisRS4UpInB/1+OH5Hboi3ZG3grsG0iw w==;
X-CSE-ConnectionGUID: WDYykO9ZQnKUqLOmNupYhQ==
X-CSE-MsgGUID: Jp7MAIZNRn+C8Szqklvspg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73717362"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="73717362"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:13:57 -0800
X-CSE-ConnectionGUID: SAyNptJKSESRZNvSqQ71fg==
X-CSE-MsgGUID: lG8gRhLuTIKoUbQNQIeAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="204328940"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.118])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:13:50 -0800
Date: Fri, 16 Jan 2026 10:13:47 +0200
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
Message-ID: <aWnzOx78S4Vh38QE@jlahtine-mobl>
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

Here goes the drm-intel-gt-next PR towards v6.20.

Mainly a GuC recommended version update for DG2/MTL and a NULL deref fix
in execbuf. Rest is smaller fixes.

Regards, Joonas

***

drm-intel-gt-next-2026-01-16:

Driver Changes:

- Bump recommended GuC version for DG2 and MTL
- Fix for syzkaller found NULL deref in execbuf (Krzyssztof, Gangmin)

- Use designated initializers in debugfs code (Sebastian)
- Selftest and static checker fixes (Ard, Sk)
The following changes since commit 3bcf7894a93e18bff802088a368c13d86a5987a0:

  drm/i915/gt: Use standard API for seqcount read in TLB invalidation (2025-10-31 10:58:05 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2026-01-16

for you to fetch changes up to 9512d9fc2a7a4fee14854fbb3af89a8bf599f361:

  drm/i915/guc: Recommend GuC v70.53.0 for DG2, MTL (2026-01-12 14:21:10 -0800)

----------------------------------------------------------------
Driver Changes:

- Bump recommended GuC version for DG2 and MTL
- Fix for syzkaller found NULL deref in execbuf (Krzyssztof, Gangmin)

- Use designated initializers in debugfs code (Sebastian)
- Selftest and static checker fixes (Ard, Sk)

----------------------------------------------------------------
Ard Biesheuvel (1):
      drm/i915: Fix format string truncation warning

Julia Filipchuk (1):
      drm/i915/guc: Recommend GuC v70.53.0 for DG2, MTL

Krzysztof Niemiec (1):
      drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer

Sebastian Brzezinka (1):
      drm/i915/gt: use designated initializers for intel_gt_debugfs_file

Sk Anirban (1):
      drm/i915/selftest: Add throttle reason diagnostics to RPS selftests

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 37 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |  4 +--
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      | 15 +++++----
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |  4 +--
 drivers/gpu/drm/i915/gt/selftest_rps.c             | 34 +++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c  |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     | 13 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |  8 ++---
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  4 +--
 drivers/gpu/drm/i915/intel_memory_region.h         |  2 +-
 13 files changed, 76 insertions(+), 53 deletions(-)
