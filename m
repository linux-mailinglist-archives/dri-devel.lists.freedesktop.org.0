Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFBA4218C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA4D10E54A;
	Mon, 24 Feb 2025 13:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D9ck5G/X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OXCSU9hY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xOFo32SS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7trhu6lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9010E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 09:10:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BD7921175;
 Mon, 24 Feb 2025 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740388200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hFXKCUTAj/SxGww4ujq+9ZtPhd+9V7JhGzfaSTiLcg8=;
 b=D9ck5G/XMuzLWIuV81912+UVHXaao2N1q9v/bTcdyG5yVT+bO0FQZlHGecj5zdBvKH5ahu
 bXNwwZa0nqsRIu255TX1no+rIhicEkSQaGDtK3+vGle/Y4x9XZfqGcCDweWsF5UoN7Ncnh
 eGJDxDRpX0FS9ydVRkHoVAebNm9rwiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740388200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hFXKCUTAj/SxGww4ujq+9ZtPhd+9V7JhGzfaSTiLcg8=;
 b=OXCSU9hYFwOox+w25rwDtTjg8gJcIvVCGPNzu6tO17H67Wp8+VpW4t+/FyCdxO34+Iiqye
 hsKP3ND44QoLAFAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xOFo32SS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7trhu6lg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740388199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hFXKCUTAj/SxGww4ujq+9ZtPhd+9V7JhGzfaSTiLcg8=;
 b=xOFo32SSLxlbu2xOfdRkAM2HoeciDQjGBJM8+rAjKyWIk/lppFhITJHHec8rqUGuYVTzUd
 zqOPQAPQtoOoScKR+wF+h1emPrFUa+RGzdfhiPGksVAxiKmRIHiDsKe/H5KJsllOiTiBUX
 00kXvR2ln0mNAIaJfSRXsmNe/ms5fOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740388199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hFXKCUTAj/SxGww4ujq+9ZtPhd+9V7JhGzfaSTiLcg8=;
 b=7trhu6lgMXocbJ/ucAngkJWAWW5XU6o/FlIqYghkIumm4r1U+/DYyBBflG4XB102l0j+n8
 qJNvXXqJCsNobhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3128C13332;
 Mon, 24 Feb 2025 09:09:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GosbCmY3vGfHXgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Feb 2025 09:09:58 +0000
Message-ID: <d6fbaa49-ae7a-4be8-8109-791a168ba249@suse.de>
Date: Mon, 24 Feb 2025 10:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>, "pmladek@suse.com"
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com"
 <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
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
In-Reply-To: <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0BD7921175
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[live.com,suse.com,goodmis.org,linux.intel.com,rasmusvillemoes.dk,chromium.org,lwn.net,kernel.org,gmail.com,ffwll.ch,linux-foundation.org,canonical.com,perches.com,linaro.org,amd.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[32];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 FREEMAIL_CC(0.00)[gmail.com,kodeit.net,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,marcan.st,armlinux.org.uk,lists.linux.dev,svenpeter.dev,jannau.net];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email, suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Hi

Am 21.02.25 um 12:37 schrieb Aditya Garg:
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
> Credit goes to Ben (Bingxing) Wang on GitHub [1] for reverse engineering
> most of the protocol.
>
> [1]: https://github.com/imbushuo/DFRDisplayKm
>
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
>   MAINTAINERS                       |   7 +
>   drivers/gpu/drm/tiny/Kconfig      |  14 +
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/appletbdrm.c | 806 ++++++++++++++++++++++++++++++
>   4 files changed, 828 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efee40ea5..43fafaab3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7148,6 +7148,13 @@ S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/sun4i/sun8i*
>   
> +DRM DRIVER FOR APPLE TOUCH BARS
> +M:	Aun-Ali Zaidi <admin@kodeit.net>

You cannot put someone else here. Who is that?

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

Putting this driver into tiny is ok. It's the preferred place for 
single-file DRM drivers like this one.

> new file mode 100644
> index 000000000..a17a3ecc3
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -0,0 +1,806 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Touch Bar DRM Driver
> + *
> + * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
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

This field should not be here. The Linux device is already available at 
drm.dev.

> +	struct device *dmadev;
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
> +	return ret;
> +}
> +
> +static int appletbdrm_read_response(struct appletbdrm_device *adev,
> +				    struct appletbdrm_msg_response_header *response,
> +				    size_t size, u32 expected_response)
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
> +	else if (!new_plane_state->visible)
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

AFAIU you're preallocating the memory for the drawing commands. Makes 
sense to me.

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
> +	request->msg_id = timestamp & 0xff;
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

And here you're building the drawing commands from the allocated frame 
memory. Also makes sense.

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
> +	appletbdrm_state = kmemdup(old_appletbdrm_state, sizeof(*appletbdrm_state), GFP_KERNEL);
> +	if (!appletbdrm_state)
> +		return NULL;
> +
> +	/* Request and response are not duplicated and are allocated in .atomic_check */
> +	appletbdrm_state->request = NULL;
> +	appletbdrm_state->response = NULL;

You also have to clear the frame and request size, I think.

Duplicated state will be processed by the atomic_check before being 
used. So you'll have a chance of recomputing these temporary buffers.

Simply allocate with kzalloc instead of kmemdup() and you'll be fine.

> +
> +	new_shadow_plane_state = &appletbdrm_state->base;
> +
> +	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);

This call is important to do.

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
> +	if (!adev->dmadev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return drm_gem_prime_import_dev(dev, dma_buf, adev->dmadev);
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
> +	struct device *dev = adev->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize mode configuration\n");

Use drm_err() here. It does the right thing. We don't have a 
drm_dev_probe() yet, but you're discouraged from useing the dev_() print 
helpers.

Same below.

> +
> +	primary_plane = &adev->primary_plane;
> +	ret = drm_universal_plane_init(drm, primary_plane, 0,
> +				       &appletbdrm_primary_plane_funcs,
> +				       appletbdrm_primary_plane_formats,
> +				       ARRAY_SIZE(appletbdrm_primary_plane_formats),
> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize universal plane object\n");
> +	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	crtc = &adev->crtc;
> +	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> +					&appletbdrm_crtc_funcs, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize CRTC object\n");
> +	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
> +
> +	encoder = &adev->encoder;
> +	ret = drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize encoder\n");
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
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

No need to clear this to zero.

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
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize simple display pipe\n");
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

You have to put_device(dmadev) to release the DMA device.

Best regards
Thomas

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

