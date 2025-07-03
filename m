Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882C4AF7B9D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41EC10E88A;
	Thu,  3 Jul 2025 15:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tf9wWHQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4CF10E889;
 Thu,  3 Jul 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751556386; x=1783092386;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=voYn5qVjc/VwZhvemL2kIaswrJz6T+cj0tPn2nmvmTc=;
 b=Tf9wWHQp4L3FzmSGGNS1oAqjfUuRps9xv6jKHRGpCPXC2zH12xuyCc46
 kGVlXE3m4mh1yAnFhjywqYJaWuderH8NDMo7Crmcq6V2c1h6mZu5R+6JN
 FmkMU+6FJ+/15xZ2P/dCuoQoyfS2RCxGD0W5a/3BIG6T1NNg+ImPk4oJB
 lC48nrRSR5ziDfUikxINe9eLjBaT0RM+BH6E/BfN1TZd4c/6dnrkEGnrs
 gX8zmpFf6b7CzpNAJqR5x6Y2IlCfqtAonhVy18XD+ugt+5Ix4kUvfl3/e
 y/hPqm5tSTn2pQbH+1P6ok+vbd2KAepDtD7SyyE67QpqF7IAju7iSdJ00 w==;
X-CSE-ConnectionGUID: NYVVwvuXQHifafIRP5chxg==
X-CSE-MsgGUID: /G8L3cEjQ9Sri3MblqBQ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53755121"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53755121"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:26:25 -0700
X-CSE-ConnectionGUID: nc5xyh3iSj69UX3kT1tv3g==
X-CSE-MsgGUID: wRYTVSsOSnykvQTIINsGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154966864"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:26:22 -0700
Message-ID: <a7461418-08dc-4b7c-b2fa-264155f66d5e@linux.intel.com>
Date: Thu, 3 Jul 2025 17:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Fixes for rc5. :-)

Kind regards,
~Maarten

drm-misc-fixes-2025-07-03:
drm-misc-fixes for v6.16-rc5:
- Replace simple panel lookup hack with proper fix.
- nullpointer deref in vesadrm fix.
- fix dma_resv_wait_timeout.
- fix error handling in ttm_buffer_object_transfer.
- bridge fixes.
- Fix vmwgfx accidentally allocating encrypted memory.
- Fix race in spsc_queue_push()
- Add refcount on backing GEM objects during fb creation.
- Fix v3d irq's being enabled during gpu reset.
The following changes since commit 55e8ff842051b1150461d7595d8f1d033c69d66b:

  drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type (2025-06-25 07:49:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-07-03

for you to fetch changes up to 226862f50a7a88e4e4de9abbf36c64d19acd6fd0:

  drm/v3d: Disable interrupts before resetting the GPU (2025-07-02 19:08:11 -0300)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc5:
- Replace simple panel lookup hack with proper fix.
- nullpointer deref in vesadrm fix.
- fix dma_resv_wait_timeout.
- fix error handling in ttm_buffer_object_transfer.
- bridge fixes.
- Fix vmwgfx accidentally allocating encrypted memory.
- Fix race in spsc_queue_push()
- Add refcount on backing GEM objects during fb creation.
- Fix v3d irq's being enabled during gpu reset.

----------------------------------------------------------------
Christian König (2):
      dma-buf: fix timeout handling in dma_resv_wait_timeout v2
      drm/ttm: fix error handling in ttm_buffer_object_transfer

Dmitry Baryshkov (2):
      drm/bridge: panel: move prepare_prev_first handling to drm_panel_bridge_add_typed
      drm/bridge: aux-hpd-bridge: fix assignment of the of_node

Marko Kiiskila (1):
      drm/vmwgfx: Fix guests running with TDX/SEV

Matthew Brost (1):
      drm/sched: Increment job count before swapping tail spsc queue

Maxime Ripard (5):
      drm/mipi-dsi: Add dev_is_mipi_dsi function
      drm/panel: panel-simple: make panel_dpi_probe return a panel_desc
      drm/panel: panel-simple: Make panel_simple_probe return its panel
      drm/panel: panel-simple: Add function to look panel data up
      drm/panel: panel-simple: get rid of panel_dpi hack

Maíra Canal (1):
      drm/v3d: Disable interrupts before resetting the GPU

Thomas Zimmermann (2):
      drm/vesadrm: Avoid NULL-ptr deref in vesadrm_pmi_cmap_write()
      drm/gem: Acquire references on GEM handles for framebuffers

 drivers/dma-buf/dma-resv.c                   |  12 ++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c      |   3 +-
 drivers/gpu/drm/bridge/panel.c               |   5 +-
 drivers/gpu/drm/drm_gem.c                    |  44 ++++++++-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  16 ++--
 drivers/gpu/drm/drm_internal.h               |   2 +
 drivers/gpu/drm/drm_mipi_dsi.c               |   3 +-
 drivers/gpu/drm/panel/panel-simple.c         | 132 +++++++++++++++++----------
 drivers/gpu/drm/sysfb/vesadrm.c              |  13 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c            |  13 +--
 drivers/gpu/drm/v3d/v3d_drv.h                |   8 ++
 drivers/gpu/drm/v3d/v3d_gem.c                |   2 +
 drivers/gpu/drm/v3d/v3d_irq.c                |  37 ++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   2 +-
 include/drm/drm_mipi_dsi.h                   |   3 +
 include/drm/spsc_queue.h                     |   4 +-
 16 files changed, 205 insertions(+), 94 deletions(-)
