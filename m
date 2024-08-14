Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221A951DD5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644D710E4BE;
	Wed, 14 Aug 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G4Q13o5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096610E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:56:05 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7094641d4e6so3217755a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723647364; x=1724252164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApWhKzlunlw9OulyCe3WVtwOx7m9YQFR6kgphgn0hHM=;
 b=G4Q13o5Vr70lqDSMoeqpXK0Co+gL4UexVLm5+raLOKNSVbktDvz3nwtEWuM2gGBD3I
 jzvcBtAqF6FrDRdWejANC+5Alls8uBEeEklb9AJpGsKNYiLSq5Tr8HHdcwn1ga4f28jq
 C+wImmKtZ2L+s5QrSOWiVA1LwYPjHuFpLZMXBqyoPj5L4Gz5fnEGGCEjBmLmphlGNj6s
 blnV/VfO48RCBB4S+4JlismaWkawW7BcQY/wuBmrkHrjar3VItANVzuNjvJZ86LskdO7
 m3ni7ZtJFGKKcslGtdqgWhosRtvj7hXEkSMCrVXYuizcolCNVPZiYFUMjV7XS2VpniiY
 GOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723647364; x=1724252164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApWhKzlunlw9OulyCe3WVtwOx7m9YQFR6kgphgn0hHM=;
 b=g/yjVRypoLZJj7yZdAmiQwGvqq8h+euxyUYWFzV/AH4al7sqle1EKu0jfDi0B57XcC
 JbInlUDsVGLFrmOgHaA3YC+e+AuMafmWaqlhOV0Lup09CP3ogAChNG3kRPIs/IBYxVYH
 yWTwRPz4RLbfzmwgJjVVc8ThoVIVH4+9b1MYwRpl8tWVx01mLzOVwLF2EweJBdEkX0ce
 mL+h1yeQgENG/S/wij4RT/BojWJYQNyN1MNZavLiGkOSNOcXFlUlbR6z/gP3aaxsQFlk
 iZE2nqevzbu2QgEg9wpAHZ7FgEksGXuLGPNAC50dKObllhWRvIZwcyGGpmi8+adoeh1D
 tX1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpbGvfPDIF6vUX4ayKnCpapv8VwGxNYga+qflq+NcGGP4DuEFfOtDlv3FSHpAyIutK0bUZoRSiMabvhqHO8r+6F/+cL98eTrWDe9gZJ6ob
X-Gm-Message-State: AOJu0Yw8lsSSL1q/qlIObY1JlRewNT76K86Rdy6PGEECzLyxDzXiapdx
 W2ZNLRk7g6t/Xe8ojcJQgyuf+Vkievqt1ckTDpyeflicENrQOjHN9lfjNM+iNOSavnNULGLYCuI
 zVv5q06SaYTxaZKYE+uS884OPJ39ygNwwrRou
X-Google-Smtp-Source: AGHT+IH9ZAeOvcFpU0wz9rOmS3Zjvy3bWAzT1a2IrWWyXOegJsZPD7qSytaVr6toGHZ8oDdMhi5a1Ic9JEJSRxy3OYE=
X-Received: by 2002:a05:6359:4c83:b0:1ac:f5dc:5163 with SMTP id
 e5c5f4694b2df-1b1aad5b0a8mr340642555d.29.1723647364192; Wed, 14 Aug 2024
 07:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-7-almasrymina@google.com>
 <de7daf80-a2e4-4451-b666-2a67ccc3649e@gmail.com>
In-Reply-To: <de7daf80-a2e4-4451-b666-2a67ccc3649e@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 14 Aug 2024 10:55:49 -0400
Message-ID: <CAHS8izPMC+XhXKbJOQ3ymizyKuARSOv_cO_xO+q1EG4zoy6Gig@mail.gmail.com>
Subject: Re: [PATCH net-next v19 06/13] memory-provider: dmabuf devmem memory
 provider
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

On Wed, Aug 14, 2024 at 10:11=E2=80=AFAM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
...
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 301f4250ca82..2f2a7f4dee4c 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -17,6 +17,7 @@
> >   #include <linux/genalloc.h>
> >   #include <linux/dma-buf.h>
> >   #include <net/devmem.h>
> > +#include <net/mp_dmabuf_devmem.h>
> >   #include <net/netdev_queues.h>
> >
> >   #include "page_pool_priv.h"
> > @@ -153,6 +154,10 @@ int net_devmem_bind_dmabuf_to_queue(struct net_dev=
ice *dev, u32 rxq_idx,
> >       if (err)
> >               goto err_xa_erase;
> >
> > +     err =3D page_pool_check_memory_provider(dev, rxq, binding);
>
> Frankly, I pretty much don't like it.
>
> 1. We do it after reconfiguring the queue just to fail and reconfigure
> it again.
>

I don't see an issue with that? Or is it just me?

> 2. It should be a part of the common path like netdev_rx_queue_restart(),
> not specific to devmem TCP.
>
> These two can be fixed by moving the check into
> netdev_rx_queue_restart() just after ->ndo_queue_mem_alloc, assuming
> that the callback where we init page pools.
>

The only reason is that the page_pool_check_memory_provider() needs to
know the memory provider to check for. Separating them keep
netdev_rx_queue_restart() usable for other future use cases that don't
expect a memory provider to be bound, but you are correct in that this
can be easily resolved by passing the binding to
netdev_rx_queue_restart() and doing the
page_pool_check_memory_providers() check inside of that function.

> 3. That implicit check gives me bad feeling, instead of just getting
> direct feedback from the driver, either it's a flag or an error
> returned, we have to try to figure what exactly the driver did, with
> a high chance this inference will fail us at some point.
>

This is where I get a bit confused. Jakub did mention that it is
desirable for core to verify that the driver did the right thing,
instead of trusting that a driver did the right thing without
verifying. Relying on a flag from the driver opens the door for the
driver to say "I support this" but actually not create the mp
page_pool. In my mind the explicit check is superior to getting
feedback from the driver.

Additionally this approach lets us detect support in core using 10
lines of code or so, rather than ask every driver that wants to
support mp to add boilerplate code to declare support (and run into
subtle bugs when this boilerplate is missing). There are minor pros
and cons to each approach; I don't see a showstopping reason to go
with one over the other.

> And page_pool_check_memory_provider() is not that straightforward,
> it doesn't walk through pools of a queue.

Right, we don't save the pp of a queue, only a netdev. The outer loop
checks all the pps of the netdev to find one with the correct binding,
and the inner loop checks that this binding is attached to the correct
queue.

> Not looking too deep,
> but it seems like the nested loop can be moved out with the same
> effect, so it first looks for a pool in the device and the follows
> with the bound_rxqs. And seems the bound_rxqs check would always turn
> true, you set the binding into the map in
> net_devmem_bind_dmabuf_to_queue() before the restart and it'll be there
> after restart for page_pool_check_memory_provider(). Maybe I missed
> something, but it's not super clear.
>
> 4. And the last thing Jakub mentioned is that we need to be prepared
> to expose a flag to the userspace for whether a queue supports
> netiov. Not really doable in a sane manner with such implicit
> post configuration checks.
>

I don't see a very strong reason to expose the flag to the userspace
now. userspace can try to bind dmabuf and get an EOPNOTSUPP if the
operation is not supported, right? In the future if passing the flag
to userspace becomes needed for some usecase, we do need feedback from
the driver, and it would be trivial to add similarly to what you
suggested.

> And that brings us back to the first approach I mentioned, where
> we have a flag in the queue structure, drivers set it, and
> netdev_rx_queue_restart() checks it before any callback. That's
> where the thread with Jakub stopped, and it reads like at least
> he's not against the idea.

Hmm, the netdev_rx_queue array is created in core, not by the driver,
does the driver set this flag during initialization? We could run into
subtle bugs with races if a code path checks for support after core
has allocated the netdev_rx_queue array but before the driver has had
a chance to declare support, right? Maybe a minor issue. Instead we
could add an ndo to the queue API that lets the driver tell us that it
could support binding on a given rx queue, and check that in
net_devmem_bind_dmabuf_to_queue() right before we do the bind?

But this is only if declaring support to userspace becomes needed for
some use case. At the moment I'm under the impression that verifying
in core that the driver did the right thing is preferred, and I'd like
to minimize the boilerplate the driver needs to implement if possible.

Additionally this series is big and blocks multiple interesting follow
up work; maybe going forward with an approach that works - and can
easily be iterated on later if we run into issues - could be wise. I
do not see an issue with adding a driver signal in the future (if
needed) and deprecating the core check (if needed), right?

--
Thanks,
Mina
