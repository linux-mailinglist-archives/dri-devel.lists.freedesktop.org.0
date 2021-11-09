Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EF44B0B0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 16:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542F89CAA;
	Tue,  9 Nov 2021 15:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17756E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2jLWUxWVafTg6XNbuqQwSi/vlAJC5JC6VJT4lSLReA=; b=iPEDjmY4B+l5EgynojlyxUZtqa
 PYzpXHGLgun/+/iMFbKBQV1JftMh5fgtt+xl+IqF8Hn5oPfzXT0808tCeg+nrjsdnVcVSYJRrjS6i
 IGu8iiyCBaCgfpWei3QoRMC0cw6X7kREadu+SB+PumNhHBWjj0MkUM/YskCwqpRjvvaD0z22IcDSa
 vFldWUMNvxp3Rzu84TUUtnw+Wjnkh+6MWaKFJvHqOzSNgpVXztYTQFhwJB51P1Zo2ucmHsrD3AtUG
 sydZM8HYnflVH6XQsn5QbhWZMUa+CnHIeo7AMr6+7dRjrag0VVJXnLR4I4KB4o17e7h+yIaRaP86U
 /PuF/a/g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60908
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mkTQH-0004KK-6r; Tue, 09 Nov 2021 16:52:33 +0100
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
 <b5e514a7-74f3-d072-cfba-80ff05c2669c@suse.de>
 <1b1e8a38-2ad6-406e-0d07-bd28dcba08a3@tronnes.org>
 <bb71f9a7-9fd0-ac91-749d-b9241290c45d@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6caaace4-27e5-2ac9-9c84-40d7b8ffcb1e@tronnes.org>
Date: Tue, 9 Nov 2021 16:52:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bb71f9a7-9fd0-ac91-749d-b9241290c45d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 09.11.2021 15.56, skrev Thomas Zimmermann:
> Hi,
> 
> thanks for looking through all this code.
> 
> Am 09.11.21 um 14:04 schrieb Noralf Trønnes:
>>
>>
>> Den 09.11.2021 13.38, skrev Thomas Zimmermann:
>>>
>>>
>>> Am 08.11.21 um 21:55 schrieb Noralf Trønnes:
>>>>
>>>>
>>>> Den 01.11.2021 15.15, skrev Thomas Zimmermann:
>>>>> Enable the FB_DAMAGE_CLIPS property to reduce display-update
>>>>> overhead. Also fixes a warning in the kernel log.
>>>>>
>>>>>     simple-framebuffer simple-framebuffer.0: [drm]
>>>>> drm_plane_enable_fb_damage_clips() not called
>>>>>
>>>>> Fix the computation of the blit rectangle. This wasn't an issue so
>>>>> far, as simpledrm always blitted the full framebuffer. The code now
>>>>> supports damage clipping and virtual screen sizes.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>    drivers/gpu/drm/tiny/simpledrm.c | 30
>>>>> ++++++++++++++++++++++--------
>>>>>    1 file changed, 22 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c
>>>>> b/drivers/gpu/drm/tiny/simpledrm.c
>>>>> index 571f716ff427..e872121e9fb0 100644
>>>>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>>>>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>>>>> @@ -642,7 +642,7 @@ simpledrm_simple_display_pipe_enable(struct
>>>>> drm_simple_display_pipe *pipe,
>>>>>        void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use
>>>>> mapping abstraction */
>>>>>        struct drm_device *dev = &sdev->dev;
>>>>>        void __iomem *dst = sdev->screen_base;
>>>>> -    struct drm_rect clip;
>>>>> +    struct drm_rect src_clip, dst_clip;
>>>>>        int idx;
>>>>>          if (!fb)
>>>>> @@ -651,10 +651,14 @@ simpledrm_simple_display_pipe_enable(struct
>>>>> drm_simple_display_pipe *pipe,
>>>>>        if (!drm_dev_enter(dev, &idx))
>>>>>            return;
>>>>>    -    drm_rect_init(&clip, 0, 0, fb->width, fb->height);
>>>>> +    drm_rect_fp_to_int(&src_clip, &plane_state->src);
>>>>>    -    dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
>>>>> -    drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap,
>>>>> fb, &clip);
>>>>> +    dst_clip = plane_state->dst;
>>>>
>>>> I assume that src_clip and dst_clip are of the same size, since scaling
>>>> is not supported. What prevents dst_clip from being bigger than the
>>>> buffer that's being blitted into? Where is that bounds checking done?
>>>
>>> The value of dst_clip comes from plane_state->dst, which gets
>>> initialized in drm_atomic_helper_check_plane_state(). [1] The fields are
>>> taken from the crtc_{x,y,w,h} values by drm_plane_get_dest(). [2] For
>>> primary planes, the crtc_{x,y,w,h} values are initialized in
>>> __drm_atomic_helper_set_config() to the size of the display. [3] That
>>> size comes directly from the current video mode. [4] From all I can see
>>> this cannot overflow.
>>>
>>
>> Ok, that takes care of the upper bound.
>>
>> There's this in drm_atomic_helper_check_plane_state():
>>
>>     plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>>
>>     if (!plane_state->visible)
>>         /*
>>          * Plane isn't visible; some drivers can handle this
>>          * so we just return success here.  Drivers that can't
>>          * (including those that use the primary plane helper's
>>          * update function) will return an error from their
>>          * update_plane handler.
>>          */
>>         return 0;
>>
>> drm_atomic_helper_damage_merged() checks ->visible and returns false if
>> it is not set so update() is good on the lower bound.
>>
>> Maybe it's necessary to check ->visible here in enable() before doing
>> the blit?
> 
> Is it even possible to create an invisible primary plane here? We cannot
> scale [1] and if the primary plane is smaller than the framebuffer, we
> hit the case at [2]. The only way I can see this is that the visibility
> test at [3] succeeds. That would require a framebuffer of size 0. That's
> impossible from the code in frambuffer_check(). [4] Unless there's some
> corner case, we're good here.

Ok, thanks.

Noralf.

> 
> However, I think that drm_atomic_check_plane_state() could later be
> improved to handle the 'visible' field in a more sophisticated way.
> 
> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_simple_kms_helper.c#L227
> 
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_helper.c#L854
> 
> [3]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_helper.c#L844
> 
> [4]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_framebuffer.c#L185
> 
> 
>>
>> Noralf.
>>
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_helper.c#L807
>>>
>>>
>>> [2]
>>> https://elixir.bootlin.com/linux/latest/source/include/drm/drm_plane.h#L257
>>>
>>> [3]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic.c#L1590
>>>
>>>
>>> [4]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_modes.c#L788
>>>
>>>
>>>
>>>>
>>>> Noralf.
>>>>
>>>>> +    if (!drm_rect_intersect(&dst_clip, &src_clip))
>>>>> +        return;
>>>>> +
>>>>> +    dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
>>>>> +    drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap,
>>>>> fb, &src_clip);
>>>>>          drm_dev_exit(idx);
>>>>>    }
>>>>> @@ -686,20 +690,28 @@ simpledrm_simple_display_pipe_update(struct
>>>>> drm_simple_display_pipe *pipe,
>>>>>        struct drm_framebuffer *fb = plane_state->fb;
>>>>>        struct drm_device *dev = &sdev->dev;
>>>>>        void __iomem *dst = sdev->screen_base;
>>>>> -    struct drm_rect clip;
>>>>> +    struct drm_rect damage_clip, src_clip, dst_clip;
>>>>>        int idx;
>>>>>          if (!fb)
>>>>>            return;
>>>>>    -    if (!drm_atomic_helper_damage_merged(old_plane_state,
>>>>> plane_state, &clip))
>>>>> +    if (!drm_atomic_helper_damage_merged(old_plane_state,
>>>>> plane_state, &damage_clip))
>>>>> +        return;
>>>>> +
>>>>> +    drm_rect_fp_to_int(&src_clip, &plane_state->src);
>>>>> +    if (!drm_rect_intersect(&src_clip, &damage_clip))
>>>>> +        return;
>>>>> +
>>>>> +    dst_clip = plane_state->dst;
>>>>> +    if (!drm_rect_intersect(&dst_clip, &src_clip))
>>>>>            return;
>>>>>          if (!drm_dev_enter(dev, &idx))
>>>>>            return;
>>>>>    -    dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
>>>>> -    drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap,
>>>>> fb, &clip);
>>>>> +    dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
>>>>> +    drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap,
>>>>> fb, &src_clip);
>>>>>          drm_dev_exit(idx);
>>>>>    }
>>>>> @@ -794,6 +806,8 @@ static int simpledrm_device_init_modeset(struct
>>>>> simpledrm_device *sdev)
>>>>>        if (ret)
>>>>>            return ret;
>>>>>    +    drm_plane_enable_fb_damage_clips(&pipe->plane);
>>>>> +
>>>>>        drm_mode_config_reset(dev);
>>>>>          return 0;
>>>>>
>>>
> 
