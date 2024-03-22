Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A616E8871FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 18:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C2112673;
	Fri, 22 Mar 2024 17:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kafY3Jga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD346112673
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 17:40:40 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso341386166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711129239; x=1711734039;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
 b=kafY3JgapMAuaJY0EgRIvxeyw37n3PcQkc1QH+hOyTOVDqmRNzZOPiIrKmFkHDLFdV
 7z5sSq2uJvw7p5jkDd3AcSlpyKtQT+udiW+lYDBIPXneMSQYSp8JVvfl4fxuMFXBVgll
 tJmTzNCplS/nbwpnmWgvUKM70grCqzO8UTmrX2MR8TN5m/kLnxepEIBhdZMkCMiDfF0D
 OgPBEaqJ1BhzvebgYUKFXL27gJK4UEJPp4oetUJzY00Y1AhDsXCwZNqtJEAIWUwAu3HD
 zUSFmgIB2wZAeXaDQ0HuiNDxrhxClLM98rGWMxmj0/7qdJHKxsIe0RJUvq7cSgqMtgF/
 6YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711129239; x=1711734039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
 b=K42zx/q1tETA643GqX5V9IeHqzMczX6GSOLZRXPDrWuozi2VU2LvwHqg1+0GQoTadi
 vDEogPOWNItvVg9DHCsNuFWZmnlMAN0WUw9Yn9dh80+GXa5xV5Fa6AmKzzDU1eOwXJi3
 iGPlb5L4QMg+HoJQBp3SB/5sU6XtShUnbGXTjWMh/UoBOs/lAhWMu8O+s63DoXd5DS2S
 dN/giyDpJGmYV2A6EmWwqGGr0YKeHlCNmEkdMPJ8OXRl5GrfAuxYGtf/dzaLFsy5t/z4
 V0RqeeLFRRq+K/+z6/8QVMN1A0SB7hCzNJbn7cR8qkDh8eTwFjsrqxbpCYoJqprguLkM
 NQHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJaW5cKxEadGv3IRRz5Ss0T8xsAaCGyR3RLF0RRxtZBkgjClyMi+Ia530go2YDGg6HcIu+3DCoJD9cgG+YiFJesGlfBVicEPj3gI/nzuaN
X-Gm-Message-State: AOJu0YzCBZuzWKSQbDfyp5eRk72P+RABRe1mndN8GxW+A7Ba/kCbRYot
 Kv4jK3VWCtBKV2v01RQ2oZnVEcXu/VCFw3meX9IO62SSC9ogiaC4vhfc4ljrKpWNRuTRo0AfpEz
 it/NcmpRI3tXih2wWyakZanRyMDmrnt6HYh0X
X-Google-Smtp-Source: AGHT+IH25NX6qQBoFnVnA4psBCYCRYBaiXOTPUtbfU8ggcYNeDelzQNuP6wH36Jj0kmkf8kYIMZ+vwfa54Dm4tCqR3s=
X-Received: by 2002:a17:906:c2d4:b0:a46:befa:f0b0 with SMTP id
 ch20-20020a170906c2d400b00a46befaf0b0mr293662ejb.45.1711129238808; Fri, 22
 Mar 2024 10:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
 <b938514c-61cc-41e6-b592-1003b8deccae@davidwei.uk>
 <ZfjMopBl27-7asBc@infradead.org>
In-Reply-To: <ZfjMopBl27-7asBc@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 22 Mar 2024 10:40:26 -0700
Message-ID: <CAHS8izMT1Smz6UWu2uwAQRqgZPU7jTfS3GKiA_sDw9KLqoP-JA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
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

Hi Christoph,

Sorry for the late reply, I've been out for a few days.

On Mon, Mar 18, 2024 at 4:22=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Mar 17, 2024 at 07:49:43PM -0700, David Wei wrote:
> > I'm working on a similar proposal for zero copy Rx but to host memory
> > and depend on this memory provider API.
>
> How do you need a different provider for that vs just udmabuf?
>

This was discussed on the io_uring ZC RFC in one of the earliest RFCs.
Here is a link to Pavel's response:

https://patchwork.kernel.org/project/netdevbpf/patch/20231106024413.2801438=
-6-almasrymina@google.com/#25589471

The UAPI of wrapping io_uring memory into a udmabuf just to use it
with devmem TCP only for the user to have to unwrap it is undesirable
to him.

> > Jakub also designed this API for hugepages too IIRC. Basically there's
> > going to be at least three fancy ways of providing pages (one of which
> > isn't actually pages, hence the merged netmem_t series) to drivers.
>
> How do hugepages different from a normal page allocation?  They should
> just a different ordered passed to the page allocator.
>

Yes, that's more-or-less what's what the hugepage memory provider
Jakub proposed does. The memory provider would allocate a hugepage and
hold a reference to it. Then when the page_pool needs a page, it would
allocate a PAGE_SIZE page from said hugepage region and provide it to
the page_pool, and the pool back to the driver. This allows the
hugepages to work without the page_pool and driver to be hugepage
aware and to insert huge page specific processing in it.

Other designs for this hugepage use case are possible, I'm just
describing Jakub's idea for it as a potential use-case for these
hooks. For example technically the page_pool at the moment does
support non-0 order allocations, but most drivers simply set the order
to 0 and use the page pool only for PAGE_SIZE allocations. An
alternative design could be to use this support in the page pool, but
that requires every driver to adopt this rather than a core networking
change that can apply transparently (to a large extent) to all
page_pool drivers.

--=20
Thanks,
Mina
