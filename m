Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF01778C6D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 12:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581FF10E68E;
	Fri, 11 Aug 2023 10:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783BA10E68C;
 Fri, 11 Aug 2023 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691751003; x=1723287003;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ifufF78M3M2uW5F9/tsLVe2GOAT8xsQ0mEqWVDoeA6U=;
 b=SxqAqBhXhhtV6LWg7lWX1RBeebzDrsdhG2aBrEJa25u8dtrZ0E86BW80
 VTKLtB0oFoNZkME0gHbIxeZvbBe4aTlEhFxo4WDixKohFtWQXLGmQ4N9d
 Xn/FZJxWCsa1ScOhDvL3if1jlKnyLU//DNwkm7dQIAP4R/xbl42virySd
 X8Xjlm8j2tJHQ5iFsl7HOiVf4qQjHv9ZN9Gxh5W6V6mtCUshFo/1UaLuF
 LfB5tmT/el6WoE3ByTCPY16EfzuGQZA6ViMnntx/kLjGowLVjemjopQzJ
 dMgC30a0byhL6yaoJiDHy8GgmLfQn7kZgDUARIFpTbFWptpAXRaPYJg9e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351970589"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="351970589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 03:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906400616"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906400616"
Received: from msawye3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.2.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 03:48:14 -0700
Date: Fri, 11 Aug 2023 13:47:57 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZNYR3bKFquGc7u9w@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here's the final drm-intel-gt-next PR for v6.6. Not too many patches
as the previous PR was later than usual.

Just one more workaround fix for MTL, some object coherency
refactoring and selftest fix.

Note that there is a backmerge of drm-next[1], too.

Regards, Joonas

[1] As prep for https://patchwork.freedesktop.org/series/121735/ but the
series started failing CI after rebasing and continues to be investigated
so not landing here yet.

***

drm-intel-gt-next-2023-08-11:

Cross-subsystem Changes:

- Backmerge of drm-next

Driver Changes:

- Apply workaround 22016122933 correctly (Jonathan, Matt R)

- Simplify shmem_create_from_object map_type selection (Jonathan,
  Tvrtko)
- Make i915_coherent_map_type GT-centric (Jonathan, Matt R)

- Selftest improvements (John)

The following changes since commit d9aa1da9a8cfb0387eb5703c15bd1f54421460ac:

  Merge tag 'drm-intel-gt-next-2023-08-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-07 13:49:25 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-08-11

for you to fetch changes up to 788568fad4015406fa84fc86cefbef7c470c7c1f:

  drm/i915/guc: Fix potential null pointer deref in GuC 'steal id' test (2023-08-10 16:02:01 -0700)

----------------------------------------------------------------
Cross-subsystem Changes:

- Backmerge of drm-next

Driver Changes:

- Apply workaround 22016122933 correctly (Jonathan, Matt R)

- Simplify shmem_create_from_object map_type selection (Jonathan,
  Tvrtko)
- Make i915_coherent_map_type GT-centric (Jonathan, Matt R)

- Selftest improvements (John)

----------------------------------------------------------------
John Harrison (1):
      drm/i915/guc: Fix potential null pointer deref in GuC 'steal id' test

Jonathan Cavitt (3):
      drm/i915/gt: Simplify shmem_create_from_object map_type selection
      drm/i915: Make i915_coherent_map_type GT-centric
      drm/i915/gt: Apply workaround 22016122933 correctly

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c         |  3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h            |  4 ----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c             | 15 ---------------
 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_engine_pm.c             |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h                    | 10 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c                   |  4 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.c                   | 13 +++++++------
 drivers/gpu/drm/i915/gt/intel_ring.c                  |  3 ++-
 drivers/gpu/drm/i915/gt/selftest_context.c            |  5 +++--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c          |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_lrc.c                |  6 +++---
 drivers/gpu/drm/i915/gt/shmem_utils.c                 |  3 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c             |  7 +------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c                | 11 ++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c             |  4 ----
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c             |  3 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c              |  3 ++-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c             |  6 +++---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c            |  3 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c              |  5 ++++-
 drivers/gpu/drm/i915/selftests/igt_spinner.c          |  2 +-
 23 files changed, 75 insertions(+), 69 deletions(-)
