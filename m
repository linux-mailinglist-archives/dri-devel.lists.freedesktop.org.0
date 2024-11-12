Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD079C5056
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 09:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCC510E255;
	Tue, 12 Nov 2024 08:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yRpysj0F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Js1GNAuR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yRpysj0F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Js1GNAuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EFE10E255
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 08:12:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CE782174B;
 Tue, 12 Nov 2024 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731399092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qr5OChPFncC56wHPH9cbmD5GS1I+pLfMZgzb0/4DL24=;
 b=yRpysj0F8P8dtV9fVwKhx0VRam6njoHsDBHToVO5D7zVTns5frOLhLhWx9VZe6MQxnfuSX
 z9Wom3NYBhfD8VmY4+wYChySBW0UGuON1w2850C+yYFE1SrCdKgSrvupzQ6d/dvD9bBmc1
 AV8PD5rDJV2EA3Yk/APLYtO5bz5BKK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731399092;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qr5OChPFncC56wHPH9cbmD5GS1I+pLfMZgzb0/4DL24=;
 b=Js1GNAuREBPIZsseJTRHfPUY0TQdMj/Tsr6SlRHN/yWRL8OFZunGJXfdHfHJ30YjGv0GpI
 6vB18EFS9huz3pCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731399092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qr5OChPFncC56wHPH9cbmD5GS1I+pLfMZgzb0/4DL24=;
 b=yRpysj0F8P8dtV9fVwKhx0VRam6njoHsDBHToVO5D7zVTns5frOLhLhWx9VZe6MQxnfuSX
 z9Wom3NYBhfD8VmY4+wYChySBW0UGuON1w2850C+yYFE1SrCdKgSrvupzQ6d/dvD9bBmc1
 AV8PD5rDJV2EA3Yk/APLYtO5bz5BKK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731399092;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qr5OChPFncC56wHPH9cbmD5GS1I+pLfMZgzb0/4DL24=;
 b=Js1GNAuREBPIZsseJTRHfPUY0TQdMj/Tsr6SlRHN/yWRL8OFZunGJXfdHfHJ30YjGv0GpI
 6vB18EFS9huz3pCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E41B13721;
 Tue, 12 Nov 2024 08:11:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4tMcBrQNM2cEBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Nov 2024 08:11:32 +0000
Message-ID: <832483d5-db64-4195-a86c-028eff033fbe@suse.de>
Date: Tue, 12 Nov 2024 09:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/fbdev-dma: regression
To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <c392b606-e2a4-4644-9ce6-217fdcabfdeb@suse.de>
 <CAEXMXLRDDC+PB7S9VtqyMr1MUPPb7NYngwu4gcn9-K2kyHm3rQ@mail.gmail.com>
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
In-Reply-To: <CAEXMXLRDDC+PB7S9VtqyMr1MUPPb7NYngwu4gcn9-K2kyHm3rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.981]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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


Am 11.11.24 um 20:06 schrieb Nuno Gonçalves:
>
>
> On Mon, Nov 11, 2024, 14:37 Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>     Hi
>
>
>     Am 11.11.24 um 14:42 schrieb Nuno Gonçalves:
>     > On Mon, Nov 11, 2024 at 1:22 PM Thomas Zimmermann
>     <tzimmermann@suse.de> wrote:
>     >> The patch in question changes the whole memory management of the
>     >> affected code. It's also noteworthy that most of it has been
>     reworked
>     >> for the upcoming v6.12. Maybe this already fixed the problem.
>     Kernel
>     >> v6.11-rc7 added commit 5a498d4d06d6 ("drm/fbdev-dma: Only install
>     >> deferred I/O if necessary"), which possibly fixes the problem
>     as well.
>     >>
>     >> But there's no explicit fix for this problem and I have not
>     seen any
>     >> other related reports. Any further information is welcome.
>     > Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and
>     > tested until 6.12-rc3.
>     > Is there any suggestion on how to dig down?
>
>     Do you have a stack trace of this problem?
>
>
> No. I need to build kernel with debug?

Isn't there an error message in the output of dmesg?

Or maybe can you save the whole output of dmesg after a crash and attach 
the file to an email?

In the original bug report, you mentioned that you often get an error. 
But not 'always'?

Do you have a reproducer for the problem? Such as a very simple program 
that triggers the bug.

>
>
>
>     Which hardware platform is affected?
>
>
> ARM64 with ili9225 and display size 220, 176. It also
> happens in another board with a different tinydrm driver and size 320,
> 240.

I meant, which board or CPU. ARM64/Aarch64 is really just a very broad 
term describing the system.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

