Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3A2E91F7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6651F89D6C;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Mon, 04 Jan 2021 07:21:57 UTC
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5ADDA89A77
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:21:57 +0000 (UTC)
Received: from sunhao-CP65S.loongson.cn (unknown [10.20.42.162])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxjzSXwPJf3rAJAA--.2S2;
 Mon, 04 Jan 2021 15:15:35 +0800 (CST)
From: Hao Sun <sunhao@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/loongson: Add DDC support for loongson display controller
Date: Mon,  4 Jan 2021 15:15:35 +0800
Message-Id: <20210104071535.196192-1-sunhao@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9DxjzSXwPJf3rAJAA--.2S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGFyUWr4fAF1UAF48tFyrJFb_yoW8Aryfuo
 W8ZFnxu3yrXFyxAa90gr1fXF1UZFn8Xa10yr4fAr4DZFW5trn8tFyYgw17AFyfAF4Yqr4U
 A34Sg3yrGrW7Ja1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYn7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-CM-SenderInfo: xvxqxt3r6o00pqjv00gofq/
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: sunhao@loongson.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add GPIO and I2C driver to detect connector and fetch EDID via DDC.

Signed-off-by: Hao Sun <sunhao@loongson.cn>
---
 drivers/gpu/drm/loongson/Makefile             |   3 +-
 drivers/gpu/drm/loongson/loongson_connector.c | 121 +++++++-
 drivers/gpu/drm/loongson/loongson_drv.c       |  16 +-
 drivers/gpu/drm/loongson/loongson_drv.h       |  10 +
 drivers/gpu/drm/loongson/loongson_i2c.c       | 264 ++++++++++++++++++
 drivers/gpu/drm/loongson/loongson_i2c.h       |  40 +++
 6 files changed, 447 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loongson_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_i2c.h

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 22d063953b78..773b806e99a2 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -10,5 +10,6 @@ loongson-y := loongson_drv.o \
 	loongson_plane.o \
 	loongson_device.o \
 	loongson_connector.o \
-	loongson_encoder.o
+	loongson_encoder.o \
+	loongson_i2c.o
 obj-$(CONFIG_DRM_LOONGSON) += loongson.o
diff --git a/drivers/gpu/drm/loongson/loongson_connector.c b/drivers/gpu/drm/loongson/loongson_connector.c
index 7bf1e40318c3..955a0ac1719a 100644
--- a/drivers/gpu/drm/loongson/loongson_connector.c
+++ b/drivers/gpu/drm/loongson/loongson_connector.c
@@ -2,21 +2,126 @@
 
 #include "loongson_drv.h"
 
+static int loongson_do_probe_ddc_edid(struct i2c_adapter *adapter,
+				      unsigned char *buf)
+{
+	u8 start = 0x0;
+	u32 che_tmp = 0;
+	u32 i;
+
+	struct i2c_msg msgs[] = { {
+		.addr = DDC_ADDR,
+		.flags = 0,
+		.len = 1,
+		.buf = &start,
+	},
+	{
+		.addr = DDC_ADDR,
+		.flags = I2C_M_RD,
+		.len = EDID_LENGTH * 2,
+		.buf = buf,
+	} };
+
+	if (i2c_transfer(adapter, msgs, 2) == 2) {
+		if (buf[126] != 0) {
+			buf[126] = 0;
+			che_tmp = 0;
+			for (i = 0; i < 127; i++)
+				che_tmp += buf[i];
+			buf[127] = 256 - (che_tmp) % 256;
+		}
+		if (!drm_edid_block_valid(buf, 0, true, NULL)) {
+			dev_warn_once(&adapter->dev, "Invalid EDID block\n");
+			return false;
+		}
+	} else {
+		dev_warn_once(&adapter->dev, "unable to read EDID block\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool get_edid_i2c(struct loongson_connector *lconnector, u8 *edid)
+{
+	struct loongson_i2c *i2c = lconnector->i2c;
+	bool ret = false;
+
+	if (i2c != NULL && i2c->adapter != NULL)
+		ret = loongson_do_probe_ddc_edid(i2c->adapter, edid);
+	else
+		DRM_INFO_ONCE("get loongson connector adapter err\n");
+
+	return ret;
+}
+
 static int loongson_get_modes(struct drm_connector *connector)
 {
-	int count;
+	struct loongson_connector *lconnector;
+	u8 edid[EDID_LENGTH * 2];
+	u32 size;
+	bool success;
+	u32 ret;
+
+	lconnector = to_loongson_connector(connector);
+	size = sizeof(u8) * EDID_LENGTH * 2;
 
-	count =  drm_add_modes_noedid(connector, 1920, 1080);
-	drm_set_preferred_mode(connector, 1024, 768);
+	success = get_edid_i2c(lconnector, edid);
 
-	return count;
+	if (success) {
+		drm_connector_update_edid_property(connector,
+				(struct edid *)edid);
+		ret = drm_add_edid_modes(connector, (struct edid *)edid);
+	} else
+		ret = drm_add_modes_noedid(connector, 1024, 768);
+
+	return ret;
 }
 
+static bool is_connected(struct loongson_connector *ls_connector)
+{
+	unsigned char start = 0x0;
+	struct i2c_adapter *adapter;
+	struct i2c_msg msgs = {
+		.addr = DDC_ADDR,
+		.flags = 0,
+		.len = 1,
+		.buf = &start,
+	};
+
+	if (!ls_connector->i2c)
+		return false;
+
+	adapter = ls_connector->i2c->adapter;
+	if (i2c_transfer(adapter, &msgs, 1) != 1) {
+		DRM_DEBUG_KMS("display-%d not connect\n", ls_connector->id);
+		return false;
+	}
+
+	return true;
+}
+
+static enum drm_connector_status
+loongson_detect(struct drm_connector *connector, bool force)
+{
+	struct loongson_connector *lconnector;
+	enum drm_connector_status ret = connector_status_disconnected;
+
+	lconnector = to_loongson_connector(connector);
+
+	if (is_connected(lconnector))
+		ret = connector_status_connected;
+
+	return ret;
+}
+
+
 static const struct drm_connector_helper_funcs loongson_connector_helper = {
 	.get_modes = loongson_get_modes,
 };
 
 static const struct drm_connector_funcs loongson_connector_funcs = {
+	.detect = loongson_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
@@ -37,11 +142,17 @@ int loongson_connector_init(struct loongson_device *ldev, int index)
 
 	lconnector->ldev = ldev;
 	lconnector->id = index;
+	lconnector->i2c_id = index + DC_I2C_BASE;
+
+	lconnector->i2c = loongson_i2c_bus_match(ldev, lconnector->i2c_id);
+	if (!lconnector->i2c)
+		DRM_INFO("connector-%d match i2c-%d err\n", index,
+			 lconnector->i2c_id);
 
 	ldev->mode_info[index].connector = lconnector;
 	connector = &lconnector->base;
 	drm_connector_init(ldev->dev, connector, &loongson_connector_funcs,
-			   DRM_MODE_CONNECTOR_Unknown);
+			DRM_MODE_CONNECTOR_Unknown);
 	drm_connector_helper_add(connector, &loongson_connector_helper);
 
 	return 0;
diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
index 7c5c51341d91..6d0dc5db902c 100644
--- a/drivers/gpu/drm/loongson/loongson_drv.c
+++ b/drivers/gpu/drm/loongson/loongson_drv.c
@@ -11,9 +11,10 @@
 
 /* Interface history:
  * 0.1 - riginal.
+ * 0.2 - add i2c and connector detect.
  */
 #define DRIVER_MAJOR 0
-#define DRIVER_MINOR 1
+#define DRIVER_MINOR 2
 
 static const struct drm_mode_config_funcs loongson_mode_funcs = {
 	.fb_create = drm_gem_fb_create,
@@ -31,6 +32,7 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
 	resource_size_t aper_size;
 	resource_size_t mmio_base;
 	resource_size_t mmio_size;
+	u32 ret;
 
 	/* GPU MEM */
 	/* We need get 7A-gpu pci device information for ldev->gpu_pdev */
@@ -72,6 +74,18 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
 	if (ldev->io == NULL)
 		return -ENOMEM;
 
+	ret = loongson_dc_gpio_init(ldev);
+	if (ret) {
+		DRM_ERROR("Failed to initialize dc gpios\n");
+		return ret;
+	}
+
+	ret = loongson_i2c_init(ldev);
+	if (ret) {
+		DRM_ERROR("Failed to initialize dc i2c\n");
+		return ret;
+	}
+
 	DRM_INFO("DC mmio_base 0x%llx mmio_size 0x%llx io 0x%x\n",
 		 mmio_base, mmio_size, *(int *)ldev->io);
 	DRM_INFO("GPU vram_start = 0x%x vram_size = 0x%x\n",
diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
index da3e5673eb2b..0dfc48375db0 100644
--- a/drivers/gpu/drm/loongson/loongson_drv.h
+++ b/drivers/gpu/drm/loongson/loongson_drv.h
@@ -18,6 +18,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
+#include "loongson_i2c.h"
 
 /* General customization:
  */
@@ -28,6 +29,7 @@
 
 #define to_loongson_crtc(x) container_of(x, struct loongson_crtc, base)
 #define to_loongson_encoder(x) container_of(x, struct loongson_encoder, base)
+#define to_loongson_connector(x) container_of(x, struct loongson_connector, base)
 
 #define LS7A_CHIPCFG_REG_BASE (0x10010000)
 #define PCI_DEVICE_ID_LOONGSON_DC 0x7a06
@@ -85,8 +87,10 @@ struct loongson_encoder {
 struct loongson_connector {
 	struct drm_connector base;
 	struct loongson_device *ldev;
+	struct loongson_i2c *i2c;
 	u16 id;
 	u32 type;
+	u16 i2c_id;
 };
 
 struct loongson_mode_info {
@@ -109,6 +113,9 @@ struct loongson_device {
 	u32 num_crtc;
 	struct loongson_mode_info mode_info[2];
 	struct pci_dev *gpu_pdev; /* loongson 7A gpu device info */
+
+	struct loongson_i2c i2c_bus[LS_MAX_I2C_BUS];
+	struct gpio_chip chip;
 };
 
 /* crtc */
@@ -123,6 +130,9 @@ int loongson_encoder_init(struct loongson_device *ldev, int index);
 /* plane */
 int loongson_plane_init(struct loongson_crtc *lcrtc);
 
+/* i2c */
+int loongson_dc_gpio_init(struct loongson_device *ldev);
+
 /* device */
 u32 loongson_gpu_offset(struct drm_plane_state *state);
 u32 ls_mm_rreg(struct loongson_device *ldev, u32 offset);
diff --git a/drivers/gpu/drm/loongson/loongson_i2c.c b/drivers/gpu/drm/loongson/loongson_i2c.c
new file mode 100644
index 000000000000..b34c9e3c45ca
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loongson_i2c.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "loongson_i2c.h"
+#include "loongson_drv.h"
+#include "linux/gpio.h"
+#include <linux/gpio/consumer.h>
+
+static struct gpio i2c_gpios[4] = {
+	{ .gpio = DC_GPIO_0, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-sda" },
+	{ .gpio = DC_GPIO_1, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-scl" },
+	{ .gpio = DC_GPIO_2, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-sda" },
+	{ .gpio = DC_GPIO_3, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-scl" },
+};
+
+static inline void __dc_gpio_set_dir(struct loongson_device *ldev, unsigned int pin, int input)
+{
+	u32 temp;
+
+	temp = ls_mm_rreg_locked(ldev, LS7A_DC_GPIO_CFG_OFFSET);
+	if (input)
+		temp |= 1UL << pin;
+	else
+		temp &= ~(1UL << pin);
+	ls_mm_wreg_locked(ldev, LS7A_DC_GPIO_CFG_OFFSET, temp);
+}
+
+static void __dc_gpio_set_val(struct loongson_device *ldev, unsigned int pin, int high)
+{
+	u32 temp;
+
+	temp = ls_mm_rreg_locked(ldev, LS7A_DC_GPIO_OUT_OFFSET);
+	if (high)
+		temp |= 1UL << pin;
+	else
+		temp &= ~(1UL << pin);
+	ls_mm_wreg_locked(ldev, LS7A_DC_GPIO_OUT_OFFSET, temp);
+}
+
+static int ls_dc_gpio_request(struct gpio_chip *chip, unsigned int pin)
+{
+	if (pin >= (chip->ngpio + chip->base))
+		return -EINVAL;
+	else
+		return 0;
+}
+
+static int ls_dc_gpio_dir_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct loongson_device *ldev;
+
+	ldev = container_of(chip, struct loongson_device, chip);
+	__dc_gpio_set_dir(ldev, pin, 1);
+
+	return 0;
+}
+
+static int ls_dc_gpio_dir_output(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct loongson_device *ldev;
+
+	ldev = container_of(chip, struct loongson_device, chip);
+	__dc_gpio_set_val(ldev, pin, value);
+	__dc_gpio_set_dir(ldev, pin, 0);
+
+	return 0;
+}
+
+static void ls_dc_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct loongson_device *ldev;
+
+	ldev = container_of(chip, struct loongson_device, chip);
+	__dc_gpio_set_val(ldev, pin, value);
+}
+
+static int ls_dc_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	u32 val;
+	struct loongson_device *ldev;
+
+	ldev = container_of(chip, struct loongson_device, chip);
+	val = ls_mm_rreg_locked(ldev, LS7A_DC_GPIO_IN_OFFSET);
+	return (val >> pin) & 1;
+}
+
+static void loongson_i2c_set_data(void *i2c, int value)
+{
+	struct loongson_i2c *li2c = i2c;
+	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
+
+	gpiod_set_value_cansleep(gpiod, value);
+}
+
+static void loongson_i2c_set_clock(void *i2c, int value)
+{
+	struct loongson_i2c *li2c = i2c;
+	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
+
+	gpiod_set_value_cansleep(gpiod, value);
+}
+
+static int loongson_i2c_get_data(void *i2c)
+{
+	struct loongson_i2c *li2c = i2c;
+	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
+
+	return gpiod_get_value_cansleep(gpiod);
+}
+
+static int loongson_i2c_get_clock(void *i2c)
+{
+	struct loongson_i2c *li2c = i2c;
+	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
+
+	return gpiod_get_value_cansleep(gpiod);
+}
+
+static int loongson_i2c_create(struct loongson_i2c *li2c, const char *name)
+{
+	int ret;
+	unsigned int i2c_num;
+	struct i2c_client *i2c_cli;
+	struct i2c_adapter *i2c_adapter;
+	struct i2c_board_info i2c_info;
+	struct i2c_algo_bit_data *i2c_algo_data;
+	struct device *dev;
+
+	dev = &li2c->adapter->dev;
+	i2c_num = li2c->i2c_id;
+	i2c_adapter = kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
+	if (IS_ERR(i2c_adapter)) {
+		ret = PTR_ERR(i2c_adapter);
+		goto error_mem;
+	}
+	i2c_algo_data = kzalloc(sizeof(struct i2c_algo_bit_data), GFP_KERNEL);
+	if (IS_ERR(i2c_algo_data)) {
+		ret = PTR_ERR(i2c_algo_data);
+		goto error_mem;
+	}
+
+	i2c_adapter->owner = THIS_MODULE;
+	i2c_adapter->class = I2C_CLASS_DDC;
+	i2c_adapter->algo_data = i2c_algo_data;
+	i2c_adapter->nr = i2c_num;
+	snprintf(i2c_adapter->name, sizeof(i2c_adapter->name), "%s%d", name, i2c_num - DC_I2C_BASE);
+	li2c->data = i2c_num % DC_I2C_BASE * 2;
+	li2c->clock = i2c_num % DC_I2C_BASE * 2 + 1;
+	DRM_INFO("Created i2c-%d, sda=%d, scl=%d\n", i2c_num, li2c->data, li2c->clock);
+	if (gpio_cansleep(i2c_gpios[li2c->data].gpio) || gpio_cansleep(i2c_gpios[li2c->clock].gpio))
+		dev_warn(dev, "Slow GPIO pins might wreak havoc I2C timing\n");
+	i2c_algo_data->setsda = loongson_i2c_set_data;
+	i2c_algo_data->setscl = loongson_i2c_set_clock;
+	i2c_algo_data->getsda = loongson_i2c_get_data;
+	i2c_algo_data->getscl = loongson_i2c_get_clock;
+	i2c_algo_data->udelay = DC_I2C_TON;
+	i2c_algo_data->timeout = usecs_to_jiffies(2200); /* from VESA */
+	ret = i2c_bit_add_numbered_bus(i2c_adapter);
+	if (ret) {
+		DRM_ERROR("Failed to register i2c algo-bit adapter %s\n", i2c_adapter->name);
+		kfree(i2c_adapter);
+		i2c_adapter = NULL;
+	}
+
+	li2c->adapter = i2c_adapter;
+	i2c_algo_data->data = li2c;
+	i2c_set_adapdata(li2c->adapter, li2c);
+	DRM_INFO("Register i2c algo-bit adapter [%s]\n", i2c_adapter->name);
+
+	memset(&i2c_info, 0, sizeof(struct i2c_board_info));
+	strncpy(i2c_info.type, name, I2C_NAME_SIZE);
+	i2c_info.addr = DDC_ADDR;
+	i2c_cli = i2c_new_client_device(i2c_adapter, &i2c_info);
+	if (i2c_cli == NULL) {
+		DRM_ERROR("Failed to create i2c adapter\n");
+		return -EBUSY;
+	}
+	li2c->init = true;
+	return 0;
+
+error_mem:
+	DRM_ERROR("Failed to malloc memory for loongson i2c\n");
+	return ret;
+}
+
+static int loongson_i2c_add(struct loongson_device *ldev, const char *name)
+{
+	int i;
+
+	for (i = 0; i < LS_MAX_I2C_BUS; i++) {
+		if (ldev->i2c_bus[i].use) {
+			loongson_i2c_create(&ldev->i2c_bus[i], name);
+		} else {
+			DRM_DEBUG_DRIVER("i2c_bus[%d] not use\n", i);
+			return -ENODEV;
+		}
+	}
+	return 0;
+}
+
+int loongson_dc_gpio_init(struct loongson_device *ldev)
+{
+	int ret;
+	struct gpio_chip *chip;
+
+	chip = &ldev->chip;
+	chip->label = "ls7a-dc-gpio";
+	chip->base = LS7A_DC_GPIO_BASE;
+	chip->ngpio = 4;
+	chip->parent = ldev->dev->dev;
+	chip->request = ls_dc_gpio_request;
+	chip->direction_input = ls_dc_gpio_dir_input;
+	chip->direction_output = ls_dc_gpio_dir_output;
+	chip->set = ls_dc_gpio_set;
+	chip->get = ls_dc_gpio_get;
+	chip->can_sleep = false;
+
+	ret = devm_gpiochip_add_data(ldev->dev->dev, chip, ldev);
+	if (ret) {
+		DRM_ERROR("Failed to register ls7a dc gpio driver\n");
+		return -ENODEV;
+	}
+	DRM_INFO("Registered ls7a dc gpio driver\n");
+
+	return 0;
+}
+
+int loongson_i2c_init(struct loongson_device *ldev)
+{
+	int ret;
+
+	ret = gpio_request_array(i2c_gpios, ARRAY_SIZE(i2c_gpios));
+	if (ret) {
+		DRM_ERROR("Failed to request gpio array i2c_gpios\n");
+		return -ENODEV;
+	}
+
+	ldev->i2c_bus[0].i2c_id = 6;
+	ldev->i2c_bus[0].use = true;
+	ldev->i2c_bus[1].i2c_id = 7;
+	ldev->i2c_bus[1].use = true;
+
+	loongson_i2c_add(ldev, DC_I2C_NAME);
+
+	return 0;
+}
+
+struct loongson_i2c *loongson_i2c_bus_match(struct loongson_device *ldev, u32 i2c_id)
+{
+	u32 i;
+	struct loongson_i2c *match = NULL, *tables;
+
+	tables = ldev->i2c_bus;
+
+	for (i = 0; i < LS_MAX_I2C_BUS; i++) {
+		if (tables->i2c_id == i2c_id && tables->init == true) {
+			match = tables;
+			break;
+		}
+
+		tables++;
+	}
+
+	return match;
+}
diff --git a/drivers/gpu/drm/loongson/loongson_i2c.h b/drivers/gpu/drm/loongson/loongson_i2c.h
new file mode 100644
index 000000000000..164619007c0a
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loongson_i2c.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __LOONGSON_I2C_H__
+#define __LOONGSON_I2C_H__
+
+#include <linux/i2c.h>
+#include <linux/i2c-algo-bit.h>
+#include <linux/gpio/driver.h>
+#include <drm/drm_edid.h>
+
+// Modify this marco to config i2c bus speed, bus_freq = 500 / T
+// Eg: i2c_bus_freq=100k when T=5
+#define DC_I2C_TON 5
+#define DC_I2C_BASE 6
+#define DC_I2C_NAME "ls_dc_i2c"
+#define LS_MAX_I2C_BUS 16
+
+/* Loongson 7A display controller proprietary GPIOs */
+#define LS7A_DC_GPIO_BASE 73
+#define DC_GPIO_0 (73)
+#define DC_GPIO_1 (74)
+#define DC_GPIO_2 (75)
+#define DC_GPIO_3 (76)
+#define LS7A_DC_GPIO_CFG_OFFSET (0x1660)
+#define LS7A_DC_GPIO_IN_OFFSET (0x1650)
+#define LS7A_DC_GPIO_OUT_OFFSET (0x1650)
+
+struct loongson_device;
+struct loongson_i2c {
+	struct i2c_adapter *adapter;
+	u32 data, clock;
+	bool use, init;
+	u32 i2c_id;
+};
+
+struct loongson_i2c *loongson_i2c_bus_match(struct loongson_device *ldev,
+					    u32 i2c_id);
+int loongson_i2c_init(struct loongson_device *ldev);
+
+#endif /* __LOONGSON_I2C_H__ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
