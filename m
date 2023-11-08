Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFB7E5849
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A1F10E76A;
	Wed,  8 Nov 2023 14:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56110E769;
 Wed,  8 Nov 2023 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699452262; x=1730988262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OQXd+4A0w+JEXnh2fy0cwHh2h1EnDbHpdtdbyL/M5j8=;
 b=N6Be2qXfGoAMEi4ss3nlhFwCAT/P+WZPTGwJGbt+xDf0uBiVDNP2asZ9
 sz5Fm6YDI21mYlV9nm1U5dnV55HcFFFEm9XTcZXlrslxR0Cx578S7+FNj
 8EgLsk+/jDSZc4RupD+vANZQfNeC+ob013iyUv+FCBdUhnai7JVXiZv2s
 4JTGTyRvf4ENYi3dQXhV2nGaT4t8d4TtURJ2wV961SdZ3pNsGpqBcy3Kc
 eE21mcnsQPoWuSpCjkKWFwfIgwpV5zqNzR6FK9Ob2onCVk2XzT14mMlSz
 GXU+rgL2tdIX1u5MpwfBKTXTfgPNwdJMNkedU0UL9DHaQJGNFK56TK6RY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380164865"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="380164865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 06:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4196622"
Received: from vseredyx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.119])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 06:04:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 08 Nov 2023 16:04:14 +0200
Message-ID: <878r78xrxd.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

I see Dave already sent the pull request for v6.7-rc1 fixes, but here's
some more.

drm-intel-next-fixes-2023-11-08:
drm/i915 fixes for v6.7-rc1:
- Fix null dereference when perf interface is not available
- Fix a -Wstringop-overflow warning
- Fix a -Wformat-truncation warning in intel_tc_port_init
- Flush WC GGTT only on required platforms
- Fix MTL HBR3 rate support on C10 phy and eDP
- Fix MTL notify_guc for multi-GT
- Bump GLK CDCLK frequency when driving multiple pipes
- Fix potential spectre vulnerability

BR,
Jani.

The following changes since commit 5258dfd4a6adb5f45f046b0dd2e73c680f880d9d:

  usb: typec: altmodes/displayport: fixup drm internal api change vs new us=
er. (2023-10-27 07:55:41 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
3-11-08

for you to fetch changes up to 9506fba463fcbdf8c8b7af3ec9ee34360df843fe:

  drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init (2023-11-06 14=
:42:58 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc1:
- Fix null dereference when perf interface is not available
- Fix a -Wstringop-overflow warning
- Fix a -Wformat-truncation warning in intel_tc_port_init
- Flush WC GGTT only on required platforms
- Fix MTL HBR3 rate support on C10 phy and eDP
- Fix MTL notify_guc for multi-GT
- Bump GLK CDCLK frequency when driving multiple pipes
- Fix potential spectre vulnerability

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i915/mtl: avoid stringop-overflow warning

Chaitanya Kumar Borah (1):
      drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL

Harshit Mogalapalli (1):
      i915/perf: Fix NULL deref bugs with drm_dbg() calls

Kunwu Chan (1):
      drm/i915: Fix potential spectre vulnerability

Nirmoy Das (3):
      drm/i915: Flush WC GGTT only on required platforms
      drm/i915/mtl: Apply notify_guc to all GTs
      drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Bump GLK CDCLK frequency when driving multiple pipes

 drivers/gpu/drm/i915/display/intel_cdclk.c  | 12 ++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c     | 11 ++++++---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c        | 35 ++++++++++++++++++++-----=
----
 drivers/gpu/drm/i915/gt/intel_rc6.c         | 16 ++++++++-----
 drivers/gpu/drm/i915/i915_debugfs_params.c  |  9 +++++---
 drivers/gpu/drm/i915/i915_perf.c            | 15 +++----------
 8 files changed, 65 insertions(+), 36 deletions(-)

--=20
Jani Nikula, Intel
