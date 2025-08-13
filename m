Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C5B24975
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869B10E4EB;
	Wed, 13 Aug 2025 12:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="meRUGL14";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="764ghwun";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="meRUGL14";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="764ghwun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7610E4EB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:23:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 66A4E1F79B;
 Wed, 13 Aug 2025 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755087806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T47lQkBQudh/1+nauiwrmmybdCCCmve5uwO1TCs1X7A=;
 b=meRUGL14Q7uPT76X79l3jd/e7EPfUvxMjQbLypEDO8sAcQbNqwiKWzUaPhvzPafU4g7P11
 uhfzT22mzLRp8ulbmTgxAP4fNep5vXjqRM7CaV0+Qrn5/GXnmS63i5bL29UgzZIkarmRro
 Pp2P9vFP6ReVbpqeOEmgLQOt/U6z1O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755087806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T47lQkBQudh/1+nauiwrmmybdCCCmve5uwO1TCs1X7A=;
 b=764ghwunmo5aETTO8YoXPy94p6fDQyeLIdE0Ch5Mrv/V0K/NWQTMl2r3/uoCPMJVU3MrJu
 GmhC6/OcknVVzkBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=meRUGL14;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=764ghwun
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755087806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T47lQkBQudh/1+nauiwrmmybdCCCmve5uwO1TCs1X7A=;
 b=meRUGL14Q7uPT76X79l3jd/e7EPfUvxMjQbLypEDO8sAcQbNqwiKWzUaPhvzPafU4g7P11
 uhfzT22mzLRp8ulbmTgxAP4fNep5vXjqRM7CaV0+Qrn5/GXnmS63i5bL29UgzZIkarmRro
 Pp2P9vFP6ReVbpqeOEmgLQOt/U6z1O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755087806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T47lQkBQudh/1+nauiwrmmybdCCCmve5uwO1TCs1X7A=;
 b=764ghwunmo5aETTO8YoXPy94p6fDQyeLIdE0Ch5Mrv/V0K/NWQTMl2r3/uoCPMJVU3MrJu
 GmhC6/OcknVVzkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1282913929;
 Wed, 13 Aug 2025 12:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xqoOA76DnGhWSQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Aug 2025 12:23:26 +0000
Message-ID: <91990b9d-99c2-4476-a1ac-54aaec026f3c@suse.de>
Date: Wed, 13 Aug 2025 14:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/lsdc: Use drm_gem_dumb_map_offset() helper
To: 15620332615@163.com, suijingfeng@loongson.cn,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhuoheng Li <lizhuoheng@kylinos.cn>
References: <20250812124418.30914-1-15620332615@163.com>
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
In-Reply-To: <20250812124418.30914-1-15620332615@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[163.com,loongson.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 66A4E1F79B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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



Am 12.08.25 um 14:44 schrieb 15620332615@163.com:
> From: Zhuoheng Li <lizhuoheng@kylinos.cn>
>
> Replace the open-coded mmap offset calculation in the LSDC
> driver with the drm_gem_dumb_map_offset() helper. This avoids
> code duplication and ensures consistency with other DRM
> drivers.
>
> No functional changes intended.
>
> Signed-off-by: Zhuoheng Li <lizhuoheng@kylinos.cn>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c |  2 +-
>   drivers/gpu/drm/loongson/lsdc_gem.c | 16 ----------------
>   drivers/gpu/drm/loongson/lsdc_gem.h |  5 -----
>   3 files changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index 12193d2a301a..7638cb6dd9b2 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -44,7 +44,7 @@ static const struct drm_driver lsdc_drm_driver = {
>   
>   	.debugfs_init = lsdc_debugfs_init,
>   	.dumb_create = lsdc_dumb_create,
> -	.dumb_map_offset = lsdc_dumb_map_offset,
> +	.dumb_map_offset = drm_gem_dumb_map_offset,
>   	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
>   	DRM_FBDEV_TTM_DRIVER_OPS,
>   };
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..107efd240756 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -246,22 +246,6 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	return 0;
>   }
>   
> -int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
> -			 u32 handle, uint64_t *offset)
> -{
> -	struct drm_gem_object *gobj;
> -
> -	gobj = drm_gem_object_lookup(filp, handle);
> -	if (!gobj)
> -		return -ENOENT;
> -
> -	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
> -
> -	drm_gem_object_put(gobj);
> -
> -	return 0;
> -}
> -
>   void lsdc_gem_init(struct drm_device *ddev)
>   {
>   	struct lsdc_device *ldev = to_lsdc(ddev);
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
> index 92cbb10e6e13..f79f06874286 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.h
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.h
> @@ -14,11 +14,6 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
>   			   struct dma_buf_attachment *attach,
>   			   struct sg_table *sg);
>   
> -int lsdc_dumb_map_offset(struct drm_file *file,
> -			 struct drm_device *dev,
> -			 u32 handle,
> -			 uint64_t *offset);
> -
>   int lsdc_dumb_create(struct drm_file *file,
>   		     struct drm_device *ddev,
>   		     struct drm_mode_create_dumb *args);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


