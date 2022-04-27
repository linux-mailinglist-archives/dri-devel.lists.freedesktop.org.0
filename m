Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7F510D59
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 02:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAAE10E1C8;
	Wed, 27 Apr 2022 00:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10A10E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 00:43:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y63so444810oia.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pechlllLCuCYy+krSKurYBTrvgktEGtq+sFGJWS70NU=;
 b=nivCaHwLU6rnHqbOcIZFKsxl9ylNh1z7e5cIVNyNikXLuLuXF068rBtTPd4fBcCajI
 k8tyBhlWHdjcAq3NufaFl6QqV1OJdwdtvhi/1hu8yPTJuzRD5VM9vR/FFaT/b+uIFKrK
 goW+7w/fw/1wjcwTbu9Wzq1Rh0TKcXCf/5G7ymOClz/SghYbfSbDHcROrGNySLcLHqY6
 DhQz9s1O5E5+4VtC41I/QcLdB2qmzeROn4tXax7ze3/zLBnSce8wofRvDsWrDKtc7iMO
 n3b6jJ+K/wXRzmWH8P6zgRUXVNufCJrujR2LySH2OSdrgUBe9uQSXiI5PkZJKsNnLNns
 mWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pechlllLCuCYy+krSKurYBTrvgktEGtq+sFGJWS70NU=;
 b=MpuP4//RXBJwELYyuhOoB5opw5xGnNqN8CdSlQX5Rs2kSTMrMrkBR6VcZ6NiK/VP97
 /imLlzrVdabWe3vBEG9iYQyOlptEX1IE1TSu8ESlRI2U6vYRLdOiICrmSzX5++FE5a2b
 GgQ67CpVlbFnJ1d1E1e9Z5Etmy0FEf/CBOVCSzJavX2W2y+YauZWtAJJwvxhk9UCVmDI
 t5uSlyHk/iZw273wWxoZw5xyeV/M48dLuKP3DxQwg5nHksaP0BlfqOgTwayx500MopZs
 5gDsffJFaR/WULSyuG1CIPhzJOGxeo4XObRl73iEM1+rYjk0AT2Hmvhvr6FjGcLsjEQt
 AMtA==
X-Gm-Message-State: AOAM5337okMYXHCNQ0QGds3yJBYmo3A4EzSbaIbZ5aQWYWPDyvadAv81
 A8ycBND0qtZJWq2SedEX4vU=
X-Google-Smtp-Source: ABdhPJzynQdgNmHp2Nv8VR2lkmhTXUbg9wEAGQqo0giDkugJaPysqcVITTw6kdQ9xBQekH6gUD8c/Q==
X-Received: by 2002:a05:6808:1412:b0:322:9587:eca9 with SMTP id
 w18-20020a056808141200b003229587eca9mr11670856oiv.220.1651020197175; 
 Tue, 26 Apr 2022 17:43:17 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48?
 ([2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056830410800b00605b48122eesm2699211ott.14.2022.04.26.17.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:43:16 -0700 (PDT)
Message-ID: <efaba095-498a-f03d-bab9-e2284b65dd59@gmail.com>
Date: Tue, 26 Apr 2022 21:43:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
 <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
 <20220425105602.151885fd@eldfell>
 <e246264d-c072-e36d-efd3-20a9a6491e20@gmail.com>
 <20220426100911.673c985e@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220426100911.673c985e@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/22 04:09, Pekka Paalanen wrote:
> On Mon, 25 Apr 2022 21:56:12 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Pekka,
>>
>> On 4/25/22 04:56, Pekka Paalanen wrote:
>>> On Sat, 23 Apr 2022 12:12:51 -0300
>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>    
>>>> Hi Pekka,
>>>>
>>>> On 4/20/22 08:23, Pekka Paalanen wrote:
>>>>> On Mon,  4 Apr 2022 17:45:11 -0300
>>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>>>       
>>>>>> This commit is the groundwork to introduce new formats to the planes and
>>>>>> writeback buffer. As part of it, a new buffer metadata field is added to
>>>>>> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
>>>>>> struct.
>>>>>
>>>>> Hi,
>>>>>
>>>>> should this be talking about vkms_frame_info struct instead?
>>>>
>>>> Yes it should. I will fix this. Thanks.
>>>>   
>>>>>       
>>>>>>
>>>>>> Also adds two new function pointers (`{wb,plane}_format_transform_func`)
>>>>>> are defined to handle format conversion to/from internal format.
>>>>>>
>>>>>> These things will allow us, in the future, to have different compositing
>>>>>> and wb format types.
>>>>>>
>>>>>> V2: Change the code to get the drm_framebuffer reference and not copy its
>>>>>>        contents(Thomas Zimmermann).
>>>>>> V3: Drop the refcount in the wb code(Thomas Zimmermann).
>>>>>> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
>>>>>>        and vkms_plane_state (Pekka Paalanen)
>>>>>>
>>>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>>>>>>     drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++------
>>>>>>     drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
>>>>>>     drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
>>>>>>     4 files changed, 49 insertions(+), 16 deletions(-)
> 
> ...
> 
>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>>>>>> index 2e6342164bef..2704cfb6904b 100644
>>>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> 
> ...
> 
>>>>>> +
>>>>>> +struct vkms_writeback_job {
>>>>>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>>>>>> +	struct vkms_frame_info frame_info;
>>>>>
>>>>> Which frame_info is this? Should the field be called wb_frame_info?
>>>>
>>>> Considering it's already in the writeback_job struct do you think this
>>>> necessary?
>>>
>>> This struct has 'data' too, and that is not the wb buffer, right?
>>
>> AFAIU, no. Each plane has its own `iosys_map map[]`.
>>
>>>
>>> Hmm, if it's not the wb buffer, then using DRM_FORMAT_MAX_PLANES is
>>> odd...
>>
>> Yeah. I honestly don't have any clue why we have an array of `iosys_map`
>> for each plane, why we only use the map[0] and why we only call
>> `iosys_map_is_null` only to the `primary_composer`.
>>
>> Maybe @tzimmermann or @rodrigosiqueiramelo can shed some light on these
>> questions.
> 
> Yeah, those questions would be really good to figure out.
> 
> FWIW, I can tell you this: "plane" has two different meanings in the
> context of KMS:
> 
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/glossary.md#plane
> 
> DRM_FORMAT_MAX_PLANES refers to the number of planes (or the number of
> memory buffers) for a single image (single framebuffer). Most often
> with RGB there is just one plane in one memory buffer. RGB buffer could
> be accompanied with e.g. a compression data buffer, so two planes,
> one buffer each. Different YUV formats have different numbers of planes
> from N=1 to 3, and those plane may be stored in 1 to N memory buffers
> (with dmabuf handles pointing to them).
> 
> The number of planes and the number of memory buffers are often
> conflated in APIs by just passing the same memory buffer multiple times
> when multiple planes are stored in the same buffer (with different
> offset).
> 
> The number of planes is determined by the pixel format and the format
> modifier. The number of memory buffers is more... vaguely defined and
> may vary sometimes.

Right. So probably this answers the first two questions. And also
probably my initial implementation of YUV420 and NV12 is wrong.

> 
>>
>>>    
>>>> In other words, what kind of misudertanding do you think can happen if
>>>> this variable stay without the `wb_` prefix?
>>>>
>>>> I spent a few minutes trying to find a case, but nothing came to my
>>>> mind.
>>>
>>> My question above is the confusion.
>>>
>>> If all these members are about the wb destination buffer only, then
>>> where do the inputs come from and how are they reference-counted to
>>> make sure they are available when needed?
>>
>> Ok. Got it.
> 
> 
> Thanks,
> pq
