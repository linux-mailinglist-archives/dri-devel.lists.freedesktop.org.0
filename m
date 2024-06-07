Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1FA900540
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A831E10EC4C;
	Fri,  7 Jun 2024 13:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k9N2TeHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B5010EC4C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:42:53 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so291713266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717767772; x=1718372572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XQvJWXNRaDSMtIW4Jv2ND5NqVCptWS7FYEPyb+9ayJA=;
 b=k9N2TeHUS3YIj/gdIyf3JAZ308Xi1lOpWWXqx+at3FEDWKmpLqTKo5h+lGJs9lKIem
 0V1qCCKPkn/hyS2hgn2GHPOgI3RWBlLQdzy/7O4z16WrURr4ieEQuirGT6sMHTURPm4X
 yTgFc+N0QgyUimNw0Fejrp9xDqw1PewuEJQ/zQFXID6gLP1ur7ZQ7kMiqRn9JzaoQE5Y
 ZQ+V0yLHMy3o8RnznPyiq8i2xk9uW1hX17yfMcm3h2O1ZDQ5/Ppyq0USmkqyRIUuR2DX
 1zUbistVP5yDMobn8v8afEhVPfa99OAnssHNrNSTv9oIwbSqjcRy8MKCrcGMsT6xeJwF
 IVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717767772; x=1718372572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XQvJWXNRaDSMtIW4Jv2ND5NqVCptWS7FYEPyb+9ayJA=;
 b=gyN+u6QS3rDiFXg8AkCBK3uIs1wBqtBuHpP0chK2TWRNiXZBIXKA6t5HmB5RhaCPBf
 Pn95IzLtrUSVMpEcSBJu1t19xLeQesswY5CarNmj+VOVcG6uRK7F5k8BjorYAp2uuxL3
 IMWDjs0iwca06IxyY0vpu2g5JpYBL2o3GQeotwa3ZLYZ/uUr9WIiRaZt6EAGb6YN6UTz
 IJ3ZN1IC4hxk9cwBjXasZJvEMbNNERIUEdXWc60ETMww3jplwKg2r/JxeMZYMl3ZIq7Q
 vEhqnogS8pHI7EyiUAUQqyB5Wv3FQRbiUGZOIzY4tbGZ9v9BC09QJA7KjwdxfaYG0mRi
 qkew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUXtbpDkGFFcpOuLLMutLnCedkqGy7fgPmd0H7r36BuK/a3j7ndzhA2kEp80yVUcIWkb7k2KQT37bLOA30VEP6xbwkJBE1fxvFhMtSxEPE
X-Gm-Message-State: AOJu0YxqtRg8m5Ha02Nu+vKdCt1Sgc/ZpydaK/lynG03+t8pYNW6YoyB
 9VpPP+drfHWQF9+hmmNBHzB6Mqi3DEALytOmc1NjMyUFjGskbrdi
X-Google-Smtp-Source: AGHT+IFclc2dDyjV0e9a5PXYgUTUusiUWbxIzgPbh6TUxBel8tm9M3qb2yzcyQfG8c9PwgVnd9uoBw==
X-Received: by 2002:a17:906:15c9:b0:a68:dff5:b153 with SMTP id
 a640c23a62f3a-a6cd75b3e98mr195015166b.33.1717767771673; 
 Fri, 07 Jun 2024 06:42:51 -0700 (PDT)
Received: from [192.168.42.51] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6e51c85a05sm68724866b.159.2024.06.07.06.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 06:42:51 -0700 (PDT)
Message-ID: <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
Date: Fri, 7 Jun 2024 14:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
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
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
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

On 6/3/24 16:43, Mina Almasry wrote:
> On Mon, Jun 3, 2024 at 7:52 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 6/3/24 15:17, Mina Almasry wrote:
>>> On Fri, May 31, 2024 at 10:35 PM Christoph Hellwig <hch@infradead.org> wrote:
>>>>
>>>> On Thu, May 30, 2024 at 08:16:01PM +0000, Mina Almasry wrote:
>>>>> I'm unsure if the discussion has been resolved yet. Sending the series
>>>>> anyway to get reviews/feedback on the (unrelated) rest of the series.
>>>>
>>>> As far as I'm concerned it is not.  I've not seen any convincing
>>>> argument for more than page/folio allocator including larger order /
>>>> huge page and dmabuf.
>>>>
>>>
>>> Thanks Christoph, this particular patch series adds dmabuf, so I
>>> assume no objection there. I assume the objection is that you want the
>>> generic, extensible hooks removed.
>>>
>>> To be honest, I don't think the hooks are an integral part of the
>>> design, and at this point I think we've argued for them enough. I
>>> think we can easily achieve the same thing with just raw if statements
>>> in a couple of places. We can always add the hooks if and only if we
>>> actually justify many memory providers.
>>>
>>> Any objections to me removing the hooks and directing to memory
>>> allocations via simple if statements? Something like (very rough
>>> draft, doesn't compile):
>>
>> The question for Christoph is what exactly is the objection here? Why we
>> would not be using well defined ops when we know there will be more
>> users? Repeating what I said in the last thread, for io_uring it's used
>> to implement the flow of buffers from userspace to the kernel, the ABI,
>> which is orthogonal to the issue of what memory type it is and how it
>> came there. And even if you mandate unnecessary dmabuf condoms for user
>> memory in one form or another IMHO for no clear reason, the callbacks
>> (or yet another if-else) would still be needed.
>>
>> Sure, Mina can drop and hard code devmem path to easy the pain for
>> him and delay the discussion, but then shortly after I will be
>> re-sending same shit.
> 
> You don't need to re-send the same ops again, right? You can add io
> uring support without ops. Something like:
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 92be1aaf18ccc..2cc986455bce6 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -557,8 +557,8 @@ netmem_ref page_pool_alloc_netmem(struct page_pool
> *pool, gfp_t gfp)
>                  return netmem;
> 
>          /* Slow-path: cache empty, do real allocation */
> -       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_ops)
> -               netmem = pool->mp_ops->alloc_pages(pool, gfp);
> +       if (unlikely(page_pool_is_dmabuf(pool)))
> +               netmem = mp_dmabuf_devmem_alloc_pages():
> +       else if (unlikely(page_pool_is_iouring(pool)))
> +               netmem = mp_io_uring_alloc_pages():
>         else
>                  netmem = __page_pool_alloc_pages_slow(pool, gfp);
>          return netmem;
> 
> So IMO, the ops themselves, which Christoph is repeatedly nacking, are
> not that important.
> 
> I humbly think the energy should be spent convincing maintainers of
> the use case of io uring memory, not the ops. The ops are a cosmetic

I haven't seen any arguments against from the (net) maintainers so
far. Nor I see any objection against callbacks from them (considering
that either option adds an if).

And just not to confuse folks, it's just user pages, not some
weird special io_uring memory.

> change to the code, and can be added later. Christoph is nacking the
> ops because it gives people too much rope [1].

Yes, it is cosmetic, just as much as removing it is a cosmetic
change. You can apply same "too much rope" argument basically
to anything.

Take io_uring, nothing would change in the process, it'd still
be sent to net and reviewed exactly same way, while being less
clean, with poorer subsystem separation, allowing custom
formats / argument list, etc. I think it's cleaner with callbacks,
Mr. Christoph has other beliefs and keeps coercing to them,
even though from time to time it backfires for the author, just
personal experience.


> But if you disagree and think the ops themselves are important for a
> reason I missed, I'm happy waiting until agreement is reached here.
> Sorry, just voicing my 2 cents.
> 
> [1] https://lore.kernel.org/netdev/ZjjHUh1eINPg1wkn@infradead.org/
> 

-- 
Pavel Begunkov
