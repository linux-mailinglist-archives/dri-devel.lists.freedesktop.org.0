Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69B50EDE1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 02:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2539110E52A;
	Tue, 26 Apr 2022 00:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085410E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:56:19 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e67799d278so14094764fac.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 17:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YTqi9va8h1gnCthh73sXakC1AN7I1r+XWssbEmjvW34=;
 b=dUZmcRjnVqaoWWxXmdQ5JlspEifmNJGl57xZtbXgg/W9ECYVrgHruSvkdkvGJTyWwn
 wIoSqYUZu1gfuYzMgoPfgd6ZMuRSui5QL2vxaois0ZUvSBC4goVWy8q+F3wEkmSw8tRu
 HW14ZRz81Hci1WSUFV9nrEsHzVHAoRh64NkqkehLxo9ezW2q+NInTAZFtBUlTcBtn1hP
 x7/RV+xtATs75hDf4eio52HLpvinWP6O//9bfEQvUV4YVHxP4ho7i66PMfK93PkBeO4q
 doJH7G2hJHN1GKVu/7EiFel2vytNom/FGEnszX5+Q0Vvk8lLLQpttgKbhPTfDzPfbSe4
 SgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YTqi9va8h1gnCthh73sXakC1AN7I1r+XWssbEmjvW34=;
 b=e4Nx7ajeOoik1sLeOw+Pgkk7QglFfHF5pftYt/YN5GnTPaPSzS2Vuhbt/6gBMtWxK0
 UerlhmYk0SylKjEEetxZawf7sW/Hit9KFLDiWp+yMX2Ezx1DzL6XkMO97JS0U+IPXJtb
 TZp8vxLEcOXFsciII8DTh8afvDtTj1uAb7qz6sDrjfz0AsLQ8R6eLi76KkxvFcBpP0wA
 ZcG+7nXp4JyKTPUNRQLGjaWa2RR4dFFGzuhicRhR3x4O+LgaBOpY5Rs7opTSjFlFLyPo
 VPKbw5mqrzJahSCyvZ81lQJXLQR16WehiwlFqiOA5nnpgPFDD8qNT7YH8WcGrUaHzj7Y
 w9lg==
X-Gm-Message-State: AOAM531cAtDQR1mns1BlRFQtSiHKQhR5Fmdk3WYAJ8bQxFK7iW8N1sCw
 mVT9sZ4vsnzsHbfg8PCwKuY=
X-Google-Smtp-Source: ABdhPJy6DIHL2J32TP0qen8+kusq/HwQZQidvKyQX5x6FFyotC5gkAGlUnFf6/vJhNrd4pssApj05w==
X-Received: by 2002:a05:6871:70c:b0:e9:1b2b:38b9 with SMTP id
 f12-20020a056871070c00b000e91b2b38b9mr5003852oap.5.1650934578988; 
 Mon, 25 Apr 2022 17:56:18 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48?
 ([2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a4a7505000000b0033a47bb6a74sm5001116ooc.47.2022.04.25.17.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 17:56:17 -0700 (PDT)
Message-ID: <e246264d-c072-e36d-efd3-20a9a6491e20@gmail.com>
Date: Mon, 25 Apr 2022 21:56:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
 <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
 <20220425105602.151885fd@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220425105602.151885fd@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 4/25/22 04:56, Pekka Paalanen wrote:
> On Sat, 23 Apr 2022 12:12:51 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Pekka,
>>
>> On 4/20/22 08:23, Pekka Paalanen wrote:
>>> On Mon,  4 Apr 2022 17:45:11 -0300
>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>    
>>>> This commit is the groundwork to introduce new formats to the planes and
>>>> writeback buffer. As part of it, a new buffer metadata field is added to
>>>> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
>>>> struct.
>>>
>>> Hi,
>>>
>>> should this be talking about vkms_frame_info struct instead?
>>
>> Yes it should. I will fix this. Thanks.
>>
>>>    
>>>>
>>>> Also adds two new function pointers (`{wb,plane}_format_transform_func`)
>>>> are defined to handle format conversion to/from internal format.
>>>>
>>>> These things will allow us, in the future, to have different compositing
>>>> and wb format types.
>>>>
>>>> V2: Change the code to get the drm_framebuffer reference and not copy its
>>>>       contents(Thomas Zimmermann).
>>>> V3: Drop the refcount in the wb code(Thomas Zimmermann).
>>>> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
>>>>       and vkms_plane_state (Pekka Paalanen)
>>>>
>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>>>>    drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++------
>>>>    drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
>>>>    drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
>>>>    4 files changed, 49 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> index 2d946368a561..95029d2ebcac 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> @@ -153,7 +153,7 @@ static void compose_plane(struct vkms_frame_info *primary_plane_info,
>>>>    			  struct vkms_frame_info *plane_frame_info,
>>>>    			  void *vaddr_out)
>>>>    {
>>>> -	struct drm_framebuffer *fb = &plane_frame_info->fb;
>>>> +	struct drm_framebuffer *fb = plane_frame_info->fb;
>>>>    	void *vaddr;
>>>>    	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>>>>    
>>>> @@ -175,7 +175,7 @@ static int compose_active_planes(void **vaddr_out,
>>>>    				 struct vkms_frame_info *primary_plane_info,
>>>>    				 struct vkms_crtc_state *crtc_state)
>>>>    {
>>>> -	struct drm_framebuffer *fb = &primary_plane_info->fb;
>>>> +	struct drm_framebuffer *fb = primary_plane_info->fb;
>>>>    	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
>>>>    	const void *vaddr;
>>>>    	int i;
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>>>> index 2e6342164bef..2704cfb6904b 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>>>> @@ -22,13 +22,8 @@
>>>>    
>>>>    #define NUM_OVERLAY_PLANES 8
>>>>    
>>>> -struct vkms_writeback_job {
>>>> -	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>>> -	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>>>> -};
>>>> -
>>>>    struct vkms_frame_info {
>>>> -	struct drm_framebuffer fb;
>>>> +	struct drm_framebuffer *fb;
>>>>    	struct drm_rect src, dst;
>>>>    	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>>>    	unsigned int offset;
>>>> @@ -36,6 +31,29 @@ struct vkms_frame_info {
>>>>    	unsigned int cpp;
>>>>    };
>>>>    
>>>> +struct pixel_argb_u16 {
>>>> +	u16 a, r, g, b;
>>>> +};
>>>> +
>>>> +struct line_buffer {
>>>> +	size_t n_pixels;
>>>> +	struct pixel_argb_u16 *pixels;
>>>> +};
>>>> +
>>>> +typedef void
>>>> +(*wb_format_transform_func)(struct vkms_frame_info *frame_info,
>>>> +			    const struct line_buffer *buffer, int y);
>>>> +
>>>> +typedef void
>>>> +(*plane_format_transform_func)(struct line_buffer *buffer,
>>>> +			       const struct vkms_frame_info *frame_info, int y);
>>>
>>> It wasn't immediately obvious to me in which direction these function
>>> types work from their names. The arguments are not wb and plane but
>>> vkms_frame_info and line_buffer in both. The implementations of these
>>> functions would have nothing specific to a wb or a plane either, would
>>> they?
>>
>> No, there's nothing specific.
>>
>> Do you think adding {dst_,src_} would be enough?
>>
>> (*wb_format_transform_func)(struct vkms_frame_info *dst_frame_info,
>> 			    const struct line_buffer *src_buffer
>>
>> (*plane_format_transform_func)(struct line_buffer *dst_buffer,
>> 			   const struct vkms_frame_info *src_frame_info,
> 
> No, because I was looking at the function pointer type names, and not
> the function arguments.

Ohhh.

> 
>>>
>>> What about naming them frame_to_line_func and line_to_frame_func?
>>
>> Sounds good. I will rename it.
> 
> Thanks!
> 
>>>> +
>>>> +struct vkms_writeback_job {
>>>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>>>> +	struct vkms_frame_info frame_info;
>>>
>>> Which frame_info is this? Should the field be called wb_frame_info?
>>
>> Considering it's already in the writeback_job struct do you think this
>> necessary?
> 
> This struct has 'data' too, and that is not the wb buffer, right?

AFAIU, no. Each plane has its own `iosys_map map[]`.

> 
> Hmm, if it's not the wb buffer, then using DRM_FORMAT_MAX_PLANES is
> odd...

Yeah. I honestly don't have any clue why we have an array of `iosys_map`
for each plane, why we only use the map[0] and why we only call
`iosys_map_is_null` only to the `primary_composer`.

Maybe @tzimmermann or @rodrigosiqueiramelo can shed some light on these
questions.

> 
>> In other words, what kind of misudertanding do you think can happen if
>> this variable stay without the `wb_` prefix?
>>
>> I spent a few minutes trying to find a case, but nothing came to my
>> mind.
> 
> My question above is the confusion.
> 
> If all these members are about the wb destination buffer only, then
> where do the inputs come from and how are they reference-counted to
> make sure they are available when needed?

Ok. Got it.

> 
>>>> +	wb_format_transform_func format_func;
>>>
>>> line_to_frame_func wb_write;
>>>
>>> perhaps? The type explains the general type of the function, and the
>>> field name refers to what it is used for.
>>>    
>>>> +};
>>>> +
>>>>    /**
>>>>     * vkms_plane_state - Driver specific plane state
>>>>     * @base: base plane state
>>>> @@ -44,6 +62,7 @@ struct vkms_frame_info {
>>>>    struct vkms_plane_state {
>>>>    	struct drm_shadow_plane_state base;
>>>>    	struct vkms_frame_info *frame_info;
>>>> +	plane_format_transform_func format_func;
>>>
>>> Similarly here, maybe
>>>
>>> frame_to_line_func plane_read;
>>>
>>> perhaps?
>>
>> Yeah, sure.
>>
>>>    
>>>>    };
>>>>    
>>>>    struct vkms_plane {
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> index a56b0f76eddd..28752af0118c 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> @@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>>>>    	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
>>>>    	struct drm_crtc *crtc = vkms_state->base.base.crtc;
>>>>    
>>>> -	if (crtc) {
>>>> +	if (crtc && vkms_state->frame_info->fb) {
>>>>    		/* dropping the reference we acquired in
>>>>    		 * vkms_primary_plane_update()
>>>>    		 */
>>>> -		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
>>>> -			drm_framebuffer_put(&vkms_state->frame_info->fb);
>>>> +		if (drm_framebuffer_read_refcount(vkms_state->frame_info->fb))
>>>> +			drm_framebuffer_put(vkms_state->frame_info->fb);
>>>>    	}
>>>>    
>>>>    	kfree(vkms_state->frame_info);
>>>> @@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>>>    	frame_info = vkms_plane_state->frame_info;
>>>>    	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>>>>    	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
>>>> -	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
>>>> +	frame_info->fb = fb;
>>>
>>> This change, replacing the memcpy with storing a pointer, seems to be
>>> another major point of this patch. Should it be a separate patch?
>>> It doesn't seem to fit with the current commit message.
>>>
>>> I have no idea what kind of locking or referencing a drm_framebuffer
>>> would need, and I suspect that would be easier to review if it was a
>>> patch of its own.
>>
>> Makes sense. I will do that.
>>
>>>    
>>>>    	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>>>> -	drm_framebuffer_get(&frame_info->fb);
>>>> +	drm_framebuffer_get(frame_info->fb);
>>>
>>> Does drm_framebuffer_get() not return anything?
>>
>> No, it doesn't actually. This function increments the ref count of this
>> struct and doesn't return anything.
> 
> D'oh. Oh well.
> 
> 
> Thanks,
> pq
> 
>>>
>>> To me it would be more idiomatic to write something like
>>>
>>> 	frame_info->fb = drm_framebuffer_get(fb);
>>> I spend few minutes trying to find a case but nothing comes to my mind.
>>> I don't know if that pattern is used in the kernel, but I use it in
>>> userspace to emphasise that frame_info owns a new reference rather than
>>> borrowing someone else's.
>>>
>>>
>>> Thanks,
>>> pq
