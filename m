Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E39783084
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 21:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF010E087;
	Mon, 21 Aug 2023 19:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9B710E070
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692644867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGSgoldDF7M1+mO5xuhb4fHy0+md46F06pChJvfr4Qg=;
 b=Ga3Ov29WHeWqptFvRjH4HY196Lby207/aHZL/N4oWAI6qLsdpixDCJGGr2TrHL62xji0A7
 wTMIxqVm+6gqgOEzm/1lGKHcqrZOZuru64iax03VPVQnp868SLKi8YXjsjzgaAi3GhADcY
 uW39d7MAiebqfjjZwiuSi7n/iNxkqCI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-FkdcGvLVMUWfBqPeTktyaw-1; Mon, 21 Aug 2023 15:07:44 -0400
X-MC-Unique: FkdcGvLVMUWfBqPeTktyaw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bcf6ae8e1so248783966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692644863; x=1693249663;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lGSgoldDF7M1+mO5xuhb4fHy0+md46F06pChJvfr4Qg=;
 b=a56i0Wpg3fUCUml8qHGwIVWsr2ZU330UWfdjpDuyk6k20O04X6d0hVSmj59fjijvAG
 0mD96HTVoPRh1gdQmKezUhpHXZ9xCKCV6JUbcGzlKKEg6lPrJJBdtWi98cpHcIArnLXk
 0p7yasCzuh3yq1mowrbASBvVBrZeGI5iTD+H7hz/Y6PxDL9WqQp0N5d7P45JBVhOVmPu
 i4/IsH2vNjrV9ALRaQaXiIbPwaswux25B9WBkKLEPJhKvh0GBC5mTxhRQ8Wy/88LBYO0
 DJbYynhKaXMNlG+YGJaoKmUldHXlcoK62hs+IFJYndlWFFqHpiYgB5okpLXCgHCUSjHm
 v1lg==
X-Gm-Message-State: AOJu0YyQ8HmegjIHyyeIl16OKzfeVXQlWpojGeS8xXnAq3UI8+EGsU6K
 Q42WFpnVqdn0tzcTTOtg80zuht8W1LX3qtqxWB0w8crAbkvtKOvB8ecFk/U5mZmOWmVwTG78Ed0
 4LwuyVeY/DmdQs27FofSDy3vVXcRP
X-Received: by 2002:a17:907:1ddd:b0:99e:68ce:b245 with SMTP id
 og29-20020a1709071ddd00b0099e68ceb245mr5435302ejc.27.1692644863255; 
 Mon, 21 Aug 2023 12:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfIz50MIpwg5OfAJd8IzvtNA87LoS1sVEbLYqYGM3K7FSWmfn4tOh9OA+CdwNRGqC67f50Tw==
X-Received: by 2002:a17:907:1ddd:b0:99e:68ce:b245 with SMTP id
 og29-20020a1709071ddd00b0099e68ceb245mr5435286ejc.27.1692644862936; 
 Mon, 21 Aug 2023 12:07:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jt11-20020a170906dfcb00b0098921e1b064sm6929371ejc.181.2023.08.21.12.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 12:07:42 -0700 (PDT)
Message-ID: <faecd15e-020b-6b06-acf7-1dd4c5a2b4fc@redhat.com>
Date: Mon, 21 Aug 2023 21:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
 <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
 <85107169-8a24-441f-6631-d99472d810f0@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <85107169-8a24-441f-6631-d99472d810f0@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/21/23 20:12, Christian König wrote:
> Am 21.08.23 um 20:01 schrieb Danilo Krummrich:
>> On 8/21/23 16:07, Christian König wrote:
>>> Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
>>>> [SNIP]
>>>>> I only see two possible outcomes:
>>>>> 1. You return -EBUSY (or similar) error code indicating the the hw 
>>>>> can't receive more commands.
>>>>> 2. Wait on previously pushed commands to be executed.
>>>>> (3. Your driver crash because you accidentally overwrite stuff in 
>>>>> the ring buffer which is still executed. I just assume that's 
>>>>> prevented).
>>>>>
>>>>> Resolution #1 with -EBUSY is actually something the UAPI should not 
>>>>> do, because your UAPI then depends on the specific timing of 
>>>>> submissions which is a really bad idea.
>>>>>
>>>>> Resolution #2 is usually bad because it forces the hw to run dry 
>>>>> between submission and so degrade performance.
>>>>
>>>> I agree, that is a good reason for at least limiting the maximum job 
>>>> size to half of the ring size.
>>>>
>>>> However, there could still be cases where two subsequent jobs are 
>>>> submitted with just a single IB, which as is would still block 
>>>> subsequent jobs to be pushed to the ring although there is still 
>>>> plenty of space. Depending on the (CPU) scheduler latency, such a 
>>>> case can let the HW run dry as well.
>>>
>>> Yeah, that was intentionally not done as well. The crux here is that 
>>> the more you push to the hw the worse the scheduling granularity 
>>> becomes. It's just that neither Xe nor Nouveau relies that much on 
>>> the scheduling granularity at all (because of hw queues).
>>>
>>> But Xe doesn't seem to need that feature and I would still try to 
>>> avoid it because the more you have pushed to the hw the harder it is 
>>> to get going again after a reset.
>>>
>>>>
>>>> Surely, we could just continue decrease the maximum job size even 
>>>> further, but this would result in further overhead on user and 
>>>> kernel for larger IB counts. Tracking the actual job size seems to 
>>>> be the better solution for drivers where the job size can vary over 
>>>> a rather huge range.
>>>
>>> I strongly disagree on that. A larger ring buffer is trivial to allocate 
>>
>> That sounds like a workaround to me. The problem, in the case above, 
>> isn't that the ring buffer does not have enough space, the problem is 
>> that we account for the maximum job size although the actual job size 
>> is much smaller. And enabling the scheduler to track the actual job 
>> size is trivial as well.
> 
> That's what I agree on, so far I just didn't see the reason for doing it 
> but at least a few reason for not doing it.
> 
>>
>>> and if userspace submissions are so small that the scheduler can't 
>>> keep up submitting them then your ring buffer size is your smallest 
>>> problem.
>>>
>>> In other words the submission overhead will completely kill your 
>>> performance and you should probably consider stuffing more into a 
>>> single submission.
>>
>> I fully agree and that is also the reason why I want to keep the 
>> maximum job size as large as possible.
>>
>> However, afaik with Vulkan it's the applications themselves deciding 
>> when and with how many command buffers a queue is submitted (@Faith: 
>> please correct me if I'm wrong). Hence, why not optimize for this case 
>> as well? It's not that it would make another case worse, right?
> 
> As I said it does make both the scheduling granularity as well as the 
> reset behavior worse.

As you already mentioned Nouveau (and XE) don't really rely much on 
scheduling granularity. For Nouveau, the same is true for the reset 
behavior; if things go south the channel is killed anyway. Userspace 
would just request a new ring in this case.

Hence, I think Nouveau would profit from accounting the actual job size. 
And at the same time, other drivers having a benefit of always 
accounting for the maximum job size would still do so, by default.

Arbitrary ratios of how much the job size contributes to the ring being 
considered as full would also be possible.

- Danilo

> 
> In general I think we should try to push just enough work to the 
> hardware to keep it busy and not as much as possible.
> 
> So as long as nobody from userspace comes and says we absolutely need to 
> optimize this use case I would rather not do it.
> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> - Danilo
>>>
>>
> 

