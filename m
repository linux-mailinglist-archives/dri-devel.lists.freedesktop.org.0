Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8457AC04F8
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71310EF18;
	Thu, 22 May 2025 06:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko2ZRKEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E310E715;
 Thu, 22 May 2025 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747897161; x=1779433161;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=EaJTGfLSy5tBF5KqdT9Pas9+R9VheerSann76xC34oY=;
 b=ko2ZRKEwhS10NhK+G0BaOCDh7l+d+FBX6LEirnv4G1R32B5hCMYMQP75
 FkXG2OFCJykZXox4t+AtGpceQjIfqpVv2sYQ7MHUYmZTx0aVm2BnJ8Ksi
 tZfHiJc99GBL2XZs2BB/C2UCDmOsTdc6YEQQ+1AoaVMBAM+/JiGV7i3wl
 gskJR70eNYHEQpRVwlW2ZMO2nIoHH6GhLDAtebu8SR7HbecD1zhw1Tov2
 pgTcjvtE80KGJ+eCskPVORrtzFyRfRVUFoGaJqPOO1k7TIJWLGOOx3+xA
 o4YBPzhlfkw4hEUWEBerd8GSsMfqW1+duVErbZDES8pFcPmdQ14szobkl g==;
X-CSE-ConnectionGUID: xCfnZ5tTTqGhxMMtEIH13A==
X-CSE-MsgGUID: +FEkhHXVRwuOrgxlxLp/UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60954643"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60954643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 23:59:20 -0700
X-CSE-ConnectionGUID: HTA9Y1E6S26QqTNPiK+HUw==
X-CSE-MsgGUID: 5MhUpty7RZirO0QwejX6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140975294"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 23:59:16 -0700
Date: Thu, 22 May 2025 09:59:13 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes
Message-ID: <aC7LQUtxXKgOVTVt@jlahtine-mobl>
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

Hi Dave & Sima,

Here goes another drm-intel-next-fixes PR towards 6.16-rc1.

Thunderbolt disconnect fix for MTL/ARL/LNL, DDI port clock fix for PTL+ and WQ
allocation error check for display init code.

Regards, Joonas

PS. CI results were for one patch more, which I reverted during review
of the automation picked patches, but results should still be valid.

***

drm-intel-next-fixes-2025-05-22:

- Fix for Thunderbolt sink disconnect on MTL/ARL/LNL
- Fix for DDI port clock select mask on PTL+
- Add error checks for alloc_ordered_workqueue() and alloc_workqueue() in display

The following changes since commit c4f8ac095fc91084108ec21117eb9c1fff64725d:

  Merge tag 'nova-next-v6.16-2025-05-20' of https://gitlab.freedesktop.org/drm/nova into drm-next (2025-05-21 05:49:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-05-22

for you to fetch changes up to f4c7baa0699b69edb6887a992283b389761e0e81:

  drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue() (2025-05-22 09:25:57 +0300)

----------------------------------------------------------------
- Fix for Thunderbolt sink disconnect on MTL/ARL/LNL
- Fix for DDI port clock select mask on PTL+
- Add error checks for alloc_ordered_workqueue() and alloc_workqueue() in display

----------------------------------------------------------------
Haoxiang Li (1):
      drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue()

Imre Deak (2):
      drm/i915/ptl: Use everywhere the correct DDI port clock select mask
      drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read

 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 27 ++++++++-----------
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  | 15 ++++++++---
 .../gpu/drm/i915/display/intel_display_driver.c    | 30 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.c            | 17 ++++++++++++
 4 files changed, 63 insertions(+), 26 deletions(-)
