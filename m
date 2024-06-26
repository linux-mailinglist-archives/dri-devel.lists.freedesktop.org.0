Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71401917F4A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096FC10E859;
	Wed, 26 Jun 2024 11:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="Mh61quaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ECD10E841
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:14:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57d4ee2aaabso114655a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1719400474; x=1720005274;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EtgNgXw4xx+u3otM9wLzx6tVvs8OZ+sqt5uPSGOj0/8=;
 b=Mh61quaNuWEvLqHalaH+Ts8oW8/lJmSOpE5P8FIODPc4xDnD7giR2BpXsr+nq0jlch
 jnCLBG8e2Y05Q+28DJJukxSChcA0wC72riLBTMUbEongAN/uh7gTMWMBXnVSaqTtdQRz
 Ywct67YMSH8ES8kOTr6ZJgNosdmhcqK7S2gzQRQn3wc9pA/i4j7rfNR0B+8wU1U+6JQc
 BeZGHtK5nA9n6pi0GmXCwxC/gXUURwvcsy27IPcG6NJnILkOyiJGYQgwp1+FhHzwkk6G
 DjZNE3hVongpsti0ttGmnfT5os4kwVUID8AVb9xdnhssguENz9zb+d1xHKKnfOQWy79A
 KPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719400474; x=1720005274;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EtgNgXw4xx+u3otM9wLzx6tVvs8OZ+sqt5uPSGOj0/8=;
 b=if4oXFt/+uvhPKXkc5yfDp4Bb2vTjTpPXcVodHKJg/TdyEOotrdjDeeHlswTZmF5vB
 Ob1o8PXUcqVgmUDl69DepUVnj3PpO/uB5UO33/A8RC1QcCL7PzZ9KnmKs2K4xr4g01JX
 hp5NdJwy/QXQehchdqLYHmj4wm7aQYRNNvvfk4sp5ze9XVnl9p9FZg9t5K4FYjtyTftN
 Bd2N7NWMoFXSg+njpCTjZzdeUPwDbRxIxMNpW7/BOstK4zBQaGUhzP11yvCGOGshlvDt
 LASO6+6si19rvBRj7D6JkdoA7K7juLW9bYQJZuzqMadQDxyiBvnbbILcky43YEL32Q1w
 riJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbWUTs7AUK9rSwcPMHv7jsY7pLQX/AqgEJS9eJVdofG8gkyTHfM9iBKkNXtlBF0TksPEmS8nyfmy7NkDXUNtGd1OKux2fnWyHtU4u8iqRG
X-Gm-Message-State: AOJu0YxKM0/kbpSzq1LLi471EPKszDKA7GYKSOC4BYx0UofRFLeQudoE
 rBcCzldLuiZiDZFp1qT/bTAekG7Dmqyt8YcqKh/xNbXPajDnYGMZWEMqc5nTRSk=
X-Google-Smtp-Source: AGHT+IGayyA9DDFhDYoFM+ga8k4lnKPETjVZJrjYalViZSne124FOI0Yd/seFB4YsVb6tDnNMrZMyg==
X-Received: by 2002:a50:d79e:0:b0:57d:101f:ae9f with SMTP id
 4fb4d7f45d1cf-57d4bdc76c9mr6673624a12.33.1719400473452; 
 Wed, 26 Jun 2024 04:14:33 -0700 (PDT)
Received: from [192.168.51.243] ([78.128.78.220])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d303d7b26sm7088836a12.3.2024.06.26.04.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:14:33 -0700 (PDT)
Message-ID: <1d0483b9-13bc-426e-a57a-69044d5098c1@blackwall.org>
Date: Wed, 26 Jun 2024 14:14:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 11/13] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
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
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240625195407.1922912-1-almasrymina@google.com>
 <20240625195407.1922912-12-almasrymina@google.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20240625195407.1922912-12-almasrymina@google.com>
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

On 25/06/2024 22:53, Mina Almasry wrote:
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for reuse.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v10:
> - Fix leak of tokens (Nikolay).
> 
> v7:
> - Updated SO_DEVMEM_* uapi to use the next available entry (Arnd).
> 
> v6:
> - Squash in locking optimizations from edumazet@google.com. With his
>    changes we lock the xarray once per sock_devmem_dontneed operation
>    rather than once per frag.
> 
> Changes in v1:
> - devmemtoken -> dmabuf_token (David).
> - Use napi_pp_put_page() for refcounting (Yunsheng).
> - Fix build error with missing socket options on other asms.
> 
> ---
>   arch/alpha/include/uapi/asm/socket.h  |  1 +
>   arch/mips/include/uapi/asm/socket.h   |  1 +
>   arch/parisc/include/uapi/asm/socket.h |  1 +
>   arch/sparc/include/uapi/asm/socket.h  |  1 +
>   include/uapi/asm-generic/socket.h     |  1 +
>   include/uapi/linux/uio.h              |  4 ++
>   net/core/sock.c                       | 61 +++++++++++++++++++++++++++
>   7 files changed, 70 insertions(+)
> 

FWIW,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


