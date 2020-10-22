Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCB296637
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 22:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEBD6E250;
	Thu, 22 Oct 2020 20:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5611D6E24D;
 Thu, 22 Oct 2020 20:54:36 +0000 (UTC)
IronPort-SDR: jhnxwNKkeieGJwNELgg8K1W1YPxU5gQbE0Ip0ORpxNY3j2T05sewjbEV05+EuOgDy8W4mItaOy
 3RnlhoDReLvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="155377271"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="155377271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 13:54:35 -0700
IronPort-SDR: 3Tpqp/yAFjqjBMIKGg19ESYxLe6Kj5o0492FcPVK/KcX8JD+gBYbwh7gwX1XbONp2tG/uhnpti
 VoiSLsy1W5Og==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="316859993"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 13:54:35 -0700
Date: Thu, 22 Oct 2020 16:56:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20201022205613.GA3469192@intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here is probably the last drm-intel-next-fixes before -rc1.

This includes a few patches from dinq and a bunch from drm-intel-gt-next.

drm-intel-next-fixes-2020-10-22:
- Tweak initia DPCD backlight.enabled value (Sean)
- Initialize reserved MOCS indices (Ayaz)
- Mark initial fb obj as WT on eLLC machines to avoid rcu lockup (Ville)
- Support parsing of oversize batches (Chris)
- Delay execlists processing for TGL (Chris)
- Use the active reference on the vma during error capture (Chris)
- Widen CSB pointer (Chris)
- Wait for CSB entries on TGL (Chris)
- Fix unwind for scratch page allocation (Chris)
- Exclude low patches of stolen memory (Chris)
- Force VT'd workarounds when running as a guest OS (Chris)
- Drop runtime-pm assert from vpgu io accessors (Chris)
The following changes since commit 214bba50616f65264dfc30d095daef3ab7500f52:

  drm/i915: Set all unused color plane offsets to ~0xfff again (2020-10-12 =
14:23:22 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-10-22

for you to fetch changes up to 5c6c13cd1102caf92d006a3cf4591c0229019daf:

  drm/i915: Drop runtime-pm assert from vgpu io accessors (2020-10-21 08:32=
:32 -0400)

----------------------------------------------------------------
- Tweak initia DPCD backlight.enabled value (Sean)
- Initialize reserved MOCS indices (Ayaz)
- Mark initial fb obj as WT on eLLC machines to avoid rcu lockup (Ville)
- Support parsing of oversize batches (Chris)
- Delay execlists processing for TGL (Chris)
- Use the active reference on the vma during error capture (Chris)
- Widen CSB pointer (Chris)
- Wait for CSB entries on TGL (Chris)
- Fix unwind for scratch page allocation (Chris)
- Exclude low patches of stolen memory (Chris)
- Force VT'd workarounds when running as a guest OS (Chris)
- Drop runtime-pm assert from vpgu io accessors (Chris)

----------------------------------------------------------------
Ayaz A Siddiqui (1):
      drm/i915/gt: Initialize reserved and unspecified MOCS indices

Chris Wilson (10):
      drm/i915/gem: Support parsing of oversize batches
      drm/i915/gt: Delay execlist processing for tgl
      drm/i915/gt: Undo forced context restores after trivial preemptions
      drm/i915: Use the active reference on the vma while capturing
      drm/i915/gt: Widen CSB pointer to u64 for the parsers
      drm/i915/gt: Wait for CSB entries on Tigerlake
      drm/i915/gt: Onion unwind for scratch page allocation failure
      drm/i915: Exclude low pages (128KiB) of stolen from use
      drm/i915: Force VT'd workarounds when running as a guest OS
      drm/i915: Drop runtime-pm assert from vgpu io accessors

Sean Paul (1):
      drm/i915/dp: Tweak initial dpcd backlight.enabled value

Ville Syrj=E4l=E4 (1):
      drm/i915: Mark ininitial fb obj as WT on eLLC machines to avoid rcu l=
ockup during fbdev init

 drivers/gpu/drm/i915/Kconfig.debug                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   8 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  31 ++--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   2 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  18 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  58 +++---
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  16 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           | 196 +++++++++++++++++=
++++
 drivers/gpu/drm/i915/i915_drv.h                    |   6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   3 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  27 ++-
 15 files changed, 334 insertions(+), 53 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
