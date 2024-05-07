Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB198BEA7B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1110ECD3;
	Tue,  7 May 2024 17:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HWnMQLCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D9610ECD3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:25:47 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so21867945e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715102746; x=1715707546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hH2gwlX9CIjp5iuBC0nf4yhM48L0bVqOBBwTo5W8RyY=;
 b=HWnMQLCbN9xuQKTtguD9h1fJJlDU7gi+4OTZM5cwc0efN8isoBVnVleTdDoX3gv7pX
 frKQkvaquZvq6wL+wZu7N58HrcqulVV/WkAWq4w9rCzAr+YoEIhKlqN8973shMSBUmyh
 +/fvpUheMYvh/EumqgWhT+wKQWvw6z3A686UjV3Dkf6cHJmIQUfKQVtpKZbDsX1bBCbK
 jX7Vb+S72C6ft3ocp75NB3G2uAf1M/MWD2kvOBQ8nxyltwsQEIGTFNFS/opBf4YueZ30
 21/EYfFQQTAfVGwCbtcB4xOhOltUqzzB9VnQlN2B+STHwSKFuJ155/dggDLEeaTMhUO0
 4VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715102746; x=1715707546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hH2gwlX9CIjp5iuBC0nf4yhM48L0bVqOBBwTo5W8RyY=;
 b=Qa5sCddZBd/ZFuHSiF3h3JBtfhJQ9WLB9C1Mb+ong6wROGriPdoETWmjIkaGIgZ3Hr
 a9mDO3HmqvCvfsQMPSSZ6qMj2h3ajUlLZqQVhLGoCRHXbZsXfubdRTy8f33hfxCzMrNT
 pVPHI7X9sHeWnKDVdAYeo5cRDmZBqFSXVPklOEWrMl6+O4Nr+gB28dpwVFxYuVUZJ9kP
 Z+TvbAxCP+xvDFwvc4pj4Qirw4iCIo3OzDQ7SFsFy3yolpBQwzkfBIeODMNjx6FjJ0Rr
 KI4OmMfwoo82plt24/rBdh4szDk98L8DZpnrMKFFjjUCsAl6ysQgSmU8d+ZXJRCKrAlA
 j9IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVorziN6cboBmz/ThcxDBo3tOGEaDSRYKAIvNsUbw1CrdAHPGxnWJPHJd2G3BdhKKM17jrQwtXcf/5wdu8c9wCOhxB9fe4GVlHKx7FAVOhJ
X-Gm-Message-State: AOJu0YyUwpWvxQ8IUbS+i8gu34sLQtFLexu9Oga39zaAkaVd2HuxB+EJ
 mDlaZ7c1EY6IJV3OvETMo8y4/0vtiXZvr60tzU2mTCC9Nn6+KYmv
X-Google-Smtp-Source: AGHT+IF8VqTV1BUapN1EV+Wyp48hykZoX+S626zj6EDdX9l6sa2/8vTRY34QFeCfF+VTNplXaFTyXQ==
X-Received: by 2002:a05:600c:46ce:b0:41b:e609:bc97 with SMTP id
 5b1f17b1804b1-41f71cc1512mr3537475e9.2.1715102746162; 
 Tue, 07 May 2024 10:25:46 -0700 (PDT)
Received: from [192.168.42.69] ([85.255.235.91])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c4e9400b0041b5500e438sm20349790wmq.23.2024.05.07.10.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 10:25:45 -0700 (PDT)
Message-ID: <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
Date: Tue, 7 May 2024 18:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>, Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Christian Brauner <brauner@kernel.org>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Florian Westphal <fw@strlen.de>, Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240507164838.GG4718@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/7/24 17:48, Jason Gunthorpe wrote:
> On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> 
>> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
>> think in the past you said it's a uapi you don't link but in the face
>> of this pushback you may want to reconsider.
> 
> dmabuf does not force a uapi, you can acquire your pages however you
> want and wrap them up in a dmabuf. No uapi at all.
> 
> The point is that dmabuf already provides ops that do basically what
> is needed here. We don't need ops calling ops just because dmabuf's
> ops are not understsood or not perfect. Fixup dmabuf.

Those ops, for example, are used to efficiently return used buffers
back to the kernel, which is uapi, I don't see how dmabuf can be
fixed up to cover it.

> If io_uring wants to take its existing memory pre-registration it can
> wrap that in a dmbauf, and somehow pass it to the netstack. Userspace
> doesn't need to know a dmabuf is being used in the background.

io_uring's pre-registered memory is just pages, but even that is
going to be replaced with just a normal user buffer pointer.
Regardless, io_uring can wrap pages into a dmabuf, but it's not
a direct replacement for the ops, it'd mandate uapi change in a not
desirable way.

-- 
Pavel Begunkov
