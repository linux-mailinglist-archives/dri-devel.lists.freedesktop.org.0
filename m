Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11B908497
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214310E264;
	Fri, 14 Jun 2024 07:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="l6qk5MK/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OsgcPN0G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lfLDkCeX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w8ER1qIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2F10E264
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:24:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE059221E5;
 Fri, 14 Jun 2024 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718349840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2b0mkGYWVL8dqww12f5KC+N567kXNMjRf3DIoJnRcV0=;
 b=l6qk5MK/tY3vBuO9i2B32BU+qzv63hTXHkOPedjflp5JpbsJWqSZC+9rlYCtUVHMTxJRVS
 NaaPQ7yCNiN0Lx4qWK+nQ3ndPQDyF5Tn0f77ohbYAeAgE5inLjjeJYzwMiM95ZkttprsFF
 n0iOgjFQ7pM43gYgmchuE4WN120cWP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718349840;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2b0mkGYWVL8dqww12f5KC+N567kXNMjRf3DIoJnRcV0=;
 b=OsgcPN0GZgtRAMXY8vWgiV42wE5qflifRw9mzR4/cs5A00Tw8tQEWDTsqIMt3JrFOJxhNV
 FCcEZuoAsxfPPaDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lfLDkCeX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w8ER1qIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718349839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2b0mkGYWVL8dqww12f5KC+N567kXNMjRf3DIoJnRcV0=;
 b=lfLDkCeXCqwn+8LqKmQUWOlhDh0QfAMP9P2krzdBdkeY4TUmXGSJ2d+5uC22hhwdTX1a+S
 NJ+dmvzSiO7omKN+5+lPzqmrr2VZr1rBIJo5uInKHQGJ8vUsIzk2dQosOZBG1qYS2cZpS6
 crUX2dD95pOnpUUUqCN9HmcsyL1KEbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718349839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2b0mkGYWVL8dqww12f5KC+N567kXNMjRf3DIoJnRcV0=;
 b=w8ER1qIEdN+bEVgMOrSssGX4edeHxjUACQmu1GuLGHpj/ojQOD1+6kRB7rFr0/CajJuwyK
 K9KzfE/5xS30JmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E1C613AAF;
 Fri, 14 Jun 2024 07:23:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2JD6JA/wa2b8UAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 07:23:59 +0000
Message-ID: <9f2e4bc5-fa0a-4910-85d0-c76559a5ae37@suse.de>
Date: Fri, 14 Jun 2024 09:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, sam@ravnborg.org,
 hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240613090240.7107-1-tzimmermann@suse.de>
 <5d8d2efe-45dd-4033-aaae-e7f923ef9e76@gmx.de>
 <87tthwqzq2.fsf@minerva.mail-host-address-is-not-set>
 <64bbb753-ec26-41ca-a585-fb74ae9e854c@gmx.de>
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
In-Reply-To: <64bbb753-ec26-41ca-a585-fb74ae9e854c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DE059221E5
X-Spam-Score: -6.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,ravnborg.org,zytor.com];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmx.de];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:dkim, gmx.de:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 14.06.24 um 00:24 schrieb Helge Deller:
> On 6/13/24 23:50, Javier Martinez Canillas wrote:
>> Helge Deller <deller@gmx.de> writes:
>>
>>> On 6/13/24 11:02, Thomas Zimmermann wrote:
>>>> Test the vesa_attributes field in struct screen_info for compatibility
>>>> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
>>>> capabilities field, It sets the framebuffer address size and is
>>>> unrelated to VGA.
>>>>
>>>> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
>>>> the mode's attributes field signals VGA compatibility. The mode is
>>>> compatible with VGA hardware if the bit is clear. In that case, the
>>>> driver can access VGA state of the VBE's underlying hardware. The
>>>> vesafb driver uses this feature to program the color LUT in palette
>>>> modes. Without, colors might be incorrect.
>>>>
>>>> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: 
>>>> Fix
>>>> incorrect logo colors in x86_64"). It incorrectly stores the mode
>>>> attributes in the screen_info's capabilities field and updates vesafb
>>>> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing 
>>>> support for
>>>> the new x86 setup code") fixed the screen_info, but did not update 
>>>> vesafb.
>>>> Color output still tends to work, because bit 1 in capabilities is
>>>> usually 0.
>>>>
>>>> Besides fixing the bug in vesafb, this commit introduces a helper that
>>>> reads the correct bit from screen_info.
>>>
>>> Nice catch, Thomas!
>>>
>>> But do we really need this additional helper?

Yes, please. Decoding screen_info is a science on it's own. I've added 
several of these helpers to access because such code was open-coded and 
duplicated all over the graphics code. And several places got something 
wrong. The patch here is just one of many such cases.

>>>
>>>
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 
>>>> setup code")
>>>> Cc: <stable@vger.kernel.org> # v2.6.23+
>>>
>>>> ---
>>>>    drivers/video/fbdev/vesafb.c | 2 +-
>>>>    include/linux/screen_info.h  | 5 +++++
>>>>    2 files changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/video/fbdev/vesafb.c 
>>>> b/drivers/video/fbdev/vesafb.c
>>>> index 8ab64ae4cad3e..5a161750a3aee 100644
>>>> --- a/drivers/video/fbdev/vesafb.c
>>>> +++ b/drivers/video/fbdev/vesafb.c
>>>> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device 
>>>> *dev)
>>>>        if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
>>>>            return -ENODEV;
>>>>
>>>> -    vga_compat = (si->capabilities & 2) ? 0 : 1;
>>>> +    vga_compat = !__screen_info_vbe_mode_nonvga(si);
>>>
>>> Instead maybe just this: ?
>>>    +    /* mode is VGA-compatible if BIT 5 is _NOT_ set */
>>>    +    vga_compat = (si->vesa_attributes & BIT(5)) == 0;
>>>
>>> I suggest to make patch small, esp. if you ask for backport to 
>>> v2.6.23+.
>>>
>>
>> I prefer the helper. It's a static inline anyways and having it as a
>> function makes it much easier to read / understand.
>
> Really?

Yep.

>
> +static inline bool __screen_info_vbe_mode_nonvga(const struct 
> screen_info *si)
> +{
> +    return si->vesa_attributes & BIT(5); // VGA if _not_ set
> +}
>
> At least the double negation "!nonvga()" breaks my head and the "//" 
> comment
> should be converted to /*..*/ IMHO.

The non-VGA bit is specified by VESA. So the helper does the correct 
thing. We can make a better comment though.

If we want to simplify usage of this helper, I'd say we should kick 
vga_compat from vesafb and rework that code.

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

