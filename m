Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF4874279
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 23:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DD01135C2;
	Wed,  6 Mar 2024 22:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mCFL4MS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68B11135C2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 22:11:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a45c006ab82so33438866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 14:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709763068; x=1710367868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMaQ3cDJaF53fme3ObxORiWTrmjgHw0Qfaex1Nu2I/k=;
 b=mCFL4MS0tN6bqN6r713ntfrNFdtWtM/4ESu/81XEstNvAmF4H+V4lUp2jyXnkIk3ot
 rn0Xw5BwZY7jJHXBQ4KZ0w4SfsI8H+MuwY2t0sAUoL1DMpRE5JarrbH7o7iNffd7aWgT
 2Nv554fRWm9efPvXOnC49bPDzEd4tgteSzctGgQ2DcwECEzV2nK3F4u2kUIj9WZZx7NL
 0kJHnWKgHIn90djkwQF6NHI1duPz2/wCzUl2C6VcIRnviM1QWMZa8kC4MgcrLBOJ0X3i
 ULbZ2j+BWhK78FliR60kbmybOu16Qn6ot1JG1SXwXOHuw7+1RNp/rREiCfz4MAkKNjX0
 cSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709763068; x=1710367868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMaQ3cDJaF53fme3ObxORiWTrmjgHw0Qfaex1Nu2I/k=;
 b=irsWSoxT/LPBQe49ijKz0Dh5qN+s3m+kScU2WxA2ojtC5ouFGfJQ5aQBC0UWGslnII
 pKmXV2XjsC8eYm0ykcG5B2XVRTZ+zbr7lN8tNLTTUFKReAUyZ8CWJxXrfrDymp7oIKO2
 cAPE1/pgWMFA2Cg+a0dWWWNGrEpycqc65+ZhssbtKbiO4jyJEPzeaBW4Ff0tOe5Iwg9B
 YzkfF9F965s2J1o5gsh3i2kSiX25S1sZMfH3dz6XF4QD3PDMe8LyudCFQjE2KSMqlA8k
 SKrBjm0v5pxWNv1Z32n5ylebgeU7fpqTMOzKyJcyZcd+zkG/VSU5rjsFuiNROt9A0ySb
 6lrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWc7EhTYDJ+SuF1IgYTxkjVYjsz+GMADQBA8/1sPKKSb+qrYnMzs0bUpI0KAIkuAFvzDZeq8cQavqzRl1cpC+oPPlwf5S6t+evmd8aMaPa
X-Gm-Message-State: AOJu0YyBLhLM70oRNXTdguwN5Hsr8pfWWDw9dDNDmZw7kQCum88tebBF
 0xfur/emj19mDbmrP4EdyFsZd6zCE/7ObHCQdTN6ubmNlhPB48FFi1t8pJs5Zt3+Vy+CGUVYwpG
 dCLZYce3vbSiCQApkmYN7R04QcS3qrMIs+AJx
X-Google-Smtp-Source: AGHT+IENXwD+VWczLj/dTM2/A1MFyK7LqUp0f5yPqTDI4m7+LrQO5mzGQIb3CxwkX+uMg5NpdLqf746V4nTchzug2EI=
X-Received: by 2002:a17:906:3442:b0:a44:3ec9:1fd3 with SMTP id
 d2-20020a170906344200b00a443ec91fd3mr9663971ejb.30.1709763067483; Wed, 06 Mar
 2024 14:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-6-almasrymina@google.com>
 <da42cea9-c169-599e-f087-d38c419e3dab@huawei.com>
 <CAHS8izM7GbvWHrH=h9q0oG0DMU649EjT1udNEW_8F-hGeC15EQ@mail.gmail.com>
 <aa892723-7396-998d-db06-166c28fba1e0@huawei.com>
In-Reply-To: <aa892723-7396-998d-db06-166c28fba1e0@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 6 Mar 2024 14:10:55 -0800
Message-ID: <CAHS8izNJFnKGn9nrJ3kRxGwhvjiDey_bfrxQNfsfj=S9hZR_UA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 05/15] netdev: support binding dma-buf to
 netdevice
To: Yunsheng Lin <linyunsheng@huawei.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
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

On Wed, Mar 6, 2024 at 4:38=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/3/6 5:17, Mina Almasry wrote:
> > On Tue, Mar 5, 2024 at 4:55=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei=
.com> wrote:
> >>
> >> On 2024/3/5 10:01, Mina Almasry wrote:
> >>
> >> ...
> >>
> >>>
> >>> The netdev_dmabuf_binding struct is refcounted, and releases its
> >>> resources only when all the refs are released.
> >>>
> >>> Signed-off-by: Willem de Bruijn <willemb@google.com>
> >>> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> >>> Signed-off-by: Mina Almasry <almasrymina@google.com>
> >>>
> >>> ---
> >>>
> >>> RFC v6:
> >>> - Validate rx queue index
> >>> - Refactor new functions into devmem.c (Pavel)
> >>
> >> It seems odd that the functions or stucts in a file called devmem.c
> >> are named after 'dmabuf' instead of 'devmem'.
> >>
> >
> > So my intention with this naming that devmem.c contains all the
> > functions for all devmem tcp specific support. Currently the only
> > devmem we support is dmabuf. In the future, other devmem may be
> > supported and it can fit nicely in devmem.c. For example, if we want
> > to extend devmem TCP to support NVMe devices, we need to add support
> > for p2pdma, maybe, and we can add that support under the devmem.c
> > umbrella rather than add new files.
> >
> > But I can rename to dmabuf.c if there is strong objection to the curren=
t name.
>
> Grepping 'dmabuf' seems to show that it may be common rename it to
> something as *_dmabuf.c.
>
> >
> >>>
> >>
> >> ...
> >>
> >>> diff --git a/include/net/netmem.h b/include/net/netmem.h
> >>> index d8b810245c1d..72e932a1a948 100644
> >>> --- a/include/net/netmem.h
> >>> +++ b/include/net/netmem.h
> >>> @@ -8,6 +8,16 @@
> >>>  #ifndef _NET_NETMEM_H
> >>>  #define _NET_NETMEM_H
> >>>
> >>> +#include <net/devmem.h>
> >>> +
> >>> +/* net_iov */
> >>> +
> >>> +struct net_iov {
> >>> +     struct dmabuf_genpool_chunk_owner *owner;
> >>> +};
> >>> +
> >>> +/* netmem */
> >>> +
> >>>  /**
> >>>   * typedef netmem_ref - a nonexistent type marking a reference to ge=
neric
> >>>   * network memory.
> >>> diff --git a/net/core/Makefile b/net/core/Makefile
> >>> index 821aec06abf1..592f955c1241 100644
> >>> --- a/net/core/Makefile
> >>> +++ b/net/core/Makefile
> >>> @@ -13,7 +13,7 @@ obj-y                    +=3D dev.o dev_addr_lists.=
o dst.o netevent.o \
> >>>                       neighbour.o rtnetlink.o utils.o link_watch.o fi=
lter.o \
> >>>                       sock_diag.o dev_ioctl.o tso.o sock_reuseport.o =
\
> >>>                       fib_notifier.o xdp.o flow_offload.o gro.o \
> >>> -                     netdev-genl.o netdev-genl-gen.o gso.o
> >>> +                     netdev-genl.o netdev-genl-gen.o gso.o devmem.o
> >>>
> >>>  obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) +=3D dev_addr_lists_test.o
> >>>
> >>> diff --git a/net/core/dev.c b/net/core/dev.c
> >>> index fe054cbd41e9..bbea1b252529 100644
> >>> --- a/net/core/dev.c
> >>> +++ b/net/core/dev.c
> >>> @@ -155,6 +155,9 @@
> >>>  #include <net/netdev_rx_queue.h>
> >>>  #include <net/page_pool/types.h>
> >>>  #include <net/page_pool/helpers.h>
> >>> +#include <linux/genalloc.h>
> >>> +#include <linux/dma-buf.h>
> >>> +#include <net/devmem.h>
> >>>
> >>>  #include "dev.h"
> >>>  #include "net-sysfs.h"
> >>> diff --git a/net/core/devmem.c b/net/core/devmem.c
> >>> new file mode 100644
> >>> index 000000000000..779ad990971e
> >>> --- /dev/null
> >>> +++ b/net/core/devmem.c
> >>> @@ -0,0 +1,293 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>> +/*
> >>> + *      Devmem TCP
> >>> + *
> >>> + *      Authors:     Mina Almasry <almasrymina@google.com>
> >>> + *                   Willem de Bruijn <willemdebruijn.kernel@gmail.c=
om>
> >>> + *                   Kaiyuan Zhang <kaiyuanz@google.com
> >>> + */
> >>> +
> >>> +#include <linux/types.h>
> >>> +#include <linux/mm.h>
> >>> +#include <linux/netdevice.h>
> >>> +#include <trace/events/page_pool.h>
> >>> +#include <net/netdev_rx_queue.h>
> >>> +#include <net/page_pool/types.h>
> >>> +#include <net/page_pool/helpers.h>
> >>> +#include <linux/genalloc.h>
> >>> +#include <linux/dma-buf.h>
> >>> +#include <net/devmem.h>
> >>> +
> >>> +/* Device memory support */
> >>> +
> >>> +#ifdef CONFIG_DMA_SHARED_BUFFER
> >>
> >> I still think it is worth adding its own config for devmem or dma-buf
> >> for networking, thinking about the embeded system.
> >>
> >
> > FWIW Willem did weigh on this previously and said he prefers to have
> > it unguarded by a CONFIG, but I will submit to whatever the consensus
> > here. It shouldn't be a huge deal to add a CONFIG technically
> > speaking.
>
> Grepping 'CONFIG_DMA_SHARED_BUFFER' show that the API user of dmabuf
> API does not seems to reuse the CONFIG_DMA_SHARED_BUFFER, instead they
> seem to define its own config, and select CONFIG_DMA_SHARED_BUFFER
> if necessary, it that any reason it is different here?
>
> >
> >>> +static void netdev_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> >>> +                                        struct gen_pool_chunk *chunk=
,
> >>> +                                        void *not_used)
> >>
> >> It seems odd to still keep the netdev_ prefix as it is not really rela=
ted
> >> to netdev, perhaps use 'net_' or something better.
> >>
> >
> > Yes, thanks for catching. I can change to net_devmem_ maybe or net_dmab=
uf_*.
>
> FWIW, net_dmabuf_* seems like a better name technically.
>
> >
> >>> +{
> >>> +     struct dmabuf_genpool_chunk_owner *owner =3D chunk->owner;
> >>> +
> >>> +     kvfree(owner->niovs);
> >>> +     kfree(owner);
> >>> +}
> >>> +
> >>> +void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *bind=
ing)
> >>> +{
> >>> +     size_t size, avail;
> >>> +
> >>> +     gen_pool_for_each_chunk(binding->chunk_pool,
> >>> +                             netdev_dmabuf_free_chunk_owner, NULL);
> >>> +
> >>> +     size =3D gen_pool_size(binding->chunk_pool);
> >>> +     avail =3D gen_pool_avail(binding->chunk_pool);
> >>> +
> >>> +     if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%lu, =
avail=3D%lu",
> >>> +               size, avail))
> >>> +             gen_pool_destroy(binding->chunk_pool);
> >>> +
> >>> +     dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> >>> +                              DMA_BIDIRECTIONAL);
> >>
> >> For now DMA_FROM_DEVICE seems enough as tx is not supported yet.
> >>
> >
> > Yes, good catch. I suspect we want to reuse this code for TX path. But
> > for now, I'll test with DMA_FROM_DEVICE and if I see no issues I'll
> > apply this change.
> >
> >>> +     dma_buf_detach(binding->dmabuf, binding->attachment);
> >>> +     dma_buf_put(binding->dmabuf);
> >>> +     xa_destroy(&binding->bound_rxq_list);
> >>> +     kfree(binding);
> >>> +}
> >>> +
> >>> +static int netdev_restart_rx_queue(struct net_device *dev, int rxq_i=
dx)
> >>> +{
> >>> +     void *new_mem;
> >>> +     void *old_mem;
> >>> +     int err;
> >>> +
> >>> +     if (!dev || !dev->netdev_ops)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (!dev->netdev_ops->ndo_queue_stop ||
> >>> +         !dev->netdev_ops->ndo_queue_mem_free ||
> >>> +         !dev->netdev_ops->ndo_queue_mem_alloc ||
> >>> +         !dev->netdev_ops->ndo_queue_start)
> >>> +             return -EOPNOTSUPP;
> >>> +
> >>> +     new_mem =3D dev->netdev_ops->ndo_queue_mem_alloc(dev, rxq_idx);
> >>> +     if (!new_mem)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     err =3D dev->netdev_ops->ndo_queue_stop(dev, rxq_idx, &old_mem)=
;
> >>> +     if (err)
> >>> +             goto err_free_new_mem;
> >>> +
> >>> +     err =3D dev->netdev_ops->ndo_queue_start(dev, rxq_idx, new_mem)=
;
> >>> +     if (err)
> >>> +             goto err_start_queue;
> >>> +
> >>> +     dev->netdev_ops->ndo_queue_mem_free(dev, old_mem);
> >>> +
> >>> +     return 0;
> >>> +
> >>> +err_start_queue:
> >>> +     dev->netdev_ops->ndo_queue_start(dev, rxq_idx, old_mem);
> >>
> >> It might worth mentioning why queue start with old_mem will always
> >> success here as the return value seems to be ignored here.
> >>
> >
> > So the old queue, we stopped it, and if we fail to bring up the new
> > queue, then we want to start the old queue back up to get the queue
> > back to a workable state.
> >
> > I don't see what we can do to recover if restarting the old queue
> > fails. Seems like it should be a requirement that the driver tries as
> > much as possible to keep the old queue restartable.
>
> Is it possible that we may have the 'old_mem' leaking if the driver
> fails to restart the old queue? how does the driver handle the
> firmware cmd failure for ndo_queue_start()? it seems a little
> tricky to implement it.
>

I'm not sure what we can do to meaningfully recover from failure to
restarting the old queue, except log it so the error is visible. In
theory because we have not modifying any queue configurations
restarting it would be straight forward, but since it's dealing with
hardware then any failures are possible.

> >
> > I can improve this by at least logging or warning if restarting the
> > old queue fails.
>
> Also the semantics of the above function seems odd that it is not
> only restarting rx queue, but also freeing and allocating memory
> despite the name only suggests 'restart', I am a litte afraid that
> it may conflict with future usecae when user only need the
> 'restart' part, perhaps rename it to a more appropriate name.
>

Oh, what we want here is just the 'restart' part. However, Jakub
mandates that if you restart a queue (or a driver), you do it like
this, hence the slightly more complicated implementation.

https://patchwork.kernel.org/project/netdevbpf/patch/20231106024413.2801438=
-13-almasrymina@google.com/#25590262
https://lore.kernel.org/netdev/20230815171638.4c057dcd@kernel.org/

> >
> >>> +
> >>> +err_free_new_mem:
> >>> +     dev->netdev_ops->ndo_queue_mem_free(dev, new_mem);
> >>> +
> >>> +     return err;
> >>> +}
> >>> +
> >>> +/* Protected by rtnl_lock() */
> >>> +static DEFINE_XARRAY_FLAGS(netdev_dmabuf_bindings, XA_FLAGS_ALLOC1);
> >>> +
> >>> +void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
> >>> +{
> >>> +     struct netdev_rx_queue *rxq;
> >>> +     unsigned long xa_idx;
> >>> +     unsigned int rxq_idx;
> >>> +
> >>> +     if (!binding)
> >>> +             return;
> >>> +
> >>> +     if (binding->list.next)
> >>> +             list_del(&binding->list);
> >>
> >> The above does not seems to be a good pattern to delete a entry, is
> >> there any reason having a checking before the list_del()? seems like
> >> defensive programming?
> >>
> >
> > I think I needed to apply this condition to handle the case where
> > netdev_unbind_dmabuf() is called when binding->list is not initialized
> > or is empty.
> >
> > netdev_nl_bind_rx_doit() will call unbind to free a partially
> > allocated binding in error paths, so, netdev_unbind_dmabuf() may be
> > called with a partially initialized binding. This is why we check for
> > binding->list is initialized here and check that rxq->binding =3D=3D
> > binding below. The main point is that netdev_unbind_dmabuf() may be
> > asked to unbind a partially bound dmabuf due to error paths.
> >
> > Maybe a comment here will test this better. I will double confirm the
> > check is needed for the error paths in netdev_nl_bind_rx_doit().
> >
> >>> +
> >>> +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> >>> +             if (rxq->binding =3D=3D binding) {
> >>
> >> It seems like defensive programming here too?
> >>
>


--=20
Thanks,
Mina
