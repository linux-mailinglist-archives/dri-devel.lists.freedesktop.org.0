Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702F3EA79D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 17:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BC86E426;
	Thu, 12 Aug 2021 15:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB956E426;
 Thu, 12 Aug 2021 15:35:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="215107337"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="215107337"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 08:34:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="517497673"
Received: from joelwelx-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.35.232])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 08:34:35 -0700
Date: Thu, 12 Aug 2021 11:34:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <YRU/hnQ1sNr+j37x@intel.com>
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

Hi Dave and Daniel,

Here goes drm-intel-fixes-2021-08-12:

- GVT fix for Windows VM hang.
- Display fix of 12 BPC bits for display 12 and newer.
- Don't try to access some media register for fused off domains.
- Fix kerneldoc build warnings.

Thanks,
Rodrigo.

The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-08-12

for you to fetch changes up to ffd5caa26f6afde0c1e3ed126806607748a83c6e:

  drm/doc/rfc: drop lmem uapi section (2021-08-12 06:05:45 -0400)

----------------------------------------------------------------
- GVT fix for Windows VM hang.
- Display fix of 12 BPC bits for display 12 and newer.
- Don't try to access some media register for fused off domains.
- Fix kerneldoc build warnings.

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/display: Fix the 12 BPC bits for PIPE_MISC reg

Daniel Vetter (1):
      drm/doc/rfc: drop lmem uapi section

Matt Roper (1):
      drm/i915: Only access SFC_DONE when media domain is not fused off

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2021-08-10' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zhenyu Wang (1):
      drm/i915/gvt: Fix cached atomics setting for Windows VM

 Documentation/gpu/rfc/i915_gem_lmem.rst      | 109 ---------------------------
 drivers/gpu/drm/i915/display/intel_display.c |  34 ++++++---
 drivers/gpu/drm/i915/gvt/handlers.c          |   1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c      |   2 +
 drivers/gpu/drm/i915/i915_gpu_error.c        |  19 ++++-
 drivers/gpu/drm/i915/i915_reg.h              |  16 ++--
 6 files changed, 56 insertions(+), 125 deletions(-)
