Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B695B5CD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD0D10E0A9;
	Thu, 22 Aug 2024 13:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sHknc/0K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cKgUc3hK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sHknc/0K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cKgUc3hK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB7410E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:00:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12794201CD;
 Thu, 22 Aug 2024 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724331601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aKBeKe7fsSigTAIyXm5r128hyGCDYYRNTizHP6ywY/g=;
 b=sHknc/0KD9HUiCcYFITR/8Un5NYcFkOjWjxbvaQfmRZrRvY5NK554n6OjdCVMmyBYf7Dqq
 02xfgn+WPfMtkEuHuNUCVmuAj/aLISlfnQq9hG9+0cLBsUztcmu33EnzlGSVSRmLvYQ3pl
 d/hPBFQWmVhSPJ7jof1sgnlHGNSHWYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724331601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aKBeKe7fsSigTAIyXm5r128hyGCDYYRNTizHP6ywY/g=;
 b=cKgUc3hKaZa2iMTlKnEvY4ZZU2HK8U7t8SYuU5c2MaMpG4o2sXcC3u7I/Li0wnaQP40iPg
 DXctKX0ZQE7JdHCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="sHknc/0K";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cKgUc3hK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724331601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aKBeKe7fsSigTAIyXm5r128hyGCDYYRNTizHP6ywY/g=;
 b=sHknc/0KD9HUiCcYFITR/8Un5NYcFkOjWjxbvaQfmRZrRvY5NK554n6OjdCVMmyBYf7Dqq
 02xfgn+WPfMtkEuHuNUCVmuAj/aLISlfnQq9hG9+0cLBsUztcmu33EnzlGSVSRmLvYQ3pl
 d/hPBFQWmVhSPJ7jof1sgnlHGNSHWYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724331601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aKBeKe7fsSigTAIyXm5r128hyGCDYYRNTizHP6ywY/g=;
 b=cKgUc3hKaZa2iMTlKnEvY4ZZU2HK8U7t8SYuU5c2MaMpG4o2sXcC3u7I/Li0wnaQP40iPg
 DXctKX0ZQE7JdHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92F64139D3;
 Thu, 22 Aug 2024 13:00:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 84SKIlA2x2ZfRAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Aug 2024 13:00:00 +0000
Message-ID: <166850ea-ef40-4868-be26-681ea7a0bca4@suse.de>
Date: Thu, 22 Aug 2024 15:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/panic: Simplify logo handling
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
 <20240822073852.562286-4-jfalempe@redhat.com>
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
In-Reply-To: <20240822073852.562286-4-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 12794201CD
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[18];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,protonmail.com,proton.me,samsung.com,google.com,vger.kernel.org,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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



Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
> Move logo rectangle initialisation, and logo drawing in separate
> functions, so they can be re-used by different panic screens.
> It prepares the introduction of the QR code panic screen.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

with the comments considered.

> ---
>
> v6:
>   * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add panic description")
>
>   drivers/gpu/drm/drm_panic.c | 58 +++++++++++++++++++++----------------
>   1 file changed, 33 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 59fba23e5fd7a..473db5fafb617 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -85,7 +85,7 @@ static struct drm_panic_line panic_msg[] = {
>   	PANIC_LINE(""), /* will be replaced by the panic description */
>   };
>   
> -#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
> +static const int panic_msg_lines = ARRAY_SIZE(panic_msg);

This type should be size_t instead of int

>   
>   static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE("     .--.        _"),
> @@ -97,7 +97,7 @@ static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE(" \\___)=(___/"),
>   };
>   
> -#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
> +static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);

size_t

>   
>   #if defined(CONFIG_LOGO) && !defined(MODULE)
>   static const struct linux_logo *logo_mono;
> @@ -496,31 +496,44 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>   	}
>   }
>   
> +static void drm_panic_logo_rect(struct drm_rect *rect, const struct font_desc *font)
> +{
> +	if (logo_mono)
> +		drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
> +	else {
> +		int logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
> +
> +		drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * font->height);
> +	}
> +}
> +
> +static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *rect,
> +				const struct font_desc *font, u32 fg_color)
> +{
> +	if (logo_mono)
> +		drm_panic_blit(sb, rect, logo_mono->data,
> +			       DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
> +	else
> +		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, rect,
> +				   fg_color);
> +}
> +
>   static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
>   	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg;
> -	unsigned int logo_width, logo_height;
>   	unsigned int msg_width, msg_height;
>   
>   	if (!font)
>   		return;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
> +	drm_panic_logo_rect(&r_logo, font);
>   
> -	if (logo_mono) {
> -		logo_width = logo_mono->width;
> -		logo_height = logo_mono->height;
> -	} else {
> -		logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * font->width;
> -		logo_height = PANIC_LOGO_LINES * font->height;
> -	}
> -	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
> -
> -	msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * font->width, sb->width);
> -	msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
> +	msg_width = min(get_max_line_len(panic_msg, panic_msg_lines) * font->width, sb->width);
> +	msg_height = min(panic_msg_lines * font->height, sb->height);
>   	r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
>   
>   	/* Center the panic message */
> @@ -529,15 +542,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	/* Fill with the background color, and draw text on top */
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
> -	if (!drm_rect_overlap(&r_logo, &r_msg)) {
> -		if (logo_mono)
> -			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
> -				       fg_color);
> -		else
> -			draw_txt_rectangle(sb, font, logo_ascii, PANIC_LOGO_LINES, false, &r_logo,
> -					   fg_color);
> -	}
> -	draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, &r_msg, fg_color);
> +	if (!drm_rect_overlap(&r_logo, &r_msg))
> +		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
> +
> +	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
>   }
>   
>   /*
> @@ -647,7 +655,7 @@ static void drm_panic_set_description(const char *description)
>   	u32 len;
>   
>   	if (description) {
> -		struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
> +		struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
>   
>   		desc_line->txt = description;
>   		len = strlen(description);
> @@ -660,7 +668,7 @@ static void drm_panic_set_description(const char *description)
>   
>   static void drm_panic_clear_description(void)
>   {
> -	struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
> +	struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
>   
>   	desc_line->len = 0;
>   	desc_line->txt = NULL;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

