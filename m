Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A4913F5C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 02:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112D10E0F8;
	Mon, 24 Jun 2024 00:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TOKGkXqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556110E062
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:12:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a6fdd947967so144961666b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719187965; x=1719792765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvaQpB4RyD6IuxTPoGyM/+nSxIU6CnaaMjIhdH54n8k=;
 b=TOKGkXqZqjCVjzBPxsuUzvuPe+uRP6KgHX0agPFie/e1WygpnBEjslV/QumjGMj9Lm
 6eNuyRh5VYcO8yaGSAoezvEZXuVPJrmszdA3U9w0T6CBDgMNEKH3PVnWCf4zNkaYPWit
 2U0MCetNtJPxbbA9vfOdyg8SZCTdk6TNhVMz6vrT01MFN7FS57vhAmAutu9fh5pnDokn
 hSSmQQvRCNwq+ohYrvbpX3eOz01SeqWYAedD4/1IvMa+XIVmVmPplMUt/wLcmeq7v16Y
 US+UyJJRMwnou4jBy3/gcrPalv6ljWU0VQhnG8cvO1ZQkA9zKj437g21ymYOh6FZdjVv
 1DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719187965; x=1719792765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VvaQpB4RyD6IuxTPoGyM/+nSxIU6CnaaMjIhdH54n8k=;
 b=ODBZzUgyz8DL8QGrwryN0r49PQCeY6S6ikAN62G+PABmUMmPcQt8/oLRal5s4LcYqe
 E1obxcoLGiBOzgaoj+7EjR81806itwmrHzHTQDWUT1ewGe7NKGXpVKDhmEV1pH2BaauU
 ogPmvqu+pz5fNRaoz3kBtBPyuMyeMkbF6c4PFKHkZxOUwsPKY1P8YIZM6IbufaQQ5QpK
 BZ4mqQPaThCTB0iLjfHje4s0qQoFoszPQT5rJEuEmHRb79fBV3LKKvcG+Sr3OK/exgCz
 DH5+p+nrsXbHBCF5CQiwOji8fjuDJRF9mPL6glGvijykCvzTWUUPewnfYjisoQrl97JD
 y/1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlae4TSoe0z7+P6wYyv3yYP79AD+l/idlv7P2SKaTb4zJYTR3rnXjOg4dtHkK+pautODa5YkehuIUE1xqiUrQI9BwMfryXaUQAW6pEIOa6
X-Gm-Message-State: AOJu0YyGkfIClELwjedN8nuOorjs3z2mEyHnawwaPnFydahWVwEF8lqE
 7oFgFzeSxgepDuIqwwn3nBCA1aJKtUvJO8GL33p0BUkGUwwmXKrl
X-Google-Smtp-Source: AGHT+IGgM4Pak9lc8GEauUfyhm0F0Xk1SzKJKpjX/HE+7j2CHx6ksKDfL8SEj9rmyvNGMfWyx9JATg==
X-Received: by 2002:a17:906:2657:b0:a6f:2e80:6e04 with SMTP id
 a640c23a62f3a-a7245ba3902mr238843866b.19.1719187964975; 
 Sun, 23 Jun 2024 17:12:44 -0700 (PDT)
Received: from [192.168.8.113] ([148.252.133.212])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72479f360bsm142254266b.173.2024.06.23.17.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 17:12:44 -0700 (PDT)
Message-ID: <c9333388-6906-4df9-92b4-ecfd324f5891@gmail.com>
Date: Mon, 24 Jun 2024 01:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 06/13] page_pool: devmem support
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-7-almasrymina@google.com>
 <439590d4-0f05-4f5e-80ec-e7fdf214e307@gmail.com>
 <CAHS8izNr4x6SW0oY_VJDPZOsrBQEAyJO1qVJQbu8VNJQMtX9Sg@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izNr4x6SW0oY_VJDPZOsrBQEAyJO1qVJQbu8VNJQMtX9Sg@mail.gmail.com>
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

On 6/21/24 19:48, Mina Almasry wrote:
> On Mon, Jun 17, 2024 at 7:17 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
...
>>>    static inline unsigned long netmem_to_pfn(netmem_ref netmem)
>>>    {
>>> +     if (netmem_is_net_iov(netmem))
>>> +             return 0;
>>
>> IIRC 0 is a valid pfn. Not much of a concern since it's
>> used only for tracing, but might make sense to pass some
>> invalid pfn if there is one
>>
> 
> AFAIU all non-negative pfns are technically valid pfns if the machine
> is big enough.
> 
> I could have this function return long long instead of unsigned long
> so I can return a negative number for errors, and then cast to
> unsigned long when I figure out it's actually a pfn. Seemed like such
> a hassle especially since the call site is just tracing that I figured
> it's not that worth it.

Yeah, sounds like an overkill for tracing

> 
>>> +
>>>        return page_to_pfn(netmem_to_page(netmem));
>>>    }
>>>
>> ...
>>>    static inline netmem_ref netmem_compound_head(netmem_ref netmem)
>>>    {
>>> +     /* niov are never compounded */
>>> +     if (netmem_is_net_iov(netmem))
>>> +             return netmem;
>>> +
>>>        return page_to_netmem(compound_head(netmem_to_page(netmem)));
>>>    }
>>>
>>> +static inline void *netmem_address(netmem_ref netmem)
>>
>> I don't think it's used anywhere, do I miss it?
>>
> 
> Ah, It's used by the GVE devmem implementation:
> https://github.com/mina/linux/commit/da89baa81873d457cbf7b49ee6b4f0d66855b205
> 
> I could leave it out of this patch, then add it with the follow up GVE
> devmem implementation, but I figured almost for sure drivers are going
> to need this eventually, and it's small, so just put it here.

Either way is fine by me, checking the function is not leftovers


-- 
Pavel Begunkov
