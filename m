Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB360875C3A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 03:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4510E795;
	Fri,  8 Mar 2024 02:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="h6COZuhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8F710E743
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 02:08:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso214082766b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 18:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709863717; x=1710468517;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5QPfVVlznHCy9800rrfO6KR+EEw66k04MBVvznezAw=;
 b=h6COZuhD9xKSS4x7eBmTXac12O61uwXIOI17oYsf6FU19lG+95kcfn9o7/L7KTJB2y
 P3BHPMkvkKms4/8SEY7S7VJFKBNQjAOgaTTxN3859NKicEVYoDzasAwFRkHr4mCZSff+
 hMqHYsiGqn346pVMfjyp0/65qC09oAGyNWuRdC7llgE6lVRLwJfgLh5mMKn4J3wIpqpF
 qDbdTH5PihSiopbMhXuI7iHSCt9W9j0An/LwzNzMgqTXff7rfJWuvj0VwSJM/CW0SMcu
 EFFLg57vu5rV1p0qB1+81yVz+Gp3FQL0E+XcUCleRmHzoXKJcFvEtFm/PRezfOzAG3aM
 3OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709863717; x=1710468517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5QPfVVlznHCy9800rrfO6KR+EEw66k04MBVvznezAw=;
 b=ZRDe40xoBH2Bahnct46rnOycINZaKpt60xwtCjck3Oi1AnCRIX8Umg9iqX0IkPtVA5
 uephse9yoQTJEAzBOzoFd/gBp0bFKZHk/LcOs9hGk4iV0lYZzdE9wI4mcHoX2bjOjZR3
 q0PuBII9T2eyUzKpKiUW+4+3GU3nEXMUY5DV0hNzadvD9wZPu30MiiJSmZDQjPMCaTT1
 JwwEY2k2L3mstO2lwBkU+tcZ+KxZkKnXeaXezb6QVkRQcr/MDwBT3nuBvh9yjvSOmTB0
 dYpwze/qJJp6V9xe95/lEdYKRCY1dGmIKewWkdCwASUT1fDiG+D5ZPJ+M4oMUoS+sOHC
 LNQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEP9Jn6+jMp05clU5pzz+ZaGtqOFQRIZme5RS9jem76Nf9JYcN3XgiMNfxzY/T2o+NW729KV7tm2JS2n4OvbC1Bk3DOsxuAxCrGVHIxoqe
X-Gm-Message-State: AOJu0Yxfgu/XPsmW/5AH8T50BqbdY9X3kDAQMMy1lqYL3i5f68k8vbfh
 b2N5RKlpayIPb8ZiZiwAlM6+Giz1a3MjseqRQcrXn1FTj7LEA2hHxK8kC4ZLoBZGTbxXHfUr7pb
 Vg72YGwi0QJENxWL2oFAsRDGMAGJCNroD8K7Y
X-Google-Smtp-Source: AGHT+IEumbOv6N2RdvxqNHnmUGQyPJoik+UnzOHCm5V6zf8kG5cWaKe9qZLk7VBIdBkDMUerOetVJNL7YjESeOQCAoM=
X-Received: by 2002:a17:906:b055:b0:a45:ba06:e501 with SMTP id
 bj21-20020a170906b05500b00a45ba06e501mr4646563ejb.57.1709863716984; Thu, 07
 Mar 2024 18:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-2-almasrymina@google.com>
 <20240307173039.00e6fbb7@kernel.org>
In-Reply-To: <20240307173039.00e6fbb7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 7 Mar 2024 18:08:24 -0800
Message-ID: <CAHS8izPyxn2LsOsxL98WAHse21tq3i9MCp_Xn8AA8sx5iettNQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 01/15] queue_api: define queue api
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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

On Thu, Mar 7, 2024 at 5:30=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  4 Mar 2024 18:01:36 -0800 Mina Almasry wrote:
> > + * void *(*ndo_queue_mem_alloc)(struct net_device *dev, int idx);
> > + *   Allocate memory for an RX queue. The memory returned in the form =
of
> > + *   a void * can be passed to ndo_queue_mem_free() for freeing or to
> > + *   ndo_queue_start to create an RX queue with this memory.
> > + *
> > + * void      (*ndo_queue_mem_free)(struct net_device *dev, void *);
> > + *   Free memory from an RX queue.
> > + *
> > + * int (*ndo_queue_start)(struct net_device *dev, int idx, void *);
> > + *   Start an RX queue at the specified index.
> > + *
> > + * int (*ndo_queue_stop)(struct net_device *dev, int idx, void **);
> > + *   Stop the RX queue at the specified index.
> >   */
> >  struct net_device_ops {
> >       int                     (*ndo_init)(struct net_device *dev);
> > @@ -1679,6 +1693,16 @@ struct net_device_ops {
> >       int                     (*ndo_hwtstamp_set)(struct net_device *de=
v,
> >                                                   struct kernel_hwtstam=
p_config *kernel_config,
> >                                                   struct netlink_ext_ac=
k *extack);
> > +     void *                  (*ndo_queue_mem_alloc)(struct net_device =
*dev,
> > +                                                    int idx);
> > +     void                    (*ndo_queue_mem_free)(struct net_device *=
dev,
> > +                                                   void *queue_mem);
> > +     int                     (*ndo_queue_start)(struct net_device *dev=
,
> > +                                                int idx,
> > +                                                void *queue_mem);
> > +     int                     (*ndo_queue_stop)(struct net_device *dev,
> > +                                               int idx,
> > +                                               void **out_queue_mem);
>
> The queue configuration object was quite an integral part of the design,
> I'm slightly worried that it's not here :)

That was a bit of a simplification I'm making since we just want to
restart the queue. I thought it was OK to define some minimal version
here and extend it later with configuration? Because in this context
all we really need is to restart the queue, yes?

If extending with some configuration is a must please let me know what
configuration struct you're envisioning. Were you envisioning a stub?
Or some real configuration struct that we just don't use at the
moment? Or one that we use for this use case somehow?

> Also we may want to rename
> the about-to-be-merged ops from netdev_stat_ops and netdev_queue_ops,
> and add these there?
>
> https://lore.kernel.org/all/20240306195509.1502746-2-kuba@kernel.org/
>

Yeah, that sounds reasonable! Thanks! We could also keep the
netdev_stat_ops and add new netdev_queue_ops alongside them if you
prefer.

> Very excited to hear that you made progress on this and ported GVE over!

Actually, we're still discussing but it looks like my GVE queue API
implementation I proposed earlier may be a no-go. Likely someone from
the GVE team will follow up here with this piece, probably in a
separate series.

For now I'm carrying my POC for the GVE implementation out of tree
with the rest of the driver changes:

https://github.com/mina/linux/commit/501b734c80186545281e9edb1bf313f5a2d8cb=
ee

--=20
Thanks,
Mina
