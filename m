Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F26D961A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A144610EB7C;
	Thu,  6 Apr 2023 11:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4610EB73;
 Thu,  6 Apr 2023 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680781323; x=1712317323;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=gi2mC53mJivL5R5XLapBZo+5LMnagKRJ97SAPr2VTCI=;
 b=kITQpE920HkUQ/QVNJrzuFasM4NfUF43KLJtx5rzudWXgsZ4nQlYtufW
 f86cNL49NDmu4vU3uSMshfE+Jery9gK0u7myHtr9Z1OrFBDwzd5flIheq
 FduJBzvNYMe3EzK1cH15Elbp9u9r0t7L6pT9eNVF1MjSp1hQgxfQaBwYY
 vV0+SJvJRKDSBYosMRiqONrwBqaNZpG+h6Rcwbpot8MwZKTrxD30hEqLU
 4HiiC4P70lnzzS9TtLZoVDiMz74/kE4rL1ZXmbICsWG8NYgs8rpRj44IH
 0IgUCgpTkF/X86l7GwJCExX9eGmW0yO50iMYc+nj1cs607cyJStSC9HTi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="331325603"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="331325603"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 04:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810968195"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="810968195"
Received: from rvadera-mobl.ger.corp.intel.com (HELO [10.249.34.3])
 ([10.249.34.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 04:41:31 -0700
Content-Type: multipart/alternative;
 boundary="------------m3NKjoEoYhyKBGyCCy0ajgJk"
Message-ID: <64bb9696-a76a-89d9-1866-bcdf7c69c284@linux.intel.com>
Date: Thu, 6 Apr 2023 13:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-intel-gt-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------m3NKjoEoYhyKBGyCCy0ajgJk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,
Pull request to avoid backmerges. ;)
Cheers,
~Maarten

drm-misc-next-2023-04-06:
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Document port and rotation dt bindings better.
- For panel timing DT bindings, document that vsync and hsync are
   first, rather than last in image.
- Fix video/aperture typos.

Core Changes:
- Reject prime DMA-Buf attachment if get_sg_table is missing.
   (For self-importing dma-buf only.)
- Add prime import/export to vram-helper.
- Fix oops in drm/vblank when init is not called.
- Fixup xres/yres_virtual and other fixes in fb helper.
- Improve SCDC debugs.
- Skip setting deadline on modesets.
- Assorted TTM fixes.

Driver Changes:
- Add lima usage stats.
- Assorted fixes to bridge/lt8192b, tc358767, ivpu,
   bridge/ti-sn65dsi83, ps8640.
- Use pci aperture helpers in drm/ast lynxfb, radeonfb.
- Revert some lima patches, as they required a commit that has been
   reverted upstream.
- Add AUO NE135FBM-N41 v8.1 eDP panel.
- Add QAIC accel driver.
The following changes since commit 7d690f936e9bc9fbd6394fb3d4ad181af03ee393:

   drm/panfrost: Add basic support for speed binning (2023-03-31 11:44:11 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-04-06

for you to fetch changes up to e44f18c6ff8beef7b2b10592287f0a9766376d9b:

   drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting (2023-04-06 10:01:42 +0200)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Document port and rotation dt bindings better.
- For panel timing DT bindings, document that vsync and hsync are
   first, rather than last in image.
- Fix video/aperture typos.

Core Changes:
- Reject prime DMA-Buf attachment if get_sg_table is missing.
   (For self-importing dma-buf only.)
- Add prime import/export to vram-helper.
- Fix oops in drm/vblank when init is not called.
- Fixup xres/yres_virtual and other fixes in fb helper.
- Improve SCDC debugs.
- Skip setting deadline on modesets.
- Assorted TTM fixes.

Driver Changes:
- Add lima usage stats.
- Assorted fixes to bridge/lt8192b, tc358767, ivpu,
   bridge/ti-sn65dsi83, ps8640.
- Use pci aperture helpers in drm/ast lynxfb, radeonfb.
- Revert some lima patches, as they required a commit that has been
   reverted upstream.
- Add AUO NE135FBM-N41 v8.1 eDP panel.
- Add QAIC accel driver.

----------------------------------------------------------------
Alexander Stein (2):
       drm/bridge: ti-sn65dsi83: use dev_err_probe if host attach failed
       drm/bridge: ti-sn65dsi86: Allow GPIO operations to sleep

AngeloGioacchino Del Regno (1):
       drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry

Daniel Vetter (7):
       drm/ast: Use drm_aperture_remove_conflicting_pci_framebuffers
       staging/lynxfb: Use pci aperture helper
       fbdev/radeon: use pci aperture helpers
       drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
       drm/fb-helper: drop redundant pixclock check from drm_fb_helper_set_par()
       drm/fb-helper: fix input validation gaps in check_var
       drm/atomic-helper: Don't set deadline for modesets

Erico Nunes (3):
       drm/lima: add usage counting method to ctx_mgr
       drm/lima: allocate unique id per drm_file
       drm/lima: add show_fdinfo for drm usage stats

Francesco Dolcini (1):
       drm/bridge: lt8912b: Fix DSI Video Mode

Harshit Mogalapalli (1):
       drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()

Jeffrey Hugo (7):
       accel/qaic: Add documentation for AIC100 accelerator driver
       accel/qaic: Add uapi and core driver file
       accel/qaic: Add MHI controller
       accel/qaic: Add control path
       accel/qaic: Add datapath
       accel/qaic: Add qaic driver to the build system
       MAINTAINERS: Add entry for QAIC driver

Karol Wachowski (1):
       accel/ivpu: Remove D3hot delay for Meteorlake

Krzysztof Kozlowski (5):
       dt-bindings: display: sitronix,st7789v: document dc-gpios
       dt-bindings: display: xinpeng,xpp055c272: document port
       dt-bindings: display: feiyang,fy07024di26a30d: document port
       dt-bindings: display: elida,kd35t133: document port and rotation
       dt-bindings: display: sitronix,st7701: document port and rotation

Luca Ceresoli (2):
       drm: bridge: ldb: add missing \n in dev_warn() string
       drm: bridge: ldb: add support for using channel 1 only

Marek Vasut (3):
       drm/bridge: tc358767: Enable DSI burst mode, LPM, non-continuous clock
       dt-bindings: display: Start the info graphics with HS/VS change
       drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet

Pin-yen Lin (1):
       drm/bridge: ps8640: Use constant sleep time for polling hpd

Pranjal Ramajor Asha Kanojiya (1):
       accel/qaic: Add mhi_qaic_cntl

Qiang Yu (3):
       Revert "drm/lima: add show_fdinfo for drm usage stats"
       Revert "drm/lima: allocate unique id per drm_file"
       Revert "drm/lima: add usage counting method to ctx_mgr"

Rob Clark (1):
       drm/vblank: Fix for drivers that do not drm_vblank_init()

Simon Ser (2):
       drm/prime: reject DMA-BUF attach when get_sg_table is missing
       drm/vram-helper: turn on PRIME import/export

Sui Jingfeng (1):
       video/aperture: Fix typos in comments

Thomas Hellström (3):
       drm/ttm/pool: Fix ttm_pool_alloc error path
       drm/ttm: Reduce the number of used allocation orders for TTM pages
       drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting

Ville Syrjälä (1):
       drm/scdc-helper: Pimp SCDC debugs

  Documentation/accel/index.rst                      |    1 +
  Documentation/accel/qaic/aic100.rst                |  510 ++++++
  Documentation/accel/qaic/index.rst                 |   13 +
  Documentation/accel/qaic/qaic.rst                  |  170 ++
  .../bindings/display/panel/elida,kd35t133.yaml     |    9 +
  .../display/panel/feiyang,fy07024di26a30d.yaml     |    8 +
  .../bindings/display/panel/panel-timing.yaml       |   46 +-
  .../bindings/display/panel/sitronix,st7701.yaml    |    9 +
  .../bindings/display/panel/sitronix,st7789v.yaml   |    4 +
  .../bindings/display/panel/xinpeng,xpp055c272.yaml |    8 +
  MAINTAINERS                                        |   10 +
  drivers/accel/Kconfig                              |    1 +
  drivers/accel/Makefile                             |    1 +
  drivers/accel/ivpu/ivpu_drv.c                      |    4 +
  drivers/accel/qaic/Kconfig                         |   23 +
  drivers/accel/qaic/Makefile                        |   13 +
  drivers/accel/qaic/mhi_controller.c                |  563 ++++++
  drivers/accel/qaic/mhi_controller.h                |   16 +
  drivers/accel/qaic/mhi_qaic_ctrl.c                 |  569 ++++++
  drivers/accel/qaic/mhi_qaic_ctrl.h                 |   12 +
  drivers/accel/qaic/qaic.h                          |  282 +++
  drivers/accel/qaic/qaic_control.c                  | 1526 ++++++++++++++++
  drivers/accel/qaic/qaic_data.c                     | 1902 ++++++++++++++++++++
  drivers/accel/qaic/qaic_drv.c                      |  647 +++++++
  drivers/gpu/drm/ast/ast_drv.c                      |   16 +-
  drivers/gpu/drm/bridge/fsl-ldb.c                   |  103 +-
  drivers/gpu/drm/bridge/lontium-lt8912b.c           |    1 -
  drivers/gpu/drm/bridge/parade-ps8640.c             |    2 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    8 +-
  drivers/gpu/drm/bridge/tc358767.c                  |    4 +-
  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    8 +-
  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    4 +-
  drivers/gpu/drm/display/drm_scdc_helper.c          |   46 +-
  drivers/gpu/drm/drm_atomic_helper.c                |    6 +
  drivers/gpu/drm/drm_fb_helper.c                    |   53 +-
  drivers/gpu/drm/drm_prime.c                        |    6 +-
  drivers/gpu/drm/drm_vblank.c                       |   10 +-
  drivers/gpu/drm/i915/display/intel_ddi.c           |    4 +-
  drivers/gpu/drm/i915/display/intel_hdmi.c          |    8 +-
  drivers/gpu/drm/lima/lima_drv.c                    |    6 +-
  drivers/gpu/drm/panel/panel-edp.c                  |    1 +
  drivers/gpu/drm/tegra/sor.c                        |   15 +-
  drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   13 +-
  drivers/gpu/drm/ttm/ttm_pool.c                     |  111 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |   21 +-
  drivers/staging/sm750fb/sm750.c                    |   16 +-
  drivers/video/aperture.c                           |    8 +-
  drivers/video/fbdev/aty/radeon_base.c              |   10 +-
  include/drm/display/drm_scdc_helper.h              |    7 +-
  include/drm/drm_gem_vram_helper.h                  |    4 +-
  include/uapi/drm/qaic_accel.h                      |  397 ++++
  51 files changed, 7004 insertions(+), 231 deletions(-)
  create mode 100644 Documentation/accel/qaic/aic100.rst
  create mode 100644 Documentation/accel/qaic/index.rst
  create mode 100644 Documentation/accel/qaic/qaic.rst
  create mode 100644 drivers/accel/qaic/Kconfig
  create mode 100644 drivers/accel/qaic/Makefile
  create mode 100644 drivers/accel/qaic/mhi_controller.c
  create mode 100644 drivers/accel/qaic/mhi_controller.h
  create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
  create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
  create mode 100644 drivers/accel/qaic/qaic.h
  create mode 100644 drivers/accel/qaic/qaic_control.c
  create mode 100644 drivers/accel/qaic/qaic_data.c
  create mode 100644 drivers/accel/qaic/qaic_drv.c
  create mode 100644 include/uapi/drm/qaic_accel.h

--------------m3NKjoEoYhyKBGyCCy0ajgJk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Dave, Daniel,
Pull request to avoid backmerges. ;)
Cheers,
~Maarten

drm-misc-next-2023-04-06:
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Document port and rotation dt bindings better.
- For panel timing DT bindings, document that vsync and hsync are
  first, rather than last in image.
- Fix video/aperture typos.

Core Changes:
- Reject prime DMA-Buf attachment if get_sg_table is missing.
  (For self-importing dma-buf only.)
- Add prime import/export to vram-helper.
- Fix oops in drm/vblank when init is not called.
- Fixup xres/yres_virtual and other fixes in fb helper.
- Improve SCDC debugs.
- Skip setting deadline on modesets.
- Assorted TTM fixes.

Driver Changes:
- Add lima usage stats.
- Assorted fixes to bridge/lt8192b, tc358767, ivpu,
  bridge/ti-sn65dsi83, ps8640.
- Use pci aperture helpers in drm/ast lynxfb, radeonfb.
- Revert some lima patches, as they required a commit that has been
  reverted upstream.
- Add AUO NE135FBM-N41 v8.1 eDP panel.
- Add QAIC accel driver.
The following changes since commit 7d690f936e9bc9fbd6394fb3d4ad181af03ee393:

  drm/panfrost: Add basic support for speed binning (2023-03-31 11:44:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-04-06

for you to fetch changes up to e44f18c6ff8beef7b2b10592287f0a9766376d9b:

  drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting (2023-04-06 10:01:42 +0200)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Document port and rotation dt bindings better.
- For panel timing DT bindings, document that vsync and hsync are
  first, rather than last in image.
- Fix video/aperture typos.

Core Changes:
- Reject prime DMA-Buf attachment if get_sg_table is missing.
  (For self-importing dma-buf only.)
- Add prime import/export to vram-helper.
- Fix oops in drm/vblank when init is not called.
- Fixup xres/yres_virtual and other fixes in fb helper.
- Improve SCDC debugs.
- Skip setting deadline on modesets.
- Assorted TTM fixes.

Driver Changes:
- Add lima usage stats.
- Assorted fixes to bridge/lt8192b, tc358767, ivpu,
  bridge/ti-sn65dsi83, ps8640.
- Use pci aperture helpers in drm/ast lynxfb, radeonfb.
- Revert some lima patches, as they required a commit that has been
  reverted upstream.
- Add AUO NE135FBM-N41 v8.1 eDP panel.
- Add QAIC accel driver.

----------------------------------------------------------------
Alexander Stein (2):
      drm/bridge: ti-sn65dsi83: use dev_err_probe if host attach failed
      drm/bridge: ti-sn65dsi86: Allow GPIO operations to sleep

AngeloGioacchino Del Regno (1):
      drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry

Daniel Vetter (7):
      drm/ast: Use drm_aperture_remove_conflicting_pci_framebuffers
      staging/lynxfb: Use pci aperture helper
      fbdev/radeon: use pci aperture helpers
      drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
      drm/fb-helper: drop redundant pixclock check from drm_fb_helper_set_par()
      drm/fb-helper: fix input validation gaps in check_var
      drm/atomic-helper: Don't set deadline for modesets

Erico Nunes (3):
      drm/lima: add usage counting method to ctx_mgr
      drm/lima: allocate unique id per drm_file
      drm/lima: add show_fdinfo for drm usage stats

Francesco Dolcini (1):
      drm/bridge: lt8912b: Fix DSI Video Mode

Harshit Mogalapalli (1):
      drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()

Jeffrey Hugo (7):
      accel/qaic: Add documentation for AIC100 accelerator driver
      accel/qaic: Add uapi and core driver file
      accel/qaic: Add MHI controller
      accel/qaic: Add control path
      accel/qaic: Add datapath
      accel/qaic: Add qaic driver to the build system
      MAINTAINERS: Add entry for QAIC driver

Karol Wachowski (1):
      accel/ivpu: Remove D3hot delay for Meteorlake

Krzysztof Kozlowski (5):
      dt-bindings: display: sitronix,st7789v: document dc-gpios
      dt-bindings: display: xinpeng,xpp055c272: document port
      dt-bindings: display: feiyang,fy07024di26a30d: document port
      dt-bindings: display: elida,kd35t133: document port and rotation
      dt-bindings: display: sitronix,st7701: document port and rotation

Luca Ceresoli (2):
      drm: bridge: ldb: add missing \n in dev_warn() string
      drm: bridge: ldb: add support for using channel 1 only

Marek Vasut (3):
      drm/bridge: tc358767: Enable DSI burst mode, LPM, non-continuous clock
      dt-bindings: display: Start the info graphics with HS/VS change
      drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet

Pin-yen Lin (1):
      drm/bridge: ps8640: Use constant sleep time for polling hpd

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Add mhi_qaic_cntl

Qiang Yu (3):
      Revert "drm/lima: add show_fdinfo for drm usage stats"
      Revert "drm/lima: allocate unique id per drm_file"
      Revert "drm/lima: add usage counting method to ctx_mgr"

Rob Clark (1):
      drm/vblank: Fix for drivers that do not drm_vblank_init()

Simon Ser (2):
      drm/prime: reject DMA-BUF attach when get_sg_table is missing
      drm/vram-helper: turn on PRIME import/export

Sui Jingfeng (1):
      video/aperture: Fix typos in comments

Thomas Hellström (3):
      drm/ttm/pool: Fix ttm_pool_alloc error path
      drm/ttm: Reduce the number of used allocation orders for TTM pages
      drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting

Ville Syrjälä (1):
      drm/scdc-helper: Pimp SCDC debugs

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/qaic/aic100.rst                |  510 ++++++
 Documentation/accel/qaic/index.rst                 |   13 +
 Documentation/accel/qaic/qaic.rst                  |  170 ++
 .../bindings/display/panel/elida,kd35t133.yaml     |    9 +
 .../display/panel/feiyang,fy07024di26a30d.yaml     |    8 +
 .../bindings/display/panel/panel-timing.yaml       |   46 +-
 .../bindings/display/panel/sitronix,st7701.yaml    |    9 +
 .../bindings/display/panel/sitronix,st7789v.yaml   |    4 +
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |    8 +
 MAINTAINERS                                        |   10 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/ivpu/ivpu_drv.c                      |    4 +
 drivers/accel/qaic/Kconfig                         |   23 +
 drivers/accel/qaic/Makefile                        |   13 +
 drivers/accel/qaic/mhi_controller.c                |  563 ++++++
 drivers/accel/qaic/mhi_controller.h                |   16 +
 drivers/accel/qaic/mhi_qaic_ctrl.c                 |  569 ++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h                 |   12 +
 drivers/accel/qaic/qaic.h                          |  282 +++
 drivers/accel/qaic/qaic_control.c                  | 1526 ++++++++++++++++
 drivers/accel/qaic/qaic_data.c                     | 1902 ++++++++++++++++++++
 drivers/accel/qaic/qaic_drv.c                      |  647 +++++++
 drivers/gpu/drm/ast/ast_drv.c                      |   16 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  103 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    1 -
 drivers/gpu/drm/bridge/parade-ps8640.c             |    2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    8 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    8 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    4 +-
 drivers/gpu/drm/display/drm_scdc_helper.c          |   46 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    6 +
 drivers/gpu/drm/drm_fb_helper.c                    |   53 +-
 drivers/gpu/drm/drm_prime.c                        |    6 +-
 drivers/gpu/drm/drm_vblank.c                       |   10 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    8 +-
 drivers/gpu/drm/lima/lima_drv.c                    |    6 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 drivers/gpu/drm/tegra/sor.c                        |   15 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   13 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  111 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   21 +-
 drivers/staging/sm750fb/sm750.c                    |   16 +-
 drivers/video/aperture.c                           |    8 +-
 drivers/video/fbdev/aty/radeon_base.c              |   10 +-
 include/drm/display/drm_scdc_helper.h              |    7 +-
 include/drm/drm_gem_vram_helper.h                  |    4 +-
 include/uapi/drm/qaic_accel.h                      |  397 ++++
 51 files changed, 7004 insertions(+), 231 deletions(-)
 create mode 100644 Documentation/accel/qaic/aic100.rst
 create mode 100644 Documentation/accel/qaic/index.rst
 create mode 100644 Documentation/accel/qaic/qaic.rst
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
 create mode 100644 drivers/accel/qaic/qaic.h
 create mode 100644 drivers/accel/qaic/qaic_control.c
 create mode 100644 drivers/accel/qaic/qaic_data.c
 create mode 100644 drivers/accel/qaic/qaic_drv.c
 create mode 100644 include/uapi/drm/qaic_accel.h

</pre>
  </body>
</html>

--------------m3NKjoEoYhyKBGyCCy0ajgJk--
