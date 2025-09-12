Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8EB54340
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B087C10EBB4;
	Fri, 12 Sep 2025 06:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjgFKYTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C514910E38C;
 Fri, 12 Sep 2025 06:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757659781; x=1789195781;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Dda8MbkTbzlKiDQ4VUK1mNB7r+aQUo5mlcfZT2QajAU=;
 b=ZjgFKYTLGcWDgL3TmF6Fpv93yUX75A2BbC/cBK+CSlk3gvq6L4a//5Xg
 pbTIGAxaYSpPDyFgDGf/YIc2lzp/5IvUFROBtTMwWepSECKrU5URlWNpP
 si7p1VRTSqtyfGkNFLtQMDW+eKco22ltaVWUOav3RzvkRgr2udsZCfCg3
 jbVGVMgGYQE0qltfHb2SujR/b9S4feNPYyyeyFtegxPrF1IQfTPWimqbt
 ZfBBTu9cNJGIJZZp+2rPp+dL2UywDGK4qAiRSr1Tg/t7m4LCZNAVX454J
 2+udQSBD4grJcChoo5lfGqrAMtP5q69onj3ngf4lBZBvZI5p507iJo1Xm g==;
X-CSE-ConnectionGUID: /dQIi34aRSutBUA+I/a+qw==
X-CSE-MsgGUID: rlPGiDLtTIe9QXjLYxs1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71427719"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71427719"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 23:49:41 -0700
X-CSE-ConnectionGUID: UCnpwTlFTp6je/nizjxL5w==
X-CSE-MsgGUID: 6yDsWVPbTDaahlHB+b0g1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173968783"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.70])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 23:49:36 -0700
Date: Fri, 12 Sep 2025 09:49:33 +0300
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
Message-ID: <aMPCfRObHMg6DZAs@jlahtine-mobl>
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

Here's the final drm-intel-gt-next PR towards v6.18.

Debug improvement to include GuC registers in error state and
two smaller improvements.

Regards, Joonas

***

drm-intel-gt-next-2025-09-12:

Driver Changes:

- Include the GuC registers in the error state (Daniele)
- Use memdup_user() (Thorsten)
- Selftest improvements (Jonathan)

The following changes since commit b7a855f488c6825e3dc06e78c49326491bef6f98:

  drm/i915/gt: Relocate Gen6 context-specific workaround (2025-08-18 20:32:25 -0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-09-12

for you to fetch changes up to ba391a102ec11ab7f5b249e46dcf61ef836a57e7:

  drm/i915/guc: Include the GuC registers in the error state (2025-09-11 11:28:02 -0700)

----------------------------------------------------------------
Driver Changes:

- Include the GuC registers in the error state (Daniele)
- Use memdup_user() (Thorsten)
- Selftest improvements (Jonathan)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/i915/guc: Include the GuC registers in the error state

Jonathan Cavitt (1):
      drm/i915/gt: Fix memory leak in hangcheck selftest

Thorsten Blum (1):
      drm/i915: Replace kmalloc() + copy_from_user() with memdup_user()

 drivers/gpu/drm/i915/gem/i915_gem_context.c  |  12 +---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c    |   8 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h   |   1 +
 drivers/gpu/drm/i915/i915_gpu_error.c        | 102 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h        |   1 +
 6 files changed, 116 insertions(+), 12 deletions(-)
