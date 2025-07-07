Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4788AFB526
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307D810E144;
	Mon,  7 Jul 2025 13:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sZD9YZww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wbx0J+hg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sZD9YZww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wbx0J+hg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1F210E144
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:50:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A9FF21134;
 Mon,  7 Jul 2025 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751896239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oM+IiYIsgCVG2jBUr492C/EQ5qsDGwVPg+F4YMk4e/8=;
 b=sZD9YZwwtjEVFrWZ8xXasMGLUZbCEIBA2jXNzz1p/U/ge9y4r8bPi69+tU9f4osTYJBlWr
 G6Za8JM3pSNbU/o92bAt7c1YnyyS5kQdSC51qJuS4Mrq/TcGyGvwMIEvxmxb1sHWELfGGR
 EqR+HNrKHGYV7iqlmSoeq/DXMo77Ul0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751896239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oM+IiYIsgCVG2jBUr492C/EQ5qsDGwVPg+F4YMk4e/8=;
 b=Wbx0J+hg5j5ZFbHMwK7xkhbvIeiq5BFwFfvxotuL4LZCxkrlmVfJrKPI5el16V/8+JaYl+
 jRyQZLyhrIlyB2Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sZD9YZww;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wbx0J+hg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751896239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oM+IiYIsgCVG2jBUr492C/EQ5qsDGwVPg+F4YMk4e/8=;
 b=sZD9YZwwtjEVFrWZ8xXasMGLUZbCEIBA2jXNzz1p/U/ge9y4r8bPi69+tU9f4osTYJBlWr
 G6Za8JM3pSNbU/o92bAt7c1YnyyS5kQdSC51qJuS4Mrq/TcGyGvwMIEvxmxb1sHWELfGGR
 EqR+HNrKHGYV7iqlmSoeq/DXMo77Ul0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751896239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oM+IiYIsgCVG2jBUr492C/EQ5qsDGwVPg+F4YMk4e/8=;
 b=Wbx0J+hg5j5ZFbHMwK7xkhbvIeiq5BFwFfvxotuL4LZCxkrlmVfJrKPI5el16V/8+JaYl+
 jRyQZLyhrIlyB2Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0423413757;
 Mon,  7 Jul 2025 13:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vHDUOq7Qa2jPIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 13:50:38 +0000
Message-ID: <850a11c2-a809-4cb4-a84d-bdb0d2cd011c@suse.de>
Date: Mon, 7 Jul 2025 15:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Do not map s/g table by default
To: christian.koenig@amd.com, oushixiong@kylinos.cn,
 louis.chauvet@bootlin.com, zenghui.yu@linux.dev, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250630143537.309052-1-tzimmermann@suse.de>
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
In-Reply-To: <20250630143537.309052-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[amd.com,kylinos.cn,bootlin.com,linux.dev,gmail.com,ffwll.ch,redhat.com,linux.intel.com,kernel.org,poorly.run];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6A9FF21134
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Merged

Am 30.06.25 um 16:34 schrieb Thomas Zimmermann:
> The vast majority of drivers that use GEM-SHMEM helpers do not use
> an s/g table for imported buffers; specifically all drivers that use
> DRM_GEM_SHMEM_DRIVER_OPS. Therefore convert the initializer macro
> to DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT and remove the latter. This
> helps to avoid swiotbl errors, such as seen with some Aspeed systems
>
>    ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>
> The error is caused by the system's limited DMA capabilities and can
> happen with any GEM-SHMEM-based driver. It results in a performance
> penalty.
>
> In the case of vgem and vkms, the devices do not support DMA at all,
> which can result in failure to map the buffer object into the kernel's
> address space. [1][2] Avoiding the s/g table fixes this problem.
>
> The other drivers based on GEM-SHMEM, imagination, lima, panfrost,
> panthor, v3d and virtio, use the s/g table of imported buffers. Neither
> driver uses the default initializer, so they won't be affected by
> this change.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Closes: https://lore.kernel.org/dri-devel/6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev/ # [1]
> Reported-by: José Expósito <jose.exposito89@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/20250311172054.2903-1-jose.exposito89@gmail.com/ # [2]
> ---
>   drivers/gpu/drm/ast/ast_drv.c      |  2 +-
>   drivers/gpu/drm/udl/udl_drv.c      |  2 +-
>   include/drm/drm_gem_shmem_helper.h | 18 +++---------------
>   3 files changed, 5 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 054acda41909..6fbf62a99c48 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   
> -	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
>   };
>   
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index ce5ae7cacb90..1922988625eb 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,7 +57,7 @@ static const struct drm_driver driver = {
>   
>   	/* GEM hooks */
>   	.fops = &udl_driver_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
>   
>   	.name = DRIVER_NAME,
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 35f7466dca84..92f5db84b9c2 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -293,23 +293,11 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>   /**
>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>    *
> - * This macro provides a shortcut for setting the shmem GEM operations in
> - * the &drm_driver structure.
> + * This macro provides a shortcut for setting the shmem GEM operations
> + * in the &drm_driver structure. Drivers that do not require an s/g table
> + * for imported buffers should use this.
>    */
>   #define DRM_GEM_SHMEM_DRIVER_OPS \
> -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
> -	.dumb_create		   = drm_gem_shmem_dumb_create
> -
> -/**
> - * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
> - *                                       without mapping sg_table on
> - *                                       imported buffer.
> - *
> - * This macro provides a shortcut for setting the shmem GEM operations in
> - * the &drm_driver structure for drivers that do not require a sg_table on
> - * imported buffers.
> - */
> -#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
>   	.gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
>   	.dumb_create            = drm_gem_shmem_dumb_create
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

