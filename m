Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57729A3EFD8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A265E10E223;
	Fri, 21 Feb 2025 09:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Y5OD0ODW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="apiGdSL5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ix9uY6zy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GXuVcphr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59A10E22F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:19:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 016201F38C;
 Fri, 21 Feb 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740129579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XEszpDYKL3MVEwZqleFHNbIiqH/hiHMJcxYVx498oDU=;
 b=Y5OD0ODW05Ir6K44W9oHAHrgQsGFXLTe2qXLi/jaIBFZ8ei3bph+xdvoGyv2xycuuIUEmU
 lfhDd0FD0MKqUsASX/kbFrYVayo06HxIfkIBglJZ5y6xJsUEh1UQO7cOjfhKiWv2u8LZKu
 ovMgo9SssgX3HXtwBDBEB/mDQQQS6Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740129579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XEszpDYKL3MVEwZqleFHNbIiqH/hiHMJcxYVx498oDU=;
 b=apiGdSL53jreK8uUb7XtKwQfvrR9lvbOm4fC4bhVEsCnP7K54jIhH0RLvsx+aZh30OOeHO
 abABtQE13t+7TJAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ix9uY6zy;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GXuVcphr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740129578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XEszpDYKL3MVEwZqleFHNbIiqH/hiHMJcxYVx498oDU=;
 b=Ix9uY6zyz6ad3maDw2OFPsPm2XBJ85n9s/O4q80iEfN1M4Sjj0LK+j1n5z0I0DOmlcCTU0
 QX+/2L+jPArpkRRDyHTlwd8SaIdpzIX1XprnwUzKPIITRhTlNeFlUdbbne1BuTtAlKMruC
 phhskGETcHdVTLH59sXknrkluxvm0jQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740129578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XEszpDYKL3MVEwZqleFHNbIiqH/hiHMJcxYVx498oDU=;
 b=GXuVcphrlbiIlthAB83vu/yp4aJDLPDw8m4egDsZDmriwuukeFiXh2qEeTFvm8HWr1Utjp
 69K/s2r3yTN1o+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7780C13806;
 Fri, 21 Feb 2025 09:19:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hlHRGylFuGdGIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Feb 2025 09:19:37 +0000
Message-ID: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
Date: Fri, 21 Feb 2025 10:19:37 +0100
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
In-Reply-To: <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 016201F38C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[20]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid, bootlin.com:url]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
> Hi,
>
> On 20/02/2025 12:05, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 20.02.25 um 10:18 schrieb Tomi Valkeinen:
>> [...]
>>>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
>>>> + * legacy user space. Please don't use them in new code. Other modes
>>>> + * are not support.
>>>> + *
>>>> + * Do not attempt to allocate anything but linear framebuffer memory
>>>> + * with single-plane RGB data. Allocation of other framebuffer
>>>> + * layouts requires dedicated ioctls in the respective DRM driver.
>>>
>>> According to this, every driver that supports, say, NV12, should 
>>> implement their own custom ioctl to do the exact same thing? And, of 
>>> course, every userspace app that uses, say, NV12, should then add 
>>> code for all these platforms to call the custom ioctls?
>>
>> Yes, that's exactly the current status.
>>
>> There has been discussion about a new dumb-create ioctl that takes a 
>> DRM format as parameter. I'm all for it, but it's out of the scope 
>> for this series.
>>
>>>
>>> As libdrm's modetest currently supports YUV formats with dumb 
>>> buffers, should we remove that code, as it's not correct and I'm 
>>> sure people use libdrm code as a reference?
>>
>> Of course not.
>>
>>>
>>> Well, I'm not serious above, but I think all my points from the 
>>> earlier version are still valid. I don't like this. It changes the 
>>> parameters of the ioctl (bpp used to be bits-per-pixel, not it's 
>>> "color mode"), and the behavior of the ioctl, behavior that we've 
>>> had for a very long time, and we have no idea how many users there 
>>> are that will break (could be none, of course). And the 
>>> documentation changes make the current behavior and uses wrong or 
>>> legacy.
>>
>> Before I go into details about this statement, what use case exactly 
>> are you referring to when you say that behavior changes?
>
> For every dumb_buffer allocation with bpp that is not divisible by 8, 
> the result is different, i.e. instead of DIV_ROUND_UP(width * bpp, 8), 
> we now have width * DIV_ROUND_UP(bpp, 8). This, of course, depends on 
> the driver implementation. Some already do the latter.

The current dumb-buffer code does a stride computation at [1], which is 
correct for all cases; although over-allocates sometimes. It's the one 
you describe as "width * DIV_ROUND_UP(bpp, 8)". It's in the ioctl entry 
point, so it's somewhat authoritative for all driver's implementations. 
It's also used by several drivers.

The other variant, "DIV_ROUND_UP(width * bpp, 8)", is used by gem-dma, 
gem-shmem and others. It can give incorrect results and possibly OOBs. 
To give a simple example, let's allocate 15-bit XRGB1555. Bpp is 15. 
With a width of 1024, that would result in 1920 bytes per scanline. But 
because XRGB1555 has a filler bit, so the pixel is actually 16 bit and a 
scanline needs to be 2048 bytes. The new code fixes that. This is not 
just a hypothetical scenario: we do have drivers that support XRGB1555 
and some of them also export a preferred_depth of 15 to userspace. [2]  
In the nearby comment, you'll see that this value is meant for dumb buffers.

Rounding up the depth value in user space is possible for RGB, but not 
for YUV. Here different pixel planes have a different number of bits. 
Sometimes pixels are sharing bits. The value of bits-per-pixel becomes 
meaningless. That's why it's also deprecated in struct drm_format_info. 
The struct instead uses a more complicated per-plane calculation to 
compute the number of bits per plane. [3] The user-space code currently 
doing YUV on dumb buffers simply got lucky.

[1] 
https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/drm_dumb_buffers.c#L77
[2] 
https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/drm_mode_config.h#L885
[3] 
https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/drm_fourcc.h#L83

>
> This change also first calls the drm_driver_color_mode_format(), which 
> could change the behavior even more, but afaics at the moment does not. 

Because currently each driver does its own thing, it can be hard to 
write user space that reliably allocates on all drivers. That's why it's 
important that parameters are not just raw numbers, but have 
well-defined semantics. The raw bpp is meaningless; it's also important 
to know which formats are associated with each value. Otherwise, you 
might get a dumb buffer with a bpp of 15, but it will be displayed 
incorrectly. This patch series finally implements this and clearly 
documents the assumptions behind the interfaces. The assumptions 
themselves have always existed.

The color modes in drm_driver_color_mode_format() are set in stone and 
will not change incompatibly. It's already a user interface. I've taken 
care that the results do not change incompatibly compared to what the 
dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)

> Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even 
> for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but 
> not for 3, 5, 6, 7, if I'm not mistaken).

True. 1, 2 and 4 would currently over-allocate significantly on some 
drivers and the series will reduce this to actual requirements. Yet our 
most common memory managers, gem-dma and gem-shmem, compute the sizes 
correctly.

But there are currently no drivers that support C4, C2 or C1 formats; 
hence there's likely no user space either. I know that Geert is 
interested in making a driver that uses these formats on very low-end 
hardware (something Atari or Amiga IIRC). Over-allocating on such 
hardware is likely not an option.

The other values (3, 5, 6, 7) have no meaning I know of. 6 could be 
XRGB2222, but I not aware of anything using that. We don't even have a 
format constant for this.

>
> However, as the bpp is getting rounded up, this probably won't break 
> any user. But it _is_ a change in the behavior of a uapi, and every 
> time we change a uapi that's been out there for a long time, I'm 
> getting slightly uncomfortable.

As I tried to explain, we currently have both versions in drivers: 
rounding up bpp and rounding up (bpp*width). User-space code already has 
to deal with both cases.

Best regards
Thomas

>
> So, as a summary, I have a feeling that nothing will break, but I 
> can't say for sure. And as I'm having trouble seeing the benefit of 
> this change for the user, I get even more uncomfortable.
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

