Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07841D5B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 10:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4666EB43;
	Thu, 30 Sep 2021 08:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58A6EB43;
 Thu, 30 Sep 2021 08:50:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="221934018"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="221934018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 01:50:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="563960218"
Received: from vmurthy-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.37.18])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 01:50:22 -0700
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
Date: Thu, 30 Sep 2021 11:50:20 +0300
Message-ID: <87lf3ev44z.fsf@intel.com>
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


Hi Dave & Daniel -

drm-intel-fixes-2021-09-30:
drm/i915 fixes for v5.15-rc4:
- Fix GVT scheduler ww lock usage
- Fix pdfdocs documentation build
- Fix request early tracepoints
- Fix an invalid warning from rps worker

BR,
Jani.

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-09-30

for you to fetch changes up to 4b8bcaf8a6d6ab5db51e30865def5cb694eb2966:

  drm/i915: Remove warning from the rps worker (2021-09-27 12:46:40 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.15-rc4:
- Fix GVT scheduler ww lock usage
- Fix pdfdocs documentation build
- Fix request early tracepoints
- Fix an invalid warning from rps worker

----------------------------------------------------------------
Akira Yokosawa (1):
      drm/i915/guc, docs: Fix pdfdocs build error by removing nested grid

Jani Nikula (1):
      Merge tag 'gvt-fixes-2021-09-18' of https://github.com/intel/gvt-linux into drm-intel-fixes

Matthew Auld (1):
      drm/i915/request: fix early tracepoints

Tejas Upadhyay (1):
      drm/i915: Remove warning from the rps worker

Zhi A Wang (1):
      drm/i915/gvt: fix the usage of ww lock in gvt scheduler.

 drivers/gpu/drm/i915/gt/intel_rps.c                         |  2 --
 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h  | 10 +++++-----
 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h | 10 +++++-----
 drivers/gpu/drm/i915/gvt/scheduler.c                        |  4 ++--
 drivers/gpu/drm/i915/i915_request.c                         | 11 ++---------
 5 files changed, 14 insertions(+), 23 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
