Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3BCBB2A4C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 08:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8610E79A;
	Thu,  2 Oct 2025 06:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Bcnr8FDf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uxYeJpOI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bcnr8FDf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uxYeJpOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8810E79A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 06:44:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40FD8337BE;
 Thu,  2 Oct 2025 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759387492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wm/E9IL0TNEXc6lI1S+NvTdTSx2IEmWLi7wwCVOTvKI=;
 b=Bcnr8FDfLoDAZhU5IznPL1TXXRFvZmH6R8/cASQ6BVgZ14tpUORmvmdWccSO6+7z3E749+
 n3GbHuB5KKqK5zwx8KdBubsJYHfh6Wm2aMFiPD80ZZ1v4TtGpdCUNST88SWmH6M/ppsZg4
 rU5yMy7JY7yG7N1cexGfM8pZ8f0JEus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759387492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wm/E9IL0TNEXc6lI1S+NvTdTSx2IEmWLi7wwCVOTvKI=;
 b=uxYeJpOICNf6+++0ZFqxetKc5eitjItjGgXh/SjvztmCf1RrNpLw1d+quPuQ9o8EFHdh67
 SBOlVFVAB9eX1LDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759387492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wm/E9IL0TNEXc6lI1S+NvTdTSx2IEmWLi7wwCVOTvKI=;
 b=Bcnr8FDfLoDAZhU5IznPL1TXXRFvZmH6R8/cASQ6BVgZ14tpUORmvmdWccSO6+7z3E749+
 n3GbHuB5KKqK5zwx8KdBubsJYHfh6Wm2aMFiPD80ZZ1v4TtGpdCUNST88SWmH6M/ppsZg4
 rU5yMy7JY7yG7N1cexGfM8pZ8f0JEus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759387492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wm/E9IL0TNEXc6lI1S+NvTdTSx2IEmWLi7wwCVOTvKI=;
 b=uxYeJpOICNf6+++0ZFqxetKc5eitjItjGgXh/SjvztmCf1RrNpLw1d+quPuQ9o8EFHdh67
 SBOlVFVAB9eX1LDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD35313990;
 Thu,  2 Oct 2025 06:44:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t+pRK2Mf3miZMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Oct 2025 06:44:51 +0000
Message-ID: <bfc90c7a-4ade-4bf0-88e3-86697e664e35@suse.de>
Date: Thu, 2 Oct 2025 08:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array to prevent overflow of
 dynamic size calculation
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 avier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
References: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
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
In-Reply-To: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[12]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linuxfoundation.org,linuxfoundation.org,gmail.com,kernel.org];
 FREEMAIL_TO(0.00)[gmail.com,redhat.com,linux.intel.com,kernel.org,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Am 02.10.25 um 03:33 schrieb Bhanu Seshu Kumar Valluri:
> Use kmalloc_array to avoid potential overflow during dynamic size calculation
> inside kmalloc.
>
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>   Note:
>   Patch compiled successfully.
>   No functionality change is intended.
>
>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index eec43d1a5595..8368f0ffbe1e 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (ret)
>   		return ret;
>   
> -	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
> +	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);

The first parameter is the number of elements. The second parameter is 
the size of an individual element. So the arguments should be swapped. 
Same for the other changes.

I know it's nitpicking, but who knows what it'll be good for. Fun fact 
is that even kmalloc_array mixes up both parameters internally.

Best regards
Thomas


>   	if (!ssd130x_state->data_array)
>   		return -ENOMEM;
>   
> @@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (ret)
>   		return ret;
>   
> -	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
> +	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
>   	if (!ssd130x_state->data_array)
>   		return -ENOMEM;
>   
> @@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
>   
> -	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
> +	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
>   	if (!ssd130x_state->data_array)
>   		return -ENOMEM;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


