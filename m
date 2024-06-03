Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD288D857A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 16:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2310E248;
	Mon,  3 Jun 2024 14:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J9bOJb/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618510E248
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 14:52:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57a68b0fbd0so781341a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717426350; x=1718031150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DFaFTQnu+hpbSIZgsrwPb2+pTUe1zvaznlAq9n5uYoY=;
 b=J9bOJb/70NlIr4JOpEWiZ+1/nA2AJW0gfVEZlEzE56SOCsCdYBi3cf7XVqXJZik9FV
 QClf/mtGHHpjZLuu5XPPzMn2cU6TUSnV8lJ8U+lZN/mTAsyaNzDqm6fJyGrI835D9lxt
 y9KUVFS22rZdqjavWAEGGygPd3eb14csWt+LQqvRg0ZOSkjiliGg4h6OO09wUJFO479b
 Urq86s9I86WGaASQ8Wrn04zl7HZtVHf19FgM0F7Ajd6iHNw6nc5ANDiJA9I8/8pD/2MK
 JkDj+RqYTcWxHG2CbMW1o7D4+fPKlSI5bevRb3kPijhAfbYi0caXfwMO3BMBwuABAS7k
 5Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717426350; x=1718031150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFaFTQnu+hpbSIZgsrwPb2+pTUe1zvaznlAq9n5uYoY=;
 b=lObJo7RaiOYIoRdIyl2PCst8fBTju16VXhzta+lCOI7FiAlVYQyNYFC6sgXFRywnlX
 5TXhhsr8WzvWvufbIZhZv7CIH7WvMnUTRI/J8mTl7vFrHfXR/pfO9zUGvgdRI+Lyp1LU
 gm9t+6Haf8AdKF9LmR3VwPC7IPqgZpJEqCUmnEFJme/RohWd2AXSHmj1qyABw1Gejgyw
 UNfGyjaC/VXw4E4ULhips6qPy26Ul06PE7Y9I875b1aKRjDq0J5xtVImJkdq4FXnt/nC
 ROS/sT9HpFAHyiSQL0gR3mDK+p9ZY2qlqQha6pUE/BnJ/QRs6s3ODYyuwxjbcs/hbhGV
 abQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMRXAkwtGgg/F5sCyF48cBXUjB4H6FlcR7sNLlqmSB9N58Ks9xQ6Q7FuowMJlciJMpxE4NHZiC9L7Cel0jLagExpEqi6hCJXVzrOvU7rGB
X-Gm-Message-State: AOJu0Yx/uyIa3/2G8GO7zujdzgtA578fVFotIP+LEeGeI8U/12ajPj+o
 y1Hi46Zbcea63KZgt81gYGDaL1RK2GWw7NGrS0756jqAkauQD6WP
X-Google-Smtp-Source: AGHT+IFgHeYMPC1F2CzjSrGxnlZt3dlTY/4mpUD7bv8LIwoX5HsdsamER8RdMH7fBsEWw3jyn6a+HQ==
X-Received: by 2002:a50:8d4f:0:b0:572:a731:dd14 with SMTP id
 4fb4d7f45d1cf-57a36450a67mr5894483a12.28.1717426349978; 
 Mon, 03 Jun 2024 07:52:29 -0700 (PDT)
Received: from [192.168.42.244] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4df2sm5365768a12.47.2024.06.03.07.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 07:52:29 -0700 (PDT)
Message-ID: <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
Date: Mon, 3 Jun 2024 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
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
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
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

On 6/3/24 15:17, Mina Almasry wrote:
> On Fri, May 31, 2024 at 10:35 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Thu, May 30, 2024 at 08:16:01PM +0000, Mina Almasry wrote:
>>> I'm unsure if the discussion has been resolved yet. Sending the series
>>> anyway to get reviews/feedback on the (unrelated) rest of the series.
>>
>> As far as I'm concerned it is not.  I've not seen any convincing
>> argument for more than page/folio allocator including larger order /
>> huge page and dmabuf.
>>
> 
> Thanks Christoph, this particular patch series adds dmabuf, so I
> assume no objection there. I assume the objection is that you want the
> generic, extensible hooks removed.
> 
> To be honest, I don't think the hooks are an integral part of the
> design, and at this point I think we've argued for them enough. I
> think we can easily achieve the same thing with just raw if statements
> in a couple of places. We can always add the hooks if and only if we
> actually justify many memory providers.
> 
> Any objections to me removing the hooks and directing to memory
> allocations via simple if statements? Something like (very rough
> draft, doesn't compile):

The question for Christoph is what exactly is the objection here? Why we
would not be using well defined ops when we know there will be more
users? Repeating what I said in the last thread, for io_uring it's used
to implement the flow of buffers from userspace to the kernel, the ABI,
which is orthogonal to the issue of what memory type it is and how it
came there. And even if you mandate unnecessary dmabuf condoms for user
memory in one form or another IMHO for no clear reason, the callbacks
(or yet another if-else) would still be needed.

Sure, Mina can drop and hard code devmem path to easy the pain for
him and delay the discussion, but then shortly after I will be
re-sending same shit. So, what's the convincing argument _not_ to have
it?


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
>          else
>                  netmem = __page_pool_alloc_pages_slow(pool, gfp);
>          return netmem;
> 
> 

-- 
Pavel Begunkov
