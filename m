Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D174DEDE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 22:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1510E2D2;
	Mon, 10 Jul 2023 20:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C7610E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 20:11:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso5871904e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689019894; x=1691611894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=63YPDYqKVHA/21Ij1dK8gns5R7NZnbig472At5QRpgU=;
 b=E5N+9eb9VAzhgj2ZYKsctyy6Vz8TFAO+5Sz2nNRXr/jOJR8EGjAA8CAuyBWebysnr6
 pR2zgH426vzjVnzzTZChr+PWfniXXxaJbCZDz2PsQguwuGvjkT0dxU2XbuZXVJzwL3bC
 oAy66hFGaoIJYmkk3B4p2jbNwXgq5Llhb2cm7xDGmuLQH9103Zm+/fWvi8G5vg/yfQOW
 oH7zdYIw27C+WuYzhAIXKAEObGhnGIraP7Zdv/BGuZGz2CNvT6Eg8FQesDKAACVFVnfN
 mZo/a/iiYgXT+EdC6PFqlYwVx8WL4WCJFkz7rUaoyXeAB3o/hd/nY8wF3qfPyHTQdFrE
 eDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689019894; x=1691611894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63YPDYqKVHA/21Ij1dK8gns5R7NZnbig472At5QRpgU=;
 b=B1R+Gg/zybHr9HdB3vKS1ItHKXOODRBeXE6togIuZT9tgucvkYd6llekVdJ2rRQxLl
 IuOzm2BH/rBmD/b3Y5O6bm3WfZMsqO3koy49ANqYCuZEcug9vVE9NtNu55OnSDLAfXlB
 7+Sm/++vgijxJhnp9K5SsP8ELyIy8+ORxtuQ3BIzwmV/nwDYzfYhK6jJO92wovhk2DWw
 2swSw01ioGlmtvNe4e+rWwUoVhflZmHLfU/LHF29xFdqoBrYXGUrdSYLnVZmUsLae/98
 kHNdhEqy4IHyMxcQ0fqKtDKwYSLPsy+1hUjgACKz8PGL+33CfY2Ve1uVPgaMe4defqEI
 /8vA==
X-Gm-Message-State: ABy/qLZpFuPtPeGq2Er2hHSDYduigtPiV8GA4VlhQgt3eCITihPCPTkb
 jia13gJ3lmJQOvjHSVDrHC28Dw==
X-Google-Smtp-Source: APBJJlFLoMG2x7TKa+tE+UsW2e9G6ohcfl0sTmI2Gsdp4Rb+BaoHJaomgBaKIJKM+eosP5hLuRQvjw==
X-Received: by 2002:a05:6512:6c5:b0:4f8:7041:e46a with SMTP id
 u5-20020a05651206c500b004f87041e46amr6288046lff.18.1689019893816; 
 Mon, 10 Jul 2023 13:11:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u13-20020ac2518d000000b004fbb1f70ceesm32513lfi.227.2023.07.10.13.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 13:11:33 -0700 (PDT)
Message-ID: <e17db728-d91b-a2b3-08a9-1dd1fde9c727@linaro.org>
Date: Mon, 10 Jul 2023 23:11:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
 <20230630112708.4d3a08a7@eldfell>
 <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2023 22:51, Jessica Zhang wrote:
> 
> 
> On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
>> On Fri, 30 Jun 2023 03:42:28 +0300
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>
>>> On 30/06/2023 03:25, Jessica Zhang wrote:
>>>> Add support for pixel_source property to drm_plane and related
>>>> documentation.
>>>>
>>>> This enum property will allow user to specify a pixel source for the
>>>> plane. Possible pixel sources will be defined in the
>>>> drm_plane_pixel_source enum.
>>>>
>>>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
>>>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
>>>
>>> I think, this should come before the solid fill property addition. First
>>> you tell that there is a possibility to define other pixel sources, then
>>> additional sources are defined.
>>
>> Hi,
>>
>> that would be logical indeed.
> 
> Hi Dmitry and Pekka,
> 
> Sorry for the delay in response, was out of office last week.
> 
> Acked.
> 
>>
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>>>    drivers/gpu/drm/drm_blend.c               | 81 
>>>> +++++++++++++++++++++++++++++++
>>>>    include/drm/drm_blend.h                   |  2 +
>>>>    include/drm/drm_plane.h                   | 21 ++++++++
>>>>    5 files changed, 109 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c 
>>>> b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> index fe14be2bd2b2..86fb876efbe6 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> @@ -252,6 +252,7 @@ void 
>>>> __drm_atomic_helper_plane_state_reset(struct drm_plane_state 
>>>> *plane_state,
>>>>        plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>> +    plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
>>>>        if (plane_state->solid_fill_blob) {
>>>>            drm_property_blob_put(plane_state->solid_fill_blob);
>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>>>> b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> index a28b4ee79444..6e59c21af66b 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct 
>>>> drm_plane *plane,
>>>>            drm_property_blob_put(solid_fill);
>>>>            return ret;
>>>> +    } else if (property == plane->pixel_source_property) {
>>>> +        state->pixel_source = val;
>>>>        } else if (property == plane->alpha_property) {
>>>>            state->alpha = val;
>>>>        } else if (property == plane->blend_mode_property) {
>>>
>>> I think, it was pointed out in the discussion that drm_mode_setplane()
>>> (a pre-atomic IOCTL to turn the plane on and off) should also reset
>>> pixel_source to FB.
> 
> I don't remember drm_mode_setplane() being mentioned in the pixel_source 
> discussion... can you share where it was mentioned?

https://lore.kernel.org/dri-devel/20230627105849.004050b3@eldfell/

Let me quote it here:
"Legacy non-atomic UAPI wrappers can do whatever they want, and program
any (new) properties they want in order to implement the legacy
expectations, so that does not seem to be a problem."


> 
> I'd prefer to avoid having driver change the pixel_source directly as it 
> could cause some unexpected side effects. In general, I would like 
> userspace to assign the value of pixel_source without driver doing 
> anything "under the hood".

s/driver/drm core/

We have to remain compatible with old userspace, especially with the 
non-atomic one. If the userspace calls ioctl(DRM_IOCTL_MODE_SETPLANE), 
we have to display the specified FB, no matter what was the value of 
PIXEL_SOURCE before this ioctl.


> 
>>>
>>>> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane 
>>>> *plane,
>>>>        } else if (property == plane->solid_fill_property) {
>>>>            *val = state->solid_fill_blob ?
>>>>                state->solid_fill_blob->base.id : 0;
>>>> +    } else if (property == plane->pixel_source_property) {
>>>> +        *val = state->pixel_source;
>>>>        } else if (property == plane->alpha_property) {
>>>>            *val = state->alpha;
>>>>        } else if (property == plane->blend_mode_property) {
>>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>>> index 38c3c5d6453a..8c100a957ee2 100644
>>>> --- a/drivers/gpu/drm/drm_blend.c
>>>> +++ b/drivers/gpu/drm/drm_blend.c
>>>> @@ -189,6 +189,18 @@
>>>>     *    solid_fill is set up with 
>>>> drm_plane_create_solid_fill_property(). It
>>>>     *    contains pixel data that drivers can use to fill a plane.
>>>>     *
>>>> + * pixel_source:
>>>> + *    pixel_source is set up with 
>>>> drm_plane_create_pixel_source_property().
>>>> + *    It is used to toggle the source of pixel data for the plane.
>>
>> Other sources than the selected one are ignored?
> 
> Yep, the plane will only display the data from the set pixel_source.
> 
> So if pixel_source == FB and solid_fill_blob is non-NULL, 
> solid_fill_blob will be ignored and the plane will display the FB that 
> is set.

correct.

> 
> Will add a note about this in the comment docs.
> 
>>
>>>> + *
>>>> + *    Possible values:
>>
>> Wouldn't hurt to explicitly mention here that this is an enum.
> 
> Acked.
> 
>>
>>>> + *
>>>> + *    "FB":
>>>> + *        Framebuffer source
>>>> + *
>>>> + *    "COLOR":
>>>> + *        solid_fill source
>>
>> I think these two should be more explicit. Framebuffer source is the
>> usual source from the property "FB_ID". Solid fill source comes from
>> the property "solid_fill".
> 
> Acked.
> 
>>
>> Why "COLOR" and not, say, "SOLID_FILL"?
> 
> Ah, that would make more sense :)
> 
> I'll change this to "SOLID_FILL".
> 
>>
>>>> + *
>>>>     * Note that all the property extensions described here apply 
>>>> either to the
>>>>     * plane or the CRTC (e.g. for the background color, which 
>>>> currently is not
>>>>     * exposed and assumed to be black).
>>>> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct 
>>>> drm_plane *plane)
>>>>        return 0;
>>>>    }
>>>>    EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>>> +
>>>> +/**
>>>> + * drm_plane_create_pixel_source_property - create a new pixel 
>>>> source property
>>>> + * @plane: drm plane
>>>> + * @supported_sources: bitmask of supported pixel_sources for the 
>>>> driver (NOT
>>>> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it 
>>>> will be supported
>>>> + *                     by default).
>>>
>>> I'd say this is too strong. I'd suggest either renaming this to
>>> extra_sources (mentioning that FB is enabled for all the planes) or
>>> allowing any source bitmask (mentioning that FB should be enabled by the
>>> caller, unless there is a good reason not to do so).
>>
>> Right. I don't see any problem with having planes of type OVERLAY that
>> support only solid_fill and no FB. Planes of type PRIMARY and CURSOR I
>> would expect to always support at least FB.
>>
>> Atomic userspace is prepared to have an OVERLAY plane fail for any
>> arbitrary reason. Legacy userspace probably should not ever see a plane
>> that does not support FB.
> 
> Got it... If we allow the possibility of FB sources not being supported, 
> then should the default pixel_source per plane be decided by the driver 
> too?
> 
> I'd forced FB support so that I could set pixel_source to FB in 
> __drm_atomic_helper_plane_state_reset(). If we allow more flexibility in 
> the default pixel_source value, I guess we can also store a 
> default_pixel_source value in the plane_state.

I'd say, the FB is a sane default. It the driver has other needs, it can 
override the value in drm_plane_funcs::reset().

> 

[skipped the rest]

-- 
With best wishes
Dmitry

