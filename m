Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329893A8D9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 23:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D9210E547;
	Tue, 23 Jul 2024 21:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="F+Aqq6+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889E410E547
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 21:49:49 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e0354459844so5689221276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721771388; x=1722376188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yF33mP3g3PVeShTJgLfx3fwdjlEE8z1s+DJQDSjcr+Y=;
 b=F+Aqq6+/PAkVhpxPtiAZFi/3PwmVGi0fjaUg5AwjyvXD00uF4mLmiGqqgiZby4FbAF
 WNfMezk5we4clM32nhhASxaGEYxWbJkbaIBjNkBqKGrkPVmxYpJmH4Hc3CUzfFV492AT
 KQSQEAOlk7fjDu7bCWboS1eGdgh3DADVjURo+2ZBkoRXRcp/aHD7skOzWpbZpbQXsPYh
 6kOpPhm6aCV9lkM8IH3+sYUmn1/1x+6JtD1L0Nd4jnNqA/ilv4F4WnW+p4oI/V6ELvbZ
 xNtXh0Sqdxzbfw0IsrV8+265aJnhFom/pe9RQUGxBoOKv30LMgmSgC3/fq2ccjvDXVJ2
 ZO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721771388; x=1722376188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yF33mP3g3PVeShTJgLfx3fwdjlEE8z1s+DJQDSjcr+Y=;
 b=rH/vDcBYCmUKN5F8Io+kp/uYwAsrfkpObZNeLsAK8F4I99f94z7496MFw55tYtp+Mh
 ojq09X10wp9mJN0SGwZFDhXCnYC5BvnIi2GDrtms7WckKEPzUmfiHhpdE+khg2448VgP
 n7RtjexIf1XE1mOqNwu9wjC//KBqApJIqP19LJQo/12na9rWFUYMBWf7E2ccDaZ+jG+2
 0Rr+2u5ghui6KrFrEpVy+LjAdZrlO8fU4vZSqSptU1HjKcnXnfv3aExYr7qZD7vHbLsp
 0vpkcD6RywjbdUai4f1F6MAwqp6wwdL8OC9sKIa1cqSWxsK78gNb7JrBY50G63sEk14v
 JoyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOjYdkzoL+CA1cDMklxCtpmQCulM/PuegQxwMriSg8lBeO28ZVE6IcOYOqFC0Ur3JLDuOE8hAUbRmSODvuSJMEPCJJZiHSlXm6pBBmCT89
X-Gm-Message-State: AOJu0YzKkWDp8nsFJeKRqJDO0KE26ErHzlYwJ+zkAZFxrBhWE5qqid1r
 4N1gZj+S8o89M7dMmE1M5kVUHkv+aab4m7SKk7m+jgENFypaNGTZ/cX28nm0Q0rIKRSNiz611d5
 AEjyUCg62sWSRLXROfpVM/T69i8dxd5+8WXLX
X-Google-Smtp-Source: AGHT+IH5JJRTlNbepSdsOAGPfU8tDz3MNG4de1Wtf/RZgU4beT2V9Y9SRFjNnPwNA1SLBZA82p/Z63pCaOnO/csApGk=
X-Received: by 2002:a05:6902:1108:b0:e08:7607:bbf3 with SMTP id
 3f1490d57ef6-e0b097d5744mr1316657276.34.1721771388342; Tue, 23 Jul 2024
 14:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
 <CAMArcTUqqxam+BPwGExOFOLVi3t=dwA-5sSagKC5dndv07GDLQ@mail.gmail.com>
 <CAHS8izNS5jZjPfc-sARbHV7mzqzH+UhHfAtCTKRRTfSAdhY4Cw@mail.gmail.com>
 <CAMArcTUdCxOBYGF3vpbq=eBvqZfnc44KBaQTN7H-wqdUxZdziw@mail.gmail.com>
In-Reply-To: <CAMArcTUdCxOBYGF3vpbq=eBvqZfnc44KBaQTN7H-wqdUxZdziw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 23 Jul 2024 14:49:34 -0700
Message-ID: <CAHS8izMTGgZ+4fOKegUDLqAoxrdVEb+nqjQEt8bP0WLBV=FfrQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 03/14] netdev: support binding dma-buf to
 netdevice
To: Taehee Yoo <ap420073@gmail.com>
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

On Tue, Jul 9, 2024 at 8:37=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wrot=
e:
...
> Reproducer:
> ./ncdevmem -f <interface name> -l -p 5201 -v 7 -t 0 -q 2 &
> sleep 10
> modprobe -rv bnxt_en
> killall ncdevmem
>
> I think it's a devmemTCP core bug so this issue would be reproduced
> with other drivers.

Sorry for the late reply. I was out at netdev.

I'm also having trouble reproducing this, not because the bug doesn't
exist, but quirks with my test setup that I need to figure out. AFAICT
this diff should fix the issue. If you have time to confirm, let me
know if it doesn't work for you. It should apply on top of v16:

commit 795b8ff01906d ("fix for release issue")
Author: Mina Almasry <almasrymina@google.com>
Date:   Tue Jul 23 00:18:23 2024 +0000

    fix for release issue

    Change-Id: Ib45a0aa6cba2918db5f7ba535414ffa860911fa4



diff --git a/include/net/devmem.h b/include/net/devmem.h
index 51b25ba193c96..df52526bb516a 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -68,6 +68,9 @@ net_devmem_bind_dmabuf(struct net_device *dev,
unsigned int dmabuf_fd);
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
                                    struct net_devmem_dmabuf_binding *bindi=
ng);
+
+void dev_dmabuf_uninstall(struct net_device *dev);
+
 struct net_iov *
 net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
 void net_devmem_free_dmabuf(struct net_iov *ppiov);
diff --git a/net/core/dev.c b/net/core/dev.c
index 5882ddc3f8592..7be084e4936e4 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11320,6 +11320,7 @@ void unregister_netdevice_many_notify(struct
list_head *head,
                dev_tcx_uninstall(dev);
                dev_xdp_uninstall(dev);
                bpf_dev_bound_netdev_unregister(dev);
+               dev_dmabuf_uninstall(dev);

                netdev_offload_xstats_disable_all(dev);

diff --git a/net/core/devmem.c b/net/core/devmem.c
index e75057ecfa6de..227bcb1070ec0 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -362,4 +362,20 @@ bool mp_dmabuf_devmem_release_page(struct
page_pool *pool, netmem_ref netmem)
        return false;
 }

+void dev_dmabuf_uninstall(struct net_device *dev)
+{
+       unsigned int i, count =3D dev->num_rx_queues;
+       struct net_devmem_dmabuf_binding *binding;
+       struct netdev_rx_queue *rxq;
+       unsigned long xa_idx;
+
+       for (i =3D 0; i < count; i++) {
+               binding =3D dev->_rx[i].mp_params.mp_priv;
+               if (binding)
+                       xa_for_each(&binding->bound_rxqs, xa_idx, rxq)
+                               if (rxq =3D=3D &dev->_rx[i])
+                                       xa_erase(&binding->bound_rxqs, xa_i=
dx);
+       }
+}
+
 #endif

--=20
Thanks,
Mina
