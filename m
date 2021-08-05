Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2863E128E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884646E529;
	Thu,  5 Aug 2021 10:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0826C6E529;
 Thu,  5 Aug 2021 10:22:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="277873379"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="277873379"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 03:22:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="480779902"
Received: from ppietrus-mobl1.ger.corp.intel.com (HELO [10.252.51.65])
 ([10.252.51.65])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 03:22:54 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <e460fece-cfd9-6aa4-37c1-0fb1b473196d@linux.intel.com>
Date: Thu, 5 Aug 2021 12:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

drm-misc-next-2021-08-05:
drm-misc-next for v5.15:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- Assorted docbook updates.
- Unbreak damage selftests.
- Define DRM_FORMAT_MAX_PLANES, maximum planes for a planar format.
- Add gem fb vmap/vunmap helpers, use them in gud and vkms drivers.

Driver Changes:
- Bridge fixes for ti-sn65dsi86.
- Use a full-featured driver for ATNA33XC20 to get backlight right,
  instead of the simple panel driver.
- Assorted fixes to pl111,.
- Support E Ink VB3300-KCA panel.
- Add support for Gopher 2b LCD and ilitek ili9341 panels.
The following changes since commit 04d505de7f82c8f2daa6139b460b05dc01e354e0:

  Merge tag 'amd-drm-next-5.15-2021-07-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-07-30 16:48:35 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-08-05

for you to fetch changes up to 5a04227326b04c15b015181772f5c853172fdb68:

  drm/panel: Add ilitek ili9341 panel driver (2021-08-05 11:09:23 +0200)

----------------------------------------------------------------
drm-misc-next for v5.15:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- Assorted docbook updates.
- Unbreak damage selftests.
- Define DRM_FORMAT_MAX_PLANES, maximum planes for a planar format.
- Add gem fb vmap/vunmap helpers, use them in gud and vkms drivers.

Driver Changes:
- Bridge fixes for ti-sn65dsi86.
- Use a full-featured driver for ATNA33XC20 to get backlight right,
  instead of the simple panel driver.
- Assorted fixes to pl111,.
- Support E Ink VB3300-KCA panel.
- Add support for Gopher 2b LCD and ilitek ili9341 panels.

----------------------------------------------------------------
Alistair Francis (1):
      drm/panel: Add support for E Ink VB3300-KCA

Artjom Vejsel (2):
      dt-bindings: Add DT bindings for QiShenglong Gopher 2b panel
      drm/panel-simple: add Gopher 2b LCD panel

Cai Huoqing (2):
      drm/pl111: Remove unused including <linux/version.h>
      drm: Fix typo in comments

Daniel Vetter (1):
      drm: Fix oops in damage self-tests by mocking damage property

Desmond Cheong Zhi Xi (1):
      drm: clean up unused kerneldoc in drm_lease.c

Dillon Min (2):
      dt-bindings: display: panel: Add ilitek ili9341 panel bindings
      drm/panel: Add ilitek ili9341 panel driver

Douglas Anderson (6):
      drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not specified
      drm/bridge: ti-sn65dsi86: Fix power off sequence
      drm/bridge: ti-sn65dsi86: Add some 100 us delays
      Revert "drm/panel-simple: Add Samsung ATNA33XC20"
      Revert "drm/panel-simple: Support for delays between GPIO & regulator"
      drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel

Gregory Williams (1):
      DRM: ast: Fixed coding style issues of ast_mode.c

Simon Ser (2):
      drm/connector: add ref to drm_connector_get in iter docs
      drm: document drm_mode_get_property

Thomas Zimmermann (5):
      drm: Define DRM_FORMAT_MAX_PLANES
      drm/gem: Provide drm_gem_fb_{vmap,vunmap}()
      drm/gem: Clear mapping addresses for unused framebuffer planes
      drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
      drm/vkms: Map output framebuffer BOs with drm_gem_fb_vmap()

 .../bindings/display/panel/ilitek,ili9341.yaml     |  78 ++
 .../bindings/display/panel/panel-simple.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/drm-kms.rst                      |   2 +
 drivers/gpu/drm/ast/ast_mode.c                     |  31 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  17 +-
 drivers/gpu/drm/drm_aperture.c                     |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  10 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   6 +-
 drivers/gpu/drm/drm_auth.c                         |   2 +-
 drivers/gpu/drm/drm_bridge.c                       |   2 +-
 drivers/gpu/drm/drm_bufs.c                         |   2 +-
 drivers/gpu/drm/drm_cache.c                        |   2 +-
 drivers/gpu/drm/drm_damage_helper.c                |   2 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  18 +-
 drivers/gpu/drm/drm_drv.c                          |   4 +-
 drivers/gpu/drm/drm_dsc.c                          |   2 +-
 drivers/gpu/drm/drm_edid.c                         |   4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   2 +-
 drivers/gpu/drm/drm_file.c                         |   6 +-
 drivers/gpu/drm/drm_format_helper.c                |   2 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +-
 drivers/gpu/drm/drm_gem.c                          |   4 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |  39 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  95 ++-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   2 +-
 drivers/gpu/drm/drm_hdcp.c                         |   2 +-
 drivers/gpu/drm/drm_ioctl.c                        |   4 +-
 drivers/gpu/drm/drm_irq.c                          |   2 +-
 drivers/gpu/drm/drm_lease.c                        | 131 +---
 drivers/gpu/drm/drm_mm.c                           |   2 +-
 drivers/gpu/drm/drm_mode_object.c                  |   2 +-
 drivers/gpu/drm/drm_modes.c                        |   4 +-
 drivers/gpu/drm/drm_plane.c                        |   2 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   2 +-
 drivers/gpu/drm/drm_prime.c                        |   2 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   2 +-
 drivers/gpu/drm/drm_property.c                     |   2 +-
 drivers/gpu/drm/drm_scdc_helper.c                  |   2 +-
 drivers/gpu/drm/drm_syncobj.c                      |   2 +-
 drivers/gpu/drm/drm_vblank.c                       |  12 +-
 drivers/gpu/drm/drm_vma_manager.c                  |   2 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  10 +-
 drivers/gpu/drm/panel/Kconfig                      |  23 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 792 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   | 366 ++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 134 ++--
 drivers/gpu/drm/pl111/pl111_display.c              |   1 -
 drivers/gpu/drm/pl111/pl111_drv.c                  |   1 -
 drivers/gpu/drm/selftests/test-drm_damage_helper.c | 287 ++------
 drivers/gpu/drm/vkms/vkms_composer.c               |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |  28 +-
 include/drm/drm_connector.h                        |   5 +
 include/drm/drm_fourcc.h                           |  13 +-
 include/drm/drm_framebuffer.h                      |   8 +-
 include/drm/drm_gem_atomic_helper.h                |   3 +-
 include/drm/drm_gem_framebuffer_helper.h           |   6 +
 include/uapi/drm/drm_mode.h                        |  60 +-
 62 files changed, 1716 insertions(+), 552 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
