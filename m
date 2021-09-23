Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742F415CE1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 13:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F296ED04;
	Thu, 23 Sep 2021 11:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362CD6E0D4;
 Thu, 23 Sep 2021 11:35:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="287490482"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="287490482"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 04:35:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="550889284"
Received: from lloh-mobl.ger.corp.intel.com (HELO localhost) ([10.249.35.91])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 04:35:27 -0700
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
Date: Thu, 23 Sep 2021 14:35:23 +0300
Message-ID: <87o88jbk3o.fsf@intel.com>
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

drm-intel-fixes-2021-09-23:
drm/i915 fixes for v5.15-rc3:
- Fix ADL-P memory bandwidth parameters
- Fix memory corruption due to a double free
- Fix memory leak in DMC firmware handling

BR,
Jani.

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-09-23

for you to fetch changes up to b875fb313a10bf816b5d49d8d7642d1cc9905f2f:

  drm/i915: Free all DMC payloads (2021-09-21 13:36:34 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.15-rc3:
- Fix ADL-P memory bandwidth parameters
- Fix memory corruption due to a double free
- Fix memory leak in DMC firmware handling

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915: Free all DMC payloads

Maarten Lankhorst (1):
      drm/i915: Move __i915_gem_free_object to ttm_bo_destroy

Radhakrishna Sripada (1):
      drm/i915: Update memory bandwidth parameters

 drivers/gpu/drm/i915/display/intel_bw.c  | 19 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc.c |  5 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c  |  9 +++++----
 3 files changed, 25 insertions(+), 8 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
