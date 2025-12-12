Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4ADCB8D44
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 13:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D576F10E05A;
	Fri, 12 Dec 2025 12:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TEiY1VXZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9FhieCC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BAHpRcOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RSjx8dg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277A510E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:52:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 292C7338F1;
 Fri, 12 Dec 2025 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765543972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQ40Gv/Qb5ANekGEUVnw13vP7R5vCFsUM2e2zjT+t+c=;
 b=TEiY1VXZGZBMjyi8XMzGJgXLo23ucV2Hipax9onvPGQOcT3nf87lnniSnJzEjNgGHq5Vp7
 2socWdeYk6aeSHXNaxHyFxqz9udyJZLROhsbgyaYPHUSLLKfsf0qGZ6r5Vy0CJrpa05kR6
 NxkS0+s0Ek1gc8tUcJmg24FhSLQPWDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765543972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQ40Gv/Qb5ANekGEUVnw13vP7R5vCFsUM2e2zjT+t+c=;
 b=q9FhieCCBKKRRnG72TSgibUsYIpVvBKq73VzNENcyh1PRN2aDZnEVzaz4bPEft4b4TGu9b
 IXUoLlJtx9guf+AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BAHpRcOu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RSjx8dg8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765543971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQ40Gv/Qb5ANekGEUVnw13vP7R5vCFsUM2e2zjT+t+c=;
 b=BAHpRcOu+jMwE6iRFmaFvWrXZprpu9dZn18qjFUApCQTo7HwbXzMzmemWS9QyHOS1DQ+mS
 GqNqRR1Lpp7VqZs0Fwl8OkmKjxzC8ycCsK7hbyF0JiaHxgTVvkHK9snFVGK8QmpxdaLqf6
 pauWCrURng7IOaZAyOk1KN7kbt574Zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765543971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQ40Gv/Qb5ANekGEUVnw13vP7R5vCFsUM2e2zjT+t+c=;
 b=RSjx8dg8B6+cVFIm6772PKgGdJveLYKJbS82DbrG/FCJGlxpIGHNcvGUCYcuh/j4Gd/h8K
 2py3tqT4YqGpHeBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDD613EA63;
 Fri, 12 Dec 2025 12:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id frxYMCIQPGlSagAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Dec 2025 12:52:50 +0000
Message-ID: <b8876904-7365-4bea-bca1-9ea9b50e069e@suse.de>
Date: Fri, 12 Dec 2025 13:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Increase timeout in
 drm_atomic_helper_wait_for_vblanks()
To: chintanlike@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
 syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
References: <20251209143325.102056-1-tzimmermann@suse.de>
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
In-Reply-To: <20251209143325.102056-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 292C7338F1
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_NONE(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 TAGGED_RCPT(0.00)[fcede535e7eb57cf5b43];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, appspotmail.com:email, suse.de:mid, suse.de:dkim,
 suse.de:email]
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



Am 09.12.25 um 15:33 schrieb Thomas Zimmermann:
> Increase the timeout for vblank events from 100 ms to 1000 ms. This
> is the same fix as in commit f050da08a4ed ("drm/vblank: Increase
> timeout in drm_wait_one_vblank()") for another vblank timeout.
>
> After merging generic DRM vblank timers [1] and converting several
> DRM drivers for virtual hardware, these drivers synchronize their
> vblank events to the display refresh rate. This can trigger timeouts
> within the DRM framework.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/20250904145806.430568-1-tzimmermann@suse.de/ # [1]
> Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.0017.GAE@google.com/

Fixes: 74afeb812850 ("drm/vblank: Add vblank timer")


> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e641fcf8c568..e108f91bc3dd 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1839,7 +1839,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>   		ret = wait_event_timeout(*queue,
>   					 state->crtcs[i].last_vblank_count !=
>   						drm_crtc_vblank_count(crtc),
> -					 msecs_to_jiffies(100));
> +					 msecs_to_jiffies(1000));
>   
>   		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
>   		     crtc->base.id, crtc->name);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


