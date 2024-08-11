Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6394DF8A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 04:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82410E138;
	Sun, 11 Aug 2024 02:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NLleoAy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800E10E138
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 02:21:53 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6bd777e6623so11587736d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 19:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723342912; x=1723947712;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG9LHAeha0E5bVe70AIhZ3CulzWRiRRdzwCyU2ikkxg=;
 b=NLleoAy4TejI5fDUfc4tRyYKKUCZiKXUWguejW2Jg4hKy1LtMNsNXY15ID6OqnJYLm
 KJnEgenz5GiUweyiifijcCjTyb8S3syZACXpld9c9G1azrnuOc9rTmel07KP3DFaG9Ep
 sI5uhzozBoQ1gaUdYpYXeCdJovES7HMv48lT+7LsqeTdGOBglIUaUc4rMLj6+GhAOUJd
 d0mXPJGHYzNejEA1EaRUs32i2eDebqe26clqZPQVk0WGUyRGWTAbtKZrUuOmc0FJFg2o
 fw8WmOk6a7DGZngFrP4r1WFX8akl+VCJAxdbrIYTSjrxvo6Gnt0V5kyatbVTNMcfq9u0
 EXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723342912; x=1723947712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG9LHAeha0E5bVe70AIhZ3CulzWRiRRdzwCyU2ikkxg=;
 b=C/nxYUrIydGpy5DJVBTFZODCmmjAfqRW5g6oVursOZ19xhwjHI0UXznYD48bHKr+Gm
 GK1tmP1ng+fq3xeXpIdsU2hse5l2H50UTTSGtSb+yFAgpwdpFfuHZeIfNrEP6h7eF/dS
 tFw1+fDDnlzJXyIDBDvb+zec3NqYVyGRgaMux/TFty8vwyp32DSU1B1XlardfEq8zgDS
 k4850cjvwjodMzUPhH7m0C6V2E395RRlczafNl09hDNAA1oS6h5TKgzTXl5be1sCetM4
 /E7bu9o2RDOoMYgBIhh1eopbJk+bGONSpePMxsxqdmrwYrQSagn07goLEGRuKLvtLi9J
 UmSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn3OjWnsowga2H5tU2MRlnnPu5BjieyqgaqmcURhjo40EhtBnTyLQ4x4eqPfIVYSI0QBk220ABUG3qKfvilW+dKNNyblg1YI5MgfiKAL2t
X-Gm-Message-State: AOJu0YwH46T8DKPPHpm6Qc2zt6ctULO1yyacar5Zaj6yNaZYc6l0iqWo
 100k4zT9ypO5htDTs9Zo3yzpezE+10B+uStBD616icSQQZvUvcH18WMbnaA7o8tgGNU10YQACJw
 BBwq128HQXH0BiKYqqoVfIRkazkx9zkHS8auF
X-Google-Smtp-Source: AGHT+IEZ2o2IjbltxUtgiFqMaggi2EMslyYy4EjJKqHkpI3i2lfifDNDb+nrXQWahxplCc4kLWOurPaC9Ylw74lSj5w=
X-Received: by 2002:a05:6214:43c8:b0:6b5:dcda:bada with SMTP id
 6a1803df08f44-6bd78e8296cmr66071346d6.55.1723342911553; Sat, 10 Aug 2024
 19:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
In-Reply-To: <20240809205236.77c959b0@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 10 Aug 2024 22:21:39 -0400
Message-ID: <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
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
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
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

On Fri, Aug 9, 2024 at 11:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 9 Aug 2024 16:45:50 +0100 Pavel Begunkov wrote:
> > > I think this is good, and it doesn't seem hacky to me, because we can
> > > check the page_pools of the netdev while we hold rtnl, so we can be
> > > sure nothing is messing with the pp configuration in the meantime.
> > > Like you say below it does validate the driver rather than rely on th=
e
> > > driver saying it's doing the right thing. I'll look into putting this
> > > in the next version.
> >
> > Why not have a flag set by the driver and advertising whether it
> > supports providers or not, which should be checked for instance in
> > netdev_rx_queue_restart()? If set, the driver should do the right
> > thing. That's in addition to a new pp_params flag explicitly telling
> > if pp should use providers. It's more explicit and feels a little
> > less hacky.
>
> You mean like I suggested in the previous two emails? :)
>
> Given how easy the check is to implement, I think it's worth
> adding as a sanity check. But the flag should be the main API,
> if the sanity check starts to be annoying we'll ditch it.

I think we're talking about 2 slightly different flags, AFAIU.

Pavel and I are suggesting the driver reports "I support memory
providers" directly to core (via the queue-api or what not), and we
check that flag directly in netdev_rx_queue_restart(), and fail
immediately if the support is not there.

Jakub is suggesting a page_pool_params flag which lets the driver
report "I support memory providers". If the driver doesn't support it
but core is trying to configure that, then the page_pool_create will
fail, which will cause the queue API operation
(ndo_queue_alloc_mem_alloc) to fail, which causes
netdev_rx_queue_restart() to fail.

Both are fine, I don't see any extremely strong reason to pick one of
the other. I prefer Jakub's suggestion, just because it's closer to
the page_pool and may be more reusable in the future. I'll err on the
side of that unless I hear strong preference to the contrary.

I also think the additional check that Jakub is requesting is easy to
implement and unobjectionable. It would let core validate that the
driver did actually create the page_pool with the memory provider. I
think one of the goals of the queue API was to allow core to do more
validation on driver configuration anyway.

--=20
Thanks,
Mina
