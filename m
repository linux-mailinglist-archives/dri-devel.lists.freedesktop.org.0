Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F913B9193C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE7410E1C3;
	Mon, 22 Sep 2025 14:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Np3zle+J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IDmpkH5D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Np3zle+J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IDmpkH5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D206010E242
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:06:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 439FC1F395;
 Mon, 22 Sep 2025 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758550005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wg8QKqVwcWDgvlT/Tn58yEZTvY+u7wbclS/fzC/Gn5I=;
 b=Np3zle+J0+SWyCsJTS0G+Z5VmUYtE8JTsaFuYb4TRc2Wsfsv12PuZXn5orTaVxCpnKRsOu
 Soc7TJP0RAJ4hsIIfnwELVlSNcK+rGMo5xFZifAAznvONpnOIMpyKowF9I1mdaJ8rZ0a+W
 /du2Mo0EtlK1RhWgsXfV/cPJsIB3Wu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758550005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wg8QKqVwcWDgvlT/Tn58yEZTvY+u7wbclS/fzC/Gn5I=;
 b=IDmpkH5DihOzUf351t+Tl3AvPODhkkJtm+k0vGOumex50mYzY3/wffaE0H3AOKmxLKWvlC
 2GmzuaBfNcTXk+Aw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Np3zle+J;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IDmpkH5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758550005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wg8QKqVwcWDgvlT/Tn58yEZTvY+u7wbclS/fzC/Gn5I=;
 b=Np3zle+J0+SWyCsJTS0G+Z5VmUYtE8JTsaFuYb4TRc2Wsfsv12PuZXn5orTaVxCpnKRsOu
 Soc7TJP0RAJ4hsIIfnwELVlSNcK+rGMo5xFZifAAznvONpnOIMpyKowF9I1mdaJ8rZ0a+W
 /du2Mo0EtlK1RhWgsXfV/cPJsIB3Wu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758550005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wg8QKqVwcWDgvlT/Tn58yEZTvY+u7wbclS/fzC/Gn5I=;
 b=IDmpkH5DihOzUf351t+Tl3AvPODhkkJtm+k0vGOumex50mYzY3/wffaE0H3AOKmxLKWvlC
 2GmzuaBfNcTXk+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E694113A78;
 Mon, 22 Sep 2025 14:06:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6PDsNvRX0Wh/CAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 14:06:44 +0000
Message-ID: <f0f9d363-975e-48fe-b74c-3abeeb24a188@suse.de>
Date: Mon, 22 Sep 2025 16:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert the remaining commits about dma_buf
 handling
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
 <9c150f20-71d1-4af3-ba90-02a0a5b98330@igalia.com>
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
In-Reply-To: <9c150f20-71d1-4af3-ba90-02a0a5b98330@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 439FC1F395
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 22.09.25 um 15:42 schrieb Melissa Wen:
>
>
> On 22/09/2025 08:54, Thomas Zimmermann wrote:
>> Hi Melissa
>>
>> Am 19.09.25 um 17:54 schrieb Melissa Wen:
>>> Hi all,
>>>
>>> I just talked with Thomas that these two patches are preventing amdgpu
>>> driver to be unloaded:
>>>
>>> `modprobe: FATAL: Module amdgpu is in use.`
>>>
>>> and there is no process using the driver.
>>
>> What's the exact STR for this problem? After Christian's comments, I 
>> tried to reproduce the issue, but it works on my system. I do
>>
>> - boot up with amdgpu in text mode (multiuser.target)
>> - login by serial console
>> - 'rmmod amdgpu'
>>
>> That last step turns my test system's display off and unloads amdgpu. 
>> The kernel is a recent drm-tip at v6.17-rc6.
>
> - I booted up in graphical.target;
> - Connected via ssh, dropped the graphical interface to text mode 
> (multiuser.target), and tried to remove the module with `modprobe -r 
> amdgpu`

I do

- boot into graphical
- ssh into the test system
- via ssh: sudo systemctl isolate multi-user.target
- via ssh: sudo modprobe -r amdgpu

Works as expected.

>
> The issue happened in the latest 6.16 kernel version from Debian (I 
> don't have the machine with me atm to check the exact version), but 
> also with mainline kernel from last week.
>
> I bisected kernel from 6.16 and 6.15 and IIRC git bisect pointed to 
> `drm/framebuffer: Acquire internal references on GEM handles`, but as 
> it triggers another trace and AFAIU fixes `drm/gem: Acquire references 
> on GEM handles for framebuffers`, I reverted both pacthes and amdgpu 
> loaded/unloaded as expected.
>
> IGT amdgpu-specific tests for loading and unloading are also failing 
> because it's not able to unload the module.
> I didn't run the generic test.
>
> I'm using an AMD Cezanne laptop with a touch-screen capable display 
> (hp envy x360 convertible) with Debian + Gnome.
> I looked for process using the modules, but I didn't find any.

After you switched to multi-user, what is in /sys/kernel/debug/dri/<YOUR 
DRM DEV>/
framebuffer ?

There should only be a single fb allocated by fbcon.

>
> BTW, I don't discard that this work uncovered a preexist problem, for 
> example.
> Since those patches are addressing other issues, as mentioned by 
> Maarten, I'll debug the amdgpu driver further and check the points 
> raised.

Thanks

Best regards
Thomas


>
> Best Regards,
>
> Melissa
>
>>
>> Best regards
>> Thomas
>>
>>>
>>> We agreed that the best approach now is to completely revert the work
>>> done for improving DMA bug handling to avoid any loose ends. With these
>>> reverts we are just back to the old behavior and amdgpu loading and
>>> unloading will return to normal.
>>>
>>> Best Regards,
>>>
>>> Melissa
>>>
>>> Melissa Wen (2):
>>>    Revert "drm/framebuffer: Acquire internal references on GEM handles"
>>>    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
>>>
>>>   drivers/gpu/drm/drm_framebuffer.c | 31 +--------------
>>>   drivers/gpu/drm/drm_gem.c         | 64 
>>> +++++--------------------------
>>>   drivers/gpu/drm/drm_internal.h    |  2 -
>>>   include/drm/drm_framebuffer.h     |  7 ----
>>>   4 files changed, 11 insertions(+), 93 deletions(-)
>>>
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


