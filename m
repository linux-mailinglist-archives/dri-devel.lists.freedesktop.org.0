Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F9A716CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 13:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDE510E6B6;
	Wed, 26 Mar 2025 12:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T+mY9AeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rx5wnjCO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T+mY9AeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rx5wnjCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308C910E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 12:37:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD4852118F;
 Wed, 26 Mar 2025 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742992618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ze0pkshUwnhBKxuIvoLEel8+9q2IZF8sJiY+mRLnVDw=;
 b=T+mY9AeAQgThvQ3oxCk9s+EuRJfwN71t6BbLEmX2bsAE1NtYRlXrWK7UkQ81wkaReSqidr
 coCK9XObyz/z5HOBwncVmpuYUA49PM1SpwcaQ0S6jj4WnxfVjfnId74/8Ds6tjJFT/P+HF
 VfLI1OhxDdLTJN4olUBIroHPwhKbtT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742992618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ze0pkshUwnhBKxuIvoLEel8+9q2IZF8sJiY+mRLnVDw=;
 b=Rx5wnjCOichMiZJtRuK+XsxYER9mmSo25Drt7WepuXkbLewrBc3a4J3l8dQSJBwVverCFO
 E7OSxA3IKgTYFWDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742992618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ze0pkshUwnhBKxuIvoLEel8+9q2IZF8sJiY+mRLnVDw=;
 b=T+mY9AeAQgThvQ3oxCk9s+EuRJfwN71t6BbLEmX2bsAE1NtYRlXrWK7UkQ81wkaReSqidr
 coCK9XObyz/z5HOBwncVmpuYUA49PM1SpwcaQ0S6jj4WnxfVjfnId74/8Ds6tjJFT/P+HF
 VfLI1OhxDdLTJN4olUBIroHPwhKbtT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742992618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ze0pkshUwnhBKxuIvoLEel8+9q2IZF8sJiY+mRLnVDw=;
 b=Rx5wnjCOichMiZJtRuK+XsxYER9mmSo25Drt7WepuXkbLewrBc3a4J3l8dQSJBwVverCFO
 E7OSxA3IKgTYFWDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 854F113927;
 Wed, 26 Mar 2025 12:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id H12fHur042dJIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Mar 2025 12:36:58 +0000
Message-ID: <e929d30c-5b2a-40ce-8bd3-5d2611b67f1a@suse.de>
Date: Wed, 26 Mar 2025 13:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/format-helper: Optimize 32-to-16-bpp conversion
To: Jani Nikula <jani.nikula@linux.intel.com>, jfalempe@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-8-tzimmermann@suse.de> <87sen06p1u.fsf@intel.com>
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
In-Reply-To: <87sen06p1u.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linux.intel.com,redhat.com,ffwll.ch,gmail.com,kernel.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Score: -4.30
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

Am 26.03.25 um 11:53 schrieb Jani Nikula:
> On Tue, 25 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> For ease of implementation, existing line-conversion functions
>> for 16-bit formats write each pixel individually. Optimize the
>> performance by writing mulitple pixels in single 64-bit and 32-bit
>> stores.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 40 ++++++++++++++++++++++++++++-
>>   1 file changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>> index b9c9c712aa9c..66137df85725 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -262,10 +262,48 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>>   						    unsigned int pixels,
>>   						    u32 (*xfrm_pixel)(u32))
>>   {
>> -	__le16 *dbuf16 = dbuf;
>> +	__le64 *dbuf64 = dbuf;
>> +	__le32 *dbuf32;
>> +	__le16 *dbuf16;
>>   	const __le32 *sbuf32 = sbuf;
>>   	const __le32 *send32 = sbuf32 + pixels;
>>   
>> +#if defined(CONFIG_64BIT)
>> +	/* write 4 pixels at once */
>> +	send32 -= pixels & GENMASK(1, 0);
>> +	while (sbuf32 < send32) {
> I find the adjusting of send32 before and after the loop with different
> masks a bit confusing. Would it not suffice to:
>
> 	while (sbuf32 < ALIGN_DOWN(send32, 4))
>
> and leave send32 untouched? With different alignments for 2 pixels at a
> time.

Makes sense.

Best regards
Thomas

>
>
> BR,
> Jani.
>
>
>> +		u32 pix[4] = {
>> +			le32_to_cpup(sbuf32++),
>> +			le32_to_cpup(sbuf32++),
>> +			le32_to_cpup(sbuf32++),
>> +			le32_to_cpup(sbuf32++),
>> +		};
>> +		/* write output bytes in reverse order for little endianness */
>> +		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
>> +			    ((u64)xfrm_pixel(pix[1]) << 16) |
>> +			    ((u64)xfrm_pixel(pix[2]) << 32) |
>> +			    ((u64)xfrm_pixel(pix[3]) << 48);
>> +		*dbuf64++ = cpu_to_le64(val64);
>> +	}
>> +	send32 += pixels & GENMASK(1, 1);
>> +#endif
>> +
>> +	/* write 2 pixels at once */
>> +	dbuf32 = (__le32 __force *)dbuf64;
>> +	while (sbuf32 < send32) {
>> +		u32 pix[2] = {
>> +			le32_to_cpup(sbuf32++),
>> +			le32_to_cpup(sbuf32++),
>> +		};
>> +		/* write output bytes in reverse order for little endianness */
>> +		u32 val32 = xfrm_pixel(pix[0]) |
>> +			   (xfrm_pixel(pix[1]) << 16);
>> +		*dbuf32++ = cpu_to_le32(val32);
>> +	}
>> +	send32 += pixels & GENMASK(0, 0);
>> +
>> +	/* write trailing pixel */
>> +	dbuf16 = (__le16 __force *)dbuf32;
>>   	while (sbuf32 < send32)
>>   		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
>>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

