Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBD8C2508
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8810E16B;
	Fri, 10 May 2024 12:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="smNEeFBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AFdtb4lq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="smNEeFBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AFdtb4lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42510E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:45:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB5D33EFDC;
 Fri, 10 May 2024 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715345148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/d59zh3VwORos9iOvmG/UmbEq1KxHxkM5Ps3eRYMTuU=;
 b=smNEeFBcjQgiahEtVzxjkieIDeLx0ilWErZbGsoL/QBwvBRMjHZvpJi/uDiuEiV1+qGmvG
 CeVpdv2cJ6InOUpa7obKKbEAKhvsL5Gt21V3BIa0e7mzhbed7n6pKudSQmdohSVQXQyKQU
 vjIHjkOFD59fKw12GqFBnObmh8C0JjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715345148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/d59zh3VwORos9iOvmG/UmbEq1KxHxkM5Ps3eRYMTuU=;
 b=AFdtb4lqhSi1kICw/z+ZdTDjZuj4KEm1wWDHy+a4mmPyBJWYfyFE8MyW6lI8VHfWmhv0nU
 0liXQHLuyP76E1Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715345148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/d59zh3VwORos9iOvmG/UmbEq1KxHxkM5Ps3eRYMTuU=;
 b=smNEeFBcjQgiahEtVzxjkieIDeLx0ilWErZbGsoL/QBwvBRMjHZvpJi/uDiuEiV1+qGmvG
 CeVpdv2cJ6InOUpa7obKKbEAKhvsL5Gt21V3BIa0e7mzhbed7n6pKudSQmdohSVQXQyKQU
 vjIHjkOFD59fKw12GqFBnObmh8C0JjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715345148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/d59zh3VwORos9iOvmG/UmbEq1KxHxkM5Ps3eRYMTuU=;
 b=AFdtb4lqhSi1kICw/z+ZdTDjZuj4KEm1wWDHy+a4mmPyBJWYfyFE8MyW6lI8VHfWmhv0nU
 0liXQHLuyP76E1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFDF81386E;
 Fri, 10 May 2024 12:45:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rbekLfwWPmYXdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 12:45:48 +0000
Message-ID: <4710c7b9-d4e5-4eb9-9d69-d80c385deadf@suse.de>
Date: Fri, 10 May 2024 14:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
To: =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@gmail.com>
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
 <d8822317-db81-4179-93b8-18629a95af73@suse.de> <Zj3tvKayXdn2_JMq@gmail.com>
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
In-Reply-To: <Zj3tvKayXdn2_JMq@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[verizon.net,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_THREE(0.00)[3]
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

> (This was discussed on #dri-devel, but I'll reiterate here as well).
>
> There are two problems at hand; one is the race condition during boot
> when the login screen (or whatever display server appears first) is
> launched with simpledrm, only some moments later having the real GPU
> driver appear.
>
> The other is general purpose GPU hotplugging, including the unplugging
> the GPU decided by the compositor to be the primary one.

The situation of booting with simpledrm (problem 2) is a special case of 
problem 1. From the kernel's perspective, unloading simpledrm is the 
same as what you call general purpose GPU hotplugging. Even through 
there is not a full GPU, but a trivial scanout buffer. In userspace, you 
see the same sequence of events as in the general case.

>
> The latter is something that should be handled in userspace, by
> compositors, etc, I agree.
>
> The former, however, is not properly solved by userspace learning how to
> deal with primary GPU unplugging and switching to using a real GPU
> driver, as it'd break the booting and login experience.
>
> When it works, i.e. the race condition is not hit, is this:
>
>   * System boots
>   * Plymouth shows a "splash" screen
>   * The login screen display server is launched with the real GPU driver
>   * The login screen interface is smoothly animating using hardware
>     accelerating, presenting "advanced" graphical content depending on
>     hardware capabilities (e.g. high color bit depth, HDR, and so on)
>
> If the race condition is hit, with a compositor supporting primary GPU
> hotplugging, it'll work like this:
>
>   * System boots
>   * Plymouth shows a "splash" screen
>   * The login screen display server is launched with simpledrm
>   * Due to using simpldrm, the login screen interface is not animated and
>     just plops up, and no "advanced" graphical content is enabled due to
>     apparent missing hardware capabilities
>   * The real GPU driver appears, the login screen now starts to become
>     animated, and may suddenly change appearance due to capabilties
>     having changed
>
> Thus, by just supporting hotplugging the primary GPU in userspace, we'll
> still end up with a glitchy boot experience, and it forces userspace to
> add things like sleep(10) to work around this.
>
> In other words, fixing userspace is *not* a correct solution to the
> problem, it's a work around (albeit a behaivor we want for other
> reasons) for the race condition.

To really fix the flickering, you need to read the old DRM device's 
atomic state and apply it to the new device. Then tell the desktop and 
applications to re-init their rendering stack.

Depending on the DRM driver and its hardware, it might be possible to do 
this without flickering. The key is to not loose the original scanout 
buffer, while not probing the new device driver. But that needs work in 
each individual DRM driver.

>
> Arguably, the only place a more educated guess about whether to wait or
> not, and if so how long, is the kernel.

As I said before, driver modules come and go and hardware devices come 
and go.

To detect if there might be a native driver waiting to be loaded, you 
can test for

- 'nomodeset' on the command line -> no native driver
- 'systemd-load-modules' not started -> maybe wait
- look for drivers under /lib/modules/<version>/kernel/drivers/gpu/drm/ 
-> maybe wait
- maybe udev can tell you more
- it might for detection help that recently simpledrm devices refer to 
their parent PCI device
- maybe systemd tracks the probed devices

Best regards
Thomas

>
>
> Jonas
>
>> The next best solution is to keep the final DRM device open until a new one
>> shows up. All DRM graphics drivers with hotplugging support are required to
>> accept commands after their hardware has been unplugged. They simply won't
>> display anything.
>>
>> Best regards
>> Thomas
>>
>>
>>> Thanks
>>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

