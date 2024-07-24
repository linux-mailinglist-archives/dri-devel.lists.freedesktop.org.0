Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FF93B278
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B856F89907;
	Wed, 24 Jul 2024 14:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NUcvWOJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A26510E709
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:11:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1710013a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721830310; x=1722435110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgUOovEPki3yBEx+HU/YvZISoKa1Q0srqrZyf9xBznA=;
 b=NUcvWOJBIsGFwItDMnuaduUKLkIqM28mxzIOnJmshQ4jf7QtrWKOJ3u4wihm4aq6P0
 dvNpYnqq0zsvVM3hGu2tE+cuZjFCbd4xyKZAAwtxQhgcDUw2GYsH3y6qnVSqGL2QUDIv
 zFjQ6xS7alRvwyR9xSpquZkR1SaCtR1kcBl4cHurklLqDhGcLVGXn6W016pz72YItfft
 xATAg/lMa7uu+CKFoP5WO+MLqmPrCbm434dqQiGCektJXUN686WQAciMjomussTG1NtL
 2fifrdzYTr3fqHeSsb6Q2g3ipgHq/bPw5Q65//XxupEZ97HmHAd3Cyg6baACOnRaCi9Z
 mLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721830310; x=1722435110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgUOovEPki3yBEx+HU/YvZISoKa1Q0srqrZyf9xBznA=;
 b=EWd9lhCI97qKoxZYwJqY87pYQx4z6mKuJ4J2CKwKEHVJPYBabU8GCTcVOa4HDAYUfF
 Rr5fzzLKftng0Rp44LdW6X9flPRnGGiNrNCYhf4rWLuzAI4pOi/dZmOj6ZICphH32WIx
 wAT0SYMCmB59neqe0nVYYpDUSHJmYRpFQtoJzBRq8x2h+F7V1Aqu4KHmGxdVHdeYEA9b
 KAohQXOWI0XBgEz3DLOvoHku3RvGRXMs7ybYxYrIooKXqepOze4jacVuYQpcr4aJM1xx
 DDVF1Rr6PujHe1X0rUgMeYiFodgDVl7mL+ZvyJ/qd1WDhk/T0B63esiEjY1f5kuDY57P
 dUoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY+Z3iSRK8doS3FOAWEwuxBIuxNpgXjY+YSMSLUtyQ0R7VCssseDMdPLnrDPuF4xIqq+Os/zepxEoXC9py4byouquIN1VCH//B2h7oeeCS
X-Gm-Message-State: AOJu0Yz7FuTpkWJp5BburoY4p0QK2zNsg4mp9uy1FkTnq61JuLh0AzOe
 vLoojGHVAiqAyeayNex0IIaF3YYaVOLkSRHtwq9TWnbcyfkFCKYadq2bXdNOm4HnHKtPG5T/1JE
 f2Dqr2trI0yh5FSXBd5N5TCd/kac=
X-Google-Smtp-Source: AGHT+IG/1TrYzfuz6s4kFpxFSpAieWqNsCB9Wez//cHoFLQxMdVPOa+ue/JHVhn9Ez2PRYWu7hG701fjzbR8kwC+GR4=
X-Received: by 2002:a05:6402:2788:b0:58c:77b4:404b with SMTP id
 4fb4d7f45d1cf-5ab1b167270mr2342309a12.15.1721830310221; Wed, 24 Jul 2024
 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
 <CAMArcTUqqxam+BPwGExOFOLVi3t=dwA-5sSagKC5dndv07GDLQ@mail.gmail.com>
 <CAHS8izNS5jZjPfc-sARbHV7mzqzH+UhHfAtCTKRRTfSAdhY4Cw@mail.gmail.com>
 <CAMArcTUdCxOBYGF3vpbq=eBvqZfnc44KBaQTN7H-wqdUxZdziw@mail.gmail.com>
 <CAHS8izMTGgZ+4fOKegUDLqAoxrdVEb+nqjQEt8bP0WLBV=FfrQ@mail.gmail.com>
In-Reply-To: <CAHS8izMTGgZ+4fOKegUDLqAoxrdVEb+nqjQEt8bP0WLBV=FfrQ@mail.gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 24 Jul 2024 23:11:38 +0900
Message-ID: <CAMArcTUC2q-SEcc4FP8Rnz8goroXj52FWThX4O4C2R1uPW_VHQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 03/14] netdev: support binding dma-buf to
 netdevice
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
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
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
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

On Wed, Jul 24, 2024 at 6:49=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Tue, Jul 9, 2024 at 8:37=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wr=
ote:
> ...
> > Reproducer:
> > ./ncdevmem -f <interface name> -l -p 5201 -v 7 -t 0 -q 2 &
> > sleep 10
> > modprobe -rv bnxt_en
> > killall ncdevmem
> >
> > I think it's a devmemTCP core bug so this issue would be reproduced
> > with other drivers.
>
> Sorry for the late reply. I was out at netdev.
>
> I'm also having trouble reproducing this, not because the bug doesn't
> exist, but quirks with my test setup that I need to figure out. AFAICT
> this diff should fix the issue. If you have time to confirm, let me
> know if it doesn't work for you. It should apply on top of v16:
>
> commit 795b8ff01906d ("fix for release issue")
> Author: Mina Almasry <almasrymina@google.com>
> Date:   Tue Jul 23 00:18:23 2024 +0000
>
>     fix for release issue
>
>     Change-Id: Ib45a0aa6cba2918db5f7ba535414ffa860911fa4
>
>
>
> diff --git a/include/net/devmem.h b/include/net/devmem.h
> index 51b25ba193c96..df52526bb516a 100644
> --- a/include/net/devmem.h
> +++ b/include/net/devmem.h
> @@ -68,6 +68,9 @@ net_devmem_bind_dmabuf(struct net_device *dev,
> unsigned int dmabuf_fd);
>  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)=
;
>  int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
>                                     struct net_devmem_dmabuf_binding *bin=
ding);
> +
> +void dev_dmabuf_uninstall(struct net_device *dev);
> +
>  struct net_iov *
>  net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
>  void net_devmem_free_dmabuf(struct net_iov *ppiov);
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 5882ddc3f8592..7be084e4936e4 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -11320,6 +11320,7 @@ void unregister_netdevice_many_notify(struct
> list_head *head,
>                 dev_tcx_uninstall(dev);
>                 dev_xdp_uninstall(dev);
>                 bpf_dev_bound_netdev_unregister(dev);
> +               dev_dmabuf_uninstall(dev);
>
>                 netdev_offload_xstats_disable_all(dev);
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index e75057ecfa6de..227bcb1070ec0 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -362,4 +362,20 @@ bool mp_dmabuf_devmem_release_page(struct
> page_pool *pool, netmem_ref netmem)
>         return false;
>  }
>
> +void dev_dmabuf_uninstall(struct net_device *dev)
> +{
> +       unsigned int i, count =3D dev->num_rx_queues;
> +       struct net_devmem_dmabuf_binding *binding;
> +       struct netdev_rx_queue *rxq;
> +       unsigned long xa_idx;
> +
> +       for (i =3D 0; i < count; i++) {
> +               binding =3D dev->_rx[i].mp_params.mp_priv;
> +               if (binding)
> +                       xa_for_each(&binding->bound_rxqs, xa_idx, rxq)
> +                               if (rxq =3D=3D &dev->_rx[i])
> +                                       xa_erase(&binding->bound_rxqs, xa=
_idx);
> +       }
> +}
> +
>  #endif
>

I tested this patch and it works well.
Thanks a lot for this work!

Thanks a lot!
Taehee Yoo

> --
> Thanks,
> Mina
