Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD28C6668
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 14:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436210E353;
	Wed, 15 May 2024 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mIb9a9Ke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1e/zXnHR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mIb9a9Ke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1e/zXnHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1039D10E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 12:37:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C68A20657;
 Wed, 15 May 2024 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715776641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7FhFJE+3uHHusVCbDjWvIecZTV3nL7JltlpO4DCY8Bo=;
 b=mIb9a9KeKfgNWBPFoNdofWrQbv928ho2S4KWoJwxgdHYtZhKg7EDesjK+LaWea39nWXp2u
 SxKKbx6C72vWEa5QIH5S+RKLsHHmjr8psS3Tr7U0PlQU9OOa7JTawypZhCH5uz/hQeqCfO
 OcXV+lSETZ8ICGmNqkp0VEQV7XQ6ArY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715776641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7FhFJE+3uHHusVCbDjWvIecZTV3nL7JltlpO4DCY8Bo=;
 b=1e/zXnHRuGdLeI3md5p5IFgyV1kcFr1uGh6w7E9K1QJrzJBNSGEePylhLyWz9gPtzK85YB
 NxfZrvGsmG8rf8Cg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mIb9a9Ke;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1e/zXnHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715776641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7FhFJE+3uHHusVCbDjWvIecZTV3nL7JltlpO4DCY8Bo=;
 b=mIb9a9KeKfgNWBPFoNdofWrQbv928ho2S4KWoJwxgdHYtZhKg7EDesjK+LaWea39nWXp2u
 SxKKbx6C72vWEa5QIH5S+RKLsHHmjr8psS3Tr7U0PlQU9OOa7JTawypZhCH5uz/hQeqCfO
 OcXV+lSETZ8ICGmNqkp0VEQV7XQ6ArY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715776641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7FhFJE+3uHHusVCbDjWvIecZTV3nL7JltlpO4DCY8Bo=;
 b=1e/zXnHRuGdLeI3md5p5IFgyV1kcFr1uGh6w7E9K1QJrzJBNSGEePylhLyWz9gPtzK85YB
 NxfZrvGsmG8rf8Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 503B1136A8;
 Wed, 15 May 2024 12:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Rw01EoGsRGZNbAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 May 2024 12:37:21 +0000
Message-ID: <cced5b3e-678f-4c04-97c7-a24480c374f7@suse.de>
Date: Wed, 15 May 2024 14:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/hisilicon/hibmc: convert to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao
 <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <386e3a64efbdd61c3eaed3f49ea9c3ebd4fcd41d.1715691257.git.jani.nikula@intel.com>
 <784e277b-ef15-4c82-9720-c9a03d53f3c6@suse.de> <87jzjvckzp.fsf@intel.com>
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
In-Reply-To: <87jzjvckzp.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email, linaro.org:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9C68A20657
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.50
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

Am 15.05.24 um 14:34 schrieb Jani Nikula:
> On Tue, 14 May 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 14.05.24 um 14:55 schrieb Jani Nikula:
>>> Prefer the struct drm_edid based functions for reading the EDID and
>>> updating the connector.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>>
>>> Cc: Xinliang Liu <xinliang.liu@linaro.org>
>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: Yongqin Liu <yongqin.liu@linaro.org>
>>> Cc: John Stultz <jstultz@google.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c    | 17 ++++++++++-------
>>>    1 file changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> index 94e2c573a7af..409c551c92af 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> @@ -24,14 +24,16 @@
>>>    
>>>    static int hibmc_connector_get_modes(struct drm_connector *connector)
>> Could this function be replaced with a call to
>> drm_connector_helper_get_modes()? With the patch, the only difference is
>> the call to the _noedid() function, which the DRM core does
>> automatically. There will still be a difference in the maximum
>> resolution, but standardizing on 1024x768 seems preferable to me.
> Looks like it might work, but personally, I'm trying to shy away from
> any further cleanups than just switching to struct drm_edid. I've got my
> plate pretty full already.

In that case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

for the current patch.

Best regards
Thomas

>
> BR,
> Jani.
>
>
>> Best regards
>> Thomas
>>
>>>    {
>>> -	int count;
>>> -	void *edid;
>>>    	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
>>> +	const struct drm_edid *drm_edid;
>>> +	int count;
>>> +
>>> +	drm_edid = drm_edid_read_ddc(connector, &hibmc_connector->adapter);
>>>    
>>> -	edid = drm_get_edid(connector, &hibmc_connector->adapter);
>>> -	if (edid) {
>>> -		drm_connector_update_edid_property(connector, edid);
>>> -		count = drm_add_edid_modes(connector, edid);
>>> +	drm_edid_connector_update(connector, drm_edid);
>>> +
>>> +	if (drm_edid) {
>>> +		count = drm_edid_connector_add_modes(connector);
>>>    		if (count)
>>>    			goto out;
>>>    	}
>>> @@ -42,7 +44,8 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
>>>    	drm_set_preferred_mode(connector, 1024, 768);
>>>    
>>>    out:
>>> -	kfree(edid);
>>> +	drm_edid_free(drm_edid);
>>> +
>>>    	return count;
>>>    }
>>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

