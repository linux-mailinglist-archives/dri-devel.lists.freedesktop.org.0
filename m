Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E0D75793B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 12:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DAF10E0C7;
	Tue, 18 Jul 2023 10:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F2410E151
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 10:25:34 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-56475c1b930so667132eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1689675933; x=1690280733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIfryJeTpeZq506wmEnwF74xKBPmdRwf1QCI0KOt3lQ=;
 b=kygXtQ2onqov8uQ6Qw8SjRVBbfsCGBAsfZWKYVSG3iuww4oHVDMAQJg0rLcFhsgAOH
 Ftm27nLbJXT2VjCoqgPBCpucWtv0cezGJnyHCWMEQMPEWJn7okRX6HbwXjOUl82TTv3A
 p14a50AZe0UsqLRKboOL9Z7uADNJnHpctuopM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689675933; x=1690280733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIfryJeTpeZq506wmEnwF74xKBPmdRwf1QCI0KOt3lQ=;
 b=kgw9lReLRweWp7wnwQSXOIk72+EaSH+MdtZYUJi5hq4J5yJpoiFVg01HrzwjJqGtpE
 W0FNaFzC/kko6ng/w+nmlyQKAUeI/JW6R2kjLnzHlD0aVhXFpnsQpgkCst5WI6nyCdIH
 qEk1woOlLVW5kzLPJshd9b1InR3JClq3w1M80Gmij3yTgF4kRd4JuoKrKa+KcAoN4FuS
 kg3RhEc3rUIuJnRj5PN98a2isHPD+EEBIel+jwmRESVuzw/I5hPSiEi0AfSj3GYFgwwN
 qm2oTfJiAMMWTNMX29P2hpOowv8CqcFNtfa7iFvPZ2mHPuYkqIDi83CJSEkgHt0+76P8
 w88w==
X-Gm-Message-State: ABy/qLYUYbtdlZvGIXX2ZEMpFXGn4pwpk3VNzT1XTu9yQkywFddVp0vV
 oRgNg1/bPPeikKE7DT+IvJ3AHHgcB9krlYM0S9tVVA==
X-Google-Smtp-Source: APBJJlGu5cU7r6pU97IJjFxN17g/xDCHG9R0NDvDpV0qC5DhbHET0iffnpQhrCEmhGKl46y/LskmrPeHJFFHuIDUDMM=
X-Received: by 2002:a05:6808:208f:b0:3a3:c78e:d865 with SMTP id
 s15-20020a056808208f00b003a3c78ed865mr8056967oiw.1.1689675932680; Tue, 18 Jul
 2023 03:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230713090830.GA23281@linux-uq9g>
In-Reply-To: <20230713090830.GA23281@linux-uq9g>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 18 Jul 2023 12:25:21 +0200
Message-ID: <CAKMK7uFXYVbknfRgC9Heqziu6TZ75FeKV=vE3BjJXs-3r=HMrw@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 11:08, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi Dave and Daniel,
>
> this is the main pull request for drm-misc-next for what will become
> Linux v6.6. Some noteworthy changes are:
>
>  * GEM got execution contexts that help with locking multiple GEM
>    objects at once.
>
>  * All DRM drivers can now self-import their own dma-bufs by default.
>    This enables wlroots-based Wayland compositors to run on drivers
>    that do not implement full PRIME support.
>
>  * Fbdev userspace interfaces are fully optional. Hopefully distros
>    will switch them off by default.
>
>  * There's a new driver for Loongson display controllers.
>
> And of course, there's the usual number of updates, fixes and smaller
> improvements throughout the DRM subsystem.
>
> Best regards
> Thomas
>
> drm-misc-next-2023-07-13:
> drm-misc-next for v6.6:
>
> UAPI Changes:
>
>  * fbdev:
>    * Make fbdev userspace interfaces optional; only leaves the
>      framebuffer console active
>
>  * prime:
>    * Support dma-buf self-import for all drivers automatically: improves
>      support for many userspace compositors
>
> Cross-subsystem Changes:
>
>  * backlight:
>    * Fix interaction with fbdev in several drivers
>
>  * base: Convert struct platform.remove to return void; part of a larger,
>    tree-wide effort
>
>  * dma-buf: Acquire reservation lock for mmap() in exporters; part
>    of an on-going effort to simplify locking around dma-bufs
>
>  * fbdev:
>    * Use Linux device instead of fbdev device in many places
>    * Use deferred-I/O helper macros in various drivers
>
>  * i2c: Convert struct i2c from .probe_new to .probe; part of a larger,
>    tree-wide effort
>
>  * video:
>    * Avoid including <linux/screen_info.h>
>
> Core Changes:
>
>  * atomic:
>    * Improve logging
>
>  * prime:
>    * Remove struct drm_driver.gem_prime_mmap plus driver updates: all
>      drivers now implement this callback with drm_gem_prime_mmap()
>
>  * gem:
>    * Support execution contexts: provides locking over multiple GEM
>      objects
>
>  * ttm:
>    * Support init_on_free
>    * Swapout fixes
>
> Driver Changes:
>
>  * accel:
>    * ivpu: MMU updates; Support debugfs
>
>  * ast:
>    * Improve device-model detection
>    * Cleanups
>
>  * bridge:
>    * dw-hdmi: Improve support for YUV420 bus format
>    * dw-mipi-dsi: Fix enable/disable of DSI controller
>    * lt9611uxc: Use MODULE_FIRMWARE()
>    * ps8640: Remove broken EDID code
>    * samsung-dsim: Fix command transfer
>    * tc358764: Handle HS/VS polarity; Use BIT() macro; Various cleanups
>    * Cleanups
>
>  * ingenic:
>    * Kconfig REGMAP fixes
>
>  * loongson:
>    * Support display controller
>
>  * mgag200:
>    * Minor fixes
>
>  * mxsfb:
>    * Support disabling overlay planes
>
>  * nouveau:
>    * Improve VRAM detection
>    * Various fixes and cleanups
>
>  * panel:
>    * panel-edp: Support AUO B116XAB01.4
>    * Support Visionox R66451 plus DT bindings
>    * Cleanups
>
>  * ssd130x:
>    * Support per-controller default resolution plus DT bindings
>    * Reduce memory-allocation overhead
>    * Cleanups
>
>  * tidss:
>    * Support TI AM625 plus DT bindings
>    * Implement new connector model plus driver updates
>
>  * vkms
>    * Improve write-back support
>    * Documentation fixes
> The following changes since commit 2222dcb0775d36de28992f56455ab3967b30d3=
80:
>
>   Merge tag 'drm-msm-next-2023-06-18' of https://gitlab.freedesktop.org/d=
rm/msm into drm-next (2023-06-19 16:01:46 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-07-1=
3

... forgot to reply. Pulled, thanks a lot!


>
> for you to fetch changes up to 36672dda2eb715af99e9abbcdc400d46598b691c:
>
>   drm/loongson: Remove a useless check in cursor_plane_atomic_async_check=
() (2023-07-13 01:24:42 +0800)
>
> ----------------------------------------------------------------
> drm-misc-next for v6.6:
>
> UAPI Changes:
>
>  * fbdev:
>    * Make fbdev userspace interfaces optional; only leaves the
>      framebuffer console active
>
>  * prime:
>    * Support dma-buf self-import for all drivers automatically: improves
>      support for many userspace compositors
>
> Cross-subsystem Changes:
>
>  * backlight:
>    * Fix interaction with fbdev in several drivers
>
>  * base: Convert struct platform.remove to return void; part of a larger,
>    tree-wide effort
>
>  * dma-buf: Acquire reservation lock for mmap() in exporters; part
>    of an on-going effort to simplify locking around dma-bufs
>
>  * fbdev:
>    * Use Linux device instead of fbdev device in many places
>    * Use deferred-I/O helper macros in various drivers
>
>  * i2c: Convert struct i2c from .probe_new to .probe; part of a larger,
>    tree-wide effort
>
>  * video:
>    * Avoid including <linux/screen_info.h>
>
> Core Changes:
>
>  * atomic:
>    * Improve logging
>
>  * prime:
>    * Remove struct drm_driver.gem_prime_mmap plus driver updates: all
>      drivers now implement this callback with drm_gem_prime_mmap()
>
>  * gem:
>    * Support execution contexts: provides locking over multiple GEM
>      objects
>
>  * ttm:
>    * Support init_on_free
>    * Swapout fixes
>
> Driver Changes:
>
>  * accel:
>    * ivpu: MMU updates; Support debugfs
>
>  * ast:
>    * Improve device-model detection
>    * Cleanups
>
>  * bridge:
>    * dw-hdmi: Improve support for YUV420 bus format
>    * dw-mipi-dsi: Fix enable/disable of DSI controller
>    * lt9611uxc: Use MODULE_FIRMWARE()
>    * ps8640: Remove broken EDID code
>    * samsung-dsim: Fix command transfer
>    * tc358764: Handle HS/VS polarity; Use BIT() macro; Various cleanups
>    * Cleanups
>
>  * ingenic:
>    * Kconfig REGMAP fixes
>
>  * loongson:
>    * Support display controller
>
>  * mgag200:
>    * Minor fixes
>
>  * mxsfb:
>    * Support disabling overlay planes
>
>  * nouveau:
>    * Improve VRAM detection
>    * Various fixes and cleanups
>
>  * panel:
>    * panel-edp: Support AUO B116XAB01.4
>    * Support Visionox R66451 plus DT bindings
>    * Cleanups
>
>  * ssd130x:
>    * Support per-controller default resolution plus DT bindings
>    * Reduce memory-allocation overhead
>    * Cleanups
>
>  * tidss:
>    * Support TI AM625 plus DT bindings
>    * Implement new connector model plus driver updates
>
>  * vkms
>    * Improve write-back support
>    * Documentation fixes
>
> ----------------------------------------------------------------
> Adri=C3=A1n Larumbe (3):
>       drm/bridge: dw-hdmi: change YUV420 selection logic at clock setup
>       drm/bridge: dw-hdmi: truly enforce 420-only formats when drm mode d=
emands it
>       drm/bridge: dw-hdmi: remove dead code and fix indentation
>
> Andrzej Kacprowski (1):
>       accel/ivpu: Print firmware name and version
>
> Aradhya Bhatia (5):
>       dt-bindings: display: ti,am65x-dss: Add am625 dss compatible
>       drm/tidss: Add support for AM625 DSS
>       drm/bridge: sii902x: Support format negotiation hooks
>       drm/bridge: sii902x: Set input_bus_flags in atomic_check
>       drm/tidss: Update encoder/bridge chain connect model
>
> Ben Skeggs (10):
>       drm/nouveau/nvkm: fini object children in reverse order
>       drm/nouveau/nvkm: punt spurious irq messages to debug level
>       drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection m=
ethod
>       drm/nouveau/fb/ga102-: construct vidmem heap via new gp102 paths
>       drm/nouveau/fifo: remove left-over references to nvkm_fifo_chan
>       drm/nouveau/fifo: return ERR_PTR from nvkm_runl_new()
>       drm/nouveau/fifo/ga100-: remove individual runlists rather than fai=
ling oneinit
>       drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling
>       drm/nouveau/nvif: fix potential double-free
>       drm/nouveau/kms: don't call drm_dp_cec_set_edid() on TMDS
>
> Carlos Eduardo Gallo Filho (1):
>       drm/tests: Fix swapped drm_framebuffer tests parameter names
>
> Christian K=C3=B6nig (6):
>       drm: execution context for GEM buffers v7
>       drm: add drm_exec selftests v4
>       drm/amdkfd: switch over to using drm_exec v3
>       drm/amdgpu: use drm_exec for GEM and CSA handling v2
>       drm/amdgpu: use drm_exec for MES testing
>       drm/amdgpu: use the new drm_exec object for CS v3
>
> Christophe JAILLET (2):
>       accel/ivpu: Use struct_size()
>       drm/bridge: tc358767: Use devm_clk_get_enabled() helper
>
> Colin Ian King (1):
>       drm/edid: make read-only const array static
>
> Dmitry Osipenko (6):
>       media: videobuf2: Don't assert held reservation lock for dma-buf mm=
apping
>       dma-buf/heaps: Don't assert held reservation lock for dma-buf mmapp=
ing
>       udmabuf: Don't assert held reservation lock for dma-buf mmapping
>       drm: Don't assert held reservation lock for dma-buf mmapping
>       dma-buf: Change locking policy for mmap()
>       drm/shmem-helper: Switch to reservation lock
>
> Douglas Anderson (1):
>       drm/bridge: ps8640: Drop the ability of ps8640 to fetch the EDID
>
> Gurchetan Singh (1):
>       drm/virtio: Conditionally allocate virtio_gpu_fence
>
> Javier Martinez Canillas (6):
>       drm/ssd130x: Make default width and height to be controller depende=
nt
>       dt-bindings: display: ssd1307fb: Remove default width and height va=
lues
>       drm/ssd130x: Set the page height value in the device info data
>       drm/ssd130x: Don't allocate buffers on each plane update
>       drm/ssd130x: Remove hardcoded bits-per-pixel in ssd130x_buf_alloc()
>       drm/arm: Make ARM devices menu depend on DRM
>
> Jeffrey Hugo (1):
>       MAINTAINERS: Remove Liam Mark from DMA-BUF HEAPS FRAMEWORK
>
> Jessica Zhang (2):
>       dt-bindings: display: panel: Add Visionox R66451 AMOLED DSI panel
>       drm/panel: Add driver for Visionox r66451 panel
>
> Jocelyn Falempe (1):
>       MAINTAINERS: Add myself as reviewer for mgag200 and ast drivers
>
> John Stultz (2):
>       MAINTAINERS: Add T.J. Mercier as reviewer for DMA-BUF HEAPS FRAMEWO=
RK
>       MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS FRAMEWORK
>
> Juerg Haefliger (1):
>       drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
>
> Julia Lawall (1):
>       drm/gud: use vmalloc_array and vcalloc
>
> Karol Herbst (1):
>       drm/nouveau/disp: drop unused argument in nv50_dp_mode_valid
>
> Karol Wachowski (5):
>       accel/ivpu: Remove configuration of MMU TBU1 and TBU3
>       accel/ivpu: Add MMU support for 4 level page mappings
>       accel/ivpu: Make DMA bit mask HW specific
>       accel/ivpu: Rename and cleanup MMU600 page tables
>       accel/ivpu: Mark 64 kB contiguous areas as contiguous in PTEs
>
> Krystian Pradzynski (1):
>       accel/ivpu: Add fw_name file to debugfs
>
> Laura Nao (1):
>       drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
>
> Liu Ying (1):
>       drm/mxsfb: Disable overlay plane in mxsfb_plane_overlay_atomic_disa=
ble()
>
> Marek Vasut (8):
>       drm/bridge: tc358764: Fix debug print parameter order
>       drm/bridge: tc358764: Use BIT() macro for actual bits
>       drm/bridge: tc358762: Split register programming from pre-enable to=
 enable
>       drm/bridge: tc358762: Switch to atomic ops
>       drm/bridge: tc358762: Instruct DSI host to generate HSE packets
>       drm/bridge: tc358762: Guess the meaning of LCDCTRL bits
>       drm/bridge: tc358762: Handle HS/VS polarity
>       drm: bridge: samsung-dsim: Drain command transfer FIFO before trans=
fer
>
> Ma=C3=ADra Canal (5):
>       drm/vkms: Add kernel-doc to the function vkms_compose_row()
>       drm/vkms: Fix all kernel-doc warnings of the vkms_composer file
>       drm/vkms: Reduce critical section
>       drm/vkms: Enable ARGB8888 support for writeback
>       drm/vkms: Isolate writeback pixel conversion functions
>
> Nikhil Devshatwar (5):
>       drm/bridge: tfp410: Support format negotiation hooks
>       drm/bridge: tfp410: Set input_bus_flags in atomic_check
>       drm/bridge: mhdp8546: Add minimal format negotiation
>       drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
>       drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable
>
> Ondrej Jirman (1):
>       drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller
>
> Rajneesh Bhardwaj (1):
>       drm/ttm: Use init_on_free to delay release TTM BOs
>
> Ralph Campbell (1):
>       drm/edid: Add quirk for OSVR HDK 2.0
>
> Simon Ser (13):
>       drm: fix code style for embedded structs in hdr_metadata_infoframe
>       drm/sysfs: rename drm_sysfs_connector_status_event()
>       drm/bridge_connector: use drm_kms_helper_connector_hotplug_event()
>       drm/atomic: log drm_atomic_replace_property_blob_from_id() errors
>       drm/atomic: drop extra bracket from log messages
>       drm/atomic: log when getting/setting unknown properties
>       drm/atomic: log when CRTC_ID prop value is invalid
>       drm/atomic: log on attempt to set legacy DPMS property
>       drm/atomic: log when page-flip is requested without CRTCs
>       drm/atomic: log errors in drm_mode_atomic_ioctl()
>       drm/kms: log when querying an object not included in lease
>       nouveau/dispnv50: add cursor pitch check
>       drm/nouveau/disp: use drm_kms_helper_connector_hotplug_event()
>
> Stanislaw Gruszka (3):
>       accel/ivpu: Initial debugfs support
>       accel/ivpu: Add firmware tracing support
>       accel/ivpu: Add debugfs files for testing device reset
>
> Sui Jingfeng (6):
>       drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
>       drm/drm_gem.c: Remove surplus else after return
>       drm: Add kms driver for loongson display controller
>       MAINTAINERS: add maintainers for DRM LOONGSON driver
>       drm/hyperv: Fix a compilation issue because of not including screen=
_info.h
>       drm/loongson: Remove a useless check in cursor_plane_atomic_async_c=
heck()
>
> Thomas Hellstr=C3=B6m (1):
>       drm/ttm: Don't shadow the operation context
>
> Thomas Zimmermann (74):
>       drm/msm: Initialize mmap offset after constructing the buffer objec=
t
>       drm: Remove struct drm_driver.gem_prime_mmap
>       Merge drm/drm-next into drm-misc-next
>       drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
>       drm: Enable PRIME import/export for all drivers
>       drm: Clear fd/handle callbacks in struct drm_driver
>       drm/prime: Unexport helpers for fd/handle conversion
>       backlight/bd6107: Compare against struct fb_info.device
>       backlight/bd6107: Rename struct bd6107_platform_data.fbdev to 'dev'
>       backlight/gpio_backlight: Compare against struct fb_info.device
>       backlight/gpio_backlight: Rename field 'fbdev' to 'dev'
>       backlight/lv5207lp: Compare against struct fb_info.device
>       backlight/lv5207lp: Rename struct lv5207lp_platform_data.fbdev to '=
dev'
>       fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
>       fbdev/atyfb: Use hardware device as backlight parent
>       fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
>       fbdev/aty128fb: Use hardware device as backlight parent
>       fbdev/broadsheetfb: Call device_remove_file() with hardware device
>       fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>       fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
>       fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
>       fbdev/fsl-diu-fb: Output messages with fb_*() helpers
>       fbdev/mb862xxfb: Output messages with fb_dbg()
>       fbdev/metronomefb: Use hardware device for dev_err()
>       fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
>       fbdev/nvidiafb: Use hardware device as backlight parent
>       fbdev/pxa168fb: Do not assign to struct fb_info.dev
>       fbdev/radeonfb: Reorder backlight and framebuffer cleanup
>       fbdev/radeonfb: Use hardware device as backlight parent
>       fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
>       fbdev/rivafb: Use hardware device as backlight parent
>       fbdev/sh7760fb: Use fb_dbg() in sh7760fb_get_color_info()
>       fbdev/sh7760fb: Output messages with fb_dbg()
>       fbdev/sh7760fb: Alloc DMA memory from hardware device
>       fbdev/sh7760fb: Use hardware device with dev_() output during probe
>       fbdev/sm501fb: Output message with fb_err()
>       fbdev/smscufx: Detect registered fb_info from refcount
>       fbdev/tdfxfb: Set i2c adapter parent to hardware device
>       fbdev/core: Pass Linux device to pm_vt_switch_*() functions
>       fbdev/core: Move framebuffer and backlight helpers into separate fi=
les
>       fbdev/core: Add fb_device_{create,destroy}()
>       fbdev/core: Move procfs code to separate file
>       fbdev/core: Move file-I/O code into separate file
>       fbdev/core: Rework fb init code
>       fbdev: Make support for userspace interfaces configurable
>       drm/ast: Fix DRAM init on AST2200
>       drm/ast: Remove vga2_clone field
>       drm/ast: Implement register helpers in ast_drv.h
>       drm/ast: Remove dead else branch in POST code
>       drm/ast: Remove device POSTing and config from chip detection
>       drm/ast: Set PCI config before accessing I/O registers
>       drm/ast: Enable and unlock device access early during init
>       drm/ast: Set up release action right after enabling MMIO
>       drm/ast: Distinguish among chip generations
>       drm/ast: Detect AST 1300 model
>       drm/ast: Detect AST 1400 model
>       drm/ast: Detect AST 2510 model
>       drm/ast: Move widescreen and tx-chip detection into separate helper=
s
>       drm/ast: Merge config and chip detection
>       efi: Do not include <linux/screen_info.h> from EFI header
>       fbdev/sm712fb: Do not include <linux/screen_info.h>
>       sysfb: Do not include <linux/screen_info.h> from sysfb header
>       staging/sm750fb: Do not include <linux/screen_info.h>
>       fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
>       fbdev/broadsheetfb: Generate deferred I/O ops
>       fbdev/hecubafb: Select FB_SYS_HELPERS_DEFERRED
>       fbdev/hecubafb: Generate deferred I/O ops
>       fbdev/metronomefb: Select FB_SYS_HELPERS_DEFERRED
>       fbdev/metronomefb: Generate deferred I/O ops
>       fbdev/ssd1307fb: Select FB_SYS_HELPERS_DEFERRED
>       fbdev/ssd1307fb: Generate deferred I/O ops
>       fbdev/xen-fbfront: Select FB_SYS_HELPERS_DEFERRED
>       fbdev/xen-fbfront: Generate deferred I/O ops
>       fbdev/hyperv_fb: Include <linux/screen_info.h>
>
> Tom Rix (1):
>       drm/mgag200: set variable mgag200_modeset storage-class-specifier t=
o static
>
> Tomi Valkeinen (1):
>       MAINTAINERS: Update info for TI display drivers
>
> Uwe Kleine-K=C3=B6nig (28):
>       drm/komeda: Convert to platform remove callback returning void
>       drm/arm/hdlcd: Convert to platform remove callback returning void
>       drm/arm/malidp: Convert to platform remove callback returning void
>       drm/aspeed: Convert to platform remove callback returning void
>       drm/atmel-hlcdc: Convert to platform remove callback returning void
>       drm/fsl-dcu: Convert to platform remove callback returning void
>       drm/hisilicon: Convert to platform remove callback returning void
>       drm/lima: Convert to platform remove callback returning void
>       drm/logicvc: Convert to platform remove callback returning void
>       drm/mcde: Convert to platform remove callback returning void
>       drm/meson: Convert to platform remove callback returning void
>       drm/mxsfb: Convert to platform remove callback returning void
>       drm/panel: Convert to platform remove callback returning void
>       drm/panfrost: Convert to platform remove callback returning void
>       drm/rockchip: Convert to platform remove callback returning void
>       drm/sti: Convert to platform remove callback returning void
>       drm/stm: Convert to platform remove callback returning void
>       drm/sun4i: Convert to platform remove callback returning void
>       drm/tidss: Convert to platform remove callback returning void
>       drm/tiny: Convert to platform remove callback returning void
>       drm/tve200: Convert to platform remove callback returning void
>       drm/v3d: Convert to platform remove callback returning void
>       drm/vc4: Convert to platform remove callback returning void
>       drm/xlnx/zynqmp_dpsub: Convert to platform remove callback returnin=
g void
>       drm/rcar-du: Convert to platform remove callback returning void
>       drm/tilcdc: Convert to platform remove callback returning void
>       drm/omap: Convert to platform remove callback returning void
>       drm/i2c: Switch i2c drivers back to use .probe()
>
> Wang Jianzheng (1):
>       drm/panel: s6d7aa0: remove the unneeded variable in s6d7aa0_lock
>
>  .../bindings/display/panel/visionox,r66451.yaml    |   59 ++
>  .../bindings/display/solomon,ssd1307fb.yaml        |   28 +-
>  .../bindings/display/ti/ti,am65x-dss.yaml          |   18 +-
>  Documentation/gpu/drm-mm.rst                       |   12 +
>  Documentation/gpu/todo.rst                         |   22 +-
>  MAINTAINERS                                        |   20 +-
>  arch/arm/kernel/efi.c                              |    2 +
>  arch/arm64/kernel/efi.c                            |    1 +
>  arch/loongarch/kernel/efi.c                        |    1 +
>  arch/sh/boards/mach-ecovec24/setup.c               |    2 +-
>  arch/sh/boards/mach-kfr2r09/setup.c                |    2 +-
>  drivers/accel/ivpu/Makefile                        |    4 +-
>  drivers/accel/ivpu/ivpu_debugfs.c                  |  294 ++++++
>  drivers/accel/ivpu/ivpu_debugfs.h                  |   13 +
>  drivers/accel/ivpu/ivpu_drv.c                      |   16 +-
>  drivers/accel/ivpu/ivpu_drv.h                      |    1 +
>  drivers/accel/ivpu/ivpu_fw.c                       |   68 +-
>  drivers/accel/ivpu/ivpu_fw.h                       |    4 +
>  drivers/accel/ivpu/ivpu_fw_log.c                   |  142 +++
>  drivers/accel/ivpu/ivpu_fw_log.h                   |   38 +
>  drivers/accel/ivpu/ivpu_hw.h                       |    1 +
>  drivers/accel/ivpu/ivpu_hw_mtl.c                   |   19 +-
>  drivers/accel/ivpu/ivpu_job.c                      |    4 +-
>  drivers/accel/ivpu/ivpu_mmu.c                      |   14 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c              |  294 ++++--
>  drivers/accel/ivpu/ivpu_mmu_context.h              |    9 +-
>  drivers/accel/ivpu/ivpu_pm.c                       |    1 +
>  drivers/accel/ivpu/ivpu_pm.h                       |    1 +
>  drivers/accel/qaic/qaic_drv.c                      |    1 -
>  drivers/dma-buf/dma-buf.c                          |   17 +-
>  drivers/dma-buf/heaps/cma_heap.c                   |    3 -
>  drivers/dma-buf/heaps/system_heap.c                |    3 -
>  drivers/dma-buf/udmabuf.c                          |    2 -
>  drivers/firmware/efi/libstub/efi-stub-entry.c      |    2 +
>  drivers/firmware/efi/libstub/screen_info.c         |    2 +
>  drivers/gpu/drm/Kconfig                            |    9 +
>  drivers/gpu/drm/Makefile                           |    3 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig                 |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  299 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   71 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  210 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   78 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   81 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   90 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   24 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   49 +-
>  drivers/gpu/drm/arm/Kconfig                        |    1 +
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    5 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c                    |    5 +-
>  drivers/gpu/drm/arm/malidp_drv.c                   |    5 +-
>  drivers/gpu/drm/armada/armada_drv.c                |    2 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    6 +-
>  drivers/gpu/drm/ast/ast_dp501.c                    |    6 +-
>  drivers/gpu/drm/ast/ast_drv.h                      |   94 +-
>  drivers/gpu/drm/ast/ast_main.c                     |  319 +++---
>  drivers/gpu/drm/ast/ast_mm.c                       |    2 -
>  drivers/gpu/drm/ast/ast_mode.c                     |   35 +-
>  drivers/gpu/drm/ast/ast_post.c                     |   74 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    6 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   77 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |    2 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c   |    9 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h   |    2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    6 +-
>  drivers/gpu/drm/bridge/parade-ps8640.c             |   79 --
>  drivers/gpu/drm/bridge/samsung-dsim.c              |    2 +-
>  drivers/gpu/drm/bridge/sii902x.c                   |   40 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   35 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   28 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |   63 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   14 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |   25 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                 |   43 +
>  drivers/gpu/drm/display/drm_hdcp_helper.c          |    4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c                  |   58 +-
>  drivers/gpu/drm/drm_bridge_connector.c             |    2 +-
>  drivers/gpu/drm/drm_connector.c                    |    8 +-
>  drivers/gpu/drm/drm_edid.c                         |    3 +-
>  drivers/gpu/drm/drm_exec.c                         |  333 +++++++
>  drivers/gpu/drm/drm_fbdev_dma.c                    |    6 +-
>  drivers/gpu/drm/drm_gem.c                          |    4 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c             |  210 ++--
>  drivers/gpu/drm/drm_ioctl.c                        |    3 +-
>  drivers/gpu/drm/drm_mode_object.c                  |    4 +-
>  drivers/gpu/drm/drm_prime.c                        |   83 +-
>  drivers/gpu/drm/drm_sysfs.c                        |   23 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    3 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |    3 -
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    6 +-
>  drivers/gpu/drm/gud/gud_pipe.c                     |    2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    1 -
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    6 +-
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    5 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    1 +
>  drivers/gpu/drm/i2c/ch7006_drv.c                   |    2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                   |    2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    2 -
>  drivers/gpu/drm/i915/i915_driver.c                 |    2 -
>  drivers/gpu/drm/ingenic/Kconfig                    |    2 +
>  drivers/gpu/drm/lima/lima_drv.c                    |    8 +-
>  drivers/gpu/drm/lima/lima_gem.c                    |    8 +-
>  drivers/gpu/drm/logicvc/logicvc_drm.c              |    6 +-
>  drivers/gpu/drm/loongson/Kconfig                   |   17 +
>  drivers/gpu/drm/loongson/Makefile                  |   22 +
>  drivers/gpu/drm/loongson/loongson_device.c         |  102 ++
>  drivers/gpu/drm/loongson/loongson_module.c         |   33 +
>  drivers/gpu/drm/loongson/loongson_module.h         |   12 +
>  drivers/gpu/drm/loongson/lsdc_benchmark.c          |  133 +++
>  drivers/gpu/drm/loongson/lsdc_benchmark.h          |   13 +
>  drivers/gpu/drm/loongson/lsdc_crtc.c               | 1024 ++++++++++++++=
++++++
>  drivers/gpu/drm/loongson/lsdc_debugfs.c            |  110 +++
>  drivers/gpu/drm/loongson/lsdc_drv.c                |  456 +++++++++
>  drivers/gpu/drm/loongson/lsdc_drv.h                |  388 ++++++++
>  drivers/gpu/drm/loongson/lsdc_gem.c                |  311 ++++++
>  drivers/gpu/drm/loongson/lsdc_gem.h                |   37 +
>  drivers/gpu/drm/loongson/lsdc_gfxpll.c             |  199 ++++
>  drivers/gpu/drm/loongson/lsdc_gfxpll.h             |   52 +
>  drivers/gpu/drm/loongson/lsdc_i2c.c                |  179 ++++
>  drivers/gpu/drm/loongson/lsdc_i2c.h                |   29 +
>  drivers/gpu/drm/loongson/lsdc_irq.c                |   74 ++
>  drivers/gpu/drm/loongson/lsdc_irq.h                |   16 +
>  drivers/gpu/drm/loongson/lsdc_output.h             |   21 +
>  drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |  178 ++++
>  drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |  552 +++++++++++
>  drivers/gpu/drm/loongson/lsdc_pixpll.c             |  481 +++++++++
>  drivers/gpu/drm/loongson/lsdc_pixpll.h             |   86 ++
>  drivers/gpu/drm/loongson/lsdc_plane.c              |  793 ++++++++++++++=
+
>  drivers/gpu/drm/loongson/lsdc_probe.c              |   56 ++
>  drivers/gpu/drm/loongson/lsdc_probe.h              |   12 +
>  drivers/gpu/drm/loongson/lsdc_regs.h               |  406 ++++++++
>  drivers/gpu/drm/loongson/lsdc_ttm.c                |  591 +++++++++++
>  drivers/gpu/drm/loongson/lsdc_ttm.h                |   99 ++
>  drivers/gpu/drm/mcde/mcde_drv.c                    |    6 +-
>  drivers/gpu/drm/mcde/mcde_dsi.c                    |    6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    3 -
>  drivers/gpu/drm/meson/meson_drv.c                  |    6 +-
>  drivers/gpu/drm/meson/meson_dw_hdmi.c              |   10 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 +-
>  drivers/gpu/drm/msm/msm_drv.c                      |    3 -
>  drivers/gpu/drm/msm/msm_drv.h                      |    1 -
>  drivers/gpu/drm/msm/msm_gem.c                      |    8 +
>  drivers/gpu/drm/msm/msm_gem_prime.c                |   15 -
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    6 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    6 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    9 +
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |   25 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 +-
>  drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |    6 +-
>  drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |    5 -
>  .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |    2 +-
>  drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    1 +
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |    7 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c          |   17 +-
>  drivers/gpu/drm/nouveau/nouveau_dp.c               |    3 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |    3 -
>  drivers/gpu/drm/nouveau/nouveau_encoder.h          |    3 +-
>  drivers/gpu/drm/nouveau/nvif/mmu.c                 |    3 +
>  drivers/gpu/drm/nouveau/nvkm/core/intr.c           |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/core/object.c         |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |   10 +
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c     |    1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |    3 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |   32 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   |  105 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c    |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h    |    6 +
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |   15 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c     |    7 +
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   14 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |    1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h      |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h      |    5 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c    |    3 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h    |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |    5 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h    |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c      |    3 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h      |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c     |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |   12 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |    3 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |    9 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |   17 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |    3 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |    5 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h       |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c  |   40 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c  |   30 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c     |    3 +-
>  drivers/gpu/drm/omapdrm/dss/dispc.c                |    5 +-
>  drivers/gpu/drm/omapdrm/dss/dsi.c                  |    6 +-
>  drivers/gpu/drm/omapdrm/dss/dss.c                  |    6 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    5 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    5 +-
>  drivers/gpu/drm/omapdrm/dss/venc.c                 |    5 +-
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    9 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c                 |    8 +-
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |    2 -
>  drivers/gpu/drm/panel/Kconfig                      |    9 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-edp.c                  |    1 +
>  drivers/gpu/drm/panel/panel-lvds.c                 |    6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |    3 +-
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |    6 +-
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |    6 +-
>  drivers/gpu/drm/panel/panel-simple.c               |    6 +-
>  drivers/gpu/drm/panel/panel-visionox-r66451.c      |  390 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |   15 +-
>  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    6 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c            |   19 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |    3 -
>  drivers/gpu/drm/qxl/qxl_drv.c                      |    2 -
>  drivers/gpu/drm/radeon/radeon_drv.c                |    3 -
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c         |    6 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    9 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c     |    6 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    6 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    6 +-
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c   |    6 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    6 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |    6 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    6 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    6 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |    6 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    6 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    9 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |    6 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    6 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    6 +-
>  drivers/gpu/drm/solomon/ssd130x.c                  |  124 ++-
>  drivers/gpu/drm/solomon/ssd130x.h                  |    6 +
>  drivers/gpu/drm/sti/sti_compositor.c               |    5 +-
>  drivers/gpu/drm/sti/sti_drv.c                      |    6 +-
>  drivers/gpu/drm/sti/sti_dvo.c                      |    5 +-
>  drivers/gpu/drm/sti/sti_hda.c                      |    5 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                     |    6 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c                    |    5 +-
>  drivers/gpu/drm/sti/sti_tvout.c                    |    5 +-
>  drivers/gpu/drm/stm/drv.c                          |    6 +-
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c              |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c                  |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_frontend.c             |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    6 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   |    6 +-
>  drivers/gpu/drm/sun4i/sun6i_drc.c                  |    6 +-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |    6 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    6 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                |    6 +-
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |    6 +-
>  drivers/gpu/drm/tegra/drm.c                        |    2 -
>  drivers/gpu/drm/tegra/gem.c                        |    2 -
>  drivers/gpu/drm/tests/Makefile                     |    3 +-
>  drivers/gpu/drm/tests/drm_exec_test.c              |  159 +++
>  drivers/gpu/drm/tests/drm_framebuffer_test.c       |    4 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c                |   57 +-
>  drivers/gpu/drm/tidss/tidss_dispc.h                |    2 +
>  drivers/gpu/drm/tidss/tidss_drv.c                  |    7 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c              |  140 ++-
>  drivers/gpu/drm/tidss/tidss_encoder.h              |    5 +-
>  drivers/gpu/drm/tidss/tidss_kms.c                  |   12 +-
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    6 +-
>  drivers/gpu/drm/tiny/ofdrm.c                       |    6 +-
>  drivers/gpu/drm/tiny/simpledrm.c                   |    6 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
>  drivers/gpu/drm/tve200/tve200_drv.c                |    6 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                      |    9 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |    5 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                      |    5 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                      |    6 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |    6 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |    5 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c                      |    5 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                      |    5 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                      |    5 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                      |    5 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c               |    3 -
>  drivers/gpu/drm/virtio/virtgpu_submit.c            |   32 +-
>  drivers/gpu/drm/vkms/vkms_composer.c               |   10 +-
>  drivers/gpu/drm/vkms/vkms_drv.h                    |    4 +-
>  drivers/gpu/drm/vkms/vkms_formats.c                |  153 ++-
>  drivers/gpu/drm/vkms/vkms_formats.h                |    2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c              |    9 +-
>  drivers/gpu/drm/xen/xen_drm_front.c                |    3 -
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    6 +-
>  .../media/common/videobuf2/videobuf2-dma-contig.c  |    3 -
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    3 -
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c |    3 -
>  drivers/staging/fbtft/Kconfig                      |    1 +
>  drivers/staging/sm750fb/sm750.c                    |    1 -
>  drivers/staging/sm750fb/sm750_accel.c              |    1 -
>  drivers/staging/sm750fb/sm750_cursor.c             |    1 -
>  drivers/staging/sm750fb/sm750_hw.c                 |    1 -
>  drivers/video/backlight/bd6107.c                   |    2 +-
>  drivers/video/backlight/gpio_backlight.c           |    6 +-
>  drivers/video/backlight/lv5207lp.c                 |    2 +-
>  drivers/video/fbdev/Kconfig                        |   44 +-
>  drivers/video/fbdev/aty/aty128fb.c                 |   12 +-
>  drivers/video/fbdev/aty/atyfb_base.c               |   18 +-
>  drivers/video/fbdev/aty/radeon_backlight.c         |    2 +-
>  drivers/video/fbdev/aty/radeon_base.c              |    3 +-
>  drivers/video/fbdev/broadsheetfb.c                 |   80 +-
>  drivers/video/fbdev/core/Makefile                  |    7 +-
>  drivers/video/fbdev/core/fb_backlight.c            |   33 +
>  drivers/video/fbdev/core/fb_chrdev.c               |  485 +++++++++
>  drivers/video/fbdev/core/fb_info.c                 |   78 ++
>  drivers/video/fbdev/core/fb_internal.h             |   67 ++
>  drivers/video/fbdev/core/fb_procfs.c               |   62 ++
>  drivers/video/fbdev/core/fbcon.c                   |    1 +
>  drivers/video/fbdev/core/fbmem.c                   |  592 +----------
>  drivers/video/fbdev/core/fbsysfs.c                 |  134 +--
>  drivers/video/fbdev/ep93xx-fb.c                    |   21 +-
>  drivers/video/fbdev/fsl-diu-fb.c                   |   26 +-
>  drivers/video/fbdev/hecubafb.c                     |   78 +-
>  drivers/video/fbdev/hyperv_fb.c                    |    1 +
>  drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    9 +-
>  drivers/video/fbdev/metronomefb.c                  |   76 +-
>  drivers/video/fbdev/nvidia/nv_backlight.c          |    2 +-
>  drivers/video/fbdev/nvidia/nvidia.c                |    8 +-
>  drivers/video/fbdev/omap2/omapfb/Kconfig           |    2 +-
>  drivers/video/fbdev/pxa168fb.c                     |    2 +-
>  drivers/video/fbdev/riva/fbdev.c                   |   10 +-
>  drivers/video/fbdev/sh7760fb.c                     |   50 +-
>  drivers/video/fbdev/sm501fb.c                      |    2 +-
>  drivers/video/fbdev/sm712fb.c                      |    9 +-
>  drivers/video/fbdev/smscufx.c                      |    4 +-
>  drivers/video/fbdev/ssd1307fb.c                    |   69 +-
>  drivers/video/fbdev/tdfxfb.c                       |    4 +-
>  drivers/video/fbdev/xen-fbfront.c                  |   61 +-
>  include/drm/bridge/dw_hdmi.h                       |    2 +
>  include/drm/drm_drv.h                              |   26 +-
>  include/drm/drm_exec.h                             |  123 +++
>  include/drm/drm_gem_dma_helper.h                   |   14 +-
>  include/drm/drm_gem_shmem_helper.h                 |   19 +-
>  include/drm/drm_gem_vram_helper.h                  |    9 +-
>  include/drm/drm_prime.h                            |    7 -
>  include/drm/drm_sysfs.h                            |    4 +-
>  include/linux/efi.h                                |    3 +-
>  include/linux/fb.h                                 |    6 +-
>  include/linux/platform_data/bd6107.h               |    2 +-
>  include/linux/platform_data/gpio_backlight.h       |    2 +-
>  include/linux/platform_data/lv5207lp.h             |    2 +-
>  include/linux/sysfb.h                              |    3 +-
>  include/uapi/drm/drm_mode.h                        |    4 +-
>  370 files changed, 11462 insertions(+), 3302 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visio=
nox,r66451.yaml
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.c
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.h
>  create mode 100644 drivers/gpu/drm/drm_exec.c
>  create mode 100644 drivers/gpu/drm/loongson/Kconfig
>  create mode 100644 drivers/gpu/drm/loongson/Makefile
>  create mode 100644 drivers/gpu/drm/loongson/loongson_device.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_module.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_module.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a1000.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a2000.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-r66451.c
>  create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
>  create mode 100644 drivers/video/fbdev/core/fb_backlight.c
>  create mode 100644 drivers/video/fbdev/core/fb_chrdev.c
>  create mode 100644 drivers/video/fbdev/core/fb_info.c
>  create mode 100644 drivers/video/fbdev/core/fb_internal.h
>  create mode 100644 drivers/video/fbdev/core/fb_procfs.c
>  create mode 100644 include/drm/drm_exec.h
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
