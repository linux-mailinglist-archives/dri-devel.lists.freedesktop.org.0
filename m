Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C9B3BBEB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A126E10EBAD;
	Fri, 29 Aug 2025 13:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="092QEI3v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BC8B4WF4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="092QEI3v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BC8B4WF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3D10EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 13:07:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B3C1C20830;
 Fri, 29 Aug 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756472834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ilyD2cOqtOyzlqVOjqg7d1mL9eol5NAIIMG9rO12+G8=;
 b=092QEI3vdZ5MfnWCWaNxsh8LRwDG1nQFm6VkQGw8zVRFmBW/siW3/GWob+t5xliX+O0cIc
 I6wL6vqAa34JpFXbVYhXHkgPzCKMLYmouKTOK+fI5f9LUfJzMMeSl3uYdBOEgFfk9mSQWy
 40of5pVOPzAWrs+gfKractLI5N2S/tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756472834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ilyD2cOqtOyzlqVOjqg7d1mL9eol5NAIIMG9rO12+G8=;
 b=BC8B4WF4vIeLstkdhNKmt2Mpari9L6+7osWQJJ9VkHPdmh/jOJZHl9rIacEtAvZL+SENsy
 MIuOVnGIheogB5Cw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=092QEI3v;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BC8B4WF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756472834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ilyD2cOqtOyzlqVOjqg7d1mL9eol5NAIIMG9rO12+G8=;
 b=092QEI3vdZ5MfnWCWaNxsh8LRwDG1nQFm6VkQGw8zVRFmBW/siW3/GWob+t5xliX+O0cIc
 I6wL6vqAa34JpFXbVYhXHkgPzCKMLYmouKTOK+fI5f9LUfJzMMeSl3uYdBOEgFfk9mSQWy
 40of5pVOPzAWrs+gfKractLI5N2S/tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756472834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ilyD2cOqtOyzlqVOjqg7d1mL9eol5NAIIMG9rO12+G8=;
 b=BC8B4WF4vIeLstkdhNKmt2Mpari9L6+7osWQJJ9VkHPdmh/jOJZHl9rIacEtAvZL+SENsy
 MIuOVnGIheogB5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C3C713326;
 Fri, 29 Aug 2025 13:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2ND1IAKmsWh9eAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Aug 2025 13:07:14 +0000
Message-ID: <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
Date: Fri, 29 Aug 2025 15:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>, Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
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
In-Reply-To: <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B3C1C20830
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:dkim,suse.de:mid];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
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

Hi,

it's been a while since you sent this report. I assume, the problem is 
this there?

Am 30.04.25 um 15:28 schrieb Nick Bowler:
> Hi Doug,
>
> On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
>> On Sun, Apr 20, 2025 at 9:26■PM Nick Bowler <nbowler@draconx.ca> wrote:
>>> I recently noticed that on current kernels I lose video output from
>>> my Blackbird's AST2500 BMC after a reboot
> [...]
>>>    ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
>>>    commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
>>>    Author: Douglas Anderson <dianders@chromium.org>
>>>    Date:   Fri Sep 1 16:39:53 2023 -0700
>>>
>>>        drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers
> [...]
>> Bleh. That's not good. If I had to guess there's some subtle bug /
>> missing timing constraint that's being triggered here. A few things to
>> try:
>>
>> 1. Add a several second delay after the call to
>> "drm_atomic_helper_shutdown()", like msleep(5000) or something like
>> that. That's kind of a shot in the dark, but it's fairly common for
>> panels to get upset if you turn them off and then turn them on again
>> too quickly. This would be my blind guess of what is happening.
> Adding msleep(5000) does nothing except that once the video turns off
> it now takes 5 seconds longer to reboot.
>
>> 2. Could you give more details about what panel you're using?
> According to the documentation I have for the machine, the video output
> of the AST2500 BMC is connected to an IT66121 HDMI transmitter.

That dmesg refers to a SIL164. I always thought these where only for 
DVI. With the IT66121, I'd expect the warning from [1] in the dmesg.

[1] 
https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_main.c#L196


The ast driver doesn't do much during shutdown. Could you please 
out-comment the lines at either [2] xor [3] and report on either effect? 
These calls turn of the video chip's memory access and sync pulses. Not 
doing that might resolve the problem.

[2] 
https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
[3] 
https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839

Best regards
Thomas

>
> Then in turn I have that connected to some generic HDMI->VGA adapter
> (PrimeCables branded).  I also tried with another much more expensive
> device (Extron DVI-RGB 200) and observe no difference in behaviour.
>
> i think these devices are working and there's just no output signal
> on the hdmi port.
>
>> Ideally it'd be great if you could say which device tree you're using too.
> Not sure how to answer this.  Do you want me to look at something
> specific in /proc/device-tree?  Or dump it somehow?
>
>> 3. Any chance you can gather the `dmesg` from a failing boot and
>> provide it somehow? Are there any errors in the logs from the failing
>> boot?
> To clarify, there is no boot failure.  There is just no video output
> after rebooting.  I can then boot Linux again by any method that works
> without being able to see the screen, and then everything is fine once
> I do that.
>
> I've attached the dmesg output (gzipped) from after such a reboot.
> Except for the order and the timestamps, the messages are identical to
> when I boot after rebooting a kernel which does not disable the video.
>
> Thanks,
>    Nick

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


