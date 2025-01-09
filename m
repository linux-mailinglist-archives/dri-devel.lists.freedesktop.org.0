Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962BA07C95
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11EF10EEBD;
	Thu,  9 Jan 2025 15:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FyUCXw+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022C10EEBD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:54:02 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21619108a6bso18019815ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736437982; x=1737042782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
 b=FyUCXw+/8kfxcwsxwpR54Rkl9qpgqlCgQToDF7me2ut+YBPoTl8fp3TYq+Uy7EpX1s
 S393r53Z3OUqgnTzM/HwqKCaPjcmLeXHsg3CWwIb2qofRZEtfG94eq2kibE2C8BpFx0q
 Ogz1YGjeZbXrAXL6djbUlGWPywiFDOKc/HI7AVpK/mFi3oRVu0EwnWvwgpSrJXL57Ui9
 mriRxbSGNJ0EU6lj+JAYrBI6dd2RBWz/COENEBuVzIfwatd8OqOhJ0g0ipeY61rg4FsS
 J9Q7eiLfdwU6SZgNh6VXbyThcDFLQaCFg7n9HyMqE+oC8MZNDmW2Zx3guJo4+H/TGKLD
 nCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437982; x=1737042782;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
 b=rnzBCfq3nEb9GOv0as+frSumwwue7YCJfn6B0FxR176kw2kFpchm3EihRgSG35lEPy
 j+KStp9rYaWh8zioezj8bcDdiXvCN+/mavDBCoXwrVxBhQEKUmOh5XJnAzWb3k0y2AKc
 0JI9LWvJffVN1xMijI8wc/++WoD7QNFl6aiOk0U49kRU90EXP8uDvLExkG2B7uAuZQtZ
 5h2S99uOpSf8Kf2qTsr2O4wwSYlOTvSRkafGMT+P5yy0ZvbO3MCGZHbtQChy0+dZKwr7
 fj++ZD/QRVPnnzk4whWDQWoq3LpU3x9X3EFTpJ/eoX2ye5umeYL7zolaESBC3xh9x2v8
 NUeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT1Zk1TGkjD6svXe+SNm3FcgcK3utnNnvylk5qlIOiPYy+H0RD8AdMDNnepesFHFHi7H921rXLHXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZhJ1RXOLaDMlvKLlVlZNW2aYS0E7kR0Nwli+I7GeyPyeFJgoy
 I2aBMMI991T2Cqq70VXZt4NIvHTq99KYuYS1rBPoQWf+LwVS7cmh
X-Gm-Gg: ASbGncvAb+x32OOFbGYg470MiKm2TgDNwJM8kj7HdQPoi3KL/z1ZVHlj9hxdVfY0f//
 WdIX9EdlGyzq6yBKxmeikvWJtYGtDK0lcPpN1GXYybV8LakSdEWJbmEvHfPtnPgSLM8Xpxnv+4Z
 ftrRRYdwh7+JK0i9OL7I8X4+/4/9vsPzImpY6NecfJUmIjiD11MGnbpUVYgKsW1HuyFgVtuMgBI
 2bauOQmqw0//8DhbeJl/Ngm2FraZP59z67Xn64XTMsgFRF4Jef1JervL7G/4dHY5U6uJmUXUzU=
X-Google-Smtp-Source: AGHT+IHDn1Y3xt05c3sartTSXwHA9erKjixGfU399kRuKIVN2pSlgvUAIoFBG/VDgJvH9iN34Uy6+g==
X-Received: by 2002:a17:903:1248:b0:216:2dc5:2330 with SMTP id
 d9443c01a7336-21a83fd2400mr106271905ad.36.1736437981642; 
 Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a91768ca2sm14337555ad.45.2025.01.09.07.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Message-ID: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
Date: Thu, 9 Jan 2025 23:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com> <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <Z35Y9rzS6tLVgsRo@aspen.lan>
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


Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Although there is an existing apple_bl driver, it is for backlight
>> controllers on Intel Macs attached via PCI, which is completely different
>> from the Samsung-derived DWI block.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> I'd rather this was called apple_dwi_bl.c to match that config options,
> etc.
Still trying to determine the type of the backlight control, I think it is linear however and I will send a new
version when I am more certain.


>
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..59e5cad0fbd8
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
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
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
>> +	if (IS_ERR(dwi_bl->base))
>> +		return PTR_ERR(dwi_bl->base);
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
> There should be something to indicate whether the backlight controls are
> linear or logarithmic here.
>
>
>> +static struct platform_driver dwi_bl_driver = {
>> +	.driver		= {
>> +		.name	= "dwi-bl",
> Again, I'd rather see apple here too (although, to be clear, I'm
> perfectly happy with all the static functions and variables being
> prefixed only with dwi_bl).
Alright, I will rename the file and and the name of the driver to have apple, the functions
and variables will still not have apple though to not make the lines too long.


>
>
> Daniel.
