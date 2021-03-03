Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2F32B66E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 11:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBE689FCE;
	Wed,  3 Mar 2021 10:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B689E0D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 10:06:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 042B1580411;
 Wed,  3 Mar 2021 05:06:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 03 Mar 2021 05:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=mbihBLNX+Mm05W5WrN7R7DaNComy/MXwn7VC8GLpMcs=; b=pu3EDV92
 CgxXLhrBdEmefme9MWnIaT3G5DGSq/18tT/po7LExhvnXyfFKrcINJ37yHrDnn/k
 aHmdcCpxY3TEvE+PZUBX3ZaX2gKj0ktGXfNnC8QayL008MxOBgW0AaDZqRBMslfk
 YXA5c1IwTejJEXHsA4Igr0WRatdhGwaiwgHAFSTYhSkJ2AnVAetMOKFiBuEyENhu
 bSC5ygW00GtSP+DZ0pr79cMFC/EpSE1BJQJgHiXvkWMkmHjU6L+QufLXLUiqFVX5
 bxH9RmUr7WdPdcQ5wqaL5N9yIe2c7hZjj7w0aD8EsM/bK/QjKGs/7Hz5OQ33Y1cR
 RI3m/GJ8igBlkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=mbihBLNX+Mm05W5WrN7R7DaNComy/
 MXwn7VC8GLpMcs=; b=X+oyK+ZbvXLk0X5NhVIqH98bfGv3OelACRRxBT95Q1ven
 YSWPeDpX3RcVKaEw0MIUEt9fEnnXnnFxCE2O1f8/SS8ZusyyPTYciaGxe+JENPdB
 UvpF2fcIY2rztZQjCop3ZpLOzw3XvOpFJHsAeAuny6XgP/8ds9nBrOmCyDywBz4n
 mX6flbwGc3MYeXZAGAxeaIcPIIjpl1kXV2fcO5cOW8xadu444t+p10Cl6VsmrDTt
 JiOBBUD/CPJt7t9XavyrSWiaTZzfY0DbyDBUDkk3RjJgrNTECQGzWOhaUqOtM/Ad
 LuOe54ApRFFaRfjoZ76nXRNkFx0s2N7fcvfaQ7tfA==
X-ME-Sender: <xms:i18_YG01hxYd3vxB0pyl7K4QQm5rloqIF5ocqzgFUVWcZlnfMXqdkw>
 <xme:i18_YJHJAyBqjqEq-kGRGYiW8OT7lB6g0v5hDLDVGgSAR0u2s3c9w1av8332xb7H7
 jD_j2agqeNzzLL6ob8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepheeghfduueffffetleejvdeghffgfeevfeejffetieffgfeufeejgfehteeifffh
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i18_YO5wwY_lDH4eJM-smbZDw3wyemWnwnk15Rb4d5vy35x0UjJb5w>
 <xmx:i18_YH1VHsWmZP6RiQOU_CJh8KKVvq3XBjJIrmqtWNq-y6iCyOcggA>
 <xmx:i18_YJF4OKDADCv6duZRm1JgrKhGCrnzou9f9qrFLQ2ub6E-kLElrw>
 <xmx:jF8_YPZwhqaH_6ycIHg8XZnN45Jp602P2BMqnvAM9J7uN2glVcU_NQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 103751080059;
 Wed,  3 Mar 2021 05:06:02 -0500 (EST)
Date: Wed, 3 Mar 2021 11:06:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20210303100600.dgnkadonzuvfnu22@gilmour>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0418496282=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0418496282==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zaf6qybv4tkxhip7"
Content-Disposition: inline


--zaf6qybv4tkxhip7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's the first round of drm-misc-next changes for 5.13.

Maxime

drm-misc-next-2021-03-03:
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - %p4cc printk format modifier
  - atomic: introduce drm_crtc_commit_wait, rework atomic plane state
    helpers to take the drm_commit_state structure
  - dma-buf: heaps rework to return a struct dma_buf
  - simple-kms: Add plate state helpers
  - ttm: debugfs support, removal of sysfs

Driver Changes:
  - Convert drivers to shadow plane helpers
  - arc: Move to drm/tiny
  - ast: cursor plane reworks
  - gma500: Remove TTM and medfield support
  - mxsfb: imx8mm support
  - panfrost: MMU IRQ handling rework
  - qxl: rework to better handle resources deallocation, locking
  - sun4i: Add alpha properties for UI and VI layers
  - vc4: RPi4 CEC support
  - vmwgfx: doc cleanup
The following changes since commit c31eb10fd5aee124b78ce72ebf7d0cd13fca6095:

  drm/amdgpu: Remove accidentally added small unused hunk. (2021-01-19 11:1=
8:39 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-03-03

for you to fetch changes up to 762949bb1da78941b25e63f7e952af037eee15a9:

  drm: fix drm_mode_create_blob comment (2021-03-02 20:43:34 +0100)

----------------------------------------------------------------
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - %p4cc printk format modifier
  - atomic: introduce drm_crtc_commit_wait, rework atomic plane state
    helpers to take the drm_commit_state structure
  - dma-buf: heaps rework to return a struct dma_buf
  - simple-kms: Add plate state helpers
  - ttm: debugfs support, removal of sysfs

Driver Changes:
  - Convert drivers to shadow plane helpers
  - arc: Move to drm/tiny
  - ast: cursor plane reworks
  - gma500: Remove TTM and medfield support
  - mxsfb: imx8mm support
  - panfrost: MMU IRQ handling rework
  - qxl: rework to better handle resources deallocation, locking
  - sun4i: Add alpha properties for UI and VI layers
  - vc4: RPi4 CEC support
  - vmwgfx: doc cleanup

----------------------------------------------------------------
Ahmed S. Darwish (2):
      video: omap: Remove in_interrupt() usage.
      video: omapfb: Remove WARN_ON(in_interrupt()).

Bernard Zhao (1):
      drm/vc4: remove unneeded variable: "ret"

Bjorn Andersson (1):
      dt-bindings: dp-connector: Drop maxItems from -supply

Boris Brezillon (3):
      drm/panfrost: Clear MMU irqs before handling the fault
      drm/panfrost: Don't try to map pages that are already mapped
      drm/panfrost: Stay in the threaded MMU IRQ handler until we've handle=
d all IRQs

Christian Hewitt (1):
      drm/lima: add governor data with pre-defined thresholds

Christian K=C3=B6nig (13):
      drm/ttm: add debugfs directory v2
      drm/ttm: add a debugfs file for the global page pools
      drm/ttm: add debugfs entry to test pool shrinker v2
      drm/ttm: optimize ttm pool shrinker a bit
      drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v3
      drm/ttm: device naming cleanup
      drm/v3d/v3d_sched: fix scheduler callbacks return status
      drm/scheduler: provide scheduler score externally
      drm/ttm: fix removal of bo_count sysfs file
      drm/ttm: rework ttm_tt page limit v4
      drm/ttm: move memory accounting into vmwgfx v4
      drm/ttm: drop sysfs directory
      drm/vram-helper: cleanup drm_gem_vram_bo_driver_move_notify

Colin Ian King (1):
      drm/mgag200: make a const array static, makes object smaller

Dan Carpenter (2):
      drm/vmwgfx/vmwgfx_drv: Fix an error path in vmw_setup_pci_resources()
      drm/virtio: fix an error code in virtio_gpu_init()

Daniel Vetter (28):
      drm: Update todo.rst
      drm/todo: Add entry for moving to dma_resv_lock
      drm/vblank: Document drm_crtc_vblank_restore constraints
      drm/tidss: Annotate dma-fence critical section in commit path
      drm/tegra: Annotate dma-fence critical section in commit path
      drm/omapdrm: Annotate dma-fence critical section in commit path
      drm/atmel: Use drm_atomic_helper_commit
      drm/malidp: Annotate dma-fence critical section in commit path
      drm/komeda: Annotate dma-fence critical section in commit path
      drm/vkms: Annotate vblank timer
      drm/arc: Switch to devm_drm_dev_alloc
      drm/arc: Stop using drm_device->dev_private
      drm/arc: Delete arcpgu_priv->fb
      drm/arc: Embedded a drm_simple_display_pipe
      drm/arc: Embedd a drm_connector for sim case
      drm/arc: Drop surplus connector registration
      drm/arc: Use drmm_mode_config_cleanup
      drm/arc: Align with simple pipe helpers
      drm/arc: Convert to drm_simple_kms_pipe_helper
      drm/arc: Drop crtc check in arc_pgu_update
      drm/arc: Inline arcpgu_crtc.c
      drm/arc: Inline arcpgu_drm_hdmi_init
      drm/arc: Inline remaining files
      drm/arc: Initialize sim connector before display pipe
      drm/arc: Move to drm/tiny
      drm/compat: Clear bounce structures
      drm/compat: more dummy implementations
      drm/arcpgu: Really delete file

Dario Binacchi (1):
      drm/tilcdc: fix raster control register setting

Dom Cobley (5):
      drm/vc4: hdmi: Move hdmi reset to bind
      drm/vc4: hdmi: Fix register offset with longer CEC messages
      drm/vc4: hdmi: Fix up CEC registers
      drm/vc4: hdmi: Restore cec physical address on reconnect
      drm/vc4: hdmi: Remove cec_available flag

Gerd Hoffmann (20):
      Revert "drm/qxl: do not run release if qxl failed to init"
      drm/qxl: use drmm_mode_config_init
      drm/qxl: unpin release objects
      drm/qxl: release shadow on shutdown
      drm/qxl: properly pin/unpin shadow
      drm/qxl: handle shadow in primary destroy
      drm/qxl: properly free qxl releases
      drm/qxl: simplify qxl_fence_wait
      drm/qxl: allocate dumb buffers in ram
      drm/qxl: properly handle device init failures
      drm/qxl: more fence wait rework
      drm/qxl: use ttm bo priorities
      drm/qxl: fix lockdep issue in qxl_alloc_release_reserved
      drm/qxl: rename qxl_bo_kmap -> qxl_bo_vmap_locked
      drm/qxl: add qxl_bo_vmap/qxl_bo_vunmap
      drm/qxl: fix prime vmap
      drm/qxl: fix monitors object vmap
      drm/qxl: move shadow handling to new qxl_prepare_shadow()
      drm/qxl: rework cursor plane
      drm/qxl: add lock asserts to qxl_bo_vmap_locked + qxl_bo_vunmap_locked

Imre Deak (4):
      drm/dp_mst: Don't cache EDIDs for physical ports
      drm/dp_mst: Remove redundant tile property setting
      drm/dp_mst: Use DP_MST_LOGICAL_PORT_0 instead of magic number
      drm/dp_mst: Tune down the WARN modesetting a port with full_pbn=3D0

Jan Beulich (1):
      drm/xen: adjust Kconfig

Jared Baldridge (1):
      drm: Added orientation quirk for OneGX1 Pro

Joe Perches (1):
      dma-buf: Avoid comma separated statements

Joel Stanley (2):
      drm/aspeed: Look up syscon by phandle
      drm/aspeed: Use dt matching for default register values

John Stultz (4):
      dma-buf: system_heap: Make sure to return an error if we abort
      dma-buf: heaps: Rework heap allocation hooks to return struct dma_buf=
 instead of fd
      dma-buf: dma-heap: Provide accessor to get heap name
      dma-buf: heaps: Fix the name used when exporting dmabufs to be the ac=
tual heap name

Joseph Schulte (1):
      drm: replace drm_modeset_lock_all() in drm_client_modeset_dpms_legacy=
()

Julia Lawall (1):
      drm: use getter/setter functions

Kai-Heng Feng (1):
      efifb: Ensure graphics device for efifb stays at PCI D0

Laurent Pinchart (2):
      dt-bindings: display: mxsfb: Convert binding to YAML
      dt-bindings: display: mxsfb: Add and fix compatible strings

Lauri Kasanen (1):
      video: fbdev: simplefb: Add "r5g5b5a1" mode

Lee Jones (31):
      drm/vmwgfx/vmwgfx_execbuf: Fix some kernel-doc related issues
      drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret' from 'vmw_du_prim=
ary_plane_atomic_check()'
      drm/vmwgfx/vmwgfx_kms: Mark vmw_{cursor,primary}_plane_formats as __m=
aybe_unused
      drm/vmwgfx/vmwgfx_drv: Fix some kernel-doc misdemeanours
      drm/vmwgfx/vmwgfx_ioctl: Provide missing '@' sign required by kernel-=
doc
      drm/vmwgfx/vmwgfx_resource: Fix worthy function headers demote some o=
thers
      drm/vmwgfx/vmwgfx_ttm_buffer: Supply some missing parameter descripti=
ons
      drm/vmwgfx/vmwgfx_fifo: Demote non-conformant kernel-doc header
      drm/vmwgfx/vmwgfx_ldu: Supply descriptions for 'state' function param=
eter
      drm/vmwgfx/vmwgfx_kms: Update worthy function headers and demote othe=
rs
      drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to standard comme=
nt blocks
      drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation=
 params/headers
      drm/vmwgfx/vmwgfx_bo: Remove superfluous param description and supply=
 another
      drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
      drm/vmwgfx/vmwgfx_scrn: Demote unworthy kernel-doc headers and update=
 others
      drm/vmwgfx/vmwgfx_surface: Fix some kernel-doc related issues
      drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description and remove ano=
ther
      drm/vmwgfx/vmwgfx_shader: Demote kernel-doc abuses and fix-up worthy =
headers
      drm/vmwgfx/vmwgfx_cmdbuf: Fix a bunch of missing or incorrectly forma=
tted/named params
      drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable 'ret'
      drm/vmwgfx/vmwgfx_stdu: Add some missing param/member descriptions
      drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers' should be plural
      drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple documentation probl=
ems
      drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's 'rcu' member
      drm/vmwgfx/vmwgfx_binding: Provide some missing param descriptions an=
d remove others
      drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
      drm/vmwgfx/vmwgfx_blit: Add description for 'vmw_bo_cpu_blit's 'diff'=
 param
      drm/vmwgfx/vmwgfx_validation: Add some missing struct member/function=
 param descriptions
      drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
      drm/vmwgfx/vmwgfx_thp: Add description for 'vmw_thp_manager's member =
'manager'
      drm/vmwgfx/ttm_object: Reorder header to immediately precede its stru=
ct

Lionel Landwerlin (1):
      drm: fix drm_mode_create_blob comment

Luben Tuikov (1):
      drm/scheduler: Job timeout handler returns status (v3)

Lukasz Luba (2):
      drm/panfrost: Add governor data with pre-defined thresholds
      drm/lima: Use delayed timer as default in devfreq profile

Marek Vasut (2):
      dt-bindings: display: mxsfb: Add compatible for i.MX8MM
      drm/stm: Fix bus_flags handling

Mario Kleiner (1):
      drm: Fix HDMI_STATIC_METADATA_TYPE1 constant

Maxime Ripard (19):
      drm: Introduce a drm_crtc_commit_wait helper
      drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
      drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
      drm/vc4: hdmi: Introduce a CEC clock
      drm/vc4: hdmi: Split the interrupt handlers
      drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
      drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
      dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
      drm/atomic: Pass the full state to planes async atomic check and upda=
te
      drm: Rename plane atomic_check state names
      drm/atmel-hlcdc: Rename custom plane state variable
      drm/atomic: Pass the full state to planes atomic_check
      drm: Use the state pointer directly in planes atomic_check
      drm: Use state helper instead of plane state pointer in atomic_check
      drm: Store new plane state in a variable for atomic_update and disable
      drm: Rename plane->state variables in atomic update and disable
      drm/atomic: Pass the full state to planes atomic disable and update
      drm: Use state helper instead of the plane state pointer
      drm/todo: Remove the drm_atomic_state todo item

Menglong Dong (1):
      drm/omap: dsi: fix unreachable code in dsi_vc_send_short()

Noralf Tr=C3=B8nnes (1):
      drm/shmem-helpers: vunmap: Don't put pages for dma-buf

Patrik Jakobsson (6):
      drm/gma500/cdv: Remove unused code for crt init
      drm/gma500: Remove unused DPST support
      drm/gma500/cdv: Remove unused tv out paths
      drm/gma500: Unify crtc helpers
      drm/gma500: psb_spank() doesn't need it's own file
      drm/gma500: Never wait for blits

Peter Robinson (1):
      video: fbdev: simplefb: Fix info message during probe

Qinglang Miao (1):
      drm/lima: fix reference leak in lima_pm_busy

Quanyang Wang (1):
      drm/tilcdc: send vblank event when disabling crtc

Rikard Falkeborn (3):
      drm/amdgpu/ttm: constify static vm_operations_struct
      drm/radeon/ttm: constify static vm_operations_struct
      drm/nouveau/ttm: constify static vm_operations_struct

Roland Scheidegger (1):
      drm/vmwgfx: add some 16:9 / 16:10 default resolutions

Roman Stratiienko (2):
      drm/sun4i: Add alpha property for sun8i UI layer
      drm/sun4i: Add alpha property for sun8i and sun50i VI layer

Sakari Ailus (3):
      lib/vsprintf: Add support for printing V4L2 and DRM fourccs
      v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
      drm: Switch to %p4cc format modifier

Sebastian Andrzej Siewior (2):
      drm/gma500: Remove in_atomic() usage.
      video: fbdev: amba-clcd: Always use msleep() for waiting

Simon Ser (2):
      drm/doc: fix drm_plane_type docs
      drm/doc: document the type plane property

Thomas Zimmermann (26):
      drm/vmwgfx: Remove reference to struct drm_device.pdev
      drm/gma500: Remove Medfield support
      drm/gma500: Drop DRM_GMA3600 config option
      drm/gma500: Remove CONFIG_X86 conditionals from source files
      drm/gma500: Remove dependency on TTM
      drm/simple-kms: Add plane-state helpers
      drm/gem: Export drm_gem_vmap() and drm_gem_vunmap()
      drm: Add additional atomic helpers for shadow-buffered planes
      drm/mgag200: Move vmap out of commit tail
      drm/cirrus: Move vmap out of commit tail
      drm/gm12u320: Move vmap out of commit tail
      drm/udl: Move vmap out of commit tail
      drm/gma500: Drop DRM_GMA600 config option
      drm/gem: Export helpers for shadow-buffered planes
      drm/vboxvideo: Implement cursor plane with struct drm_shadow_plane_st=
ate
      drm/ast: Add constants for VGACRCB register bits
      drm/ast: Fix invalid usage of AST_MAX_HWC_WIDTH in cursor atomic_check
      drm/ast: Initialize planes in helper functions
      drm/ast: Allocate HW cursor BOs during cursor-plane initialization
      drm/ast: Inline ast cursor-update functions into modesetting code
      drm/ast: Add cursor-plane data structure
      drm/ast: Store cursor BOs in cursor plane
      drm/ast: Map HW cursor BOs permanently
      drm/ast: Store each HW cursor offset after pinning the rsp BO
      drm/ast: Move all of the cursor-update functionality to atomic_update
      drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic helpers

Tian Tao (2):
      drm/tilcdc: replace spin_lock_irqsave by spin_lock in hard IRQ
      drm/drv: Remove initialization of static variables

Tong Zhang (2):
      drm/qxl: do not run release if qxl failed to init
      drm/ast: fix memory leak when unload the driver

Veera Sundaram Sankaran (2):
      dma-fence: allow signaling drivers to set fence timestamp
      drm/drm_vblank: set the dma-fence timestamp during send_vblank_event

Wayne Lin (2):
      drm/dp_mst: Revise broadcast msg lct & lcr
      drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broadcast

Ye Bin (1):
      drm/nouveau: remove set but not used variable =E2=80=98pdev=E2=80=99 =
in nouveau_bios_init

Zack Rusin (5):
      drm/vmwgfx: Make sure we unpin no longer needed buffers
      drm/vmwgfx: Fix some memory leaks on errors
      drm/vmwgfx: Correctly set the name of the preferred mode
      drm/vmwgfx: Remove pointless code
      drm/vmwgfx: Bump the minor version and cleanup logging

xinhui pan (1):
      drm/ttm: Do not add non-system domain BO into swap list

 Documentation/core-api/printk-formats.rst          |   18 +
 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   20 +-
 .../bindings/display/connector/dp-connector.yaml   |    1 -
 .../devicetree/bindings/display/fsl,lcdif.yaml     |  110 +++
 .../devicetree/bindings/display/mxsfb.txt          |   87 --
 Documentation/gpu/drm-kms-helpers.rst              |   12 +
 Documentation/gpu/todo.rst                         |   93 +-
 MAINTAINERS                                        |    4 +-
 drivers/dma-buf/dma-fence.c                        |   70 +-
 drivers/dma-buf/dma-heap.c                         |   26 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   23 +-
 drivers/dma-buf/heaps/system_heap.c                |   26 +-
 drivers/dma-buf/st-dma-fence.c                     |    7 +-
 drivers/gpu/drm/Kconfig                            |    2 -
 drivers/gpu/drm/Makefile                           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   28 +-
 drivers/gpu/drm/arc/Kconfig                        |   10 -
 drivers/gpu/drm/arc/Makefile                       |    3 -
 drivers/gpu/drm/arc/arcpgu.h                       |   37 -
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |  217 -----
 drivers/gpu/drm/arc/arcpgu_drv.c                   |  224 -----
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  |   48 -
 drivers/gpu/drm/arc/arcpgu_regs.h                  |   31 -
 drivers/gpu/drm/arc/arcpgu_sim.c                   |  108 ---
 .../drm/arm/display/komeda/komeda_format_caps.h    |   11 -
 .../drm/arm/display/komeda/komeda_framebuffer.c    |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    3 +
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |   21 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   30 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    3 +
 drivers/gpu/drm/arm/malidp_mw.c                    |    7 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   79 +-
 drivers/gpu/drm/armada/armada_overlay.c            |  113 ++-
 drivers/gpu/drm/armada/armada_plane.c              |  115 ++-
 drivers/gpu/drm/armada/armada_plane.h              |    2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |    8 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |   15 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   69 +-
 drivers/gpu/drm/ast/Makefile                       |    3 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |  286 ------
 drivers/gpu/drm/ast/ast_drv.c                      |    2 +
 drivers/gpu/drm/ast/ast_drv.h                      |   47 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  396 ++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  107 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |    7 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  135 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    2 +-
 drivers/gpu/drm/drm_atomic.c                       |   47 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   75 +-
 drivers/gpu/drm/drm_client_modeset.c               |    7 +-
 drivers/gpu/drm/drm_crtc.c                         |    7 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   36 +-
 drivers/gpu/drm/drm_drv.c                          |    2 +-
 drivers/gpu/drm/drm_file.c                         |   68 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   11 +-
 drivers/gpu/drm/drm_gem.c                          |    2 +
 drivers/gpu/drm/drm_gem_atomic_helper.c            |  432 +++++++++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   63 --
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    7 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   42 +-
 drivers/gpu/drm/drm_ioc32.c                        |   26 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |    5 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   14 +
 drivers/gpu/drm/drm_plane.c                        |   66 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   50 +-
 drivers/gpu/drm/drm_syncobj.c                      |   12 +
 drivers/gpu/drm/drm_vblank.c                       |   34 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    9 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |   20 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   24 +-
 drivers/gpu/drm/gma500/Kconfig                     |   28 +-
 drivers/gpu/drm/gma500/Makefile                    |   52 +-
 drivers/gpu/drm/gma500/accel_2d.c                  |   60 --
 drivers/gpu/drm/gma500/blitter.c                   |   43 -
 drivers/gpu/drm/gma500/blitter.h                   |   16 -
 drivers/gpu/drm/gma500/cdv_device.c                |    2 +-
 drivers/gpu/drm/gma500/cdv_device.h                |    1 -
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |   15 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |   23 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    4 -
 drivers/gpu/drm/gma500/gtt.c                       |   11 -
 drivers/gpu/drm/gma500/intel_gmbus.c               |    4 +-
 drivers/gpu/drm/gma500/mdfld_device.c              |  564 -----------
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             | 1017 ----------------=
----
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.h             |   79 --
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |  603 ------------
 drivers/gpu/drm/gma500/mdfld_dsi_output.h          |  377 --------
 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c      |  679 -------------
 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.h      |   80 --
 drivers/gpu/drm/gma500/mdfld_intel_display.c       |  966 ----------------=
---
 drivers/gpu/drm/gma500/mdfld_output.c              |   74 --
 drivers/gpu/drm/gma500/mdfld_output.h              |   76 --
 drivers/gpu/drm/gma500/mdfld_tmd_vid.c             |  197 ----
 drivers/gpu/drm/gma500/mdfld_tpo_vid.c             |   83 --
 drivers/gpu/drm/gma500/mmu.c                       |   21 -
 drivers/gpu/drm/gma500/oaktrail_device.c           |    2 +-
 drivers/gpu/drm/gma500/psb_device.c                |    2 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   50 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   72 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |    2 +-
 drivers/gpu/drm/gma500/psb_intel_reg.h             |   44 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  182 +---
 drivers/gpu/drm/gma500/psb_irq.h                   |    6 -
 drivers/gpu/drm/gma500/psb_reg.h                   |   14 -
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |  805 ----------------
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h         |   38 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   39 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   47 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   14 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   30 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    6 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |   64 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |   92 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   55 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   77 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |   50 +-
 drivers/gpu/drm/lima/lima_devfreq.c                |   11 +-
 drivers/gpu/drm/lima/lima_devfreq.h                |    2 +
 drivers/gpu/drm/lima/lima_sched.c                  |    8 +-
 drivers/gpu/drm/mcde/mcde_display.c                |   10 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |    2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  101 +-
 drivers/gpu/drm/meson/meson_overlay.c              |   31 +-
 drivers/gpu/drm/meson/meson_plane.c                |   51 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   54 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   57 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |    4 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   23 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |    8 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             |    2 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   27 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    6 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   12 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |    8 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |    7 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |   56 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |    2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |    4 +-
 drivers/gpu/drm/panel/panel-simple.c               |    2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   10 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.h        |    2 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   11 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   39 +-
 drivers/gpu/drm/pl111/pl111_display.c              |    4 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |    3 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |  368 ++++---
 drivers/gpu/drm/qxl/qxl_draw.c                     |    8 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    6 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                     |    2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_image.c                    |    2 +-
 drivers/gpu/drm/qxl/qxl_irq.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |   32 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   57 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |    7 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    4 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   88 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   19 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |   10 +-
 drivers/gpu/drm/radeon/radeon.h                    |    6 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   10 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   40 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   17 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   20 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   81 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   22 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |   41 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   77 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   75 +-
 drivers/gpu/drm/stm/ltdc.c                         |   84 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    6 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |   15 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   59 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h             |    5 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   78 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h             |   11 +
 drivers/gpu/drm/tegra/dc.c                         |  116 ++-
 drivers/gpu/drm/tegra/drm.c                        |    3 +
 drivers/gpu/drm/tegra/hub.c                        |   62 +-
 drivers/gpu/drm/tegra/plane.c                      |    4 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    4 +
 drivers/gpu/drm/tidss/tidss_plane.c                |   53 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   20 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   46 +-
 drivers/gpu/drm/tiny/Kconfig                       |   10 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/arcpgu.c                      |  434 +++++++++
 drivers/gpu/drm/tiny/cirrus.c                      |   43 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   28 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    4 +-
 drivers/gpu/drm/tiny/repaper.c                     |    3 +-
 drivers/gpu/drm/tiny/st7586.c                      |    4 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    4 +-
 drivers/gpu/drm/ttm/Makefile                       |    7 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  335 ++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   25 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   24 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |  205 ++++
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    8 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |   54 +-
 drivers/gpu/drm/ttm/ttm_module.h                   |    8 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  169 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    4 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    4 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  129 ++-
 drivers/gpu/drm/tve200/tve200_display.c            |    4 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   34 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   42 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   82 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |    3 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  223 ++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   11 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   17 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   74 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   19 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    8 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   30 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    7 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |    2 +-
 drivers/gpu/drm/{ttm =3D> vmwgfx}/ttm_memory.c       |   22 +-
 .../ttm =3D> drivers/gpu/drm/vmwgfx}/ttm_memory.h    |    5 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |   25 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |    9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   59 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  103 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |    4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   44 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    5 +-
 drivers/gpu/drm/xen/Kconfig                        |   10 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |    3 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   32 +-
 drivers/gpu/drm/zte/zx_plane.c                     |   49 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   85 +-
 drivers/video/fbdev/amba-clcd.c                    |   17 +-
 drivers/video/fbdev/efifb.c                        |    3 +
 drivers/video/fbdev/omap/hwa742.c                  |   42 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |    2 -
 drivers/video/fbdev/simplefb.c                     |    5 +-
 include/drm/drm_atomic.h                           |    4 +
 include/drm/drm_file.h                             |    3 +
 include/drm/drm_gem_atomic_helper.h                |  113 +++
 include/drm/drm_gem_framebuffer_helper.h           |    7 -
 include/drm/drm_gem_vram_helper.h                  |    6 +-
 include/drm/drm_modeset_helper_vtables.h           |   31 +-
 include/drm/drm_plane.h                            |   25 +-
 include/drm/drm_simple_kms_helper.h                |   29 +-
 include/drm/drm_vblank.h                           |    1 -
 include/drm/gpu_scheduler.h                        |   23 +-
 include/drm/ttm/ttm_bo_api.h                       |   48 +-
 include/drm/ttm/ttm_bo_driver.h                    |  329 +------
 include/drm/ttm/ttm_device.h                       |  318 ++++++
 include/drm/ttm/ttm_resource.h                     |    4 +-
 include/drm/ttm/ttm_tt.h                           |   15 +-
 include/linux/dma-fence.h                          |    3 +
 include/linux/dma-heap.h                           |   21 +-
 include/linux/hdmi.h                               |    2 +-
 include/linux/lockdep.h                            |    5 +
 include/linux/platform_data/simplefb.h             |    1 +
 include/uapi/drm/drm_mode.h                        |    2 +-
 lib/test_printf.c                                  |   18 +
 lib/vsprintf.c                                     |   39 +
 scripts/checkpatch.pl                              |    6 +-
 317 files changed, 5891 insertions(+), 10812 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt
 delete mode 100644 drivers/gpu/drm/arc/Kconfig
 delete mode 100644 drivers/gpu/drm/arc/Makefile
 delete mode 100644 drivers/gpu/drm/arc/arcpgu.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c
 delete mode 100644 drivers/gpu/drm/ast/ast_cursor.c
 create mode 100644 drivers/gpu/drm/drm_gem_atomic_helper.c
 delete mode 100644 drivers/gpu/drm/gma500/accel_2d.c
 delete mode 100644 drivers/gpu/drm/gma500/blitter.c
 delete mode 100644 drivers/gpu/drm/gma500/blitter.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_device.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_dpi.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_output.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_output.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_intel_display.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_output.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_output.h
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_tmd_vid.c
 delete mode 100644 drivers/gpu/drm/gma500/mdfld_tpo_vid.c
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
 delete mode 100644 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.h
 create mode 100644 drivers/gpu/drm/tiny/arcpgu.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_device.c
 rename drivers/gpu/drm/{ttm =3D> vmwgfx}/ttm_memory.c (97%)
 rename {include/drm/ttm =3D> drivers/gpu/drm/vmwgfx}/ttm_memory.h (97%)
 create mode 100644 include/drm/drm_gem_atomic_helper.h
 create mode 100644 include/drm/ttm/ttm_device.h

--zaf6qybv4tkxhip7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYD9fiAAKCRDj7w1vZxhR
xWX/AP9KyUHPT06Sn3klLx81DIls8NWHJCXhr6g2S0bLRUh4+gD+Iirsgz8AEWzg
nAEhygq9Em/nTtvtuZ407HL63r3wUAI=
=Tr5m
-----END PGP SIGNATURE-----

--zaf6qybv4tkxhip7--

--===============0418496282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0418496282==--
