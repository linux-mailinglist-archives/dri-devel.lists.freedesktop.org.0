Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5640DB3B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224FE6EDC1;
	Thu, 16 Sep 2021 13:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6F46EDBF;
 Thu, 16 Sep 2021 13:30:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="308106434"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="308106434"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:30:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545704661"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.34.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:30:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 16 Sep 2021 16:30:40 +0300
Message-ID: <8735q4wsu7.fsf@intel.com>
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


Hi Dave & Daniel -

Fixes for v5.15-rc2. Looks like our CI is currently unhealthy. It's a
wip, but these don't seem to make matters worse, so I think better get
them moving than holding on.


drm-intel-fixes-2021-09-16:
drm/i915 fixes for v5.15-rc2:
- Propagate DP link training error returns
- Use max link params for eDP 1.3 and earlier
- Build warning fixes
- Gem selftest fixes
- Ensure wakeref is held before hardware access

BR,
Jani.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-09-=
16

for you to fetch changes up to 7889367d7795b3b1766e33ac1ae8a5fbc292108b:

  drm/i915: Enable -Wsometimes-uninitialized (2021-09-14 19:48:30 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.15-rc2:
- Propagate DP link training error returns
- Use max link params for eDP 1.3 and earlier
- Build warning fixes
- Gem selftest fixes
- Ensure wakeref is held before hardware access

----------------------------------------------------------------
Daniel Vetter (1):
      drm/i915: Release ctx->syncobj on final put, not on ctx close

Daniele Ceraolo Spurio (1):
      drm/i915/guc: drop guc_communication_enabled

Kai-Heng Feng (1):
      drm/i915/dp: Use max params for panels < eDP 1.4

Lee Shawn C (1):
      drm/i915/dp: return proper DPRX link training result

Nathan Chancellor (3):
      drm/i915/selftests: Do not use import_obj uninitialized
      drm/i915/selftests: Always initialize err in igt_dmabuf_import_same_d=
river_lmem()
      drm/i915: Enable -Wsometimes-uninitialized

Thomas Hellstr=C3=B6m (1):
      drm/i915/gem: Fix the mman selftest

Vinay Belgaumkar (1):
      drm/i915: Get PM ref before accessing HW register

 drivers/gpu/drm/i915/Makefile                      |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c            |  5 ++++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  6 ++---
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  7 +++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 26 +++++++++++++++++-=
----
 drivers/gpu/drm/i915/gt/intel_rps.c                |  8 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              | 11 +++------
 8 files changed, 42 insertions(+), 24 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
