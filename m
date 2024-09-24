Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE6983FB0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC39A10E606;
	Tue, 24 Sep 2024 07:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2TV9onql";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CET6CxfS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2TV9onql";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CET6CxfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373410E606
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:51:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8149D1F788;
 Tue, 24 Sep 2024 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727164317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jGww36jTbwK17QaYYzySBvIGWRRlm7HdFpesRSf6EU=;
 b=2TV9onqlp/7s3zZ9zQg12O6snKT4R/iovI4DSGgWYkvbIZKzGZVwhE2bV/J4P3yS0hyZ9k
 7TzN2yctU4qI6A6Yw34nnTBp7eb2UgnRWQ5i+PSZV25/RIoFGML2qGPWGhEPG0trCWM3/0
 Lfcgn0dKqdaNYltDQhw35ns6TqvA1Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727164317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jGww36jTbwK17QaYYzySBvIGWRRlm7HdFpesRSf6EU=;
 b=CET6CxfSzqDxnj/fFyEXE9P5oPOxdZq9rE7tmxJy9pkXvXktMGdz+fXUNE+2KMXje18kau
 17/t/Je9KKIhgqDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2TV9onql;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CET6CxfS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727164317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jGww36jTbwK17QaYYzySBvIGWRRlm7HdFpesRSf6EU=;
 b=2TV9onqlp/7s3zZ9zQg12O6snKT4R/iovI4DSGgWYkvbIZKzGZVwhE2bV/J4P3yS0hyZ9k
 7TzN2yctU4qI6A6Yw34nnTBp7eb2UgnRWQ5i+PSZV25/RIoFGML2qGPWGhEPG0trCWM3/0
 Lfcgn0dKqdaNYltDQhw35ns6TqvA1Do=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727164317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jGww36jTbwK17QaYYzySBvIGWRRlm7HdFpesRSf6EU=;
 b=CET6CxfSzqDxnj/fFyEXE9P5oPOxdZq9rE7tmxJy9pkXvXktMGdz+fXUNE+2KMXje18kau
 17/t/Je9KKIhgqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E0813AA8;
 Tue, 24 Sep 2024 07:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tsaEE51v8mYUawAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:51:57 +0000
Message-ID: <0a01146e-6116-44aa-88ee-4957d5fbc307@suse.de>
Date: Tue, 24 Sep 2024 09:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] fbcon: Use 'bool' where appopriate
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-7-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8149D1F788
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de];
 FREEMAIL_CC(0.00)[gmx.de,ffwll.ch,lists.freedesktop.org];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.51
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



Am 23.09.24 um 17:57 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Use 'bool' type where it makes more sense than 'int'.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/core/fbcon.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 17540cdf1edf..03d48e665bba 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -129,9 +129,9 @@ static int logo_shown = FBCON_LOGO_CANSHOW;
>   /* console mappings */
>   static unsigned int first_fb_vc;
>   static unsigned int last_fb_vc = MAX_NR_CONSOLES - 1;
> -static int fbcon_is_default = 1;
> +static bool fbcon_is_default = true;
>   static int primary_device = -1;
> -static int fbcon_has_console_bind;
> +static bool fbcon_has_console_bind;
>   
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>   static int map_override;
> @@ -166,7 +166,7 @@ static const struct consw fb_con;
>   
>   #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + (delta) * vc->vc_size_row)
>   
> -static int fbcon_cursor_blink;
> +static bool fbcon_cursor_blink;
>   
>   #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
>   
> @@ -281,7 +281,7 @@ static bool fbcon_skip_panic(struct fb_info *info)
>   #endif
>   }
>   
> -static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
> +static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
>   {
>   	struct fbcon_ops *ops = info->fbcon_par;
>   
> @@ -290,7 +290,7 @@ static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
>   }
>   
>   static int get_color(struct vc_data *vc, struct fb_info *info,
> -	      u16 c, int is_fg)
> +		     u16 c, bool is_fg)
>   {
>   	int depth = fb_get_color_depth(&info->var, &info->fix);
>   	int color = 0;
> @@ -358,12 +358,12 @@ static int get_color(struct vc_data *vc, struct fb_info *info,
>   
>   static int get_fg_color(struct vc_data *vc, struct fb_info *info, u16 c)
>   {
> -	return get_color(vc, info, c, 1);
> +	return get_color(vc, info, c, true);
>   }
>   
>   static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 c)
>   {
> -	return get_color(vc, info, c, 0);
> +	return get_color(vc, info, c, false);
>   }
>   
>   static void fb_flashcursor(struct work_struct *work)
> @@ -467,7 +467,7 @@ static int __init fb_console_setup(char *this_opt)
>   				last_fb_vc = simple_strtoul(options, &options, 10) - 1;
>   			if (last_fb_vc < first_fb_vc || last_fb_vc >= MAX_NR_CONSOLES)
>   				last_fb_vc = MAX_NR_CONSOLES - 1;
> -			fbcon_is_default = 0;
> +			fbcon_is_default = false;
>   			continue;
>   		}
>   
> @@ -558,7 +558,7 @@ static int do_fbcon_takeover(int show_logo)
>   			con2fb_map[i] = -1;
>   		info_idx = -1;
>   	} else {
> -		fbcon_has_console_bind = 1;
> +		fbcon_has_console_bind = true;
>   	}
>   
>   	return err;
> @@ -2802,7 +2802,7 @@ static void fbcon_unbind(void)
>   				fbcon_is_default);
>   
>   	if (!ret)
> -		fbcon_has_console_bind = 0;
> +		fbcon_has_console_bind = false;
>   }
>   #else
>   static inline void fbcon_unbind(void) {}
> @@ -3234,8 +3234,9 @@ static ssize_t cursor_blink_store(struct device *device,
>   				  const char *buf, size_t count)
>   {
>   	struct fb_info *info;
> -	int blink, idx;
>   	char **last = NULL;
> +	bool blink;
> +	int idx;
>   
>   	blink = simple_strtoul(buf, last, 0);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

