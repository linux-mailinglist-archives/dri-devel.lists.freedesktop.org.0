Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939684C7DA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B591131B7;
	Wed,  7 Feb 2024 09:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ptElKhTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pk5apDWL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ptElKhTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pk5apDWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F41131B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:47:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C18A1FBBE;
 Wed,  7 Feb 2024 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707299276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19mBtAnpPLI6ODf/ESRTjTmD/y1XnXEijmq2whMpfOc=;
 b=ptElKhTWQGiy+mGHS874W5vPAKw2KF0BM73KnY7/qUk5MdQaHxrz9uOuVKACpOPSBeKoc0
 qSj52zu+kOViQ6C8pLLL8CP/60YkTlVjNXZl/p+ADjZELbGiVI11w2uod8xJEutVIvx29a
 VgHolPOJxu2pe/C9gPAUXxtMCP8G3nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707299276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19mBtAnpPLI6ODf/ESRTjTmD/y1XnXEijmq2whMpfOc=;
 b=pk5apDWLJwHrfOloGruqNX+aKGVUu/KvIraJl+gMo/0Qp+tF4ZmAkB9UcEUyH+dZ6ZJn02
 U9w1HBUMxb4IqvBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707299276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19mBtAnpPLI6ODf/ESRTjTmD/y1XnXEijmq2whMpfOc=;
 b=ptElKhTWQGiy+mGHS874W5vPAKw2KF0BM73KnY7/qUk5MdQaHxrz9uOuVKACpOPSBeKoc0
 qSj52zu+kOViQ6C8pLLL8CP/60YkTlVjNXZl/p+ADjZELbGiVI11w2uod8xJEutVIvx29a
 VgHolPOJxu2pe/C9gPAUXxtMCP8G3nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707299276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19mBtAnpPLI6ODf/ESRTjTmD/y1XnXEijmq2whMpfOc=;
 b=pk5apDWLJwHrfOloGruqNX+aKGVUu/KvIraJl+gMo/0Qp+tF4ZmAkB9UcEUyH+dZ6ZJn02
 U9w1HBUMxb4IqvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56002139D8;
 Wed,  7 Feb 2024 09:47:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lJinE8xRw2U/VQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 09:47:56 +0000
Message-ID: <7e74ac7c-d0c2-47d4-81ba-483d31624975@suse.de>
Date: Wed, 7 Feb 2024 10:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Add a workaround for low-latency
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch
References: <20240206222203.347626-1-jfalempe@redhat.com>
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
In-Reply-To: <20240206222203.347626-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ptElKhTW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pk5apDWL
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.50
X-Rspamd-Queue-Id: 7C18A1FBBE
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

Am 06.02.24 um 23:21 schrieb Jocelyn Falempe:
> We found a regression in v5.10 on real-time server, using the
> rt-kernel and the mgag200 driver. It's some really specialized
> workload, with <10us latency expectation on isolated core.
> After the v5.10, the real time tasks missed their <10us latency
> when something prints on the screen (fbcon or printk)
>
> The regression has been bisected to 2 commits:
> commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
> commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>
> The first one changed the system memory framebuffer from Write-Combine
> to the default caching.
> Before the second commit, the mgag200 driver used to unmap the
> framebuffer after each frame, which implicitly does a cache flush.
> Both regressions are fixed by this commit, which restore WC mapping
> for the framebuffer in system memory, and add a cache flush.
> This is only needed on x86_64, for low-latency workload,
> so the new kconfig DRM_MGAG200_LATENCY_WORKAROUND depends on
> PREEMPT_RT and X86.
>
> For more context, the whole thread can be found here:
> https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/

This URL should be in a Link tag below the SoB line, like this:

Link: 
https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/ 
# 1 You can refer to it from within the text with [1].
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/mgag200/Kconfig        | 10 ++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.c  | 17 +++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_mode.c |  8 ++++++++
>   3 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
> index b28c5e4828f4..73e4feba743a 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -11,3 +11,13 @@ config DRM_MGAG200
>   	 MGA G200 desktop chips and the server variants. It requires 0.3.0
>   	 of the modesetting userspace driver, and a version of mga driver
>   	 that will fail on KMS enabled devices.
> +
> +config DRM_MGAG200_LATENCY_WORKAROUND

Can we call this DRM_MGAG200_IOBURST_WORKAROUND? I know what you mean by 
latency, but that's not what is happening in the driver. The latency you 
refer to is the deterministic response time of your process, but the 
response time of the driver actually goes up (because of the disabled 
caching).

> +	bool "Enable workaround for low latency server"

This is a 'low-latency server'. But I'd just say "Disabled buffer 
caching", so that users know what they are getting into.

> +	depends on DRM_MGAG200 && PREEMPT_RT && X86
> +	help
> +	  Enable a workaround to have better latency with mgag200 driver.

Here I'd say "Enable a workaround to avoid I/O bursts within the mgag200 
driver at the expense of overall display performance."

> +	  It restores the <v5.10 behavior, by mapping the framebuffer in system
> +	  RAM as Write-Combining, and flushing the cache after each write.
> +	  This is only needed on x86_64 and if you want low-latency.

Maybe "This is only useful on x86_64 if you want to run processes with 
deterministic latency."

The code itself looks good to me.

Best regards
Thomas

> +	  If unsure, say N.
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 54fce00e2136..3fdef8b580cc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -84,6 +84,20 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>   	return offset - 65536;
>   }
>   
> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
> +static struct drm_gem_object *mgag200_create_object(struct drm_device *dev, size_t size)
> +{
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
> +	if (!shmem)
> +		return NULL;
> +
> +	shmem->map_wc = true;
> +	return &shmem->base;
> +}
> +#endif
> +
>   /*
>    * DRM driver
>    */
> @@ -99,6 +113,9 @@ static const struct drm_driver mgag200_driver = {
>   	.major = DRIVER_MAJOR,
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
> +	.gem_create_object = mgag200_create_object,
> +#endif
>   	DRM_GEM_SHMEM_DRIVER_OPS,
>   };
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 0eb769dd76ce..34ef9fb6e96c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -13,6 +13,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_cache.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_format_helper.h>
> @@ -436,6 +437,13 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
>   	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
> +
> +	/* Flushing the cache greatly improves latency on x86_64 */
> +#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
> +	if (!vmap->is_iomem)
> +		drm_clflush_virt_range(vmap->vaddr + clip->y1 * fb->pitches[0],
> +				       drm_rect_height(clip) * fb->pitches[0]);
> +#endif
>   }
>   
>   /*
>
> base-commit: 1f36d634670d8001a45fe2f2dcae546819f9c7d8

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

