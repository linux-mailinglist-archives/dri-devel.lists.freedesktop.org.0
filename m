Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4ED72C912
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8910E081;
	Mon, 12 Jun 2023 14:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A84410E081
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:58:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxzOqvModk1d8DAA--.8431S3;
 Mon, 12 Jun 2023 22:58:55 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxNeSuModkTncWAA--.64771S3; 
 Mon, 12 Jun 2023 22:58:54 +0800 (CST)
Message-ID: <d4e647d8-294c-abd7-40c6-37381796203d@loongson.cn>
Date: Mon, 12 Jun 2023 22:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 0/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230520105718.325819-1-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxNeSuModkTncWAA--.64771S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Zw1fJr48WryUuF1DXF1UArc_yoWDuF48pF
 47Ca4FkrWDJF12yr9rA3W8GFyrZa4fXFWS9F47X3sIg3yDAryDZrn8ZFW5JrW7ZFy7X342
 qr97GrW7G3ZIk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
 WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8_gA5UUUU
 U==
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Any ideas for this trivial DC driver? Sorry about my broken English.

What to do next? Send a new version?

Please Help!


On 2023/5/20 18:57, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Loongson display controller IP has been integrated in both Loongson north
> bridge chipset(ls7a1000/ls7a2000) and Loongson SoCs(ls2k1000/ls2k2000), it
> has been even included in Loongson self-made BMC products.
>
> This display controller is a PCI device. It has two display pipes and each
> display pipe support a primary plane and a cursor plane. For the DC in the
> ls7a1000 and ls2k1000, each display pipe has a DVO output interface which
> provide RGB888 signals, vertical & horizontal synchronisations and pixel
> clock. Each CRTC is able to support 1920x1080@60Hz, the maximum resolution
> of each display pipe is 2048x2048 according to the hardware spec.
>
> For the DC in LS7A2000, each display pipe is equipped with a built-in HDMI
> encoder which is compliant with the HDMI 1.4 specification, thus it support
> 3840x2160@30Hz. The first display pipe is also equipped with a transparent
> vga encoder which is parallel with the HDMI encoder. The DC in LS7A2000 is
> more complete compare with the one in old chips, besides above feature, it
> has two hardware cursors, two hardware vblank counter and two scanout
> position recorders unit. It also support tiled framebuffer format which
> can be scanout the tiled framebuffer rendered by the LoongGPU directly.
>
> v1 -> v2:
>   1) Use hpd status reg when polling for ls7a2000
>   2) Fix all warnings emerged when compile with W=1
>
> v2 -> v3:
>   1) Add COMPILE_TEST in Kconfig and make the driver off by default
>   2) Alphabetical sorting headers (Thomas)
>   3) Untangle register access functions as much as possible (Thomas)
>   4) Switch to TTM based memory manager and prefer cached mapping
>      for Loongson SoC (Thomas)
>   5) Add chip id detection method, now all models are distinguishable.
>   6) Revise builtin HDMI phy driver, nearly all main stream mode
>      below 4K@30Hz is tested, this driver supported these mode very
>      well including clone display mode and extend display mode.
>
> v3 -> v4:
>   1) Quickly fix a small mistake.
>
> v4 -> v5:
>   1) Drop potential support for Loongson 2K series SoC temporary,
>      this part should be resend with the DT binding patch in the future.
>   2) Add per display pipe debugfs support to the builtin HDMI encoder.
>   3) Rewrite atomic_update() for hardware cursors plane(Thomas)
>   4) Rewrite encoder and connector initialization part, untangle it
>      according to the chip(Thomas).
>
> v5 -> v6:
>   1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
>   2) Fix all typos I could found, make sentences and code more readable
>   3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
>   4) After a serious consideration, we rename this driver as loongson.
>      Because we also have drivers toward the LoongGPU IP in LS7A2000 and
>      LS2K2000. Besides, there are also drivers about the external encoder,
>      HDMI audio driver and vbios support etc. This patch only provide DC
>      driver part, my teammate Li Yi believe that loongson will be more
>      suitable for loongson graphics than lsdc in the long run.
>
>      loongson.ko = LSDC + LoongGPU + encoders driver + vbios/DT ...
>
> v6 -> v7:
>   1) Add prime support, self-sharing is works. sharing buffer with etnaviv
>      is also tested, and its works with limitation.
>   2) Implement buffer objects tracking with list_head.
>   3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
>   4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
>      during BO creation. Patch V1 ~ V6 of this series no longer works
>      on latest kernel. Thus, we send V7 to revival them.
>
> v7 -> v8:
>   1) Zero a compile warnnings on 32-bit platform, compile with W=1
>   2) Revise lsdc_bo_gpu_offset() and minor cleanup
>   3) Pageflip tested on the virtual terminal with following commands
>
>      modetest -M loongson -s 32:1920x1080 -v
>      modetest -M loongson -s 34:1920x1080 -v -F tiles
>
>     It works like a charm, when running pageflip test with dual screnn
>     configuration, another two additional bo created by the modetest
>     emerged, VRAM usage up to 40+MB, well we have at least 64MB, still
>     enough.
>
>     # cat bos
>
>         bo[0000]: size:     8112kB VRAM
>         bo[0001]: size:       16kB VRAM
>         bo[0002]: size:       16kB VRAM
>         bo[0003]: size:    16208kB VRAM
>         bo[0004]: size:     8112kB VRAM
>         bo[0005]: size:     8112kB VRAM
>
> v8 -> v9:
>   1) Select I2C and I2C_ALGOBIT in Kconfig and should depend on MMU.
>   2) Using pci_get_domain_bus_and_slot to get the GPU device.
>   3) Other minor improvements.
>
>   Those patches are tested on ls3a5000 + ls7a1000 CRB, ls3a5000 + ls7a2000
>   evb, and lemote a1901 board(ls3a4000 + ls7a1000). On loongson mips CPU,
>   the write combine support should be enabled, to get a decent performance
>   for writing framebuffer data to the VRAM.
>
> v9 -> v10:
>   1) Revise lsdc_drm_freeze() to implement S3 completely and correctly.
>      I suddenly realized that pinned buffer can not move and VRAM lost
>      power when sleep to RAM. Thus, the data in the buffer who is pinned
>      in VRAM will get lost when resume. Yet it's not big problem because
>      we are software rendering solution which relay on the CPU update the
>      front framebuffer. We can see the garbage data when resume from S3,
>      but the screen will show correct image as I move the cursor. This is
>      due to the cpu repaint. v10 of this patch make S3 perfect by unpin
>      all of BOs in VRAM, evict them all to system RAM.
>
> v10 -> v11:
>   1) On double screen case, the single giant framebuffer is referenced by
>      two GEM object, hence, it will be pinned by prepare_fb() at lease two
>      times. This cause its pin count > 1. V10 of this patch only unpin VRAM
>      BOs once when suspend, which is not correct on double screen case. V11
>      of this patch unpin BOs until its pin count reach to zero when suspend.
>      Then, we make the S3 support complete finally. With v11, I can't see
>      any garbage data after resume. Tested on both ls7a1000 and ls7a2000
>      platform, with single screen and double screen configuration.
>   2) Fix vblank wait timeout when disable CRTC.
>   3) Test against IGT, at least fbdev test and kms_flip test passed.
>   4) Rewrite pixel PLL update function, magic numbers eliminated (Emil)
>   5) Drop a few common hardware features description in lsdc_desc (Emil)
>   6) Drop lsdc_mode_config_mode_valid(), instead add restrictions in dumb
>      create function. (Emil)
>   7) Untangle the ls7a1000 case and ls7a2000 case completely (Thomas)
>
> v11 -> v12:
>   none
>
> v12 -> v13:
>   1) Add benchmark to figure out the bandwidth of the hardware platform.
>      Usage:
>      # cd /sys/kernel/debug/dri/0/
>      # cat benchmark
>
>   2) VRAM is filled with garbage data if uninitialized, add a buffer
>      clearing procedure, clear it on the BO creation time.
>   3) Update copyrights and adjust coding style (Huacai)
>
> v13 -> v14:
>   1) Trying to add async update support for cursor plane.
>
> Sui Jingfeng (2):
>    drm: add kms driver for loongson display controller
>    MAINTAINERS: add maintainers for DRM LOONGSON driver
>
>   MAINTAINERS                                   |    8 +
>   drivers/gpu/drm/Kconfig                       |    2 +
>   drivers/gpu/drm/Makefile                      |    1 +
>   drivers/gpu/drm/loongson/Kconfig              |   17 +
>   drivers/gpu/drm/loongson/Makefile             |   20 +
>   drivers/gpu/drm/loongson/lsdc_benchmark.c     |  133 ++
>   drivers/gpu/drm/loongson/lsdc_benchmark.h     |   13 +
>   drivers/gpu/drm/loongson/lsdc_crtc.c          | 1066 +++++++++++++++++
>   drivers/gpu/drm/loongson/lsdc_debugfs.c       |   91 ++
>   drivers/gpu/drm/loongson/lsdc_device.c        |  104 ++
>   drivers/gpu/drm/loongson/lsdc_drv.c           |  495 ++++++++
>   drivers/gpu/drm/loongson/lsdc_drv.h           |  451 +++++++
>   drivers/gpu/drm/loongson/lsdc_gem.c           |  324 +++++
>   drivers/gpu/drm/loongson/lsdc_gem.h           |   37 +
>   drivers/gpu/drm/loongson/lsdc_gfxpll.c        |  199 +++
>   drivers/gpu/drm/loongson/lsdc_gfxpll.h        |   52 +
>   drivers/gpu/drm/loongson/lsdc_i2c.c           |  179 +++
>   drivers/gpu/drm/loongson/lsdc_i2c.h           |   29 +
>   drivers/gpu/drm/loongson/lsdc_irq.c           |   71 ++
>   drivers/gpu/drm/loongson/lsdc_irq.h           |   16 +
>   drivers/gpu/drm/loongson/lsdc_output.h        |   21 +
>   drivers/gpu/drm/loongson/lsdc_output_7a1000.c |  161 +++
>   drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  531 ++++++++
>   drivers/gpu/drm/loongson/lsdc_pixpll.c        |  481 ++++++++
>   drivers/gpu/drm/loongson/lsdc_pixpll.h        |   86 ++
>   drivers/gpu/drm/loongson/lsdc_plane.c         |  781 ++++++++++++
>   drivers/gpu/drm/loongson/lsdc_probe.c         |   56 +
>   drivers/gpu/drm/loongson/lsdc_probe.h         |   12 +
>   drivers/gpu/drm/loongson/lsdc_regs.h          |  402 +++++++
>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  610 ++++++++++
>   drivers/gpu/drm/loongson/lsdc_ttm.h           |   99 ++
>   31 files changed, 6548 insertions(+)
>   create mode 100644 drivers/gpu/drm/loongson/Kconfig
>   create mode 100644 drivers/gpu/drm/loongson/Makefile
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_device.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a1000.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a2000.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h
>
-- 
Jingfeng

