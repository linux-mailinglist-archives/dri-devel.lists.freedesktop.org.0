Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEF53A946
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1982610E189;
	Wed,  1 Jun 2022 14:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75C10E189
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:38:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1204297wmr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 07:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nEz+76T79tFW0RCrZGZI21N3hxWVslYlXYg2VKXX6II=;
 b=MaD8PwmnHt8a09T+peqTHwVOA9ZMJagO1K5G+SyV6SZNU5n+F08WpEiHeJK3218K7q
 TpMa2jHtVr6XzwZz/ZwmfQLeBpaol/DjLjdCgPEuGdts3zI+eeo5NBCLcFvgL1ZP7RD6
 ioO/06Cr9tKOOMtD7GD9rb96R+083ZmEC0FgFh49pdInij8WyfudEHMhbbnzxvPO0cnl
 NAsd2tz/9kZ9GjmlRo3jIZcOE2UrxK0mZt2K0ezbG16koclnfi0uXizmzNTmgP1BeCrB
 gD3TN7uQWiJjBDB+QcU6rgIeiE87c2Uf8tumpI6vGFZpEp5j6HBVnKe/wAZaAMVzCe3d
 oc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nEz+76T79tFW0RCrZGZI21N3hxWVslYlXYg2VKXX6II=;
 b=cKvfKZ1eiY4NcQl5v0UevZCuOjZAH1UFg8s3pIuJ49pl35lFPTvuZb5jRAYfzUta71
 GUlN4LPTBtn+OqYL19eYcvSRNnFj5CZ5tTHELdrqPQqETbOdiw/0AREvZ4/c5O/Oqv0y
 ne93nTytY1Y9910e9ax4W0jWgUdpFDPVts5pTbFVLM+rL98pos0vo6liNymAVoFY86oh
 c8g9aEOn+kvyQoWNy0BRUU7btwgfHNqFrwhus+lSASkb6y2eRpwtBS5OPVp0zMJK9COT
 TWAHvj/iSA4gZVxRkFXc4z9+/YY3aWHnkWKkmHVz7G9cZ25CThS5fwI8EFHyN6jfRdqe
 01+A==
X-Gm-Message-State: AOAM533UQzGCGoRI/OZ38GCLC0FAbkcgxjHg2qMKyX5nnQ4sCZVgFlox
 0kyI5/axrt70/V7hF06oGNw=
X-Google-Smtp-Source: ABdhPJxFJm/fvrtPm0Q76kR0LnUENBqB8SBsBwD/wEAz7gTa4nHm3tJgWR7y3ldaWLBOVk3IV9s8LQ==
X-Received: by 2002:a7b:cb91:0:b0:397:3225:244 with SMTP id
 m17-20020a7bcb91000000b0039732250244mr28954441wmi.68.1654094333691; 
 Wed, 01 Jun 2022 07:38:53 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:d1fb:e1e4:e193:e55f?
 ([2a02:908:1256:79a0:d1fb:e1e4:e193:e55f])
 by smtp.gmail.com with ESMTPSA id
 u12-20020adfdb8c000000b002119c1a03e4sm503684wri.31.2022.06.01.07.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 07:38:52 -0700 (PDT)
Message-ID: <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
Date: Wed, 1 Jun 2022 16:38:51 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Ypd3Us3a93aLonqT@google.com>
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

Am 01.06.22 um 16:27 schrieb Sergey Senozhatsky:
> On (22/06/01 14:45), Christian König wrote:
>> Am 31.05.22 um 04:51 schrieb Sergey Senozhatsky:
>>> On (22/05/30 16:55), Christian König wrote:
>>>> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
>>>>> [SNIP]
>>>>> So the `lock` should have at least same lifespan as the DMA fence
>>>>> that borrows it, which is impossible to guarantee in our case.
>>>> Nope, that's not correct. The lock should have at least same lifespan as the
>>>> context of the DMA fence.
>>> How does one know when it's safe to release the context? DMA fence
>>> objects are still transparently refcount-ed and "live their own lives",
>>> how does one synchronize lifespans?
>> Well, you don't.
>>
>> If you have a dynamic context structure you need to reference count that as
>> well. In other words every time you create a fence in your context you need
>> to increment the reference count and every time a fence is release you
>> decrement it.
> OK then fence release should be able to point back to its "context"
> structure. Either a "private" data in dma fence or we need to "embed"
> fence into another object (refcounted) that owns the lock and provide
> dma fence ops->release callback, which can container_of() to the object
> that dma fence is embedded into.
>
> I think you are suggesting the latter. Thanks for clarifications.

Daniel might hurt me for this, but if you really only need a pointer to 
your context then we could say that using a pointer value for the 
context field is ok as well.

That should be fine as well as long as you can guarantee that it will be 
unique during the lifetime of all it's fences.

We would just have to adjust the documentation a bit.

> The limiting factor of this approach is that now our ops->release() is
> under the same "pressure" as dma_fence_put()->dma_fence_release() are.
> dma_fence_put() and dma_fence_release() can be called from any context,
> as far as I understand, e.g. IRQ, however our normal object ->release
> can schedule, we do things like synchronize_rcu() and so on. Nothing is
> impossible, just saying that even this approach is not 100% perfect and
> may need additional workarounds.

Well just use a work item for release.

Regards,
Christian.

>> If you have a static context structure like most drivers have then you must
>> make sure that all fences at least signal before you unload your driver. We
>> still somewhat have a race when you try to unload a driver and the fence_ops
>> structure suddenly disappear, but we currently live with that.
> Hmm, indeed... I didn't consider fence_ops case.
>
>> Apart from that you are right, fences can live forever and we need to deal
>> with that.
> OK. I see.

