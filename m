Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53884A3E9A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 09:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD8810F406;
	Mon, 31 Jan 2022 08:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD7E10F406
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643617779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pfru3jbg5YUWBQ5mUUl+XPX/uciNCifxxGQ4v4m2z8M=;
 b=Xh/wbX33D5uKtkNzE+MtqYK8b0uabcwKC0j+9QDEgJoheuNl7SmQ3MljjWwMlbtFBYQcY7
 fGRpZnLudpX1lHCxPJKQyfXgS7lUVEohg+NrSb+ucLRTauFQiihDcTxIgaZqbvQPxaeykp
 N4+RrkvJ6aSIG/y1U9u1ISvnq776QhQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-GAfBI-irP5quHRuQjPkkzQ-1; Mon, 31 Jan 2022 03:29:38 -0500
X-MC-Unique: GAfBI-irP5quHRuQjPkkzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so5538475wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Pfru3jbg5YUWBQ5mUUl+XPX/uciNCifxxGQ4v4m2z8M=;
 b=jQPUlklTw93BoaihWZQdolln1QOKiGRkQJKYGEU87PN4+4iTukNTTPWFniPdvaKZvf
 Z8iLrdjoaoqHECMAWlXBKvQmhlt6W+pptSSYVqZOqLJzpUTOGaM5wyzFy5/sWkFszJYm
 R/t//lV7ai/Q0hDujeGaqxsSnoPTA8Hb46pnWV0JRsNP/J/r/x2DIm511DUAcHMOyi9J
 xVWoMZlDrC1m+4okAimGDgTy9/uyrnIWCXbzSPwQJRq9ShHGJKMLCL3F4ri/bUM1Z0g+
 gQM/0frwF3x4Jafzapo73bGZ1d9Mg82ECJb3BgXp9yf0ygCuuvZn+nMskwHGpTVglou7
 OEuQ==
X-Gm-Message-State: AOAM533aCZYpl9qGXyabiBTGxoXOiJKI1TNq7wbTAVGkuWP4Wzwr4Nmw
 p8aCzua9gmOoj5KmcxfJVIsrIzqR2GIxt18dhi7ogP5VOkFfRFIgTI3aB277tK9O+qV2iOuBOx1
 1eFokFVyEIBQRCEoXrqShcOojwQmw
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr15752205wrb.475.1643617775875; 
 Mon, 31 Jan 2022 00:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfalhxG5ntwbRGE45dg3Hd9PfJW2GtMQroDeWeivD1qU3p7kOkQOxfFT3jrLSDzcQxtvJ1Cw==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr15752180wrb.475.1643617775545; 
 Mon, 31 Jan 2022 00:29:35 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f5sm5009103wry.64.2022.01.31.00.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:29:35 -0800 (PST)
Message-ID: <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
Date: Mon, 31 Jan 2022 09:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
In-Reply-To: <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 15:15, Javier Martinez Canillas wrote:
> On 1/26/22 15:10, Andy Shevchenko wrote:
>> On Wed, Jan 26, 2022 at 04:08:32PM +0200, Andy Shevchenko wrote:
>>> On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
>>>> On 1/26/22 14:12, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
>>>> driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.
>>>
>>> You should take ssd1307fb.c instead. And basically create a MIPI based driver
>>> for I2C. Then we won't go same road again for other similar devices.
>>
>> For the record it supports your device:
>>
>> static const struct i2c_device_id ssd1307fb_i2c_id[] = {
>> { "ssd1305fb", 0 },
>> { "ssd1306fb", 0 },
>> { "ssd1307fb", 0 },
>> { "ssd1309fb", 0 },
>>
>>
> 
> Thanks a lot for the pointer. I was only looking at drivers/staging
> and didn't check drivers/video. I'll try to convert that one then
> once I get the display.
> 

I got some time this weekend and was able to port the ssd1306 fbdev driver
to DRM [0]. I'm not that familiar with the simple display pipe helpers, so
there may be some wrong things there. But it does work and all the fbtests
from https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git pass.

There are some hacks in the driver though. For example it exposes an XRGB8888
format even thought the OLED display is monochromatic and has 1 bit per pixel.

The driver then goes and converts the XRGB8888 pixels first to grayscale and
then to reverse mono. I took that idea from the repaper driver but that gives
us the multiple copies that Geert was complaining about.

Another hack is that I am just hardcoding the {width, height}_mm, but I don't
know what DPI could be used for these panels nor how I could calculate the mm.

Best regards,
Javier

[0]:
From 5ec4b468b66022d4c48ae6bec8a68926a01a6785 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Sun, 30 Jan 2022 12:16:34 +0100
Subject: [RFC] drm/tiny: Add driver for Solomon SSD130X OLED displays

Add a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon OLED
controllers that can be programmed via an I2C interface. This is a port
of the ssd1307fb driver that already supports these devices.

A Device Tree binding is not added because the DRM driver is compatible
with the existing binding for the ssd1307fb driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 MAINTAINERS                    |   7 +
 drivers/gpu/drm/tiny/Kconfig   |  12 +
 drivers/gpu/drm/tiny/Makefile  |   1 +
 drivers/gpu/drm/tiny/ssd130x.c | 944 +++++++++++++++++++++++++++++++++
 4 files changed, 964 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ssd130x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..87334676ce07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6102,6 +6102,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
+DRM DRIVER FOR SOLOMON SSD130X DISPLAYS
+M:	Javier Martinez Canillas <javierm@redhat.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	drivers/gpu/drm/tiny/ssd130x.c
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 712e0004e96e..358ceb7354f5 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -157,6 +157,18 @@ config TINYDRM_REPAPER
 
 	  If M is selected the module will be called repaper.
 
+config TINYDRM_SSD130X
+	tristate "DRM support for Solomon SSD130X OLED displays"
+	depends on DRM && OF && I2C
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for the SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
+	  OLED controllers that can be programmed via an I2C interface.
+
+	  If M is selected the module will be called ssd130x.
+
 config TINYDRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 5d5505d40e7b..93a1d70155f0 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -12,5 +12,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
+obj-$(CONFIG_TINYDRM_SSD130X)		+= ssd130x.o
 obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
 obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/ssd130x.c b/drivers/gpu/drm/tiny/ssd130x.c
new file mode 100644
index 000000000000..88d88caeb37d
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ssd130x.c
@@ -0,0 +1,944 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD130X OLED displays
+ *
+ * Copyright 2022 Red Hat Inc.
+ *
+ * Based on drivers/video/fbdev/ssd1307fb.c
+ * Copyright 2012 Free Electrons
+ *
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/pwm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define DRIVER_NAME	"ssd130x"
+#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays"
+#define DRIVER_DATE	"20220130"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+#define SSD130X_DATA				0x40
+#define SSD130X_COMMAND				0x80
+
+#define SSD130X_SET_ADDRESS_MODE		0x20
+#define SSD130X_SET_ADDRESS_MODE_HORIZONTAL	(0x00)
+#define SSD130X_SET_ADDRESS_MODE_VERTICAL	(0x01)
+#define SSD130X_SET_ADDRESS_MODE_PAGE		(0x02)
+#define SSD130X_SET_COL_RANGE			0x21
+#define SSD130X_SET_PAGE_RANGE			0x22
+#define SSD130X_CONTRAST			0x81
+#define SSD130X_SET_LOOKUP_TABLE		0x91
+#define SSD130X_CHARGE_PUMP			0x8d
+#define SSD130X_SEG_REMAP_ON			0xa1
+#define SSD130X_DISPLAY_OFF			0xae
+#define SSD130X_SET_MULTIPLEX_RATIO		0xa8
+#define SSD130X_DISPLAY_ON			0xaf
+#define SSD130X_START_PAGE_ADDRESS		0xb0
+#define SSD130X_SET_DISPLAY_OFFSET		0xd3
+#define SSD130X_SET_CLOCK_FREQ			0xd5
+#define SSD130X_SET_AREA_COLOR_MODE		0xd8
+#define SSD130X_SET_PRECHARGE_PERIOD		0xd9
+#define SSD130X_SET_COM_PINS_CONFIG		0xda
+#define SSD130X_SET_VCOMH			0xdb
+
+#define MAX_CONTRAST 255
+
+struct ssd130x_deviceinfo {
+	u32 default_vcomh;
+	u32 default_dclk_div;
+	u32 default_dclk_frq;
+	int need_pwm;
+	int need_chargepump;
+};
+
+struct ssd130x_device {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct i2c_client *client;
+
+	const struct ssd130x_deviceinfo *device_info;
+
+	unsigned area_color_enable : 1;
+	unsigned com_invdir : 1;
+	unsigned com_lrremap : 1;
+	unsigned com_seq : 1;
+	unsigned lookup_table_set : 1;
+	unsigned low_power : 1;
+	unsigned seg_remap : 1;
+	u32 com_offset;
+	u32 contrast;
+	u32 dclk_div;
+	u32 dclk_frq;
+	u32 height;
+	u8 lookup_table[4];
+	u32 page_offset;
+	u32 col_offset;
+	u32 prechargep1;
+	u32 prechargep2;
+
+	struct backlight_device *bl_dev;
+	struct pwm_device *pwm;
+	struct gpio_desc *reset;
+	struct regulator *vbat_reg;
+	u32 vcomh;
+	u32 width;
+	/* Cached address ranges */
+	u8 col_start;
+	u8 col_end;
+	u8 page_start;
+	u8 page_end;
+};
+
+struct ssd130x_array {
+	u8	type;
+	u8	data[];
+};
+
+static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
+{
+	return container_of(drm, struct ssd130x_device, drm);
+}
+
+static struct ssd130x_array *ssd130x_alloc_array(u32 len, u8 type)
+{
+	struct ssd130x_array *array;
+
+	array = kzalloc(sizeof(struct ssd130x_array) + len, GFP_KERNEL);
+	if (!array)
+		return NULL;
+
+	array->type = type;
+
+	return array;
+}
+
+static int ssd130x_write_array(struct i2c_client *client,
+			       struct ssd130x_array *array, u32 len)
+{
+	int ret;
+
+	len += sizeof(struct ssd130x_array);
+
+	ret = i2c_master_send(client, (u8 *)array, len);
+	if (ret != len) {
+		dev_err(&client->dev, "Couldn't send I2C command.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static inline int ssd130x_write_cmd(struct i2c_client *client, u8 cmd)
+{
+	struct ssd130x_array *array;
+	int ret;
+
+	array = ssd130x_alloc_array(1, SSD130X_COMMAND);
+	if (!array)
+		return -ENOMEM;
+
+	array->data[0] = cmd;
+
+	ret = ssd130x_write_array(client, array, 1);
+	kfree(array);
+
+	return ret;
+}
+
+static int ssd130x_set_col_range(struct ssd130x_device *ssd130x,
+				 u8 col_start, u8 cols)
+{
+	u8 col_end = col_start + cols - 1;
+	int ret;
+
+	if (col_start == ssd130x->col_start && col_end == ssd130x->col_end)
+		return 0;
+
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_COL_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, col_start);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, col_end);
+	if (ret < 0)
+		return ret;
+
+	ssd130x->col_start = col_start;
+	ssd130x->col_end = col_end;
+	return 0;
+}
+
+static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
+				  u8 page_start, u8 pages)
+{
+	u8 page_end = page_start + pages - 1;
+	int ret;
+
+	if (page_start == ssd130x->page_start && page_end == ssd130x->page_end)
+		return 0;
+
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_PAGE_RANGE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, page_start);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, page_end);
+	if (ret < 0)
+		return ret;
+
+	ssd130x->page_start = page_start;
+	ssd130x->page_end = page_end;
+	return 0;
+}
+
+static int ssd130x_update_display(struct ssd130x_device *ssd130x, u8 *buf,
+				  u32 width, u32 height)
+{
+	struct ssd130x_array *array;
+	unsigned int line_length = DIV_ROUND_UP(width, 8);
+	unsigned int pages = DIV_ROUND_UP(height, 8);
+	u32 array_idx = 0;
+	int ret, i, j, k;
+
+	array = ssd130x_alloc_array(width * pages, SSD130X_DATA);
+	if (!array)
+		return -ENOMEM;
+
+	/*
+	 * The screen is divided in pages, each having a height of 8
+	 * pixels, and the width of the screen. When sending a byte of
+	 * data to the controller, it gives the 8 bits for the current
+	 * column. I.e, the first byte are the 8 bits of the first
+	 * column, then the 8 bits for the second column, etc.
+	 *
+	 *
+	 * Representation of the screen, assuming it is 5 bits
+	 * wide. Each letter-number combination is a bit that controls
+	 * one pixel.
+	 *
+	 * A0 A1 A2 A3 A4
+	 * B0 B1 B2 B3 B4
+	 * C0 C1 C2 C3 C4
+	 * D0 D1 D2 D3 D4
+	 * E0 E1 E2 E3 E4
+	 * F0 F1 F2 F3 F4
+	 * G0 G1 G2 G3 G4
+	 * H0 H1 H2 H3 H4
+	 *
+	 * If you want to update this screen, you need to send 5 bytes:
+	 *  (1) A0 B0 C0 D0 E0 F0 G0 H0
+	 *  (2) A1 B1 C1 D1 E1 F1 G1 H1
+	 *  (3) A2 B2 C2 D2 E2 F2 G2 H2
+	 *  (4) A3 B3 C3 D3 E3 F3 G3 H3
+	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
+	 */
+
+	ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset, width);
+	if (ret < 0)
+		goto out_free;
+
+	ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset / 8, pages);
+	if (ret < 0)
+		goto out_free;
+
+	for (i = 0; i < pages; i++) {
+		int m = 8;
+
+		/* Last page may be partial */
+		if (8 * (i + 1) > ssd130x->height)
+			m = ssd130x->height % 8;
+		for (j = 0; j < width; j++) {
+			u8 data = 0;
+
+			for (k = 0; k < m; k++) {
+				u8 byte = buf[(8 * i + k) * line_length +
+					       j / 8];
+				u8 bit = (byte >> (j % 8)) & 1;
+
+				data |= bit << k;
+			}
+			array->data[array_idx++] = data;
+		}
+	}
+
+	ret = ssd130x_write_array(ssd130x->client, array, width * pages);
+
+out_free:
+	kfree(array);
+	return ret;
+}
+
+static void ssd130x_gray8_to_mono_reversed(u8 *buf, u32 width, u32 height)
+{
+	u8 *gray8 = buf, *mono = buf;
+	int y, xb, i;
+
+	for (y = 0; y < height; y++)
+		for (xb = 0; xb < width / 8; xb++) {
+			u8 byte = 0x00;
+
+			for (i = 0; i < 8; i++) {
+				int x = xb * 8 + i;
+
+				byte >>= 1;
+				if (gray8[y * width + x] >> 7)
+					byte |= BIT(7);
+			}
+			*mono++ = byte;
+		}
+}
+
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+				struct drm_rect *rect)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	int idx, ret = 0;
+	u8 *buf = NULL;
+
+	if (!drm_dev_enter(fb->dev, &idx))
+		return -ENODEV;
+
+	buf = kmalloc_array(fb->width, fb->height, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out_exit;
+	}
+
+	drm_fb_xrgb8888_to_gray8(buf, 0, vmap, fb, rect);
+
+	ssd130x_gray8_to_mono_reversed(buf, fb->width, fb->height);
+
+	ssd130x_update_display(ssd130x, buf, fb->width, fb->height);
+
+	kfree(buf);
+out_exit:
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static void ssd130x_display_pipe_enable(struct drm_simple_display_pipe *pipe,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_plane_state *plane_state)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	int idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	backlight_enable(ssd130x->bl_dev);
+
+	ssd130x_write_cmd(ssd130x->client, SSD130X_DISPLAY_ON);
+}
+
+static void ssd130x_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+
+	ssd130x_write_cmd(ssd130x->client, SSD130X_DISPLAY_OFF);
+
+	backlight_disable(ssd130x->bl_dev);
+}
+
+static void ssd130x_display_pipe_update(struct drm_simple_display_pipe *pipe,
+					struct drm_plane_state *old_plane_state)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_rect rect;
+
+	if (!pipe->crtc.state->active)
+		return;
+
+	if (drm_atomic_helper_damage_merged(old_plane_state, state, &rect))
+		ssd130x_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
+}
+
+static const struct drm_simple_display_pipe_funcs ssd130x_pipe_funcs = {
+	.enable = ssd130x_display_pipe_enable,
+	.disable = ssd130x_display_pipe_disable,
+	.update = ssd130x_display_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static int ssd130x_connector_get_modes(struct drm_connector *connector)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
+	if (!mode) {
+		DRM_ERROR("Failed to duplicate mode\n");
+		return 0;
+	}
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bpc = 32;
+
+	drm_mode_set_name(mode);
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {
+	.get_modes = ssd130x_connector_get_modes,
+};
+
+static const struct drm_connector_funcs ssd130x_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t ssd130x_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+DEFINE_DRM_GEM_FOPS(ssd130x_fops);
+
+static const struct drm_driver ssd130x_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &ssd130x_fops,
+};
+
+static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
+{
+	struct pwm_state pwmstate;
+
+	ssd130x->pwm = pwm_get(&ssd130x->client->dev, NULL);
+	if (IS_ERR(ssd130x->pwm)) {
+		dev_err(&ssd130x->client->dev, "Could not get PWM from device tree!\n");
+		return PTR_ERR(ssd130x->pwm);
+	}
+
+	pwm_init_state(ssd130x->pwm, &pwmstate);
+	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
+	pwm_apply_state(ssd130x->pwm, &pwmstate);
+
+	/* Enable the PWM */
+	pwm_enable(ssd130x->pwm);
+
+	dev_dbg(&ssd130x->client->dev, "Using PWM%d with a %lluns period.\n",
+		ssd130x->pwm->pwm, pwm_get_period(ssd130x->pwm));
+
+	return 0;
+}
+
+static int ssd130x_init(struct ssd130x_device *ssd130x)
+{
+	u32 precharge, dclk, com_invdir, compins;
+	int ret;
+
+	/* Set initial contrast */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_CONTRAST);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, ssd130x->contrast);
+	if (ret < 0)
+		return ret;
+
+	/* Set segment re-map */
+	if (ssd130x->seg_remap) {
+		ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SEG_REMAP_ON);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set COM direction */
+	com_invdir = 0xc0 | ssd130x->com_invdir << 3;
+	ret = ssd130x_write_cmd(ssd130x->client,  com_invdir);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_MULTIPLEX_RATIO);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* set display offset value */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_DISPLAY_OFFSET);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, ssd130x->com_offset);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock frequency */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_CLOCK_FREQ);
+	if (ret < 0)
+		return ret;
+
+	dclk = ((ssd130x->dclk_div - 1) & 0xf) | (ssd130x->dclk_frq & 0xf) << 4;
+	ret = ssd130x_write_cmd(ssd130x->client, dclk);
+	if (ret < 0)
+		return ret;
+
+	/* Set Area Color Mode ON/OFF & Low Power Display Mode */
+	if (ssd130x->area_color_enable || ssd130x->low_power) {
+		u32 mode;
+
+		ret = ssd130x_write_cmd(ssd130x->client,
+					SSD130X_SET_AREA_COLOR_MODE);
+		if (ret < 0)
+			return ret;
+
+		mode = (ssd130x->area_color_enable ? 0x30 : 0) |
+			(ssd130x->low_power ? 5 : 0);
+		ret = ssd130x_write_cmd(ssd130x->client, mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set precharge period in number of ticks from the internal clock */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_PRECHARGE_PERIOD);
+	if (ret < 0)
+		return ret;
+
+	precharge = (ssd130x->prechargep1 & 0xf) | (ssd130x->prechargep2 & 0xf) << 4;
+	ret = ssd130x_write_cmd(ssd130x->client, precharge);
+	if (ret < 0)
+		return ret;
+
+	/* Set COM pins configuration */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_COM_PINS_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	compins = 0x02 | !ssd130x->com_seq << 4 | ssd130x->com_lrremap << 5;
+	ret = ssd130x_write_cmd(ssd130x->client, compins);
+	if (ret < 0)
+		return ret;
+
+	/* Set VCOMH */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_VCOMH);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, ssd130x->vcomh);
+	if (ret < 0)
+		return ret;
+
+	/* Turn on the DC-DC Charge Pump */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_CHARGE_PUMP);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client,
+		BIT(4) | (ssd130x->device_info->need_chargepump ? BIT(2) : 0));
+	if (ret < 0)
+		return ret;
+
+	/* Set lookup table */
+	if (ssd130x->lookup_table_set) {
+		int i;
+
+		ret = ssd130x_write_cmd(ssd130x->client,
+					SSD130X_SET_LOOKUP_TABLE);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(ssd130x->lookup_table); ++i) {
+			u8 val = ssd130x->lookup_table[i];
+
+			if (val < 31 || val > 63)
+				dev_warn(&ssd130x->client->dev,
+					 "lookup table index %d value out of range 31 <= %d <= 63\n",
+					 i, val);
+			ret = ssd130x_write_cmd(ssd130x->client, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	/* Switch to horizontal addressing mode */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_SET_ADDRESS_MODE);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client,
+				SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
+	if (ret < 0)
+		return ret;
+
+	/* Turn on the display */
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_DISPLAY_ON);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ssd130x_update_bl(struct backlight_device *bdev)
+{
+	struct ssd130x_device *ssd130x = bl_get_data(bdev);
+	int brightness = bdev->props.brightness;
+	int ret;
+
+	ssd130x->contrast = brightness;
+
+	ret = ssd130x_write_cmd(ssd130x->client, SSD130X_CONTRAST);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x->client, ssd130x->contrast);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ssd130x_get_brightness(struct backlight_device *bdev)
+{
+	struct ssd130x_device *ssd130x = bl_get_data(bdev);
+
+	return ssd130x->contrast;
+}
+
+static const struct backlight_ops ssd130xfb_bl_ops = {
+	.update_status	= ssd130x_update_bl,
+	.get_brightness	= ssd130x_get_brightness,
+};
+
+static void ssd130x_reset(struct ssd130x_device *ssd130x)
+{
+	/* Reset the screen */
+	gpiod_set_value_cansleep(ssd130x->reset, 1);
+	udelay(4);
+	gpiod_set_value_cansleep(ssd130x->reset, 0);
+	udelay(4);
+}
+
+static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
+{
+	struct device *dev = &ssd130x->client->dev;
+
+	if (device_property_read_u32(dev, "solomon,width", &ssd130x->width))
+		ssd130x->width = 96;
+
+	if (device_property_read_u32(dev, "solomon,height", &ssd130x->height))
+		ssd130x->height = 16;
+
+	if (device_property_read_u32(dev, "solomon,page-offset", &ssd130x->page_offset))
+		ssd130x->page_offset = 1;
+
+	if (device_property_read_u32(dev, "solomon,col-offset", &ssd130x->col_offset))
+		ssd130x->col_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,com-offset", &ssd130x->com_offset))
+		ssd130x->com_offset = 0;
+
+	if (device_property_read_u32(dev, "solomon,prechargep1", &ssd130x->prechargep1))
+		ssd130x->prechargep1 = 2;
+
+	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd130x->prechargep2))
+		ssd130x->prechargep2 = 2;
+
+	if (!device_property_read_u8_array(dev, "solomon,lookup-table",
+					   ssd130x->lookup_table,
+					   ARRAY_SIZE(ssd130x->lookup_table)))
+		ssd130x->lookup_table_set = 1;
+
+	ssd130x->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
+	ssd130x->com_seq = device_property_read_bool(dev, "solomon,com-seq");
+	ssd130x->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
+	ssd130x->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
+	ssd130x->area_color_enable =
+		device_property_read_bool(dev, "solomon,area-color-enable");
+	ssd130x->low_power = device_property_read_bool(dev, "solomon,low-power");
+
+	ssd130x->contrast = 127;
+	ssd130x->vcomh = ssd130x->device_info->default_vcomh;
+
+	/* Setup display timing */
+	if (device_property_read_u32(dev, "solomon,dclk-div", &ssd130x->dclk_div))
+		ssd130x->dclk_div = ssd130x->device_info->default_dclk_div;
+	if (device_property_read_u32(dev, "solomon,dclk-frq", &ssd130x->dclk_frq))
+		ssd130x->dclk_frq = ssd130x->device_info->default_dclk_frq;
+}
+
+static void ssd130x_set_mode(struct ssd130x_device *ssd130x)
+{
+	struct drm_display_mode *mode = &ssd130x->mode;
+	struct drm_device *drm = &ssd130x->drm;
+
+	mode->type = DRM_MODE_TYPE_DRIVER;
+	mode->clock = 1;
+	mode->hdisplay = mode->htotal = ssd130x->width;
+	mode->hsync_start = mode->hsync_end = ssd130x->width;
+	mode->vdisplay = mode->vtotal = ssd130x->height;
+	mode->vsync_start = mode->vsync_end = ssd130x->height;
+	mode->width_mm = 27;
+	mode->height_mm = 27;
+
+	drm->mode_config.min_width = ssd130x->width;
+	drm->mode_config.max_width = ssd130x->width;
+	drm->mode_config.min_height = ssd130x->height;
+	drm->mode_config.max_height = ssd130x->height;
+	drm->mode_config.preferred_depth = 32;
+	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
+}
+
+static int ssd130x_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ssd130x_device *ssd130x;
+	struct backlight_device *bl;
+	struct drm_device *drm;
+	char bl_name[12];
+	int ret;
+
+	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
+				 struct ssd130x_device, drm);
+	if (IS_ERR(ssd130x))
+		return PTR_ERR(ssd130x);
+
+	drm = &ssd130x->drm;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	ssd130x->client = client;
+
+	ssd130x->device_info = device_get_match_data(dev);
+
+	ssd130x_parse_properties(ssd130x);
+
+	ssd130x_set_mode(ssd130x);
+
+	ssd130x->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ssd130x->reset)) {
+		dev_err(dev, "failed to get reset gpio: %ld\n",
+			PTR_ERR(ssd130x->reset));
+		return PTR_ERR(ssd130x->reset);
+	}
+
+	ssd130x->vbat_reg = devm_regulator_get_optional(dev, "vbat");
+	if (IS_ERR(ssd130x->vbat_reg)) {
+		ret = PTR_ERR(ssd130x->vbat_reg);
+		if (ret == -ENODEV) {
+			ssd130x->vbat_reg = NULL;
+		} else {
+			dev_err(dev, "failed to get VBAT regulator: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drm_connector_helper_add(&ssd130x->connector, &ssd130x_connector_helper_funcs);
+	ret = drm_connector_init(drm, &ssd130x->connector, &ssd130x_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, ssd130x);
+
+	if (ssd130x->reset)
+		ssd130x_reset(ssd130x);
+
+	if (ssd130x->vbat_reg) {
+		ret = regulator_enable(ssd130x->vbat_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VBAT: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = ssd130x_init(ssd130x);
+	if (ret)
+		goto regulator_disable;
+
+	if (ssd130x->device_info->need_pwm) {
+		ret = ssd130x_pwm_enable(ssd130x);
+		if (ret)
+			goto regulator_disable;
+	}
+
+	snprintf(bl_name, sizeof(bl_name), "ssd130x%d", drm->primary->index);
+	bl = backlight_device_register(bl_name, dev, ssd130x, &ssd130xfb_bl_ops,
+				       NULL);
+	if (IS_ERR(bl)) {
+		ret = PTR_ERR(bl);
+		dev_err(dev, "unable to register backlight device: %d\n", ret);
+		goto pwm_disable;
+	}
+
+	bl->props.brightness = ssd130x->contrast;
+	bl->props.max_brightness = MAX_CONTRAST;
+	ssd130x->bl_dev = bl;
+
+	ret = drm_simple_display_pipe_init(drm, &ssd130x->pipe, &ssd130x_pipe_funcs,
+					   ssd130x_formats, ARRAY_SIZE(ssd130x_formats),
+					   NULL, &ssd130x->connector);
+	if (ret)
+		goto pwm_disable;
+
+	drm_plane_enable_fb_damage_clips(&ssd130x->pipe.plane);
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		goto backlight_unregister;
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+
+backlight_unregister:
+	backlight_device_unregister(ssd130x->bl_dev);
+pwm_disable:
+	if (ssd130x->device_info->need_pwm) {
+		pwm_disable(ssd130x->pwm);
+		pwm_put(ssd130x->pwm);
+	}
+regulator_disable:
+	if (ssd130x->vbat_reg)
+		regulator_disable(ssd130x->vbat_reg);
+	return ret;
+}
+
+static int ssd130x_remove(struct i2c_client *client)
+{
+	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+
+	drm_dev_unplug(&ssd130x->drm);
+
+	ssd130x_write_cmd(ssd130x->client, SSD130X_DISPLAY_OFF);
+
+	backlight_device_unregister(ssd130x->bl_dev);
+
+	if (ssd130x->device_info->need_pwm) {
+		pwm_disable(ssd130x->pwm);
+		pwm_put(ssd130x->pwm);
+	}
+	if (ssd130x->vbat_reg)
+		regulator_disable(ssd130x->vbat_reg);
+
+	return 0;
+}
+
+static void ssd130x_shutdown(struct i2c_client *client)
+{
+	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+
+	drm_atomic_helper_shutdown(&ssd130x->drm);
+}
+
+static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 7,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 8,
+	.need_chargepump = 1,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 2,
+	.default_dclk_frq = 12,
+	.need_pwm = 1,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 10,
+};
+
+static const struct of_device_id ssd130x_of_match[] = {
+	{
+		.compatible = "solomon,ssd1305fb-i2c",
+		.data = (void *)&ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306fb-i2c",
+		.data = (void *)&ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307fb-i2c",
+		.data = (void *)&ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309fb-i2c",
+		.data = (void *)&ssd130x_ssd1309_deviceinfo,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+
+
+static struct i2c_driver ssd130x_i2c_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = ssd130x_of_match,
+	},
+	.probe_new = ssd130x_probe,
+	.remove = ssd130x_remove,
+	.shutdown = ssd130x_shutdown,
+};
+
+module_i2c_driver(ssd130x_i2c_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

