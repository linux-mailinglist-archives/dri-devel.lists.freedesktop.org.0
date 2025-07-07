Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE72AFB113
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920810E438;
	Mon,  7 Jul 2025 10:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AMB5ORh/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mkSuCdb7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Ht0grQl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hdZeCFJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CFC10E438
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:22:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6A402116D;
 Mon,  7 Jul 2025 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751883719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2DyJxLxzMZWM9tZSNK1RTqW0y29XhF043mBlu7jaHZ0=;
 b=AMB5ORh/mfTgszPMam7PzsVZfm7roSwmabHbZyXDpp/S0yvnc3FvyQEAqzYqNjS3nvrEy9
 Xc52gwRPKK7cKpDubxXNfMisieaFtrLuR7EHnsV7Ix7PP7k6lfoqH2XHFessjsJT3Qjz/+
 lCx0AkEvvujmCFaEoWRo9Qb6tDcQQcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751883719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2DyJxLxzMZWM9tZSNK1RTqW0y29XhF043mBlu7jaHZ0=;
 b=mkSuCdb7lmW3WTviCf4kNq4Asf8fgXOMObxVzM2cZ6HAKA0UEeBU8XQBzcbaNbbOWPP0Zr
 biAhnaChx2yCk8Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0Ht0grQl;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hdZeCFJi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751883718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2DyJxLxzMZWM9tZSNK1RTqW0y29XhF043mBlu7jaHZ0=;
 b=0Ht0grQlDyKpeGPpE4D22/NkSreFs0ecE+2e+KXbmEWzcuI8UBLCh3T1F/EfIPgDEip6xD
 oA3GJNffFu1yYNgE4HLkJubX0QlvwpVQ/udem7KCAHMlJ83IxX3GfFC3SE5pALhJKluqW6
 Ebuf6VPQOBN7/N+Qis8hwuWyaRGHNEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751883718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2DyJxLxzMZWM9tZSNK1RTqW0y29XhF043mBlu7jaHZ0=;
 b=hdZeCFJiwtL++4UJaudivoEUZmnBnaG1Nuq/lfA+RVg69kP2poyqje0Fj81pfEE6RI70cY
 AYkmC+eNw5QXgdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4898A13757;
 Mon,  7 Jul 2025 10:21:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id udlSEMafa2gfWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 10:21:58 +0000
Message-ID: <bd8cefb9-1712-456f-bcf6-9269d4052e45@suse.de>
Date: Mon, 7 Jul 2025 12:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/framebuffer: Acquire internal references on GEM
 handles
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 asrivats@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, jean-christophe@guillain.net,
 superm1@kernel.org, satadru@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250707093200.78436-1-tzimmermann@suse.de>
 <4b20c75a-8459-42c5-9937-ebfdbee5ed32@amd.com>
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
In-Reply-To: <4b20c75a-8459-42c5-9937-ebfdbee5ed32@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B6A402116D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[amd.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,guillain.net];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,web.de,linaro.org,lists.linaro.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, suse.de:dkim, suse.de:mid,
 suse.de:email, imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Am 07.07.25 um 12:07 schrieb Christian König:
> On 07.07.25 11:31, Thomas Zimmermann wrote:
>> Acquire GEM handles in drm_framebuffer_init() and release them in
>> the corresponding drm_framebuffer_cleanup(). Ties the handle's
>> lifetime to the framebuffer. Not all GEM buffer objects have GEM
>> handles. If not set, no refcounting takes place. This is the case
>> for some fbdev emulation. This is not a problem as these GEM objects
>> do not use dma-bufs and drivers will not release them while fbdev
>> emulation is running. Framebuffer flags keep a bit per color plane
>> of which the framebuffer holds a GEM handle reference.
>>
>> As all drivers use drm_framebuffer_init(), they will now all hold
>> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
>> references on GEM handles for framebuffers").
>>
>> In the GEM framebuffer helpers, restore the original ref counting
>> on buffer objects. As the helpers for handle refcounting are now
>> no longer called from outside the DRM core, unexport the symbols.
>>
>> v2:
>> - track framebuffer handle refs by flag
>> - drop gma500 cleanup (Christian)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
>> Tested-by: Bert Karwatzki <spasswolf@web.de>
>> Tested-by: Mario Limonciello <superm1@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/gpu/drm/drm_framebuffer.c            | 31 ++++++++++++++--
>>   drivers/gpu/drm/drm_gem.c                    | 38 ++++++++++++--------
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++-----
>>   drivers/gpu/drm/drm_internal.h               |  2 +-
>>   drivers/gpu/drm/drm_modeset_helper.c         |  2 +-
>>   include/drm/drm_framebuffer.h                |  9 +++++
>>   6 files changed, 71 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>> index b781601946db..23b56cde21d7 100644
>> --- a/drivers/gpu/drm/drm_framebuffer.c
>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>> @@ -862,11 +862,23 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>>   int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   			 const struct drm_framebuffer_funcs *funcs)
>>   {
>> +	unsigned int i;
>>   	int ret;
>> +	bool exists;
>>   
>>   	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>>   		return -EINVAL;
>>   
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (drm_WARN_ON_ONCE(dev, fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
> Looks mostly good, but fb->flags are the userspace mode flags IIRC.
>
> Overloading that sounds like a bad idea. I would just create another bool fb->obj_has_handle_ref[DRM_FORMAT_MAX_PLANES] array for that state.

OK, that seems like a waste of resources, but I'll make it a separate 
field of flags. We should later consider renaming the current flags to 
something like mode_flags.

I'll send out an update later today, so that we don't waste time before 
the upcoming -rc6.

Best regards
Thomas

>
> Regards,
> Christian.
>
>
>> +			fb->flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
>> +		if (fb->obj[i]) {
>> +			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
>> +			if (exists)
>> +				fb->flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
>> +		}
>> +	}
>> +
>>   	INIT_LIST_HEAD(&fb->filp_head);
>>   
>>   	fb->funcs = funcs;
>> @@ -875,7 +887,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>>   				    false, drm_framebuffer_free);
>>   	if (ret)
>> -		goto out;
>> +		goto err;
>>   
>>   	mutex_lock(&dev->mode_config.fb_lock);
>>   	dev->mode_config.num_fb++;
>> @@ -883,7 +895,16 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   	mutex_unlock(&dev->mode_config.fb_lock);
>>   
>>   	drm_mode_object_register(dev, &fb->base);
>> -out:
>> +
>> +	return 0;
>> +
>> +err:
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
>> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +			fb->flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
>> +		}
>> +	}
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_framebuffer_init);
>> @@ -960,6 +981,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>>   void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>>   {
>>   	struct drm_device *dev = fb->dev;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (fb->flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
>> +			drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +	}
>>   
>>   	mutex_lock(&dev->mode_config.fb_lock);
>>   	list_del(&fb->head);
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index bc505d938b3e..41cdab6088ae 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -224,23 +224,34 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>   }
>>   
>>   /**
>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>>    * @obj: GEM object
>>    *
>> - * Acquires a reference on the GEM buffer object's handle. Required
>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>> - * to release the reference.
>> + * Acquires a reference on the GEM buffer object's handle. Required to keep
>> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
>> + * to release the reference. Does nothing if the buffer object has no handle.
>> + *
>> + * Returns:
>> + * True if a handle exists, or false otherwise
>>    */
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *dev = obj->dev;
>>   
>>   	guard(mutex)(&dev->object_name_lock);
>>   
>> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>> +	/*
>> +	 * First ref taken during GEM object creation, if any. Some
>> +	 * drivers set up internal framebuffers with GEM objects that
>> +	 * do not have a GEM handle. Hence, this counter can be zero.
>> +	 */
>> +	if (!obj->handle_count)
>> +		return false;
>> +
>>   	drm_gem_object_handle_get(obj);
>> +
>> +	return true;
>>   }
>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>   
>>   /**
>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>> @@ -273,7 +284,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>   }
>>   
>>   /**
>> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
>>    * @obj: GEM object
>>    *
>>    * Releases a reference on the GEM buffer object's handle. Possibly releases
>> @@ -284,14 +295,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>   	struct drm_device *dev = obj->dev;
>>   	bool final = false;
>>   
>> -	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
>> +	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
>>   		return;
>>   
>>   	/*
>> -	* Must bump handle count first as this may be the last
>> -	* ref, in which case the object would disappear before we
>> -	* checked for a name
>> -	*/
>> +	 * Must bump handle count first as this may be the last
>> +	 * ref, in which case the object would disappear before
>> +	 * we checked for a name.
>> +	 */
>>   
>>   	mutex_lock(&dev->object_name_lock);
>>   	if (--obj->handle_count == 0) {
>> @@ -304,7 +315,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>   	if (final)
>>   		drm_gem_object_put(obj);
>>   }
>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>   
>>   /*
>>    * Called at device or object close to release the file's
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index c60d0044d036..618ce725cd75 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>   	unsigned int i;
>>   
>>   	for (i = 0; i < fb->format->num_planes; i++)
>> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +		drm_gem_object_put(fb->obj[i]);
>>   
>>   	drm_framebuffer_cleanup(fb);
>>   	kfree(fb);
>> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>   		if (!objs[i]) {
>>   			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>   			ret = -ENOENT;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>   		}
>> -		drm_gem_object_handle_get_unlocked(objs[i]);
>> -		drm_gem_object_put(objs[i]);
>>   
>>   		min_size = (height - 1) * mode_cmd->pitches[i]
>>   			 + drm_format_info_min_pitch(info, i, width)
>> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>   			drm_dbg_kms(dev,
>>   				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>   				    objs[i]->size, min_size, i);
>> -			drm_gem_object_handle_put_unlocked(objs[i]);
>> +			drm_gem_object_put(objs[i]);
>>   			ret = -EINVAL;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>   		}
>>   	}
>>   
>>   	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>   	if (ret)
>> -		goto err_gem_object_handle_put_unlocked;
>> +		goto err_gem_object_put;
>>   
>>   	return 0;
>>   
>> -err_gem_object_handle_put_unlocked:
>> +err_gem_object_put:
>>   	while (i > 0) {
>>   		--i;
>> -		drm_gem_object_handle_put_unlocked(objs[i]);
>> +		drm_gem_object_put(objs[i]);
>>   	}
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index f921cc73f8b8..e79c3c623c9a 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -161,7 +161,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>   
>>   /* drm_gem.c */
>>   int drm_gem_init(struct drm_device *dev);
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>> +bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
>>   void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>   			       struct drm_gem_object *obj,
>> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
>> index ef32f6af10d4..1e8822c4b370 100644
>> --- a/drivers/gpu/drm/drm_modeset_helper.c
>> +++ b/drivers/gpu/drm/drm_modeset_helper.c
>> @@ -94,7 +94,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>>   		fb->offsets[i] = mode_cmd->offsets[i];
>>   	}
>>   	fb->modifier = mode_cmd->modifier[0];
>> -	fb->flags = mode_cmd->flags;
>> +	fb->flags = mode_cmd->flags & DRM_FRAMEBUFFER_FLAGS_UAPI_MASK;
>>   }
>>   EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
>>   
>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
>> index 668077009fce..11fa20d21c58 100644
>> --- a/include/drm/drm_framebuffer.h
>> +++ b/include/drm/drm_framebuffer.h
>> @@ -23,6 +23,7 @@
>>   #ifndef __DRM_FRAMEBUFFER_H__
>>   #define __DRM_FRAMEBUFFER_H__
>>   
>> +#include <linux/bits.h>
>>   #include <linux/ctype.h>
>>   #include <linux/list.h>
>>   #include <linux/sched.h>
>> @@ -100,6 +101,14 @@ struct drm_framebuffer_funcs {
>>   		     unsigned num_clips);
>>   };
>>   
>> +#define __DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET 16
>> +
>> +#define DRM_FRAMEBUFFER_FLAGS_UAPI_MASK \
>> +	GENMASK(__DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET - 1, 0)
>> +
>> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i) \
>> +	BIT((__DRM_FRAMEBUFFER_FLAGS_BIT_OFFSET + (_i)))
>> +
>>   /**
>>    * struct drm_framebuffer - frame buffer object
>>    *

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

