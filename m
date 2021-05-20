Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C538AD34
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393956F406;
	Thu, 20 May 2021 11:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5716F405;
 Thu, 20 May 2021 11:58:05 +0000 (UTC)
IronPort-SDR: uiL2T8m3WqT/FOBsMCu7+IeLI6gjrtIpvZ+RXKrYb7ZINLao6PkEyLc+HfZLYXgEYNrRfNndCo
 QRiYhxO6YamQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="188335305"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="188335305"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 04:58:04 -0700
IronPort-SDR: iEJWH2i+sxjF+0B5w0ewuhKfKe7AGoeu79ORJgN7G1sLn0MM9AW6DwGWB+Cy7fCNBGdk6ph2J8
 abCM0b1Moa0Q==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="473990617"
Received: from kdubois-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.35.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 04:58:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 20 May 2021 14:57:57 +0300
Message-ID: <87a6opehx6.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2021-05-20:
drm/i915 fixes for v5.13-rc3:
- Pin the L-shape quirked object as unshrinkable to fix crashes
- Disable HiZ Raw Stall Optimization on broken gen7 to fix glitches, gfx corruption
- GVT: Move mdev attribute groups into kvmgt module to fix kconfig deps issue

BR,
Jani.

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-05-20

for you to fetch changes up to eddd1b8f467f82b8e9e137ef9dbaa842ecca6a2c:

  Merge tag 'gvt-fixes-2021-05-19' of https://github.com/intel/gvt-linux into drm-intel-fixes (2021-05-19 11:22:24 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.13-rc3:
- Pin the L-shape quirked object as unshrinkable to fix crashes
- Disable HiZ Raw Stall Optimization on broken gen7 to fix glitches, gfx corruption
- GVT: Move mdev attribute groups into kvmgt module to fix kconfig deps issue

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gem: Pin the L-shape quirked object as unshrinkable

Jani Nikula (1):
      Merge tag 'gvt-fixes-2021-05-19' of https://github.com/intel/gvt-linux into drm-intel-fixes

Simon Rettberg (1):
      drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7

Zhenyu Wang (1):
      drm/i915/gvt: Move mdev attribute groups into kvmgt module

 drivers/gpu/drm/i915/Kconfig               |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  |   2 +
 drivers/gpu/drm/i915/gt/gen7_renderclear.c |   5 +-
 drivers/gpu/drm/i915/gvt/gvt.c             | 124 +----------------------------
 drivers/gpu/drm/i915/gvt/gvt.h             |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h       |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c           | 122 +++++++++++++++++++++++++---
 drivers/gpu/drm/i915/gvt/mpt.h             |   4 +-
 drivers/gpu/drm/i915/i915_gem.c            |  11 ++-
 9 files changed, 129 insertions(+), 145 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
