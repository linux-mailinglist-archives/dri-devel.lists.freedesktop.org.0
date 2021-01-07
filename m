Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D02ED016
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 13:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0FD89590;
	Thu,  7 Jan 2021 12:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4137889590
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 12:42:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d26so5470083wrb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 04:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZNORaQlCOy9rIqWDDcTI2bHSUtMSn5Ddl2+EeqA67LE=;
 b=KOwBuyTK6NzfL5X0Z/8EFVoygCYC+yEY1R+hZhgX7vQ8JKnkqbEqqxnYpbVVUSn0aT
 qv5QL5tlmmlZvITWD3WCUwJTANi3BHjO8/R1t362rlKsaGaS+UXt5teXlVyqXvy4aLpb
 CjefbE/jhS/yvGwl/qQL7EFFSbEmJ2faayOYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZNORaQlCOy9rIqWDDcTI2bHSUtMSn5Ddl2+EeqA67LE=;
 b=lYqckK49tW7wkYOjVo1ohyzAKXkG4IIYzi6hVnZV4h9HYQxHPlsiHGAKf54QlhMGxC
 vGHk5oKCt/E0RY+vLZOQNW5eEz3KOrFK6niHs3CrUMiLa39FyaLL8syy69Dbez+e+wx1
 2Ul4eA+F/YGkOJCgoF3eMb2y1MGZpsjav9es9SiSCvVczFN5KGKRy3SwJy5NAoN9dpeg
 Jr96Ip2A9jzuEGZk4PYr5oZhhjFO4kU6i38O7mUZyjUyCxFfzlz+ZXNbkyictL2hh2uu
 maN8aRz3L13oydkVR8qmGH0SEI3spw7JvhYJ5UbhRJrjZk2sEzftIUcFP/yFnnGWA5Pb
 CMMA==
X-Gm-Message-State: AOAM531BZcCaTNHKedEXVKF4CLLe3DmWBMN9/HOlpNo0LEKhKXS0eRMW
 9EpdTXrKVaqZV0iaEeBWdqaH5Q==
X-Google-Smtp-Source: ABdhPJxRO3WdivBqAhNUhFiE5q+y8KXRtjofNw59TZjeaepzyC/tuyJ3C47rOCCuAscKkqHPqnWP9w==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr8640665wrw.422.1610023333751; 
 Thu, 07 Jan 2021 04:42:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c20sm7414922wmb.38.2021.01.07.04.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:42:12 -0800 (PST)
Date: Thu, 7 Jan 2021 13:42:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <X/cBo0sItGZ2XJxN@phenom.ffwll.local>
References: <fdfbfd7a-b91d-3f59-11c8-984704ce0ee1@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdfbfd7a-b91d-3f59-11c8-984704ce0ee1@linux.intel.com>
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 12:13:12PM +0100, Maarten Lankhorst wrote:
> drm-misc-next-2021-01-06:
> drm-misc-next for v5.12:
> =

> Core Changes:
> - Lots of drm documentation updates by Simor Ser.

Extra kudos for documentation work!

> - Require that each crtc has a unique primary plane.
> - Add fixme that fbdev_generic_setup is confusing.
> =

> Driver Changes:
> - Update addresses for TI display drivers maintainers.
> - Make DRM_VIRTIO_GPU select VIRTIO.
> - Small fixes to qxl, virtio, hisilicon, tve200, panel/s6e63m0.
> The following changes since commit 5fbd41d3bf123af6a135bdea564087ec0f563e=
b0:
> =

>   Merge tag 'drm-misc-next-2020-11-27-1' of git://anongit.freedesktop.org=
/drm/drm-misc into drm-next (2020-12-15 10:21:48 +0100)

Pulled, thanks.
-Daniel

> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-01-06
> =

> for you to fetch changes up to cf9a4be47fd14473b4d0dd6f494ed7279c2bc8a0:
> =

>   drm/doc: render drm.h uapi docs (2021-01-05 14:22:26 +0100)
> =

> ----------------------------------------------------------------
> drm-misc-next for v5.12:
> =

> Core Changes:
> - Lots of drm documentation updates by Simor Ser.
> - Require that each crtc has a unique primary plane.
> - Add fixme that fbdev_generic_setup is confusing.
> =

> Driver Changes:
> - Update addresses for TI display drivers maintainers.
> - Make DRM_VIRTIO_GPU select VIRTIO.
> - Small fixes to qxl, virtio, hisilicon, tve200, panel/s6e63m0.
> =

> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/kmb: fix array bounds warning
> =

> Bernard Zhao (1):
>       via/via_irq: use __func__ to replace string function name
> =

> Chia-I Wu (1):
>       drm/virtio: align blob resources to page sizes
> =

> Christian K=F6nig (13):
>       drm/radeon: fix check order in radeon_bo_move
>       drm/radeon: stop using pages with drm_prime_sg_to_page_addr_arrays =
v2
>       drm/amdgpu: stop using pages with drm_prime_sg_to_page_addr_arrays
>       drm/nouveau: stop using pages with drm_prime_sg_to_page_addr_arrays=
 v2
>       drm/vmwgfx: switch to ttm_sg_tt_init
>       drm/qxl: switch to ttm_sg_tt_init
>       drm/ttm: nuke ttm_dma_tt_init
>       drm/prime: split array import functions v4
>       drm/ttm/drivers: remove unecessary ttm_module.h include v2
>       drm/ttm: stop destroying pinned ghost object
>       drm/ttm: cleanup BO size handling v3
>       drm/ttm: use pin_count more extensively
>       drm/ttm: cleanup LRU handling further
> =

> Chuhong Yuan (1):
>       drm/fb-helper: Add missed unlocks in setcmap_legacy()
> =

> Dafna Hirschfeld (2):
>       drm/rockchip: for error print, use the correct device pointer
>       drm/rockchip: fix typo in Kconfig 's/HDMI/dsi/'
> =

> Dan Carpenter (3):
>       drm/kmb: Remove an unnecessary NULL check
>       gma500: clean up error handling in init
>       drm/panel: khadas: Fix error code in khadas_ts050_panel_add()
> =

> Daniel Vetter (10):
>       drm/ttm: Warn on pinning without holding a reference
>       drm/nouveau: Drop mutex_lock_nested for atomic
>       dma-buf: Fix kerneldoc formatting
>       drm/vkms: Unset preferred_depth
>       drm/amdkfd: fix ttm size refactor fallout
>       dma-buf: Remove kmap kerneldoc vestiges
>       dma-buf: some kerneldoc formatting fixes
>       dma-buf: begin/end_cpu might lock the dma_resv lock
>       dma-buf: doc polish for pin/unpin
>       drm/fb-helper: Add a FIXME that generic_setup is very confusing
> =

> Dave Stevenson (4):
>       drm/vc4: dsi: Correct DSI register definition
>       drm/vc4: dsi: Add support for DSI0
>       dt-bindings: Add compatible for BCM2711 DSI1
>       drm/vc4: dsi: Add configuration for BCM2711 DSI1
> =

> Douglas Anderson (7):
>       drm: panel: simple: Fixup the struct panel_desc kernel doc
>       drm: panel: simple: Defer unprepare delay till next prepare to shor=
ten it
>       drm: panel: simple: Allow specifying the delay from prepare to enab=
le
>       dt-bindings: dt-bindings: display: simple: Add BOE NV110WTM-N61
>       drm: panel: simple: Add BOE NV110WTM-N61
>       drm: panel: Fully transition panel_desc kerneldoc to inline style
>       drm: panel: add flags to BOE NV110WTM-N61
> =

> Enrico Weigelt, metux IT consult (1):
>       drivers: gpu: drm: virtio: fix dependency of DRM_VIRTIO_GPU on VIRT=
IO
> =

> Guido G=FCnther (6):
>       drm/panel: st7703: Use dev_err_probe
>       drm/panel: mantix: Tweak init sequence
>       drm/panel: mantix: Allow to specify default mode for different pane=
ls
>       drm/panel: mantix: Support panel from Shenzhen Yashi Changhua Intel=
ligent Technology Co
>       dt-bindings: vendor-prefixes: Add ys vendor prefix
>       dt-bindings: display: mantix: Add compatible for panel from YS
> =

> Gurchetan Singh (3):
>       drm/virtio: virtio_{blah} --> virtio_gpu_{blah}
>       drm/virtio: rework virtio_fence_signaled
>       drm/virtio: consider dma-fence context when signaling
> =

> Jialin Zhang (1):
>       drm/gma500: Fix error return code in psb_driver_load()
> =

> Jonathan Liu (1):
>       drm/rockchip: dw_hdmi: fix incorrect clock in vpll clock error mess=
age
> =

> Jyri Sarha (2):
>       drm/omap: Implement CTM property for CRTC using OVL managers CPR ma=
trix
>       drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for plan=
es
> =

> Krzysztof Kozlowski (1):
>       drm/ingenic: depend on COMMON_CLK to fix compile tests
> =

> Laurent Pinchart (1):
>       drm: Remove drmm_add_final_kfree() declaration from public headers
> =

> Linus Walleij (3):
>       dt-bindings: display: mcde: Convert to YAML schema
>       drm/panel: s6e63m0: Fix init sequence again
>       drm/panel: s6e63m0: Support max-brightness
> =

> Luben Tuikov (4):
>       drm/scheduler: "node" --> "list"
>       gpu/drm: ring_mirror_list --> pending_list
>       drm/scheduler: Essentialize the job done callback
>       drm/sched: Add missing structure comment
> =

> Maarten Lankhorst (1):
>       Merge drm/drm-next into drm-misc-next
> =

> Maxime Ripard (20):
>       drm/vc4: hdmi: Don't poll for the infoframes status on setup
>       drm/vc4: drv: Remove the DSI pointer in vc4_drv
>       drm/vc4: dsi: Use snprintf for the PHY clocks instead of an array
>       drm/vc4: dsi: Introduce a variant structure
>       drm: Introduce an atomic_commit_setup function
>       drm: Document use-after-free gotcha with private objects
>       drm/vc4: Simplify a bit the global atomic_check
>       drm/vc4: kms: Wait on previous FIFO users before a commit
>       drm/vc4: kms: Remove unassigned_channels from the HVS state
>       drm/vc4: kms: Remove async modeset semaphore
>       drm/vc4: kms: Convert to atomic helpers
>       drm/vc4: hvs: Align the HVS atomic hooks to the new API
>       drm/vc4: Pass the atomic state to encoder hooks
>       drm/vc4: hdmi: Take into account the clock doubling flag in atomic_=
check
>       drm/vc4: hdmi: Don't access the connector state in reset if kmalloc=
 fails
>       drm/vc4: hdmi: Create a custom connector state
>       drm/vc4: hdmi: Store pixel frequency in the connector state
>       drm/vc4: hdmi: Use the connector state pixel rate for the PHY
>       drm/vc4: hdmi: Limit the BCM2711 to the max without scrambling
>       drm/vc4: hdmi: Enable 10/12 bpc output
> =

> Neil Armstrong (2):
>       dt-bindings: panel-simple-dsi: add Khadas TS050 panel bindings
>       drm: panel: add Khadas TS050 panel driver
> =

> Nirmoy Das (1):
>       drm/amdgpu: clean up bo in vce and vcn test
> =

> Paul Cercueil (4):
>       drm/ingenic: Add basic PM support
>       drm/ingenic: Compute timings according to adjusted_mode->crtc_*
>       drm/ingenic: Properly compute timings when using a 3x8-bit panel
>       drm/ingenic: Add support for serial 8-bit delta-RGB panels
> =

> Randy Dunlap (1):
>       fbdev: aty: SPARC64 requires FB_ATY_CT
> =

> Sam Ravnborg (35):
>       video: Fix kernel-doc warnings in of_display_timing + of_videomode
>       video: fbcon: Fix warnings by using pr_debug() in fbcon
>       video: fbdev: s1d13xxxfb: Fix kernel-doc and set but not used warni=
ngs
>       video: fbdev: aty: Delete unused variable in radeon_monitor
>       video: fbdev: aty: Fix set but not used warnings
>       video: fbdev: aty: Fix set but not used warnings in mach64_ct
>       video: fbdev: sis: Fix defined but not used warnings
>       video: fbdev: sis: Fix defined but not used warning of SiS_TVDelay
>       video: fbdev: sis: Fix set but not used warnings in init.c
>       video: fbdev: sis: Fix set but not used warnings in sis_main
>       video: fbdev: via: Fix set but not used warning for mode_crt_table
>       video: fbdev: tdfx: Fix set but not used warning in att_outb()
>       video: fbdev: riva: Fix kernel-doc and set but not used warnings
>       video: fbdev: pm2fb: Fix kernel-doc warnings
>       video: fbdev: tgafb: Fix kernel-doc and set but not used warnings
>       video: fbdev: mx3fb: Fix kernel-doc, set but not used and string wa=
rnings
>       video: fbdev: sstfb: Updated logging to fix set but not used warnin=
gs
>       video: fbdev: neofb: Fix set but not used warning for CursorMem
>       video: fbdev: nvidia: Fix set but not used warnings
>       video: fbdev: omapfb: Fix set but not used warnings in dsi
>       video: fbdev: s3c-fb: Fix kernel-doc and set but not used warnings
>       video: fbdev: uvesafb: Fix string related warnings
>       video: fbdev: cirrusfb: Fix kernel-doc and set but not used warnings
>       video: fbdev: hgafb: Fix kernel-doc warnings
>       video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
>       video: fbdev: omapfb: Fix set but not used warnings in hdmi*_core
>       video: fbdev: uvesafb: Fix set but not used warning
>       video: fbdev: sparc drivers: fix kernel-doc warnings for blank_mode
>       video: fbdev: mmp: Fix kernel-doc warning for lcd_spi_write
>       video: fbdev: wmt_ge_rops: Fix function not declared warnings
>       video: fbdev: goldfishfb: Fix defined but not used warning
>       video: fbdev: gbefb: Fix set but not used warning
>       video: fbdev: efifb: Fix set but not used warning for screen_pitch
>       video: fbdev: controlfb: Fix set but not used warnings
>       video: fbdev: sis: Drop useless call to SiS_GetResInfo()
> =

> Sebastian Reichel (49):
>       Revert "drm/omap: dss: Remove unused omap_dss_device operations"
>       drm/omap: drop unused dsi.configure_pins
>       drm/omap: dsi: use MIPI_DSI_FMT_* instead of OMAP_DSS_DSI_FMT_*
>       drm/omap: constify write buffers
>       drm/omap: dsi: add generic transfer function
>       drm/omap: panel-dsi-cm: convert to transfer API
>       drm/omap: dsi: unexport specific data transfer functions
>       drm/omap: dsi: drop virtual channel logic
>       drm/omap: dsi: simplify write function
>       drm/omap: dsi: simplify read functions
>       drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg
>       drm/omap: dsi: introduce mipi_dsi_host
>       drm/omap: panel-dsi-cm: use DSI helpers
>       drm/omap: dsi: request VC via mipi_dsi_attach
>       drm/omap: panel-dsi-cm: drop hardcoded VC
>       drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
>       drm/omap: dsi: drop unused memory_read()
>       drm/omap: dsi: drop unused get_te()
>       drm/omap: dsi: drop unused enable_te()
>       drm/omap: dsi: drop useless sync()
>       drm/omap: dsi: use pixel-format and mode from attach
>       drm/omap: panel-dsi-cm: use bulk regulator API
>       drm/omap: dsi: lp/hs switching support for transfer()
>       drm/omap: dsi: move TE GPIO handling into core
>       drm/omap: dsi: drop custom enable_te() API
>       drm/omap: dsi: do bus locking in host driver
>       drm/omap: dsi: untangle ulps ops from enable/disable
>       drm/omap: dsi: do ULPS in host driver
>       drm/omap: dsi: move panel refresh function to host
>       drm/omap: dsi: Reverse direction of the DSS device enable/disable o=
perations
>       drm/omap: dsi: drop custom panel capability support
>       drm/omap: dsi: convert to drm_panel
>       drm/omap: drop omapdss-boot-init
>       drm/omap: dsi: implement check timings
>       drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
>       drm/omap: panel-dsi-cm: support unbinding
>       drm/omap: panel-dsi-cm: fix remove()
>       drm/omap: remove global dss_device variable
>       drm/panel: Move OMAP's DSI command mode panel driver
>       drm/omap: dsi: Register a drm_bridge
>       drm/omap: remove legacy DSS device operations
>       drm/omap: remove unused omap_connector
>       drm/omap: simplify omap_display_id
>       drm/omap: drop unused DSS next pointer
>       drm/omap: drop DSS ops_flags
>       drm/omap: drop dssdev display field
>       drm/omap: simplify DSI manual update code
>       drm/omap: dsi: simplify pin config
>       ARM: omap2plus_defconfig: Update for moved DSI command mode panel
> =

> Simon Ser (18):
>       drm: document that user-space should force-probe connectors
>       drm: fix typos in plane and CRTC overviews
>       drm: rework description of primary and cursor planes
>       drm: validate possible_crtcs for primary and cursor planes
>       drm: require a non_NULL drm_crtc.primary
>       drm/doc: rename FB_DAMAGE_CLIPS section
>       drm/doc: move composition function docs to new section
>       drm/doc: move damage tracking functions to new section
>       drm/doc: move color management functions under CRTC section
>       drm/doc: the KMS properties section is for user-space devs
>       drm/doc: introduce new section for standard plane properties
>       drm/doc: fix reference to drm_format_modifier_blob
>       drm: require each CRTC to have a unique primary plane
>       drm/doc: atomic implicitly enables other caps
>       drm: warn if cursor plane is set with legacy funcs
>       drm/doc: re-format drm.h file comment
>       drm/doc: demote old doc-comments in drm.h
>       drm/doc: render drm.h uapi docs
> =

> Sumera Priyadarsini (1):
>       drm/vkms: Add setup and testing information
> =

> Thomas Zimmermann (4):
>       drm/cma-helper: Remove prime infix from GEM object functions
>       drm/cma-helper: Implement mmap as GEM CMA object functions
>       drm/ast: Don't pin cursor source BO explicitly during update
>       drm/ast: Only map cursor BOs during updates
> =

> Tian Tao (15):
>       drm/hisilicon: Code refactoring for hibmc_drm_drv
>       drm/irq: Add the new api to install irq
>       drm/hisilicon: Use the new api devm_drm_irq_install
>       drm/hisilicon: Use managed VRAM-helper initialization
>       drm/hisilicon: Delete the entire file hibmc_ttm.c
>       drm/drv: switch to using devm_add_action_or_reset()
>       drm/hisilicon: Use managed mode-config init
>       drm/hisilicon: Delete unused local parameters
>       drm/drv: Remove invalid assignments
>       drm/hisilicon: Fix use-after-free
>       drm/hisilicon: Fix rmmod hibmc_drm failed
>       drm/qxl: use flexible-array member instead of zero-length array
>       drm/hisilicon: Use pcim_enable_device()
>       drm/hisilicon: Remove drm_dev_put in hibmc
>       drm/tve200: remove unused including <linux/version.h>
> =

> Tom Rix (1):
>       omapfb: fbcon: remove trailing semicolon in macro definition
> =

> Tomi Valkeinen (42):
>       dt-bindings: dp-connector: add binding for DisplayPort connector
>       drm/bridge: display-connector: add DP support
>       drm: automatic legacy gamma support
>       drm: add legacy support for using degamma for gamma
>       drm/omap: use degamma property for gamma table
>       drm/omap: rearrange includes in omapdss.h
>       drm/omap: squash omapdrm sub-modules into one
>       drm/omap: remove unused display.c
>       drm/omap: drop unused owner field
>       drm/omap: remove dispc_ops
>       drm/omap: remove dss_mgr_ops
>       drm/panel: panel-dsi-cm: use MIPI_DCS_GET_ERROR_COUNT_ON_DSI
>       drm/panel: panel-dsi-cm: cleanup tear enable
>       ARM: dts: omap5: add address-cells & size-cells to dsi
>       drm/omap: pll: fix iteration loop check
>       drm/omap: dsi: set trans_mode according to client mode_flags
>       drm/panel: panel-dsi-cm: set column & page at setup
>       drm/omap: dsi: send nop instead of page & column
>       drm/omap: dsi: simplify VC handling
>       drm/omap: dsi: drop useless channel checks
>       drm/omap: dsi: cleanup dispc channel usage
>       drm/omap: dsi: rename 'channel' to 'vc'
>       drm/omap: dsi: pass vc and channel to various functions
>       drm/omap: dsi: untangle vc & channel
>       drm/omap: dsi: skip dsi_vc_enable_hs when already in correct mode
>       drm/omap: dsi: enable HS before sending the frame
>       drm/omap: dsi: use separate VCs for cmd and video
>       drm/panel: panel-dsi-cm: remove extra 'if'
>       drm/panel: panel-dsi-cm: add panel database to driver
>       drm/panel: panel-dsi-cm: drop unneeded includes
>       drm/omap: dsi: move structs & defines to dsi.h
>       drm/omap: dsi: move enable/disable to bridge enable/disable
>       drm/omap: dsi: display_enable cleanup
>       drm/omap: dsi: display_disable cleanup
>       drm/omap: dsi: rename dsi_display_* functions
>       drm/omap: dsi: cleanup initial vc setup
>       drm/omap: dsi: split video mode enable/disable into separate func
>       drm/omap: dsi: fix and cleanup ddr_clk_always_on
>       drm/omap: dsi: remove ulps support
>       drm/omap: dsi: fix DCS_CMD_ENABLE
>       drm/omap: dsi: allow DSI commands to be sent early
>       MAINTAINERS: Update addresses for TI display drivers
> =

> Zheng Yongjun (1):
>       drm/omap: Delete useless kfree code
> =

> Zqiang (1):
>       udlfb: Fix memory leak in dlfb_usb_probe
> =

>  .../bindings/display/brcm,bcm2835-dsi0.yaml        |    1 +
>  .../bindings/display/connector/dp-connector.yaml   |   56 +
>  .../display/panel/mantix,mlaf057we51-x.yaml        |    1 +
>  .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
>  .../bindings/display/panel/panel-simple.yaml       |    2 +
>  .../devicetree/bindings/display/ste,mcde.txt       |  104 --
>  .../devicetree/bindings/display/ste,mcde.yaml      |  169 ++
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  Documentation/driver-api/dma-buf.rst               |    2 +-
>  Documentation/gpu/drm-kms.rst                      |   52 +-
>  Documentation/gpu/drm-uapi.rst                     |    3 +
>  Documentation/gpu/vkms.rst                         |   70 +
>  MAINTAINERS                                        |   10 +-
>  arch/arm/boot/dts/omap5.dtsi                       |    6 +
>  arch/arm/configs/omap2plus_defconfig               |    2 +-
>  drivers/dma-buf/dma-buf.c                          |   74 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    4 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    1 -
>  drivers/gpu/drm/arm/malidp_crtc.c                  |    1 -
>  drivers/gpu/drm/armada/armada_crtc.c               |    1 -
>  drivers/gpu/drm/ast/ast_cursor.c                   |   55 +-
>  drivers/gpu/drm/ast/ast_drv.h                      |    2 -
>  drivers/gpu/drm/ast/ast_mode.c                     |    1 -
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |    1 -
>  drivers/gpu/drm/bridge/display-connector.c         |   46 +-
>  drivers/gpu/drm/drm_atomic_helper.c                |   79 +-
>  drivers/gpu/drm/drm_blend.c                        |    6 -
>  drivers/gpu/drm/drm_color_mgmt.c                   |  125 +-
>  drivers/gpu/drm/drm_crtc.c                         |    5 +-
>  drivers/gpu/drm/drm_drv.c                          |    9 +-
>  drivers/gpu/drm/drm_fb_helper.c                    |   25 +-
>  drivers/gpu/drm/drm_file.c                         |    3 +-
>  drivers/gpu/drm/drm_gem_cma_helper.c               |  141 +-
>  drivers/gpu/drm/drm_irq.c                          |   32 +
>  drivers/gpu/drm/drm_mode_config.c                  |   49 +
>  drivers/gpu/drm/drm_plane.c                        |   36 +-
>  drivers/gpu/drm/drm_prime.c                        |   64 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    3 +-
>  drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c         |   22 +-
>  drivers/gpu/drm/gma500/psb_drv.c                   |    2 +
>  drivers/gpu/drm/hisilicon/hibmc/Makefile           |    2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |    2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   95 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   10 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |   61 -
>  drivers/gpu/drm/i915/display/intel_display.c       |    1 -
>  drivers/gpu/drm/ingenic/Kconfig                    |    1 +
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   60 +-
>  drivers/gpu/drm/ingenic/ingenic-drm.h              |   14 +
>  drivers/gpu/drm/kmb/kmb_drv.c                      |    2 +-
>  drivers/gpu/drm/kmb/kmb_plane.c                    |    3 +
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    1 -
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    2 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |    2 +-
>  drivers/gpu/drm/nouveau/dispnv50/head.c            |    2 -
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |   20 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c          |    8 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h              |    1 -
>  drivers/gpu/drm/nouveau/nouveau_prime.c            |    4 +-
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    2 +-
>  drivers/gpu/drm/nouveau/nv17_fence.c               |    2 +-
>  drivers/gpu/drm/nouveau/nv50_fence.c               |    2 +-
>  drivers/gpu/drm/omapdrm/Kconfig                    |  120 +-
>  drivers/gpu/drm/omapdrm/Makefile                   |   19 +-
>  drivers/gpu/drm/omapdrm/displays/Kconfig           |   10 -
>  drivers/gpu/drm/omapdrm/displays/Makefile          |    2 -
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 1385 --------------
>  drivers/gpu/drm/omapdrm/dss/Kconfig                |  135 --
>  drivers/gpu/drm/omapdrm/dss/Makefile               |   20 -
>  drivers/gpu/drm/omapdrm/dss/base.c                 |   87 +-
>  drivers/gpu/drm/omapdrm/dss/dispc.c                |  202 +-
>  drivers/gpu/drm/omapdrm/dss/display.c              |   60 -
>  drivers/gpu/drm/omapdrm/dss/dpi.c                  |    1 -
>  drivers/gpu/drm/omapdrm/dss/dsi.c                  | 1949 ++++++++------=
------
>  drivers/gpu/drm/omapdrm/dss/dsi.h                  |  456 +++++
>  drivers/gpu/drm/omapdrm/dss/dss.c                  |   28 +-
>  drivers/gpu/drm/omapdrm/dss/dss.h                  |   72 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c    |  229 ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h              |  347 +---
>  drivers/gpu/drm/omapdrm/dss/output.c               |   57 +-
>  drivers/gpu/drm/omapdrm/dss/pll.c                  |    6 +
>  drivers/gpu/drm/omapdrm/dss/sdi.c                  |    1 -
>  drivers/gpu/drm/omapdrm/dss/venc.c                 |    2 -
>  drivers/gpu/drm/omapdrm/omap_connector.c           |  157 --
>  drivers/gpu/drm/omapdrm/omap_connector.h           |   28 -
>  drivers/gpu/drm/omapdrm/omap_crtc.c                |  153 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.h                |    2 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                 |   73 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h                 |    3 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c             |   59 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c                 |    3 +-
>  drivers/gpu/drm/omapdrm/omap_irq.c                 |   34 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c               |   41 +-
>  drivers/gpu/drm/omapdrm/tcm-sita.c                 |    1 -
>  drivers/gpu/drm/panel/Kconfig                      |   20 +
>  drivers/gpu/drm/panel/Makefile                     |    2 +
>  drivers/gpu/drm/panel/panel-dsi-cm.c               |  665 +++++++
>  drivers/gpu/drm/panel/panel-khadas-ts050.c         |  870 +++++++++
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   39 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   59 +-
>  drivers/gpu/drm/panel/panel-simple.c               |  221 ++-
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   24 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |    2 +-
>  drivers/gpu/drm/qxl/qxl_dev.h                      |   16 +-
>  drivers/gpu/drm/qxl/qxl_drv.h                      |    1 -
>  drivers/gpu/drm/qxl/qxl_object.h                   |    2 +-
>  drivers/gpu/drm/qxl/qxl_release.c                  |    2 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c                      |    3 +-
>  drivers/gpu/drm/radeon/radeon.h                    |    1 -
>  drivers/gpu/drm/radeon/radeon_cs.c                 |    3 +-
>  drivers/gpu/drm/radeon/radeon_object.c             |   13 +-
>  drivers/gpu/drm/radeon/radeon_object.h             |    4 +-
>  drivers/gpu/drm/radeon/radeon_prime.c              |    4 +-
>  drivers/gpu/drm/radeon/radeon_trace.h              |    2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c                |   67 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    1 -
>  drivers/gpu/drm/rockchip/Kconfig                   |    2 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    1 -
>  drivers/gpu/drm/scheduler/sched_main.c             |  120 +-
>  drivers/gpu/drm/stm/ltdc.c                         |    1 -
>  drivers/gpu/drm/ttm/ttm_agp_backend.c              |    1 -
>  drivers/gpu/drm/ttm/ttm_bo.c                       |  103 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c                  |   16 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    7 +-
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    4 +-
>  drivers/gpu/drm/ttm/ttm_memory.c                   |    3 +-
>  drivers/gpu/drm/ttm/ttm_module.c                   |    3 +-
>  {include =3D> drivers/gpu}/drm/ttm/ttm_module.h      |    0
>  drivers/gpu/drm/ttm/ttm_range_manager.c            |    1 -
>  drivers/gpu/drm/ttm/ttm_tt.c                       |   15 +-
>  drivers/gpu/drm/tve200/tve200_display.c            |    1 -
>  drivers/gpu/drm/tve200/tve200_drv.c                |    1 -
>  drivers/gpu/drm/vc4/vc4_bo.c                       |    6 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |   38 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |   22 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  111 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  165 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   23 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    8 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    9 +
>  drivers/gpu/drm/vc4/vc4_hvs.c                      |   18 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                      |  248 ++-
>  drivers/gpu/drm/vc4/vc4_txp.c                      |   11 +-
>  drivers/gpu/drm/vgem/vgem_drv.c                    |    3 +-
>  drivers/gpu/drm/via/via_irq.c                      |    2 +-
>  drivers/gpu/drm/virtio/Kconfig                     |    3 +-
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   24 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h               |    1 +
>  drivers/gpu/drm/virtio/virtgpu_fence.c             |   81 +-
>  drivers/gpu/drm/virtio/virtgpu_vram.c              |    2 +
>  drivers/gpu/drm/vkms/vkms_drv.c                    |    5 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.c                |    1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |    8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |    7 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |    1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    4 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c            |    4 +-
>  drivers/video/fbdev/Kconfig                        |    2 +-
>  drivers/video/fbdev/aty/atyfb_base.c               |   11 +-
>  drivers/video/fbdev/aty/mach64_ct.c                |   15 +-
>  drivers/video/fbdev/aty/radeon_monitor.c           |    4 +-
>  drivers/video/fbdev/bw2.c                          |    2 +-
>  drivers/video/fbdev/cg3.c                          |    2 +-
>  drivers/video/fbdev/cg6.c                          |    2 +-
>  drivers/video/fbdev/cirrusfb.c                     |   20 +-
>  drivers/video/fbdev/controlfb.c                    |    4 +-
>  drivers/video/fbdev/core/fb_notify.c               |    7 +
>  drivers/video/fbdev/core/fbcon.c                   |   25 +-
>  drivers/video/fbdev/core/fbmon.c                   |    2 +-
>  drivers/video/fbdev/efifb.c                        |    3 +-
>  drivers/video/fbdev/ffb.c                          |    2 +-
>  drivers/video/fbdev/gbefb.c                        |    4 +-
>  drivers/video/fbdev/goldfishfb.c                   |    2 +
>  drivers/video/fbdev/hgafb.c                        |   10 +-
>  drivers/video/fbdev/leo.c                          |    2 +-
>  drivers/video/fbdev/mmp/hw/mmp_spi.c               |    2 +-
>  drivers/video/fbdev/mx3fb.c                        |   13 +-
>  drivers/video/fbdev/neofb.c                        |    4 -
>  drivers/video/fbdev/nvidia/nv_setup.c              |    7 +-
>  .../video/fbdev/omap2/omapfb/dss/dispc-compat.c    |    2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c         |   14 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c  |    4 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c  |    4 +-
>  drivers/video/fbdev/p9100.c                        |    2 +-
>  drivers/video/fbdev/pm2fb.c                        |    8 +-
>  drivers/video/fbdev/riva/fbdev.c                   |    9 +-
>  drivers/video/fbdev/riva/riva_hw.c                 |   28 +-
>  drivers/video/fbdev/s1d13xxxfb.c                   |    3 +-
>  drivers/video/fbdev/s3c-fb.c                       |   11 +-
>  drivers/video/fbdev/sis/init.c                     |   33 +-
>  drivers/video/fbdev/sis/oem310.h                   |    2 +
>  drivers/video/fbdev/sis/sis.h                      |    1 -
>  drivers/video/fbdev/sis/sis_main.c                 |    9 +-
>  drivers/video/fbdev/sstfb.c                        |    2 +-
>  drivers/video/fbdev/tcx.c                          |    2 +-
>  drivers/video/fbdev/tdfxfb.c                       |    4 +-
>  drivers/video/fbdev/tgafb.c                        |    7 +-
>  drivers/video/fbdev/udlfb.c                        |    1 +
>  drivers/video/fbdev/uvesafb.c                      |    6 +-
>  drivers/video/fbdev/via/lcd.c                      |    4 +-
>  drivers/video/fbdev/wmt_ge_rops.c                  |    1 +
>  drivers/video/of_display_timing.c                  |    1 +
>  drivers/video/of_videomode.c                       |    6 +-
>  include/drm/drm_atomic.h                           |   20 +
>  include/drm/drm_atomic_helper.h                    |    4 -
>  include/drm/drm_gem_cma_helper.h                   |   14 +-
>  include/drm/drm_irq.h                              |    2 +-
>  include/drm/drm_managed.h                          |    2 -
>  include/drm/drm_modeset_helper_vtables.h           |   21 +
>  include/drm/drm_prime.h                            |    7 +-
>  include/drm/gpu_scheduler.h                        |   14 +-
>  include/drm/ttm/ttm_bo_api.h                       |   13 +-
>  include/drm/ttm/ttm_bo_driver.h                    |    6 +-
>  include/drm/ttm/ttm_resource.h                     |    1 -
>  include/drm/ttm/ttm_tt.h                           |    2 -
>  include/linux/dma-buf-map.h                        |    2 +-
>  include/linux/dma-buf.h                            |   39 +-
>  include/uapi/drm/drm.h                             |   97 +-
>  include/uapi/drm/drm_mode.h                        |   13 +-
>  include/video/sstfb.h                              |    4 +-
>  251 files changed, 5539 insertions(+), 5550 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/connector/d=
p-connector.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.ya=
ml
>  delete mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/Makefile
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c
>  create mode 100644 drivers/gpu/drm/omapdrm/dss/dsi.h
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h
>  create mode 100644 drivers/gpu/drm/panel/panel-dsi-cm.c
>  create mode 100644 drivers/gpu/drm/panel/panel-khadas-ts050.c
>  rename {include =3D> drivers/gpu}/drm/ttm/ttm_module.h (100%)

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
