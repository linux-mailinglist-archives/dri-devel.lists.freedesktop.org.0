Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE8805DF
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 12:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A256E497;
	Sat,  3 Aug 2019 10:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDAF6E48E
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 10:47:28 +0000 (UTC)
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8B5C720003;
 Sat,  3 Aug 2019 10:47:21 +0000 (UTC)
Date: Sat, 3 Aug 2019 12:47:19 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20190803104719.gwb6hmreeaqyye6n@flea>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0451521891=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0451521891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oenumjjnz7rvq2td"
Content-Disposition: inline


--oenumjjnz7rvq2td
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here is the first (and pretty late) drm-misc-next PR.

It's pretty big due to the lateness, but there's nothing really major
showing up. It's pretty much the usual bunch of reworks, fixes, and
new helpers being introduced.

Thanks!
Maxime

drm-misc-next-2019-08-03:
drm-misc-next for 5.4:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - Continue to rework the include dependencies
 - fb: Remove the unused drm_gem_fbdev_fb_create function
 - drm-dp-helper: Make the link rate calculation more tolerant to
                  non-explicitly defined, yet supported, rates
 - fb-helper: Map DRM client buffer only when required, and instanciate a
	      shadow buffer when the device has a dirty function or says so
 - connector: Add a helper to link the DDC adapter used by that connector to
              the userspace

Driver Changes:
 - Remove drm_gem_prime_import/export from being defined in the drivers
 - Drop DRM_AUTH usage from drivers
 - Continue to drop drmP.h
 - Convert drivers to the connector ddc helper

 - ingenic: Add support for more panel-related cases
 - komeda: Support for dual-link
 - lima: Reduce logging
 - mpag200: Fix the cursor support
 - panfrost: Export GPU features register to userspace through an ioctl
 - pl111: Remove the CLD pads wiring support from the DT
 - rockchip: Rework to use DRM PSR helpers
 - sun4i: Improve support for color encoding and range
 - tinydrm: Rework SPI support, improve MIPI-DBI support, move to drm/tiny
 - vkms: Rework of the CRC tracking

 - bridges:
   - sii902x: Add support for audio graph card
   - tc358767: Rework AUX data handling code
   - ti-sn65dsi86: Add Debugfs and proper DSI mode flags support

 - panels
   - Support for GiantPlus GPM940B0, Sharp LQ070Y3DG3B, Ortustech
     COM37H3M, Novatek NT39016, Sharp LS020B1DD01D, Raydium RM67191,
     Boe Himax8279d, Sharp LD-D5116Z01B
   - Conversion of the device tree bindings to the YAML description
   - jh057n00900: Rework the enable / disable path

 - fbdev:
   - ssd1307fb: Support more devices based on that controller
The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2019-08-03

for you to fetch changes up to d6781e490179f7ba710dd924187109da70c185b0:

  drm/pl111: Drop special pads config check (2019-08-03 11:59:54 +0200)

----------------------------------------------------------------
drm-misc-next for 5.4:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - Continue to rework the include dependencies
 - fb: Remove the unused drm_gem_fbdev_fb_create function
 - drm-dp-helper: Make the link rate calculation more tolerant to
                  non-explicitly defined, yet supported, rates
 - fb-helper: Map DRM client buffer only when required, and instanciate a
	      shadow buffer when the device has a dirty function or says so
 - connector: Add a helper to link the DDC adapter used by that connector to
              the userspace

Driver Changes:
 - Remove drm_gem_prime_import/export from being defined in the drivers
 - Drop DRM_AUTH usage from drivers
 - Continue to drop drmP.h
 - Convert drivers to the connector ddc helper

 - ingenic: Add support for more panel-related cases
 - komeda: Support for dual-link
 - lima: Reduce logging
 - mpag200: Fix the cursor support
 - panfrost: Export GPU features register to userspace through an ioctl
 - pl111: Remove the CLD pads wiring support from the DT
 - rockchip: Rework to use DRM PSR helpers
 - sun4i: Improve support for color encoding and range
 - tinydrm: Rework SPI support, improve MIPI-DBI support, move to drm/tiny
 - vkms: Rework of the CRC tracking

 - bridges:
   - sii902x: Add support for audio graph card
   - tc358767: Rework AUX data handling code
   - ti-sn65dsi86: Add Debugfs and proper DSI mode flags support

 - panels
   - Support for GiantPlus GPM940B0, Sharp LQ070Y3DG3B, Ortustech
     COM37H3M, Novatek NT39016, Sharp LS020B1DD01D, Raydium RM67191,
     Boe Himax8279d, Sharp LD-D5116Z01B
   - Conversion of the device tree bindings to the YAML description
   - jh057n00900: Rework the enable / disable path

 - fbdev:
   - ssd1307fb: Support more devices based on that controller

----------------------------------------------------------------
Ahmad Fatoum (1):
      drm/stm: attach gem fence to atomic state

Anders Roxell (1):
      drm: mali-dp: Mark expected switch fall-through

Andrey Smirnov (15):
      drm/bridge: tc358767: Simplify tc_poll_timeout()
      drm/bridge: tc358767: Simplify polling in tc_main_link_setup()
      drm/bridge: tc358767: Simplify polling in tc_link_training()
      drm/bridge: tc358767: Simplify tc_set_video_mode()
      drm/bridge: tc358767: Drop custom tc_write()/tc_read() accessors
      drm/bridge: tc358767: Simplify AUX data read
      drm/bridge: tc358767: Simplify AUX data write
      drm/bridge: tc358767: Increase AUX transfer length limit
      drm/bridge: tc358767: Use reported AUX transfer size
      drm/bridge: tc358767: Introduce tc_set_syspllparam()
      drm/bridge: tc358767: Introduce tc_pllupdate()
      drm/bridge: tc358767: Simplify tc_aux_wait_busy()
      drm/bridge: tc358767: Drop unnecessary 8 byte buffer
      drm/bridge: tc358767: Replace magic number in tc_main_link_enable()
      drm/bridge: tc358767: Add support for address-only I2C transfers

Andrzej Pietrasiewicz (13):
      drm: Add ddc link in sysfs created by drm_connector
      drm: Add drm_connector_init() variant with ddc
      drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi connector sysfs di=
rectory
      drm/imx: imx-ldb: Provide ddc symlink in connector's sysfs
      drm/imx: imx-tve: Provide ddc symlink in connector's sysfs
      drm: sti: Provide ddc symlink in hdmi connector sysfs directory
      drm/mgag200: Provide ddc symlink in connector sysfs directory
      drm/ast: Provide ddc symlink in connector sysfs directory
      drm/bridge: dumb-vga-dac: Provide ddc symlink in connector sysfs dire=
ctory
      drm/bridge: dw-hdmi: Provide ddc symlink in connector sysfs directory
      drm/bridge: ti-tfp410: Provide ddc symlink in connector sysfs directo=
ry
      drm/amdgpu: Provide ddc symlink in connector sysfs directory
      drm/radeon: Provide ddc symlink in connector sysfs directory

Chris Wilson (4):
      drm: Allow range of 0 for drm_mm_insert_node_in_range()
      drm/vgem: Reclassify buffer creation debug message
      dma-buf: Expand reservation_list to fill allocation
      dma-buf: Relax the write-seqlock for reallocating the shared fence li=
st

Christian K=F6nig (2):
      dma-buf: cleanup reservation_object_init/fini
      drm/syncobj: fix leaking dma_fence in drm_syncobj_query_ioctl

Christoph Hellwig (1):
      au1200fb: don't use DMA_ATTR_NON_CONSISTENT

Colin Ian King (2):
      drm/mgag200: add in missing { } around if block
      fbmem: remove redundant assignment to err

Daniel Vetter (73):
      drm/prime: Shuffle functions.
      drm/prime: Update docs
      drm/prime: Unconditionally set up the prime file private
      drm/prime: Make DRIVER_PRIME a no-op
      drm/prime: Actually remove DRIVER_PRIME everywhere
      drm/arm/komeda: Remove DRIVER_HAVE_IRQ
      drm/omapdrm: drop fb_debug_enter/leave
      drm/prime: Align gem_prime_export with obj_funcs.export
      drm/ioctl: Ditch DRM_UNLOCKED except for the legacy vblank ioctl
      drm/arc: Drop drm_gem_prime_export/import
      drm/arm: Drop drm_gem_prime_export/import
      drm/atmel: Drop drm_gem_prime_export/import
      drm/etnaviv: Drop drm_gem_prime_export/import
      drm/exynos: Drop drm_gem_prime_export
      drm/fsl-dcu: Drop drm_gem_prime_export/import
      drm/hisilicon: Drop drm_gem_prime_export/import
      drm/imx: Drop drm_gem_prime_export/import
      drm/mcde: Drop drm_gem_prime_export/import
      drm/mtk: Drop drm_gem_prime_export/import
      drm/meson: Drop drm_gem_prime_export/import
      drm/msm: Drop drm_gem_prime_export/import
      drm/mxsfb: Drop drm_gem_prime_export/import
      drm/nouveau: Drop drm_gem_prime_export/import
      drm/pl111: Drop drm_gem_prime_export/import
      drm/qxl: Drop drm_gem_prime_export/import
      drm/rcar-du: Drop drm_gem_prime_export/import
      drm/rockchip: Drop drm_gem_prime_export/import
      drm/shmob: Drop drm_gem_prime_export/import
      drm/sti: Drop drm_gem_prime_export/import
      drm/stm: Drop drm_gem_prime_export/import
      drm/tilcdc: Drop drm_gem_prime_export/import
      drm/tve2000: Drop drm_gem_prime_export/import
      drm/vboxvideo: Drop drm_gem_prime_export/import
      drm/vc3: Drop drm_gem_prime_import
      drm/radeon: Drop drm_gem_prime_import
      drm/vgem: Drop drm_gem_prime_export
      drm/virtio: Drop drm_gem_prime_export/import
      drm/xen: Drop drm_gem_prime_export/import
      drm/zte: Drop drm_gem_prime_export/import
      drm/vram-helper: Drop drm_gem_prime_export/import
      drm/prime: automatically set gem_obj->resv on import
      drm/vgem: Ditch attach trickery in the fence ioctl
      drm/lima: Drop resv argument from lima_bo_create_struct
      drm/mediatek: Use drm_atomic_helper_wait_for_fences
      drm/panfrost: don't set gem_obj->resv for prime import anymore
      drm/vc4: Don set gem_obj->resv in prime import anymore
      drm/todo: remove gem_prime_import/export todo
      drm/todo: Update backlight todo
      drm/todo: Update mmap todo
      drm/todo: Add new debugfs todo
      drm/etnaviv: Drop resv argument from etnaviv_gem_new_impl
      drm/msm: Drop robj from msm_gem_new_impl
      drm/vkms: Fix crc worker races
      drm/vkms: Use spin_lock_irq in process context
      drm/vkms: Rename vkms_output.state_lock to crc_lock
      drm/vkms: Add our own commit_tail
      drm/vkms: flush crc workers earlier in commit flow
      drm/vkms: Dont flush crc worker when we change crc status
      drm/vkms: No _irqsave within spin_lock_irq needed
      drm/vkms: totally reworked crc data tracking
      drm/vkms: No need for ->pages_lock in crc work anymore
      drm/fb-helper: use gem_bo.resv, not dma_buf.resv in prepare_fb
      drm/msm: Use drm_gem_fb_prepare_fb
      drm/vc4: Use drm_gem_fb_prepare_fb
      drm/vmwgfx: Don't look at state->allow_modeset
      drm/kms: Catch mode_object lifetime errors
      drm/doc: Document kapi doc expectations
      drm/i915: Fix up broken merge
      fbdev: Ditch fb_edid_add_monspecs
      drm/radeon: Fill out gem_object->resv
      drm/nouveau: Fill out gem_object->resv
      drm/amdgpu: Fill out gem_object->resv
      drm/prime: Ditch gem_prime_res_obj hook

Denis Efremov (1):
      drm/client: remove the exporting of drm_client_close

Douglas Anderson (7):
      drm/panel: simple: Use display_timing for Innolux n116bge
      drm/panel: simple: Use display_timing for AUO b101ean01
      drm/panel: simple: document panel_desc; rename a few functions
      video: of: display_timing: Add of_node_put() in of_get_display_timing=
()
      video: of: display_timing: Don't yell if no timing node is present
      drm: panel-lvds: Spout an error if of_get_display_timing() gives an e=
rror
      video: amba-clcd: Spout an error if of_get_display_timing() gives an =
error

Emil Velikov (14):
      drm/tegra: remove irrelevant DRM_UNLOCKED flag
      drm/i915: remove irrelevant DRM_UNLOCKED flag
      drm/nouveau: remove open-coded drm_invalid_op()
      vmwgfx: drop empty lastclose stub
      drm/vmgfx: kill off unused init_mutex
      drm/vmwgfx: use core drm to extend/check vmw_execbuf_ioctl
      drm/etnaviv: drop DRM_AUTH usage from the driver
      drm/exynos: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
      drm/lima: drop DRM_AUTH usage from the driver
      drm/msm: drop DRM_AUTH usage from the driver
      drm/nouveau: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
      drm/omap: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
      drm/vgem: drop DRM_AUTH usage from the driver
      drm/virtio: drop DRM_AUTH usage from the driver

Fabio Estevam (1):
      drm/bridge: Improve the help text for DRM_ANALOGIX_ANX78XX

Fuqian Huang (1):
      video: fbdev-MMP: Remove call to memset after dma_alloc_coherent

Guido G=FCnther (8):
      MAINTAINERS: Add Purism mail alias as reviewer for their devkit's pan=
el
      drm/panel: jh057n00900: Don't use magic constant
      dt-bindings: display/panel: jh057n00900: Document power supply proper=
ties
      drm/panel: jh057n00900: Add regulator support
      drm/panel: jh057n00900: Move panel DSI init to enable()
      drm/panel: jh057n00900: Move mipi_dsi_dcs_set_display_off to disable()
      drm/panel: jh057n00900: Print error code on all DRM_DEV_ERROR()s
      drm/panel: jh057n00900: Use drm_panel_{unprepare, disable} consistent=
ly

Gustavo A. R. Silva (1):
      drm: sti: Mark expected switch fall-throughs

H. Nikolaus Schaller (5):
      dt-bindings: drm/panel: simple: add ortustech, com37h3m05dtc panel
      dt-bindings: drm/panel: simple: add ortustech, com37h3m99dtc panel
      dt-bindings: drm/panel: simple: add sharp, lq070y3dg3b panel
      drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
      drm/panel: simple: Add Ortustech COM37H3M panel support

Hans de Goede (1):
      drm: Add Grain Media GM12U320 driver v2

Jani Nikula (1):
      drm/panel: make drm_panel.h self-contained

Jeffrey Hugo (2):
      dt-bindings: panel: Add Sharp LD-D5116Z01B
      drm/panel: simple: Add support for Sharp LD-D5116Z01B panel

Jernej Skrabec (3):
      drm/sun4i: Introduce color encoding and range properties
      drm/sun4i: sun8i_csc: Simplify register writes
      drm/sun4i: sun8i-csc: Add support for color encoding and range

Jerry Han (1):
      dt-bindings: panel: Add Boe Himax8279d is 1200x1920, 4-lane MIPI-DSI =
LCD panel

Joshua.Henderson@microchip.com (1):
      drm/atmel-hlcdc: set layer REP bit to enable replication logic

Jyri Sarha (1):
      drm/tilcdc: Remove obsolete crtc_mode_valid() hack

Krzysztof Kozlowski (4):
      drm/lima: Mark 64-bit number as ULL
      drm/lima: Reduce the amount of logs on deferred probe
      drm/lima: Reduce number of PTR_ERR() calls
      drm/lima: Reduce the amount of logs on deferred probe of clocks and r=
eset controller

Leo Li (4):
      drm/dp: Use non-cyclic idr
      drm/nouveau: Use connector kdev as aux device parent
      drm/amd/display: Use connector kdev as aux device parent
      drm/amd/display: Implement MST Aux device registration

Linus Walleij (3):
      drm/mcde: Fix uninitialized variable
      drm/pl111: Deprecate the pads from the DT binding
      drm/pl111: Drop special pads config check

Liviu Dudau (1):
      drm/drm_debugfs_crc.c: Document that .verify_crc_source vfunc is requ=
ired for enabling CRC support.

Lucas Stach (2):
      drm/bridge: tc358767: do a software reset if reset pin isn't connected
      drm/panel: simple: fix AUO g185han01 horizontal blanking

Marek Vasut (1):
      dt-bindings: display: Add ETM0700G0DH6 compatible string

Marko Kohtala (6):
      video: ssd1307fb: Use screen_buffer instead of screen_base
      video: ssd1307fb: Remove unneeded semicolons
      video: ssd1307fb: Start page range at page_offset
      video: ssd1307fb: Handle width and height that are not multiple of 8
      dt-bindings: display: ssd1307fb: Add initialization properties
      video: ssd1307fb: Add devicetree configuration of display setup

Matt Redfearn (2):
      drm/bridge/synopsys: dsi: Allow VPG to be enabled via debugfs
      drm/bridge: adv7511: Attach to DSI host at probe time

Maxime Ripard (2):
      drm/connector: Fix warning in debug message
      Merge v5.3-rc1 into drm-misc-next

Maya Rashish (1):
      drm/agp: Remove unused function drm_agp_bind_pages

Navid Emamdoost (1):
      drm/panel: check failure cases in the probe func

Neil Armstrong (3):
      MAINTAINERS: Update Maintainers and Reviewers of DRM Bridge Drivers
      drm/bridge: dw-hdmi: Use automatic CTS generation mode when using non=
-AHB audio
      Revert "drm/radeon: Provide ddc symlink in connector sysfs directory"

Nishka Dasgupta (1):
      drm/pl111: pl111_vexpress.c: Add of_node_put() before return

Noralf Tr=F8nnes (23):
      drm: Add SPI connector type
      drm/tinydrm: Use DRM_MODE_CONNECTOR_SPI
      drm/tinydrm: Use spi_is_bpw_supported()
      drm/tinydrm: Remove spi debug buffer dumping
      drm/tinydrm: Remove tinydrm_spi_max_transfer_size()
      drm/tinydrm: Clean up tinydrm_spi_transfer()
      drm/tinydrm: Move tinydrm_spi_transfer()
      drm/tinydrm: Move tinydrm_machine_little_endian()
      drm/tinydrm/repaper: Don't use tinydrm_display_pipe_init()
      drm/tinydrm/mipi-dbi: Add mipi_dbi_init_with_formats()
      drm/tinydrm: Move tinydrm_display_pipe_init() to mipi-dbi
      drm/tinydrm/mipi-dbi: Move cmdlock mutex init
      drm/tinydrm: Rename variable mipi -> dbi
      drm/tinydrm: Rename remaining variable mipi -> dbidev
      drm/tinydrm: Split struct mipi_dbi in two
      drm/tinydrm/mipi-dbi: Remove CMA helper dependency
      drm/tinydrm/Kconfig: drivers: Select BACKLIGHT_CLASS_DEVICE
      drm/tinydrm/mipi-dbi: Select DRM_KMS_HELPER
      drm/tinydrm: Move mipi-dbi
      MAINTAINERS: Remove tinydrm entry
      drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
      drm/tinydrm: Rename folder to tiny
      drm/gm12u320: Move driver to drm/tiny

Olivier Moysan (4):
      drm/bridge: sii902x: fix missing reference to mclk clock
      dt-bindings: display: sii902x: Change audio mclk binding
      drm/bridge: sii902x: make audio mclk optional
      drm/bridge: sii902x: add audio graph card support

Paul Cercueil (11):
      dt-bindings: display: Add GiantPlus GPM940B0 panel documentation
      media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8 media bus format
      drm/panel: simple: Add GiantPlus GPM940B0 panel support
      dt-bindings: display: Add King Display KD035G6-54NT panel documentati=
on
      drm/panel: Add Novatek NT39016 panel support
      dt-bindings: display: Add Sharp LS020B1DD01D panel documentation
      drm: Add bus flag for Sharp-specific signals
      drm/panel: simple: Add Sharp LS020B1DD01D panel support
      DRM: ingenic: Use devm_platform_ioremap_resource
      DRM: ingenic: Add support for Sharp panels
      DRM: ingenic: Add support for panels with 8-bit serial bus

Qian Cai (1):
      gpu/drm: fix a few kernel-doc "/**" mark warnings

Rob Clark (4):
      drm/bridge: ti-sn65dsi86: add link to datasheet
      drm/bridge: ti-sn65dsi86: add debugfs
      drm/bridge: ti-sn65dsi86: correct dsi mode_flags
      drm/bridge: ti-sn65dsi86: use dev name for debugfs

Rob Herring (17):
      dt-bindings: display: Convert tpo,tpg110 panel to DT schema
      dt-bindings: display: rockchip-lvds: Remove panel references
      Revert "drm/panfrost: Use drm_gem_map_offset()"
      Revert "drm/gem: Rename drm_gem_dumb_map_offset() to drm_gem_map_offs=
et()"
      dt-bindings: display: Convert common panel bindings to DT schema
      dt-bindings: display: Convert ampire,am-480272h3tmqw-t01h panel to DT=
 schema
      dt-bindings: display: Convert armadeus,st0700-adapt panel to DT schema
      dt-bindings: display: Convert bananapi,s070wv20-ct16 panel to DT sche=
ma
      dt-bindings: display: Convert dlc,dlc0700yzg-1 panel to DT schema
      dt-bindings: display: Convert pda,91-00156-a0 panel to DT schema
      dt-bindings: display: Convert raspberrypi,7inch-touchscreen panel to =
DT schema
      dt-bindings: display: Convert tfc,s9700rtwv43tr-01b panel to DT schema
      dt-bindings: display: Convert panel-lvds to DT schema
      dt-bindings: display: Convert innolux,ee101ia-01 panel to DT schema
      dt-bindings: display: Convert mitsubishi,aa104xd12 panel to DT schema
      dt-bindings: display: Convert mitsubishi,aa121td01 panel to DT schema
      dt-bindings: display: Convert sgd,gktw70sdae4se panel to DT schema

Robert Chiras (2):
      dt-bindings: display: panel: Add support for Raydium RM67191 panel
      drm/panel: Add support for Raydium RM67191 panel driver

Rodrigo Siqueira (2):
      drm/vkms: Avoid assigning 0 for possible_crtc
      drm/vkms: Rename vkms_crc.c into vkms_composer.c

Sam Ravnborg (51):
      drm/mga: drop dependency on drm_os_linux.h
      drm/mga: make header file self contained
      drm/mga: drop use of drmP.h
      drm/mgag200: drop use of drmP.h
      MAINTAINERS: add Sam Ravnborg for drm/atmel_hlcdc
      drm/stm: drop use of drmP.h
      drm/xen: drop use of drmP.h
      drm/tve200: drop use of drmP.h
      drm/mxsfb: drop use of drmP.h
      drm/fsl-dcu: drop use of drmP.h
      drm/qxl: drop use of drmP.h
      drm/vkms: drop use of drmP.h
      drm/scheduler: drop use of drmP.h
      drm/virtgpu: drop use of drmP.h
      drm: add missing include to drm_vram_mm_helper.h
      drm/bochs: drop use of drmP.h
      drm/ast: drop use of drmP.h
      drm/hisilicon: drop use of drmP.h
      drm/shmobile: drop use of drmP.h
      drm/atmel_hlcdc: drop use of drmP.h
      drm/meson: drop use of drmP.h
      drm/v3d: drop use of drmP.h
      drm/pl111: drop use of drmP.h
      drm/zte: drop use of drmP.h
      drm/sun4i: drop use of drmP.h
      drm/vc4: drop use of drmP.h
      drm/r128: drop use of drmP.h
      drm/udl: drop use of drmP.h
      drm/omapdrm: drop use of drmP.h
      drm/selftests: drop use of drmP.h
      drm/tdfx: drop use of drmP.h
      drm/vgem: drop use of drmP.h
      drm/i810: drop use of drmP.h
      drm/tilcdc: drop use of drmP.h
      drm/i2c/ch7006: drop use of drmP.h
      drm/i2c/sil164: drop use of drmP.h
      drm/imx: drop use of drmP.h
      drm/rockchip: drop use of drmP.h
      drm/mediatek: drop use of drmP.h
      drm: drop uapi dependency from drm_vblank.h
      drm/ati_pcigart: drop dependency on drm_os_linux.h
      drm: direct include of drm.h in drm_gem.c
      drm: direct include of drm.h in drm_gem_shmem_helper.c
      drm: direct include of drm.h in drm_prime.c
      drm: direct include of drm.h in drm_syncobj.c
      drm/mediatek: direct include of drm.h in mtk_drm_gem.c
      drm/fb: remove unused function: drm_gem_fbdev_fb_create()
      drm/via: drop use of DRM(READ|WRITE) macros
      drm/via: copy DRM_WAIT_ON as VIA_WAIT_ON and use it
      drm/via: make via_drv.h self-contained
      drm/via: drop use of drmP.h

Sean Paul (8):
      drm/panel: simple: Add ability to override typical timing
      drm: Make the bw/link rate calculations more forgiving
      drm/rockchip: Check for fast link training before enabling psr
      drm/rockchip: Use the helpers for PSR
      drm/rockchip: Use vop_win in vop_win_disable instead of vop_win_data
      drm/rockchip: Don't fully disable vop on self refresh
      drm/rockchip: Use drm_atomic_helper_commit_tail_rpm
      drm/mst: Fix sphinx warnings in drm_dp_msg_connector register functio=
ns

Souptick Joarder (2):
      video: fbdev: nvidia: Remove extra return
      video: fbdev: nvidia: Remove dead code

Steven Price (3):
      drm/gem: Rename drm_gem_dumb_map_offset() to drm_gem_map_offset()
      drm/panfrost: Use drm_gem_map_offset()
      drm/panfrost: Export all GPU feature registers

Thomas Zimmermann (16):
      drm/mgag200: Replace struct mga_framebuffer with GEM framebuffer help=
ers
      drm/ast: Replace struct ast_framebuffer with GEM framebuffer helpers
      drm/vram: Set GEM object functions for PRIME
      drm/bochs: Remove PRIME helpers from driver structure
      drm/hibmc: Update struct drm_driver for GEM object functions
      drm/vbox: Remove empty PRIME functions
      drm/vram: Don't export driver callback functions for PRIME
      drm/client: Support unmapping of DRM client buffers
      drm/fb-helper: Map DRM client buffer only when required
      drm/fb-helper: Instanciate shadow FB if configured in device's mode_c=
onfig
      drm/ast: Replace struct ast_fbdev with generic framebuffer emulation
      drm/bochs: Use shadow buffer for bochs framebuffer console
      drm/mgag200: Replace struct mga_fbdev with generic framebuffer emulat=
ion
      drm/mgag200: Pin displayed cursor BO to video memory
      drm/mgag200: Set cursor scanout address to correct BO
      drm/mgag200: Don't unpin the current cursor image's buffer.

Ville Syrj=E4l=E4 (7):
      drm: Do not use bitwise OR to set picure_aspect_ratio
      drm: Do not accept garbage mode aspect ratio flags
      drm: WARN on illegal aspect ratio when converting a mode to umode
      drm/sun4i: Eliminate pointless on stack copy of drm_display_info
      drm/sti: Remove pointless casts
      drm/sti: Try to fix up the tvout possible clones
      drm/dp_mst: Enable registration of AUX devices for MST ports

Yue Hu (1):
      drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant

YueHaibing (4):
      drm/sti: Remove duplicated include from sti_drv.c
      drm/bridge: sii902x: Make sii902x_audio_digital_mute static
      drm/komeda: remove set but not used variable 'old'
      drm/rockchip: Make analogix_dp_atomic_check static

james qian wang (Arm Technology China) (2):
      drm/komeda: Use drm_display_mode "crtc_" prefixed hardware timings
      drm/komeda: Enable dual-link support

 .../devicetree/bindings/display/arm,pl11x.txt      |   9 +-
 .../devicetree/bindings/display/bridge/sii902x.txt |   5 +-
 .../display/panel/ampire,am-480272h3tmqw-t01h.txt  |  26 -
 .../display/panel/ampire,am-480272h3tmqw-t01h.yaml |  42 +
 .../display/panel/arm,versatile-tft-panel.txt      |   2 +-
 .../display/panel/armadeus,st0700-adapt.txt        |   9 -
 .../display/panel/armadeus,st0700-adapt.yaml       |  33 +
 .../display/panel/bananapi,s070wv20-ct16.txt       |  12 -
 .../display/panel/bananapi,s070wv20-ct16.yaml      |  31 +
 .../bindings/display/panel/boe,himax8279d.txt      |  24 +
 .../bindings/display/panel/dlc,dlc0700yzg-1.txt    |  13 -
 .../bindings/display/panel/dlc,dlc0700yzg-1.yaml   |  31 +
 .../bindings/display/panel/edt,et-series.txt       |   2 +-
 .../bindings/display/panel/giantplus,gpm940b0.txt  |  12 +
 .../bindings/display/panel/innolux,ee101ia-01d.txt |   7 -
 .../display/panel/innolux,ee101ia-01d.yaml         |  31 +
 .../display/panel/kingdisplay,kd035g6-54nt.txt     |  42 +
 .../devicetree/bindings/display/panel/lvds.yaml    | 107 +++
 .../display/panel/mitsubishi,aa104xd12.txt         |  47 --
 .../display/panel/mitsubishi,aa104xd12.yaml        |  75 ++
 .../display/panel/mitsubishi,aa121td01.txt         |  47 --
 .../display/panel/mitsubishi,aa121td01.yaml        |  74 ++
 .../display/panel/ortustech,com37h3m05dtc.txt      |  12 +
 .../display/panel/ortustech,com37h3m99dtc.txt      |  12 +
 .../bindings/display/panel/panel-common.txt        | 101 ---
 .../bindings/display/panel/panel-common.yaml       | 149 ++++
 .../bindings/display/panel/panel-lvds.txt          | 121 ---
 .../devicetree/bindings/display/panel/panel.txt    |   4 -
 .../bindings/display/panel/pda,91-00156-a0.txt     |  14 -
 .../bindings/display/panel/pda,91-00156-a0.yaml    |  31 +
 .../panel/raspberrypi,7inch-touchscreen.txt        |  49 --
 .../panel/raspberrypi,7inch-touchscreen.yaml       |  71 ++
 .../bindings/display/panel/raydium,rm67191.txt     |  41 +
 .../display/panel/rocktech,jh057n00900.txt         |   5 +
 .../bindings/display/panel/sgd,gktw70sdae4se.txt   |  41 -
 .../bindings/display/panel/sgd,gktw70sdae4se.yaml  |  68 ++
 .../bindings/display/panel/sharp,ld-d5116z01b.txt  |  26 +
 .../bindings/display/panel/sharp,lq070y3dg3b.txt   |  12 +
 .../bindings/display/panel/sharp,ls020b1dd01d.txt  |  12 +
 .../bindings/display/panel/simple-panel.txt        |  29 +-
 .../display/panel/tfc,s9700rtwv43tr-01b.txt        |  15 -
 .../display/panel/tfc,s9700rtwv43tr-01b.yaml       |  33 +
 .../bindings/display/panel/tpo,tpg110.txt          |  70 --
 .../bindings/display/panel/tpo,tpg110.yaml         | 101 +++
 .../bindings/display/rockchip/rockchip-lvds.txt    |  11 -
 .../devicetree/bindings/display/ssd1307fb.txt      |  10 +
 Documentation/gpu/drivers.rst                      |   1 -
 Documentation/gpu/drm-kms-helpers.rst              |  12 +
 Documentation/gpu/drm-mm.rst                       |  40 +-
 Documentation/gpu/introduction.rst                 |  16 +
 Documentation/gpu/tinydrm.rst                      |  30 -
 Documentation/gpu/todo.rst                         |  81 +-
 Documentation/media/uapi/v4l/subdev-formats.rst    | 107 +++
 MAINTAINERS                                        |  44 +-
 drivers/dma-buf/reservation.c                      |  65 +-
 drivers/gpu/drm/Kconfig                            |   6 +-
 drivers/gpu/drm/Makefile                           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  96 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  26 +-
 drivers/gpu/drm/arc/arcpgu_drv.c                   |   5 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |  38 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |  89 ++-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |   5 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   8 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   5 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   4 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |  19 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   6 +-
 .../drm/arm/display/komeda/komeda_pipeline_state.c |   2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |   4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   6 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   5 +-
 drivers/gpu/drm/arm/malidp_hw.c                    |   3 +-
 drivers/gpu/drm/armada/armada_drv.c                |   3 +-
 drivers/gpu/drm/armada/armada_gem.c                |   5 +-
 drivers/gpu/drm/armada/armada_gem.h                |   3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   3 +-
 drivers/gpu/drm/ast/Makefile                       |   2 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   5 +-
 drivers/gpu/drm/ast/ast_drv.c                      |  22 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  46 +-
 drivers/gpu/drm/ast/ast_fb.c                       | 346 ---------
 drivers/gpu/drm/ast/ast_main.c                     |  75 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  58 +-
 drivers/gpu/drm/ast/ast_post.c                     |   7 +-
 drivers/gpu/drm/ast/ast_ttm.c                      |   7 +-
 drivers/gpu/drm/ati_pcigart.c                      |  10 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  12 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  18 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |  18 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  12 +-
 drivers/gpu/drm/bochs/bochs.h                      |   6 +-
 drivers/gpu/drm/bochs/bochs_drv.c                  |  11 +-
 drivers/gpu/drm/bochs/bochs_hw.c                   |   4 +
 drivers/gpu/drm/bochs/bochs_kms.c                  |   9 +-
 drivers/gpu/drm/bridge/Kconfig                     |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  12 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 304 +++++---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   2 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   6 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  44 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  51 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  47 ++
 drivers/gpu/drm/bridge/tc358767.c                  | 675 +++++++++-------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  46 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   6 +-
 drivers/gpu/drm/cirrus/cirrus.c                    |   2 +-
 drivers/gpu/drm/drm_agpsupport.c                   |  45 +-
 drivers/gpu/drm/drm_client.c                       |  61 +-
 drivers/gpu/drm/drm_connector.c                    |  39 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |   6 +-
 drivers/gpu/drm/drm_dma.c                          |   2 +-
 drivers/gpu/drm/drm_dp_aux_dev.c                   |  18 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  31 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              | 142 +++-
 drivers/gpu/drm/drm_drv.c                          |   4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  51 +-
 drivers/gpu/drm/drm_file.c                         |   9 +-
 drivers/gpu/drm/drm_gem.c                          |   4 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  72 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   1 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |  78 +-
 drivers/gpu/drm/drm_ioc32.c                        |  13 +-
 drivers/gpu/drm/drm_ioctl.c                        | 133 ++--
 drivers/gpu/drm/drm_legacy_misc.c                  |   2 +-
 drivers/gpu/drm/drm_lock.c                         |   2 +-
 drivers/gpu/drm/drm_memory.c                       |   2 +-
 .../gpu/drm/{tinydrm/mipi-dbi.c =3D> drm_mipi_dbi.c} | 517 ++++++++-----
 drivers/gpu/drm/drm_mm.c                           |   2 +-
 drivers/gpu/drm/drm_mode_object.c                  |   4 +
 drivers/gpu/drm/drm_modes.c                        |  17 +-
 drivers/gpu/drm/drm_prime.c                        | 856 +++++++++++------=
----
 drivers/gpu/drm/drm_scatter.c                      |   2 +-
 drivers/gpu/drm/drm_syncobj.c                      |  11 +-
 drivers/gpu/drm/drm_sysfs.c                        |   8 +
 drivers/gpu/drm/drm_vm.c                           |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |  28 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  21 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |   5 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   9 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c          |   1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   6 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  10 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   9 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c  |   2 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |   6 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   8 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  10 +-
 drivers/gpu/drm/i2c/ch7006_priv.h                  |   1 -
 drivers/gpu/drm/i2c/sil164_drv.c                   |   3 +-
 drivers/gpu/drm/i810/i810_dma.c                    |  17 +-
 drivers/gpu/drm/i810/i810_drv.c                    |  10 +-
 drivers/gpu/drm/i810/i810_drv.h                    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   5 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   2 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   8 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   3 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  14 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |  13 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |  29 +-
 drivers/gpu/drm/imx/imx-tve.c                      |  16 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |   8 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |   5 +-
 drivers/gpu/drm/imx/parallel-display.c             |   8 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |  75 +-
 drivers/gpu/drm/lima/lima_device.c                 |  41 +-
 drivers/gpu/drm/lima/lima_drv.c                    |  20 +-
 drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
 drivers/gpu/drm/lima/lima_gem_prime.c              |   3 +-
 drivers/gpu/drm/lima/lima_object.c                 |   9 +-
 drivers/gpu/drm/lima/lima_object.h                 |   3 +-
 drivers/gpu/drm/lima/lima_vm.h                     |   4 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |  10 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  10 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  33 +-
 drivers/gpu/drm/mediatek/mtk_drm_fb.c              |  35 +-
 drivers/gpu/drm/mediatek/mtk_drm_fb.h              |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   7 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  14 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  14 +-
 drivers/gpu/drm/meson/meson_crtc.c                 |  16 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  33 +-
 drivers/gpu/drm/meson/meson_drv.h                  |  11 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  19 +-
 drivers/gpu/drm/meson/meson_overlay.c              |  13 +-
 drivers/gpu/drm/meson/meson_plane.c                |  16 +-
 drivers/gpu/drm/meson/meson_registers.h            |   2 +
 drivers/gpu/drm/meson/meson_vclk.c                 |   7 +-
 drivers/gpu/drm/meson/meson_vclk.h                 |   4 +
 drivers/gpu/drm/meson/meson_venc.c                 |  10 +-
 drivers/gpu/drm/meson/meson_venc.h                 |   2 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |  11 +-
 drivers/gpu/drm/meson/meson_viu.c                  |   7 +-
 drivers/gpu/drm/meson/meson_vpp.c                  |   7 +-
 drivers/gpu/drm/meson/meson_vpp.h                  |   3 +
 drivers/gpu/drm/mga/mga_dma.c                      |  13 +-
 drivers/gpu/drm/mga/mga_drv.c                      |   7 +-
 drivers/gpu/drm/mga/mga_drv.h                      |  27 +-
 drivers/gpu/drm/mga/mga_ioc32.c                    |   3 +-
 drivers/gpu/drm/mga/mga_irq.c                      |  12 +-
 drivers/gpu/drm/mga/mga_state.c                    |   8 +-
 drivers/gpu/drm/mga/mga_warp.c                     |   4 +-
 drivers/gpu/drm/mgag200/Makefile                   |   2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c           |  11 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |  10 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  40 +-
 drivers/gpu/drm/mgag200/mgag200_fb.c               | 315 --------
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |   6 +-
 drivers/gpu/drm/mgag200/mgag200_main.c             |  96 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  63 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c              |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   8 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |   8 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  25 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   8 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 |  16 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  16 +-
 drivers/gpu/drm/mxsfb/mxsfb_out.c                  |   1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   6 -
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |   1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  33 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |   1 -
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   7 -
 drivers/gpu/drm/omapdrm/omap_crtc.c                |   4 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  22 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |   5 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   2 +
 drivers/gpu/drm/omapdrm/omap_gem.h                 |   3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |   8 +-
 drivers/gpu/drm/omapdrm/omap_irq.c                 |   2 +
 drivers/gpu/drm/panel/Kconfig                      |  18 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-lvds.c                 |   5 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      | 359 +++++++++
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |  13 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 668 ++++++++++++++++
 drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c |  75 +-
 drivers/gpu/drm/panel/panel-simple.c               | 343 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  41 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   2 -
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   2 +
 drivers/gpu/drm/pl111/pl111_debugfs.c              |   4 +-
 drivers/gpu/drm/pl111/pl111_display.c              |  22 +-
 drivers/gpu/drm/pl111/pl111_drm.h                  |  11 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |  13 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h              |   3 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |   9 +-
 drivers/gpu/drm/pl111/pl111_versatile.h            |   3 +
 drivers/gpu/drm/pl111/pl111_vexpress.c             |   1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   2 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   4 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   3 +
 drivers/gpu/drm/qxl/qxl_draw.c                     |   2 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |  15 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   7 +-
 drivers/gpu/drm/qxl/qxl_gem.c                      |   1 -
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |   3 +
 drivers/gpu/drm/qxl/qxl_irq.c                      |   4 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |   9 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   6 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  16 +-
 drivers/gpu/drm/r128/r128_ioc32.c                  |   3 +-
 drivers/gpu/drm/r128/r128_irq.c                    |   5 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   8 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   1 +
 drivers/gpu/drm/radeon/radeon_prime.c              |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   5 +-
 drivers/gpu/drm/rockchip/Makefile                  |   3 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 116 +--
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  17 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |   2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   9 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   5 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  17 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |  29 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c      |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_psr.c        | 282 -------
 drivers/gpu/drm/rockchip/rockchip_drm_psr.h        |  22 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 115 ++-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  16 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   9 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  11 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |   2 -
 drivers/gpu/drm/scheduler/sched_entity.c           |   3 +
 drivers/gpu/drm/scheduler/sched_fence.c            |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   3 +-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   7 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   3 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h          |   4 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   9 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |   1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.h         |   1 +
 drivers/gpu/drm/shmobile/shmob_drm_regs.h          |   3 +
 drivers/gpu/drm/sti/sti_drv.c                      |   6 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   9 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |  16 +-
 drivers/gpu/drm/stm/drv.c                          |   5 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |  10 +-
 drivers/gpu/drm/stm/ltdc.c                         |   2 +
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  16 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |  13 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   7 +-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |   1 -
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |  10 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  24 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  28 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   4 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   9 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  | 157 +++-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |   6 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   3 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  14 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |   6 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |  22 +-
 drivers/gpu/drm/tdfx/tdfx_drv.c                    |  11 +-
 drivers/gpu/drm/tegra/drm.c                        |  30 +-
 drivers/gpu/drm/tegra/gem.c                        |   7 +-
 drivers/gpu/drm/tegra/gem.h                        |   3 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  46 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  25 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  31 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |  89 +--
 drivers/gpu/drm/tilcdc/tilcdc_external.h           |   1 -
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  20 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c             |  17 +-
 drivers/gpu/drm/{tinydrm =3D> tiny}/Kconfig          |  64 +-
 drivers/gpu/drm/{tinydrm =3D> tiny}/Makefile         |   6 +-
 drivers/gpu/drm/tiny/gm12u320.c                    | 814 +++++++++++++++++=
+++
 drivers/gpu/drm/{tinydrm =3D> tiny}/hx8357d.c        |  64 +-
 drivers/gpu/drm/{tinydrm =3D> tiny}/ili9225.c        | 179 ++---
 drivers/gpu/drm/{tinydrm =3D> tiny}/ili9341.c        |  86 ++-
 drivers/gpu/drm/{tinydrm =3D> tiny}/mi0283qt.c       |  93 +--
 drivers/gpu/drm/{tinydrm =3D> tiny}/repaper.c        |  61 +-
 drivers/gpu/drm/{tinydrm =3D> tiny}/st7586.c         | 134 ++--
 drivers/gpu/drm/{tinydrm =3D> tiny}/st7735r.c        |  81 +-
 drivers/gpu/drm/tinydrm/core/Makefile              |   4 -
 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c     | 207 -----
 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c        | 179 -----
 drivers/gpu/drm/tve200/tve200_display.c            |   8 +-
 drivers/gpu/drm/tve200/tve200_drm.h                |  15 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |   8 +-
 drivers/gpu/drm/udl/udl_connector.c                |   4 +-
 drivers/gpu/drm/udl/udl_connector.h                |   2 +
 drivers/gpu/drm/udl/udl_dmabuf.c                   |  11 +-
 drivers/gpu/drm/udl/udl_drv.c                      |   9 +-
 drivers/gpu/drm/udl/udl_drv.h                      |  11 +-
 drivers/gpu/drm/udl/udl_encoder.c                  |   6 +-
 drivers/gpu/drm/udl/udl_fb.c                       |  15 +-
 drivers/gpu/drm/udl/udl_gem.c                      |   9 +-
 drivers/gpu/drm/udl/udl_main.c                     |   6 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   6 +-
 drivers/gpu/drm/udl/udl_transfer.c                 |   4 -
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   3 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  13 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  12 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   2 +
 drivers/gpu/drm/vboxvideo/Makefile                 |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |  13 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |  12 -
 drivers/gpu/drm/vboxvideo/vbox_prime.c             |  56 --
 drivers/gpu/drm/vc4/vc4_bo.c                       |   7 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  11 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |   9 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  20 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  17 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   2 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |   5 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   4 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   9 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |  14 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   4 +
 drivers/gpu/drm/vgem/vgem_drv.c                    |  21 +-
 drivers/gpu/drm/vgem/vgem_drv.h                    |   1 -
 drivers/gpu/drm/vgem/vgem_fence.c                  |  24 +-
 drivers/gpu/drm/via/via_dma.c                      |  43 +-
 drivers/gpu/drm/via/via_dmablit.c                  |  41 +-
 drivers/gpu/drm/via/via_drv.c                      |   7 +-
 drivers/gpu/drm/via/via_drv.h                      |  75 +-
 drivers/gpu/drm/via/via_irq.c                      |  54 +-
 drivers/gpu/drm/via/via_map.c                      |   6 +-
 drivers/gpu/drm/via/via_mm.c                       |   7 +-
 drivers/gpu/drm/via/via_verifier.c                 |  22 +-
 drivers/gpu/drm/via/via_video.c                    |   5 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   4 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   7 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   9 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   6 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  26 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   6 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   2 +
 drivers/gpu/drm/virtio/virtgpu_ttm.c               |  13 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   7 +-
 drivers/gpu/drm/vkms/Makefile                      |   2 +-
 .../gpu/drm/vkms/{vkms_crc.c =3D> vkms_composer.c}   | 179 ++---
 drivers/gpu/drm/vkms/vkms_crtc.c                   | 100 ++-
 drivers/gpu/drm/vkms/vkms_drv.c                    |  50 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  44 +-
 drivers/gpu/drm/vkms/vkms_gem.c                    |   1 +
 drivers/gpu/drm/vkms/vkms_output.c                 |   6 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  46 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  52 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   8 -
 drivers/gpu/drm/xen/xen_drm_front.c                |  16 +-
 drivers/gpu/drm/xen/xen_drm_front.h                |  11 +-
 drivers/gpu/drm/xen/xen_drm_front_cfg.c            |   4 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c           |   1 +
 drivers/gpu/drm/xen/xen_drm_front_conn.h           |   7 +-
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c        |   4 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |  13 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h            |   7 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   7 +-
 drivers/gpu/drm/zte/zx_drm_drv.c                   |   8 +-
 drivers/gpu/drm/zte/zx_hdmi.c                      |   2 +-
 drivers/gpu/drm/zte/zx_plane.c                     |   2 +-
 drivers/gpu/drm/zte/zx_tvenc.c                     |   4 +-
 drivers/gpu/drm/zte/zx_vga.c                       |   4 +-
 drivers/gpu/drm/zte/zx_vou.c                       |   5 +-
 drivers/video/fbdev/amba-clcd.c                    |   4 +-
 drivers/video/fbdev/au1200fb.c                     |   5 +-
 drivers/video/fbdev/core/fbmem.c                   |   2 +-
 drivers/video/fbdev/core/fbmon.c                   |  96 ---
 drivers/video/fbdev/core/modedb.c                  |  57 --
 drivers/video/fbdev/mmp/fb/mmpfb.c                 |   1 -
 drivers/video/fbdev/nvidia/nv_backlight.c          |   2 -
 drivers/video/fbdev/nvidia/nv_setup.c              |  24 -
 drivers/video/fbdev/ssd1307fb.c                    | 131 +++-
 drivers/video/of_display_timing.c                  |  11 +-
 include/drm/bridge/analogix_dp.h                   |   4 -
 include/drm/drm_agpsupport.h                       |  14 -
 include/drm/drm_client.h                           |   2 +
 include/drm/drm_connector.h                        |  21 +
 include/drm/drm_dp_helper.h                        |   4 +
 include/drm/drm_dp_mst_helper.h                    |  11 +
 include/drm/drm_drv.h                              | 104 ++-
 include/drm/drm_gem.h                              |  18 +-
 include/drm/drm_gem_framebuffer_helper.h           |   7 -
 include/drm/drm_gem_vram_helper.h                  |  27 +-
 include/drm/drm_ioctl.h                            |   3 +
 include/drm/drm_mipi_dbi.h                         | 188 +++++
 include/drm/drm_mode_config.h                      |   7 +
 include/drm/drm_panel.h                            |   1 +
 include/drm/drm_prime.h                            |  43 +-
 include/drm/drm_vblank.h                           |   1 -
 include/drm/drm_vram_mm_helper.h                   |   2 +
 include/drm/tinydrm/mipi-dbi.h                     | 117 ---
 include/drm/tinydrm/tinydrm-helpers.h              |  75 --
 include/linux/fb.h                                 |   3 -
 include/linux/reservation.h                        |  46 +-
 include/linux/soc/amlogic/meson-canvas.h           |   1 +
 include/uapi/drm/drm_mode.h                        |   1 +
 include/uapi/drm/panfrost_drm.h                    |  39 +
 include/uapi/linux/media-bus-format.h              |   3 +-
 493 files changed, 8904 insertions(+), 6630 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,=
am-480272h3tmqw-t01h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,=
am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/armadeu=
s,st0700-adapt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/armadeu=
s,st0700-adapt.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/bananap=
i,s070wv20-ct16.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananap=
i,s070wv20-ct16.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,him=
ax8279d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc=
0700yzg-1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc=
0700yzg-1.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/giantpl=
us,gpm940b0.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,ee101ia-01d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,ee101ia-01d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdis=
play,kd035g6-54nt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lvds.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa104xd12.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa104xd12.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa121td01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa121td01.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m05dtc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m99dtc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-c=
ommon.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-c=
ommon.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-l=
vds.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel.t=
xt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-=
00156-a0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-=
00156-a0.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raspber=
rypi,7inch-touchscreen.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raspber=
rypi,7inch-touchscreen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium=
,rm67191.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gkt=
w70sdae4se.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gkt=
w70sdae4se.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
d-d5116z01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q070y3dg3b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
s020b1dd01d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s97=
00rtwv43tr-01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s97=
00rtwv43tr-01b.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg=
110.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg=
110.yaml
 delete mode 100644 Documentation/gpu/tinydrm.rst
 delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
 rename drivers/gpu/drm/{tinydrm/mipi-dbi.c =3D> drm_mipi_dbi.c} (65%)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt39016.c
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67191.c
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.c
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_psr.h
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/Kconfig (64%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/Makefile (76%)
 create mode 100644 drivers/gpu/drm/tiny/gm12u320.c
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/hx8357d.c (78%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/ili9225.c (64%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/ili9341.c (69%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/mi0283qt.c (70%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/repaper.c (94%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/st7586.c (74%)
 rename drivers/gpu/drm/{tinydrm =3D> tiny}/st7735r.c (69%)
 delete mode 100644 drivers/gpu/drm/tinydrm/core/Makefile
 delete mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
 delete mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
 delete mode 100644 drivers/gpu/drm/vboxvideo/vbox_prime.c
 rename drivers/gpu/drm/vkms/{vkms_crc.c =3D> vkms_composer.c} (52%)
 create mode 100644 include/drm/drm_mipi_dbi.h
 delete mode 100644 include/drm/tinydrm/mipi-dbi.h
 delete mode 100644 include/drm/tinydrm/tinydrm-helpers.h

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--oenumjjnz7rvq2td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXUVmNwAKCRDj7w1vZxhR
xa9eAP9rAxjhuRQHYX90vaQJWGJKiNkwrej+pg46z5fIQBbJXgEAzXixa3h1OGml
XFxLoBImC1KQ94hYKRNnv21Stt25fQE=
=tcQi
-----END PGP SIGNATURE-----

--oenumjjnz7rvq2td--

--===============0451521891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0451521891==--
