Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC994EB5A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 12:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8110E1A5;
	Mon, 12 Aug 2024 10:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IgJkHoKq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GJfa3mKW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IgJkHoKq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GJfa3mKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86E110E1AA;
 Mon, 12 Aug 2024 10:41:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BBE02025F;
 Mon, 12 Aug 2024 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723459300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ab/m5AKxXktze9znH0lC1CTq5g5RByZlcRmtfkhdDYg=;
 b=IgJkHoKqaIx+8aIilB8EbIzDJeH3e3FLyHDm5fydwMTUMkepZ2c8ENJiQmbi/aNyM5lvaM
 QXTAFMM857fEISqLU1+nngqIX4DFVcr3z2OOT0p6X6MKbEOeuakO0xo97uN55+zk6NZ3ol
 GQttx4Gn7/BVkWL+ihPwHfTfFGG3WLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723459300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ab/m5AKxXktze9znH0lC1CTq5g5RByZlcRmtfkhdDYg=;
 b=GJfa3mKW4I6tpgliRwiYLhtBbGkIDC74C/n3CszMeSZbMSp9WGam8RkFqaGQ0YCnuKccc1
 w2zE48nWsfhLN0Cw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IgJkHoKq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GJfa3mKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723459300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ab/m5AKxXktze9znH0lC1CTq5g5RByZlcRmtfkhdDYg=;
 b=IgJkHoKqaIx+8aIilB8EbIzDJeH3e3FLyHDm5fydwMTUMkepZ2c8ENJiQmbi/aNyM5lvaM
 QXTAFMM857fEISqLU1+nngqIX4DFVcr3z2OOT0p6X6MKbEOeuakO0xo97uN55+zk6NZ3ol
 GQttx4Gn7/BVkWL+ihPwHfTfFGG3WLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723459300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ab/m5AKxXktze9znH0lC1CTq5g5RByZlcRmtfkhdDYg=;
 b=GJfa3mKW4I6tpgliRwiYLhtBbGkIDC74C/n3CszMeSZbMSp9WGam8RkFqaGQ0YCnuKccc1
 w2zE48nWsfhLN0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6E0A13A23;
 Mon, 12 Aug 2024 10:41:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KtKkMuPmuWZ8RwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 10:41:39 +0000
Message-ID: <c8228a22-9a8c-4eca-bf09-d72208fe007b@suse.de>
Date: Mon, 12 Aug 2024 12:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm: Do delayed switcheroo in drm_lastclose()
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-2-tzimmermann@suse.de>
 <ZrnUoPuYv0v-yx79@phenom.ffwll.local> <ZrnhiTofu_L3hLzA@phenom.ffwll.local>
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
In-Reply-To: <ZrnhiTofu_L3hLzA@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[14]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com,lists.freedesktop.org];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:email, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -6.50
X-Rspamd-Queue-Id: 3BBE02025F
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

Am 12.08.24 um 12:18 schrieb Daniel Vetter:
> On Mon, Aug 12, 2024 at 11:23:44AM +0200, Daniel Vetter wrote:
>> On Mon, Aug 12, 2024 at 10:28:22AM +0200, Thomas Zimmermann wrote:
>>> Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
>>> their lastclose callbacks. Call it from drm_lastclose(), so that the
>>> driver functions can finally be removed. Only PCI devices with enabled
>>> switcheroo do the delayed switching. The call has no effect on other
>>> hardware.
>>>
>>> v2:
>>> - move change to drm_lastclose() (Sima)
>>> - update docs for vga_switcheroo_process_delayed_switch()
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> A bit an aside: The entire vgaswitcheroo code is still a midlayer mess,
>> where the locking is at the wrong layers resulting in the can_switch check
>> potentially being racy. But that's a different can of worms.
> Ok I got a bit annoyed about this mess again, and I think I have a
> reasonable idea for how to address it. Not sure why this took a decade,
> and definitely only pick this up if you're really bored.

No, definitely not. :) I don't think I have hardware for testing 
vga_switcheroo. Does this still exist? It seemed to be a thing of the 2000s.

Best regards
Thomas

>
> - We add a new vga_switcheroo_client_tryget, which checks the current
>    state, and if it's on, increments a newly added refcount (which vgw
>    switheroo maintains). Otherwise it fails. Drivers call this from their
>    drm_driver->open hook. This check also allows us to drop the
>    layer-violating checks in drm_open_helper for drm_dev->dev_power_state.
>
> - That refcount is dropped with vga_switcheroo_client_put, called from
>    drm_driver->close. If the refcount drops to 0 this function also does
>    delayed switch processing.
>
> - All the can_switch callbacks get removed and instead the vgwswr code
>    directly consults its own refount.
>
> With this we don't have locking inversions anymore, and the old vgw
> switcheroo code works a lot more like the new mode based on runtime pm and
> power domains.
>
> With a bit more shuffling I think we can also ditch
> drm_driver->dev_power_state:
>
> - There's one in the intel backlight code, which is annoying, since it's
>    wants to know whether the current callchain is from a vga switcheroo
>    state change. But doable with a little helper.
>
> - Most others just want a vga_switcheroo_client_is_off() helper, which
>    should be easy. Some are even entirely redundant, at least from a cursor
>    callchain check. There's no races for these because they only matter
>    during system suspend, since you should not mix both runtime and classic
>    vgaswitcheroo logic. We might want some checks for that in that new
>    helper ...
>
> - The one in the fbdev code is annoying, because it's another race.
>    Ideally instead of that check it needs a call to
>    vga_switcheroo_client_tryget/put just around the call to restore modes
>    (we do not want fbdev to block state switches), but that probably means
>    wiring a new callback through drm_client to drivers.
>
> - Might have missed a special case ...
>
> Anyway, I got nerdsniped, had an idea, figured best to type it up. Maybe
> we want to add a link to this to todo.rst, I think we have a vgaswitcheroo
> entry already.
>
> Cheers, Sima
>
>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>> ---
>>>   drivers/gpu/drm/drm_file.c       | 4 ++++
>>>   drivers/gpu/vga/vga_switcheroo.c | 3 +--
>>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 714e42b05108..513bef816ae9 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -38,6 +38,7 @@
>>>   #include <linux/pci.h>
>>>   #include <linux/poll.h>
>>>   #include <linux/slab.h>
>>> +#include <linux/vga_switcheroo.h>
>>>   
>>>   #include <drm/drm_client.h>
>>>   #include <drm/drm_drv.h>
>>> @@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
>>>   	drm_dbg_core(dev, "driver lastclose completed\n");
>>>   
>>>   	drm_client_dev_restore(dev);
>>> +
>>> +	if (dev_is_pci(dev->dev))
>>> +		vga_switcheroo_process_delayed_switch();
>>>   }
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
>>> index 365e6ddbe90f..18f2c92beff8 100644
>>> --- a/drivers/gpu/vga/vga_switcheroo.c
>>> +++ b/drivers/gpu/vga/vga_switcheroo.c
>>> @@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>>>   /**
>>>    * vga_switcheroo_process_delayed_switch() - helper for delayed switching
>>>    *
>>> - * Process a delayed switch if one is pending. DRM drivers should call this
>>> - * from their ->lastclose callback.
>>> + * Process a delayed switch if one is pending.
>>>    *
>>>    * Return: 0 on success. -EINVAL if no delayed switch is pending, if the client
>>>    * has unregistered in the meantime or if there are other clients blocking the
>>> -- 
>>> 2.46.0
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

