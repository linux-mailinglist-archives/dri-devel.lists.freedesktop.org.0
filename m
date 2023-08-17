Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCC7809CC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B57A10E080;
	Fri, 18 Aug 2023 10:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605A210E545
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 18:04:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so68747a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692295465; x=1692900265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxvCrw/069KltoPZkQIYth4BBOJdgJ8sNaI0SyyMDnM=;
 b=LlNp+0S95wa2DHWIhxZumDFmianXTCRMJjOitpuiuyKYp0AAZb4zHQT8ZXqFwgTr3M
 TAcGjKr7A/7LbmvxCY8pqvLWzcywa017/uoZ3dhPRVfKQBpxe2Rx4JQVzmQMUv/lluNQ
 8t/PjmueudVyVsA4+vkTHFn9Wg1EnP9GTqy6bCt1AIDvGSTkLDX8uzmkFWqf6cdFJtPf
 KRm02KV0hef2hr/xa3gZ+j3wmJGjbj9dQaAlasQmWzrxH3IJ5JCWJI2/kGrxl9CivxpV
 AvKdmfKLPT+4igVvanygECsKarn9iz35Qwe/ar6m/vTrTtCGRNAG2OY42t5fatoyv1PR
 bXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692295465; x=1692900265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxvCrw/069KltoPZkQIYth4BBOJdgJ8sNaI0SyyMDnM=;
 b=TN9J2OQyEIh5qUf3JjR+bezpzgVtFPWymIEU7YudtYrKA4d0Qsa+swjvWdIQG8Ic0s
 kZGojJC00cp1LJe+dYzvobcNLkt1WjK9/ZmVKVdwh8c87i8XsmsXRQG0id+PFSa+/FvK
 WFNWEiml4QE7/wC08LBxqvSROF8a57DV6icgwX53/gCXntg68wPmuDwJ4W+xLcYZXu4u
 0flMy/PQc3QeZf2BNry+SWHAqPFoN7ub1hyEaqAfdjb9ZIZ1uG4SHX86lZfoWZ/WMbob
 BXT9rjnyYneveG8wW12NRAaW9LEQFlCrV/uMt1bte9OQBnvAmXqoaU+Mij1KN7/4H5Zm
 x3aA==
X-Gm-Message-State: AOJu0YzTkmc6I5hpdzPTCYOYqGxdb+JyfFfqIGxPoEzWm5ZdWX2MzPjC
 GJJIc42eSyqDHeERqsPJ4fw=
X-Google-Smtp-Source: AGHT+IG0Woy+0POxg4sPHGGIdfrc456TaHlsCCBtEoEEY8ldQE+9Fdkgkm7V8IaZV79Aen7WtSv5Lw==
X-Received: by 2002:a17:906:8a72:b0:99c:6692:7f76 with SMTP id
 hy18-20020a1709068a7200b0099c66927f76mr153247ejc.16.1692295464443; 
 Thu, 17 Aug 2023 11:04:24 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.129.159])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1709063c0600b0099b921de301sm27628ejg.159.2023.08.17.11.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 11:04:23 -0700 (PDT)
Message-ID: <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
Date: Thu, 17 Aug 2023 19:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To: David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 18 Aug 2023 10:15:02 +0000
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/14/23 02:12, David Ahern wrote:
> On 8/9/23 7:57 PM, Mina Almasry wrote:
>> Changes in RFC v2:
>> ------------------
...
>> ** Test Setup
>>
>> Kernel: net-next with this RFC and memory provider API cherry-picked
>> locally.
>>
>> Hardware: Google Cloud A3 VMs.
>>
>> NIC: GVE with header split & RSS & flow steering support.
> 
> This set seems to depend on Jakub's memory provider patches and a netdev
> driver change which is not included. For the testing mentioned here, you
> must have a tree + branch with all of the patches. Is it publicly available?
> 
> It would be interesting to see how well (easy) this integrates with
> io_uring. Besides avoiding all of the syscalls for receiving the iov and
> releasing the buffers back to the pool, io_uring also brings in the
> ability to seed a page_pool with registered buffers which provides a
> means to get simpler Rx ZC for host memory.

The patchset sounds pretty interesting. I've been working with David Wei
(CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
similar approaches based on allocating an rx queue. It targets host
memory and device memory as an extra feature, uapi is different, lifetimes
are managed/bound to io_uring. Completions/buffers are returned to user via
a separate queue instead of cmsg, and pushed back granularly to the kernel
via another queue. I'll leave it to David to elaborate

It sounds like we have space for collaboration here, if not merging then
reusing internals as much as we can, but we'd need to look into the
details deeper.

> Overall I like the intent and possibilities for extensions, but a lot of
> details are missing - perhaps some are answered by seeing an end-to-end
> implementation.

-- 
Pavel Begunkov
