Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BB4BF3C6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F6D10F5EB;
	Tue, 22 Feb 2022 08:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1EE10F5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Y5Q0bIv6KCJJMw/T06DdwsQiFx+TO703WYBc0RO2zg=; b=1BASgC2ZmAp7Yuf1iRh/CZrpM+
 fUes0bn2kS7zkMDCz1SLhO7N2+FCpEpAiKn1Y3+EZMMlwpwQ7R7NKXAtcCaom+H6pkDtZWlW+wIx/
 8hnwMmQ+V4dv//mER9Yle4tcbymSC3T5g6HMT7YDP0pzHTb1rEQsuTX0nosAUfeIn5lJe9hHKKvwP
 gbcThs7e1pUbiiiK+Ye8R9KPzRr9nggO5p5zj1XuaZIiSuXK3c662c0q+M02SlRwvTranKvMD6sQg
 4LKm0IlHl2rJElKURPmgu6a80acIsyj3EnNIVWxgkO1mETmOJBImYmwsQDTT6qReeeXHHXyYZegpV
 81lXv4Pg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMQfS-00063Y-Iy; Tue, 22 Feb 2022 10:37:06 +0200
Message-ID: <134c4a28-4331-deed-a374-75c9711168f0@kapsi.fi>
Date: Tue, 22 Feb 2022 10:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 9/9] drm/tegra: Support context isolation
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-10-mperttunen@nvidia.com>
 <2b4dd244-f918-4d26-2322-00a0bb226ccf@gmail.com>
 <ea65fcd6-9451-7f5b-f4a9-57b8575f09ff@kapsi.fi>
 <bb533634-6cde-3835-db11-7b6191385294@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <bb533634-6cde-3835-db11-7b6191385294@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 22:02, Dmitry Osipenko wrote:
> 21.02.2022 15:06, Mikko Perttunen пишет:
>> On 2/19/22 20:35, Dmitry Osipenko wrote:
>>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>>> +    if (context->memory_context &&
>>>> context->client->ops->get_streamid_offset) {
>>>               ^^^
>>>> +        int offset =
>>>> context->client->ops->get_streamid_offset(context->client);
>>>> +
>>>> +        if (offset >= 0) {
>>>> +            job->context = context->memory_context;
>>>> +            job->engine_streamid_offset = offset;
>>>> +            host1x_context_get(job->context);
>>>> +        }
>>>
>>> You should bump refcount unconditionally or you'll get refcnt underflow
>>> on put, when offset < 0.
>>
>> This refcount is intended to be dropped from 'release_job', where it's
>> dropped if job->context is set, which it is from this path.
>>
>>>
>>>> +    }
>>>> +
>>>>        /*
>>>>         * job_data is now part of job reference counting, so don't
>>>> release
>>>>         * it from here.
>>>> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
>>>> index 9ab9179d2026..be33da54d12c 100644
>>>> --- a/drivers/gpu/drm/tegra/uapi.c
>>>> +++ b/drivers/gpu/drm/tegra/uapi.c
>>>> @@ -33,6 +33,9 @@ static void tegra_drm_channel_context_close(struct
>>>> tegra_drm_context *context)
>>>>        struct tegra_drm_mapping *mapping;
>>>>        unsigned long id;
>>>>    +    if (context->memory_context)
>>>> +        host1x_context_put(context->memory_context);
>>>
>>> The "if (context->memory_context &&
>>> context->client->ops->get_streamid_offset)" above doesn't match the "if
>>> (context->memory_context)". You'll get refcount underflow.
>>
>> And this drop is for the refcount implicitly added when allocating the
>> memory context through host1x_context_alloc; so these two places should
>> be independent.
>>
>> Please elaborate if I missed something.
> 
> You named context as memory_context and then have
> context=context->memory_context. Please try to improve the variable
> names, like drm_ctx->host1x_ctx for example.
> 
> I'm also not a big fan of the "if (ref) put(ref)" pattern. Won't be
> better to move all the "if (!NULL)" checks inside of get()/put() and
> make the invocations unconditional?

I agree that the naming here is confusing with different kinds of 
contexts flying around, though I would prefer not to change the original 
'struct tegra_drm_context *context' since it's used all around the code. 
But I'll try to make it clearer.

Regarding moving NULL checks inside get/put, I personally dislike that 
pattern (also with e.g. kfree) since when reading the code, it makes it 
more difficult to see that the pointer can be NULL.

Mikko
