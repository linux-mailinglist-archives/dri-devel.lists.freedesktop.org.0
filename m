Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8357DB968B9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDCF10E1EE;
	Tue, 23 Sep 2025 15:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="A+gj0jP8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M9O4+V5H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A+gj0jP8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M9O4+V5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5D310E202
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:21:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C2881F7F4;
 Tue, 23 Sep 2025 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758640897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49VtfWcgbDap/wiXADPZ3BMXozuzKI2e+wmDabn0Ky0=;
 b=A+gj0jP8IpXodEJAtAqqIcm+yqybcP8ofnj4kNvTsn5+osiEr3Vo2EztPp5hOfdde/qpwp
 xnkDsp6/cOeb1ILvpvlDQ97tg1bPob/AD6TQZUgsA1bGL33ERViBkw13kDNH1to4Bz7xmy
 EIUWp8lxb7XSNphbJesf0rlBHBPOCpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758640897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49VtfWcgbDap/wiXADPZ3BMXozuzKI2e+wmDabn0Ky0=;
 b=M9O4+V5HZH4bBeG27XOytmI/UqdnDJXq9IXjHTRauorPMvdvaINcEOVoMWuLsIBFQ0KysI
 2KbRbnbp2qXlXJDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A+gj0jP8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M9O4+V5H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758640897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49VtfWcgbDap/wiXADPZ3BMXozuzKI2e+wmDabn0Ky0=;
 b=A+gj0jP8IpXodEJAtAqqIcm+yqybcP8ofnj4kNvTsn5+osiEr3Vo2EztPp5hOfdde/qpwp
 xnkDsp6/cOeb1ILvpvlDQ97tg1bPob/AD6TQZUgsA1bGL33ERViBkw13kDNH1to4Bz7xmy
 EIUWp8lxb7XSNphbJesf0rlBHBPOCpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758640897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49VtfWcgbDap/wiXADPZ3BMXozuzKI2e+wmDabn0Ky0=;
 b=M9O4+V5HZH4bBeG27XOytmI/UqdnDJXq9IXjHTRauorPMvdvaINcEOVoMWuLsIBFQ0KysI
 2KbRbnbp2qXlXJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44C7F1388C;
 Tue, 23 Sep 2025 15:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lTCbDwG70mjaVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Sep 2025 15:21:37 +0000
Message-ID: <b76b8168-bca1-4374-9626-7d7d155d79ae@suse.de>
Date: Tue, 23 Sep 2025 17:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: fix buffer overflow in fbcon_set_font
To: Simon Richter <Simon.Richter@hogyros.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable <stable@vger.kernel.org>
References: <20250923150642.2441-1-Simon.Richter@hogyros.de>
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
In-Reply-To: <20250923150642.2441-1-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6C2881F7F4
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

Hi,

thanks for the patch. The fix at [1] has meanwhile been merged into the 
DRM tree.

[1] https://patchwork.freedesktop.org/series/154848/

Best regards
Thomas

Am 23.09.25 um 17:06 schrieb Simon Richter:
> Commit 1a194e6c8e1ee745e914b0b7f50fa86c89ed13fe introduced overflow
> checking for the font allocation size calculation, but in doing so moved
> the addition of the size for font housekeeping data out of the kmalloc
> call.
>
> As a result, the calculated size now includes those extra bytes, which
> marks the same number of bytes beyond the allocation as valid font data.
>
> The crc32() call and the later memcmp() in fbcon_set_font() already perform
> an out-of-bounds read, the latter is flagged on ppc64el:
>
>      memcmp: detected buffer overflow: 4112 byte read of buffer size 4096
>
> when loading Lat15-Fixed16.psf.gz.
>
> Since the addition of the extra size should only go into the kmalloc()
> call, calculate this size in a separate variable.
>
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Fixes: 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
> Cc: stable <stable@vger.kernel.org> #v5.9+
> ---
>   drivers/video/fbdev/core/fbcon.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 5fade44931b8..a3fbf42c57d9 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2518,7 +2518,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
>   	unsigned charcount = font->charcount;
>   	int w = font->width;
>   	int h = font->height;
> -	int size;
> +	int size, allocsize;
>   	int i, csum;
>   	u8 *new_data, *data = font->data;
>   	int pitch = PITCH(font->width);
> @@ -2551,10 +2551,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
>   		return -EINVAL;
>   
>   	/* Check for overflow in allocation size calculation */
> -	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
> +	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &allocsize))
>   		return -EINVAL;
>   
> -	new_data = kmalloc(size, GFP_USER);
> +	new_data = kmalloc(allocsize, GFP_USER);
>   
>   	if (!new_data)
>   		return -ENOMEM;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


