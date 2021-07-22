Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FA3D223A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4316EE80;
	Thu, 22 Jul 2021 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708456EE80;
 Thu, 22 Jul 2021 10:46:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="275436175"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="275436175"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:46:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="512496105"
Received: from acangian-mobl1.ger.corp.intel.com (HELO [10.249.47.93])
 ([10.249.47.93])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 03:46:31 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <2d0d2fe8-01fc-e216-c3fd-38db9e69944e@linux.intel.com>
Date: Thu, 22 Jul 2021 12:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2021-07-22:
drm-misc-next for v5.15-rc1:

UAPI Changes:
- Remove sysfs stats for dma-buf attachments, as it causes a performance regression.
  Previous merge is not in a rc kernel yet, so no userspace regression possible.

Cross-subsystem Changes:
- Sanitize user input in kyro's viewport ioctl.
- Use refcount_t in fb_info->count
- Assorted fixes to dma-buf.
- Extend x86 efifb handling to all archs.
- Fix neofb divide by 0.
- Document corpro,gm7123 bridge dt bindings.

Core Changes:
- Slightly rework drm master handling.
- Cleanup vgaarb handling.
- Assorted fixes.

Driver Changes:
- Add support for ws2401 panel.
- Assorted fixes to stm, ast, bochs.
- Demidlayer ingenic irq.
The following changes since commit 17a1837d07be38d957af453e08788edbe1f9343a:

  drm/dp: For drm_panel_dp_aux_backlight(), init backlight as disabled (2021-07-15 08:03:29 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-07-22

for you to fetch changes up to 474596fc749ca8c87520fbd3529ff89464a94430:

  dt-bindings: display: simple-bridge: Add corpro,gm7123 compatible (2021-07-22 11:42:54 +0200)

----------------------------------------------------------------
drm-misc-next for v5.15-rc1:

UAPI Changes:
- Remove sysfs stats for dma-buf attachments, as it causes a performance regression.
  Previous merge is not in a rc kernel yet, so no userspace regression possible.

Cross-subsystem Changes:
- Sanitize user input in kyro's viewport ioctl.
- Use refcount_t in fb_info->count
- Assorted fixes to dma-buf.
- Extend x86 efifb handling to all archs.
- Fix neofb divide by 0.
- Document corpro,gm7123 bridge dt bindings.

Core Changes:
- Slightly rework drm master handling.
- Cleanup vgaarb handling.
- Assorted fixes.

Driver Changes:
- Add support for ws2401 panel.
- Assorted fixes to stm, ast, bochs.
- Demidlayer ingenic irq.

----------------------------------------------------------------
Ainux.Wang (1):
      drm/ast: Zero is missing in detect function

Antonio Borneo (1):
      drm/stm: dsi: compute the transition time from LP to HS and back

Christoph Hellwig (7):
      vgaarb: remove VGA_DEFAULT_DEVICE
      vgaarb: remove vga_conflicts
      vgaarb: move the kerneldoc for vga_set_legacy_decoding to vgaarb.c
      vgaarb: cleanup vgaarb.h
      vgaarb: provide a vga_client_unregister wrapper
      vgaarb: remove the unused irq_set_state argument to vga_client_register
      vgaarb: don't pass a cookie to vga_client_register

Colin Ian King (1):
      video: fbdev: arcfb: remove redundant initialization of variable err

Desmond Cheong Zhi Xi (5):
      drm: avoid circular locks in drm_mode_getconnector
      drm: avoid blocking in drm_clients_info's rcu section
      drm: add a locked version of drm_is_current_master
      drm: serialize drm_file.master with a new spinlock
      drm: protect drm_master pointers in drm_lease.c

Guangming Cao (1):
      dma_buf: remove dmabuf sysfs teardown before release

Hridya Valsaraju (1):
      dma-buf: Delete the DMA-BUF attachment sysfs statistics

Jagan Teki (1):
      drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached

Javier Martinez Canillas (2):
      drivers/firmware: move x86 Generic System Framebuffers support
      drivers/firmware: consolidate EFI framebuffer setup for all arches

Jim Cromie (1):
      drm/print: fixup spelling in a comment

Juan A. Suarez Romero (1):
      drm/v3d: Expose performance counters to userspace

KuoHsiang Chou (1):
      drm/ast: Disable fast reset after DRAM initial

Linus Walleij (2):
      drm/panel: Add DT bindings for Samsung LMS380KF01
      drm/panel: ws2401: Add driver for WideChips WS2401

Maxime Ripard (1):
      dt-bindings: display: simple-bridge: Add corpro,gm7123 compatible

Thomas Zimmermann (1):
      drm/ingenic: Convert to Linux IRQ interfaces

Xiyu Yang (1):
      fbmem: Convert from atomic_t to refcount_t on fb_info->count

Yang Yingliang (1):
      drm/bochs: Fix missing pci_disable_device() on error in bochs_pci_probe()

Zheyu Ma (2):
      video: fbdev: kyro: fix a DoS bug by restricting user input
      video: fbdev: neofb: add a check against divide error

 .../ABI/testing/sysfs-kernel-dmabuf-buffers        |  28 --
 .../bindings/display/bridge/simple-bridge.yaml     |   3 +
 .../bindings/display/panel/samsung,lms380kf01.yaml |  99 +++++
 MAINTAINERS                                        |   7 +
 arch/arm/include/asm/efi.h                         |   5 +-
 arch/arm64/include/asm/efi.h                       |   5 +-
 arch/riscv/include/asm/efi.h                       |   5 +-
 arch/x86/Kconfig                                   |  26 --
 arch/x86/kernel/Makefile                           |   3 -
 drivers/dma-buf/dma-buf-sysfs-stats.c              | 140 +------
 drivers/dma-buf/dma-buf-sysfs-stats.h              |  27 --
 drivers/dma-buf/dma-buf.c                          |  18 +-
 drivers/firmware/Kconfig                           |  32 ++
 drivers/firmware/Makefile                          |   2 +
 drivers/firmware/efi/Makefile                      |   2 +
 drivers/firmware/efi/efi-init.c                    |  90 -----
 .../kernel => drivers/firmware/efi}/sysfb_efi.c    |  78 +++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c      |  37 +-
 .../kernel => drivers/firmware}/sysfb_simplefb.c   |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  11 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   6 +
 drivers/gpu/drm/ast/ast_main.c                     |   5 +
 drivers/gpu/drm/ast/ast_mode.c                     |   2 +-
 drivers/gpu/drm/ast/ast_post.c                     |  91 +++--
 drivers/gpu/drm/drm_auth.c                         |  93 +++--
 drivers/gpu/drm/drm_connector.c                    |   5 +-
 drivers/gpu/drm/drm_debugfs.c                      |   3 +-
 drivers/gpu/drm/drm_file.c                         |   1 +
 drivers/gpu/drm/drm_irq.c                          |   4 +-
 drivers/gpu/drm/drm_lease.c                        |  81 +++-
 drivers/gpu/drm/i915/display/intel_vga.c           |   9 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   5 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c              |   8 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     | 441 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_device.c             |  11 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |  17 +-
 drivers/gpu/drm/stm/ltdc.c                         |   8 +-
 drivers/gpu/drm/tiny/Kconfig                       |   4 +-
 drivers/gpu/drm/tiny/bochs.c                       |   2 +-
 drivers/gpu/drm/v3d/Makefile                       |   1 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |   8 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |  63 +++
 drivers/gpu/drm/v3d/v3d_gem.c                      |  31 ++
 drivers/gpu/drm/v3d/v3d_perfmon.c                  | 213 ++++++++++
 drivers/gpu/drm/v3d/v3d_regs.h                     |   2 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |  16 +
 drivers/gpu/vga/vgaarb.c                           |  67 ++--
 drivers/vfio/pci/vfio_pci.c                        |  11 +-
 drivers/video/fbdev/arcfb.c                        |   2 +-
 drivers/video/fbdev/core/fbmem.c                   |   6 +-
 drivers/video/fbdev/kyro/fbdev.c                   |   5 +
 drivers/video/fbdev/neofb.c                        |   2 +-
 include/drm/drm_auth.h                             |   1 +
 include/drm/drm_file.h                             |  18 +-
 include/drm/drm_print.h                            |   2 +-
 include/linux/dma-buf.h                            |  17 -
 include/linux/fb.h                                 |   3 +-
 {arch/x86/include/asm => include/linux}/sysfb.h    |  32 +-
 include/linux/vgaarb.h                             | 118 ++----
 include/uapi/drm/v3d_drm.h                         | 136 +++++++
 62 files changed, 1571 insertions(+), 641 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (75%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (81%)
 create mode 100644 drivers/gpu/drm/panel/panel-widechips-ws2401.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_perfmon.c
 rename {arch/x86/include/asm => include/linux}/sysfb.h (70%)
