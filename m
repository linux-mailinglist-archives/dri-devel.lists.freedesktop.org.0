Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B359E8908B4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 19:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEA2112517;
	Thu, 28 Mar 2024 18:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jhUOnaI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6CF112517
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 18:55:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56c0d1bddc1so1571087a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711652137; x=1712256937;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/g0QRd03Q47daRFmOpf216fDEljWTmtj0CWrlO2PgGk=;
 b=jhUOnaI5wy8bCX2zsQJwXmknOWutFTXQtz1B/kb/P33GkuM8P0MCNlDp1lJingjAN3
 d7KRiP2FGsmsmvQlyokrN6lZJQwWO+6WrdXwIi7d1cjqxZWz5DP942nilbmvQpoljA4K
 +rjeQotWIi0LTgjGuhAOXiNpbyFYlb7gq/D3Ucl/lwaI42NpqfdI5XiWXdz0otMDDKC2
 Huc5cZr6ui4FciKv8CTPcXKFc+UWoksas8ZKoVDAkQjuL8ER6KznikAnUGwQH+AQfcil
 0OvQ28z1uZwLNKbOYXZL+ulVNGo1VtQx8NLH2yIFplHW6GZKIeGPFRh+lMaYvOR+wvuW
 z3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711652137; x=1712256937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/g0QRd03Q47daRFmOpf216fDEljWTmtj0CWrlO2PgGk=;
 b=NbTr2yCSuFn0WmhuALHZBfNQT7txtYKzWYHSlrlb13VQo/fCAAQRz4pvgCsYzZwIGE
 HYgZ+Lpix5Bvath3GiKiMF9LEduq5iKT8W7L82wxPeB3UakA+F4Ih3UBr7a9YvKBWZ2w
 bWl4tvdEqTiYGEIMEFkzCZipqcbR2zKI1DpH12jt8m60Jvp77ngmgG3VRQwDV27mzEDr
 /U5i2JJAiCdYTpM0lew0u0O/TEbk1MA63XRx3zUkPsxr+5sYg93QwFX4Sg7wOBeIV6Kd
 Vwp65DkRH7PfdWPWVOu++4QZ/8cRz3pKJJFoPDWpXsZlrVsK7rGEfOtg9zGqf3EgyMY7
 oSBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtz2G4UjmRsAYGCpVZcOUFOqLXyLJC8CPbqy7lWmj2XlguYeuaPwLiLtgfCHDQvqQNYAaTO8bpwuGVfiw2zt2BOP9EfLRNs+nsfAKaFQ34
X-Gm-Message-State: AOJu0YwdHz2UXsWNC5dZo769MoDOF/7DIXCaoUKwbPM1pjZr05+j6mKR
 IBt1/aHPJXv5ThgnnTfR613wjGcl3mHUL/N7ruKbdq7lyxDeUXFymQe1gygTs2iO9EFbt5SeJBp
 79kgnUWqrUSO4ozbkdU1g6NrJkNv3QNRp/d0R
X-Google-Smtp-Source: AGHT+IFT7BjTbnc4go6zIYPcPdx3xb2qgp8zmitrga5SNdEeKiv/hX6FeRXvUPA8/BgWnl2x89qqbJVYumySJ8ZZV8Y=
X-Received: by 2002:a17:907:7898:b0:a4e:eb1:9a3d with SMTP id
 ku24-20020a170907789800b00a4e0eb19a3dmr85852ejc.68.1711652136773; Thu, 28 Mar
 2024 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240326225048.785801-1-almasrymina@google.com>
 <20240326225048.785801-5-almasrymina@google.com>
 <20240328182812.GJ651713@kernel.org>
In-Reply-To: <20240328182812.GJ651713@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 28 Mar 2024 11:55:23 -0700
Message-ID: <CAHS8izMZuRwQZsL7PQdoRcrgeh6rEa7n1NMhbm-aZMes2QHVzg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v7 04/14] netdev: support binding dma-buf to
 netdevice
To: Simon Horman <horms@kernel.org>
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
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
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

On Thu, Mar 28, 2024 at 11:28=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Tue, Mar 26, 2024 at 03:50:35PM -0700, Mina Almasry wrote:
> > Add a netdev_dmabuf_binding struct which represents the
> > dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> > rx queues on the netdevice. On the binding, the dma_buf_attach
> > & dma_buf_map_attachment will occur. The entries in the sg_table from
> > mapping will be inserted into a genpool to make it ready
> > for allocation.
> >
> > The chunks in the genpool are owned by a dmabuf_chunk_owner struct whic=
h
> > holds the dma-buf offset of the base of the chunk and the dma_addr of
> > the chunk. Both are needed to use allocations that come from this chunk=
.
> >
> > We create a new type that represents an allocation from the genpool:
> > net_iov. We setup the net_iov allocation size in the
> > genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> > allocated by the page pool and given to the drivers.
> >
> > The user can unbind the dmabuf from the netdevice by closing the netlin=
k
> > socket that established the binding. We do this so that the binding is
> > automatically unbound even if the userspace process crashes.
> >
> > The binding and unbinding leaves an indicator in struct netdev_rx_queue
> > that the given queue is bound, but the binding doesn't take effect unti=
l
> > the driver actually reconfigures its queues, and re-initializes its pag=
e
> > pool.
> >
> > The netdev_dmabuf_binding struct is refcounted, and releases its
> > resources only when all the refs are released.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
>
> ...
>
> > +int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_id=
x,
> > +                                 struct net_devmem_dmabuf_binding *bin=
ding)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     u32 xa_idx;
> > +     int err;
> > +
> > +     if (rxq_idx >=3D dev->num_rx_queues)
> > +             return -ERANGE;
> > +
> > +     rxq =3D __netif_get_rx_queue(dev, rxq_idx);
> > +     if (rxq->mp_params.mp_priv)
> > +             return -EEXIST;
> > +
> > +     err =3D xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit=
_32b,
> > +                    GFP_KERNEL);
> > +     if (err)
> > +             return err;
> > +
> > +     /* We hold the rtnl_lock while binding/unbinding dma-buf, so we c=
an't
> > +      * race with another thread that is also modifying this value. Ho=
wever,
> > +      * the driver may read this config while it's creating its * rx-q=
ueues.
> > +      * WRITE_ONCE() here to match the READ_ONCE() in the driver.
> > +      */
> > +     WRITE_ONCE(rxq->mp_params.mp_ops, &dmabuf_devmem_ops);
>
> Hi Mina,
>
> This causes a build failure because mabuf_devmem_ops is not added until a
> subsequent patch in this series.
>

My apologies. I do notice the failure in patchwork now. I'll do a
patch by patch build for the next iteration.

> > +     WRITE_ONCE(rxq->mp_params.mp_priv, binding);
> > +
> > +     err =3D net_devmem_restart_rx_queue(dev, rxq_idx);
> > +     if (err)
> > +             goto err_xa_erase;
> > +
> > +     return 0;
> > +
> > +err_xa_erase:
> > +     WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> > +     WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> > +     xa_erase(&binding->bound_rxq_list, xa_idx);
> > +
> > +     return err;
> > +}
>
> ...



--=20
Thanks,
Mina
