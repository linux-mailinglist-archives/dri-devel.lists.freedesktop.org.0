Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679844A80A8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C9210E5B5;
	Thu,  3 Feb 2022 08:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EBB89B7D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:53:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4988B8337B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1863BC340F4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643878429;
 bh=r6lyNep09hg6zAYM0J1b32KfTB57HJS3iY7E+yXog28=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RoIFqGQIXYvndP6QkNHl4/Fa21+1omZdTgT7Urv2Rk+w11PSROrhrN3uUo4qJFY7e
 mn2qNTG4oTun0lQOGFg6NzrSTjWY1fPaK0qdxze3Qwz/xvuHpjJ1uRGM+NrBLvmgkK
 b3lim/sbZGVx+FjHgGQtUotFI73PC/BASv6p1l4fVx5woSmV4VEBgiMK53gzG0LJjx
 UEl14d3OulsCfvpU9DcMhjkqcWRKo0A+5c3KED6/SrnOykD+gj36aDAciXnGkz6ojx
 3e2nqF/F8AyiKfycxvKVZsSXYTYlu8RAo4HSOmIN+TBoIWlCYbvacbF9WeUYX0p3gr
 OMpVegIKzEhSQ==
Received: by mail-yb1-f179.google.com with SMTP id k31so6793947ybj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 00:53:49 -0800 (PST)
X-Gm-Message-State: AOAM530L4EAMr29qTUmQgSqNBrE+8PYDbpI2tIvhyOlM7VuQev5vYwJn
 m/zP6D76xCYV34noDp0tvX/ICUG+lXTg84XDdU4=
X-Google-Smtp-Source: ABdhPJyXIAAub9u0zfjNkdxHNQJzlFSal2KXAvwlGMcHknLarocCqguGgGUxXDZEOpYyQz9DcsCX3qWLejKrZRnyZIg=
X-Received: by 2002:a25:180a:: with SMTP id 10mr50802078yby.552.1643878428001; 
 Thu, 03 Feb 2022 00:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
In-Reply-To: <20220203082546.3099-2-15330273260@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Feb 2022 09:53:35 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
Message-ID: <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 at 09:26, Sui Jingfeng <15330273260@189.cn> wrote:
>
> From: suijingfeng <suijingfeng@loongson.cn>
>
> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> bridge, and the DC in those chip is a PCI device. This patch provide
> a minimal support for this display controller which is mainly for
> graphic environment bring up.
>
> This display controller has two display pipes but with only one hardware
> cursor. Each way has a DVO output interface and the CRTC is able to scanout
> from 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048@60hz.
>
> LS2K1000 is a SoC, only system memory is available. Therefore scanout from
> system memory is the only choice. We prefer the CMA helper base solution
> because the gc1000 gpu can use etnaviv driver, in this case etnaviv and
> lsdc could made a compatible pair. Even through it is possible to use VRAM
> helper base solution on ls2k1000 by carving out part of system memory as
> VRAM.
>
> For LS7A1000, there are 4 gpios whos control register is located at the dc
> register space which is not the geneal purpose GPIO. The 4 gpios can emulate
> two way i2c. One for DVO0, another for DVO1. This is the reason the why we
> are not using the drm bridge framework.
>
> LS2K1000 and LS2K0500 SoC don't have such hardware, they use general purpose
> GPIO emulated i2c or hardware i2c adapter from other module to serve this
> purpose. Drm bridge and drm panel is suitable for those SoC, we have already
> implement it on our own downstream kernel. But due to the upstream kernel
> don't have gpio, pwm and i2c driver support for LS2K1000. We just can not
> upstream our support for the drm bridge subsystem.
>
> The DC in LS7A1000 can scanout from both the system memory and the dedicate
> VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
> VRAM is proved to be a reliable solution for massive product. Scanout from
> the system memory suffer from some hardware deficiency which cause the
> screen flickering under RAM pressure. This is the reason why we integrate
> two distict helpers into one piece of device driver. But CMA base helper is
> still usable on ls7a1000 for normal usage, expecially on ls7a1000+ bridge
> chip. We have also implemented demage update on top of CMA helper which
> copy the demaged shadow framebuffer region from system RAM to the real
> framebuffer in VRAM manually. Using "lsdc.dirty_update=1" in the commmand
> line will enable this driver mode.
>
> LS7A1000 have a 32x32 harware cursor, we just let the two CRTC share it
> simply with the help of universe plane. LS7A2000 have two 64x64 harware
> cursor. Surport for LS7A2000 is on the way.
>
> In short, we have built-in gpio emulated i2c support, we also have hardware
> cursor support. The kind of tiny drivers in drm/tiny is not suitable for us,
> we are not "tiny".
>
>     +------+  HyperTransport 3.0
>     | DDR4 |       |
>     +------+       |     +------------------------------------+
>        || MC0      |     |   LS7A1000            +------------|
>   +----------+     |     |                       |    DDR3    |   +------+
>   | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
>   |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
>   +----------+           | +--------+  +-+---+-+ +------------|
>        || MC1            +---------------|---|----------------+
>     +------+                             |   |
>     | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
>     +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
>                       +-------+                       +------+
>
> The above picture give a simple usage of LS7A1000, note that the encoder
> is not necessary adv7125 or tfp410, it is a choice of the downstream board
> manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
> etc. Therefore, we need device tree to provide board specific information.
> Besides, the dc in both ls2k1000 and ls7k1000 have the vendor:device id of
> 0x0014:0x7a06, the reverison id is also same. We can't tell it apart simply
> (this is the firmware engineer's mistake). But firmware already flushed to
> the board and borad already sold out, we choose to resolve those issues by
> introduing device tree with board specific device support.
>
> For lsdc, there is only a 1:1 mapping of encoders and connectors.
>
>      +-------------------+                                      _________
>      |                   |                                     |         |
>      |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monitor |
>      |                   |           ^            ^            |_________|
>      |                   |           |            |
>      |                <----- i2c0 ----------------+
>      |   LSDC IP CORE    |
>      |                <----- i2c1 ----------------+
>      |                   |           |            |             _________
>      |                   |           |            |            |         |
>      |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
>      |                   |                                     |_________|
>      +-------------------+
>
> Below is a brief introduction of loongson's CPU, bridge chip and SoC.
> LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
> a bridge chip made by Loongson corporation which act as north and/or south
> bridge of loongson's desktop and server level processor. It is equivalent
> to AMD RS780E+SB710 or something like that. More details can be read from
> its user manual[2].
>
> This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
> LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
> LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
> LS3A5000 is 4 core 2.5gHz loongarch cpu[3].
>
> Nearly all mordern loongson CPU's cache coherency is maintained by hardware,
> except for early version of ls2k1000. So we using cached coherent memory by
> default, not writecombine.
>
> v2: fixup warnings reported by kernel test robot
>
> v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>     more details about lsdc.
>
> v4:
>    1) Add dts required and explain why device tree is required.
>    2) Give more description about lsdc and vram helper base driver.
>    3) Fix warnings reported by kernel test robot.
>    4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>       stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500 SoC.
>       But ls7a2000 improve it to 32 bytes, We are prepare for extend the
>       support for the on coming device.
>
> v5:
>    1) using writel and readl replace writeq and readq, to fix kernel test
>       robot report build error on other archtecture
>    2) set default fb format to XRGB8888 at crtc reset time.
>    3) fix typos.
>
> v6:
>    1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
>    2) Explain why tiny drm driver is not suitable for us.
>    3) Give a short description of the trival dirty uppdate implement based
>       on CMA helper.
>    4) code clean up
>
> [1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
> [2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
> [3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  drivers/gpu/drm/Kconfig               |   2 +
>  drivers/gpu/drm/Makefile              |   1 +
>  drivers/gpu/drm/lsdc/Kconfig          |  38 ++
>  drivers/gpu/drm/lsdc/Makefile         |  15 +
>  drivers/gpu/drm/lsdc/lsdc_connector.c | 443 ++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_connector.h |  60 ++
>  drivers/gpu/drm/lsdc/lsdc_crtc.c      | 440 ++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_drv.c       | 846 ++++++++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_drv.h       | 216 +++++++
>  drivers/gpu/drm/lsdc/lsdc_encoder.c   |  79 +++
>  drivers/gpu/drm/lsdc/lsdc_i2c.c       | 220 +++++++
>  drivers/gpu/drm/lsdc/lsdc_i2c.h       |  61 ++
>  drivers/gpu/drm/lsdc/lsdc_irq.c       |  77 +++
>  drivers/gpu/drm/lsdc/lsdc_irq.h       |  37 ++
>  drivers/gpu/drm/lsdc/lsdc_plane.c     | 681 +++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_pll.c       | 657 ++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_pll.h       | 109 ++++
>  drivers/gpu/drm/lsdc/lsdc_regs.h      | 246 ++++++++
>  18 files changed, 4228 insertions(+)
>  create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>  create mode 100644 drivers/gpu/drm/lsdc/Makefile
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_encoder.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dfdd3ec5f793..18de1485e2ed 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -405,6 +405,8 @@ source "drivers/gpu/drm/gud/Kconfig"
>
>  source "drivers/gpu/drm/sprd/Kconfig"
>
> +source "drivers/gpu/drm/lsdc/Kconfig"
> +
>  config DRM_HYPERV
>         tristate "DRM Support for Hyper-V synthetic video device"
>         depends on DRM && PCI && MMU && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8675c2af7ae1..2c5a76ced323 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -133,3 +133,4 @@ obj-y                       += xlnx/
>  obj-y                  += gud/
>  obj-$(CONFIG_DRM_HYPERV) += hyperv/
>  obj-$(CONFIG_DRM_SPRD) += sprd/
> +obj-$(CONFIG_DRM_LSDC) += lsdc/
> diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
> new file mode 100644
> index 000000000000..7ed1b0fdbe1b
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/Kconfig
> @@ -0,0 +1,38 @@

SPDX (GPL-2.0) needed.

> +config DRM_LSDC
> +       tristate "DRM Support for loongson's display controller"
> +       depends on DRM && PCI
> +       depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
> +       select OF
> +       select CMA if HAVE_DMA_CONTIGUOUS
> +       select DMA_CMA if HAVE_DMA_CONTIGUOUS
> +       select DRM_KMS_HELPER
> +       select DRM_KMS_FB_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       select VIDEOMODE_HELPERS
> +       select BACKLIGHT_PWM if CPU_LOONGSON2K
> +       select I2C_GPIO if CPU_LOONGSON2K
> +       select I2C_LS2X if CPU_LOONGSON2K
> +       default m
> +       help
> +         This is a KMS driver for the display controller in the LS7A1000
> +         bridge chip and LS2K1000 SoC. The display controller has two
> +         display pipes and it is a PCI device.
> +         When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
> +         is located at system memory.
> +         If "M" is selected, the module will be called lsdc.
> +
> +         If in doubt, say "Y".
> +
> +config DRM_LSDC_VRAM_DRIVER
> +       bool "vram helper based device driver support"
> +       depends on DRM_LSDC
> +       select DRM_VRAM_HELPER
> +       default y
> +       help
> +         When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
> +         platform, the LS7A1000 bridge chip has dedicated video RAM. Using
> +         "lsdc.use_vram_helper=1" in the kernel command line will enable
> +         this driver mode and then the framebuffer will be located at the
> +         VRAM at the price of losing PRIME support.
> +
> +         If in doubt, say "Y".
> diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
> new file mode 100644
> index 000000000000..342990654478
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/Makefile
> @@ -0,0 +1,15 @@

SPDX

> +#
> +# Makefile for the lsdc drm device driver.
> +#
> +
> +lsdc-y := \
> +       lsdc_drv.o \
> +       lsdc_crtc.o \
> +       lsdc_irq.o \
> +       lsdc_plane.o \
> +       lsdc_pll.o \
> +       lsdc_i2c.o \
> +       lsdc_encoder.o \
> +       lsdc_connector.o
> +
> +obj-$(CONFIG_DRM_LSDC) += lsdc.o
> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
> new file mode 100644
> index 000000000000..ae5fc0c90961
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.

This does not look like compliant with GPL-2.0. You cannot call a
license GPL-2.0 and restrict it with some other provisions.

Please fix the licensing.

> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_connector.h>
> +
> +#include <video/videomode.h>
> +#include <video/of_display_timing.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_i2c.h"
> +#include "lsdc_connector.h"
> +
> +
> +static int lsdc_get_modes_from_edid(struct drm_connector *connector)
> +{
> +       struct drm_device *ddev = connector->dev;
> +       struct lsdc_connector *lconn = to_lsdc_connector(connector);
> +       struct edid *edid_p = (struct edid *)lconn->edid_data;
> +       int num = drm_add_edid_modes(connector, edid_p);
> +
> +       if (num)
> +               drm_connector_update_edid_property(connector, edid_p);
> +
> +       drm_dbg_kms(ddev, "%d modes added\n", num);
> +
> +       return num;
> +}
> +
> +

Do not use double blank lines. Single line. Here and in all other places.

Best regards,
Krzysztof
