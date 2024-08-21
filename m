Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D5959709
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9764610E04D;
	Wed, 21 Aug 2024 09:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpwypHRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F97A10E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:15:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc7d2so43867541fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724231703; x=1724836503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/AL1OeL8iYesAGF2KkaZ/rqFlEZKCDby71JmQLIyGU=;
 b=gpwypHRILGQcv3cAu2bKPGXrYrHB2V+QRTwnWFhx+O4ob/KcKb4guLa7Nz+NO+eYFg
 CoUzsenBr9finqwe2LTDRPKzngBS7fZNUwhxA1EEKb8KhdyTtcD/tbD4j6FPczI4hxX7
 +g2hqi1T3kRylPKMeNP1u7/K/AzdXU0wUADkk1s2H5S31tNsoJ/80+Yp4dxmU4G+zYKN
 /pX+7STWIqZ+9pklazUePr6uzHOr3KuiD9oECH616xvGwV1BzNwEec6EbptZfkHj3Ffw
 b/ni8W6WsiWWKLg1jrMuEg/eZr4dNtEI/3MAhQbi/75ay8+jmxkLMBHgAkkrPMWM/nWP
 T4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724231703; x=1724836503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/AL1OeL8iYesAGF2KkaZ/rqFlEZKCDby71JmQLIyGU=;
 b=nlHcdCFQlYQUMCn2QpgMVLfqToS9VymORz0a0zfsHBeqMR0I+iuL6sE5pex6iLFTJ5
 VEGFuoutQsul2uLl8caisY9TadnPRSNVM8Nrh4gnDZLCjpFcj2YLh1/kCj7a5+FVHSy9
 USb/jI3buNDaiynyQ4smV0w7wzT9BEg4D4xRgMPGvUSbad7xrGBW9kMdSgaebEuR/PbL
 BzTHIPfdyK7S4GWmynlrXLohhA6l3ymecns7GVuzX/rcbziVbE/R19+gc2OrUXyr+glU
 wnIp9LIT6ceE4dwc/ByuRUcZ9oisewL1BbArSvthE10f8IoiPjwNJTe4Vq6PT5TJ+DMR
 BxlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/MZ/94+CM8KblBmvqCG3Lfyup+xn4WMLz7KQvBeLYHHxy8kFsDaw3ay9SAJu5XioYylgu1C43ROA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyRqIQEM9oob51nq2FHTc/J4tA4nwnEog+dzIij8k2hbzyPQbW
 8nSzne2s8hICos40Np4GnFPDAiBOsrdUY9gRLCIP1UPADTB/mpzVj1S0XimtwKmOGL6NGPcRUui
 1m2STXlXbHiGIgSoiSjnoQOmENFg=
X-Google-Smtp-Source: AGHT+IGLGfjw+Fjk2rSsSnYZ7V+bLHHFrxyDZsACc2hqiPsKgWXLHNd/EC/FWx9bAUeST6qbartz/G3Ry9JaBMthtOI=
X-Received: by 2002:a2e:988a:0:b0:2ef:2f17:9ede with SMTP id
 38308e7fff4ca-2f3f8b600a8mr8953001fa.49.1724231702724; Wed, 21 Aug 2024
 02:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com>
 <20240819155257.1148e869@kernel.org>
 <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
In-Reply-To: <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 21 Aug 2024 18:14:50 +0900
Message-ID: <CAMArcTXvccYBPZTEuW-z=uTK7W67utd9-xjPzfxEOvUWhPS7bg@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Tue, Aug 20, 2024 at 1:01=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Aug 19, 2024 at 6:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Mon, 19 Aug 2024 00:44:27 +0900 Taehee Yoo wrote:
> > > > @@ -9537,6 +9540,10 @@ static int dev_xdp_attach(struct net_device =
*dev, struct netlink_ext_ack *extack
> > > >                         NL_SET_ERR_MSG(extack, "Native and generic =
XDP can't be active at the same time");
> > > >                         return -EEXIST;
> > > >                 }
> > > > +               if (dev_get_max_mp_channel(dev) !=3D -1) {
> > > > +                       NL_SET_ERR_MSG(extack, "XDP can't be instal=
led on a netdev using memory providers");
> > > > +                       return -EINVAL;
> > > > +               }
> > >
> > > Should we consider virtual interfaces like bonding, bridge, etc?
> > > Virtual interfaces as an upper interface of physical interfaces can
> > > still install XDP prog.
> > >
> > > # ip link add bond0 type bond
> > > # ip link set eth0 master bond0
> > > # ip link set bond0 xdp pin /sys/fs/bpf/x/y
> > > and
> > > # ip link set bond0 xdpgeneric pin /sys/fs/bpf/x/y
> > >
> > > All virtual interfaces can install generic XDP prog.
> > > The bonding interface can install native XDP prog.
> >
> > Good point. We may need some common helpers to place the checks for XDP=
.
> > They are spread all over the place now.
>
> Took a bit of a look here. Forgive me, I'm not that familiar with XDP
> and virtual interfaces, so I'm a bit unsure what to do here.
>
> For veth, it seems, the device behind the veth is stored in
> veth_priv->peer, so it seems maybe a dev_get_max_mp_channel() check on
> veth_priv->peer is the way to go to disable this for veth? I think we
> need to do this check on creation of the veth and on the ndo_bpf of
> veth.
>
> For bonding, it seems we need to add mp channel check in bond_xdp_set,
> and bond_enslave?
>
> There are a few other drivers that define ndo_add_slave, seems a check
> in br_add_slave is needed as well.
>
> This seems like a potentially deep rabbit hole with a few checks to
> add all of the place. Is this blocking the series? AFAICT if XDP fails
> with mp-bound queues with a benign error, that seems fine to me; I
> don't have a use case for memory providers + xdp yet. This should only
> be blocking if someone can repro a very serious error (kernel crash)
> or something with this combination.
>
> I can try to add these checks locally and propose as a follow up
> series. Let me know if I'm on the right track with figuring out how to
> implement this, and, if you feel like it's blocking.
>
> --
> Thanks,
> Mina

I agree with the current approach, which uses the
dev_get_min_mp_channel_count() in the dev_xdp_attach().
The only problem that I am concerned about is the
dev_get_min_mp_channel_count() can't check lower interfaces.
So, how about just making the current code to be able to check lower
interfaces?
Here is a rough modification and I tested it. it works well.
Please look into this code.

diff --git a/net/core/dev.c b/net/core/dev.c
index f6f40c682b83..87c7985cb242 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6989,6 +6989,27 @@ static __latent_entropy void
net_rx_action(struct softirq_action *h)
        bpf_net_ctx_clear(bpf_net_ctx);
 }

+static int __dev_get_min_mp_channel_count(struct net_device *dev,
+                                         struct netdev_nested_priv *priv)
+{
+       int i, max =3D 0;
+
+       ASSERT_RTNL();
+
+       for (i =3D 0; i < dev->real_num_rx_queues; i++)
+               if (dev->_rx[i].mp_params.mp_priv)
+                       /* The channel count is the idx plus 1. */
+                       max =3D i + 1;
+
+       return max;
+}
+
+u32 dev_get_min_mp_channel_count(const struct net_device *dev)
+{
+       return (u32)__dev_get_min_mp_channel_count((struct net_device *)dev=
,
+                                                  NULL);
+}
+
 struct netdev_adjacent {
        struct net_device *dev;
        netdevice_tracker dev_tracker;
@@ -9538,7 +9559,10 @@ static int dev_xdp_attach(struct net_device
*dev, struct netlink_ext_ack *extack
                        NL_SET_ERR_MSG(extack, "Native and generic XDP
can't be active at the same time");
                        return -EEXIST;
                }
-               if (dev_get_min_mp_channel_count(dev)) {
+
+               if (netdev_walk_all_lower_dev(dev,
+                                             __dev_get_min_mp_channel_coun=
t,
+                                             NULL)) {
                        NL_SET_ERR_MSG(extack, "XDP can't be installed
on a netdev using memory providers");
                        return -EINVAL;
                }
@@ -9826,20 +9850,6 @@ int dev_change_xdp_fd(struct net_device *dev,
struct netlink_ext_ack *extack,
        return err;
 }

-u32 dev_get_min_mp_channel_count(const struct net_device *dev)
-{
-       u32 i, max =3D 0;
-
-       ASSERT_RTNL();
-
-       for (i =3D 0; i < dev->real_num_rx_queues; i++)
-               if (dev->_rx[i].mp_params.mp_priv)
-                       /* The channel count is the idx plus 1. */
-                       max =3D i + 1;
-
-       return max;
-}
-
 /**
  * dev_index_reserve() - allocate an ifindex in a namespace
  * @net: the applicable net namespace

How to test:
ip link add bond2 type bond
ip link add bond1 master bond2 type bond
ip link add bond0 master bond1 type bond
ip link set eth0 master bond0
ip link set eth0 up
ip link set bond0 up
ip link set bond1 up
ip link set bond2 up

ip link set bond2 xdp pin /sys/fs/bpf/x/y

./ncdevmem -s 192.168.1.4 -c 192.168.1.2 -f eth0 -l -p 5201 -v 7 -t 0 -q 1

# bond2 <-- xdp should not be installed.
#   |
# bond1 <-- xdp should not be installed.
#   |
# bond0 <-- xdp should not be installed.
#   |
# eth0 <--memory provider is used.

The netdev_walk_all_lower_dev() calls the callback function
(__dev_get_min_mp_channel_count) while it walks its own all lower
interfaces recursively.
If we want to check more conditions, we can just add checks in
__dev_get_min_mp_channel_count() or change the callback function.

Note that currently dev_xdp_attach() checks upper interfaces with
netdev_for_each_upper_dev_rcu() but it doesn't work recursively.
I think It should be fixed to check upper interfaces recursively in a
separate patch.

Thanks a lot!
Taehee Yoo
