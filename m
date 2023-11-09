Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675427E61A7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 02:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39310E0CC;
	Thu,  9 Nov 2023 01:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B65110E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 01:00:44 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc330e8f58so2286245ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 17:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1699491643; x=1700096443;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g+m1/eec3BAI+VxQgeWP5nozlTdhs+GvhhRREFgPtnw=;
 b=RxfMBiL7xyDP2XSDpXqMxW/f5E+UEvM322ee1vGriF0ZZlYmyac3COhLmvk/hYTzIn
 d4jdXYBNTpDseD0A2xRVxvIT+zR0R5Q4yfwlhT9bvp0PdneNxlXl6Nqws04iGm1PlTL0
 CeQwwWcas0e+wlIYClGCmHpp20BxWQu+7vFDzleq1ikYH6WpSesx7iQFzvPkswCRqpJr
 nWV/sfGB9L8J0ACRrCBJZcDrK71GJClVBZF6DOEM0vj7ZzEWNyBqmjYXJeEtVrrPEZWk
 qcY6NZVR7psfPZoTgc26krn+mDGkk27Z6YrtI3XUZJnDR0L8vDmO5EoveLNLvYi/jQ1Q
 5vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699491643; x=1700096443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+m1/eec3BAI+VxQgeWP5nozlTdhs+GvhhRREFgPtnw=;
 b=sYCY+C8GK1HGS7q/piU835hsV/dELBwbBDVmdMIaVzjsQznP136qHVoCWVkbEve/ry
 GEPqMdsvKgXGBL/OJGbeGc0kTBcefaUM+pTgi2wE4cfvf6OxMoWsOSILraXMiaSJAGA9
 2336Me1AQWfTBg1sjfwprmenKDsW1l5d4+KVbvK0sdHRLO/4bD8gPrRLTSDR51z0rkls
 7XRPsJKZJ/oe0BV5+BwumsY6b0zzo4KIdx0Lk8l/H0mLu+9D/Gd80n07pWFsfL6DFJDi
 3C1Qs/lYuGjRCDdSozJ4x8BdKA7V4qFSxs76U0tPtwkxsBiaWGCsGKCioI5b4KWeiHIG
 CQQA==
X-Gm-Message-State: AOJu0YypynWrWF+143QaRWSROwIIUuDLpd+3rT5+IUOiHACF30hI6K1y
 Wi6JMIJN9ZqFd1VYjoczbZVHnA==
X-Google-Smtp-Source: AGHT+IGqOk5pLGreahWyU5Tyhch5OGepp+ms2LPYRQxo1oPkx1W4LYvgzN77Bieh5CFVk1MoPdYbhQ==
X-Received: by 2002:a17:902:d2cf:b0:1cc:6acc:8fa4 with SMTP id
 n15-20020a170902d2cf00b001cc6acc8fa4mr4025647plc.32.1699491643400; 
 Wed, 08 Nov 2023 17:00:43 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1256:2:c51:2090:e106:83fa?
 ([2620:10d:c090:500::5:887f]) by smtp.gmail.com with ESMTPSA id
 g10-20020a170902934a00b001b0358848b0sm2287468plp.161.2023.11.08.17.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 17:00:43 -0800 (PST)
Message-ID: <b1476f8e-1b4b-497a-9e80-aff679ca8b4b@davidwei.uk>
Date: Wed, 8 Nov 2023 17:00:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
Content-Language: en-GB
To: David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-07 14:55, David Ahern wrote:
> On 11/7/23 3:10 PM, Mina Almasry wrote:
>> On Mon, Nov 6, 2023 at 3:44 PM David Ahern <dsahern@kernel.org> wrote:
>>>
>>> On 11/5/23 7:44 PM, Mina Almasry wrote:
>>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>>> index eeeda849115c..1c351c138a5b 100644
>>>> --- a/include/linux/netdevice.h
>>>> +++ b/include/linux/netdevice.h
>>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>>>>  };
>>>>
>>>>  #ifdef CONFIG_DMA_SHARED_BUFFER
>>>> +struct page_pool_iov *
>>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
>>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
>>>
>>> netdev_{alloc,free}_dmabuf?
>>>
>>
>> Can do.
>>
>>> I say that because a dmabuf can be host memory, at least I am not aware
>>> of a restriction that a dmabuf is device memory.
>>>
>>
>> In my limited experience dma-buf is generally device memory, and
>> that's really its use case. CONFIG_UDMABUF is a driver that mocks
>> dma-buf with a memfd which I think is used for testing. But I can do
>> the rename, it's more clear anyway, I think.
> 
> config UDMABUF
>         bool "userspace dmabuf misc driver"
>         default n
>         depends on DMA_SHARED_BUFFER
>         depends on MEMFD_CREATE || COMPILE_TEST
>         help
>           A driver to let userspace turn memfd regions into dma-bufs.
>           Qemu can use this to create host dmabufs for guest framebuffers.
> 
> 
> Qemu is just a userspace process; it is no way a special one.
> 
> Treating host memory as a dmabuf should radically simplify the io_uring
> extension of this set. That the io_uring set needs to dive into
> page_pools is just wrong - complicating the design and code and pushing
> io_uring into a realm it does not need to be involved in.

I think our io_uring proposal will already be vastly simplified once we
rebase onto Kuba's page pool memory provider API. Using udmabuf means
depending on a driver designed for testing, vs io_uring's registered
buffers API that's been tried and tested.

I don't have an intuitive understanding of the trade offs yet, and would
need to try out udmabuf and compare vs say using our own page pool
memory provider.

> 
> Most (all?) of this patch set can work with any memory; only device
> memory is unreadable.
> 
> 
