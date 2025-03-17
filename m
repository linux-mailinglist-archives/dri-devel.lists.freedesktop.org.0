Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59087A645F7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBED10E3C4;
	Mon, 17 Mar 2025 08:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GRuWmDoy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IxR2+CKx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbOwSaL8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1NnHiFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F4610E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:42:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D44861F84F;
 Mon, 17 Mar 2025 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742200932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TagA8UvA5SHUxGBYCxjN+6Nwr/nBWh4IrPpJtlL5xDE=;
 b=GRuWmDoyRxS6mPjJL9BTYh/A1a0U2RH43nucoz9OG0Mb/Ub6/Z242cGpr5fbTxscUXlo03
 jF/JqpMYPUYeznLUIn0d+sirl2U/35415BASIdt4SUFqsVkeMYZPUpIaXgeW/MTUHIJ3dk
 An55jp/8wljM6cwwBWn+aCryxnkkBLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742200932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TagA8UvA5SHUxGBYCxjN+6Nwr/nBWh4IrPpJtlL5xDE=;
 b=IxR2+CKxvgpJpWjdEMBG9U9431e5FjhTsvFhK9xVka1l3CNPmG8+zYNZe5cWVtj3KtY0BR
 CVeDuSoYzH/al/Dg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NbOwSaL8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t1NnHiFz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742200931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TagA8UvA5SHUxGBYCxjN+6Nwr/nBWh4IrPpJtlL5xDE=;
 b=NbOwSaL8shjmYCSTsfxAgMV2DAHteA+1NI4bS4EjoGjIZSFDcP2Sz6v/ZY6Nf3svd5rLye
 M0zSEHiNYogoVYTHsLuzEwRwMq/VtSQd98mzSFo0ezLLGz3KmEkIbuE6WvGQZYqKr4WyDp
 4Y3itDMvctTdNn0obGyoWtJgKbghqso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742200931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TagA8UvA5SHUxGBYCxjN+6Nwr/nBWh4IrPpJtlL5xDE=;
 b=t1NnHiFze9A8Djl2rVOuLF7tHhAI1Jan+j7uRT9B6YFGar/D9gappgqdm2WpyQMjdjQY5P
 XQwWruV0R91lhaCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8484C139D2;
 Mon, 17 Mar 2025 08:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CZCDHmPg12dJAQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 08:42:11 +0000
Message-ID: <f3c245a4-d932-417e-a0e8-f0453c9bc2ef@suse.de>
Date: Mon, 17 Mar 2025 09:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250313165151.GE3645863@google.com>
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
In-Reply-To: <20250313165151.GE3645863@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D44861F84F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 13.03.25 um 17:51 schrieb Lee Jones:
> On Thu, 06 Mar 2025, Thomas Zimmermann wrote:
>
>> This series removes the remaining dependencies on fbdev from the
>> backlight, lcd and led subsystems. Each depends on fbdev events to
>> track display state. Make fbdev inform each subsystem via a dedicated
>> interface instead.
>>
>> Patches 1 to 3 make fbdev track blank state for each display, so that
>> backlight code doesn't have to.
>>
>> Patches 4 to 6 remove fbdev event handling from backlight code. Patches
>> 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
>> do the same for led's backlight trigger.
>>
>> The final patch removes the event constants from fbdev.
>>
>> With the series applied, the three subsystems do no longer depend on
>> fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
>> number of events. That mechanism has been deprecated for some time and
>> converted call to dedicated functions instead.
>>
>> Testing is very welcome, as I don't have the hardware to test this
>> series.
>>
>> v3:
>> - export several symbols
>> - static-inline declare empty placeholders
>> v2:
>> - avoid IS_REACHABLE() in source file (Lee)
>> - simplify several interfaces and helpers
>> - use lock guards
>> - initialize global lists and mutices
>>
>> Thomas Zimmermann (11):
>>    fbdev: Rework fb_blank()
>>    fbdev: Track display blanking state
>>    fbdev: Send old blank state in FB_EVENT_BLANK
>>    backlight: Implement fbdev tracking with blank state from event
>>    backlight: Move blank-state handling into helper
>>    backlight: Replace fb events with a dedicated function call
>>    backlight: lcd: Move event handling into helpers
>>    backlight: lcd: Replace fb events with a dedicated function call
>>    leds: backlight trigger: Move blank-state handling into helper
>>    leds: backlight trigger: Replace fb events with a dedicated function
>>      call
>>    fbdev: Remove constants of unused events
>>
>>   drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
>>   drivers/video/backlight/backlight.c      |  93 +++++--------------
>>   drivers/video/backlight/lcd.c            | 108 +++++++++--------------
>>   drivers/video/fbdev/core/fb_backlight.c  |  12 +++
>>   drivers/video/fbdev/core/fb_info.c       |   1 +
>>   drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
>>   drivers/video/fbdev/core/fbsysfs.c       |   8 +-
>>   include/linux/backlight.h                |  22 ++---
>>   include/linux/fb.h                       |  12 +--
>>   include/linux/lcd.h                      |  21 ++++-
>>   include/linux/leds.h                     |   6 ++
>>   11 files changed, 205 insertions(+), 208 deletions(-)
> No immediately obvious issues from the LEDs side.
>
> Still needs reviews from Backlight and fbdev.

I'm confused. Are you not the backlight maintainer?

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

