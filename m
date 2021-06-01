Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ACA397631
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27576E08E;
	Tue,  1 Jun 2021 15:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1856E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 15:11:41 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 452081FD3F;
 Tue,  1 Jun 2021 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622560300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twzuZROrciQFxDhQe9u9q5BzdA9ocw/hvi0DThUDFjs=;
 b=Zuws7nG1jzu0UkH6gwWyXUXiVmcjQWV02PvdmVM53yY9mdzOo1Mxlvz8BtPNUFmz1TdScR
 BdKalc8ghe+0BsM1Wu3L1tFg7S0a4O3PYAXrfhJIjexOH5YWah+UYu58oX1y5wfWJ4DzHi
 RdfuOfeCiFEgDNDRgRyqL0/kO+2mc9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622560300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twzuZROrciQFxDhQe9u9q5BzdA9ocw/hvi0DThUDFjs=;
 b=3hshQfjQ0ojTUgj2E8MdVPA7sqEEjfMkctM/f/+4o9YrOMQFtQe9BWR8mOkkKXb6+x/+NA
 x9CKbyTuXjE4SDAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id EFB06118DD;
 Tue,  1 Jun 2021 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622560300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twzuZROrciQFxDhQe9u9q5BzdA9ocw/hvi0DThUDFjs=;
 b=Zuws7nG1jzu0UkH6gwWyXUXiVmcjQWV02PvdmVM53yY9mdzOo1Mxlvz8BtPNUFmz1TdScR
 BdKalc8ghe+0BsM1Wu3L1tFg7S0a4O3PYAXrfhJIjexOH5YWah+UYu58oX1y5wfWJ4DzHi
 RdfuOfeCiFEgDNDRgRyqL0/kO+2mc9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622560300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twzuZROrciQFxDhQe9u9q5BzdA9ocw/hvi0DThUDFjs=;
 b=3hshQfjQ0ojTUgj2E8MdVPA7sqEEjfMkctM/f/+4o9YrOMQFtQe9BWR8mOkkKXb6+x/+NA
 x9CKbyTuXjE4SDAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id lfBuOStOtmB1RgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Jun 2021 15:11:39 +0000
Date: Tue, 1 Jun 2021 17:11:38 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YLZOKiYE6XFmE/MH@linux-uq9g.fritz.box>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next. It also contains last week's tag
because last week's email somehow went wrong. Each tag has it's individual
description, but the overview below contains the sum of both.

Some highlights from both weeks are

 * amdgpu hot-unplug support,
 * cached mappings for GEM CMA, and
 * new features for rockchip.

We changed the names of generic fbdev devices in /proc/fb. It's a UAPI
change, but probably a non-event. It's not expected that programs have
hard dependencies on DRM fbdev driver names.

Best regards
Thomas

drm-misc-next-2021-06-01:
drm-misc-next for 5.14:

UAPI Changes:

 * Use DRM driver names for fbdev

Cross-subsystem Changes:

Core Changes:

 * Fix leaked DMA handles

 * Improve documentation around DRM_CLIENT_CAP_*

 * Cleanups

 * dp_mst: Use kHz as link-rate unit during init

 * fourcc: Remove drm_gem_format_name() and drm_format_name_buf

 * gem-cma: Fix mmap for buffers with write combining

 * ttm: Don't override pre-set vm_ops; ttm_bo_mmap() removal and cleanups

Driver Changes:

 * drm/amdgpu: Fix hot unplug during suspend; Implement mmap as GEM object
   function; Use %p4cc format-string modifier; Cleanups

 * drm/bridge: Cdns: Fix PM reference leak, Cleanups; Lt8912b: Fix Coccinelle
   warnings; Fix Kconfig dependencies; Fixes and cleanups

 * drm/hisilicon/kirin: Cleanups

 * drm/nouveau: Implement mmap as GEM object function

 * drm/radeon: Implement mmap as GEM object function

 * drm/rockchip: Remove generic drivers during init; Add scaling for RK3036
   win1; Fix missing registers for RK3066 and 3188; Add alpha support for
   RK3036, RK3066, RK3126 and RK3188; Fixes and cleanups

 * drm/simpledrm: Use %p4cc: format-string modifier

 * drm/vmwgfx: Cleanups

 * fbdev/matrox: Use modern module_init()
The following changes since commit 5522e9f7b0fbe2a0cb89c199b574523becc8c3ab:

  Merge v5.13-rc3 into drm-next (2021-05-27 13:07:47 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-06-01

for you to fetch changes up to 2e290c8d8d29278b9a20e2765ab8f6df02f2e707:

  drm: document minimum kernel version for DRM_CLIENT_CAP_* (2021-05-31 18:57:22 +0200)

----------------------------------------------------------------
drm-misc-next for 5.14:

UAPI Changes:

 * DRM_IOCTL_IRQ_BUSID is now marked as legacy; returns -EINVAL if
   legacy drivers are disabled

 * Use DRM driver names for fbdev

Cross-subsystem Changes:

 * PCI: Add support for dev_groups

 * vgaarb: Use ACPI HID to find integrated GPU

Core Changes:

 * Log errors in drm_gem_fb_init_with_funcs()

 * Fix leaked DMA handles

 * Improve documentation around DRM_CLIENT_CAP_*

 * Cleanups

 * dp_mst: Use kHz as link-rate unit during init

 * fourcc: Remove drm_gem_format_name() and drm_format_name_buf

 * gem-cma: Add support for non-coherent (i.e., cached) page mappings; Fix
   mmap for buffers with write combining

 * legacy: Drop some unnecessary includes and code; Add missing unlocks
   and frees in drm_legacy_addbufs_pci()

 * sched: Make timeout timer rearm conditional; Fix data corruptions and
   hangs

 * ttm: Remap all page faults to per-process dummy page (for device removal);
   Don't override pre-set vm_ops; ttm_bo_mmap() removal and cleanups;
   Documentation

Driver Changes:

 * drm/amdgpu: A long list of patches that enable device hot-unplug;
   Implement mmap as GEM object function; Use %p4cc format-string
   modifier; Cleanups

 * drm/bridge: Lt66121: Fix error code and leak in probe; Anx7625: Use
   runtime PM and add synchronous suspend/resume hooks; Ti-sn65dsi86: Fix
   a returned value's type; Anx7688: Add driver plus DT bindings;
   Cdns: Fix PM reference leak, Cleanups; Lt8912b: Fix Coccinelle
   warnings; Fix Kconfig dependencies; Fixes and cleanups

 * drm/hisilicon/kirin: Cleanups

 * drm/ingenic: Fix pixcloc for 24-bit serial panels; Use non-coherent BO
   mappings with explict synchronization if possible

 * drm/nouveau: Implement mmap as GEM object function

 * drm/panel: Simple-panel: Add missing pm_runtime_dont_use_autosuspend()

 * drm/radeon: Implement mmap as GEM object function

 * drm/rockchip: Remove generic drivers during init; Add scaling for RK3036
   win1; Fix missing registers for RK3066 and 3188; Add alpha support for
   RK3036, RK3066, RK3126 and RK3188; Fixes and cleanups

 * drm/simpledrm: Use %p4cc: format-string modifier

 * drm/tve200: Convert DT bindings to YAML

 * drm/vc4: Support BCM2711 VEC plus DT bindings; Pipeline setup fixes; HDMI
   fixes

 * drm/vmwgfx: Cleanups

 * drm/virtio: Fix NULL pointer in probe; Fix double-free in probe; Free
   virtqueues in probe

 * fbdev/matrox: Use modern module_init()

----------------------------------------------------------------
Alex Bee (5):
      drm: rockchip: add scaling for RK3036 win1
      drm: rockchip: add missing registers for RK3188
      drm: rockchip: add missing registers for RK3066
      drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
      drm: rockchip: set alpha_en to 0 if it is not used

Andrey Grodzovsky (19):
      drm/ttm: Remap all page faults to per process dummy page.
      drm/amdgpu: Split amdgpu_device_fini into early and late
      drm/amdgpu: Add early fini callback
      drm/amdgpu: Handle IOMMU enabled case.
      drm/amdgpu: Remap all page faults to per process dummy page.
      PCI: Add support for dev_groups to struct pci_driver
      drm/amdgpu: Convert driver sysfs attributes to static attributes
      drm/amdgpu: Guard against write accesses after device removal
      drm/sched: Make timeout timer rearm conditional.
      drm/amdgpu: Prevent any job recoveries after device is unplugged.
      drm/amdgpu: Fix hang on device removal.
      drm/scheduler: Fix hang when sched_entity released
      drm/sched: Avoid data corruptions
      drm/amd/display: Remove superfluous drm_mode_config_cleanup
      drm/amdgpu: Verify DMA opearations from device are done
      drm/amdgpu: Unmap all MMIO mappings
      drm/amdgpu: Rename flag which prevents HW access
      drm/amdgpu: Fix crash when hot unplug in BACO
      drm/amdgpu: Fix clang warning: unused label 'exit'

Arnd Bergmann (1):
      fbdev: matrox: use modern module_init()

Christophe JAILLET (1):
      drm/rockchip: lvds: Fix an error handling path

Colin Ian King (1):
      drm/rockchip: cdn-dp: fix sign extension on an int multiply for a u64 result

Corentin Labbe (1):
      dt-bindings: display: convert faraday,tve200

Dafna Hirschfeld (1):
      dt-bindings: display: add google, cros-ec-anx7688.yaml

Dan Carpenter (3):
      drm: bridge: it66121: fix an error code in it66121_probe()
      drm: bridge: it66121: fix a resource leak in probe
      drm/bridge: ti-sn65dsi86: fix a ternary type promotion bug

Daniel Vetter (1):
      drm/ttm: Explain why ttm_bo_add_move_fence uses a shared slot

Douglas Anderson (1):
      drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend() calls

Enric Balletbo i Serra (1):
      drm/bridge: Add ChromeOS EC ANX7688 bridge driver support

Geert Uytterhoeven (1):
      drm/bridge: DRM_CROS_EC_ANX7688 should depend on I2C_CROS_EC_TUNNEL

Hao Fang (1):
      drm/hisilicon/kirin: Use the correct HiSilicon copyright

Javier Martinez Canillas (2):
      drm/fb-helper: improve DRM fbdev emulation device names
      drm/rockchip: remove existing generic drivers to take over the device

Jiapeng Chong (2):
      drm: bridge: cdns-mhdp8546: Fix inconsistent indenting
      drm/rockchip: remove unused function

Johan Jonker (1):
      drm/rockchip: vop: add PX30 version info

Joseph Kogut (1):
      drm: fix leaked dma handles after removing drm_pci_free

Kai-Heng Feng (1):
      vgaarb: Use ACPI HID name to find integrated GPU

Linus Walleij (2):
      drm/panel: s6e63m0: Depromote debug prints
      drm/bridge: lt8912b: Drop unused includes

Mateusz Kwiatkowski (3):
      drm/vc4: Fix clock source for VEC PixelValve on BCM2711
      dt-bindings: display: bcm2835-vec: Add BCM2711 compatible
      drm/vc4: Separate VEC compatible variants

Mauro Carvalho Chehab (1):
      gpu: drm: replace occurrences of invalid character

Maxime Ripard (12):
      drm/vc4: txp: Properly set the possible_crtcs mask
      drm/vc4: crtc: Skip the TXP
      drm/vc4: crtc: Pass the drm_atomic_state to config_pv
      drm/vc4: crtc: Fix vc4_get_crtc_encoder logic
      drm/vc4: crtc: Lookup the encoder from the register at boot
      drm/vc4: hdmi: Prevent clock unbalance
      drm/vc4: hvs: Make the HVS bind first
      drm/vc4: hdmi: Properly compute the BVB clock rate
      drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
      drm/vc4: hdmi: Enable the scrambler
      drm/vc4: hdmi: Add a workqueue to set scrambling
      Merge drm/drm-next into drm-misc-next

Nikola Cornij (1):
      drm/dp_mst: Use kHz as link rate units when settig source max link caps at init

Paul Cercueil (5):
      drm/ingenic: Fix pixclock rate for 24-bit serial panels
      drm: Add support for GEM buffers backed by non-coherent memory
      drm: Add and export function drm_fb_cma_sync_non_coherent
      drm/ingenic: Add option to alloc cached GEM buffers
      drm: Fix for GEM buffers with write-combine memory

Peter Robinson (1):
      drm/rockchip: cdn-dp-core: add MODULE_FIRMWARE macro

Pi-Hsun Shih (3):
      drm/bridge: anx7625: refactor power control to use runtime PM framework
      drm/bridge: anx7625: add suspend / resume hooks
      drm/bridge: anx7625: Synchronously run runtime suspend.

Sakari Ailus (1):
      drm: Remove drm_get_format_name()

Simon Ser (4):
      drm: log errors in drm_gem_fb_init_with_funcs
      drm: reference mode flags in DRM_CLIENT_CAP_* docs
      drm: clarify and linkify DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
      drm: document minimum kernel version for DRM_CLIENT_CAP_*

Thomas Hebb (2):
      drm/rockchip: dsi: move all lane config except LCDC mux to bind()
      drm/rockchip: dsi: remove extra component_del() call

Thomas Zimmermann (17):
      drm/i915: Don't include drm_legacy.h
      drm/nouveau: Don't include drm_legacy.h
      drm: Don't include drm_legacy.h in drm_lease.c
      drm: Remove unused branch in legacy PCI initialization
      drm: Mark IRQ_BUSID ioctl as legacy
      Merge drm/drm-next into drm-misc-next
      drm/ttm: Don't override vm_ops callbacks, if set
      drm/amdgpu: Implement mmap as GEM object function
      drm/radeon: Implement mmap as GEM object function
      drm/nouveau: Implement mmap as GEM object function
      drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
      drm/vmwgfx: Inline vmw_verify_access()
      drm/ttm: Remove ttm_bo_mmap() and friends
      drm/kconfig: Remove unused select of DRM_KMS_FB_HELPER
      drm/amdgpu: Use %p4cc to print 4CC format
      drm/simpledrm: Use %p4cc to print 4CC format
      drm/fourcc: Remove struct drm_format_buf_name

Xie Yongji (3):
      drm/virtio: Fixes a potential NULL pointer dereference on probe failure
      drm/virtio: Fix double free on probe failure
      drm/virtio: free virtqueues on probe failure

Yang Yingliang (1):
      drm/rockchip: cdn-dp-core: add missing clk_disable_unprepare() on error in cdn_dp_grf_write()

Yu Kuai (1):
      drm: bridge: cdns-mhdp8546: Fix PM reference leak in

Zhen Lei (1):
      drm/mcde: Remove redundant error printing in mcde_dsi_probe()

Zou Wei (4):
      drm: Fix missing unlock and free on error in drm_legacy_addbufs_pci()
      drm/vc4: hdmi: Fix PM reference leak in vc4_hdmi_encoder_pre_crtc_co()
      drm/bridge: cdns: Fix PM reference leak in cdns_dsi_transfer()
      drm/bridge: lt8912b: fix platform_no_drv_owner.cocci warnings

 .../bindings/display/brcm,bcm2835-vec.yaml         |   4 +-
 .../display/bridge/google,cros-ec-anx7688.yaml     |  82 +++++++++
 .../devicetree/bindings/display/faraday,tve200.txt |  54 ------
 .../bindings/display/faraday,tve200.yaml           |  68 ++++++++
 drivers/gpu/drm/Kconfig                            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 131 ++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  46 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h        |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  34 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  31 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  55 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  25 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  31 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  68 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  68 --------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  31 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  22 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   3 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  44 ++---
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |  26 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  22 ++-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  13 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 drivers/gpu/drm/amd/include/atombios.h             |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   2 +-
 drivers/gpu/drm/bridge/Kconfig                     |  13 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 181 ++++++++++---------
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   1 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   2 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           | 191 +++++++++++++++++++++
 drivers/gpu/drm/bridge/ite-it66121.c               |  10 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   3 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/drm_bufs.c                         |  11 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   8 +-
 drivers/gpu/drm/drm_fb_cma_helper.c                |  46 +++++
 drivers/gpu/drm/drm_fb_helper.c                    |   2 +-
 drivers/gpu/drm/drm_fourcc.c                       |  25 ---
 drivers/gpu/drm/drm_gem_cma_helper.c               |  41 ++++-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   7 +-
 drivers/gpu/drm/drm_internal.h                     |   8 -
 drivers/gpu/drm/drm_ioctl.c                        |   3 +-
 drivers/gpu/drm/drm_lease.c                        |   1 -
 drivers/gpu/drm/drm_legacy.h                       |   8 +
 drivers/gpu/drm/drm_pci.c                          |  11 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h       |   2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |   2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   1 -
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   1 -
 drivers/gpu/drm/i915/i915_gpu_error.h              |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  61 ++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |   1 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  21 ++-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  10 --
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  36 ++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |  51 ------
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |   1 -
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   6 +-
 drivers/gpu/drm/panel/panel-simple.c               |   2 +
 drivers/gpu/drm/r128/ati_pcigart.c                 |   2 +
 drivers/gpu/drm/r128/r128_drv.h                    |   2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   3 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |  49 ++++++
 drivers/gpu/drm/radeon/radeon_ttm.c                |  65 -------
 drivers/gpu/drm/radeon/radeon_ttm.h                |   1 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |   2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  45 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  10 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   4 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  54 ++++--
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |   1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |   8 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  35 +++-
 drivers/gpu/drm/tiny/simpledrm.c                   |   6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    | 114 ++++++------
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  68 ++++++--
 drivers/gpu/drm/vc4/vc4_drv.c                      |  11 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 147 +++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  10 ++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   3 +
 drivers/gpu/drm/vc4/vc4_txp.c                      |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  27 ++-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   4 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   9 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |  53 +++++-
 drivers/gpu/vga/vgaarb.c                           |  31 +++-
 drivers/pci/pci-driver.c                           |   1 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |   5 +-
 include/drm/drm_dp_mst_helper.h                    |   8 +-
 include/drm/drm_fb_cma_helper.h                    |   5 +
 include/drm/drm_fourcc.h                           |   9 -
 include/drm/drm_gem_cma_helper.h                   |   3 +
 include/drm/ttm/ttm_bo_api.h                       |  15 +-
 include/drm/ttm/ttm_device.h                       |  15 --
 include/linux/pci.h                                |   3 +
 include/uapi/drm/drm.h                             |  28 ++-
 149 files changed, 1809 insertions(+), 945 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt
 create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.yaml
 create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
