Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A22AA78CAE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BAF10E72C;
	Wed,  2 Apr 2025 10:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Chdri8RV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Skn7u8Mo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="egqWmeyC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f0T4vPhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A091510E745
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:53:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46DFC1F38A;
 Wed,  2 Apr 2025 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743591213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pZVsAAg1dYgLx0IqvxyNE0ibGRpRelypn0yHf2+NO70=;
 b=Chdri8RVpmrIoWB/JvX7T6Mm4fRKQo0l6k8iilHIVF3t6a6jeNFuoCJYY12itOkv6gcw6f
 cgwC9lBVDUxNpPMmR1Cq3D5dHwjw3fsMrB+tZ5fgfgT/tapch++6i2FNTHdNNvrPy1LpF7
 RBhGxIow3aOjr14M3l5nlpTuufuKcR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743591213;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pZVsAAg1dYgLx0IqvxyNE0ibGRpRelypn0yHf2+NO70=;
 b=Skn7u8MoIxRQ0oCiVeMgt+1Nbm4WHhYPYzX/1vtF5MI3II/e7ZYd25e1Pfork5UepGworZ
 eDviVpP5qzUHN5AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=egqWmeyC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f0T4vPhb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743591212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pZVsAAg1dYgLx0IqvxyNE0ibGRpRelypn0yHf2+NO70=;
 b=egqWmeyCcwozzoKVWUEKZXw/wLuXsYKAT3oJl1hxh0O4Z/bwVvINryQv7ShQkB03osoWJY
 1UFCjGY+a35xsA2M43SOaI345g6jiCipwSc7pCSEDDdn0UCCRjcG3jzM9yODiRMTIQhhiz
 J259pAgWxz203RhcCUfi+Y0gPm3TnYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743591212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pZVsAAg1dYgLx0IqvxyNE0ibGRpRelypn0yHf2+NO70=;
 b=f0T4vPhbhHq0l9yJvmVEiQyQdTKZpN6xbRA0wyrCooRxFnOXGtgIPXYFDXQUxds9PekRkc
 iYsq2Xi2A0IX53AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2312A137D4;
 Wed,  2 Apr 2025 10:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XZQ4BywX7WfWYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Apr 2025 10:53:32 +0000
Message-ID: <4361e048-d2c6-4592-98fe-7b933c09e774@suse.de>
Date: Wed, 2 Apr 2025 12:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/format-helper: fix build
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jocelyn Falempe <jfalempe@redhat.com>
References: <20250402104430.142398-2-matthew.auld@intel.com>
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
In-Reply-To: <20250402104430.142398-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 46DFC1F38A
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Am 02.04.25 um 12:44 schrieb Matthew Auld:
> Build fails with:
>
> error: multiple unsequenced modifications to 'sbuf32'
> [-Werror,-Wunsequenced]
>    264 |                         le32_to_cpup(sbuf32++),
>        |                                            ^
>    265 |                         le32_to_cpup(sbuf32++),
>        |                                            ~~
>
> With that move the increment of the sbuf32 pointer to the end of the
> loop, instead of inside the array list initializer, where the
> order/sequence of the sbuf32 pointer modifications is not defined.
>
> Fixes: 58523a25cbf7 ("drm/format-helper: Optimize 32-to-24-bpp conversion")
> Fixes: 3f31a017ddbc ("drm/format-helper: Optimize 32-to-16-bpp conversion")
> Fixes: 65931bbc5177 ("drm/format-helper: Optimize 32-to-8-bpp conversion")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the fix. I build with W=1 but never saw this error. Do you 
use other build flags?

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_format_helper.c | 32 ++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index fc7347caf600..d36e6cacc575 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -261,10 +261,10 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
>   	/* write 4 pixels at once */
>   	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>   		u32 pix[4] = {
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32),
> +			le32_to_cpup(sbuf32 + 1),
> +			le32_to_cpup(sbuf32 + 2),
> +			le32_to_cpup(sbuf32 + 3),
>   		};
>   		/* write output bytes in reverse order for little endianness */
>   		u32 val32 = xfrm_pixel(pix[0]) |
> @@ -272,6 +272,7 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
>   			   (xfrm_pixel(pix[2]) << 16) |
>   			   (xfrm_pixel(pix[3]) << 24);
>   		*dbuf32++ = cpu_to_le32(val32);
> +		sbuf32 += ARRAY_SIZE(pix);
>   	}
>   
>   	/* write trailing pixels */
> @@ -294,10 +295,10 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>   	/* write 4 pixels at once */
>   	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>   		u32 pix[4] = {
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32),
> +			le32_to_cpup(sbuf32 + 1),
> +			le32_to_cpup(sbuf32 + 2),
> +			le32_to_cpup(sbuf32 + 3),
>   		};
>   		/* write output bytes in reverse order for little endianness */
>   		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
> @@ -305,6 +306,7 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>   			    ((u64)xfrm_pixel(pix[2]) << 32) |
>   			    ((u64)xfrm_pixel(pix[3]) << 48);
>   		*dbuf64++ = cpu_to_le64(val64);
> +		sbuf32 += ARRAY_SIZE(pix);
>   	}
>   #endif
>   
> @@ -312,13 +314,14 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>   	dbuf32 = (__le32 __force *)dbuf64;
>   	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 2)) {
>   		u32 pix[2] = {
> -			le32_to_cpup(sbuf32++),
> -			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32),
> +			le32_to_cpup(sbuf32 + 1),
>   		};
>   		/* write output bytes in reverse order for little endianness */
>   		u32 val32 = xfrm_pixel(pix[0]) |
>   			   (xfrm_pixel(pix[1]) << 16);
>   		*dbuf32++ = cpu_to_le32(val32);
> +		sbuf32 += ARRAY_SIZE(pix);
>   	}
>   
>   	/* write trailing pixel */
> @@ -339,10 +342,10 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
>   	/* write pixels in chunks of 4 */
>   	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>   		u32 val24[4] = {
> -			xfrm_pixel(le32_to_cpup(sbuf32++)),
> -			xfrm_pixel(le32_to_cpup(sbuf32++)),
> -			xfrm_pixel(le32_to_cpup(sbuf32++)),
> -			xfrm_pixel(le32_to_cpup(sbuf32++)),
> +			xfrm_pixel(le32_to_cpup(sbuf32)),
> +			xfrm_pixel(le32_to_cpup(sbuf32 + 1)),
> +			xfrm_pixel(le32_to_cpup(sbuf32 + 2)),
> +			xfrm_pixel(le32_to_cpup(sbuf32 + 3)),
>   		};
>   		u32 out32[3] = {
>   			/* write output bytes in reverse order for little endianness */
> @@ -363,6 +366,7 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
>   		*dbuf32++ = cpu_to_le32(out32[0]);
>   		*dbuf32++ = cpu_to_le32(out32[1]);
>   		*dbuf32++ = cpu_to_le32(out32[2]);
> +		sbuf32 += ARRAY_SIZE(val24);
>   	}
>   
>   	/* write trailing pixel */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

