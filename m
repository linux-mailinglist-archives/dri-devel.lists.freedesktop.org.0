Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D5A5DC19
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 12:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6010E0AD;
	Wed, 12 Mar 2025 11:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WA+2hijl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="05suShhz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WA+2hijl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="05suShhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6E10E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 11:58:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CBE11F385;
 Wed, 12 Mar 2025 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741780732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BJozpFjObkVNBtmvlTu6/zOx/tI2eF0iSbrX/MIRk9E=;
 b=WA+2hijlJ+wbcaRt6ShsZAdg0kx2dNfRdW3JHaHhcercYGVhxRpK84WLAlxahd+6vroicE
 xCmsxnj5xe659zBj40v4AAQw772SMNw1N/oZY/l3uTpGUy3rbpMoizcbg0D/akP4VNpA7X
 zvpu1pdqje+mbO5NaFTfA22sx85hcDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741780732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BJozpFjObkVNBtmvlTu6/zOx/tI2eF0iSbrX/MIRk9E=;
 b=05suShhzdjmD+nlHx3wD61vlQJN61XeMzGqaaIzptmV9sWUaY36SUCaG5yW1a1z3y228NJ
 hj+zDkeXZlvBkmBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WA+2hijl;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=05suShhz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741780732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BJozpFjObkVNBtmvlTu6/zOx/tI2eF0iSbrX/MIRk9E=;
 b=WA+2hijlJ+wbcaRt6ShsZAdg0kx2dNfRdW3JHaHhcercYGVhxRpK84WLAlxahd+6vroicE
 xCmsxnj5xe659zBj40v4AAQw772SMNw1N/oZY/l3uTpGUy3rbpMoizcbg0D/akP4VNpA7X
 zvpu1pdqje+mbO5NaFTfA22sx85hcDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741780732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BJozpFjObkVNBtmvlTu6/zOx/tI2eF0iSbrX/MIRk9E=;
 b=05suShhzdjmD+nlHx3wD61vlQJN61XeMzGqaaIzptmV9sWUaY36SUCaG5yW1a1z3y228NJ
 hj+zDkeXZlvBkmBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B88731377F;
 Wed, 12 Mar 2025 11:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id goM+K/p20Wf3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Mar 2025 11:58:50 +0000
Message-ID: <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
Date: Wed, 12 Mar 2025 12:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com"
 <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4CBE11F385
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[22];
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[live.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 FREEMAIL_CC(0.00)[kodeit.net,kernel.org,redhat.com,ffwll.ch,linux.intel.com,suse.com,goodmis.org,rasmusvillemoes.dk,chromium.org,lwn.net,linux-foundation.org,canonical.com,perches.com,gmail.com,vger.kernel.org,lists.freedesktop.org,marcan.st,svenpeter.dev,lists.linux.dev];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[rasmusvillemoes.dk:email, live.com:email,
 suse.de:email, suse.de:dkim, suse.de:mid, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, intel.com:email, marcan.st:email]
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

Am 12.03.25 um 12:49 schrieb Aditya Garg:
>
>> On 12 Mar 2025, at 5:16 PM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> ﻿Hi
>>
>>> Am 12.03.25 um 10:05 schrieb Aditya Garg:
>>> From: Hector Martin <marcan@marcan.st>
>>>
>>> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
>>> it's useful to be able to print generic 4-character codes formatted as
>>> an integer. Extend it to add format specifiers for printing generic
>>> 32-bit FourCCs with various endian semantics:
>>>
>>> %p4ch    Host byte order
>>> %p4cn    Network byte order
>>> %p4cl    Little-endian
>>> %p4cb    Big-endian
>> That looks like someone trying to be too clever for their own good. Just my 2 cts.
> I don't understand what you are trying to say. Anyways, I thought it's obvious, but Petr's Ack is still left and thus cannot be merged into DRM for now unless he says so in this thread.

I'm trying to say that the author of this patch found the %p4cc 
functionality and over-generalized the feature. Source code should 
express the idea of what it's doing in clear terms. %p4ch somehow 
doesn't do that for me. Printing 4 bytes in various orders without 
context seems arbitrary and confusing.

(I don't really have a say here. I'm just asking to reconsider this change.)

Best regards
Thomas

>> Best regards
>> Thomas
>>
>>> The endianness determines how bytes are interpreted as a u32, and the
>>> FourCC is then always printed MSByte-first (this is the opposite of
>>> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
>>> allow printing LSByte-first FourCCs stored in host endian order
>>> (other than the hex form being in character order, not the integer
>>> value).
>>>
>>> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>>> ---
>>>   Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
>>>   lib/test_printf.c                         | 39 +++++++++++++++++++----
>>>   lib/vsprintf.c                            | 35 ++++++++++++++++----
>>>   scripts/checkpatch.pl                     |  2 +-
>>>   4 files changed, 94 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
>>> index ecccc0473..bd420e8aa 100644
>>> --- a/Documentation/core-api/printk-formats.rst
>>> +++ b/Documentation/core-api/printk-formats.rst
>>> @@ -648,6 +648,38 @@ Examples::
>>>       %p4cc    Y10  little-endian (0x20303159)
>>>       %p4cc    NV12 big-endian (0xb231564e)
>>>   +Generic FourCC code
>>> +-------------------
>>> +
>>> +::
>>> +    %p4c[hnlb]    gP00 (0x67503030)
>>> +
>>> +Print a generic FourCC code, as both ASCII characters and its numerical
>>> +value as hexadecimal.
>>> +
>>> +The generic FourCC code is always printed in the big-endian format,
>>> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
>>> +
>>> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
>>> +endianness is used to load the stored bytes. The data might be interpreted
>>> +using the host byte order, network byte order, little-endian, or big-endian.
>>> +
>>> +Passed by reference.
>>> +
>>> +Examples for a little-endian machine, given &(u32)0x67503030::
>>> +
>>> +    %p4ch    gP00 (0x67503030)
>>> +    %p4cn    00Pg (0x30305067)
>>> +    %p4cl    gP00 (0x67503030)
>>> +    %p4cb    00Pg (0x30305067)
>>> +
>>> +Examples for a big-endian machine, given &(u32)0x67503030::
>>> +
>>> +    %p4ch    gP00 (0x67503030)
>>> +    %p4cn    00Pg (0x30305067)
>>> +    %p4cl    00Pg (0x30305067)
>>> +    %p4cb    gP00 (0x67503030)
>>> +
>>>   Rust
>>>   ----
>>>   diff --git a/lib/test_printf.c b/lib/test_printf.c
>>> index 59dbe4f9a..b9e8afc01 100644
>>> --- a/lib/test_printf.c
>>> +++ b/lib/test_printf.c
>>> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
>>>       software_node_unregister_node_group(group);
>>>   }
>>>   +struct fourcc_struct {
>>> +    u32 code;
>>> +    const char *str;
>>> +};
>>> +
>>> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
>>> +                       const char *fmt)
>>> +{
>>> +    size_t i;
>>> +
>>> +    for (i = 0; i < n; i++)
>>> +        test(fc[i].str, fmt, &fc[i].code);
>>> +}
>>> +
>>>   static void __init fourcc_pointer(void)
>>>   {
>>> -    struct {
>>> -        u32 code;
>>> -        char *str;
>>> -    } const try[] = {
>>> +    static const struct fourcc_struct try_cc[] = {
>>>           { 0x3231564e, "NV12 little-endian (0x3231564e)", },
>>>           { 0xb231564e, "NV12 big-endian (0xb231564e)", },
>>>           { 0x10111213, ".... little-endian (0x10111213)", },
>>>           { 0x20303159, "Y10  little-endian (0x20303159)", },
>>>       };
>>> -    unsigned int i;
>>> +    static const struct fourcc_struct try_ch[] = {
>>> +        { 0x41424344, "ABCD (0x41424344)", },
>>> +    };
>>> +    static const struct fourcc_struct try_cn[] = {
>>> +        { 0x41424344, "DCBA (0x44434241)", },
>>> +    };
>>> +    static const struct fourcc_struct try_cl[] = {
>>> +        { (__force u32)cpu_to_le32(0x41424344), "ABCD (0x41424344)", },
>>> +    };
>>> +    static const struct fourcc_struct try_cb[] = {
>>> +        { (__force u32)cpu_to_be32(0x41424344), "ABCD (0x41424344)", },
>>> +    };
>>>   -    for (i = 0; i < ARRAY_SIZE(try); i++)
>>> -        test(try[i].str, "%p4cc", &try[i].code);
>>> +    fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
>>> +    fourcc_pointer_test(try_ch, ARRAY_SIZE(try_ch), "%p4ch");
>>> +    fourcc_pointer_test(try_cn, ARRAY_SIZE(try_cn), "%p4cn");
>>> +    fourcc_pointer_test(try_cl, ARRAY_SIZE(try_cl), "%p4cl");
>>> +    fourcc_pointer_test(try_cb, ARRAY_SIZE(try_cb), "%p4cb");
>>>   }
>>>     static void __init
>>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>>> index 56fe96319..56511a994 100644
>>> --- a/lib/vsprintf.c
>>> +++ b/lib/vsprintf.c
>>> @@ -1781,27 +1781,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
>>>       char output[sizeof("0123 little-endian (0x01234567)")];
>>>       char *p = output;
>>>       unsigned int i;
>>> +    bool pixel_fmt = false;
>>>       u32 orig, val;
>>>   -    if (fmt[1] != 'c' || fmt[2] != 'c')
>>> +    if (fmt[1] != 'c')
>>>           return error_string(buf, end, "(%p4?)", spec);
>>>         if (check_pointer(&buf, end, fourcc, spec))
>>>           return buf;
>>>         orig = get_unaligned(fourcc);
>>> -    val = orig & ~BIT(31);
>>> +    switch (fmt[2]) {
>>> +    case 'h':
>>> +        break;
>>> +    case 'n':
>>> +        orig = swab32(orig);
>>> +        break;
>>> +    case 'l':
>>> +        orig = (__force u32)cpu_to_le32(orig);
>>> +        break;
>>> +    case 'b':
>>> +        orig = (__force u32)cpu_to_be32(orig);
>>> +        break;
>>> +    case 'c':
>>> +        /* Pixel formats are printed LSB-first */
>>> +        pixel_fmt = true;
>>> +        break;
>>> +    default:
>>> +        return error_string(buf, end, "(%p4?)", spec);
>>> +    }
>>> +
>>> +    val = pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
>>>         for (i = 0; i < sizeof(u32); i++) {
>>> -        unsigned char c = val >> (i * 8);
>>> +        unsigned char c = val >> ((3 - i) * 8);
>>>             /* Print non-control ASCII characters as-is, dot otherwise */
>>>           *p++ = isascii(c) && isprint(c) ? c : '.';
>>>       }
>>>   -    *p++ = ' ';
>>> -    strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
>>> -    p += strlen(p);
>>> +    if (pixel_fmt) {
>>> +        *p++ = ' ';
>>> +        strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
>>> +        p += strlen(p);
>>> +    }
>>>         *p++ = ' ';
>>>       *p++ = '(';
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 7b28ad331..5595a0898 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -6904,7 +6904,7 @@ sub process {
>>>                           ($extension eq "f" &&
>>>                            defined $qualifier && $qualifier !~ /^w/) ||
>>>                           ($extension eq "4" &&
>>> -                         defined $qualifier && $qualifier !~ /^cc/)) {
>>> +                         defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
>>>                           $bad_specifier = $specifier;
>>>                           last;
>>>                       }
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

