Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15017AA8EE2
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74FA10E328;
	Mon,  5 May 2025 09:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nkxK11hg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFFGnOO3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nkxK11hg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFFGnOO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416510E328
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:06:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F97321265;
 Mon,  5 May 2025 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746435997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cJgGwcX94y0/ULGhSqyRKu/CwENFIGVHPNo0hYEehTc=;
 b=nkxK11hgvmXaa+wzuoI4/R6fvRDjI9k/Zu4uf3VQkvzb4pakZAmMs1UaBh5E2CGveT5GOa
 i+sTWSnL7PMumxgDJI5DwN2Jrsinp2fISMsThvB7LGL6ylnCZnsh9Ws4bG++YTe+E3B1fy
 F1Iz7UXQw7jrwBZyjwbX/xxmoljFOBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746435997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cJgGwcX94y0/ULGhSqyRKu/CwENFIGVHPNo0hYEehTc=;
 b=GFFGnOO3E/mHW/eTVaPAZqjUiQ0LZ2DxzjK4EdhmBkOp+joYU/V477t/U+nnn8Nj7u3syT
 ZZszdVNHDy792yBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nkxK11hg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GFFGnOO3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746435997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cJgGwcX94y0/ULGhSqyRKu/CwENFIGVHPNo0hYEehTc=;
 b=nkxK11hgvmXaa+wzuoI4/R6fvRDjI9k/Zu4uf3VQkvzb4pakZAmMs1UaBh5E2CGveT5GOa
 i+sTWSnL7PMumxgDJI5DwN2Jrsinp2fISMsThvB7LGL6ylnCZnsh9Ws4bG++YTe+E3B1fy
 F1Iz7UXQw7jrwBZyjwbX/xxmoljFOBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746435997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cJgGwcX94y0/ULGhSqyRKu/CwENFIGVHPNo0hYEehTc=;
 b=GFFGnOO3E/mHW/eTVaPAZqjUiQ0LZ2DxzjK4EdhmBkOp+joYU/V477t/U+nnn8Nj7u3syT
 ZZszdVNHDy792yBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3388E1372E;
 Mon,  5 May 2025 09:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id frUyC51/GGg8ZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 May 2025 09:06:37 +0000
Message-ID: <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
Date: Mon, 5 May 2025 11:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
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
In-Reply-To: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6F97321265
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,lechnology.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo,
 gitlab.freedesktop.org:url]
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

there's one major issue here. You must not change the Kconfig symbols or 
you'll break kernel updates for a lot of people. So those TINYDRM_* must 
remain as is.

Best regards
Thomas

Am 03.05.25 um 10:13 schrieb Marcus Folkesson:
> We start to have support many Sitronix displays in the tiny directory,
> and we expect more to come.
>
> Move them to their own subdirectory.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v2:
> - Rebase on drm-misc-next
> - Link to v1: https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com
> ---
>   MAINTAINERS                                     |  6 ++--
>   drivers/gpu/drm/Kconfig                         |  2 ++
>   drivers/gpu/drm/Makefile                        |  1 +
>   drivers/gpu/drm/sitronix/Kconfig                | 41 +++++++++++++++++++++++++
>   drivers/gpu/drm/sitronix/Makefile               |  3 ++
>   drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
>   drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
>   drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
>   drivers/gpu/drm/tiny/Kconfig                    | 41 -------------------------
>   drivers/gpu/drm/tiny/Makefile                   |  3 --
>   10 files changed, 50 insertions(+), 47 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81b81cc68ca2482f2965b801693ff8a43bbf2053..6b2d3d4c467b8b360317437027e20c4014c97a21 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7680,13 +7680,13 @@ M:	David Lechner <david@lechnology.com>
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
> -F:	drivers/gpu/drm/tiny/st7586.c
> +F:	drivers/gpu/drm/sitronix/st7586.c
>   
>   DRM DRIVER FOR SITRONIX ST7571 PANELS
>   M:	Marcus Folkesson <marcus.folkesson@gmail.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> -F:	drivers/gpu/drm/tiny/st7571-i2c.c
> +F:	drivers/gpu/drm/sitronix/st7571-i2c.c
>   
>   DRM DRIVER FOR SITRONIX ST7701 PANELS
>   M:	Jagan Teki <jagan@amarulasolutions.com>
> @@ -7707,7 +7707,7 @@ M:	David Lechner <david@lechnology.com>
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> -F:	drivers/gpu/drm/tiny/st7735r.c
> +F:	drivers/gpu/drm/sitronix/st7735r.c
>   
>   DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
>   M:	Javier Martinez Canillas <javierm@redhat.com>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3921772ae61214e6ac0337edc147a46af0010070..cc7385c334eb6ad484688d9eb483c2c6a9c39e11 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -385,6 +385,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
>   
>   source "drivers/gpu/drm/gud/Kconfig"
>   
> +source "drivers/gpu/drm/sitronix/Kconfig"
> +
>   source "drivers/gpu/drm/solomon/Kconfig"
>   
>   source "drivers/gpu/drm/sprd/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index b5d5561bbe5fd72f3915e6a52f325fdb79c7981e..70510620f29c874e376c795fb05d426a0faae05c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -221,6 +221,7 @@ obj-$(CONFIG_DRM_TIDSS) += tidss/
>   obj-y			+= xlnx/
>   obj-y			+= gud/
>   obj-$(CONFIG_DRM_HYPERV) += hyperv/
> +obj-y			+= sitronix/
>   obj-y			+= solomon/
>   obj-$(CONFIG_DRM_SPRD) += sprd/
>   obj-$(CONFIG_DRM_LOONGSON) += loongson/
> diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..25cae32e5c3ec11399a12f1f2bb2ede91c27d4d4
> --- /dev/null
> +++ b/drivers/gpu/drm/sitronix/Kconfig
> @@ -0,0 +1,41 @@
> +config DRM_ST7571_I2C
> +	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> +	depends on DRM && I2C && MMU
> +	select DRM_CLIENT_SELECTION
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> +
> +	  if M is selected the module will be called st7571-i2c.
> +
> +config DRM_ST7586
> +	tristate "DRM support for Sitronix ST7586 display panels"
> +	depends on DRM && SPI
> +	select DRM_CLIENT_SELECTION
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_MIPI_DBI
> +	help
> +	  DRM driver for the following Sitronix ST7586 panels:
> +	  * LEGO MINDSTORMS EV3
> +
> +	  If M is selected the module will be called st7586.
> +
> +config DRM_ST7735R
> +	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
> +	depends on DRM && SPI
> +	select DRM_CLIENT_SELECTION
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_MIPI_DBI
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
> +	  LCDs:
> +	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
> +	  * Okaya RH128128T 1.44" 128x128 TFT
> +
> +	  If M is selected the module will be called st7735r.
> +
> diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..bd139e5a6995fa026cc635b3c29782473d1efad7
> --- /dev/null
> +++ b/drivers/gpu/drm/sitronix/Makefile
> @@ -0,0 +1,3 @@
> +obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
> +obj-$(CONFIG_DRM_ST7586)		+= st7586.o
> +obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
> diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
> similarity index 100%
> rename from drivers/gpu/drm/tiny/st7571-i2c.c
> rename to drivers/gpu/drm/sitronix/st7571-i2c.c
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
> similarity index 100%
> rename from drivers/gpu/drm/tiny/st7586.c
> rename to drivers/gpu/drm/sitronix/st7586.c
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
> similarity index 100%
> rename from drivers/gpu/drm/tiny/st7735r.c
> rename to drivers/gpu/drm/sitronix/st7735r.c
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index daa1adbb1b43325d644ae13f3cabfc1bb01ff4d8..6d1b3e2cb3fbd8630864824ae985897b9d8095c7 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -199,44 +199,3 @@ config TINYDRM_SHARP_MEMORY
>   	  * 4.40" Sharp Memory LCD (LS044Q7DH01)
>   
>   	  If M is selected the module will be called sharp_memory.
> -
> -config TINYDRM_ST7586
> -	tristate "DRM support for Sitronix ST7586 display panels"
> -	depends on DRM && SPI
> -	select DRM_CLIENT_SELECTION
> -	select DRM_KMS_HELPER
> -	select DRM_GEM_DMA_HELPER
> -	select DRM_MIPI_DBI
> -	help
> -	  DRM driver for the following Sitronix ST7586 panels:
> -	  * LEGO MINDSTORMS EV3
> -
> -	  If M is selected the module will be called st7586.
> -
> -config DRM_ST7571_I2C
> -	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
> -	depends on DRM && I2C && MMU
> -	select DRM_CLIENT_SELECTION
> -	select DRM_GEM_SHMEM_HELPER
> -	select DRM_KMS_HELPER
> -	select REGMAP_I2C
> -	help
> -	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> -
> -	  if M is selected the module will be called st7571-i2c.
> -
> -config TINYDRM_ST7735R
> -	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
> -	depends on DRM && SPI
> -	select DRM_CLIENT_SELECTION
> -	select DRM_KMS_HELPER
> -	select DRM_GEM_DMA_HELPER
> -	select DRM_MIPI_DBI
> -	select BACKLIGHT_CLASS_DEVICE
> -	help
> -	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
> -	  LCDs:
> -	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
> -	  * Okaya RH128128T 1.44" 128x128 TFT
> -
> -	  If M is selected the module will be called st7735r.
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 0151590db5cbd80aebde0629afd03f47b83c3045..4a9ff61ec25420e2c0a648c04eaab7ca25dd5407 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -6,7 +6,6 @@ obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
>   obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
>   obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
>   obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
> -obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
>   obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
>   obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
>   obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
> @@ -15,5 +14,3 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
>   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
> -obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
> -obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
>
> ---
> base-commit: e782ac936941cff4c5580bb5cc2ec0e91468068c
> change-id: 20250424-sitronix-2c1f68b46866
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

