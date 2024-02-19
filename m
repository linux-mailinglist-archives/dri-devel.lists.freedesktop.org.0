Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A385A92F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 17:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307689C68;
	Mon, 19 Feb 2024 16:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pc/mrG8R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rLTv9sY8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pc/mrG8R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rLTv9sY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FAA10E179
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 16:43:47 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B14E51F801;
 Mon, 19 Feb 2024 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708361025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G5TNoZ7VyLeJfK835wWy8WXgz/9AigaVe/cS14Q82S4=;
 b=pc/mrG8RR1sKJ+hoxdJXjd3j45W4et8W+Sll/5k6iYgcfPDL9ERtJxkVAvgE3n+96Cj3h2
 GKhE/ATdLVBVgtiU/oOQ6p/pPoF0QdnY0SinHPMQyBwcAfR+COs6aCH2oUUJNKLQy1jGhf
 oPlT1hFr/J1aKm/KishjfUd2y36e1vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708361025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G5TNoZ7VyLeJfK835wWy8WXgz/9AigaVe/cS14Q82S4=;
 b=rLTv9sY8KE7+zkWU+UFUeFfNuGAHDHSvJxNR67O3ycWH8CSWD8OS1W5MRV3BHzdkPDMr7/
 mxOT2AEHSj17ShAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708361025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G5TNoZ7VyLeJfK835wWy8WXgz/9AigaVe/cS14Q82S4=;
 b=pc/mrG8RR1sKJ+hoxdJXjd3j45W4et8W+Sll/5k6iYgcfPDL9ERtJxkVAvgE3n+96Cj3h2
 GKhE/ATdLVBVgtiU/oOQ6p/pPoF0QdnY0SinHPMQyBwcAfR+COs6aCH2oUUJNKLQy1jGhf
 oPlT1hFr/J1aKm/KishjfUd2y36e1vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708361025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G5TNoZ7VyLeJfK835wWy8WXgz/9AigaVe/cS14Q82S4=;
 b=rLTv9sY8KE7+zkWU+UFUeFfNuGAHDHSvJxNR67O3ycWH8CSWD8OS1W5MRV3BHzdkPDMr7/
 mxOT2AEHSj17ShAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7292C139C6;
 Mon, 19 Feb 2024 16:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id wxitGkGF02UlMwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Feb 2024 16:43:45 +0000
Message-ID: <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
Date: Mon, 19 Feb 2024 17:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
References: <20240219142001.19727-1-tony@atomide.com>
 <20240219142001.19727-2-tony@atomide.com>
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
In-Reply-To: <20240219142001.19727-2-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="pc/mrG8R";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rLTv9sY8
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,atomide.com:email];
 FREEMAIL_TO(0.00)[atomide.com,ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,ravnborg.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B14E51F801
X-Spam-Level: 
X-Spam-Score: -3.30
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

Am 19.02.24 um 15:19 schrieb Tony Lindgren:
> Commit 95da53d63dcf ("drm/omapdrm: Use regular fbdev I/O helpers")
> broke console because there is no damage handling in fb_sys_write()
> unlike we have in drm_fb_helper_sys_write().
>
> Let's fix the issue by using deferred ops with fb helpers for damage.
>
> Fixes: 95da53d63dcf ("drm/omapdrm: Use regular fbdev I/O helpers")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig      | 1 +
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -5,6 +5,7 @@ config DRM_OMAP
>   	depends on ARCH_OMAP2PLUS
>   	select DRM_KMS_HELPER
>   	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION

Anything named _IOMEM_ is for framebuffer's in I/O memory space. Just 
keep DMAMEM_HELPERS with the few changes below.

>   	select VIDEOMODE_HELPERS
>   	select HDMI
>   	default n
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
>   	omap_gem_roll(bo, fbi->var.yoffset * npages);
>   }
>   
> +FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(omap_fbdev,
> +				  drm_fb_helper_damage_range,
> +				  drm_fb_helper_damage_area)
> +

Please create FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() by duplicating 
FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS() in <linux/fb.h>

>   static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>   		struct fb_info *fbi)
>   {
> @@ -106,13 +110,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
>   static const struct fb_ops omap_fb_ops = {
>   	.owner = THIS_MODULE,
> -	__FB_DEFAULT_DMAMEM_OPS_RDWR,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
>   	.fb_check_var	= drm_fb_helper_check_var,
>   	.fb_set_par	= drm_fb_helper_set_par,
>   	.fb_setcmap	= drm_fb_helper_setcmap,
>   	.fb_blank	= drm_fb_helper_blank,
>   	.fb_pan_display = omap_fbdev_pan_display,
> -	__FB_DEFAULT_DMAMEM_OPS_DRAW,
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
>   	.fb_ioctl	= drm_fb_helper_ioctl,
>   	.fb_mmap	= omap_fbdev_fb_mmap,

The write and draw callbacks track the written pages and flush them to 
the backbuffer. But mmap is a problem here, because mmap needs to do 
this as well. You'd have to use fb_deferred_io_mmap() here and call 
fb_deferred_io_init() in omap's fbdev init. See the generic fbdev in 
drm_fbdev_generic() for a working example. But IDK whether that works 
easily for omap's DMA memory. You have to mmap and track memory pages 
(i.e., struct page).

The easy solution is to clear the fb_mmap callback and mmap() will thne 
not be available to userspace.

Best regards
Thomas

>   	.fb_destroy	= omap_fbdev_fb_destroy,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

