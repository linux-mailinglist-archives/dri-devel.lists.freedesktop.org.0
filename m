Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438992BE8B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168610E5D6;
	Tue,  9 Jul 2024 15:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPrv+KnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727410E5D6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:37:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so6797850a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720539466; x=1721144266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MG/NCdxbeCghfZ16wRWXTAVbQxYoox4hfUfmSoMKYn8=;
 b=ZPrv+KnKmT5cdm++x6uvF4TRxEy7MIrQSNNo8nX/opYMgZaXjugGA0xnmF/Wdq7y6+
 cnqs0AM1XL9GPG7JR50Cv4/5QyP6dLbGmnWgwLhoTmUCgrBRjA9kfVKBoGQ4Qtgf12ie
 PGLZGjPb1VDgn5Q8mLkFt00cIhEvMpvf4mweNUSqONBsjVrlwUf68QcBelwZvGSUhE/L
 2IhkL/W7Jqtd0WZ7/VMrI7+ua/knDmQe7Vr7TD9e6BAOVe0eWO8yMjrt4Omn8zaKUu6s
 I+iVwAOuEGYlzRu8HYU5KETdJdz8JfOETYgQQpTyEkgcq3kIYmzcFCnbqR8cQ3ypFV8J
 1Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539466; x=1721144266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MG/NCdxbeCghfZ16wRWXTAVbQxYoox4hfUfmSoMKYn8=;
 b=MflRoAoEWkrKpiQiD3idyvVtiRCxb1GeVx0wR+m5DmsEaudWjRTzvcGWbReyfO9eUr
 LayzolZOABPjU6yjXJBW8kYY6qK3ZWWhnK2fI3IVc7ySC5HmAq/5p9pMkoyuJkEJpV8Q
 mVFcSRHyfXXzewBFpezc/y9ZLzfU3+fNOmJH6GvQdSlyblj+FAmjYP3nj96r4fBT6AwL
 EZH7GTm77INQu81NQGEwuK5jnrsExgGDQuWHQ8MWPM8LfqlO1LTwAFpZhy9lE1PNkqQN
 HkxpTRw5JDztuRq5xvj4+Bwg7RciSaBRAF8d1qFBfcmUtERofxD4UJa+kbJ4t4o/5wyB
 fGJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPBCopGNmzetL/jzfhErdwmGWvgrO4NGBdYPqsfgnsUJTpD4DzigxJHzFGe3WKy5EbENM3a2jdxPG2MAW7OwhAyvokf0cFB6kuMB17xUlq
X-Gm-Message-State: AOJu0YxcNtILc23q2NoaevTH7bNMvrcVVTB1LM60mRJVWgN+IHZGTMn5
 oi2SMInfQwnf0zQeaksZPTRaszYYtVeZdUl3k8fMMgopMglmLaaEkA/94IauXahnHdu8qs88TBJ
 WLG1kZq/i+A0W7UB5G49AeZLMSAw=
X-Google-Smtp-Source: AGHT+IHLJZBTqMVGksQcSkLURw05seR8qguDROutdb5h+zeIg82DIqI5H6RiFQxkpxQGPJCyccSJxpq1+zEMBcNzwKI=
X-Received: by 2002:a05:6402:42c7:b0:58d:fd5a:eb54 with SMTP id
 4fb4d7f45d1cf-594baf912famr2620086a12.17.1720539466072; Tue, 09 Jul 2024
 08:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
 <CAMArcTUqqxam+BPwGExOFOLVi3t=dwA-5sSagKC5dndv07GDLQ@mail.gmail.com>
 <CAHS8izNS5jZjPfc-sARbHV7mzqzH+UhHfAtCTKRRTfSAdhY4Cw@mail.gmail.com>
In-Reply-To: <CAHS8izNS5jZjPfc-sARbHV7mzqzH+UhHfAtCTKRRTfSAdhY4Cw@mail.gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 10 Jul 2024 00:37:34 +0900
Message-ID: <CAMArcTUdCxOBYGF3vpbq=eBvqZfnc44KBaQTN7H-wqdUxZdziw@mail.gmail.com>
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

On Tue, Jul 9, 2024 at 5:08=E2=80=AFAM Mina Almasry <almasrymina@google.com=
> wrote:
>

Hi Mina, Thanks a lot for your reply!

> On Thu, Jul 4, 2024 at 10:57=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> w=
rote:
> >
> > I found several locking warnings while testing.
> >
>
> Thanks for Testing Taehee! And sorry for the late reply. I was off for
> a couple of days. With some minor tweaks to my test setup I was able
> to reproduce and fix all 3 warnings.
>
> > [ 1135.125874] WARNING: CPU: 1 PID: 1644 at
> > drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment+0x164/0x2f0
> ...
> > [ 1136.178258] WARNING: CPU: 1 PID: 1644 at
> > drivers/dma-buf/dma-buf.c:1226 dma_buf_unmap_attachment+0x267/0x320
>
> Both of these are warnings that dma->resv is not locked when calling
> dma_buf_[un]map_attachment(). As far as I can tell so far, this can be
> resolved by using the unlocked versions:
> dma_buf_[un]map_attachment_unlocked() which is correct here for this
> static importer.
>
> ...
>
> > [ 1135.709313] WARNING: CPU: 3 PID: 1644 at
> > net/core/netdev_rx_queue.c:18 netdev_rx_queue_restart+0x3f4/0x5a0
>
> This is due to rtnl_lock() actually not being acquired in the unbind
> path, when the netlink socket is closed. Sorry about that. This is
> fixed by obtaining rtnl_lock() in the unbind path.
>
> With the fixes below all the warnings disappear. I'm planning to
> squash them to the next version. Let me know if those don't work for
> you. Thanks!
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index e52bca1a55c7c..a6ef1485b80f2 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -46,8 +46,8 @@ void __net_devmem_dmabuf_binding_free(struct
> net_devmem_dmabuf_binding *binding)
>                   size, avail))
>                 gen_pool_destroy(binding->chunk_pool);
>
> -       dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> -                                DMA_FROM_DEVICE);
> +       dma_buf_unmap_attachment_unlocked(binding->attachment, binding->s=
gt,
> +                                         DMA_FROM_DEVICE);
>         dma_buf_detach(binding->dmabuf, binding->attachment);
>         dma_buf_put(binding->dmabuf);
>         xa_destroy(&binding->bound_rxqs);
> @@ -157,8 +157,8 @@ struct net_devmem_dmabuf_binding
> *net_devmem_bind_dmabuf(struct net_device *dev,
>                 goto err_free_id;
>         }
>
> -       binding->sgt =3D
> -               dma_buf_map_attachment(binding->attachment, DMA_FROM_DEVI=
CE);
> +       binding->sgt =3D dma_buf_map_attachment_unlocked(binding->attachm=
ent,
> +                                                      DMA_FROM_DEVICE);
>         if (IS_ERR(binding->sgt)) {
>                 err =3D PTR_ERR(binding->sgt);
>                 goto err_detach;
> @@ -225,8 +225,8 @@ struct net_devmem_dmabuf_binding
> *net_devmem_bind_dmabuf(struct net_device *dev,
>                                 net_devmem_dmabuf_free_chunk_owner, NULL)=
;
>         gen_pool_destroy(binding->chunk_pool);
>  err_unmap:
> -       dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> -                                DMA_FROM_DEVICE);
> +       dma_buf_unmap_attachment_unlocked(binding->attachment, binding->s=
gt,
> +                                         DMA_FROM_DEVICE);
>  err_detach:
>         dma_buf_detach(dmabuf, binding->attachment);
>  err_free_id:
> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> index 4b16b3ad2ec5b..33bb20c143997 100644
> --- a/net/core/netdev-genl.c
> +++ b/net/core/netdev-genl.c
> @@ -861,6 +861,9 @@ void netdev_nl_sock_priv_destroy(struct list_head *pr=
iv)
>         struct net_devmem_dmabuf_binding *binding;
>         struct net_devmem_dmabuf_binding *temp;
>
> -       list_for_each_entry_safe(binding, temp, priv, list)
> +       list_for_each_entry_safe(binding, temp, priv, list) {
> +               rtnl_lock();
>                 net_devmem_unbind_dmabuf(binding);
> +               rtnl_unlock();
> +       }
>  }
>
>
>
> --
> Thanks,
> Mina

I tested the above fix, it works well.
And I found another bug.

[ 236.625141] BUG: KASAN: slab-use-after-free in
net_devmem_unbind_dmabuf+0x364/0x440
[ 236.633488] Read of size 8 at addr ffff8881490d00b0 by task ncdevmem/1480

[ 236.643137] CPU: 0 PID: 1480 Comm: ncdevmem Tainted: G W 6.10.0-rc5+
#50 8d4b0a557c4b34e2938739913129f
4523354121c
[ 236.655443] Hardware name: ASUS System Product Name/PRIME Z690-P D4,
BIOS 0603 11/01/2021
[ 236.664307] Call Trace:
[ 236.667443] <TASK>
[ 236.670234] dump_stack_lvl+0x7e/0xc0
[ 236.674583] print_report+0xc1/0x5e0
[ 236.678850] ? __virt_addr_valid+0x1f5/0x3d0
[ 236.683803] ? net_devmem_unbind_dmabuf+0x364/0x440
[ 236.689362] kasan_report+0xb9/0xf0
[ 236.693536] ? net_devmem_unbind_dmabuf+0x364/0x440
[ 236.699094] net_devmem_unbind_dmabuf+0x364/0x440
[ 236.704487] ? __pfx_lock_release+0x10/0x10
[ 236.709352] ? __pfx_net_devmem_unbind_dmabuf+0x10/0x10
[ 236.715256] netdev_nl_sock_priv_destroy+0x77/0xd0
[ 236.720743] genl_release+0xed/0x190
[ 236.725004] ? __pfx_genl_release+0x10/0x10
[ 236.729870] ? rcu_is_watching+0x11/0xb0
[ 236.734476] ? netlink_release+0x7d8/0x18f0
[ 236.739343] ? trace_irq_enable.constprop.0+0xe4/0x130
[ 236.745168] ? __pfx_genl_release+0x10/0x10
[ 236.750034] netlink_release+0x839/0x18f0
[ 236.754727] ? netlink_release+0x1a9/0x18f0
[ 236.759594] ? __pfx_netlink_release+0x10/0x10
[ 236.764719] ? __pfx_down_write+0x10/0x10
[ 236.769413] ? __pfx_locks_remove_file+0x10/0x10
[ 236.774718] __sock_release+0xa3/0x260
[ 236.779153] sock_close+0x14/0x20
[ 236.783153] __fput+0x367/0xad0
[ 236.786982] ? trace_irq_enable.constprop.0+0xe4/0x130
[ 236.792801] task_work_run+0x12e/0x220
[ 236.797243] ? __pfx_task_work_run+0x10/0x10
[ 236.802193] ? do_raw_spin_unlock+0x54/0x220
[ 236.807149] do_exit+0x916/0x2570
...
[ 236.994294] Allocated by task 1503:
[ 236.998470] kasan_save_stack+0x20/0x40
[ 237.002992] kasan_save_track+0x10/0x30
[ 237.007513] __kasan_slab_alloc+0x83/0x90
[ 237.012203] kmem_cache_alloc_node_noprof+0x154/0x380
[ 237.017936] kmalloc_reserve+0x140/0x240
[ 237.022541] __alloc_skb+0x10d/0x2d0
[ 237.026801] alloc_uevent_skb+0x79/0x210
[ 237.031408] kobject_uevent_env+0xd7c/0x10e0
[ 237.036362] __kobject_del+0x131/0x1d0
[ 237.040794] kobject_put+0x23e/0x3f0
[ 237.045056] net_rx_queue_update_kobjects+0x35d/0x470
[ 237.050789] netdev_unregister_kobject+0x139/0x250
[ 237.056266] unregister_netdevice_many_notify+0xf05/0x1900
[ 237.062429] unregister_netdevice_queue+0x29a/0x360
[ 237.067988] unregister_netdev+0x18/0x20
[ 237.072594] 0xffffffffc09de73c
[ 237.076422] pci_device_remove+0xa7/0x1d0
[ 237.081140] device_release_driver_internal+0x36d/0x530
[ 237.087044] driver_detach+0xc1/0x180
[ 237.091392] bus_remove_driver+0x11a/0x2a0
[ 237.096173] pci_unregister_driver+0x26/0x250
[ 237.101210] 0xffffffffc0a47b3c
[ 237.105038] __do_sys_delete_module.constprop.0+0x2ff/0x4b0
[ 237.111289] do_syscall_64+0x64/0x140
[ 237.115637] entry_SYSCALL_64_after_hwframe+0x76/0x7e

[ 237.123553] Freed by task 279:
[ 237.127296] kasan_save_stack+0x20/0x40
[ 237.131816] kasan_save_track+0x10/0x30
[ 237.136337] kasan_save_free_info+0x37/0x60
[ 237.141203] poison_slab_object+0xee/0x170
[ 237.145983] __kasan_slab_free+0x2f/0x50
[ 237.150589] kmem_cache_free+0x12e/0x470
[ 237.155197] skb_release_data+0x51f/0x790
[ 237.159891] consume_skb+0xa7/0x110
[ 237.164063] netlink_recvmsg+0x4f9/0xc80
[ 237.168672] ____sys_recvmsg+0x5fc/0x860
[ 237.173278] ___sys_recvmsg+0xd3/0x150
[ 237.177712] __sys_recvmsg+0xc6/0x160
[ 237.182060] do_syscall_64+0x64/0x140
[ 237.186405] entry_SYSCALL_64_after_hwframe+0x76/0x7e

[ 237.194320] The buggy address belongs to the object at ffff8881490d0040
which belongs to the cache skbuff_small_head of size 640
[ 237.208701] The buggy address is located 112 bytes inside of
freed 640-byte region [ffff8881490d0040, ffff8881490d02c0)

[ 237.224514] The buggy address belongs to the physical page:
[ 237.230763] page: refcount:1 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x1490d0
[ 237.239433] head: order:2 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[ 237.247755] flags: 0x200000000000040(head|node=3D0|zone=3D2)
[ 237.253746] page_type: 0xffffefff(slab)
[ 237.258265] raw: 0200000000000040 ffff8881050cadc0 ffffea0004153b10
ffffea00044ddb10
[ 237.266677] raw: 0000000000000000 0000000000120012 00000001ffffefff
0000000000000000
[ 237.275096] head: 0200000000000040 ffff8881050cadc0 ffffea0004153b10
ffffea00044ddb10
[ 237.283599] head: 0000000000000000 0000000000120012 00000001ffffefff
0000000000000000
[ 237.292095] head: 0200000000000002 ffffea0005243401 ffffffffffffffff
0000000000000000
[ 237.300590] head: 0000000000000004 0000000000000000 00000000ffffffff
0000000000000000
[ 237.309088] page dumped because: kasan: bad access detected

[ 237.317519] Memory state around the buggy address:
[ 237.322993] ffff8881490cff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc f=
c fc
[ 237.330887] ffff8881490d0000: fc fc fc fc fc fc fc fc fa fb fb fb fb fb f=
b fb
[ 237.338776] >ffff8881490d0080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb
[ 237.346668] ^
[ 237.352139] ffff8881490d0100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
[ 237.360032] ffff8881490d0180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
[ 237.367921] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Reproducer:
./ncdevmem -f <interface name> -l -p 5201 -v 7 -t 0 -q 2 &
sleep 10
modprobe -rv bnxt_en
killall ncdevmem

I think it's a devmemTCP core bug so this issue would be reproduced
with other drivers.

Thanks!
Taehee Yoo
