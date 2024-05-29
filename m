Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD348D2B1B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 04:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9910E169;
	Wed, 29 May 2024 02:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LV+21I0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237D10E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 02:42:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-354e0cc9c5cso1365813f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 19:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716950565; x=1717555365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WaUSmZ7PBffPeOQ7gcFKeRJS00p2asbGxa8dHTdLep4=;
 b=LV+21I0CKlNuu81OEkF9dpAor6edw5jYJ/LAK0hZ6gdn+/tYNr8kUZkflir6UWL/wV
 77S/skknLD4wclBy2Fl8qIgy3L6Ow4O1oQLL9x1xFdlnwT2tpHKTrerQlZZEO0X3+Y1x
 APBKhVJPzO3kyEz8XLgmnGBQFAD/rGsDo7V2zSf6ONml5s/I8Fs/Dpfl+WmZSv+3SF4R
 5uRGcxZwB8J7VeSOrofcW1108j3kpSgNYr/9qnpOB15DeluAEj/bgUW8kQYr1x2O8hGp
 j2orPE3Ivc6Ok3+GMZpYWBd9YbeiU+ha0AoZxgN9Ra3XRbovcukk3nMtHBSQpbxknDn5
 yNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716950565; x=1717555365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WaUSmZ7PBffPeOQ7gcFKeRJS00p2asbGxa8dHTdLep4=;
 b=p94qSNEO8VvTtH7EKLGimEN7KgmA60xopfgYC0tK2u/0YiVYVG7PNjD0WHy8F5vV4D
 RKRMdi7hF8JK0ZbNXoPy/CvY6ZDJbKbK+0zEzQmEDpAkbvlhhOUPa4UHwX6r14o+HvkV
 R0udbyDSTzXhzw4TVgFYabP0xwgLVOTRb8gpQQEp1v4eFYzvRZC3GKRsPU/fnP04qcZA
 RrUAXpnFaPTQXnv4c7kto1gUusNjkeClDGBb8Uli76ExvTHPfa31WkrB9CYonbyqcTUC
 Cfc5kKiuPYz3tCi1mmtipkZKEYh7/0LZ4grsNBwP1g59jBXc3b2PbrwXhpQYeExXAqxS
 gDHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQvxD/1dWn1oqPFHyP/e8c/gKAcYU3vX7Gr85OrAstE4Cgr/UAwqSCITASnIrA8d0MSJ1MXbzjj8HUtOsNym2Y29oGP1v4D8aQ8edtjyXh
X-Gm-Message-State: AOJu0YylkH7C53E04G5cUYXedIH4KbokA/ol21mO7I5I4aopJpDG81Ba
 vm0tSqsFBYQluLILV24rWNkxDZ/5P45Ompk/+0Q2q0xpMyqc1Oh0
X-Google-Smtp-Source: AGHT+IHY3mIPt+8r+bWSLhyahH3HSb2DqvQP0sw5Fzxjvwkj4ZywRulvtF7xu0QbCHkAVDUw9UJ96A==
X-Received: by 2002:a05:6000:1841:b0:354:c0a6:2815 with SMTP id
 ffacd0b85a97d-355245e30f8mr11028033f8f.4.1716950565027; 
 Tue, 28 May 2024 19:42:45 -0700 (PDT)
Received: from [192.168.42.154] ([185.69.144.120])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7d963sm13608610f8f.21.2024.05.28.19.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 19:42:44 -0700 (PDT)
Message-ID: <29464e46-e196-47aa-9ff5-23173099c95e@gmail.com>
Date: Wed, 29 May 2024 03:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 11/14] tcp: RX path for devmem TCP
To: Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-12-almasrymina@google.com>
 <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
 <CAHS8izOe-uYjm0ttQgHOFpvp_Tj4_oRHV6d1Y1sWJAZJdCdCBA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izOe-uYjm0ttQgHOFpvp_Tj4_oRHV6d1Y1sWJAZJdCdCBA@mail.gmail.com>
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

On 5/28/24 18:36, Mina Almasry wrote:
> On Wed, May 22, 2024 at 11:02 PM David Wei <dw@davidwei.uk> wrote:
...
>>> +                      */
>>> +                     if (!skb_frag_net_iov(frag)) {
>>> +                             net_err_ratelimited("Found non-dmabuf skb with net_iov");
>>> +                             err = -ENODEV;
>>> +                             goto out;
>>> +                     }
>>> +
>>> +                     niov = skb_frag_net_iov(frag);
>>
>> Sorry if we've already discussed this.
>>
>> We have this additional hunk:
>>
>> + if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
>> +       err = -ENODEV;
>> +       goto out;
>> + }
>>
>> In case one of our skbs end up here, skb_frag_is_net_iov() and
>> !skb_frags_readable(). Does this even matter? And if so then is there a
>> better way to distinguish between our two types of net_iovs?
> 
> Thanks for bringing this up, yes, maybe we do need a way to
> distinguish, but it's not 100% critical, no? It's mostly for debug
> checking?

Not really. io_uring definitely wouldn't want the devmem completion path
taking an iov and basically stashing it into a socket (via refcount),
that's a lifetime problem. Nor we'd have all the binding/chunk_owner
parts you have and probably use there.

Same the other way around, you don't want io_uring grabbing your iov
and locking it up, it won't even be possible to return it back. We
also may want to have access to backing pages for different fallback
purposes, for which we need to know the iov came from this particular
ring.

It shouldn't happen for a behaving user, but most of it would likely
be exploitable one way or another.

> I would say add a helper, like net_iov_is_dmabuf() or net_iov_is_io_uring().

We're verifying that the context the iov bound to is the current
context (e.g. io_uring instance) we're executing from. If we can
agree that mp_priv should be a valid pointer, the check would look
like:

if (pp->mp_priv == io_uring_ifq)

> Checking for niov->pp->mp_ops seems a bit hacky to me, and may be
> outright broken. IIRC niov's can be disconnected from the page_pool
> via page_pool_clear_pp_info(), and niov->pp may be null. Abstractly

It's called in the release path like page_pool_return_page(),
I can't imagine someone can sanely clear it while inflight ...

> speaking the niov type maybe should be a property of the niov itself,
> and not the pp the niov is attached to.

... but I can just stash all that in niov->owner,
struct dmabuf_genpool_chunk_owner you have. That might be even
cleaner. And regardless of it I'll be making some minor changes
to the structure to make it generic.

> It is not immediately obvious to me what the best thing to do here is,
> maybe it's best to add a flag to niov or to use niov->pp_magic for
> this.
> 
> I would humbly ask that your follow up patchset takes care of this
> bit, if possible. I think mine is doing quite a bit of heavy lifting
> as is (and I think may be close to ready?), when it comes to concerns
> of devmem + io_uring coexisting if you're able to take care, awesome,
> if not, I can look into squashing some fix.

Let it be this way then. It's not a problem while there is
only one such a provider.

-- 
Pavel Begunkov
