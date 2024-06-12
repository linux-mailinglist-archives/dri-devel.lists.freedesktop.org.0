Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0608904CBC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F156210E7B6;
	Wed, 12 Jun 2024 07:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SDORcd3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPtdlqPw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SDORcd3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPtdlqPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1986110E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:26:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 184E65BD36;
 Wed, 12 Jun 2024 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718177172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Qh4oPG+EyXc3tAjou9bQt73R2I0VuEsjB2DniFMxsSk=;
 b=SDORcd3D4ytUau8Qb32CCG135ckrrcA24xKda7a4Bm58P0mtjkGBIKbN/L9D08ij2Zgkvn
 uKR/dYDNb8oH3Xxux97R1lKiTrYC9EsDSQlj3Gvfifq8k/PdIIFM7FUsB74OwLRKXPoRjF
 xjSm/uq/4UJ9sRXinKlRs5HR51HPSjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718177172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Qh4oPG+EyXc3tAjou9bQt73R2I0VuEsjB2DniFMxsSk=;
 b=zPtdlqPwrDltQ5/G4UxZ6sQwX/K7DSR5HpIvlOVC9hXOCt5IPjB6J3EE1TOyBMfjUIteZE
 VWL8b0so4t12y1BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SDORcd3D;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zPtdlqPw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718177172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Qh4oPG+EyXc3tAjou9bQt73R2I0VuEsjB2DniFMxsSk=;
 b=SDORcd3D4ytUau8Qb32CCG135ckrrcA24xKda7a4Bm58P0mtjkGBIKbN/L9D08ij2Zgkvn
 uKR/dYDNb8oH3Xxux97R1lKiTrYC9EsDSQlj3Gvfifq8k/PdIIFM7FUsB74OwLRKXPoRjF
 xjSm/uq/4UJ9sRXinKlRs5HR51HPSjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718177172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Qh4oPG+EyXc3tAjou9bQt73R2I0VuEsjB2DniFMxsSk=;
 b=zPtdlqPwrDltQ5/G4UxZ6sQwX/K7DSR5HpIvlOVC9hXOCt5IPjB6J3EE1TOyBMfjUIteZE
 VWL8b0so4t12y1BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD1BD137DF;
 Wed, 12 Jun 2024 07:26:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rid3MJNNaWb/SQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jun 2024 07:26:11 +0000
Message-ID: <736884a4-8077-422d-8877-6ac4af58a85b@suse.de>
Date: Wed, 12 Jun 2024 09:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] backlight: Add BL_CORE_ constants for power states
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20240611125321.6927-1-tzimmermann@suse.de>
 <20240611125321.6927-2-tzimmermann@suse.de>
 <20240611175544.GC545417@ravnborg.org>
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
In-Reply-To: <20240611175544.GC545417@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,asem.it,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 184E65BD36
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Hi Sam,

long time no see.

Am 11.06.24 um 19:55 schrieb Sam Ravnborg:
> Hi Thomas.
>
> On Tue, Jun 11, 2024 at 02:41:56PM +0200, Thomas Zimmermann wrote:
>> Duplicate FB_BLANK_ constants as BL_CORE_ constants in the backlight
>> header file. Allows backlight drivers to avoid including the fbdev
>> header file and removes a compile-time dependency between the two
>> subsystems.
> Good to remove this dependency.
>> The new BL_CORE constants have the same values as their FB_BLANK_
>> counterparts. Hence UAPI and internal semantics do not change. The
>> backlight drivers can be converted one by one.
> This seems like the right approach.
>
>> Backlight code or drivers do not use FB_BLANK_VSYNC_SUSPEND and
>> FB_BLANK_HSYNC_SUSPEND, so no new constants for these are being
>> added.
>>
>> The semantics of FB_BLANK_NORMAL appear inconsistent. In fbdev,
>> NORMAL means display off with sync enabled. In backlight code,
>> this translates to turn the backlight off, but some drivers
>> interpret it as backlight on. So we keep the current code as is,
>> but mark BL_CORE_NORMAL as deprecated. Drivers should be fixed
>> and the constant removed. This affects ams369fg06 and a few DRM
>> panel drivers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   Documentation/ABI/stable/sysfs-class-backlight |  7 ++++---
>>   include/linux/backlight.h                      | 16 ++++++++++------
>>   2 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
>> index 023fb52645f8b..6102d6bebdf9a 100644
>> --- a/Documentation/ABI/stable/sysfs-class-backlight
>> +++ b/Documentation/ABI/stable/sysfs-class-backlight
>> @@ -3,10 +3,11 @@ Date:		April 2005
>>   KernelVersion:	2.6.12
>>   Contact:	Richard Purdie <rpurdie@rpsys.net>
>>   Description:
>> -		Control BACKLIGHT power, values are FB_BLANK_* from fb.h
>> +		Control BACKLIGHT power, values are compatible with
>> +		FB_BLANK_* from fb.h
>>   
>> -		 - FB_BLANK_UNBLANK (0)   : power on.
>> -		 - FB_BLANK_POWERDOWN (4) : power off
>> +		 - 0 (FB_BLANK_UNBLANK)   : power on.
>> +		 - 4 (FB_BLANK_POWERDOWN) : power off
>>   Users:		HAL
>>   
>>   What:		/sys/class/backlight/<backlight>/brightness
>> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
>> index 19a1c0e22629d..e0cfd89ffadd2 100644
>> --- a/include/linux/backlight.h
>> +++ b/include/linux/backlight.h
>> @@ -210,14 +210,18 @@ struct backlight_properties {
>>   	 * When the power property is updated update_status() is called.
>>   	 *
>>   	 * The possible values are: (0: full on, 1 to 3: power saving
>> -	 * modes; 4: full off), see FB_BLANK_XXX.
>> +	 * modes; 4: full off), see BL_CORE_XXX constants.
>>   	 *
>>   	 * When the backlight device is enabled @power is set
>> -	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
>> -	 * @power is set to FB_BLANK_POWERDOWN.
>> +	 * to BL_CORE_UNBLANK. When the backlight device is disabled
>> +	 * @power is set to BL_CORE_POWERDOWN.
>>   	 */
>>   	int power;
>>   
>> +#define BL_CORE_UNBLANK		(0)
>> +#define BL_CORE_NORMAL		(1) // deprecated; don't use in new code
>> +#define BL_CORE_POWERDOWN	(4)
> When introducing backlight specific constants then it would be good to
> get away from the ackward fbdev naming and use something that is more
> obvious.
>
> Something like:
>
> #define BACKLIGHT_POWER_ON	0
> #define BACKLIGHT_POWER_OFF	4
> #define BACKLIGHT_POWER_NORMAL	1	// deprecated; don't use in new code

Makes perfect sens to me.

>
> This will make the code more obvious to read / understand - at least
> IMO.
>
> The proposal did not use the BL_CORE_ naming, lets keep this for
> suspend/resume stuff.

OK. I only used BL_CORE because it was there already.


>
> On top of this - many users of the power states could benefit using the
> backlight_enable()/backlight_disable() helpers, but that's another story.

Should I attempt to fix that? Many drivers appear to do something like

   props.brightness = ...
   props.power = UNBLANK
   backlight_update_status()

That's the same pattern as in backlight_enable().

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

