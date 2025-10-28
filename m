Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F0C14C9F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6210E3E7;
	Tue, 28 Oct 2025 13:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="gYhOFWGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01D10E3E5;
 Tue, 28 Oct 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761657242;
 bh=/M4/9Yyu88+dTA1oWie9zIheaF3dnHZcy0TUmkSaPv4=;
 h=Date:From:To:Cc:Subject:From;
 b=gYhOFWGEED/i4HP7XWS7YGSzSXogO6EYFbNydhlpM5AvjM6Q00wvVdutM2oKG5oBT
 MU3+vc8kz72PVuQksdQpFnz84L9e1V7yYKg/hvaq3Z9CRfVO5Mg5aF6TyZhs1pdAHw
 QbjqBWFr291nEBMIzVrcBy9S5LKPiCv+UitBgZYe3RL1DVEJCuQsXP6FKwiwEtBKRc
 /cvAYzpNNWW5vrcGWKcUR8QKa1u4F07GjSsn6fKi/gMXFSTljfQMd9pZEQla3m1siA
 R8lfPbhNtueHUWgD8a3/PvTP26OQoKaFq9aOY8mGut0BAqUJSudO3ku7lN0C3uw8dg
 gjtN9y1MYy00g==
Message-ID: <32b43261-3c99-49d9-92ee-615ada1d01e8@lankhorst.se>
Date: Tue, 28 Oct 2025 14:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <dev@lankhorst.se>
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
Subject: [PULL] drm-misc-next
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

Next pull-request for v6.19-rc1!

Kind regards,
~Maarten Lankhorst

drm-misc-next-2025-10-28:
drm-misc-next for v6.19-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Update DT bindings for renesas and powervr-rogue.
- Update MAINTAINERS email and add spsc_queue.

Core Changes:
- Allow ttm page protection flags on risc-v.
- Move freeing of drm client memory to driver.

Driver Changes:
- Assorted small fixes and updates to qaic, ivpu, st7571-i2c, gud,
  amdxdna.
- Allow configuration of vkms' display through configfs.
- Add Arm Ethos-U65/U85 accel driver.
The following changes since commit 098456f3141bf9e0c0d8973695ca38a03465ccd6:

  Merge tag 'drm-misc-next-2025-10-21' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-10-24 13:25:20 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-10-28

for you to fetch changes up to 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c:

  drm/ttm: add pgprot handling for RISC-V (2025-10-28 09:19:46 +0100)

----------------------------------------------------------------
drm-misc-next for v6.19-rc1:

UAPI Changes:

Cross-subsystem Changes:
- Update DT bindings for renesas and powervr-rogue.
- Update MAINTAINERS email and add spsc_queue.

Core Changes:
- Allow ttm page protection flags on risc-v.
- Move freeing of drm client memory to driver.

Driver Changes:
- Assorted small fixes and updates to qaic, ivpu, st7571-i2c, gud,
  amdxdna.
- Allow configuration of vkms' display through configfs.
- Add Arm Ethos-U65/U85 accel driver.

----------------------------------------------------------------
Aswin Venkatesan (1):
      accel/qaic: Fix comment

Chen-Yu Tsai (1):
      MAINTAINERS: Update Chen-Yu's email address

Icenowy Zheng (1):
      drm/ttm: add pgprot handling for RISC-V

José Expósito (6):
      drm/vkms: Expose device creation and destruction
      drm/vkms: Allow to configure the default device creation
      drm/vkms: Remove completed task from the TODO list
      drm/vkms: Allow to configure connector status
      drm/vkms: Allow to update the connector status
      drm/vkms: Allow to configure connector status via configfs

Lizhi Hou (2):
      accel/amdxdna: Fix incorrect return value in aie2_hwctx_sync_debug_bo()
      accel/amdxdna: Fix uninitialized return value

Louis Chauvet (10):
      drm/vkms: Add and remove VKMS instances via configfs
      drm/vkms: Allow to configure multiple planes via configfs
      drm/vkms: Allow to configure the plane type via configfs
      drm/vkms: Allow to configure multiple CRTCs via configfs
      drm/vkms: Allow to configure CRTC writeback support via configfs
      drm/vkms: Allow to attach planes and CRTCs via configfs
      drm/vkms: Allow to configure multiple encoders via configfs
      drm/vkms: Allow to attach encoders and CRTCs via configfs
      drm/vkms: Allow to configure multiple connectors via configfs
      drm/vkms: Allow to attach connectors and encoders via configfs

Maciej Falkowski (1):
      accel/ivpu: Add support for Nova Lake's NPU

Marcus Folkesson (1):
      drm/sitronix/st7571-i2c: remove unneeded semicolon

Marek Vasut (4):
      dt-bindings: gpu: img,powervr-rogue: Drop useless power domains items
      dt-bindings: gpu: img,powervr-rogue: Rework the allOf section
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode
      dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+

Philipp Stanner (1):
      MAINTAINERS: Maintain spsc_queue through drm_sched

Rob Herring (Arm) (2):
      dt-bindings: npu: Add Arm Ethos-U65/U85
      accel: Add Arm Ethos-U NPU driver

Ruben Wauters (1):
      drm/gud: rearrange gud_probe() to prepare for function splitting

Thomas Zimmermann (7):
      drm/sysfb: Use new CRTC state in begin_fb_access
      drm/client: Add client free callback to unprepare fb_helper
      drm/log: Do not hold lock across drm_client_release()
      drm/log: Add free callback
      drm/client: Do not free client memory by default
      Merge drm/drm-next into drm-misc-next
      drm/gem-atomic: Reset plane state to NULL if allocation failed

Troy Hanson (1):
      accel/qaic: Rename constant for clarity

Youssef Samir (1):
      accel/qaic: Update the sahara image table for AIC200

 .mailmap                                           |   1 +
 .../display/bridge/renesas,dsi-csi2-tx.yaml        |  53 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  86 ++-
 .../devicetree/bindings/npu/arm,ethos.yaml         |  79 ++
 Documentation/gpu/vkms.rst                         | 100 ++-
 MAINTAINERS                                        |  18 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   1 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   2 +-
 drivers/accel/amdxdna/aie2_pci.c                   |   4 +-
 drivers/accel/ethosu/Kconfig                       |  11 +
 drivers/accel/ethosu/Makefile                      |   4 +
 drivers/accel/ethosu/ethosu_device.h               | 197 +++++
 drivers/accel/ethosu/ethosu_drv.c                  | 403 ++++++++++
 drivers/accel/ethosu/ethosu_drv.h                  |  15 +
 drivers/accel/ethosu/ethosu_gem.c                  | 704 +++++++++++++++++
 drivers/accel/ethosu/ethosu_gem.h                  |  46 ++
 drivers/accel/ethosu/ethosu_job.c                  | 496 ++++++++++++
 drivers/accel/ethosu/ethosu_job.h                  |  40 +
 drivers/accel/ivpu/ivpu_drv.c                      |   1 +
 drivers/accel/ivpu/ivpu_drv.h                      |   4 +
 drivers/accel/ivpu/ivpu_fw.c                       |   2 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |  10 +
 drivers/accel/qaic/qaic_control.c                  |  14 +-
 drivers/accel/qaic/qaic_data.c                     |   2 +-
 drivers/accel/qaic/sahara.c                        |   5 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |   2 -
 drivers/gpu/drm/clients/drm_fbdev_client.c         |  17 +-
 drivers/gpu/drm/clients/drm_log.c                  |  16 +-
 drivers/gpu/drm/drm_client.c                       |   4 +
 drivers/gpu/drm/drm_client_event.c                 |   9 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |   4 -
 drivers/gpu/drm/drm_fbdev_shmem.c                  |   2 -
 drivers/gpu/drm/drm_fbdev_ttm.c                    |   2 -
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   2 -
 drivers/gpu/drm/gma500/fbdev.c                     |   3 -
 drivers/gpu/drm/gud/gud_drv.c                      |  45 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 -
 drivers/gpu/drm/msm/msm_fbdev.c                    |   2 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   2 -
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   2 -
 drivers/gpu/drm/sitronix/st7571-i2c.c              |   2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |   2 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   2 -
 drivers/gpu/drm/ttm/ttm_module.c                   |   3 +-
 drivers/gpu/drm/vkms/Kconfig                       |   1 +
 drivers/gpu/drm/vkms/Makefile                      |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |  24 +
 drivers/gpu/drm/vkms/vkms_config.c                 |   8 +-
 drivers/gpu/drm/vkms/vkms_config.h                 |  26 +
 drivers/gpu/drm/vkms/vkms_configfs.c               | 833 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h               |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c              |  35 +
 drivers/gpu/drm/vkms/vkms_connector.h              |   9 +
 drivers/gpu/drm/vkms/vkms_drv.c                    |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  20 +
 include/drm/drm_client.h                           |  10 +
 include/uapi/drm/ethosu_accel.h                    | 261 +++++++
 59 files changed, 3553 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/npu/arm,ethos.yaml
 create mode 100644 drivers/accel/ethosu/Kconfig
 create mode 100644 drivers/accel/ethosu/Makefile
 create mode 100644 drivers/accel/ethosu/ethosu_device.h
 create mode 100644 drivers/accel/ethosu/ethosu_drv.c
 create mode 100644 drivers/accel/ethosu/ethosu_drv.h
 create mode 100644 drivers/accel/ethosu/ethosu_gem.c
 create mode 100644 drivers/accel/ethosu/ethosu_gem.h
 create mode 100644 drivers/accel/ethosu/ethosu_job.c
 create mode 100644 drivers/accel/ethosu/ethosu_job.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
 create mode 100644 include/uapi/drm/ethosu_accel.h
