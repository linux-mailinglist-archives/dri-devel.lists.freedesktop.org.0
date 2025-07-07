Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9DFAFB4BD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943F710E485;
	Mon,  7 Jul 2025 13:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kZp8rfa1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GZg9Ym/U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kZp8rfa1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GZg9Ym/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03ED10E480
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:36:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77ACF1F390;
 Mon,  7 Jul 2025 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751895376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kCpsyBAVgeBE/7bZlnuSr6tZ5EtDhFxHBtTh2tdbI1o=;
 b=kZp8rfa17s73yaUxSsshhEA6mRM9Uu6cjVzou8VyDqe6n1DXY6yafClg8cwv6wLDY0lbKt
 IaC0/rMuj/cMqdtnsbVU81YNyHRkj3c2eQ0ScbYwhkJw8jMcE5KbNyIBbQQ8vOEtdNhCF9
 aqubyaveByxRoCviiaDj1Nb1TDEdw9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751895376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kCpsyBAVgeBE/7bZlnuSr6tZ5EtDhFxHBtTh2tdbI1o=;
 b=GZg9Ym/UMMLxMPgl3Bz33RHcA8O15kFBDJbv+tJHoHr8snHG1J35hXGiCjS0aRzFqTtxEo
 Phnp2PGqQ6ARulCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kZp8rfa1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="GZg9Ym/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751895376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kCpsyBAVgeBE/7bZlnuSr6tZ5EtDhFxHBtTh2tdbI1o=;
 b=kZp8rfa17s73yaUxSsshhEA6mRM9Uu6cjVzou8VyDqe6n1DXY6yafClg8cwv6wLDY0lbKt
 IaC0/rMuj/cMqdtnsbVU81YNyHRkj3c2eQ0ScbYwhkJw8jMcE5KbNyIBbQQ8vOEtdNhCF9
 aqubyaveByxRoCviiaDj1Nb1TDEdw9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751895376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kCpsyBAVgeBE/7bZlnuSr6tZ5EtDhFxHBtTh2tdbI1o=;
 b=GZg9Ym/UMMLxMPgl3Bz33RHcA8O15kFBDJbv+tJHoHr8snHG1J35hXGiCjS0aRzFqTtxEo
 Phnp2PGqQ6ARulCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49EB713757;
 Mon,  7 Jul 2025 13:36:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W6KfEFDNa2gNHQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 13:36:16 +0000
Message-ID: <22582820-eb63-4438-a3da-98ac8f3fdc93@suse.de>
Date: Mon, 7 Jul 2025 15:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/repaper: Do not access GEM-DMA vaddr directly
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250627152422.8399-1-tzimmermann@suse.de>
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
In-Reply-To: <20250627152422.8399-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 77ACF1F390
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 TO_DN_NONE(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 27.06.25 um 17:24 schrieb Thomas Zimmermann:
> Use DRM's shadow-plane helper to map and access the GEM object's buffer
> within kernel address space. Encasulates the vmap logic in the GEM-DMA
> helpers.
>
> The repaper driver currently reads the vaddr field from the GME buffer
> object directly. This only works because GEM code 'automagically' sets
> vaddr.
>
> Shadow-plane helpers perform the same steps, but with correct abstraction
> behind drm_gem_vmap(). The shadow-plane state provides the buffer address
> in kernel address space and the format-conversion state.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tiny/repaper.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 5c3b51eb0a97..4824f863fdba 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -510,13 +510,12 @@ static void repaper_get_temperature(struct repaper_epd *epd)
>   	epd->factored_stage_time = epd->stage_time * factor10x / 10;
>   }
>   
> -static int repaper_fb_dirty(struct drm_framebuffer *fb,
> +static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *vmap,
>   			    struct drm_format_conv_state *fmtcnv_state)
>   {
> -	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
>   	struct repaper_epd *epd = drm_to_epd(fb->dev);
>   	unsigned int dst_pitch = 0;
> -	struct iosys_map dst, vmap;
> +	struct iosys_map dst;
>   	struct drm_rect clip;
>   	int idx, ret = 0;
>   	u8 *buf = NULL;
> @@ -546,8 +545,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
>   		goto out_free;
>   
>   	iosys_map_set_vaddr(&dst, buf);
> -	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
> -	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip, fmtcnv_state);
> +	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, &clip, fmtcnv_state);
>   
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   
> @@ -832,16 +830,15 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>   				struct drm_plane_state *old_state)
>   {
>   	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>   	struct drm_rect rect;
>   
>   	if (!pipe->crtc.state->active)
>   		return;
>   
>   	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> -		repaper_fb_dirty(state->fb, &fmtcnv_state);
> -
> -	drm_format_conv_state_release(&fmtcnv_state);
> +		repaper_fb_dirty(state->fb, shadow_plane_state->data,
> +				 &shadow_plane_state->fmtcnv_state);
>   }
>   
>   static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
> @@ -849,6 +846,7 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
>   	.enable = repaper_pipe_enable,
>   	.disable = repaper_pipe_disable,
>   	.update = repaper_pipe_update,
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
>   };
>   
>   static int repaper_connector_get_modes(struct drm_connector *connector)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

