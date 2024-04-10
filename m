Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860689ED53
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4257410E1F8;
	Wed, 10 Apr 2024 08:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xLCppYqH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HpzoOh/N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YEg/PO0L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e8Qf1TLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69010E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:13:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F49034C16;
 Wed, 10 Apr 2024 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712736787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=82bkB32O0Nu26a27bX3EclGJVmn5vwV8q2Z4RYjadMo=;
 b=xLCppYqHAz5NIK+NsllrfjIZ6PhpPDjBIF98Nspx7tSl2Zzt02lpzaYgK39MHthfJsJWhS
 KwRuUJsPGH3Zjldzkh8mY7LPxy9/LewNVZPnZUnBdKZeo7cfJxQQVbChcAVai4PYW+SIxd
 fX4chxIYLdxVTiOi0WGwuxs0kATH8yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712736787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=82bkB32O0Nu26a27bX3EclGJVmn5vwV8q2Z4RYjadMo=;
 b=HpzoOh/Nz+xcflEQSzsPbcJVtwTfuBkMn937ZmCO+Ehfg2qgvJ9BY3VfYPLM0PdN+IJxqW
 XAyX6lpWE8a8B5DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="YEg/PO0L";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e8Qf1TLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712736786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=82bkB32O0Nu26a27bX3EclGJVmn5vwV8q2Z4RYjadMo=;
 b=YEg/PO0LauTedpGr9BwzZhQPrcrdn0RLuAHWpQPQ04r8/tTrXYWA9wFwB033DmZCm3IZmm
 YlZ8dR9OjoJL7z0GItlAAXr1TyMxJCMTgItqZa1QCTpG0S+MxOgD4z/TBsIlJ9CHZ8HR7b
 jppMjXKeDWiWYR/JW9V9X3IDsUXqCes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712736786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=82bkB32O0Nu26a27bX3EclGJVmn5vwV8q2Z4RYjadMo=;
 b=e8Qf1TLICd9Q4SIJQDEZ/Wz+cyAIFT1bgNYietybapK3nYS7hSFw3nEOKZzDZ3GqXyHH72
 EW2U6cUbkE3/IOCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B6AF513A92;
 Wed, 10 Apr 2024 08:13:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id hRfWKRFKFma6TgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 08:13:05 +0000
Message-ID: <7e2cd0e5-35d0-4724-9692-4484338cd5fa@suse.de>
Date: Wed, 10 Apr 2024 10:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] drm/panic: Add a drm panic handler
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com
References: <20240328120638.468738-1-jfalempe@redhat.com>
 <20240328120638.468738-3-jfalempe@redhat.com>
 <6fe7d003-6dbd-4df2-bf33-a6925810358d@suse.de>
 <908b83c8-1c81-4fe6-8e96-be51b445eef8@redhat.com>
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
In-Reply-To: <908b83c8-1c81-4fe6-8e96-be51b445eef8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0F49034C16
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]; 
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org,linux.dev];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
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

Am 09.04.24 um 16:11 schrieb Jocelyn Falempe:
> Hi,
>
> On 09/04/2024 10:30, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.03.24 um 13:03 schrieb Jocelyn Falempe:
>>> +/**
>>> + * struct drm_scanout_buffer - DRM scanout buffer
>>> + *
>>> + * This structure holds the information necessary for drm_panic to 
>>> draw the
>>> + * panic screen, and display it.
>>> + */
>>> +struct drm_scanout_buffer {
>>> +    /**
>>> +     * @format:
>>> +     *
>>> +     * drm format of the scanout buffer.
>>> +     */
>>> +    const struct drm_format_info *format;
>>
>> Newline here and among the other fields please.
>
> Done in v12.
>>
>>> +    /**
>>> +     * @map:
>>> +     *
>>> +     * Virtual address of the scanout buffer, either in memory or 
>>> iomem.
>>> +     * The scanout buffer should be in linear format, and can be 
>>> directly
>>> +     * sent to the display hardware. Tearing is not an issue for 
>>> the panic
>>> +     * screen.
>>> +     */
>>> +    struct iosys_map map;
>>
>> I would make this an array of DRM_FORMAT_MAX_PLANES. Its 
>> functionality is then equivalent to the fields in struct 
>> drm_framebuffer. Supporting multiple color planes is the general 
>> expectation in the DRM code, even if not all parts actually implement 
>> it. In the panic code, you simply test that the scan-out format has 
>> only a single plane.
>>
>>    struct iosys_map map[DRM_FORMAT_MAX_PLANES]
>>
> Sure, that was on my todo list, done in v12.
>>
>>> +    /**
>>> +     * @width: Width of the scanout buffer, in pixels.
>>> +     */
>>> +    unsigned int width;
>>> +    /**
>>> +     * @height: Height of the scanout buffer, in pixels.
>>> +     */
>>> +    unsigned int height;
>>> +    /**
>>> +     * @pitch: Length in bytes between the start of two consecutive 
>>> lines.
>>> +     */
>>> +    unsigned int pitch;
>>
>> Also use an array of DRM_FORMAT_MAX_PLANES.
>>
>>> +};
>>
>> This data structure looks like something I could use for the 
>> shadow-plane helpers. Expect it to be moved elsewhere at some point.
>
> Yes, this can even be part of the struct drm_framebuffer.

Please not. These are two separate things (even though they look very 
similar).

Best regards
Thomas

>>
>> Best regards
>> Thomas
>>
>>
>
> Thanks for the reviews,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

