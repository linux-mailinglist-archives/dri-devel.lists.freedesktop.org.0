Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D7C4C859
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248D010E522;
	Tue, 11 Nov 2025 09:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QEokioa3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V1vmD+XM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QEokioa3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V1vmD+XM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9B610E519
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 09:04:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9632A1F456;
 Tue, 11 Nov 2025 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762851855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4pvAM5O0BgvuO6S3at2SOytfTSZwvJDZO8hboniaESU=;
 b=QEokioa3ceeVxeaNZulMJirrZYQK6fVTj1YJlnWPiioNlmUZBgz0iYCnNJdKMvSL2OEP69
 HHYj+WvwGCpygMRq2Ulat0Ef1cTNfytkuUayNaaFg0+IP5iewAkRBpx6yhr9zPeCsXPgZz
 3KHJ8Lv3Uqmd72oxbOiO9ZIKFX2ZQWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762851855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4pvAM5O0BgvuO6S3at2SOytfTSZwvJDZO8hboniaESU=;
 b=V1vmD+XMXmFApj+0SgZPC2FanfRFJEbkwTAHQo8qEjNMqZdpI+zyWLRcR4xqmuCWpUTCuk
 V+ujyCuNRpqBHRCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QEokioa3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V1vmD+XM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762851855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4pvAM5O0BgvuO6S3at2SOytfTSZwvJDZO8hboniaESU=;
 b=QEokioa3ceeVxeaNZulMJirrZYQK6fVTj1YJlnWPiioNlmUZBgz0iYCnNJdKMvSL2OEP69
 HHYj+WvwGCpygMRq2Ulat0Ef1cTNfytkuUayNaaFg0+IP5iewAkRBpx6yhr9zPeCsXPgZz
 3KHJ8Lv3Uqmd72oxbOiO9ZIKFX2ZQWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762851855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4pvAM5O0BgvuO6S3at2SOytfTSZwvJDZO8hboniaESU=;
 b=V1vmD+XMXmFApj+0SgZPC2FanfRFJEbkwTAHQo8qEjNMqZdpI+zyWLRcR4xqmuCWpUTCuk
 V+ujyCuNRpqBHRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6848314892;
 Tue, 11 Nov 2025 09:04:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /UkiGA/8EmkpVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Nov 2025 09:04:15 +0000
Message-ID: <4bd04e1e-1df7-4826-b846-d250601d8b5e@suse.de>
Date: Tue, 11 Nov 2025 10:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] drm/vblank: pass vlank to
 drm_vblank_get()/_put()/_count()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <0bc4fa981f31122651abc13e5b6b8d92bbc9585a.1762791343.git.jani.nikula@intel.com>
 <6845f801-2105-4500-b088-3f53bbab63ba@suse.de>
 <bb68557c6c473d96cb93681a5eb731ff1dfa9437@intel.com>
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
In-Reply-To: <bb68557c6c473d96cb93681a5eb731ff1dfa9437@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9632A1F456
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
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

Am 11.11.25 um 09:53 schrieb Jani Nikula:
> On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> s/vlank/vblank in the commit headline
>>
>> Am 10.11.25 um 17:17 schrieb Jani Nikula:
>>> Pass struct drm_vblank_crtc * to drm_vblank_get(), drm_vblank_put(), and
>>> drm_vblank_count(). They'll figure out the vblank pointer as the first
>>> thing anyway, so it's handy to pass it when available. We can also rely
>>> on vblank having a valid pipe, and can reduce the number of checks we
>>> do.
>> I do agree that drm_vblank_crtc should be out go-to structure for these
>> interfaces with wrappers around that do the lookup if necessary.
>>
>>> Add underscore prefixed helpers for using dev/pipe until we've converted
>>> all users to pass in the vblank. Directly convert the call sites that
>>> already have the vblank pointer available.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_internal.h    |  6 +--
>>>    drivers/gpu/drm/drm_vblank.c      | 77 ++++++++++++++++++-------------
>>>    drivers/gpu/drm/drm_vblank_work.c | 12 ++---
>>>    3 files changed, 55 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>> index 5a3bed48ab1f..e9c85c3681f1 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -101,9 +101,9 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
>>>    }
>>>    
>>>    void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
>>> -int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
>>> -void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
>>> -u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
>>> +int drm_vblank_get(struct drm_vblank_crtc *vblank);
>>> +void drm_vblank_put(struct drm_vblank_crtc *vblank);
>>> +u64 drm_vblank_count(struct drm_vblank_crtc *vblank);
>> Why no call these helpers drm_vblank_crtc_<func>() ? That would avoid
>> the underscored helper and have clear naming guidelines for later such
>> functions.
> I didn't really pay much attention to it. There's a lot of crtc in the
> names already, so I guess the convention would then be:
>
> 	drm_crtc_vblank_*(struct drm_crtc *crtc, ...)
>
> 	drm_vblank_crtc_*(struct drm_vblank_crtc *vblank, ...)
>
> No big deal for me to rename if you think that's a good convention.

Right. The third pattern would be

    drm_vblank_*(struct drm_device, int pipe, ...)

The implementation would then gradually move towards using 
drm_vblank_crtc_ where possible. Makes sense to me and would avoid any 
intermediate helpers.

Best regards
Thomas

>
> The underscored helpers are temporary, and will get removed later in the
> series. IMO the series is easier to review that way. Of course cleaner
> if we don't have to add them in the first place.
>
> BR,
> Jani.
>
>>>    
>>>    /* drm_vblank_work.c */
>>>    static inline void drm_vblank_flush_worker(struct drm_vblank_crtc *vblank)
>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>>> index 96dbff63f52d..0ae34f848660 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -384,14 +384,10 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
>>>    	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
>>>    }
>>>    
>>> -u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>>> +u64 drm_vblank_count(struct drm_vblank_crtc *vblank)
>>>    {
>>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>>    	u64 count;
>>>    
>>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> -		return 0;
>>> -
>>>    	count = atomic64_read(&vblank->count);
>>>    
>>>    	/*
>>> @@ -406,6 +402,14 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>>>    	return count;
>>>    }
>>>    
>>> +static u64 _drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>>> +{
>>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> +		return 0;
>>> +
>>> +	return drm_vblank_count(drm_vblank_crtc(dev, pipe));
>>> +}
>>> +
>>>    /**
>>>     * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
>>>     * @crtc: which counter to retrieve
>>> @@ -431,7 +435,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
>>>    	spin_lock_irqsave(&dev->vblank_time_lock, flags);
>>>    
>>>    	drm_update_vblank_count(dev, pipe, false);
>>> -	vblank = drm_vblank_count(dev, pipe);
>>> +	vblank = _drm_vblank_count(dev, pipe);
>>>    
>>>    	spin_unlock_irqrestore(&dev->vblank_time_lock, flags);
>>>    
>>> @@ -935,7 +939,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>>>     */
>>>    u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
>>>    {
>>> -	return drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
>>> +	return _drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
>>>    }
>>>    EXPORT_SYMBOL(drm_crtc_vblank_count);
>>>    
>>> @@ -1208,18 +1212,16 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>>>    	return ret;
>>>    }
>>>    
>>> -int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>> +int drm_vblank_get(struct drm_vblank_crtc *vblank)
>>>    {
>>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>> +	struct drm_device *dev = vblank->dev;
>>> +	int pipe = vblank->pipe;
>>>    	unsigned long irqflags;
>>>    	int ret = 0;
>>>    
>>>    	if (!drm_dev_has_vblank(dev))
>>>    		return -EINVAL;
>>>    
>>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> -		return -EINVAL;
>>> -
>>>    	spin_lock_irqsave(&dev->vbl_lock, irqflags);
>>>    	/* Going from 0->1 means we have to enable interrupts again */
>>>    	if (atomic_add_return(1, &vblank->refcount) == 1) {
>>> @@ -1235,6 +1237,14 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>>    	return ret;
>>>    }
>>>    
>>> +static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>> +{
>>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> +		return -EINVAL;
>>> +
>>> +	return drm_vblank_get(drm_vblank_crtc(dev, pipe));
>>> +}
>>> +
>>>    /**
>>>     * drm_crtc_vblank_get - get a reference count on vblank events
>>>     * @crtc: which CRTC to own
>>> @@ -1247,18 +1257,15 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>>     */
>>>    int drm_crtc_vblank_get(struct drm_crtc *crtc)
>>>    {
>>> -	return drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
>>> +	return _drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
>>>    }
>>>    EXPORT_SYMBOL(drm_crtc_vblank_get);
>>>    
>>> -void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>> +void drm_vblank_put(struct drm_vblank_crtc *vblank)
>>>    {
>>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>> +	struct drm_device *dev = vblank->dev;
>>>    	int vblank_offdelay = vblank->config.offdelay_ms;
>>>    
>>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> -		return;
>>> -
>>>    	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
>>>    		return;
>>>    
>>> @@ -1274,6 +1281,14 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>>    	}
>>>    }
>>>    
>>> +static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>> +{
>>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>> +		return;
>>> +
>>> +	drm_vblank_put(drm_vblank_crtc(dev, pipe));
>>> +}
>>> +
>>>    /**
>>>     * drm_crtc_vblank_put - give up ownership of vblank events
>>>     * @crtc: which counter to give up
>>> @@ -1284,7 +1299,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>>     */
>>>    void drm_crtc_vblank_put(struct drm_crtc *crtc)
>>>    {
>>> -	drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
>>> +	_drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
>>>    }
>>>    EXPORT_SYMBOL(drm_crtc_vblank_put);
>>>    
>>> @@ -1306,20 +1321,20 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
>>>    	int ret;
>>>    	u64 last;
>>>    
>>> -	ret = drm_vblank_get(dev, pipe);
>>> +	ret = drm_vblank_get(vblank);
>>>    	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>>>    		     pipe, ret))
>>>    		return ret;
>>>    
>>> -	last = drm_vblank_count(dev, pipe);
>>> +	last = drm_vblank_count(vblank);
>>>    
>>>    	ret = wait_event_timeout(vblank->queue,
>>> -				 last != drm_vblank_count(dev, pipe),
>>> +				 last != drm_vblank_count(vblank),
>>>    				 msecs_to_jiffies(1000));
>>>    
>>>    	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
>>>    
>>> -	drm_vblank_put(dev, pipe);
>>> +	drm_vblank_put(vblank);
>>>    
>>>    	return ret ? 0 : -ETIMEDOUT;
>>>    }
>>> @@ -1385,7 +1400,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>>>    			     "wanted %llu, current %llu\n",
>>>    			     e->sequence, seq);
>>>    		list_del(&e->base.link);
>>> -		drm_vblank_put(dev, pipe);
>>> +		_drm_vblank_put(dev, pipe);
>>>    		send_vblank_event(dev, e, seq, now);
>>>    	}
>>>    
>>> @@ -1661,7 +1676,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>>>    
>>>    	e->sequence = req_seq;
>>>    	if (drm_vblank_passed(seq, req_seq)) {
>>> -		drm_vblank_put(dev, pipe);
>>> +		_drm_vblank_put(dev, pipe);
>>>    		send_vblank_event(dev, e, seq, now);
>>>    		vblwait->reply.sequence = seq;
>>>    	} else {
>>> @@ -1678,7 +1693,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>>>    	spin_unlock_irq(&dev->event_lock);
>>>    	kfree(e);
>>>    err_put:
>>> -	drm_vblank_put(dev, pipe);
>>> +	_drm_vblank_put(dev, pipe);
>>>    	return ret;
>>>    }
>>>    
>>> @@ -1796,14 +1811,14 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>>    		return 0;
>>>    	}
>>>    
>>> -	ret = drm_vblank_get(dev, pipe);
>>> +	ret = _drm_vblank_get(dev, pipe);
>>>    	if (ret) {
>>>    		drm_dbg_core(dev,
>>>    			     "crtc %d failed to acquire vblank counter, %d\n",
>>>    			     pipe, ret);
>>>    		return ret;
>>>    	}
>>> -	seq = drm_vblank_count(dev, pipe);
>>> +	seq = _drm_vblank_count(dev, pipe);
>>>    
>>>    	switch (vblwait->request.type & _DRM_VBLANK_TYPES_MASK) {
>>>    	case _DRM_VBLANK_RELATIVE:
>>> @@ -1839,7 +1854,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>>    		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
>>>    			     req_seq, pipe);
>>>    		wait = wait_event_interruptible_timeout(vblank->queue,
>>> -			drm_vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
>>> +			drm_vblank_passed(_drm_vblank_count(dev, pipe), req_seq) ||
>>>    				      !READ_ONCE(vblank->enabled),
>>>    			msecs_to_jiffies(3000));
>>>    
>>> @@ -1869,7 +1884,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>>    	}
>>>    
>>>    done:
>>> -	drm_vblank_put(dev, pipe);
>>> +	_drm_vblank_put(dev, pipe);
>>>    	return ret;
>>>    }
>>>    
>>> @@ -1895,7 +1910,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>>>    			     e->sequence, seq);
>>>    
>>>    		list_del(&e->base.link);
>>> -		drm_vblank_put(dev, pipe);
>>> +		_drm_vblank_put(dev, pipe);
>>>    		send_vblank_event(dev, e, seq, now);
>>>    	}
>>>    
>>> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
>>> index 70f0199251ea..2ef006626d50 100644
>>> --- a/drivers/gpu/drm/drm_vblank_work.c
>>> +++ b/drivers/gpu/drm/drm_vblank_work.c
>>> @@ -58,7 +58,7 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
>>>    			continue;
>>>    
>>>    		list_del_init(&work->node);
>>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>>> +		drm_vblank_put(vblank);
>>>    		kthread_queue_work(vblank->worker, &work->base);
>>>    		wake = true;
>>>    	}
>>> @@ -80,7 +80,7 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
>>>    
>>>    	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
>>>    		list_del_init(&work->node);
>>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>>> +		drm_vblank_put(vblank);
>>>    	}
>>>    
>>>    	wake_up_all(&vblank->work_wait_queue);
>>> @@ -129,7 +129,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>>    		goto out;
>>>    
>>>    	if (list_empty(&work->node)) {
>>> -		ret = drm_vblank_get(dev, vblank->pipe);
>>> +		ret = drm_vblank_get(vblank);
>>>    		if (ret < 0)
>>>    			goto out;
>>>    	} else if (work->count == count) {
>>> @@ -140,7 +140,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>>    	}
>>>    
>>>    	work->count = count;
>>> -	cur_vbl = drm_vblank_count(dev, vblank->pipe);
>>> +	cur_vbl = drm_vblank_count(vblank);
>>>    	passed = drm_vblank_passed(cur_vbl, count);
>>>    	if (passed)
>>>    		drm_dbg_core(dev,
>>> @@ -148,7 +148,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>>    			     vblank->pipe, count, cur_vbl);
>>>    
>>>    	if (!nextonmiss && passed) {
>>> -		drm_vblank_put(dev, vblank->pipe);
>>> +		drm_vblank_put(vblank);
>>>    		ret = kthread_queue_work(vblank->worker, &work->base);
>>>    
>>>    		if (rescheduling) {
>>> @@ -193,7 +193,7 @@ bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
>>>    	spin_lock_irq(&dev->event_lock);
>>>    	if (!list_empty(&work->node)) {
>>>    		list_del_init(&work->node);
>>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>>> +		drm_vblank_put(vblank);
>>>    		ret = true;
>>>    	}
>>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


