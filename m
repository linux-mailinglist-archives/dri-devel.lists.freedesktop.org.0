Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC337F67B1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 20:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063C10E341;
	Thu, 23 Nov 2023 19:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AEE10E341
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 19:40:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32f831087c6so285376f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700768403; x=1701373203; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mf/kHNR5qM8UKclsS7UnFEn72+/RMofcavujjWK3OoU=;
 b=IYDUNjSzN+aSyv4Mj9hIAtwHaF2qpaPfOyoglldusH9ZaYN0WAIUVQWkfnld3CeJ2q
 Ym6AOEeDQ8HzimGCtsb7Kuib9ZqNiupWyFFgYLw4qehBGgh64EIN9rRE4XusuU+HbzFO
 +KHkFBI4pV1fFhjEnsZJW1KrJ4dMySQqyLoMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700768403; x=1701373203;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mf/kHNR5qM8UKclsS7UnFEn72+/RMofcavujjWK3OoU=;
 b=uAJSi4XEg7KtJRe2oQ/sxiyumDWAlwbcou1n+PHPUvNlOhJPN+xjVBwbgG5T/VVG4b
 LVsLKVF0VROt5RUJdPfZMwKhNncnWAG9mKXhnP+32HPLy/xXmrXS+SXGmbaQYBumoBHM
 v9ztT0d2O6VgRwPUSQnHA/HZK4DRuFk5xJIShM2BD/15nuRHigo89qKE2+0afG9cam4U
 XroE77pcsu72rLqqaL1/GP8rDEHvpJK5m3p2bR3mpvwjc2KUGp3j2wFkM4K41BQDWS1p
 n7fxlBBUVivfvPHYDb1LCywl8sEafPiSLP7u9sfxPXebOmxAQrHxTn5OAYJ7dIEnoYja
 BOEA==
X-Gm-Message-State: AOJu0Yxvd7QgG5je2GGbRARroJ0FfJG32wEf+pWWR9xXxpJRX7kzmfiO
 BBjU9K4JLBvtSrihfF+qmU7Rmg==
X-Google-Smtp-Source: AGHT+IFMRjShSCFAD7MZuSc1I0Xu7xxQngu4VWYPIxQjpSpqQ+dZkA0ccVGzf4au+Zp9bT5rs22B/A==
X-Received: by 2002:a5d:6da9:0:b0:32f:51c6:9f5b with SMTP id
 u9-20020a5d6da9000000b0032f51c69f5bmr317736wrs.4.1700768402656; 
 Thu, 23 Nov 2023 11:40:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v10-20020adff68a000000b003316db2d48dsm2401831wrp.34.2023.11.23.11.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 11:40:02 -0800 (PST)
Date: Thu, 23 Nov 2023 20:40:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZV-qkO2-8Iwrtsvu@phenom.ffwll.local>
References: <drzvrbsej2txf6a6npc4ukkpadj3wio7edkjbgsfdm4l33szpe@fgwtdy5z5ev7>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <drzvrbsej2txf6a6npc4ukkpadj3wio7edkjbgsfdm4l33szpe@fgwtdy5z5ev7>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 01:58:50PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's this week drm-misc-next PR.
> 
> It's been fairly calm, but there's one big change: the IMG GPU driver is
> now merged!
> 
> Maxime
> 
> drm-misc-next-2023-11-23:
> drm-misc-next for 6.8:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
> Core Changes:
>   - Drop deprecated drm_kms_helper.edid_firmware module parameter
> 
> Driver Changes:
>   - Convert platform drivers remove callback to return void
>   - imagination: Introduction of the Imagination GPU Support
>   - rockchip:
>     - rk3066_hdmi: Convert to atomic
>     - vop2: Support NV20 and NV30
>   - panel:
>     - elida-kd35t133: PM reworks
>     - New panels: Powkiddy RK2023
> The following changes since commit 3b434a3445fff3149128db0169da864d67057325:
> 
>   accel/ivpu: Use threaded IRQ to handle JOB done messages (2023-11-16 13:41:49 +0100)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-11-23

Merged to drm-next, thanks.
-Sima

> 
> for you to fetch changes up to 815d8b0425ad1164e45953ac3d56a9f6f63792cc:
> 
>   drm/imagination: Add driver documentation (2023-11-23 09:01:47 +0100)
> 
> ----------------------------------------------------------------
> drm-misc-next for 6.8:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
> Core Changes:
>   - Drop deprecated drm_kms_helper.edid_firmware module parameter
> 
> Driver Changes:
>   - Convert platform drivers remove callback to return void
>   - imagination: Introduction of the Imagination GPU Support
>   - rockchip:
>     - rk3066_hdmi: Convert to atomic
>     - vop2: Support NV20 and NV30
>   - panel:
>     - elida-kd35t133: PM reworks
>     - New panels: Powkiddy RK2023
> 
> ----------------------------------------------------------------
> Abhinav Singh (1):
>       drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer
> 
> Arnd Bergmann (1):
>       drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
> 
> Chris Morgan (8):
>       dt-bindings: display: nv3051d: Update NewVision NV3051D compatibles
>       drm/panel: nv3051d: Hold panel in reset for unprepare
>       drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
>       drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
>       drm/panel-elida-kd35t133: hold panel in reset for unprepare
>       drm/panel-elida-kd35t133: drop drm_connector_set_orientation_from_panel
>       drm/panel-elida-kd35t133: Drop shutdown logic
>       drm/panel-elida-kd35t133: Drop prepare/unprepare logic
> 
> Donald Robson (2):
>       drm/gpuvm: Helper to get range of unmap from a remap op.
>       drm/imagination: Add GEM and VM related code
> 
> Jani Nikula (1):
>       drm/edid/firmware: drop drm_kms_helper.edid_firmware backward compat
> 
> Jeffrey Hugo (1):
>       accel/qaic: Update MAX_ORDER use to be inclusive
> 
> Johan Jonker (2):
>       drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
>       drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
> 
> Jonas Karlman (1):
>       drm/rockchip: vop2: Add NV20 and NV30 support
> 
> Kees Cook (1):
>       dma-buf: Replace strlcpy() with strscpy()
> 
> Luben Tuikov (1):
>       drm/print: Handle NULL drm device in __drm_printk()
> 
> Matt Coster (1):
>       sizes.h: Add entries between SZ_32G and SZ_64T
> 
> Richard Acayan (1):
>       fbdev/simplefb: Suppress error on missing power domains
> 
> Sarah Walker (17):
>       dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
>       drm/imagination/uapi: Add PowerVR driver UAPI
>       drm/imagination: Add skeleton PowerVR driver
>       drm/imagination: Get GPU resources
>       drm/imagination: Add GPU register headers
>       drm/imagination: Add firmware and MMU related headers
>       drm/imagination: Add FWIF headers
>       drm/imagination: Add GPU ID parsing and firmware loading
>       drm/imagination: Implement power management
>       drm/imagination: Implement firmware infrastructure and META FW support
>       drm/imagination: Implement MIPS firmware processor and MMU support
>       drm/imagination: Implement free list and HWRT create and destroy ioctls
>       drm/imagination: Implement context creation/destruction ioctls
>       drm/imagination: Implement job submission and scheduling
>       drm/imagination: Add firmware trace header
>       drm/imagination: Add firmware trace to debugfs
>       drm/imagination: Add driver documentation
> 
> Tomi Valkeinen (1):
>       drm/tilcdc: Fix irq free on unload
> 
> Uwe Kleine-König (14):
>       drm/bridge: tpd12s015: Drop buggy __exit annotation for remove function
>       drm/arcpgu: Convert to platform remove callback returning void
>       drm/armada: Convert to platform remove callback returning void
>       drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
>       drm/bridge: cdns-mhdp8546: Convert to platform remove callback returning void
>       drm/bridge: tpd12s015: Convert to platform remove callback returning void
>       drm/etnaviv: Convert to platform remove callback returning void
>       drm/imx/dcss: Convert to platform remove callback returning void
>       drm/imx: lcdc: Convert to platform remove callback returning void
>       drm/kmb: Convert to platform remove callback returning void
>       drm/mediatek: Convert to platform remove callback returning void
>       drm/meson: Convert to platform remove callback returning void
>       drm/nouveau: Convert to platform remove callback returning void
>       drm/sprd: Convert to platform remove callback returning void
> 
> Yang Li (1):
>       drm/nouveau/fifo: Remove duplicated include in chan.c
> 
>  .../bindings/display/panel/newvision,nv3051d.yaml  |    2 +-
>  .../devicetree/bindings/gpu/img,powervr.yaml       |   73 +
>  Documentation/gpu/drivers.rst                      |    2 +
>  Documentation/gpu/imagination/index.rst            |   13 +
>  Documentation/gpu/imagination/uapi.rst             |  174 +
>  MAINTAINERS                                        |   10 +
>  drivers/accel/qaic/qaic_data.c                     |    2 +-
>  drivers/dma-buf/dma-buf.c                          |    4 +-
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/armada/armada_crtc.c               |    5 +-
>  drivers/gpu/drm/armada/armada_drv.c                |    5 +-
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   26 +-
>  drivers/gpu/drm/bridge/ti-tpd12s015.c              |    6 +-
>  drivers/gpu/drm/drm_edid_load.c                    |   16 -
>  drivers/gpu/drm/drm_kms_helper_common.c            |   32 -
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    6 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    5 +-
>  drivers/gpu/drm/imagination/Kconfig                |   18 +
>  drivers/gpu/drm/imagination/Makefile               |   35 +
>  drivers/gpu/drm/imagination/pvr_ccb.c              |  645 ++
>  drivers/gpu/drm/imagination/pvr_ccb.h              |   71 +
>  drivers/gpu/drm/imagination/pvr_cccb.c             |  267 +
>  drivers/gpu/drm/imagination/pvr_cccb.h             |  109 +
>  drivers/gpu/drm/imagination/pvr_context.c          |  464 ++
>  drivers/gpu/drm/imagination/pvr_context.h          |  205 +
>  drivers/gpu/drm/imagination/pvr_debugfs.c          |   53 +
>  drivers/gpu/drm/imagination/pvr_debugfs.h          |   29 +
>  drivers/gpu/drm/imagination/pvr_device.c           |  658 +++
>  drivers/gpu/drm/imagination/pvr_device.h           |  710 +++
>  drivers/gpu/drm/imagination/pvr_device_info.c      |  254 +
>  drivers/gpu/drm/imagination/pvr_device_info.h      |  186 +
>  drivers/gpu/drm/imagination/pvr_drv.c              | 1501 +++++
>  drivers/gpu/drm/imagination/pvr_drv.h              |  129 +
>  drivers/gpu/drm/imagination/pvr_free_list.c        |  625 ++
>  drivers/gpu/drm/imagination/pvr_free_list.h        |  195 +
>  drivers/gpu/drm/imagination/pvr_fw.c               | 1489 +++++
>  drivers/gpu/drm/imagination/pvr_fw.h               |  508 ++
>  drivers/gpu/drm/imagination/pvr_fw_info.h          |  135 +
>  drivers/gpu/drm/imagination/pvr_fw_meta.c          |  554 ++
>  drivers/gpu/drm/imagination/pvr_fw_meta.h          |   14 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.c          |  252 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.h          |   48 +
>  drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  306 +
>  drivers/gpu/drm/imagination/pvr_fw_startstop.h     |   13 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c         |  515 ++
>  drivers/gpu/drm/imagination/pvr_fw_trace.h         |   78 +
>  drivers/gpu/drm/imagination/pvr_gem.c              |  414 ++
>  drivers/gpu/drm/imagination/pvr_gem.h              |  170 +
>  drivers/gpu/drm/imagination/pvr_hwrt.c             |  549 ++
>  drivers/gpu/drm/imagination/pvr_hwrt.h             |  165 +
>  drivers/gpu/drm/imagination/pvr_job.c              |  788 +++
>  drivers/gpu/drm/imagination/pvr_job.h              |  161 +
>  drivers/gpu/drm/imagination/pvr_mmu.c              | 2637 +++++++++
>  drivers/gpu/drm/imagination/pvr_mmu.h              |  108 +
>  drivers/gpu/drm/imagination/pvr_params.c           |  147 +
>  drivers/gpu/drm/imagination/pvr_params.h           |   72 +
>  drivers/gpu/drm/imagination/pvr_power.c            |  433 ++
>  drivers/gpu/drm/imagination/pvr_power.h            |   41 +
>  drivers/gpu/drm/imagination/pvr_queue.c            | 1432 +++++
>  drivers/gpu/drm/imagination/pvr_queue.h            |  169 +
>  drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 6193 ++++++++++++++++++++
>  .../gpu/drm/imagination/pvr_rogue_cr_defs_client.h |  159 +
>  drivers/gpu/drm/imagination/pvr_rogue_defs.h       |  179 +
>  drivers/gpu/drm/imagination/pvr_rogue_fwif.h       | 2188 +++++++
>  drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h |  493 ++
>  .../gpu/drm/imagination/pvr_rogue_fwif_client.h    |  373 ++
>  .../drm/imagination/pvr_rogue_fwif_client_check.h  |  133 +
>  .../gpu/drm/imagination/pvr_rogue_fwif_common.h    |   60 +
>  .../gpu/drm/imagination/pvr_rogue_fwif_dev_info.h  |  113 +
>  .../imagination/pvr_rogue_fwif_resetframework.h    |   28 +
>  drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h    | 1648 ++++++
>  .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  258 +
>  .../drm/imagination/pvr_rogue_fwif_shared_check.h  |  108 +
>  .../gpu/drm/imagination/pvr_rogue_fwif_stream.h    |   78 +
>  .../gpu/drm/imagination/pvr_rogue_heap_config.h    |  113 +
>  drivers/gpu/drm/imagination/pvr_rogue_meta.h       |  356 ++
>  drivers/gpu/drm/imagination/pvr_rogue_mips.h       |  335 ++
>  drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |   58 +
>  drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h   |  136 +
>  drivers/gpu/drm/imagination/pvr_stream.c           |  285 +
>  drivers/gpu/drm/imagination/pvr_stream.h           |   75 +
>  drivers/gpu/drm/imagination/pvr_stream_defs.c      |  351 ++
>  drivers/gpu/drm/imagination/pvr_stream_defs.h      |   16 +
>  drivers/gpu/drm/imagination/pvr_sync.c             |  289 +
>  drivers/gpu/drm/imagination/pvr_sync.h             |   84 +
>  drivers/gpu/drm/imagination/pvr_vm.c               | 1107 ++++
>  drivers/gpu/drm/imagination/pvr_vm.h               |   65 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.c          |  238 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.h          |   22 +
>  drivers/gpu/drm/imx/dcss/dcss-drv.c                |    6 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    6 +-
>  drivers/gpu/drm/kmb/kmb_drv.c                      |    5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    5 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               |    5 +-
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    6 +-
>  drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
>  drivers/gpu/drm/nouveau/nv04_fence.c               |    2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |    1 -
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   37 +-
>  drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   57 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   47 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    5 +
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    2 +
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |    6 +-
>  drivers/gpu/drm/sprd/sprd_drm.c                    |    5 +-
>  drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
>  drivers/video/fbdev/simplefb.c                     |    4 +
>  include/drm/drm_edid.h                             |    5 -
>  include/drm/drm_gpuvm.h                            |   28 +
>  include/drm/drm_print.h                            |    2 +-
>  include/linux/sizes.h                              |    9 +
>  include/uapi/drm/pvr_drm.h                         | 1297 ++++
>  115 files changed, 34632 insertions(+), 204 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
>  create mode 100644 Documentation/gpu/imagination/index.rst
>  create mode 100644 Documentation/gpu/imagination/uapi.rst
>  create mode 100644 drivers/gpu/drm/imagination/Kconfig
>  create mode 100644 drivers/gpu/drm/imagination/Makefile
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframework.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
>  create mode 100644 include/uapi/drm/pvr_drm.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
