Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02112270C00
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1486E1BB;
	Sat, 19 Sep 2020 08:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035B56E110;
 Fri, 18 Sep 2020 08:11:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B3CF95802AF;
 Fri, 18 Sep 2020 04:11:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Sep 2020 04:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=NkAMeqgKt6iNkO1MZz2uRtWEoyyoe5CyGmq0w/+Vink=; b=HzdQ0GuI
 3ZdKlhkA57LztAoLIhG/5ru5FiiQNb0fYcG1/89RymimZsoxPK201v378rK34C7V
 AcKJP7OV6JRVEZS6UTSbOIqKhU9nmBxZd3Dv30yYIdjjkihzmE7c630e4VXE79Js
 7GN9Mbf06OgqXzbs+UN1/52yeeefoY1ZxrCKAGXrd8MHoBOECfDebbkBb+Yy6Qe1
 howlmCHaPz0n/ToynQ6p3kgpCWXGNXSnAgmDXThithDF+gKZ4u++98mcIVtQDTIb
 0Z21agN8eUyrgMaRz/dS3MWbsG/+wzMkiwIS9z4TbeoFSat0G/xM50qWEtXd/HMl
 0oRPEuba/UKalw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=NkAMeqgKt6iNkO1MZz2uRtWEoyyoe
 5CyGmq0w/+Vink=; b=t0CcAq9jcuu/QPJwMYxfjS0D3+b9ND/LjuH6SyvMR2uo4
 FCneNbkkasl/DhEppC4Lq3l/ADoN3PsYngHSySBNwii4nFU3pY7d1LYEVlNnXX9q
 9YEZzdSaTEFWmnAN4CBOU1MSL8sqc3tZDXYAGVzbOmSLAlkMNDT8V8xSjHkJjmxV
 e0df9P1NRvfg9LQv8MrWT337dcZXp6tUPc//+/VmbOTDYCP2j4ptIuaKSld8KC//
 o+NJQeG0oVPxil6CkfedkNIZOmht1pQihb2Ha8V42YfKHeqZnbUr1u1Zufd8aWrX
 AocFD8FKL+GA2iOXmjB2Mrr992sjXFhSVtKQ4f1xA==
X-ME-Sender: <xms:tWtkXzO2ZkOyiF0P0y_6Gqtl1aCJvpz-_tUJ3e3b0tc43UdaOb_mtg>
 <xme:tWtkX9-BZ3NHlDQ1RTgBlAZbsQRId1uHgEtHNDNoNR372_rdlObL5gTyt1PsaYYfW
 gtsudoAVyGcXxXXMvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeigddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpedthffhvdejhfejledtjeegffeiffeivdeuudegteegudejueffieelfefgfeduheen
 ucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgne
 cukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tWtkXyT-tDSqWMT1G0yQ8hvqvKf8f9SpjxwjPE_Q-f5G3ecIUpcsgQ>
 <xmx:tWtkX3v5d9OqW3RwFgilFbYd3pE-bKES-p-i3UD5rrqMqFrnL7MA4Q>
 <xmx:tWtkX7d_4bfmMBWLkPGjT9kW7gOEO-Lk1wNVfGVRxpV5-1ElTuhXNQ>
 <xmx:tmtkX6y376vijiUgEOv5qam04y81E58tF8mqeoj05LL6IL-vvHGELA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75B8B328005D;
 Fri, 18 Sep 2020 04:11:33 -0400 (EDT)
Date: Fri, 18 Sep 2020 10:11:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200918081131.75avmrbnqhhjgr2v@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Content-Type: multipart/mixed; boundary="===============2005623529=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2005623529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7kqovvpvefl7v36"
Content-Disposition: inline


--h7kqovvpvefl7v36
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2020-09-18:
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:
  - virtio: Merged a PR for patches that will affect drm/virtio

Core Changes:
  - atomic: Split out drm_atomic_helper_calc_timestamping_constants of
    drm_atomic_helper_update_legacy_modeset_state
  - ttm: More rework

Driver Changes:
  - tree-wide: conversions to devm_drm_dev_alloc,
  - ast: simplifications of the atomic modesetting code
  - panfrost: multiple fixes
  - vc4: multiple fixes
The following changes since commit 818280d5adf1d80e78f95821815148abe9407e14:

  Merge v5.9-rc5 into drm-next (2020-09-14 17:19:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-09-18

for you to fetch changes up to 4856e5aa0ef1d4c62f6f30bf273a778735507837:

  drm/ttm: drop evicted from ttm_bo. (2020-09-18 06:23:38 +1000)

----------------------------------------------------------------
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:
  - virtio: Merged a PR for patches that will affect drm/virtio

Core Changes:
  - atomic: Split out drm_atomic_helper_calc_timestamping_constants of
    drm_atomic_helper_update_legacy_modeset_state
  - ttm: More rework

Driver Changes:
  - tree-wide: conversions to devm_drm_dev_alloc,
  - ast: simplifications of the atomic modesetting code
  - panfrost: multiple fixes
  - vc4: multiple fixes

----------------------------------------------------------------
Alex Dewar (2):
      video: fbdev: sstfb: replace spurious snprintf() with sprintf()
      drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy

Angelo Ribeiro (1):
      drm/bridge: dw-mipi-dsi.c: Add VPG runtime config through debugfs

Antonio Borneo (3):
      drm/bridge/synopsys: dsi: allow LP commands in video mode
      drm/bridge/synopsys: dsi: allow sending longer LP commands
      drm/bridge/synopsys: dsi: add support for non-continuous HS clock

Bernard Zhao (1):
      gpu/drm: cleanup coding style a bit

Bilal Wasim (1):
      docs: fb: Correcting the location of FRAMEBUFFER_CONSOLE option.

Christian K=F6nig (14):
      drm/ttm: make sure that we always zero init mem.bus v2
      drm/nouveau: move io_reserve_lru handling into the driver v5
      drm/ttm: remove io_reserve_lru handling v3
      drm/qxl: don't touch mem.bus.offset
      drm/ttm: merge offset and base in ttm_bus_placement
      drm/vram-helper: stop using TTM placement flags
      drm/nouveau: stop using TTM placement flags
      drm/vmwgfx: stop setting multiple domain flags
      drm/ttm: nuke memory type flags
      drm/ttm: remove default caching
      drm/nouveau: explicitly specify caching to use
      drm/ttm: remove available_caching
      drm/ttm: some cleanups
      drm/ttm: remove superflous extern attribute from funcs

Colin Ian King (2):
      video: fbdev: vga16fb: fix setting of pixclock because a pass-by-valu=
e error
      omapfb: fix spelling mistake "propert" -> "property"

Dan Carpenter (2):
      drm/vc4: hdmi: Fix off by ones in vc4_hdmi_read/write()
      drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in vc5_hdmi_init_resources=
()

Daniel Vetter (8):
      drm/managed: Cleanup of unused functions and polishing docs
      drm/armada: Use devm_drm_dev_alloc
      drm/armada: Don't use drm_device->dev_private
      drm/aspeed: Use managed drmm_mode_config_cleanup
      drm/vgem: Use devm_drm_dev_alloc
      drm/vkms: Use devm_drm_dev_alloc
      drm/xlnx: Use devm_drm_dev_alloc
      dma-resv: lockdep-prime address_space->i_mmap_rwsem for dma-resv

Dave Airlie (30):
      drm/ttm: remove bdev from ttm_tt
      drm/ttm: introduce ttm_bo_move_null
      drm/ttm: add optional bind/unbind via driver.
      drm/qxl: move bind/unbind/destroy to the driver function table.
      drm/ttm/agp: export bind/unbind/destroy for drivers to use.
      drm/radeon/ttm: move to driver binding/destroy functions. (v2)
      drm/nouveau/ttm: use driver bind/unbind/destroy functions.
      drm/vmwgfx: move to driver binding functions
      drm/amdgpu/ttm: move to driver backend binding funcs
      drm/gem_vram/ttm: move to driver backend destroy function.
      drm/ttm/agp: drop back end bindings from agp
      drm/ttm: get rid of agp specific populate/unpopulate paths.
      drm/ttm/agp: remove bdev from agp helpers
      drm/ttm: drop the tt backend function paths.
      drm/ttm/tt: add wrappers to set tt state.
      drm/ttm: wrap tt destroy. (v2)
      drm/ttm: tt destroy move null check to outer function.
      drm/ttm: split populate out from binding.
      drm/ttm: move ttm binding/unbinding out of ttm_tt paths.
      drm/ttm: split bound/populated flags.
      drm/ttm: move populated state into page flags
      drm/ttm: protect against reentrant bind in the drivers
      drm/ttm: flip tt destroy ordering.
      drm/ttm: move unbind into the tt destroy.
      drm/ttm/drivers: call the bind function directly.
      drm/ttm: add a simple assign mem to bo wrapper
      drm/ttm: move ghost object creation to a common function
      drm/ttm: make common function for wait/free node path.
      drm/ttm: drop special pipeline accel cleanup function.
      drm/ttm: drop evicted from ttm_bo.

Dave Stevenson (7):
      drm/vc4: Add support for the BCM2711 HVS5
      drm/vc4: plane: Change LBM alignment constraint on LBM
      drm/vc4: plane: Optimize the LBM allocation size
      drm/vc4: hdmi: Use reg-names to retrieve the HDMI audio registers
      drm/vc4: hdmi: Reset audio infoframe on encoder_enable if previously =
streaming
      drm/vc4: hdmi: Set the b-frame marker to the match ALSA's default.
      drm/vc4: hdmi: Add audio-related callbacks

Dinghao Liu (2):
      drm/crc-debugfs: Fix memleak in crc_control_write
      video: fbdev: radeon: Fix memleak in radeonfb_pci_register

Doug Horn (1):
      Fix use after free in get_capset_info callback.

Enric Balletbo i Serra (1):
      drm/bridge: ps8640: Rework power state handling

Evgeny Novikov (1):
      fbdev: sm712fb: handle ioremap() errors in probe

George Kennedy (1):
      fbmem: add margin check to fb_check_caps()

Gerd Hoffmann (6):
      drm/virtio: fix unblank
      drm/virtio: drop virtio_gpu_output->enabled
      drm: allow limiting the scatter list size.
      drm/virtio: use drmm_mode_config_init
      drm/virtio: return virtio_gpu_queue errors
      drm/virtio: add virtio_gpu_cmd_unref_resource error handling

Gurchetan Singh (2):
      drm/virtio: fix uninitialized variable
      drm/virtio: report uuid in debugfs

Hoegeun Kwon (1):
      drm/vc4: hdmi: Add pixel BVB clock control

Jason Yan (4):
      video: fbdev: kyro: remove set but not used 'ulBestVCO'
      video: fbdev: kyro: remove set but not used 'ulCoreClock'
      drm/i810: make i810_flush_queue() return void
      drm: xlnx: remove defined but not used 'scaling_factors_666'

Jia Yang (1):
      drm: fix double free for gbo in drm_gem_vram_init and drm_gem_vram_cr=
eate

Joe Perches (1):
      video: fbdev: tgafb: Avoid comma separated statements

Kristian H. Kristensen (1):
      udmabuf: Add missing compact_ioctl

Laurentiu Palcu (6):
      drm/imx: compile imx directory by default
      drm/imx: Add initial support for DCSS on iMX8MQ
      drm/imx/dcss: use drm_bridge_connector API
      MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
      dt-bindings: display: imx: add bindings for DCSS
      drm/imx/dcss: fix compilation issue on 32bit

Linus Walleij (6):
      drm/panel: s6e63m0: Break out SPI transport
      drm/panel: s6e63m0: Add DSI transport
      drm/panel: s6e63m0: Add reading functionality
      drm/panel: s6e63m0: Add code to identify panel
      drm/panel: s6e63m0: Order enable/disable sequence
      drm/panel: s6e63m0: Fix up DRM_DEV* regression

Lukas Bulwahn (1):
      MAINTAINERS: make linux-aspeed list remarks consistent

Maxime Ripard (73):
      dt-bindings: display: Add support for the BCM2711 HVS
      drm/vc4: hvs: Boost the core clock during modeset
      drm/vc4: plane: Create more planes
      drm/vc4: crtc: Deal with different number of pixel per clock
      drm/vc4: crtc: Use a shared interrupt
      drm/vc4: crtc: Move the cob allocation outside of bind
      drm/vc4: crtc: Rename HVS channel to output
      drm/vc4: crtc: Use local chan variable
      drm/vc4: crtc: Enable and disable the PV in atomic_enable / disable
      drm/vc4: kms: Convert to for_each_new_crtc_state
      drm/vc4: crtc: Assign output to channel automatically
      drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
      drm/vc4: crtc: Add function to compute FIFO level bits
      drm/vc4: crtc: Rename HDMI encoder type to HDMI0
      drm/vc4: crtc: Add HDMI1 encoder type
      drm/vc4: crtc: Disable color management for HVS5
      drm/vc4: crtc: Turn pixelvalve reset into a function
      drm/vc4: crtc: Move PV dump to config_pv
      drm/vc4: crtc: Move HVS init and close to a function
      drm/vc4: crtc: Move the HVS gamma LUT setup to our init function
      drm/vc4: hvs: Make sure our channel is reset
      drm/vc4: crtc: Remove mode_set_nofb
      drm/vc4: crtc: Remove redundant pixelvalve reset
      drm/vc4: crtc: Move HVS channel init before the PV initialisation
      drm/vc4: encoder: Add finer-grained encoder callbacks
      drm/vc4: crtc: Add a delay after disabling the PixelValve output
      drm/vc4: crtc: Clear the PixelValve FIFO on disable
      drm/vc4: crtc: Clear the PixelValve FIFO during configuration
      drm/vc4: hvs: Make the stop_channel function public
      drm/vc4: hvs: Introduce a function to get the assigned FIFO
      drm/vc4: crtc: Move the CRTC disable out
      drm/vc4: drv: Disable the CRTC at boot time
      dt-bindings: display: vc4: pv: Add BCM2711 pixel valves
      drm/vc4: crtc: Add BCM2711 pixelvalves
      drm/vc4: hdmi: Use debugfs private field
      drm/vc4: hdmi: Move structure to header
      drm/vc4: hdmi: rework connectors and encoders
      drm/vc4: hdmi: Remove DDC argument to connector_init
      drm/vc4: hdmi: Rename hdmi to vc4_hdmi
      drm/vc4: hdmi: Move accessors to vc4_hdmi
      drm/vc4: hdmi: Use local vc4_hdmi directly
      drm/vc4: hdmi: Add container_of macros for encoders and connectors
      drm/vc4: hdmi: Pass vc4_hdmi to CEC code
      drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind using our device
      drm/vc4: hdmi: Remove vc4_dev hdmi pointer
      drm/vc4: hdmi: Remove vc4_hdmi_connector
      drm/vc4: hdmi: Introduce resource init and variant
      drm/vc4: hdmi: Implement a register layout abstraction
      drm/vc4: hdmi: Add reset callback
      drm/vc4: hdmi: Add PHY init and disable function
      drm/vc4: hdmi: Add PHY RNG enable / disable function
      drm/vc4: hdmi: Add a CSC setup callback
      drm/vc4: hdmi: Add a set_timings callback
      drm/vc4: hdmi: Store the encoder type in the variant structure
      drm/vc4: hdmi: Deal with multiple debugfs files
      drm/vc4: hdmi: Move CEC init to its own function
      drm/vc4: hdmi: Add CEC support flag
      drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
      drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
      drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate
      drm/vc4: hdmi: Use clk_set_min_rate instead
      drm/vc4: hdmi: Deal with multiple ALSA cards
      drm/vc4: hdmi: Remove register dumps in enable
      drm/vc4: hdmi: Always recenter the HDMI FIFO
      drm/vc4: hdmi: Implement finer-grained hooks
      drm/vc4: hdmi: Do the VID_CTL configuration at once
      drm/vc4: hdmi: Switch to blank pixels when disabled
      drm/vc4: hdmi: Support the BCM2711 HDMI controllers
      dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI controllers bindings
      dt-bindings: display: vc4: Document BCM2711 VC5
      drm/vc4: drv: Support BCM2711
      Merge drm/drm-next into drm-misc-next
      Merge branch 'virtio-shm' of git://git.kernel.org/.../mszeredi/fuse i=
nto drm-misc-next

Melissa Wen (1):
      MAINTAINERS: add entry for VKMS

Mike Rapoport (1):
      fbdev: remove mbx framebuffer driver

Nathan Chancellor (2):
      drm/vc4: Update type of reg parameter in vc4_hdmi_{read,write}
      drm/vc4: Fix bitwise OR versus ternary operator in vc4_plane_mode_set

Neil Armstrong (2):
      drm/bridge: dw-mipi-dsi: fix dw_mipi_dsi_debugfs_show/write warnings
      drm/bridge: dw-mipi-dsi: permit configuring the escape clock rate

Paul Cercueil (1):
      gpu/drm: ingenic: Add option to mmap GEM buffers cached

Randy Dunlap (2):
      dma-buf: fix kernel-doc warning in dma-fence.c
      dma-buf: fix kernel-doc warning in <linux/dma-buf.h>

Rikard Falkeborn (1):
      drm/gma500: Constify static structs

Robin Murphy (1):
      drm/panfrost: Set DMA max segment size

Rodrigo Alencar (1):
      video: fbdev: ssd1307fb: Added support to Column offset

Rodrigo Siqueira (3):
      drm/vkms: Decouple crc operations from composer
      drm/vkms: Compute CRC without change input data
      drm/vkms: Add support for writeback

Sam McNally (1):
      drm/dp_mst: Support remote i2c writes

Sebastien Boeuf (3):
      virtio: Add get_shm_region method
      virtio: Implement get_shm_region for PCI transport
      virtio: Implement get_shm_region for MMIO transport

Stefan Agner (1):
      drm: mxsfb: check framebuffer pitch

Steven Price (1):
      drm/panfrost: Ensure GPU quirks are always initialised

Sven Schneider (1):
      lib/fonts: add font 6x8 for OLED display

Thomas Zimmermann (6):
      drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
      MAINTAINERS: Add Thomas as reviewer for ast, mgag200 and udl
      drm/ast: Set format registers in primary plane's update
      drm/ast: Disable planes while switching display modes
      drm/ast: Program display mode in CRTC's atomic_enable()
      drm/ast: Enable CRTC before planes

Tian Tao (1):
      drm/vc4: Handing the return value of drm_universal_plane_init

Tom Rix (1):
      video: fbdev: sis: fix null ptr dereference

Vaibhav Gupta (14):
      fbdev: gxfb: use generic power management
      fbdev: lxfb: use generic power management
      fbdev: via-core: use generic power management
      fbdev: aty: use generic power management
      fbdev: aty128fb: use generic power management
      fbdev: nvidia: use generic power management
      fbdev: savagefb: use generic power management
      fbdev: cyber2000fb: use generic power management
      fbdev: i740fb: use generic power management
      fbdev: vt8623fb: use generic power management
      fbdev: s3fb: use generic power management
      fbdev: arkfb: use generic power management
      video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
      fbdev: radeonfb: use generic power management

Ville Syrj=E4l=E4 (5):
      drm: Nuke mode->private_flags
      drm: Replace mode->export_head with a boolean
      drm/atomic-helper: Extract drm_atomic_helper_calc_timestamping_consta=
nts()
      drm/atomic-helper: Remove the timestamping constant update from drm_a=
tomic_helper_update_legacy_modeset_state()
      drm/i915: Drop the drm_atomic_helper_calc_timestamping_constants() ca=
ll

Wang Qing (1):
      drm: fix spelling error in comments

YueHaibing (1):
      drm/panel: s6e63m0: Add missing MODULE_LICENSE

Zheng Bin (1):
      drm/bridge/tc358775: Remove unneeded semicolon

kernel test robot (1):
      video: fbdev: udlfb: fix kobj_to_dev.cocci warnings

 .../bindings/display/brcm,bcm2711-hdmi.yaml        |  117 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |   18 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |    5 +
 .../bindings/display/brcm,bcm2835-vc4.yaml         |    1 +
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  108 +
 .../devicetree/bindings/display/ssd1307fb.txt      |    1 +
 Documentation/driver-api/driver-model/devres.rst   |    2 +-
 Documentation/fb/fbcon.rst                         |    4 +-
 Documentation/userspace-api/ioctl/ioctl-number.rst |    2 -
 MAINTAINERS                                        |   24 +-
 drivers/dma-buf/dma-fence.c                        |    1 +
 drivers/dma-buf/dma-resv.c                         |    5 +
 drivers/dma-buf/udmabuf.c                          |    3 +
 drivers/gpu/drm/Makefile                           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  125 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    3 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    1 +
 drivers/gpu/drm/armada/armada_crtc.c               |    4 +-
 drivers/gpu/drm/armada/armada_debugfs.c            |    2 +-
 drivers/gpu/drm/armada/armada_drm.h                |    2 +
 drivers/gpu/drm/armada/armada_drv.c                |   30 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |    4 +-
 drivers/gpu/drm/armada/armada_gem.c                |    4 +-
 drivers/gpu/drm/armada/armada_overlay.c            |    8 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   15 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    2 +
 drivers/gpu/drm/ast/ast_mode.c                     |  103 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   68 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  155 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   24 +-
 drivers/gpu/drm/drm_connector.c                    |   45 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    4 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  106 +-
 drivers/gpu/drm/drm_drv.c                          |   78 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    9 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    2 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    5 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  126 +-
 drivers/gpu/drm/drm_managed.c                      |    2 +-
 drivers/gpu/drm/drm_prime.c                        |   13 +-
 drivers/gpu/drm/drm_vblank.c                       |    4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    6 +-
 drivers/gpu/drm/i810/i810_dma.c                    |    6 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    6 -
 drivers/gpu/drm/imx/Kconfig                        |    2 +
 drivers/gpu/drm/imx/Makefile                       |    1 +
 drivers/gpu/drm/imx/dcss/Kconfig                   |    9 +
 drivers/gpu/drm/imx/dcss/Makefile                  |    6 +
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |   70 +
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |  219 ++
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c              |  424 ++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |  325 +++
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |  177 ++
 drivers/gpu/drm/imx/dcss/dcss-dpr.c                |  562 +++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |  138 ++
 drivers/gpu/drm/imx/dcss/dcss-dtg.c                |  409 ++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  198 ++
 drivers/gpu/drm/imx/dcss/dcss-kms.h                |   44 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |  405 +++
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |  826 +++++++
 drivers/gpu/drm/imx/dcss/dcss-ss.c                 |  180 ++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  114 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |    4 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   12 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   21 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    9 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c            |    5 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c         |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |    3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  321 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   15 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |    4 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    6 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    2 +
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   34 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   13 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   66 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   75 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |    3 +
 drivers/gpu/drm/nouveau/nv17_fence.c               |    5 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |    5 +-
 drivers/gpu/drm/nouveau/nv84_fence.c               |   13 +-
 drivers/gpu/drm/panel/Kconfig                      |   23 +-
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |  139 ++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |  101 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  154 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   13 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   30 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   45 +-
 drivers/gpu/drm/radeon/radeon.h                    |    8 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    6 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   44 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |    4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  226 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    5 +-
 drivers/gpu/drm/tegra/gem.c                        |    2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |   45 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  180 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  390 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   42 +-
 drivers/gpu/drm/ttm/ttm_memory.c                   |    7 -
 drivers/gpu/drm/ttm/ttm_page_alloc.c               |    6 +-
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           |    6 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    7 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    5 -
 drivers/gpu/drm/ttm/ttm_tt.c                       |   89 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   10 +-
 drivers/gpu/drm/vc4/Makefile                       |    1 +
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  354 ++-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    5 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |   43 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 1686 ++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  184 ++
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |  521 ++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |  442 ++++
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  269 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  229 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  226 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  177 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    4 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   61 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   11 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   10 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   53 +-
 drivers/gpu/drm/vkms/Makefile                      |    9 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   96 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   58 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   10 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |    4 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |  142 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |   11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  119 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |    6 -
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   27 +-
 drivers/video/fbdev/Kconfig                        |   19 -
 drivers/video/fbdev/Makefile                       |    1 -
 drivers/video/fbdev/arkfb.c                        |   41 +-
 drivers/video/fbdev/aty/aty128fb.c                 |   51 +-
 drivers/video/fbdev/aty/atyfb_base.c               |   50 +-
 drivers/video/fbdev/aty/radeon_base.c              |   12 +-
 drivers/video/fbdev/aty/radeon_pm.c                |   38 +-
 drivers/video/fbdev/aty/radeonfb.h                 |    3 +-
 drivers/video/fbdev/core/fbmem.c                   |    4 +
 drivers/video/fbdev/cyber2000fb.c                  |   13 +-
 drivers/video/fbdev/geode/gxfb.h                   |    5 -
 drivers/video/fbdev/geode/gxfb_core.c              |   36 +-
 drivers/video/fbdev/geode/lxfb.h                   |    5 -
 drivers/video/fbdev/geode/lxfb_core.c              |   37 +-
 drivers/video/fbdev/geode/lxfb_ops.c               |    4 -
 drivers/video/fbdev/geode/suspend_gx.c             |    4 -
 drivers/video/fbdev/i740fb.c                       |   40 +-
 drivers/video/fbdev/kyro/STG4000InitDevice.c       |    7 +-
 drivers/video/fbdev/mbx/Makefile                   |    4 -
 drivers/video/fbdev/mbx/mbxdebugfs.c               |  232 --
 drivers/video/fbdev/mbx/mbxfb.c                    | 1053 --------
 drivers/video/fbdev/mbx/reg_bits.h                 |  614 -----
 drivers/video/fbdev/mbx/regs.h                     |  196 --
 drivers/video/fbdev/nvidia/nvidia.c                |   66 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |    2 +-
 drivers/video/fbdev/s3fb.c                         |   39 +-
 drivers/video/fbdev/savage/savagefb_driver.c       |   52 +-
 drivers/video/fbdev/sis/init.c                     |   11 +-
 drivers/video/fbdev/sm712fb.c                      |    8 +
 drivers/video/fbdev/ssd1307fb.c                    |    8 +-
 drivers/video/fbdev/sstfb.c                        |    2 +-
 drivers/video/fbdev/tgafb.c                        |   12 +-
 drivers/video/fbdev/udlfb.c                        |    4 +-
 drivers/video/fbdev/vga16fb.c                      |   14 +-
 drivers/video/fbdev/via/via-core.c                 |   39 +-
 drivers/video/fbdev/vt8623fb.c                     |   41 +-
 drivers/virtio/virtio_mmio.c                       |   31 +
 drivers/virtio/virtio_pci_modern.c                 |   95 +
 include/drm/bridge/dw_mipi_dsi.h                   |    1 +
 include/drm/drm_atomic_helper.h                    |    3 +
 include/drm/drm_device.h                           |    2 +-
 include/drm/drm_drv.h                              |   16 +-
 include/drm/drm_gem_vram_helper.h                  |   10 +-
 include/drm/drm_mm.h                               |    2 +-
 include/drm/drm_modes.h                            |   26 +-
 include/drm/drm_prime.h                            |    3 +-
 include/drm/ttm/ttm_bo_api.h                       |   14 -
 include/drm/ttm/ttm_bo_driver.h                    |  131 +-
 include/drm/ttm/ttm_execbuf_util.h                 |   19 +-
 include/drm/ttm/ttm_memory.h                       |   26 +-
 include/drm/ttm/ttm_placement.h                    |    9 +-
 include/drm/ttm/ttm_resource.h                     |   28 +-
 include/drm/ttm/ttm_tt.h                           |   96 +-
 include/linux/dma-buf.h                            |    3 +-
 include/linux/font.h                               |    4 +-
 include/linux/via-core.h                           |    2 -
 include/linux/virtio_config.h                      |   17 +
 include/uapi/linux/virtio_mmio.h                   |   11 +
 include/uapi/linux/virtio_pci.h                    |   11 +-
 include/video/mbxfb.h                              |   99 -
 lib/fonts/Kconfig                                  |    7 +
 lib/fonts/Makefile                                 |    1 +
 lib/fonts/font_6x8.c                               | 2576 ++++++++++++++++=
++++
 lib/fonts/fonts.c                                  |    3 +
 223 files changed, 13060 insertions(+), 5382 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-=
hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8m=
q-dcss.yaml
 create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c
 delete mode 100644 drivers/video/fbdev/mbx/Makefile
 delete mode 100644 drivers/video/fbdev/mbx/mbxdebugfs.c
 delete mode 100644 drivers/video/fbdev/mbx/mbxfb.c
 delete mode 100644 drivers/video/fbdev/mbx/reg_bits.h
 delete mode 100644 drivers/video/fbdev/mbx/regs.h
 delete mode 100644 include/video/mbxfb.h
 create mode 100644 lib/fonts/font_6x8.c

--h7kqovvpvefl7v36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2RrswAKCRDj7w1vZxhR
xfdJAP9EIi0vP9/0uxJK8aVwK8mBre/sWcV2mXJANG1HTrc6NgD7BK5tciB4DzhC
6p4nUStY5E0ZyZO5rjaUCXxgnKxKAA4=
=9WLV
-----END PGP SIGNATURE-----

--h7kqovvpvefl7v36--

--===============2005623529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2005623529==--
