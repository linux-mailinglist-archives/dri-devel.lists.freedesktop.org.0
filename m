Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11864A7D7D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C03F10E3CA;
	Mon,  7 Apr 2025 08:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="h5uRR/hc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vB+RD+kD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h5uRR/hc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vB+RD+kD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277C810E398
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:30:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C851C21134;
 Mon,  7 Apr 2025 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744014628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+S72FquM0uA8yDzqysmbVgWBtdqLizikAR6qibld/+Y=;
 b=h5uRR/hc5S4c/dm5ZqcxCdW/Zk9soFPoqzbFAyPaWUbk+F5kBNq4FrK/JPDNRhgvWI323A
 9iIqA7uuGAD1xLBNJSoEZ4BI0oO489UDrIkcmjby1XJ4O3uwLDY/JKsML7YVevDQtlOTMq
 l6BNyttgti6mAbZdWfIaCYvj6yCfNhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744014628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+S72FquM0uA8yDzqysmbVgWBtdqLizikAR6qibld/+Y=;
 b=vB+RD+kDdtqM/SvrAYR2Ihde1Vn6HwdbQoxm4JKZGaqvcGj5w56atvt98dzyr7X7Zn1s/s
 dXEawdwu8BPVV/AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744014628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+S72FquM0uA8yDzqysmbVgWBtdqLizikAR6qibld/+Y=;
 b=h5uRR/hc5S4c/dm5ZqcxCdW/Zk9soFPoqzbFAyPaWUbk+F5kBNq4FrK/JPDNRhgvWI323A
 9iIqA7uuGAD1xLBNJSoEZ4BI0oO489UDrIkcmjby1XJ4O3uwLDY/JKsML7YVevDQtlOTMq
 l6BNyttgti6mAbZdWfIaCYvj6yCfNhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744014628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+S72FquM0uA8yDzqysmbVgWBtdqLizikAR6qibld/+Y=;
 b=vB+RD+kDdtqM/SvrAYR2Ihde1Vn6HwdbQoxm4JKZGaqvcGj5w56atvt98dzyr7X7Zn1s/s
 dXEawdwu8BPVV/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E85813691;
 Mon,  7 Apr 2025 08:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bUVNHSSN82cYLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Apr 2025 08:30:28 +0000
Message-ID: <f9312b61-4fe2-4fd6-a7f5-b20392c7c338@suse.de>
Date: Mon, 7 Apr 2025 10:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-2-4c78aab9cd5a@gmail.com>
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
In-Reply-To: <20250404-st7571-v2-2-4c78aab9cd5a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[dt];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

Hi

Am 04.04.25 um 15:50 schrieb Marcus Folkesson:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>

I have a few points below, but it's all minor details. The driver looks 
good overall.

> ---
>   drivers/gpu/drm/tiny/Kconfig      |  11 +
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/st7571-i2c.c | 720 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 732 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c07f1628a33599a7130369b9d59d98..6c711f4b799e05a8edc8e5fd68de0542d9cb6cab 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -232,6 +232,17 @@ config TINYDRM_ST7586
>   
>   	  If M is selected the module will be called st7586.
>   
> +config TINYDRM_ST7571_I2C

Nit: we don't call anything TINYDRM_ any longer; just DRM_.

> +	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +	depends on DRM && I2C

> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER

Alphabetical sorting please

> +	select REGMAP_I2C
> +	help
> +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> +
> +	  if M is selected the module will be called st7571-i2c.

Is there a reason why it is called _i2c? There's another interface, I 
assume?

> +
>   config TINYDRM_ST7735R
>   	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 60816d2eb4ff93b87228ed8eadd60a0a33a1144b..ed767dd9d22b3bb98f50fa2007cad7fb3f3d95e4 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -15,5 +15,6 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
>   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
> +obj-$(CONFIG_TINYDRM_ST7571_I2C)	+= st7571-i2c.o
>   obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
>   obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..196ecd662c73dfaa9940fc601a656305c81a1619
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/st7571-i2c.c
> @@ -0,0 +1,720 @@
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
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <video/display_timing.h>
> +#include <video/of_display_timing.h>
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
> +#define ST7571_COMMAND_SET_NORMAL		(0x00)
> +
> +
> +/* hactive is fixed to 128 */
> +#define ST7571_HACTIVE				(128)
> +
> +#define DRIVER_NAME "st7571"
> +#define DRIVER_DESC "ST7571 DRM driver"
> +#define DRIVER_MAJOR 1
> +#define DRIVER_MINOR 0
> +
> +enum st7571_color_mode {
> +	ST7571_COLOR_MODE_GRAY = 0,
> +	ST7571_COLOR_MODE_BLACKWHITE = 1,
> +};
> +
> +#define drm_to_st7571(_dev) container_of(_dev, struct st7571_device, dev)
> +
> +struct st7571_device {
> +	struct drm_plane primary_plane;
> +	struct drm_connector connector;
> +	struct drm_display_mode mode;
> +	struct drm_encoder encoder;
> +	struct drm_device dev;
> +	struct drm_crtc crtc;

I suggest to visually group this to make it a bit easier to understand. 
Something like this:

{
  drm_device

  plane
  crtc
  encoder
  connector

   display_mode
   ...
}

The DRM device is just a device, the block in the middle it the 
modesetting pipeline. The display mode is something between pipeline and 
hardware state.

> +
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	bool ignore_nak;
> +
> +	struct gpio_desc *reset;
> +
> +	u32 width_mm;
> +	u32 height_mm;
> +	u32 nlines;
> +	u32 startline;
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
> +	/*
> +	 * This is a workaround for the ST7571, which sometimes fails to acknowledge
> +	 *
> +	 * Unfortunately, there is no way to check if the transfer failed because of
> +	 * a NAK or something else as I2C bus drivers use different return values for NAK.
> +	 *
> +	 * However, if the transfer fails and ignore_nak is set, we know it is an error.
> +	 */
> +	if (ret < 0 && st7571->ignore_nak)
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
> +		u8 bit = (byte >> (xrest)) & 1;
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
> +		ST7571_SET_PAGE(y / 8),
> +	};
> +
> +	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
> +}
> +
> +static int st7571_fb_blit_rect(struct drm_framebuffer *fb,
> +			       const struct iosys_map *vmap,
> +			       struct drm_rect *rect)
> +{
> +	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
> +	int bpp = fb->format->format == DRM_FORMAT_C1 ? 1 : 2;
> +	char *pixel = vmap->vaddr;
> +	int x1 = rect->x1 * bpp;
> +	int x2 = rect->x2 * bpp;
> +	char row[256];
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
> +static int st7571_set_color_mode(struct st7571_device *st7571, enum st7571_color_mode  mode)
> +{
> +	u8 cmd_list[] = {
> +		ST7571_COMMAND_SET_3,
> +		ST7571_SET_COLOR_MODE(mode),
> +		ST7571_COMMAND_SET_NORMAL,
> +	};
> +
> +	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
> +}
> +
> +static int st7571_set_pixel_format(struct st7571_device *st7571,
> +				   u32 pixel_format)
> +{
> +	switch (pixel_format) {
> +	case DRM_FORMAT_C1:
> +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
> +	case DRM_FORMAT_C2:
> +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int st7571_connector_get_modes(struct drm_connector *conn)
> +{
> +	struct st7571_device *st7571 = drm_to_st7571(conn->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(conn, &st7571->mode);
> +}
> +
> +static const struct drm_connector_helper_funcs st7571_connector_helper_funcs = {
> +	.get_modes = st7571_connector_get_modes,
> +};
> +
> +static const uint32_t st7571_primary_plane_formats[] = {
> +	DRM_FORMAT_C1,
> +	DRM_FORMAT_C2,
> +};

I assume that you only get fbcon output for now. Some ancient X11window 
managers might also work. Today's GUIs usually need something like XRGB 
to work. We do have DRM helpers to convert from XRGB to Cn, but they 
currently don't support formats with multiple pixels per byte. It's on 
my TODO list and you driver could add XRGB support at some point.

> +
> +static const uint64_t st7571_primary_plane_fmtmods[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int st7571_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						 struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +
> +static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_device *dev = plane->dev;
> +	struct drm_rect damage;
> +	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
> +	int ret, idx;
> +
> +	if (!fb)
> +		return; /* no framebuffer; plane is disabled */
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	ret = st7571_set_pixel_format(st7571, fb->format->format);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to set pixel format: %d\n", ret);
> +		return;
> +	}
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		st7571_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
> +	}
> +
> +	drm_dev_exit(idx);
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static const struct drm_plane_helper_funcs st7571_primary_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = st7571_primary_plane_helper_atomic_check,
> +	.atomic_update = st7571_primary_plane_helper_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs st7571_primary_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +/*
> + * CRTC
> + */
> +
> +static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs = {
> +	.atomic_check = drm_crtc_helper_atomic_check,
> +};
> +
> +static const struct drm_crtc_funcs st7571_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs st7571_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/*
> + * Connector
> + */
> +
> +static const struct drm_connector_funcs st7571_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_device *dev,
> +						       const struct drm_display_mode *mode)
> +{
> +	struct st7571_device *st7571 = drm_to_st7571(dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571->mode);
> +}
> +
> +static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.mode_valid = st7571_mode_config_mode_valid,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_display_mode st7571_mode(struct st7571_device *st7571)
> +{
> +	struct drm_display_mode mode = {
> +		DRM_SIMPLE_MODE(ST7571_HACTIVE, st7571->nlines,
> +				st7571->width_mm, st7571->height_mm),
> +	};
> +
> +	return mode;
> +}
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
> +	dev->mode_config.min_width = ST7571_HACTIVE;
> +	dev->mode_config.min_height = 1;
> +	dev->mode_config.max_width = ST7571_HACTIVE;
> +	dev->mode_config.max_height = 128;
> +	dev->mode_config.preferred_depth = 1;
> +	dev->mode_config.funcs = &st7571_mode_config_funcs;
> +
> +	return 0;
> +}
> +
> +static int st7571_plane_init(struct st7571_device *st7571)
> +{
> +	struct drm_plane *primary_plane = &st7571->primary_plane;
> +	struct drm_device *dev = &st7571->dev;
> +	int ret;
> +
> +	ret = drm_universal_plane_init(dev, primary_plane, 1,
> +				       &st7571_primary_plane_funcs,
> +				       st7571_primary_plane_formats,
> +				       ARRAY_SIZE(st7571_primary_plane_formats),
> +				       st7571_primary_plane_fmtmods,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_helper_add(primary_plane, &st7571_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	return 0;
> +}
> +
> +static int st7571_crtc_init(struct st7571_device *st7571)
> +{
> +	struct drm_plane *primary_plane = &st7571->primary_plane;
> +	struct drm_crtc *crtc = &st7571->crtc;
> +	struct drm_device *dev = &st7571->dev;
> +	int ret;
> +
> +	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +					&st7571_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &st7571_crtc_helper_funcs);
> +
> +	return 0;
> +}
> +
> +static int st7571_encoder_init(struct st7571_device *st7571)
> +{
> +	struct drm_encoder *encoder = &st7571->encoder;
> +	struct drm_crtc *crtc = &st7571->crtc;
> +	struct drm_device *dev = &st7571->dev;
> +	int ret;
> +
> +	ret = drm_encoder_init(dev, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	return 0;
> +}
> +
> +static int st7571_connector_init(struct st7571_device *st7571)
> +{
> +	struct drm_connector *connector = &st7571->connector;
> +	struct drm_encoder *encoder = &st7571->encoder;
> +	struct drm_device *dev = &st7571->dev;
> +	int ret;
> +
> +	ret = drm_connector_init(dev, connector, &st7571_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &st7571_connector_helper_funcs);
> +
> +	return drm_connector_attach_encoder(connector, encoder);
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
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
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
> +	struct display_timing dt;
> +	int ret;
> +
> +	ret = of_get_display_timing(np, "panel-timing", &dt);
> +	if (ret) {
> +		dev_err(dev, "Failed to get display timing from DT\n");
> +		return ret;
> +	}
> +
> +	of_property_read_u32(np, "width-mm", &st7571->width_mm);
> +	of_property_read_u32(np, "height-mm", &st7571->height_mm);
> +
> +	st7571->startline = dt.vfront_porch.typ;
> +	st7571->nlines = dt.vactive.typ;
> +
> +	if (dt.hactive.typ != ST7571_HACTIVE) {
> +		dev_err(dev, "Invalid timing configuration (hactive != %i).\n",
> +			ST7571_HACTIVE);
> +		return -EINVAL;
> +	}
> +
> +	if (st7571->width_mm == 0 || st7571->height_mm == 0) {
> +		dev_err(dev, "Invalid panel dimensions.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (st7571->startline + st7571->nlines > 128) {
> +		dev_err(dev, "Invalid timing configuration.\n");
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
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 1);
> +	udelay(20);
> +	gpiod_set_value_cansleep(st7571->reset, 0);
> +}
> +
> +static int st7571_lcd_init(struct st7571_device *st7571)
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
> +	struct st7571_device *st7571;
> +	struct drm_device *dev;
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
> +	st7571->mode = st7571_mode(st7571);
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
> +	ret = st7571_lcd_init(st7571);
> +	if (ret)
> +		return ret;
> +


> +	ret = st7571_mode_config_init(st7571);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to initialize mode config\n");
> +		return ret;
> +	}
> +
> +	ret = st7571_plane_init(st7571);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to initialize primary plane\n");
> +		return ret;
> +	}
> +
> +	ret = st7571_crtc_init(st7571);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to initialize CRTC\n");
> +		return ret;
> +	}
> +
> +	ret = st7571_encoder_init(st7571);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to initialize encoder\n");
> +		return ret;
> +	}
> +
> +	ret = st7571_connector_init(st7571);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to initialize connector\n");
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(dev);

No need for all these individual _init functions. For such simple 
drivers, it might be easier to put all pipeline setup here. Or put 
everything including (drm_mode_config_reset()) into 
st7571_mode_config_init(). Just an advise; your choice.

> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to register DRM device\n");
> +		return ret;
> +	}
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

This would disable the mode-setting pipeline. But as the device has been 
unplugged already, it won't really do anything. You can leave it out.

Best regards
Thomas


> +}
> +
> +static const struct of_device_id st7571_of_match[] = {
> +	{ .compatible = "sitronix,st7571" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, st7571_of_match);
> +
> +
> +static const struct i2c_device_id st7571_id[] = {
> +	{ "st7571", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, st7571_id);
> +
> +static struct i2c_driver st7571_i2c_driver = {
> +	.driver = {
> +		.name = "st7571",
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

