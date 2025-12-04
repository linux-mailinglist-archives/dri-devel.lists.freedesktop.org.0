Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C136CA4F89
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 19:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CAB10E9B5;
	Thu,  4 Dec 2025 18:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnPOXPQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CF210E9AE;
 Thu,  4 Dec 2025 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764873789; x=1796409789;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kS0+xIYDW4uCqa90sLt2/Ms3bVD90W/+NVaOrLOItGY=;
 b=jnPOXPQ4ttcIr8J0vjBsZXN7DHqXgtXUhZhLFzbiYmt6QrSohCNzwW/E
 vOWi/kvSDiOYVdx6j+OcRjl+arD37MD2XYKF8ZFx9w+UF4+MLBy9M/Nn9
 dPjG/GchDx6M76e1QiGVKre7L7zLSE432rNKYvkI6a6Np1Z3LEKnove3b
 xl8krg+i0D18lnpX5aezHVo59UuiXPwjkhWxFz/F1iRU9/YYJhqcN6P5O
 hz5n+mTYxhW3xDRc43VcrjZ4MySnIVoHvv8guzHj1+PKwkrNJ+bkb+NSO
 kojNfKB9oxygUUz2sOAwda0kub/AgFaOuvsJmFxB01upAq8b4P2HP8RSB g==;
X-CSE-ConnectionGUID: /rkYsPpeQ1OY9YH6p4FbTg==
X-CSE-MsgGUID: 0ZxEWXiRRae43ZkFO5LTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77227298"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="77227298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:43:08 -0800
X-CSE-ConnectionGUID: 1Qw9mYmOTiuLbLUi1t2Vhw==
X-CSE-MsgGUID: +RikuINhQqGWozXNQbUTng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194131395"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:43:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, "Shankar, Uma" <uma.shankar@intel.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: [PULL] topic/drm-intel-plane-color-pipeline for v6.19
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 04 Dec 2025 20:42:58 +0200
Message-ID: <e7129c6afd6208719d2f5124da86e810505e7a7b@intel.com>
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


Hi Dave & Sima -

Similar to the late drm-misc-next pull request [1] for the color
pipeline support, here's the implementation for i915 and xe display, in
a topic branch based on drm-next.

BR,
Jani.


[1] https://lore.kernel.org/r/aa5cbd50-7676-4a59-bbed-e8428af86804@linux.intel.com


topic/drm-intel-plane-color-pipeline-2025-12-04:
drm/i915 topic pull request for v6.19:

Features and functionality:
- Add plane color management support (Uma, Chaitanya)

BR,
Jani.

The following changes since commit 0692602defb0c273f80dec9c564ca50726404aca:

  Merge tag 'amd-drm-next-6.19-2025-12-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-12-03 09:43:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/topic/drm-intel-plane-color-pipeline-2025-12-04

for you to fetch changes up to 860daa4b0d09a398a0ac9ae6fe67efd73a275968:

  drm/i915/color: Enable Plane Color Pipelines (2025-12-04 19:44:36 +0200)

----------------------------------------------------------------
drm/i915 topic pull request for v6.19:

Features and functionality:
- Add plane color management support (Uma, Chaitanya)

----------------------------------------------------------------
Chaitanya Kumar Borah (8):
      drm/i915/display: Add identifiers for driver specific blocks
      drm/i915: Add intel_color_op
      drm/i915/color: Add helper to create intel colorop
      drm/i915/color: Create a transfer function color pipeline
      drm/i915/color: Add framework to program CSC
      drm/i915/color: Preserve sign bit when int_bits is Zero
      drm/i915/color: Add registers for 3D LUT
      drm/i915/color: Add 3D LUT to color pipeline

Uma Shankar (7):
      drm/i915/color: Add plane CTM callback for D12 and beyond
      drm/i915: Add register definitions for Plane Degamma
      drm/i915: Add register definitions for Plane Post CSC
      drm/i915/color: Add framework to program PRE/POST CSC LUT
      drm/i915/color: Program Pre-CSC registers
      drm/i915/color: Program Plane Post CSC Registers
      drm/i915/color: Enable Plane Color Pipelines

 drivers/gpu/drm/i915/Makefile                      |   2 +
 drivers/gpu/drm/i915/display/intel_color.c         | 335 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h         |   8 +-
 .../gpu/drm/i915/display/intel_color_pipeline.c    |  99 ++++++
 .../gpu/drm/i915/display/intel_color_pipeline.h    |  14 +
 drivers/gpu/drm/i915/display/intel_color_regs.h    |  29 ++
 drivers/gpu/drm/i915/display/intel_colorop.c       |  35 +++
 drivers/gpu/drm/i915/display/intel_colorop.h       |  15 +
 drivers/gpu/drm/i915/display/intel_display.c       |   5 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |   9 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   9 +
 drivers/gpu/drm/i915/display/intel_plane.c         |  55 ++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  21 ++
 .../drm/i915/display/skl_universal_plane_regs.h    | 115 +++++++
 drivers/gpu/drm/xe/Makefile                        |   2 +
 15 files changed, 751 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.h

-- 
Jani Nikula, Intel
