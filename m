Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE964A45B7D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 11:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC5210E89E;
	Wed, 26 Feb 2025 10:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CYhMLnp7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="py/wyHhe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CYhMLnp7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="py/wyHhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BD210E224
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 10:16:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B800B1F388;
 Wed, 26 Feb 2025 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740564996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W7huWkA+q4tRzFzbc4OooKbD6jGNlYW/aDI0Z6LcjV8=;
 b=CYhMLnp7q0zfIxH8iu3DNheOYB4NL+Nf+4CwGTh2xeQ6XaiMe2y/w5C4nc6bW9xz7RbgAw
 8ryL8T8ngv+vFjbcTTbAftFmRhYB2lclHddKns9vVCLWfBZDzJSvvQlUKLgV5Wmz5BH8cQ
 v3TWwB2RQtT2+I3JBCLYix3NLqlliWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740564996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W7huWkA+q4tRzFzbc4OooKbD6jGNlYW/aDI0Z6LcjV8=;
 b=py/wyHhesHkF3t5R/Yc8G+Nte20Q0gW31h5UiRetlboW695aUKEXNBzADKuVjVvPuLRL9V
 oWrCKyFxSZ0u4RBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740564996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W7huWkA+q4tRzFzbc4OooKbD6jGNlYW/aDI0Z6LcjV8=;
 b=CYhMLnp7q0zfIxH8iu3DNheOYB4NL+Nf+4CwGTh2xeQ6XaiMe2y/w5C4nc6bW9xz7RbgAw
 8ryL8T8ngv+vFjbcTTbAftFmRhYB2lclHddKns9vVCLWfBZDzJSvvQlUKLgV5Wmz5BH8cQ
 v3TWwB2RQtT2+I3JBCLYix3NLqlliWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740564996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W7huWkA+q4tRzFzbc4OooKbD6jGNlYW/aDI0Z6LcjV8=;
 b=py/wyHhesHkF3t5R/Yc8G+Nte20Q0gW31h5UiRetlboW695aUKEXNBzADKuVjVvPuLRL9V
 oWrCKyFxSZ0u4RBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3ED391377F;
 Wed, 26 Feb 2025 10:16:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8GvYDQTqvmfDagAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 10:16:36 +0000
Message-ID: <97832f2b-ea2f-4fec-990b-bbd5ccaa9a91@suse.de>
Date: Wed, 26 Feb 2025 11:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
 <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com>
 <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
 <f74af5cc-bca8-45c1-9204-b362fcd6f998@ideasonboard.com>
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
In-Reply-To: <f74af5cc-bca8-45c1-9204-b362fcd6f998@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.990]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[20];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
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

Hi

Am 25.02.25 um 14:45 schrieb Tomi Valkeinen:
> Hi,
>
> On 21/02/2025 11:19, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
>>> Hi,
>>>
>>> On 20/02/2025 12:05, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 20.02.25 um 10:18 schrieb Tomi Valkeinen:
>>>> [...]
>>>>>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for 
>>>>>> use by
>>>>>> + * legacy user space. Please don't use them in new code. Other 
>>>>>> modes
>>>>>> + * are not support.
>>>>>> + *
>>>>>> + * Do not attempt to allocate anything but linear framebuffer 
>>>>>> memory
>>>>>> + * with single-plane RGB data. Allocation of other framebuffer
>>>>>> + * layouts requires dedicated ioctls in the respective DRM driver.
>>>>>
>>>>> According to this, every driver that supports, say, NV12, should 
>>>>> implement their own custom ioctl to do the exact same thing? And, 
>>>>> of course, every userspace app that uses, say, NV12, should then 
>>>>> add code for all these platforms to call the custom ioctls?
>>>>
>>>> Yes, that's exactly the current status.
>>>>
>>>> There has been discussion about a new dumb-create ioctl that takes 
>>>> a DRM format as parameter. I'm all for it, but it's out of the 
>>>> scope for this series.
>>>>
>>>>>
>>>>> As libdrm's modetest currently supports YUV formats with dumb 
>>>>> buffers, should we remove that code, as it's not correct and I'm 
>>>>> sure people use libdrm code as a reference?
>>>>
>>>> Of course not.
>>>>
>>>>>
>>>>> Well, I'm not serious above, but I think all my points from the 
>>>>> earlier version are still valid. I don't like this. It changes the 
>>>>> parameters of the ioctl (bpp used to be bits-per-pixel, not it's 
>>>>> "color mode"), and the behavior of the ioctl, behavior that we've 
>>>>> had for a very long time, and we have no idea how many users there 
>>>>> are that will break (could be none, of course). And the 
>>>>> documentation changes make the current behavior and uses wrong or 
>>>>> legacy.
>>>>
>>>> Before I go into details about this statement, what use case 
>>>> exactly are you referring to when you say that behavior changes?
>>>
>>> For every dumb_buffer allocation with bpp that is not divisible by 
>>> 8, the result is different, i.e. instead of DIV_ROUND_UP(width * 
>>> bpp, 8), we now have width * DIV_ROUND_UP(bpp, 8). This, of course, 
>>> depends on the driver implementation. Some already do the latter.
>>
>> The current dumb-buffer code does a stride computation at [1], which 
>> is correct for all cases; although over-allocates sometimes. It's the 
>> one you describe as "width * DIV_ROUND_UP(bpp, 8)". It's in the ioctl 
>> entry point, so it's somewhat authoritative for all driver's 
>> implementations. It's also used by several drivers.
>>
>> The other variant, "DIV_ROUND_UP(width * bpp, 8)", is used by 
>> gem-dma, gem-shmem and others. It can give incorrect results and 
>> possibly OOBs. To give a simple example, let's allocate 15-bit 
>> XRGB1555. Bpp is 15. With a width of 1024, that would result in 1920 
>> bytes per scanline. But because XRGB1555 has a filler bit, so the 
>> pixel is actually 16 bit and a scanline needs to be 2048 bytes. The 
>> new code fixes that. This is not just a hypothetical scenario: we do 
>> have drivers that support XRGB1555 and some of them also export a 
>> preferred_depth of 15 to userspace. [2] In the nearby comment, you'll 
>> see that this value is meant for dumb buffers.
>>
>> Rounding up the depth value in user space is possible for RGB, but 
>> not for YUV. Here different pixel planes have a different number of 
>> bits. Sometimes pixels are sharing bits. The value of bits-per-pixel 
>> becomes meaningless. That's why it's also deprecated in struct 
>> drm_format_info. The struct instead uses a more complicated per-plane 
>> calculation to compute the number of bits per plane. [3] The 
>> user-space code currently doing YUV on dumb buffers simply got lucky.
>>
>> [1] https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/ 
>> drm_dumb_buffers.c#L77
>> [2] https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/ 
>> drm_mode_config.h#L885
>> [3] https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/ 
>> drm_fourcc.h#L83
>>
>>>
>>> This change also first calls the drm_driver_color_mode_format(), 
>>> which could change the behavior even more, but afaics at the moment 
>>> does not. 
>>
>> Because currently each driver does its own thing, it can be hard to 
>> write user space that reliably allocates on all drivers. That's why 
>> it's important that parameters are not just raw numbers, but have 
>> well- defined semantics. The raw bpp is meaningless; it's also 
>> important to know which formats are associated with each value. 
>> Otherwise, you might get a dumb buffer with a bpp of 15, but it will 
>> be displayed incorrectly. This patch series finally implements this 
>> and clearly documents the assumptions behind the interfaces. The 
>> assumptions themselves have always existed.
>
> This is perhaps where the biggest gap in understanding/view is: I have 
> always thought dumb-buffer's "bpp" to mean bits-per-pixel, where, for 
> more complex formats, "pixel" is not necessarily a visible pixel but a 
> container unit of some kind. So bpp * width = stride.
>
> It would not occur to me to allocate XRGB1555 dumb-buffer with 15 bpp, 
> but 16 bpp, as that's what a pixel takes. I have never seen the 
> dumb-buffer bpp connected directly to the pixel format (that's what 
> the ADDFB brings in).
>
> I may be alone with that thinking, but afaics the documentation leans 
> a bit on my interpretation (instead of considering bpp as a "color 
> mode"), although admittedly the docs also don't really say much so 
> this may be fully just my interpretation:
>
> https://man.archlinux.org/man/drm-memory.7.en

Agreed, this could be read in the way you do. Is this being generated 
from source somehow? The information is not incorrect, but how did they 
get to this interpretation? It would definitely need an update with this 
patch series applied. Citing from the man page:

   "/bpp/ is the number of bits-per-pixel and must be a multiple of 8."

That's what currently works on all drivers. But nothing enforces that it 
"must by a multiple of 8". Doing so would prevent C1/C2/etc pixel 
formats without over-allocation.  OR bpp is not bits-per-pixel but just 
some factor that controls the buffer size. This is how you use it for 
YUV formats.

   "You most commonly want to pass 32 here."

That's also just semi-true. 32 is simply what mostly works in practice 
IFF you interpret it as XRGB8888. Userspace should read the formats from 
the primary plane, or at least look at the driver-provided 
preferred_depth field.

>
> https://cgit.freedesktop.org/drm/libdrm/tree/include/drm/drm_mode.h#n1055

This one doesn't say anything specific AFAICT. Bpp is somewhat pointless 
information without a known pixel and framebuffer layout, as I've 
outlined before.

>
> I (mostly) understand all the complexities around here, thanks to your 
> replies, and I think I'm ok with the series as it doesn't break 
> anything (need to test the v3, though).

Thank you so much.

>
> I still don't like it though =). And I would be happier with the 
> simpler "bpp" interpretation that I mentioned above, instead of it 
> being a color mode. But we can't have it both ways, and perhaps it's 
> better to unify the code and have the behavior explained explicitly as 
> you do in this series, even if the explanation only covers some RGB 
> formats.

No worries. The intention is not to break anything and existing code 
will continue to work.

Best regards
Thomas

>
>  Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

