Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A56FA11F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED95C10E12A;
	Mon,  8 May 2023 07:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id B859410E12A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:33:59 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:48392.2047955144
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id BA7B910023D;
 Mon,  8 May 2023 15:33:53 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-6qwzn with ESMTP id
 0bbb1b79ff9a4e41bf60092d3c6a1e39 for maarten.lankhorst@linux.intel.com; 
 Mon, 08 May 2023 15:33:57 CST
X-Transaction-ID: 0bbb1b79ff9a4e41bf60092d3c6a1e39
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <c704eaae-e0b6-262c-4a2b-80e80062532b@189.cn>
Date: Mon, 8 May 2023 15:33:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 0/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230504080406.1213623-1-suijingfeng@loongson.cn>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230504080406.1213623-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: loongson-kernel@lists.loongnix.cn, Nathan Chancellor <nathan@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is tested against IGT,


1) fbdev test passed


IGT-Version: 1.27.1-gce91d123 (loongarch64) (Linux: 6.3.0+ loongarch64)
Starting subtest: info
Subtest info: SUCCESS (0.000s)
Starting subtest: pan
Subtest pan: SUCCESS (0.042s)
Starting subtest: read
Subtest read: SUCCESS (0.012s)
Starting subtest: unaligned-read
Subtest unaligned-read: SUCCESS (0.003s)
Starting subtest: write
Subtest write: SUCCESS (0.024s)
Starting subtest: unaligned-write
Subtest unaligned-write: SUCCESS (0.003s)
Starting subtest: eof
Subtest eof: SUCCESS (0.000s)
Starting subtest: nullptr
Subtest nullptr: SUCCESS (0.000s)


2) fbtest from geert also show good results:


Using drawops cfb32 (32 bpp packed pixels)
Available visuals:
   Monochrome
   Grayscale 256
   Truecolor 8:8:8:0
Using visops truecolor
Running all tests
test001: PASSED
test002: PASSED
test003: PASSED
test004: PASSED
test005: PASSED
test006: PASSED
test008: PASSED
test009: PASSED
test010: PASSED
Benchmarking... 10x10 squares: 461.49 Mpixels/s
Benchmarking... 20x20 squares: 984.74 Mpixels/s
Benchmarking... 50x50 squares: 2253.04 Mpixels/s
Benchmarking... 100x100 squares: 2218.78 Mpixels/s
Benchmarking... 200x200 squares: 2880.41 Mpixels/s
Benchmarking... 500x500 squares: 3642.36 Mpixels/s
Benchmarking... 1000x1000 squares: 3931.25 Mpixels/s
test012: PASSED
Benchmarking... R5 circles: 258.73 Mpixels/s
Benchmarking... R10 circles: 605.78 Mpixels/s
Benchmarking... R25 circles: 1513.02 Mpixels/s
Benchmarking... R50 circles: 1970.00 Mpixels/s
Benchmarking... R100 circles: 2481.70 Mpixels/s
Benchmarking... R250 circles: 3274.97 Mpixels/s
Benchmarking... R500 circles: 3722.24 Mpixels/s
test013: PASSED


On 2023/5/4 16:04, Sui Jingfeng wrote:
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
>      any garbage data after resume. Teste on both ls7a1000 and ls7a2000
>      platform, with single screen and double screen configuration tested.
>   2) Fix vblank wait timeout when disable CRTC.
>   3) Test against IGT, at least fbdev test and kms_flip test of it passed,
>      while most tests of it passed.
>   4) Rewrite pixel PLL update function, magic numbers eliminated (Emil)
>   5) Drop a few common hardware features description in lsdc_desc (Emil)
>   6) Drop lsdc_mode_config_mode_valid(), instead add restrictions in dumb
>      create function. (Emil)
>   7) Untangle the ls7a1000 case and ls7a2000 case completely (Thomas)
>
> v11 -> v12:
>   none
>
> Sui Jingfeng (2):
>    MAINTAINERS: add maintainers for DRM LOONGSON driver
>    drm: add kms driver for loongson display controller
>
>   MAINTAINERS                                 |    7 +
>   drivers/gpu/drm/Kconfig                     |    2 +
>   drivers/gpu/drm/Makefile                    |    1 +
>   drivers/gpu/drm/loongson/Kconfig            |   17 +
>   drivers/gpu/drm/loongson/Makefile           |   19 +
>   drivers/gpu/drm/loongson/ls7a1000_outputs.c |  160 +++
>   drivers/gpu/drm/loongson/ls7a2000_outputs.c |  534 ++++++++++
>   drivers/gpu/drm/loongson/lsdc_crtc.c        | 1064 +++++++++++++++++++
>   drivers/gpu/drm/loongson/lsdc_debugfs.c     |   78 ++
>   drivers/gpu/drm/loongson/lsdc_device.c      |  104 ++
>   drivers/gpu/drm/loongson/lsdc_drv.c         |  484 +++++++++
>   drivers/gpu/drm/loongson/lsdc_drv.h         |  485 +++++++++
>   drivers/gpu/drm/loongson/lsdc_gem.c         |  319 ++++++
>   drivers/gpu/drm/loongson/lsdc_gem.h         |   37 +
>   drivers/gpu/drm/loongson/lsdc_gfxpll.c      |  199 ++++
>   drivers/gpu/drm/loongson/lsdc_gfxpll.h      |   52 +
>   drivers/gpu/drm/loongson/lsdc_i2c.c         |  179 ++++
>   drivers/gpu/drm/loongson/lsdc_i2c.h         |   29 +
>   drivers/gpu/drm/loongson/lsdc_irq.c         |   81 ++
>   drivers/gpu/drm/loongson/lsdc_irq.h         |   16 +
>   drivers/gpu/drm/loongson/lsdc_output.h      |   21 +
>   drivers/gpu/drm/loongson/lsdc_pixpll.c      |  485 +++++++++
>   drivers/gpu/drm/loongson/lsdc_pixpll.h      |   86 ++
>   drivers/gpu/drm/loongson/lsdc_plane.c       |  639 +++++++++++
>   drivers/gpu/drm/loongson/lsdc_probe.c       |   56 +
>   drivers/gpu/drm/loongson/lsdc_probe.h       |   12 +
>   drivers/gpu/drm/loongson/lsdc_regs.h        |  400 +++++++
>   drivers/gpu/drm/loongson/lsdc_ttm.c         |  547 ++++++++++
>   drivers/gpu/drm/loongson/lsdc_ttm.h         |   88 ++
>   29 files changed, 6201 insertions(+)
>   create mode 100644 drivers/gpu/drm/loongson/Kconfig
>   create mode 100644 drivers/gpu/drm/loongson/Makefile
>   create mode 100644 drivers/gpu/drm/loongson/ls7a1000_outputs.c
>   create mode 100644 drivers/gpu/drm/loongson/ls7a2000_outputs.c
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
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
>   create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h
>
