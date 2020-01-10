Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F1136C48
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 12:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D76E9D5;
	Fri, 10 Jan 2020 11:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B46E9D5;
 Fri, 10 Jan 2020 11:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 03:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,416,1571727600"; d="scan'208";a="423577262"
Received: from janning-mobl1.ger.corp.intel.com (HELO [10.252.50.22])
 ([10.252.50.22])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2020 03:50:42 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <1e8d4944-68d7-0df3-f39b-31f6fba22a2a@linux.intel.com>
Date: Fri, 10 Jan 2020 12:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2020-01-10:
drm-misc-next for v5.6:

UAPI Changes:

Cross-subsystem Changes:
- Convert simple panel bindings to a template.

Core Changes:
- Revert drm-bridge-state changes, it causes a dependency error
  between drm and drm_kms_helper.
- Fix when disabling crc's.
- Assorted Kconfig fixes.

Driver Changes:
- Add ddc symlinks to more drivers.
- Fix chained bridge handling in exynos and vc4.
- More clock rate fixes in sun4i.
- Add support for AUO B116XAK01, GiantPlus GPM940B0, Sony ACX424AKP,
  BOE NV140FHM-N49, Satoz SAT050AT40H12R2 and Sharp LS020B1DD01D panels.
- Assorted small bugfixes.
The following changes since commit 3cacb2086e41bbdf4a43e494d47d05db356992b9:

  drm/mgag200: Add module parameter to pin all buffers at offset 0 (2020-01-07 11:53:19 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-01-10

for you to fetch changes up to 44c58c520ffc4b1f75241e5029c5ae6b223d0623:

  drm/panel: simple: Add Satoz SAT050AT40H12R2 panel support (2020-01-09 20:27:06 +0100)

----------------------------------------------------------------
drm-misc-next for v5.6:

UAPI Changes:

Cross-subsystem Changes:
- Convert simple panel bindings to a template.

Core Changes:
- Revert drm-bridge-state changes, it causes a dependency error
  between drm and drm_kms_helper.
- Fix when disabling crc's.
- Assorted Kconfig fixes.

Driver Changes:
- Add ddc symlinks to more drivers.
- Fix chained bridge handling in exynos and vc4.
- More clock rate fixes in sun4i.
- Add support for AUO B116XAK01, GiantPlus GPM940B0, Sony ACX424AKP,
  BOE NV140FHM-N49, Satoz SAT050AT40H12R2 and Sharp LS020B1DD01D panels.
- Assorted small bugfixes.

----------------------------------------------------------------
Andrzej Pietrasiewicz (4):
      drm/tegra: Provide ddc symlink in output connector sysfs directory
      drm/vc4: Provide ddc symlink in connector sysfs directory
      drm: zte: Provide ddc symlink in hdmi connector sysfs directory
      drm: zte: Provide ddc symlink in vga connector sysfs directory

Arnd Bergmann (1):
      drm: meson: fix address type confusion

Benjamin Gaignard (2):
      drm/modes: tag unused variables to avoid warnings
      drm/fb-cma-helpers: Fix include issue

Boris Brezillon (8):
      drm/bridge: Fix a NULL pointer dereference in drm_atomic_bridge_chain_check()
      Revert "drm/bridge: Fix a NULL pointer dereference in drm_atomic_bridge_chain_check()"
      Revert "drm/bridge: Add the necessary bits to support bus format negotiation"
      Revert "drm/bridge: Add an ->atomic_check() hook"
      Revert "drm/bridge: Patch atomic hooks to take a drm_bridge_state"
      Revert "drm/bridge: Add a drm_bridge_state object"
      drm/vc4: dsi: Fix bridge chain handling
      drm/exynos: dsi: Fix bridge chain handling

Chen Zhou (1):
      drm/gma500: remove set but not used variables 'hist_reg'

Dan Carpenter (1):
      gpu/drm: clean up white space in drm_legacy_lock_master_cleanup()

Dingchen Zhang (2):
      drm: remove the newline for CRC source name.
      drm: Set crc->opened to false before setting crc source to NULL.

Hans Verkuil (1):
      drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC

Linus Walleij (1):
      drm/panel: Add driver for Sony ACX424AKP panel

Maxime Ripard (3):
      drm/sun4i: backend: Make sure we enforce the clock rate
      drm/sun4i: drc: Make sure we enforce the clock rate
      dt-bindings: display: Convert Allwinner display pipeline to schemas

Miquel Raynal (3):
      dt-bindings: Add vendor prefix for Satoz
      dt-bindings: display: simple: Add Satoz panel
      drm/panel: simple: Add Satoz SAT050AT40H12R2 panel support

Paul Cercueil (2):
      dt-bindings: panel-simple: Add compatible for GiantPlus GPM940B0
      dt-bindings: panel-simple: Add compatible for Sharp LS020B1DD01D

Qiang Yu (1):
      drm/lima: use drm_sched_fault for error task handling

Rob Clark (2):
      dt-bindings: display: panel: Add AUO B116XAK01 panel bindings
      drm/panel: Add support for AUO B116XAK01 panel

Sam Ravnborg (2):
      dt-bindings: one binding file for all simple panels
      dt-bindings: display: add BOE 14" panel

Thomas Zimmermann (1):
      drm/udl: Make udl driver depend on CONFIG_USB

Tobias Schramm (1):
      drm/panel: Add support for BOE NV140FHM-N49 panel to panel-simple

Wambui Karuga (1):
      drm/omapdrm: use BUG_ON macro for error debugging.

kbuild test robot (1):
      video: fbdev: mmp: fix platform_get_irq.cocci warnings

 .../allwinner,sun4i-a10-display-backend.yaml       | 291 +++++++++
 .../allwinner,sun4i-a10-display-engine.yaml        | 114 ++++
 .../allwinner,sun4i-a10-display-frontend.yaml      | 138 +++++
 .../bindings/display/allwinner,sun4i-a10-hdmi.yaml | 183 ++++++
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml | 676 +++++++++++++++++++++
 .../display/allwinner,sun4i-a10-tv-encoder.yaml    |  62 ++
 .../bindings/display/allwinner,sun6i-a31-drc.yaml  | 138 +++++
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    | 118 ++++
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml      | 273 +++++++++
 .../display/allwinner,sun8i-a83t-hdmi-phy.yaml     | 117 ++++
 .../display/allwinner,sun8i-r40-tcon-top.yaml      | 382 ++++++++++++
 .../bindings/display/allwinner,sun9i-a80-deu.yaml  | 133 ++++
 .../display/panel/ampire,am-480272h3tmqw-t01h.yaml |  42 --
 .../display/panel/ampire,am800480r3tmqwa1h.txt     |   7 -
 .../bindings/display/panel/giantplus,gpm940b0.txt  |  12 -
 .../bindings/display/panel/panel-simple.yaml       |  69 +++
 .../bindings/display/panel/sharp,ls020b1dd01d.txt  |  12 -
 .../bindings/display/sunxi/sun4i-drm.txt           | 637 -------------------
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  41 +-
 drivers/gpu/drm/drm_atomic.c                       |  39 --
 drivers/gpu/drm/drm_atomic_helper.c                |  32 +-
 drivers/gpu/drm/drm_bridge.c                       | 527 +---------------
 drivers/gpu/drm/drm_debugfs_crc.c                  |   9 +-
 drivers/gpu/drm/drm_fb_cma_helper.c                |   1 +
 drivers/gpu/drm/drm_lock.c                         |   3 +-
 drivers/gpu/drm/drm_modes.c                        |   9 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  29 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |   3 +-
 drivers/gpu/drm/lima/lima_sched.c                  |  35 +-
 drivers/gpu/drm/lima/lima_sched.h                  |   2 -
 drivers/gpu/drm/meson/meson_drv.h                  |   2 +-
 drivers/gpu/drm/meson/meson_rdma.c                 |  12 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |   3 +-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-simple.c               |  94 +++
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       | 550 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   8 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |   9 +
 drivers/gpu/drm/sun4i/sun6i_drc.c                  |   8 +
 drivers/gpu/drm/tegra/hdmi.c                       |   7 +-
 drivers/gpu/drm/tegra/sor.c                        |   7 +-
 drivers/gpu/drm/udl/Kconfig                        |   3 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  28 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  12 +-
 drivers/gpu/drm/zte/zx_hdmi.c                      |   6 +-
 drivers/gpu/drm/zte/zx_vga.c                       |   6 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c              |   1 -
 include/drm/drm_atomic.h                           |   3 -
 include/drm/drm_bridge.h                           | 275 +--------
 include/drm/drm_fb_cma_helper.h                    |   2 +
 54 files changed, 3531 insertions(+), 1660 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
 create mode 100644 drivers/gpu/drm/panel/panel-sony-acx424akp.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
