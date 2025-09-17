Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67531B7EC12
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5FB10E43E;
	Wed, 17 Sep 2025 09:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tZAje8IZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ntpufKvP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tZAje8IZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ntpufKvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827B610E16A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:20:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 459E71F456;
 Wed, 17 Sep 2025 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758100823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5tk+r5R/k8njcQI73K4TtrfXFTXLCZoxOGoZ0oxk0u4=;
 b=tZAje8IZWc8Krfc4yHx/T6mHwHr4a3Pip1ewhAZR44ws4YmfiQjumnwhH7LiMKa3nfn2u0
 Ex9NN0wLgFMa0cE3OtYUl8VISdauIJMFlzdW5GSE5wjTp0FvwTu3n6ldR+z59kJamf9Tkp
 EaXTS6yKhZ77CrYJjMYUy3sIhlyQZ7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758100823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5tk+r5R/k8njcQI73K4TtrfXFTXLCZoxOGoZ0oxk0u4=;
 b=ntpufKvPTP2zwujZmCJjBCn8ByZ6R95iRNyunyELPDG+ULfPSUYhqOdVXQoeyW4+PBpMhI
 whXzDoonW7EVVuAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758100823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5tk+r5R/k8njcQI73K4TtrfXFTXLCZoxOGoZ0oxk0u4=;
 b=tZAje8IZWc8Krfc4yHx/T6mHwHr4a3Pip1ewhAZR44ws4YmfiQjumnwhH7LiMKa3nfn2u0
 Ex9NN0wLgFMa0cE3OtYUl8VISdauIJMFlzdW5GSE5wjTp0FvwTu3n6ldR+z59kJamf9Tkp
 EaXTS6yKhZ77CrYJjMYUy3sIhlyQZ7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758100823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5tk+r5R/k8njcQI73K4TtrfXFTXLCZoxOGoZ0oxk0u4=;
 b=ntpufKvPTP2zwujZmCJjBCn8ByZ6R95iRNyunyELPDG+ULfPSUYhqOdVXQoeyW4+PBpMhI
 whXzDoonW7EVVuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05BAC137C3;
 Wed, 17 Sep 2025 09:20:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 62wEAFd9ymglHQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Sep 2025 09:20:22 +0000
Message-ID: <0b6cb807-1a7e-427e-af42-dfc8f422f813@suse.de>
Date: Wed, 17 Sep 2025 11:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/solomon: Move calls to drm_gem_fb_end_cpu*()
To: Javier Martinez Canillas <javierm@redhat.com>,
 Iker Pedrosa <ikerpedrosam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-1-bc9389ed299e@gmail.com>
 <874it1phx8.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <874it1phx8.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

grr, I should have noticed that before giving the r-b

Am 17.09.25 um 11:06 schrieb Javier Martinez Canillas:
> Iker Pedrosa <ikerpedrosam@gmail.com> writes:
>
> Hello Iker,
>
> Thanks for your patch.
>
>> Calls to drm_gem_fb_end_cpu*() should be between the calls to
>> drm_dev*(), and not hidden inside some other function. This way the
>> critical section code is visible at a glance, keeping it short and
>> improving maintainability.
>>
>> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
>> ---
>>   drivers/gpu/drm/solomon/ssd130x.c | 33 +++++++++++++++------------------
>>   1 file changed, 15 insertions(+), 18 deletions(-)
>>
> [...]
>
>> @@ -1232,6 +1214,9 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
>>   	if (!drm_dev_enter(drm, &idx))
>>   		return;
>>   
>> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>> +		return;
>> +
> In this error path you should call drm_dev_exit(). The convention in the
> kernel usually is to have a goto label for this, e.g.:
>
>         if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>                goto out_drm_dev_exit;
>
>>   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>>   	drm_atomic_for_each_plane_damage(&iter, &damage) {
>>   		dst_clip = plane_state->dst;
>> @@ -1245,6 +1230,8 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
>>   				     &shadow_plane_state->fmtcnv_state);
>>   	}
>>   
>> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> +
> and then here before the call you could have the label.
>
> out_drm_dev_exit:
>
>>   	drm_dev_exit(idx);
> Same comments for the other places where you are adding the
> drm_gem_fb_end_cpu*() calls next to the drm_dev*() ones.
>
> After the mentioned changes:
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


