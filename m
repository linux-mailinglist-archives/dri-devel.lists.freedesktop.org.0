Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60EA20DE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D4910E69C;
	Tue, 28 Jan 2025 16:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMzvlPMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFB910E6AA;
 Tue, 28 Jan 2025 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080357; x=1769616357;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=IOVoO/pdcHwCKv4nJWU2Kmv7EtDbSQiHM3B2/jPzbig=;
 b=cMzvlPMJBmJJeuEzSqlNt+TamRcG7axpVTiWS3kCGfPL34zmfy5FGZBY
 SWT3LZ+sZ6ObQZBNOoeJFrlgM8L4BwavM52cAFvXeRlGxi2gy1wtZEdSd
 JmuShlB5Sa2p/fT8UtXkjp06dknPmM21FCp8SlMB144/uyvdigkVztDvO
 YibHaCUQdcYbmL2UwDEq3kwI2m6u2DNwqvj4b36gubSLypq6dlpmmQt9B
 qD1BLhKCVIUIwfyylIUghAA4b/HQBsBAoSvHxhxqyrndJBcOtv0BKh1M6
 GEdWdrrzvN2TRA3sAMZfHZJvB70X6iaEXtFOEE/d/1C9hRa+S9EcCj/Ty Q==;
X-CSE-ConnectionGUID: 6kNr29PMQ16dEtjQ+vfRyA==
X-CSE-MsgGUID: Xuf1K2HJQO2COPBKSQ2bTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38744990"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38744990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:05:56 -0800
X-CSE-ConnectionGUID: bKBk3d0mRISAjX+WPpxWSw==
X-CSE-MsgGUID: dPgajHOhQ3iVfVKPBhW8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976873"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:05:54 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v8 00/14] Display Global Histogram
Date: Tue, 28 Jan 2025 21:21:06 +0530
Message-Id: <20250128-dpst-v8-0-871b94d777f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOv8mGcC/03MQQ7CIBCF4as0sxYCk4rUVe9hXFA6WBJLm4EaT
 dO7S1y5/JL/vR0ycaQM12YHplfMcUkV9tSAn1x6kIhjNaDCVqO2YlxzEd6SD9oqg8MANV2ZQnz
 /bm736sDLLMrE5P7GqtMGz6qVqFtjuotA4XhLkuW8cZk+fUyFntIvMxzHF1t4jo2ZAAAA
X-Change-ID: 20241218-dpst-c8ecf18062bb
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
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

NOTE: i915 driver changes for histogram and IET LUT is not fully tested
and the series is pushed to get the inital feel of the histogram/IET LUT
usage as well as to get started with the review.

---
Arun R Murthy (14):
      drm: Define histogram structures exposed to user
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm/crtc: Expose API to create drm crtc property for histogram
      drm/crtc: Expose API to create drm crtc property for IET LUT
      drm/i915/histogram: Define registers for histogram
      drm/i915/histogram: Add support for histogram
      drm/xe: Add histogram support to Xe builds
      drm/i915/histogram: histogram interrupt handling
      drm/i915/histogram: Hook i915 histogram with drm histogram
      drm/i915/iet: Add support to writing the IET LUT data
      drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
      drm/i915/histogram: histogram delay counter doesnt reset
      drm/i915/histogram: Histogram changes for Display 20+
      drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c          |  23 ++
 drivers/gpu/drm/drm_atomic_uapi.c                  |  28 ++
 drivers/gpu/drm/drm_crtc.c                         | 127 +++++++
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |  10 +
 drivers/gpu/drm/i915/display/intel_display.c       |  14 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_histogram.c     | 396 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  55 +++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h                    |   5 +-
 drivers/gpu/drm/xe/Makefile                        |   1 +
 include/drm/drm_crtc.h                             |  80 +++++
 include/uapi/drm/drm_mode.h                        | 109 ++++++
 15 files changed, 929 insertions(+), 3 deletions(-)
---
base-commit: 78526dfb8799485890dae3877fea308e9501879c
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (14):
      drm: Define histogram structures exposed to user
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm/crtc: Expose API to create drm crtc property for histogram
      drm/crtc: Expose API to create drm crtc property for IET LUT
      drm/i915/histogram: Define registers for histogram
      drm/i915/histogram: Add support for histogram
      drm/xe: Add histogram support to Xe builds
      drm/i915/histogram: histogram interrupt handling
      drm/i915/histogram: Hook i915 histogram with drm histogram
      drm/i915/iet: Add support to writing the IET LUT data
      drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
      drm/i915/histogram: histogram delay counter doesnt reset
      drm/i915/histogram: Histogram changes for Display 20+
      drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c          |  23 ++
 drivers/gpu/drm/drm_atomic_uapi.c                  |  28 ++
 drivers/gpu/drm/drm_crtc.c                         | 127 +++++++
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |  10 +
 drivers/gpu/drm/i915/display/intel_display.c       |  14 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_histogram.c     | 404 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  55 +++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h                    |   5 +-
 drivers/gpu/drm/xe/Makefile                        |   1 +
 include/drm/drm_crtc.h                             |  80 ++++
 include/uapi/drm/drm_mode.h                        | 133 +++++++
 15 files changed, 961 insertions(+), 3 deletions(-)
---
base-commit: 006a892140827b356eb4ad5a5e9b947477791ba8
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

