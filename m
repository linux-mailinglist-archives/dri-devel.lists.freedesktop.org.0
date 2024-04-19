Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBC8AAE03
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55310FE78;
	Fri, 19 Apr 2024 12:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+D6gFo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10C10FE74;
 Fri, 19 Apr 2024 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713528291; x=1745064291;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=Y4ugQu162skNa2CXa1ef9rRF6qiDsJYjM2CVwE51uJ4=;
 b=S+D6gFo+j/5HEq0OMCQB9ZMkutGk4WaA6SojWrH1qV4kXTm9+xykEGGW
 TuIH2fAlq6i9bY4b7ILed5jLWx05ppHkBgo7Emmx4GMkYyiDYfzf8jCBS
 7aWa42dja+Ev80Yx+xdyb67ZwFAU+IKfQq40OYGWUTGza1VHvtqKBGJMG
 ZwZwOqUHQvZ/7k2umFaiAPWylVjQkZGuZ7ISyIwfdYsumxjSa/bENFcT+
 LxD217tMLZTlLbWudJkPCc9NpknxWax2/uMzCqARx3ziOdE6TT65fmrb4
 CxGBeMQ1t571B/Q/pZsFwjbQYElwSIcCv3Qzvse7xMxqJSpUzXHkf1q2i w==;
X-CSE-ConnectionGUID: VW+k2KkoR+6FHi5xqtou2g==
X-CSE-MsgGUID: JfEjBfrJR2qFEQ3vinsMTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8985779"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8985779"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:04:49 -0700
X-CSE-ConnectionGUID: JSL2LKOZR/OX6Lf6ovEdHQ==
X-CSE-MsgGUID: BGFhPvoDRKmYJnE/oSsnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23180285"
Received: from mandrei-mobl.ger.corp.intel.com (HELO [10.249.39.10])
 ([10.249.39.10])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:04:43 -0700
Message-ID: <2dc1b7c6-1743-4ddd-ad42-36f700234fbe@linux.intel.com>
Date: Fri, 19 Apr 2024 14:04:56 +0200
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
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

Bit late, but with slightly more content.

Cheers,
~Maarten

drm-misc-next-2024-04-19:
drm-misc-next for v6.10-rc1:

UAPI Changes:
- Add SIZE_HINTS property for cursor planes.

Cross-subsystem Changes:

Core Changes:
- Document the requirements and expectations of adding new
   driver-specific properties.
- Assorted small fixes to ttm.
- More Kconfig fixes.
- Add struct drm_edid_product_id and helpers.
- Use drm device based logging in more drm functions.
- Fixes for drm-panic, and option to test it.
- Assorted small fixes and updates to edid.
- Add drm_crtc_vblank_crtc and use it in vkms, nouveau.

Driver Changes:
- Assorted small fixes and improvements to bridge/imx8mp-hdmi-tx, 
nouveau, ast, qaic, lima, vc4, bridge/anx7625, mipi-dsi.
- Add drm panic to simpledrm, mgag200, imx, ast.
- Use dev_err_probe in bridge/panel drivers.
- Add Innolux G121X1-L03, LG sw43408 panels.
- Use struct drm_edid in i915 bios parsing.
The following changes since commit 29b39672bc1d651010f7b61e106d51998f068aaf:

   drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback 
returning void (2024-04-10 15:06:45 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-04-19

for you to fetch changes up to 069a6c0e94f99437652dbb7229a56233c7d39968:

   drm: panel: Add LG sw43408 panel driver (2024-04-19 04:27:48 +0300)

----------------------------------------------------------------
drm-misc-next for v6.10-rc1:

UAPI Changes:
- Add SIZE_HINTS property for cursor planes.

Cross-subsystem Changes:

Core Changes:
- Document the requirements and expectations of adding new
   driver-specific properties.
- Assorted small fixes to ttm.
- More Kconfig fixes.
- Add struct drm_edid_product_id and helpers.
- Use drm device based logging in more drm functions.
- Fixes for drm-panic, and option to test it.
- Assorted small fixes and updates to edid.
- Add drm_crtc_vblank_crtc and use it in vkms, nouveau.

Driver Changes:
- Assorted small fixes and improvements to bridge/imx8mp-hdmi-tx, 
nouveau, ast, qaic, lima, vc4, bridge/anx7625, mipi-dsi.
- Add drm panic to simpledrm, mgag200, imx, ast.
- Use dev_err_probe in bridge/panel drivers.
- Add Innolux G121X1-L03, LG sw43408 panels.
- Use struct drm_edid in i915 bios parsing.

----------------------------------------------------------------
Aleksandr Mishin (1):
       drm: vc4: Fix possible null pointer dereference

Arnd Bergmann (2):
       accel/qaic: mark debugfs stub functions as static inline
       drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2

Baruch Siach (1):
       doc: dma-buf: fix grammar typo

Daniel Vetter (1):
       drm/panic: Add drm panic locking

Dmitry Baryshkov (2):
       drm/mipi-dsi: use correct return type for the DSC functions
       drm/mipi-dsi: add mipi_dsi_compression_mode_ext()

Erico Nunes (5):
       drm/lima: add mask irq callback to gp and pp
       drm/lima: include pp bcast irq in timeout handler check
       drm/lima: mask irqs in timeout path before hard reset
       drm/lima: fix shared irq handling on driver remove
       drm/lima: fix void pointer to enum lima_gpu_id cast warning

Hsin-Te Yuan (1):
       drm/bridge: anx7625: Update audio status while detecting

Huai-Yuan Liu (1):
       drm/arm/malidp: fix a possible null pointer dereference

Jani Nikula (18):
       drm/edid: add drm_edid_get_product_id()
       drm/edid: add drm_edid_print_product_id()
       drm/i915/bios: switch to struct drm_edid and struct 
drm_edid_product_id
       drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()
       drm/probe-helper: switch to drm device based logging
       drm/modes: switch to drm device based error logging
       drm/sysfs: switch to drm device based logging
       drm/client: switch to drm device based logging, and more
       drm/crtc: switch to drm device based logging
       drm/crtc-helper: switch to drm device based logging and warns
       drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()
       drm/displayid: move drm_displayid.h to drm_displayd_internal.h
       drm/edid: move all internal declarations to drm_crtc_internal.h
       drm/edid: group struct drm_edid based declarations together
       drm/edid: rename drm_find_edid_extension() to 
drm_edid_find_extension()
       drm/edid: avoid drm_edid_find_extension() internally
       drm/edid: make drm_edid_are_equal() static
       drm/edid: make drm_edid_are_equal() more convenient for its 
single user

Jeffrey Hugo (1):
       accel/qaic: Add Sahara implementation for firmware loading

Jesse Zhang (1):
       drm/ttm: remove unused paramter

Jocelyn Falempe (9):
       drm/panic: Add a drm panic handler
       drm/panic: Add support for color format conversion
       drm/panic: Add debugfs entry to test without triggering panic.
       drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
       drm/simpledrm: Add drm_panic support
       drm/mgag200: Add drm_panic support
       drm/imx: Add drm_panic support
       drm/ast: Add drm_panic support
       drm/fb_dma: Fix parameter name in htmldocs

Lyude Paul (2):
       drm/nouveau/kms/nv50-: Disable AUX bus for disconnected DP ports
       drm/nouveau/dp: Don't probe eDP ports twice harder

Marek Vasut (4):
       dt-bindings: display: simple: Document support for Innolux 
G121XCE-L01
       drm/panel: simple: Add missing Innolux G121X1-L03 format, flags, 
connector
       drm/panel: simple: Convert Innolux G121X1-L03 to display_timing
       drm/panel: simple: Add Innolux G121XCE-L01 LVDS display support

Maíra Canal (1):
       drm/fb_dma: 
s/drm_panic_gem_get_scanout_buffer/drm_fb_dma_get_scanout_buffer

Nícolas F. R. A. Prado (9):
       drm/bridge: anx7625: Don't log an error when DSI host can't be found
       drm/bridge: icn6211: Don't log an error when DSI host can't be found
       drm/bridge: lt8912b: Don't log an error when DSI host can't be found
       drm/bridge: lt9611: Don't log an error when DSI host can't be found
       drm/bridge: lt9611uxc: Don't log an error when DSI host can't be 
found
       drm/bridge: tc358775: Don't log an error when DSI host can't be found
       drm/bridge: dpc3433: Don't log an error when DSI host can't be found
       drm/panel: novatek-nt35950: Don't log an error when DSI host 
can't be found
       drm/panel: truly-nt35597: Don't log an error when DSI host can't 
be found

Sebastian Wick (1):
       drm: Document requirements for driver-specific KMS props in new 
drivers

Sumit Semwal (2):
       dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
       drm: panel: Add LG sw43408 panel driver

Thomas Zimmermann (3):
       drm/ast: Set DDC timeout in milliseconds
       drm/ast: Group DDC init code by data structure
       drm/ast: Define struct ast_ddc in ast_ddc.c

Tvrtko Ursulin (1):
       dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS

Uwe Kleine-König (1):
       drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback 
returning void

Ville Syrjälä (5):
       drm: Introduce plane SIZE_HINTS property
       drm/i915: Add SIZE_HINTS property for cursors
       drm/vblank: Introduce drm_crtc_vblank_crtc()
       drm/nouveau: Use drm_crtc_vblank_crtc()
       drm/vkms: Use drm_crtc_vblank_crtc()

Zack Rusin (2):
       drm/vmwgfx: Implement virtual kms
       drm/vmwgfx: Implement virtual crc generation

  .../bindings/display/panel/lg,sw43408.yaml         |  62 ++
  .../bindings/display/panel/panel-simple.yaml       |   2 +
  Documentation/driver-api/dma-buf.rst               |   2 +-
  Documentation/gpu/drm-kms.rst                      |  22 +
  MAINTAINERS                                        |   8 +
  drivers/accel/qaic/Makefile                        |   3 +-
  drivers/accel/qaic/qaic_debugfs.h                  |   6 +-
  drivers/accel/qaic/qaic_drv.c                      |  10 +
  drivers/accel/qaic/sahara.c                        | 449 +++++++++++++++
  drivers/accel/qaic/sahara.h                        |  10 +
  drivers/dma-buf/dma-buf.c                          |  56 +-
  drivers/gpu/drm/Kconfig                            |  32 ++
  drivers/gpu/drm/Makefile                           |   1 +
  drivers/gpu/drm/arm/malidp_mw.c                    |   5 +-
  drivers/gpu/drm/ast/ast_ddc.c                      |  30 +-
  drivers/gpu/drm/ast/ast_ddc.h                      |  13 +-
  drivers/gpu/drm/ast/ast_mode.c                     |  26 +-
  drivers/gpu/drm/bridge/analogix/Kconfig            |   2 +-
  drivers/gpu/drm/bridge/analogix/anx7625.c          |  15 +-
  drivers/gpu/drm/bridge/chipone-icn6211.c           |   6 +-
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   6 +-
  drivers/gpu/drm/bridge/lontium-lt8912b.c           |   6 +-
  drivers/gpu/drm/bridge/lontium-lt9611.c            |   6 +-
  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   6 +-
  drivers/gpu/drm/bridge/tc358775.c                  |   6 +-
  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  17 +-
  drivers/gpu/drm/drm_atomic_helper.c                |   4 +
  drivers/gpu/drm/drm_atomic_uapi.c                  |   6 +-
  drivers/gpu/drm/drm_client_modeset.c               | 129 +++--
  drivers/gpu/drm/drm_crtc.c                         |  38 +-
  drivers/gpu/drm/drm_crtc_helper.c                  | 100 ++--
  drivers/gpu/drm/drm_crtc_internal.h                |   6 +
  drivers/gpu/drm/drm_displayid.c                    |   7 +-
  .../gpu/drm/drm_displayid_internal.h               |   5 +-
  drivers/gpu/drm/drm_drv.c                          |   5 +
  drivers/gpu/drm/drm_edid.c                         | 119 +++-
  drivers/gpu/drm/drm_eld.c                          |   4 +-
  drivers/gpu/drm/drm_fb_dma_helper.c                |  42 ++
  drivers/gpu/drm/drm_internal.h                     |   5 -
  drivers/gpu/drm/drm_mipi_dsi.c                     |  45 +-
  drivers/gpu/drm/drm_mode_config.c                  |   7 +
  drivers/gpu/drm/drm_modes.c                        |  40 +-
  drivers/gpu/drm/drm_panic.c                        | 585 
+++++++++++++++++++
  drivers/gpu/drm/drm_plane.c                        |  56 ++
  drivers/gpu/drm/drm_probe_helper.c                 |  39 +-
  drivers/gpu/drm/drm_sysfs.c                        |  20 +-
  drivers/gpu/drm/drm_vblank.c                       |  58 +-
  drivers/gpu/drm/drm_vblank_work.c                  |   2 +-
  drivers/gpu/drm/i915/display/intel_bios.c          |  49 +-
  drivers/gpu/drm/i915/display/intel_cursor.c        |  24 +
  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |  12 +-
  drivers/gpu/drm/lima/lima_bcast.c                  |  12 +
  drivers/gpu/drm/lima/lima_bcast.h                  |   3 +
  drivers/gpu/drm/lima/lima_drv.c                    |  21 +-
  drivers/gpu/drm/lima/lima_drv.h                    |   5 +
  drivers/gpu/drm/lima/lima_gp.c                     |  10 +
  drivers/gpu/drm/lima/lima_mmu.c                    |   5 +
  drivers/gpu/drm/lima/lima_pp.c                     |  22 +
  drivers/gpu/drm/lima/lima_sched.c                  |   9 +
  drivers/gpu/drm/lima/lima_sched.h                  |   1 +
  drivers/gpu/drm/mgag200/mgag200_drv.h              |   7 +-
  drivers/gpu/drm/mgag200/mgag200_mode.c             |  18 +
  drivers/gpu/drm/nouveau/nouveau_display.c          |   2 +-
  drivers/gpu/drm/nouveau/nouveau_dp.c               |  23 +-
  drivers/gpu/drm/panel/Kconfig                      |  11 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-lg-sw43408.c           | 320 +++++++++++
  drivers/gpu/drm/panel/panel-novatek-nt35950.c      |   6 +-
  drivers/gpu/drm/panel/panel-simple.c               |  50 +-
  drivers/gpu/drm/panel/panel-truly-nt35597.c        |   6 +-
  drivers/gpu/drm/rockchip/Kconfig                   |   2 +-
  drivers/gpu/drm/tiny/simpledrm.c                   |  16 +
  drivers/gpu/drm/ttm/ttm_bo.c                       |   8 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +
  drivers/gpu/drm/vkms/vkms_crtc.c                   |   7 +-
  drivers/gpu/drm/vmwgfx/Makefile                    |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   4 +
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   4 +
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  40 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  22 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  39 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |  32 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  28 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  42 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               | 632 
+++++++++++++++++++++
  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h               |  75 +++
  include/drm/drm_edid.h                             |  41 +-
  include/drm/drm_fb_dma_helper.h                    |   5 +
  include/drm/drm_mipi_dsi.h                         |  15 +-
  include/drm/drm_mode_config.h                      |  15 +
  include/drm/drm_modeset_helper_vtables.h           |  39 ++
  include/drm/drm_panic.h                            | 152 +++++
  include/drm/drm_plane.h                            |  10 +
  include/drm/drm_vblank.h                           |   1 +
  include/linux/dma-buf.h                            |   2 +
  include/uapi/drm/drm_mode.h                        |  11 +
  96 files changed, 3477 insertions(+), 515 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
  create mode 100644 drivers/accel/qaic/sahara.c
  create mode 100644 drivers/accel/qaic/sahara.h
  rename include/drm/drm_displayid.h => 
drivers/gpu/drm/drm_displayid_internal.h (98%)
  create mode 100644 drivers/gpu/drm/drm_panic.c
  create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43408.c
  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
  create mode 100644 include/drm/drm_panic.h
