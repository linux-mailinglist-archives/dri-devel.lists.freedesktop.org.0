Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8457689FADC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A261133E8;
	Wed, 10 Apr 2024 15:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3A4OA0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9FE1133E9;
 Wed, 10 Apr 2024 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761200; x=1744297200;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=A06Aoh/2htv4fF4a/ft01eevutlaCqfCpraDxCla1QQ=;
 b=B3A4OA0iI3wjmad7Ok1D2gLqXICeVvrENttX3c6em/aRzhpR6J5hYykR
 I1kPoRXV3KmGgcnlgvq0QPxJu5+Ax/w0jM4QbCAioPWB8h80QJncTTwk2
 sugIr4Vse+tWtWZKZ0cj9QISn0dwlF0Az9UhwUh8GjS3pyxQbpCChQvQr
 CrZhpccdnFpSQOnH6uNlaDRD7I+0eN/TIo1kWX0xaVAYUgSafvKnevGF3
 Kmwmo4cNvyzq686l7qjmkhnZfABsKv5Ke62uR4WDn0NTilRIt+Zx9zMY1
 u8vGBCZ+01kdtIl+xgU9ODT/XuhI7HHl/JA/S+t8UAAM3yGpFUMDtXA2C A==;
X-CSE-ConnectionGUID: JxVSEDTKQEW2WPuOQxpH+g==
X-CSE-MsgGUID: UX0X6MYfR9efAJalDoM9gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19555580"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19555580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:59:59 -0700
X-CSE-ConnectionGUID: 2GZ1B7ghSqGKQxHN3G+dWA==
X-CSE-MsgGUID: qKHJB+eeQnyDhcOurgj+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20644141"
Received: from ndoolabh-mobl2.ger.corp.intel.com (HELO [10.251.215.97])
 ([10.251.215.97])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:59:54 -0700
Message-ID: <dc690de5-17da-4af6-93a9-8078c99245fd@linux.intel.com>
Date: Wed, 10 Apr 2024 16:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dave, Sima,

Still low amount of patches this week!

Cheers,
~Maarten

drm-misc-next-2024-04-10:
drm-misc-next for v6.10:

Cross-subsystem Changes:
- Add Tomi as Xilinx maintainer.
- Add sound bindings to DT.

Core Changes:
- Make DP helper depend on KMS helper.

Driver Changes:
- Assorted small fixes to bridge/dw-hdmi, bridge/cdns-mhdp8456, xlnx,
   omap, tilcdc, bridge/imx8mp-hdmi-pvi.
- Add debugfs entries to qaic.
- Add conservative fallback to panel eDP.
The following changes since commit d1ef8fc18be6adbbffdee06fbb5b33699e2852be:

   drm: fix DRM_DISPLAY_DP_HELPER dependencies (2024-04-04 16:20:57 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-04-10

for you to fetch changes up to 29b39672bc1d651010f7b61e106d51998f068aaf:

   drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback 
returning void (2024-04-10 15:06:45 +0200)

----------------------------------------------------------------
drm-misc-next for v6.10:

Cross-subsystem Changes:
- Add Tomi as Xilinx maintainer.
- Add sound bindings to DT.

Core Changes:
- Make DP helper depend on KMS helper.

Driver Changes:
- Assorted small fixes to bridge/dw-hdmi, bridge/cdns-mhdp8456, xlnx,
   omap, tilcdc, bridge/imx8mp-hdmi-pvi.
- Add debugfs entries to qaic.
- Add conservative fallback to panel eDP.

----------------------------------------------------------------
Aleksandr Mishin (1):
       drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference

Chen-Yu Tsai (1):
       dt-bindings: display: bridge: it6505: Add #sound-dai-cells

Dan Carpenter (1):
       drm: xlnx: db: fix a memory leak in probe

Douglas Anderson (3):
       drm/panel-edp: Abstract out function to set conservative timings
       drm/panel-edp: If we fail to powerup/get EDID, use conservative 
timings
       drm-panel: If drm_panel_dp_aux_backlight() fails, don't fail 
panel probe

Jani Nikula (1):
       drm: remove unused header gma_drm.h

Jeffrey Hugo (3):
       accel/qaic: Add bootlog debugfs
       accel/qaic: Add fifo size debugfs
       accel/qaic: Add fifo queued debugfs

Krzysztof Kozlowski (1):
       drm/omap: dmm_tiler: drop driver owner assignment

Maxime Ripard (2):
       drm/display: Select DRM_KMS_HELPER for DP helpers
       drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable

Tomi Valkeinen (1):
       MAINTAINERS: Add myself as maintainer for Xilinx DRM drivers

Uwe Kleine-König (1):
       drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback 
returning void

Wolfram Sang (1):
       drm: tilcdc: don't use devm_pinctrl_get_select_default() in probe

  .../bindings/display/bridge/ite,it6505.yaml        |   8 +-
  MAINTAINERS                                        |   1 +
  drivers/accel/qaic/Makefile                        |   2 +
  drivers/accel/qaic/qaic.h                          |   9 +
  drivers/accel/qaic/qaic_data.c                     |   9 +
  drivers/accel/qaic/qaic_debugfs.c                  | 338 
+++++++++++++++++++++
  drivers/accel/qaic/qaic_debugfs.h                  |  20 ++
  drivers/accel/qaic/qaic_drv.c                      |  16 +-
  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   3 +
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   6 +-
  drivers/gpu/drm/bridge/synopsys/Kconfig            |   2 +-
  drivers/gpu/drm/display/Kconfig                    |   1 +
  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   1 -
  drivers/gpu/drm/panel/panel-edp.c                  |  60 ++--
  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   9 +-
  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   6 -
  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   2 +-
  include/drm/gma_drm.h                              |  13 -
  18 files changed, 450 insertions(+), 56 deletions(-)
  create mode 100644 drivers/accel/qaic/qaic_debugfs.c
  create mode 100644 drivers/accel/qaic/qaic_debugfs.h
  delete mode 100644 include/drm/gma_drm.h
