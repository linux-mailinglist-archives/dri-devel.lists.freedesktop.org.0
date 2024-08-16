Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC65954898
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C480710E4EA;
	Fri, 16 Aug 2024 12:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PEKVa+ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9B10E452
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:20:58 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6bd777e6623so10217126d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723810857; x=1724415657;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60gFb7YBVOLPqGwy/Oc6xhCaH/QA9b9t6B6yBp4eA0s=;
 b=PEKVa+eyyg2HQAlsa9oaBjV0Ag1/uwmQ5vJcWuK3l2t4PJao5s7in+SHhkhifrQM2g
 eFaTuxEiSdCATrXGRxYhEQ63HTVND3n63Ri/VVoCO6i0zf1KF0ts/1nS3Pt/EXOIu8FT
 MxpUwC9f5Ub+JlnpSHcsK8gmqrgQlMWfg/vdUuwkcbp2m88pB8M8TPuiFdu/E0a0FLPX
 16WBEqlASXqmoWDrTmbeRaJqGrExOecVZYk560bFC868QZBqPsO7oKByYReKI6eWBcSS
 e9u9VamL9tbItVcPc0xzCazJoj0SQGQib8xr2Qb07nLiMZ+FSy0wLNqLbjxeGT5VJ2fs
 I5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723810857; x=1724415657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60gFb7YBVOLPqGwy/Oc6xhCaH/QA9b9t6B6yBp4eA0s=;
 b=D+YtjabIkEdIHyHY5LhM5ZqWz1hUAvfwUdHuzHBaHluWsrTeWlP9wb2NBg3Hd2jAg7
 wLJWVwfodzrO1O4aQMqBtGJg6iCTl4my/cTIPei79Nnd5X1dzWib5bGfFISwNB0uc0UR
 5K7DTs9AxaWjOcYijUKeBgAgF8mCbQQyftABo1kRgu56WDFQLJZIkzd5k2faLqdUnD8M
 quupnnFZh0bh/QUwqbXi224fVcT87QEFKQy/sSs8AisaotYOVXd3SDvqPyia5sFm1mWe
 F2VMA+NUyjrbOm9/T3ACGe3leABUm2MPqSbs016yjQIWbftsNZ6rRRqVvlAiX8vs2lTQ
 oz5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXarAd9Ej2bGVhcJnJ/k1tOMpVJVmOIPfRSVfQtCFeKx/llfXx81qSzsJfCEfAXI97LKxZhgPjE+sJDscj27CvsnbXDiSPM1wdSlznFq0lI
X-Gm-Message-State: AOJu0YxGjTj41MFJzZDGj0/LPzfaLZA3mRo7O+qsa/F5zU+CTUHFI5P1
 0GuuddNL5jUhCZO7qrzHZwI/oECZcWBFIV3/WTIFQ+jufv+5AQiJ2IvpJvH4WKL9xmZZAr4AM36
 L8fu8dkD/laNkJHC2HAhTVMu/cn7VArNG6s4A
X-Google-Smtp-Source: AGHT+IGZmdSIKsIbNLMCWhDr7siS0fg53Dzm3mUEgRlOmZUGtYHuIW2VVl49SrIQcFwsu42Q03aJr/PwI9drpzidh7Q=
X-Received: by 2002:a05:6214:5713:b0:6bf:7c34:e419 with SMTP id
 6a1803df08f44-6bf7cdcb101mr38991616d6.5.1723810857192; Fri, 16 Aug 2024
 05:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-7-almasrymina@google.com>
 <de7daf80-a2e4-4451-b666-2a67ccc3649e@gmail.com>
 <CAHS8izPMC+XhXKbJOQ3ymizyKuARSOv_cO_xO+q1EG4zoy6Gig@mail.gmail.com>
 <31640ff4-25a6-4115-85e6-82092ce57393@gmail.com>
 <20240815182245.2b5e3f44@kernel.org>
In-Reply-To: <20240815182245.2b5e3f44@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 Aug 2024 08:20:44 -0400
Message-ID: <CAHS8izO9LDM9rLVnJPgp6QXb4YLW5+3ziGOHTqScy-SKOLejYA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 06/13] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
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

On Thu, Aug 15, 2024 at 9:22=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 14 Aug 2024 17:32:53 +0100 Pavel Begunkov wrote:
> > > This is where I get a bit confused. Jakub did mention that it is
> > > desirable for core to verify that the driver did the right thing,
> > > instead of trusting that a driver did the right thing without
> > > verifying. Relying on a flag from the driver opens the door for the
> > > driver to say "I support this" but actually not create the mp
> > > page_pool. In my mind the explicit check is superior to getting
> > > feedback from the driver.
> >
> > You can apply the same argument to anything, but not like
> > after each for example ->ndo_start_xmit we dig into the
> > interface's pending queue to make sure it was actually queued.
> >
> > And even if you check that there is a page pool, the driver
> > can just create an empty pool that it'll never use. There
> > are always ways to make it wrong.
> >
> > Yes, there is a difference, and I'm not against it as a
> > WARN_ON_ONCE after failing it in a more explicit way.
> >
> > Jakub might have a different opinion on how it should look
> > like, and we can clarify on that, but I do believe it's a
> > confusing interface that can be easily made better.
>
> My queue API RFC patches had configuration arguments, not sure if this
> is the right version but you'll get the idea:
> https://github.com/kuba-moo/linux/blob/qcfg/include/net/netdev_cfg.h#L43-=
L50
> This way we can _tell_ the driver what the config should be. That part
> got lost somewhere along the way, because perhaps in its embryonic form
> it doesn't make sense.
>
> We can bring it back, add HDS with threshold of 0, to it, and a bit for
> non-readable memory. On top of that "capability bits" in struct
> netdev_queue_mgmt_ops to mark that the driver pays attention to particula=
r
> fields of the config.
>
> Not sure if it should block the series, but that'd be the way I'd do it
> (for now?)
>

I'm not sure I want to go into a rabbit hole of adding configuration
via the queue API, blocking this series . We had discussed this months
back and figured that it's a significant undertaking on its own. I'm
not sure GVE has HDS threshold capability for example, and I'm also
not sure how to coexist header split negotiability via the queue API
when an ethtool API exists alongside it. I think this is worthy of
separating in its own follow up series.

For now detecting that the driver was able to create the page_pool
with the correct memory provider in core should be sufficient. Also
asking the driver to set a
netdev_rx_queue->unreadable_netmem_supported flag should also be
sufficient. I've implemented both locally and they work well.

> I'd keep the current check with a WARN_ON_ONCE(), tho.
> Given the absence of tests driver developers can use.
> Especially those who _aren't_ supporting the feature.
>

Yes what I have locally is the driver setting
netdev_rx_queue->unreadable_netmem_supported when header split is
turned on, and additionally a WARN_ON_ONCE around the check in core. I
was about to send that when I read your email. I'm hoping we don't
have to go through the scope creep of adding configuration via the
queue API, which I think is a very significant undertaking.

> > > and cons to each approach; I don't see a showstopping reason to go
> > > with one over the other.
> > >
> > >> And page_pool_check_memory_provider() is not that straightforward,
> > >> it doesn't walk through pools of a queue.
> > >
> > > Right, we don't save the pp of a queue, only a netdev. The outer loop
> > > checks all the pps of the netdev to find one with the correct binding=
,
> > > and the inner loop checks that this binding is attached to the correc=
t
> > > queue.
> >
> > That's the thing, I doubt about the second part.
> >
> > net_devmem_bind_dmabuf_to_queue() {
> >       err =3D xa_alloc(&binding->bound_rxqs, &xa_idx, rxq);
> >       if (err)
> >               return err;
> >
> >       netdev_rx_queue_restart();
> >
> >       // page_pool_check_memory_provider
> >       ...
> >       xa_for_each(&binding->bound_rxqs, xa_idx, binding_rxq) {
> >               if (rxq =3D=3D binding_rxq)
> >                       return success;
> > }
> >
> > Can't b4 the patches for some reason, but that's the highlight
> > from the patchset, correct me if I'm wrong. That xa_for_each
> > check is always true because you put the queue in there right
> > before it, and I don't that anyone could've erased it.
> >
> > The problem here is that it seems the ->bound_rxqs state doesn't
> > depend on what page pools were actually created and with what mp.
>
> FWIW I don't understand the point of walking the xa either.
> Just check the queue number of the pp you found matches,
> page pool params are saved in the page pool. No?
>

Yes, I changed this check to check pool->p.queue, and it works fine.

--=20
Thanks,
Mina
