Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A31A76F9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD636E4AF;
	Tue, 14 Apr 2020 09:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13089CD4;
 Tue, 14 Apr 2020 09:07:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E15DAA55;
 Tue, 14 Apr 2020 09:07:40 +0000 (UTC)
Date: Tue, 14 Apr 2020 11:07:38 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200414090738.GA16827@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

with 5.7-rc1 being tagged, here's the first PR for drm-next-misc for what w=
ill become Linux 5.8.

Best regards
Thomas


drm-misc-next-2020-04-14:
drm-misc-next for 5.8:

UAPI Changes:

  - drm: error out with EBUSY when device has existing master
  - drm: rework SET_MASTER and DROP_MASTER perm handling

Cross-subsystem Changes:

  - fbdev: savage: fix -Wextra build warning
  - video: omap2: Use scnprintf() for avoiding potential buffer overflow

Core Changes:

  - Remove drm_pci.h
  - drm_pci_{alloc/free)() are now legacy
  - Introduce managed DRM resourcesA
  - Allow drivers to subclass struct drm_framebuffer
  - Introduce struct drm_afbc_framebuffer and helpers
  - fbdev: remove return value from generic fbdev setup
  - Introduce simple-encoder helper
  - vram-helpers: set fence on plane
  - dp_mst: ACT timeout improvements
  - dp_mst: Remove drm_dp_mst_has_audio()
  - TTM: ttm_trace_dma_{map/unmap}() cleanups
  - dma-buf: add flag for PCIP2P support
  - EDID: Various improvements
  - Encoder: cleanup semantics of possible_clones and possible_crtcs
  - VBLANK documentation updates
  - Writeback documentation updates

Driver Changes:

  - Convert several drivers to i2c_new_client_device()
  - Drop explicit drm_mode_config_cleanup() calls from drivers
  - Auto-release device structures with drmm_add_final_kfree()
  - Init bfdev console after registering DRM device
  - Make various .debugfs functions return 0 unconditionally; ignore errors
  - video: Use scnprintf() to avoid buffer overflows
  - Convert drivers to simple encoders

  - drm/amdgpu: note that we can handle peer2peer DMA-buf
  - drm/amdgpu: add support for exporting VRAM using DMA-buf v3
  - drm/kirin: Revert change to register connectors
  - drm/lima: Add optional devfreq and cooling device support
  - drm/lima: Various improvements wrt. task handling
  - drm/panel: nt39016: Support multiple modes and 50Hz
  - drm/panel: Support Leadtek LTK050H3146W
  - drm/rockchip: Add support for afbc
  - drm/virtio: Various cleanups
  - drm/hisilicon/hibmc: Enforce 128-byte stride alignment
  - drm/qxl: Fix notify port address of cursor ring buffer
  - drm/sun4i: Improvements to format handling
  - drm/bridge: dw-hdmi: Various improvements

The following changes since commit c2556238120bce8be37670e145226c12870a9e5a:

  Merge branch 'feature/staging_sm5' of git://people.freedesktop.org/~srola=
nd/linux into drm-next (2020-03-25 15:45:45 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-04-14

for you to fetch changes up to 14d0066b8477775971db7d0ef03c86fefe4d5bf2:

  drm: kirin: Revert change to add register connect helper functions (2020-=
04-13 01:46:02 +0000)

----------------------------------------------------------------
drm-misc-next for 5.8:

UAPI Changes:

  - drm: error out with EBUSY when device has existing master
  - drm: rework SET_MASTER and DROP_MASTER perm handling

Cross-subsystem Changes:

  - fbdev: savage: fix -Wextra build warning
  - video: omap2: Use scnprintf() for avoiding potential buffer overflow

Core Changes:

  - Remove drm_pci.h
  - drm_pci_{alloc/free)() are now legacy
  - Introduce managed DRM resourcesA
  - Allow drivers to subclass struct drm_framebuffer
  - Introduce struct drm_afbc_framebuffer and helpers
  - fbdev: remove return value from generic fbdev setup
  - Introduce simple-encoder helper
  - vram-helpers: set fence on plane
  - dp_mst: ACT timeout improvements
  - dp_mst: Remove drm_dp_mst_has_audio()
  - TTM: ttm_trace_dma_{map/unmap}() cleanups
  - dma-buf: add flag for PCIP2P support
  - EDID: Various improvements
  - Encoder: cleanup semantics of possible_clones and possible_crtcs
  - VBLANK documentation updates
  - Writeback documentation updates

Driver Changes:

  - Convert several drivers to i2c_new_client_device()
  - Drop explicit drm_mode_config_cleanup() calls from drivers
  - Auto-release device structures with drmm_add_final_kfree()
  - Init bfdev console after registering DRM device
  - Make various .debugfs functions return 0 unconditionally; ignore errors
  - video: Use scnprintf() to avoid buffer overflows
  - Convert drivers to simple encoders

  - drm/amdgpu: note that we can handle peer2peer DMA-buf
  - drm/amdgpu: add support for exporting VRAM using DMA-buf v3
  - drm/kirin: Revert change to register connectors
  - drm/lima: Add optional devfreq and cooling device support
  - drm/lima: Various improvements wrt. task handling
  - drm/panel: nt39016: Support multiple modes and 50Hz
  - drm/panel: Support Leadtek LTK050H3146W
  - drm/rockchip: Add support for afbc
  - drm/virtio: Various cleanups
  - drm/hisilicon/hibmc: Enforce 128-byte stride alignment
  - drm/qxl: Fix notify port address of cursor ring buffer
  - drm/sun4i: Improvements to format handling
  - drm/bridge: dw-hdmi: Various improvements

----------------------------------------------------------------
Andrzej Pietrasiewicz (5):
      drm/core: Allow drivers allocate a subclass of struct drm_framebuffer
      drm/core: Add drm_afbc_framebuffer and a corresponding helper
      drm/rockchip: Add support for afbc
      drm/core: Use proper debugging macro
      drm/core: Calculate bpp in afbc helper

Arnd Bergmann (1):
      fbdev: mx3fb: avoid warning about psABI change

Chris Wilson (4):
      drm: Don't return 0 from a void drm_fbdev_generic_setup
      dma-buf: Prettify typecasts for dma-fence-chain
      dma-buf: Report signaled links inside dma-fence-chain
      dma-buf: Exercise dma-fence-chain under selftests

Christian K=F6nig (7):
      drm/mm: revert "Break long searches in fragmented address spaces"
      dma-buf: add peer2peer flag
      drm/ttm: lock resv object during destruction
      drm/amdgpu: note that we can handle peer2peer DMA-buf
      drm/amdgpu: add checks if DMA-buf P2P is supported
      drm/amdgpu: add support for exporting VRAM using DMA-buf v3
      drm/amdgpu: improve amdgpu_gem_info debugfs file

Daniel Vetter (56):
      drm/hisilicon: Drop unused #include
      MAINTAINERS: Better regex for dma_buf|fence|resv
      mm/sl[uo]b: export __kmalloc_track(_node)_caller
      drm/i915: Don't clear drvdata in ->release
      drm: add managed resources tied to drm_device
      drm: Set final_kfree in drm_dev_alloc
      drm/mipi_dbi: Use drmm_add_final_kfree in all drivers
      drm/udl: Use drmm_add_final_kfree
      drm/qxl: Use drmm_add_final_kfree
      drm/i915: Use drmm_add_final_kfree
      drm/cirrus: Use drmm_add_final_kfree
      drm/v3d: Use drmm_add_final_kfree
      drm/tidss: Use drmm_add_final_kfree
      drm/mcde: Use drmm_add_final_kfree
      drm/vgem: Use drmm_add_final_kfree
      drm/vkms: Use drmm_add_final_kfree
      drm/repaper: Use drmm_add_final_kfree
      drm/ingenic: Use drmm_add_final_kfree
      drm/gm12u320: Use drmm_add_final_kfree
      drm/<drivers>: Use drmm_add_final_kfree
      drm: Cleanups after drmm_add_final_kfree rollout
      drm: Handle dev->unique with drmm_
      drm: Use drmm_ for drm_dev_init cleanup
      drm: manage drm_minor cleanup with drmm_
      drm: Manage drm_gem_init with drmm_
      drm: Manage drm_vblank_cleanup with drmm_
      drm: Garbage collect drm_dev_fini
      drm: Manage drm_mode_config_init with drmm_
      drm/bochs: Remove leftover drm_atomic_helper_shutdown
      drm/bochs: Drop explicit drm_mode_config_cleanup
      drm/cirrus: Drop explicit drm_mode_config_cleanup call
      drm/cirrus: Fully embrace devm_
      drm/ingenic: Drop explicit drm_mode_config_cleanup call
      drm/mcde: Drop explicit drm_mode_config_cleanup call
      drm/mcde: More devm_drm_dev_init
      drm/meson: Drop explicit drm_mode_config_cleanup call
      drm/pl111: Drop explicit drm_mode_config_cleanup call
      drm/rcar-du: Drop explicit drm_mode_config_cleanup call
      drm/rockchip: Drop explicit drm_mode_config_cleanup call
      drm/stm: Drop explicit drm_mode_config_cleanup call
      drm/shmob: Drop explicit drm_mode_config_cleanup call
      drm/mtk: Drop explicit drm_mode_config_cleanup call
      drm/tidss: Drop explicit drm_mode_config_cleanup call
      drm/gm12u320: More drmm_
      drm/gm12u320: Use devm_drm_dev_init
      drm/gm12u320: Use helpers for shutdown/suspend/resume
      drm/gm12u320: Simplify upload work
      drm/repaper: Drop explicit drm_mode_config_cleanup call
      drm/mipi-dbi: Move drm_mode_config_init into mipi library
      drm/mipi-dbi: Drop explicit drm_mode_config_cleanup call
      drm/udl: Drop explicit drm_mode_config_cleanup call
      drm/udl: drop drm_driver.release hook
      drm: Add docs for managed resources
      drm/managed: Fix off-by-one in warning
      drm/pci: Move drm_pci_alloc/free under CONFIG_DRM_LEGACY
      drm: delete drm_pci.h

David Lu (2):
      dt-bindings: boe, tv101wum-n16: Add compatible for boe tv105wum-nw0.
      drm/panel: support for boe,tv105wum-nw0 dsi video mode panel

Emil Velikov (2):
      drm: rework SET_MASTER and DROP_MASTER perm handling
      drm: error out with EBUSY when device has existing master

Fabio Estevam (2):
      dt-bindings: display: ltk500hd1829: Remove the reg property
      dt-bindings: display: xpp055c272: Remove the reg property

Geert Uytterhoeven (1):
      drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data parameter const

Guido G=FCnther (2):
      dt-bindings: display/bridge: Add binding for NWL mipi dsi host contro=
ller
      drm/bridge: Add NWL MIPI DSI host controller support

Gurchetan Singh (4):
      drm/virtio: random virtgpu_drv.h cleanups
      drm/virtio: delete notify after virtio_gpu_cmd_context_create
      drm/virtio: delete notify in virtio_gpu_object_create
      drm/virtio: make virtio_gpu_object_attach void

Hans de Goede (1):
      drm/fb-helper: Add TODO for making drm_fb_helper_alloc_fbi fill apert=
ures

Harigovindan P (1):
      dt-bindings: display: add visionox rm69299 panel variant

Heiko Stuebner (2):
      dt-bindings: display: panel: Add binding document for Leadtek LTK050H=
3146W
      drm/panel: add panel driver for Leadtek LTK050H3146W

Huacai Chen (1):
      drm/qxl: Use correct notify port address when creating cursor ring

Huang Rui (1):
      drm/ttm: clean up ttm_trace_dma_map/ttm_trace_dma_unmap (v2)

Igor Matheus Andrade Torrente (1):
      drm: Correct a typo in a function comment

Jagan Teki (3):
      dt-bindings: display: panel: Convert feiyang,fy07024di26a30d to DT sc=
hema
      dt-bindings: display: panel: Convert sitronix,st7701 to DT schema
      MAINTAINERS: Update feiyang,st7701 panel bindings converted as YAML

Jason Yan (2):
      video: fbdev: matroxfb: remove dead code and set but not used variable
      video: fbdev: mb862xx: remove set but not used variable 'mdr'

Jernej Skrabec (6):
      drm/sun4i: de2: rgb field in de2 format struct is redundant
      drm/sun4i: de2: csc_mode in de2 format struct is mostly redundant
      drm/sun4i: de2: Don't return de2_fmt_info struct
      drm/sun4i: Sort includes in VI and UI layer code
      drm/bridge: dw-hdmi: Add support for RGB limited range
      drm/bridge: dw-hdmi: rework csc related functions

Jiri Slaby (1):
      drm/virtio: fix OOB in virtio_gpu_object_create

Joe Perches (1):
      drm: drm_vm: Use fallthrough;

Johan Jonker (2):
      dt-bindings: display: convert rockchip vop bindings to yaml
      dt-bindings: display: rockchip-vop: add additional properties

John Stultz (1):
      drm: kirin: Revert change to add register connect helper functions

Jonas Karlman (1):
      drm/bridge: dw-hdmi: do not force "none" scan mode

Jules Irenge (1):
      video: Add missing annotation for cyber2000fb_enable_ddc() and cyber2=
000fb_disable_ddc()

Laurent Pinchart (1):
      drm: Fix wrong kfree() in managed resource usage example

Lyude Paul (12):
      drm/amd/amdgpu_dm/mst: Remove unneeded edid assignment when destroyin=
g connectors
      drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callback
      drm/amd/amdgpu_dm/mst: Stop printing extra messages in dm_dp_add_mst_=
connector()
      drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connector
      drm/dp_mst: Fix NULL deref in drm_dp_get_one_sb_msg()
      drm/dp_mst: Don't drop NAKs for down responses
      drm/i915/dp_mst: Cast intel_connector->port as drm_dp_mst_port
      drm/dp_mst: Remove drm_dp_mst_has_audio()
      drm/dp_mst: Improve kdocs for drm_dp_check_act_status()
      drm/dp_mst: Reformat drm_dp_check_act_status() a bit
      drm/dp_mst: Increase ACT retry timeout to 3s
      drm/dp_mst: Print errors on ACT timeouts

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Marek Szyprowski (1):
      drm/bridge: sii9234: silence warning about regulators during deferred=
 probe

Markus Elfring (2):
      drm/sun4i: tcon: Delete an error message in sun4i_tcon_init_irq()
      drm/ingenic: Delete an error message in ingenic_drm_probe()

Martin Blumenstingl (1):
      drm/lima: Add optional devfreq and cooling device support

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Maya Rashish (1):
      drm/dp_mst: make build_clear_payload_id_table return void

Pascal Roeleven (2):
      dt-bindings: panel: Add binding for Starry KR070PE2T
      drm: panel: Add Starry KR070PE2T

Paul Cercueil (2):
      drm/panel: nt39016: Add support for multiple modes
      drm/panel: nt39016: Add support for 50 Hz refresh rate

Qiang Yu (5):
      drm/lima: save process info for debug usage
      drm/lima: add max_error_tasks module parameter
      drm/lima: save task info dump when task fail
      drm/lima: add error sysfs to export error task dump
      drm/lima: add trace point for tasks

Randy Dunlap (6):
      fbdev: fbmon: fix -Wextra build warnings
      fbdev: aty: fix -Wextra build warning
      fbdev: matrox: fix -Wextra build warnings
      fbdev: savage: fix -Wextra build warning
      fbdev: pm[23]fb.c: fix -Wextra build warnings and errors
      fbdev: via: fix -Wextra build warning and format warning

Sam Ravnborg (9):
      dt-bindings: display: grammar fixes in panel/
      drm/dp_mst: add kernel-doc for drm_dp_mst_port.fec_capable
      drm/fb: fix kernel-doc in drm_framebuffer.h
      drm/sched: fix kernel-doc in gpu_scheduler.h
      drm/bridge: fix kernel-doc warning in panel.c
      drm: writeback: document callbacks
      drm/writeback: wire drm_writeback.h to kernel-doc
      drm/vblank: Add intro to documentation
      fbdev: mx3fb: const pointer to ipu_di_signal_cfg

Sean Paul (3):
      drm/mst: Separate sideband packet header parsing from message building
      drm/mst: Support simultaneous down replies
      drm/dp_mst: Remove single tx msg restriction.

Simon Ser (1):
      drm: add docs about the IN_FORMATS plane property

Takashi Iwai (3):
      video: omapfb: Use scnprintf() for avoiding potential buffer overflow
      video: omap2: Use scnprintf() for avoiding potential buffer overflow
      video: uvesafb: Use scnprintf() for avoiding potential buffer overflow

Tang Bin (1):
      video: fbdev: don't print error message on platform_get_irq() failure

Thomas Zimmermann (32):
      drm/atmel-hlcdc: Use simple encoder
      drm/exynos: Use simple encoder
      drm/fsl-dcu: Use simple encoder
      drm/gma500: Use simple encoder
      drm/hisilicon/kirin: Use simple encoder
      drm/i2c/tda998x: Use simple encoder
      drm/imx: Use simple encoder
      drm/ingenic: Use simple encoder
      drm/mediatek: Use simple encoder
      drm/rcar-du: Use simple encoder
      drm/rockchip: Use simple encoder
      drm/shmobile: Use simple encoder
      drm/sun4i: Use simple encoder
      drm/tegra: Use simple encoder
      drm/tidss: Use simple encoder
      drm/tilcdc: Use simple encoder
      drm/vc4: Use simple encoder
      drm/virtgpu: Use simple encoder
      drm/vkms: Use simple encoder
      drm/zte: Use simple encoder
      drm/ast: Set up fbdev after registering device; remove error checks
      drm/hibmc: Remove error check from fbdev setup
      drm/kirin: Set up fbdev after fully registering device
      drm/ingenic: Remove error check from fbdev setup
      drm/mediatek: Remove error check from fbdev setup
      drm/mgag200: Set up fbdev after registering device; remove error chec=
ks
      drm/tilcdc: Set up fbdev after fully registering device
      drm/udl: Remove error check from fbdev setup
      drm/vboxvideo: Set up fbdev after registering device; remove error ch=
ecks
      drm/fb-helper: Remove return value from drm_fbdev_generic_setup()
      drm/vram-helpers: Set plane fence for display update
      drm/vram-helpers: Merge code into a single file

Tian Tao (1):
      drm/hisilicon: Enforce 128-byte stride alignment to fix the hardware =
limitation

Tomi Valkeinen (1):
      omapfb: Remove unused writeback code

Ville Syrj=E4l=E4 (16):
      drm: Constify topology id
      drm/edid: Swap some operands in for_each_displayid_db()
      drm/edid: Remove idx=3D=3D1 assumptions from all over the DispID pars=
ing
      drm/edid: Return DispID length from drm_find_displayid_extension()
      drm/edid: Move validate_displayid() drm_find_displayid_extension()
      drm/edid: Don't parse garbage as DispID blocks
      drm/edid: Don't include ext block csum in DispID size
      drm/edid: Clarify validate_displayid()
      drm/edid: Fix DispID tile parsing for override EDID
      drm: Include the encoder itself in possible_clones
      drm/gma500: Sanitize possible_clones
      drm/imx: Remove the bogus possible_clones setup
      drm: Validate encoder->possible_clones
      drm: Validate encoder->possible_crtcs
      drm: Skip drm_mode_config_validate() for !modeset
      drm/panel-leadtek-ltk500hd1829: Fix dotclock

Wambui Karuga (18):
      drm/tegra: remove checks for debugfs functions return value
      drm/tilcdc: remove check for return value of debugfs functions.
      drm/v3d: make v3d_debugfs_init() return 0
      drm/vc4: remove check of return value of drm_debugfs functions
      drm/arc: make arcgpu_debugfs_init() return 0.
      drm/arm: make hdlcd_debugfs_init() return 0
      drm/etnaviv: remove check for return value of drm_debugfs_create_file=
s()
      drm/msm: remove checks for return value of drm_debugfs_create_files()
      drm/sti: remove use of drm_debugfs functions as return values
      drm/vram-helper: make drm_vram_mm_debugfs_init() return 0
      drm/nouveau: make nouveau_drm_debugfs_init() return 0
      drm/pl111: make pl111_debugfs_init return 0
      drm/omap: remove checks for return value of drm_debugfs functions
      drm/i915: have *_debugfs_init() functions return void.
      drm: make various debugfs_init() functions return 0
      drm/debugfs: remove checks for return value of drm_debugfs functions.
      drm: convert .debugfs_init() hook to return void.
      drm/vram-helper: remove unneeded #if defined/endif guards.

Wolfram Sang (6):
      drm/amdgpu: convert to use i2c_new_client_device()
      drm/gma500: convert to use i2c_new_client_device()
      drm/i2c/sil164: convert to use i2c_new_client_device()
      drm/i2c/tda998x: convert to use i2c_new_client_device()
      drm/nouveau/therm: convert to use i2c_new_client_device()
      drm/radeon: convert to use i2c_new_client_device()

 .../bindings/display/bridge/nwl-dsi.yaml           |  226 ++++
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |    2 +
 .../bindings/display/panel/display-timings.yaml    |    8 +-
 .../display/panel/feiyang,fy07024di26a30d.txt      |   20 -
 .../display/panel/feiyang,fy07024di26a30d.yaml     |   58 +
 .../display/panel/leadtek,ltk050h3146w.yaml        |   51 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |    1 -
 .../bindings/display/panel/panel-common.yaml       |    4 +-
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/sitronix,st7701.txt     |   30 -
 .../bindings/display/panel/sitronix,st7701.yaml    |   69 ++
 .../bindings/display/panel/visionox,rm69299.yaml   |   57 +
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |    1 -
 .../bindings/display/rockchip/rockchip-vop.txt     |   74 --
 .../bindings/display/rockchip/rockchip-vop.yaml    |  134 +++
 Documentation/gpu/drm-internals.rst                |   12 +
 Documentation/gpu/drm-kms.rst                      |    5 +-
 Documentation/gpu/drm-mm.rst                       |    9 -
 MAINTAINERS                                        |    6 +-
 drivers/dma-buf/Makefile                           |    3 +-
 drivers/dma-buf/dma-buf.c                          |    2 +
 drivers/dma-buf/dma-fence-chain.c                  |   10 +-
 drivers/dma-buf/selftests.h                        |    1 +
 drivers/dma-buf/st-dma-fence-chain.c               |  715 ++++++++++++
 drivers/gpu/drm/Makefile                           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   99 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   45 +-
 drivers/gpu/drm/arc/arcpgu_drv.c                   |    7 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    7 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    3 +-
 drivers/gpu/drm/armada/armada_drv.c                |    2 +
 drivers/gpu/drm/ast/ast_drv.c                      |    3 +
 drivers/gpu/drm/ast/ast_main.c                     |    5 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   12 +-
 drivers/gpu/drm/bochs/bochs.h                      |    1 -
 drivers/gpu/drm/bochs/bochs_drv.c                  |    6 +-
 drivers/gpu/drm/bochs/bochs_kms.c                  |   15 +-
 drivers/gpu/drm/bridge/Kconfig                     |   16 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                   | 1213 ++++++++++++++++=
++++
 drivers/gpu/drm/bridge/nwl-dsi.h                   |  144 +++
 drivers/gpu/drm/bridge/panel.c                     |    1 +
 drivers/gpu/drm/bridge/sii9234.c                   |    3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   86 +-
 drivers/gpu/drm/cirrus/cirrus.c                    |   74 +-
 drivers/gpu/drm/drm_atomic.c                       |    8 +-
 drivers/gpu/drm/drm_auth.c                         |   69 +-
 drivers/gpu/drm/drm_blend.c                        |    6 +
 drivers/gpu/drm/drm_bufs.c                         |    2 +-
 drivers/gpu/drm/drm_client.c                       |    8 +-
 drivers/gpu/drm/drm_connector.c                    |    6 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    4 +-
 drivers/gpu/drm/drm_debugfs.c                      |   45 +-
 drivers/gpu/drm/drm_dma.c                          |    2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  307 ++---
 drivers/gpu/drm/drm_drv.c                          |  219 ++--
 drivers/gpu/drm/drm_edid.c                         |  103 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   31 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    8 +-
 drivers/gpu/drm/drm_gem.c                          |   23 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  220 +++-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  124 +-
 drivers/gpu/drm/drm_internal.h                     |    7 +-
 drivers/gpu/drm/drm_ioctl.c                        |    4 +-
 drivers/gpu/drm/drm_managed.c                      |  275 +++++
 drivers/gpu/drm/drm_mipi_dbi.c                     |   33 +-
 drivers/gpu/drm/drm_mm.c                           |    8 +-
 drivers/gpu/drm/drm_mode_config.c                  |  110 +-
 drivers/gpu/drm/drm_pci.c                          |    4 +-
 drivers/gpu/drm/drm_vblank.c                       |   94 +-
 drivers/gpu/drm/drm_vm.c                           |    4 +-
 drivers/gpu/drm/drm_vram_helper_common.c           |   94 --
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   18 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |    8 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    8 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   14 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |   14 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   16 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   17 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   16 +-
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |   11 +-
 drivers/gpu/drm/gma500/mdfld_output.h              |    1 -
 drivers/gpu/drm/gma500/mdfld_tmd_vid.c             |    6 -
 drivers/gpu/drm/gma500/mdfld_tpo_vid.c             |    6 -
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   14 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    5 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   18 +-
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |   13 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |    9 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    8 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |    2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    9 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   43 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |    1 -
 drivers/gpu/drm/i2c/sil164_drv.c                   |    7 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   20 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   18 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |    4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    2 -
 drivers/gpu/drm/i915/i915_debugfs.c                |    8 +-
 drivers/gpu/drm/i915/i915_debugfs.h                |    4 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   22 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    3 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   32 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |    8 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |   10 +-
 drivers/gpu/drm/imx/imx-drm.h                      |    1 -
 drivers/gpu/drm/imx/imx-ldb.c                      |    8 +-
 drivers/gpu/drm/imx/imx-tve.c                      |    8 +-
 drivers/gpu/drm/imx/parallel-display.c             |    8 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |   34 +-
 drivers/gpu/drm/lima/Kconfig                       |    2 +
 drivers/gpu/drm/lima/Makefile                      |    4 +-
 drivers/gpu/drm/lima/lima_ctx.c                    |    3 +
 drivers/gpu/drm/lima/lima_ctx.h                    |    5 +
 drivers/gpu/drm/lima/lima_devfreq.c                |  234 ++++
 drivers/gpu/drm/lima/lima_devfreq.h                |   41 +
 drivers/gpu/drm/lima/lima_device.c                 |   17 +
 drivers/gpu/drm/lima/lima_device.h                 |   11 +
 drivers/gpu/drm/lima/lima_drv.c                    |  112 +-
 drivers/gpu/drm/lima/lima_drv.h                    |    1 +
 drivers/gpu/drm/lima/lima_dump.h                   |   77 ++
 drivers/gpu/drm/lima/lima_sched.c                  |  142 ++-
 drivers/gpu/drm/lima/lima_sched.h                  |   11 +
 drivers/gpu/drm/lima/lima_trace.c                  |    7 +
 drivers/gpu/drm/lima/lima_trace.h                  |   50 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |   35 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   14 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   13 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   14 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    5 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 +
 drivers/gpu/drm/mgag200/mgag200_main.c             |    4 -
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   18 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   14 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   23 +-
 drivers/gpu/drm/msm/msm_debugfs.h                  |    2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   26 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c     |    4 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |   29 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |   11 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   31 +
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  691 +++++++++++
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   46 +-
 drivers/gpu/drm/panel/panel-simple.c               |   29 +
 drivers/gpu/drm/pl111/pl111_debugfs.c              |    8 +-
 drivers/gpu/drm/pl111/pl111_drm.h                  |    2 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   12 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   21 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    2 -
 drivers/gpu/drm/qxl/qxl_drv.h                      |   13 +-
 drivers/gpu/drm/qxl/qxl_kms.c                      |    4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    6 +-
 drivers/gpu/drm/r128/ati_pcigart.c                 |    3 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |    4 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |    4 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    1 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   14 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |    4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    9 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    9 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    8 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    8 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   43 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  137 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   17 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   10 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    8 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   83 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    2 -
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |    6 +-
 drivers/gpu/drm/sti/sti_compositor.c               |    6 +-
 drivers/gpu/drm/sti/sti_compositor.h               |    4 +-
 drivers/gpu/drm/sti/sti_crtc.c                     |    2 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |   14 +-
 drivers/gpu/drm/sti/sti_drv.c                      |   16 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   13 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |    7 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   13 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   13 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   12 +-
 drivers/gpu/drm/sti/sti_mixer.c                    |   10 +-
 drivers/gpu/drm/sti/sti_mixer.h                    |    2 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |   13 +-
 drivers/gpu/drm/sti/sti_vid.c                      |    8 +-
 drivers/gpu/drm/sti/sti_vid.h                      |    2 +-
 drivers/gpu/drm/stm/drv.c                          |   10 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   12 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   12 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   17 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    4 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   17 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   12 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    8 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  111 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |   10 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   40 +-
 drivers/gpu/drm/tegra/dc.c                         |   11 +-
 drivers/gpu/drm/tegra/drm.c                        |    8 +-
 drivers/gpu/drm/tegra/drm.h                        |    2 -
 drivers/gpu/drm/tegra/dsi.c                        |   21 +-
 drivers/gpu/drm/tegra/hdmi.c                       |   20 +-
 drivers/gpu/drm/tegra/output.c                     |    6 +-
 drivers/gpu/drm/tegra/rgb.c                        |    8 +-
 drivers/gpu/drm/tegra/sor.c                        |   19 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   10 +-
 drivers/gpu/drm/tidss/tidss_encoder.c              |   10 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   19 +-
 drivers/gpu/drm/tidss/tidss_kms.h                  |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   20 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |   10 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    8 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |  226 ++--
 drivers/gpu/drm/tiny/hx8357d.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    5 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
 drivers/gpu/drm/tiny/repaper.c                     |   18 +-
 drivers/gpu/drm/tiny/st7586.c                      |    5 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
 drivers/gpu/drm/udl/udl_drv.c                      |   22 +-
 drivers/gpu/drm/udl/udl_drv.h                      |    2 -
 drivers/gpu/drm/udl/udl_main.c                     |   10 -
 drivers/gpu/drm/udl/udl_modeset.c                  |   21 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |    8 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   38 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    8 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   11 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    8 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   15 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   17 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |    8 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   15 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    3 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    8 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   36 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   13 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    1 -
 drivers/gpu/drm/virtio/virtgpu_object.c            |   21 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    9 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   19 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |    8 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |    4 +-
 drivers/gpu/drm/zte/zx_hdmi.c                      |    8 +-
 drivers/gpu/drm/zte/zx_tvenc.c                     |    8 +-
 drivers/gpu/drm/zte/zx_vga.c                       |    8 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    1 -
 drivers/video/fbdev/aty/atyfb_base.c               |    2 +-
 drivers/video/fbdev/core/fbmon.c                   |    2 +-
 drivers/video/fbdev/cyber2000fb.c                  |    2 +
 drivers/video/fbdev/matrox/g450_pll.c              |   22 -
 drivers/video/fbdev/matrox/matroxfb_base.h         |    2 +-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c      |    2 -
 drivers/video/fbdev/mx3fb.c                        |   20 +-
 drivers/video/fbdev/omap/omapfb_main.c             |   14 +-
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c       |  114 --
 drivers/video/fbdev/omap2/omapfb/dss/dss.h         |   20 -
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c    |    8 +-
 drivers/video/fbdev/pm2fb.c                        |    2 +-
 drivers/video/fbdev/pm3fb.c                        |    8 +-
 drivers/video/fbdev/savage/savagefb.h              |    2 +-
 drivers/video/fbdev/uvesafb.c                      |    2 +-
 drivers/video/fbdev/via/debug.h                    |    6 +-
 drivers/video/fbdev/via/viafbdev.c                 |    2 +-
 include/drm/drm_client.h                           |    2 +-
 include/drm/drm_connector.h                        |    4 +-
 include/drm/drm_debugfs.h                          |   16 +-
 include/drm/drm_device.h                           |   15 +
 include/drm/drm_displayid.h                        |    2 +-
 include/drm/drm_dp_mst_helper.h                    |   72 +-
 include/drm/drm_drv.h                              |   11 +-
 include/drm/drm_encoder.h                          |    8 +-
 include/drm/drm_fb_helper.h                        |    6 +-
 include/drm/drm_file.h                             |   11 +
 include/drm/drm_framebuffer.h                      |   38 +
 include/drm/drm_gem_framebuffer_helper.h           |   15 +
 include/drm/drm_gem_vram_helper.h                  |    2 +-
 include/drm/drm_legacy.h                           |   15 +
 include/drm/drm_managed.h                          |  109 ++
 include/drm/drm_mipi_dbi.h                         |    8 +-
 include/drm/drm_mode_config.h                      |   18 +-
 include/drm/drm_modeset_helper_vtables.h           |   27 +
 include/drm/drm_pci.h                              |   63 -
 include/drm/drm_print.h                            |    6 +
 include/drm/drm_writeback.h                        |    9 +
 include/drm/gpu_scheduler.h                        |    1 +
 include/drm/ttm/ttm_debug.h                        |   31 -
 include/linux/dma-buf.h                            |   10 +
 mm/slob.c                                          |    2 +
 mm/slub.c                                          |    2 +
 320 files changed, 7080 insertions(+), 2712 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nwl-ds=
i.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang=
,fy07024di26a30d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang=
,fy07024di26a30d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek=
,ltk050h3146w.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitroni=
x,st7701.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitroni=
x,st7701.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/visiono=
x,rm69299.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip-vop.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip-vop.yaml
 create mode 100644 drivers/dma-buf/st-dma-fence-chain.c
 create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.c
 create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.h
 create mode 100644 drivers/gpu/drm/drm_managed.c
 delete mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
 create mode 100644 drivers/gpu/drm/lima/lima_dump.h
 create mode 100644 drivers/gpu/drm/lima/lima_trace.c
 create mode 100644 drivers/gpu/drm/lima/lima_trace.h
 create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
 create mode 100644 include/drm/drm_managed.h
 delete mode 100644 include/drm/drm_pci.h
 delete mode 100644 include/drm/ttm/ttm_debug.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
