Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220A7CF727
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 13:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E3D10E4C4;
	Thu, 19 Oct 2023 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17F10E4C4;
 Thu, 19 Oct 2023 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697715634; x=1729251634;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=O3uBq6T8/HAvXTNuvBs0st+KAtQfDcYivT58TiTtY1I=;
 b=MxAfBd6Fw7rUWHR6T3mTX4B18lBjV/ls0lIBH3V7e+guv2blfE71UAZA
 Dc7FQUItK3OANSAOCIxLoUBdmgnJFUtHGk3Ac9CJh00gKsdTOmED7kuWU
 yC7BtYFMiyMmBvRrA354Skx5LkF37fpouPiiAmx7/uJZn4TfuQtSOBpX4
 vhIi0CZVvcGCU9zr/Onu5ydeio0xlCDLJqDQ+H0D0IhgpDIhrozHxkocM
 BeM37mU/kqZ9HkZosiSNUawDR+7kcig9FC46Spn1IIoZ/hRiC254Uzihg
 qUIPrbiAbqO/pQxZnNN84TXceSU1isXRsI6DqpEntbdp9rHeZqbp/Qese w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452699090"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="452699090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 04:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900709812"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="900709812"
Received: from lbinmo2x-mobl1.gar.corp.intel.com (HELO [10.249.254.204])
 ([10.249.254.204])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 04:38:23 -0700
Message-ID: <475853c2-774c-43df-997e-85ff4bb5dea2@linux.intel.com>
Date: Thu, 19 Oct 2023 13:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2023-10-19:
drm-misc-next for v6.7-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Update maintainers entry for megachips STDPxxxxx-GE-B850V3-FW.

Core Changes:
- Add VM_BIND async document.
- Dual-license drm_gpuvm to GPL-2.0 OR MIT.

Driver Changes:
- Assorted small fixes in ivpu, bridge/megachips, ssd130x, st7703,
   bridge/lt9611uxc, rockchip.
- Handle differences between various adv7511 chips better, and improve
   HPD handling.
- Clock fixes for bridge/synopsis dw-mipi-dsi.
- Add Powkiddy RGB30 support to st7703.
- Add driver and DT support for ssd132x OLED controller to ssd130x.
The following changes since commit c395c83aafbb9cdbe4230f044d5b8eaf9080c0c5:

   drm/simpledrm: Fix power domain device link validity check 
(2023-10-12 10:39:48 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-10-19

for you to fetch changes up to 2d23e7d6bacb779c4a740dbd5e18978fb075d15e:

   dt-bindings: display: Add SSD132x OLED controllers (2023-10-18 
09:53:33 +0200)

----------------------------------------------------------------
drm-misc-next for v6.7-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Update maintainers entry for megachips STDPxxxxx-GE-B850V3-FW.

Core Changes:
- Add VM_BIND async document.
- Dual-license drm_gpuvm to GPL-2.0 OR MIT.

Driver Changes:
- Assorted small fixes in ivpu, bridge/megachips, ssd130x, st7703,
   bridge/lt9611uxc, rockchip.
- Handle differences between various adv7511 chips better, and improve
   HPD handling.
- Clock fixes for bridge/synopsis dw-mipi-dsi.
- Add Powkiddy RGB30 support to st7703.
- Add driver and DT support for ssd132x OLED controller to ssd130x.

----------------------------------------------------------------
Andy Yan (2):
       drm/rockchip: remove unused struct in vop2
       drm/rockchip: remove NR_LAYERS macro on vop2

Biju Das (8):
       drm: adv7511: Add struct adv7511_chip_info and use 
i2c_get_match_data()
       drm: adv7511: Add max_mode_clock_khz variable to struct 
adv7511_chip_info
       drm: adv7511: Add max_lane_freq_khz variable to struct 
adv7511_chip_info
       drm: adv7511: Add supply_names and num_supplies variables to 
struct adv7511_chip_info
       drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
       drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
       drm: adv7511: Add link_config variable to struct adv7511_chip_info
       drm: adv7511: Add hpd_override_enable variable to struct 
adv7511_chip_info

Chris Morgan (3):
       dt-bindings: vendor-prefixes: document Powkiddy
       dt-bindings: panel: Add Powkiddy RGB30 panel compatible
       drm/panel: st7703: Add Powkiddy RGB30 Panel Support

Dan Carpenter (1):
       drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()

Dmitry Baryshkov (1):
       drm/bridge: lt9611uxc: fix the race in the error path

Frank Oltmanns (1):
       drm/panel: st7703: Fix timings when entering/exiting sleep

Ian Ray (2):
       drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to 
drm_do_get_edid()
       MAINTAINERS: Update entry for megachips-stdpxxxx-ge-b850v3-fw

Jacek Lawrynowicz (1):
       accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()

Javier Martinez Canillas (6):
       drm/ssd130x: Replace .page_height field in device info with a 
constant
       drm/ssd130x: Add a controller family id to the device info data
       drm/ssd130x: Rename commands that are shared across chip families
       drm/ssd130x: Add support for the SSD132x OLED controller family
       dt-bindings: display: Split common Solomon properties in their 
own schema
       dt-bindings: display: Add SSD132x OLED controllers

Liu Ying (9):
       drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() 
helper
       drm/bridge: synopsys: dw-mipi-dsi: Add input bus format 
negotiation support
       drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
       drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
       drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to 
calculate lbcc
       drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock 
cycles for HSA and HBP
       drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout 
check
       dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
       drm/bridge: imx: Add i.MX93 MIPI DSI support

Ondrej Jirman (1):
       drm/panel: st7703: Pick different reset sequence

Thomas Hellström (2):
       Documentation/gpu: Add a VM_BIND async document
       drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT

Thomas Zimmermann (1):
       drm/ssd130x: Fix atomic_check for disabled planes

  .../display/bridge/fsl,imx93-mipi-dsi.yaml         | 115 +++
  .../display/panel/rocktech,jh057n00900.yaml        |   2 +
  .../bindings/display/solomon,ssd-common.yaml       |  42 +
  .../bindings/display/solomon,ssd1307fb.yaml        |  28 +-
  .../bindings/display/solomon,ssd132x.yaml          |  89 ++
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  Documentation/gpu/drm-vm-bind-async.rst            | 309 +++++++
  Documentation/gpu/implementation_guidelines.rst    |   9 +
  Documentation/gpu/index.rst                        |   1 +
  Documentation/gpu/rfc/xe.rst                       |   4 +-
  MAINTAINERS                                        |   5 +-
  drivers/accel/ivpu/ivpu_fw.c                       |  18 +-
  drivers/accel/ivpu/ivpu_fw_log.c                   |   6 +-
  drivers/accel/ivpu/ivpu_gem.c                      |  30 +-
  drivers/accel/ivpu/ivpu_gem.h                      |  22 +-
  drivers/accel/ivpu/ivpu_ipc.c                      |   6 +-
  drivers/accel/ivpu/ivpu_job.c                      |   8 +-
  drivers/accel/ivpu/ivpu_pm.c                       |   2 +-
  drivers/gpu/drm/bridge/adv7511/adv7511.h           |  16 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  14 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 104 ++-
  drivers/gpu/drm/bridge/adv7511/adv7533.c           |   7 +-
  drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        | 917 
+++++++++++++++++++++
  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  10 +-
  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  57 +-
  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  91 +-
  drivers/gpu/drm/drm_gpuvm.c                        |   2 +-
  drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 125 ++-
  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   2 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   6 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   3 -
  drivers/gpu/drm/solomon/Kconfig                    |  12 +-
  drivers/gpu/drm/solomon/ssd130x-i2c.c              |  18 +-
  drivers/gpu/drm/solomon/ssd130x-spi.c              |  27 +-
  drivers/gpu/drm/solomon/ssd130x.c                  | 523 ++++++++++--
  drivers/gpu/drm/solomon/ssd130x.h                  |  17 +-
  include/drm/bridge/dw_mipi_dsi.h                   |  16 +
  include/drm/drm_gpuvm.h                            |   2 +-
  40 files changed, 2385 insertions(+), 294 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
  create mode 100644 Documentation/gpu/implementation_guidelines.rst
  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
