Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC567644ACE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D9A10E33A;
	Tue,  6 Dec 2022 18:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E98910E154;
 Tue,  6 Dec 2022 18:06:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c17so12880568edj.13;
 Tue, 06 Dec 2022 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wf9TKHmUMfhB+OhkkG73OEB/1Zjo1Hddg4uRxMTxQlk=;
 b=cEdh3qRuEIVKDEbyM0VpwNjZv/e0k4NIzgZCwX1UYCKL4MAF3XCdID0mZylveyd+ql
 fk3xXCWdfWcAKUWbja6FVJ0FG98y/z8cug0e+fSpXkeByFZcliS4wEVHHPBRV30zWaRD
 h5r2d20PVjdW7oc20/bk3UerZRNcb0d7oEWUzIUfRWZ4cTWQjvLk68YvRECQVeiFLf/5
 m/d8mcoBaaCT5lRRD2UAk02kYsNejqy3Rwwpr8UABUfptMCEN3KUW/FeYN51qPOtetut
 ojTCU6LvJRfLrJiCc7sPtmCkgDgQQtBDrFcdgzWCKqXoq2bCCTauT9NScoMK07JrHKxA
 NjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wf9TKHmUMfhB+OhkkG73OEB/1Zjo1Hddg4uRxMTxQlk=;
 b=Xc+5wJAR0xwraIhy4KMUdKkBQ4DYKZ4RB581OfQm4Q8Cmx/5Ehf5oXqLSzK/KmI0vt
 2eoYiuCB0LUDY01MhXchdAckcfXr2ne/3rYH4mHKC7sofGKulTMNDjYgAsa/tSgI/a7G
 XlNfFDypDCyHpJOSFLV1DjdcAIXUcUadl7qxKRWeVZNst6OLrwbVWV+NoHV7ardEBVSc
 mDnutGobgYiOdqfjkLHTEgqe70GI0zIsRuwtT0uuy/hgwMrZ4fuDs1DOF6Jw61/iHg1a
 7Od41wRNswgU0j2mdHqAmW7MSS/wdcXAIjIv5C2oiSJnG4fLqVkJBrEKO0hN1+ArKcgx
 Q9uA==
X-Gm-Message-State: ANoB5pmVDDDNlOtCigxxXi3ysoJpe9Ndc+P1d2G4g1jVx0qbORkXx9+M
 OA+ZpM2d+IF0sxUYgP4Jbynr1u3Ag/A=
X-Google-Smtp-Source: AA0mqf5VZnreFhgXk0CHe46yVrh68ORy1MVRbmXAB4r3FrOqwu9/c7gcNBc5zaXrJMhN2114vsNIGg==
X-Received: by 2002:aa7:d0cc:0:b0:469:d36e:3213 with SMTP id
 u12-20020aa7d0cc000000b00469d36e3213mr28232879edo.206.1670349984552; 
 Tue, 06 Dec 2022 10:06:24 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:f31f:ea10:880e:c031?
 ([2a02:908:1256:79a0:f31f:ea10:880e:c031])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05640200c300b00461cdda400esm1272819edu.4.2022.12.06.10.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 10:06:24 -0800 (PST)
Message-ID: <c4e6e55f-183e-5280-635a-bf79ad52e4ee@gmail.com>
Date: Tue, 6 Dec 2022 19:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
 <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
 <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
 <4514ca57-e39e-d684-3101-fddf57b0c89a@gmail.com>
 <d56a0149-2913-8b78-de91-f633ae664a7a@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d56a0149-2913-8b78-de91-f633ae664a7a@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.12.22 um 19:03 schrieb Matthew Auld:
> On 05/12/2022 19:58, Christian König wrote:
>> Am 30.11.22 um 15:06 schrieb Daniel Vetter:
>>> On Wed, 30 Nov 2022 at 14:03, Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 29/11/2022 18:05, Matthew Auld wrote:
>>>>> On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>
>>>>>> + Matt
>>>>>>
>>>>>> On 25/11/2022 10:21, Christian König wrote:
>>>>>>> TTM is just wrapping core DMA functionality here, remove the 
>>>>>>> mid-layer.
>>>>>>> No functional change.
>>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>>>>>>>     1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> index 5247d88b3c13..d409a77449a3 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct 
>>>>>>> drm_i915_gem_object *obj,
>>>>>>>     static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>>>>>>>     {
>>>>>>>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>>>>>> -     int err;
>>>>>>> +     long err;
>>>>>>>
>>>>>>>         WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>>>>>>>
>>>>>>> -     err = ttm_bo_wait(bo, true, false);
>>>>>>> -     if (err)
>>>>>>> +     err = dma_resv_wait_timeout(bo->base.resv, 
>>>>>>> DMA_RESV_USAGE_BOOKKEEP,
>>>>>>> +                                 true, 15 * HZ);
>>>>>> This 15 second stuck out a bit for me and then on a slightly 
>>>>>> deeper look
>>>>>> it seems this timeout will "leak" into a few of i915 code paths. 
>>>>>> If we
>>>>>> look at the difference between the legacy shmem and ttm backend I 
>>>>>> am not
>>>>>> sure if the legacy one is blocking or not - but if it can block I 
>>>>>> don't
>>>>>> think it would have an arbitrary timeout like this. Matt your 
>>>>>> thoughts?
>>>>> Not sure what is meant by leak here, but the legacy shmem must also
>>>>> wait/block when unbinding each VMA, before calling truncate. It's the
>>>> By "leak" I meant if 15s timeout propagates into some code paths 
>>>> visible
>>>> from userspace which with a legacy backend instead have an indefinite
>>>> wait. If we have that it's probably not very good to have this
>>>> inconsistency, or to apply an arbitrary timeout to those path to 
>>>> start with.
>>>>
>>>>> same story for the ttm backend, except slightly more complicated in
>>>>> that there might be no currently bound VMA, and yet the GPU could
>>>>> still be accessing the pages due to async unbinds, kernel moves etc,
>>>>> which the wait here (and in i915_ttm_shrink) is meant to protect
>>>>> against. If the wait times out it should just fail gracefully. I 
>>>>> guess
>>>>> we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
>>>>> matters though.
>>>> Right, depends if it can leak or not to userspace and diverge between
>>>> backends.
>>> Generally lock_timeout() is a design bug. It's either
>>> lock_interruptible (or maybe lock_killable) or try_lock, but
>>> lock_timeout is just duct-tape. I haven't dug in to figure out what
>>> should be here, but it smells fishy.
>>
>> Independent of this discussion could I get an rb for removing 
>> ttm_bo_wait() from i915?
>>
>> Exactly hiding this timeout inside TTM is what always made me quite 
>> nervous here.
>
> There are also a few places in i915 calling bo_wait_ctx(), which 
> appears to just wrap ttm_bo_wait(). I guess that should also be 
> converted to dma_resv_wait_timeout()? Or what is the story with that?

If you don't want the ctx timeout then yes, calling 
dma_resv_wait_timeout() instead is the right approach.

>
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks, going to push this through drm-misc-next.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>

