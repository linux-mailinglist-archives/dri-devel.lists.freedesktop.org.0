Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAB1B2694
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4566E93B;
	Tue, 21 Apr 2020 12:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5606E92D;
 Tue, 21 Apr 2020 12:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 519D2ABC7;
 Tue, 21 Apr 2020 12:46:07 +0000 (UTC)
Subject: Re: [PULL] drm-misc-next
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200414090738.GA16827@linux-uq9g>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <2f5f6131-0a57-a81d-5cdf-8f3144f2679f@suse.de>
Date: Tue, 21 Apr 2020 14:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414090738.GA16827@linux-uq9g>
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
Content-Type: multipart/mixed; boundary="===============1995797662=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1995797662==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xKCwGVLofPoiyg5tFIT7z5xtFRLVkGerr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xKCwGVLofPoiyg5tFIT7z5xtFRLVkGerr
Content-Type: multipart/mixed; boundary="InzlCtjc4pHITdIJAf1Mq10bKiCnJOS7J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Message-ID: <2f5f6131-0a57-a81d-5cdf-8f3144f2679f@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <20200414090738.GA16827@linux-uq9g>
In-Reply-To: <20200414090738.GA16827@linux-uq9g>

--InzlCtjc4pHITdIJAf1Mq10bKiCnJOS7J
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

just a friendly reminder to merge these changes. They don't seem to be
in the upstream tree yet.

Best regards
Thomas

Am 14.04.20 um 11:07 schrieb Thomas Zimmermann:
> Hi Dave, Daniel,
>=20
> with 5.7-rc1 being tagged, here's the first PR for drm-next-misc for wh=
at will become Linux 5.8.
>=20
> Best regards
> Thomas
>=20
>=20
> drm-misc-next-2020-04-14:
> drm-misc-next for 5.8:
>=20
> UAPI Changes:
>=20
>   - drm: error out with EBUSY when device has existing master
>   - drm: rework SET_MASTER and DROP_MASTER perm handling
>=20
> Cross-subsystem Changes:
>=20
>   - fbdev: savage: fix -Wextra build warning
>   - video: omap2: Use scnprintf() for avoiding potential buffer overflo=
w
>=20
> Core Changes:
>=20
>   - Remove drm_pci.h
>   - drm_pci_{alloc/free)() are now legacy
>   - Introduce managed DRM resourcesA
>   - Allow drivers to subclass struct drm_framebuffer
>   - Introduce struct drm_afbc_framebuffer and helpers
>   - fbdev: remove return value from generic fbdev setup
>   - Introduce simple-encoder helper
>   - vram-helpers: set fence on plane
>   - dp_mst: ACT timeout improvements
>   - dp_mst: Remove drm_dp_mst_has_audio()
>   - TTM: ttm_trace_dma_{map/unmap}() cleanups
>   - dma-buf: add flag for PCIP2P support
>   - EDID: Various improvements
>   - Encoder: cleanup semantics of possible_clones and possible_crtcs
>   - VBLANK documentation updates
>   - Writeback documentation updates
>=20
> Driver Changes:
>=20
>   - Convert several drivers to i2c_new_client_device()
>   - Drop explicit drm_mode_config_cleanup() calls from drivers
>   - Auto-release device structures with drmm_add_final_kfree()
>   - Init bfdev console after registering DRM device
>   - Make various .debugfs functions return 0 unconditionally; ignore er=
rors
>   - video: Use scnprintf() to avoid buffer overflows
>   - Convert drivers to simple encoders
>=20
>   - drm/amdgpu: note that we can handle peer2peer DMA-buf
>   - drm/amdgpu: add support for exporting VRAM using DMA-buf v3
>   - drm/kirin: Revert change to register connectors
>   - drm/lima: Add optional devfreq and cooling device support
>   - drm/lima: Various improvements wrt. task handling
>   - drm/panel: nt39016: Support multiple modes and 50Hz
>   - drm/panel: Support Leadtek LTK050H3146W
>   - drm/rockchip: Add support for afbc
>   - drm/virtio: Various cleanups
>   - drm/hisilicon/hibmc: Enforce 128-byte stride alignment
>   - drm/qxl: Fix notify port address of cursor ring buffer
>   - drm/sun4i: Improvements to format handling
>   - drm/bridge: dw-hdmi: Various improvements
>=20
> The following changes since commit c2556238120bce8be37670e145226c12870a=
9e5a:
>=20
>   Merge branch 'feature/staging_sm5' of git://people.freedesktop.org/~s=
roland/linux into drm-next (2020-03-25 15:45:45 +1000)
>=20
> are available in the Git repository at:
>=20
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-04=
-14
>=20
> for you to fetch changes up to 14d0066b8477775971db7d0ef03c86fefe4d5bf2=
:
>=20
>   drm: kirin: Revert change to add register connect helper functions (2=
020-04-13 01:46:02 +0000)
>=20
> ----------------------------------------------------------------
> drm-misc-next for 5.8:
>=20
> UAPI Changes:
>=20
>   - drm: error out with EBUSY when device has existing master
>   - drm: rework SET_MASTER and DROP_MASTER perm handling
>=20
> Cross-subsystem Changes:
>=20
>   - fbdev: savage: fix -Wextra build warning
>   - video: omap2: Use scnprintf() for avoiding potential buffer overflo=
w
>=20
> Core Changes:
>=20
>   - Remove drm_pci.h
>   - drm_pci_{alloc/free)() are now legacy
>   - Introduce managed DRM resourcesA
>   - Allow drivers to subclass struct drm_framebuffer
>   - Introduce struct drm_afbc_framebuffer and helpers
>   - fbdev: remove return value from generic fbdev setup
>   - Introduce simple-encoder helper
>   - vram-helpers: set fence on plane
>   - dp_mst: ACT timeout improvements
>   - dp_mst: Remove drm_dp_mst_has_audio()
>   - TTM: ttm_trace_dma_{map/unmap}() cleanups
>   - dma-buf: add flag for PCIP2P support
>   - EDID: Various improvements
>   - Encoder: cleanup semantics of possible_clones and possible_crtcs
>   - VBLANK documentation updates
>   - Writeback documentation updates
>=20
> Driver Changes:
>=20
>   - Convert several drivers to i2c_new_client_device()
>   - Drop explicit drm_mode_config_cleanup() calls from drivers
>   - Auto-release device structures with drmm_add_final_kfree()
>   - Init bfdev console after registering DRM device
>   - Make various .debugfs functions return 0 unconditionally; ignore er=
rors
>   - video: Use scnprintf() to avoid buffer overflows
>   - Convert drivers to simple encoders
>=20
>   - drm/amdgpu: note that we can handle peer2peer DMA-buf
>   - drm/amdgpu: add support for exporting VRAM using DMA-buf v3
>   - drm/kirin: Revert change to register connectors
>   - drm/lima: Add optional devfreq and cooling device support
>   - drm/lima: Various improvements wrt. task handling
>   - drm/panel: nt39016: Support multiple modes and 50Hz
>   - drm/panel: Support Leadtek LTK050H3146W
>   - drm/rockchip: Add support for afbc
>   - drm/virtio: Various cleanups
>   - drm/hisilicon/hibmc: Enforce 128-byte stride alignment
>   - drm/qxl: Fix notify port address of cursor ring buffer
>   - drm/sun4i: Improvements to format handling
>   - drm/bridge: dw-hdmi: Various improvements
>=20
> ----------------------------------------------------------------
> Andrzej Pietrasiewicz (5):
>       drm/core: Allow drivers allocate a subclass of struct drm_framebu=
ffer
>       drm/core: Add drm_afbc_framebuffer and a corresponding helper
>       drm/rockchip: Add support for afbc
>       drm/core: Use proper debugging macro
>       drm/core: Calculate bpp in afbc helper
>=20
> Arnd Bergmann (1):
>       fbdev: mx3fb: avoid warning about psABI change
>=20
> Chris Wilson (4):
>       drm: Don't return 0 from a void drm_fbdev_generic_setup
>       dma-buf: Prettify typecasts for dma-fence-chain
>       dma-buf: Report signaled links inside dma-fence-chain
>       dma-buf: Exercise dma-fence-chain under selftests
>=20
> Christian K=C3=B6nig (7):
>       drm/mm: revert "Break long searches in fragmented address spaces"=

>       dma-buf: add peer2peer flag
>       drm/ttm: lock resv object during destruction
>       drm/amdgpu: note that we can handle peer2peer DMA-buf
>       drm/amdgpu: add checks if DMA-buf P2P is supported
>       drm/amdgpu: add support for exporting VRAM using DMA-buf v3
>       drm/amdgpu: improve amdgpu_gem_info debugfs file
>=20
> Daniel Vetter (56):
>       drm/hisilicon: Drop unused #include
>       MAINTAINERS: Better regex for dma_buf|fence|resv
>       mm/sl[uo]b: export __kmalloc_track(_node)_caller
>       drm/i915: Don't clear drvdata in ->release
>       drm: add managed resources tied to drm_device
>       drm: Set final_kfree in drm_dev_alloc
>       drm/mipi_dbi: Use drmm_add_final_kfree in all drivers
>       drm/udl: Use drmm_add_final_kfree
>       drm/qxl: Use drmm_add_final_kfree
>       drm/i915: Use drmm_add_final_kfree
>       drm/cirrus: Use drmm_add_final_kfree
>       drm/v3d: Use drmm_add_final_kfree
>       drm/tidss: Use drmm_add_final_kfree
>       drm/mcde: Use drmm_add_final_kfree
>       drm/vgem: Use drmm_add_final_kfree
>       drm/vkms: Use drmm_add_final_kfree
>       drm/repaper: Use drmm_add_final_kfree
>       drm/ingenic: Use drmm_add_final_kfree
>       drm/gm12u320: Use drmm_add_final_kfree
>       drm/<drivers>: Use drmm_add_final_kfree
>       drm: Cleanups after drmm_add_final_kfree rollout
>       drm: Handle dev->unique with drmm_
>       drm: Use drmm_ for drm_dev_init cleanup
>       drm: manage drm_minor cleanup with drmm_
>       drm: Manage drm_gem_init with drmm_
>       drm: Manage drm_vblank_cleanup with drmm_
>       drm: Garbage collect drm_dev_fini
>       drm: Manage drm_mode_config_init with drmm_
>       drm/bochs: Remove leftover drm_atomic_helper_shutdown
>       drm/bochs: Drop explicit drm_mode_config_cleanup
>       drm/cirrus: Drop explicit drm_mode_config_cleanup call
>       drm/cirrus: Fully embrace devm_
>       drm/ingenic: Drop explicit drm_mode_config_cleanup call
>       drm/mcde: Drop explicit drm_mode_config_cleanup call
>       drm/mcde: More devm_drm_dev_init
>       drm/meson: Drop explicit drm_mode_config_cleanup call
>       drm/pl111: Drop explicit drm_mode_config_cleanup call
>       drm/rcar-du: Drop explicit drm_mode_config_cleanup call
>       drm/rockchip: Drop explicit drm_mode_config_cleanup call
>       drm/stm: Drop explicit drm_mode_config_cleanup call
>       drm/shmob: Drop explicit drm_mode_config_cleanup call
>       drm/mtk: Drop explicit drm_mode_config_cleanup call
>       drm/tidss: Drop explicit drm_mode_config_cleanup call
>       drm/gm12u320: More drmm_
>       drm/gm12u320: Use devm_drm_dev_init
>       drm/gm12u320: Use helpers for shutdown/suspend/resume
>       drm/gm12u320: Simplify upload work
>       drm/repaper: Drop explicit drm_mode_config_cleanup call
>       drm/mipi-dbi: Move drm_mode_config_init into mipi library
>       drm/mipi-dbi: Drop explicit drm_mode_config_cleanup call
>       drm/udl: Drop explicit drm_mode_config_cleanup call
>       drm/udl: drop drm_driver.release hook
>       drm: Add docs for managed resources
>       drm/managed: Fix off-by-one in warning
>       drm/pci: Move drm_pci_alloc/free under CONFIG_DRM_LEGACY
>       drm: delete drm_pci.h
>=20
> David Lu (2):
>       dt-bindings: boe, tv101wum-n16: Add compatible for boe tv105wum-n=
w0.
>       drm/panel: support for boe,tv105wum-nw0 dsi video mode panel
>=20
> Emil Velikov (2):
>       drm: rework SET_MASTER and DROP_MASTER perm handling
>       drm: error out with EBUSY when device has existing master
>=20
> Fabio Estevam (2):
>       dt-bindings: display: ltk500hd1829: Remove the reg property
>       dt-bindings: display: xpp055c272: Remove the reg property
>=20
> Geert Uytterhoeven (1):
>       drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data parameter con=
st
>=20
> Guido G=C3=BCnther (2):
>       dt-bindings: display/bridge: Add binding for NWL mipi dsi host co=
ntroller
>       drm/bridge: Add NWL MIPI DSI host controller support
>=20
> Gurchetan Singh (4):
>       drm/virtio: random virtgpu_drv.h cleanups
>       drm/virtio: delete notify after virtio_gpu_cmd_context_create
>       drm/virtio: delete notify in virtio_gpu_object_create
>       drm/virtio: make virtio_gpu_object_attach void
>=20
> Hans de Goede (1):
>       drm/fb-helper: Add TODO for making drm_fb_helper_alloc_fbi fill a=
pertures
>=20
> Harigovindan P (1):
>       dt-bindings: display: add visionox rm69299 panel variant
>=20
> Heiko Stuebner (2):
>       dt-bindings: display: panel: Add binding document for Leadtek LTK=
050H3146W
>       drm/panel: add panel driver for Leadtek LTK050H3146W
>=20
> Huacai Chen (1):
>       drm/qxl: Use correct notify port address when creating cursor rin=
g
>=20
> Huang Rui (1):
>       drm/ttm: clean up ttm_trace_dma_map/ttm_trace_dma_unmap (v2)
>=20
> Igor Matheus Andrade Torrente (1):
>       drm: Correct a typo in a function comment
>=20
> Jagan Teki (3):
>       dt-bindings: display: panel: Convert feiyang,fy07024di26a30d to D=
T schema
>       dt-bindings: display: panel: Convert sitronix,st7701 to DT schema=

>       MAINTAINERS: Update feiyang,st7701 panel bindings converted as YA=
ML
>=20
> Jason Yan (2):
>       video: fbdev: matroxfb: remove dead code and set but not used var=
iable
>       video: fbdev: mb862xx: remove set but not used variable 'mdr'
>=20
> Jernej Skrabec (6):
>       drm/sun4i: de2: rgb field in de2 format struct is redundant
>       drm/sun4i: de2: csc_mode in de2 format struct is mostly redundant=

>       drm/sun4i: de2: Don't return de2_fmt_info struct
>       drm/sun4i: Sort includes in VI and UI layer code
>       drm/bridge: dw-hdmi: Add support for RGB limited range
>       drm/bridge: dw-hdmi: rework csc related functions
>=20
> Jiri Slaby (1):
>       drm/virtio: fix OOB in virtio_gpu_object_create
>=20
> Joe Perches (1):
>       drm: drm_vm: Use fallthrough;
>=20
> Johan Jonker (2):
>       dt-bindings: display: convert rockchip vop bindings to yaml
>       dt-bindings: display: rockchip-vop: add additional properties
>=20
> John Stultz (1):
>       drm: kirin: Revert change to add register connect helper function=
s
>=20
> Jonas Karlman (1):
>       drm/bridge: dw-hdmi: do not force "none" scan mode
>=20
> Jules Irenge (1):
>       video: Add missing annotation for cyber2000fb_enable_ddc() and cy=
ber2000fb_disable_ddc()
>=20
> Laurent Pinchart (1):
>       drm: Fix wrong kfree() in managed resource usage example
>=20
> Lyude Paul (12):
>       drm/amd/amdgpu_dm/mst: Remove unneeded edid assignment when destr=
oying connectors
>       drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callback
>       drm/amd/amdgpu_dm/mst: Stop printing extra messages in dm_dp_add_=
mst_connector()
>       drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connector
>       drm/dp_mst: Fix NULL deref in drm_dp_get_one_sb_msg()
>       drm/dp_mst: Don't drop NAKs for down responses
>       drm/i915/dp_mst: Cast intel_connector->port as drm_dp_mst_port
>       drm/dp_mst: Remove drm_dp_mst_has_audio()
>       drm/dp_mst: Improve kdocs for drm_dp_check_act_status()
>       drm/dp_mst: Reformat drm_dp_check_act_status() a bit
>       drm/dp_mst: Increase ACT retry timeout to 3s
>       drm/dp_mst: Print errors on ACT timeouts
>=20
> Maarten Lankhorst (1):
>       Merge remote-tracking branch 'drm/drm-next' into drm-misc-next
>=20
> Marek Szyprowski (1):
>       drm/bridge: sii9234: silence warning about regulators during defe=
rred probe
>=20
> Markus Elfring (2):
>       drm/sun4i: tcon: Delete an error message in sun4i_tcon_init_irq()=

>       drm/ingenic: Delete an error message in ingenic_drm_probe()
>=20
> Martin Blumenstingl (1):
>       drm/lima: Add optional devfreq and cooling device support
>=20
> Maxime Ripard (1):
>       Merge drm/drm-next into drm-misc-next
>=20
> Maya Rashish (1):
>       drm/dp_mst: make build_clear_payload_id_table return void
>=20
> Pascal Roeleven (2):
>       dt-bindings: panel: Add binding for Starry KR070PE2T
>       drm: panel: Add Starry KR070PE2T
>=20
> Paul Cercueil (2):
>       drm/panel: nt39016: Add support for multiple modes
>       drm/panel: nt39016: Add support for 50 Hz refresh rate
>=20
> Qiang Yu (5):
>       drm/lima: save process info for debug usage
>       drm/lima: add max_error_tasks module parameter
>       drm/lima: save task info dump when task fail
>       drm/lima: add error sysfs to export error task dump
>       drm/lima: add trace point for tasks
>=20
> Randy Dunlap (6):
>       fbdev: fbmon: fix -Wextra build warnings
>       fbdev: aty: fix -Wextra build warning
>       fbdev: matrox: fix -Wextra build warnings
>       fbdev: savage: fix -Wextra build warning
>       fbdev: pm[23]fb.c: fix -Wextra build warnings and errors
>       fbdev: via: fix -Wextra build warning and format warning
>=20
> Sam Ravnborg (9):
>       dt-bindings: display: grammar fixes in panel/
>       drm/dp_mst: add kernel-doc for drm_dp_mst_port.fec_capable
>       drm/fb: fix kernel-doc in drm_framebuffer.h
>       drm/sched: fix kernel-doc in gpu_scheduler.h
>       drm/bridge: fix kernel-doc warning in panel.c
>       drm: writeback: document callbacks
>       drm/writeback: wire drm_writeback.h to kernel-doc
>       drm/vblank: Add intro to documentation
>       fbdev: mx3fb: const pointer to ipu_di_signal_cfg
>=20
> Sean Paul (3):
>       drm/mst: Separate sideband packet header parsing from message bui=
lding
>       drm/mst: Support simultaneous down replies
>       drm/dp_mst: Remove single tx msg restriction.
>=20
> Simon Ser (1):
>       drm: add docs about the IN_FORMATS plane property
>=20
> Takashi Iwai (3):
>       video: omapfb: Use scnprintf() for avoiding potential buffer over=
flow
>       video: omap2: Use scnprintf() for avoiding potential buffer overf=
low
>       video: uvesafb: Use scnprintf() for avoiding potential buffer ove=
rflow
>=20
> Tang Bin (1):
>       video: fbdev: don't print error message on platform_get_irq() fai=
lure
>=20
> Thomas Zimmermann (32):
>       drm/atmel-hlcdc: Use simple encoder
>       drm/exynos: Use simple encoder
>       drm/fsl-dcu: Use simple encoder
>       drm/gma500: Use simple encoder
>       drm/hisilicon/kirin: Use simple encoder
>       drm/i2c/tda998x: Use simple encoder
>       drm/imx: Use simple encoder
>       drm/ingenic: Use simple encoder
>       drm/mediatek: Use simple encoder
>       drm/rcar-du: Use simple encoder
>       drm/rockchip: Use simple encoder
>       drm/shmobile: Use simple encoder
>       drm/sun4i: Use simple encoder
>       drm/tegra: Use simple encoder
>       drm/tidss: Use simple encoder
>       drm/tilcdc: Use simple encoder
>       drm/vc4: Use simple encoder
>       drm/virtgpu: Use simple encoder
>       drm/vkms: Use simple encoder
>       drm/zte: Use simple encoder
>       drm/ast: Set up fbdev after registering device; remove error chec=
ks
>       drm/hibmc: Remove error check from fbdev setup
>       drm/kirin: Set up fbdev after fully registering device
>       drm/ingenic: Remove error check from fbdev setup
>       drm/mediatek: Remove error check from fbdev setup
>       drm/mgag200: Set up fbdev after registering device; remove error =
checks
>       drm/tilcdc: Set up fbdev after fully registering device
>       drm/udl: Remove error check from fbdev setup
>       drm/vboxvideo: Set up fbdev after registering device; remove erro=
r checks
>       drm/fb-helper: Remove return value from drm_fbdev_generic_setup()=

>       drm/vram-helpers: Set plane fence for display update
>       drm/vram-helpers: Merge code into a single file
>=20
> Tian Tao (1):
>       drm/hisilicon: Enforce 128-byte stride alignment to fix the hardw=
are limitation
>=20
> Tomi Valkeinen (1):
>       omapfb: Remove unused writeback code
>=20
> Ville Syrj=C3=A4l=C3=A4 (16):
>       drm: Constify topology id
>       drm/edid: Swap some operands in for_each_displayid_db()
>       drm/edid: Remove idx=3D=3D1 assumptions from all over the DispID =
parsing
>       drm/edid: Return DispID length from drm_find_displayid_extension(=
)
>       drm/edid: Move validate_displayid() drm_find_displayid_extension(=
)
>       drm/edid: Don't parse garbage as DispID blocks
>       drm/edid: Don't include ext block csum in DispID size
>       drm/edid: Clarify validate_displayid()
>       drm/edid: Fix DispID tile parsing for override EDID
>       drm: Include the encoder itself in possible_clones
>       drm/gma500: Sanitize possible_clones
>       drm/imx: Remove the bogus possible_clones setup
>       drm: Validate encoder->possible_clones
>       drm: Validate encoder->possible_crtcs
>       drm: Skip drm_mode_config_validate() for !modeset
>       drm/panel-leadtek-ltk500hd1829: Fix dotclock
>=20
> Wambui Karuga (18):
>       drm/tegra: remove checks for debugfs functions return value
>       drm/tilcdc: remove check for return value of debugfs functions.
>       drm/v3d: make v3d_debugfs_init() return 0
>       drm/vc4: remove check of return value of drm_debugfs functions
>       drm/arc: make arcgpu_debugfs_init() return 0.
>       drm/arm: make hdlcd_debugfs_init() return 0
>       drm/etnaviv: remove check for return value of drm_debugfs_create_=
files()
>       drm/msm: remove checks for return value of drm_debugfs_create_fil=
es()
>       drm/sti: remove use of drm_debugfs functions as return values
>       drm/vram-helper: make drm_vram_mm_debugfs_init() return 0
>       drm/nouveau: make nouveau_drm_debugfs_init() return 0
>       drm/pl111: make pl111_debugfs_init return 0
>       drm/omap: remove checks for return value of drm_debugfs functions=

>       drm/i915: have *_debugfs_init() functions return void.
>       drm: make various debugfs_init() functions return 0
>       drm/debugfs: remove checks for return value of drm_debugfs functi=
ons.
>       drm: convert .debugfs_init() hook to return void.
>       drm/vram-helper: remove unneeded #if defined/endif guards.
>=20
> Wolfram Sang (6):
>       drm/amdgpu: convert to use i2c_new_client_device()
>       drm/gma500: convert to use i2c_new_client_device()
>       drm/i2c/sil164: convert to use i2c_new_client_device()
>       drm/i2c/tda998x: convert to use i2c_new_client_device()
>       drm/nouveau/therm: convert to use i2c_new_client_device()
>       drm/radeon: convert to use i2c_new_client_device()
>=20
>  .../bindings/display/bridge/nwl-dsi.yaml           |  226 ++++
>  .../bindings/display/panel/boe,tv101wum-nl6.yaml   |    2 +
>  .../bindings/display/panel/display-timings.yaml    |    8 +-
>  .../display/panel/feiyang,fy07024di26a30d.txt      |   20 -
>  .../display/panel/feiyang,fy07024di26a30d.yaml     |   58 +
>  .../display/panel/leadtek,ltk050h3146w.yaml        |   51 +
>  .../display/panel/leadtek,ltk500hd1829.yaml        |    1 -
>  .../bindings/display/panel/panel-common.yaml       |    4 +-
>  .../bindings/display/panel/panel-simple.yaml       |    2 +
>  .../bindings/display/panel/sitronix,st7701.txt     |   30 -
>  .../bindings/display/panel/sitronix,st7701.yaml    |   69 ++
>  .../bindings/display/panel/visionox,rm69299.yaml   |   57 +
>  .../bindings/display/panel/xinpeng,xpp055c272.yaml |    1 -
>  .../bindings/display/rockchip/rockchip-vop.txt     |   74 --
>  .../bindings/display/rockchip/rockchip-vop.yaml    |  134 +++
>  Documentation/gpu/drm-internals.rst                |   12 +
>  Documentation/gpu/drm-kms.rst                      |    5 +-
>  Documentation/gpu/drm-mm.rst                       |    9 -
>  MAINTAINERS                                        |    6 +-
>  drivers/dma-buf/Makefile                           |    3 +-
>  drivers/dma-buf/dma-buf.c                          |    2 +
>  drivers/dma-buf/dma-fence-chain.c                  |   10 +-
>  drivers/dma-buf/selftests.h                        |    1 +
>  drivers/dma-buf/st-dma-fence-chain.c               |  715 ++++++++++++=

>  drivers/gpu/drm/Makefile                           |    6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   61 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   99 ++
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   45 +-
>  drivers/gpu/drm/arc/arcpgu_drv.c                   |    7 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 +
>  drivers/gpu/drm/arm/hdlcd_drv.c                    |    7 +-
>  drivers/gpu/drm/arm/malidp_drv.c                   |    3 +-
>  drivers/gpu/drm/armada/armada_drv.c                |    2 +
>  drivers/gpu/drm/ast/ast_drv.c                      |    3 +
>  drivers/gpu/drm/ast/ast_main.c                     |    5 -
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   12 +-
>  drivers/gpu/drm/bochs/bochs.h                      |    1 -
>  drivers/gpu/drm/bochs/bochs_drv.c                  |    6 +-
>  drivers/gpu/drm/bochs/bochs_kms.c                  |   15 +-
>  drivers/gpu/drm/bridge/Kconfig                     |   16 +
>  drivers/gpu/drm/bridge/Makefile                    |    1 +
>  drivers/gpu/drm/bridge/nwl-dsi.c                   | 1213 ++++++++++++=
++++++++
>  drivers/gpu/drm/bridge/nwl-dsi.h                   |  144 +++
>  drivers/gpu/drm/bridge/panel.c                     |    1 +
>  drivers/gpu/drm/bridge/sii9234.c                   |    3 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   86 +-
>  drivers/gpu/drm/cirrus/cirrus.c                    |   74 +-
>  drivers/gpu/drm/drm_atomic.c                       |    8 +-
>  drivers/gpu/drm/drm_auth.c                         |   69 +-
>  drivers/gpu/drm/drm_blend.c                        |    6 +
>  drivers/gpu/drm/drm_bufs.c                         |    2 +-
>  drivers/gpu/drm/drm_client.c                       |    8 +-
>  drivers/gpu/drm/drm_connector.c                    |    6 +-
>  drivers/gpu/drm/drm_crtc_internal.h                |    4 +-
>  drivers/gpu/drm/drm_debugfs.c                      |   45 +-
>  drivers/gpu/drm/drm_dma.c                          |    2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c              |  307 ++---
>  drivers/gpu/drm/drm_drv.c                          |  219 ++--
>  drivers/gpu/drm/drm_edid.c                         |  103 +-
>  drivers/gpu/drm/drm_fb_helper.c                    |   31 +-
>  drivers/gpu/drm/drm_framebuffer.c                  |    8 +-
>  drivers/gpu/drm/drm_gem.c                          |   23 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  220 +++-
>  drivers/gpu/drm/drm_gem_vram_helper.c              |  124 +-
>  drivers/gpu/drm/drm_internal.h                     |    7 +-
>  drivers/gpu/drm/drm_ioctl.c                        |    4 +-
>  drivers/gpu/drm/drm_managed.c                      |  275 +++++
>  drivers/gpu/drm/drm_mipi_dbi.c                     |   33 +-
>  drivers/gpu/drm/drm_mm.c                           |    8 +-
>  drivers/gpu/drm/drm_mode_config.c                  |  110 +-
>  drivers/gpu/drm/drm_pci.c                          |    4 +-
>  drivers/gpu/drm/drm_vblank.c                       |   94 +-
>  drivers/gpu/drm/drm_vm.c                           |    4 +-
>  drivers/gpu/drm/drm_vram_helper_common.c           |   94 --
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   18 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 |    8 +-
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    8 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    8 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c           |    8 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |    8 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   14 +-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c             |   14 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c              |   16 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    4 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   17 +-
>  drivers/gpu/drm/gma500/framebuffer.c               |   16 +-
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |   11 +-
>  drivers/gpu/drm/gma500/mdfld_output.h              |    1 -
>  drivers/gpu/drm/gma500/mdfld_tmd_vid.c             |    6 -
>  drivers/gpu/drm/gma500/mdfld_tpo_vid.c             |    6 -
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   14 +-
>  drivers/gpu/drm/gma500/oaktrail_lvds.c             |    5 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
>  drivers/gpu/drm/gma500/psb_intel_lvds.c            |   18 +-
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |   13 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |    9 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    8 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |    2 +-
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    9 +-
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    1 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   43 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |    1 -
>  drivers/gpu/drm/i2c/sil164_drv.c                   |    7 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                  |   20 +-
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |   18 +-
>  .../gpu/drm/i915/display/intel_display_debugfs.h   |    4 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |    2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |    3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    2 -
>  drivers/gpu/drm/i915/i915_debugfs.c                |    8 +-
>  drivers/gpu/drm/i915/i915_debugfs.h                |    4 +-
>  drivers/gpu/drm/i915/i915_drv.c                    |   22 +-
>  drivers/gpu/drm/i915/i915_drv.h                    |    3 +
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   32 +-
>  drivers/gpu/drm/imx/dw_hdmi-imx.c                  |    8 +-
>  drivers/gpu/drm/imx/imx-drm-core.c                 |   10 +-
>  drivers/gpu/drm/imx/imx-drm.h                      |    1 -
>  drivers/gpu/drm/imx/imx-ldb.c                      |    8 +-
>  drivers/gpu/drm/imx/imx-tve.c                      |    8 +-
>  drivers/gpu/drm/imx/parallel-display.c             |    8 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.c              |   34 +-
>  drivers/gpu/drm/lima/Kconfig                       |    2 +
>  drivers/gpu/drm/lima/Makefile                      |    4 +-
>  drivers/gpu/drm/lima/lima_ctx.c                    |    3 +
>  drivers/gpu/drm/lima/lima_ctx.h                    |    5 +
>  drivers/gpu/drm/lima/lima_devfreq.c                |  234 ++++
>  drivers/gpu/drm/lima/lima_devfreq.h                |   41 +
>  drivers/gpu/drm/lima/lima_device.c                 |   17 +
>  drivers/gpu/drm/lima/lima_device.h                 |   11 +
>  drivers/gpu/drm/lima/lima_drv.c                    |  112 +-
>  drivers/gpu/drm/lima/lima_drv.h                    |    1 +
>  drivers/gpu/drm/lima/lima_dump.h                   |   77 ++
>  drivers/gpu/drm/lima/lima_sched.c                  |  142 ++-
>  drivers/gpu/drm/lima/lima_sched.h                  |   11 +
>  drivers/gpu/drm/lima/lima_trace.c                  |    7 +
>  drivers/gpu/drm/lima/lima_trace.h                  |   50 +
>  drivers/gpu/drm/mcde/mcde_drv.c                    |   35 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   14 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   13 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   14 +-
>  drivers/gpu/drm/meson/meson_drv.c                  |    5 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 +
>  drivers/gpu/drm/mgag200/mgag200_main.c             |    4 -
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   18 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   14 +-
>  drivers/gpu/drm/msm/msm_debugfs.c                  |   23 +-
>  drivers/gpu/drm/msm/msm_debugfs.h                  |    2 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   26 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.h          |    8 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c     |    4 +-
>  drivers/gpu/drm/omapdrm/omap_debugfs.c             |   29 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h                 |    2 +-
>  drivers/gpu/drm/panel/Kconfig                      |   11 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   31 +
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  691 +++++++++++
>  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |    2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   46 +-
>  drivers/gpu/drm/panel/panel-simple.c               |   29 +
>  drivers/gpu/drm/pl111/pl111_debugfs.c              |    8 +-
>  drivers/gpu/drm/pl111/pl111_drm.h                  |    2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |   12 +-
>  drivers/gpu/drm/qxl/qxl_debugfs.c                  |   21 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                      |    2 -
>  drivers/gpu/drm/qxl/qxl_drv.h                      |   13 +-
>  drivers/gpu/drm/qxl/qxl_kms.c                      |    4 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c                      |    6 +-
>  drivers/gpu/drm/r128/ati_pcigart.c                 |    3 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c           |    4 +-
>  drivers/gpu/drm/radeon/radeon_combios.c            |    4 +-
>  drivers/gpu/drm/radeon/radeon_drv.c                |    2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    1 -
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   14 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |    4 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    9 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |    9 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    8 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    8 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |    8 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    8 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   14 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   43 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  137 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   17 +
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |   10 +-
>  drivers/gpu/drm/rockchip/rockchip_rgb.c            |    8 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   83 +-
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |   14 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    2 -
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c           |    6 +-
>  drivers/gpu/drm/sti/sti_compositor.c               |    6 +-
>  drivers/gpu/drm/sti/sti_compositor.h               |    4 +-
>  drivers/gpu/drm/sti/sti_crtc.c                     |    2 +-
>  drivers/gpu/drm/sti/sti_cursor.c                   |   14 +-
>  drivers/gpu/drm/sti/sti_drv.c                      |   16 +-
>  drivers/gpu/drm/sti/sti_dvo.c                      |   13 +-
>  drivers/gpu/drm/sti/sti_gdp.c                      |    7 +-
>  drivers/gpu/drm/sti/sti_hda.c                      |   13 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                     |   13 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c                    |   12 +-
>  drivers/gpu/drm/sti/sti_mixer.c                    |   10 +-
>  drivers/gpu/drm/sti/sti_mixer.h                    |    2 +-
>  drivers/gpu/drm/sti/sti_tvout.c                    |   13 +-
>  drivers/gpu/drm/sti/sti_vid.c                      |    8 +-
>  drivers/gpu/drm/sti/sti_vid.h                      |    2 +-
>  drivers/gpu/drm/stm/drv.c                          |   10 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   12 +-
>  drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   12 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   17 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    4 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   |   17 +-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   12 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    8 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                |  111 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.h                |   10 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   14 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   40 +-
>  drivers/gpu/drm/tegra/dc.c                         |   11 +-
>  drivers/gpu/drm/tegra/drm.c                        |    8 +-
>  drivers/gpu/drm/tegra/drm.h                        |    2 -
>  drivers/gpu/drm/tegra/dsi.c                        |   21 +-
>  drivers/gpu/drm/tegra/hdmi.c                       |   20 +-
>  drivers/gpu/drm/tegra/output.c                     |    6 +-
>  drivers/gpu/drm/tegra/rgb.c                        |    8 +-
>  drivers/gpu/drm/tegra/sor.c                        |   19 +-
>  drivers/gpu/drm/tidss/tidss_drv.c                  |   10 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c              |   10 +-
>  drivers/gpu/drm/tidss/tidss_kms.c                  |   19 +-
>  drivers/gpu/drm/tidss/tidss_kms.h                  |    1 -
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   20 +-
>  drivers/gpu/drm/tilcdc/tilcdc_external.c           |   10 +-
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    8 +-
>  drivers/gpu/drm/tiny/gm12u320.c                    |  226 ++--
>  drivers/gpu/drm/tiny/hx8357d.c                     |    5 +-
>  drivers/gpu/drm/tiny/ili9225.c                     |    5 +-
>  drivers/gpu/drm/tiny/ili9341.c                     |    5 +-
>  drivers/gpu/drm/tiny/ili9486.c                     |    5 +-
>  drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
>  drivers/gpu/drm/tiny/repaper.c                     |   18 +-
>  drivers/gpu/drm/tiny/st7586.c                      |    5 +-
>  drivers/gpu/drm/tiny/st7735r.c                     |    5 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
>  drivers/gpu/drm/udl/udl_drv.c                      |   22 +-
>  drivers/gpu/drm/udl/udl_drv.h                      |    2 -
>  drivers/gpu/drm/udl/udl_main.c                     |   10 -
>  drivers/gpu/drm/udl/udl_modeset.c                  |   21 +-
>  drivers/gpu/drm/v3d/v3d_debugfs.c                  |    8 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                      |   38 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                      |    2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c               |    8 +-
>  drivers/gpu/drm/vc4/vc4_debugfs.c                  |   11 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                      |    8 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |    2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |   15 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |   17 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                      |    8 +-
>  drivers/gpu/drm/vgem/vgem_drv.c                    |   15 +-
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    3 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c           |    8 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h               |   36 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c               |   13 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    1 -
>  drivers/gpu/drm/virtio/virtgpu_object.c            |   21 +-
>  drivers/gpu/drm/virtio/virtgpu_vq.c                |    9 +-
>  drivers/gpu/drm/vkms/vkms_drv.c                    |   19 +-
>  drivers/gpu/drm/vkms/vkms_output.c                 |    8 +-
>  drivers/gpu/drm/xen/xen_drm_front.c                |    4 +-
>  drivers/gpu/drm/zte/zx_hdmi.c                      |    8 +-
>  drivers/gpu/drm/zte/zx_tvenc.c                     |    8 +-
>  drivers/gpu/drm/zte/zx_vga.c                       |    8 +-
>  drivers/video/fbdev/atmel_lcdfb.c                  |    1 -
>  drivers/video/fbdev/aty/atyfb_base.c               |    2 +-
>  drivers/video/fbdev/core/fbmon.c                   |    2 +-
>  drivers/video/fbdev/cyber2000fb.c                  |    2 +
>  drivers/video/fbdev/matrox/g450_pll.c              |   22 -
>  drivers/video/fbdev/matrox/matroxfb_base.h         |    2 +-
>  drivers/video/fbdev/mb862xx/mb862xxfb_accel.c      |    2 -
>  drivers/video/fbdev/mx3fb.c                        |   20 +-
>  drivers/video/fbdev/omap/omapfb_main.c             |   14 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c       |  114 --
>  drivers/video/fbdev/omap2/omapfb/dss/dss.h         |   20 -
>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c    |    8 +-
>  drivers/video/fbdev/pm2fb.c                        |    2 +-
>  drivers/video/fbdev/pm3fb.c                        |    8 +-
>  drivers/video/fbdev/savage/savagefb.h              |    2 +-
>  drivers/video/fbdev/uvesafb.c                      |    2 +-
>  drivers/video/fbdev/via/debug.h                    |    6 +-
>  drivers/video/fbdev/via/viafbdev.c                 |    2 +-
>  include/drm/drm_client.h                           |    2 +-
>  include/drm/drm_connector.h                        |    4 +-
>  include/drm/drm_debugfs.h                          |   16 +-
>  include/drm/drm_device.h                           |   15 +
>  include/drm/drm_displayid.h                        |    2 +-
>  include/drm/drm_dp_mst_helper.h                    |   72 +-
>  include/drm/drm_drv.h                              |   11 +-
>  include/drm/drm_encoder.h                          |    8 +-
>  include/drm/drm_fb_helper.h                        |    6 +-
>  include/drm/drm_file.h                             |   11 +
>  include/drm/drm_framebuffer.h                      |   38 +
>  include/drm/drm_gem_framebuffer_helper.h           |   15 +
>  include/drm/drm_gem_vram_helper.h                  |    2 +-
>  include/drm/drm_legacy.h                           |   15 +
>  include/drm/drm_managed.h                          |  109 ++
>  include/drm/drm_mipi_dbi.h                         |    8 +-
>  include/drm/drm_mode_config.h                      |   18 +-
>  include/drm/drm_modeset_helper_vtables.h           |   27 +
>  include/drm/drm_pci.h                              |   63 -
>  include/drm/drm_print.h                            |    6 +
>  include/drm/drm_writeback.h                        |    9 +
>  include/drm/gpu_scheduler.h                        |    1 +
>  include/drm/ttm/ttm_debug.h                        |   31 -
>  include/linux/dma-buf.h                            |   10 +
>  mm/slob.c                                          |    2 +
>  mm/slub.c                                          |    2 +
>  320 files changed, 7080 insertions(+), 2712 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nw=
l-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/fei=
yang,fy07024di26a30d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/fei=
yang,fy07024di26a30d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lea=
dtek,ltk050h3146w.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sit=
ronix,st7701.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sit=
ronix,st7701.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/vis=
ionox,rm69299.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/=
rockchip-vop.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/=
rockchip-vop.yaml
>  create mode 100644 drivers/dma-buf/st-dma-fence-chain.c
>  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.c
>  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.h
>  create mode 100644 drivers/gpu/drm/drm_managed.c
>  delete mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>  create mode 100644 drivers/gpu/drm/lima/lima_dump.h
>  create mode 100644 drivers/gpu/drm/lima/lima_trace.c
>  create mode 100644 drivers/gpu/drm/lima/lima_trace.h
>  create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
>  create mode 100644 include/drm/drm_managed.h
>  delete mode 100644 include/drm/drm_pci.h
>  delete mode 100644 include/drm/ttm/ttm_debug.h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--InzlCtjc4pHITdIJAf1Mq10bKiCnJOS7J--

--xKCwGVLofPoiyg5tFIT7z5xtFRLVkGerr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6e6w4ACgkQaA3BHVML
eiPwjAgAq+rZcRWNQ3Ms4jBAUKkXjXhOZy32DAdeTJEa7SowaAAwxC4QlL+LwzEk
aSv0+99d5TZqRCOaHYcC7SKIT4SVe7N+0YQ6cuupZjU6qrXY40uFD7TDHAZ+MGLO
bU6lCfVraw1bBj8m/8l1gTvhcFVQ1k/URiXkwDzpwBRObyGPll0E+SdUNtjhDAGE
PxOUVf1/6hKOVjM4RROpIXCM6TP0fO+fBaVbVYNGC3YLozNW6WuBw8JiEntSANil
Kuleeo+HfuJRAYc9oJ5TrhJqzlAeQfyjhW50Frdb6ne01msOHvUCwTEePZvdFCoB
WjHitNHoJQVc2ooJQf3+Sn9SrCJ2bQ==
=W7J2
-----END PGP SIGNATURE-----

--xKCwGVLofPoiyg5tFIT7z5xtFRLVkGerr--

--===============1995797662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1995797662==--
