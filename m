Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCC85B7B3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CE510E2BA;
	Tue, 20 Feb 2024 09:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Jb76ZZsG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HDylI/Yt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jb76ZZsG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HDylI/Yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FD910E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:37:57 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2D931FDB5;
 Tue, 20 Feb 2024 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708421875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Az73m7hkronVlyFOGd16b02oS4EEP2mnCYpid/LcV2c=;
 b=Jb76ZZsGmsdxWGrgUlHu3qiKqaXW4BnVbvWQwgHd0UsfiYnnaZa9YBSEvLtWOEZzw3hBUJ
 hwgjWJOd918B2NcqTJJf1AcCRMDD3t6GZDouCIenl01Lvx7Lr4uVknarGJTLtF1XqMIzJ4
 5ygIK14WXj4zwD1UpANAC/X0eY7G16A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708421875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Az73m7hkronVlyFOGd16b02oS4EEP2mnCYpid/LcV2c=;
 b=HDylI/Yt9+GvzQ0sSMxg2mWg2E4QfMf5cOiDiwVqXtIrLPd0f6Amr25SPNUTYD8tuWyhNt
 8hG8gGk5DLGULuDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708421875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Az73m7hkronVlyFOGd16b02oS4EEP2mnCYpid/LcV2c=;
 b=Jb76ZZsGmsdxWGrgUlHu3qiKqaXW4BnVbvWQwgHd0UsfiYnnaZa9YBSEvLtWOEZzw3hBUJ
 hwgjWJOd918B2NcqTJJf1AcCRMDD3t6GZDouCIenl01Lvx7Lr4uVknarGJTLtF1XqMIzJ4
 5ygIK14WXj4zwD1UpANAC/X0eY7G16A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708421875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Az73m7hkronVlyFOGd16b02oS4EEP2mnCYpid/LcV2c=;
 b=HDylI/Yt9+GvzQ0sSMxg2mWg2E4QfMf5cOiDiwVqXtIrLPd0f6Amr25SPNUTYD8tuWyhNt
 8hG8gGk5DLGULuDw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A5FE2139EF;
 Tue, 20 Feb 2024 09:37:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qSI9J/Ny1GXhaQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Feb 2024 09:37:55 +0000
Message-ID: <a5b9a2d8-f305-4b68-9086-76d5f1b985c7@suse.de>
Date: Tue, 20 Feb 2024 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-2-tzimmermann@suse.de>
 <87bk8bjxzo.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87bk8bjxzo.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,kernel.org,linaro.org,gmail.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.09
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

Am 20.02.24 um 10:17 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Framebuffer drivers for devices with dedicated backlight are supposed
>> to set struct fb_info.bl_dev to the backlight's respective device. Use
>> the value to match backlight and framebuffer in the backlight core code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/video/backlight/backlight.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
>> index 86e1cdc8e3697..48844a4f28ad3 100644
>> --- a/drivers/video/backlight/backlight.c
>> +++ b/drivers/video/backlight/backlight.c
>> @@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
>>   {
>>   	struct backlight_device *bd;
>>   	struct fb_event *evdata = data;
>> -	int node = evdata->info->node;
>> +	struct fb_info *info = evdata->info;
>> +	int node = info->node;
>>   	int fb_blank = 0;
>>   
>>   	/* If we aren't interested in this event, skip it immediately ... */
>> @@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
>>   
>>   	if (!bd->ops)
>>   		goto out;
>> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
>> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
>>   		goto out;
>> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
>> +	else if (info->bl_dev && info->bl_dev != bd)
> If the driver doesn't provide a struct backlight_ops .check_fb callback, I
> think that having an info->bl_dev should be mandatory ? Or at least maybe
> there should be a warning if info->bl_dev isn't set ?

bl_dev can only be used for display drivers that set an explicit 
backlight device; otherwise it's NULL. There seem to be systems where 
backlight and display are distinct. And the docs for check_fb say that 
by default the backlight matches against any display. I tried to keep 
this semantics by silently succeeding if neither check_fb nor bl_dev 
have bene set.

>
> The would be a driver bug, right ?

I assume that some systems create the backlight instance from platform 
data or DT and the display driver has no means of knowing about it.

Best regards
Thomas

>
> Regardless, the change makes sense to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

