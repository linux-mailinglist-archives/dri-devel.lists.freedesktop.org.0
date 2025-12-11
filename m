Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF2CB6422
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE2510E2EB;
	Thu, 11 Dec 2025 14:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kb8s+kad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CMFnExbn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v+spM5sx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nKmuiC4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7165410E2EB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:56:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CAE8F5BE1D;
 Thu, 11 Dec 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765464990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7pRsgR1bWXuVALALz23Mf1aEJwlGYY3hd85N7SyGIdY=;
 b=kb8s+kadr54ki3lNIe/1+BcT2+eLSxEBTdZmv9SeP1zR2dz6Ya2Qq4QVavLJEtiyLDFpK/
 Dkibd4CoQMznxrVeJF5MIZBW2jy+Uv5h0iW8uvSNAFAhAh2BI/HHp19msOeQG2tokP+dUD
 DyY59N05VlPXkaxhbUQtxhpeKPqx87M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765464990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7pRsgR1bWXuVALALz23Mf1aEJwlGYY3hd85N7SyGIdY=;
 b=CMFnExbnFZ+Wg/gsYFtT+btqcRpYKw1JungqGTbQB0WumysM84KKNCC+jdaDY5X6x4OJgB
 6mEmj/n6l8c9fFAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v+spM5sx;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nKmuiC4h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765464988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7pRsgR1bWXuVALALz23Mf1aEJwlGYY3hd85N7SyGIdY=;
 b=v+spM5sxYw9OFGivu4G2tQITOwr8SwjxxZcgvLc3Erl1u6a7Jm32jyYjM8IZ3fZsadCmGP
 J6PEKEMR4pckCHSuDHGb1B4E+HbE8SK4XIzwIKWSIuX63xo281xH5CBmPRTD/91eJ7H8Lu
 mqYBsB/0tUnrCvqrFT6HjK0SNmPg2pc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765464988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7pRsgR1bWXuVALALz23Mf1aEJwlGYY3hd85N7SyGIdY=;
 b=nKmuiC4hAhYjjzOpA3qJ1sQH2fIopdwnaCBHmFIsDFwRBjUnt7dWMb/UP/5bJO7/AFTnVZ
 lY6iqhdcC6rDnIDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A09EF3EA63;
 Thu, 11 Dec 2025 14:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rzbYJZzbOmlbMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Dec 2025 14:56:28 +0000
Message-ID: <2e26a6e6-6f4b-4b48-8fd0-648372856dce@suse.de>
Date: Thu, 11 Dec 2025 15:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
References: <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
 <20251211.134330.2200695829709887915.rene@exactco.de>
 <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
 <20251211.153101.411672428832661296.rene@exactco.de>
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
In-Reply-To: <20251211.153101.411672428832661296.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,checkpatch.pl:url];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: CAE8F5BE1D
X-Spam-Flag: NO
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

Am 11.12.25 um 15:31 schrieb René Rebe:
> Hi,
>
> On Thu, 11 Dec 2025 15:03:48 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi,
>>
>> Am 11.12.25 um 13:43 schrieb René Rebe:
>> [...]
>>>> The code for the primary plane should be fine now. But we also need
>>>> something for the cursor plane as well. There's a
>>>> ast_set_cursor_image() with a memcpy_toio() [1] and several additional
>>>> writes. IIUC they all have to be swapped as well.
>>> Of course, any obvious style issue or endianess swapping linux-kernel
>>> would like to see differently? You did not answer if I should just
>>> conditionalize on the chip id. I used a bool to avoid intermangled
>>> #ifdef conditionals to hopefully match kernel style.
>>> Btw. checkpatch.pl warns:
>>>
>>> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
>>>
>>> I could add this if desired while at it.
>>>
>>> Only compile tested, will do a final hw test once patch is approved in
>>> general.
>> It's all a bit excessive. There's a patch attached that will hopefully
>> fix the issues.
>>
>> If you could test it, I'll send it out for official review. The
>> easiest way of testing cursor support is to run Xorg and see if the
>> cursor looks correct.
>>
>> The Co-developed-by tag requires your Signed-off-by.
> Ok, so you are not a fan of using the hw swapping. I think I asked two
> emails ago if having both pathes is acceptable. To be honest this
> driver is for some reason already annoyingly slow. Buf of course we
> can just keep the sw swapping for now.

I know. But it's all just a niche thing and I'm not sure if there's much 
benefit for the HW swapper if Aspeed doesn't even care. This has been 
going back and forth for some time. I'd really like to get it done ASAP.

Performance is mostly slow because of software rendering. Really 
improving the copying in the kernel requires a larger commitment and 
refactoring that is out of the scope of the patch. We can talk about 
that, but changes would touch a lot of drivers.

>
>>   	/* write checksum + signature */
>> +	writel(swab32(csum), dst);
>> +	writel(swab32(width), dst + AST_HWC_SIGNATURE_SizeX);
>> +	writel(swab32(height), dst + AST_HWC_SIGNATURE_SizeY);
>> +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTX);
>> +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTY);
>> +#else
>> +	memcpy_toio(dst, src, AST_HWC_SIZE);
>>   	dst += AST_HWC_SIZE;
>> +
>> +	/* write checksum + signature */
>>   	writel(csum, dst);
>>   	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
>>   	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
>>   	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
>>   	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
>> +#endif
> I'm pretty sure this will break the cursor, as the position was
> working correctly and I only had to swap the cursor image data. The
> csum will also not be identical anyway, as the checksum function
> computes it in native byte order. Theoretically that would have to be
> changed. However, I do not see where it is really used, maybe only
> some special remote desktop vendor protocol that I'm not using. Maybe
> the exact checksum does not even matter and is only used as
> optimization to not resend an unchanged cursor image.

Oh well! I though that the bus does implicit byte swaps? Or does 
writel() already swap to little endian, which the AST chip expects? I'm 
confused.

Best regards
Thomas

>
> I'll send a final version after validating it w/ HW later.
>
> Thanks,
> 	René
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


