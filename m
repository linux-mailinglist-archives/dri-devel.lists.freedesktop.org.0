Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B03BEA6A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA0B6E17E;
	Wed,  7 Jul 2021 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F7D6E17D;
 Wed,  7 Jul 2021 15:09:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="270437502"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="270437502"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:09:30 -0700
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="647914555"
Received: from abdoesch-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.213.166.207])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:09:28 -0700
Date: Wed, 7 Jul 2021 11:09:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YOXDp/+CFDgJ2/7f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2021-07-07:

One fix targeting stable for display DP VSC, plus DG1 display fix and
a bug fix of IRQs usages and cleanup references to the DRM IRQ midlayer.

Thanks,
Rodrigo.

The following changes since commit 8a02ea42bc1d4c448caf1bab0e05899dad503f74:

  Merge tag 'drm-intel-next-fixes-2021-06-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-06-30 15:42:05 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2021-07-07

for you to fetch changes up to 3dd6c11b60d2f1e4082221a8831f91093c4494aa:

  drm/i915: Drop all references to DRM IRQ midlayer (2021-07-06 15:10:58 -0400)

----------------------------------------------------------------
One fix targeting stable for display DP VSC, plus DG1 display fix and
a bug fix of IRQs usages and cleanup references to the DRM IRQ midlayer.

----------------------------------------------------------------
José Roberto de Souza (1):
      drm/i915/display/dg1: Correctly map DPLLs during state readout

Kees Cook (1):
      drm/i915/display: Do not zero past infoframes.vsc

Thomas Zimmermann (2):
      drm/i915: Use the correct IRQ during resume
      drm/i915: Drop all references to DRM IRQ midlayer

 drivers/gpu/drm/i915/display/intel_ddi.c        | 19 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  7 +++++--
 drivers/gpu/drm/i915/i915_drv.c                 |  1 -
 drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
 drivers/gpu/drm/i915/i915_irq.h                 |  1 +
 drivers/gpu/drm/i915/i915_reg.h                 |  3 ---
 8 files changed, 29 insertions(+), 16 deletions(-)
