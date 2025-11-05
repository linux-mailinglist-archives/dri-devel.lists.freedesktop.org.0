Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4DC34E4C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D12910E6E7;
	Wed,  5 Nov 2025 09:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TUd55T/C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CCl8ma/3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TUd55T/C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CCl8ma/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFE410E6E7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 09:38:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B5362118B;
 Wed,  5 Nov 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762335529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VuEWcm5s11dWFf2vVND7LYpiuxsBh6zdL+KWsAzLfS8=;
 b=TUd55T/CoSzEGf+8OkZKGPFmopfjyopYrAczDnTDr6PS00Cvr7jYsjVAOBuTd7LJph6on+
 oaLHH/TMyGy7oWuiRcxz73wto21xTnJbDcbQ8CgDAXnXubhLu6Qci7MbtFdcj5QRQlpwuW
 XwFKEqT42jwUc6WRMMowB/2SJbkdy6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762335529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VuEWcm5s11dWFf2vVND7LYpiuxsBh6zdL+KWsAzLfS8=;
 b=CCl8ma/38bV1WiR6UYzjGdDQP4st2aFk7sgv0fbgZmfdUhbPp8wLXhVeAfLbvboQb5xiCx
 6SbqJ27IHmzQe1DA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="TUd55T/C";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="CCl8ma/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762335529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VuEWcm5s11dWFf2vVND7LYpiuxsBh6zdL+KWsAzLfS8=;
 b=TUd55T/CoSzEGf+8OkZKGPFmopfjyopYrAczDnTDr6PS00Cvr7jYsjVAOBuTd7LJph6on+
 oaLHH/TMyGy7oWuiRcxz73wto21xTnJbDcbQ8CgDAXnXubhLu6Qci7MbtFdcj5QRQlpwuW
 XwFKEqT42jwUc6WRMMowB/2SJbkdy6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762335529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VuEWcm5s11dWFf2vVND7LYpiuxsBh6zdL+KWsAzLfS8=;
 b=CCl8ma/38bV1WiR6UYzjGdDQP4st2aFk7sgv0fbgZmfdUhbPp8wLXhVeAfLbvboQb5xiCx
 6SbqJ27IHmzQe1DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACA8132DD;
 Wed,  5 Nov 2025 09:38:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dOX8ECkbC2mmJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Nov 2025 09:38:49 +0000
Message-ID: <ce11235b-47cb-43f1-86e9-dcebc7a0b35d@suse.de>
Date: Wed, 5 Nov 2025 10:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/udl: Increase get urb timeout for modeset
To: oushixiong <oushixiong1025@163.com>, Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20251105083037.237925-1-oushixiong1025@163.com>
 <38110178-0f27-44ba-9925-5bbe74a1bf9b@suse.de>
 <e82274a2-9e60-4344-9d54-78232f42b05d@163.com>
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
In-Reply-To: <e82274a2-9e60-4344-9d54-78232f42b05d@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8B5362118B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,kylinos.cn:email,suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FREEMAIL_TO(0.00)[163.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[poorly.run,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.com:url, suse.de:mid, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
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

Am 05.11.25 um 10:07 schrieb oushixiong:
> If the wait times for all operations increase, it would likely cause 
> significant blocking in the display process.

But we're usually not waiting until timeout, but only until the next urb 
becomes available again. And we have several in the queue pre-allocated. 
Increasing the timeout should therefore not be a problem.  The current 
drawing timeout of 1 second (== HZ) would already be a major issue 
otherwise.

> Should we make a distinction between the two, or base it on what you 
> said about increasing  the regular GET_URB_TIMEOUT for all operations ?

Please try to double the timeout.

(If this really doesn't work, we should try to drop the urb caching 
entirely and allocate urbs as we need them.)

Best regards
Thomas

>
> Best regards
> Shixiong
>
> 在 2025/11/5 16:57, Thomas Zimmermann 写道:
>> Hi
>>
>> Am 05.11.25 um 09:30 schrieb oushixiong1025@163.com:
>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>
>>> [WHY]
>>> There is a situation where udl_handle_damage() was running successfully
>>> but the screen was black. it was because 
>>> udl_crtc_helper_atomic_enable() failed,
>>> and there were no error messages.
>>>
>>> [HOW]
>>> The priority for mode settings needs to be higher than damage 
>>> handle, requiring
>>> a higher success rate than ordinary operations.
>>> Increase get urb timeout for modeset.
>>>
>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/udl/udl_drv.h      |  5 ++++-
>>>   drivers/gpu/drm/udl/udl_main.c     |  5 ++---
>>>   drivers/gpu/drm/udl/udl_modeset.c  | 11 +++++++----
>>>   drivers/gpu/drm/udl/udl_transfer.c |  2 +-
>>>   4 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/udl/udl_drv.h 
>>> b/drivers/gpu/drm/udl/udl_drv.h
>>> index 145bb95ccc48..38b3bdf1ae4a 100644
>>> --- a/drivers/gpu/drm/udl/udl_drv.h
>>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>>> @@ -31,6 +31,9 @@ struct drm_mode_create_dumb;
>>>   #define DRIVER_MINOR        0
>>>   #define DRIVER_PATCHLEVEL    1
>>>   +#define GET_URB_TIMEOUT    HZ
>>> +#define MODESET_GET_URB_TIMEOUT    (HZ*2)
>>> +
>>
>> Just increase the regular GET_URB_TIMEOUT for all operations.
>>
>> Best regards
>> Thomas
>>
>>>   struct udl_device;
>>>     struct urb_node {
>>> @@ -72,7 +75,7 @@ static inline struct usb_device 
>>> *udl_to_usb_device(struct udl_device *udl)
>>>   int udl_modeset_init(struct udl_device *udl);
>>>   struct drm_connector *udl_connector_init(struct drm_device *dev);
>>>   -struct urb *udl_get_urb(struct udl_device *udl);
>>> +struct urb *udl_get_urb(struct udl_device *udl, long timeout);
>>>     int udl_submit_urb(struct udl_device *udl, struct urb *urb, 
>>> size_t len);
>>>   void udl_sync_pending_urbs(struct udl_device *udl);
>>> diff --git a/drivers/gpu/drm/udl/udl_main.c 
>>> b/drivers/gpu/drm/udl/udl_main.c
>>> index bc58991a6f14..891996f0f74b 100644
>>> --- a/drivers/gpu/drm/udl/udl_main.c
>>> +++ b/drivers/gpu/drm/udl/udl_main.c
>>> @@ -285,13 +285,12 @@ static struct urb *udl_get_urb_locked(struct 
>>> udl_device *udl, long timeout)
>>>       return unode->urb;
>>>   }
>>>   -#define GET_URB_TIMEOUT    HZ
>>> -struct urb *udl_get_urb(struct udl_device *udl)
>>> +struct urb *udl_get_urb(struct udl_device *udl, long timeout)
>>>   {
>>>       struct urb *urb;
>>>         spin_lock_irq(&udl->urbs.lock);
>>> -    urb = udl_get_urb_locked(udl, GET_URB_TIMEOUT);
>>> +    urb = udl_get_urb_locked(udl, timeout);
>>>       spin_unlock_irq(&udl->urbs.lock);
>>>       return urb;
>>>   }
>>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c 
>>> b/drivers/gpu/drm/udl/udl_modeset.c
>>> index 231e829bd709..6adca5e3e471 100644
>>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>>> @@ -21,6 +21,7 @@
>>>   #include <drm/drm_gem_framebuffer_helper.h>
>>>   #include <drm/drm_gem_shmem_helper.h>
>>>   #include <drm/drm_modeset_helper_vtables.h>
>>> +#include <drm/drm_print.h>
>>>   #include <drm/drm_probe_helper.h>
>>>   #include <drm/drm_vblank.h>
>>>   @@ -217,7 +218,7 @@ static int udl_handle_damage(struct 
>>> drm_framebuffer *fb,
>>>           return ret;
>>>       log_bpp = ret;
>>>   -    urb = udl_get_urb(udl);
>>> +    urb = udl_get_urb(udl, GET_URB_TIMEOUT);
>>>       if (!urb)
>>>           return -ENOMEM;
>>>       cmd = urb->transfer_buffer;
>>> @@ -341,9 +342,11 @@ static void 
>>> udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
>>>       if (!drm_dev_enter(dev, &idx))
>>>           return;
>>>   -    urb = udl_get_urb(udl);
>>> -    if (!urb)
>>> +    urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
>>> +    if (!urb) {
>>> +        DRM_ERROR("Udl get urb failed when enabling crtc");
>>>           goto out;
>>> +    }
>>>         buf = (char *)urb->transfer_buffer;
>>>       buf = udl_vidreg_lock(buf);
>>> @@ -374,7 +377,7 @@ static void 
>>> udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
>>>       if (!drm_dev_enter(dev, &idx))
>>>           return;
>>>   -    urb = udl_get_urb(udl);
>>> +    urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
>>>       if (!urb)
>>>           goto out;
>>>   diff --git a/drivers/gpu/drm/udl/udl_transfer.c 
>>> b/drivers/gpu/drm/udl/udl_transfer.c
>>> index 7d670b3a5293..858b47522d78 100644
>>> --- a/drivers/gpu/drm/udl/udl_transfer.c
>>> +++ b/drivers/gpu/drm/udl/udl_transfer.c
>>> @@ -202,7 +202,7 @@ int udl_render_hline(struct udl_device *udl, int 
>>> log_bpp, struct urb **urb_ptr,
>>>               int ret = udl_submit_urb(udl, urb, len);
>>>               if (ret)
>>>                   return ret;
>>> -            urb = udl_get_urb(udl);
>>> +            urb = udl_get_urb(udl, GET_URB_TIMEOUT);
>>>               if (!urb)
>>>                   return -EAGAIN;
>>>               *urb_ptr = urb;
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


