Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE7F9A6AD0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3B910E507;
	Mon, 21 Oct 2024 13:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FcHj6uw5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wqR9ifSR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FcHj6uw5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wqR9ifSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1355B10E507
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:44:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE8431FC11;
 Mon, 21 Oct 2024 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729518279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hTSQvAbY8RZfBqgxZS9AqyMXGVVN8g4/G62BH7uKIoM=;
 b=FcHj6uw5+E2I+8LYk3wi+qKZADtSopJ/GvE5sDYXLYb7FQv0qXYiT+00+Ds4B8oE9UfmOi
 9ceLAvuS0/b4IZ/U5bVV+NopkjjiclzyhlPgq30bnBwB9wizJZRW8wHN9phcNMtynlYS7/
 KWYKGaylDanQCcuLZK54Zzx420NcH+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729518279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hTSQvAbY8RZfBqgxZS9AqyMXGVVN8g4/G62BH7uKIoM=;
 b=wqR9ifSRfFwYSmqS/MFGWE5FtoWtpOx5zEHJ93FisAgdmq4iuir3Teook49bK7UP43/0kO
 41a9BkhFh1FtUpBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729518279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hTSQvAbY8RZfBqgxZS9AqyMXGVVN8g4/G62BH7uKIoM=;
 b=FcHj6uw5+E2I+8LYk3wi+qKZADtSopJ/GvE5sDYXLYb7FQv0qXYiT+00+Ds4B8oE9UfmOi
 9ceLAvuS0/b4IZ/U5bVV+NopkjjiclzyhlPgq30bnBwB9wizJZRW8wHN9phcNMtynlYS7/
 KWYKGaylDanQCcuLZK54Zzx420NcH+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729518279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hTSQvAbY8RZfBqgxZS9AqyMXGVVN8g4/G62BH7uKIoM=;
 b=wqR9ifSRfFwYSmqS/MFGWE5FtoWtpOx5zEHJ93FisAgdmq4iuir3Teook49bK7UP43/0kO
 41a9BkhFh1FtUpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F474139E0;
 Mon, 21 Oct 2024 13:44:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LwRiIcdaFmcGRwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Oct 2024 13:44:39 +0000
Message-ID: <243df93b-4a80-4f84-94cb-1de87e253449@suse.de>
Date: Mon, 21 Oct 2024 15:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/fbdev: fix drm_fb_helper_deferred_io() build
 failure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241021-fix-drm-deferred-v2-1-db1de4c6b042@linaro.org>
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
In-Reply-To: <20241021-fix-drm-deferred-v2-1-db1de4c6b042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:mid,suse.de:email]
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



Am 21.10.24 um 15:37 schrieb Dmitry Baryshkov:
> The drm_fb_helper_deferred_io() uses struct fb_deferred_io_pageref,
> which isn't available without CONFIG_FB_DEFERRED_IO. Put the function
> under corresponding #ifdef to fix build failure if deferred I/O isn't
> enabled.
>
> Fixes: 8058944f5226 ("drm/fbdev: Select fbdev I/O helpers from modules that require them")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks a lot. I'll add the fix to drm-misc in a bit.

Best regards
Thomas

> ---
> Changes in v2:
> - Added guard #ifdef's around function prototype and a stub (Thomas)
> - Link to v1: https://lore.kernel.org/r/20241018-fix-drm-deferred-v1-1-c33bf5d209b0@linaro.org
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 2 ++
>   include/drm/drm_fb_helper.h     | 4 ++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d5e8994345bb..c9008113111b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -697,6 +697,7 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
>   }
>   EXPORT_SYMBOL(drm_fb_helper_damage_area);
>   
> +#ifdef CONFIG_FB_DEFERRED_IO
>   /**
>    * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
>    * @info: fb_info struct pointer
> @@ -740,6 +741,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   	}
>   }
>   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
> +#endif
>   
>   /**
>    * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 699f2790b9ac..8426b9921a03 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -256,7 +256,9 @@ void drm_fb_helper_fill_info(struct fb_info *info,
>   void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len);
>   void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height);
>   
> +#ifdef CONFIG_FB_DEFERRED_IO
>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
> +#endif
>   
>   void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
>   void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
> @@ -361,10 +363,12 @@ static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>   	return 0;
>   }
>   
> +#ifdef CONFIG_FB_DEFERRED_IO
>   static inline void drm_fb_helper_deferred_io(struct fb_info *info,
>   					     struct list_head *pagelist)
>   {
>   }
> +#endif
>   
>   static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>   					     bool suspend)
>
> ---
> base-commit: 2063ca42486bc07b49bc145b5dfcb421f4deebaf
> change-id: 20241018-fix-drm-deferred-01c9996c17a6
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

