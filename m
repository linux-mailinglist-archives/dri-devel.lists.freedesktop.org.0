Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50957265CEA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E36E9B2;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE64C89F38
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:18:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7B5DD580395;
 Thu, 10 Sep 2020 04:18:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 10 Sep 2020 04:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=qxlGs6ZDubof2KZPvYt6U7Iw2vijZa3Xl4w0JNgrpK8=; b=BaFt+mXS
 AZcem24nPysAjqDLpTLEzm1Eq3TU+WW8lJhYP6BT0Bpc7hQ4fUDd4WDZQg2ejpQt
 R7xWQNqfdWq7oWzt2u3DpaGU3wBannWF95vOXZeDrZvkWjfuz7a1QLAj3whcJCce
 FazAntiLWPUT4PEhYTelzuR6CUFvbF3bbbPY2QV5aAuKHD/4csr6523z+Y1uG1MP
 sHXp3kRUyAQUsvGedsI/SYGArZ3coRMENKDfXoPHIug6X3Lo5yrtZWbURSmTKTrr
 8TSShFGYu/wDBDIAmSw3m2aT8PYdWp/mRdkBTsKDfEI7LKbg16T6t4ClcuZpwiaN
 bkxtev7pOoFw7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=qxlGs6ZDubof2KZPvYt6U7Iw2vijZ
 a3Xl4w0JNgrpK8=; b=s7rUegqw8cZdiADZn3D9uzGK/lnXgr9IvkWa6b2WH6UJF
 kbjp9+gSZ17Ok3zmY/ZxxKOxiGKC3TJokVECLeVqBwcV1gd7jHTt4bTrZc4pNiLw
 LxNFZDQKnlxUc1K19qZ2t0Hj+yQi0qJoP073sEtlX2HIaMtoNlbt+/ATaVkKcYeI
 k8ZKaUsF3LOb2GH6VwK2TnYNyPY/+rGb2Wg1XAElLLbbpon2DBhYLpDyoJ8nRL57
 Ful0rRh+eQYoGG0kBY6qMR0+x2vydnj6dxuTgL/XX22T8Sx2oNWl1vCF4WjHPxUA
 8LwbtLpBT+cNkVQJYjHArm08DPVDqX76yDdw1hHoQ==
X-ME-Sender: <xms:YOFZX_yP7hFz-uFB05Th1y2yQ-vEBwMkgWPJ9ayubCIwKVGigdSTtg>
 <xme:YOFZX3TSNYTlzfKKzHpHm6KFl1T__hFGJsytLHzo4CTUi870p-Djke3G2msbylSJJ
 MdK7eFIHZ-kKIHq-nY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YOFZX5UrTzj3OdIpLKCBsnJ9TMJ3rb6igjwXnG0ENfvaXrlScBdWdw>
 <xmx:YOFZX5jYHMO5V69ag-v1GJQRooWZZt9I-FzmIsCmlwuGYJZ9dM5mEQ>
 <xmx:YOFZXxCNRLYpqcydiFFJT32wxFLO_ozb4zqVc4x26GkZJrD84pxnpQ>
 <xmx:YeFZX10jpMHKOplUUcm5kDjW78TN6d4fhV03wsCVyUZ-x0HzqYJI2w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74956328005A;
 Thu, 10 Sep 2020 04:18:40 -0400 (EDT)
Date: Thu, 10 Sep 2020 10:18:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200910081838.z34aqbjtytd74yad@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Content-Type: multipart/mixed; boundary="===============0354761477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0354761477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mtv2brds53ndakal"
Content-Disposition: inline


--mtv2brds53ndakal
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here is this week PR for drm-misc-next

Thanks!
Maxime

drm-misc-next-2020-09-10:
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - fbdev: Various cleanups, conversion to PM helpers
  - ttm: More reworks

Driver Changes:
  - imx: Support for the i.MX8MQ DCSS
  - vc4: Support for the BCM2711/RPi4
  - panel: Support DSI for s6e63m0
The following changes since commit bfacb84993eb173c0ab53ca4dd6180f76f4dc176:

  drm: virtio: fix kconfig dependency warning (2020-08-31 08:55:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-09-10

for you to fetch changes up to 13138ab2dacd0076a93f74b49ea8fe806e49c3f5:

  drm/panel: s6e63m0: Add missing MODULE_LICENSE (2020-09-10 08:53:06 +0200)

----------------------------------------------------------------
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - fbdev: Various cleanups, conversion to PM helpers
  - ttm: More reworks

Driver Changes:
  - imx: Support for the i.MX8MQ DCSS
  - vc4: Support for the BCM2711/RPi4
  - panel: Support DSI for s6e63m0

----------------------------------------------------------------
Alex Dewar (1):
      video: fbdev: sstfb: replace spurious snprintf() with sprintf()

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

Christian K=F6nig (5):
      drm/ttm: make sure that we always zero init mem.bus v2
      drm/nouveau: move io_reserve_lru handling into the driver v5
      drm/ttm: remove io_reserve_lru handling v3
      drm/qxl: don't touch mem.bus.offset
      drm/ttm: merge offset and base in ttm_bus_placement

Colin Ian King (2):
      video: fbdev: vga16fb: fix setting of pixclock because a pass-by-valu=
e error
      omapfb: fix spelling mistake "propert" -> "property"

Daniel Vetter (1):
      drm/managed: Cleanup of unused functions and polishing docs

Dave Airlie (14):
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

Evgeny Novikov (1):
      fbdev: sm712fb: handle ioremap() errors in probe

George Kennedy (1):
      fbmem: add margin check to fb_check_caps()

Gerd Hoffmann (3):
      drm/virtio: fix unblank
      drm/virtio: drop virtio_gpu_output->enabled
      drm: allow limiting the scatter list size.

Gurchetan Singh (2):
      drm/virtio: fix uninitialized variable
      drm/virtio: report uuid in debugfs

Hoegeun Kwon (1):
      drm/vc4: hdmi: Add pixel BVB clock control

Jason Yan (2):
      video: fbdev: kyro: remove set but not used 'ulBestVCO'
      video: fbdev: kyro: remove set but not used 'ulCoreClock'

Joe Perches (1):
      video: fbdev: tgafb: Avoid comma separated statements

Kristian H. Kristensen (1):
      udmabuf: Add missing compact_ioctl

Laurentiu Palcu (5):
      drm/imx: compile imx directory by default
      drm/imx: Add initial support for DCSS on iMX8MQ
      drm/imx/dcss: use drm_bridge_connector API
      MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
      dt-bindings: display: imx: add bindings for DCSS

Linus Walleij (6):
      drm/panel: s6e63m0: Break out SPI transport
      drm/panel: s6e63m0: Add DSI transport
      drm/panel: s6e63m0: Add reading functionality
      drm/panel: s6e63m0: Add code to identify panel
      drm/panel: s6e63m0: Order enable/disable sequence
      drm/panel: s6e63m0: Fix up DRM_DEV* regression

Maxime Ripard (71):
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

Melissa Wen (1):
      MAINTAINERS: add entry for VKMS

Mike Rapoport (1):
      fbdev: remove mbx framebuffer driver

Neil Armstrong (1):
      drm/bridge: dw-mipi-dsi: fix dw_mipi_dsi_debugfs_show/write warnings

Randy Dunlap (2):
      dma-buf: fix kernel-doc warning in dma-fence.c
      dma-buf: fix kernel-doc warning in <linux/dma-buf.h>

Rikard Falkeborn (1):
      drm/gma500: Constify static structs

Rodrigo Alencar (1):
      video: fbdev: ssd1307fb: Added support to Column offset

Rodrigo Siqueira (3):
      drm/vkms: Decouple crc operations from composer
      drm/vkms: Compute CRC without change input data
      drm/vkms: Add support for writeback

Sam McNally (1):
      drm/dp_mst: Support remote i2c writes

Sven Schneider (1):
      lib/fonts: add font 6x8 for OLED display

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

Ville Syrj=E4l=E4 (2):
      drm: Nuke mode->private_flags
      drm: Replace mode->export_head with a boolean

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
 MAINTAINERS                                        |    9 +
 drivers/dma-buf/dma-fence.c                        |    1 +
 drivers/dma-buf/udmabuf.c                          |    3 +
 drivers/gpu/drm/Makefile                           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   81 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  132 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    2 +-
 drivers/gpu/drm/drm_connector.c                    |   45 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    4 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  106 +-
 drivers/gpu/drm/drm_drv.c                          |   78 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    9 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    2 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    5 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   12 +-
 drivers/gpu/drm/drm_managed.c                      |    2 +-
 drivers/gpu/drm/drm_prime.c                        |   13 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    6 +-
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
 drivers/gpu/drm/msm/msm_gem.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  174 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    3 +
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    2 +
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |    3 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   56 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   44 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |    3 +
 drivers/gpu/drm/panel/Kconfig                      |   23 +-
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |  139 ++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |  101 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  154 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   13 +
 drivers/gpu/drm/qxl/qxl_object.c                   |    6 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   38 +-
 drivers/gpu/drm/radeon/radeon.h                    |    7 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    6 +-
 drivers/gpu/drm/radeon/radeon_object.c             |    2 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |    4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  156 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    5 +-
 drivers/gpu/drm/tegra/gem.c                        |    2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |   31 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   48 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  146 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   42 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    3 -
 drivers/gpu/drm/ttm/ttm_tt.c                       |   45 +-
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
 drivers/gpu/drm/vc4/vc4_plane.c                    |  224 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  177 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    4 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   15 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    6 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   10 +-
 drivers/gpu/drm/vkms/Makefile                      |    9 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   96 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   10 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |    4 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |  142 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   30 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    3 +-
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
 include/drm/drm_device.h                           |    2 +-
 include/drm/drm_drv.h                              |   16 +-
 include/drm/drm_modes.h                            |   26 +-
 include/drm/drm_prime.h                            |    3 +-
 include/drm/ttm/ttm_bo_api.h                       |    1 -
 include/drm/ttm/ttm_bo_driver.h                    |   65 +-
 include/drm/ttm/ttm_resource.h                     |   22 +-
 include/drm/ttm/ttm_tt.h                           |   59 +-
 include/linux/dma-buf.h                            |    3 +-
 include/linux/font.h                               |    4 +-
 include/linux/via-core.h                           |    2 -
 include/video/mbxfb.h                              |   99 -
 lib/fonts/Kconfig                                  |    7 +
 lib/fonts/Makefile                                 |    1 +
 lib/fonts/font_6x8.c                               | 2576 ++++++++++++++++=
++++
 lib/fonts/fonts.c                                  |    3 +
 160 files changed, 11775 insertions(+), 4399 deletions(-)
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

--mtv2brds53ndakal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1nhXgAKCRDj7w1vZxhR
xYlDAP4uF59/H3sLdufVZH4sfJYOqYxf260+JG8qePz9sgHsfwEAgtYtsaI+sTPJ
JHdUnMgvKf7P3B8MOhiwUB1cbFTpUgU=
=YsM/
-----END PGP SIGNATURE-----

--mtv2brds53ndakal--

--===============0354761477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0354761477==--
