Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B159B5DEF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB9810E75C;
	Wed, 30 Oct 2024 08:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jTnuBer3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vkL3R1+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jTnuBer3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vkL3R1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444C10E75C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 08:33:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A45821ED3;
 Wed, 30 Oct 2024 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730277209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sLnKZLuPiducXjKHGcatFat4Gbdwzr3t9gjjmSRAUSI=;
 b=jTnuBer3PrA4qwjLIXYSMORNZmvhFq2ccQ2aLz9qdj5TwD5chitv9N6lBglc4vahtNPbPb
 F1YTA3znSi74DJmY7/nITRFR/nAp/uIxyr+RO6jVxXj308XONEvL9XHjqsq4nRZFhISeS0
 nvvLDsTm+AG3sznRo3MY05KP5yE5v/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730277209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sLnKZLuPiducXjKHGcatFat4Gbdwzr3t9gjjmSRAUSI=;
 b=+vkL3R1+wYzTplrieOxpp4aaun2mbV176K7bozykOZUu600YwY2mozEqzocsDSjf7vlTzL
 bN0MZs9rjw/ov/DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jTnuBer3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+vkL3R1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730277209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sLnKZLuPiducXjKHGcatFat4Gbdwzr3t9gjjmSRAUSI=;
 b=jTnuBer3PrA4qwjLIXYSMORNZmvhFq2ccQ2aLz9qdj5TwD5chitv9N6lBglc4vahtNPbPb
 F1YTA3znSi74DJmY7/nITRFR/nAp/uIxyr+RO6jVxXj308XONEvL9XHjqsq4nRZFhISeS0
 nvvLDsTm+AG3sznRo3MY05KP5yE5v/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730277209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sLnKZLuPiducXjKHGcatFat4Gbdwzr3t9gjjmSRAUSI=;
 b=+vkL3R1+wYzTplrieOxpp4aaun2mbV176K7bozykOZUu600YwY2mozEqzocsDSjf7vlTzL
 bN0MZs9rjw/ov/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 190BB136A5;
 Wed, 30 Oct 2024 08:33:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aqzIBFnvIWd3EwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Oct 2024 08:33:29 +0000
Message-ID: <46712e5b-701b-41c5-82f0-d6b41f5947af@suse.de>
Date: Wed, 30 Oct 2024 09:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Helge Deller <deller@gmx.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
 <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
 <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
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
In-Reply-To: <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3A45821ED3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmx.de,gmail.com,vger.kernel.org,lists.freedesktop.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid]
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

Am 29.10.24 um 21:42 schrieb Helge Deller:
> Hi Thomas,
>
> On 10/28/24 09:41, Thomas Zimmermann wrote:
>> Am 25.10.24 um 17:37 schrieb Helge Deller:
>>> On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
>>>> The fb_udl driver currently depends on CONFIG_FB_DEVICE to create 
>>>> sysfs
>>>> entries and access framebuffer device information. This patch wraps 
>>>> the
>>>> relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the 
>>>> driver to
>>>> be built and used even if CONFIG_FB_DEVICE is not selected.
>>>>
>>>> The sysfs setting only controls access to certain framebuffer 
>>>> attributes
>>>> and is not required for the basic display functionality to work 
>>>> correctly.
>>>> (For information on DisplayLink devices and their Linux support, see:
>>>> https://wiki.archlinux.org/title/DisplayLink).
>>>>
>>>> Tested by building with and without CONFIG_FB_DEVICE, both of which
>>>> compiled and ran without issues.
>>>
>>> Gonzalo, I don't like this patch very much.
>>>
>>> It adds lots of #ifdefs around functions like dev_dbg().
>>> Instead of ifdefs, aren't there other possibilities, e.g.
>>> using fb_dbg() if appropriate?
>>> Or using any other generic dbg() info or simply dropping the line?
>>
>> I talked Gonzalo into sending this patch. I think dev_dbg() calls
>> should be replaced with fb_dbg(), same for _info() and _err(). That's
>> probably worth doing anyway.
>
> Yes, but I doubt every of those calls can be replaced...
>
>>> But more important:
>>> This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
>>> If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
>>> you want fbdev output at bootup, but otherwise just want to use DRM.
>>
>> It's unrelated to booting. CONFIG_FB_DEVICE enables/disables
>> userspace interfaces (/dev/fb*, /sys/graphics/fb*). Even without,
>> there's still fbcon that runs on top of the fbdev driver.
>
> Sure, I meant that if people enable a fdev driver, they most likely
> want /dev/fb as well ..... unless they want to use mostly DRM drivers.
>
>>> But then, doesn't there exist a native DRM driver for this graphics
>>> card which can be used instead?
>>> If so, I suggest to not change this fbdev driver at all.
>>
>> Or can we talk about removing udlfb entirely? I tried before, but
>> there was one person still using it. [1] He had concerns about udl's
>> (the DRM driver) stability. I think DRM's udl has matured enough and
>> is in better shape than udlfb. Maybe we can try again.> [1] 
>> https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse.de/
>
> The stability was one of the issues, but IMHO the *main* issue he 
> mentions is this:
>
> The framebuffer driver is faster, it keeps back buffer and updates only
> data that differ between the front and back buffer. The DRM driver 
> doesn't
> have such optimization, it will update everything in a given rectangle -
> this increases USB traffic and makes video playback more jerky.

If that was a problem, it has long been solved. [1][2] The DRM udl 
driver keeps a backbuffer in system memory. The DRM API provides 
built-in damage handling, so that clients can mark the framebuffer 
regions that have been written. Udl will only update the regions that 
have been modified.

For fbdev support specifically, the fbdev code mmaps the drivers 
internal backbuffer to userspace and does deferred I/O and damage 
handling on these pages. Hence, there's only one transfer over USB with 
no internal copying. There used to be more internal copying, but that is 
gone. [3]

[1] https://patchwork.freedesktop.org/patch/501943/
[2] https://patchwork.freedesktop.org/patch/506133/
[3] https://patchwork.freedesktop.org/patch/590306/?series=131037&rev=4

>
> That's exactly the main concern I'm regularily bringing up and which
> IMHO is the main reason we still have many fbdev drivers.
> You added support for some of those graphics cards with native DRM
> drivers, but all of them are unaccelerated. This hurts a lot on old
> machines and as such specific cards are ugly slowly with DRM.
> A good example for this is the kvm drm graphics driver which is sluggish
> and slow when using KVM.
>
> I'm happy to get rid of the fbdev drivers, but for that DRM really needs
> to allow some sort of native fillrect, copyarea and imageblt 
> operations so
> that we can get performance back on the old cards when implementing them
> as DRM driver.

This is unrelated to udl.

Best regards
Thomas

>
> Helge

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

