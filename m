Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779B89D418
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23D6112B8A;
	Tue,  9 Apr 2024 08:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="c/ToHUxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o5lpYoxY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Y3uzl+h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UyL7zSLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222E0112B8A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 08:21:27 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22DB420897;
 Tue,  9 Apr 2024 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9gJHFIAFAkdPG4d7RCszDQtBLn57jxEQ/DQDuboB5uY=;
 b=c/ToHUxZS+aPoalc1cqQgcfZe5ACVpHMd+Nhfzu5LO7e4Ad7+coM7P+2UkQGLtEgW/xy9N
 CbHzbjI+A3Xpnz0t8BrHC6R6kc6xrzD0faBvCxSAswg8wNHI3/yV+dJG0jiZxXViTo/9Ww
 9caCxdnOqXd3uMdxNTgi1VYIcNlYMxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9gJHFIAFAkdPG4d7RCszDQtBLn57jxEQ/DQDuboB5uY=;
 b=o5lpYoxYfHBUySXPYIqWBeuOG9lecZPmE2gtlyJiUxeCEv3RAuK1RhDTnr/JvPVC2e6cuV
 Ljn88rkzC38hmbDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1Y3uzl+h;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UyL7zSLo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9gJHFIAFAkdPG4d7RCszDQtBLn57jxEQ/DQDuboB5uY=;
 b=1Y3uzl+hfKV9qODR1DFsSWAusKxgDCt2ZFcKENCQu0w0wWQVzHFvk/T8BzCbEsaWpXgb6p
 CdCAd0XS/wrAdHNuJO8El5QAc5u+VeFB+bOf/Wd399q/GXlmmqxQeHgcVU7jwZyrngN/qk
 xs/sX+IlMjGKJbqVUukHPWB6+2B6SzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9gJHFIAFAkdPG4d7RCszDQtBLn57jxEQ/DQDuboB5uY=;
 b=UyL7zSLo/9PhPgsCeMDu+kNFvxSiWohfj14LxVvSJWMMcf9QnTYsFqjFy/4aSK4eqNOJQM
 UrVX/uG6EiY2CMDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C908813253;
 Tue,  9 Apr 2024 08:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Nvm+L4T6FGZuNwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:21:24 +0000
Message-ID: <b57f3a3a-68e1-4069-83de-2b3aca6cafb7@suse.de>
Date: Tue, 9 Apr 2024 10:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com
References: <20240328120638.468738-1-jfalempe@redhat.com>
 <20240328120638.468738-6-jfalempe@redhat.com>
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
In-Reply-To: <20240328120638.468738-6-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 22DB420897
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org,linux.dev];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
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

Am 28.03.24 um 13:03 schrieb Jocelyn Falempe:
> This was initialy done for imx6, but should work on most drivers
> using drm_fb_dma_helper.
>
> v8:
>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>     (Thomas Zimmermann)
>
> v9:
>   * go back to get_scanout_buffer()
>   * move get_scanout_buffer() to plane helper functions
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_fb_dma_helper.c | 47 +++++++++++++++++++++++++++++
>   include/drm/drm_fb_dma_helper.h     |  4 +++
>   2 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
> index 3b535ad1b07c..010327069ad4 100644
> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_dma_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/module.h>
> @@ -148,3 +149,49 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>   	}
>   }
>   EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
> +
> +#if defined(CONFIG_DRM_PANIC)

I would not bother with CONFIG_DRM_PANIC for now and make the helper 
generally available.

> +/**
> + * @plane: DRM primary plane
> + * @drm_scanout_buffer: scanout buffer for the panic handler
> + * Returns: 0 or negative error code
> + *
> + * Generic get_scanout_buffer() implementation, for drivers that uses the
> + * drm_fb_dma_helper.
> + */
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb)

It's neither really a function for panic handling nor a GEM function. 
This helper needs to be called drm_fb_dma_get_scanout_buffer() IMHO.

> +{
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +
> +	fb = plane->state->fb;
> +	/* Only support linear modifier */
> +	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
> +		return -ENODEV;
> +
> +	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	/* Buffer should be accessible from the CPU */
> +	if (dma_obj->base.import_attach)
> +		return -ENODEV;
> +
> +	/* Buffer should be already mapped to CPU */
> +	if (!dma_obj->vaddr)
> +		return -ENODEV;
> +
> +	iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> +	sb->format = fb->format;
> +	sb->height = fb->height;
> +	sb->width = fb->width;
> +	sb->pitch = fb->pitches[0];
> +	return 0;
> +}
> +#else
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
> diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
> index d5e036c57801..61f24c2aba2f 100644
> --- a/include/drm/drm_fb_dma_helper.h
> +++ b/include/drm/drm_fb_dma_helper.h
> @@ -7,6 +7,7 @@
>   struct drm_device;
>   struct drm_framebuffer;
>   struct drm_plane_state;
> +struct drm_scanout_buffer;
>   
>   struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
>   	unsigned int plane);
> @@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>   				  struct drm_plane_state *old_state,
>   				  struct drm_plane_state *state);
>   
> +int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> +				     struct drm_scanout_buffer *sb);
> +
>   #endif
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

