Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76ABAE8487
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAB710E0C0;
	Wed, 25 Jun 2025 13:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vokyBC6o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MzkQhV7L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vokyBC6o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MzkQhV7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D15B10E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:25:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B75E01F74D;
 Wed, 25 Jun 2025 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750857927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R32rpLO+lR73fmOx9/YQ6ueMP5fLILz8DIaLxrboNAQ=;
 b=vokyBC6orRS0j57DzSueQA/nBfL/C25o3EUYX2zqLpFCpQ3ZFeENyKxY1K+El2ieOkvOhv
 DOcXD6maHMe5uIImYdgUsPCzt9XJL1TYVRTX78Y+EU7sclxXB8a0Wa/Lhsa85CP8bzv645
 hxL53Eh3Ab4vCQ0NwYcf0ocC0H2PFfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750857927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R32rpLO+lR73fmOx9/YQ6ueMP5fLILz8DIaLxrboNAQ=;
 b=MzkQhV7LL5mKjlGvhxcP6WhdJ0QHPxnK94Zjyy6DTbH9JWw6f+l73Z6EFcQ3XFTXlB8zOG
 y+B064MdF0cC7hCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750857927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R32rpLO+lR73fmOx9/YQ6ueMP5fLILz8DIaLxrboNAQ=;
 b=vokyBC6orRS0j57DzSueQA/nBfL/C25o3EUYX2zqLpFCpQ3ZFeENyKxY1K+El2ieOkvOhv
 DOcXD6maHMe5uIImYdgUsPCzt9XJL1TYVRTX78Y+EU7sclxXB8a0Wa/Lhsa85CP8bzv645
 hxL53Eh3Ab4vCQ0NwYcf0ocC0H2PFfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750857927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R32rpLO+lR73fmOx9/YQ6ueMP5fLILz8DIaLxrboNAQ=;
 b=MzkQhV7LL5mKjlGvhxcP6WhdJ0QHPxnK94Zjyy6DTbH9JWw6f+l73Z6EFcQ3XFTXlB8zOG
 y+B064MdF0cC7hCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A35313485;
 Wed, 25 Jun 2025 13:25:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l6CFGMf4W2hnAQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jun 2025 13:25:27 +0000
Message-ID: <dd4b829c-acc5-4d12-90fd-251374b1f80f@suse.de>
Date: Wed, 25 Jun 2025 15:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev: remove fb_notify support
To: Arnd Bergmann <arnd@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250625131511.3366522-1-arnd@kernel.org>
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
In-Reply-To: <20250625131511.3366522-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com,gmx.de];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,gmx.de];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[arndb.de,zonque.org,gmail.com,free.fr,redhat.com,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, pol.net:email,
 neruo.com:email, imap1.dmz-prg2.suse.org:helo]
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

Am 25.06.25 um 15:12 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Commit dc2139c0aa32 ("leds: backlight trigger: Replace fb events with a
> dedicated function call") removed the FB_EVENT_BLANK notifier, and now
> the only remaining user of the FB notifier is the metronomefb driver on
> the PXA/AM200EPD board.
>
> This was introduced in commit 922613436ae5 ("[ARM] 5200/1: am200epd: use
> fb notifiers and gpio api"), which converted it from an earlier version,
> but as far as I can tell this can never have worked because the notifier
> is called after the data it passes down is accessed.
>
> Commit 867187821e5e ("fbdev/metronomefb: Use struct fb_info.screen_buffer")
> broke this further, and there are likely other parts of the driver that
> no longer work.
>
> The am200epd board support itself should have also been removed long ago,
> as there are no users and it was never converted to devicetree format.
>
> Mark the board as broken to prevent build failures and remove the now
> unused notifiers.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/mach-pxa/Kconfig            |  1 +
>   drivers/video/fbdev/core/Makefile    |  1 -
>   drivers/video/fbdev/core/fb_notify.c | 54 ----------------------------
>   drivers/video/fbdev/core/fbmem.c     | 15 --------
>   include/linux/fb.h                   | 21 -----------
>   5 files changed, 1 insertion(+), 91 deletions(-)
>   delete mode 100644 drivers/video/fbdev/core/fb_notify.c
>
> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index 10e472f4fa43..edefc953e4f9 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -69,6 +69,7 @@ choice
>   
>   config GUMSTIX_AM200EPD
>   	bool "Enable AM200EPD board support"
> +	depends on BROKEN

If anyone wants to revive this board, we can add direct calls from fbdev 
to the board helpers.

>   
>   config GUMSTIX_AM300EPD
>   	bool "Enable AM300EPD board support"
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index d15974759086..ac8036209501 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>   obj-$(CONFIG_FB_CORE)             += fb.o
>   fb-y                              := fb_info.o \
>                                        fbmem.o fbcmap.o \
> diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
> deleted file mode 100644
> index 10e3b9a74adc..000000000000
> --- a/drivers/video/fbdev/core/fb_notify.c
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -/*
> - *  linux/drivers/video/fb_notify.c
> - *
> - *  Copyright (C) 2006 Antonino Daplas <adaplas@pol.net>
> - *
> - *	2001 - Documented with DocBook
> - *	- Brad Douglas <brad@neruo.com>
> - *
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file COPYING in the main directory of this archive
> - * for more details.
> - */
> -#include <linux/fb.h>
> -#include <linux/notifier.h>
> -#include <linux/export.h>
> -
> -static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
> -
> -/**
> - *	fb_register_client - register a client notifier
> - *	@nb: notifier block to callback on events
> - *
> - *	Return: 0 on success, negative error code on failure.
> - */
> -int fb_register_client(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_register(&fb_notifier_list, nb);
> -}
> -EXPORT_SYMBOL(fb_register_client);
> -
> -/**
> - *	fb_unregister_client - unregister a client notifier
> - *	@nb: notifier block to callback on events
> - *
> - *	Return: 0 on success, negative error code on failure.
> - */
> -int fb_unregister_client(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_unregister(&fb_notifier_list, nb);
> -}
> -EXPORT_SYMBOL(fb_unregister_client);
> -
> -/**
> - * fb_notifier_call_chain - notify clients of fb_events
> - * @val: value passed to callback
> - * @v: pointer passed to callback
> - *
> - * Return: The return value of the last notifier function
> - */
> -int fb_notifier_call_chain(unsigned long val, void *v)
> -{
> -	return blocking_notifier_call_chain(&fb_notifier_list, val, v);
> -}
> -EXPORT_SYMBOL_GPL(fb_notifier_call_chain);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index dfcf5e4d1d4c..82ec7351e7da 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -498,14 +498,6 @@ static int do_register_framebuffer(struct fb_info *fb_info)
>   	num_registered_fb++;
>   	registered_fb[i] = fb_info;
>   
> -#ifdef CONFIG_GUMSTIX_AM200EPD
> -	{
> -		struct fb_event event;
> -		event.info = fb_info;
> -		fb_notifier_call_chain(FB_EVENT_FB_REGISTERED, &event);

These FB_EVENT_ constants need to go as well. The whole block starting 
at https://elixir.bootlin.com/linux/v6.16-rc3/source/include/linux/fb.h#L128

With that:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> -	}
> -#endif
> -
>   	return fbcon_fb_registered(fb_info);
>   }
>   
> @@ -544,13 +536,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
>   	fb_destroy_modelist(&fb_info->modelist);
>   	registered_fb[fb_info->node] = NULL;
>   	num_registered_fb--;
> -#ifdef CONFIG_GUMSTIX_AM200EPD
> -	{
> -		struct fb_event event;
> -		event.info = fb_info;
> -		fb_notifier_call_chain(FB_EVENT_FB_UNREGISTERED, &event);
> -	}
> -#endif
>   	fbcon_fb_unregistered(fb_info);
>   
>   	/* this may free fb info */
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 05cc251035da..520ad870b8b2 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -151,27 +151,6 @@ struct fb_blit_caps {
>   	u32 flags;
>   };
>   
> -#ifdef CONFIG_FB_NOTIFY
> -extern int fb_register_client(struct notifier_block *nb);
> -extern int fb_unregister_client(struct notifier_block *nb);
> -extern int fb_notifier_call_chain(unsigned long val, void *v);
> -#else
> -static inline int fb_register_client(struct notifier_block *nb)
> -{
> -	return 0;
> -};
> -
> -static inline int fb_unregister_client(struct notifier_block *nb)
> -{
> -	return 0;
> -};
> -
> -static inline int fb_notifier_call_chain(unsigned long val, void *v)
> -{
> -	return 0;
> -};
> -#endif
> -
>   /*
>    * Pixmap structure definition
>    *

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

