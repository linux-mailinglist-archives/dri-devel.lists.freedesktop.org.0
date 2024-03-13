Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48187A4EE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295D10E322;
	Wed, 13 Mar 2024 09:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E/zSkdLv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOO6o2fU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E/zSkdLv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOO6o2fU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE54010E322
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 09:24:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0ED6221C4A;
 Wed, 13 Mar 2024 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710321892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P4dnH8FdI7DeVsqgq+Lo+wmOg/pCaDLBDqFT7wqcne0=;
 b=E/zSkdLv1PipIasXmzr0WyxAj4KZsmv7DL09Yb0JJ0lYK/4+urDw/2CuTnCLB3WQhJhMuK
 IQkcQe6OBDIQlAuSsOclenZQM+Ts3mQr63u+O7DSkywIkL9qN6ooitRtDbnv+VoZoSXUAL
 ftff+UZhcXmGv93RC57WU8ysf2etJ4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710321892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P4dnH8FdI7DeVsqgq+Lo+wmOg/pCaDLBDqFT7wqcne0=;
 b=uOO6o2fUxN6Ut/lxvMQG3ih7ewPM7aJB9BnRXcG5p0GI+hQNsQUoRi98SzFY/mD5/qiWaB
 iAjGI8olRVHNRUDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710321892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P4dnH8FdI7DeVsqgq+Lo+wmOg/pCaDLBDqFT7wqcne0=;
 b=E/zSkdLv1PipIasXmzr0WyxAj4KZsmv7DL09Yb0JJ0lYK/4+urDw/2CuTnCLB3WQhJhMuK
 IQkcQe6OBDIQlAuSsOclenZQM+Ts3mQr63u+O7DSkywIkL9qN6ooitRtDbnv+VoZoSXUAL
 ftff+UZhcXmGv93RC57WU8ysf2etJ4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710321892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P4dnH8FdI7DeVsqgq+Lo+wmOg/pCaDLBDqFT7wqcne0=;
 b=uOO6o2fUxN6Ut/lxvMQG3ih7ewPM7aJB9BnRXcG5p0GI+hQNsQUoRi98SzFY/mD5/qiWaB
 iAjGI8olRVHNRUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC92A1397F;
 Wed, 13 Mar 2024 09:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lShzLONw8WWXdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 09:24:51 +0000
Message-ID: <06f5d25f-87c4-4c81-9475-59470145914d@suse.de>
Date: Wed, 13 Mar 2024 10:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/43] drm/fbdev: Add fbdev-shmem
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-9-tzimmermann@suse.de>
 <CAMuHMdVqWF=M=6aPRxZ0MBqPVM_wk2x+Oike6za754riHWusSA@mail.gmail.com>
 <ebea6554-835a-42d6-a226-f4f3480a8846@suse.de>
 <CAMuHMdU1wXhhhfaz9ew5xx2AVoKDdjUxqOGVVXwp4FSDmYFUYw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdU1wXhhhfaz9ew5xx2AVoKDdjUxqOGVVXwp4FSDmYFUYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -3.09
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

Am 13.03.24 um 10:03 schrieb Geert Uytterhoeven:
> Hi Thomas,
>
> On Wed, Mar 13, 2024 at 9:19 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Am 12.03.24 um 17:14 schrieb Geert Uytterhoeven:
>>> On Tue, Mar 12, 2024 at 4:48 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Add an fbdev emulation for SHMEM-based memory managers. The code is
>>>> similar to fbdev-generic, but does not require an addition shadow
>>>> buffer for mmap(). Fbdev-shmem operates directly on the buffer object's
>>>> SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware state
>>>> on write operations.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Thanks for your patch!
>>>
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
>>>> +static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>>> +                                          struct drm_fb_helper_surface_size *sizes)
>>>> +{
>>>> +       struct drm_client_dev *client = &fb_helper->client;
>>>> +       struct drm_device *dev = fb_helper->dev;
>>>> +       struct drm_client_buffer *buffer;
>>>> +       struct drm_gem_shmem_object *shmem;
>>>> +       struct drm_framebuffer *fb;
>>>> +       struct fb_info *info;
>>>> +       u32 format;
>>>> +       struct iosys_map map;
>>>> +       int ret;
>>>> +
>>>> +       drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>>>> +                   sizes->surface_width, sizes->surface_height,
>>>> +                   sizes->surface_bpp);
>>>> +
>>>> +       format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
>>> Oops, one more caller of the imprecise
>>> let's-guess-the-format-from-bpp-and-depth machinery to get rid of...
>> Right, that has been discussed in another thread. I'll change this call
>> to the drm_driver_() function.
> You mean drm_driver_legacy_fb_format()? That has the same issues.

We have the video= parameter with its bpp argument. So we won't ever 
fully remove that function.

>
>>>> +       buffer = drm_client_framebuffer_create(client, sizes->surface_width,
>>>> +                                              sizes->surface_height, format);
>>> [...]
>>>
>>>> +}
>>>> +/**
>>>> + * drm_fbdev_shmem_setup() - Setup fbdev emulation for GEM SHMEM helpers
>>>> + * @dev: DRM device
>>>> + * @preferred_bpp: Preferred bits per pixel for the device.
>>>> + *                 32 is used if this is zero.
>>>> + *
>>>> + * This function sets up fbdev emulation for GEM DMA drivers that support
>>>> + * dumb buffers with a virtual address and that can be mmap'ed.
>>>> + * drm_fbdev_shmem_setup() shall be called after the DRM driver registered
>>>> + * the new DRM device with drm_dev_register().
>>>> + *
>>>> + * Restore, hotplug events and teardown are all taken care of. Drivers that do
>>>> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
>>>> + * Simple drivers might use drm_mode_config_helper_suspend().
>>>> + *
>>>> + * This function is safe to call even when there are no connectors present.
>>>> + * Setup will be retried on the next hotplug event.
>>>> + *
>>>> + * The fbdev is destroyed by drm_dev_unregister().
>>>> + */
>>>> +void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp)
>>> As this is a completely new function, can we please get a
>>> preferred_format parameter instead?
>> An understandable question. But as it is, the patchset has a trivial
>> change in each driver. And the preferred_bpp parameter has the same
>> meaning as the bpp value in the video= parameter. So it's ok-ish for now.
> OK.
>
>> Using a format parameter here is really a much larger update and touches
>> the internals of the fbdev emulation. I'm not even sure that we should
>> have a parameter at all. Since in-kernel clients should behave like
>> userspace clients, we could try to figure out the format from the
>> driver's primary planes. That's a patchset of its own.
> How do you figure out "the" format from the driver's primary plane?
> Isn't that a list of formats (always including XR24) , so the driver
> still needs to specify a preferred format?

The list of formats for each plane is roughly sorted by preference. We 
can go through it and pick the first format that is supported by the 
fbdev code. That's likely how userspace would do it.

>
> A while ago, I had a look into replacing preferred_{depth,bpp} by
> preferred_format, but I was held back by the inconsistencies in some
> drivers (e.g. depth 24 vs. 32).  Perhaps an incremental approach
> (use preferred_format if available, else fall back to legacy
> preferred_{depth,bpp} handling) would be more suitable?

I have initial patches to move format selection from the fb_probe 
helpers into the shared helpers. That allows to remove the surface_depth 
and surface_bpp fields. That is at least a step into the right direction.

>
> FTR, my main use-case is letting fbdev emulation distinguish between
> DRM_FORMAT_Rx and DRM_FORMAT_Cx, which share the values of depth
> and bpp.

How are they used for the framebuffer console? Shouldn't it always be 
_Cx? _Rx is just monochrome AFAIU.

Best regards
Thomas

>
> Gr{oetje,eeting}s,
>
>                          Geert
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

