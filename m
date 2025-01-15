Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58631A11C69
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F7810E56C;
	Wed, 15 Jan 2025 08:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ssRAe8HJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8oEKKSO+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ddy50akf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z89OsAxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DD710E56C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:49:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB5FE21265;
 Wed, 15 Jan 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736930940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IJHKiiIait3RS7PQTe2MYwynooFZaU5hkbkzzC+YM/s=;
 b=ssRAe8HJp1UJlrvYkY40QQcAG2YHz0sIMN2l7Xaa0VZNZOwRwEhgzAnt5pi9yz60AmYEqG
 3TsHEROd4EVYUsKOJk9ITzRT4MwfNuNjfhvOUuaF78gBp4/c66ZsLjCLstHV0o2V9TsEFT
 wVznuI5ypVTjDGIitc11gt0CZIr0t60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736930940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IJHKiiIait3RS7PQTe2MYwynooFZaU5hkbkzzC+YM/s=;
 b=8oEKKSO+Fazg0fKrMg6gyQNkBCz1hzkUDcBFE6XLbkmTuQBGqyg1lf38GypOJglnQCGiET
 ELHgdzot1dD4hLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736930939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IJHKiiIait3RS7PQTe2MYwynooFZaU5hkbkzzC+YM/s=;
 b=ddy50akfdPPLmgK3pYMx4kQan23uML8VUt5GObl8l9+p6MPnXwan/k2HWrUjhE4Iz7CQFW
 oKsgFqv5rqXbvas3IfvvZF1zFlOglflJo11ou2R/18zpaOF308MtEIFIH14cqyCDPohaZP
 03btRVNtc9yLVmc2uJDYzSF9E88zhGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736930939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IJHKiiIait3RS7PQTe2MYwynooFZaU5hkbkzzC+YM/s=;
 b=z89OsAxy89xeBiTYA4jhQ2NSkehYKELTXbyap4RtwkLC3s+FNMZvExSLGDQEFyqRen4gTm
 NSJheG+PXV8+x4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63DC913A6F;
 Wed, 15 Jan 2025 08:48:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +s2bFXt2h2dnDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jan 2025 08:48:59 +0000
Message-ID: <d6fcc618-ecee-4222-915c-d4d249dfc076@suse.de>
Date: Wed, 15 Jan 2025 09:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/ls2kbmc: Add support for Loongson-2K BMC
 display
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Chong Qiao <qiaochong@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
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
In-Reply-To: <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[loongson.cn,gmail.com,kernel.org,acm.org,linux.intel.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[]
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

Hi,

after the discussion, let me give you a preliminary review.


Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> Adds a driver for the Loongson-2K BMC display as a sub-function of
> the BMC device.
>
> Display-related scan output buffers, sizes, and display formats are
> provided through the Loongson-2K BMC MFD driver.
>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/gpu/drm/tiny/Kconfig   |  18 +
>   drivers/gpu/drm/tiny/Makefile  |   1 +
>   drivers/gpu/drm/tiny/ls2kbmc.c | 636 +++++++++++++++++++++++++++++++++
>   3 files changed, 655 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/ls2kbmc.c
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb1337c0..5412f639a964 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -171,6 +171,24 @@ config TINYDRM_ILI9486
>   
>   	  If M is selected the module will be called ili9486.
>   
> +config TINYDRM_LS2KBMC

DRM_LS2KBMC. The TINY prefix is no longer in use.

> +	tristate "DRM support for Loongson-2K BMC display"
> +	depends on DRM && MMU
> +	depends on MFD_LS2K_BMC
> +	select APERTURE_HELPERS
> +	select DRM_CLIENT_SELECTION
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for the Loongson-2K BMC display.
> +
> +	  This driver assumes that the display hardware has been initialized
> +	  by the Loongson-2K BMC. Since the Loongson-2K BMC does not support
> +	  resolution detection now, the scan buffer, size and display format
> +	  are fixed and provided by the BMC.
> +
> +	  If M is selected the module will be called ls2kbmc.
> +
>   config TINYDRM_MI0283QT
>   	tristate "DRM support for MI0283QT"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 4aaf56f8707d..fa4e1646db77 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
>   obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
>   obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
>   obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
> +obj-$(CONFIG_TINYDRM_LS2KBMC)		+= ls2kbmc.o
>   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
> diff --git a/drivers/gpu/drm/tiny/ls2kbmc.c b/drivers/gpu/drm/tiny/ls2kbmc.c
> new file mode 100644
> index 000000000000..909d6c687193
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ls2kbmc.c
> @@ -0,0 +1,636 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Loongson-2K BMC display
> + *
> + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> + *
> + * Based on simpledrm
> + */
> +
> +#include <linux/aperture.h>
> +#include <linux/minmax.h>
> +#include <linux/pci.h>
> +#include <linux/platform_data/simplefb.h>

Please don't use these data structures. Create a new one for your driver 
instead. Let''s call it 'struct ls2kbmc_framebuffer' for now.

> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_client_setup.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panic.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct ls2kbmc_pdata {
> +	struct pci_dev *pdev;
> +	struct simplefb_platform_data pd;
> +};
> +
> +/*
> + * Helpers for simplefb_platform_data
> + */
> +
> +static int
> +simplefb_get_validated_int(struct drm_device *dev, const char *name,
> +			   u32 value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
> +			name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int
> +simplefb_get_validated_int0(struct drm_device *dev, const char *name,
> +			    u32 value)
> +{
> +	if (!value) {
> +		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
> +			name, value);
> +		return -EINVAL;
> +	}
> +	return simplefb_get_validated_int(dev, name, value);
> +}
> +
> +static const struct drm_format_info *
> +simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
> +{
> +	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
> +	const struct simplefb_format *fmt = formats;
> +	const struct simplefb_format *end = fmt + ARRAY_SIZE(formats);
> +	const struct drm_format_info *info;
> +
> +	if (!format_name) {
> +		drm_err(dev, "simplefb: missing framebuffer format\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	while (fmt < end) {
> +		if (!strcmp(format_name, fmt->name)) {
> +			info = drm_format_info(fmt->fourcc);
> +			if (!info)
> +				return ERR_PTR(-EINVAL);
> +			return info;
> +		}
> +		++fmt;
> +	}
> +
> +	drm_err(dev, "simplefb: unknown framebuffer format %s\n",
> +		format_name);
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int
> +simplefb_get_width_pd(struct drm_device *dev,
> +		      const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int0(dev, "width", pd->width);
> +}
> +
> +static int
> +simplefb_get_height_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int0(dev, "height", pd->height);
> +}
> +
> +static int
> +simplefb_get_stride_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_int(dev, "stride", pd->stride);
> +}
> +
> +static const struct drm_format_info *
> +simplefb_get_format_pd(struct drm_device *dev,
> +		       const struct simplefb_platform_data *pd)
> +{
> +	return simplefb_get_validated_format(dev, pd->format);
> +}

The simplefb_ prefixes have to be replaced and the helpers have to 
operate on the new custom data structures.

> +
> +/*
> + * ls2kbmc Framebuffer device
> + */
> +
> +struct ls2kbmc_device {
> +	struct drm_device dev;
> +

> +	/* simplefb settings */
> +	struct drm_display_mode mode;
> +	const struct drm_format_info *format;
> +	unsigned int pitch;

You should be able to store a pointer to the instance of struct 
ls2kbmc_framebuffer here.

> +
> +	/* memory management */
> +	struct iosys_map screen_base;
> +
> +	/* modesetting */
> +	u32 formats[8];
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +static struct ls2kbmc_device *ls2kbmc_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct ls2kbmc_device, dev);
> +}
> +
> +/*
> + * Modesetting
> + */
> +
> +static const u64 ls2kbmc_primary_plane_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int ls2kbmc_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						     struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *new_shadow_plane_state =
> +		to_drm_shadow_plane_state(new_plane_state);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	struct drm_device *dev = plane->dev;
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(dev);
> +	int ret;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;
> +	else if (!new_plane_state->visible)
> +		return 0;
> +
> +	if (new_fb->format != sdev->format) {
> +		void *buf;
> +
> +		/* format conversion necessary; reserve buffer */
> +		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
> +						    sdev->pitch, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ls2kbmc_primary_plane_helper_atomic_update(struct drm_plane *plane,
> +						       struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_device *dev = plane->dev;
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(dev);
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	int ret, idx;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		goto out_drm_gem_fb_end_cpu_access;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		struct drm_rect dst_clip = plane_state->dst;
> +		struct iosys_map dst = sdev->screen_base;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
> +		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
> +			    fb, &damage, &shadow_plane_state->fmtcnv_state);
> +	}
> +
> +	drm_dev_exit(idx);
> +out_drm_gem_fb_end_cpu_access:
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static void ls2kbmc_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> +							struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(dev);
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	/* Clear screen to black if disabled */
> +	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static int ls2kbmc_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> +							   struct drm_scanout_buffer *sb)
> +{
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(plane->dev);
> +
> +	sb->width = sdev->mode.hdisplay;
> +	sb->height = sdev->mode.vdisplay;
> +	sb->format = sdev->format;
> +	sb->pitch[0] = sdev->pitch;
> +	sb->map[0] = sdev->screen_base;
> +
> +	return 0;
> +}
> +
> +static const struct drm_plane_helper_funcs ls2kbmc_primary_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = ls2kbmc_primary_plane_helper_atomic_check,
> +	.atomic_update = ls2kbmc_primary_plane_helper_atomic_update,
> +	.atomic_disable = ls2kbmc_primary_plane_helper_atomic_disable,
> +	.get_scanout_buffer = ls2kbmc_primary_plane_helper_get_scanout_buffer,
> +};
> +
> +static const struct drm_plane_funcs ls2kbmc_primary_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static enum drm_mode_status ls2kbmc_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +							   const struct drm_display_mode *mode)
> +{
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sdev->mode);
> +}
> +
> +/*
> + * The CRTC is always enabled. Screen updates are performed by
> + * the primary plane's atomic_update function. Disabling clears
> + * the screen in the primary plane's atomic_disable function.
> + */
> +static const struct drm_crtc_helper_funcs ls2kbmc_crtc_helper_funcs = {
> +	.mode_valid = ls2kbmc_crtc_helper_mode_valid,
> +	.atomic_check = drm_crtc_helper_atomic_check,
> +};
> +
> +static const struct drm_crtc_funcs ls2kbmc_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs ls2kbmc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int ls2kbmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, &sdev->mode);
> +}
> +
> +static const struct drm_connector_helper_funcs ls2kbmc_connector_helper_funcs = {
> +	.get_modes = ls2kbmc_connector_helper_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ls2kbmc_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_mode_config_funcs ls2kbmc_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +/*
> + * Init / Cleanup
> + */
> +
> +static struct drm_display_mode ls2kbmc_mode(unsigned int width, unsigned int height,
> +					    unsigned int width_mm, unsigned int height_mm)
> +{
> +	const struct drm_display_mode mode = {
> +		DRM_MODE_INIT(60, width, height, width_mm, height_mm)
> +	};
> +
> +	return mode;
> +}
> +
> +/*
> + * DRM driver
> + */
> +
> +DEFINE_DRM_GEM_FOPS(ls2kbmc_fops);
> +
> +static struct drm_driver ls2kbmc_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
> +	.name			= "simpledrm",

You must not call it simpledrm. 'ls2kbmc' should be fine.

> +	.desc			= "DRM driver for Loongson-2K BMC",

> +	.date			= "20241211",

We recently removed the driver date from all drivers. So please drop it 
here as well.

> +	.major			= 1,
> +	.minor			= 0,
> +	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> +	.fops			= &ls2kbmc_fops,
> +};
> +
> +/*
> + * Currently the Loongson-2K0500 BMC hardware does not have an i2c interface to
> + * adapt to the resolution.
> + * We set the resolution by presetting "video=1280x1024-16@2M" to the bmc memory.
> + */
> +static int ls2kbmc_get_video_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)

That entire function should be in the BMC core driver. The core driver 
should retrieve the framebuffer parameters, set up an instance of struct 
l2kbmc_framebuffer and forward it as device data.

> +{
> +	char *mode;
> +	int depth, ret;
> +
> +	/* The pci mem bar last 16M is used to store the string. */
> +	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	/*env at last 16M's beginning, first env is video */
> +	if (!strncmp(mode, "video=", 6))

NEVER use video=. It is not for DRM drivers. (fbdev code gets this 
entirely wrong.)

Instead use module_param() to define a module parameter in the core BMC 
driver. Something like

   module_param("framebuffer", charp, 0400)

Your firmware can then do something like

ls2kbmc-mfd.framebuffer=<width>x<height>-<res>@<Hz> on the kernel 
command line. The core driver parses the string and creates the struct 
ls2kbmc_framebuffer from it. I have some doubts about the whole idea of 
using a framebuffer string in the first place. But at least it is self 
contained.
> +		mode = mode + 6;
> +
> +	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
> +	if (ret)
> +		return ret;
> +
> +	pd->stride = pd->width * depth / 8;
> +	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
> +
> +	return 0;
> +}
> +
> +static struct ls2kbmc_device *ls2kbmc_device_create(struct drm_driver *drv,
> +						    struct platform_device *pdev,
> +						    struct ls2kbmc_pdata *priv)
> +{

> +	struct pci_dev *ppdev = priv->pdev;

No need to store the pci_dev explicitly. The PCI device is already the 
parent of the platform device pdev. You can do

   struct pci_dev *pparent;

   if (!dev_is_pci(pdev->dev.parent))
     return -ENODEV;

   pparent = to_pci_dev(pdev->dev.parent);

That will free up the device-data slot for storing the framebuffer info.

> +	struct simplefb_platform_data *pd = &priv->pd;
> +	struct ls2kbmc_device *sdev;
> +	struct drm_device *dev;
> +	int width, height, stride;
> +	int width_mm = 0, height_mm = 0;
> +	const struct drm_format_info *format;
> +	struct resource *res, *mem = NULL;
> +	struct drm_plane *primary_plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	unsigned long max_width, max_height;
> +	void __iomem *screen_base;
> +	size_t nformats;
> +	int ret;
> +
> +	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct ls2kbmc_device, dev);
> +	if (IS_ERR(sdev))
> +		return ERR_CAST(sdev);
> +	dev = &sdev->dev;
> +	platform_set_drvdata(pdev, sdev);
> +

> +	ret = ls2kbmc_get_video_mode(ppdev, pd);
> +	if (ret) {
> +		drm_err(dev, "no simplefb configuration found\n");
> +		return ERR_PTR(ret);
> +	}

This will be in the BMC core driver and you can simply do

   pd = dev_get_platdata(pdev->dev)

Best regards
Thomas

> +
> +	width = simplefb_get_width_pd(dev, pd);
> +	if (width < 0)
> +		return ERR_PTR(width);
> +
> +	height = simplefb_get_height_pd(dev, pd);
> +	if (height < 0)
> +		return ERR_PTR(height);
> +
> +	stride = simplefb_get_stride_pd(dev, pd);
> +	if (stride < 0)
> +		return ERR_PTR(stride);
> +
> +	if (!stride) {
> +		stride = drm_format_info_min_pitch(format, 0, width);
> +		if (drm_WARN_ON(dev, !stride))
> +			return ERR_PTR(-EINVAL);
> +	}
> +
> +	format = simplefb_get_format_pd(dev, pd);
> +	if (IS_ERR(format))
> +		return ERR_CAST(format);
> +
> +	/*
> +	 * Assume a monitor resolution of 96 dpi if physical dimensions
> +	 * are not specified to get a somewhat reasonable screen size.
> +	 */
> +	if (!width_mm)
> +		width_mm = DRM_MODE_RES_MM(width, 96ul);
> +	if (!height_mm)
> +		height_mm = DRM_MODE_RES_MM(height, 96ul);
> +
> +	sdev->mode = ls2kbmc_mode(width, height, width_mm, height_mm);
> +	sdev->format = format;
> +	sdev->pitch = stride;
> +
> +	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
> +	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
> +		&format->format, width, height, stride);
> +
> +	/*
> +	 * Memory management
> +	 */
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return ERR_PTR(-EINVAL);
> +
> +	ret = aperture_remove_conflicting_pci_devices(ppdev, ls2kbmc_driver.name);
> +	if (ret) {
> +		drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
> +
> +	mem = devm_request_mem_region(&ppdev->dev, res->start, resource_size(res),
> +				      drv->name);
> +	if (!mem) {
> +		/*
> +		 * We cannot make this fatal. Sometimes this comes from magic
> +		 * spaces our resource handlers simply don't know about. Use
> +		 * the I/O-memory resource as-is and try to map that instead.
> +		 */
> +		drm_warn(dev, "could not acquire memory region %pr\n", res);
> +		mem = res;
> +	}
> +
> +	screen_base = devm_ioremap_wc(&ppdev->dev, mem->start, resource_size(mem));
> +	if (!screen_base)
> +		return ERR_PTR(-ENOMEM);
> +
> +	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
> +
> +	/*
> +	 * Modesetting
> +	 */
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +
> +	dev->mode_config.min_width = width;
> +	dev->mode_config.max_width = max_width;
> +	dev->mode_config.min_height = height;
> +	dev->mode_config.max_height = max_height;
> +	dev->mode_config.preferred_depth = format->depth;
> +	dev->mode_config.funcs = &ls2kbmc_mode_config_funcs;
> +
> +	/* Primary plane */
> +
> +	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> +					    sdev->formats, ARRAY_SIZE(sdev->formats));
> +
> +	primary_plane = &sdev->primary_plane;
> +	ret = drm_universal_plane_init(dev, primary_plane, 0, &ls2kbmc_primary_plane_funcs,
> +				       sdev->formats, nformats,
> +				       ls2kbmc_primary_plane_format_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_plane_helper_add(primary_plane, &ls2kbmc_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	/* CRTC */
> +
> +	crtc = &sdev->crtc;
> +	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +					&ls2kbmc_crtc_funcs, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_crtc_helper_add(crtc, &ls2kbmc_crtc_helper_funcs);
> +
> +	/* Encoder */
> +
> +	encoder = &sdev->encoder;
> +	ret = drm_encoder_init(dev, encoder, &ls2kbmc_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/* Connector */
> +
> +	connector = &sdev->connector;
> +	ret = drm_connector_init(dev, connector, &ls2kbmc_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_helper_add(connector, &ls2kbmc_connector_helper_funcs);
> +	drm_connector_set_panel_orientation_with_quirk(connector,
> +						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> +						       width, height);
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	drm_mode_config_reset(dev);
> +
> +	return sdev;
> +}
> +
> +/*
> + * Platform driver
> + */
> +
> +static int ls2kbmc_probe(struct platform_device *pdev)
> +{
> +	struct ls2kbmc_device *sdev;
> +	struct ls2kbmc_pdata *priv;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (IS_ERR(priv))
> +		return -ENOMEM;
> +
> +	priv->pdev = *(struct pci_dev **)dev_get_platdata(&pdev->dev);
> +
> +	sdev = ls2kbmc_device_create(&ls2kbmc_driver, pdev, priv);
> +	if (IS_ERR(sdev))
> +		return PTR_ERR(sdev);
> +	dev = &sdev->dev;
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_client_setup(dev, sdev->format);
> +
> +	return 0;
> +}
> +
> +static void ls2kbmc_remove(struct platform_device *pdev)
> +{
> +	struct ls2kbmc_device *sdev = platform_get_drvdata(pdev);
> +	struct drm_device *dev = &sdev->dev;
> +
> +	drm_dev_unplug(dev);
> +}
> +
> +static struct platform_driver ls2kbmc_platform_driver = {
> +	.driver = {
> +		.name = "ls2kbmc-framebuffer",
> +	},
> +	.probe = ls2kbmc_probe,
> +	.remove = ls2kbmc_remove,
> +};
> +
> +module_platform_driver(ls2kbmc_platform_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> +MODULE_LICENSE("GPL");

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

