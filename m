Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33B8147BC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 13:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9D10E9F4;
	Fri, 15 Dec 2023 12:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821DB10E8ED;
 Fri, 15 Dec 2023 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702642321; x=1734178321;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=31U4jgfUJKwGBcafefxJidlE7XwYDZ7JBAtlg5q2cRE=;
 b=E1152HbJGt3KB076+7jfgUjK7+vOX/d5X/w9XFLM7aQ2YfcZweS8Cmn1
 ldfJZFefRLpFm3lL5ZhbUofy3nzfDVcxo8+hJptX0Mih5Yy5PZYUZsKm4
 aoun6IXL7XoJ9oanZqAVZyVJGSF5RpwHb9BhpYRk59QmkHtF3mDzypRue
 GI72gqhylamERyV9VsQV4XtjwbRlH5hKPd8Eh+JfNNLenafZmMf2Ov4Yr
 DtWQxz5IY6MU5Ung7xXlkJivyuIySOoczv+UUoJw7fM48BsJwmV/+B9MU
 c5GtZSNrHJaSXWmG3Yaw5CfBKydrpwHm8zXKm9U+0xkPSzlrDKesFjBOI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380263793"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="380263793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 04:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="898119580"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="898119580"
Received: from emnevill-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.148])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 04:11:56 -0800
Date: Fri, 15 Dec 2023 14:11:53 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZXxCibZZQqlqhDN3@jlahtine-mobl.ger.corp.intel.com>
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

Hi Dave & Sima,

Final drm-intel-gt-next PR for v6.8.

Elimination of kmap_atomic() from the driver to allow kernel wide
cleanup. One new DG2 W/A and static checker/spelling fixes.

Best Regards,
Joonas

***

drm-intel-gt-next-2023-12-15:

Driver Changes:

- Eliminate use of kmap_atomic() in i915 (Zhao)
- Add Wa_14019877138 for DG2 (Haridhar)

- Static checker and spelling fixes (Colin, Karthik, Randy)
-

The following changes since commit be5bcc4be9d9d3ae294072441a66fe39b74e5bba:

  drm/i915/guc: Create the guc_to_i915() wrapper (2023-12-08 12:31:01 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-12-15

for you to fetch changes up to 31accc37eaee98a90b25809ed58c6ee4956ab642:

  drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c (2023-12-15 09:34:31 +0000)

----------------------------------------------------------------
Driver Changes:

- Eliminate use of kmap_atomic() in i915 (Zhao)
- Add Wa_14019877138 for DG2 (Haridhar)

- Static checker and spelling fixes (Colin, Karthik, Randy)
-

----------------------------------------------------------------
Colin Ian King (1):
      drm/i915/selftests: Fix spelling mistake "initialiased" -> "initialised"

Haridhar Kalvala (1):
      drm/i915: Add Wa_14019877138

Karthik Poosa (1):
      drm/i915/hwmon: Fix static analysis tool reported issues

Randy Dunlap (1):
      drm/i915/uapi: fix typos/spellos and punctuation

Zhao Liu (9):
      drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
      drm/i915: Use memcpy_[from/to]_page() in gem/i915_gem_pyhs.c
      drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
      drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
      drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
      drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
      drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
      drm/i915: Use kmap_local_page() in i915_cmd_parser.c
      drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c          | 10 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.c              |  8 +++-----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c                | 10 ++--------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c               |  6 ++++--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c         |  6 +++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 12 ++++--------
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c   |  8 ++++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h                 |  3 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c             |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c                |  5 +----
 drivers/gpu/drm/i915/i915_cmd_parser.c                  |  4 ++--
 drivers/gpu/drm/i915/i915_hwmon.c                       |  4 ++--
 include/uapi/drm/i915_drm.h                             | 12 ++++++------
 14 files changed, 43 insertions(+), 50 deletions(-)
