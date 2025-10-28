Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91197C15A5A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60010E604;
	Tue, 28 Oct 2025 16:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RPMsIXb/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wUUN12Tp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RPMsIXb/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wUUN12Tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964710E600
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:01:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A9371F46E;
 Tue, 28 Oct 2025 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761667281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hskSQxZPdvYKtusvQB3i69fDhctjWbZa4oSKWlxpjfM=;
 b=RPMsIXb/AR28O3Z65oZMxNXA9YFHGvAJHHpsDTsXJJw3v+GZ47QCViItCx0b27uU5TWqks
 WgnIlevz2VB08pUOpwSoM31Z1rbFndaYffWaLcodZxjnGZtiUo3nrTnZxatu+/OPb8S832
 WeIsPQYjElboqVTHsqqIbJ7xVGTYctQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761667281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hskSQxZPdvYKtusvQB3i69fDhctjWbZa4oSKWlxpjfM=;
 b=wUUN12TpTdJUMckj4GEAjvOpUY/Tir563Q1XYPPame5Ew3qggt5NbAlt5S6yCYnaPMz0NL
 znj3ml/K//uFt+Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761667281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hskSQxZPdvYKtusvQB3i69fDhctjWbZa4oSKWlxpjfM=;
 b=RPMsIXb/AR28O3Z65oZMxNXA9YFHGvAJHHpsDTsXJJw3v+GZ47QCViItCx0b27uU5TWqks
 WgnIlevz2VB08pUOpwSoM31Z1rbFndaYffWaLcodZxjnGZtiUo3nrTnZxatu+/OPb8S832
 WeIsPQYjElboqVTHsqqIbJ7xVGTYctQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761667281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hskSQxZPdvYKtusvQB3i69fDhctjWbZa4oSKWlxpjfM=;
 b=wUUN12TpTdJUMckj4GEAjvOpUY/Tir563Q1XYPPame5Ew3qggt5NbAlt5S6yCYnaPMz0NL
 znj3ml/K//uFt+Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41D7F13A7D;
 Tue, 28 Oct 2025 16:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mWxRDtHoAGmPewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Oct 2025 16:01:21 +0000
Message-ID: <26c7b1b5-cf9e-4d46-8796-b18329c46c61@suse.de>
Date: Tue, 28 Oct 2025 17:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Handle framebuffer from dma-buf
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20251028144226.171593-1-jfalempe@redhat.com>
 <99f8a5f0-c650-485c-aef6-e8f1a89598fe@redhat.com>
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
In-Reply-To: <99f8a5f0-c650-485c-aef6-e8f1a89598fe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi Jocelyn

Am 28.10.25 um 15:49 schrieb Jocelyn Falempe:
> On 28/10/2025 15:42, Jocelyn Falempe wrote:
>> In the atomic update callback, ast should call
>> drm_gem_fb_begin_cpu_access() to make sure it can read the
>> framebuffer from the CPU, otherwise the data might not be there due
>> to cache, and synchronization.
>>
>> Tested on a Lenovo SE100, while rendering on the ArrowLake GPU with
>> i915 driver, and using ast for display.
>
> I sent this patch a bit too fast, my mistake below:>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 9ce874dba69c..68da4544d92d 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -556,11 +556,17 @@ static void 
>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>           ast_set_vbios_color_reg(ast, fb->format, 
>> ast_crtc_state->vmode);
>>       }
>>   +    /* if the buffer comes from another device */
>> +    if (!drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>> +        return;
>> +
>
> Sorry, there is a typo here, it should be:
>
> if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
>     return;
>
>> drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>>       drm_atomic_for_each_plane_damage(&iter, &damage) {
>>           ast_handle_damage(ast_plane, shadow_plane_state->data, fb, 
>> &damage);
>>       }
>>   +    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> +

Thanks for posting this. I know that you follow the common code from 
other drivers, but I think we should change the pattern a bit. The code 
in _begin_cpu_access() might fail for whatever reason, but that does not 
affect the rest of the plane update.

How about

if (_begin_cpu_access() == 0)
     for_each_damage {
         handle_damage()
     }
     _end_cpu_access()
}

and then continue with the rest of the helper? Even if the damage update 
doesn't happen, the driver would still program changes of the 
framebuffer pitch.

There's no easy way of keeping the damage information across display 
updates AFAIK. But the problem might be transient, while a failed update 
of the framebuffer pitch can be permanent.

Best regards
Thomas

>>       /*
>>        * Some BMCs stop scanning out the video signal after the driver
>>        * reprogrammed the offset. This stalls display output for several
>>
>> base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


