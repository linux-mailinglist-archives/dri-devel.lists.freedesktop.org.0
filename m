Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DCCB6218
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD7010E82C;
	Thu, 11 Dec 2025 14:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eWehcZYV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jn4euTnV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sYyEr4ax";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fRpzSv3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E7310E81C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:03:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BB185BD42;
 Thu, 11 Dec 2025 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765461830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=og6ACgEPMH/0/nps/5Fv/vadMhEZcVendvADmap4OqY=;
 b=eWehcZYVzdTY9DywTIQayVe3cafTJrsyUo53j8iffhtY9nEZU0+5cqd8NKKCJbLAbliFav
 H7EVoZckulUYOpfvAqUC3R2PzPl2nSIfgiZzxPcJT66UNoltVZsY9fZdYhx6rg3euWXdd5
 gUTLhZtCXrYYnOHEnUnJaqLnE0APuCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765461830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=og6ACgEPMH/0/nps/5Fv/vadMhEZcVendvADmap4OqY=;
 b=jn4euTnVd/xxxJBMuPo5D94gP2W+71s1fCgo1ojcPCjj17m3PhF5TYSQK41m2GSv8imLq/
 7iIk2h82oX+wpyCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sYyEr4ax;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fRpzSv3V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765461829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=og6ACgEPMH/0/nps/5Fv/vadMhEZcVendvADmap4OqY=;
 b=sYyEr4axm2HfjBffJaJ09tqyFFIoruApOZeGyf9d9rJmR5Jw/Wy0X5hIUBruxoOD2zQ2vf
 KnEG1ObfERzxOUE9tcaYPIfeGZNr7mrxF1DxxA6SVbI35luwPUFJakoxWg8Vq5kjmD5RNf
 jexlnDbknOLshkqS+5JYYdmAllZDTmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765461829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=og6ACgEPMH/0/nps/5Fv/vadMhEZcVendvADmap4OqY=;
 b=fRpzSv3VtWQXcqgCjDcYd+XUFUD0fqYeJLw5zlUkxzeGyzRoN7pdtRyyuaa9aBAJWy1HSC
 b/kAx/TE4QhRoSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C7143EA63;
 Thu, 11 Dec 2025 14:03:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wFu9BUXPOmnqewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Dec 2025 14:03:49 +0000
Content-Type: multipart/mixed; boundary="------------c3fnSu4TOm4bcY3nPlqE5quh"
Message-ID: <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
Date: Thu, 11 Dec 2025 15:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
References: <dda9846d-3893-43ab-9cce-12a7f41fb974@suse.de>
 <20251210.175635.1285090497167018958.rene@exactco.de>
 <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
 <20251211.134330.2200695829709887915.rene@exactco.de>
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
In-Reply-To: <20251211.134330.2200695829709887915.rene@exactco.de>
X-Spam-Flag: NO
X-Spam-Score: -4.41
X-Rspamd-Queue-Id: 4BB185BD42
X-Spamd-Result: default: False [-4.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,exactco.de:email,suse.de:mid,suse.de:dkim,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 HAS_ATTACHMENT(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

This is a multi-part message in MIME format.
--------------c3fnSu4TOm4bcY3nPlqE5quh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 11.12.25 um 13:43 schrieb René Rebe:
[...]
>> The code for the primary plane should be fine now. But we also need
>> something for the cursor plane as well. There's a
>> ast_set_cursor_image() with a memcpy_toio() [1] and several additional
>> writes. IIUC they all have to be swapped as well.
> Of course, any obvious style issue or endianess swapping linux-kernel
> would like to see differently? You did not answer if I should just
> conditionalize on the chip id. I used a bool to avoid intermangled
> #ifdef conditionals to hopefully match kernel style.
> Btw. checkpatch.pl warns:
>
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
>
> I could add this if desired while at it.
>
> Only compile tested, will do a final hw test once patch is approved in
> general.

It's all a bit excessive. There's a patch attached that will hopefully 
fix the issues.

If you could test it, I'll send it out for official review. The easiest 
way of testing cursor support is to run Xorg and see if the cursor looks 
correct.

The Co-developed-by tag requires your Signed-off-by.

Best regards
Thomas

>
> Thanks!
> 	René
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 20 +++++++++++++++++-
>   drivers/gpu/drm/ast/ast_mode.c   | 35 +++++++++++++++++++++++++++++---
>   drivers/gpu/drm/ast/ast_reg.h    |  2 ++
>   3 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 2d3ad7610c2e..a16745cff83e 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -92,12 +92,30 @@ static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
>   				 unsigned int width, unsigned int height)
>   {
>   	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
> +	bool sw_swab = false;
> +	int i;
>   	u32 csum;
>   
>   	csum = ast_cursor_calculate_checksum(src, width, height);
>   
> +#ifdef __BIG_ENDIAN
> +	/* HW swap bytes on big-endian formats, if possible */
> +	if (ast->chip < AST2400)
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
> +	else
> +		sw_swab = true;
> +#endif
> +
>   	/* write pixel data */
> -	memcpy_toio(dst, src, AST_HWC_SIZE);
> +	if (!sw_swab)
> +		memcpy_toio(dst, src, AST_HWC_SIZE);
> +	else {
> +		for (i = 0; i < AST_HWC_SIZE / 2; i += 2) {
> +			const u16 *src16 = (const u16 *)(src + i);
> +
> +			writel(*src16, dst + i);
> +		}
> +	}
>   
>   	/* write checksum + signature */
>   	dst += AST_HWC_SIZE;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index cd08990a10f9..9a18f0dc1a99 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -526,12 +526,24 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>   
>   static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
>   			      struct drm_framebuffer *fb,
> -			      const struct drm_rect *clip)
> +			      const struct drm_rect *clip,
> +			      struct drm_format_conv_state *fmtcnv_state)
>   {
>   	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
> +	bool sw_swab = false;
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> -	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +
> +#ifdef __BIG_ENDIAN
> +	/* Swap bytes on big-endian formats */
> +	if (ast->chip >= AST2400)
> +		sw_swab = true;
> +#endif
> +
> +	if (sw_swab)
> +		drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);
> +	else
> +		drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
>   }
>   
>   static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> @@ -559,9 +571,26 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   
>   	/* if the buffer comes from another device */
>   	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
> +#ifdef __BIG_ENDIAN
> +		/* HW swap bytes on big-endian formats, if possible */
> +		if (ast->chip < AST2400) {
> +			switch (fb->format->format) {
> +			case DRM_FORMAT_RGB565:
> +				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f,
> +						       AST_IO_VGACRA2_BE_MODE_16);
> +				break;
> +			case DRM_FORMAT_XRGB8888:
> +				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f,
> +						       AST_IO_VGACRA2_BE_MODE);
> +				break;
> +			}
> +		}
> +#endif
> +
>   		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   		drm_atomic_for_each_plane_damage(&iter, &damage) {
> -			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage,
> +					  &shadow_plane_state->fmtcnv_state);
>   		}
>   
>   		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 30578e3b07e4..bcd39d7438b9 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -34,6 +34,8 @@
>   #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
> +#define AST_IO_VGACRA2_BE_MODE		BIT(7)
> +#define AST_IO_VGACRA2_BE_MODE_16	(BIT(7) | BIT(6))
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
>   #define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


--------------c3fnSu4TOm4bcY3nPlqE5quh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ast-Swap-framebuffer-writes-on-big-endian-machin.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-ast-Swap-framebuffer-writes-on-big-endian-machin.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyNzc3YWQwNTBhNTAwOTFmMTg5ZGY5ZTFhNzFiM2U2NDEyNTY4ODkwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCAxMCBEZWMgMjAyNSAwOTo1MjoyMyArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9hc3Q6IFN3YXAgZnJhbWVidWZmZXIgd3JpdGVzIG9uIGJpZy1lbmRp
YW4gbWFjaGluZXMKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKClN3YXAg
dGhlIHBpeGVsIGRhdGEgd2hlbiB3cml0aW5nIHRvIGZyYW1lYnVmZmVyIG1lbW9yeSBvbiBi
aWctZW5kaWFuCm1hY2hpbmVzLiBGaXhlcyBpbmNvcnJlY3Qgb3V0cHV0LiBBc3BlZWQgZ3Jh
cGhpY3MgZG9lcyBub3QgYXBwZWFyIHRvCnN1cHBvcnQgbGl0dGxlLWVuZGlhbiBmcmFtZWJ1
ZmZlcnMgYWZ0ZXIgQVNUMjQwMCwgYWx0aG91Z2ggdGhlIGZlYXR1cmUKaGFzIGJlZW4gZG9j
dW1lbnRlZC4KClRoZXJlJ3MgYSBsZW5ndGh5IGRpc2N1c3Npb24gYXQgWzFdLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNvLWRl
dmVsb3BlZC1ieTogUmVuw6kgUmViZSA8cmVuZUBleGFjdGNvLmRlPgpMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTEyMDIuMTcwNjI2LjIxMzQ0ODI2NjM2
Nzc4MDY4MjUucmVuZUBleGFjdGNvLmRlLyAjIFsxXQotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2N1cnNvci5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICB8IDExICsrKysrKysrKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfY3Vyc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9jdXJzb3IuYwppbmRleCAzMGI2MmQzZjAxNTEuLjAyZTAxOWViOTdjNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfY3Vyc29yLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfY3Vyc29yLmMKQEAgLTkwLDIzICs5MCwzNyBAQCBzdGF0aWMg
dTMyIGFzdF9jdXJzb3JfY2FsY3VsYXRlX2NoZWNrc3VtKGNvbnN0IHZvaWQgKnNyYywgdW5z
aWduZWQgaW50IHdpZHRoLCB1bgogfQogCiBzdGF0aWMgdm9pZCBhc3Rfc2V0X2N1cnNvcl9p
bWFnZShzdHJ1Y3QgYXN0X2RldmljZSAqYXN0LCBjb25zdCB1OCAqc3JjLAotCQkJCSB1bnNp
Z25lZCBpbnQgd2lkdGgsIHVuc2lnbmVkIGludCBoZWlnaHQpCisJCQkJIHVuc2lnbmVkIGlu
dCB3aWR0aCwgdW5zaWduZWQgaW50IGhlaWdodCwKKwkJCQkgc3RydWN0IGRybV9mb3JtYXRf
Y29udl9zdGF0ZSAqZm10Y252X3N0YXRlKQogewogCXU4IF9faW9tZW0gKmRzdCA9IGFzdF9w
bGFuZV92YWRkcigmYXN0LT5jdXJzb3JfcGxhbmUuYmFzZSk7Ci0JdTMyIGNzdW07Ci0KLQlj
c3VtID0gYXN0X2N1cnNvcl9jYWxjdWxhdGVfY2hlY2tzdW0oc3JjLCB3aWR0aCwgaGVpZ2h0
KTsKKwl1MzIgY3N1bSA9IGFzdF9jdXJzb3JfY2FsY3VsYXRlX2NoZWNrc3VtKHNyYywgd2lk
dGgsIGhlaWdodCk7CiAKIAkvKiB3cml0ZSBwaXhlbCBkYXRhICovCi0JbWVtY3B5X3RvaW8o
ZHN0LCBzcmMsIEFTVF9IV0NfU0laRSk7CisjaWYgZGVmaW5lZChfX0JJR19FTkRJQU4pCisJ
dW5zaWduZWQgaW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVNUX0hXQ19TSVpFOyBpICs9
IDIpCisJCXdyaXRldyhzd2FiMTYoKihjb25zdCBfX2JlMTYgKikmc3JjW2ldKSwgJmRzdFtp
XSk7CisJZHN0ICs9IEFTVF9IV0NfU0laRTsKIAogCS8qIHdyaXRlIGNoZWNrc3VtICsgc2ln
bmF0dXJlICovCisJd3JpdGVsKHN3YWIzMihjc3VtKSwgZHN0KTsKKwl3cml0ZWwoc3dhYjMy
KHdpZHRoKSwgZHN0ICsgQVNUX0hXQ19TSUdOQVRVUkVfU2l6ZVgpOworCXdyaXRlbChzd2Fi
MzIoaGVpZ2h0KSwgZHN0ICsgQVNUX0hXQ19TSUdOQVRVUkVfU2l6ZVkpOworCXdyaXRlbChz
d2FiMzIoMCksIGRzdCArIEFTVF9IV0NfU0lHTkFUVVJFX0hPVFNQT1RYKTsKKwl3cml0ZWwo
c3dhYjMyKDApLCBkc3QgKyBBU1RfSFdDX1NJR05BVFVSRV9IT1RTUE9UWSk7CisjZWxzZQor
CW1lbWNweV90b2lvKGRzdCwgc3JjLCBBU1RfSFdDX1NJWkUpOwogCWRzdCArPSBBU1RfSFdD
X1NJWkU7CisKKwkvKiB3cml0ZSBjaGVja3N1bSArIHNpZ25hdHVyZSAqLwogCXdyaXRlbChj
c3VtLCBkc3QpOwogCXdyaXRlbCh3aWR0aCwgZHN0ICsgQVNUX0hXQ19TSUdOQVRVUkVfU2l6
ZVgpOwogCXdyaXRlbChoZWlnaHQsIGRzdCArIEFTVF9IV0NfU0lHTkFUVVJFX1NpemVZKTsK
IAl3cml0ZWwoMCwgZHN0ICsgQVNUX0hXQ19TSUdOQVRVUkVfSE9UU1BPVFgpOwogCXdyaXRl
bCgwLCBkc3QgKyBBU1RfSFdDX1NJR05BVFVSRV9IT1RTUE9UWSk7CisjZW5kaWYKIH0KIAog
c3RhdGljIHZvaWQgYXN0X3NldF9jdXJzb3JfYmFzZShzdHJ1Y3QgYXN0X2RldmljZSAqYXN0
LCB1NjQgYWRkcmVzcykKQEAgLTI2Nyw3ICsyODEsOCBAQCBzdGF0aWMgdm9pZCBhc3RfY3Vy
c29yX3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LAogCQkJCQkJCQkgICAmZGFtYWdlKTsKIAogCQlpZiAoYXJnYjQ0NDQpCi0JCQlhc3Rfc2V0
X2N1cnNvcl9pbWFnZShhc3QsIGFyZ2I0NDQ0LCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQpOwor
CQkJYXN0X3NldF9jdXJzb3JfaW1hZ2UoYXN0LCBhcmdiNDQ0NCwgZmItPndpZHRoLCBmYi0+
aGVpZ2h0LAorCQkJCQkgICAgICZzaGFkb3dfcGxhbmVfc3RhdGUtPmZtdGNudl9zdGF0ZSk7
CiAKIAkJYXN0X3NldF9jdXJzb3JfYmFzZShhc3QsIGRzdF9vZmYpOwogCX0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYwppbmRleCBjZDA4OTkwYTEwZjkuLjU3YzZmYmMzMjMyYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21vZGUuYwpAQCAtNTI2LDEyICs1MjYsMTggQEAgc3RhdGljIGludCBh
c3RfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAogCiBzdGF0aWMgdm9pZCBhc3RfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgYXN0X3Bs
YW5lICphc3RfcGxhbmUsIHN0cnVjdCBpb3N5c19tYXAgKnNyYywKIAkJCSAgICAgIHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiLAotCQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0
ICpjbGlwKQorCQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwLAorCQkJICAg
ICAgc3RydWN0IGRybV9mb3JtYXRfY29udl9zdGF0ZSAqZm10Y252X3N0YXRlKQogewogCXN0
cnVjdCBpb3N5c19tYXAgZHN0ID0gSU9TWVNfTUFQX0lOSVRfVkFERFJfSU9NRU0oYXN0X3Bs
YW5lX3ZhZGRyKGFzdF9wbGFuZSkpOwogCiAJaW9zeXNfbWFwX2luY3IoJmRzdCwgZHJtX2Zi
X2NsaXBfb2Zmc2V0KGZiLT5waXRjaGVzWzBdLCBmYi0+Zm9ybWF0LCBjbGlwKSk7CisKKyNp
ZiBkZWZpbmVkKF9fQklHX0VORElBTikKKwlkcm1fZmJfc3dhYigmZHN0LCBmYi0+cGl0Y2hl
cywgc3JjLCBmYiwgY2xpcCwgIXNyY1swXS5pc19pb21lbSwgZm10Y252X3N0YXRlKTsKKyNl
bHNlCiAJZHJtX2ZiX21lbWNweSgmZHN0LCBmYi0+cGl0Y2hlcywgc3JjLCBmYiwgY2xpcCk7
CisjZW5kaWYKIH0KIAogc3RhdGljIHZvaWQgYXN0X3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0
b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCkBAIC01NjEsNyArNTY3LDgg
QEAgc3RhdGljIHZvaWQgYXN0X3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY191cGRhdGUo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJaWYgKGRybV9nZW1fZmJfYmVnaW5fY3B1X2Fj
Y2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKSA9PSAwKSB7CiAJCWRybV9hdG9taWNfaGVscGVy
X2RhbWFnZV9pdGVyX2luaXQoJml0ZXIsIG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUp
OwogCQlkcm1fYXRvbWljX2Zvcl9lYWNoX3BsYW5lX2RhbWFnZSgmaXRlciwgJmRhbWFnZSkg
ewotCQkJYXN0X2hhbmRsZV9kYW1hZ2UoYXN0X3BsYW5lLCBzaGFkb3dfcGxhbmVfc3RhdGUt
PmRhdGEsIGZiLCAmZGFtYWdlKTsKKwkJCWFzdF9oYW5kbGVfZGFtYWdlKGFzdF9wbGFuZSwg
c2hhZG93X3BsYW5lX3N0YXRlLT5kYXRhLCBmYiwgJmRhbWFnZSwKKwkJCQkJICAmc2hhZG93
X3BsYW5lX3N0YXRlLT5mbXRjbnZfc3RhdGUpOwogCQl9CiAKIAkJZHJtX2dlbV9mYl9lbmRf
Y3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsKLS0gCjIuNTIuMAoK

--------------c3fnSu4TOm4bcY3nPlqE5quh--
