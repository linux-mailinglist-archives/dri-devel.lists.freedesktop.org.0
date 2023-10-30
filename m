Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FB7DB23F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 04:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001C710E1FB;
	Mon, 30 Oct 2023 03:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A871910E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:20:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxXOoHIT9lXqk1AA--.12040S3;
 Mon, 30 Oct 2023 11:20:39 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxL933ID9lRMo2AA--.54874S3; 
 Mon, 30 Oct 2023 11:20:38 +0800 (CST)
Message-ID: <1145c791-8472-44ef-94f2-bb31b8ad2645@loongson.cn>
Date: Mon, 30 Oct 2023 11:20:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/loongson: Introduce a minimal support for
 Loongson VBIOS
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-2-suijingfeng@loongson.cn>
 <CAA8EJprALc_bWSsGvGmChupcHOWRCDO+G7M51gxFU-WuUAUDOg@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAA8EJprALc_bWSsGvGmChupcHOWRCDO+G7M51gxFU-WuUAUDOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxL933ID9lRMo2AA--.54874S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Kr43Cw47tw1kWryxJFyktFc_yoW8Cw4kuo
 W7Zan3Zw40qr1UZayDJryrXr1xZ3WrXr1YyayfZr1DCFWY9a1DJFW5XrW3WF4FyF15XF45
 Aa45Gr4fCF42yw4rl-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYb7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
 I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2
 jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOF4_UUUUU=
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Thanks a lot for reviewing!


On 2023/10/30 06:59, Dmitry Baryshkov wrote:
> On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Because some boards are equipped with non-transparent display bridges,
>> which need the VBIOS to provided parameters.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/Makefile          |   3 +-
>>   drivers/gpu/drm/loongson/loongson_device.c |   4 +
>>   drivers/gpu/drm/loongson/loongson_vbios.c  | 420 +++++++++++++++++++++
>>   drivers/gpu/drm/loongson/loongson_vbios.h  |  59 +++
>>   drivers/gpu/drm/loongson/lsdc_drv.c        |   4 +
>>   drivers/gpu/drm/loongson/lsdc_drv.h        |   8 +
>>   6 files changed, 497 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/loongson/loongson_vbios.c
>>   create mode 100644 drivers/gpu/drm/loongson/loongson_vbios.h
>>
>> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
>> index 91e72bd900c1..bef00b2c5569 100644
>> --- a/drivers/gpu/drm/loongson/Makefile
>> +++ b/drivers/gpu/drm/loongson/Makefile
>> @@ -17,6 +17,7 @@ loongson-y := \
>>          lsdc_ttm.o
>>
>>   loongson-y += loongson_device.o \
>> -             loongson_module.o
>> +             loongson_module.o \
>> +             loongson_vbios.o
>>
>>   obj-$(CONFIG_DRM_LOONGSON) += loongson.o
>> diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
>> index 9986c8a2a255..64096ad5466e 100644
>> --- a/drivers/gpu/drm/loongson/loongson_device.c
>> +++ b/drivers/gpu/drm/loongson/loongson_device.c
>> @@ -7,6 +7,8 @@
>>
>>   #include "lsdc_drv.h"
>>
>> +extern struct loongson_vbios __loongson_vbios;
> Usually names with two underscores in front of them are reserved for
> the compiler internals or low level stuff.


Then, is singleunderscore(_loongson_vbios) OK ?

I'm using underscores because I want to tell that the __loongson_vbios is opaque handle,
I want to tell that this is nearly a internals stuff, outside program should not poke into it.
Outside program can only reference it and should use helpers created in loongson_vbios.c to access.

Despite "extern-ed", but it just to take a reference of it. not de-reference.
If a specific SoC don't has VBIOS support, we can use .vbios = NULL; instead.
which is known at compile-time.

If singleunderscore(_loongson_vbios) is OK?
has a underscore  denote that it is a variable, probably helpful to understand.
If OK, I will update it to singleunderscore  at the next version.
  


>> +
>>   static const struct lsdc_kms_funcs ls7a1000_kms_funcs = {
>>          .create_i2c = lsdc_create_i2c_chan,
>>          .irq_handler = ls7a1000_dc_irq_handler,
>> @@ -53,6 +55,7 @@ static const struct loongson_gfx_desc ls7a1000_gfx = {
>>                          .reg_size = 8,
>>                  },
>>          },
>> +       .vbios = &__loongson_vbios,
>>          .chip_id = CHIP_LS7A1000,
>>          .model = "LS7A1000 bridge chipset",
>>   };
>> @@ -85,6 +88,7 @@ static const struct loongson_gfx_desc ls7a2000_gfx = {
>>                          .reg_size = 8,
>>                  },
>>          },
>> +       .vbios = &__loongson_vbios,
>>          .chip_id = CHIP_LS7A2000,
>>          .model = "LS7A2000 bridge chipset",
>>   };
>> diff --git a/drivers/gpu/drm/loongson/loongson_vbios.c b/drivers/gpu/drm/loongson/loongson_vbios.c
>> new file mode 100644
>> index 000000000000..dc304018779e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/loongson_vbios.c
>> @@ -0,0 +1,420 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_managed.h>
>> +
>> +#include "loongson_vbios.h"
>> +#include "lsdc_drv.h"
>> +
>> +#define LOONGSON_VBIOS_HEADER_STR       "Loongson-VBIOS"
>> +/* Legacy VBIOS is stored at offset 0 */
>> +#define LOONGSON_VBIOS_LEGACY_OFFSET     0
>> +/* The size of legacy VBIOS is 1 KiB */
>> +#define LOONGSON_VBIOS_LEGACY_SIZE       0x000400
>> +
>> +/* Data Control Block of Newer version of the VBIOS started at here */
>> +#define LOONGSON_VBIOS_DCB_OFFSET        0x006000
>> +/* The last 1 MiB of the VRAM contains the raw VBIOS data */
>> +#define LOONGSON_VBIOS_BLOCK_OFFSET      0x100000
>> +/* Only 256KB of the 1 MiB are used for now */
>> +#define LOONGSON_VBIOS_BLOCK_SIZE        0x040000
>> +
>> +struct loongson_vbios __loongson_vbios;
>> +
>> +/*
>> + * vbios data control block is a kind of metadata, which is used to index
>> + * real hardware device data block.
>> + */
>> +struct loongson_vbios_dcb {
>> +       u16 type;    /* what is it */
>> +       u8 version;  /* version of it, useless */
>> +       u8 id;       /* index (usually same with the display pipe) of the hardware */
>> +       u32 offset;  /* the offset of the real data */
>> +       u32 size;    /* the size of the real data */
>> +       u64 ext0;    /* for extension purpose */
>> +       u64 ext1;    /* extra space reserved for future use */
>> +} __packed;
>> +
>> +/*
>> + * Loongson-VBIOS Data Block Layout
>> + *
>> + *
>> + *         _____________________   0x00000
>> + *        |_____________________|
>> + *        |                     |  [0x0000, 0x0400) : legacy vbios storage
>> + *        |    Not Used Yet     |
>> + *        |                     |
>> + *        |---------------------|<------- 0x6000
>> + *   +----|        DCB 0        |
>> + *   |    |---------------------|
>> + *   |    |        DCB 1        |
>> + *   |    |---------------------|      Format of Data Control Blocks
>> + *   |    | One by one, packed  |            +------------+
>> + *   |    |---------------------|            |  u16 type  |
>> + *   |    |        DCB N        |----+       |            |
>> + *   |    |---------------------|    |       +------------+
>> + *   |    |          .          |    |       | u8 version |
>> + *   |    |          .          |    |       |  u8 index  |
>> + *   |    |          .          |    |       +------------+
>> + *   |    |---------------------|    |       |            |
>> + *   |    |        DCB end      |    |       | u32 offset |
>> + *   |    |---------------------|    |   +-------         |
>> + *   |    |                     |    |   |   |            |
>> + *   |    |_____________________|    |   |   +------------+
>> + *   |    |_____________________|    |   |   |            |
>> + *   |    |                     |    |   |   |  u32 size  |
>> + *   +--->|  vbios header info  |    |   |   |         -------+
>> + *        |_____________________|    |   |   |            |   |
>> + *        |          .          |    |   |   +------------+   |
>> + *        |          .          |    |   |   |  useless   |   |
>> + *        |          .          |    |   |   |  members   |   |
>> + *        |_____________________|    |   |   +------------+   |
>> + *        |                     |    |   |                    |
>> + *        |    encoders info    |<---+   |                    |
>> + *        |_____________________|        |                    |
>> + *        |                     |     ___|                    |
>> + *        |_____________________|____/                        |
>> + *        |                     |                             |
>> + *        |      Something      |                             |
>> + *        |_____________________|_________________            |
>> + *        |                     |             |               |
>> + *        |        EDID         |             |<--------------+
>> + *        |_____________________|_____________|___
>> + *        |                     |
>> + *        |                     |    Contents of those device specific data
>> + *        |  GPU specific info  |    block are implement-defined and version
>> + *        |                     |    dependent :0
>> + *        |_____________________|
>> + *        /          .          /
>> + *        /          .          /
>> + *        /          .          /
>> + *        |_____________________|  0x040000
>> + *
>> + */
>> +
>> +enum loongson_vbios_dcb_type {
>> +       LV_DCB_HEADER = 0,
>> +       LV_DCB_CRTC = 1,
>> +       LV_DCB_ENCODER = 2,
>> +       LV_DCB_CONNECTOR = 3,
>> +       LV_DCB_I2C = 4,
>> +       LV_DCB_PWM = 5,
>> +       LV_DCB_GPIO = 6,
>> +       LV_DCB_BACKLIGHT = 7,
>> +       LV_DCB_FAN = 8,
>> +       LV_DCB_IRQ = 9,
>> +       LV_DCB_ENCODER_CFG = 10,
>> +       LV_DCB_ENCODER_RES = 11,
>> +       LV_DCB_GPU = 12,
>> +       LV_DCB_UNKNOWN = 13,
>> +       LV_DCB_END = 0xffff,
>> +};
>> +
>> +struct loongson_vbios_header {
>> +       char header[16];
>> +       u32 version_major;
> Please specify whether this is BE or LE. (__be32 or __le32). Usually
> we use le32_to_cpu / be32_to_cpu helpers to access external data.
>
Yes, you are right.

But all Loongson CPU are Little Endian, we take it for granted by default.
Use le32_to_cpu() seems unnecessary?

In principle, you are right.
But when I started to do it, I found the actual difficult is that
I don't have a environment(BIG Endian machine) to test. I means that
it is probably better wait the bug happen. Otherwise, I don't know
where to add le32_to_cpu().
  
  

>> +       u32 version_minor;
>> +       char information[20];
>> +       u32 num_crtc;
>> +       u32 crtc_offset;
>> +       u32 num_connector;
>> +       u32 connector_offset;
>> +       u32 num_encoder;
>> +       u32 encoder_offset;
>> +} __packed;
>> +
>> +struct loongson_vbios_encoder {
>> +       u32 feature;
>> +       u32 i2c_id;
>> +       u32 connector_id;
>> +       u32 type;
>> +       u32 config_method;
>> +       u32 chip_id;
>> +       u8 chip_addr;
>> +} __packed;
>> +
>> +struct loongson_vbios_connector {
>> +       u32 feature;
>> +       u32 i2c_id;
>> +       u8  edid[256];
>> +       u32 type;
>> +       u32 hotplug_method;
>> +       u32 edid_method;
>> +       u32 hpd_int_gpio;
>> +       u32 gpio_place;
>> +} __packed;
>> +
>> +/*
>> + * A list node which contains the information about the device specific data
>> + * block, the device here refer to the property or topology of hardware
>> + * configuration, such as external display bridges, HDP GPIO, connectors etc.
>> + */
>> +struct loongson_vbios_node {
>> +       struct list_head head;
>> +
>> +       /* @type: the type of the data. For search */
>> +       u32 type;
>> +       /* @id: the index(display pipe) of the data belong to. For search */
>> +       u32 id;
>> +       /*
>> +        * @data: point to the device specific data block, such as external
>> +        * encoders name and it's i2c device address, hpd gpio resource etc.
>> +        */
>> +       const void *data;
>> +       /*
>> +        * The size of the data.
>> +        */
>> +       u32 size;
>> +};
>> +
>> +/*
>> + * The returned pointer is actually point to &__loongson_vbios, but this
>> + * function is only intended to provide READ-ONLY access. As our vbios is
>> + * only be able to pass(provide) parameters, it is not executable and outside
>> + * should not modify it.
>> + */
>> +const struct loongson_vbios *to_loongson_vbios(struct drm_device *ddev)
>> +{
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       const struct loongson_gfx_desc *gfx = to_loongson_gfx(ldev->descp);
>> +
>> +       return gfx->vbios;
>> +}
>> +
>> +static bool loongson_vbios_is_valid(const struct loongson_vbios *vbios)
>> +{
>> +       char header[32];
>> +
>> +       memcpy(header, vbios->raw_data, sizeof(header));
>> +
>> +       if (strcmp(header, LOONGSON_VBIOS_HEADER_STR))
>> +               return false;
>> +
>> +       return true;
>> +}
>> +
>> +/*
>> + * The VBIOS blob is stored at the last 1 MiB of the VRAM, no SPI flush or
> flash?


Yes, thanks a lot. Will be fixed at the next version.


>> + * EEPROM is needed. Platform BIOS is responsible for store this VBIOS blob
> storing


Thanks a lot,  :-)


>> + * data at right position on per boot time.
>> + */
>> +static int loongson_vbios_construct(struct drm_device *ddev,
>> +                                   struct loongson_vbios *vbios)
>> +{
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       u64 vram_end = ldev->vram_base + ldev->vram_size;
>> +       u64 vbios_start = vram_end - LOONGSON_VBIOS_BLOCK_OFFSET;
>> +       void __iomem *ptr;
>> +
>> +       vbios->raw_data = kzalloc(LOONGSON_VBIOS_BLOCK_SIZE, GFP_KERNEL);
>> +       if (!vbios->raw_data)
>> +               return -ENOMEM;
>> +
>> +       ptr = ioremap(vbios_start, LOONGSON_VBIOS_BLOCK_SIZE);
>> +       if (!ptr) {
>> +               drm_err(ddev, "Map VBIOS region failed\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       memcpy_fromio(vbios->raw_data, ptr, LOONGSON_VBIOS_BLOCK_SIZE);
>> +
>> +       iounmap(ptr);
>> +
>> +       INIT_LIST_HEAD(&vbios->list);
>> +       vbios->ddev = ddev;
>> +
>> +       return 0;
>> +}
>> +
>> +static void loongson_vbios_destruct(struct drm_device *ddev, void *data)
> destroy or free. Also you can use drmm_ functions to make destructor
> unnecessary.


Originally, I not sure if drmm_ functions suffer from order problem.
I means some data should to be freed first, other data need to be freed after.
free it by myself is more safe and can explicit control.
OK, I will try you advice.


>> +{
>> +       struct loongson_vbios *vbios = (struct loongson_vbios *)data;
>> +       struct loongson_vbios_node *node;
>> +       struct loongson_vbios_node *tmp;
>> +
>> +       list_for_each_entry_safe(node, tmp, &vbios->list, head) {
>> +               list_del(&node->head);
>> +               kfree(node);
>> +       }
>> +
>> +       kfree(vbios->raw_data);
>> +       vbios->raw_data = NULL;
>> +}
>> +
>> +static void loongson_vbios_print_dcb(struct drm_device *ddev,
>> +                                    struct loongson_vbios_dcb *dcb)
>> +{
>> +       drm_info(ddev, "type: %u, Offset: %u, Size: %u, version: %u, ID: %u\n",
>> +                dcb->type, dcb->offset, dcb->size, dcb->version, dcb->id);
>> +}
>> +
>> +/*
>> + * Process the data control block, establish a list for later searching.
>> + * returns the number of data control block. Generally, loongson vbios
>> + * has only 10 DCB or so.
>> + */
>> +static int loongson_vbios_process_dcb(struct loongson_vbios *vbios,
>> +                                     bool verbose)
>> +{
>> +       struct drm_device *ddev = vbios->ddev;
>> +       void *base = vbios->raw_data;
>> +       int count = 0;
>> +       struct loongson_vbios_dcb *dcb;
>> +
>> +       dcb = (struct loongson_vbios_dcb *)(base + LOONGSON_VBIOS_DCB_OFFSET);
>> +
>> +       while (dcb->type != LV_DCB_END) {
>> +               struct loongson_vbios_node *node;
>> +
>> +               node = kzalloc(sizeof(*node), GFP_KERNEL);
>> +               if (!node)
>> +                       return -ENOMEM;
>> +
>> +               node->type = dcb->type;
>> +               node->id = dcb->id;
>> +               node->data = base + dcb->offset;
>> +               node->size = dcb->size;
>> +
>> +               list_add_tail(&node->head, &vbios->list);
>> +
>> +               if (verbose)
>> +                       loongson_vbios_print_dcb(ddev, dcb);
>> +
>> +               ++dcb;
>> +
>> +               if (++count > 1024) {
>> +                       drm_err(ddev, "Unlikely, DCB is too much\n");
>> +                       break;
>> +               }
>> +       }
>> +
>> +       return count;
>> +}
>> +
>> +static const struct loongson_vbios_node *
>> +loongson_vbios_get_node(struct drm_device *ddev, u32 type, u32 id)
>> +{
>> +       const struct loongson_vbios *vbios = to_loongson_vbios(ddev);
>> +       struct loongson_vbios_node *np;
>> +
>> +       if (!vbios)
>> +               return NULL;
>> +
>> +       list_for_each_entry(np, &vbios->list, head) {
>> +               if (np->type == type && np->id == id)
>> +                       return np;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +bool loongson_vbios_query_encoder_info(struct drm_device *ddev,
>> +                                      u32 pipe,
>> +                                      u32 *type,
>> +                                      enum loongson_vbios_encoder_name *name,
>> +                                      u8 *i2c_addr)
>> +{
>> +       const struct loongson_vbios_encoder *vencoder;
>> +       const struct loongson_vbios_node *np;
>> +
>> +       np = loongson_vbios_get_node(ddev, LV_DCB_ENCODER, pipe);
>> +       if (!np)
>> +               return false;
>> +
>> +       if (np->size != sizeof(*vencoder))
>> +               WARN_ON(1);
>> +
>> +       vencoder = (const struct loongson_vbios_encoder *)np->data;
>> +
>> +       if (type)
>> +               *type = vencoder->type;
>> +
>> +       if (name)
>> +               *name = vencoder->chip_id;
>> +
>> +       /* i2c address, as a slave device */
>> +       if (i2c_addr)
>> +               *i2c_addr = vencoder->chip_addr;
>> +
>> +       return true;
>> +}
>> +
>> +bool loongson_vbios_query_connector_info(struct drm_device *ddev,
>> +                                        u32 pipe,
>> +                                        u32 *connector_type,
>> +                                        u32 *hpd_method,
>> +                                        u32 *int_gpio,
>> +                                        u8 *edid_blob)
>> +{
>> +       const struct loongson_vbios_connector *vconnector;
>> +       const struct loongson_vbios_node *np;
>> +
>> +       np = loongson_vbios_get_node(ddev, LV_DCB_CONNECTOR, pipe);
>> +       if (!np)
>> +               return false;
>> +
>> +       if (np->size != sizeof(*vconnector))
>> +               WARN_ON(1);
>> +
>> +       vconnector = (const struct loongson_vbios_connector *)np->data;
>> +
>> +       if (connector_type)
>> +               *connector_type = vconnector->type;
>> +
>> +       if (edid_blob)
>> +               memcpy(edid_blob, vconnector->edid, 256);
>> +
>> +       if (int_gpio)
>> +               *int_gpio = vconnector->hpd_int_gpio;
>> +
>> +       return true;
>> +}
>> +
>> +static void loongson_vbios_acquire_version(struct drm_device *ddev,
>> +                                          struct loongson_vbios *vbios)
>> +{
>> +       struct loongson_vbios_header *vh;
>> +
>> +       vh = (struct loongson_vbios_header *)vbios->raw_data;
>> +
>> +       vbios->version_major = vh->version_major;
>> +       vbios->version_minor = vh->version_minor;
>> +
>> +       drm_info(ddev, "Loongson VBIOS version: %u.%u\n",
>> +                vh->version_major, vh->version_minor);
>> +}
>> +
>> +int loongson_vbios_init(struct drm_device *ddev)
>> +{
>> +       struct loongson_vbios *vbios = &__loongson_vbios;
>> +       int ret;
>> +       int num;
>> +
>> +       ret = loongson_vbios_construct(ddev, vbios);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = drmm_add_action_or_reset(ddev, loongson_vbios_destruct, vbios);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (!loongson_vbios_is_valid(vbios)) {
>> +               drm_err(ddev, "Loongson VBIOS: header is invalid\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       loongson_vbios_acquire_version(ddev, vbios);
> get_version.
OK, no problem.
>> +
>> +       num = loongson_vbios_process_dcb(vbios, false);
>> +       if (num <= 0) {
>> +               drm_err(ddev, "Loongson VBIOS: Process DCB failed\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       drm_info(ddev, "Loongson VBIOS: has %d DCBs\n", num);
>> +
>> +       return 0;
>> +}
>> diff --git a/drivers/gpu/drm/loongson/loongson_vbios.h b/drivers/gpu/drm/loongson/loongson_vbios.h
>> new file mode 100644
>> index 000000000000..66fb43b3609e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/loongson_vbios.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#ifndef __LOONGSON_VBIOS_H__
>> +#define __LOONGSON_VBIOS_H__
>> +
>> +#include <drm/drm_device.h>
>> +
>> +struct loongson_vbios {
>> +       struct list_head list;
>> +       void *raw_data;
>> +       struct drm_device *ddev;
>> +       u32 version_major;
>> +       u32 version_minor;
>> +};
>> +
>> +enum loongson_vbios_encoder_name {
>> +       ENCODER_CHIP_UNKNOWN = 0x00,
>> +       ENCODER_CHIP_INTERNAL_VGA = 0x01,
>> +       ENCODER_CHIP_INTERNAL_HDMI = 0x02,
>> +       ENCODER_CHIP_CH7055 = 0x10,
>> +       ENCODER_CHIP_ADV7125 = 0x11,
>> +       ENCODER_CHIP_TFP410 = 0x20,
>> +       ENCODER_CHIP_IT66121 = 0x30,
>> +       ENCODER_CHIP_SIL9022 = 0x31,
>> +       ENCODER_CHIP_LT8618 = 0x32,
>> +       ENCODER_CHIP_MS7210 = 0x33,
>> +       ENCODER_CHIP_NCS8805 = 0x40,
>> +       ENCODER_CHIP_LT9721 = 0x42,
>> +       ENCODER_CHIP_LT6711 = 0x43,
>> +       ENCODER_CHIP_LT8619 = 0x50,
>> +};
>> +
>> +enum loongson_vbios_hotplug_method {
>> +       LV_HPD_DISABLED = 0,
>> +       LV_HPD_POLLING = 1,
>> +       LV_HPD_IRQ = 2,
>> +};
>> +
>> +const struct loongson_vbios *to_loongson_vbios(struct drm_device *ddev);
>> +
>> +bool loongson_vbios_query_encoder_info(struct drm_device *ddev,
>> +                                      u32 pipe,
>> +                                      u32 *type,
>> +                                      enum loongson_vbios_encoder_name *name,
>> +                                      u8 *i2c_addr);
>> +
>> +bool loongson_vbios_query_connector_info(struct drm_device *ddev,
>> +                                        u32 pipe,
>> +                                        u32 *connector_type,
>> +                                        u32 *hpd_method,
>> +                                        u32 *int_gpio,
>> +                                        u8 *edid_blob);
>> +
>> +int loongson_vbios_init(struct drm_device *ddev);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
>> index 89ccc0c43169..aebb200fa567 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
>> @@ -213,6 +213,10 @@ lsdc_create_device(struct pci_dev *pdev,
>>                  return ERR_PTR(ret);
>>          }
>>
>> +       ret = loongson_vbios_init(ddev);
>> +       if (ret)
>> +               drm_info(ddev, "No VBIOS support\n");
>> +
>>          ret = drm_aperture_remove_conflicting_framebuffers(ldev->vram_base,
>>                                                             ldev->vram_size,
>>                                                             driver);
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
>> index fbf2d760ef27..335953c988d1 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
>> @@ -16,6 +16,7 @@
>>   #include <drm/drm_plane.h>
>>   #include <drm/ttm/ttm_device.h>
>>
>> +#include "loongson_vbios.h"
>>   #include "lsdc_i2c.h"
>>   #include "lsdc_irq.h"
>>   #include "lsdc_gfxpll.h"
>> @@ -85,6 +86,13 @@ struct loongson_gfx_desc {
>>                  u32 reg_size;
>>          } pixpll[LSDC_NUM_CRTC];
>>
>> +       /*
>> +        * @vbios: Provide information about the output configuration,
>> +        * and provide information about dynamic features which cannot
>> +        * be detected(determined) with the chip_id.
>> +        */
>> +       const struct loongson_vbios *vbios;
>> +
>>          enum loongson_chip_id chip_id;
>>          char model[64];
>>   };
>> --
>> 2.34.1
>>
>

