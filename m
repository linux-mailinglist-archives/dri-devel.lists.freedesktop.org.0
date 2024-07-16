Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D4932985
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3510E75A;
	Tue, 16 Jul 2024 14:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZB8FfcNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825E110E75A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721141125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0PzNj5uFiDGG9fqPOs+yvlX/x5C4rqAeGRn1Y5FqwY=;
 b=ZB8FfcNyKdP8ZzLKStiZutNxP3fqf7tJjMYMZ5tHtpajbtXWAFIgP/l82PGhmgBxJWc6Ie
 ddrX7oPoihP0XBq+/WHXkbdAbWQ73kuYbE0TIToTaHLQX2qSPSpbkRJWfOSLHpaIl2PVva
 lLT42fIlrQ4YYz117CdHo98Jlm/pVxo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-a2-VZyz0Pz2GfgFp5zXWUg-1; Tue, 16 Jul 2024 10:45:24 -0400
X-MC-Unique: a2-VZyz0Pz2GfgFp5zXWUg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ee9308bc8cso58227681fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 07:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141122; x=1721745922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z0PzNj5uFiDGG9fqPOs+yvlX/x5C4rqAeGRn1Y5FqwY=;
 b=HUjM5l5g3KOInNe1aaKEokEtA5vqAZLhJ4/m1Es85eZk6pj1QaWJR6j1U3okzDxUcf
 1o4MoZKXkbaUP1zRyddPzdkCQHL9n43yRi7vzFt5flPFo1MfcrcX6QUDOWtdqpSLlgSV
 pXS2QDTc2Zb+nWifwm0AUjuGkYWT32wPLhGC+WpYWY+KAfY6K/DREMnq10vySrFLxDUI
 wSGSDGWWTKFrinBb3FJO8l4yDzOk1jxGUxsikIjLaDF9713Rw86pNZaffqQNlhlAQ48d
 IGRuu0OsizkMqXHisFeSTX8R4heHwriHGktFQklUCHfLTPovrwh2HBaJgAh029RJGbI9
 IYsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTpj5sAw0QuxB1r3CdEmhPxawp/fApBib/9wnWqOpr1ektEvrQ76Q3dBgORWRaS7JF4ydxZnSt+QrpMr9AygfWnFfcug0Z56HWsxOimZtb
X-Gm-Message-State: AOJu0YzngXpeGZYFZtJXxiEHTljwTxFHejWXgDwx1vVzpuOdwXwUwBbb
 TCNxva054aIFayk+DyaFxx2HNetoDhkaDSPImuEhpQHOHbmFA9ZVlm5XU0qf1s29ep62A/Os4EW
 VPbTsyPTCE1U9HDjs9wz49L9Vl8y2hNPWoa5jD+DCvJnt0dRQROcOVIHdCcZ2BCeG
X-Received: by 2002:a05:6512:12d2:b0:52e:9f17:8418 with SMTP id
 2adb3069b0e04-52edef1076dmr1643629e87.12.1721141122535; 
 Tue, 16 Jul 2024 07:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXl5d/TUcF8w2QZEtRfVQqpXpss6PCOkJNhnBXjj4zR/8sBfnfqEzg+k/S4N2crKpUtdHb5w==
X-Received: by 2002:a05:6512:12d2:b0:52e:9f17:8418 with SMTP id
 2adb3069b0e04-52edef1076dmr1643607e87.12.1721141122010; 
 Tue, 16 Jul 2024 07:45:22 -0700 (PDT)
Received: from [192.168.1.27] (host-82-62-247-97.business.telecomitalia.it.
 [82.62.247.97]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f239883sm166140085e9.10.2024.07.16.07.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:45:21 -0700 (PDT)
Message-ID: <6ded1ffe-d589-4333-8a82-68359fb80812@redhat.com>
Date: Tue, 16 Jul 2024 16:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH] drm/test: fix the gem shmem test to map the sg table.
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240715083551.777807-1-airlied@gmail.com>
 <IA1PR11MB6418165B122159BCF7E37CBFC1A12@IA1PR11MB6418.namprd11.prod.outlook.com>
 <ZpY-gzNHgJXhrcwx@phenom.ffwll.local>
 <IA1PR11MB641851E1818CA9716761286FC1A22@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <IA1PR11MB641851E1818CA9716761286FC1A22@IA1PR11MB6418.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-07-16 14:07, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Sent: Tuesday, July 16, 2024 5:34 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Cc: Dave Airlie <airlied@gmail.com>; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/test: fix the gem shmem test to map the sg table.
>>
>> On Mon, Jul 15, 2024 at 04:07:57PM +0000, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Dave
>>>> Airlie
>>>> Sent: Monday, July 15, 2024 4:36 AM
>>>> To: dri-devel@lists.freedesktop.org
>>>> Subject: [PATCH] drm/test: fix the gem shmem test to map the sg table.
>>>>
>>>> From: Dave Airlie <airlied@redhat.com>
>>>>
>>>> The test here creates an sg table, but never maps it, when
>>>> we get to drm_gem_shmem_free, the helper tries to unmap and this
>>>> causes warnings on some platforms and debug kernels.
>>>
>>> This looks pretty straightforward...
>>>
>>> However, should drm_gem_shmem_free() really give an error if the mapping
>>> didn't happen?
>>>
>>> I.e. just because you have an sgt pointer, should you also have a mapping?
>>
>> Yes, I think only allocating an sgt but not setting it up is a bug. So the
>> fix looks correct, and isn't just papering over noise.
> 
> I guess my concern here is that the mapping could fail. 
> 
> If that happens, what is the error path?
> 
> Can I call _shmem_free?

In this case, if the mapping fails, the test case will be aborted, and the
sg_table will be freed by the action that calls sg_free_table_wrapper().
However, I also think drm_gem_shmem_free() should behave well even if the
sg_table is not mapped. Is there any advantage in issuing a warning when
freeing the object if the sg_table is not mapped?

Reviewed-by: Marco Pagani <marpagan@redhat.com>

Thanks,
Marco

> 
> Mike
> 
>>> If the errors are really just noise (form the specific platforms), and this patch is
>> covering
>>> for that, then:
>>>
>>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Cheers, Sima
>>>
>>> Thanks,
>>>
>>> Mike
>>>
>>>> This also sets a 64-bit dma mask, as I see an swiotlb warning if I
>>>> stick with the default 32-bit one.
>>>>
>>>> Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by
>>>> shmem")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>> ---
>>>> drivers/gpu/drm/tests/drm_gem_shmem_test.c | 11 +++++++++++
>>>> 1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>>>> b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>>>> index 91202e40cde9..eb3a7a84be90 100644
>>>> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>>>> @@ -102,6 +102,17 @@ static void
>>>> drm_gem_shmem_test_obj_create_private(struct kunit *test)
>>>>
>>>> 	sg_init_one(sgt->sgl, buf, TEST_SIZE);
>>>>
>>>> +	/*
>>>> +	 * Set the DMA mask to 64-bits and map the sgtables
>>>> +	 * otherwise drm_gem_shmem_free will cause a warning
>>>> +	 * on debug kernels.
>>>> +	 * */
>>>> +	ret = dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
>>>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>>>> +
>>>> +	ret = dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>>>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>>>> +
>>>> 	/* Init a mock DMA-BUF */
>>>> 	buf_mock.size = TEST_SIZE;
>>>> 	attach_mock.dmabuf = &buf_mock;
>>>> --
>>>> 2.45.0
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> 

