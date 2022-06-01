Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC353A992
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199AF10E404;
	Wed,  1 Jun 2022 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261210E404
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 15:06:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t13so2752569wrg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Leic+PhDW9JBtVqGFF33qmkBBaBIyf37xeEUSNRuRLw=;
 b=XH0GWUPC4rtX5tdQrQMcCWEEcsMs/2hrq9PygPpWzqZYP/RMZk4ONuHge/lYiEsFvK
 v6WciuNGiBg9/HBVpBfVhFPN7njNI4GhL8VuA60R1eK0ujsX8Qy023cZ2tJM0fo6ke7z
 b7w0lc1yowLDgawmU2z/eV4WKF4q6HF0igBC9PUd4L0Kjb288DE7ESq8B+FnFK3MUmkn
 V+qufjMsi9wJZfTauz6awGg8LcZ/+KC8xQuHPnyhm7DDkg65d8bSk1jYP+6a3gBVigHl
 qUcikYx/jZvWz84tlXATBy0l6rjdcCQ5p2308GFL4GHy5T33GvTxaFUMb2Z129RazxTC
 0MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Leic+PhDW9JBtVqGFF33qmkBBaBIyf37xeEUSNRuRLw=;
 b=cUilMZaQgVtPHjrqhPwJB9m6pWSQHM7nk5HTMUhi4Fb+MWArPLUQrMQ3N4iiUOLE/m
 7qB+Q+ijuNpUMxDofUIxy9m3OxR2clzLRmCm9dsJHJ5HMzov0ELnNdd2AKscICVrKCeO
 ZUEBCNRJVOukReHcmFc84Yint34/MynUcPdezw5mpdcHfITrGTqIqqgsJutb7f8XG22J
 erUfQCGvD2Hb/G8ORoWuChknLXhJjxm0kf85pd/z0JsT5YqfLw7idpvRuP/5st9sSvFu
 1LQmtWdOqQU4QXYpxQgxSTBa6P68iDrlmbdNAkONh0vlJ4G68Yeiv6KSFB8dfYMlls+f
 akgQ==
X-Gm-Message-State: AOAM532yYjyD662so+NiuY/5saAPmFhVgmdkdce+3MtexUTFXEcYjLya
 Q/ZWsYp+nl50l8Mpb0hQ56A=
X-Google-Smtp-Source: ABdhPJywvalFqzq1oRD29IlI1pb78iiaj27Usi9lg7MLrT/V1m31Qrl/vNekEuBU1JaXIWlVnGyUxw==
X-Received: by 2002:adf:d1a3:0:b0:210:29f7:2d52 with SMTP id
 w3-20020adfd1a3000000b0021029f72d52mr179090wrc.397.1654095981285; 
 Wed, 01 Jun 2022 08:06:21 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:d1fb:e1e4:e193:e55f?
 ([2a02:908:1256:79a0:d1fb:e1e4:e193:e55f])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm2247384wmk.35.2022.06.01.08.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 08:06:20 -0700 (PDT)
Message-ID: <30c96646-bb16-a876-57f5-155d46b8d805@gmail.com>
Date: Wed, 1 Jun 2022 17:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com> <YpWCvniLzJfcp684@google.com>
 <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
 <Ypd3Us3a93aLonqT@google.com>
 <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
 <Ypd9OSqMtGMVKYZ0@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Ypd9OSqMtGMVKYZ0@google.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 16:52 schrieb Sergey Senozhatsky:
> On (22/06/01 16:38), Christian König wrote:
>>>> Well, you don't.
>>>>
>>>> If you have a dynamic context structure you need to reference count that as
>>>> well. In other words every time you create a fence in your context you need
>>>> to increment the reference count and every time a fence is release you
>>>> decrement it.
>>> OK then fence release should be able to point back to its "context"
>>> structure. Either a "private" data in dma fence or we need to "embed"
>>> fence into another object (refcounted) that owns the lock and provide
>>> dma fence ops->release callback, which can container_of() to the object
>>> that dma fence is embedded into.
>>>
>>> I think you are suggesting the latter. Thanks for clarifications.
>> Daniel might hurt me for this, but if you really only need a pointer to your
>> context then we could say that using a pointer value for the context field
>> is ok as well.
>>
>> That should be fine as well as long as you can guarantee that it will be
>> unique during the lifetime of all it's fences.
> I think we can guarantee that. Object that creates fence is kmalloc-ed and
> it sticks around until dma_fence_release() calls ops->release() and kfree-s
> it. We *probably* can even do something like it now, by re-purposing dma_fence
> context member:
>
>          dma_fence_init(obj->fence,
>                         &fence_ops,
>                         &obj->fence_lock,
>                         (u64)obj,                             <<   :/
>                         atomic64_inc_return(&obj->seqno));
>
> I'd certainly refrain from being creative here and doing things that
> are not documented/common. DMA fence embedding should work for us.

Yeah, exactly that's the idea. But if you are fine to create a subclass 
of the dma_fence than that would indeed be cleaner.

Christian.

>
>>> The limiting factor of this approach is that now our ops->release() is
>>> under the same "pressure" as dma_fence_put()->dma_fence_release() are.
>>> dma_fence_put() and dma_fence_release() can be called from any context,
>>> as far as I understand, e.g. IRQ, however our normal object ->release
>>> can schedule, we do things like synchronize_rcu() and so on. Nothing is
>>> impossible, just saying that even this approach is not 100% perfect and
>>> may need additional workarounds.
>> Well just use a work item for release.
> Yup, that's the plan.

