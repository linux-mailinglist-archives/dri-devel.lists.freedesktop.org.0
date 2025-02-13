Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9105A341CC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B8C10E3D1;
	Thu, 13 Feb 2025 14:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="F+1tJBUb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k5rxu4iG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F+1tJBUb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k5rxu4iG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9110EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:23:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 841A71F8B9;
 Thu, 13 Feb 2025 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739456584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SV430ZVHech1r7WVWnh4RfJYZ1tXwOkt3eGoUhCqUuI=;
 b=F+1tJBUbymoaGfF+1AcuFBKTN4LBaEXIcvpfU58Mtj79Ge/RwgfJP981VHYYCL65uTk3Kn
 RG0YfKSCtVekCaLphHsR93GvorMHP8sbeD0ipn3AD4UaEsDmboCvH3WhZZz0rNgf0fyj0y
 /yUgQswXNfppw7enJWTzF9pJeovLXlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739456584;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SV430ZVHech1r7WVWnh4RfJYZ1tXwOkt3eGoUhCqUuI=;
 b=k5rxu4iGE1i70H63xfm6PgEDg5z/2pPWR0noXZH057N8ntR3Wg3eqbeIX33EWPMHSS3rfS
 Fa9iVCr5JRQUy+CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739456584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SV430ZVHech1r7WVWnh4RfJYZ1tXwOkt3eGoUhCqUuI=;
 b=F+1tJBUbymoaGfF+1AcuFBKTN4LBaEXIcvpfU58Mtj79Ge/RwgfJP981VHYYCL65uTk3Kn
 RG0YfKSCtVekCaLphHsR93GvorMHP8sbeD0ipn3AD4UaEsDmboCvH3WhZZz0rNgf0fyj0y
 /yUgQswXNfppw7enJWTzF9pJeovLXlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739456584;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SV430ZVHech1r7WVWnh4RfJYZ1tXwOkt3eGoUhCqUuI=;
 b=k5rxu4iGE1i70H63xfm6PgEDg5z/2pPWR0noXZH057N8ntR3Wg3eqbeIX33EWPMHSS3rfS
 Fa9iVCr5JRQUy+CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44D3A137DB;
 Thu, 13 Feb 2025 14:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 853GDkgArmdBZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 14:23:04 +0000
Message-ID: <dec54fa6-a8ad-45e6-bdfd-7e9183646a5a@suse.de>
Date: Thu, 13 Feb 2025 15:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] leds: backlight trigger: Maintain global list of
 led backlight triggers
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-11-tzimmermann@suse.de>
 <20250211140046.GU1868108@google.com>
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
In-Reply-To: <20250211140046.GU1868108@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
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

Am 11.02.25 um 15:00 schrieb Lee Jones:
> On Thu, 06 Feb 2025, Thomas Zimmermann wrote:
>
>> Maintain a list of led backlight triggers. This will replace the
>> fbdev notifiers that all backlight triggers currently subscribe to.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/leds/trigger/ledtrig-backlight.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
>> index 487577d22cfc..c1c1aa60cf07 100644
>> --- a/drivers/leds/trigger/ledtrig-backlight.c
>> +++ b/drivers/leds/trigger/ledtrig-backlight.c
>> @@ -23,8 +23,13 @@ struct bl_trig_notifier {
>>   	int old_status;
>>   	struct notifier_block notifier;
>>   	unsigned invert;
>> +
>> +	struct list_head entry;
> You don't appear to be doing anything with the list here.
>
> It would be better if you introduced the list when it's first utilised.

That's patch 12. I'll merge them.

Best regards
Thomas

>
>>   };
>>   
>> +static struct list_head ledtrig_backlight_list;
>> +static struct mutex ledtrig_backlight_list_mutex;
>> +
>>   static int fb_notifier_callback(struct notifier_block *p,
>>   				unsigned long event, void *data)
>>   {
>> @@ -118,6 +123,10 @@ static int bl_trig_activate(struct led_classdev *led)
>>   	if (ret)
>>   		dev_err(led->dev, "unable to register backlight trigger\n");
>>   
>> +	mutex_lock(&ledtrig_backlight_list_mutex);
>> +	list_add(&n->entry, &ledtrig_backlight_list);
>> +	mutex_unlock(&ledtrig_backlight_list_mutex);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -125,6 +134,10 @@ static void bl_trig_deactivate(struct led_classdev *led)
>>   {
>>   	struct bl_trig_notifier *n = led_get_trigger_data(led);
>>   
>> +	mutex_lock(&ledtrig_backlight_list_mutex);
>> +	list_del(&n->entry);
>> +	mutex_unlock(&ledtrig_backlight_list_mutex);
>> +
>>   	fb_unregister_client(&n->notifier);
>>   	kfree(n);
>>   }
>> -- 
>> 2.48.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

