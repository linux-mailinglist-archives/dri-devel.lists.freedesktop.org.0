Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E405C51534
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBCD10E1AF;
	Wed, 12 Nov 2025 09:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dztu0/0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XWCKyBtf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dztu0/0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XWCKyBtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412610E1AF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:23:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 911A81F45E;
 Wed, 12 Nov 2025 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762939432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0FJFL6dWg0P4fFUyB5CUNct3wfLnH3tlSYXOel+VIeI=;
 b=dztu0/0p8ctT7Tt+vKtEzH48xn+7fjHMV0XvCFmqY4CZnxwKXIHiiuVeBpczP+JwvI/rGh
 sGdWIAsjU7+c+0itJ+pv4BgUiGSATGhZpRipAV2C/cXfoUz5zoysuImzzDZjZUc6UabsqX
 ojzPfg9S1HZSv7W6yVBNo8VQ53T4eVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762939432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0FJFL6dWg0P4fFUyB5CUNct3wfLnH3tlSYXOel+VIeI=;
 b=XWCKyBtfsM0k7R4YaKXdLyI24+hPT6e8j8Wgk8UEq1z7kNqQDRc8UcIw6vtoBEpBbpF9Go
 5ixzPzaMc8bgXAAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762939432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0FJFL6dWg0P4fFUyB5CUNct3wfLnH3tlSYXOel+VIeI=;
 b=dztu0/0p8ctT7Tt+vKtEzH48xn+7fjHMV0XvCFmqY4CZnxwKXIHiiuVeBpczP+JwvI/rGh
 sGdWIAsjU7+c+0itJ+pv4BgUiGSATGhZpRipAV2C/cXfoUz5zoysuImzzDZjZUc6UabsqX
 ojzPfg9S1HZSv7W6yVBNo8VQ53T4eVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762939432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0FJFL6dWg0P4fFUyB5CUNct3wfLnH3tlSYXOel+VIeI=;
 b=XWCKyBtfsM0k7R4YaKXdLyI24+hPT6e8j8Wgk8UEq1z7kNqQDRc8UcIw6vtoBEpBbpF9Go
 5ixzPzaMc8bgXAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6674B3EA61;
 Wed, 12 Nov 2025 09:23:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SS6OFyhSFGmXegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 09:23:52 +0000
Message-ID: <4b31ebb8-a120-495c-95cc-4c79f2f90ae3@suse.de>
Date: Wed, 12 Nov 2025 10:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vmwgfx: Add drm_panic support
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ryosuke Yasuoka <ryasuoka@redhat.com>
References: <20251023200447.206834-1-ian.forbes@broadcom.com>
 <20251107204620.1021749-1-ian.forbes@broadcom.com>
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
In-Reply-To: <20251107204620.1021749-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, imap1.dmz-prg2.suse.org:helo,
 broadcom.com:email, suse.com:url]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 07.11.25 um 21:46 schrieb Ian Forbes:
> Sets up VRAM as the scanout buffer then switches to legacy mode.

Please use make this a bit more elaborate.

Please also note that you don't set up VRAM, but return the scanout 
information for the given plane. That could be a difference if there are 
multiple planes.

>
> Suggested-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>
> v2:
>   - Set SVGA_REG_CONFIG_DONE=false so that SVGA3 works correctly
>
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 35 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 ++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
>   3 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index efdbb67a4966..87448e86d3b3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -20,6 +20,7 @@
>   #include <drm/drm_rect.h>
>   #include <drm/drm_sysfs.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_panic.h>
>   
>   void vmw_du_init(struct vmw_display_unit *du)
>   {
> @@ -2025,3 +2026,37 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
>   {
>   	return !uo->buffer && !uo->surface;
>   }
> +
> +int
> +vmw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
> +{
> +	void  *vram;
> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> +
> +	// Only call on the primary display
> +	if (container_of(plane, struct vmw_display_unit, primary)->unit != 0)
> +		return -EINVAL;
> +
> +	vmw_write(vmw_priv, SVGA_REG_CONFIG_DONE, false);
> +
> +	vram = memremap(vmw_priv->vram_start, vmw_priv->vram_size,
> +			MEMREMAP_WB | MEMREMAP_DEC);
> +	if (!vram)
> +		return -ENOMEM;
> +

> +	sb->map[0].vaddr = vram;

Please use iosys_map_set_vaddr() to initialize this field.

> +	sb->format = drm_format_info(DRM_FORMAT_RGB565);
> +	sb->width  = vmw_priv->initial_width;
> +	sb->height = vmw_priv->initial_height;

Usually, you want to look at the plane's current framebuffer for this 
information.

> +	sb->pitch[0] = sb->width * 2;


Please use drm_format_info_min_pitch() to compute this value or set 
whatever has been programmed to the hardware already.

Best regards
Thomas


> +	return 0;
> +}
> +
> +void vmw_panic_flush(struct drm_plane *plane)
> +{
> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
> +
> +	vmw_kms_write_svga(vmw_priv,
> +			   vmw_priv->initial_width, vmw_priv->initial_height,
> +			   vmw_priv->initial_width * 2, 16, 16);
> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 445471fe9be6..8e37561cd527 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -500,6 +500,11 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
>   
>   int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
>   
> +struct drm_scanout_buffer;
> +
> +int vmw_get_scanout_buffer(struct drm_plane *pl, struct drm_scanout_buffer *sb);
> +void vmw_panic_flush(struct drm_plane *plane);
> +
>   /**
>    * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
>    * @state: Plane state.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index add13294fb7c..faacfef7baa5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
>   	.atomic_update = vmw_stdu_primary_plane_atomic_update,
>   	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
>   	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
> +	.get_scanout_buffer = vmw_get_scanout_buffer,
> +	.panic_flush = vmw_panic_flush,
>   };
>   
>   static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


