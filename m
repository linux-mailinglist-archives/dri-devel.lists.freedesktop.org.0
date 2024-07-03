Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B421926683
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80510E0C2;
	Wed,  3 Jul 2024 16:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P6u58XQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0A910E1A9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 16:56:58 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b5dee163d1so7339966d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720025817; x=1720630617;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZrJD6ayDYRlKNRvFck9p1oXm/3SuBonkBJdf4YKQA4Q=;
 b=P6u58XQbIkAjs1aw2rCjVyp8AlehjpQh+TRPQ9QhRFB25qhXs38hk8eUmlawDEHTq9
 60OZu243Z64thTE8wrdnrR0ZqV7JSnHBDQHrKivRVtOT4XuyFBRjLZIkzaNmpuHwQBT+
 nhIZNVckG/nnmraa/J2JKQ7N9DBd2x3LXyfUNTJIyjZru1ZhUhWg6yvTeIsp0txKRbqo
 uewQSdRr0AjD8OIwp/gtKzUKjevPb8J9e17hb+10fhgGoA5JQCiQjEaIWWePOlMlhIS+
 0Rnwbm7Xg+pgK05/wQpoqHEBkDbZPTIIDo8iKOjrgS4A2I+V1sbW4MkD07db2wwiN806
 +ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720025817; x=1720630617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZrJD6ayDYRlKNRvFck9p1oXm/3SuBonkBJdf4YKQA4Q=;
 b=t0hKdqKUa7bYLdXE1Z9QFJ2h0oSU0bLe1dvm4MlfbySejEr/BoVwRE8HcLP3zKPdb1
 V8nJ+gHUXHJn4rak2CAVsLEZ9KmhiF8udrP8VkJWict4MEGFI6cFuarq0NPBEZvfrYRN
 9e+Kbr5/GRpIWcqlFRQ61loEZd07ZJpj12GeQZH/26sICI2JeR/T69JcwFZeRqbYezDY
 Z9vK6/5lyUEQ8T8ui0OUH5tgDHV5GRKJwEiEYrAG9eQKHYKebr310qaxl/tXj54M+cAX
 QwkQ4xeVKuzdArKbSIgb90Gxp8JvcP7BbV+XBldo9reLmfxEho6gUjYtzQ7KKK/LYYHy
 I6Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIcY+0xIa00NjR7wd3JOm7JNb2oLIU5ekfVAapKgwu5Yewb6R7fy+SVwF48yyejEuUJ0jwi/AfNfm1DLKsNvYSL03JI7dw95IJUi/mflX8
X-Gm-Message-State: AOJu0YyO82h4UcZ9Aw3eByIko2Nlc8eqf/vJTy1tvpSNLZuvt+nEZ/XH
 HlJSisHAJmZZk6H5n7vr3bMLxUwAl2p4+mrkJgJyR1wxi7BJllieNlLVDhybL/j8i67+Sdq+WkL
 ZMdyL7tpeYr5Eal+UoiH/LBymENyFZIwFn2Lq
X-Google-Smtp-Source: AGHT+IHa/cTtQMTpCl1GUnThR28S74I0bK2ol+291xiVaR+Vs/Jxc9vIdy+MzRrhMch0GbY9JMd0YjCsO1EcciUeO1w=
X-Received: by 2002:a05:6214:20e2:b0:6b5:198e:353d with SMTP id
 6a1803df08f44-6b5e18b18f4mr30603556d6.10.1720025817412; Wed, 03 Jul 2024
 09:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
 <20240702180908.0eccf78f@kernel.org>
In-Reply-To: <20240702180908.0eccf78f@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 3 Jul 2024 09:56:45 -0700
Message-ID: <CAHS8izOCuNZWfZR_jecFOMu2XGqcYUkuVf38wRqBvoE9tmGzoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 03/14] netdev: support binding dma-buf to
 netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
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

On Tue, Jul 2, 2024 at 6:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Fri, 28 Jun 2024 00:32:40 +0000 Mina Almasry wrote:
> > +     if (binding->list.next)
> > +             list_del(&binding->list);
> > +
> > +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
>
> nit: s/bound_rxq_list/bound_rxqs/ ? it's not a list
>
> > +             if (rxq->mp_params.mp_priv =3D=3D binding) {
> > +                     /* We hold the rtnl_lock while binding/unbinding
> > +                      * dma-buf, so we can't race with another thread =
that
> > +                      * is also modifying this value. However, the pag=
e_pool
> > +                      * may read this config while it's creating its
> > +                      * rx-queues. WRITE_ONCE() here to match the
> > +                      * READ_ONCE() in the page_pool.
> > +                      */
> > +                     WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
>
> Is this really sufficient in terms of locking? @binding is not
> RCU-protected and neither is the reader guaranteed to be in
> an RCU critical section. Actually the "reader" tries to take a ref
> and use this struct so it's not even a pure reader.
>
> Let's add a lock or use one of the existing locks
>

Can we just use rtnl_lock() for this synchronization? It seems it's
already locked everywhere that access mp_params.mp_priv, so the
WRITE/READ_ONCE are actually superfluous. Both the dmabuf bind/unbind
already lock rtnl_lock, and the only other place that access
mp_params.mp_priv is page_pool_init(). I think it's reasonable to
assume rtnl_lock is also held during page_pool_init, no? AFAICT it
would be very weird for some code path to be reconfiguring the driver
page_pools without holding rtnl_lock?

What I wanna do here is delete the incorrect comment, remove the
READ/WRITE_ONCE, and maybe add a DEBUG_NET_WARN_ON(!rtnl_is_locked())
in mp_dmabuf_devmem_init() but probably that is too defensive.

Will apply the other comments, thanks.

--=20
Thanks,
Mina
