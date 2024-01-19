Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A018325C3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6528C10E980;
	Fri, 19 Jan 2024 08:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA5D10E96F;
 Fri, 19 Jan 2024 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705653053; x=1737189053;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=gFBrt25gUCsuVGpE3BMz42k3wt5kctlAPg8E8hQ5Xm8=;
 b=RHL9+HKv0Dci2EsrKBwdlPc7SwGqVMbGKi4YrLBii2pMK7xKYuL80LNj
 J8zZy1OwGEjKKdEEsyduRETVsxoBTM2ef5L73hPvPaRsPNAzmS7kivzhU
 R+oymW6B+N6fg1/xqgK46+iLlW3QGA0uZ0A9rXMk/K/gTdlE4plCEmF8x
 5ipPEuJCepsxS09DVnsHA+jvcam7HcFK9eMLRqC7eYgLGSs8sHWF1ApuU
 jkRGuHRBbgwqgWSw/g6g2Zs/n1mSBbg83+B0U1f96h61164WlEM6Tb7Xb
 xjq/f60DceE0IB1/p7YjzlVaiEbVUgWTg5AFBRAAIgxNffA0+rIDNYDMt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404458596"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="404458596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="521681"
Received: from rbrownex-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.50.122])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:30:49 -0800
Date: Fri, 19 Jan 2024 10:30:46 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZaozNnAGhu6Ec6cb@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Here goes drm-intel-next-fixes for v6.8.

Build warning fix for GCC11, fix for #10071 and DP test pattern fix, one
OA fix for XeHP+.

Regards, Joonas

***

drm-intel-next-fixes-2024-01-19:

- DSI sequence revert to fix GitLab #10071 and DP test-pattern fix
- Drop -Wstringop-overflow (broken on GCC11)
- OA fix on XeHP+

The following changes since commit d505a16e00c35919fd9fe5735894645e0f70a415:

  drm/i915/perf: reconcile Excess struct member kernel-doc warnings (2024-01-10 11:56:58 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2024-01-19

for you to fetch changes up to 84b5ece64477df4394d362d494a2496bf0878985:

  drm/i915: Drop -Wstringop-overflow (2024-01-18 13:04:36 +0200)

----------------------------------------------------------------
- DSI sequence revert to fix GitLab #10071 and DP test-pattern fix
- Drop -Wstringop-overflow (broken on GCC11)
- OA fix on XeHP+

----------------------------------------------------------------
Khaled Almahallawy (1):
      drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern

Lucas De Marchi (1):
      drm/i915: Drop -Wstringop-overflow

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Update handling of MMIO triggered reports

Ville Syrjälä (1):
      Revert "drm/i915/dsi: Do display on sequence later on icl+"

 drivers/gpu/drm/i915/Makefile           |  1 -
 drivers/gpu/drm/i915/display/icl_dsi.c  |  3 +--
 drivers/gpu/drm/i915/display/intel_dp.c |  2 +-
 drivers/gpu/drm/i915/i915_perf.c        | 39 ++++++++++++++++++++++++++++-----
 4 files changed, 36 insertions(+), 9 deletions(-)
