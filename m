Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHvLLBP1imn2OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:06:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCB1188AF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358710E509;
	Tue, 10 Feb 2026 09:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rryLx/vv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TgCAGtR1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rryLx/vv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TgCAGtR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E010E509
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:06:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 010B45BCD3;
 Tue, 10 Feb 2026 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770714383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2zZ/wKM3Ns11Odbs9dhoE5BBxpUvbuB2Bbz9Jl/8EqU=;
 b=rryLx/vv4m6GWCSeTlhQd2ZhsZKU4CI8RUJqDIAWB8ly3P0L1s3xUbwLGsoCn6fOk4HJBi
 hokgLeSWzQqVX1eYy55hxvQd9ak0CjnCAMfMT8MQ+tcA1jqT/Nw+o/zruompoIx7AMiYR8
 FgrkLyOsG4HS0k8LIlxn5rgXOZslNaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770714383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2zZ/wKM3Ns11Odbs9dhoE5BBxpUvbuB2Bbz9Jl/8EqU=;
 b=TgCAGtR1ALgaBugqSm0XdwVzsNxCTpOo9TwobehaVH96qmU5iq6WgimPnggye8m/LBTRfU
 r0wCk0icWRIxM9Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770714383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2zZ/wKM3Ns11Odbs9dhoE5BBxpUvbuB2Bbz9Jl/8EqU=;
 b=rryLx/vv4m6GWCSeTlhQd2ZhsZKU4CI8RUJqDIAWB8ly3P0L1s3xUbwLGsoCn6fOk4HJBi
 hokgLeSWzQqVX1eYy55hxvQd9ak0CjnCAMfMT8MQ+tcA1jqT/Nw+o/zruompoIx7AMiYR8
 FgrkLyOsG4HS0k8LIlxn5rgXOZslNaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770714383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2zZ/wKM3Ns11Odbs9dhoE5BBxpUvbuB2Bbz9Jl/8EqU=;
 b=TgCAGtR1ALgaBugqSm0XdwVzsNxCTpOo9TwobehaVH96qmU5iq6WgimPnggye8m/LBTRfU
 r0wCk0icWRIxM9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4CF43EA62;
 Tue, 10 Feb 2026 09:06:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id puLYLg71imn1VAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Feb 2026 09:06:22 +0000
Message-ID: <a4f65f26-f577-4029-b0cc-db9da95222dd@suse.de>
Date: Tue, 10 Feb 2026 10:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Remove struct fbcon_display.inverse
To: Helge Deller <deller@gmx.de>, geert@linux-m68k.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20260209161609.251510-1-tzimmermann@suse.de>
 <3e70bea8-aa35-4cfd-9e54-eaeaa7b5267a@gmx.de>
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
In-Reply-To: <3e70bea8-aa35-4cfd-9e54-eaeaa7b5267a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:geert@linux-m68k.org,m:linux-fbdev@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,linux-m68k.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email,suse.com:url,suse.de:mid,suse.de:dkim,suse.de:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 19CCB1188AF
X-Rspamd-Action: no action

Hi

Am 09.02.26 um 22:31 schrieb Helge Deller:
> On 2/9/26 17:15, Thomas Zimmermann wrote:
>> The field inverse in struct fbcon_display is unused. Remove it.
>
> Indeed, seems to be unused.
>
>> The field apparently never did anything. Commit c7ef5e285c84 ("video:
>> fbdev: atari: Fix inverse handling") converted its final user to call
>> fb_invert_cmaps() instead.
>
> That commit seems not to be related, as it touches a static
> inverse variable inside the atafb driver only.
> Commit e4fc27618b75 (from 2005) touched it last time, but it seems 
> even older.

Oh well. What a stupid mistake...

>
> Patch applied to fbdev, but I dropped the wrong commit reference in the
> commit message.

Thanks a lot.

Best regards,
Thomas

>
> Thanks!
> Helge
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: c7ef5e285c84 ("video: fbdev: atari: Fix inverse handling")
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: <stable@vger.kernel.org> # v6.0+
>> ---
>>   drivers/video/fbdev/core/fbcon.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.h 
>> b/drivers/video/fbdev/core/fbcon.h
>> index 1cd10a7faab0..fca14e9b729b 100644
>> --- a/drivers/video/fbdev/core/fbcon.h
>> +++ b/drivers/video/fbdev/core/fbcon.h
>> @@ -30,7 +30,6 @@ struct fbcon_display {
>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>       u_short scrollmode;             /* Scroll Method, use 
>> fb_scrollmode() */
>>   #endif
>> -    u_short inverse;                /* != 0 text black on white as 
>> default */
>>       short yscroll;                  /* Hardware scrolling */
>>       int vrows;                      /* number of virtual rows */
>>       int cursor_shape;
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


