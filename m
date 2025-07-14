Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE473B039A6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F710E41A;
	Mon, 14 Jul 2025 08:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IhfFxUr6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uNwNSQLz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R6I42vnQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="22LLvSLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79B10E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:38:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF0ED216E0;
 Mon, 14 Jul 2025 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752482288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Np2xl7tiPAGQMHbGhCrPb+KLVVe4fIcmiRBspHh2fo=;
 b=IhfFxUr6IVQKhe+QdRLi1rL31IGdHG7aZ+nBQrKhiLQwfHOp/AXK9QbKV4rgo5oWDb4Evr
 wRYahCPNEFb0vsfJ8BuGOW2BlwJsLwB3q/2A/bMjl1pVSGEV5VNawBpsz8Q6w9uuzZTFkF
 nJGuLD4ahlntVprL1BzwfcsbS4qeR5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752482288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Np2xl7tiPAGQMHbGhCrPb+KLVVe4fIcmiRBspHh2fo=;
 b=uNwNSQLzDxN6wOzWYT8ZZh69Uu+4qM5X4RtsIFB6P4S3bSmZDfrydd53/CwU50yPykrvFS
 9HDuKD+vMcByf3Bg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R6I42vnQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=22LLvSLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752482286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Np2xl7tiPAGQMHbGhCrPb+KLVVe4fIcmiRBspHh2fo=;
 b=R6I42vnQneyqK6p2ZOshJ1erBAkLLr7/FiH6whHDMU8toLADi3Ra1KyiX9wE633vz9z9IS
 JvHF5giJZejgurmauUtCXlI73Z4SK+ImY4b3ad1s83yIfuqBjMixlIkikhxK9koKmKHpHg
 XfHSJ19vKoaBwcdpdclQUm6WdZGtrVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752482286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Np2xl7tiPAGQMHbGhCrPb+KLVVe4fIcmiRBspHh2fo=;
 b=22LLvSLIFwsUuLzbZV1R85oeDTmxCHD3j5ZX1OxmSIl/9s3xpK+WFeRSGx2IftLUSyIu0H
 9HcmxZePU8IfOjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80BF213A60;
 Mon, 14 Jul 2025 08:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id laYYHu7BdGgDMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 08:38:06 +0000
Message-ID: <fee2a743-d3e4-46b4-812f-05c3cc3a46ae@suse.de>
Date: Mon, 14 Jul 2025 10:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink
 panel
To: LiangCheng Wang <zaq14760@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
 <20250714-drm-v2-3-5d1a2e12796c@gmail.com>
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
In-Reply-To: <20250714-drm-v2-3-5d1a2e12796c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EF0ED216E0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,ffwll.ch,linaro.org,amd.com];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[dt];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, gitlab.freedesktop.org:url, suse.de:dkim,
 suse.de:mid]
X-Spam-Score: -3.01
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

Am 14.07.25 um 04:59 schrieb LiangCheng Wang:
> Introduce a DRM driver for the Mayqueen Pixpaper e-ink display panel,
> which is controlled via SPI. The driver supports a 122x250 resolution
> display with XRGB8888 format.
>
> Also, add a MAINTAINERS entry for the Pixpaper driver.
>
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
>   MAINTAINERS                     |   6 +
>   drivers/gpu/drm/tiny/Kconfig    |  15 +
>   drivers/gpu/drm/tiny/Makefile   |   1 +
>   drivers/gpu/drm/tiny/pixpaper.c | 777 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 799 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fad6cb025a1918beec113b576cf28b76151745ef..0613f32ef8a702e508c9a2e51853f8fe6a38ba42 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7756,6 +7756,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/repaper.txt
>   F:	drivers/gpu/drm/tiny/repaper.c
>   
> +DRM DRIVER FOR PIXPAPER E-INK PANEL
> +M:	LiangCheng Wang <zaq14760@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
> +F:	drivers/gpu/drm/tiny/pixpaper.c
> +
>   DRM DRIVER FOR QEMU'S CIRRUS DEVICE
>   M:	Dave Airlie <airlied@redhat.com>
>   M:	Gerd Hoffmann <kraxel@redhat.com>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 06e54694a7f2fe1649e1886f039926b24f698e0d..f9b814e87348cad1946dd5e2ff54d304100ef264 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -164,6 +164,21 @@ config TINYDRM_MI0283QT
>   	  DRM driver for the Multi-Inno MI0283QT display panel
>   	  If M is selected the module will be called mi0283qt.
>   
> +config TINYDRM_PIXPAPER

We don't use the TINYDRM_ prefix any longer. Just call it DRM_PIXPAPER.

> +	tristate "DRM support for PIXPAPER display panels"
> +	depends on DRM && SPI

> +	select DRM_CLIENT_SELECTION
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER

Alphabetical sorting please.

> +	help
> +	  DRM driver for the Mayqueen Pixpaper e-ink display panel.
> +
> +	  This driver supports small e-paper displays connected over SPI,
> +	  with a resolution of 122x250 and XRGB8888 framebuffer format.
> +	  It is intended for low-power embedded applications.
> +
> +	  If M is selected, the module will be built as pixpaper.ko.
> +
>   config TINYDRM_REPAPER
>   	tristate "DRM support for Pervasive Displays RePaper panels (V231)"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 4a9ff61ec25420e2c0a648c04eaab7ca25dd5407..40d613b57f5ee990dbf170d69939a39546be21b7 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -12,5 +12,6 @@ obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
>   obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
>   obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
>   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
> +obj-$(CONFIG_TINYDRM_PIXPAPER)		+= pixpaper.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
> diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f134cacbb3d2b2792b94fc37cddb0b264348f192
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/pixpaper.c
> @@ -0,0 +1,777 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DRM driver for PIXPAPER e-ink panel
> + *
> + * Author: LiangCheng Wang <zaq14760@gmail.com>,
> + */
> +#include <drm/clients/drm_client_setup.h>
> +

Blank line before this include, not after.

> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/spi/spi.h>

The <linux/> includes go before the <drm/> ones.

> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +#define PIXPAPER_WIDTH 122
> +#define PIXPAPER_HEIGHT 250
> +
> +#define PANEL_BUFFER_WIDTH 128
> +#define PANEL_BUFFER_TWO_BYTES_PER_ROW (PANEL_BUFFER_WIDTH / 4)
> +
> +#define PIXPAPER_SPI_SPEED_DEFAULT 1000000
> +
> +#define PIXPAPER_CMD_PANEL_SETTING 0x00
> +#define PIXPAPER_CMD_POWER_SETTING 0x01
> +#define PIXPAPER_CMD_POWER_OFF 0x02
> +#define PIXPAPER_CMD_POWER_OFF_SEQUENCE 0x03
> +#define PIXPAPER_CMD_POWER_ON 0x04
> +#define PIXPAPER_CMD_BOOSTER_SOFT_START 0x06
> +#define PIXPAPER_CMD_DEEP_SLEEP 0x07
> +#define PIXPAPER_CMD_DATA_START_TRANSMISSION 0x10
> +#define PIXPAPER_CMD_DISPLAY_REFRESH 0x12
> +#define PIXPAPER_CMD_PLL_CONTROL 0x30
> +#define PIXPAPER_CMD_TEMP_SENSOR_CALIB 0x41
> +#define PIXPAPER_CMD_UNKNOWN_4D 0x4D
> +#define PIXPAPER_CMD_VCOM_INTERVAL 0x50
> +#define PIXPAPER_CMD_TCON_SETTING 0x60
> +#define PIXPAPER_CMD_RESOLUTION_SETTING 0x61
> +#define PIXPAPER_CMD_GATE_SOURCE_START 0x65
> +#define PIXPAPER_CMD_UNKNOWN_B4 0xB4
> +#define PIXPAPER_CMD_UNKNOWN_B5 0xB5
> +#define PIXPAPER_CMD_CASCADE_SETTING 0xE0
> +#define PIXPAPER_CMD_POWER_SAVING 0xE3
> +#define PIXPAPER_CMD_AUTO_MEASURE_VCOM 0xE7
> +#define PIXPAPER_CMD_UNKNOWN_E9 0xE9
> +
> +static int pixpaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *state);
> +static int pixpaper_plane_helper_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_state *state);
> +static void pixpaper_crtc_atomic_enable(struct drm_crtc *crtc,
> +					struct drm_atomic_state *state);
> +static void pixpaper_crtc_atomic_disable(struct drm_crtc *crtc,
> +					 struct drm_atomic_state *state);
> +static void pixpaper_plane_atomic_update(struct drm_plane *plane,
> +					 struct drm_atomic_state *state);
> +static int pixpaper_connector_get_modes(struct drm_connector *connector);

Please don't declare those functions. Interleave the implementation with 
the structs that use them.

> +
> +struct pixpaper_panel {
> +	struct drm_device drm;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	struct spi_device *spi;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *busy;
> +	struct gpio_desc *dc;
> +};
> +
> +static const struct drm_plane_funcs pixpaper_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const struct drm_plane_helper_funcs pixpaper_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = pixpaper_plane_helper_atomic_check,
> +	.atomic_update = pixpaper_plane_atomic_update,

For example, these functions should be implemented  right before 
declaring the global variable; same goes for the others.

> +};
> +
> +static const struct drm_crtc_funcs pixpaper_crtc_funcs = {
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_crtc_helper_funcs pixpaper_crtc_helper_funcs = {
> +	.atomic_check = pixpaper_crtc_helper_atomic_check,
> +	.atomic_enable = pixpaper_crtc_atomic_enable,
> +	.atomic_disable = pixpaper_crtc_atomic_disable,
> +};
> +
> +static const struct drm_encoder_funcs pixpaper_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static const struct drm_connector_funcs pixpaper_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_connector_helper_funcs pixpaper_connector_helper_funcs = {
> +	.get_modes = pixpaper_connector_get_modes,
> +};
> +
> +static int pixpaper_plane_helper_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
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
> +	return 0;
> +}
> +
> +static int pixpaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	if (!crtc_state->enable)
> +		return 0;
> +
> +	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +}
> +
> +static void pixpaper_wait_busy(struct pixpaper_panel *panel)
> +{
> +	unsigned int delay_us = 1000;
> +
> +	usleep_range(delay_us, delay_us + 500);
> +	while (true)
> +		if (gpiod_get_value_cansleep(panel->busy) == 1)
> +			break;
> +}

This function should eventually time out.

> +
> +static int pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg)
> +{
> +	int ret;
> +
> +	ret = spi_sync(spi, msg);
> +	if (ret < 0)
> +		dev_err(&spi->dev, "SPI sync failed: %d\n", ret);

Please use DRM's error reporting. dev_err() becomes drm_err(), dev_dbg() 
becomes drm_dbg().  Further below is WARN_ON(), which should become 
drm_WARN_ON().  Here and everwhere else in the driver.  The only 
exception is in places where you don't have a DRM device yet, sch as 
early device probing.

> +
> +	return ret;
> +}
> +
> +static int pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd)
> +{
> +	struct spi_transfer xfer = {
> +		.tx_buf = &cmd,
> +		.len = 1,
> +	};
> +	struct spi_message msg;
> +	int ret;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer, &msg);
> +
> +	gpiod_set_value_cansleep(panel->dc, 0);
> +	usleep_range(1, 5);
> +	ret = pixpaper_spi_sync(panel->spi, &msg);
> +
> +	return ret;
> +}
> +
> +static int pixpaper_send_data(struct pixpaper_panel *panel, u8 data)
> +{
> +	struct spi_transfer xfer = {
> +		.tx_buf = &data,
> +		.len = 1,
> +	};
> +	struct spi_message msg;
> +	int ret;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer, &msg);
> +
> +	gpiod_set_value_cansleep(panel->dc, 1);
> +	usleep_range(1, 5);
> +	ret = pixpaper_spi_sync(panel->spi, &msg);
> +
> +	return ret;
> +}
> +
> +static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
> +{
> +	struct device *dev = &panel->spi->dev;
> +	int ret = 0;
> +
> +	dev_info(dev, "%s: Starting hardware initialization\n", __func__);
> +
> +	gpiod_set_value_cansleep(panel->reset, 0);
> +	msleep(50);
> +	gpiod_set_value_cansleep(panel->reset, 1);
> +	msleep(50);
> +
> +	pixpaper_wait_busy(panel);
> +	dev_info(dev, "Hardware reset complete, panel idle.\n");
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_4D);
> +	ret |= pixpaper_send_data(panel, 0x78);

This error handling isn't working. Your code OR's multiple errno codes 
and the result will have a different meaning.

The easiest way to avoid excessive error checking is to add an error 
context as final parameter, like this

struct pixpaper_error_ctx {
     int errno_code;
};

pixpaper_spi_sync(..., pixpaper_error_ctx *err) { if (err->errno_code) 
return; ret = spi_sync(...) if (ret) err->errno_code = ret; }

send_cmd(..., pix_error_ctx *err)
{
         pixppaper_spi_sync(..., err);
}


send_data(..., pix_error_ctx *err)
{
         pixppaper_spi_sync(..., err);
}

int my_pixpaper_driver_func()
{
     sturct pixpaper_error_ctx = {}

     send_cmd(..., &err);
     send_data(..., &err);
     send_data(..., &err);
     send_data(..., &err);

     send_cmd(..., &err);
     send_data(..., &err);
     send_data(..., &err);
     send_data(..., &err);

     if (err->errno_code)
         return errno_code

     return 0;
}

This pushes error handling down into the call tree and you only have to 
test for the final result.

> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);

And you can extend other functions, such as pixpaper_wait_busy(), with 
the error context. Integrates them with the rest of the I/O code.

> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_PANEL_SETTING);
> +	ret |= pixpaper_send_data(panel, 0x0F);
> +	ret |= pixpaper_send_data(panel, 0x09);

There are *a lot* of magic values in this function. Please document the 
meaning of these.

> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SETTING);
> +	ret |= pixpaper_send_data(panel, 0x07);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0x22);
> +	ret |= pixpaper_send_data(panel, 0x78);
> +	ret |= pixpaper_send_data(panel, 0x0A);
> +	ret |= pixpaper_send_data(panel, 0x22);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF_SEQUENCE);
> +	ret |= pixpaper_send_data(panel, 0x10);
> +	ret |= pixpaper_send_data(panel, 0x54);
> +	ret |= pixpaper_send_data(panel, 0x44);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_BOOSTER_SOFT_START);
> +	ret |= pixpaper_send_data(panel, 0x0F);
> +	ret |= pixpaper_send_data(panel, 0x0A);
> +	ret |= pixpaper_send_data(panel, 0x2F);
> +	ret |= pixpaper_send_data(panel, 0x25);
> +	ret |= pixpaper_send_data(panel, 0x22);
> +	ret |= pixpaper_send_data(panel, 0x2E);
> +	ret |= pixpaper_send_data(panel, 0x21);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_PLL_CONTROL);
> +	ret |= pixpaper_send_data(panel, 0x02);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_TEMP_SENSOR_CALIB);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_VCOM_INTERVAL);
> +	ret |= pixpaper_send_data(panel, 0x37);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_TCON_SETTING);
> +	ret |= pixpaper_send_data(panel, 0x02);
> +	ret |= pixpaper_send_data(panel, 0x02);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_RESOLUTION_SETTING);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0x80);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0xFA);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_GATE_SOURCE_START);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_AUTO_MEASURE_VCOM);
> +	ret |= pixpaper_send_data(panel, 0x1C);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SAVING);
> +	ret |= pixpaper_send_data(panel, 0x22);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_CASCADE_SETTING);
> +	ret |= pixpaper_send_data(panel, 0x00);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B4);
> +	ret |= pixpaper_send_data(panel, 0xD0);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B5);
> +	ret |= pixpaper_send_data(panel, 0x03);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E9);
> +	ret |= pixpaper_send_data(panel, 0x01);
> +	if (ret)
> +		goto init_fail;
> +	pixpaper_wait_busy(panel);
> +
> +	dev_info(dev, "%s: Hardware initialization successful\n", __func__);

Never print this type of status messages. If nothing exceptional 
happens, you driver should be quite. At most, use drm_dbg() here.

> +	return 0;
> +
> +init_fail:
> +	dev_err(dev, "%s: Hardware initialization failed (err=%d)\n", __func__,
> +		ret);

Error messages are OK, but don't include the function name.

> +	return ret;
> +}
> +
> +static void pixpaper_crtc_atomic_enable(struct drm_crtc *crtc,
> +					struct drm_atomic_state *state)
> +{
> +	struct pixpaper_panel *panel =
> +		container_of(crtc, struct pixpaper_panel, crtc);

Instead of semi-manual upcast, please write a helper that upcasts from 
struct drm_device

struct pixpaper_panel *to_pixpaper_panel(struct drm_device *drm)
{
     return container_of(drm, struct pixpaper_panel, drm);
}

and call it with the CRTC's device

         to_pixpaper_panel(crtc->dev);

> +	struct drm_device *drm = &panel->drm;
> +	int ret;
> +
> +	dev_info(drm->dev, "%s: Enabling pipe\n", __func__);

Same here. The driver should just be quite.

> +
> +	ret = pixpaper_panel_hw_init(panel);

Do you really need a full hardware init for an atomic_enable? You should 
rather do this during device probing.

> +	if (ret) {
> +		dev_err(drm->dev, "Panel HW Init failed during enable: %d\n",
> +			ret);
> +		return;
> +	}
> +
> +	dev_info(drm->dev, "Sending Power ON (PON)\n");
> +	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_ON);
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to send PON command: %d\n", ret);
> +		return;
> +	}
> +
> +	usleep_range(10000, 11000);
> +
> +	pixpaper_wait_busy(panel);
> +
> +	dev_info(drm->dev, "Panel enabled and powered on\n");
> +}
> +
> +static void pixpaper_crtc_atomic_disable(struct drm_crtc *crtc,
> +					 struct drm_atomic_state *state)
> +{
> +	struct pixpaper_panel *panel =
> +		container_of(crtc, struct pixpaper_panel, crtc);
> +	struct drm_device *drm = &panel->drm;
> +	int ret;
> +
> +	dev_dbg(drm->dev, "%s: Disabling pipe\n", __func__);
> +
> +	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF);
> +	if (!ret) {
> +		usleep_range(10000, 11000);
> +		pixpaper_wait_busy(panel);
> +	} else {
> +		dev_warn(drm->dev, "Failed to send POF command: %d\n", ret);
> +	}
> +	dev_info(drm->dev, "Panel disabled\n");
> +}
> +
> +static u8 pack_pixels_to_byte(u32 *src_pixels, int i, int j,
> +			      struct drm_framebuffer *fb)
> +{
> +	u8 packed_byte = 0;
> +	int k;
> +
> +	for (k = 0; k < 4; k++) {
> +		int current_pixel_x = j * 4 + k;
> +		u8 two_bit_val;
> +
> +		if (current_pixel_x < PIXPAPER_WIDTH) {
> +			u32 pixel_offset =
> +				(i * (fb->pitches[0] / 4)) + current_pixel_x;
> +			u32 pixel = src_pixels[pixel_offset];
> +			u32 r = (pixel >> 16) & 0xFF;
> +			u32 g = (pixel >> 8) & 0xFF;
> +			u32 b = pixel & 0xFF;
> +			u32 gray_val =
> +				(r * 299 + g * 587 + b * 114 + 500) / 1000;
> +
> +			if (gray_val < 64)
> +				two_bit_val = 0b00;
> +			else if (gray_val < 128)
> +				two_bit_val = 0b01;
> +			else if (gray_val < 192)
> +				two_bit_val = 0b10;
> +			else
> +				two_bit_val = 0b11;
> +		} else {
> +			two_bit_val = 0b11;
> +		}
> +
> +		packed_byte |= two_bit_val << ((3 - k) * 2);
> +	}
> +
> +	return packed_byte;
> +}
> +
> +static void pixpaper_plane_atomic_update(struct drm_plane *plane,
> +					 struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state =
> +		drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct pixpaper_panel *panel =
> +		container_of(crtc, struct pixpaper_panel, crtc);
> +
> +	struct drm_device *drm = &panel->drm;
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct iosys_map map = shadow_plane_state->data[0];
> +	void *vaddr = map.vaddr;
> +	int i, j, ret = 0;
> +	u32 *src_pixels = NULL;
> +
> +	dev_info(drm->dev, "Starting frame update (phys=%dx%d, buf_w=%d)\n",
> +		 PIXPAPER_WIDTH, PIXPAPER_HEIGHT, PANEL_BUFFER_WIDTH);

Remove all these info statements please. At most, they should be drm_dbg().

> +
> +	if (!fb || !plane_state->visible) {
> +		dev_err(drm->dev,
> +			"No framebuffer or plane not visible, skipping update\n");
> +		return;
> +	}
> +
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to vmap dma_buf\n");
> +		return;
> +	}
> +
> +	src_pixels = (u32 *)vaddr;
> +
> +	dev_info(drm->dev, "Sending DTM command\n");
> +	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_DATA_START_TRANSMISSION);
> +	if (ret)
> +		goto update_cleanup;
> +
> +	usleep_range(10000, 11000);
> +	pixpaper_wait_busy(panel);

That driver does quite a bit of waiting. Is that really necessary or in 
case?

> +
> +	dev_info(drm->dev,
> +		 "Panel idle after DTM command, starting data batch send.\n");
> +
> +	for (i = 0; i < PIXPAPER_HEIGHT; i++) {
> +		for (j = 0; j < PANEL_BUFFER_TWO_BYTES_PER_ROW; j++) {
> +			u8 packed_byte =
> +				pack_pixels_to_byte(src_pixels, i, j, fb);
> +
> +			pixpaper_wait_busy(panel);
> +			pixpaper_send_data(panel, packed_byte);
> +		}
> +	}

You're updating the full display AFAICT. That's not optimal, but OK if 
the hardware can't do better.


> +	pixpaper_wait_busy(panel);
> +
> +	dev_info(drm->dev, "Sending PON + 0x00 before DRF\n");
> +	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_ON);
> +	if (ret)
> +		goto update_cleanup;
> +	ret = pixpaper_send_data(panel, 0x00);
> +	if (ret) {
> +		dev_err(drm->dev,
> +			"Failed sending data after PON-before-DRF: %d\n", ret);
> +		goto update_cleanup;
> +	}
> +	usleep_range(10000, 11000);
> +	pixpaper_wait_busy(panel);
> +
> +	dev_info(drm->dev, "Triggering display refresh (DRF)\n");
> +	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_DISPLAY_REFRESH);
> +	if (ret)
> +		goto update_cleanup;
> +	ret = pixpaper_send_data(panel, 0x00);
> +	if (ret) {
> +		dev_err(drm->dev, "Failed sending data after DRF: %d\n", ret);
> +		goto update_cleanup;
> +	}
> +	usleep_range(10000, 11000);
> +	pixpaper_wait_busy(panel);
> +
> +	dev_info(drm->dev, "Frame update completed and refresh triggered\n");
> +
> +update_cleanup:
> +	if (ret && ret != -ETIMEDOUT)
> +		dev_err(drm->dev,
> +			"Frame update function failed with error %d\n", ret);
> +}
> +
> +static int pixpaper_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	dev_info(connector->dev->dev, "%s: CALLED for connector %s (id: %d)\n",
> +		 __func__, connector->name, connector->base.id);
> +
> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create mode for connector %s\n",
> +			  connector->name);
> +		return 0;
> +	}
> +
> +	mode->hdisplay = PIXPAPER_WIDTH;
> +	mode->vdisplay = PIXPAPER_HEIGHT;
> +
> +	mode->htotal = mode->hdisplay + 80;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hdisplay + 8 + 32;
> +	mode->vtotal = mode->vdisplay + 10;
> +	mode->vsync_start = mode->vdisplay + 2;
> +	mode->vsync_end = mode->vdisplay + 2 + 2;
> +
> +	mode->clock = 6000;
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
> +
> +	if (drm_mode_validate_size(mode, connector->dev->mode_config.max_width,
> +				   connector->dev->mode_config.max_height) !=
> +	    MODE_OK) {
> +		DRM_WARN("%s: Mode %s (%dx%d) failed size validation against max %dx%d\n",
> +			 __func__, mode->name, mode->hdisplay, mode->vdisplay,
> +			 connector->dev->mode_config.max_width,
> +			 connector->dev->mode_config.max_height);
> +		drm_mode_destroy(connector->dev, mode);
> +		return 0;
> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +	dev_info(connector->dev->dev,
> +		 "%s: Added mode '%s' (%dx%d@%d) to connector %s\n", __func__,
> +		 mode->name, mode->hdisplay, mode->vdisplay,
> +		 drm_mode_vrefresh(mode), connector->name);
> +
> +	connector->display_info.width_mm = 30;
> +	connector->display_info.height_mm = 47;
> +
> +	return 1;
> +}
> +
> +DEFINE_DRM_GEM_DMA_FOPS(pixpaper_fops);
> +
> +static struct drm_driver pixpaper_drm_driver = {
> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops = &pixpaper_fops,
> +	.name = "pixpaper",
> +	.desc = "DRM driver for PIXPAPER e-ink",
> +	.major = 1,
> +	.minor = 0,
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP,
> +	DRM_FBDEV_DMA_DRIVER_OPS,

Is there a specific reason why you need GEM DMA? Since you're hardware 
doesn't use DMA, GEM SHMEM might be a better choice.

> +};
> +
> +static int pixpaper_mode_valid(struct drm_device *dev,
> +			       const struct drm_display_mode *mode)
> +{
> +	if (mode->hdisplay == PIXPAPER_WIDTH &&
> +	    mode->vdisplay == PIXPAPER_HEIGHT) {
> +		return MODE_OK;
> +	}
> +	dev_dbg(dev->dev, "Rejecting mode %dx%d (supports only %dx%d)\n",
> +		mode->hdisplay, mode->vdisplay, PIXPAPER_WIDTH,
> +		PIXPAPER_HEIGHT);
> +	return MODE_BAD;
> +}
> +
> +static const struct drm_mode_config_funcs pixpaper_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.mode_valid = pixpaper_mode_valid,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int pixpaper_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct pixpaper_panel *panel;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	dev_info(dev, "Probing PIXPAPER panel driver\n");
> +
> +	panel = devm_drm_dev_alloc(dev, &pixpaper_drm_driver,
> +				   struct pixpaper_panel, drm);
> +	if (IS_ERR(panel)) {
> +		ret = PTR_ERR(panel);
> +		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
> +		return ret;
> +	}
> +	drm = &panel->drm;
> +	panel->spi = spi;
> +	spi_set_drvdata(spi, panel);
> +
> +	spi->mode = SPI_MODE_0;
> +	spi->bits_per_word = 8;
> +
> +	if (!spi->max_speed_hz) {
> +		dev_warn(dev, "spi-max-frequency not specified in DT, using default %u Hz\n",
> +			 PIXPAPER_SPI_SPEED_DEFAULT);
> +		spi->max_speed_hz = PIXPAPER_SPI_SPEED_DEFAULT;
> +	} else {
> +		dev_info(dev, "Using spi-max-frequency from DT: %u Hz\n",
> +			 spi->max_speed_hz);
> +	}
> +
> +	ret = spi_setup(spi);
> +	if (ret < 0) {
> +		dev_err(dev, "SPI setup failed: %d\n", ret);
> +		return ret;
> +	}
> +	dev_info(dev, "SPI setup OK (mode=%d, speed=%u Hz, bpw=%d)\n",
> +		 spi->mode, spi->max_speed_hz, spi->bits_per_word);
> +
> +	if (!dev->dma_mask)
> +		dev->dma_mask = &dev->coherent_dma_mask;
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "Failed to set DMA mask: %d\n", ret);
> +		return ret;
> +	}
> +	dev_dbg(dev, "DMA mask set\n");
> +
> +	panel->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(panel->reset))
> +		return dev_err_probe(dev, PTR_ERR(panel->reset),
> +				     "Failed to get 'reset' GPIO\n");
> +	panel->busy = devm_gpiod_get(dev, "busy", GPIOD_IN);
> +	if (IS_ERR(panel->busy))
> +		return dev_err_probe(dev, PTR_ERR(panel->busy),
> +				     "Failed to get 'busy' GPIO\n");
> +	panel->dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_HIGH);
> +	if (IS_ERR(panel->dc))
> +		return dev_err_probe(dev, PTR_ERR(panel->dc),
> +				     "Failed to get 'dc' GPIO\n");
> +	dev_info(dev, "All required GPIOs obtained successfully.\n");
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +	drm->mode_config.funcs = &pixpaper_mode_config_funcs;
> +	drm->mode_config.min_width = PIXPAPER_WIDTH;
> +	drm->mode_config.max_width = PIXPAPER_WIDTH;
> +	drm->mode_config.min_height = PIXPAPER_HEIGHT;
> +	drm->mode_config.max_height = PIXPAPER_HEIGHT;
> +
> +	ret = drm_universal_plane_init(drm, &panel->plane, 1, &pixpaper_plane_funcs,
> +		(const uint32_t[]){ DRM_FORMAT_XRGB8888 }, 1, NULL,
> +		DRM_PLANE_TYPE_PRIMARY, NULL);

> +	drm_plane_enable_fb_damage_clips(&panel->plane);

Since the driver always updates the full display anyway, you don't need 
to enable damage clipping.

> +	if (ret)
> +		return ret;
> +	drm_plane_helper_add(&panel->plane, &pixpaper_plane_helper_funcs);
> +
> +	ret = drm_crtc_init_with_planes(drm, &panel->crtc, &panel->plane, NULL,
> +					&pixpaper_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +	drm_crtc_helper_add(&panel->crtc, &pixpaper_crtc_helper_funcs);
> +
> +	ret = drm_encoder_init(drm, &panel->encoder, &pixpaper_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);

ENCODER_DAC is for VGA connectors. Rather use ENCODER_NONE here.

> +	if (ret)
> +		return ret;
> +	panel->encoder.possible_crtcs = drm_crtc_mask(&panel->crtc);
> +
> +	ret = drm_connector_init(drm, &panel->connector,
> +				 &pixpaper_connector_funcs,
> +				 DRM_MODE_CONNECTOR_SPI);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(&panel->connector,
> +				 &pixpaper_connector_helper_funcs);
> +	drm_connector_attach_encoder(&panel->connector, &panel->encoder);
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_client_setup(drm, NULL);
> +
> +	dev_info(dev, "Initialized PIXPAPER panel driver successfully\n");
> +	return 0;
> +}
> +
> +static void pixpaper_remove(struct spi_device *spi)
> +{
> +	struct pixpaper_panel *panel = spi_get_drvdata(spi);
> +
> +	if (!panel)
> +		return;
> +
> +	dev_info(&spi->dev, "Removing PIXPAPER panel driver\n");
> +
> +	drm_dev_unplug(&panel->drm);

This signals to DRM that the hardware device has been removed. You 
should put drm_dev_enter() and drm_dev_exit() to the top and bottom of 
each of the DRM callbacks. The driver will then not try to access the 
device.

Best regards
Thomas

> +	drm_atomic_helper_shutdown(&panel->drm);
> +}
> +
> +static const struct spi_device_id pixpaper_ids[] = { { "pixpaper", 0 }, {} };
> +MODULE_DEVICE_TABLE(spi, pixpaper_ids);
> +
> +static const struct of_device_id pixpaper_dt_ids[] = {
> +	{ .compatible = "mayqueen,pixpaper" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pixpaper_dt_ids);
> +
> +static struct spi_driver pixpaper_spi_driver = {
> +	.driver = {
> +		.name = "pixpaper",
> +		.of_match_table = pixpaper_dt_ids,
> +	},
> +	.id_table = pixpaper_ids,
> +	.probe = pixpaper_probe,
> +	.remove = pixpaper_remove,
> +};
> +
> +module_spi_driver(pixpaper_spi_driver);
> +
> +MODULE_AUTHOR("LiangCheng Wang");
> +MODULE_DESCRIPTION("DRM SPI driver for PIXPAPER e-ink panel");
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

