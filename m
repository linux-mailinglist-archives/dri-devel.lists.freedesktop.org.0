Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A535777733D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733310E178;
	Thu, 10 Aug 2023 08:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD85E10E4F8;
 Thu, 10 Aug 2023 08:45:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E29F11F38D;
 Thu, 10 Aug 2023 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691657106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HieUFFEhS371BFaeYgh0Wv5pQUyZa8IvLPhfyC+M4YA=;
 b=dBzF4xirR0HT320QWSsJfRGVmD9ZKepGEauyBA288TFExyr4SZ90mnkotHpJx6a5ZfMNIU
 ij7fPEYhKra5QhSqtPJAtuSze5dpwkscNiikR58AVoqdzRPrlP4mQq84a8gzls2nbQTjI7
 hiLSfMIgg0D9t70whJHiG2u6YEld/zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691657106;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HieUFFEhS371BFaeYgh0Wv5pQUyZa8IvLPhfyC+M4YA=;
 b=3o5Q5XrxSJsu3vYZ8W65FfFuxVf0C5hesLeGpWq8YNV47g/qTByScywj1Q+urExEAlmB2i
 iOSv6sA3ttHEcsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1F4F138E2;
 Thu, 10 Aug 2023 08:45:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S9eAJpKj1GQRbAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Aug 2023 08:45:06 +0000
Date: Thu, 10 Aug 2023 10:45:05 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20230810084505.GA14039@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

this is the PR for drm-misc-next; presumably the final one before
-rc6. Half of the patches update fbdev drivers to make them use the
provided helpers and macros. The big feature is nouveau's support
for tracking virtual memory on the GPU, which enables Vulkan sparse
binding and residency.

Best regard
Thomas

drm-misc-next-2023-08-10:
drm-misc-next for v6.6:

UAPI Changes:

 * nouveau:
   * Provide several GETPARAM ioctls
   * Provide VM_BIND ioctls

Cross-subsystem Changes:

 * fbdev: Convert many drivers to fbdev I/O-memory helpers

 * media/vivid: Convert to fbdev I/O-memory helpers

 * vfio-dev/mdpy-fb: Convert to fbdev I/O-memory helpers

Core Changes:

 * Documentation fixes

 * Do not select framebuffer console for fbdev emulation, fixes Kconfig
   dependencies

 * exec:
   * Add test cases for calling drm_exec() multiple times
   * Fix memory leak in sleftests
   * Build fixes

 * gem:
   * Fix lockdep checking

 * ttm:
   * Add Kunit tests
   * Cleanups

Driver Changes:

 * atmel-hlcdc:
   * Support inverted pixclock polarity, required by several SoCs

 * bridge:
   * dw-hdmi: Update EDID on HDMI detection
   * sitronix-st7789v: Support panel orientation; Support rotation
                       property; Add support for Jasonic
 		       JT240MHQS-HWT-EK-E3 plus DT bindings; Minor
       		       fixes

 * ivpu:
   * Support VPU4
   * Refactorings

 * loongson:
   * Fixes

 * mcde:
   * Cleanups

 * nouveau:
   * Track GPU virtual memory via DRM GPUVA manager, enables Vulkan
     sparse binding/residency

 * panfrost:
   * Fix synchronization in IRQ handling

 * tve200:
   * Cleanups
The following changes since commit a0769f25a3a621e8bbfb5e2a26e8ae462c761e33:

  HID: i2c-hid: add more DRM dependencies (2023-08-03 07:36:41 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-08-10

for you to fetch changes up to 2799804ac651da1375ecb9b9a644eba97218df07:

  drm/ttm: Remove two unused function declarations (2023-08-10 09:12:08 +0200)

----------------------------------------------------------------
drm-misc-next for v6.6:

UAPI Changes:

 * nouveau:
   * Provide several GETPARAM ioctls
   * Provide VM_BIND ioctls

Cross-subsystem Changes:

 * fbdev: Convert many drivers to fbdev I/O-memory helpers

 * media/vivid: Convert to fbdev I/O-memory helpers

 * vfio-dev/mdpy-fb: Convert to fbdev I/O-memory helpers

Core Changes:

 * Documentation fixes

 * Do not select framebuffer console for fbdev emulation, fixes Kconfig
   dependencies

 * exec:
   * Add test cases for calling drm_exec() multiple times
   * Fix memory leak in sleftests
   * Build fixes

 * gem:
   * Fix lockdep checking

 * ttm:
   * Add Kunit tests
   * Cleanups

Driver Changes:

 * atmel-hlcdc:
   * Support inverted pixclock polarity, required by several SoCs

 * bridge:
   * dw-hdmi: Update EDID on HDMI detection
   * sitronix-st7789v: Support panel orientation; Support rotation
                       property; Add support for Jasonic
 		       JT240MHQS-HWT-EK-E3 plus DT bindings; Minor
       		       fixes

 * ivpu:
   * Support VPU4
   * Refactorings

 * loongson:
   * Fixes

 * mcde:
   * Cleanups

 * nouveau:
   * Track GPU virtual memory via DRM GPUVA manager, enables Vulkan
     sparse binding/residency

 * panfrost:
   * Fix synchronization in IRQ handling

 * tve200:
   * Cleanups

----------------------------------------------------------------
Christian König (2):
      drm/exec: use unique instead of local label
      drm/exec: add test case for using a drm_exec multiple times

Dan Carpenter (1):
      drm/loongson: Add a check for lsdc_bo_create() errors

Danilo Krummrich (17):
      drm/gem: fix lockdep check for dma-resv lock
      drm/nouveau: new VM_BIND uAPI interfaces
      drm/nouveau: get vmm via nouveau_cli_vmm()
      drm/nouveau: bo: initialize GEM GPU VA interface
      drm/nouveau: move usercopy helpers to nouveau_drv.h
      drm/nouveau: fence: separate fence alloc and emit
      drm/nouveau: fence: fail to emit when fence context is killed
      drm/nouveau: chan: provide nouveau_channel_kill()
      drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
      drm/nouveau: implement new VM_BIND uAPI
      drm/nouveau: debugfs: implement DRM GPU VA debugfs
      nouveau/dmem: fix copy-paste error in nouveau_dmem_migrate_chunk()
      drm/nouveau: nvkm: vmm: silence warning from cast
      drm/nouveau: remove incorrect __user annotations
      drm/nouveau: uvmm: remove incorrect calls to mas_unlock()
      drm/nouveau: uvmm: remove dedicated VM pointer from VMAs
      drm/test: drm_exec: fix memory leak on object prepare

Dave Airlie (1):
      drm/nouveau: fixup the uapi header file.

Dmitry Osipenko (1):
      drm/panfrost: Sync IRQ by job's timeout handler

Faith Ekstrand (1):
      drm/nouveau/sched: Don't pass user flags to drm_syncobj_find_fence()

Jacek Lawrynowicz (3):
      accel/ivpu: Rename sources to use generation based names
      accel/ivpu: Use generation based function and registers names
      accel/ivpu: Switch to generation based FW names

Javier Martinez Canillas (1):
      drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION

Karol Wachowski (1):
      accel/ivpu: Refactor memory ranges logic

Karolina Stolarek (3):
      drm/ttm: Introduce KUnit test
      drm/ttm/tests: Add tests for ttm_device
      drm/ttm/tests: Add tests for ttm_pool

Michael Riesch (7):
      drm/panel: sitronix-st7789v: fix indentation in drm_panel_funcs
      drm/panel: sitronix-st7789v: add panel orientation support
      dt-bindings: display: add rotation property to sitronix,st7789v
      dt-bindings: vendor-prefixes: add jasonic
      dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 display
      drm/panel: sitronix-st7789v: add support for partial mode
      drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support

Miquel Raynal (1):
      drm: atmel-hlcdc: Support inverting the pixel clock polarity

Sandor Yu (1):
      drm: bridge: dw_hdmi: Fix ELD is not updated issue

Simon Ser (1):
      drm/doc: fix underline for section "DRM Sync Objects"

Stanislaw Gruszka (2):
      accel/ivpu: Extend get_param ioctl to identify capabilities
      accel/ivpu: Add initial support for VPU 4

Thomas Zimmermann (47):
      media/vivid: Use fbdev I/O helpers
      fbdev/acornfb: Use fbdev I/O helpers
      fbdev/asiliantfb: Use fbdev I/O helpers
      fbdev/atmel_lcdfb: Use fbdev I/O helpers
      fbdev/aty128fb: Use fbdev I/O helpers
      fbdev/carminefb: Use fbdev I/O helpers
      fbdev/chipsfb: Use fbdev I/O helpers
      fbdev/da8xx-fb: Use fbdev I/O helpers
      fbdev/efifb: Use fbdev I/O helpers
      fbdev/fm2fb: Use fbdev I/O helpers
      fbdev/fsl-diu-fb: Use fbdev I/O helpers
      fbdev/g364fb: Use fbdev I/O helpers
      fbdev/geode/gx1fb: Use fbdev I/O helpers
      fbdev/geode/gxfb: Use fbdev I/O helpers
      fbdev/geode/lxfb: Use fbdev I/O helpers
      fbdev/goldfishfb: Use fbdev I/O helpers
      fbdev/grvga: Use fbdev I/O helpers
      fbdev/gxt4500: Use fbdev I/O helpers
      fbdev/i740fb: Use fbdev I/O helpers
      fbdev/imxfb: Use fbdev I/O helpers
      fbdev/kyro: Use fbdev I/O helpers
      fbdev/macfb: Use fbdev I/O helpers
      fbdev/maxinefb: Use fbdev I/O helpers
      fbdev/mb862xxfb: Use fbdev I/O helpers
      fbdev/mmpfb: Use fbdev I/O helpers
      fbdev/mx3fb: Use fbdev I/O helpers
      fbdev/ocfb: Use fbdev I/O helpers
      fbdev/offb: Use fbdev I/O helpers
      fbdev/omapfb: Use fbdev I/O helpers
      fbdev/platinumfb: Use fbdev I/O helpers
      fbdev/pmag-aa-fb: Use fbdev I/O helpers
      fbdev/pmag-ba-fb: Use fbdev I/O helpers
      fbdev/pmagb-b-fb: Use fbdev I/O helpers
      fbdev/pxa168fb: Use fbdev I/O helpers
      fbdev/pxafb: Use fbdev I/O helpers
      fbdev/q40fb: Use fbdev I/O helpers
      fbdev/s3cfb: Use fbdev I/O helpers
      fbdev/sh7760fb: Use fbdev I/O helpers
      fbdev/simplefb: Use fbdev I/O helpers
      fbdev/sstfb: Use fbdev I/O helpers
      fbdev/sunxvr1000: Use fbdev I/O helpers
      fbdev/sunxvr2500: Use fbdev I/O helpers
      fbdev/uvesafb: Use fbdev I/O helpers
      fbdev/valkyriefb: Use fbdev I/O helpers
      fbdev/vesafb: Use fbdev I/O helpers
      fbdev/xilinxfb: Use fbdev I/O helpers
      vfio-dev/mdpy-fb: Use fbdev I/O helpers

Yue Haibing (1):
      drm/ttm: Remove two unused function declarations

Zhu Wang (2):
      drm/tve200: remove redundant of_match_ptr
      drm/mcde: remove redundant of_match_ptr

 .../bindings/display/panel/sitronix,st7789v.yaml   |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/gpu/driver-uapi.rst                  |   11 +
 Documentation/gpu/drm-mm.rst                       |    2 +-
 drivers/accel/ivpu/Makefile                        |    3 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   35 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   23 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   41 +-
 drivers/accel/ivpu/ivpu_gem.c                      |   10 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   12 +-
 .../accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c}   |  485 +++--
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |  281 +++
 drivers/accel/ivpu/ivpu_hw_40xx.c                  | 1178 ++++++++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |  267 +++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h               |  281 ---
 drivers/accel/ivpu/ivpu_mmu.c                      |   84 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |    8 +-
 drivers/gpu/drm/Kconfig                            |   16 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   25 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   12 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c                |    2 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    |    2 +-
 drivers/gpu/drm/nouveau/Kbuild                     |    3 +
 drivers/gpu/drm/nouveau/Kconfig                    |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    9 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h      |   26 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h         |   19 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |   20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   24 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |   42 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  219 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    3 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   22 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h             |    1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   39 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   27 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   93 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  411 +++++
 drivers/gpu/drm/nouveau/nouveau_exec.h             |   54 +
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   23 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   86 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   13 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  419 +++++
 drivers/gpu/drm/nouveau/nouveau_sched.h            |  127 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             | 1916 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |  108 ++
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |    4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c                 |  100 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |  214 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |  197 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |   25 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c  |   27 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |   99 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   16 +
 drivers/gpu/drm/tests/drm_exec_test.c              |   28 +-
 drivers/gpu/drm/ttm/Makefile                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig             |    4 +
 drivers/gpu/drm/ttm/tests/Makefile                 |    6 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |  212 +++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |  113 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |   41 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |  437 +++++
 drivers/gpu/drm/tve200/tve200_drv.c                |    2 +-
 drivers/media/test-drivers/vivid/Kconfig           |    4 +-
 drivers/media/test-drivers/vivid/vivid-osd.c       |    4 +-
 drivers/video/fbdev/Kconfig                        |  160 +-
 drivers/video/fbdev/acornfb.c                      |    4 +-
 drivers/video/fbdev/asiliantfb.c                   |    4 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    4 +-
 drivers/video/fbdev/aty/aty128fb.c                 |    4 +-
 drivers/video/fbdev/carminefb.c                    |    5 +-
 drivers/video/fbdev/chipsfb.c                      |    4 +-
 drivers/video/fbdev/da8xx-fb.c                     |    4 +-
 drivers/video/fbdev/efifb.c                        |    4 +-
 drivers/video/fbdev/fm2fb.c                        |    4 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    4 +-
 drivers/video/fbdev/g364fb.c                       |    4 +-
 drivers/video/fbdev/geode/Kconfig                  |   12 +-
 drivers/video/fbdev/geode/gx1fb_core.c             |    5 +-
 drivers/video/fbdev/geode/gxfb_core.c              |    5 +-
 drivers/video/fbdev/geode/lxfb_core.c              |    5 +-
 drivers/video/fbdev/goldfishfb.c                   |    4 +-
 drivers/video/fbdev/grvga.c                        |    4 +-
 drivers/video/fbdev/gxt4500.c                      |    4 +-
 drivers/video/fbdev/i740fb.c                       |    4 +-
 drivers/video/fbdev/imxfb.c                        |    4 +-
 drivers/video/fbdev/kyro/fbdev.c                   |    4 +-
 drivers/video/fbdev/macfb.c                        |    4 +-
 drivers/video/fbdev/maxinefb.c                     |    4 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    4 +-
 drivers/video/fbdev/mmp/fb/Kconfig                 |    4 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c                 |    4 +-
 drivers/video/fbdev/mx3fb.c                        |    4 +-
 drivers/video/fbdev/ocfb.c                         |    4 +-
 drivers/video/fbdev/offb.c                         |    4 +-
 drivers/video/fbdev/omap/Kconfig                   |    4 +-
 drivers/video/fbdev/omap/omapfb_main.c             |    4 +-
 drivers/video/fbdev/platinumfb.c                   |    4 +-
 drivers/video/fbdev/pmag-aa-fb.c                   |    4 +-
 drivers/video/fbdev/pmag-ba-fb.c                   |    4 +-
 drivers/video/fbdev/pmagb-b-fb.c                   |    4 +-
 drivers/video/fbdev/pxa168fb.c                     |    4 +-
 drivers/video/fbdev/pxafb.c                        |    4 +-
 drivers/video/fbdev/q40fb.c                        |    4 +-
 drivers/video/fbdev/s3c-fb.c                       |    4 +-
 drivers/video/fbdev/sh7760fb.c                     |    4 +-
 drivers/video/fbdev/simplefb.c                     |    4 +-
 drivers/video/fbdev/sstfb.c                        |    4 +-
 drivers/video/fbdev/sunxvr1000.c                   |    4 +-
 drivers/video/fbdev/sunxvr2500.c                   |    4 +-
 drivers/video/fbdev/uvesafb.c                      |    4 +-
 drivers/video/fbdev/valkyriefb.c                   |    4 +-
 drivers/video/fbdev/vesafb.c                       |    4 +-
 drivers/video/fbdev/xilinxfb.c                     |    4 +-
 include/drm/drm_exec.h                             |   14 +-
 include/drm/drm_gem.h                              |   15 +-
 include/drm/ttm/ttm_bo.h                           |    2 -
 include/uapi/drm/ivpu_accel.h                      |    9 +-
 include/uapi/drm/nouveau_drm.h                     |  265 ++-
 samples/Kconfig                                    |    4 +-
 samples/vfio-mdev/mdpy-fb.c                        |    4 +-
 128 files changed, 7537 insertions(+), 1219 deletions(-)
 rename drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c} (52%)
 create mode 100644 drivers/accel/ivpu/ivpu_hw_37xx_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx_reg.h
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
