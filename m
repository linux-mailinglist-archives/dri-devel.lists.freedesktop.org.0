Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF894D3D9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83C10E964;
	Fri,  9 Aug 2024 15:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QV/n6sU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0929A10E964
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:45:22 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a7ab76558a9so319360566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723218320; x=1723823120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wa1W3WV7VpGrEaPcisbcd/cWnkBoUbT/sIRi8LearZg=;
 b=QV/n6sU7im4r0i/5JRZrzdrzCuMmJ0WCIgS/EMoQBqdFtS9PzcIixq43VjBzKDmR/T
 E4uKDXfCMuZ0iwHwxSutkcDo8pny5GW9NGeeW6gx+FaxBGYVUyZsX5VYTpq/I+oARa3O
 kwvCe8eIpTZMwYEoE5+8O3aC7xsgZwMFxy4X5S+2oHYmN/rc2ulhK3uEhp3uobiJaUM9
 fmIUZtoxO1SWg5ps/uC6lmGwDOvpda14b34zFPVjfdAJ8a2C8pa7DYxoS38YTbrPCTRH
 NUmWFd2/yBNly9kfFw3MwRv0hA9cgTv7wtFVm+BdPpZQn3HPXfhljAU8gAGvRXUmTN6R
 kcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723218320; x=1723823120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wa1W3WV7VpGrEaPcisbcd/cWnkBoUbT/sIRi8LearZg=;
 b=DcfwMZPRSAW9q506F3Ak1hjtAJ4OtXgJEmWE6yu0HbYejm4+wX6Wn9JzPKx3ugWgqF
 Tb4vWUXe2gxmrF/TfB3EWFaxfdeawIjnQeLasMmlkbfFOLiwk+Ig3DofSAO3p3IpV7oj
 q6ChDlazjYu/DICpOD10RKXOxZazkK1ObrjNtUvlvMvfG97JPCeiUW66HiaROtodkmwc
 Oz+8SyoCtcVbWrq7AXGV0SZ/r1QI7H+yUkAnSELxMxvGn2zpTRVl8X6RtCU7p+OYDQr3
 VowgZPWUoIR26DavpKfmcXa2ptt27I6zH1RJnvH9C8kCdkI4zyeHqJVI+FC71f9VJVCl
 KZRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwAgbf+fnwtcb6mWrHht/b+onzE/Ne+/8YWgWE3wzT/nIN+kJPTRX7FYIdtD0rbIKQrIcM5+cIq+knEbqbw/PIrl8HscQrmjmMV4IkeR0w
X-Gm-Message-State: AOJu0YzmCNCRc98O4YbB6osRT13ZRSGw9FZNPoigX03p8CmrPyS+8gVr
 3ViG7u8tcap2lsvrIaBoKDxCvfwT4hzaTu9TIgUx8t/opPkcXzOX
X-Google-Smtp-Source: AGHT+IGaWJiDPaSc3UHkzWGM2j8RhpJMnAUdZZgUzu3ws85xIf7phwHYyeL4ZJReXHb3Sd+69ayIRw==
X-Received: by 2002:a17:907:6d14:b0:a7a:8a38:9d99 with SMTP id
 a640c23a62f3a-a80aba196d6mr130567366b.35.1723218319823; 
 Fri, 09 Aug 2024 08:45:19 -0700 (PDT)
Received: from [192.168.42.29] (82-132-212-15.dab.02.net. [82.132.212.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e80e77sm847390266b.169.2024.08.09.08.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 08:45:19 -0700 (PDT)
Message-ID: <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
Date: Fri, 9 Aug 2024 16:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory
 provider
To: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/24 15:10, Mina Almasry wrote:
> On Thu, Aug 8, 2024 at 10:24 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Thu, 8 Aug 2024 16:36:24 -0400 Mina Almasry wrote:
>>>> How do you know that the driver:
>>>>   - supports net_iov at all (let's not make implicit assumptions based
>>>>     on presence of queue API);
>>>>   - supports net_iov in current configuration (eg header-data split is
>>>>     enabled)
>>>>   - supports net_iov for _this_ pool (all drivers must have separate
>>>>     buffer pools for headers and data for this to work, some will use
>>>>     page pool for both)
>>>>
>>>> What comes to mind is adding an "I can gobble up net_iovs from this
>>>> pool" flag in page pool params (the struct that comes from the driver),
>>>
>>> This already sorta exists in the current iteration, although maybe in
>>> an implicit way. As written, drivers need to set params.queue,
>>> otherwise core will not attempt to grab the mp information from
>>> params.queue. A driver can set params.queue for its data pages pool
>>> and not set it for the headers pool. AFAICT that deals with all 3
>>> issues you present above.
>>>
>>> The awkward part is if params.queue starts getting used for other
>>> reasons rather than passing mp configuration, but as of today that's
>>> not the case so I didn't add the secondary flag. If you want a second
>>> flag to be added preemptively, I can do that, no problem. Can you
>>> confirm params.queue is not good enough?
>>
>> I'd prefer a flag. The setting queue in a param struct is not a good
>> API for conveying that the page pool is for netmem payloads only.
>>
>>>> and then on the installation path we can check if after queue reset
>>>> the refcount of the binding has increased. If it did - driver has
>>>> created a pool as we expected, otherwise - fail, something must be off.
>>>> Maybe that's a bit hacky?
>>>
>>> What's missing is for core to check at binding time that the driver
>>> supports net_iov. I had relied on the implicit presence of the
>>> queue-API.
>>>
>>> What you're proposing works, but AFAICT it's quite hacky, yes. I
>>> basically need to ASSERT_RTNL in net_devmem_binding_get() to ensure
>>> nothing can increment the refcount while the binding is happening so
>>> that the refcount check is valid.
>>
>> True. Shooting from the hip, but we could walk the page pools of the
>> netdev and find the one that has the right mp installed, and matches
>> queue? The page pools are on a list hooked up to the netdev, trivial
>> to walk.
>>
> 
> I think this is good, and it doesn't seem hacky to me, because we can
> check the page_pools of the netdev while we hold rtnl, so we can be
> sure nothing is messing with the pp configuration in the meantime.
> Like you say below it does validate the driver rather than rely on the
> driver saying it's doing the right thing. I'll look into putting this
> in the next version.

Why not have a flag set by the driver and advertising whether it
supports providers or not, which should be checked for instance in
netdev_rx_queue_restart()? If set, the driver should do the right
thing. That's in addition to a new pp_params flag explicitly telling
if pp should use providers. It's more explicit and feels a little
less hacky.

-- 
Pavel Begunkov
