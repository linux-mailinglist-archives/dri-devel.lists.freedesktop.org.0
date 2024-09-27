Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE82987FB5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622C10E1E8;
	Fri, 27 Sep 2024 07:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QWIvdKLw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZ7uIQcr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hrfbeLVZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="boPV58zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8E710E1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:48:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD3B621B8B;
 Fri, 27 Sep 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727423324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=31Bs+Sopjn3p/wd8l/ak9QCyB6OIIIxFziudZc1S99E=;
 b=QWIvdKLwERAqHPfgCcpwweeb+lux2bPtwB3xQP4kM1z8igKofiku187leleyhfphVfHA0m
 FMFuZniDrC9L22/YikvCCd87GyU6vCGFqt8eyTf/7rQud/7P2rmEowJ8DwCvYePrQo1WHI
 2E3WanZlOtKo6w7mzfgslU1S/8vUa7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727423324;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=31Bs+Sopjn3p/wd8l/ak9QCyB6OIIIxFziudZc1S99E=;
 b=IZ7uIQcrBNloFESHHX6C7MQ/cW8FLzvxGlRIarzSe8tsnK0Nqlyh0d8aI1AA3l1RMRy/Eb
 PZIPVqoMy3gUfgAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hrfbeLVZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=boPV58zk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727423323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=31Bs+Sopjn3p/wd8l/ak9QCyB6OIIIxFziudZc1S99E=;
 b=hrfbeLVZNaJflqJp8Kp3bS1H49uXVvQf7uGLDpNL0MU0F0+L0w5O7QcyQXsQIyCuyT9aaG
 BmdnH5eugsMjr4sC/8xRuGsYcbPjtxOho2wc93rDLshjsE4GlfXS4m1Y7Grw9lyy6B7o/K
 1bQv0LMJenVFsppo3HW1x4KBo9gjPGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727423323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=31Bs+Sopjn3p/wd8l/ak9QCyB6OIIIxFziudZc1S99E=;
 b=boPV58zkexEJJUFBrRYQSb1Mv89533mltilLTYYtKWJ0fr/3Qhyh4/kvjEhPdA9uf0ZpTz
 PLG4nqTrIKrympDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 631F213A73;
 Fri, 27 Sep 2024 07:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HIMnFltj9mb0JwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 07:48:43 +0000
Message-ID: <8d0296fe-536f-4a9a-bd9e-624bb4cd8703@suse.de>
Date: Fri, 27 Sep 2024 09:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 "bentiss@kernel.org" <bentiss@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas@t-8ch.de>
Cc: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
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
In-Reply-To: <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD3B621B8B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[live.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,t-8ch.de];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 17.08.24 um 13:52 schrieb Aditya Garg:
> From: Kerem Karabay <kekrby@gmail.com>
>
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed. This commit adds support for the display
> functionality of the second configuration.
>
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>
> Credit goes to @imbushuo on GitHub for reverse engineering most of the
> protocol.
>
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>   MAINTAINERS                       |   6 +
>   drivers/gpu/drm/tiny/Kconfig      |  12 +
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/appletbdrm.c | 624 ++++++++++++++++++++++++++++++
>   4 files changed, 643 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8766f3e5e..2665e6c57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6889,6 +6889,12 @@ S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/sun4i/sun8i*
>   
> +DRM DRIVER FOR APPLE TOUCH BARS
> +M:	Kerem Karabay <kekrby@gmail.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tiny/appletbdrm.c
> +
>   DRM DRIVER FOR ARM PL111 CLCD
>   S:	Orphan
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f6889f649..559a97bce 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -1,5 +1,17 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> +config DRM_APPLETBDRM
> +	tristate "DRM support for Apple Touch Bars"
> +	depends on DRM && USB && MMU
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER

nit: Selects sorted alphabetically.

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
> index 76dde89a0..9a1b412e7 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> +obj-$(CONFIG_DRM_APPLETBDRM)		+= appletbdrm.o
>   obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
>   obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
>   obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> new file mode 100644
> index 000000000..b9440ce00
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -0,0 +1,624 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Touch Bar DRM Driver
> + *
> + * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <asm/unaligned.h>
> +
> +#include <linux/usb.h>
> +#include <linux/module.h>

Include statements should be sorted alphabetically.

> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>

Sorting.

> +
> +#define _APPLETBDRM_FOURCC(s)		(((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
> +#define APPLETBDRM_FOURCC(s)		_APPLETBDRM_FOURCC(#s)
> +
> +#define APPLETBDRM_PIXEL_FORMAT		APPLETBDRM_FOURCC(RGBA) /* The actual format is BGR888 */

Pleasedon't call it FOURCC (because it isn't). Rather do something like

#define __APPLETBDRM_MSG_STR4(str4)    ((__le32 __force) /* bit shifting 
here */)
#define __APPLETBDRM_MSG_TOK4(tok4)    __APPLETBDRM_MSG_STR4(#tok4)

(two underscores)

> +#define APPLETBDRM_BITS_PER_PIXEL	24
> +
> +#define APPLETBDRM_MSG_CLEAR_DISPLAY	APPLETBDRM_FOURCC(CLRD)
> +#define APPLETBDRM_MSG_GET_INFORMATION	APPLETBDRM_FOURCC(GINF)
> +#define APPLETBDRM_MSG_UPDATE_COMPLETE	APPLETBDRM_FOURCC(UDCL)
> +#define APPLETBDRM_MSG_SIGNAL_READINESS	APPLETBDRM_FOURCC(REDY)

Maybe infix all such constants with _MSG_ or _PROTO_ so that it's clear 
that these are part of the device protocol.

I'd also change the style a bit to something like
APPLETBDRM_MSG_REDY __APPLETBDRM_MSG_TOK4(REDY) /* device signals 
readiness */

> +
> +#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
> +
> +#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, drm)
> +#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dev))
> +
> +struct appletbdrm_device {
> +	struct device *dev;
> +
> +	u8 in_ep;
> +	u8 out_ep;
> +
> +	u32 width;
> +	u32 height;

For software state, it's common to use regular types (unsigned int) 
without a specific size.

> +
> +	struct drm_device drm;
> +	struct drm_display_mode mode;
> +	struct drm_connector connector;
> +	struct drm_simple_display_pipe pipe;

Simple-display pipe is deprecated. Please don't add any new drivers 
using it. You can easily replace it by taking its code and data 
structures and inline them into the driver. Change the naming to fit the 
driver and it should be good.

> +
> +	bool readiness_signal_received;
> +};
> +
> +struct appletbdrm_request_header {
> +	__le16 unk_00;
> +	__le16 unk_02;
> +	__le32 unk_04;
> +	__le32 unk_08;
> +	__le32 size;
> +} __packed;
> +
> +struct appletbdrm_response_header {
> +	u8 unk_00[16];
> +	u32 msg;

These u32 are in host byte order. The protocol uses little endian? Then 
it's __le32. My _MSG_STR4 macro above adds a forced cast to __le32 already.

> +} __packed;
> +
> +struct appletbdrm_simple_request {
> +	struct appletbdrm_request_header header;
> +	u32 msg;

Same here and below.

> +	u8 unk_14[8];
> +	__le32 size;
> +} __packed;
> +
> +struct appletbdrm_information {
> +	struct appletbdrm_response_header header;
> +	u8 unk_14[12];
> +	__le32 width;
> +	__le32 height;
> +	u8 bits_per_pixel;
> +	__le32 bytes_per_row;
> +	__le32 orientation;
> +	__le32 bitmap_info;
> +	u32 pixel_format;
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
> +	struct appletbdrm_request_header header;
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
> +	struct appletbdrm_response_header header;
> +	u8 unk_14[12];
> +	__le64 timestamp;
> +} __packed;

You should probably move all these structs and the related constants to 
the top of the file and add an _msg_ infix. So it's clear that this is 
protocol and not DRM driver state.

> +
> +static int appletbdrm_send_request(struct appletbdrm_device *adev,
> +				   struct appletbdrm_request_header *request, size_t size)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
> +			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to send message (%pe)\n", ERR_PTR(ret));

Is there a reason for %pe? %d with ret should be fine. (?)

> +		return ret;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EIO;
> +	}
> +
> +	return ret;
> +}
> +
> +static int appletbdrm_read_response(struct appletbdrm_device *adev,
> +				    struct appletbdrm_response_header *response,
> +				    size_t size, u32 expected_response)
> +{
> +	struct usb_device *udev = adev_to_udev(adev);
> +	struct drm_device *drm = &adev->drm;
> +	int ret, actual_size;
> +
> +retry:
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
> +			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
> +	if (ret) {
> +		drm_err(drm, "Failed to read response (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	/*
> +	 * The device responds to the first request sent in a particular
> +	 * timeframe after the USB device configuration is set with a readiness
> +	 * signal, in which case the response should be read again
> +	 */

IIUC the device signals (1) readiness at certain intervals? Or (2) just 
at the beginning after appletbdrm_signal_readiness() If (1), I'd make 
readiness_signal_received a local variable. If you receive REDY try 
again once. No need for per-driver state. If (2), wait for REDY after 
appletbdrm_signal_readiness() and remove the whole logic form this function.
> +	if (response->msg == APPLETBDRM_MSG_SIGNAL_READINESS) {
> +		if (!adev->readiness_signal_received) {
> +			adev->readiness_signal_received = true;
> +			goto retry;
> +		}
> +
> +		drm_err(drm, "Encountered unexpected readiness signal\n");
> +		return -EIO;
> +	}
> +
> +	if (actual_size != size) {
> +		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
> +			actual_size, size);
> +		return -EIO;
> +	}
> +
> +	if (response->msg != expected_response) {
> +		drm_err(drm, "Unexpected response from device (expected %p4ch found %p4ch)\n",
> +			&expected_response, &response->msg);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int appletbdrm_send_msg(struct appletbdrm_device *adev, u32 msg)
> +{
> +	struct appletbdrm_simple_request *request;
> +	int ret;
> +
> +	request = kzalloc(sizeof(*request), GFP_KERNEL);
> +	if (!request)
> +		return -ENOMEM;
> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x1512);

Magic numbers? Do you know what they mean?

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
> +	struct appletbdrm_information *info;
> +	struct drm_device *drm = &adev->drm;
> +	u8 bits_per_pixel;
> +	u32 pixel_format;
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
> +		drm_err(drm, "Encountered unknown pixel format (%p4ch)\n", &pixel_format);
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
> +	return drm_rect_width(rect) * drm_rect_height(rect) * (APPLETBDRM_BITS_PER_PIXEL / 8);
> +}
> +
> +static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
> +				   struct drm_plane_state *old_state,
> +				   struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
> +	struct appletbdrm_fb_request_response *response;
> +	struct appletbdrm_fb_request_footer *footer;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct appletbdrm_fb_request *request;
> +	struct drm_device *drm = &adev->drm;
> +	struct appletbdrm_frame *frame;
> +	u64 timestamp = ktime_get_ns();
> +	struct drm_rect damage;
> +	size_t frames_size = 0;
> +	size_t request_size;
> +	int ret;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		frames_size += struct_size(frame, buf, rect_size(&damage));
> +	}
> +
> +	if (!frames_size)
> +		return 0;
> +
> +	request_size = ALIGN(sizeof(*request) + frames_size + sizeof(*footer), 16);
> +
> +	request = kzalloc(request_size, GFP_KERNEL);
> +	if (!request)
> +		return -ENOMEM;
> +
> +	response = kzalloc(sizeof(*response), GFP_KERNEL);
> +	if (!response) {
> +		ret = -ENOMEM;
> +		goto free_request;
> +	}
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret) {
> +		drm_err(drm, "Failed to start CPU framebuffer access (%pe)\n", ERR_PTR(ret));
> +		goto free_response;
> +	}
> +
> +	request->header.unk_00 = cpu_to_le16(2);
> +	request->header.unk_02 = cpu_to_le16(0x12);
> +	request->header.unk_04 = cpu_to_le32(9);
> +	request->header.size = cpu_to_le32(request_size - sizeof(request->header));
> +	request->unk_10 = cpu_to_le16(1);
> +	request->msg_id = timestamp & 0xff;
> +
> +	frame = (struct appletbdrm_frame *)request->data;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(frame->buf);
> +		u32 buf_size = rect_size(&damage);
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
> +		ret = drm_fb_blit(&dst, NULL, DRM_FORMAT_BGR888,
> +				  &shadow_plane_state->data[0], fb, &damage, &shadow_plane_state->fmtcnv_state);
> +		if (ret) {
> +			drm_err(drm, "Failed to copy damage clip (%pe)\n", ERR_PTR(ret));
> +			goto end_fb_cpu_access;
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
> +free_response:
> +	kfree(response);
> +free_request:
> +	kfree(request);
> +
> +	return ret;
> +}
> +
> +static int appletbdrm_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, &adev->mode);
> +}
> +
> +static enum drm_mode_status appletbdrm_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +						       const struct drm_display_mode *mode)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct appletbdrm_device *adev = drm_to_adev(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &adev->mode);
> +}
> +
> +static void appletbdrm_pipe_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct appletbdrm_device *adev = drm_to_adev(pipe->crtc.dev);
> +	int idx;
> +
> +	if (!drm_dev_enter(&adev->drm, &idx))
> +		return;
> +
> +	appletbdrm_clear_display(adev);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void appletbdrm_pipe_update(struct drm_simple_display_pipe *pipe,
> +				   struct drm_plane_state *old_state)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct appletbdrm_device *adev = drm_to_adev(crtc->dev);
> +	int idx;
> +
> +	if (!crtc->state->active || !drm_dev_enter(&adev->drm, &idx))
> +		return;
> +
> +	appletbdrm_flush_damage(adev, old_state, pipe->plane.state);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static const u32 appletbdrm_formats[] = {
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, /* emulated */
> +};
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
> +static const struct drm_simple_display_pipe_funcs appletbdrm_pipe_funcs = {
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +	.update = appletbdrm_pipe_update,
> +	.disable = appletbdrm_pipe_disable,
> +	.mode_valid = appletbdrm_pipe_mode_valid,
> +};
> +
> +DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
> +
> +static const struct drm_driver appletbdrm_drm_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.name			= "appletbdrm",
> +	.desc			= "Apple Touch Bar DRM Driver",
> +	.date			= "20230910",
> +	.major			= 1,
> +	.minor			= 0,
> +	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops			= &appletbdrm_drm_fops,
> +};
> +
> +static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
> +{
> +	struct drm_connector *connector = &adev->connector;
> +	struct drm_device *drm = &adev->drm;
> +	struct device *dev = adev->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize mode configuration\n");
> +
> +	/*
> +	 * The coordinate system used by the device is different from the
> +	 * coordinate system of the framebuffer in that the x and y axes are
> +	 * swapped, and that the y axis is inverted; so what the device reports
> +	 * as the height is actually the width of the framebuffer and vice
> +	 * versa
> +	 */
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
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
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize connector\n");
> +
> +	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
> +
> +	ret = drm_connector_set_panel_orientation(connector,
> +						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set panel orientation\n");
> +
> +	connector->display_info.non_desktop = true;
> +	ret = drm_object_property_set_value(&connector->base,
> +					    drm->mode_config.non_desktop_property, true);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set non-desktop property\n");
> +
> +	ret = drm_simple_display_pipe_init(drm, &adev->pipe, &appletbdrm_pipe_funcs,
> +					   appletbdrm_formats, ARRAY_SIZE(appletbdrm_formats),
> +					   NULL, &adev->connector);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize simple display pipe\n");
> +
> +	drm_plane_enable_fb_damage_clips(&adev->pipe.plane);
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);

This line belongs into the caller.

I'll do another review for the next iteration.

Best regards
Thomas

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
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
> +	ret = appletbdrm_clear_display(adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to clear display\n");
> +
> +	return appletbdrm_setup_mode_config(adev);
> +}
> +
> +static void appletbdrm_disconnect(struct usb_interface *intf)
> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +	struct drm_device *drm = &adev->drm;
> +
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

