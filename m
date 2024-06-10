Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23BC902B69
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 00:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C53D10E072;
	Mon, 10 Jun 2024 22:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iDkaYaYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC710E072
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 22:15:06 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6b0745efaeeso8862586d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718057705; x=1718662505; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fYxIeKtLL3lQwNiFRr25O1e9GIX4G5slG5d4Uc4G46M=;
 b=iDkaYaYComd1vgnb0htfM7rCeWkk8xuRRBvz4ayZ1wz81ZVUIJhbydM4R2w7+G5LzS
 bXyQIB84AdPIjErpMLQFpgk18bCaC8fCqgn1gROxJWal2Oixiif6nDcliO1q0B4xYUq9
 +aaqKCYnHOUjEYvNAy5CgVa6J1dWGa0v36MPtL4ZOOHqcc7DHpPudDX46b7imFOMHEeW
 kEscLAh2oWKchqHxrwci1MxHGxD9BkGNGqejZ0FddPc4I0sSWmXF0g6y0PQ2Hzd8sj/4
 i3dEYn9DsOHein+Ww+6urYS98G0AiJ4oh6sCFeiOz7mFXzI+FxyuTFdH2KoJeTdcS7WV
 uJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718057705; x=1718662505;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYxIeKtLL3lQwNiFRr25O1e9GIX4G5slG5d4Uc4G46M=;
 b=pscApLXt8qEVfzDjf4EMY7ZRPeiAAmxxs0Ed219lbT7MWzUQjDDbT+V0kJU9ZRWvsK
 gIO4onhlClf7rxvBdC9xVylVa6HHCJQr2zlWPwkSHgJs1WM2zyc2YKQuZY3n25YDRm7w
 rn8CGzH0u6qxxFY6/nBH/mf1pN45Z2iazbk0VGk5VmOcip3oYqhUtmNcOARRTms6Cq+l
 6rE4+XjPuYc06LWRvkLVz/2K7WI1Y6mSYBLTd7PjqEX2wm8UmFsPHVaSDqYAHpCdKQ0M
 dQNulf5mAp3/xcVCN7zOKHaWM66/29iO6KJVPEW8167JCWAN5s89xmoDW6XQeO3Ff+qx
 W3dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5RYMgq3mGzbF3SeTXDf+vhPJL/q70l8VZAyvlPa9qbvkAWcBUXzje+aWFq34iFt0w3jSDtjVYML5JDs3Oe6AypkONkuf/XMUfU72Os9u3
X-Gm-Message-State: AOJu0Yynu6Lr4llKXhskrbX7cKJZHq9v8TgIqgx48SDaaZLrZWiF0pd5
 JVesmt9lJZhDhhpNrJly0MDVui6aRyDyszEjYP/lqmIr5wCF57epYK9yHQkmau8=
X-Google-Smtp-Source: AGHT+IGNwK7dorh82QSLW5MV/WzZAixZNPt6ZilaFo6ceP30TQ1KYPRJL2ImTAjvrOrdYOBtAU+f5Q==
X-Received: by 2002:a05:6214:4a06:b0:6b0:72ef:2877 with SMTP id
 6a1803df08f44-6b072ef2a2bmr79573716d6.40.1718057705068; 
 Mon, 10 Jun 2024 15:15:05 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b076a42242sm20947266d6.59.2024.06.10.15.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 15:15:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sGnI4-00FsKs-9Z;
 Mon, 10 Jun 2024 19:15:00 -0300
Date: Mon, 10 Jun 2024 19:15:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
 Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240610221500.GN791043@ziepe.ca>
References: <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
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

On Mon, Jun 10, 2024 at 08:20:08PM +0100, Pavel Begunkov wrote:
> On 6/10/24 16:16, David Ahern wrote:

> > > There is no reason you shouldn't be able to use your fast io_uring
> > > completion and lifecycle flow with DMABUF backed memory. Those are not
> > > widly different things and there is good reason they should work
> > > together.
> 
> Let's not mix up devmem TCP and dmabuf specifically, as I see it
> your question was concerning the latter: "... DMABUF memory registered
> through Mina's mechanism". io_uring's zcrx can trivially get dmabuf
> support in future, as mentioned it's mostly the setup side. ABI,
> buffer workflow and some details is a separate issue, and I don't
> see how further integration aside from what we're already sharing
> is beneficial, on opposite it'll complicate things.

Again, I am talking about composability here, duplicating the DMABUF
stuff into io_uring is not composable, it is just duplicating things.

It does not match the view that there should be two distinct layers
here, one that provides the pages and one that manages the
lifecycle. As HCH pushes for pages either come from the allocator and
get to use the struct folio or the come from a dmabuf and they
don't. That is it, the only two choices.

The iouring stuff is trying to confuse the source of the pages with
the lifecycle - which is surely convenient, but is why Christoph is
opposing it.

Jason
