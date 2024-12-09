Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D29E8FB4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6533110E6B6;
	Mon,  9 Dec 2024 10:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kDy1Psai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB4F10E6B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:08:01 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-725ee27e905so737712b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733738881; x=1734343681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
 b=kDy1Psaiqp6o6HldxmL1heXf8TUhvZYxvgO8/k1V6D/VUo+W0DGNLYI+oQRlROGZ0l
 kNAY8N702QFlkJBaZm3+124vktRvEiUjIXEZ0gf2AOBHOTnOuOyDHXELefL27XQjG0Cq
 Ml26UvpfIeNdX7h8lirAwqzlVfMTPZifFIPKxky11kt9qjckrHjL0Vb3vROQ/B6MhGFz
 RkA1B06CCRWX2mQ8pjB/h5ON3/WPiZwA3jpvOZj2SXP9MDAZUL5fzflbAd5FDTl/UOaR
 nhONBm+S9O/5km7Dd2eNy9d0SnYXzRJajDbAPsYGlfqorrAMWOn2CSXzgLBwBVLskzxT
 AytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733738881; x=1734343681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
 b=Oqt51zhfHRIoiR/F66bn3JLFrenmiplPXPDOvGtIFzqJii6TIOhbETzYvi5jv+rQ0g
 NSASZ8qWMcVLWR+HKiZ5GUbiRcwXeXOlqCjP+h/mjvfn76Y7UCTOhvCzzkXXz3jvQvfX
 10Nlmy5ZyHMTzYwTHDlTMchZKqU0uMBGLAMRTaLJCY4cqXQFx5O7HnyUBZ5mQ6JHWm4f
 6+1Syg9/gMV+nv0U79pFrzpcoRMv7iBRk+BCtpX/tFV+/7Smt4ZSfbtJ/QeCBCOh51+O
 J2Qz9sG6ZgVX0le0zFlX+3ufjVRcD3rxerAxH/fQcBfYSm0/xjKJssyIE2XYRfiOhjBj
 +mcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTtPd+qZydqBy+fszwyp2qtj5XsqHAYgTX8pWR9xFJ4B2vRqUtq3JFpyXZgkVpeqdBGqBS65HuLYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+fE8/+jzd5nc2ka859sNBw8x8CPSxqgoHmcTlek9hpDRr4cO4
 5gG1y4YtDQFEBwQ3mLbH401R/2+ny4sUGb6d4tL/KdSOqrXiFuCF
X-Gm-Gg: ASbGnctFXSOvd/14MrSedxurNjfqYOo52aQRG3A4PfxrequavYHKYcPbaokqp4FqHyf
 VqTounXMg6dkLSId733ZERB9rGN/U3IYTutzfuUP4H8ScTaDqJkjfyrktN3ktSAQi9/oZ/QVtZa
 qJ1MQbq3VVJgqi2TD2l+AHDWH7LQ95D6t9R9gsWFVYQctUuaTOPs2+Nl6Vo4nO3Z8mCCHHfOTVy
 lU1GyUZXKLd+P0legZZ9ndg0uTBrcNZcn28LUIcn9/OQT0EHhV8Dt39nw4pGH/ZB6jv
X-Google-Smtp-Source: AGHT+IE2AAunC8wmSSoVHJwvOzFoZYPvX4c5A5ejLO9bR6TnjihE9dezvHIlPn7G9UQ6/5A3kkQW9g==
X-Received: by 2002:a05:6a00:a8c:b0:725:24c2:b794 with SMTP id
 d2e1a72fcca58-725b8188090mr18378334b3a.23.1733738881124; 
 Mon, 09 Dec 2024 02:08:01 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725d9b98eb2sm3567122b3a.148.2024.12.09.02.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 02:08:00 -0800 (PST)
Message-ID: <551941de-b9a4-4353-8bb2-0bfc3304ef87@gmail.com>
Date: Mon, 9 Dec 2024 18:07:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
> On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>>  3 files changed, 137 insertions(+)
>>  create mode 100644 drivers/video/backlight/dwi_bl.c
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index 3614a5d29c71..e64cc3d51ac5 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called ep93xx_bl.
>>  
>> +config BACKLIGHT_APPLE_DWI
>> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	default y
>> +	help
>> +          Say Y to enable the backlight driver for backlight controllers
>> +          attached via the Apple DWI 2-wire interface which is found in some
>> +          Apple iPhones, iPads and iPod touches.
> 
> Mixed/messed indentation. Some spaces?
Ack. Will be fixed for v4.

> 
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dwi_bl.
>> +
>>  config BACKLIGHT_IPAQ_MICRO
>>  	tristate "iPAQ microcontroller backlight driver"
>>  	depends on MFD_IPAQ_MICRO
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 8fc98f760a8a..0a569d7f0210 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
> 
> Please do not introduce other sorting way - it is sorted by config name.
> Which will also point you to apple_bl.o and need of explaining the
> differences, e.g. why this cannot be one driver.

apple_bl is a driver backlight controllers on a PCI bus on Intel Macs,
which is
completely different from the Samsung-derived DWI block this driver
deals with.
This will be explained in the commit message for v4.

> 
> 
>>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/backlight.h>
>> +
>> +#define DWI_BL_CTL			0x0
>> +#define DWI_BL_CTL_SEND1		BIT(0)
>> +#define DWI_BL_CTL_SEND2		BIT(4)
>> +#define DWI_BL_CTL_SEND3		BIT(5)
>> +#define DWI_BL_CTL_LE_DATA		BIT(6)
>> +/* Only used on Apple A9 and later */
>> +#define DWI_BL_CTL_SEND4		BIT(12)
>> +
>> +#define DWI_BL_CMD			0x4
>> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
>> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
>> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
>> +
>> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
>> +					 DWI_BL_CTL_SEND2 | \
>> +					 DWI_BL_CTL_SEND3 | \
>> +					 DWI_BL_CTL_LE_DATA | \
>> +					 DWI_BL_CTL_SEND4)
>> +
>> +#define DWI_BL_MAX_BRIGHTNESS		2047
>> +
>> +struct apple_dwi_bl {
>> +	void __iomem *base;
>> +};
>> +
>> +static int dwi_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	int brightness = backlight_get_brightness(bl);
>> +
>> +	u32 cmd = 0;
>> +
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
>> +
>> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
>> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwi_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
>> +
>> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
>> +}
>> +
>> +static const struct backlight_ops dwi_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.get_brightness = dwi_bl_get_brightness,
>> +	.update_status	= dwi_bl_update_status
>> +};
>> +
>> +static int dwi_bl_probe(struct platform_device *dev)
>> +{
>> +	struct apple_dwi_bl *dwi_bl;
>> +	struct backlight_device *bl;
>> +	struct backlight_properties props;
>> +	struct resource *res;
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)
> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENXIO;
>> +
>> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
> 
> Use helper for these two, devm_platform_get_and_ioremap_resource() or
> similar.
Ack. Will be fixed for v4.

> 
> Best regards,
> Krzysztof
> 

Nick Chan
