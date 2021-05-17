Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24D382D64
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388F6E96E;
	Mon, 17 May 2021 13:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9C6E974;
 Mon, 17 May 2021 13:25:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3760FB1AE;
 Mon, 17 May 2021 13:25:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YKJs2IfwSYvuGPU7@linux-uq9g.fritz.box>
Subject: Re: [PULL] drm-misc-next
Message-ID: <d464825c-3b37-9840-f67e-a6c71e13471b@suse.de>
Date: Mon, 17 May 2021 15:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKJs2IfwSYvuGPU7@linux-uq9g.fritz.box>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7z5OsqB9CELSL0iyGXM9Wa7uxqAsRFpvf"
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7z5OsqB9CELSL0iyGXM9Wa7uxqAsRFpvf
Content-Type: multipart/mixed; boundary="oeNDQ6kYmNjzivpZ1CrF3sf4MWFlIZl3b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Message-ID: <d464825c-3b37-9840-f67e-a6c71e13471b@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <YKJs2IfwSYvuGPU7@linux-uq9g.fritz.box>
In-Reply-To: <YKJs2IfwSYvuGPU7@linux-uq9g.fritz.box>

--oeNDQ6kYmNjzivpZ1CrF3sf4MWFlIZl3b
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.05.21 um 15:17 schrieb Thomas Zimmermann:
> Hi Dave and Daniel,
>=20
> here's this week's PR for drm-misc-next for what wil become v5.14.
> Panfrost gets support for Mediatek MT8381 chips. There are a number of
> fixes for resource leaks in various drivers. Unlocking on errors in
> aperture helpers gets fixes as well.

Oh, there are last week's patches as well! Apparently last week's PR=20
wasn't merged yet. (?) Sorry, I didn't notice. But I received bug=20
reports from linux-next. That's confusing.

Dave, Daniel, can you simply merge both tags, drm-misc-next-2021-05-12=20
and drm-misc-next-2021-05-17?

Best regards
Thomas

>=20
> Best regards
> Thomas
>=20
> drm-misc-next-2021-05-17:
> drm-misc-next for 5.14:
>=20
> UAPI Changes:
>=20
> Cross-subsystem Changes:
>=20
> Core Changes:
>=20
>   * aperture: Fix unlocking on errors
>=20
>   * legacy: Fix some doc comments
>=20
> Driver Changes:
>=20
>   * drm/amdgpu: Free resource on fence usage query; Fix fence calculati=
on;
>=20
>   * drm/bridge: Lt9611: Add missing MODULE_DEVICE_TABLE
>=20
>   * drm/i915: Print formats with %p4cc
>=20
>   * drm/ingenic: IPU planes are now always of type OVERLAY
>=20
>   * drm/nouveau: Remove left-over reference to struct drm_device.pdev
>=20
>   * drm/panfrost: Disable devfreq if num_supplies > 1; Add Mediatek MT8=
183 +
>     DT bindings; Cleanups
>=20
>   * drm/simpledrm: Print resources with %pr; Fix use-after-free errors;=

>     Fix NULL deref; Fix MAINTAINERS entry
>=20
>   * drm/vmwgfx: Fix memory allocation and leak in FIFO allocation; Fix
>     return value in PCI resource setup
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad6=
27b5:
>=20
>    Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-0=
5-17
>=20
> for you to fetch changes up to 30039405ac25665119ff7bc944d33b136ef1c8a9=
:
>=20
>    MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE FRAMEBUFFERS =
(2021-05-17 14:53:17 +0200)
>=20
> ----------------------------------------------------------------
> drm-misc-next for 5.14:
>=20
> UAPI Changes:
>=20
> Cross-subsystem Changes:
>=20
> Core Changes:
>=20
>   * aperture: Fix unlocking on errors
>=20
>   * legacy: Fix some doc comments
>=20
> Driver Changes:
>=20
>   * drm/amdgpu: Free resource on fence usage query; Fix fence calculati=
on;
>=20
>   * drm/bridge: Lt9611: Add missing MODULE_DEVICE_TABLE
>=20
>   * drm/i915: Print formats with %p4cc
>=20
>   * drm/ingenic: IPU planes are now always of type OVERLAY
>=20
>   * drm/nouveau: Remove left-over reference to struct drm_device.pdev
>=20
>   * drm/panfrost: Disable devfreq if num_supplies > 1; Add Mediatek MT8=
183 +
>     DT bindings; Cleanups
>=20
>   * drm/simpledrm: Print resources with %pr; Fix use-after-free errors;=

>     Fix NULL deref; Fix MAINTAINERS entry
>=20
>   * drm/vmwgfx: Fix memory allocation and leak in FIFO allocation; Fix
>     return value in PCI resource setup
>=20
> ----------------------------------------------------------------
> Adrien Grassein (1):
>        drm/bridge: fix LONTIUM_LT8912B dependencies
>=20
> Alex Deucher (1):
>        MAINTAINERS: Fix TTM tree
>=20
> Andy Shevchenko (7):
>        drm/st7735r: Avoid spamming logs if probe is deferred
>        drm/st7586: Avoid spamming logs if probe is deferred
>        drm/mi0283qt: Avoid spamming logs if probe is deferred
>        drm/ili9486: Avoid spamming logs if probe is deferred
>        drm/ili9341: Avoid spamming logs if probe is deferred
>        drm/ili9225: Avoid spamming logs if probe is deferred
>        drm/hx8357d: Avoid spamming logs if probe is deferred
>=20
> Beatriz Martins de Carvalho (8):
>        drm: drm_atomic.c: Adjust end of block comment
>        drm: drm_auth.c: Adjust end of block comment
>        drm: drm_bufs.c: Adjust end of block comment
>        drm: drm_connector.c: Adjust end of block comment
>        drm: drm_context.c: Adjust end of block comment
>        drm: drm_atomic_uapi.c: Use tabs for code indents
>        drm: drm_blend.c: Use tabs for code indents
>        drm: drm_connector.c: Use tabs for code indents
>=20
> Bernard Zhao (2):
>        drm/gud: cleanup coding style a bit
>        drm/vmwgfx: use min_t to replace min
>=20
> Bhaskar Chowdhury (1):
>        drm/vmwgfx: Fix a typo
>=20
> Christian K=C3=B6nig (17):
>        drm/ttm: make global mutex and use count static
>        drm/ttm: fix return value check
>        drm/ttm: re-add debugfs tt_shrink file
>        drm/amdgpu: make sure we unpin the UVD BO
>        drm/amdgpu: freeing pinned objects is illegal now
>        drm/ttm: warn stricter about freeing pinned BOs
>        drm/nouveau: use bo->base.size instead of mem->num_pages
>        drm/amdgpu: check base size instead of mem.num_pages
>        drm/ttm: remove special handling for non GEM drivers
>        drm/ttm: minor range manager coding style clean ups
>        drm/ttm: move the page_alignment into the BO v2
>        drm/ttm: cleanup ttm_agp_backend
>        drm/ttm: add ttm_sys_manager v3
>        drm/ttm: always initialize the full ttm_resource v2
>        drm/ttm: properly allocate sys resource during swapout
>        drm/ttm: fix warning in new sys man
>        MAINTAINERS: Add Xinhui Pan as another AMDGPU contact
>=20
> Christophe JAILLET (1):
>        video: fbdev: imxfb: Fix an error message
>=20
> Colin Ian King (2):
>        drm: simpledrm: Fix use after free issues
>        drm/vmwgfx: Fix memory allocation check and a leak of object fif=
o
>=20
> Dan Carpenter (2):
>        drm/vc4: fix argument ordering in vc4_crtc_get_margins()
>        drm: simpledrm: fix a potential NULL dereference
>=20
> Daniel Vetter (13):
>        drm/tegra: Don't set allow_fb_modifiers explicitly
>        drm/vc4: Don't set allow_fb_modifiers explicitly
>        drm/imx: Don't set allow_fb_modifiers explicitly
>        drm/exynos: Don't set allow_fb_modifiers explicitly
>        drm/todo: Add link to old debugfs RFC
>        drm/arm: Don't set allow_fb_modifiers explicitly
>        drm/arm/malidp: Always list modifiers
>        drm/stm: Don't set allow_fb_modifiers explicitly
>        drm/i915: Don't set allow_fb_modifiers explicitly
>        drm/msm/dpu1: Don't set allow_fb_modifiers explicitly
>        drm/msm/mdp4: Fix modifier support enabling
>        drm/nouveau: Don't set allow_fb_modifiers explicitly
>        drm/modifiers: Enforce consistency between the cap an IN_FORMATS=

>=20
> Dave Stevenson (1):
>        drm/vc4: Add HDR metadata property to the VC5 HDMI connectors
>=20
> David M Nieto (2):
>        drm/amdgpu: free resources on fence usage query
>        drm/amdgpu: fix fence calculation (v2)
>=20
> Deepak R Varma (1):
>        drm/vmwgfx: replace idr_init() by idr_init_base()
>=20
> Douglas Anderson (24):
>        drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enabl=
e()
>        drm/bridge: ti-sn65dsi86: Simplify refclk handling
>        drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc co=
mment
>        drm/bridge: ti-sn65dsi86: Reorder remove()
>        drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_dis=
able()
>        drm/bridge: ti-sn65dsi86: Get rid of the useless detect() functi=
on
>        drm/panel: panel-simple: Use runtime pm to avoid excessive unpre=
pare / prepare
>        drm/panel: panel-simple: Add missing pm_runtime_disable() calls
>        drm/bridge: ti-sn65dsi86: Rename the main driver data structure
>        drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
>        drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
>        drm/bridge: ti-sn65dsi86: Clean debugfs code
>        drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify pr=
obe
>        drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
>        drm/bridge: ti-sn65dsi86: Move all the chip-related init to the =
start
>        drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into=20
sub-drivers
>        drm/panel: panel-simple: Get rid of hacky HPD chicken-and-egg co=
de
>        drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
>        drm/bridge: ti-sn65dsi86: Code motion of refclk management funct=
ions
>        drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out pre=
-enable
>        drm/panel: panel-simple: Remove extra call: drm_connector_update=
_edid_property()
>        drm/panel: panel-simple: Power the panel when reading the EDID
>        drm/panel: panel-simple: Cache the EDID as long as we retain pow=
er
>        drm/bridge: ti-sn65dsi86: Remove __exit from GPIO sub-driver rem=
ove helper
>=20
> Fabio M. De Francesco (5):
>        gpu: drm: Replace bare "unsigned" with "unsigned int"
>        drm: drm_atomic_helper.c: Replace "unsigned" with "unsigned int"=

>        drm: drm_atomic_helper.c: Correct comments format
>        drm/drm_bufs.c: In switch, add break in default case
>        drm/drm_file.c: Define drm_send_event_helper() as 'static'
>=20
> Felix Kuehling (1):
>        drm/ttm: Don't count pages in SG BOs against pages_limit
>=20
> Gerd Hoffmann (2):
>        drm/qxl: drop redundant code
>        drm/qxl: balance dumb_shadow_bo pin
>=20
> Hsin-Yi Wang (1):
>        drm/bridge: anx7625: Fix power on delay
>=20
> Jernej Skrabec (1):
>        drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading =
CEC driver
>=20
> Joseph Kogut (2):
>        drm: remove usage of drm_pci_alloc/free
>        drm: remove legacy drm_pci_alloc/free abstraction
>=20
> Kai-Heng Feng (1):
>        efifb: Check efifb_pci_dev before using it
>=20
> Krzysztof Kozlowski (2):
>        drm/gma500: correct kerneldoc
>        drm/gma500: remove trailing whitespaces
>=20
> KuoHsiang Chou (1):
>        drm/ast: Fixed CVE for DP501
>=20
> Lee Jones (3):
>        drm/ttm/ttm_bo: Fix incorrectly documented function 'ttm_bo_clea=
nup_refs'
>        drm/scheduler/sched_entity: Fix some function name disparity
>        drm/ttm/ttm_device: Demote kernel-doc abuses
>=20
> Linus Walleij (1):
>        drm/panel: Add DT bindings for Samsung LMS397KF04
>=20
> Liu Ying (3):
>        drm/bridge: nwl-dsi: Force a full modeset when crtc_state->activ=
e is changed to be true
>        drm/bridge: nwl-dsi: Remove a check on unchanged HS clock rate f=
rom ->mode_set()
>        drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY ready in ->=
mode_set()
>=20
> Lukas Bulwahn (1):
>        MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE FRAMEBUFF=
ERS
>=20
> Lyude Paul (20):
>        drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace=

>        drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late re=
gister/early unregister
>        drm/dp: Add backpointer to drm_device in drm_dp_aux
>        drm/dp: Clarify DP AUX registration time
>        drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_dela=
y()
>        drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()=

>        drm/dp: Always print aux channel name in logs
>        drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
>        drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_set_tmds_o=
utput()
>        drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_c=
lock()
>        drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_get_tmds_o=
utput()
>        drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()=

>        drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payloa=
d_bw()
>        drm/print: Handle potentially NULL drm_devices in drm_dbg_*
>        drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
>        drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using drm=
_err/drm_dbg_kms()
>        drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*(=
)
>        drm/dp: Handle zeroed port counts in drm_dp_read_downstream_info=
()
>        drm/dp: Drop open-coded drm_dp_is_branch() in drm_dp_read_downst=
ream_info()
>        drm/dp: Fix bogus DPCD version check in drm_dp_read_downstream_i=
nfo()
>=20
> Maxime Ripard (5):
>        Merge drm/drm-next into drm-misc-next
>        drm/connector: Create a helper to attach the hdr_output_metadata=20
property
>        drm/connector: Add helper to compare HDR metadata
>        drm/connector: Add a helper to attach the colorspace property
>        drm/vc4: hdmi: Signal the proper colorimetry info in the infofra=
me
>=20
> Melissa Wen (4):
>        drm/vkms: init plane using drmm_universal_plane_alloc
>        drm/vkms: rename cursor to plane on ops of planes composition
>        drm/vkms: add XRGB planes composition
>        drm/vkms: add overlay support
>=20
> Neil Armstrong (1):
>        drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
>=20
> Nicolas Boichat (3):
>        dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>        drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>        drm/panfrost: Add mt8183-mali compatible string
>=20
> Nikola Cornij (2):
>        drm/dp_mst: Use Extended Base Receiver Capability DPCD space
>        drm/i915: Use the correct max source link rate for MST
>=20
> Parshuram Thombare (2):
>        dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDC=
P
>        drm: bridge: cdns-mhdp8546: Enable HDCP
>=20
> Paul Cercueil (1):
>        drm/ingenic: Switch IPU plane to type OVERLAY
>=20
> Phong LE (3):
>        dt-bindings: display: bridge: add it66121 bindings
>        drm: bridge: add it66121 driver
>        MAINTAINERS: add it66121 HDMI bridge driver entry
>=20
> Qiheng Lin (1):
>        drm/vmwgfx: Fix return value check in vmw_setup_pci_resources()
>=20
> Randy Dunlap (2):
>        drm: bridge: add missing word in Analogix help text
>        drm: simpledrm: print resource info using '%pr'
>=20
> Robert Foss (1):
>        drm/bridge/sii8620: fix dependency on extcon
>=20
> Roy Sun (2):
>        drm/scheduler: Change scheduled fence track v2
>        drm/amdgpu: Add show_fdinfo() interface
>=20
> Shiwu Zhang (1):
>        drm/ttm: fix error handling if no BO can be swapped out v4
>=20
> Sia Jee Heng (1):
>        drm: bridge: adv7511: Support I2S IEC958 encoded PCM format
>=20
> Simon Ser (1):
>        drm/connector: demote connector force-probes for non-master clie=
nts
>=20
> Stephen Rothwell (1):
>        drm/i915: Merge fix for "drm: Switch to %p4cc format modifier"
>=20
> Takashi Iwai (2):
>        drm/ast: Fix missing conversions to managed API
>        drm/bochs: Add screen blanking support
>=20
> Thomas Hellstrom (2):
>        drm/vmwgfx: Mark a surface gpu-dirty after the SVGA3dCmdDXGenMip=
s command
>        drm/vmwgfx: Fix cpu updates of coherent multisample surfaces
>=20
> Thomas Zimmermann (35):
>        drm/gem-ttm-helper: Provide helper for struct drm_driver.dumb_ma=
p_offset
>        drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
>        drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
>        drm/qxl: Use drm_gem_ttm_dumb_map_offset()
>        drm/aperture: Add infrastructure for aperture ownership
>        drm/aperture: Convert drivers to aperture interfaces
>        drm/aperture: Inline fbdev conflict helpers into aperture helper=
s
>        drm/vmwgfx: Make console emulation depend on DRM_FBDEV_EMULATION=

>        drm/mxsfb: Don't select DRM_KMS_FB_HELPER
>        drm/zte: Don't select DRM_KMS_FB_HELPER
>        drm: Remove DRM_KMS_FB_HELPER Kconfig option
>        drm/ast: Remove reference to struct drm_device.pdev
>        drm/i915/gt: Remove reference to struct drm_device.pdev
>        drm/i915: Remove reference to struct drm_device.pdev
>        drm/i915: Don't assign to struct drm_device.pdev
>        drm: Move struct drm_device.pdev to legacy section
>        drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstcl=
ip()
>        drm/format-helper: Add blitter functions
>        drm/aperture: Add infrastructure for aperture ownership
>        drm: Add simpledrm driver
>        drm/simpledrm: Acquire memory aperture for framebuffer
>        drm/i810: Remove references to struct drm_device.pdev
>        drm/mga: Remove references to struct drm_device.pdev
>        drm/r128: Remove references to struct drm_device.pdev
>        drm/savage: Remove references to struct drm_device.pdev
>        drm/sis: Remove references to struct drm_device.pdev
>        drm/via: Remove references to drm_device.pdev
>        drm: Remove pdev field from struct drm_device
>        drm/radeon: Move AGP helpers into radeon driver
>        drm/radeon: Move AGP data structures into radeon
>        drm: Mark PCI AGP helpers as legacy
>        drm: Mark AGP implementation and ioctls as legacy
>        drm: Include <asm/agp.h> iff CONFIG_AGP is set
>        Merge drm/drm-next into drm-misc-next
>        drm/nouveau: Remove invalid reference to struct drm_device.pdev
>=20
> Ville Syrj=C3=A4l=C3=A4 (1):
>        drm: Use drm_mode_is_420_only() instead of open coding it
>=20
> Vivek Kasireddy (1):
>        drm/virtio: Create Dumb BOs as guest Blobs (v3)
>=20
> Wan Jiabing (1):
>        drm/gma500: update comment of psb_spank()
>=20
> Yang Yingliang (1):
>        drm: correct function name drm_legacy_ctxbitmap_flush()
>=20
> Zack Rusin (4):
>        drm/vmwgfx: Fix incorrect enum usage
>        drm/vmwgfx: Remove the reservation semaphore
>        drm/vmwgfx: Add basic support for SVGA3
>        drm/vmwgfx: Port vmwgfx to arm64
>=20
> Zhen Lei (2):
>        drm/vc4: Remove redundant error printing in vc4_ioremap_regs()
>        drm/panfrost: Remove redundant error printing in panfrost_device=
_init()
>=20
> Zheng Yongjun (1):
>        gpu: drm: vmwgfx: convert comma to semicolon
>=20
> Zou Wei (3):
>        drm/vmwgfx/vmwgfx_validation: Use flexible-array member instead =
of zero-length array
>        drm/aperture: Fix missing unlock on error in devm_aperture_acqui=
re()
>        drm/bridge: lt9611: Add missing MODULE_DEVICE_TABLE
>=20
> kernel test robot (1):
>        drm: fix semicolon.cocci warnings
>=20
>   .../bindings/display/bridge/cdns,mhdp8546.yaml     |   15 +-
>   .../bindings/display/bridge/ite,it66121.yaml       |  124 +++
>   .../bindings/display/panel/samsung,lms397kf04.yaml |   74 ++
>   .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   30 +-
>   Documentation/gpu/drm-internals.rst                |   12 +
>   Documentation/gpu/todo.rst                         |    2 +
>   MAINTAINERS                                        |   18 +-
>   drivers/gpu/drm/Kconfig                            |   28 +-
>   drivers/gpu/drm/Makefile                           |    8 +-
>   drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   78 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |  104 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |   43 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   63 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   45 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    5 +-
>   drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |    6 +-
>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   27 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    6 +
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   18 +
>   drivers/gpu/drm/amd/display/dc/dc_link.h           |    2 +
>   drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    1 -
>   drivers/gpu/drm/arm/malidp_drv.c                   |    1 -
>   drivers/gpu/drm/arm/malidp_planes.c                |    9 +-
>   drivers/gpu/drm/armada/armada_drv.c                |    5 +-
>   drivers/gpu/drm/ast/ast_dp501.c                    |  139 ++-
>   drivers/gpu/drm/ast/ast_drv.c                      |   23 +-
>   drivers/gpu/drm/ast/ast_drv.h                      |   12 +
>   drivers/gpu/drm/ast/ast_main.c                     |   14 +-
>   drivers/gpu/drm/bochs/bochs.h                      |    1 +
>   drivers/gpu/drm/bochs/bochs_drv.c                  |    3 +-
>   drivers/gpu/drm/bochs/bochs_hw.c                   |   25 +-
>   drivers/gpu/drm/bochs/bochs_kms.c                  |    8 +
>   drivers/gpu/drm/bridge/Kconfig                     |   12 +-
>   drivers/gpu/drm/bridge/Makefile                    |    1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511.h           |    1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |    6 +
>   drivers/gpu/drm/bridge/analogix/Kconfig            |    2 +-
>   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    1 +
>   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    1 +
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    1 +
>   drivers/gpu/drm/bridge/analogix/anx7625.c          |    2 +-
>   drivers/gpu/drm/bridge/cadence/Makefile            |    2 +-
>   .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  140 ++-
>   .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |   22 +
>   .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |  570 +++++++++++=

>   .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |   92 ++
>   drivers/gpu/drm/bridge/ite-it66121.c               | 1021 +++++++++++=
+++++++++
>   drivers/gpu/drm/bridge/lontium-lt9611.c            |    1 +
>   drivers/gpu/drm/bridge/nwl-dsi.c                   |   86 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   22 +-
>   drivers/gpu/drm/bridge/tc358767.c                  |    1 +
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  719 +++++++++--=
---
>   drivers/gpu/drm/drm_agpsupport.c                   |  101 +-
>   drivers/gpu/drm/drm_aperture.c                     |  348 +++++++
>   drivers/gpu/drm/drm_atomic.c                       |    7 +-
>   drivers/gpu/drm/drm_atomic_helper.c                |   40 +-
>   drivers/gpu/drm/drm_atomic_uapi.c                  |    6 +-
>   drivers/gpu/drm/drm_auth.c                         |    3 +-
>   drivers/gpu/drm/drm_blend.c                        |    4 +-
>   drivers/gpu/drm/drm_bridge.c                       |    3 +
>   drivers/gpu/drm/drm_bufs.c                         |   25 +-
>   drivers/gpu/drm/drm_connector.c                    |  127 ++-
>   drivers/gpu/drm/drm_context.c                      |    5 +-
>   drivers/gpu/drm/drm_dma.c                          |    8 +-
>   drivers/gpu/drm/drm_dp_aux_dev.c                   |    6 +
>   drivers/gpu/drm/drm_dp_dual_mode_helper.c          |   68 +-
>   drivers/gpu/drm/drm_dp_helper.c                    |  195 ++--
>   drivers/gpu/drm/drm_dp_mst_topology.c              |  405 ++++----
>   drivers/gpu/drm/drm_drv.c                          |    4 +-
>   drivers/gpu/drm/drm_file.c                         |   14 +-
>   drivers/gpu/drm/drm_format_helper.c                |   96 +-
>   drivers/gpu/drm/drm_gem_ttm_helper.c               |   33 +
>   drivers/gpu/drm/drm_gem_vram_helper.c              |   48 -
>   drivers/gpu/drm/drm_internal.h                     |    5 -
>   drivers/gpu/drm/drm_ioc32.c                        |   19 +-
>   drivers/gpu/drm/drm_ioctl.c                        |   24 +-
>   drivers/gpu/drm/drm_legacy.h                       |   30 +
>   drivers/gpu/drm/drm_legacy_misc.c                  |    1 -
>   drivers/gpu/drm/drm_memory.c                       |    1 -
>   drivers/gpu/drm/drm_modes.c                        |   13 +-
>   drivers/gpu/drm/drm_pci.c                          |   82 +-
>   drivers/gpu/drm/drm_plane.c                        |   18 +-
>   drivers/gpu/drm/drm_vm.c                           |    2 -
>   drivers/gpu/drm/exynos/exynos_drm_fb.c             |    2 -
>   drivers/gpu/drm/gma500/backlight.c                 |    4 +-
>   drivers/gpu/drm/gma500/cdv_intel_dp.c              |   50 +-
>   drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    2 +-
>   drivers/gpu/drm/gma500/intel_gmbus.c               |    2 +-
>   drivers/gpu/drm/gma500/psb_drv.h                   |    2 +-
>   drivers/gpu/drm/gud/gud_internal.h                 |    4 +-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    6 +-
>   drivers/gpu/drm/i810/i810_dma.c                    |   11 +-
>   drivers/gpu/drm/i915/display/intel_atomic.c        |   13 +-
>   drivers/gpu/drm/i915/display/intel_connector.c     |    6 +-
>   drivers/gpu/drm/i915/display/intel_display.c       |    2 -
>   drivers/gpu/drm/i915/display/intel_dp_aux.c        |    1 +
>   .../gpu/drm/i915/display/intel_dp_link_training.c  |    6 +-
>   drivers/gpu/drm/i915/display/intel_dp_mst.c        |   10 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c          |   10 +-
>   drivers/gpu/drm/i915/display/intel_lspcon.c        |   17 +-
>   drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +-
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    2 +-
>   drivers/gpu/drm/i915/i915_drv.c                    |    4 +-
>   drivers/gpu/drm/i915/intel_runtime_pm.h            |    2 +-
>   drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    1 -
>   drivers/gpu/drm/imx/dcss/dcss-kms.c                |    1 -
>   drivers/gpu/drm/imx/imx-drm-core.c                 |    1 -
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   11 +-
>   drivers/gpu/drm/ingenic/ingenic-ipu.c              |    2 +-
>   drivers/gpu/drm/kmb/kmb_dsi.c                      |   10 +-
>   drivers/gpu/drm/meson/meson_drv.c                  |   27 +-
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              |    1 +
>   drivers/gpu/drm/mga/mga_dma.c                      |   29 +-
>   drivers/gpu/drm/mga/mga_drv.h                      |    1 -
>   drivers/gpu/drm/mga/mga_state.c                    |    3 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.c              |    5 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c             |    2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    5 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    2 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |    8 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    6 +-
>   drivers/gpu/drm/msm/edp/edp.h                      |    3 +-
>   drivers/gpu/drm/msm/edp/edp_aux.c                  |    5 +-
>   drivers/gpu/drm/msm/edp/edp_ctrl.c                 |    8 +-
>   drivers/gpu/drm/msm/msm_fbdev.c                    |    5 +-
>   drivers/gpu/drm/mxsfb/Kconfig                      |    1 -
>   drivers/gpu/drm/nouveau/dispnv50/disp.c            |    3 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c               |    9 +-
>   drivers/gpu/drm/nouveau/nouveau_connector.c        |   29 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c          |   19 -
>   drivers/gpu/drm/nouveau/nouveau_display.h          |    2 -
>   drivers/gpu/drm/nouveau/nouveau_drm.c              |    6 +-
>   drivers/gpu/drm/nouveau/nouveau_fbcon.c            |    4 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c              |    4 +-
>   drivers/gpu/drm/panel/Kconfig                      |    1 +
>   drivers/gpu/drm/panel/panel-simple.c               |  140 ++-
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    9 +
>   drivers/gpu/drm/panfrost/panfrost_device.c         |    1 -
>   drivers/gpu/drm/panfrost/panfrost_drv.c            |   10 +
>   drivers/gpu/drm/qxl/qxl_display.c                  |    5 +-
>   drivers/gpu/drm/qxl/qxl_drv.c                      |    8 +-
>   drivers/gpu/drm/qxl/qxl_drv.h                      |    3 -
>   drivers/gpu/drm/qxl/qxl_dumb.c                     |   17 -
>   drivers/gpu/drm/qxl/qxl_ioctl.c                    |    4 +-
>   drivers/gpu/drm/qxl/qxl_object.h                   |    5 -
>   drivers/gpu/drm/r128/ati_pcigart.c                 |   33 +-
>   drivers/gpu/drm/r128/r128_cce.c                    |    2 +-
>   drivers/gpu/drm/r128/r128_drv.c                    |    4 +-
>   drivers/gpu/drm/r128/r128_state.c                  |    3 +-
>   drivers/gpu/drm/radeon/atombios_dp.c               |    5 +-
>   drivers/gpu/drm/radeon/radeon.h                    |   42 +
>   drivers/gpu/drm/radeon/radeon_agp.c                |  118 ++-
>   drivers/gpu/drm/radeon/radeon_dp_mst.c             |    7 +
>   drivers/gpu/drm/radeon/radeon_drv.c                |   16 +-
>   drivers/gpu/drm/radeon/radeon_kms.c                |   18 +-
>   drivers/gpu/drm/radeon/radeon_object.h             |    2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c                |    6 +-
>   drivers/gpu/drm/savage/savage_bci.c                |   26 +-
>   drivers/gpu/drm/scheduler/sched_entity.c           |    6 +-
>   drivers/gpu/drm/scheduler/sched_main.c             |    9 +-
>   drivers/gpu/drm/sis/sis_drv.c                      |    3 +-
>   drivers/gpu/drm/stm/ltdc.c                         |    2 -
>   drivers/gpu/drm/sun4i/sun4i_drv.c                  |    5 +-
>   drivers/gpu/drm/tegra/dc.c                         |   10 +-
>   drivers/gpu/drm/tegra/dpaux.c                      |    1 +
>   drivers/gpu/drm/tegra/drm.c                        |    6 +-
>   drivers/gpu/drm/tiny/Kconfig                       |   16 +
>   drivers/gpu/drm/tiny/Makefile                      |    1 +
>   drivers/gpu/drm/tiny/cirrus.c                      |    5 +-
>   drivers/gpu/drm/tiny/hx8357d.c                     |    6 +-
>   drivers/gpu/drm/tiny/ili9225.c                     |   12 +-
>   drivers/gpu/drm/tiny/ili9341.c                     |   12 +-
>   drivers/gpu/drm/tiny/ili9486.c                     |   12 +-
>   drivers/gpu/drm/tiny/mi0283qt.c                    |   12 +-
>   drivers/gpu/drm/tiny/simpledrm.c                   |  903 +++++++++++=
++++++
>   drivers/gpu/drm/tiny/st7586.c                      |   12 +-
>   drivers/gpu/drm/tiny/st7735r.c                     |   12 +-
>   drivers/gpu/drm/ttm/Makefile                       |    2 +-
>   drivers/gpu/drm/ttm/ttm_agp_backend.c              |    8 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                       |   58 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c                  |    4 +-
>   drivers/gpu/drm/ttm/ttm_device.c                   |   25 +-
>   drivers/gpu/drm/ttm/ttm_module.h                   |    3 +
>   drivers/gpu/drm/ttm/ttm_range_manager.c            |   40 +-
>   drivers/gpu/drm/ttm/ttm_resource.c                 |   20 +-
>   drivers/gpu/drm/ttm/ttm_sys_manager.c              |   41 +
>   drivers/gpu/drm/ttm/ttm_tt.c                       |   20 +
>   drivers/gpu/drm/vboxvideo/vbox_drv.c               |    3 +-
>   drivers/gpu/drm/vc4/vc4_drv.c                      |    9 +-
>   drivers/gpu/drm/vc4/vc4_drv.h                      |    2 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                     |   61 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.h                     |    3 +
>   drivers/gpu/drm/vc4/vc4_kms.c                      |    1 -
>   drivers/gpu/drm/via/via_dma.c                      |    1 -
>   drivers/gpu/drm/via/via_dmablit.c                  |   15 +-
>   drivers/gpu/drm/via/via_map.c                      |    3 +-
>   drivers/gpu/drm/virtio/virtgpu_drv.c               |   10 +-
>   drivers/gpu/drm/virtio/virtgpu_gem.c               |    8 +
>   drivers/gpu/drm/virtio/virtgpu_object.c            |    3 +
>   drivers/gpu/drm/vkms/vkms_composer.c               |  104 +-
>   drivers/gpu/drm/vkms/vkms_drv.c                    |    5 +
>   drivers/gpu/drm/vkms/vkms_drv.h                    |    9 +-
>   drivers/gpu/drm/vkms/vkms_output.c                 |   28 +-
>   drivers/gpu/drm/vkms/vkms_plane.c                  |   51 +-
>   drivers/gpu/drm/vmwgfx/Kconfig                     |   10 +-
>   drivers/gpu/drm/vmwgfx/Makefile                    |    6 +-
>   .../drm/vmwgfx/device_include/svga3d_surfacedefs.h |    8 +-
>   drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   |   55 +-
>   drivers/gpu/drm/vmwgfx/ttm_lock.c                  |  194 ----
>   drivers/gpu/drm/vmwgfx/ttm_lock.h                  |  218 -----
>   drivers/gpu/drm/vmwgfx/ttm_object.c                |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |    8 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   43 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |  124 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |   13 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  169 +++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  147 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   41 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |    8 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   18 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |    2 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c                |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |   60 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |   77 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   36 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   36 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |   31 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.h                |  214 ----
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h          |  130 +++
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h            |  219 +++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_reg.h                |    4 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    8 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    6 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |    5 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |    4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    6 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   40 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |   15 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    9 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    4 +-
>   drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    5 +-
>   drivers/gpu/drm/zte/Kconfig                        |    1 -
>   drivers/video/fbdev/Kconfig                        |    2 +-
>   drivers/video/fbdev/imxfb.c                        |    2 +-
>   include/drm/bridge/dw_hdmi.h                       |    2 +
>   include/drm/drm_agpsupport.h                       |  117 ---
>   include/drm/drm_aperture.h                         |   35 +
>   include/drm/drm_connector.h                        |    4 +
>   include/drm/drm_device.h                           |    9 +-
>   include/drm/drm_dp_dual_mode_helper.h              |   14 +-
>   include/drm/drm_dp_helper.h                        |   19 +-
>   include/drm/drm_dp_mst_helper.h                    |   15 +-
>   include/drm/drm_fb_helper.h                        |   51 -
>   include/drm/drm_format_helper.h                    |   10 +-
>   include/drm/drm_gem_ttm_helper.h                   |    5 +-
>   include/drm/drm_gem_vram_helper.h                  |    7 +-
>   include/drm/drm_legacy.h                           |   86 +-
>   include/drm/drm_mode_config.h                      |    2 +
>   include/drm/drm_print.h                            |   20 +-
>   include/drm/ttm/ttm_bo_api.h                       |   21 +-
>   include/drm/ttm/ttm_resource.h                     |    2 -
>   include/uapi/drm/drm_mode.h                        |    7 +-
>   277 files changed, 7261 insertions(+), 3022 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/i=
te,it66121.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/panel/sa=
msung,lms397kf04.yaml
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.=
c
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.=
h
>   create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c
>   create mode 100644 drivers/gpu/drm/drm_aperture.c
>   create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
>   create mode 100644 drivers/gpu/drm/ttm/ttm_sys_manager.c
>   delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.c
>   delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.h
>   delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
>   create mode 100755 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
>   create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
>   delete mode 100644 include/drm/drm_agpsupport.h
>   create mode 100644 include/drm/drm_aperture.h
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oeNDQ6kYmNjzivpZ1CrF3sf4MWFlIZl3b--

--7z5OsqB9CELSL0iyGXM9Wa7uxqAsRFpvf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCibqwFAwAAAAAACgkQlh/E3EQov+Ah
Og/9F1XXAx6SLqNgyLvWtjCttCN0KsGUeVSn2zMehLJsktOoWJQe+DODX5F22sAu5OBqvMIupYvp
UsdE5uCSWrQMuCLWPoW3cGM9GgvpfBaosIxvy1dXbaxYtG2pKkNwWzbOx4ypkk2xMabXuWPPSOjS
C6O2MV20w/vtAwjL+rHP+2Qs7UNjp2ziN6DYYgtM0VvER9dQlat6QSMDrmeAshxzONXzaMGLA9IC
xjBM9izsrdRQZfeQQehsEPb3NSyjpuCt0hnBlT7dvzQr4LR0Igbz27GyEl958ewPZb+i8TBXAaqi
DU+AtXyOR2fRsOWsB8QYE635Ca32eb/QRpUDWFP6z2gMXFNGsteq4N4NXkyZEuBwm6zJsFKqumbi
cDqK/mlwcUu07iEmE2irF4BqegmyITUSoWWWBO2C++1FfYMW0VQf64lCULEtGKNfdOnT+GBeFSu4
ra0UlnPswpyzlABENB2MrXjVzj9K3dqjtw92rcQPH0bQfy3eaKAVOb7M1dBpr2GDrytDziFZg7QJ
IrT4kRWDMqFgMQJAWMNzBck4k/m62A3q27CYhTeb+z5jtqSoE/XJw4ZwlKdVlq3hbZFxkeItN7YO
nwBQYI7WPxiJBzEDBSOZy3cordiD/0wsLl7rljTPvwSXiFKCFMrbUCcYNQA1l+X8T1XP/hBxbtjL
qpM=
=in52
-----END PGP SIGNATURE-----

--7z5OsqB9CELSL0iyGXM9Wa7uxqAsRFpvf--
