Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9238B43BF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 04:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A69112633;
	Sat, 27 Apr 2024 02:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3LV266U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4A112633
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 02:11:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso461170566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 19:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714183881; x=1714788681;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCqXmA+0tJPmuPol3Ypy0jPmfZ3hkXnnk0DE4uLAUwU=;
 b=3LV266U+wilJfo6JNr4t4UmCXnwLI6/tGYOn4f/pxw7TaJ2EuXAs00qYSAOEAAOO65
 /wW8d0elyV2bpwSzXqVXVbdlnvJHpbOQYwRoJa72SlRxJHm8o7j/DhknoLnFa0nNdQPO
 W+Z5f+cAqX7bcUB34iAwODZ67XF9EmYIwU9mrLsZ1RCQd6uyyG/1xnQQ/O5BOF777KfX
 /+u+nODnPV1ckKP5xQ/0XJQLBCYVGUXy64yDKgFrsDFOVVr9rpTjyLPwVsGC5bJqBDea
 bvEZemJf7tOt+EvQLuHwER2ckSTOSZeJ5mjiEUYpRxoi2xhTlaConAtukMr9XqXuXOn7
 ExcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714183881; x=1714788681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCqXmA+0tJPmuPol3Ypy0jPmfZ3hkXnnk0DE4uLAUwU=;
 b=oN+ZscHK0wKgE3w98Aoo7ymNa9GjqpX5zqBFbHGvmZBYAXspV3VvroMacz/brqgMdK
 5F2/CZ0cGjuDy/+OZ4tjwrtHvwv6wSwkYtjt8jNPBKlb+NaaXqaCSR3/nSj94VB1i/dY
 rloAw2iigX7w+xDmpWg9XZQqcGSQIPeNPUrvRMMdnAa6uChZyeSCza3ve4VkDCdaCJm2
 hfQGXUsI9M9uowjvgRC9Sla42lAwbay6PS3TNmW18uaottjTQxhHDPzOahfCN8A5/iMB
 YT1VUpWjoDWbvTBKgVzb0/ZH4T2mcPhR3m5WSrapOUqNpJXvA3RSh5qlFZuaXDMLwHP1
 HgaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVMcCFzCO1L6FjGxgQQ2xQh30kYMZ9qrrZpqJ3/ECCyF05gcxPrVVjeXO/z9+/TGYdU+3soep8YMAhZd4uufO8ZZsESDj4eQ/64LgR7LTo
X-Gm-Message-State: AOJu0YyQwid2Q0dhSqP9vLV7+8A5C5ltaQCUvmPa9SJ6o/ZI3zdi4Cug
 HlM5JeLx4SfHLh0fAQVxgRUeHQ4lojb2JWza9gif3bIEHLYCKwvljihCnihhAm7ed4RbvMu8PTE
 otGJMoSiaH6QMgr/EuAUX0/x7BYiMdjyL6NUh
X-Google-Smtp-Source: AGHT+IGYpMq0S7NMYmgbheltdqICqswpFYbRt1nWr9f34ViEhM+DD9iOxk080j42Jd8vuPQgs8NIkJRSPoJ58AydrBw=
X-Received: by 2002:a17:907:a49:b0:a58:c550:a102 with SMTP id
 be9-20020a1709070a4900b00a58c550a102mr4510853ejc.29.1714183880204; Fri, 26
 Apr 2024 19:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-8-almasrymina@google.com>
 <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
In-Reply-To: <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 26 Apr 2024 19:11:07 -0700
Message-ID: <CAHS8izPeYryoLdCAQdGQU-wn7YVdtuofVKNvRFjFjhqTDsT7zA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 07/14] page_pool: devmem support
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, 
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
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 26, 2024 at 5:18=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-04-02 5:20 pm, Mina Almasry wrote:
> > @@ -69,20 +106,26 @@ net_iov_binding(const struct net_iov *niov)
> >   */
> >  typedef unsigned long __bitwise netmem_ref;
> >
> > +static inline bool netmem_is_net_iov(const netmem_ref netmem)
> > +{
> > +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_DMA_SHARED_BUFFER)
>
> I am guessing you added this to try and speed up the fast path? It's
> overly restrictive for us since we do not need dmabuf necessarily. I
> spent a bit too much time wondering why things aren't working only to
> find this :(

My apologies, I'll try to put the changelog somewhere prominent, or
notify you when I do something that I think breaks you.

Yes, this is a by-product of a discussion with regards to the
page_pool benchmark regressions due to adding devmem. There is some
background on why this was added and the impact on the
bench_page_pool_simple tests in the cover letter.

For you, I imagine you want to change this to something like:

#if defined(CONFIG_PAGE_POOL)
#if defined(CONFIG_DMA_SHARED_BUFFER) || defined(CONFIG_IOURING)

or something like that, right? Not sure if this is something I should
do here or if something more appropriate to be in the patches you
apply on top.

I additionally think you may also need to run the
page_pool_benchmark_simple tests like I do in the cover letter to see
if you're affecting those.

--
Thanks,
Mina
