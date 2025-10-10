Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C7BCC5C9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECB510EB98;
	Fri, 10 Oct 2025 09:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ALnd3zPv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/u64pSt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ALnd3zPv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/u64pSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC310EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 09:33:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BDE21F393;
 Fri, 10 Oct 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760088808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=44+NAzAhZyPXbKfeWUMZn9WZrh2kjlfS9aXTsIsSTnw=;
 b=ALnd3zPvPNnBWut3InomeHT7RIbh6ZgiDHC95jk6z/4Tq7xUHnil4DqOHUl542VeE7X8K0
 2jE4mD80WGDQb9RO8JZauCNeRG+yYe7uIOOVdKnND5yZvvep+idjeDBFMFZQFQxQyV8RgB
 it8KCiORKLi0pdVP3TOznAqmws0IK5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760088808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=44+NAzAhZyPXbKfeWUMZn9WZrh2kjlfS9aXTsIsSTnw=;
 b=Q/u64pStWWDN0j0ld4Kl9uOlmqKxl7yzM3Xi7wh7BGmUDWtTiXEw39OxBC8FPLLzsRRX6z
 Xa3DQuOTvLyGoHBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ALnd3zPv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Q/u64pSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760088808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=44+NAzAhZyPXbKfeWUMZn9WZrh2kjlfS9aXTsIsSTnw=;
 b=ALnd3zPvPNnBWut3InomeHT7RIbh6ZgiDHC95jk6z/4Tq7xUHnil4DqOHUl542VeE7X8K0
 2jE4mD80WGDQb9RO8JZauCNeRG+yYe7uIOOVdKnND5yZvvep+idjeDBFMFZQFQxQyV8RgB
 it8KCiORKLi0pdVP3TOznAqmws0IK5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760088808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=44+NAzAhZyPXbKfeWUMZn9WZrh2kjlfS9aXTsIsSTnw=;
 b=Q/u64pStWWDN0j0ld4Kl9uOlmqKxl7yzM3Xi7wh7BGmUDWtTiXEw39OxBC8FPLLzsRRX6z
 Xa3DQuOTvLyGoHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A6D21375D;
 Fri, 10 Oct 2025 09:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9BbFCOjS6GgsdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Oct 2025 09:33:28 +0000
Message-ID: <76e2a961-1d3a-411f-9cb3-625be048f4da@suse.de>
Date: Fri, 10 Oct 2025 11:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
 <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
In-Reply-To: <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7BDE21F393
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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

Am 10.10.25 um 06:25 schrieb Kasireddy, Vivek:
[...]
>> Because virtgpu did not initialize vblanking, DRM always sent out a
>> vblank event after the completed commit. [5] It's not synchronized to
>> the display output. This means that virtgpu has always been subject to
>> tearing and the guest always required to hold buffers until the host
>> completed its display update. IOW adding vblank timers into the mix
>> should not change the behavior of virtgpu. It just limits the output
> As I mentioned, the output or display update frequency is already limited
> when blob=true, so adding a vblank timer would be redundant in this case.

To summarize my understanding: virtgpu currently generates vblank events 
as soon as if finished updating the display. Which can be too fast for 
blob=false. For blob=true, the display update is (reasonably assumed to 
be) synchronized with the host update and thereby rate limited by the 
host's display output.

Adding the vblank timer: For blob=true, if a vblank timeout happens 
during an ongoing display update, it does not send an event. If the 
display update finishes before the vblank times out, it arms the vblank 
event and the next vblank timeout will send it out. The vblank timer 
thereby makes events appear at regular intervals instead of ASAP.

So why add the complexity of handling blob=true separately when it 
should integrate well with the existing vblank framework?

Please also note that it's not just about compositors. DRM's fbcon 
synchronizes its output to the vblank period. If no vblank is supported, 
it'll happily fire out display updates ASAP even for blob=true.

Best regards
Thomas

> Note that blob=true is a performance optimization where we create a
> dmabuf (on the Host) backed by Guest FB's memory that is shared with the
> UI layer. And, AFAIK, the only case where virtio-gpu updates are not limited
> is when blob=false. Even in this case, there would be no tearing issues seen
> because the Guest is made to wait until the Host makes a copy of its FB.
>
>> frequency. If GNOME's pageflip is synchronized to the vblank, it should
>> immediately benefit.
>>
>> The GTK repaint callback is an interface for applications. How does it
>> affect, or is affected by, any of this?
> So, virtio-gpu is almost always coupled with a UI (on the Host) in order
> to display the Guest's desktop content (fbcon and compositor's FB data)
> on the Host locally (Gtk, SDL, etc) or streamed to a remote system (Spice,
> Vnc, etc). And, the rate at which the UI updates are submitted (to the
> Host compositor for local UIs) is controlled by the UI timer.
>   
> However, in the case of Qemu Gtk UI, the UI timer is used as a backup
> as we mostly rely on the repaint callback to figure out when to submit
> updates. This is because the repaint callback is a more reliable mechanism
> to determine when it is appropriate to submit an update to the Host
> compositor.
>
> And, until the UI's update is not submitted (and executed by the Host
> GPU and signaled via an EGL fence), the Guest's update fence is not
> signaled. We can reliably achieve 60 FPS this way (assuming the Host's
> refresh rate is 60) for Guest's display updates.
>
> Thanks,
> Vivek
>
>> [5]
>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_atomi
>> c_helper.c#L2606
>>
>> Best regards
>> Thomas
>>
>>> I am not sure how this would affect virgl use-cases but Dmitry can help
>> explain if
>>> the vblank timer would be useful there or not.
>>>
>>> Thanks,
>>> Vivek
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Link: https://lore.kernel.org/dri-
>>>>
>> devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.n
>>>> amprd02.prod.outlook.com/ # [1]
>>>> ---
>>>>    drivers/gpu/drm/virtio/virtgpu_display.c | 29
>> ++++++++++++++++++++++--
>>>>    1 file changed, 27 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>> b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>> index c3315935d8bc..ee134e46eeba 100644
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>> @@ -32,6 +32,8 @@
>>>>    #include <drm/drm_gem_framebuffer_helper.h>
>>>>    #include <drm/drm_probe_helper.h>
>>>>    #include <drm/drm_simple_kms_helper.h>
>>>> +#include <drm/drm_vblank.h>
>>>> +#include <drm/drm_vblank_helper.h>
>>>>
>>>>    #include "virtgpu_drv.h"
>>>>
>>>> @@ -55,6 +57,7 @@ static const struct drm_crtc_funcs
>> virtio_gpu_crtc_funcs
>>>> = {
>>>>    	.reset                  = drm_atomic_helper_crtc_reset,
>>>>    	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>>>>    	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
>>>> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
>>>>    };
>>>>
>>>>    static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
>>>> @@ -99,6 +102,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct
>>>> drm_crtc *crtc)
>>>>    static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>>>>    					  struct drm_atomic_state *state)
>>>>    {
>>>> +	drm_crtc_vblank_on(crtc);
>>>>    }
>>>>
>>>>    static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>>>> @@ -108,6 +112,8 @@ static void virtio_gpu_crtc_atomic_disable(struct
>>>> drm_crtc *crtc,
>>>>    	struct virtio_gpu_device *vgdev = dev->dev_private;
>>>>    	struct virtio_gpu_output *output =
>>>> drm_crtc_to_virtio_gpu_output(crtc);
>>>>
>>>> +	drm_crtc_vblank_off(crtc);
>>>> +
>>>>    	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
>>>>    	virtio_gpu_notify(vgdev);
>>>>    }
>>>> @@ -121,9 +127,10 @@ static int virtio_gpu_crtc_atomic_check(struct
>>>> drm_crtc *crtc,
>>>>    static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>>>>    					 struct drm_atomic_state *state)
>>>>    {
>>>> -	struct drm_crtc_state *crtc_state =
>>>> drm_atomic_get_new_crtc_state(state,
>>>> -									  crtc);
>>>> +	struct drm_device *dev = crtc->dev;
>>>> +	struct drm_crtc_state *crtc_state =
>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>    	struct virtio_gpu_output *output =
>>>> drm_crtc_to_virtio_gpu_output(crtc);
>>>> +	struct drm_pending_vblank_event *event;
>>>>
>>>>    	/*
>>>>    	 * virtio-gpu can't do modeset and plane update operations
>>>> @@ -133,6 +140,20 @@ static void virtio_gpu_crtc_atomic_flush(struct
>>>> drm_crtc *crtc,
>>>>    	 */
>>>>    	if (drm_atomic_crtc_needs_modeset(crtc_state))
>>>>    		output->needs_modeset = true;
>>>> +
>>>> +	spin_lock_irq(&dev->event_lock);
>>>> +
>>>> +	event = crtc_state->event;
>>>> +	crtc_state->event = NULL;
>>>> +
>>>> +	if (event) {
>>>> +		if (drm_crtc_vblank_get(crtc) == 0)
>>>> +			drm_crtc_arm_vblank_event(crtc, event);
>>>> +		else
>>>> +			drm_crtc_send_vblank_event(crtc, event);
>>>> +	}
>>>> +
>>>> +	spin_unlock_irq(&dev->event_lock);
>>>>    }
>>>>
>>>>    static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs
>> = {
>>>> @@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct
>> virtio_gpu_device
>>>> *vgdev)
>>>>    	for (i = 0 ; i < vgdev->num_scanouts; ++i)
>>>>    		vgdev_output_init(vgdev, i);
>>>>
>>>> +	ret = drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>>    	drm_mode_config_reset(vgdev->ddev);
>>>>    	return 0;
>>>>    }
>>>> --
>>>> 2.51.0
>>>>
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


