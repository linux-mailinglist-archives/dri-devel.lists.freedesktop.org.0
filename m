Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723F537A06
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 13:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB0A10E12C;
	Mon, 30 May 2022 11:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327B10E12C;
 Mon, 30 May 2022 11:41:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b8so5187446edf.11;
 Mon, 30 May 2022 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ILky4x2UJPZH5Lm2jickms8pvEelH8wZSzWQluGlzq4=;
 b=NIpxa2AUPNck6/M3ZOEaDbMgRlpJB+URIeWJWSeyXfUFkBhb7JlWyReev2GnmxciOZ
 /sauXQ14NW3XgVIn5xGLvtM4Xdt/bxyWpAFpmhicYdBYiIR0oE2hEYYphr8sewi9j/rt
 MNWc+XucYHSI0e15bVhOSE6wk2UHEFQvASt8mIJwWD4hHACz7s9h018Rbz6dXynw00qq
 vKaN6bIPxAzosdtLP9pikZ/0xGtnIQlhuoBDJaWgkl+D5ZXUfK5VUk/vpnsCsw787B++
 OnFjFMo34ZEl3eVnaL/hRMOLe2wCU0xTd3pJulG1jrQOPeayifFksK0ETaGnVJtOM2gS
 C6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ILky4x2UJPZH5Lm2jickms8pvEelH8wZSzWQluGlzq4=;
 b=RPySX+893KyEvRLfW8w4IE3zKpuaFV9Rcf4g3PIfrb7/uplTEmSoRY0Z+4NXXNmQoz
 PPTz2v0DZfIBE6G+L5UQdr2d5JiGwEZqlPAegsC12ag1K/psRQ7IyxSRvZe5X7noK8yE
 6yMHcExWj1TkQjnYZUi5s7qbBWT4nvyHQ8xJgNUSPCYrLO9H7HCU3AR5H0iNV1knikDn
 k/ZExkKvXxzSIee9MPH7SHbjpm8i8xlhd38O54Wc+ItfZTf88Tms//mqNq6ueKMXaKM/
 J46jiutAa6BE7kj5SWH4UfQCGEg6Zik/nq/w+IODbdcTqgY+pTgslaxMd8hNm/DOtHbi
 GuLQ==
X-Gm-Message-State: AOAM530pMBGBGBBVFSemkcrokfGa2SLkLqm2+wOZKvIJwhZ0DtqwMYQH
 NHM8ua01djANP+UMOlkEz44=
X-Google-Smtp-Source: ABdhPJwyaLNcqVDRilhQa5riMRfP2udbGvsP2NLILFAOjll23Vazl+AyNGuSS3ZS5zb0uzheG5Kmbg==
X-Received: by 2002:a05:6402:847:b0:42d:91ed:82f3 with SMTP id
 b7-20020a056402084700b0042d91ed82f3mr12517295edz.416.1653910859699; 
 Mon, 30 May 2022 04:40:59 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea17a.dip0.t-ipconnect.de.
 [91.14.161.122]) by smtp.gmail.com with ESMTPSA id
 cd26-20020a170906b35a00b006fee526ed72sm3928439ejb.217.2022.05.30.04.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 04:40:59 -0700 (PDT)
Message-ID: <d363c177-c874-f7c7-1d53-c0a2ea9510a7@gmail.com>
Date: Mon, 30 May 2022 13:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
 <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
 <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
 <20220525215933.m4yhm3b653gt4knp@ldmartin-desk2>
 <b54b2cc7-f511-e6ce-72fa-da5c8cd5e7b4@gmail.com>
 <442b3a43-2b8b-e9be-6ee4-b4b2357c8cf0@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <442b3a43-2b8b-e9be-6ee4-b4b2357c8cf0@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.05.22 um 12:09 schrieb Lionel Landwerlin:
> On 30/05/2022 12:52, Christian König wrote:
>> Am 25.05.22 um 23:59 schrieb Lucas De Marchi:
>>> On Wed, May 25, 2022 at 12:38:51PM +0200, Christian König wrote:
>>>> Am 25.05.22 um 11:35 schrieb Lionel Landwerlin:
>>>>> [SNIP]
>>>>>
>>>>> Err... Let's double check with my colleagues.
>>>>>
>>>>> It seems we're running into a test failure in IGT with this patch, 
>>>>> but now I have doubts that it's where the problem lies.
>>>>
>>>> Yeah, exactly that's what I couldn't understand as well.
>>>>
>>>> What you describe above should still work fine.
>>>>
>>>> Thanks for taking a look into this,
>>>> Christian.
>>>
>>> With some additional prints:
>>>
>>> [  210.742634] Console: switching to colour dummy device 80x25
>>> [  210.742686] [IGT] syncobj_timeline: executing
>>> [  210.756988] [IGT] syncobj_timeline: starting subtest 
>>> transfer-timeline-point
>>> [  210.757364] [drm:drm_syncobj_transfer_ioctl] *ERROR* adding 
>>> fence0 signaled=1
>>> [  210.764543] [drm:drm_syncobj_transfer_ioctl] *ERROR* resulting 
>>> array fence signaled=0
>>> [  210.800469] [IGT] syncobj_timeline: exiting, ret=98
>>> [  210.825426] Console: switching to colour frame buffer device 240x67
>>>
>>>
>>> still learning this part of the code but AFAICS the problem is because
>>> when we are creating the array, the 'signaled' doesn't propagate to the
>>> array.
>>
>> Yeah, but that is intentionally. The array should only signal when 
>> requested.
>>
>> I still don't get what the test case here is checking.
>
>
> There must be something I don't know about fence arrays.
>
> You seem to say that creating an array of signaled fences will not 
> make the array signaled.

Exactly that, yes. The array delays it's signaling until somebody asks 
for it.

In other words the fences inside the array are check only after someone 
calls dma_fence_enable_sw_signaling() which in turn calls 
dma_fence_array_enable_signaling().

It is certainly possible that nobody does that in the drm_syncobj and 
because of this the array never signals.

Regards,
Christian.

>
>
> This is the situation with this IGT test.
>
> We started with a syncobj with point 1 & 2 signaled.
>
> We take point 2 and import it as a new point 3 on the same syncobj.
>
> We expect point 3 to be signaled as well and it's not.
>
>
> Thanks,
>
>
> -Lionel
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> dma_fence_array_create() {
>>>     ...
>>>     atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>>>     ...
>>> }
>>>
>>> This is not considering the fact that some of the fences could already
>>> have been signaled as is the case in the 
>>> igt@syncobj_timeline@transfer-timeline-point
>>> test. See 
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11693/shard-dg1-12/igt@syncobj_timeline@transfer-timeline-point.html
>>>
>>> Quick patch on this function fixes it for me:
>>>
>>> ---------8<----------------
>>> Subject: [PATCH] dma-buf: Honor already signaled fences on array 
>>> creation
>>>
>>> When creating an array, array->num_pending is marked with the number of
>>> fences. However the fences could alredy have been signaled. Propagate
>>> num_pending to the array by looking at each individual fence the array
>>> contains.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/dma-buf/dma-fence-array.c | 11 ++++++++++-
>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>> b/drivers/dma-buf/dma-fence-array.c
>>> index 5c8a7084577b..32f491c32fa0 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -158,6 +158,8 @@ struct dma_fence_array 
>>> *dma_fence_array_create(int num_fences,
>>>  {
>>>      struct dma_fence_array *array;
>>>      size_t size = sizeof(*array);
>>> +    unsigned num_pending = 0;
>>> +    struct dma_fence **f;
>>>
>>>      WARN_ON(!num_fences || !fences);
>>>
>>> @@ -173,7 +175,14 @@ struct dma_fence_array 
>>> *dma_fence_array_create(int num_fences,
>>>      init_irq_work(&array->work, irq_dma_fence_array_work);
>>>
>>>      array->num_fences = num_fences;
>>> -    atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>>> +
>>> +    for (f = fences; f < fences + num_fences; f++)
>>> +        num_pending += !dma_fence_is_signaled(*f);
>>> +
>>> +    if (signal_on_any)
>>> +        num_pending = !!num_pending;
>>> +
>>> +    atomic_set(&array->num_pending, num_pending);
>>>      array->fences = fences;
>>>
>>>      array->base.error = PENDING_ERROR;
>>
>

