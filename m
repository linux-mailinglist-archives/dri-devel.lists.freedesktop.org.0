Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3BB48EA8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC66E10E526;
	Mon,  8 Sep 2025 13:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="n1Rn910V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dv64AbsH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n1Rn910V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dv64AbsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2A210E530
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:06:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61DFA25940;
 Mon,  8 Sep 2025 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757336807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yk+LorQC4PKs0GQF5dTPfOAqTNsXSz6Yzbd5YePO8LE=;
 b=n1Rn910Vbfx+zU/U8jNG2UCoAkkSOA9e8GGc2HEHCue6pLBytLBtqtsLffy8KZPt3mmw/U
 Sy7Up2zNv4wJrHhD6hQtNCGgvhTYMSnKL2aburGn+Vvy9ZQEPXXlT/i+UB5rN8NUbh4TTf
 608RW4pc7efIM8UwEHlN2QnDpSgyXZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757336807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yk+LorQC4PKs0GQF5dTPfOAqTNsXSz6Yzbd5YePO8LE=;
 b=dv64AbsH5L1RuCuHvkMWtj/iCyWYxOZZIvlOTshcEJsK/Ea5LWXpbTbW28uEsJHQhAJ3sN
 W6HD0vrL+ZRWDvCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n1Rn910V;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dv64AbsH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757336807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yk+LorQC4PKs0GQF5dTPfOAqTNsXSz6Yzbd5YePO8LE=;
 b=n1Rn910Vbfx+zU/U8jNG2UCoAkkSOA9e8GGc2HEHCue6pLBytLBtqtsLffy8KZPt3mmw/U
 Sy7Up2zNv4wJrHhD6hQtNCGgvhTYMSnKL2aburGn+Vvy9ZQEPXXlT/i+UB5rN8NUbh4TTf
 608RW4pc7efIM8UwEHlN2QnDpSgyXZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757336807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yk+LorQC4PKs0GQF5dTPfOAqTNsXSz6Yzbd5YePO8LE=;
 b=dv64AbsH5L1RuCuHvkMWtj/iCyWYxOZZIvlOTshcEJsK/Ea5LWXpbTbW28uEsJHQhAJ3sN
 W6HD0vrL+ZRWDvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23A2613946;
 Mon,  8 Sep 2025 13:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k34gB+fUvmi7MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Sep 2025 13:06:47 +0000
Message-ID: <c1674a81-3435-445c-b359-e2b094b7f8a5@suse.de>
Date: Mon, 8 Sep 2025 15:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] fbcon: Move fbcon callbacks into struct fbcon_bitops
To: Sam Ravnborg <sam@ravnborg.org>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-5-tzimmermann@suse.de>
 <20250905185358.GA361827@ravnborg.org>
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
In-Reply-To: <20250905185358.GA361827@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 61DFA25940
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 FREEMAIL_CC(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Hi Sam,

thanks for doing the review.

Am 05.09.25 um 20:53 schrieb Sam Ravnborg:
> Hi Thomas.
>
> On Mon, Aug 18, 2025 at 12:36:39PM +0200, Thomas Zimmermann wrote:
>> Depending on rotation settings, fbcon sets different callback
>> functions in struct fbcon from within fbcon_set_bitops(). Declare
>> the callback functions in the new type struct fbcon_bitops. Then
>> only replace the single bitops pointer in struct fbcon.
>>
>> Keeping callbacks in constant instances of struct fbcon_bitops
>> makes it harder to exploit the callbacks. Also makes the code slightly
>> easier to maintain.
>>
>> For tile-based consoles, there's a separate instance of the bitops
>> structure.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/video/fbdev/core/bitblit.c   | 17 ++++---
>>   drivers/video/fbdev/core/fbcon.c     | 67 +++++++++++++++-------------
>>   drivers/video/fbdev/core/fbcon.h     |  7 ++-
>>   drivers/video/fbdev/core/fbcon_ccw.c | 18 +++++---
>>   drivers/video/fbdev/core/fbcon_cw.c  | 18 +++++---
>>   drivers/video/fbdev/core/fbcon_ud.c  | 18 +++++---
>>   drivers/video/fbdev/core/tileblit.c  | 16 ++++---
>>   7 files changed, 94 insertions(+), 67 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
>> index a2202cae0691..267bd1635a41 100644
>> --- a/drivers/video/fbdev/core/bitblit.c
>> +++ b/drivers/video/fbdev/core/bitblit.c
>> @@ -384,15 +384,18 @@ static int bit_update_start(struct fb_info *info)
>>   	return err;
>>   }
>>   
>> +static const struct fbcon_bitops bit_fbcon_bitops = {
>> +	.bmove = bit_bmove,
>> +	.clear = bit_clear,
>> +	.putcs = bit_putcs,
>> +	.clear_margins = bit_clear_margins,
>> +	.cursor = bit_cursor,
>> +	.update_start = bit_update_start,
>> +};
>> +
>>   void fbcon_set_bitops(struct fbcon *confb)
>>   {
>> -	confb->bmove = bit_bmove;
>> -	confb->clear = bit_clear;
>> -	confb->putcs = bit_putcs;
>> -	confb->clear_margins = bit_clear_margins;
>> -	confb->cursor = bit_cursor;
>> -	confb->update_start = bit_update_start;
>> -	confb->rotate_font = NULL;
>> +	confb->bitops = &bit_fbcon_bitops;
>>   
>>   	if (confb->rotate)
>>   		fbcon_set_rotate(confb);
> fbcon_set_rotate() is only used to set the correct bitops.
>
> It would be simpler to just do
>
> 	if (confb->rotate)
> 		confb->bitops = fbcon_rotate_get_ops();
>
> And rename fbcon_set_rotate() to fbcon_rotate_get_ops() and return the
> pointer to the struct.
>
> The no need to pass the struct, and it is obvious that the bitops are
> overwritten.

I tried to keep the changes here to a minimum and avoided changing the 
function interfaces too much.

But did you read patch 5 already? I think the cleanup you're looking for 
is there. fbcon_set_rotate() will be gone. And the update bit-op 
selection is contained in fbcon_set_bitops(). I guess this could be 
renamed to fbcon_update_bitops() to make it clear that it updates from 
internal state.

Best regards
Thomas

>
> 	Sam
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


