Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C80BE2298
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6322010E2E1;
	Thu, 16 Oct 2025 08:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rUzpPfKD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fmYLajD6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rUzpPfKD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fmYLajD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C67B10E2E1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:32:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A21DD21E47;
 Thu, 16 Oct 2025 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760603567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1kqf3EQrRjvy8hLBxOsKf1yyu9mSk9/k5K7ZbsZGnhQ=;
 b=rUzpPfKDmBzFKK2KokSvWks6IFho8F8D94/Ksyqni/GZdfuaHB2fgDwklOEW2imy9RrI+d
 +8Kn9c3AU7oDQ0uzdAwhjDiSi9oCgnBl4iJD3mTSx52mR5KvB1gleL9Hvyjt1t5v5pDC3t
 Wz0dfK5IwnOCyKuzh/ka9e6ZwB2NPH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760603567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1kqf3EQrRjvy8hLBxOsKf1yyu9mSk9/k5K7ZbsZGnhQ=;
 b=fmYLajD6KgUItcQDMThGAt3k8MDLp96X5c+Me0XwntsF2xIEKHYK81zq49TPprnbocvHWa
 7y/BSfU0nUf8PZAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rUzpPfKD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fmYLajD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760603567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1kqf3EQrRjvy8hLBxOsKf1yyu9mSk9/k5K7ZbsZGnhQ=;
 b=rUzpPfKDmBzFKK2KokSvWks6IFho8F8D94/Ksyqni/GZdfuaHB2fgDwklOEW2imy9RrI+d
 +8Kn9c3AU7oDQ0uzdAwhjDiSi9oCgnBl4iJD3mTSx52mR5KvB1gleL9Hvyjt1t5v5pDC3t
 Wz0dfK5IwnOCyKuzh/ka9e6ZwB2NPH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760603567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1kqf3EQrRjvy8hLBxOsKf1yyu9mSk9/k5K7ZbsZGnhQ=;
 b=fmYLajD6KgUItcQDMThGAt3k8MDLp96X5c+Me0XwntsF2xIEKHYK81zq49TPprnbocvHWa
 7y/BSfU0nUf8PZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 555E01376E;
 Thu, 16 Oct 2025 08:32:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GHZsE6+t8GhfGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 08:32:47 +0000
Message-ID: <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
Date: Thu, 16 Oct 2025 10:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
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
In-Reply-To: <20251015160326.3657287-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A21DD21E47
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid]
X-Spam-Score: -4.51
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

on patches 2 to 4: sync is really begin/end access wrapped into one 
interface, which I find questionable. I also don't like that these 
patches add generic infrastructure for a single driver.

My proposal is to make your own dma_buf exporter in panthor and set the 
begin/end_cpu_access functions as you need. Panthor already contains its 
own GEM export helper at [1]. If you inline drm_gem_prime_export() [2] 
you can set the cpu_access callbacks to panthor-specific code. The other 
dma-buf helpers' symbols should be exported and can be re-used. That is 
a lot less intrusive and should provide what you need.

I found that a hand full of other DRM drivers implement dma-buf's 
begin/end access callbacks. If you want a generic begin/end interface 
for GEM, you certainly want to get them on board. If there's something 
common to share, this should be done in a separate series.

[1] 
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/panthor/panthor_gem.c#L196
[2] 
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_prime.c#L919

Best regards
Thomas

Am 15.10.25 um 18:03 schrieb Boris Brezillon:
> Prepare things for standardizing synchronization around CPU accesses
> of GEM buffers. This will be used to provide default
> drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> a way for drivers to add their own ioctls to synchronize CPU
> writes/reads when they can't do it directly from userland.
>
> v2:
> - New commit
>
> v3:
> - No changes
>
> v4:
> - Add Steve's R-b
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 10 +++++++++
>   include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a1a9c828938b..a1431e4f2404 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   }
>   EXPORT_SYMBOL(drm_gem_vunmap);
>   
> +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> +		 enum drm_gem_object_access_flags access)
> +{
> +	if (obj->funcs->sync)
> +		return obj->funcs->sync(obj, offset, size, access);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_sync);
> +
>   /**
>    * drm_gem_lock_reservations - Sets up the ww context and acquires
>    * the lock on an array of GEM objects.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 8d48d2af2649..1c33e59ab305 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -66,6 +66,33 @@ enum drm_gem_object_status {
>   	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
>   };
>   
> +/**
> + * enum drm_gem_object_status - bitmask describing GEM access types to prepare for
> + */
> +enum drm_gem_object_access_flags {
> +	/** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> +	DRM_GEM_OBJECT_CPU_ACCESS = 0,
> +
> +	/** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> +	DRM_GEM_OBJECT_DEV_ACCESS = BIT(0),
> +
> +	/** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity doing the access. */
> +	DRM_GEM_OBJECT_ACCESSOR_MASK = BIT(0),
> +
> +	/** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. */
> +	DRM_GEM_OBJECT_READ_ACCESS = BIT(1),
> +
> +	/** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses. */
> +	DRM_GEM_OBJECT_WRITE_ACCESS = BIT(2),
> +
> +	/** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses. */
> +	DRM_GEM_OBJECT_RW_ACCESS = DRM_GEM_OBJECT_READ_ACCESS |
> +				   DRM_GEM_OBJECT_WRITE_ACCESS,
> +
> +	/** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the access type. */
> +	DRM_GEM_OBJECT_ACCESS_TYPE_MASK = DRM_GEM_OBJECT_RW_ACCESS,
> +};
> +
>   /**
>    * struct drm_gem_object_funcs - GEM object functions
>    */
> @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
>   	 */
>   	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
>   
> +	/**
> +	 * @sync:
> +	 *
> +	 * Prepare for CPU/device access. This can involve migration of
> +	 * a buffer to the system-RAM/VRAM, or for UMA, flushing/invalidating
> +	 * the CPU caches. The range can be used to optimize the synchronization
> +	 * when possible.
> +	 *
> +	 * Returns 0 on success, -errno otherwise.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	int (*sync)(struct drm_gem_object *obj, size_t offset, size_t size,
> +		    enum drm_gem_object_access_flags access);
> +
>   	/**
>   	 * @evict:
>   	 *
> @@ -559,6 +601,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
>   int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>   
> +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
> +		 enum drm_gem_object_access_flags access);
> +
>   int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   			   int count, struct drm_gem_object ***objs_out);
>   struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


