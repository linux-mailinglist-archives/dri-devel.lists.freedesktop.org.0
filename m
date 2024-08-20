Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CC957FFC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2110E342;
	Tue, 20 Aug 2024 07:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o2E4IWEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T/6ZCkvi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o2E4IWEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T/6ZCkvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9226510E28C;
 Tue, 20 Aug 2024 07:39:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0927D1FD09;
 Tue, 20 Aug 2024 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724139545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ji2jE+Ie1xdplY4abfz+onRj0ut/Vv4WF2Egb6PV0G4=;
 b=o2E4IWEX9tmErPRCppY4iTWfq8zX4O84XyqSW2yK8rYO3Y6fA5+t/pHA/TkUPGolPeV9XO
 PgHHK869eu2Ku6h64oM1ny3tFZ/gLp/8Pk9JyNeGPGAIZkMRT6nSRCcYmKY+EmL9fQ4AS6
 8PmcTfNv5FzI98qgMVIwz3QLo95WZoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724139545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ji2jE+Ie1xdplY4abfz+onRj0ut/Vv4WF2Egb6PV0G4=;
 b=T/6ZCkvi3g6KbcZ3J7636Eip6t1l2HbfLFaXjm8lssWfc2LUwraTD3JkD9zo5e0Ubhi2Sn
 lqeMpbEX/olvj3Bg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o2E4IWEX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="T/6ZCkvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724139545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ji2jE+Ie1xdplY4abfz+onRj0ut/Vv4WF2Egb6PV0G4=;
 b=o2E4IWEX9tmErPRCppY4iTWfq8zX4O84XyqSW2yK8rYO3Y6fA5+t/pHA/TkUPGolPeV9XO
 PgHHK869eu2Ku6h64oM1ny3tFZ/gLp/8Pk9JyNeGPGAIZkMRT6nSRCcYmKY+EmL9fQ4AS6
 8PmcTfNv5FzI98qgMVIwz3QLo95WZoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724139545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ji2jE+Ie1xdplY4abfz+onRj0ut/Vv4WF2Egb6PV0G4=;
 b=T/6ZCkvi3g6KbcZ3J7636Eip6t1l2HbfLFaXjm8lssWfc2LUwraTD3JkD9zo5e0Ubhi2Sn
 lqeMpbEX/olvj3Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B9E313770;
 Tue, 20 Aug 2024 07:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NkmwJBhIxGY/HgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 07:39:04 +0000
Message-ID: <a48a5538-b4a9-4e01-9930-b1538325b9e3@suse.de>
Date: Tue, 20 Aug 2024 09:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [82/86] drm/i915: Move custom hotplug code into separate callback
To: Sui Jingfeng <sui.jingfeng@linux.dev>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240816125408.310253-83-tzimmermann@suse.de>
 <86a55d3c-930d-4b30-9f05-82dd2966df85@linux.dev>
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
In-Reply-To: <86a55d3c-930d-4b30-9f05-82dd2966df85@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0927D1FD09
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linux.dev,ffwll.ch,gmail.com,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Hi

Am 19.08.24 um 10:52 schrieb Sui Jingfeng:
> Hi, Thomas
>
>
> I love your patch, yet ...
>
>
> On 2024/8/16 20:23, Thomas Zimmermann wrote:
>> i915's fbdev contains additional code for hotplugging a display that
>> cannot be ported to the common fbdev client. Introduce the callback
>> struct drm_fb_helper.fb_hotplug and implement it for i915. The fbdev
>> helpers invoke the callback before handing the hotplug event.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c            |  6 +++
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++----------
>>   include/drm/drm_fb_helper.h                | 13 +++++++
>>   3 files changed, 42 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index d9e539b0fd1a..92926cb02dfb 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1938,6 +1938,12 @@ int drm_fb_helper_hotplug_event(struct 
>> drm_fb_helper *fb_helper)
>>       if (!drm_fbdev_emulation || !fb_helper)
>>           return 0;
>>   +    if (fb_helper->funcs->fb_hotplug) {
>
> We seems need to check the existence on the 'fb_helper->funcs' here,
>
> For example:
>
>
> if (fb_helper->funcs && fb_helper->funcs->fb_hotplug) {
>
> Otherwise, it will de-reference NULL pointer.
> Can be observed on a trivial driver though,
> with no monitor(display) connected.

Indeed. That needs to be fixed. Thank you for noting.

To give some context:  I was hoping to remove drm_fb_helper_funcs at 
some point. fb_probe is now gone with these patches and fb_dirty can 
certainly be replaced as well. (I once had prototype patches to do 
that). This leaves the new callbacks for 915, for which I don't have a 
good alternative solution. So it seems that drm_fb_helper_funcs will 
only be used by i915/xe in the long term.

Best regards
Thomas

>
>
>> +        err = fb_helper->funcs->fb_hotplug(fb_helper);
>> +        if (err)
>> +            return err;
>> +    }
>> +
>>       mutex_lock(&fb_helper->lock);
>>       if (fb_helper->deferred_setup) {
>>           err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c 
>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index c03fb00002a4..abe77ef0bd84 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -305,10 +305,32 @@ static void intelfb_restore(struct 
>> drm_fb_helper *fb_helper)
>>       intel_fbdev_invalidate(ifbdev);
>>   }
>>   +static int intelfb_hotplug(struct drm_fb_helper *fb_helper)
>> +{
>> +    struct drm_device *dev = fb_helper->client.dev;
>> +    struct drm_i915_private *dev_priv = to_i915(dev);
>> +    struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
>> +    bool send_hpd;
>> +
>> +    if (!ifbdev)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&ifbdev->hpd_lock);
>> +    send_hpd = !ifbdev->hpd_suspended;
>> +    ifbdev->hpd_waiting = true;
>> +    mutex_unlock(&ifbdev->hpd_lock);
>> +
>> +    if (!send_hpd || !(ifbdev->vma || dev->fb_helper->deferred_setup))
>> +        return -EAGAIN;
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
>>       .fb_probe = intelfb_create,
>>       .fb_dirty = intelfb_dirty,
>>       .fb_restore = intelfb_restore,
>> +    .fb_hotplug = intelfb_hotplug,
>>   };
>>     /*
>> @@ -557,25 +579,6 @@ void intel_fbdev_set_suspend(struct drm_device 
>> *dev, int state, bool synchronous
>>       intel_fbdev_hpd_set_suspend(dev_priv, state);
>>   }
>>   -static int intel_fbdev_output_poll_changed(struct drm_device *dev)
>> -{
>> -    struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
>> -    bool send_hpd;
>> -
>> -    if (!ifbdev)
>> -        return -EINVAL;
>> -
>> -    mutex_lock(&ifbdev->hpd_lock);
>> -    send_hpd = !ifbdev->hpd_suspended;
>> -    ifbdev->hpd_waiting = true;
>> -    mutex_unlock(&ifbdev->hpd_lock);
>> -
>> -    if (send_hpd && (ifbdev->vma || dev->fb_helper->deferred_setup))
>> -        drm_fb_helper_hotplug_event(dev->fb_helper);
>> -
>> -    return 0;
>> -}
>> -
>>   static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>>   {
>>       struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
>> @@ -637,7 +640,7 @@ static int intel_fbdev_client_hotplug(struct 
>> drm_client_dev *client)
>>       int ret;
>>         if (dev->fb_helper)
>> -        return intel_fbdev_output_poll_changed(dev);
>> +        return drm_fb_helper_hotplug_event(fb_helper);
>>         ret = drm_fb_helper_init(dev, fb_helper);
>>       if (ret)
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>> index 34eb77c18a13..3dcb9a60e408 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -112,6 +112,19 @@ struct drm_fb_helper_funcs {
>>        * TODO: Fix i915 to not require this callback.
>>        */
>>       void (*fb_restore)(struct drm_fb_helper *helper);
>> +
>> +    /**
>> +     * @fb_hotplug:
>> +     *
>> +     * Driver callback to prepare hotplug event. If set, fbdev
>> +     * emulation will invoke this callback before sending a hotplug
>> +     * event.
>> +     *
>> +     * Only for i915. Do not use in new code.
>> +     *
>> +     * TODO: Fix i915 to not require this callback.
>> +     */
>> +    int (*fb_hotplug)(struct drm_fb_helper *helper);
>>   };
>>     /**
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

