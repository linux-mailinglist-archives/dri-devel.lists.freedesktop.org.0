Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EDACBCC57
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 08:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0903410E083;
	Mon, 15 Dec 2025 07:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cwOYFbXf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VeGLTgeW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="llz08bjd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zT6ULmHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230FB10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B84D5BD11;
 Mon, 15 Dec 2025 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765783808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ONVY2TB3LRTJoBsj4Kt4j7CcvMyjru5naB13/1b9MJk=;
 b=cwOYFbXfHvS3yAONk7/EStU4Ha3mhX3kn4nRIEzBZe7haOtsIneIfdZK2CIyC5fANQdAef
 h++GKUMid2A2yrikycD3fHNdZPU4wI1mwA6TeccaWPNXd12nLzqbtxoiaN3sXQ372ZRE5B
 OJ8YnuCoayllzrKEYT/9DS9OQRKVPRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765783808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ONVY2TB3LRTJoBsj4Kt4j7CcvMyjru5naB13/1b9MJk=;
 b=VeGLTgeW1+rFQKBo0h6itqq4GmVt259Y5zbbmbMRiAJtcnAExZ8wDGqSOYxXkZfPYysNHP
 gaWkA6nfs/gR5jBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=llz08bjd;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zT6ULmHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765783807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ONVY2TB3LRTJoBsj4Kt4j7CcvMyjru5naB13/1b9MJk=;
 b=llz08bjdBhWe/uzHLdiKt71cSh9QhHmw3cPOcOsEnsJNJNGOWyzrM+1gBbxd3BnsnLPWyY
 1KRoVX/C1HiMujWxYAv0dOYq9SnC9fvp/OZZDB4+oEvPXBBst9P7Lk+dkPJxiP7812V6QZ
 UJHdy2vPr8tOepXm0Q++Xx/3ebviFZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765783807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ONVY2TB3LRTJoBsj4Kt4j7CcvMyjru5naB13/1b9MJk=;
 b=zT6ULmHyXL5SNndw5atctQ+dcVVv8Ei6Stf8ZCJtPr3xOMYScTTyivcX3IKGx79PsOyF4m
 2Ax/U7vflURD54CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A03C3EA63;
 Mon, 15 Dec 2025 07:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CsXIFP+4P2lUIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Dec 2025 07:30:07 +0000
Message-ID: <007be221-b28d-49c0-a7c7-0a4ea74d5d75@suse.de>
Date: Mon, 15 Dec 2025 08:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] drm/ast: Swap framebuffer writes on big-endian machines
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20251212.210504.1355099120650239629.rene@exactco.de>
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
In-Reply-To: <20251212.210504.1355099120650239629.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 7B84D5BD11
X-Spam-Flag: NO
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



Am 12.12.25 um 21:05 schrieb René Rebe:
> Swap the pixel data when writing to framebuffer memory on big-endian
> machines. Fixes incorrect output. Aspeed graphics does not appear to
> support big-endian framebuffers after AST2400, although the feature
> has been documented.
>
> There's a lengthy discussion at [1].
>
> Signed-off-by: René Rebe <rene@exactco.de>
> Link: https://lore.kernel.org/dri-devel/20251202.170626.2134482663677806825.rene@exactco.de/ # [1]

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the updated patch.

> ---
> The ARGB4444 cursor not yet 100% correct, but that might be another layer/helper bug.
> Tested on sparc64 T4-1 running T2/Linux.
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 11 ++++++++---
>   drivers/gpu/drm/ast/ast_mode.c   | 11 +++++++++--
>   2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 2d3ad7610c2e..d4620171d845 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -92,12 +92,17 @@ static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
>   				 unsigned int width, unsigned int height)
>   {
>   	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
> -	u32 csum;
> -
> -	csum = ast_cursor_calculate_checksum(src, width, height);
> +	u32 csum = ast_cursor_calculate_checksum(src, width, height);
>   
>   	/* write pixel data */
> +#if defined(__BIG_ENDIAN)
> +	unsigned int i;
> +
> +	for (i = 0; i < AST_HWC_SIZE; i += 2)
> +		writew(swab16(*(const __be16 *)&src[i]), &dst[i]);
> +#else
>   	memcpy_toio(dst, src, AST_HWC_SIZE);
> +#endif
>   
>   	/* write checksum + signature */
>   	dst += AST_HWC_SIZE;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index cd08990a10f9..57c6fbc3232b 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -526,12 +526,18 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>   
>   static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
>   			      struct drm_framebuffer *fb,
> -			      const struct drm_rect *clip)
> +			      const struct drm_rect *clip,
> +			      struct drm_format_conv_state *fmtcnv_state)
>   {
>   	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> +
> +#if defined(__BIG_ENDIAN)
> +	drm_fb_swab(&dst, fb->pitches, src, fb, clip, !src[0].is_iomem, fmtcnv_state);
> +#else
>   	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +#endif
>   }
>   
>   static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> @@ -561,7 +567,8 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
>   		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   		drm_atomic_for_each_plane_damage(&iter, &damage) {
> -			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage,
> +					  &shadow_plane_state->fmtcnv_state);
>   		}
>   
>   		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


