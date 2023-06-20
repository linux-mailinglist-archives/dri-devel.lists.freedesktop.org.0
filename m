Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2A73676E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 11:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2BC10E293;
	Tue, 20 Jun 2023 09:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF8B10E293;
 Tue, 20 Jun 2023 09:14:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f9b4bf99c2so11651495e9.3; 
 Tue, 20 Jun 2023 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687252493; x=1689844493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rRGFfeXSo7TNj0IIOa1/K6NDHdvCUZ8QaqEZAsynC1s=;
 b=mYNhn7PjrFZb0xp+mvyZZktwm2ZSMRC9jYyquzPtq+y299ERD1C1hZYbE+VHcl3O09
 zRNmYFHKqC3GaFv2/cp3C3Fe6EoUTzpjegulaB5pg2rpxtq05x0l6C6s0XZxpKv2Aeh2
 o+BnIYmkQMdwTSVgXcaLOoRWD/B0efjA6g1hVufMToIh6MM8Aa5wjgr0+CUmMCNIMas8
 iYz/fgri3FNBpxOAEugF1MY2WFuM+R1taliLU76hfy6EVziMJ/hQO6LF2RU7qa/C4n3/
 CKsiQasXy133QVUZBfTU002L6BaiX1wOcWif40WiM1U8z+SqcpAqd4wPC10b6NEqi0HL
 m76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687252493; x=1689844493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rRGFfeXSo7TNj0IIOa1/K6NDHdvCUZ8QaqEZAsynC1s=;
 b=TG9Lq1uIvMWtCQa9eypTaKAR91yjmbCRF2YTjOFtle6dNpfmBCFVPfQhLYBt1fLvYv
 OvrKAOxUx1zGPqidnsveAlhtu86DgkDRO44C63tFBbt6cRhQFp3zDWOJJLpEdslT+FYT
 dqIQB6OJzSvLuJQo+uBE6AOaG3JhzMV3DLv59m1ldxCfbZ/bX0fwunPfpQ4BLNwB1pEJ
 nXJUcVwdMRcFBbwmg37V7f3Dloj2xonlLwt7zu5nDVfkehM+QSoqp0sHXIWMRkJx+36b
 n68HGjw9XqtMV04dbhlqZ+//02+LQqlA9HLkgmkz88czAAnTclpNbXc0LZ7B/LXqe6tA
 20rA==
X-Gm-Message-State: AC+VfDy/6AHllIiIBfhvsu+cr244h95ns9zG/AS/INss/W9wYBXEv3Yw
 c4R+FpEsP8Pm3BEFG3AwhOM=
X-Google-Smtp-Source: ACHHUZ4vg2Btcnur7pb21CC0pevFf6QOminLlPBDL6+kFvV4xEgQkIGvggJ9V4XmGnxrRsJvmHGbgQ==
X-Received: by 2002:a7b:c8da:0:b0:3f9:5f2:74ba with SMTP id
 f26-20020a7bc8da000000b003f905f274bamr6136930wml.30.1687252492912; 
 Tue, 20 Jun 2023 02:14:52 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154d:9c00:68d9:fc9c:8543:a6?
 ([2a00:e180:154d:9c00:68d9:fc9c:8543:a6])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a7bcb8c000000b003f7ea771b5dsm1870913wmi.1.2023.06.20.02.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 02:14:52 -0700 (PDT)
Message-ID: <01ad928e-a900-fc5e-901c-8fe2639d711a@gmail.com>
Date: Tue, 20 Jun 2023 11:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
 <20230620102817.6570f521@collabora.com>
 <ee7987a4-a9ad-e667-9ac5-c06b42cf36f1@gmail.com>
 <20230620110948.461e4359@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230620110948.461e4359@collabora.com>
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
Cc: matthew.brost@intel.com, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 11:09 schrieb Boris Brezillon:
> On Tue, 20 Jun 2023 10:44:26 +0200
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 20.06.23 um 10:28 schrieb Boris Brezillon:
>>> On Tue, 20 Jun 2023 10:12:13 +0200
>>> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>   
>>>>> I think Boris's suggestion of having this through a common
>>>>> DRM_EXEC_FLAG_ALLOW_DUPLICATES flag fits well.
>>>> No, again. The only driver which should accept duplicates is radeon, for
>>>> all other drivers especially new ones duplicates should probably be
>>>> rejected.
>>>>
>>>> We only allow this for radeon because it is already UAPI, could be that
>>>> we need to do this for amdgpu as well but I really hope we don't need this.
>>> Just want to describe the use case we have: we support submission in
>>> batch (several jobs passed to the submit ioctl) with a
>>> submit-all-or-nothing model: if any of the job description is passed
>>> wrong args or causes an allocation error, we fail the whole group. In
>>> the submission path, we want to prepare GEMs for all jobs. That means
>>> adding enough fence slots for the number job finished fences. Given not
>>> all jobs will access the same set of BOs, I thought I could use
>>> duplicates support to make my life easier, because otherwise I have to
>>> collect all BOs upfront, store them in a temporary array, and keep
>>> track of the number of fence slots needed for each of them. I guess
>>> the other option would be to over-estimate the number of slots and make
>>> it equal to num_jobs for all BOs.
>> Sounds pretty much what amdgpu is doing as well, but question is why
>> don't you give just one list of BOs? Do you really want to add the
>> fences that fine grained?
> Actually, we don't give a list of BOs at all, we pass a VM, and lock
> all BOs attached to the VM (similar to what Xe does). And, as all other
> drivers being submitted recently, we use explicit sync, so most of
> those VM BOs, except for the imported/exported ones, will be given a
> BOOKKEEP fence.
>
> The reason we need support for duplicates is because we also have
> implicit BOs (like the HWRT object that's shared by the
> geometry/fragment queues to pass data around), and those can be passed
> to multiple jobs in a given batch and require special synchronization
> (geometry job writes to them, fragment job reads from them, so we have
> a reader/writer sync to express). I can of course de-duplicate upfront,
> by parsing jobs and creating an array of BOs that need to be acquired
> over the whole submission, but that's still one extra-step I'd prefer
> to avoid, given the dma_resv framework allows us to figure it out at
> lock time. I can also just deal with the EALREADY case in the driver
> directly, it's not like it's super complicated anyway, just thought
> other drivers would fall in the same situation, that's all.

Well as long as you just need to ignore EALREADY, that should be trivial 
and doable.

What radeon needs is to keep EALREADY BOs in a separate container 
because we need to double check their properties to not break the UAPI.

I strongly think that this shouldn't be needed by any other driver.

Going to add a flag to ignore EALREADY which can be set during exec init.

Regards,
Christian.

>
>> For radeon it turned out that we just had stupid userspace which
>> sometimes mentioned a BO in the list twice.
> Okay, that's not the same thing, indeed.
>
>> On the other hand over estimating the number of fences needed is
>> perfectly fine as well, that is rounded up to the next kvmalloc size or
>> even next page size anyway.
> Yeah, actually over-provisioning is not the most annoying part.
> Iterating over jobs to collect 'meta'-BOs is, so if I can just rely on
> EALREADY to detect that case and fallback to reserving an extra slot in
> that situation, I'd prefer that.

