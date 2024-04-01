Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9E894563
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 21:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A279010F421;
	Mon,  1 Apr 2024 19:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qBYbZqHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88E10F421
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 19:22:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a44665605f3so491183766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711999357; x=1712604157;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRKdoK98qnZzkUcUn3OGBOuDQ1g75ltD3kRhKb3BL0c=;
 b=qBYbZqHpDM+okK20TVaq0GWS0OrPBF2ZceLovox0ktP2abIs4ss1wym4V9FZ/1INtg
 FIvDEEKU+OFaO35biZM2WXUh7sBidWKuUki5gG76/Trex1rmi2kKUQORmUlNP7K3IFK7
 SniZRic4+cxYFI3crMgp6i/J0qJt5pjcpKB7BBIdERtC5AQM3vQAAHwG17IH3RiV9HqL
 E+uBBJVaT6Wv1GHIej5XerjjEfI6PiCkQkWFZYZOQxkN23ew8LAXiEN0p5pqrtHiGzBI
 DB5hu75hgBScJTIiJuBWN/ajoV5JyE2FqWXGn45ZoHmNSm8a0t2ljTtUzNDEQpsazgW5
 Hk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711999357; x=1712604157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRKdoK98qnZzkUcUn3OGBOuDQ1g75ltD3kRhKb3BL0c=;
 b=Zo0ouHU8P/vnNjE7EHi3QCp4Lq9rc+2HnGl5sfzwc2GB/gHstEhDywRu/7nEXonbMC
 ojE7OWicyz6WKzb0X62NPrRQ5WwVtlWxEylX+8k2BA+cGwVLZDDDJk1q0r4x9RQwGeU6
 eZG/2+gxxLZ4fXafHAINtN+4V+pyi05hSj473O5Wxe8wqlpia/fF+nU4SpNFQ7tma0tZ
 pFko/uR+F7exLSH/AYF89B6rQ1xKn6/JkLFuo66WhDEUMejGFpOB+dh+B/wXy0bsRUVd
 BrezaRoVbuT/L4w0G0timQwzAV2pJ0t9HR9OmFi1h+Vb3ayca52kANhv/fA8tBL9f/DI
 MGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwkORWu0n+N9+HBMfhXELMpvBg/dd0vfytCSxcz6fYxsqZMvGzjTMgyqKqfzqqTEHryIJBsNS3uBsQr8DsK0KtHX6LNxs/CnK9l7fjOjA
X-Gm-Message-State: AOJu0Yx35zUEYeOBH7M/Oj+cgLOSHRqAJnB40b+5tfk2Fwd9q0YkGQ3L
 4TJPMuWGPAMvPaBdQ/uzgRQ9vPJN9yKYn1930bVUGmxSamnr0xErBLYWCMUjLKABsuRWrY5QUxW
 L214r1k3dPFbpCsZ3B8bov7lRyHNfwvuETGQz
X-Google-Smtp-Source: AGHT+IFnZAdqBNjychftax9hJ9HmWGsuFKJlToxmGxuKATUcrfF8Wqh8ADOKipJFMzVFEgjjXqwoqI01MVv3yIjrd3E=
X-Received: by 2002:a17:906:f289:b0:a46:d978:bf02 with SMTP id
 gu9-20020a170906f28900b00a46d978bf02mr6594862ejb.34.1711999356578; Mon, 01
 Apr 2024 12:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
 <CAHS8izOUi6qGp=LSQb_o5oph-EnhNOuhLkPSfbQRU3eniZvbdA@mail.gmail.com>
 <ZgC5JoSiWAYf3IgX@infradead.org>
 <CAHS8izO5-giYhM1bVCLLOXRXq-Xd0=pi0kPq5E1-R=3i=XihmQ@mail.gmail.com>
 <ZgUc07Szbx5x-obb@infradead.org>
In-Reply-To: <ZgUc07Szbx5x-obb@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 1 Apr 2024 12:22:24 -0700
Message-ID: <CAHS8izM8iLC9J1xSHScMrMkVyoY5HZ_nFMRO4V7HYarHhZhk6Q@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>, Marc Harvey <marcharvey@google.com>,
 "Cong Wang ." <cong.wang@bytedance.com>
Cc: shakeel.butt@linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, 
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
 Jeroen de Borst <jeroendb@google.com>, 
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

On Thu, Mar 28, 2024 at 12:31=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Tue, Mar 26, 2024 at 01:19:20PM -0700, Mina Almasry wrote:
> >
> > Are you envisioning that dmabuf support would be added to the block
> > layer
>
> Yes.
>
> > (which I understand is part of the VFS and not driver specific),
>
> The block layer isn't really the VFS, it's just another core stack
> like the network stack.
>
> > or as part of the specific storage driver (like nvme for example)? If
> > we can add dmabuf support to the block layer itself that sounds
> > awesome. We may then be able to do devmem TCP on all/most storage
> > devices without having to modify each individual driver.
>
> I suspect we'll still need to touch the drivers to understand it,
> but hopefully all the main infrastructure can live in the block layer.
>
> > In your estimation, is adding dmabuf support to the block layer
> > something technically feasible & acceptable upstream? I notice you
> > suggested it so I'm guessing yes to both, but I thought I'd confirm.
>
> I think so, and I know there has been quite some interest to at least
> pre-register userspace memory so that the iommu overhead can be
> pre-loaded.  It also is a much better interface for Peer to Peer
> transfers than what we currently have.
>

I think this is positively thrilling news for me. I was worried that
adding devmemTCP support to storage devices would involve using a
non-dmabuf standard of buffer sharing like pci_p2pdma_
(drivers/pci/p2pdma.c) and that would require messy changes to
pci_p2pdma_ that would get nacked. Also it would require adding
pci_p2pdma_ support to devmem TCP, which is a can of worms. If adding
dma-buf support to storage devices is feasible and desirable, that's a
much better approach IMO. (a) it will maybe work with devmem TCP
without any changes needed on the netdev side of things and (b)
dma-buf support may be generically useful and a good contribution even
outside of devmem TCP.

I don't have a concrete user for devmem TCP for storage devices but
the use case is very similar to GPU and I imagine the benefits in perf
can be significant in some setups.

Christoph, if you have any hints or rough specific design in mind for
how dma-buf support can be added to the block layer, please do let us
know and we'll follow your hints to investigate. But I don't want to
use up too much of your time. Marc and I can definitely read enough
code to figure out how to do it ourselves :-)

Marc, please review and consider this thread and work, this could be a
good project for you and I. I imagine the work would be:

1. Investigate how to add dma-buf support to the block layer (maybe
write a prototype code, and maybe even test it with devmem TCP).
2. Share a code or no-code proposal with netdev/fs/block layer mailing
list and try to work through concerns/nacks.
3. Finally share RFC through merging etc.

--
Thanks,
Mina
