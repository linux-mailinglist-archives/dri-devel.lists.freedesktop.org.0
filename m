Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF0A6B5D3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66A10E708;
	Fri, 21 Mar 2025 08:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Hv1tDtBQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FtPldCG7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hv1tDtBQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FtPldCG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEFD10E730
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:13:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C92D521D09;
 Fri, 21 Mar 2025 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742544789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9lKHsMLQuHW+59wM6VO9frsl+9XDBKKKHZu3m5/3Fw8=;
 b=Hv1tDtBQ2zTVemGWxinHXN3PGJ5d1H3xGVRLWATfApiPd5NGhNRLaP8vbcK0X4qF6Z5NFY
 9konii/VJtanV52YHQRU8SM1d8FhppULrsL9FMXZcTm+ZTBOkU7b9nrSZliiC4Y/gLYh5Z
 vjxyJxhiSourZUYm7XvYO52WIMJx8eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742544789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9lKHsMLQuHW+59wM6VO9frsl+9XDBKKKHZu3m5/3Fw8=;
 b=FtPldCG7Lm5S8e5iddJH3y7eQ+VaMhHG/86RqJRiBQF+VRslHb+1Ap0jzG+/wMz6eGjUut
 9RTr5V39KQow31Dw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hv1tDtBQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FtPldCG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742544789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9lKHsMLQuHW+59wM6VO9frsl+9XDBKKKHZu3m5/3Fw8=;
 b=Hv1tDtBQ2zTVemGWxinHXN3PGJ5d1H3xGVRLWATfApiPd5NGhNRLaP8vbcK0X4qF6Z5NFY
 9konii/VJtanV52YHQRU8SM1d8FhppULrsL9FMXZcTm+ZTBOkU7b9nrSZliiC4Y/gLYh5Z
 vjxyJxhiSourZUYm7XvYO52WIMJx8eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742544789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9lKHsMLQuHW+59wM6VO9frsl+9XDBKKKHZu3m5/3Fw8=;
 b=FtPldCG7Lm5S8e5iddJH3y7eQ+VaMhHG/86RqJRiBQF+VRslHb+1Ap0jzG+/wMz6eGjUut
 9RTr5V39KQow31Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D44E13A2C;
 Fri, 21 Mar 2025 08:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4aUvIZUf3WekfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 08:13:09 +0000
Message-ID: <cca37e5d-408a-414c-a05d-cee31ba3e1ff@suse.de>
Date: Fri, 21 Mar 2025 09:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
To: Daniel Thompson <danielt@kernel.org>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-7-tzimmermann@suse.de> <Z9k7nAXNGDaQMnMO@aspen.lan>
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
In-Reply-To: <Z9k7nAXNGDaQMnMO@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C92D521D09
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 18.03.25 um 10:23 schrieb Daniel Thompson:
> On Thu, Mar 06, 2025 at 03:05:48PM +0100, Thomas Zimmermann wrote:
>> Remove support for fb events from backlight subsystem. Provide the
>> helper backlight_notify_blank_all() instead. Also export the existing
>> helper backlight_notify_blank() to update a single backlight device.
>>
>> In fbdev, call either helper to inform the backlight subsystem of
>> changes to a display's blank state. If the framebuffer device has a
>> specific backlight, only update this one; otherwise update all.
>>
>> v3:
>> - declare empty fb_bl_notify_blank() as static inline (kernel test robot)
> Looks like there are still configs where we get build failure.
>
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Other than the build issues, generally this looks great. Just a couple
> of small issues below.
>
>
>> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
>> index 1c43f579396f..9dc93c5e480b 100644
>> --- a/drivers/video/backlight/backlight.c
>> +++ b/drivers/video/backlight/backlight.c
>> @@ -78,11 +77,8 @@ static const char *const backlight_scale_types[] = {
>>   	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
>>   };
>>
>> -#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
>> -				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
>> -static void backlight_notify_blank(struct backlight_device *bd,
>> -				   struct device *display_dev,
>> -				   bool fb_on, bool prev_fb_on)
>> +void backlight_notify_blank(struct backlight_device *bd, struct device *display_dev,
>> +			    bool fb_on, bool prev_fb_on)
>>   {
>>   	guard(mutex)(&bd->ops_lock);
>>
>> @@ -103,68 +99,18 @@ static void backlight_notify_blank(struct backlight_device *bd,
>>   		}
>>   	}
>>   }
>> +EXPORT_SYMBOL(backlight_notify_blank);
> Should this be EXPORT_SYMBOL_GPL()?

The other symbols in this source file are exported with EXPORT_SYMBOL().

Best regards
Thomas

>
>
>> -/*
>> - * fb_notifier_callback
>> - *
>> - * This callback gets called when something important happens inside a
>> - * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
>> - * which is reported to the driver using backlight_update_status()
>> - * as a state change.
>> - *
>> - * There may be several fbdev's connected to the backlight device,
>> - * in which case they are kept track of. A state change is only reported
>> - * if there is a change in backlight for the specified fbdev.
>> - */
>> -static int fb_notifier_callback(struct notifier_block *self,
>> -				unsigned long event, void *data)
>> +void backlight_notify_blank_all(struct device *display_dev, bool fb_on, bool prev_fb_on)
>>   {
>>   	struct backlight_device *bd;
>> -	struct fb_event *evdata = data;
>> -	struct fb_info *info = evdata->info;
>> -	const int *fb_blank = evdata->data;
>> -	struct backlight_device *fb_bd = fb_bl_device(info);
>> -	bool fb_on, prev_fb_on;
>> -
>> -	/* If we aren't interested in this event, skip it immediately ... */
>> -	if (event != FB_EVENT_BLANK)
>> -		return 0;
>> -
>> -	bd = container_of(self, struct backlight_device, fb_notif);
>> -
>> -	if (fb_bd && fb_bd != bd)
>> -		return 0;
>> -
>> -	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
>> -	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
>> -
>> -	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
>> -
>> -	return 0;
>> -}
>> -
>> -static int backlight_register_fb(struct backlight_device *bd)
>> -{
>> -	memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
>> -	bd->fb_notif.notifier_call = fb_notifier_callback;
>>
>> -	return fb_register_client(&bd->fb_notif);
>> -}
>> +	guard(mutex)(&backlight_dev_list_mutex);
>>
>> -static void backlight_unregister_fb(struct backlight_device *bd)
>> -{
>> -	fb_unregister_client(&bd->fb_notif);
>> -}
>> -#else
>> -static inline int backlight_register_fb(struct backlight_device *bd)
>> -{
>> -	return 0;
>> +	list_for_each_entry(bd, &backlight_dev_list, entry)
>> +		backlight_notify_blank(bd, display_dev, fb_on, prev_fb_on);
>>   }
>> -
>> -static inline void backlight_unregister_fb(struct backlight_device *bd)
>> -{
>> -}
>> -#endif /* CONFIG_FB_CORE */
>> +EXPORT_SYMBOL(backlight_notify_blank_all);
> Same here.
>
>
> Daniel.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

