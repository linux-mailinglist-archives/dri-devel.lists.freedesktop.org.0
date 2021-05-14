Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6096380690
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 11:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C797D6E28A;
	Fri, 14 May 2021 09:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0786E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 09:55:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14692613B6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620986111;
 bh=2Xpzy+JqLJ5UwatMt6cnEJQCybknnqBIqsQVM4t531c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PID8ZoBKFnq0Rj06iYaPZb35qMIaYZqrCA7mvS14TolTXWRHpoUs7q22lYrjjSnii
 w2deMjRVjIVSVr6AH1K/+xALkMwgJ0Ha7T6VWG99o14NvwlxA8w8PN8DBAWOhIxHnh
 4+xpzXhD2sBsu/81H8VYFxyg+tFO5+dCzOhEV9zv1NvsVPz/hx+GcKOMjR4oIb0xXP
 ocw5jSpDfXy51QlAEq110HOONJLMuJXYuJ1s817CmJoZhcKTe+mZFolIIO4nLIKIRd
 46EANuhhx8lKCj/Ik4Tflhl8qVocLzxXvaPkkofckyx4Yr14O9fRvaAzrhF4vA1jL1
 QKH8ukeMs4oHg==
Received: by mail-io1-f54.google.com with SMTP id d11so7043506iod.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 02:55:11 -0700 (PDT)
X-Gm-Message-State: AOAM531dmsL44cG0z2NuILA7BNPGN6e5uVoKpqhHpGfD3fHWhBLobScw
 ul6KvdAaQfN64W0gBanzbl2NAgGwv9GFIvagj8c=
X-Google-Smtp-Source: ABdhPJylHxifw22F1lIOgezosKml85EYoCWqbgXwar1qqKesk4w4xekldq32ml3ulPywwoWffyp3/WESgjxDU2CrK8w=
X-Received: by 2002:a5d:8147:: with SMTP id f7mr34511557ioo.135.1620986110447; 
 Fri, 14 May 2021 02:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <336c4fa0.1033.1796882e98e.Coremail.liplay@163.com>
In-Reply-To: <336c4fa0.1033.1796882e98e.Coremail.liplay@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 May 2021 17:55:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6FaMpGnD6nE+LtUaVXXY5Kfm9K5xOBrLktZapOFHTFBQ@mail.gmail.com>
Message-ID: <CAAhV-H6FaMpGnD6nE+LtUaVXXY5Kfm9K5xOBrLktZapOFHTFBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/loongson: Add GPIO and I2C driver for loongson drm.
To: lichenyang <liplay@163.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chenyang,

Please make this patch and the other one in a series.

Huacai

On Fri, May 14, 2021 at 9:50 AM lichenyang <liplay@163.com> wrote:
>
> Implement use GPIO and I2C driver to detect connector
> and fetch EDID via DDC.
>
> Signed-off-by: lichenyang <lichenyang@loongson.cn>
> ---
>  drivers/gpu/drm/loongson/Makefile             |   3 +-
>  drivers/gpu/drm/loongson/loongson_connector.c |  70 ++++-
>  drivers/gpu/drm/loongson/loongson_drv.c       |  16 +-
>  drivers/gpu/drm/loongson/loongson_drv.h       |  10 +
>  drivers/gpu/drm/loongson/loongson_i2c.c       | 280 ++++++++++++++++++
>  drivers/gpu/drm/loongson/loongson_i2c.h       |  38 +++
>  6 files changed, 410 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/loongson/loongson_i2c.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_i2c.h
>
> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
> index 22d063953b78..773b806e99a2 100644
> --- a/drivers/gpu/drm/loongson/Makefile
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -10,5 +10,6 @@ loongson-y := loongson_drv.o \
>   loongson_plane.o \
>   loongson_device.o \
>   loongson_connector.o \
> - loongson_encoder.o
> + loongson_encoder.o \
> + loongson_i2c.o
>  obj-$(CONFIG_DRM_LOONGSON) += loongson.o
> diff --git a/drivers/gpu/drm/loongson/loongson_connector.c b/drivers/gpu/drm/loongson/loongson_connector.c
> index 6b1f0ffa33bd..2096a6ddc366 100644
> --- a/drivers/gpu/drm/loongson/loongson_connector.c
> +++ b/drivers/gpu/drm/loongson/loongson_connector.c
> @@ -4,12 +4,65 @@
>
>  static int loongson_get_modes(struct drm_connector *connector)
>  {
> - int count;
> + struct loongson_connector *lconnector;
> + struct i2c_adapter *adapter;
> + struct edid *edid = NULL;
> + u32 ret;
> +
> + lconnector = to_loongson_connector(connector);
> + adapter = lconnector->i2c->adapter;
>
> - count = drm_add_modes_noedid(connector, 1920, 1080);
> - drm_set_preferred_mode(connector, 1024, 768);
> + if (adapter != NULL)
> + edid = drm_get_edid(connector, adapter);
> + else
> + DRM_DEBUG_KMS("get loongson connector adapter err\n");
>
> - return count;
> + if (edid) {
> + drm_connector_update_edid_property(connector, edid);
> + ret = drm_add_edid_modes(connector, edid);
> + } else {
> + DRM_ERROR("Failed to read EDID\n");
> + ret = drm_add_modes_noedid(connector, 1024, 768);
> + }
> +
> + return ret;
> +}
> +
> +static bool is_connected(struct loongson_connector *ls_connector)
> +{
> + unsigned char start = 0x0;
> + struct i2c_adapter *adapter;
> + struct i2c_msg msgs = {
> + .addr = DDC_ADDR,
> + .flags = 0,
> + .len = 1,
> + .buf = &start,
> + };
> +
> + if (!ls_connector->i2c)
> + return false;
> +
> + adapter = ls_connector->i2c->adapter;
> + if (i2c_transfer(adapter, &msgs, 1) != 1) {
> + DRM_DEBUG_KMS("display-%d not connect\n", ls_connector->id);
> + return false;
> + }
> +
> + return true;
> +}
> +
> +static enum drm_connector_status
> +loongson_detect(struct drm_connector *connector, bool force)
> +{
> + struct loongson_connector *lconnector;
> + enum drm_connector_status ret = connector_status_disconnected;
> +
> + lconnector = to_loongson_connector(connector);
> +
> + if (is_connected(lconnector))
> + ret = connector_status_connected;
> +
> + return ret;
>  }
>
>  static const struct drm_connector_helper_funcs loongson_connector_helper = {
> @@ -17,6 +70,7 @@ static const struct drm_connector_helper_funcs loongson_connector_helper = {
>  };
>
>  static const struct drm_connector_funcs loongson_connector_funcs = {
> + .detect = loongson_detect,
>   .fill_modes = drm_helper_probe_single_connector_modes,
>   .destroy = drm_connector_cleanup,
>   .reset = drm_atomic_helper_connector_reset,
> @@ -37,11 +91,17 @@ int loongson_connector_init(struct loongson_device *ldev, int index)
>
>   lconnector->ldev = ldev;
>   lconnector->id = index;
> + lconnector->i2c_id = index + DC_I2C_BASE;
> +
> + lconnector->i2c = loongson_i2c_bus_match(ldev, lconnector->i2c_id);
> + if (!lconnector->i2c)
> + DRM_INFO("connector-%d match i2c-%d err\n", index,
> + lconnector->i2c_id);
>
>   ldev->mode_info[index].connector = lconnector;
>   connector = &lconnector->base;
>   drm_connector_init(ldev->dev, connector, &loongson_connector_funcs,
> -   DRM_MODE_CONNECTOR_Unknown);
> + DRM_MODE_CONNECTOR_Unknown);
>   drm_connector_helper_add(connector, &loongson_connector_helper);
>
>   return 0;
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
> index e405199a3df6..252be9e25aff 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.c
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -11,9 +11,10 @@
>
>  /* Interface history:
>   * 0.1 - original.
> + * 0.2 - add i2c and connector detect.
>   */
>  #define DRIVER_MAJOR 0
> -#define DRIVER_MINOR 1
> +#define DRIVER_MINOR 2
>
>  static const struct drm_mode_config_funcs loongson_mode_funcs = {
>   .fb_create = drm_gem_fb_create,
> @@ -31,6 +32,7 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
>   resource_size_t aper_size;
>   resource_size_t mmio_base;
>   resource_size_t mmio_size;
> + u32 ret;
>
>   /* GPU MEM */
>   /* We need get 7A-gpu pci device information for ldev->gpu_pdev */
> @@ -72,6 +74,18 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
>   if (ldev->io == NULL)
>   return -ENOMEM;
>
> + ret = loongson_dc_gpio_init(ldev);
> + if (ret) {
> + DRM_ERROR("Failed to initialize dc gpios\n");
> + return ret;
> + }
> +
> + ret = loongson_i2c_init(ldev);
> + if (ret) {
> + DRM_ERROR("Failed to initialize dc i2c\n");
> + return ret;
> + }
> +
>   DRM_INFO("DC mmio base 0x%llx size 0x%llx io 0x%llx\n",
>   mmio_base, mmio_size, *(u64 *)ldev->io);
>   DRM_INFO("GPU vram start = 0x%x size = 0x%x\n",
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
> index 498d1b082a19..24a534c3c79c 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.h
> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
> @@ -18,6 +18,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_encoder.h>
> +#include "loongson_i2c.h"
>
>  /* General customization:
>   */
> @@ -28,6 +29,7 @@
>
>  #define to_loongson_crtc(x) container_of(x, struct loongson_crtc, base)
>  #define to_loongson_encoder(x) container_of(x, struct loongson_encoder, base)
> +#define to_loongson_connector(x) container_of(x, struct loongson_connector, base)
>
>  #define LS7A_CHIPCFG_REG_BASE (0x10010000)
>  #define PCI_DEVICE_ID_LOONGSON_DC 0x7a06
> @@ -92,8 +94,10 @@ struct loongson_encoder {
>  struct loongson_connector {
>   struct drm_connector base;
>   struct loongson_device *ldev;
> + struct loongson_i2c *i2c;
>   u16 id;
>   u32 type;
> + u16 i2c_id;
>  };
>
>  struct loongson_mode_info {
> @@ -115,6 +119,9 @@ struct loongson_device {
>   u32 num_crtc;
>   struct loongson_mode_info mode_info[2];
>   struct pci_dev *gpu_pdev; /* LS7A gpu device info */
> +
> + struct loongson_i2c i2c_bus[LS_MAX_I2C_BUS];
> + struct gpio_chip chip;
>  };
>
>  /* crtc */
> @@ -129,6 +136,9 @@ int loongson_encoder_init(struct loongson_device *ldev, int index);
>  /* plane */
>  int loongson_plane_init(struct loongson_crtc *lcrtc);
>
> +/* i2c */
> +int loongson_dc_gpio_init(struct loongson_device *ldev);
> +
>  /* device */
>  u32 loongson_gpu_offset(struct drm_plane_state *state);
>  u32 ls7a_mm_rreg(struct loongson_device *ldev, u32 offset);
> diff --git a/drivers/gpu/drm/loongson/loongson_i2c.c b/drivers/gpu/drm/loongson/loongson_i2c.c
> new file mode 100644
> index 000000000000..ef06a6787e34
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_i2c.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_i2c.h"
> +#include "loongson_drv.h"
> +#include "linux/gpio.h"
> +#include <linux/gpio/consumer.h>
> +
> +static struct gpio i2c_gpios[4] = {
> + { .gpio = DC_GPIO_0, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-sda" },
> + { .gpio = DC_GPIO_1, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-scl" },
> + { .gpio = DC_GPIO_2, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-sda" },
> + { .gpio = DC_GPIO_3, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-scl" },
> +};
> +
> +static inline void __dc_gpio_set_dir(struct loongson_device *ldev,
> +     unsigned int pin, int input)
> +{
> + u32 temp;
> +
> + temp = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_CFG_OFFSET);
> +
> + if (input)
> + temp |= 1UL << pin;
> + else
> + temp &= ~(1UL << pin);
> +
> + ls7a_mm_wreg(ldev, LS7A_DC_GPIO_CFG_OFFSET, temp);
> +}
> +
> +static void __dc_gpio_set_val(struct loongson_device *ldev,
> +      unsigned int pin, int high)
> +{
> + u32 temp;
> +
> + temp = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_OUT_OFFSET);
> +
> + if (high)
> + temp |= 1UL << pin;
> + else
> + temp &= ~(1UL << pin);
> +
> + ls7a_mm_wreg(ldev, LS7A_DC_GPIO_OUT_OFFSET, temp);
> +}
> +
> +static int ls_dc_gpio_request(struct gpio_chip *chip, unsigned int pin)
> +{
> + if (pin >= (chip->ngpio + chip->base))
> + return -EINVAL;
> + else
> + return 0;
> +}
> +
> +static int ls_dc_gpio_dir_input(struct gpio_chip *chip, unsigned int pin)
> +{
> + struct loongson_device *ldev;
> +
> + ldev = container_of(chip, struct loongson_device, chip);
> + __dc_gpio_set_dir(ldev, pin, 1);
> +
> + return 0;
> +}
> +
> +static int ls_dc_gpio_dir_output(struct gpio_chip *chip,
> + unsigned int pin, int value)
> +{
> + struct loongson_device *ldev;
> +
> + ldev = container_of(chip, struct loongson_device, chip);
> + __dc_gpio_set_val(ldev, pin, value);
> + __dc_gpio_set_dir(ldev, pin, 0);
> +
> + return 0;
> +}
> +
> +static void ls_dc_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
> +{
> + struct loongson_device *ldev;
> +
> + ldev = container_of(chip, struct loongson_device, chip);
> + __dc_gpio_set_val(ldev, pin, value);
> +}
> +
> +static int ls_dc_gpio_get(struct gpio_chip *chip, unsigned int pin)
> +{
> + u32 val;
> + struct loongson_device *ldev;
> +
> + ldev = container_of(chip, struct loongson_device, chip);
> + val = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_IN_OFFSET);
> + return (val >> pin) & 1;
> +}
> +
> +static void loongson_i2c_set_data(void *i2c, int value)
> +{
> + struct loongson_i2c *li2c = i2c;
> + struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
> +
> + gpiod_set_value_cansleep(gpiod, value);
> +}
> +
> +static void loongson_i2c_set_clock(void *i2c, int value)
> +{
> + struct loongson_i2c *li2c = i2c;
> + struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
> +
> + gpiod_set_value_cansleep(gpiod, value);
> +}
> +
> +static int loongson_i2c_get_data(void *i2c)
> +{
> + struct loongson_i2c *li2c = i2c;
> + struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
> +
> + return gpiod_get_value_cansleep(gpiod);
> +}
> +
> +static int loongson_i2c_get_clock(void *i2c)
> +{
> + struct loongson_i2c *li2c = i2c;
> + struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
> +
> + return gpiod_get_value_cansleep(gpiod);
> +}
> +
> +static int loongson_i2c_create(struct loongson_i2c *li2c, const char *name)
> +{
> + int ret;
> + unsigned int i2c_num;
> + struct i2c_client *i2c_cli;
> + struct i2c_adapter *i2c_adapter;
> + struct i2c_board_info i2c_info;
> + struct i2c_algo_bit_data *i2c_algo_data;
> + struct device *dev;
> +
> + dev = &li2c->adapter->dev;
> + i2c_num = li2c->i2c_id;
> + i2c_adapter = kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
> + if (IS_ERR(i2c_adapter)) {
> + ret = PTR_ERR(i2c_adapter);
> + goto error_mem;
> + }
> + i2c_algo_data = kzalloc(sizeof(struct i2c_algo_bit_data), GFP_KERNEL);
> + if (IS_ERR(i2c_algo_data)) {
> + ret = PTR_ERR(i2c_algo_data);
> + goto error_mem;
> + }
> +
> + i2c_adapter->owner = THIS_MODULE;
> + i2c_adapter->class = I2C_CLASS_DDC;
> + i2c_adapter->algo_data = i2c_algo_data;
> + i2c_adapter->nr = i2c_num;
> + snprintf(i2c_adapter->name, sizeof(i2c_adapter->name), "%s%d",
> + name, i2c_num - DC_I2C_BASE);
> +
> + li2c->data = i2c_num % DC_I2C_BASE * 2;
> + li2c->clock = i2c_num % DC_I2C_BASE * 2 + 1;
> + DRM_INFO("Created i2c-%d, sda=%d, scl=%d\n",
> + i2c_num, li2c->data, li2c->clock);
> +
> + if (gpio_cansleep(i2c_gpios[li2c->data].gpio) ||
> +    gpio_cansleep(i2c_gpios[li2c->clock].gpio))
> + dev_warn(dev, "Slow GPIO pins might wreak havoc I2C timing\n");
> +
> + i2c_algo_data->setsda = loongson_i2c_set_data;
> + i2c_algo_data->setscl = loongson_i2c_set_clock;
> + i2c_algo_data->getsda = loongson_i2c_get_data;
> + i2c_algo_data->getscl = loongson_i2c_get_clock;
> + i2c_algo_data->udelay = DC_I2C_TON;
> + i2c_algo_data->timeout = usecs_to_jiffies(2200);
> +
> + ret = i2c_bit_add_numbered_bus(i2c_adapter);
> + if (ret) {
> + DRM_ERROR("Failed to register i2c algo-bit adapter %s\n",
> +  i2c_adapter->name);
> + kfree(i2c_adapter);
> + i2c_adapter = NULL;
> + }
> +
> + li2c->adapter = i2c_adapter;
> + i2c_algo_data->data = li2c;
> + i2c_set_adapdata(li2c->adapter, li2c);
> + DRM_INFO("Register i2c algo-bit adapter [%s]\n", i2c_adapter->name);
> +
> + memset(&i2c_info, 0, sizeof(struct i2c_board_info));
> + strncpy(i2c_info.type, name, I2C_NAME_SIZE);
> + i2c_info.addr = DDC_ADDR;
> + i2c_cli = i2c_new_client_device(i2c_adapter, &i2c_info);
> + if (i2c_cli == NULL) {
> + DRM_ERROR("Failed to create i2c adapter\n");
> + return -EBUSY;
> + }
> + li2c->init = true;
> + return 0;
> +
> +error_mem:
> + DRM_ERROR("Failed to malloc memory for loongson i2c\n");
> + return ret;
> +}
> +
> +static int loongson_i2c_add(struct loongson_device *ldev, const char *name)
> +{
> + int i;
> +
> + for (i = 0; i < LS_MAX_I2C_BUS; i++) {
> + if (ldev->i2c_bus[i].use)
> + loongson_i2c_create(&ldev->i2c_bus[i], name);
> + else {
> + DRM_DEBUG_DRIVER("i2c_bus[%d] not use\n", i);
> + return -ENODEV;
> + }
> + }
> + return 0;
> +}
> +
> +int loongson_dc_gpio_init(struct loongson_device *ldev)
> +{
> + int ret;
> + struct gpio_chip *chip;
> +
> + chip = &ldev->chip;
> + chip->label = "ls7a-dc-gpio";
> + chip->base = LS7A_DC_GPIO_BASE;
> + chip->ngpio = 4;
> + chip->parent = ldev->dev->dev;
> + chip->request = ls_dc_gpio_request;
> + chip->direction_input = ls_dc_gpio_dir_input;
> + chip->direction_output = ls_dc_gpio_dir_output;
> + chip->set = ls_dc_gpio_set;
> + chip->get = ls_dc_gpio_get;
> + chip->can_sleep = false;
> +
> + ret = devm_gpiochip_add_data(ldev->dev->dev, chip, ldev);
> + if (ret) {
> + DRM_ERROR("Failed to register ls7a dc gpio driver\n");
> + return -ENODEV;
> + }
> + DRM_INFO("Registered ls7a dc gpio driver\n");
> +
> + return 0;
> +}
> +
> +int loongson_i2c_init(struct loongson_device *ldev)
> +{
> + int ret;
> +
> + ret = gpio_request_array(i2c_gpios, ARRAY_SIZE(i2c_gpios));
> + if (ret) {
> + DRM_ERROR("Failed to request gpio array i2c_gpios\n");
> + return -ENODEV;
> + }
> +
> + ldev->i2c_bus[0].i2c_id = 6;
> + ldev->i2c_bus[0].use = true;
> + ldev->i2c_bus[1].i2c_id = 7;
> + ldev->i2c_bus[1].use = true;
> +
> + loongson_i2c_add(ldev, DC_I2C_NAME);
> +
> + return 0;
> +}
> +
> +struct loongson_i2c *loongson_i2c_bus_match(struct loongson_device *ldev, u32 i2c_id)
> +{
> + u32 i;
> + struct loongson_i2c *match = NULL, *tables;
> +
> + tables = ldev->i2c_bus;
> +
> + for (i = 0; i < LS_MAX_I2C_BUS; i++) {
> + if (tables->i2c_id == i2c_id && tables->init == true) {
> + match = tables;
> + break;
> + }
> +
> + tables++;
> + }
> +
> + return match;
> +}
> +
> diff --git a/drivers/gpu/drm/loongson/loongson_i2c.h b/drivers/gpu/drm/loongson/loongson_i2c.h
> new file mode 100644
> index 000000000000..50d4d3f4b10f
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_i2c.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __LOONGSON_I2C_H__
> +#define __LOONGSON_I2C_H__
> +
> +#include <linux/i2c.h>
> +#include <linux/i2c-algo-bit.h>
> +#include <linux/gpio/driver.h>
> +#include <drm/drm_edid.h>
> +
> +#define DC_I2C_TON 5
> +#define DC_I2C_BASE 6
> +#define DC_I2C_NAME "ls_dc_i2c"
> +#define LS_MAX_I2C_BUS 16
> +
> +/* Loongson 7A display controller proprietary GPIOs */
> +#define LS7A_DC_GPIO_BASE 73
> +#define DC_GPIO_0 (73)
> +#define DC_GPIO_1 (74)
> +#define DC_GPIO_2 (75)
> +#define DC_GPIO_3 (76)
> +#define LS7A_DC_GPIO_CFG_OFFSET (0x1660)
> +#define LS7A_DC_GPIO_IN_OFFSET (0x1650)
> +#define LS7A_DC_GPIO_OUT_OFFSET (0x1650)
> +
> +struct loongson_device;
> +struct loongson_i2c {
> + struct i2c_adapter *adapter;
> + u32 data, clock;
> + bool use, init;
> + u32 i2c_id;
> +};
> +
> +struct loongson_i2c *loongson_i2c_bus_match(struct loongson_device *ldev,
> +    u32 i2c_id);
> +int loongson_i2c_init(struct loongson_device *ldev);
> +
> +#endif /* __LOONGSON_I2C_H__ */
> --
> 2.31.1
>
>
>
>
