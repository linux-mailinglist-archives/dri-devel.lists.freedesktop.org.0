Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6A88723C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 18:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F643112694;
	Fri, 22 Mar 2024 17:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4CExk2nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D825E112693
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 17:55:08 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56bc8cfc19fso2614252a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711130107; x=1711734907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WuYhmNp304wILfLv6V/aQkHKFavalWMa0RSWXYvrPw=;
 b=4CExk2nH/enQds+McYnJeZvP7jIjI2R0bkIM9O8wAFthiT6zni/LESAAfdxswSjwaT
 PgMxMXIZaNGhh5DzUVHxASIsu1x+I09Les05re9f1vcEiO+W/+r0XLj7BuEB+5LFqrby
 n8lie/JK0rTFFX3f6kXfgHSY3s3gcBIVmo0JnRG2mIJ1um7BIDi80iK4qjjqBE8zeaqb
 J5A8TXO7WjJwsNbikbt/GI0/71nPwO9SOR/ryhcOsHGbkfQSvqJf+9L7S8TRJyy/dVgV
 jln22cHpdnab/dqcns3D7ZxrOsZPdncV8XDLSd+BKe7qjWypi+i4Tke3OBr4/r2BFSt9
 5vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711130107; x=1711734907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6WuYhmNp304wILfLv6V/aQkHKFavalWMa0RSWXYvrPw=;
 b=k8z42ahAUz/3NVEnVEmZ0dl2+dG2zMNUoEH9J4j+rgitYSimiWQ5yQOJ7MWmPSXe5T
 lfGfSFEplsDJLNaU+tluHi0++qqRzSBEyPbVaAKETqUcqfbOBEen9kM9jD6a3t3JsRa/
 gsUvNiTPD1a2qgzQDC9CSrDFaGGujLz/tjPUb/Onx6NxzRbwwbI4OyVHcsyNkgyHZEY4
 8rpiqrIePje/D1iwcRA+FcWP/fbhL9ukq4Wh/D/t03sTmXyAse0K7uNuPNxqTYPJh6DG
 F1maEzOFbN/E9E3+P/Qx/rSIr9hFqjX1dm0r1bHR4Ws2PXKuNaOC9XhYrW0WTmF5QQNy
 uzgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQQjLBXz+1093TvXlSVjZLTbtbSWWweVIBO4o2fQVjeyaYom0gROtdEhsJa7Sesnunr60qtw2oiOz1loRrwZrfpUcfo1l+WJRGir8a+VDl
X-Gm-Message-State: AOJu0YzlFtNwEIiCSugl/yfD23nLNPJuFS8sq6edJRFIkRgrGXZGMnJh
 DPYoVPvsKJL3TJ9C+hqRX1MSnMLwt26SmzQsF3F/9zIrfUXs6RG2IsvVRDsth4LJivfpyT/Rdsu
 e8ouWy0+3KqauTIF+WAld0EjapKCtbcoGV88u
X-Google-Smtp-Source: AGHT+IHTothcuqikFFrMs12/Yd8HwJZ8LnAxmbZMMmJb1jW1wBBEyord9u+K2tzA7reF5OIehczUR0R88m66zZf5tNs=
X-Received: by 2002:a17:906:d190:b0:a47:e62:4d72 with SMTP id
 c16-20020a170906d19000b00a470e624d72mr331556ejz.15.1711130106762; Fri, 22 Mar
 2024 10:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
In-Reply-To: <ZfegzB341oNc_Ocz@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 22 Mar 2024 10:54:54 -0700
Message-ID: <CAHS8izOUi6qGp=LSQb_o5oph-EnhNOuhLkPSfbQRU3eniZvbdA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
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
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
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

On Sun, Mar 17, 2024 at 7:03=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Mon, Mar 04, 2024 at 06:01:37PM -0800, Mina Almasry wrote:
> > From: Jakub Kicinski <kuba@kernel.org>
> >
> > The page providers which try to reuse the same pages will
> > need to hold onto the ref, even if page gets released from
> > the pool - as in releasing the page from the pp just transfers
> > the "ownership" reference from pp to the provider, and provider
> > will wait for other references to be gone before feeding this
> > page back into the pool.
>
> The word hook always rings a giant warning bell for me, and looking into
> this series I am concerned indeed.
>
> The only provider provided here is the dma-buf one, and that basically
> is the only sensible one for the documented design.

Sorry I don't mean to argue but as David mentioned, there are some
plans in the works and ones not in the works to extend this to other
memory types. David mentioned io_uring & Jakub's huge page use cases
which may want to re-use this design. I have an additional one in
mind, which is extending devmem TCP for storage devices. Currently
storage devices do not support dmabuf and my understanding is that
it's very hard to do so, and NVMe uses pci_p2pdma instead. I wonder if
it's possible to extend devmem TCP in the future to support pci_p2pdma
to support nvme devices in the future.

Additionally I've been thinking about a use case of limiting the
amount of memory the net stack can use. Currently the page pool is
free to allocate as much memory as it wants from the buddy allocator.
This may be undesirable in very low memory setups such as overcommited
VMs. We can imagine a memory provider that allows allocation only if
the page_pool is below a certain limit. We can also imagine a memory
provider that preallocates memory and only uses that pinned pool. None
of these are in the works at the moment, but are examples of how this
can be (reasonably?) extended.

>  So instead of
> adding hooks that random proprietary crap can hook into,

To be completely honest I'm unsure how to design hooks for proprietary
code to hook into. I think that would be done on the basis of
EXPORTED_SYMBOL? We do not export these hooks, nor plan to at the
moment.

> why not hard
> code the dma buf provide and just use a flag?  That'll also avoid
> expensive indirect calls.
>

Thankfully the indirect calls do not seem to be an issue. We've been
able to hit 95% line rate with devmem TCP and I think the remaining 5%
are a bottleneck unrelated to the indirect calls. Page_pool benchmarks
show a very minor degradation in the fast path, so small it may be
just noise in the measurement (may!):

https://lore.kernel.org/netdev/20240305020153.2787423-1-almasrymina@google.=
com/T/#m1c308df9665724879947a345c4b1ec3b51ff6856

This is because the code path that does indirect allocations is the
slow path. The page_pool recycles netmem aggressively.

--=20
Thanks,
Mina
