Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190CA16BBD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 12:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5493B10E3C7;
	Mon, 20 Jan 2025 11:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z8yG1KFe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4UeYCUuI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z8yG1KFe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4UeYCUuI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240710E3C6;
 Mon, 20 Jan 2025 11:39:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99F932110B;
 Mon, 20 Jan 2025 11:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737373183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PFP35oIgEEH+NelHUwPhLCrJNQz9yPdt3fnPMwwmEUM=;
 b=z8yG1KFeKM4oUpMyuIbUw9pn9c+LIaYMgvs1eIw6a7nGS3pht93Yjb2l03lK+Xnqa2vqzl
 CKa7U1Ul89/rxCg6Eh3nNEh9Gmy0gVtfOKmOqZSlQ7JNhVsOp+tY6+VWqjfQi67mDfkJZ4
 wtf1DE14TXFRI9kztWD2YUOX31f5hG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737373183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PFP35oIgEEH+NelHUwPhLCrJNQz9yPdt3fnPMwwmEUM=;
 b=4UeYCUuISu2a9Dv9NbogkFL3/bIQgBy9Cpt0Xrtq/LakwWo/p2zuy0Eai8XH7Eb2QJkXxd
 nvu1CJlfqfe959Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737373183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PFP35oIgEEH+NelHUwPhLCrJNQz9yPdt3fnPMwwmEUM=;
 b=z8yG1KFeKM4oUpMyuIbUw9pn9c+LIaYMgvs1eIw6a7nGS3pht93Yjb2l03lK+Xnqa2vqzl
 CKa7U1Ul89/rxCg6Eh3nNEh9Gmy0gVtfOKmOqZSlQ7JNhVsOp+tY6+VWqjfQi67mDfkJZ4
 wtf1DE14TXFRI9kztWD2YUOX31f5hG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737373183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PFP35oIgEEH+NelHUwPhLCrJNQz9yPdt3fnPMwwmEUM=;
 b=4UeYCUuISu2a9Dv9NbogkFL3/bIQgBy9Cpt0Xrtq/LakwWo/p2zuy0Eai8XH7Eb2QJkXxd
 nvu1CJlfqfe959Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 793E81393E;
 Mon, 20 Jan 2025 11:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DrMwHP81jmdmVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jan 2025 11:39:43 +0000
Message-ID: <22a7b9e0-3835-4b18-97ba-dc64d08dc5ca@suse.de>
Date: Mon, 20 Jan 2025 12:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/modeset: Handle tiled displays in
 pan_display_atomic.
To: Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250116142825.3933-1-dev@lankhorst.se>
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
In-Reply-To: <20250116142825.3933-1-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_THREE(0.00)[4]
X-Spam-Score: -4.30
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


Am 16.01.25 um 15:28 schrieb Maarten Lankhorst:
> Tiled displays have a different x/y offset to begin with. Instead of
> attempting to remember this, just apply a delta instead.
>
> Hope this works..

As far as I understand the tile code, this makes sense.

>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_fb_helper.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index c9008113111ba..fb3614a7ba44b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1354,14 +1354,14 @@ int drm_fb_helper_set_par(struct fb_info *info)
>   }
>   EXPORT_SYMBOL(drm_fb_helper_set_par);
>   
> -static void pan_set(struct drm_fb_helper *fb_helper, int x, int y)
> +static void pan_set(struct drm_fb_helper *fb_helper, int dx, int dy)
>   {
>   	struct drm_mode_set *mode_set;
>   
>   	mutex_lock(&fb_helper->client.modeset_mutex);
>   	drm_client_for_each_modeset(mode_set, &fb_helper->client) {
> -		mode_set->x = x;
> -		mode_set->y = y;
> +		mode_set->x += dx;
> +		mode_set->y += dy;
>   	}
>   	mutex_unlock(&fb_helper->client.modeset_mutex);
>   }
> @@ -1370,16 +1370,18 @@ static int pan_display_atomic(struct fb_var_screeninfo *var,
>   			      struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> -	int ret;
> +	int ret, dx, dy;
>   
> -	pan_set(fb_helper, var->xoffset, var->yoffset);
> +	dx = var->xoffset - info->var.xoffset;
> +	dy = var->yoffset - info->var.yoffset;
> +	pan_set(fb_helper, dx, dy);
>   
>   	ret = drm_client_modeset_commit_locked(&fb_helper->client);
>   	if (!ret) {
>   		info->var.xoffset = var->xoffset;
>   		info->var.yoffset = var->yoffset;
>   	} else
> -		pan_set(fb_helper, info->var.xoffset, info->var.yoffset);
> +		pan_set(fb_helper, -dx, -dy);
>   
>   	return ret;
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

