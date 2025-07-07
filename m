Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10592AFB4C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EC210E1ED;
	Mon,  7 Jul 2025 13:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OiZMNbMM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xl6N/ncw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OiZMNbMM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xl6N/ncw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C7D10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:40:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC11F1F390;
 Mon,  7 Jul 2025 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751895632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aVxApudmJ2CYO4UepDaEQg6oCHcTzb9/LD2lyg1wts=;
 b=OiZMNbMMWtrzY48HK81JNPaMnM7HMmbDAGQFu9XDzW3O0tfxC8EycQStovt2SbWsOnTQas
 ESZT3lV30NM2Ems0pWbasEFhjc+/UPzN3VhJLQAcOc1gSnkaPSaRJMSGzCiU9OAeMKQCNz
 9QrCu+EwhT7UxA2avrDruhSVybEZBUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751895632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aVxApudmJ2CYO4UepDaEQg6oCHcTzb9/LD2lyg1wts=;
 b=xl6N/ncwfOynJklEaQSQoKxaT9/cboReafUuAZiTcsO0JQe8DjqljpfopdT/e7y3QJSlao
 eC0CiGQ/omwAJTAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OiZMNbMM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="xl6N/ncw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751895632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aVxApudmJ2CYO4UepDaEQg6oCHcTzb9/LD2lyg1wts=;
 b=OiZMNbMMWtrzY48HK81JNPaMnM7HMmbDAGQFu9XDzW3O0tfxC8EycQStovt2SbWsOnTQas
 ESZT3lV30NM2Ems0pWbasEFhjc+/UPzN3VhJLQAcOc1gSnkaPSaRJMSGzCiU9OAeMKQCNz
 9QrCu+EwhT7UxA2avrDruhSVybEZBUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751895632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aVxApudmJ2CYO4UepDaEQg6oCHcTzb9/LD2lyg1wts=;
 b=xl6N/ncwfOynJklEaQSQoKxaT9/cboReafUuAZiTcsO0JQe8DjqljpfopdT/e7y3QJSlao
 eC0CiGQ/omwAJTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BAA213757;
 Mon,  7 Jul 2025 13:40:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id my/KHFDOa2hsHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 13:40:32 +0000
Message-ID: <f9533d3f-e3be-4bea-b0bc-7fda45c93f79@suse.de>
Date: Mon, 7 Jul 2025 15:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sharp-memory: Do not access GEM-DMA vaddr directly
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250627152327.8244-1-tzimmermann@suse.de>
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
In-Reply-To: <20250627152327.8244-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; TO_DN_NONE(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AC11F1F390
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

ping for a review

Am 27.06.25 um 17:23 schrieb Thomas Zimmermann:
> Use DRM's shadow-plane helper to map and access the GEM object's buffer
> within kernel address space. Encasulates the vmap logic in the GEM-DMA
> helpers.
>
> The sharp-memory driver currently reads the vaddr field from the GME
> buffer object directly. This only works because GEM code 'automagically'
> sets vaddr.
>
> Shadow-plane helpers perform the same steps, but with correct abstraction
> behind drm_gem_vmap(). The shadow-plane state provides the buffer address
> in kernel address space and the format-conversion state.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tiny/sharp-memory.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> index 03d2850310c4..64272cd0f6e2 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -126,28 +126,28 @@ static inline void sharp_memory_set_tx_buffer_addresses(u8 *buffer,
>   
>   static void sharp_memory_set_tx_buffer_data(u8 *buffer,
>   					    struct drm_framebuffer *fb,
> +					    const struct iosys_map *vmap,
>   					    struct drm_rect clip,
>   					    u32 pitch,
>   					    struct drm_format_conv_state *fmtcnv_state)
>   {
>   	int ret;
> -	struct iosys_map dst, vmap;
> -	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +	struct iosys_map dst;
>   
>   	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>   	if (ret)
>   		return;
>   
>   	iosys_map_set_vaddr(&dst, buffer);
> -	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
>   
> -	drm_fb_xrgb8888_to_mono(&dst, &pitch, &vmap, fb, &clip, fmtcnv_state);
> +	drm_fb_xrgb8888_to_mono(&dst, &pitch, vmap, fb, &clip, fmtcnv_state);
>   
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   }
>   
>   static int sharp_memory_update_display(struct sharp_memory_device *smd,
>   				       struct drm_framebuffer *fb,
> +				       const struct iosys_map *vmap,
>   				       struct drm_rect clip,
>   				       struct drm_format_conv_state *fmtcnv_state)
>   {
> @@ -163,7 +163,7 @@ static int sharp_memory_update_display(struct sharp_memory_device *smd,
>   	sharp_memory_set_tx_buffer_mode(&tx_buffer[0],
>   					SHARP_MEMORY_DISPLAY_UPDATE_MODE, vcom);
>   	sharp_memory_set_tx_buffer_addresses(&tx_buffer[1], clip, pitch);
> -	sharp_memory_set_tx_buffer_data(&tx_buffer[2], fb, clip, pitch, fmtcnv_state);
> +	sharp_memory_set_tx_buffer_data(&tx_buffer[2], fb, vmap, clip, pitch, fmtcnv_state);
>   
>   	ret = sharp_memory_spi_write(smd->spi, tx_buffer, tx_buffer_size);
>   
> @@ -206,7 +206,8 @@ static int sharp_memory_clear_display(struct sharp_memory_device *smd)
>   	return ret;
>   }
>   
> -static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect,
> +static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *vmap,
> +				  struct drm_rect *rect,
>   				  struct drm_format_conv_state *fmtconv_state)
>   {
>   	struct drm_rect clip;
> @@ -218,7 +219,7 @@ static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *r
>   	clip.y1 = rect->y1;
>   	clip.y2 = rect->y2;
>   
> -	sharp_memory_update_display(smd, fb, clip, fmtconv_state);
> +	sharp_memory_update_display(smd, fb, vmap, clip, fmtconv_state);
>   }
>   
>   static int sharp_memory_plane_atomic_check(struct drm_plane *plane,
> @@ -242,7 +243,7 @@ static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
>   {
>   	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
>   	struct drm_plane_state *plane_state = plane->state;
> -	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>   	struct sharp_memory_device *smd;
>   	struct drm_rect rect;
>   
> @@ -251,15 +252,15 @@ static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
>   		return;
>   
>   	if (drm_atomic_helper_damage_merged(old_state, plane_state, &rect))
> -		sharp_memory_fb_dirty(plane_state->fb, &rect, &fmtcnv_state);
> -
> -	drm_format_conv_state_release(&fmtcnv_state);
> +		sharp_memory_fb_dirty(plane_state->fb, shadow_plane_state->data,
> +				      &rect, &shadow_plane_state->fmtcnv_state);
>   }
>   
>   static const struct drm_plane_helper_funcs sharp_memory_plane_helper_funcs = {
>   	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>   	.atomic_check = sharp_memory_plane_atomic_check,
>   	.atomic_update = sharp_memory_plane_atomic_update,
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   };
>   
>   static bool sharp_memory_format_mod_supported(struct drm_plane *plane,
> @@ -273,9 +274,7 @@ static const struct drm_plane_funcs sharp_memory_plane_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
>   	.destroy = drm_plane_cleanup,
> -	.reset = drm_atomic_helper_plane_reset,
> -	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
>   	.format_mod_supported = sharp_memory_format_mod_supported,
>   };
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

