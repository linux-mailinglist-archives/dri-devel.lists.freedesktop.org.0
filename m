Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBCC7C82F7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4174510E0DE;
	Fri, 13 Oct 2023 10:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41EAE10E0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 10:28:30 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxqOjMGyllwa8xAA--.59603S3;
 Fri, 13 Oct 2023 18:28:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxni+yGyll7b4iAA--.7722S3; 
 Fri, 13 Oct 2023 18:28:26 +0800 (CST)
Message-ID: <037ec619-c170-4ca6-897e-04fccd58c62a@loongson.cn>
Date: Fri, 13 Oct 2023 18:28:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/loongson: Add support for the DC in LS2K1000 SoC
To: Icenowy Zheng <uwu@icenowy.me>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231011162638.819080-1-suijingfeng@loongson.cn>
 <26565c5e13e72c64214a7f67ab6f2d9d876fa4bd.camel@icenowy.me>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <26565c5e13e72c64214a7f67ab6f2d9d876fa4bd.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxni+yGyll7b4iAA--.7722S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWDAr43WF4xXF1kAw4fJrWUGFX_yoWrtw15Ao
 WUKr15Jr45Jr1UGr1UJr1UJr13JF1UJrnrtr1UGry7Jr1UJF1UJ34UJryUt3yUJr18Gr1U
 Ar1UJr1UAFyUAr15l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYU7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
 aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUUU
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/13 16:22, Icenowy Zheng wrote:
> 在 2023-10-12星期四的 00:26 +0800，Sui Jingfeng写道：
>> LS2K1000 is a low end SoC (two core 1.0gHz), it don't has dedicated
>> VRAM.
>> It requires the framebuffer to be phisically continguous to scanout.
>> The
>> display controller in LS2K1000 don't has built-in GPIO hardware, the
>> structure (register bit field) of its pixel, DC, GPU, DDR PLL are
>> also
>> defferent from other model. But for the display controller itself,
>> Most of
>> hardware features of it are same with ls7a1000.
>>
>> Below is a simple dts for it.
> Why don't you write a proper, YAML-formatted binding?
>
This patch use only one DT property, that is the "memory-region = <&display_reserved>;".
But the memory-region property is a common property, I means that everyone know how to
use this property. I'm not sure the if YAML documentation is strictly required now. And
the checkpatch.pl show no warnings to me.

> This will help handling the correctness of device trees, and a binding
> is required to allow the driver to enter.

Yeah, this may be true. But I have forget the rules and I don't know 
what the status now. I remember that a reviewer told me to drop dts and 
write(provide) generic code only in the past. Maybe the arch-specific 
maintainers want to provide a dts.  I don't know what's the status for now, I am waiting some feedback.


>> aliases {
>>          i2c0 = &i2c0;
>>          i2c1 = &i2c1;
>> };
>>
>> reserved-memory {
>>          #address-cells = <2>;
>>          #size-cells = <2>;
>>          ranges;
>>
>>          display_reserved: framebuffer@30000000 {
>>                    compatible = "shared-dma-pool";
>>                    reg = <0x0 0x20000000 0x0 0x08000000>; /* 128M */
>>                    linux,cma-default;
>>          };
>> };
>>
>> i2c0: i2c-gpio-0 {
>>          compatible = "i2c-gpio";
>>          scl-gpios = <&gpio0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>          sda-gpios = <&gpio0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>          i2c-gpio,delay-us = <5>;        /* ~100 kHz */
>>          status = "okay";
>> };
>>
>> i2c1: i2c-gpio-1 {
>>          compatible = "i2c-gpio";
>>          scl-gpios = <&gpio0 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>          sda-gpios = <&gpio0 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>          i2c-gpio,delay-us = <5>;        /* ~100 kHz */
>>          status = "okay";
>> };
>>
>> display-controller@6,0 {
>>          reg = <0x3000 0x0 0x0 0x0 0x0>;
>>          interrupt-parent = <&liointc0>;
>>          interrupts = <28 IRQ_TYPE_LEVEL_HIGH>
>>          memory-region = <&display_reserved>;
> Is a system-wide CMA pool enough for this usage? And for a display
> controller, will 128M be too much? (I assume the Vivante GPU do not
> require contingous memory).

Yes, Vivante GPU do not require continuous memory. As the GPU has IOMMU
which map the scatter physical pages to continuous virtual address.
But loongson display control don't has such a luxury. The dumb framebuffer
has to be physically contiguous to scanout.

128M is not too much, as we have plenty system RAM. 64M is also OK.

>>          status = "okay";
>> };
>>
>> This patch is tested on ls2k1000 evaluation board.
>>
>> $ dmesg | grep "0000:00:06.0"
>>
>>   loongson 0000:00:06.0: Found LS2K1000 SoC, revision: 0
>>   loongson 0000:00:06.0: [drm] dc: 250MHz, ddr: 400MHz, gpu: 228MHz
>>   loongson 0000:00:06.0: [drm] Using of reserved mem:
>> 8000000@0x20000000
>>   loongson 0000:00:06.0: [drm] VRAM: 8192 pages ready
>>   loongson 0000:00:06.0: [drm] GTT: 32768 pages ready
>>   loongson 0000:00:06.0: [drm] display pipe-0 has a DVO
>>   loongson 0000:00:06.0: [drm] display pipe-1 has a DVO
>>   loongson 0000:00:06.0: [drm] Total 2 outputs
>>   loongson 0000:00:06.0: [drm] registered irq: 28
>>   [drm] Initialized loongson 1.0.0 20220701 for 0000:00:06.0 on minor
>> 0
>>   loongson 0000:00:06.0: [drm] fb0: loongsondrmfb frame buffer device
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/Makefile             |   1 +
>>   drivers/gpu/drm/loongson/loongson_device.c    |  59 +++++++
>>   drivers/gpu/drm/loongson/lsdc_drv.c           |  44 ++++-
>>   drivers/gpu/drm/loongson/lsdc_drv.h           |   9 ++
>>   drivers/gpu/drm/loongson/lsdc_gfxpll.c        |  11 +-
>>   drivers/gpu/drm/loongson/lsdc_gfxpll.h        |   4 +
>>   drivers/gpu/drm/loongson/lsdc_gfxpll_2k1000.c | 141 ++++++++++++++++
>>   drivers/gpu/drm/loongson/lsdc_i2c.c           |  41 +++++
>>   drivers/gpu/drm/loongson/lsdc_i2c.h           |   4 +
>>   drivers/gpu/drm/loongson/lsdc_pixpll.c        | 153
>> +++++++++++++++++-
>>   drivers/gpu/drm/loongson/lsdc_pixpll.h        |   4 +
>>   drivers/gpu/drm/loongson/lsdc_probe.c         |  27 ++++
>>   drivers/gpu/drm/loongson/lsdc_probe.h         |   2 +
>>   drivers/gpu/drm/loongson/lsdc_regs.h          |  36 +++++
>>   14 files changed, 528 insertions(+), 8 deletions(-)
>>   create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll_2k1000.c
>>
>> diff --git a/drivers/gpu/drm/loongson/Makefile
>> b/drivers/gpu/drm/loongson/Makefile
>> index 91e72bd900c1..d6e709e19fba 100644
>> --- a/drivers/gpu/drm/loongson/Makefile
>> +++ b/drivers/gpu/drm/loongson/Makefile
>> @@ -7,6 +7,7 @@ loongson-y := \
>>          lsdc_drv.o \
>>          lsdc_gem.o \
>>          lsdc_gfxpll.o \
>> +       lsdc_gfxpll_2k1000.o \
>>          lsdc_i2c.o \
>>          lsdc_irq.o \
>>          lsdc_output_7a1000.o \
>> diff --git a/drivers/gpu/drm/loongson/loongson_device.c
>> b/drivers/gpu/drm/loongson/loongson_device.c
>> index 9986c8a2a255..67274d9e3b12 100644
>> --- a/drivers/gpu/drm/loongson/loongson_device.c
>> +++ b/drivers/gpu/drm/loongson/loongson_device.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/pci.h>
>>   
>>   #include "lsdc_drv.h"
>> +#include "lsdc_probe.h"
>>   
>>   static const struct lsdc_kms_funcs ls7a1000_kms_funcs = {
>>          .create_i2c = lsdc_create_i2c_chan,
>> @@ -25,6 +26,20 @@ static const struct lsdc_kms_funcs
>> ls7a2000_kms_funcs = {
>>          .crtc_init = ls7a2000_crtc_init,
>>   };
>>   
>> +/*
>> + * Most of hardware features of ls2k1000 are same with ls7a1000, we
>> take the
>> + * ls7a1000_kms_funcs as a prototype, copy and modify to form a
>> variant for
>> + * ls2k1000.
>> + */
>> +static const struct lsdc_kms_funcs ls2k1000_kms_funcs = {
>> +       .create_i2c = ls2k1000_get_i2c,
>> +       .irq_handler = ls7a1000_dc_irq_handler,
>> +       .output_init = ls7a1000_output_init,
>> +       .cursor_plane_init = ls7a1000_cursor_plane_init,
>> +       .primary_plane_init = lsdc_primary_plane_init,
>> +       .crtc_init = ls7a1000_crtc_init,
>> +};
>> +
>>   static const struct loongson_gfx_desc ls7a1000_gfx = {
>>          .dc = {
>>                  .num_of_crtc = 2,
>> @@ -36,6 +51,7 @@ static const struct loongson_gfx_desc ls7a1000_gfx
>> = {
>>                  .hw_cursor_h = 32,
>>                  .pitch_align = 256,
>>                  .has_vblank_counter = false,
>> +               .has_dedicated_vram = true,
>>                  .funcs = &ls7a1000_kms_funcs,
>>          },
>>          .conf_reg_base = LS7A1000_CONF_REG_BASE,
>> @@ -43,6 +59,7 @@ static const struct loongson_gfx_desc ls7a1000_gfx
>> = {
>>                  .reg_offset = LS7A1000_PLL_GFX_REG,
>>                  .reg_size = 8,
>>          },
>> +       .gfxpll_funcs = &ls7a1000_gfx_pll_funcs,
>>          .pixpll = {
>>                  [0] = {
>>                          .reg_offset = LS7A1000_PIXPLL0_REG,
>> @@ -53,6 +70,7 @@ static const struct loongson_gfx_desc ls7a1000_gfx
>> = {
>>                          .reg_size = 8,
>>                  },
>>          },
>> +       .pixpll_funcs = &ls7a1000_pixpll_funcs,
>>          .chip_id = CHIP_LS7A1000,
>>          .model = "LS7A1000 bridge chipset",
>>   };
>> @@ -68,6 +86,7 @@ static const struct loongson_gfx_desc ls7a2000_gfx
>> = {
>>                  .hw_cursor_h = 64,
>>                  .pitch_align = 64,
>>                  .has_vblank_counter = true,
>> +               .has_dedicated_vram = true,
>>                  .funcs = &ls7a2000_kms_funcs,
>>          },
>>          .conf_reg_base = LS7A2000_CONF_REG_BASE,
>> @@ -75,6 +94,7 @@ static const struct loongson_gfx_desc ls7a2000_gfx
>> = {
>>                  .reg_offset = LS7A2000_PLL_GFX_REG,
>>                  .reg_size = 8,
>>          },
>> +       .gfxpll_funcs = &ls7a2000_gfx_pll_funcs,
>>          .pixpll = {
>>                  [0] = {
>>                          .reg_offset = LS7A2000_PIXPLL0_REG,
>> @@ -85,18 +105,57 @@ static const struct loongson_gfx_desc
>> ls7a2000_gfx = {
>>                          .reg_size = 8,
>>                  },
>>          },
>> +       .pixpll_funcs = &ls7a2000_pixpll_funcs,
>>          .chip_id = CHIP_LS7A2000,
>>          .model = "LS7A2000 bridge chipset",
>>   };
>>   
>> +static const struct loongson_gfx_desc ls2k1000_gfx = {
>> +       .dc = {
>> +               .num_of_crtc = 2,
>> +               .max_pixel_clk = 200000,
>> +               .max_width = 2048,
>> +               .max_height = 2048,
>> +               .num_of_hw_cursor = 1,
>> +               .hw_cursor_w = 32,
>> +               .hw_cursor_h = 32,
>> +               .pitch_align = 256,
>> +               .has_vblank_counter = false,
>> +               .has_dedicated_vram = false,
>> +               .funcs = &ls2k1000_kms_funcs,
>> +       },
>> +       .conf_reg_base = LS2K1000_CONF_REG_BASE,
>> +       .gfxpll = {
>> +               .reg_offset = LS2K1000_DDR_PLL_REG,
>> +               .reg_size = 16 + 16,
>> +       },
>> +       .gfxpll_funcs = &ls2k1000_gfx_pll_funcs,
>> +       .pixpll = {
>> +               [0] = {
>> +                       .reg_offset = LS2K1000_PIX0_PLL_REG,
>> +                       .reg_size = 16,
>> +               },
>> +               [1] = {
>> +                       .reg_offset = LS2K1000_PIX1_PLL_REG,
>> +                       .reg_size = 16,
>> +               },
>> +       },
>> +       .pixpll_funcs = &ls2k1000_pixpll_funcs,
>> +       .chip_id = CHIP_LS2K1000,
>> +       .model = "LS2K1000 SoC",
>> +};
>> +
>>   static const struct lsdc_desc *__chip_id_desc_table[] = {
>>          [CHIP_LS7A1000] = &ls7a1000_gfx.dc,
>>          [CHIP_LS7A2000] = &ls7a2000_gfx.dc,
>> +       [CHIP_LS2K1000] = &ls2k1000_gfx.dc,
>>          [CHIP_LS_LAST] = NULL,
>>   };
>>   
>>   const struct lsdc_desc *
>>   lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id
>> chip_id)
>>   {
>> +       chip_id = loongson_chip_id_fixup(chip_id);
>> +
>>          return __chip_id_desc_table[chip_id];
>>   }
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c
>> b/drivers/gpu/drm/loongson/lsdc_drv.c
>> index 89ccc0c43169..65a4d96448bb 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <linux/pci.h>
>>   #include <linux/vgaarb.h>
>> +#include <linux/of_address.h>
>>   
>>   #include <drm/drm_aperture.h>
>>   #include <drm/drm_atomic.h>
>> @@ -84,6 +85,8 @@ static int lsdc_modeset_init(struct lsdc_device
>> *ldev,
>>                  dispipe = &ldev->dispipe[i];
>>                  if (dispipe->li2c)
>>                          ddc = &dispipe->li2c->adapter;
>> +               else
>> +                       ddc = dispipe->adapter;
>>   
>>                  ret = funcs->output_init(ddev, dispipe, ddc, i);
>>                  if (ret)
>> @@ -155,8 +158,7 @@ static int lsdc_mode_config_init(struct
>> drm_device *ddev,
>>    * the DC could access the on-board VRAM.
>>    */
>>   static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
>> -                                  struct pci_dev *pdev_dc,
>> -                                  const struct lsdc_desc *descp)
>> +                                  struct pci_dev *pdev_dc)
>>   {
>>          struct drm_device *ddev = &ldev->base;
>>          struct pci_dev *pdev_gpu;
>> @@ -187,6 +189,38 @@ static int lsdc_get_dedicated_vram(struct
>> lsdc_device *ldev,
>>          return 0;
>>   }
>>   
>> +static int lsdc_of_get_reserved_mem(struct lsdc_device *ldev)
>> +{
>> +       struct drm_device *ddev = &ldev->base;
>> +       unsigned long size = 0;
>> +       struct device_node *node;
>> +       struct resource r;
>> +       int ret;
>> +
>> +       if (!ddev->dev->of_node)
>> +               return -ENOENT;
>> +
>> +       node = of_parse_phandle(ddev->dev->of_node, "memory-region",
>> 0);
>> +       if (!node) {
>> +               drm_err(ddev, "No memory-region property\n");
>> +               return -ENOENT;
>> +       }
>> +
>> +       ret = of_address_to_resource(node, 0, &r);
>> +       of_node_put(node);
>> +       if (ret)
>> +               return ret;
>> +
>> +       size = r.end - r.start + 1;
>> +
>> +       ldev->vram_base = r.start;
>> +       ldev->vram_size = size;
>> +
>> +       drm_info(ddev, "Using of reserved mem: %lx@%pa\n", size,
>> &r.start);
>> +
>> +       return 0;
>> +}
>> +
>>   static struct lsdc_device *
>>   lsdc_create_device(struct pci_dev *pdev,
>>                     const struct lsdc_desc *descp,
>> @@ -207,7 +241,11 @@ lsdc_create_device(struct pci_dev *pdev,
>>   
>>          loongson_gfxpll_create(ddev, &ldev->gfxpll);
>>   
>> -       ret = lsdc_get_dedicated_vram(ldev, pdev, descp);
>> +       if (descp->has_dedicated_vram)
>> +               ret = lsdc_get_dedicated_vram(ldev, pdev);
>> +       else
>> +               ret = lsdc_of_get_reserved_mem(ldev);
>> +
>>          if (ret) {
>>                  drm_err(ddev, "Init VRAM failed: %d\n", ret);
>>                  return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h
>> b/drivers/gpu/drm/loongson/lsdc_drv.h
>> index fbf2d760ef27..279de7bf6dc5 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
>> @@ -41,6 +41,7 @@
>>   enum loongson_chip_id {
>>          CHIP_LS7A1000 = 0,
>>          CHIP_LS7A2000 = 1,
>> +       CHIP_LS2K1000 = 2,
>>          CHIP_LS_LAST,
>>   };
>>   
>> @@ -61,6 +62,7 @@ struct lsdc_desc {
>>          u32 hw_cursor_h;
>>          u32 pitch_align;         /* CRTC DMA alignment constraint */
>>          bool has_vblank_counter; /* 32 bit hw vsync counter */
>> +       bool has_dedicated_vram;
>>   
>>          /* device dependent ops, dc side */
>>          const struct lsdc_kms_funcs *funcs;
>> @@ -78,12 +80,14 @@ struct loongson_gfx_desc {
>>                  u32 reg_offset;
>>                  u32 reg_size;
>>          } gfxpll;
>> +       const struct loongson_gfxpll_funcs *gfxpll_funcs;
>>   
>>          /* Pixel PLL, per display pipe */
>>          struct {
>>                  u32 reg_offset;
>>                  u32 reg_size;
>>          } pixpll[LSDC_NUM_CRTC];
>> +       const struct lsdc_pixpll_funcs *pixpll_funcs;
> It could be better to have this kind of refactor independent of real
> new HW implemetation.
>
>>   
>>          enum loongson_chip_id chip_id;
>>          char model[64];
>> @@ -189,6 +193,11 @@ struct lsdc_display_pipe {
>>          struct lsdc_primary primary;
>>          struct lsdc_cursor cursor;
>>          struct lsdc_output output;
>> +       /*
>> +        * For device which don't has built-in GPIO hardware, such as
>> ls2k1000,
>> +        * we will get a i2c adapter from other module or subsystem.
>> +        */
>> +       struct i2c_adapter *adapter;
>>          struct lsdc_i2c *li2c;
>>          unsigned int index;
>>   };
>> diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.c
>> b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
>> index 249c09d703ad..4a4efe696d5a 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_gfxpll.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
>> @@ -163,7 +163,14 @@ static int loongson_gfxpll_init(struct
>> loongson_gfxpll * const this)
>>          return 0;
>>   }
>>   
>> -static const struct loongson_gfxpll_funcs lsdc_gmc_gpu_funcs = {
>> +const struct loongson_gfxpll_funcs ls7a1000_gfx_pll_funcs = {
>> +       .init = loongson_gfxpll_init,
>> +       .update = loongson_gfxpll_update,
>> +       .get_rates = loongson_gfxpll_get_rates,
>> +       .print = loongson_gfxpll_print,
>> +};
>> +
>> +const struct loongson_gfxpll_funcs ls7a2000_gfx_pll_funcs = {
>>          .init = loongson_gfxpll_init,
>>          .update = loongson_gfxpll_update,
>>          .get_rates = loongson_gfxpll_get_rates,
>> @@ -185,7 +192,7 @@ int loongson_gfxpll_create(struct drm_device
>> *ddev,
>>          this->ddev = ddev;
>>          this->reg_size = gfx->gfxpll.reg_size;
>>          this->reg_base = gfx->conf_reg_base + gfx->gfxpll.reg_offset;
>> -       this->funcs = &lsdc_gmc_gpu_funcs;
>> +       this->funcs = gfx->gfxpll_funcs;
>>   
>>          ret = this->funcs->init(this);
>>          if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.h
>> b/drivers/gpu/drm/loongson/lsdc_gfxpll.h
>> index 9d59cbfc145d..6a30d2039d4a 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_gfxpll.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.h
>> @@ -49,4 +49,8 @@ struct loongson_gfxpll {
>>   int loongson_gfxpll_create(struct drm_device *ddev,
>>                             struct loongson_gfxpll **ppout);
>>   
>> +extern const struct loongson_gfxpll_funcs ls2k1000_gfx_pll_funcs;
>> +extern const struct loongson_gfxpll_funcs ls7a1000_gfx_pll_funcs;
>> +extern const struct loongson_gfxpll_funcs ls7a2000_gfx_pll_funcs;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll_2k1000.c
>> b/drivers/gpu/drm/loongson/lsdc_gfxpll_2k1000.c
>> new file mode 100644
>> index 000000000000..8b442db05972
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_gfxpll_2k1000.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "lsdc_drv.h"
>> +
>> +union ls2k1000_ddr_pll_reg_bitmap {
>> +       struct ls2k1000_ddr_pll_bitmap {
>> +               /* Byte 0 ~ Byte 3 */
>> +               unsigned bypass       :  1;  /*  0: Bypass ddr pll
>> entirely */
>> +               unsigned oe_gpu       :  1;  /*  1: GPU output clk
>> enable   */
>> +               unsigned write_en     :  1;  /*  2: Allow software
>> update   */
>> +               unsigned _reserved_1_ : 23;  /*  3 : 25  Don't
>> care         */
>> +               unsigned div_ref      :  6;  /* 31 : 26  Input clk
>> divider  */
>> +               /* Byte 4 ~ Byte 7 */
>> +               unsigned loopc        : 10;   /* 41 : 32 Clock
>> multiplier   */
>> +               unsigned _reserved_2_ : 22;   /* 42 : 63
>> Useless            */
>> +
>> +               /* Byte 8 ~ Byte 15 */
>> +               unsigned div_out_ddr  :  6;  /*  5 : 0  DDR output
>> divider */
>> +               unsigned _reserved_3_ : 16;  /* 21 : 6  */
>> +               unsigned div_out_gpu  :  6;  /* 27 : 22 GPU output
>> divider */
>> +               unsigned _reserved_4_ : 16;  /* 43 : 28 */
>> +               unsigned div_out_hda  :  7;  /* 50 : 44 HDA output
>> divider */
>> +               unsigned _reserved_5_ : 13;  /* 63 : 51 */
>> +       } bitmap;
>> +       u32 w[4];
>> +       u64 d[2];
>> +};
>> +
>> +union ls2k1000_dc_pll_reg_bitmap {
>> +       struct ls2k1000_dc_pll_bitmap {
>> +               /* Byte 0 ~ Byte 3 */
>> +               unsigned _reserved_1_ : 26;  /*  0 : 25  Don't
>> care         */
>> +               unsigned div_ref      :  6;  /* 31 : 26  Input clk
>> divider  */
>> +               /* Byte 4 ~ Byte 7 */
>> +               unsigned loopc        : 10;   /* 41 : 32 Clock
>> multiplier   */
>> +               unsigned _reserved_2_ : 22;   /* 42 : 63
>> Useless            */
>> +
>> +               /* Byte 8 ~ Byte 15 */
>> +               unsigned div_out_dc   :  6;  /*  5 : 0  DC output
>> divider */
>> +               unsigned _reserved_3_ : 16;  /* 21 : 6  */
>> +               unsigned div_out_gmac :  6;  /* 27 : 22 GMAC output
>> divider */
>> +               unsigned _reserved_4_ :  4;  /* 31 : 28 */
>> +               unsigned _reserved_5_ : 32;  /* 63 : 32 */
>> +       } bitmap;
>> +       u32 w[4];
>> +       u64 d[2];
>> +};
>> +
>> +static int ls2k1000_gfxpll_init(struct loongson_gfxpll * const this)
>> +{
>> +       struct drm_printer printer = drm_info_printer(this->ddev-
>>> dev);
>> +
>> +       this->mmio = ioremap(this->reg_base, this->reg_size);
>> +       if (IS_ERR_OR_NULL(this->mmio))
>> +               return -ENOMEM;
>> +
>> +       this->funcs->print(this, &printer, false);
>> +
>> +       return 0;
>> +}
>> +
>> +static inline void __rreg_u128(void __iomem *mmio, u32 w[], u64 d[])
>> +{
>> +#if defined(CONFIG_64BIT)
>> +       d[0] = readq(mmio);
>> +       d[1] = readq(mmio + 8);
>> +#else
>> +       w[0] = readl(mmio);
>> +       w[1] = readl(mmio + 4);
>> +       w[2] = readl(mmio + 8);
>> +       w[3] = readl(mmio + 12);
>> +#endif
>> +}
>> +
>> +static void ls2k1000_gfxpll_get_rates(struct loongson_gfxpll * const
>> this,
>> +                                     unsigned int *dc,
>> +                                     unsigned int *ddr,
>> +                                     unsigned int *gpu)
>> +{
>> +       unsigned int ref_clock_mhz = LSDC_PLL_REF_CLK_KHZ / 1000;
>> +       union ls2k1000_ddr_pll_reg_bitmap ddr_pll_reg_bitmap;
>> +       union ls2k1000_dc_pll_reg_bitmap dc_pll_reg_bitmap;
>> +       unsigned int div_ref;
>> +       unsigned int loopc;
>> +       unsigned int div_out_dc;
>> +       unsigned int div_out_ddr;
>> +       unsigned int div_out_gpu;
>> +       unsigned int dc_mhz;
>> +       unsigned int ddr_mhz;
>> +       unsigned int gpu_mhz;
>> +
>> +       __rreg_u128(this->mmio, ddr_pll_reg_bitmap.w,
>> ddr_pll_reg_bitmap.d);
>> +       div_ref = ddr_pll_reg_bitmap.bitmap.div_ref;
>> +       loopc = ddr_pll_reg_bitmap.bitmap.loopc;
>> +       div_out_ddr = ddr_pll_reg_bitmap.bitmap.div_out_ddr;
>> +       div_out_gpu = ddr_pll_reg_bitmap.bitmap.div_out_gpu;
>> +       ddr_mhz = ref_clock_mhz / div_ref * loopc / div_out_ddr;
>> +       gpu_mhz = ref_clock_mhz / div_ref * loopc / div_out_gpu;
>> +
>> +       __rreg_u128(this->mmio + 16, dc_pll_reg_bitmap.w,
>> dc_pll_reg_bitmap.d);
>> +       div_out_dc = dc_pll_reg_bitmap.bitmap.div_out_dc;
>> +       div_ref = dc_pll_reg_bitmap.bitmap.div_ref;
>> +       loopc = dc_pll_reg_bitmap.bitmap.loopc;
>> +       dc_mhz = ref_clock_mhz / div_ref * loopc / div_out_dc;
>> +
>> +       if (dc)
>> +               *dc = dc_mhz;
>> +
>> +       if (ddr)
>> +               *ddr = ddr_mhz;
>> +
>> +       if (gpu)
>> +               *gpu = gpu_mhz;
>> +}
>> +
>> +static void ls2k1000_gfxpll_print(struct loongson_gfxpll * const
>> this,
>> +                                 struct drm_printer *p,
>> +                                 bool verbose)
>> +{
>> +       unsigned int dc, ddr, gpu;
>> +
>> +       this->funcs->get_rates(this, &dc, &ddr, &gpu);
>> +
>> +       drm_printf(p, "dc: %uMHz, ddr: %uMHz, gpu: %uMHz\n", dc, ddr,
>> gpu);
>> +}
>> +
>> +const struct loongson_gfxpll_funcs ls2k1000_gfx_pll_funcs = {
>> +       .init = ls2k1000_gfxpll_init,
>> +       .get_rates = ls2k1000_gfxpll_get_rates,
>> +       .print = ls2k1000_gfxpll_print,
>> +};
>> +
>> diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c
>> b/drivers/gpu/drm/loongson/lsdc_i2c.c
>> index 9625d0b1d0b4..726d434c6234 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_i2c.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
>> @@ -177,3 +177,44 @@ int lsdc_create_i2c_chan(struct drm_device
>> *ddev,
>>   
>>          return 0;
>>   }
>> +
>> +static void ls2k1000_put_i2c(struct drm_device *ddev, void *data)
>> +{
>> +       struct i2c_adapter *adapter = (struct i2c_adapter *)data;
>> +
>> +       if (adapter)
>> +               i2c_put_adapter(adapter);
>> +}
>> +
>> +int ls2k1000_get_i2c(struct drm_device *ddev,
>> +                    struct lsdc_display_pipe *dispipe,
>> +                    unsigned int index)
>> +{
>> +       struct i2c_adapter *adapter;
>> +       int ret;
>> +
>> +       /*
>> +        * On ls2k1000, display-pipe-0 use i2c-0 and display-pipe-1
>> use i2c-1
>> +        * by default. We will add more complete DT support for this
>> in the
>> +        * future.
>> +        */
>> +       adapter = i2c_get_adapter(index);
>> +       if (!adapter) {
>> +               drm_dbg(ddev, "DDC drivers are not ready\n");
>> +               /*
>> +                * Should return -EPROBE_DEFER here, but we want to
>> do so when
>> +                * the DT support is added. Current we are focus on
>> bring up,
>> +                * For embedded platform, the i2c adapter is not
>> strictly
>> +                * required to be able to display something on the
>> screen.
>> +                */
> I assume it could be better to return EPROBE_DEFER when an I2C
> controller is explicitly specified in the DT, and silently skip it when
> it's not specified.
>
>> +               return 0;
>> +       }
>> +
>> +       ret = drmm_add_action_or_reset(ddev, ls2k1000_put_i2c,
>> adapter);
>> +       if (ret)
>> +               return ret;
>> +
>> +       dispipe->adapter = adapter;
>> +
>> +       return 0;
>> +}
>> diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h
>> b/drivers/gpu/drm/loongson/lsdc_i2c.h
>> index 88cd1a1817a5..97eb6227f386 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_i2c.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
>> @@ -26,4 +26,8 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
>>                           struct lsdc_display_pipe *dispipe,
>>                           unsigned int index);
>>   
>> +int ls2k1000_get_i2c(struct drm_device *ddev,
>> +                    struct lsdc_display_pipe *dispipe,
>> +                    unsigned int index);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.c
>> b/drivers/gpu/drm/loongson/lsdc_pixpll.c
>> index 2609a2256da4..28290dcd7534 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_pixpll.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_pixpll.c
>> @@ -41,6 +41,132 @@ union lsdc_pixpll_reg_bitmap {
>>          u64 d;
>>   };
>>   
>> +/*
>> + * The pixel PLL structure of ls2k1000 is defferent than
>> ls7a2000/ls2k2000.
>> + * it take up 16 bytes, but only a few bits are useful. Sounds like
>> a little
>> + * bit of wasting register space, but this is the hardware already
>> have been
>> + * tapped.
>> + */
>> +union ls2k1000_pixpll_reg_bitmap {
>> +       struct ls2k1000_pixpll_reg {
>> +               /* Byte 0 ~ Byte 3 */
>> +               unsigned sel_out      :  1;  /*  0    select this
>> PLL        */
>> +               unsigned _reserved_1_ :  1;  /*
>> 1                           */
>> +               unsigned sw_adj_en    :  1;  /*  2    allow software
>> adjust  */
>> +               unsigned bypass       :  1;  /*  3    bypass L1
>> PLL          */
>> +               unsigned _reserved_2_ :  3;  /*
>> 4:6                         */
>> +               unsigned lock_en      :  1;  /*  7    enable lock L1
>> PLL     */
>> +               unsigned _reserved_3_ :  2;  /*
>> 8:9                         */
>> +               unsigned lock_check   :  2;  /* 10:11 precision
>> check        */
>> +               unsigned _reserved_4_ :  4;  /*
>> 12:15                        */
>> +
>> +               unsigned locked       :  1;  /* 16    PLL locked flag
>> bit    */
>> +               unsigned _reserved_5_ :  2;  /*
>> 17:18                        */
>> +               unsigned powerdown    :  1;  /* 19    powerdown the
>> pll      */
>> +               unsigned _reserved_6_ :  6;  /*
>> 20:25                        */
>> +               unsigned div_ref      :  6;  /* 26:31 L1
>> Prescaler           */
>> +
>> +               /* Byte 4 ~ Byte 7 */
>> +               unsigned loopc        : 10;  /* 32:41 Clock
>> Multiplier       */
>> +               unsigned l1_div       :  6;  /* 42:47 no
>> use                 */
>> +               unsigned _reserved_7_ : 16;  /*
>> 48:63                        */
>> +
>> +               /* Byte 8 ~ Byte 15 */
>> +               unsigned div_out      :  6;  /* 64 : 69   output clk
>> divider */
>> +               unsigned _reserved_8_ : 26;  /* 70 : 127  no
>> use             */
>> +       } bitmap;
>> +
>> +       u32 w[4];
>> +       u64 d[2];
>> +};
>> +
>> +/*
>> + * Update the pll parameters to hardware, target to the pixpll in
>> ls2k1000
>> + *
>> + * @this: point to the object from which this function is called
>> + * @pin: point to the struct of lsdc_pll_parms passed in
>> + *
>> + * return 0 if successful.
>> + */
>> +static int ls2k1000_pixpll_param_update(struct lsdc_pixpll * const
>> this,
>> +                                       struct lsdc_pixpll_parms
>> const *pin)
>> +{
>> +       void __iomem *reg = this->mmio;
>> +       unsigned int counter = 0;
>> +       bool locked = false;
>> +       u32 val;
>> +
>> +       val = readl(reg);
>> +       /* Bypass the software configured PLL, using refclk directly
>> */
>> +       val &= ~(1 << 0);
>> +       writel(val, reg);
>> +
>> +       /* Powerdown the PLL */
>> +       val |= (1 << 19);
>> +       writel(val, reg);
>> +
>> +       /* Allow the software configuration */
>> +       val &= ~(1 << 2);
>> +       writel(val, reg);
>> +
>> +       /* allow L1 PLL lock */
>> +       val = (1L << 7) | (3L << 10);
>> +       writel(val, reg);
>> +
>> +       /* clear div_ref bit field */
>> +       val &= ~(0x3f << 26);
>> +       /* set div_ref bit field */
>> +       val |= pin->div_ref << 26;
>> +       writel(val, reg);
>> +
>> +       val = readl(reg + 4);
>> +       /* clear loopc bit field */
>> +       val &= ~0x0fff;
>> +       /* set loopc bit field */
>> +       val |= pin->loopc;
>> +       writel(val, reg + 4);
>> +
>> +       /* set div_out */
>> +       writel(pin->div_out, reg + 8);
>> +
>> +       val = readl(reg);
>> +       /* use this parms configured just now */
>> +       val |= (1 << 2);
>> +       /* powerup the PLL */
>> +       val &= ~(1 << 19);
>> +       writel(val, reg);
>> +
>> +��      /* wait pll setup and locked */
>> +       do {
>> +               val = readl(reg);
>> +               locked = val & 0x10000;
>> +               counter++;
>> +       } while (!locked && (counter < 2000));
>> +
>> +       drm_dbg(this->ddev, "%u loop waited\n", counter);
>> +
>> +       /* Switch to software configured PLL instead of refclk */
>> +       val |= 1;
>> +       writel(val, reg);
>> +
>> +       return 0;
>> +}
>> +
>> +static unsigned int
>> +ls2k1000_pixpll_get_clock_rate(struct lsdc_pixpll * const this)
>> +{
>> +       struct lsdc_pixpll_parms *ppar = this->priv;
>> +       union ls2k1000_pixpll_reg_bitmap reg_bitmap;
>> +       struct ls2k1000_pixpll_reg *obj = &reg_bitmap.bitmap;
>> +
>> +       reg_bitmap.w[0] = readl(this->mmio);
>> +       reg_bitmap.w[1] = readl(this->mmio + 4);
>> +       reg_bitmap.w[2] = readl(this->mmio + 8);
>> +       reg_bitmap.w[3] = readl(this->mmio + 12);
>> +
>> +       return ppar->ref_clock / obj->div_ref * obj->loopc / obj-
>>> div_out;
>> +}
>> +
>>   struct clk_to_pixpll_parms_lookup_t {
>>          unsigned int clock;        /* kHz */
>>   
>> @@ -452,11 +578,19 @@ static void lsdc_pixpll_print(struct
>> lsdc_pixpll * const this,
>>   }
>>   
>>   /*
>> - * LS7A1000, LS7A2000 and ls2k2000's pixel pll setting register is
>> same,
>> + * LS7A1000, LS7A2000 and LS2K2000's pixel PLL register layout is
>> same,
>>    * we take this as default, create a new instance if a different
>> model is
>>    * introduced.
>>    */
>> -static const struct lsdc_pixpll_funcs __pixpll_default_funcs = {
>> +const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
>> +       .setup = lsdc_pixel_pll_setup,
>> +       .compute = lsdc_pixel_pll_compute,
>> +       .update = lsdc_pixpll_update,
>> +       .get_rate = lsdc_pixpll_get_freq,
>> +       .print = lsdc_pixpll_print,
>> +};
>> +
>> +const struct lsdc_pixpll_funcs ls7a2000_pixpll_funcs = {
>>          .setup = lsdc_pixel_pll_setup,
>>          .compute = lsdc_pixel_pll_compute,
>>          .update = lsdc_pixpll_update,
>> @@ -464,6 +598,19 @@ static const struct lsdc_pixpll_funcs
>> __pixpll_default_funcs = {
>>          .print = lsdc_pixpll_print,
>>   };
>>   
>> +/*
>> + * The bit fileds of LS2K1000's pixel PLL register are different
>> from other
>> + * model, due to hardware update(revision). So we introduce a new
>> instance
>> + * of lsdc_pixpll_funcs object function to gear the control.
>> + */
>> +const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs = {
>> +       .setup = lsdc_pixel_pll_setup,
>> +       .compute = lsdc_pixel_pll_compute,
>> +       .update = ls2k1000_pixpll_param_update,
>> +       .get_rate = ls2k1000_pixpll_get_clock_rate,
>> +       .print = lsdc_pixpll_print,
>> +};
>> +
>>   /* pixel pll initialization */
>>   
>>   int lsdc_pixpll_init(struct lsdc_pixpll * const this,
>> @@ -477,7 +624,7 @@ int lsdc_pixpll_init(struct lsdc_pixpll * const
>> this,
>>          this->ddev = ddev;
>>          this->reg_size = 8;
>>          this->reg_base = gfx->conf_reg_base + gfx-
>>> pixpll[index].reg_offset;
>> -       this->funcs = &__pixpll_default_funcs;
>> +       this->funcs = gfx->pixpll_funcs;
>>   
>>          return this->funcs->setup(this);
>>   }
>> diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.h
>> b/drivers/gpu/drm/loongson/lsdc_pixpll.h
>> index ec3486d90ab6..8b6ffd0ef4fb 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_pixpll.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_pixpll.h
>> @@ -83,4 +83,8 @@ int lsdc_pixpll_init(struct lsdc_pixpll * const
>> this,
>>                       struct drm_device *ddev,
>>                       unsigned int index);
>>   
>> +extern const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs;
>> +extern const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs;
>> +extern const struct lsdc_pixpll_funcs ls7a2000_pixpll_funcs;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c
>> b/drivers/gpu/drm/loongson/lsdc_probe.c
>> index 48ba69bb8a98..edc3812f0957 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_probe.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_probe.c
>> @@ -54,3 +54,30 @@ unsigned int loongson_cpu_get_prid(u8 *imp, u8
>> *rev)
>>   
>>          return prid;
>>   }
>> +
>> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id
>> chip_id)
>> +{
>> +       u8 impl;
>> +
>> +       if (loongson_cpu_get_prid(&impl, NULL)) {
>> +               /*
>> +                * LS2K1000 has the LoongArch edition(with two LA264
>> CPU core)
>> +                * and the Mips edition(with two mips64r2 CPU core),
>> Only the
>> +                * instruction set of the CPU are changed, the
>> peripheral
>> +                * devices are basically same.
>> +                */
>> +               if (chip_id == CHIP_LS7A1000) {
>> +#if defined(__loongarch__)
>> +                       if (impl == LOONGARCH_CPU_IMP_LS2K1000)
>> +                               return CHIP_LS2K1000;
>> +#endif
>> +
>> +#if defined(__mips__)
>> +                       if (impl == LOONGSON_CPU_MIPS_IMP_LS2K)
>> +                               return CHIP_LS2K1000;
>> +#endif
>> +               }
>> +       }
>> +
>> +       return chip_id;
>> +}
>> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h
>> b/drivers/gpu/drm/loongson/lsdc_probe.h
>> index 8bb6de2e3c64..8c630c5c90ce 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_probe.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_probe.h
>> @@ -9,4 +9,6 @@
>>   /* Helpers for chip detection */
>>   unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
>>   
>> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id
>> chip_id);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_regs.h
>> b/drivers/gpu/drm/loongson/lsdc_regs.h
>> index e8ea28689c63..c11a9fc0d2f6 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_regs.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_regs.h
>> @@ -39,6 +39,42 @@
>>   
>>   #define LS7A2000_CONF_REG_BASE          0x10010000
>>   
>> +/*
>> + * The display controller in LS2K1000 SoC is basically same with the
>> display
>> + * controller in LS7A1000, except that there no built-in gpio
>> hardware unit
>> + * and no dedicated VRAM.
>> + *       ___________________
>> _________
>> + *      |            -------|
>> |         |
>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> |
>> Display |
>> + *      |  _   _     -------|        ^              ^
>> |_________|
>> + *      | | | | |           |        |              |
>> + *      | |_| |_|           |     +------+          |
>> + *      |                   <---->| i2c0 |<---------+
>> + *      |  DC in LS2K1000   |     +------+
>> + *      |  _   _            |     +------+
>> + *      | | | | |           <---->| i2c1 |----------+
>> + *      | |_| |_|           |     +------+          |
>> _________
>> + *      |            -------|        |              |
>> |         |
>> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |
>> Panel  |
>> + *      |            -------|
>> |_________|
>> + *      |___________________|
>> + *
>> + */
>> +
>> +#if defined(__mips__)
>> +#define LS2K1000_CONF_REG_BASE           0x1fe10000    /* mips64r2
>> edition */
>> +#else
>> +#define LS2K1000_CONF_REG_BASE           0x1fe00000    /* LoongArch
>> edition */
>> +#endif
>> +
>> +/* The HDA, GPU, DDR share the single DDR PLL */
>> +#define LS2K1000_DDR_PLL_REG             0x0490
>> +/* The DC and GMAC share the same PLL */
>> +#define LS2K1000_DC_PLL_REG              0x04A0
>> +
>> +#define LS2K1000_PIX0_PLL_REG            0x04B0
>> +#define LS2K1000_PIX1_PLL_REG            0x04C0
>> +
>>   /* For LSDC_CRTCx_CFG_REG */
>>   #define CFG_PIX_FMT_MASK                GENMASK(2, 0)
>>   

