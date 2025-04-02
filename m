Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321CA7898A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A0C10E6DA;
	Wed,  2 Apr 2025 08:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IhfAZhyp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIdYsGcX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IhfAZhyp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HIdYsGcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6D010E6D8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:12:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AB16211A2;
 Wed,  2 Apr 2025 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743581559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WsyBCFMqzjU64zZSuUavY/Le3ScNWhMn8bvBoun8bI0=;
 b=IhfAZhypdZ56wlwdG3HNVlFUKwmmO0TC0jOA6wJo+hs7CYfgAEamYjlSc+XdDqj8xeJMle
 ddyRa6uBwRPj1jAn3Awtptd7Ehn5u7hyj3cUFB06HWxoCgvyu5+yq2dF1EbHg6BfGHS6Ds
 l5dX4ub3G4LjzylRZYpqeBXcBv7ivxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743581559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WsyBCFMqzjU64zZSuUavY/Le3ScNWhMn8bvBoun8bI0=;
 b=HIdYsGcXLAMZCNxzAzFXKGzsxhNj1uzp+kuhoojLez1dJTJ/j1JnngpDUP8V+OMYJILdzI
 /IObnpN77FGKUmCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IhfAZhyp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HIdYsGcX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743581559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WsyBCFMqzjU64zZSuUavY/Le3ScNWhMn8bvBoun8bI0=;
 b=IhfAZhypdZ56wlwdG3HNVlFUKwmmO0TC0jOA6wJo+hs7CYfgAEamYjlSc+XdDqj8xeJMle
 ddyRa6uBwRPj1jAn3Awtptd7Ehn5u7hyj3cUFB06HWxoCgvyu5+yq2dF1EbHg6BfGHS6Ds
 l5dX4ub3G4LjzylRZYpqeBXcBv7ivxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743581559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WsyBCFMqzjU64zZSuUavY/Le3ScNWhMn8bvBoun8bI0=;
 b=HIdYsGcXLAMZCNxzAzFXKGzsxhNj1uzp+kuhoojLez1dJTJ/j1JnngpDUP8V+OMYJILdzI
 /IObnpN77FGKUmCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A050137D4;
 Wed,  2 Apr 2025 08:12:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KxnfCHfx7GcnKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Apr 2025 08:12:39 +0000
Message-ID: <61d317d3-d6dd-4b9c-bf2b-4d5aa51f60bd@suse.de>
Date: Wed, 2 Apr 2025 10:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/st7571-i2c: add support for Sitronix ST7571 LCD
 controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7AB16211A2
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[dt];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi,

thanks for the driver. See below for an initial review.

Am 02.04.25 um 08:12 schrieb Marcus Folkesson:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/gpu/drm/tiny/Kconfig      |  12 +
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/st7571-i2c.c | 563 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 576 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c07f1628a33599a7130369b9d59d98..14096031e7c2d8f73c06c88e08f35aa5a3790a54 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -232,6 +232,18 @@ config TINYDRM_ST7586
>   
>   	  If M is selected the module will be called st7586.
>   
> +config TINYDRM_ST7571_I2C
> +	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +	depends on DRM && I2C
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_GEM_SHMEM_HELPER

You only need one GEM helper, likely SHMEM in your case.

> +	select REGMAP_I2C
> +	help
> +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> +
> +	  if M is selected the module will be called st7571-i2c.
> +
>   config TINYDRM_ST7735R
>   	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..343813a965e13326bbb8520a5c34d272ec7821d5 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -17,3 +17,4 @@ obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
>   obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
>   obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> +obj-$(CONFIG_TINYDRM_ST7571_I2C)	+= st7571-i2c.o

Please keep these entries alphabetically sorted.

> diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c26ecf8a4fd2115b808b126cccda74ea9079cd7c
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Sitronix ST7571, a 4 level gray scale dot matrix LCD controller
> + *
> + * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/clients/drm_client_setup.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fbdev_dma.h>

This should be drm_fbdev_shmem.h.

> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>

Please consider everything in this file as obsolete and don't use it in 
new code.

> +
> +#define ST7571_COMMAND_MODE			(0x00)
> +#define ST7571_DATA_MODE			(0x40)
> +
> +/* Normal mode command set */
> +#define ST7571_DISPLAY_OFF			(0xae)
> +#define ST7571_DISPLAY_ON			(0xaf)
> +#define ST7571_OSC_ON				(0xab)
> +#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
> +#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
> +#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
> +#define ST7571_SET_COM0_MSB			(0x44)
> +#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))
> +#define ST7571_SET_CONTRAST_LSB(c)		((c) & 0x3f)
> +#define ST7571_SET_CONTRAST_MSB			(0x81)
> +#define ST7571_SET_DISPLAY_DUTY_LSB(d)		((d) & 0xff)
> +#define ST7571_SET_DISPLAY_DUTY_MSB		(0x48)
> +#define ST7571_SET_ENTIRE_DISPLAY_ON(p)		(0xa4 | ((p) & 0x1))
> +#define ST7571_SET_LCD_BIAS(b)			(0x50 | ((b) & 0x7))
> +#define ST7571_SET_MODE_LSB(m)			((m) & 0xfc)
> +#define ST7571_SET_MODE_MSB			(0x38)
> +#define ST7571_SET_PAGE(p)			(0xb0 | (p))
> +#define ST7571_SET_POWER(p)			(0x28 | ((p) & 0x7))
> +#define ST7571_SET_REGULATOR_REG(r)		(0x20 | ((r) & 0x7))
> +#define ST7571_SET_REVERSE(r)			(0xa6 | ((r) & 0x1))
> +#define ST7571_SET_SEG_SCAN_DIR(d)		(0xa0 | ((d) & 0x1))
> +#define ST7571_SET_START_LINE_LSB(l)		((l) & 0x3f)
> +#define ST7571_SET_START_LINE_MSB		(0x40)
> +
> +/* Extension command set 3 */
> +#define ST7571_COMMAND_SET_3			(0x7b)
> +#define ST7571_SET_COLOR_MODE(c)		(0x10 | ((c) & 0x1))
> +#define ST7571_COLOR_MODE_BLACKWHITE		(1)
> +#define ST7571_COLOR_MODE_GRAY			(0)
> +#define ST7571_COMMAND_SET_NORMAL		(0x00)
> +
> +#define DRIVER_NAME "st7571-i2c"
> +#define DRIVER_DESC "ST7571 DRM driver"
> +#define DRIVER_MAJOR 1
> +#define DRIVER_MINOR 0
> +
> +#define to_st7571(_dev) container_of(_dev, struct st7571_device, dev)
> +
> +struct st7571_device {
> +	struct drm_device	       dev;

> +	struct drm_simple_display_pipe pipe;

That structure and its helpers are obsolete. Please open-code its 
content (plane, crtc, encoder) in your driver. Here's an example of how 
this has been done for another driver: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.14&id=72d73dd3a95c7e879c18a0eae8fd2af89b5b3347 
You have to pull all the code and data structures into your driver and 
then streamline your driver to only use regular helpers.


> +	struct drm_connector	       conn;
> +	struct drm_display_mode mode;
> +	struct regmap *regmap;
> +	struct i2c_client *client;
> +	struct gpio_desc *reset;
> +	u8 bpp;
> +	u32 width_mm;
> +	u32 height_mm;
> +	u32 nlines;
> +	u32 startline;
> +	bool ignore_nak;
> +};
> +
> +static int st7571_regmap_write(void *context, const void *data, size_t count)
> +{
> +	struct i2c_client *client = context;
> +	struct st7571_device *st7571 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	struct i2c_msg msg = {
> +		.addr = st7571->client->addr,
> +		.flags = st7571->ignore_nak ? I2C_M_IGNORE_NAK : 0,
> +		.len = count,
> +		.buf = (u8 *)data
> +	};
> +
> +	ret = i2c_transfer(st7571->client->adapter, &msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int st7571_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int st7571_send_command_list(struct st7571_device *st7571,
> +				    const u8 *cmd_list, size_t len)
> +{
> +	int ret;
> +
> +	for (int i = 0; i < len; i++) {
> +		ret = regmap_write(st7571->regmap, ST7571_COMMAND_MODE, cmd_list[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static inline u8 st7571_transform_xy(const char *p, int x, int y)
> +{
> +	int xrest = x % 8;
> +	u8 result = 0;
> +
> +	/*
> +	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
> +	 * column from the framebuffer. It calculates the corresponding byte in the
> +	 * framebuffer, extracts the bit at the given x position across 8 consecutive
> +	 * rows, and packs those bits into a single byte.
> +	 *
> +	 * Return an 8-bit value representing a vertical column of pixels.
> +	 */
> +	x = x / 8;
> +	y = (y / 8) * 8;
> +
> +	for (int i = 0; i < 8; i++) {
> +		int row_idx = y + i;
> +		u8 byte = p[row_idx * 16 + x];
> +		u8 bit = (byte >> (7-xrest)) & 1;
> +
> +		result |= (bit << i);
> +	}
> +
> +	return result;
> +}
> +
> +static int st7571_set_position(struct st7571_device *st7571, int x, int y)
> +{
> +	u8 cmd_list[] = {
> +		ST7571_SET_COLUMN_LSB(x),
> +		ST7571_SET_COLUMN_MSB(x),
> +		ST7571_SET_PAGE(y/8),
> +	};
> +
> +	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
> +}
> +
> +static int st7571_fb_blit_rect(struct drm_framebuffer *fb,
> +			       const struct iosys_map *vmap,
> +			       struct drm_rect *rect)
> +{
> +	struct st7571_device *st7571 = to_st7571(fb->dev);
> +
> +	char row[256];
> +	char *pixel = vmap->vaddr;
> +	int x1 = rect->x1 * st7571->bpp;
> +	int x2 = rect->x2 * st7571->bpp;
> +
> +	for (int y = rect->y1; y < rect->y2; y += 8) {
> +		for (int x = x1; x < x2; x++)
> +			row[x] = st7571_transform_xy(pixel, x, y);
> +
> +		st7571_set_position(st7571, rect->x1, y);
> +
> +		/* TODO: Investige why we can't write multiple bytes at once */
> +		for (int x = x1; x < x2; x++)
> +			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int st7571_fb_blit_fullscreen(struct drm_framebuffer *fb,
> +				     const struct iosys_map *map)
> +{
> +	struct drm_rect fullscreen = {
> +		.x1 = 0,
> +		.x2 = fb->width,
> +		.y1 = 0,
> +		.y2 = fb->height,
> +	};
> +
> +	return st7571_fb_blit_rect(fb, map, &fullscreen);
> +}
> +
> +static int st7571_conn_get_modes(struct drm_connector *conn)
> +{
> +	struct st7571_device *st7571 = to_st7571(conn->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(conn, &st7571->mode);
> +}
> +
> +static const struct drm_connector_helper_funcs st7571_conn_helper_funcs = {
> +	.get_modes = st7571_conn_get_modes,
> +};
> +
> +static const struct drm_connector_funcs st7571_conn_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int st7571_conn_init(struct st7571_device *st7571)
> +{
> +	drm_connector_helper_add(&st7571->conn, &st7571_conn_helper_funcs);
> +	return drm_connector_init(&st7571->dev, &st7571->conn,
> +				  &st7571_conn_funcs, DRM_MODE_CONNECTOR_Unknown);
> +
> +}
> +
> +
> +static void st7571_pipe_enable(struct drm_simple_display_pipe *pipe,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_plane_state *plane_state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +
> +	st7571_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
> +}
> +
> +static void st7571_pipe_update(struct drm_simple_display_pipe *pipe,
> +			       struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
> +	struct drm_rect rect;
> +
> +	if (state->fb && drm_atomic_helper_damage_merged(old_state, state, &rect))
> +		st7571_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs st7571_pipe_funcs = {
> +	.enable	    = st7571_pipe_enable,
> +	.update	    = st7571_pipe_update,
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const uint32_t st7571_formats[] = {
> +	DRM_FORMAT_C1,
> +	DRM_FORMAT_C2,
> +};
> +
> +static const uint64_t st7571_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int st7571_pipe_init(struct st7571_device *st7571)
> +{
> +	return drm_simple_display_pipe_init(&st7571->dev,
> +					    &st7571->pipe,
> +					    &st7571_pipe_funcs,
> +					    st7571_formats,
> +					    ARRAY_SIZE(st7571_formats),
> +					    st7571_modifiers,
> +					    &st7571->conn);
> +}
> +
> +static int st7571_set_pixel_format(struct st7571_device *st7571,
> +				   u32 pixel_format)
> +{
> +	u8 cmd_list[] = {
> +		ST7571_COMMAND_SET_3,
> +		ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_BLACKWHITE),
> +		ST7571_COMMAND_SET_NORMAL,
> +	};
> +
> +	switch (pixel_format) {
> +	case DRM_FORMAT_C1:
> +		cmd_list[1] = ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_BLACKWHITE);
> +		st7571->bpp = 1;
> +		break;
> +	case DRM_FORMAT_C2:
> +		cmd_list[1] = ST7571_SET_COLOR_MODE(ST7571_COLOR_MODE_GRAY);
> +		st7571->bpp = 2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
> +}
> +
> +static struct drm_framebuffer*
> +st7571_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +		 const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	int ret = st7571_set_pixel_format(to_st7571(dev), mode_cmd->pixel_format);

You need to set the pixel format in the primary plane's atomic_update. 
The function here only allocates the graphics buffer.

> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
> +}
> +
> +static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
> +	.fb_create = st7571_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int st7571_mode_config_init(struct st7571_device *st7571)
> +{
> +	struct drm_device *dev = &st7571->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	dev->mode_config.min_width = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width = 128;
> +	dev->mode_config.max_height = 128;
> +	dev->mode_config.preferred_depth = 1;
> +	dev->mode_config.prefer_shadow = 0;
> +	dev->mode_config.funcs = &st7571_mode_config_funcs;
> +
> +	return 0;
> +}
> +
> +DEFINE_DRM_GEM_FOPS(st7571_fops);
> +
> +static const struct drm_driver st7571_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +
> +	.name		 = DRIVER_NAME,
> +	.desc		 = DRIVER_DESC,
> +	.major		 = DRIVER_MAJOR,
> +	.minor		 = DRIVER_MINOR,
> +
> +	.fops		 = &st7571_fops,
> +	DRM_GEM_SHMEM_DRIVER_OPS,

> +	DRM_FBDEV_DMA_DRIVER_OPS,

Needs to be DRM_FBDEV_SHMEM_DRIVER_OPS.

There's more review to do, but the required rework will already change 
the driver significantly.

Best regards
Thomas


> +};
> +
> +static const struct regmap_bus st7571_regmap_bus = {
> +	.read = st7571_regmap_read,
> +	.write = st7571_regmap_write,
> +};
> +
> +static const struct regmap_config st7571_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.use_single_write = true,
> +};
> +
> +static int st7571_parse_dt(struct st7571_device *st7571)
> +{
> +	struct device *dev = &st7571->client->dev;
> +	struct device_node *np = dev->of_node;
> +
> +	of_property_read_u32(np, "sitronix,panel-width-mm", &st7571->width_mm);
> +	of_property_read_u32(np, "sitronix,panel-height-mm", &st7571->height_mm);
> +	of_property_read_u32(np, "sitronix,panel-start-line", &st7571->startline);
> +	of_property_read_u32(np, "sitronix,panel-nlines", &st7571->nlines);
> +
> +	if (st7571->width_mm == 0 || st7571->height_mm == 0) {
> +		dev_err(dev, "Invalid panel dimensions\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Default to 128 lines if not specified */
> +	if (!st7571->nlines)
> +		st7571->nlines = 128;
> +
> +	if (st7571->startline + st7571->nlines > 128) {
> +		dev_err(dev, "Invalid line configuration (start-line=%i, nlines=%i)\n",
> +			st7571->startline, st7571->nlines);
> +		return -EINVAL;
> +	}
> +
> +	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(st7571->reset))
> +		return PTR_ERR(st7571->reset);
> +
> +	return 0;
> +}
> +
> +static void st7571_create_mode(struct st7571_device *st7571)
> +{
> +	struct drm_display_mode st7571_mode = {
> +		DRM_SIMPLE_MODE(128, st7571->nlines, st7571->width_mm, st7571->height_mm),
> +	};
> +
> +	memcpy(&st7571->mode, &st7571_mode, sizeof(st7571_mode));
> +}
> +
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 0);
> +	mdelay(20);
> +	gpiod_set_value_cansleep(st7571->reset, 1);
> +}
> +
> +static int st7571_initialize(struct st7571_device *st7571)
> +{
> +	/*
> +	 * Most of the initialization sequence is taken directly from the
> +	 * referential initial code in the ST7571 datasheet.
> +	 */
> +	u8 commands[] = {
> +		ST7571_DISPLAY_OFF,
> +		ST7571_SET_MODE_MSB,
> +
> +		ST7571_SET_MODE_LSB(0x94),
> +		ST7571_SET_SEG_SCAN_DIR(0),
> +		ST7571_SET_COM_SCAN_DIR(1),
> +
> +		ST7571_SET_COM0_MSB,
> +		ST7571_SET_COM0_LSB(0x00),
> +
> +		ST7571_SET_START_LINE_MSB,
> +		ST7571_SET_START_LINE_LSB(st7571->startline),
> +
> +		ST7571_OSC_ON,
> +		ST7571_SET_REGULATOR_REG(5),
> +		ST7571_SET_CONTRAST_MSB,
> +		ST7571_SET_CONTRAST_LSB(0x33),
> +		ST7571_SET_LCD_BIAS(0x04),
> +		ST7571_SET_DISPLAY_DUTY_MSB,
> +		ST7571_SET_DISPLAY_DUTY_LSB(st7571->nlines),
> +
> +
> +		ST7571_SET_POWER(0x4),	/* Power Control, VC: ON, VR: OFF, VF: OFF */
> +		ST7571_SET_POWER(0x6),	/* Power Control, VC: ON, VR: ON, VF: OFF */
> +		ST7571_SET_POWER(0x7),	/* Power Control, VC: ON, VR: ON, VF: ON */
> +
> +		ST7571_SET_REVERSE(0),
> +		ST7571_SET_ENTIRE_DISPLAY_ON(0),
> +
> +		ST7571_DISPLAY_ON,
> +	};
> +
> +	/* Perform a reset before initializing the controller */
> +	st7571_reset(st7571);
> +
> +	return st7571_send_command_list(st7571, commands, ARRAY_SIZE(commands));
> +}
> +
> +
> +static int st7571_probe(struct i2c_client *client)
> +{
> +	struct drm_device *dev;
> +	struct st7571_device *st7571;
> +	int ret;
> +
> +	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
> +				    struct st7571_device, dev);
> +	if (IS_ERR(st7571))
> +		return PTR_ERR(st7571);
> +
> +	dev = &st7571->dev;
> +	st7571->client = client;
> +	i2c_set_clientdata(client, st7571);
> +
> +	ret = st7571_parse_dt(st7571);
> +	if (ret)
> +		return ret;
> +
> +	/* Create mode with parsed values */
> +	st7571_create_mode(st7571);
> +
> +	/*
> +	 * The chip nacks some messages but still works as expected.
> +	 * If the adapter does not support protocol mangling do
> +	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
> +	 * cruft in the logs.
> +	 */
> +	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
> +		st7571->ignore_nak = true;
> +
> +	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
> +					   client, &st7571_regmap_config);
> +	if (IS_ERR(st7571->regmap)) {
> +		dev_err(&client->dev, "Failed to initialize regmap\n");
> +		return PTR_ERR(st7571->regmap);
> +	}
> +
> +	ret = st7571_initialize(st7571);
> +	if (ret)
> +		return ret;
> +
> +	ret = st7571_mode_config_init(st7571);
> +	if (ret)
> +		return ret;
> +
> +	ret = st7571_conn_init(st7571);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = st7571_pipe_init(st7571);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_plane_enable_fb_damage_clips(&st7571->pipe.plane);
> +	drm_mode_config_reset(dev);
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_client_setup(dev, NULL);
> +	return 0;
> +}
> +
> +static void st7571_remove(struct i2c_client *client)
> +{
> +	struct st7571_device *st7571 = i2c_get_clientdata(client);
> +
> +	drm_dev_unplug(&st7571->dev);
> +	drm_atomic_helper_shutdown(&st7571->dev);
> +}
> +
> +static const struct of_device_id st7571_of_match[] = {
> +	{ .compatible = "sitronix,st7571-i2c" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, st7571_of_match);
> +
> +
> +static const struct i2c_device_id st7571_id[] = {
> +	{ "st7571-i2c", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, st7571_id);
> +
> +static struct i2c_driver st7571_i2c_driver = {
> +	.driver = {
> +		.name = "st7571-i2c",
> +		.of_match_table = st7571_of_match,
> +	},
> +	.probe = st7571_probe,
> +	.remove = st7571_remove,
> +	.id_table = st7571_id,
> +};
> +
> +module_i2c_driver(st7571_i2c_driver);
> +
> +MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
> +MODULE_DESCRIPTION("DRM Driver for Sitronix ST7571 LCD controller");
> +MODULE_LICENSE("GPL");
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

