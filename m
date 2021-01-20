Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2E2FCF48
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 13:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13EA6E1BC;
	Wed, 20 Jan 2021 12:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C696E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 12:11:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d26so22870712wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IGA4MFItvPL4OlLmJnN5UZxvVugePRUifOG0Ez72Y18=;
 b=ksekugHE5q54+q+x+h4cKu6RTnayAKvsRK0uAbQ4zeupre/uimb11VWe+emj6Oa4sI
 la56cc5FTNj7zbFNKPN16WDEpVqw1jUrpuRMrH4QuqAqsAKQfl+kVzt05n/BHHKfnCdb
 e3m/apEQl0zYtfsvbZ69CPFxJHcnwG/L7XWKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IGA4MFItvPL4OlLmJnN5UZxvVugePRUifOG0Ez72Y18=;
 b=VWfH1Lr+V+CzY3iR3t/tqfZguPwv9VuIIhvLqYLCTRwqcfNYADICKB7II5JxqVzWsO
 v2oBu29BxyHeg7dtKYW5aRmqfacDyZkrTFlWo8B5LsY//ryuBr81rOFsZT3TV9H5kt/T
 wLY1DEoZCLhTPJqI9LKVnRF5q8Yuo8hLvoDi/MWUjCHAPpCFIW38VPGvqOapN01StOrO
 zsjvbTy6F+ncsOG9be4HOu1VRn9DHr5K8VJ/hhyL+cOEht/9Y0nW9bpG3dB739s9J+wv
 tGe4g29OoBwrvK8iGy3r3Ugo2Es65SgPi7ZkxZ4oWPqT1By2vd1C2fE2oQHp6eVICTmf
 YSLw==
X-Gm-Message-State: AOAM530mhwf1rrAwVQxhk6C6ZWZxv34RXI/0y8VHWf+hGuKeBv+1xpR6
 4yHCWEfhUQQTGcUnbQv05aU7Dw==
X-Google-Smtp-Source: ABdhPJxvgDgLAidTr25LvbptyHISx8WLMPR4qsfsL5CnNvRRg8fLEl30Ma9dGiL8l37v1Zkyn1Oglw==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr9176484wrp.401.1611144672510; 
 Wed, 20 Jan 2021 04:11:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d18sm3658038wmb.30.2021.01.20.04.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 04:11:11 -0800 (PST)
Date: Wed, 20 Jan 2021 13:11:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <YAgd3VwEVuIB5gF1@phenom.ffwll.local>
References: <5c3ad775-48ce-33ee-e4c6-a5e1e540f845@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c3ad775-48ce-33ee-e4c6-a5e1e540f845@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 12:39:22PM +0100, Maarten Lankhorst wrote:
> drm-misc-next-2021-01-19:
> drm-misc-next for v5.12:
> =

> UAPI Changes:
> - Fix fourcc macro for amlogic video fbc.
> =

> Cross-subsystem Changes:
> - Export pci_rebar_bytes_to_size.
> - Add a PCI quirk to increase bar0 for RX 5600 XT Pulse to max possible s=
ize.
> - Convert devicetree bindings to use the OF graph schema.
> - Update s6e63m0 bindings.
> - Make omapfb2 DSI_CM incompatible with drm/omap2 DSI-CM because of
>   module conflicts.
> - Add Zack Rusin as vmwgfx maintainer.
> - Add CONFIG_DMABUF_DEBUG for validating dma-buf users don't loo kat stru=
ct page when importing or detaching.
> =

> Core Changes:
> - Remove references to drm_device.pdev
> - Fix regression in ttm_bo_move_to_lru_tail().
> - Assorted docbook updates.
> - Do not send dp-mst hotplug events on error when probing.
> - Move some agp macros to agpsupport.c, so it's not always compiled.
> - Move drm_need_swiotlb.h to drm_cache.c
> - Only build drm_memory.o for legacy drivers, and move CONFIG_DRM_VM to l=
egacy.
> - Nuke drm_device.hose
> - Warn when the ttm resource manager is non-empty when disabling.
> - Assorted small fixes.
> =

> Driver Changes:
> - Small assorted fixes in radeon, v3d, hisilicon, mipi-dbi, panfrost, hib=
mc, vc4, amdgpu, vkms, vmwgfx.
> - Move hisilicon to use simple encode.
> - Add writeback connector to vkms.
> - Add support for BT2020 to DE3.
> - Use gem prime mmap helpers in vc4, and move the mmap function upwards.
> - Use managed drm device, and cleanup error paths and display registers i=
n vmwgfx.
> - Use correct bus_format and connector_type for innolux_n116bge.
> - Fix a lot of warnings with W=3D1 (Lee Jones)
> The following changes since commit cb3cfbf79aff7decb4e5ee69a7c74864497f61=
dc:
> =

>   Merge tag 'drm-misc-next-2021-01-06' of git://anongit.freedesktop.org/d=
rm/drm-misc into drm-next (2021-01-07 13:40:20 +0100)

Pulled, thanks.
-Daniel

> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-01-19
> =

> for you to fetch changes up to c31eb10fd5aee124b78ce72ebf7d0cd13fca6095:
> =

>   drm/amdgpu: Remove accidentally added small unused hunk. (2021-01-19 11=
:18:39 +0100)
> =

> ----------------------------------------------------------------
> drm-misc-next for v5.12:
> =

> UAPI Changes:
> - Fix fourcc macro for amlogic video fbc.
> =

> Cross-subsystem Changes:
> - Export pci_rebar_bytes_to_size.
> - Add a PCI quirk to increase bar0 for RX 5600 XT Pulse to max possible s=
ize.
> - Convert devicetree bindings to use the OF graph schema.
> - Update s6e63m0 bindings.
> - Make omapfb2 DSI_CM incompatible with drm/omap2 DSI-CM because of
>   module conflicts.
> - Add Zack Rusin as vmwgfx maintainer.
> - Add CONFIG_DMABUF_DEBUG for validating dma-buf users don't loo kat stru=
ct page when importing or detaching.
> =

> Core Changes:
> - Remove references to drm_device.pdev
> - Fix regression in ttm_bo_move_to_lru_tail().
> - Assorted docbook updates.
> - Do not send dp-mst hotplug events on error when probing.
> - Move some agp macros to agpsupport.c, so it's not always compiled.
> - Move drm_need_swiotlb.h to drm_cache.c
> - Only build drm_memory.o for legacy drivers, and move CONFIG_DRM_VM to l=
egacy.
> - Nuke drm_device.hose
> - Warn when the ttm resource manager is non-empty when disabling.
> - Assorted small fixes.
> =

> Driver Changes:
> - Small assorted fixes in radeon, v3d, hisilicon, mipi-dbi, panfrost, hib=
mc, vc4, amdgpu, vkms, vmwgfx.
> - Move hisilicon to use simple encode.
> - Add writeback connector to vkms.
> - Add support for BT2020 to DE3.
> - Use gem prime mmap helpers in vc4, and move the mmap function upwards.
> - Use managed drm device, and cleanup error paths and display registers i=
n vmwgfx.
> - Use correct bus_format and connector_type for innolux_n116bge.
> - Fix a lot of warnings with W=3D1 (Lee Jones)
> =

> ----------------------------------------------------------------
> Andrey Grodzovsky (2):
>       drm: Unamp the entire device address space on device unplug
>       drm/sched: Cancel and flush all outstanding jobs before finish.
> =

> Chia-I Wu (2):
>       drm/virtio: make sure context is created in gem open
>       drm/virtio: fix prime export for vram objects
> =

> Colin Ian King (1):
>       drm/vkms: Fix missing kmalloc allocation failure check
> =

> Daniel Vetter (4):
>       drm/vmwgfx: Drop svga_lock
>       drm/vmwgfx: Always evict vram _before_ disabling it
>       drm/ttm: WARN_ON non-empty lru when disabling a resource manager
>       dma-buf: Add debug option
> =

> Darren Salt (1):
>       PCI: Export pci_rebar_get_possible_sizes()
> =

> Giulio Benetti (1):
>       drm/sun4i: tcon: fix inverted DCLK polarity
> =

> Heiko Stuebner (1):
>       drm/panel: panel-simple: add bus-format and connector-type to Innol=
ux n116bge
> =

> Jernej Skrabec (3):
>       drm/sun4i: csc: Rework DE3 CSC macros
>       drm/sun4i: de2/de3: Remove redundant CSC matrices
>       drm/sun4i: Add support for BT2020 to DE3
> =

> Jonathan Neusch=E4fer (1):
>       drm/mipi-dbi: Switch to new kerneldoc syntax for named variable mac=
ro argument
> =

> Lee Jones (33):
>       drm/r128/r128_ioc32: Document headers do not make good kernel-doc c=
andidates
>       drm/mga/mga_ioc32: Document headers do not make good kernel-doc can=
didates
>       drm/r128/r128_ioc32: Fix formatting issues in 'r128_compat_ioctl()'=
s header
>       drm/mga/mga_ioc32: Fix some formatting issues in 'mga_compat_ioctl'=
s header
>       drm/gma500/framebuffer: Fix some possible doc-rot issues
>       drm/gma500/gem: Add and rename some function parameter descriptions
>       drm/gma500/intel_bios: Demote non-conformant kernel-doc header
>       drm/gma500/intel_i2c: Remove superflouous parameter description and=
 rename another
>       drm/gma500/mmu: Make local function 'psb_mmu_pt_alloc_map_lock()' s=
tatic
>       drm/gma500/power: Fix a bunch of *dev documentation issues
>       drm/gma500/gma_display: Demote kernel-doc abuses to standard commen=
t blocks
>       drm/gma500/gma_device: Include our own header containing prototypes
>       drm/gma500/psb_intel_display: Demote kernel-doc formatting abuse
>       drm/gma500/psb_intel_lvds: Supply description for 'mode_dev'
>       drm/gma500/psb_intel_modes: Provide missing descriptions for functi=
on param 'adapter'
>       drm/gma500/gem: Do not rely on consumers to include drm/drm_device.=
h before gem.h
>       drm/gma500/gem: Include our own header containing prototypes
>       drm/gma500/mmu: Remove unused function 'psb_get_default_pd_addr'
>       drm/gma500/power: Remove excess param description 'state'
>       drm/gma500/mmu: Actually return an error if one occurs
>       drm/gma500/psb_intel_sdvo: Demote kernel-doc abuses
>       drm/gma500/psb_irq: Demote kernel-doc abuse
>       drm/drm_dp_helper: Fix spelling issue and add missing description f=
or 'enable_frl_ready_hpd'
>       drm/gma500/cdv_intel_crt: Demote kernel-doc abuse in 'cdv_intel_crt=
_detect_hotplug()'s header
>       drm/gma500/cdv_intel_display: Demote kernel-doc abuse in 'cdv_intel=
_panel_fitter_pipe()'s header
>       drm/gma500/cdv_intel_lvds: Demote unworthy headers to standard bloc=
ks and fix another
>       drm/gma500/cdv_intel_dp: Demote one unworthy header fix another
>       drm/gma500/oaktrail_lvds_i2c: Remove unused variables 'tmp'
>       drm/gma500/oaktrail_lvds: Demote one documentation header fix anoth=
er
>       drm/gma500/oaktrail_crtc: Demote unworthy kernel-doc headers
>       drm/gma500/mdfld_dsi_output: Demote a couple of kernel-doc formatti=
ng abuses
>       drm/gma500/mdfld_intel_display: Demote three kernel-doc formatting =
abuses
>       drm/drm_agpsupport: Strip out obviously wrong descriptions and demo=
te to standard headers
> =

> Linus Walleij (1):
>       dt-bindings: display: Augment s6e63m0 bindings
> =

> Lukasz Luba (1):
>       drm/panfrost: Use delayed timer as default in devfreq profile
> =

> Lyude Paul (1):
>       drm/ttm: Remove pinned bos from LRU in ttm_bo_move_to_lru_tail() v2
> =

> Maarten Lankhorst (2):
>       Merge drm/drm-next into drm-misc-next
>       drm/amdgpu: Remove accidentally added small unused hunk.
> =

> Mauro Carvalho Chehab (1):
>       drm: drm_crc: fix a kernel-doc markup
> =

> Nicolas Saenz Julienne (1):
>       drm/v3d: Use platform_get_irq_optional() to get optional IRQs
> =

> Nirmoy Das (4):
>       PCI: Add pci_rebar_bytes_to_size()
>       PCI: Add a REBAR size quirk for Sapphire RX 5600 XT Pulse
>       drm/amdgpu: Resize BAR0 to the maximum available size, even if it d=
oesn't cover VRAM
>       drm/amdgpu: Remove unused variable
> =

> Phil Elwell (2):
>       drm/v3d: Set dma_mask as well as coherent_dma_mask
>       drm/v3d: Don't clear MMU control bits on exception
> =

> Rob Herring (1):
>       dt-bindings: display: Use OF graph schema
> =

> Roland Scheidegger (1):
>       drm/vmwgfx: add Zack Rusin as maintainer
> =

> Sebastian Reichel (1):
>       video: omapfb2: Make standard and custom DSI command mode panel dri=
ver mutually exclusive
> =

> Simon Ser (1):
>       drm/fourcc: fix Amlogic format modifier masks
> =

> Sumera Priyadarsini (4):
>       drm/vkms: Add vkms_config type
>       drm/vkms: Add support for writeback module
>       drm/vkms: Add information about module options
>       drm/vblank: Fix typo in docs
> =

> Thomas Zimmermann (30):
>       drm/ast: Remove references to struct drm_device.pdev
>       drm/bochs: Remove references to struct drm_device.pdev
>       drm/cirrus: Remove references to struct drm_device.pdev
>       drm/gma500: Fix trailing whitespaces
>       drm/gma500: Remove references to struct drm_device.pdev
>       drm/mgag200: Remove references to struct drm_device.pdev
>       drm/qxl: Remove references to struct drm_device.pdev
>       drm/radeon: Fix trailing whitespaces
>       drm/radeon: Remove references to struct drm_device.pdev
>       drm/vboxvideo: Remove references to struct drm_device.pdev
>       drm/virtgpu: Remove references to struct drm_device.pdev
>       drm/vmwgfx: Remove references to struct drm_device.pdev
>       drm/amdgpu: Fix trailing whitespaces
>       drm/amdgpu: Remove references to struct drm_device.pdev
>       drm/hibmc: Remove references to struct drm_device.pdev
>       drm/nouveau: Remove references to struct drm_device.pdev
>       drm/vc4: Use drm_gem_cma_vmap() directly
>       drm/vc4: Make several BO functions static
>       drm/vc4: Move mmap implementation into GEM object function
>       drm: Inline AGP wrappers into their only callers
>       drm: Implement drm_need_swiotlb() in drm_cache.c
>       drm: Build drm_memory.o only for legacy drivers
>       drm: Merge CONFIG_DRM_VM into CONFIG_DRM_LEGACY
>       drm/radeon: Store PCI controller in struct radeon_device.hose
>       drm: Move struct drm_device.hose to legacy section
>       drm: Include <linux/mem_encrypt.h> in drm_cache.c
>       drm/hisilicon/hibmc: Remove hibmc_ttm.c
>       drm/vc4: Initialize vc4_drm_driver with CMA helper defaults
>       drm: Set vm_ops to GEM object's values during mmap
>       drm: Upcast struct drm_device.dev to struct pci_device; replace pdev
> =

> Tian Tao (4):
>       drm/hisilicon: Use simple encoder
>       drm/hisilicon: Delete the empty function mode_valid
>       drm/hisilicon: Use drm_crtc_mask()
>       drm/hisilicon: Fix build error
> =

> Ville Syrj=E4l=E4 (1):
>       drm/modes: Switch to 64bit maths to avoid integer overflow
> =

> Xiaogang Chen (1):
>       drm: distinguish return value of drm_dp_check_and_send_link_address
> =

> Yue Zou (1):
>       vgaarb: Remove unneeded semicolons
> =

> Zack Rusin (7):
>       drm/vmwgfx: Remove stealth mode
>       drm/vmwgfx: Switch to a managed drm device
>       drm/vmwgfx: Cleanup fifo mmio handling
>       drm/vmwgfx: Cleanup pci resource allocation
>       drm/vmwgfx: Remove the throttling code
>       drm/vmwgfx: Cleanup the cmd/fifo split
>       drm/vmwgfx: Fix display register usage for some older configs
> =

> Zhaoge Zhang (2):
>       drm: Removes invalid function return value comment information
>       drm: Fix macro name DRM_MODE_PROP_OBJECT in code comment
> =

>  .../allwinner,sun4i-a10-display-backend.yaml       |  23 +-
>  .../allwinner,sun4i-a10-display-frontend.yaml      |  19 +-
>  .../bindings/display/allwinner,sun4i-a10-hdmi.yaml |  19 +-
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml |  25 +--
>  .../display/allwinner,sun4i-a10-tv-encoder.yaml    |   6 +-
>  .../bindings/display/allwinner,sun6i-a31-drc.yaml  |  19 +-
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |   6 +-
>  .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |  19 +-
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml      |  19 +-
>  .../display/allwinner,sun8i-r40-tcon-top.yaml      | 110 +---------
>  .../bindings/display/allwinner,sun9i-a80-deu.yaml  |  19 +-
>  .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   4 +-
>  .../bindings/display/amlogic,meson-vpu.yaml        |   4 +-
>  .../bindings/display/brcm,bcm2835-dpi.yaml         |   7 +-
>  .../bindings/display/bridge/analogix,anx7625.yaml  |   6 +-
>  .../bindings/display/bridge/analogix,anx7814.yaml  |  19 +-
>  .../bindings/display/bridge/anx6345.yaml           |  18 +-
>  .../bindings/display/bridge/cdns,mhdp8546.yaml     |  22 +-
>  .../bindings/display/bridge/chrontel,ch7033.yaml   |   6 +-
>  .../bindings/display/bridge/intel,keembay-dsi.yaml |  14 +-
>  .../bindings/display/bridge/ite,it6505.yaml        |   2 +-
>  .../bindings/display/bridge/lontium,lt9611.yaml    |  70 +-----
>  .../bindings/display/bridge/lvds-codec.yaml        |  18 +-
>  .../bindings/display/bridge/nwl-dsi.yaml           |  41 +---
>  .../devicetree/bindings/display/bridge/ps8640.yaml |  24 +--
>  .../bindings/display/bridge/renesas,lvds.yaml      |  18 +-
>  .../bindings/display/bridge/simple-bridge.yaml     |  18 +-
>  .../bindings/display/bridge/snps,dw-mipi-dsi.yaml  |   7 +-
>  .../display/bridge/thine,thc63lvd1024.yaml         |  21 +-
>  .../bindings/display/bridge/ti,sn65dsi86.yaml      |  45 +---
>  .../bindings/display/bridge/ti,tfp410.yaml         |  24 +--
>  .../bindings/display/bridge/toshiba,tc358762.yaml  |  52 +----
>  .../bindings/display/bridge/toshiba,tc358768.yaml  |  48 +----
>  .../bindings/display/bridge/toshiba,tc358775.yaml  |  19 +-
>  .../display/connector/analog-tv-connector.yaml     |   1 +
>  .../bindings/display/connector/dvi-connector.yaml  |   1 +
>  .../bindings/display/connector/hdmi-connector.yaml |   1 +
>  .../bindings/display/connector/vga-connector.yaml  |   1 +
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |   2 +-
>  .../devicetree/bindings/display/ingenic,ipu.yaml   |   5 +-
>  .../devicetree/bindings/display/ingenic,lcd.yaml   |  10 +-
>  .../bindings/display/intel,keembay-display.yaml    |   2 +-
>  .../display/panel/advantech,idk-2121wr.yaml        |  21 +-
>  .../bindings/display/panel/panel-common.yaml       |  11 +-
>  .../bindings/display/panel/samsung,s6e63m0.yaml    |   4 +-
>  .../display/rockchip/rockchip,rk3066-hdmi.yaml     |  16 +-
>  .../bindings/display/rockchip/rockchip-vop.yaml    |   5 +-
>  .../devicetree/bindings/display/st,stm32-dsi.yaml  |  12 +-
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml |   8 +-
>  .../devicetree/bindings/display/ste,mcde.yaml      |   5 +-
>  .../bindings/display/ti/ti,am65x-dss.yaml          |  19 +-
>  .../bindings/display/ti/ti,j721e-dss.yaml          |  23 +-
>  .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |   3 +-
>  Documentation/gpu/vkms.rst                         |  12 ++
>  MAINTAINERS                                        |   1 +
>  drivers/dma-buf/Kconfig                            |   8 +
>  drivers/dma-buf/dma-buf.c                          |  46 +++-
>  drivers/gpu/drm/Kconfig                            |   5 -
>  drivers/gpu/drm/Makefile                           |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  30 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 +-
>  drivers/gpu/drm/ast/ast_drv.c                      |   4 +-
>  drivers/gpu/drm/ast/ast_main.c                     |  25 +--
>  drivers/gpu/drm/ast/ast_mm.c                       |  17 +-
>  drivers/gpu/drm/ast/ast_mode.c                     |   5 +-
>  drivers/gpu/drm/ast/ast_post.c                     |   8 +-
>  drivers/gpu/drm/bochs/bochs_drv.c                  |   1 -
>  drivers/gpu/drm/bochs/bochs_hw.c                   |   4 +-
>  drivers/gpu/drm/drm_agpsupport.c                   |  67 ++----
>  drivers/gpu/drm/drm_bufs.c                         |   4 +-
>  drivers/gpu/drm/drm_cache.c                        |  33 +++
>  drivers/gpu/drm/drm_dp_helper.c                    |   3 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c              |   2 +-
>  drivers/gpu/drm/drm_drv.c                          |   3 +
>  drivers/gpu/drm/drm_edid.c                         |   7 +-
>  drivers/gpu/drm/drm_file.c                         |   5 +-
>  drivers/gpu/drm/drm_gem.c                          |  19 +-
>  drivers/gpu/drm/drm_irq.c                          |  12 +-
>  drivers/gpu/drm/drm_legacy.h                       |   2 +-
>  drivers/gpu/drm/drm_memory.c                       |  51 -----
>  drivers/gpu/drm/drm_modes.c                        |   4 +-
>  drivers/gpu/drm/drm_pci.c                          |  26 ++-
>  drivers/gpu/drm/drm_prime.c                        |   2 +
>  drivers/gpu/drm/drm_vblank.c                       |   2 +-
>  drivers/gpu/drm/drm_vm.c                           |   2 +-
>  drivers/gpu/drm/gma500/cdv_device.c                |  30 ++-
>  drivers/gpu/drm/gma500/cdv_intel_crt.c             |   5 +-
>  drivers/gpu/drm/gma500/cdv_intel_display.c         |   2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c              |   4 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  11 +-
>  drivers/gpu/drm/gma500/framebuffer.c               |  15 +-
>  drivers/gpu/drm/gma500/gem.c                       |   6 +-
>  drivers/gpu/drm/gma500/gem.h                       |   2 +
>  drivers/gpu/drm/gma500/gma_device.c                |   4 +-
>  drivers/gpu/drm/gma500/gma_display.c               |  12 +-
>  drivers/gpu/drm/gma500/gtt.c                       |  20 +-
>  drivers/gpu/drm/gma500/intel_bios.c                |   8 +-
>  drivers/gpu/drm/gma500/intel_gmbus.c               |   4 +-
>  drivers/gpu/drm/gma500/intel_i2c.c                 |   5 +-
>  drivers/gpu/drm/gma500/mdfld_device.c              |   4 +-
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |   8 +-
>  drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   4 +-
>  drivers/gpu/drm/gma500/mdfld_intel_display.c       |   6 +-
>  drivers/gpu/drm/gma500/mid_bios.c                  |   9 +-
>  drivers/gpu/drm/gma500/mmu.c                       |  15 +-
>  drivers/gpu/drm/gma500/oaktrail_crtc.c             |   6 +-
>  drivers/gpu/drm/gma500/oaktrail_device.c           |   5 +-
>  drivers/gpu/drm/gma500/oaktrail_lvds.c             |   5 +-
>  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |  10 +-
>  drivers/gpu/drm/gma500/opregion.c                  |   3 +-
>  drivers/gpu/drm/gma500/power.c                     |  21 +-
>  drivers/gpu/drm/gma500/psb_drv.c                   |  16 +-
>  drivers/gpu/drm/gma500/psb_drv.h                   |   8 +-
>  drivers/gpu/drm/gma500/psb_intel_display.c         |   2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c            |   7 +-
>  drivers/gpu/drm/gma500/psb_intel_modes.c           |   3 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   8 +-
>  drivers/gpu/drm/gma500/psb_irq.c                   |   3 +-
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |  36 ++--
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  13 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  18 +-
>  drivers/gpu/drm/mga/mga_ioc32.c                    |  14 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |  20 +-
>  drivers/gpu/drm/mgag200/mgag200_i2c.c              |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_mm.c               |  10 +-
>  drivers/gpu/drm/nouveau/dispnv04/arb.c             |  12 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |   5 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.h            |  14 +-
>  drivers/gpu/drm/nouveau/dispnv04/hw.c              |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c            |   7 +-
>  drivers/gpu/drm/nouveau/nouveau_acpi.c             |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.c             |  11 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |   5 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c            |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_vga.c              |  20 +-
>  drivers/gpu/drm/panel/panel-simple.c               |   2 +
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   1 +
>  drivers/gpu/drm/qxl/qxl_drv.c                      |   2 +-
>  drivers/gpu/drm/qxl/qxl_ioctl.c                    |   3 +-
>  drivers/gpu/drm/qxl/qxl_irq.c                      |   3 +-
>  drivers/gpu/drm/qxl/qxl_kms.c                      |   1 -
>  drivers/gpu/drm/r128/r128_ioc32.c                  |  14 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c         |   6 +-
>  drivers/gpu/drm/radeon/r100.c                      |  27 ++-
>  drivers/gpu/drm/radeon/radeon.h                    |  35 +--
>  drivers/gpu/drm/radeon/radeon_atombios.c           |  89 ++++----
>  drivers/gpu/drm/radeon/radeon_bios.c               |   6 +-
>  drivers/gpu/drm/radeon/radeon_combios.c            |  55 ++---
>  drivers/gpu/drm/radeon/radeon_cs.c                 |   3 +-
>  drivers/gpu/drm/radeon/radeon_device.c             |  17 +-
>  drivers/gpu/drm/radeon/radeon_display.c            |   2 +-
>  drivers/gpu/drm/radeon/radeon_drv.c                |   7 +-
>  drivers/gpu/drm/radeon/radeon_fb.c                 |   2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c                |   6 +-
>  drivers/gpu/drm/radeon/radeon_i2c.c                |   2 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c            |   2 +-
>  drivers/gpu/drm/radeon/radeon_kms.c                |  24 ++-
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   6 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c                |   2 +-
>  drivers/gpu/drm/radeon/rs780_dpm.c                 |   7 +-
>  drivers/gpu/drm/scheduler/sched_main.c             |   3 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  21 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h                 |   1 +
>  drivers/gpu/drm/sun4i/sun8i_csc.c                  | 109 ++++------
>  drivers/gpu/drm/sun4i/sun8i_mixer.h                |   6 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   2 +
>  drivers/gpu/drm/tiny/cirrus.c                      |   1 -
>  drivers/gpu/drm/ttm/ttm_bo.c                       |   4 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                      |   4 +-
>  drivers/gpu/drm/v3d/v3d_irq.c                      |   7 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c               |  11 +-
>  drivers/gpu/drm/vboxvideo/vbox_irq.c               |   4 +-
>  drivers/gpu/drm/vboxvideo/vbox_main.c              |   8 +-
>  drivers/gpu/drm/vboxvideo/vbox_ttm.c               |   7 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                       | 111 ++--------
>  drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |   8 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c               |   1 -
>  drivers/gpu/drm/virtio/virtgpu_gem.c               |   8 +-
>  drivers/gpu/drm/virtio/virtgpu_vram.c              |   1 +
>  drivers/gpu/drm/vkms/vkms_drv.c                    |  49 ++++-
>  drivers/gpu/drm/vkms/vkms_drv.h                    |  12 +-
>  drivers/gpu/drm/vkms/vkms_output.c                 |  13 +-
>  drivers/gpu/drm/vmwgfx/Makefile                    |   6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |  52 ++---
>  .../gpu/drm/vmwgfx/{vmwgfx_fifo.c =3D> vmwgfx_cmd.c} | 126 ++++++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |  22 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |  40 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |  12 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                | 235 ++++++++++-----=
------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  93 +++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  22 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |  12 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  28 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c                |   8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |  15 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  74 +++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   9 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_marker.c             | 155 --------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |  16 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  28 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |  24 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |   8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  32 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |   8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |  40 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   6 +-
>  drivers/pci/pci.c                                  |  12 +-
>  drivers/pci/pci.h                                  |   1 -
>  drivers/video/fbdev/omap2/omapfb/displays/Kconfig  |   1 +
>  include/drm/drm_agpsupport.h                       |  18 --
>  include/drm/drm_crtc.h                             |   2 +-
>  include/drm/drm_device.h                           |   9 +-
>  include/drm/drm_mipi_dbi.h                         |   2 +-
>  include/drm/drm_property.h                         |   2 +-
>  include/drm/ttm/ttm_resource.h                     |   4 +
>  include/linux/dma-buf.h                            |   6 +
>  include/linux/pci.h                                |   9 +
>  include/linux/vgaarb.h                             |   6 +-
>  include/uapi/drm/drm_fourcc.h                      |   4 +-
>  229 files changed, 1500 insertions(+), 2273 deletions(-)
>  rename drivers/gpu/drm/vmwgfx/{vmwgfx_fifo.c =3D> vmwgfx_cmd.c} (82%)
>  delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_marker.c
> _______________________________________________
> dim-tools mailing list
> dim-tools@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dim-tools

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
