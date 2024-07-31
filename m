Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7493942F78
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7F10E615;
	Wed, 31 Jul 2024 13:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sxT0E7eu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8jXJd8AR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sxT0E7eu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8jXJd8AR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD510E615;
 Wed, 31 Jul 2024 13:00:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 092BD1F833;
 Wed, 31 Jul 2024 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722430810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5z5C6JX4JMKN8e0I3+m4TmIHntgE2VggLUt6DR74Z50=;
 b=sxT0E7euMXGuv+eUlEc7wdDn6CuIULpzp2oSc7ytNmGln9qxurB6wNbx6bxeWIXFpVp1Rc
 /rW0TXERdu+8k5Zli1/B3Qsrf9aEVujUNRmVWwc893/J4yMosUws+shlgZVtxIochGBzmw
 doyappDM0+MnOmLPclIlvv4frL549rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722430810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5z5C6JX4JMKN8e0I3+m4TmIHntgE2VggLUt6DR74Z50=;
 b=8jXJd8AR65YqHMXOpngSIefQK/vJJr73NVkibcnH+ftRoQhTYt/d0TQKduTJ6us+xdfN3p
 0ts67k4u+gyKZ5BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sxT0E7eu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8jXJd8AR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722430810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5z5C6JX4JMKN8e0I3+m4TmIHntgE2VggLUt6DR74Z50=;
 b=sxT0E7euMXGuv+eUlEc7wdDn6CuIULpzp2oSc7ytNmGln9qxurB6wNbx6bxeWIXFpVp1Rc
 /rW0TXERdu+8k5Zli1/B3Qsrf9aEVujUNRmVWwc893/J4yMosUws+shlgZVtxIochGBzmw
 doyappDM0+MnOmLPclIlvv4frL549rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722430810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5z5C6JX4JMKN8e0I3+m4TmIHntgE2VggLUt6DR74Z50=;
 b=8jXJd8AR65YqHMXOpngSIefQK/vJJr73NVkibcnH+ftRoQhTYt/d0TQKduTJ6us+xdfN3p
 0ts67k4u+gyKZ5BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC00813297;
 Wed, 31 Jul 2024 13:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KMU5KFk1qma6WAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 13:00:09 +0000
Message-ID: <78c8c562-916b-455d-b2e1-5aed9d979926@suse.de>
Date: Wed, 31 Jul 2024 15:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/i915: Use backlight power constants
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-3-tzimmermann@suse.de> <87y15hwwii.fsf@intel.com>
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
In-Reply-To: <87y15hwwii.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.30 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 XM_UA_NO_VERSION(0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[12];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:email, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Rspamd-Queue-Id: 092BD1F833
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

Am 31.07.24 um 14:56 schrieb Jani Nikula:
> On Wed, 31 Jul 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Replace FB_BLANK_ constants with their counterparts from the
>> backlight subsystem. The values are identical, so there's no
>> change in functionality or semantics.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks.

>
> Do you want us to take this via drm-intel-next, or all together via
> drm-misc? Either is fine.

drm-intel-next is fine.

Best regards
Thomas

>
>> ---
>>   drivers/gpu/drm/i915/display/intel_backlight.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
>> index 071668bfe5d1..6f678c039ed8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>> @@ -455,7 +455,7 @@ void intel_backlight_disable(const struct drm_connector_state *old_conn_state)
>>   	mutex_lock(&i915->display.backlight.lock);
>>   
>>   	if (panel->backlight.device)
>> -		panel->backlight.device->props.power = FB_BLANK_POWERDOWN;
>> +		panel->backlight.device->props.power = BACKLIGHT_POWER_OFF;
>>   	panel->backlight.enabled = false;
>>   	panel->backlight.funcs->disable(old_conn_state, 0);
>>   
>> @@ -773,7 +773,7 @@ static void __intel_backlight_enable(const struct intel_crtc_state *crtc_state,
>>   	panel->backlight.funcs->enable(crtc_state, conn_state, panel->backlight.level);
>>   	panel->backlight.enabled = true;
>>   	if (panel->backlight.device)
>> -		panel->backlight.device->props.power = FB_BLANK_UNBLANK;
>> +		panel->backlight.device->props.power = BACKLIGHT_POWER_ON;
>>   }
>>   
>>   void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
>> @@ -870,12 +870,12 @@ static int intel_backlight_device_update_status(struct backlight_device *bd)
>>   	 */
>>   	if (panel->backlight.enabled) {
>>   		if (panel->backlight.power) {
>> -			bool enable = bd->props.power == FB_BLANK_UNBLANK &&
>> +			bool enable = bd->props.power == BACKLIGHT_POWER_ON &&
>>   				bd->props.brightness != 0;
>>   			panel->backlight.power(connector, enable);
>>   		}
>>   	} else {
>> -		bd->props.power = FB_BLANK_POWERDOWN;
>> +		bd->props.power = BACKLIGHT_POWER_OFF;
>>   	}
>>   
>>   	drm_modeset_unlock(&i915->drm.mode_config.connection_mutex);
>> @@ -945,9 +945,9 @@ int intel_backlight_device_register(struct intel_connector *connector)
>>   					    props.max_brightness);
>>   
>>   	if (panel->backlight.enabled)
>> -		props.power = FB_BLANK_UNBLANK;
>> +		props.power = BACKLIGHT_POWER_ON;
>>   	else
>> -		props.power = FB_BLANK_POWERDOWN;
>> +		props.power = BACKLIGHT_POWER_OFF;
>>   
>>   	name = kstrdup_const("intel_backlight", GFP_KERNEL);
>>   	if (!name)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

