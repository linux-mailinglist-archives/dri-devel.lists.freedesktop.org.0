Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B776C957C21
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 06:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FBB10E35E;
	Tue, 20 Aug 2024 04:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="30jjOP7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94C910E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 04:01:17 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso5351308276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 21:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724126476; x=1724731276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91poigCWUpxkIrphB8LTAAUF4NvT94tKi0OG/MNIdXA=;
 b=30jjOP7KDaiLUasmosYpblKG51ejRhhoMc4RIpn/twKZ8iPgXGLRe2f2x6zkNC/lSP
 HHBdd08p1KEd5IOY2rG4ZFer6TL/YXuQHUxk8wpVZeYx3G44jOb/QDLd/1VcEAf6kuYI
 nwoLF4VKcH4R1+flx40oPMRlwZpTd/ozKBitFFl6m2K7qNIYjcNBL/KBp2v6BKrA3pY0
 k7YO1wyeUkYeOxoLDZ47rpWvJJEoEg8Zyl1E9bQ+SsI+pt9rT2fn7Ag19lTCbfnQLjWD
 m64Rhhqm+lPm5sZmZ57M+U+/bbIIkccKRjUaND5lrfdw/ZpSVs7L7zaoR6+r5IlNiLCr
 VthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724126476; x=1724731276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91poigCWUpxkIrphB8LTAAUF4NvT94tKi0OG/MNIdXA=;
 b=loLCLvQ0frhB2k1jz/JeGS9a4RxJQAK9EiYdJWTRBSejNBWM/FPxE73h5AhPr1N6WT
 dSbJMqnLDYF1oSQfJdaYi5zNeGUMoCC5ynjz0LxN2EUCHd4OvlMUdvvSRuYZC0NyTyn/
 smj4SrV+HdDE+znr6ghv5HawXNnqbyJWWSCiciRqen7HyV1AdomXun8qM41ybGl0Z55M
 oq5sm90b5Z8mX/mrgxxKyu5ovDtRPmHYMh8lw77vAoAM1x70hhKXVS3wbZITtOz1gS5u
 VJrYqceidM8rQFOeZdc9E1km21oOCxw+kqPD5Y6rrEds6tAtd1HXVm7ywiekKIs/SSq6
 vGNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+dFZ+m5IM7mP40v68y8gJT3C384Mm4VEJ00xaSU3utFHRaPpuWMRKWBRFms0d3tSVxaRMDz7x5Wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6hGWAMa5r1/k70uZe9suVVBN1QMMjfX2B3p1jFIS5vPSU1mUy
 dbAhsue0n1sjA7CjSKJod3lofOxwPs08lNsXNN89c06FX0+RzxR9VG8DlqasxF+rk+hXF+x+dk4
 5eWdZRyRHP+FnIyN88VfgHKxnyzWNX2HIP+Qp
X-Google-Smtp-Source: AGHT+IHL4a8LRpwayEoQ60nOlF+jCofnGmOL57d389F39z0O/Ch4wlx8nI+0Mq8+7YKwjKglCY5bW1U/rwrYO3XPVyM=
X-Received: by 2002:a05:6902:1b04:b0:e16:1ebf:2945 with SMTP id
 3f1490d57ef6-e161ebf2f84mr5591540276.27.1724126476152; Mon, 19 Aug 2024
 21:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com>
 <20240819155257.1148e869@kernel.org>
In-Reply-To: <20240819155257.1148e869@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Aug 2024 00:01:02 -0400
Message-ID: <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>,
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

On Mon, Aug 19, 2024 at 6:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 19 Aug 2024 00:44:27 +0900 Taehee Yoo wrote:
> > > @@ -9537,6 +9540,10 @@ static int dev_xdp_attach(struct net_device *d=
ev, struct netlink_ext_ack *extack
> > >                         NL_SET_ERR_MSG(extack, "Native and generic XD=
P can't be active at the same time");
> > >                         return -EEXIST;
> > >                 }
> > > +               if (dev_get_max_mp_channel(dev) !=3D -1) {
> > > +                       NL_SET_ERR_MSG(extack, "XDP can't be installe=
d on a netdev using memory providers");
> > > +                       return -EINVAL;
> > > +               }
> >
> > Should we consider virtual interfaces like bonding, bridge, etc?
> > Virtual interfaces as an upper interface of physical interfaces can
> > still install XDP prog.
> >
> > # ip link add bond0 type bond
> > # ip link set eth0 master bond0
> > # ip link set bond0 xdp pin /sys/fs/bpf/x/y
> > and
> > # ip link set bond0 xdpgeneric pin /sys/fs/bpf/x/y
> >
> > All virtual interfaces can install generic XDP prog.
> > The bonding interface can install native XDP prog.
>
> Good point. We may need some common helpers to place the checks for XDP.
> They are spread all over the place now.

Took a bit of a look here. Forgive me, I'm not that familiar with XDP
and virtual interfaces, so I'm a bit unsure what to do here.

For veth, it seems, the device behind the veth is stored in
veth_priv->peer, so it seems maybe a dev_get_max_mp_channel() check on
veth_priv->peer is the way to go to disable this for veth? I think we
need to do this check on creation of the veth and on the ndo_bpf of
veth.

For bonding, it seems we need to add mp channel check in bond_xdp_set,
and bond_enslave?

There are a few other drivers that define ndo_add_slave, seems a check
in br_add_slave is needed as well.

This seems like a potentially deep rabbit hole with a few checks to
add all of the place. Is this blocking the series? AFAICT if XDP fails
with mp-bound queues with a benign error, that seems fine to me; I
don't have a use case for memory providers + xdp yet. This should only
be blocking if someone can repro a very serious error (kernel crash)
or something with this combination.

I can try to add these checks locally and propose as a follow up
series. Let me know if I'm on the right track with figuring out how to
implement this, and, if you feel like it's blocking.

--=20
Thanks,
Mina
