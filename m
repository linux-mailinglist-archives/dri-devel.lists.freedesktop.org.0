Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4188A4367C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6310E591;
	Tue, 25 Feb 2025 07:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JmK0iK6b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bVXO1cGN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JmK0iK6b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bVXO1cGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4732A10E591
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:52:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F23A21F44F;
 Tue, 25 Feb 2025 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740469952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LelKYiV07WqLrG2uzhSFeBI7wAVaHzN0wcCqidmF0QQ=;
 b=JmK0iK6bT/yqw3/pt36RoxoNcCjSj3UFeeunv7aMXOJ0Y6kzk2wZz/dN0VWufMDg62SvEr
 v75JHQmVkt16efv294oBIOT6Ve3+ZcJl6+cpudZ4gz7p45jMxVZ4Q832z0lsa0RzkZGen0
 H3gFpQ4OU1WzPRcqkKzCOOYV3jFuuzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740469952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LelKYiV07WqLrG2uzhSFeBI7wAVaHzN0wcCqidmF0QQ=;
 b=bVXO1cGNcNbK5lVCZcKizWMfej1eMziHuSmf04TZYs4UPNPuJh975s78r72oavfxKE1cVT
 FnxRVIoVOEo+4NDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JmK0iK6b;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bVXO1cGN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740469952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LelKYiV07WqLrG2uzhSFeBI7wAVaHzN0wcCqidmF0QQ=;
 b=JmK0iK6bT/yqw3/pt36RoxoNcCjSj3UFeeunv7aMXOJ0Y6kzk2wZz/dN0VWufMDg62SvEr
 v75JHQmVkt16efv294oBIOT6Ve3+ZcJl6+cpudZ4gz7p45jMxVZ4Q832z0lsa0RzkZGen0
 H3gFpQ4OU1WzPRcqkKzCOOYV3jFuuzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740469952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LelKYiV07WqLrG2uzhSFeBI7wAVaHzN0wcCqidmF0QQ=;
 b=bVXO1cGNcNbK5lVCZcKizWMfej1eMziHuSmf04TZYs4UPNPuJh975s78r72oavfxKE1cVT
 FnxRVIoVOEo+4NDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A535013332;
 Tue, 25 Feb 2025 07:52:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q0XeJr92vWfCcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Feb 2025 07:52:31 +0000
Message-ID: <91a39a2e-a3ad-499d-86cd-0e621a68e282@suse.de>
Date: Tue, 25 Feb 2025 08:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
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
In-Reply-To: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F23A21F44F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[live.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,kodeit.net,vger.kernel.org,lists.freedesktop.org]; 
 RCPT_COUNT_SEVEN(0.00)[11]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 24.02.25 um 14:40 schrieb Aditya Garg:
> From: Kerem Karabay <kekrby@gmail.com>
>
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed.
>
> This commit adds support for the display functionality of the second
> configuration. Functionality for the first configuration has been
> merged in the HID tree.
>
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>
> Credit goes to Ben (Bingxing) Wang on GitHub for reverse engineering
> most of the protocol.
>
> Also, as requested by Andy, I would like to clarify the use of __packed
> structs in this driver:
>
> - All the packed structs are aligned except for appletbdrm_msg_information.
> - We have to pack appletbdrm_msg_information since it is requirement of
>    the protocol.
> - We compared binaries compiled by keeping the rest structs __packed and
>    not __packed using bloat-o-meter, and __packed was not affecting code
>    generation.
> - To maintain consistency, rest structs have been kept __packed.
>
> Link: https://github.com/imbushuo/DFRDisplayKm
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Co-developed-by: Atharva Tiwari <evepolonium@gmail.com>
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
> ---
> v2 ->
> - Add the driver to MAINTAINERS.
> - Allocate memory for request and response in plane's atomic-check helper
> - Void the use of drm_fb_blit()
> - Implement atomic_disable
> - Make PRIME work
> - Remove the date field from struct drm_driver
> - intersect damage with dst_clip
> - Register DRM device in appletbdrm_probe
> - Clear the display as the final call in probe
> - Select hid_multitouch as well in kconfig
>
> v3 ->
> - Change commit message to credit Ben (Bingxing) Wang
>
> v4 ->
> - Use "Link:" in commit message
> - Specify why __packed has been used in commit message
> - Use %p4cc instead of %p4ch for errors
> - Add myself to Maintainers
> - Remove #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> - Add missing header files
> - Use return 0; instead of return ret; in static int appletbdrm_send_request
> - Better errno types used in appletbdrm_read_response
> - Use BITS_TO_BYTES() to convert APPLETBDRM_BITS_PER_PIXEL to bytes
> - Remove redundant else in plane_helper_atomic_check
> - Remove unnecessary use of 0xff in request->msg_id = timestamp & 0xff;
> - Remove duplicated struct device in struct appletbdrm_device
> - clear frames_size and request_size as well in primary_plane_helper_atomic_update
> - Allocate using kzalloc instead of kmemdup
> - Use drm_err() instead of dev_err_probe()
> - Avoid clearing drm->mode_config.min_width and height to 0
> - Use put_device() to release the DMA device in appletbdrm_disconnect
>
>   MAINTAINERS                       |   8 +
>   drivers/gpu/drm/tiny/Kconfig      |  14 +
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/appletbdrm.c | 835 ++++++++++++++++++++++++++++++
>   4 files changed, 858 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efee40ea5..f7c97eb24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7148,6 +7148,14 @@ S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/sun4i/sun8i*
>   
> +DRM DRIVER FOR APPLE TOUCH BARS
> +M:	Aun-Ali Zaidi <admin@kodeit.net>
> +M:	Aditya Garg <gargaditya08@live.com>

That's better. Since you did all the work so far, you should be listed 
as maintainer as well, until Ali has done a number of commits. It 
doesn't feel right to list someone as  a maintainer with no changes in 
the driver.

> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/tiny/appletbdrm.c
> +
>   DRM DRIVER FOR ARM PL111 CLCD
>   M:	Linus Walleij <linus.walleij@linaro.org>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 94cbdb133..25471791c 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -1,5 +1,19 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> +config DRM_APPLETBDRM
> +	tristate "DRM support for Apple Touch Bars"
> +	depends on DRM && USB && MMU
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select HID_APPLETB_BL
> +	select HID_MULTITOUCH
> +	help
> +	  Say Y here if you want support for the display of Touch Bars on x86
> +	  MacBook Pros.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called appletbdrm.
> +
>   config DRM_ARCPGU
>   	tristate "ARC PGU"
>   	depends on DRM && OF
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 60816d2eb..0a3a7837a 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> +obj-$(CONFIG_DRM_APPLETBDRM)		+= appletbdrm.o
>   obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
>   obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
>   obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> new file mode 100644
> index 000000000..59a2b20d4
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -0,0 +1,835 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Touch Bar DRM Driver
> + *
> + * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
> + */
> +
> +#include <linux/align.h>
> +#include <linux/array_size.h>
> +#include <linux/bitops.h>
> +#include <linux/bug.h>
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/usb.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define __APPLETBDRM_MSG_STR4(str4)	((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> +#define __APPLETBDRM_MSG_TOK4(tok4)	__APPLETBDRM_MSG_STR4(#tok4)
> +
> +#define APPLETBDRM_PIXEL_FORMAT		__APPLETBDRM_MSG_TOK4(RGBA) /* The actual format is BGR888 */
> +#define APPLETBDRM_BITS_PER_PIXEL	24
> +
> +#define APPLETBDRM_MSG_CLEAR_DISPLAY	__APPLETBDRM_MSG_TOK4(CLRD)
> +#define APPLETBDRM_MSG_GET_INFORMATION	__APPLETBDRM_MSG_TOK4(GINF)
> +#define APPLETBDRM_MSG_UPDATE_COMPLETE	__APPLETBDRM_MSG_TOK4(UDCL)
> +#define APPLETBDRM_MSG_SIGNAL_READINESS	__APPLETBDRM_MSG_TOK4(REDY)
> +
> +#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
> +
> +#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, drm)
> +#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dev))
> +
> +struct appletbdrm_msg_request_header {
> +	__le16 unk_00;
> +	__le16 unk_02;
> +	__le32 unk_04;
> +	__le32 unk_08;
> +	__le32 size;
> +} __packed;
> +
> +struct appletbdrm_msg_response_header {
> +	u8 unk_00[16];
> +	__le32 msg;
> +} __packed;
> +
> +struct appletbdrm_msg_simple_request {
> +	struct appletbdrm_msg_request_header header;
> +	__le32 msg;
> +	u8 unk_14[8];
> +	__le32 size;
> +} __packed;
> +
> +struct appletbdrm_msg_information {
> +	struct appletbdrm_msg_response_header header;
> +	u8 unk_14[12];
> +	__le32 width;
> +	__le32 height;
> +	u8 bits_per_pixel;
> +	__le32 bytes_per_row;
> +	__le32 orientation;
> +	__le32 bitmap_info;
> +	__le32 pixel_format;
> +	__le32 width_inches;	/* floating point */
> +	__le32 height_inches;	/* floating point */
> +} __packed;
> +
> +struct appletbdrm_frame {
> +	__le16 begin_x;
> +	__le16 begin_y;
> +	__le16 width;
> +	__le16 height;
> +	__le32 buf_size;
> +	u8 buf[];
> +} __packed;
> +
> +struct appletbdrm_fb_request_footer {
> +	u8 unk_00[12];
> +	__le32 unk_0c;
> +	u8 unk_10[12];
> +	__le32 unk_1c;
> +	__le64 timestamp;
> +	u8 unk_28[12];
> +	__le32 unk_34;
> +	u8 unk_38[20];
> +	__le32 unk_4c;
> +} __packed;
> +
> +struct appletbdrm_fb_request {
> +	struct appletbdrm_msg_request_header header;
> +	__le16 unk_10;
> +	u8 msg_id;
> +	u8 unk_13[29];
> +	/*
> +	 * Contents of `data`:
> +	 * - struct appletbdrm_frame frames[];
> +	 * - struct appletbdrm_fb_request_footer footer;
> +	 * - padding to make the total size a multiple of 16
> +	 */
> +	u8 data[];
> +} __packed;
> +
> +struct appletbdrm_fb_request_response {
> +	struct appletbdrm_msg_response_header header;
> +	u8 unk_14[12];
> +	__le64 timestamp;
> +} __packed;
> +
> +struct appletbdrm_device {
> +	struct device *dev;

This field should go away, please. There's drm.dev, which contains the 
same address.

So seems to have remove the dmadev field instead, which you'll need for 
dma-buf sharing. Was that a misunderstanding from the last review?

The rest of the driver looks good.

Best regards
Thomas

> +
> +	unsigned int in_ep;
> +	unsigned int out_ep;
> +
> +	unsigned int width;
> +	unsigned int height;
> +
> +	struct drm_device drm;
> +	struct drm_display_mode mode;
> +	struct drm_connector connector;
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +};
> +
> +struct appletbdrm_plane_state {
> +	struct drm_shadow_plane_state base;
> +	struct appletbdrm_fb_request *request;
> +	struct appletbdrm_fb_request_response *response;
> +	size_t request_size;
> +	size_t frames_size;
> +};
> +
> +static inline struct appletbdrm_plane_state *to_appletbdrm_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct appletbdrm_plane_state, base.base);
> +}
> +
> +static int appletbdrm_send_request(struct appletbdrm_device *adev,
> +				   struct appletbdrm_msg_request_header *request, size_t size)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
> +			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to send message (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int appletbdrm_read_response(struct appletbdrm_device *adev,
> +				    struct appletbdrm_msg_response_header *response,
> +				    size_t size, __le32 expected_response)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +	bool readiness_signal_received = false;
> +
> +retry:
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
> +			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to read response (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * The device responds to the first request sent in a particular
> +	 * timeframe after the USB device configuration is set with a readiness
> +	 * signal, in which case the response should be read again
> +	 */
> +	if (response->msg == APPLETBDRM_MSG_SIGNAL_READINESS) {
> +		if (!readiness_signal_received) {
> +			readiness_signal_received = true;
> +			goto retry;
> +		}
> +
> +		drm_err(drm, "Encountered unexpected readiness signal\n");
> +		return -EINTR;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EBADMSG;
> +	}
> +
> +	if (response->msg != expected_response) {
> +		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4cc)\n",
> +			&expected_response, &response->msg);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int appletbdrm_send_msg(struct appletbdrm_device *adev, __le32 msg)
> +{
> +	struct appletbdrm_msg_simple_request *request;
> +	int ret;
> +
> +	request = kzalloc(sizeof(*request), GFP_KERNEL);
> +	if (!request)
> +		return -ENOMEM;
> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x1512);
> +	request->header.size = cpu_to_le32(sizeof(*request) - sizeof(request->header));
> +	request->msg = msg;
> +	request->size = request->header.size;
> +
> +	ret = appletbdrm_send_request(adev, &request->header, sizeof(*request));
> +
> +	kfree(request);
> +
> +	return ret;
> +}
> +
> +static int appletbdrm_clear_display(struct appletbdrm_device *adev)
> +{
> +	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_CLEAR_DISPLAY);
> +}
> +
> +static int appletbdrm_signal_readiness(struct appletbdrm_device *adev)
> +{
> +	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_SIGNAL_READINESS);
> +}
> +
> +static int appletbdrm_get_information(struct appletbdrm_device *adev)
> +{
> +	struct appletbdrm_msg_information *info;
> +	struct drm_device *drm = &adev->drm;
> +	u8 bits_per_pixel;
> +	__le32 pixel_format;
> +	int ret;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = appletbdrm_send_msg(adev, APPLETBDRM_MSG_GET_INFORMATION);
> +	if (ret)
> +		return ret;
> +
> +	ret = appletbdrm_read_response(adev, &info->header, sizeof(*info),
> +				       APPLETBDRM_MSG_GET_INFORMATION);
> +	if (ret)
> +		goto free_info;
> +
> +	bits_per_pixel = info->bits_per_pixel;
> +	pixel_format = get_unaligned(&info->pixel_format);
> +
> +	adev->width = get_unaligned_le32(&info->width);
> +	adev->height = get_unaligned_le32(&info->height);
> +
> +	if (bits_per_pixel != APPLETBDRM_BITS_PER_PIXEL) {
> +		drm_err(drm, "Encountered unexpected bits per pixel value (%d)\n", bits_per_pixel);
> +		ret = -EINVAL;
> +		goto free_info;
> +	}
> +
> +	if (pixel_format != APPLETBDRM_PIXEL_FORMAT) {
> +		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format);
> +		ret = -EINVAL;
> +		goto free_info;
> +	}
> +
> +free_info:
> +	kfree(info);
> +
> +	return ret;
> +}
> +
> +static u32 rect_size(struct drm_rect *rect)
> +{
> +	return drm_rect_width(rect) * drm_rect_height(rect) *
> +		(BITS_TO_BYTES(APPLETBDRM_BITS_PER_PIXEL));
> +}
> +
> +static int appletbdrm_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, &adev->mode);
> +}
> +
> +static const u32 appletbdrm_primary_plane_formats[] = {
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, /* emulated */
> +};
> +
> +static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(new_plane_state);
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	size_t frames_size = 0;
> +	size_t request_size;
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
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		frames_size += struct_size((struct appletbdrm_frame *)0, buf, rect_size(&damage));
> +	}
> +
> +	if (!frames_size)
> +		return 0;
> +
> +	request_size = ALIGN(sizeof(struct appletbdrm_fb_request) +
> +		       frames_size +
> +		       sizeof(struct appletbdrm_fb_request_footer), 16);
> +
> +	appletbdrm_state->request = kzalloc(request_size, GFP_KERNEL);
> +
> +	if (!appletbdrm_state->request)
> +		return -ENOMEM;
> +
> +	appletbdrm_state->response = kzalloc(sizeof(*appletbdrm_state->response), GFP_KERNEL);
> +
> +	if (!appletbdrm_state->response)
> +		return -ENOMEM;
> +
> +	appletbdrm_state->request_size = request_size;
> +	appletbdrm_state->frames_size = frames_size;
> +
> +	return 0;
> +}
> +
> +static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
> +				   struct drm_plane_state *old_state,
> +				   struct drm_plane_state *state)
> +{
> +	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(state);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
> +	struct appletbdrm_fb_request_response *response = appletbdrm_state->response;
> +	struct appletbdrm_fb_request_footer *footer;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct appletbdrm_fb_request *request = appletbdrm_state->request;
> +	struct drm_device *drm = &adev->drm;
> +	struct appletbdrm_frame *frame;
> +	u64 timestamp = ktime_get_ns();
> +	struct drm_rect damage;
> +	size_t frames_size = appletbdrm_state->frames_size;
> +	size_t request_size = appletbdrm_state->request_size;
> +	int ret;
> +
> +	if (!frames_size)
> +		return 0;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret) {
> +		drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
> +		goto end_fb_cpu_access;
> +	}
> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x12);
> +	request->header.unk_04 = cpu_to_le32(9);
> +	request->header.size = cpu_to_le32(request_size - sizeof(request->header));
> +	request->unk_10 = cpu_to_le16(1);
> +	request->msg_id = timestamp;
> +
> +	frame = (struct appletbdrm_frame *)request->data;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		struct drm_rect dst_clip = state->dst;
> +		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(frame->buf);
> +		u32 buf_size = rect_size(&damage);
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		/*
> +		 * The coordinates need to be translated to the coordinate
> +		 * system the device expects, see the comment in
> +		 * appletbdrm_setup_mode_config
> +		 */
> +		frame->begin_x = cpu_to_le16(damage.y1);
> +		frame->begin_y = cpu_to_le16(adev->height - damage.x2);
> +		frame->width = cpu_to_le16(drm_rect_height(&damage));
> +		frame->height = cpu_to_le16(drm_rect_width(&damage));
> +		frame->buf_size = cpu_to_le32(buf_size);
> +
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_XRGB8888:
> +			drm_fb_xrgb8888_to_bgr888(&dst, NULL, &shadow_plane_state->data[0], fb, &damage, &shadow_plane_state->fmtcnv_state);
> +			break;
> +		default:
> +			drm_fb_memcpy(&dst, NULL, &shadow_plane_state->data[0], fb, &damage);
> +			break;
> +		}
> +
> +		frame = (void *)frame + struct_size(frame, buf, buf_size);
> +	}
> +
> +	footer = (struct appletbdrm_fb_request_footer *)&request->data[frames_size];
> +
> +	footer->unk_0c = cpu_to_le32(0xfffe);
> +	footer->unk_1c = cpu_to_le32(0x80001);
> +	footer->unk_34 = cpu_to_le32(0x80002);
> +	footer->unk_4c = cpu_to_le32(0xffff);
> +	footer->timestamp = cpu_to_le64(timestamp);
> +
> +	ret = appletbdrm_send_request(adev, &request->header, request_size);
> +	if (ret)
> +		goto end_fb_cpu_access;
> +
> +	ret = appletbdrm_read_response(adev, &response->header, sizeof(*response),
> +				       APPLETBDRM_MSG_UPDATE_COMPLETE);
> +	if (ret)
> +		goto end_fb_cpu_access;
> +
> +	if (response->timestamp != footer->timestamp) {
> +		drm_err(drm, "Response timestamp (%llu) doesn't match request timestamp (%llu)\n",
> +			le64_to_cpu(response->timestamp), timestamp);
> +		goto end_fb_cpu_access;
> +	}
> +
> +end_fb_cpu_access:
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
> +	return ret;
> +}
> +
> +static void appletbdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
> +						     struct drm_atomic_state *old_state)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(plane->dev);
> +	struct drm_device *drm = plane->dev;
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	appletbdrm_flush_damage(adev, old_plane_state, plane_state);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void appletbdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> +							   struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct appletbdrm_device *adev = drm_to_adev(dev);
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	appletbdrm_clear_display(adev);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void appletbdrm_primary_plane_reset(struct drm_plane *plane)
> +{
> +	struct appletbdrm_plane_state *appletbdrm_state;
> +
> +	WARN_ON(plane->state);
> +
> +	appletbdrm_state = kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
> +	if (!appletbdrm_state)
> +		return;
> +
> +	__drm_gem_reset_shadow_plane(plane, &appletbdrm_state->base);
> +}
> +
> +static struct drm_plane_state *appletbdrm_primary_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct drm_shadow_plane_state *new_shadow_plane_state;
> +	struct appletbdrm_plane_state *old_appletbdrm_state;
> +	struct appletbdrm_plane_state *appletbdrm_state;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	old_appletbdrm_state = to_appletbdrm_plane_state(plane->state);
> +	appletbdrm_state = kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
> +	if (!appletbdrm_state)
> +		return NULL;
> +
> +	/* Request and response are not duplicated and are allocated in .atomic_check */
> +	appletbdrm_state->request = NULL;
> +	appletbdrm_state->response = NULL;
> +
> +	appletbdrm_state->request_size = 0;
> +	appletbdrm_state->frames_size = 0;
> +
> +	new_shadow_plane_state = &appletbdrm_state->base;
> +
> +	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
> +
> +	return &new_shadow_plane_state->base;
> +}
> +
> +static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane,
> +						   struct drm_plane_state *state)
> +{
> +	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(state);
> +
> +	kfree(appletbdrm_state->request);
> +	kfree(appletbdrm_state->response);
> +
> +	__drm_gem_destroy_shadow_plane_state(&appletbdrm_state->base);
> +
> +	kfree(appletbdrm_state);
> +}
> +
> +static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = appletbdrm_primary_plane_helper_atomic_check,
> +	.atomic_update = appletbdrm_primary_plane_helper_atomic_update,
> +	.atomic_disable = appletbdrm_primary_plane_helper_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs appletbdrm_primary_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.reset = appletbdrm_primary_plane_reset,
> +	.atomic_duplicate_state = appletbdrm_primary_plane_duplicate_state,
> +	.atomic_destroy_state = appletbdrm_primary_plane_destroy_state,
> +	.destroy = drm_plane_cleanup,
> +};
> +
> +static enum drm_mode_status appletbdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +							  const struct drm_display_mode *mode)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &adev->mode);
> +}
> +
> +static const struct drm_mode_config_funcs appletbdrm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_connector_funcs appletbdrm_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.destroy = drm_connector_cleanup,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +};
> +
> +static const struct drm_connector_helper_funcs appletbdrm_connector_helper_funcs = {
> +	.get_modes = appletbdrm_connector_helper_get_modes,
> +};
> +
> +static const struct drm_crtc_helper_funcs appletbdrm_crtc_helper_funcs = {
> +	.mode_valid = appletbdrm_crtc_helper_mode_valid,
> +};
> +
> +static const struct drm_crtc_funcs appletbdrm_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs appletbdrm_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static struct drm_gem_object *appletbdrm_driver_gem_prime_import(struct drm_device *dev,
> +								 struct dma_buf *dma_buf)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(dev);
> +
> +	if (!adev->dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return drm_gem_prime_import_dev(dev, dma_buf, adev->dev);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
> +
> +static const struct drm_driver appletbdrm_drm_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.gem_prime_import	= appletbdrm_driver_gem_prime_import,
> +	.name			= "appletbdrm",
> +	.desc			= "Apple Touch Bar DRM Driver",
> +	.major			= 1,
> +	.minor			= 0,
> +	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops			= &appletbdrm_drm_fops,
> +};
> +
> +static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
> +{
> +	struct drm_connector *connector = &adev->connector;
> +	struct drm_plane *primary_plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_device *drm = &adev->drm;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize mode configuration\n");
> +		return ret;
> +	}
> +
> +	primary_plane = &adev->primary_plane;
> +	ret = drm_universal_plane_init(drm, primary_plane, 0,
> +				       &appletbdrm_primary_plane_funcs,
> +				       appletbdrm_primary_plane_formats,
> +				       ARRAY_SIZE(appletbdrm_primary_plane_formats),
> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize universal plane object\n");
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	crtc = &adev->crtc;
> +	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> +					&appletbdrm_crtc_funcs, NULL);
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize CRTC object\n");
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
> +
> +	encoder = &adev->encoder;
> +	ret = drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize encoder\n");
> +		return ret;
> +	}
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/*
> +	 * The coordinate system used by the device is different from the
> +	 * coordinate system of the framebuffer in that the x and y axes are
> +	 * swapped, and that the y axis is inverted; so what the device reports
> +	 * as the height is actually the width of the framebuffer and vice
> +	 * versa
> +	 */
> +	drm->mode_config.max_width = max(adev->height, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	drm->mode_config.max_height = max(adev->width, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +	drm->mode_config.preferred_depth = APPLETBDRM_BITS_PER_PIXEL;
> +	drm->mode_config.funcs = &appletbdrm_mode_config_funcs;
> +
> +	adev->mode = (struct drm_display_mode) {
> +		DRM_MODE_INIT(60, adev->height, adev->width,
> +			      DRM_MODE_RES_MM(adev->height, 218),
> +			      DRM_MODE_RES_MM(adev->width, 218))
> +	};
> +
> +	ret = drm_connector_init(drm, connector,
> +				 &appletbdrm_connector_funcs, DRM_MODE_CONNECTOR_USB);
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
> +
> +	ret = drm_connector_set_panel_orientation(connector,
> +						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
> +	if (ret) {
> +		drm_err(drm, "Failed to set panel orientation\n");
> +		return ret;
> +	}
> +
> +	connector->display_info.non_desktop = true;
> +	ret = drm_object_property_set_value(&connector->base,
> +					    drm->mode_config.non_desktop_property, true);
> +	if (ret) {
> +		drm_err(drm, "Failed to set non-desktop property\n");
> +		return ret;
> +	}
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +
> +	if (ret) {
> +		drm_err(drm, "Failed to initialize simple display pipe\n");
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	return 0;
> +}
> +
> +static int appletbdrm_probe(struct usb_interface *intf,
> +			    const struct usb_device_id *id)
> +{
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +	struct device *dev = &intf->dev;
> +	struct appletbdrm_device *adev;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find bulk endpoints\n");
> +
> +	adev = devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdrm_device, drm);
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
> +
> +	adev->dev = dev;
> +	adev->in_ep = bulk_in->bEndpointAddress;
> +	adev->out_ep = bulk_out->bEndpointAddress;
> +
> +	drm = &adev->drm;
> +
> +	usb_set_intfdata(intf, adev);
> +
> +	ret = appletbdrm_get_information(adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get display information\n");
> +
> +	ret = appletbdrm_signal_readiness(adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to signal readiness\n");
> +
> +	ret = appletbdrm_setup_mode_config(adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup mode config\n");
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
> +
> +	ret = appletbdrm_clear_display(adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to clear display\n");
> +
> +	return 0;
> +}
> +
> +static void appletbdrm_disconnect(struct usb_interface *intf)
> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +	struct drm_device *drm = &adev->drm;
> +
> +	put_device(adev->dev);
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static void appletbdrm_shutdown(struct usb_interface *intf)
> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +
> +	/*
> +	 * The framebuffer needs to be cleared on shutdown since its content
> +	 * persists across boots
> +	 */
> +	drm_atomic_helper_shutdown(&adev->drm);
> +}
> +
> +static const struct usb_device_id appletbdrm_usb_id_table[] = {
> +	{ USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, appletbdrm_usb_id_table);
> +
> +static struct usb_driver appletbdrm_usb_driver = {
> +	.name		= "appletbdrm",
> +	.probe		= appletbdrm_probe,
> +	.disconnect	= appletbdrm_disconnect,
> +	.shutdown	= appletbdrm_shutdown,
> +	.id_table	= appletbdrm_usb_id_table,
> +};
> +module_usb_driver(appletbdrm_usb_driver);
> +
> +MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
> +MODULE_DESCRIPTION("Apple Touch Bar DRM Driver");
> +MODULE_LICENSE("GPL");

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

