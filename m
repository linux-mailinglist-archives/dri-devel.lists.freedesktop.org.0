Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE1CA2A3E
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 08:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4F10E045;
	Thu,  4 Dec 2025 07:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UaloylMO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="98Ytms1R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UaloylMO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="98Ytms1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F6710E045
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 07:34:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 904FF5BCCC;
 Thu,  4 Dec 2025 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764833684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=itl0/ewIFvHYj8/AK/KBS/EkB5toaJQWnD8umaZI8js=;
 b=UaloylMO1PNCtAeabyvUF6R1IJ+yN1TQniQ/1ddmbMm7MA0wHuMKM8sG9wJVMpp04mYRe4
 5v/PWgBdphgxdZeOuynV49w1O/J4ueazkA2ultAJPiaIIlCeLB9Hbel/f6oLRa1L0Lw/Bf
 +pJGLl8e+Cmrd8jE8eaA4FvxNa8FaCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764833684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=itl0/ewIFvHYj8/AK/KBS/EkB5toaJQWnD8umaZI8js=;
 b=98Ytms1RuuAWrA4ajtIyPQBiVxxjlBfM3A2wmlJ8XpkInTSPSkZ4a4TEsR1VV2lrDC0Yhw
 SdgQLJcW1pZDBfBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764833684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=itl0/ewIFvHYj8/AK/KBS/EkB5toaJQWnD8umaZI8js=;
 b=UaloylMO1PNCtAeabyvUF6R1IJ+yN1TQniQ/1ddmbMm7MA0wHuMKM8sG9wJVMpp04mYRe4
 5v/PWgBdphgxdZeOuynV49w1O/J4ueazkA2ultAJPiaIIlCeLB9Hbel/f6oLRa1L0Lw/Bf
 +pJGLl8e+Cmrd8jE8eaA4FvxNa8FaCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764833684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=itl0/ewIFvHYj8/AK/KBS/EkB5toaJQWnD8umaZI8js=;
 b=98Ytms1RuuAWrA4ajtIyPQBiVxxjlBfM3A2wmlJ8XpkInTSPSkZ4a4TEsR1VV2lrDC0Yhw
 SdgQLJcW1pZDBfBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 507AC3EA63;
 Thu,  4 Dec 2025 07:34:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Xmc4EpQ5MWlHZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Dec 2025 07:34:44 +0000
Message-ID: <f19d9468-a974-4b49-bb5a-c0900f6a705e@suse.de>
Date: Thu, 4 Dec 2025 08:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/vblank: Increase timeout in drm_wait_one_vblank()
To: Chintan Patel <chintanlike@gmail.com>, maarten.lankhorst@linux.intel.com, 
 maxime.ripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251028034337.6341-1-chintanlike@gmail.com>
 <2dae83e3-6fee-4e66-964e-c7baf46eecd8@suse.de>
 <67663eda-dce6-48e7-ad54-572bbce8b944@gmail.com>
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
In-Reply-To: <67663eda-dce6-48e7-ad54-572bbce8b944@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TAGGED_RCPT(0.00)[147ba789658184f0ce04];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 04.12.25 um 04:44 schrieb Chintan Patel:
> Hi Thomas,
>
> On 10/28/25 10:14, Thomas Zimmermann wrote:
>>
>>
>> Am 28.10.25 um 04:43 schrieb Chintan Patel:
>>> Currently, wait_event_timeout() in drm_wait_one_vblank() uses a 100ms
>>> timeout. Under heavy scheduling pressure or rare delayed vblank
>>> handling, this can trigger WARNs unnecessarily.
>>>
>>> Increase the timeout to 1000ms to reduce spurious WARNs, while still
>>> catching genuine issues.
>>
>> Thanks a lot.
>>
>>>
>>> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
>>> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Gentle ping on this patch. Please let me know if there are any issues 
> with the patch, or if it requires any changes or further testing.

It's on its way already. This patch has been merged as commit 
f050da08a4ed ("drm/vblank: Increase timeout in drm_wait_one_vblank()"). 
It was part of the recent PR for v6.19-rc1.

Best regards
Thomas

[1] 
https://lore.kernel.org/dri-devel/CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com/T/#u

>
>>>
>>> v2:
>>>   - Dropped unnecessary in-code comment (suggested by Thomas 
>>> Zimmermann)
>>>   - Removed else branch, only log timeout case
>>>
>>> v3:
>>>   - Replaced drm_dbg_kms()/manual logging with drm_err() (suggested 
>>> by Ville Syrjälä)
>>>   - Removed unnecessary curr = drm_vblank_count() (suggested by 
>>> Thomas Zimmermann)
>>>   - Fixed commit message wording ("invalid userspace calls" → 
>>> "delayed vblank handling")
>>>
>>> v4:
>>>   - Keep the original drm_WARN() to catch genuine kernel issues
>>>   - Increased timeout from 100ms → 1000ms to reduce spurious WARNs 
>>> (suggested by Thomas Zimmermann)
>>> ---
>>>   drivers/gpu/drm/drm_vblank.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_vblank.c 
>>> b/drivers/gpu/drm/drm_vblank.c
>>> index 46f59883183d..f779103b261b 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -1303,7 +1303,7 @@ void drm_wait_one_vblank(struct drm_device 
>>> *dev, unsigned int pipe)
>>>       ret = wait_event_timeout(vblank->queue,
>>>                    last != drm_vblank_count(dev, pipe),
>>> -                 msecs_to_jiffies(100));
>>> +                 msecs_to_jiffies(1000));
>>>       drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", 
>>> pipe);
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


