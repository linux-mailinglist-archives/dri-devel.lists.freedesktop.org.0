Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C39F6943
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3910EBD3;
	Wed, 18 Dec 2024 15:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkklhj1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCC10EBD3;
 Wed, 18 Dec 2024 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534134; x=1766070134;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=8xYuX1b/m81+MToorABWpqsMNP8G4KotFVp+IRr6e0U=;
 b=hkklhj1MlyL/J5/aGCn7s9VFKnZpHvUq1OpOeoW2YDPSEw2Bb2dJWNgg
 JBGT3MVQy+wBYnjpHrMaXJRPPaAOvk1IEDJIr2zLVDENpA75oKYOo33gg
 NAH/TQqc6s8EMSg1RIt7ICZK/fjrvgQz45xBZKSaCMGRTUntdEH/W/IjT
 AUMirJ11XAIdrgVLxf7hCP/lOpRIMkhzb8UdHibNl3KOwGzwb22oRxz8o
 SPmpWbboUopK14ZL20rnpJRyBcc/g8vuI5PQK8o6aGMyoJ3NRFQOpQQW5
 xycdVPLKutRkDXt+Lkv9nkg7ug3s0kFG4CLeTaaXxpiPcLA4Da2gZKcND w==;
X-CSE-ConnectionGUID: nKqFAfNqQqeM8LksRW49oA==
X-CSE-MsgGUID: WF5h7sShQZGpgHcjB21Dfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45502449"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45502449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:02:14 -0800
X-CSE-ConnectionGUID: y2GTsNBZQJC8dNT72gzrbw==
X-CSE-MsgGUID: ynthAbogQR2loouRIrHxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025370"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:02:12 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v7 0/4] Display Global Histogram
Date: Wed, 18 Dec 2024 20:22:03 +0530
Message-Id: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPhYmcC/03MQQ7CIBCF4as0sxYCk0pbV97DuKB0akkEmoEaT
 dO7S1y5/JL/vR0ysacMl2YHppfPPsWK7tSAW2x8kPBTNaDCVqPuxbTmIlxPbta9MjiOUNOVafb
 v383tXj1zCqIsTPZvrAZt8Kxaibo1ZugECstblCzDxmX5XH0s9JQuBTiOL69IjfuZAAAA
X-Change-ID: 20241218-dpst-c8ecf18062bb
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Display histogram is a hardware functionality where a statistics for 'n'
number of frames is generated to form a histogram data. This is notified
to the user via histogram event. Compositor will then upon sensing the
histogram event will read the histogram data from KMD via crtc property.
User can use this histogram and apply various equilization techniques to
enhance the image or use this histogram for shaders.

Display ImageEnhancemenT is a hardware that interpolates the LUT value
to generate the enhanced output image. 1DLUT value is to be provided by
the user via crtc property.

One such library Global Histogram Enhancement(GHE) will take the histogram
as input and apply the algorithm to enhance the density and then
return the enhanced LUT factor. This library can be located @
https://github.com/intel/ghe

The corresponding mutter changes to enable/disable histogram, read the
histogram data, communicate with the library and write the enhanced data
back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
The IGT changes for validating the histogram event and reading the
histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/

NOTE: This series includes only the drm core changes and the i915
related patches have been omitted intentionally. Upon getting this drm
core changes reviewed the i915 driver changes utilizing this histogram
and IET LUT properties will be floated.

Test-with: 20240705091333.328322-1-mohammed.thasleem@intel.com

Arun R Murthy (10):
  drm/crtc: Add histogram properties
  drm/crtc: Expose API to create drm crtc property for histogram
  drm/i915/histogram: Define registers for histogram
  drm/i915/histogram: Add support for histogram
  drm/xe: Add histogram support to Xe builds
  drm/i915/histogram: histogram interrupt handling
  drm/i915/display: handle drm-crtc histogram property updates
  drm/i915/histogram: histogram delay counter doesnt reset
  drm/i915/histogram: Histogram changes for Display 20+
  drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c     |   6 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  17 +
 drivers/gpu/drm/drm_crtc.c                    |  30 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  17 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |   4 +
 .../gpu/drm/i915/display/intel_histogram.c    | 380 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  40 ++
 .../drm/i915/display/intel_histogram_regs.h   |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  49 +++
 include/uapi/drm/drm_mode.h                   |  11 +
 16 files changed, 647 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

--
2.25.1

---
Arun R Murthy (4):
      drm: Define histogram structures exposed to user
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm/crtc: Expose API to create drm crtc property for histogram
      drm/crtc: Expose API to create drm crtc property for IET LUT

 drivers/gpu/drm/drm_atomic_state_helper.c |  23 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         |  28 ++++++++
 drivers/gpu/drm/drm_crtc.c                |  97 +++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    |  77 ++++++++++++++++++++++
 include/uapi/drm/drm_mode.h               | 105 ++++++++++++++++++++++++++++++
 5 files changed, 330 insertions(+)
---
base-commit: 78526dfb8799485890dae3877fea308e9501879c
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

