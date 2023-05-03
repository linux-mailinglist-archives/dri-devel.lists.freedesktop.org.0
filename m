Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF36F61DB
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FCB10E19A;
	Wed,  3 May 2023 23:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BAEE10E165
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 23:14:03 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxdfC56lJk804EAA--.7138S3;
 Thu, 04 May 2023 07:14:01 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_7O46lJk5dZIAA--.3684S2; 
 Thu, 04 May 2023 07:14:00 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>, emil.l.velikov@gmail.com
Subject: [PATCH v11 0/2] drm: add kms driver for loongson display controller
Date: Thu,  4 May 2023 07:13:58 +0800
Message-Id: <20230503231400.995613-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_7O46lJk5dZIAA--.3684S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtr47ZFy8uw48uFyktFyDtrb_yoWftr43pF
 43Aa4FkrWDJF12yr9xA3W8GFyfAa4fXFWS9F43J3sIg3yDAFyUZr15ZFW5JrW7ZFy7Xry2
 qr97Kr4UG3ZFkaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
 14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0
 HqcUUUUU=
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
bridge chipset(ls7a1000/ls7a2000) and Loongson SoCs(ls2k1000/ls2k2000), it
has been even included in Loongson self-made BMC products.

This display controller is a PCI device. It has two display pipes and each
display pipe support a primary plane and a cursor plane. For the DC in the
ls7a1000 and ls2k1000, each display pipe has a DVO output interface which
provide RGB888 signals, vertical & horizontal synchronisations and pixel
clock. Each CRTC is able to support 1920x1080@60Hz, the maximum resolution
of each display pipe is 2048x2048 according to the hardware spec.

For the DC in LS7A2000, each display pipe is equipped with a built-in HDMI
encoder which is compliant with the HDMI 1.4 specification, thus it support
3840x2160@30Hz. The first display pipe is also equipped with a transparent
vga encoder which is parallel with the HDMI encoder. The DC in LS7A2000 is
more complete compare with the one in old chips, besides above feature, it
has two hardware cursors, two hardware vblank counter and two scanout
position recorders unit. It also support tiled framebuffer format which
can be scanout the tiled framebuffer rendered by the LoongGPU directly.

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
      but the screen will show correct image as I move the cursor. This is
      due to the cpu repaint. v10 of this patch make S3 perfect by unpin
      all of BOs in VRAM, evict them all to system RAM.

  v10 -> v11
   1) On double screen case, the single giant framebuffer is referenced by
      two GEM object, hence, it will be pinned by prepare_fb() at lease two
      times. This cause its pin count > 1. V10 of this patch only unpin
      BOs in VRAM once before suspend, which is not correct on double
      screen case. V11 of this patch unpin BOs until its pin count reach to
      zero when suspend. Then, resume with double screen works very well.
      Teste on both ls7a1000 and ls7a2000 platform. V10 only works on
      single screen case.

   2) Fix vblank wait timeout when disable CRTC and run kms_flip test.

   3) Test against, at least fbdev test and kms_flip test of IGT passed,
      while most of the tests passed.

   4) Rewrite pixel PLL update function, magic numbers eliminated (Emil)

   5) Drop a few common hardware features description in lsdc_desc (Emil)

   6) Drop lsdc_mode_config_mode_valid(), instead add restrictions in dumb
      create function. (Emil)

   7) Untangle the ls7a1000 case and ls7a2000 case completely. (Thomas)

Sui Jingfeng (2):
  MAINTAINERS: add maintainers for DRM LOONGSON driver
  drm: add kms driver for loongson display controller

 MAINTAINERS                                 |    7 +
 drivers/gpu/drm/Kconfig                     |    2 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/loongson/Kconfig            |   17 +
 drivers/gpu/drm/loongson/Makefile           |   19 +
 drivers/gpu/drm/loongson/ls7a1000_outputs.c |  160 +++
 drivers/gpu/drm/loongson/ls7a2000_outputs.c |  534 ++++++++++
 drivers/gpu/drm/loongson/lsdc_crtc.c        | 1064 +++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c     |   78 ++
 drivers/gpu/drm/loongson/lsdc_device.c      |  104 ++
 drivers/gpu/drm/loongson/lsdc_drv.c         |  485 +++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h         |  485 +++++++++
 drivers/gpu/drm/loongson/lsdc_gem.c         |  319 ++++++
 drivers/gpu/drm/loongson/lsdc_gem.h         |   37 +
 drivers/gpu/drm/loongson/lsdc_gfxpll.c      |  199 ++++
 drivers/gpu/drm/loongson/lsdc_gfxpll.h      |   52 +
 drivers/gpu/drm/loongson/lsdc_i2c.c         |  179 ++++
 drivers/gpu/drm/loongson/lsdc_i2c.h         |   29 +
 drivers/gpu/drm/loongson/lsdc_irq.c         |   81 ++
 drivers/gpu/drm/loongson/lsdc_irq.h         |   16 +
 drivers/gpu/drm/loongson/lsdc_output.h      |   21 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c      |  485 +++++++++
 drivers/gpu/drm/loongson/lsdc_pixpll.h      |   86 ++
 drivers/gpu/drm/loongson/lsdc_plane.c       |  639 +++++++++++
 drivers/gpu/drm/loongson/lsdc_probe.c       |   56 +
 drivers/gpu/drm/loongson/lsdc_probe.h       |   14 +
 drivers/gpu/drm/loongson/lsdc_regs.h        |  400 +++++++
 drivers/gpu/drm/loongson/lsdc_ttm.c         |  547 ++++++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h         |   88 ++
 29 files changed, 6204 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/ls7a1000_outputs.c
 create mode 100644 drivers/gpu/drm/loongson/ls7a2000_outputs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_device.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h

-- 
2.25.1

