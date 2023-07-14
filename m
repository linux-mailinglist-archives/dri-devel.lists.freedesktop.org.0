Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C375371B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39BF10E84B;
	Fri, 14 Jul 2023 09:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E193210E84B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 72F9C5BC37;
 Fri, 14 Jul 2023 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689328297;
 bh=9YdiC6yP/uFp6AFL5xOcZWtsFNruI4WD3T4VKunyZuM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=tVradgmizqZtTSMOOR1/kDVWWp9IuFmRZeHsU7ET8PCoB9Gg/lv3s9QNmXaGXXvSz
 U5dY2f1B7lE/TBHDRgUCjn6EjBE+UspHpBMddK3gRTbmsCjwL40Hz/AoXw+fQX3M3k
 RlPAGl663yz9oVtSFLLy6YXSVMK+QLcBHL/YaTXlgoB2NaZ+595tz7cJF9v+SqhE/B
 JRkfi4PKbAwYmlyVuN9N4KAeM12bj4QbXatuJ4RSEiduMivPqVW5dB9AixUkWLcYkq
 9VUVPT7M2xR4ZohtD+P7oM6A5u7QlwqmDaPpVTDrAJCx4ikXGt7sfbLF8RjNoUGE72
 Zuo61b+e6nYlQ==
Message-ID: <d2e748e3-0263-70ed-0f6a-278441379371@asahilina.net>
Date: Fri, 14 Jul 2023 18:51:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/scheduler: Add more documentation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-1-c567249709f7@asahilina.net>
 <332e031c-c04e-998c-e401-685c817ea2a1@amd.com>
 <6ba6827b-ab2b-1c03-2c72-eb3f6da7e719@asahilina.net>
 <1c9e3c2b-a2bd-e465-809c-0e57ca61f40d@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <1c9e3c2b-a2bd-e465-809c-0e57ca61f40d@amd.com>
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 18.47, Christian König wrote:
> Am 14.07.23 um 11:39 schrieb Asahi Lina:
>> On 14/07/2023 17.40, Christian König wrote:
>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>> Document the implied lifetime rules of the scheduler (or at least the
>>>> intended ones), as well as the expectations of how resource acquisition
>>>> should be handled.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>     drivers/gpu/drm/scheduler/sched_main.c | 58
>>>> ++++++++++++++++++++++++++++++++--
>>>>     1 file changed, 55 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 7b2bfc10c1a5..1f3bc3606239 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -43,9 +43,61 @@
>>>>      *
>>>>      * The jobs in a entity are always scheduled in the order that
>>>> they were pushed.
>>>>      *
>>>> - * Note that once a job was taken from the entities queue and
>>>> pushed to the
>>>> - * hardware, i.e. the pending queue, the entity must not be
>>>> referenced anymore
>>>> - * through the jobs entity pointer.
>>>> + * Lifetime rules
>>>> + * --------------
>>>> + *
>>>> + * Getting object lifetimes right across the stack is critical to
>>>> avoid UAF
>>>> + * issues. The DRM scheduler has the following lifetime rules:
>>>> + *
>>>> + * - The scheduler must outlive all of its entities.
>>>> + * - Jobs pushed to the scheduler are owned by it, and must only be
>>>> freed
>>>> + *   after the free_job() callback is called.
>>>> + * - Scheduler fences are reference-counted and may outlive the
>>>> scheduler.
>>>
>>>> + * - The scheduler *may* be destroyed while jobs are still in flight.
>>>
>>> That's not correct. The scheduler can only be destroyed after all the
>>> entities serving it have been destroyed as well as all the jobs already
>>> pushed to the hw finished.
>>
>> The point of this series is to change this behavior so I can actually
>> use the scheduler in my use case, and that begins with formally
>> documenting it as Daniel suggested. That is, I need it to be safe for
>> jobs to not be yet complete before the scheduler is destroyed (the
>> entities do get destroyed first, that's the first bullet point).
> 
> Yeah, but you need to document the current situation not how you like it
> to be.

Daniel told me to document how I think it should be, then fix the bugs 
that make it not so. That's what this series does.

>> We already had this discussion. Without this guarantee, I cannot build
>> a reasonable safe Rust abstraction. Unless you have another
>> suggestion, as far as I can tell it's either this or I give up on
>> using the DRM scheduler entirely and reimplement something else on my
>> own.
>>
>>> What might be possible to add is that the hw is still working on the
>>> already pushed jobs, but so far that was rejected as undesirable.
>>
>> Where was this rejected?
> 
> Years ago. Our initial driver suspend/resume design relied on that.
> Turned out not to be a good idea

Times change, maybe it's time to revisit that decision?

~~ Lina

