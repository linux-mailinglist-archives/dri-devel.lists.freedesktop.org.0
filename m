Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A619ABF26
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 08:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B38010E0C0;
	Wed, 23 Oct 2024 06:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T7Lh+uUh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kf/+pF0b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T7Lh+uUh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kf/+pF0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C510E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 06:46:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ED201F8AB;
 Wed, 23 Oct 2024 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729666001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EKE1Npi+pSLLQOmOG3uT46RmZV5MISI0D+XDWS2cZOA=;
 b=T7Lh+uUhFfQkHZupMESYBY3BCIh7W26IP9wk4Bh8Oo6nZ5d6X6TXIDdNLcZBtfJUSdjoJ7
 TBPCQtlfy/K8rCMrxH8hdIstlyPu/5Dl+cnQfV0WR8CkisC8o5J8z9kUfukl7yBEqb4w3e
 ZRTZ/++1CnchU0VRMErOrWmusOZOpgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729666001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EKE1Npi+pSLLQOmOG3uT46RmZV5MISI0D+XDWS2cZOA=;
 b=kf/+pF0bJqEcpsSjPaqlY0KIyPO07nudMBxU8KSnN8jtTmK+j/IhJxWSlFdqFCCensnovy
 65Gi212w2nd69FAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729666001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EKE1Npi+pSLLQOmOG3uT46RmZV5MISI0D+XDWS2cZOA=;
 b=T7Lh+uUhFfQkHZupMESYBY3BCIh7W26IP9wk4Bh8Oo6nZ5d6X6TXIDdNLcZBtfJUSdjoJ7
 TBPCQtlfy/K8rCMrxH8hdIstlyPu/5Dl+cnQfV0WR8CkisC8o5J8z9kUfukl7yBEqb4w3e
 ZRTZ/++1CnchU0VRMErOrWmusOZOpgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729666001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EKE1Npi+pSLLQOmOG3uT46RmZV5MISI0D+XDWS2cZOA=;
 b=kf/+pF0bJqEcpsSjPaqlY0KIyPO07nudMBxU8KSnN8jtTmK+j/IhJxWSlFdqFCCensnovy
 65Gi212w2nd69FAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB3B713A63;
 Wed, 23 Oct 2024 06:46:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MkGWM9CbGGe3dgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Oct 2024 06:46:40 +0000
Message-ID: <a56b486c-9341-41aa-a3ab-090f7ffd56d6@suse.de>
Date: Wed, 23 Oct 2024 08:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/client: Remove unused drm_client_framebuffer_flush
To: linux@treblig.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-5-linux@treblig.org>
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
In-Reply-To: <20241022232934.238124-5-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.966]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,treblig.org:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[treblig.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_NONE(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.29
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

Am 23.10.24 um 01:29 schrieb linux@treblig.org:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> drm_client_framebuffer_flush() was explicitly added in 2020
> by
> commit c9c03e3cf072 ("drm/client: Add drm_client_framebuffer_flush()")
> but has never been used.
>
> Remove it.

I had a patchset to use this helper for fbdev emulation. It just needs 
preparation in a number of drivers.

Best regards
Thomas

>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/gpu/drm/drm_client.c | 33 ---------------------------------
>   include/drm/drm_client.h     |  1 -
>   2 files changed, 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index bfedcbf516db..5d10ad3c2ca5 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -552,39 +552,6 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
>   }
>   EXPORT_SYMBOL(drm_client_framebuffer_delete);
>   
> -/**
> - * drm_client_framebuffer_flush - Manually flush client framebuffer
> - * @buffer: DRM client buffer (can be NULL)
> - * @rect: Damage rectangle (if NULL flushes all)
> - *
> - * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
> - * for drivers that need it.
> - *
> - * Returns:
> - * Zero on success or negative error code on failure.
> - */
> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
> -{
> -	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
> -		return 0;
> -
> -	if (rect) {
> -		struct drm_clip_rect clip = {
> -			.x1 = rect->x1,
> -			.y1 = rect->y1,
> -			.x2 = rect->x2,
> -			.y2 = rect->y2,
> -		};
> -
> -		return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
> -						0, 0, &clip, 1);
> -	}
> -
> -	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
> -					0, 0, NULL, 0);
> -}
> -EXPORT_SYMBOL(drm_client_framebuffer_flush);
> -
>   #ifdef CONFIG_DEBUG_FS
>   static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
>   {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bc0e66f9c425..560aae47e06d 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -165,7 +165,6 @@ struct drm_client_buffer {
>   struct drm_client_buffer *
>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>   				 struct iosys_map *map_copy);
>   void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

