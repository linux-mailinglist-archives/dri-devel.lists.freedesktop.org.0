Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE89500B3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AFE10E2A5;
	Tue, 13 Aug 2024 09:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tkO28/90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334B810E2A5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:03:46 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-81ff08e24f8so1724198241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723539825; x=1724144625;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqfnVnhHsKTNIdZ3g99elQ8N0kSquMZj93pvaOSIp0U=;
 b=tkO28/90B+02RYh16bTvVHVw2LVyQEDIE48sF9MhZBltNATZL27fG37iUWzQeQ+z29
 j8S3cYaXew+nBb6v0j7lWS8z3JTckA98aRjS6Nw7oL/2xyMKecqFLYRZdGJEbUnqfEPJ
 VuRdJJELYdzDQbSDwVO4N17DzC+BJ/7UCT5Jt6O3eYqWpgTQvmhfZqLkl4jiMnqbDXlz
 NPHWDIqSCFwM4tflYA8NRy3SS+DqWsClSkLqSbsNz5iHeCPMQpsFKeZhqlHfM+nTGTpK
 VUSmmXQHzI/LSMrXq9wwIGyG9ny+z8LD1xWyJt79JKjmqxMhtYBRoKQql9Wx7S+Wyxy0
 PvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723539825; x=1724144625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MqfnVnhHsKTNIdZ3g99elQ8N0kSquMZj93pvaOSIp0U=;
 b=cMLpGaRIX4k7daGNZZLDuesGaQR+TF7PO7CdbC+14GCn2DDRM4WAL56mJept+/9LlR
 TdkrAOZpq7VKH90tT9taPcC9tPbugeNyT/W7eXWIWXA1GmQrD5FIMqxOp7IFwQI7l1Dl
 9OHtvBoOoV+o8LT6Xy5LahTYxC3cEQZbJJGQFKclsOQd3DTf9kIF2tlKgBacbZJNzvw7
 zIBpFq/3pHQ1lOiYgmroNp6D+4071TxpFHsKQU38BWIXrf2zcKSD1S+psNv4Lt6M9Sut
 AjcHz8rW5F1/EO+aR6YRgFqmrMXtTkvCotqKoXBiu/+oha2x2fTIL4gz93O5MHuSJcYg
 u//A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWnYUU5Iv2sdTfaQZ6OCcyITMiBZ/IyNAgP4EZLllnn8VpBfCcooQn3WWvkRrV1v5cg8agE1OuqjWu2rQy6D7k7zNhkvy8D9tMEhuwiWai
X-Gm-Message-State: AOJu0YxuuezROcARygQlNxdEl4wR8KfhGfHuiaO+lbVd1DB3YxFzlkoc
 KbLcUoSFiNZnTXLlKXZNLOKfIFBSFSy3CZctUEmlyesLG4lX7n/eiXmrNJK0dM0j9pVK+Ea4Kam
 5a5YLoet9jB3NDvJtjFzvvhtU8L0G65LttPBC
X-Google-Smtp-Source: AGHT+IEDjVBWF1MtU621r7c9KTxxkpXecwmSkiD37eYz3ttGuDqjz8Aa65UHLyu0qffTTOccInI+PGwQjjCKHuK8rFw=
X-Received: by 2002:a05:6102:3e94:b0:48f:a858:2b52 with SMTP id
 ada2fe7eead31-49743b56abemr3993740137.29.1723539824928; Tue, 13 Aug 2024
 02:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
 <20240812105732.5d2845e4@kernel.org>
 <7e2ffe62-032a-4c5e-953b-b7117ab076be@gmail.com>
 <71260e3c-dee4-4bf0-b257-cdabd8cff3f1@gmail.com>
 <20240812171548.509ca539@kernel.org>
 <CAHS8izPyGwe_i4eNemW+A+MgMVHqJ0fdp=+-ju2ynqgc0mb_Ow@mail.gmail.com>
In-Reply-To: <CAHS8izPyGwe_i4eNemW+A+MgMVHqJ0fdp=+-ju2ynqgc0mb_Ow@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Aug 2024 05:03:33 -0400
Message-ID: <CAHS8izM=d9pe0V3BWAY_gguNGymdc4DSFAz0DWyCMoGX6QVhDw@mail.gmail.com>
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

On Tue, Aug 13, 2024 at 4:39=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Aug 12, 2024 at 8:15=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > BTW, Mina, the core should probably also check that XDP isn't installed
> > before / while the netmem is bound to a queue.
>
> Sorry if noob question, but what is the proper check for this? I tried
> adding this to net_devmem_bind_dmabuf_to_queue():
>
> if (xdp_rxq_info_is_reg(&rxq->xdp_rxq))
>                  return -EEXIST;
>
> But quickly found out that in  netif_alloc_rx_queues() we initialize
> all the rxq->xdp_rxq to state REGISTERED regardless whether xdp is
> installed or not, so this check actually fails.
>
> Worthy of note is that GVE holds an instance of xdp_rxq_info in
> gve_rx_ring, and seems to use that for its xdp information, not the
> one that hangs off of netdev_rx_queue in core.
>

To elaborate further, in order to disable binding dmabuf and XDP on
the same rx queue for GVE, AFAIT the check would need to be inside of
GVE. Inside of GVE I'd check if gve_priv->xdp_prog is installed, and
check if the gve_rx_ring->xdp_info is registered. If so, then the rx
queue is XDP enabled, and should not be bound to dmabuf. I think that
would work.

At the moment I can't think of a check inside of core that would be
compatible with GVE, but above you clearly are specifically asking for
a check in core. Any pointers to what you have in mind would be
appreciated here, but I'll try to take a deeper look.

> Additionally, my understanding of XDP is limited, but why do we want
> to disable it? My understanding is that XDP is a kernel bypass that
> hands the data directly to userspace. In theory at least there should
> be no issue binding dmabuf to a queue, then getting the data in the
> queue via an XDP program instead of via TCP sockets or io uring. Is
> there some fundamental reason why dmabuf and XDP are incompatible?
>
> --
> Thanks,
> Mina



--=20
Thanks,
Mina
