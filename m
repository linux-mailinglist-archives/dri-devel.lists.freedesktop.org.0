Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0C8B4328
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 02:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27D1125CB;
	Sat, 27 Apr 2024 00:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="s4xP+zki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5E21125CB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 00:18:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1e65b29f703so24998365ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1714177080; x=1714781880;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqmTGkP664boJRzjhc7S0Gtd26iWZty8vGuCMms+S1o=;
 b=s4xP+zkinGKI6y0n5oxCZ0ALFi1ELZi2bNcb/Dz7cigmmVQ9V0GkfYy8/Xlz9srzWX
 6J3+2PZRUuDliExMhjF5aNcQIle68BQ5UOhpAFvYPW2XOAP32k+qi/m2DG+Ag5DrMY3q
 010YYua1fWiEJyqcxr189FXNDo/Gfbk9KdM0Rj8oPzN3l0bUt+46d75KN4+zo7b1pRpd
 EYfBEeG01OkswREND9+4mn+GNy0PZDQGgenfTmgfCBTJzkIge9uFxm6+YXw1qJ9rRvze
 7B7MxK6W3HsjORCWvVf6uzu1PCQualodDiM/juJA862w11fYVMMMVM++768rP0ebDkrE
 18tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714177080; x=1714781880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqmTGkP664boJRzjhc7S0Gtd26iWZty8vGuCMms+S1o=;
 b=Gn/mzuR7864pKl8snx8NPZYwmN9QjlufDA4xbdk8ouWEiPyZdAjkso3zDYgi2QAvGL
 D/mKK4CJhJ5BMEh9N5OMVFwDTlC2Yx99H1E2riM4JSBpl/FP1PnzJlEnSGWLRqBawAyn
 IiWH8qg9+gBG1rv+YSN46f8VlIxfov8R2KU3WwJoEhkeAvO8tnrYRrUeyDmn/L9CLCsS
 +pODvfy3PKZiqFn/hrquFENyRyel7tk3EGyksxxYErQO+nQB+cZZZQEPx5GkQk3N+vh3
 Ie/A+HaFqF2vukM/JkdPc/0UknSijvNc9hpEFV3OJNj4rnOybaLMU8kbfpQYvjP9AkA/
 /yYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjobsvHvSb7gp3j4iN2HiST0NCWAmpV7kqLIuPJbb7iEe7Zox5a9vJ/yPKE7F2uALGhjaC2qodhbbyq8PByn7MxYVa76hgwJuqWefbfQik
X-Gm-Message-State: AOJu0Yz0cWYNO8TLeVwXdx4WrrQn81GlSiwmUFPga4QUesCZZk57s7cB
 N3rXiROVdRO4oalB4o0FRbEDERy8ZjGAj4FJBKTRmQT50n5Cb0DGXBgqEwhEDFg=
X-Google-Smtp-Source: AGHT+IFUGAssCWxanm0G+5JJGXLl3jlzm6HCFUo2+VTIRf+pchJBS1TwIepfoN9/ZtJkA2EtuVR6aQ==
X-Received: by 2002:a17:903:8ce:b0:1eb:5682:1ec0 with SMTP id
 lk14-20020a17090308ce00b001eb56821ec0mr584629plb.45.1714177080246; 
 Fri, 26 Apr 2024 17:18:00 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1256:2:c51:2090:e106:83fa?
 ([2620:10d:c090:500::4:916b]) by smtp.gmail.com with ESMTPSA id
 o9-20020a170902778900b001e51b690b7dsm16004827pll.295.2024.04.26.17.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 17:17:59 -0700 (PDT)
Message-ID: <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
Date: Fri, 26 Apr 2024 17:17:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 07/14] page_pool: devmem support
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-8-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240403002053.2376017-8-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
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

On 2024-04-02 5:20 pm, Mina Almasry wrote:
> @@ -69,20 +106,26 @@ net_iov_binding(const struct net_iov *niov)
>   */
>  typedef unsigned long __bitwise netmem_ref;
>  
> +static inline bool netmem_is_net_iov(const netmem_ref netmem)
> +{
> +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_DMA_SHARED_BUFFER)

I am guessing you added this to try and speed up the fast path? It's
overly restrictive for us since we do not need dmabuf necessarily. I
spent a bit too much time wondering why things aren't working only to
find this :(
