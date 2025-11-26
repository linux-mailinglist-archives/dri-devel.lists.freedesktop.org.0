Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D1C8A0CB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96410E60B;
	Wed, 26 Nov 2025 13:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yu9UUo97";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yhK5dapJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fRzFy2U2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/+ETEnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1E310E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:32:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED5A233689;
 Wed, 26 Nov 2025 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764163955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hIZg0NrBErhJe7J0VcGIQwXQFyhWuMVsY6KJ1KKoZJo=;
 b=yu9UUo9701WVs7WPgMR1/R7ip+y1tzC5EIAMWiNRoKNN8CVjg6yOvQg+0jsBx26lKHWwgF
 pFAiykqu54AqiBlZcHC/LGAhyF9y5G5tXQbv00lvZljEtf7Vgjv9SA9P53fh8y6CjNLuue
 axEWmNV+2p+Yo62adhdFm0K3M1LXTVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764163955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hIZg0NrBErhJe7J0VcGIQwXQFyhWuMVsY6KJ1KKoZJo=;
 b=yhK5dapJY20S8BiN1WG0Db7vKHTy5iK465l6GWvq/8W2s4xXfzfUo4iT7l0zkAyUTMnO9B
 JVKUUtSviQnZySBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fRzFy2U2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4/+ETEnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764163954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hIZg0NrBErhJe7J0VcGIQwXQFyhWuMVsY6KJ1KKoZJo=;
 b=fRzFy2U2RL4r3Ye9td70s1YnUwVGh9x+Dwrwl/HhJHr8lQswRgePYhxbFEFVh/c+avHf1d
 sECx7cbU1NVVNFYmXUtOZCkPfJL8Ei0Vd5V1Hrm+JBrzuVL2bckOL2yG9SWn9wJOTyu8M9
 OW/EBXPu/IBjVJahKZLd61x+MyAO4P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764163954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hIZg0NrBErhJe7J0VcGIQwXQFyhWuMVsY6KJ1KKoZJo=;
 b=4/+ETEnEFvDi03gyIpr9+BPhTRn6YhY4FV7tF5EoKo1NfmkTHZV4kyteispDmmTSb83Lyx
 +5NndoTVIifx+uAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F4B53EA63;
 Wed, 26 Nov 2025 13:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +a+/GXEBJ2lZBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 13:32:33 +0000
Message-ID: <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
Date: Wed, 26 Nov 2025 14:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Daniel Thompson <danielt@kernel.org>, Doug Anderson <dianders@chromium.org>
Cc: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nir Lichtman <nir@lichtman.org>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
 <aSbwWLTLe0bMhOKV@aspen.lan>
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
In-Reply-To: <aSbwWLTLe0bMhOKV@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,lists.freedesktop.org,vger.kernel.org,lichtman.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,suse.com:url];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ED5A233689
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

Am 26.11.25 um 13:19 schrieb Daniel Thompson:
> On Tue, Nov 25, 2025 at 07:26:33AM -0800, Doug Anderson wrote:
>> On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> <snip>
>>> Therefore remove the remaining support for kdb from the DRM drivers
>>> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
>>> there are no fbdev drivers with kdb support.
>>>
>>> If we ever want to address kdb support within DRM drivers, a place to
>>> start would be the scanout buffers used by DRM's panic screen. These
>>> use the current display mode. They can be written and flushed without
>>> mode setting involved.
>>>
>>> Note: kdb over serial lines is not affected by this series and continues
>>> to work as before.
>>>
>>> Thomas Zimmermann (5):
>>>    drm/amdgpu: Do not implement mode_set_base_atomic callback
>>>    drm/nouveau: Do not implement mode_set_base_atomic callback
>>>    drm/radeon: Do not implement mode_set_base_atomic callback
>>>    drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>>>    fbcon: Remove fb_debug_enter/_leave from struct fb_ops
>> Personally, I've never worked with kdb over anything other than
>> serial, so this won't bother any of my normal workflows. That being
>> said, at least as of a year ago someone on the lists was talking about
>> using kdb with a keyboard and (presumably) a display. You can see a
>> thread here:
>>
>> http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org
>>
>> Daniel may also have comments here?
> TL;DR - I'm pretty relaxed about these changes... but I'd like
>          to know how to test the changes.
>
> Like Doug I only really use kdb via serial but, since I'm maintain
> the thing I do occasionally test kdb works on the qemu console. I don't
> do it very often though because it's a manual test!
>
> I'd assume that will still work since it won't involve any of the
> drivers above. I'm afraid I can't double check that since patch 4
> doesn't apply cleanly in v6.18-rc7 (nor to linux-next... and neither
> does the base-commit appear in linux-next).

To test its effects, ignore this series and simply clear the two 
calbacks at [1]. This is where the debugger invokes fbcon. The series 
removes their implementation in the final patch.

[1] 
https://elixir.bootlin.com/linux/v6.17.9/source/drivers/video/fbdev/core/fbcon.c#L3202

Best regards
Thomas

>
> Anyhow, the only testing I do for kgdboc=kms,kdb is to boot an x86-64
> defconfig+kgdb+kdb kernel in qemu with something like the following
> command line, which FWIW does still work:
>
>      qemu-system-x86_64 -enable-kvm -m 1G -smp 2 \
>        -kernel arch/x86/boot/bzImage \
>        -monitor none -chardev stdio,id=mon,mux=on,signal=off \
>        -serial chardev:mon \
>        -initrd rootfs.cpio.gz \
>        -append " console=tty0 console=ttyS0,115200 kgdboc=kms,kbd,ttyS0 kgdbwait"
>
> The reason I'm fairly relaxed about changes here is that the kbd driver
> only works on PCs with legacy keyboard interfaces. If the kernel is
> talking to the keyboard using USB or I2C (which almost all PCs do) then
> kdb cannot be used anyway.
>
> So... it would be a "cool project"[1] to get kdb running on
> a special interrupt-free I2C mode and with the DRM panic code so you
> can do live analysis if your laptop/chomebook crashes. However it is
> simply not "real enough" to justify slowing down other developers.
>
>
> Daniel.
>
>
> [1] ... but not quite cool enough that I see myself spending time on it
>      though!
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


