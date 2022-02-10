Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10004B0B6D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3410E7F5;
	Thu, 10 Feb 2022 10:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7A110E7F5;
 Thu, 10 Feb 2022 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490341; x=1676026341;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=91Gm4lPnHxNYO8WbSSgS1z/Ls7KKSSVUZFiiOc1Vd4g=;
 b=mghNsOiS5tB4OMFuw+Z2XWCsTSwRwRMCUmB3cGmjn2xS7f70d9E4fADd
 NS2cMFYxJrUjt8IBgePOULDbgGyX2/iLWBgSKL4I2jsipm+E2YkCT+a4g
 Ssw2RqkNRv8/8ulSl3jf1KgXmstwIaB11/dHSx+Fux1xSDMYeUrTyt3rK
 JjZMszeUeozt/PbQeerynkPCE2fkt+4fHAaHYmRR0eopN6o8k4vBxXr0C
 tuEA/xkzEgOSywKDuY4fPExOBFaSKENqJRgElHBi/8MUa1PremkiRQ2hD
 oCd4f2UwAXZD4DX71ExxsRox40GmlU0jhxq3mpx2bbW9uCVfUFZxqbJJp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202471"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202471"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:52:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485640727"
Received: from scurtin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.201.86])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:52:18 -0800
Date: Thu, 10 Feb 2022 10:52:16 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YgTuYAtpaV3XAGmx@tursulin-mobl2>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave,  Daniel,

An assortment of fixes for -rc4, mostly display, one TTM migration fixup,
one fix for platforms without runtime PM and one !x86 build fix.

Regards,

Tvrtko

drm-intel-fixes-2022-02-10:
- Build fix for non-x86 platforms after remap_io_mmapping changes. (Lucas De Marchi)
- Correctly propagate errors during object migration blits. (Thomas Hellström)
- Disable DRRS support on HSW/IVB where it is not implemented yet. (Ville Syrjälä)
- Correct pipe dbuf BIOS configuration during readout. (Ville Syrjälä)
- Properly sanitise BIOS buf configuration on ADL-P+ for !join_mbus cases. (Ville Syrjälä)
- Fix oops due to missing stack depot. (Ville Syrjälä)
- Workaround broken BIOS DBUF configuration on TGL/RKL. (Ville Syrjälä)
The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-02-10

for you to fetch changes up to 4e6f55120c7eccf6f9323bb681632e23cbcb3f3c:

  drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL (2022-02-07 12:56:50 +0000)

----------------------------------------------------------------
- Build fix for non-x86 platforms after remap_io_mmapping changes. (Lucas De Marchi)
- Correctly propagate errors during object migration blits. (Thomas Hellström)
- Disable DRRS support on HSW/IVB where it is not implemented yet. (Ville Syrjälä)
- Correct pipe dbuf BIOS configuration during readout. (Ville Syrjälä)
- Properly sanitise BIOS buf configuration on ADL-P+ for !join_mbus cases. (Ville Syrjälä)
- Fix oops due to missing stack depot. (Ville Syrjälä)
- Workaround broken BIOS DBUF configuration on TGL/RKL. (Ville Syrjälä)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/i915: Fix header test for !CONFIG_X86

Thomas Hellström (1):
      drm/i915/ttm: Return some errors instead of trying memcpy move

Ville Syrjälä (5):
      drm/i915: Fix oops due to missing stack depot
      drm/i915: Disable DRRS on IVB/HSW port != A
      drm/i915: Allow !join_mbus cases for adlp+ dbuf configuration
      drm/i915: Populate pipe dbuf slices more accurately during readout
      drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL

 drivers/gpu/drm/i915/display/intel_display.c |   1 +
 drivers/gpu/drm/i915/display/intel_drrs.c    |   8 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  14 ++-
 drivers/gpu/drm/i915/i915_mm.h               |   1 +
 drivers/gpu/drm/i915/intel_pm.c              | 143 ++++++++++++++++++++++-----
 drivers/gpu/drm/i915/intel_pm.h              |   1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c      |   4 +-
 7 files changed, 142 insertions(+), 30 deletions(-)
