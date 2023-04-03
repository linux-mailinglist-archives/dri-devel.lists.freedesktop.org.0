Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986F6D4EB4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 19:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C86410E525;
	Mon,  3 Apr 2023 17:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EAAE10E525
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 17:13:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8DxJYwhCStkxyUWAA--.33949S3;
 Tue, 04 Apr 2023 01:13:05 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxSL0gCStkqJIUAA--.16596S2; 
 Tue, 04 Apr 2023 01:13:04 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v10 0/2] drm: add kms driver for loongson display controller
Date: Tue,  4 Apr 2023 01:13:02 +0800
Message-Id: <20230403171304.2157326-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxSL0gCStkqJIUAA--.16596S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtr47ZFy8uw48uFyktFyDtrb_yoW3CF48pF
 43Aa4FkrWDJF42yr9xA3W8GFyrAa4fXFWSgF43X34ag3yDAFyUZr15ZFW5JrW7ZFy7Xry2
 qr97Kr4UG3ZFkw7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWUJVW8JwAaw2AF
 wI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
 14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
 AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
 67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
 8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
 CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
 vfC2KfnxnUUI43ZEXa7IU8HKZJUUUUU==
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
Cc: nathan@kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loongson display controller IP has been integrated in both Loongson north
bridge chipsets(ls7a1000/ls7a2000) and SoCs(ls2k1000/ls2k2000), it has been
included in Loongson self-made BMC products.

This display controller is a PCI device in all of chips mentiond, it has
two display pipes which support primary planes and cursor plane. For the
DC in ls7a1000 and ls2k1000, each display pipe has a DVO output interface
which provide RGB888 signals, vertical & horizontal synchronisations and
the pixel clock. Each CRTC is able to support 1920x1080@60Hz, the maximum
resolution is 2048x2048 according to the hardware spec.

For the DC in LS7A2000, each display pipe is equipped with a built-in HDMI
encoder which is compliant with the HDMI 1.4 specification, thus it support
3840x2160@30Hz. The first display pipe is also equipped with a transparent
vga encoder which is parallel with the HDMI encoder. The DC in LS7A2000 is
more complete compare with the one in old chips, besides above feature, it
has two hardware cursors, two hardware vblank counter and two scanout
position recorders unit. It also support tiled framebuffer format which
can be used to scan out the framebuffer rendered by the LoongGPU directly.

 v1 -> v2:
  1) Use hpd status reg when polling for ls7a2000
  2) Fix all warnings emerged when compile with W=1

 v2 -> v3:
  1) Add COMPILE_TEST in Kconfig and make the driver off by default
  2) Alphabetical sorting headers (Thomas)
  3) Untangle register access functions as much as possible (Thomas)
  4) Switch to TTM based memory manager and prefer cached mapping
     for Loongson SoC (Thomas)
  5) Add chip id detection method, now all models are distinguishable.
  6) Revise builtin HDMI phy driver, nearly all main stream mode
     below 4K@30Hz is tested, this driver supported these mode very
     well including clone display mode and extend display mode.

 v3 -> v4:
  1) Quickly fix a small mistake.

 v4 -> v5:
  1) Drop potential support for Loongson 2K series SoC temporary,
     this part should be resend with the DT binding patch in the future.
  2) Add per display pipe debugfs support to the builtin HDMI encoder.
  3) Rewrite atomic_update() for hardware cursors plane(Thomas)
  4) Rewrite encoder and connector initialization part, untangle it
     according to the chip(Thomas).

 v5 -> v6:
  1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
  2) Fix all typos I could found, make sentences and code more readable
  3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
  4) After a serious consideration, we rename this driver as loongson.
     Because we also have drivers toward the LoongGPU IP in LS7A2000 and
     LS2K2000. Besides, there are also drivers about the external encoder,
     HDMI audio driver and vbios support etc. This patch only provide DC
     driver part, my teammate Li Yi believe that loongson will be more
     suitable for loongson graphics than lsdc in the long run.

     loongson.ko = LSDC + LoongGPU + encoders driver + vbios/DT ...

  v6 -> v7:
   1) Add prime support, self-sharing is works. sharing buffer with etnaviv
      is also tested, and its works with limitation.
   2) Implement buffer objects tracking with list_head.
   3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
   4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
      during BO creation. Patch V1 ~ V6 of this series no longer works
      on latest kernel. Thus, we send V7 to revival them.

  v7 -> v8:
   1) Zero a compile warnnings on 32-bit platform, compile with W=1
   2) Revise lsdc_bo_gpu_offset() and minor cleanup
   3) Pageflip tested on the virtual terminal with following commands

      modetest -M loongson -s 32:1920x1080 -v
      modetest -M loongson -s 34:1920x1080 -v -F tiles

     It works like a charm, when running pageflip test with dual screnn
     configuration, another two additional bo created by the modetest
     emerged, VRAM usage up to 40+MB, well we have at least 64MB, still
     enough.

     # cat bos

         bo[0000]: size:     8112kB VRAM
         bo[0001]: size:       16kB VRAM
         bo[0002]: size:       16kB VRAM
         bo[0003]: size:    16208kB VRAM
         bo[0004]: size:     8112kB VRAM
         bo[0005]: size:     8112kB VRAM

  v8 -> v9:
   1) Select I2C and I2C_ALGOBIT in Kconfig and should depend on MMU.
   2) Using pci_get_domain_bus_and_slot to get the GPU device.
   3) Other minor improvements.

   Those patches are tested on ls3a5000 + ls7a1000 CRB, ls3a5000 + ls7a2000
   evb, and lemote a1901 board(ls3a4000 + ls7a1000). On loongson mips CPU,
   the write combine support should be enabled, to get a decent performance
   for writing framebuffer data to the VRAM.

  v9 -> v10:
  1) Revise lsdc_drm_freeze() to implement S3 completely and correctly.
     I suddenly realized that pinned buffer can not move and VRAM lost
     power when sleep to RAM. Thus, the data in the buffer who is pinned
     in VRAM will get lost when resume. Yet it's not big problem because
     we are software rendering solution which relay on the CPU update the
     front framebuffer. We can see the garbage data when resume from S3,
     but the screen will show correct image as I move the cursor which is
     due to the cpu repaint. v10 of this patch make S3 perfect by unpin
     all of BOs in VRAM, evict them all to system RAM.

Sui Jingfeng (2):
  MAINTAINERS: add maintainers for DRM LOONGSON driver
  drm: add kms driver for loongson display controller

 MAINTAINERS                             |   7 +
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/loongson/Kconfig        |  17 +
 drivers/gpu/drm/loongson/Makefile       |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c    | 381 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c | 261 +++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.c     | 526 ++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h     | 324 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.c     | 294 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_gem.h     |  26 ++
 drivers/gpu/drm/loongson/lsdc_i2c.c     | 171 +++++++
 drivers/gpu/drm/loongson/lsdc_irq.c     |  86 ++++
 drivers/gpu/drm/loongson/lsdc_irq.h     |  12 +
 drivers/gpu/drm/loongson/lsdc_output.c  | 563 ++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h  |  14 +
 drivers/gpu/drm/loongson/lsdc_plane.c   | 432 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c     | 338 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h     |  76 ++++
 drivers/gpu/drm/loongson/lsdc_probe.c   |  86 ++++
 drivers/gpu/drm/loongson/lsdc_probe.h   |  11 +
 drivers/gpu/drm/loongson/lsdc_regs.h    | 370 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c     | 438 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h     |  72 +++
 24 files changed, 4524 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h

-- 
2.25.1

