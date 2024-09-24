Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6F983F7C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A0710E632;
	Tue, 24 Sep 2024 07:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mg8JiQq/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M9VhJik7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mg8JiQq/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M9VhJik7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD83110E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:42:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13E761F786;
 Tue, 24 Sep 2024 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T9i8rGBB2bQ7Yxg9mDLUTIM2+Y59fAcOJWWc55qt5gk=;
 b=mg8JiQq/fVpyc5kFVxlYgeDMGcILteiGx30j3zzLN3EMdUO3dbs3vEAFW3wA7e4oLIH1uX
 mqNkEjNT2lCiQElds1sAGX8KJQcewtWK1wgi/DuA6sGOq1iwPquoqtj/0KX2fvX4aCAj3O
 iA806D4Lgtmh66NzXPx+HV/rVlmyoeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T9i8rGBB2bQ7Yxg9mDLUTIM2+Y59fAcOJWWc55qt5gk=;
 b=M9VhJik7IR6wMb19UUk5oYIlP4krkxno+SE9hSLUzaTxwSanpZK+peSdepN3531voTVJ5b
 0HUvRVCu1QFmhBAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mg8JiQq/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M9VhJik7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T9i8rGBB2bQ7Yxg9mDLUTIM2+Y59fAcOJWWc55qt5gk=;
 b=mg8JiQq/fVpyc5kFVxlYgeDMGcILteiGx30j3zzLN3EMdUO3dbs3vEAFW3wA7e4oLIH1uX
 mqNkEjNT2lCiQElds1sAGX8KJQcewtWK1wgi/DuA6sGOq1iwPquoqtj/0KX2fvX4aCAj3O
 iA806D4Lgtmh66NzXPx+HV/rVlmyoeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T9i8rGBB2bQ7Yxg9mDLUTIM2+Y59fAcOJWWc55qt5gk=;
 b=M9VhJik7IR6wMb19UUk5oYIlP4krkxno+SE9hSLUzaTxwSanpZK+peSdepN3531voTVJ5b
 0HUvRVCu1QFmhBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E223313AA8;
 Tue, 24 Sep 2024 07:42:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jxjzNVxt8mYyaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:42:20 +0000
Message-ID: <281b9b6b-8a58-420a-be5f-6a1ff7988990@suse.de>
Date: Tue, 24 Sep 2024 09:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] fbcon: Introduce get_{fg,bg}_color()
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-6-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 13E761F786
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
> Make the code more legible by adding get_{fg,bg}_color()
> which hide the obscure 'is_fg' parameter of get_color()
> from the caller.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/core/fbcon.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 2a78cca3e9de..17540cdf1edf 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -356,6 +356,16 @@ static int get_color(struct vc_data *vc, struct fb_info *info,
>   	return color;
>   }
>   
> +static int get_fg_color(struct vc_data *vc, struct fb_info *info, u16 c)
> +{
> +	return get_color(vc, info, c, 1);
> +}
> +
> +static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 c)
> +{
> +	return get_color(vc, info, c, 0);
> +}
> +
>   static void fb_flashcursor(struct work_struct *work)
>   {
>   	struct fbcon_ops *ops = container_of(work, struct fbcon_ops, cursor_work.work);
> @@ -387,8 +397,9 @@ static void fb_flashcursor(struct work_struct *work)
>   
>   	c = scr_readw((u16 *) vc->vc_pos);
>   	enable = ops->cursor_flash && !ops->cursor_state.enable;
> -	ops->cursor(vc, info, enable, get_color(vc, info, c, 1),
> -		    get_color(vc, info, c, 0));
> +	ops->cursor(vc, info, enable,
> +		    get_fg_color(vc, info, c),
> +		    get_bg_color(vc, info, c));
>   	console_unlock();
>   
>   	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
> @@ -1297,8 +1308,8 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
>   
>   	if (fbcon_is_active(vc, info))
>   		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
> -			   get_color(vc, info, scr_readw(s), 1),
> -			   get_color(vc, info, scr_readw(s), 0));
> +			   get_fg_color(vc, info, scr_readw(s)),
> +			   get_bg_color(vc, info, scr_readw(s)));
>   }
>   
>   static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
> @@ -1331,8 +1342,9 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
>   	if (!ops->cursor)
>   		return;
>   
> -	ops->cursor(vc, info, enable, get_color(vc, info, c, 1),
> -		    get_color(vc, info, c, 0));
> +	ops->cursor(vc, info, enable,
> +		    get_fg_color(vc, info, c),
> +		    get_bg_color(vc, info, c));
>   }
>   
>   static int scrollback_phys_max = 0;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

