Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23680786731
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 07:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049A710E0F9;
	Thu, 24 Aug 2023 05:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628B610E485
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 22:53:03 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68a56401c12so2728207b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 15:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20221208.gappssmtp.com; s=20221208; t=1692831183; x=1693435983; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJ/s2EmqPuWzmlnRND54rc9ryTxh75/w4MTWA7NzKQM=;
 b=W/h+9fqynP796vzOzX5cmLOv64wPQRrNayfRyhZPMzWQZyYS5fv5yxMB7rgVKhcAg6
 EgAuhzwYpJ62a0mENcW/lNuqEMPqdby6+6OWIQnz0UKJ/sUIW+KGLji9MbbOZHHtLj7I
 cXrQQ2PKPibgQ4UXsleHOogOjpLMQsP5rgMO3FXlmHgF7+r5EqCAMEBU6/6ipeiaLeBS
 QOCcUQz2wYhtqlyyCSBKi90Mea79/HUCmsU1hIWHSWvl5An1PLYHvT38m21GkUbdt9QV
 sD9lLmJTkLT2aHvz3Dyiq9seSajwk9vplFoX0Bf91JgC6oWPpp4p2plvS7gtidww1xoG
 kTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692831183; x=1693435983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SJ/s2EmqPuWzmlnRND54rc9ryTxh75/w4MTWA7NzKQM=;
 b=eY8YEZMZhh0b8LEqEIWqZhcnVGN/rLQlKDveXwvT+T2LrOwgjacl0VpH8DiZu5s0Op
 kfNkoyLK+x3tYGzm3QTlyRISZinmswTYGiA05HtSbOK+MkYpMMytp05EfTI4vfUOz311
 lI23ElpTGtGQroRnR4Ucbce8gVIt93B5pw8PaFIRWCLc3vy++PiOpnOTj1YjsCn4vt9j
 zXT2Sj6lSv+/2W62KVx9VmpqhMMkh/D/U5uxgQMClVulWRNQ2UhyKlHS5M+zDGEnefMU
 1raL2pJxq35GvqjlhsLG6/yDxTPTkiu0VxKQs/+KFWjr+F9nYShceyHRH6y5YQDZEk6q
 +7YA==
X-Gm-Message-State: AOJu0YxHV9ZIIIOGwcl8z3XlQOlmCGi9h7c4swE089kj0LgrKUkFUNGa
 ZKWTxgF3tsy8XxSeCphoAoLavg==
X-Google-Smtp-Source: AGHT+IFc2FokU2VLaRNZT0xsXAi+/Iv/vVSz6ILE07xsMkOT83vrWIz++UyfDE7aQXrHa+PnqgAp4g==
X-Received: by 2002:a05:6a21:6d86:b0:14b:8b51:44b0 with SMTP id
 wl6-20020a056a216d8600b0014b8b5144b0mr3502513pzb.37.1692831183369; 
 Wed, 23 Aug 2023 15:53:03 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881?
 ([2620:10d:c090:500::5:1af5]) by smtp.gmail.com with ESMTPSA id
 i26-20020aa787da000000b0068a6972ca0esm3562076pfo.106.2023.08.23.15.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 15:53:02 -0700 (PDT)
Message-ID: <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
Date: Wed, 23 Aug 2023 15:52:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: Mina Almasry <almasrymina@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
 <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
 <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Aug 2023 05:31:50 +0000
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2023 15:18, Mina Almasry wrote:
> On Thu, Aug 17, 2023 at 11:04 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 8/14/23 02:12, David Ahern wrote:
>>> On 8/9/23 7:57 PM, Mina Almasry wrote:
>>>> Changes in RFC v2:
>>>> ------------------
>> ...
>>>> ** Test Setup
>>>>
>>>> Kernel: net-next with this RFC and memory provider API cherry-picked
>>>> locally.
>>>>
>>>> Hardware: Google Cloud A3 VMs.
>>>>
>>>> NIC: GVE with header split & RSS & flow steering support.
>>>
>>> This set seems to depend on Jakub's memory provider patches and a netdev
>>> driver change which is not included. For the testing mentioned here, you
>>> must have a tree + branch with all of the patches. Is it publicly available?
>>>
>>> It would be interesting to see how well (easy) this integrates with
>>> io_uring. Besides avoiding all of the syscalls for receiving the iov and
>>> releasing the buffers back to the pool, io_uring also brings in the
>>> ability to seed a page_pool with registered buffers which provides a
>>> means to get simpler Rx ZC for host memory.
>>
>> The patchset sounds pretty interesting. I've been working with David Wei
>> (CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
>> similar approaches based on allocating an rx queue. It targets host
>> memory and device memory as an extra feature, uapi is different, lifetimes
>> are managed/bound to io_uring. Completions/buffers are returned to user via
>> a separate queue instead of cmsg, and pushed back granularly to the kernel
>> via another queue. I'll leave it to David to elaborate
>>
>> It sounds like we have space for collaboration here, if not merging then
>> reusing internals as much as we can, but we'd need to look into the
>> details deeper.
>>
> 
> I'm happy to look at your implementation and collaborate on something
> that works for both use cases. Feel free to share unpolished prototype
> so I can start having a general idea if possible.

Hi I'm David and I am working with Pavel on this. We will have something to
share with you on the mailing list before the end of the week.

I'm also preparing a submission for NetDev conf. I wonder if you and others at
Google plan to present there as well? If so, then we may want to coordinate our
submissions and talks (if accepted).

Please let me know this week, thanks!

> 
>>> Overall I like the intent and possibilities for extensions, but a lot of
>>> details are missing - perhaps some are answered by seeing an end-to-end
>>> implementation.
>>
>> --
>> Pavel Begunkov
> 
> 
> 
