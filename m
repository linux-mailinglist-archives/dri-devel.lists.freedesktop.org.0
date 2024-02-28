Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C656186A9B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 09:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9F10E9C8;
	Wed, 28 Feb 2024 08:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sznkX2Ob";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FeybRjlC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sznkX2Ob";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FeybRjlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4110E9C6;
 Wed, 28 Feb 2024 08:19:46 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DEBE41FBEE;
 Wed, 28 Feb 2024 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709108384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nWPhJsPQKvrqarNFIej7vxQFJJnKTtYS/cMyoDdZX14=;
 b=sznkX2Oby5lAFmxQuk2CpsPYxBJkdjoXr7wPsKC5Mh6/Z03DVhYAfAXvcOHgH9CHRMMt6/
 onhPHoaoLDjYNkwrwAB/zV3J5miquTGKZ0Uu6NKk04tadcJ2r7yUIPUK/fw+vw0AsJcS66
 lAYwc9NwEB9S87jJz3hjMYarJ/cDL8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709108384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nWPhJsPQKvrqarNFIej7vxQFJJnKTtYS/cMyoDdZX14=;
 b=FeybRjlChq+XK2b3SMEenBN167kno2njkO76rnY7v1Z+XybGIlQ7vY1wMq3SdoXhGwuhcU
 uiUDQN5OeA5YDnDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709108384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nWPhJsPQKvrqarNFIej7vxQFJJnKTtYS/cMyoDdZX14=;
 b=sznkX2Oby5lAFmxQuk2CpsPYxBJkdjoXr7wPsKC5Mh6/Z03DVhYAfAXvcOHgH9CHRMMt6/
 onhPHoaoLDjYNkwrwAB/zV3J5miquTGKZ0Uu6NKk04tadcJ2r7yUIPUK/fw+vw0AsJcS66
 lAYwc9NwEB9S87jJz3hjMYarJ/cDL8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709108384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nWPhJsPQKvrqarNFIej7vxQFJJnKTtYS/cMyoDdZX14=;
 b=FeybRjlChq+XK2b3SMEenBN167kno2njkO76rnY7v1Z+XybGIlQ7vY1wMq3SdoXhGwuhcU
 uiUDQN5OeA5YDnDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D79213A42;
 Wed, 28 Feb 2024 08:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 9xXKCaDs3mXvQAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Feb 2024 08:19:44 +0000
Message-ID: <cd01e963-dd4d-4554-9feb-1750f72cc260@suse.de>
Date: Wed, 28 Feb 2024 09:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
 <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
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
In-Reply-To: <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_TWELVE(0.00)[29];
 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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

Am 27.02.24 um 19:14 schrieb Dmitry Osipenko:
> Hello,
>
> Thank you for the patches!
>
> On 2/27/24 13:14, Thomas Zimmermann wrote:
>> Dma-buf locking semantics require the caller of pin and unpin to hold
>> the buffer's reservation lock. Fix DRM to adhere to the specs. This
>> enables to fix the locking in DRM's console emulation. Similar changes
>> for vmap and mmap have been posted at [1][2]
>>
>> Most DRM drivers and memory managers acquire the buffer object's
>> reservation lock within their GEM pin and unpin callbacks. This
>> violates dma-buf locking semantics. We get away with it because PRIME
>> does not provide pin/unpin, but attach/detach, for which the locking
>> semantics is correct.
>>
>> Patches 1 to 8 rework DRM GEM code in various implementations to
>> acquire the reservation lock when entering the pin and unpin callbacks.
>> This prepares them for the next patch. Drivers that are not affected
>> by these patches either don't acquire the reservation lock (amdgpu)
>> or don't need preparation (loongson).
>>
>> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
>> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
>> internally it still gets the reservation lock.
>>
>> With the updated GEM callbacks, the rest of the patchset fixes the
>> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
>> GEM buffer object inplace while updating its content. This required
>> a implicit pinning and apparently amdgpu didn't do this at all.
>>
>> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
>> The former function map a GEM buffer into the kernel's address space
>> with regular vmap operations, but keeps holding the reservation lock.
>> The _vunmap_local() helper undoes the vmap and releases the lock. The
>> updated GEM callbacks make this possible. Between the two calls, the
>> fbdev emulation can update the buffer content without have the buffer
>> moved or evicted. Update fbdev-generic to use vmap_local helpers,
>> which fix amdgpu. The idea of adding a "local vmap" has previously been
>> attempted at [3] in a different form.
>>
>> Patch 11 adds implicit pinning to the DRM client's regular vmap
>> helper so that long-term vmap'ed buffers won't be evicted. This only
>> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
>> there are no practical changes.
>>
>> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
>> operations in gem-vram and qxl. These pin operations are not supposed
>> to be part of vmap code, but were required to keep the buffers in place
>> for fbdev emulation. With the conversion o ffbdev-generic to to
>> vmap_local helpers, that code can finally be removed.
> Isn't it a common behaviour for all DRM drivers to implicitly pin BO
> while it's vmapped? I was sure it should be common /o\

That's what I originally thought as well, but the intention is for pin 
and vmap to be distinct operation. So far each driver has been 
different, as you probably know best from your vmap refactoring. :)

>
> Why would you want to kmap BO that isn't pinned?

Pinning places the buffer object for the GPU. As a side effect, the 
buffer is then kept in place, which enables vmap. So pinning only makes 
sense for buffer objects that never move (shmem, dma). That's what patch 
11 is for.

>
> Shouldn't TTM's vmap() be changed to do the pinning?

I don't think so. One problem is that pinning needs a memory area (vram, 
GTT, system ram, etc) specified, which vmap simply doesn't know about. 
That has been a problem for fbdev emulation at some point. Our fbdev 
code tried to pin as part of vmap, but chose the wrong area and suddenly 
the GPU could not see the buffer object any longer.  So the next best 
thing for vmap was to pin the buffer object where ever it is currently 
located. That is what gem-vram and qxl did so far. And of course, the 
fbdev code needs to unpin and vunmap the buffer object quickly, so that 
it can be relocated if the GPU needs it.  Hence, the vmap_local 
interface removes such short-term pinning in favor of holding the 
reservation lock.

>
> I missed that TTM doesn't pin BO on vmap() and now surprised to see it.
> It should be a rather serious problem requiring backporting of the
> fixes, but I don't see the fixes tags on the patches (?)

No chance TBH. The old code has worked for years and backporting all 
this would require your vmap patches at a minimum.

Except maybe for amdgpu. It uses fbdev-generic, which requires pinning, 
but amdgpu doesn't pin. That looks fishy, but I'm not aware of any bug 
reports either. I guess, a quick workaround could fix older amdgpu if 
necessary.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

