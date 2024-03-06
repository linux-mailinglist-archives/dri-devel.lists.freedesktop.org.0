Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A4872CDA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 03:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54018112E24;
	Wed,  6 Mar 2024 02:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="haOf1pfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42A112E24
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 02:42:51 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a441d7c6125so146179866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 18:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709692969; x=1710297769;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2WY4uFfSORqsxmoN252fMsc5YpGsXMNwoTLggkrkUc=;
 b=haOf1pfMf7FJIfC79B0/3+eSLHCEbB3rIbt6XXc9ZDcCX1pT6hv0HJverP9cq1l1NC
 RC917NLbWxlpU9/X28aJOuOeVjDjr5fmsy9oi97cQ0a7cBj8ZXmPDLk4SfwPlNv/ihtC
 x7/Qd9vEltfk/BT21KVMneR6ryw10/5wsFKxGGq7Lxgnl9Bmb5Fm+t84uWdywOM048xT
 WF6IAjUp2AAvbu+NYCR6Jb9tTulU//fWsTOARRusUrddtAMLx/6wga4ja1TqxGeRBRu6
 uEKNmOCexIkK6+nujbXNImcOj4Qe46TG5gP2LZ8yiF41UAFRxPHQSzAzr46cpJjAbINN
 5QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709692969; x=1710297769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2WY4uFfSORqsxmoN252fMsc5YpGsXMNwoTLggkrkUc=;
 b=UvFY5A4aaKHdeoHIUnxr25odWvZtI30qYj9L9GO0gsP/jWZ47RF5pgRnvzdxYGIkCr
 IHNAt3PipPHs0cJUoAl7bh+Qi5xBo4ysQmdGpVxqRfIbWYI+iKj/oQ3IOXDdXethFjPk
 GaPc2SeLESMdPjyjoxRLwziWEgfR34qPdcU6D0jMzo4ydty0aAAXm8xsFjpavfZgTlO9
 4N6j7C1+C71fsbZOfpZwDwUYcb0hEh6EE5md6CXNumdYNzvNhaiB0P0OiwkcI/qXHFMu
 KGPkTLGYlsckdoM6LB1/0Pe4kVVFlC/ET+gUPewa6F6Azj9V63ZHg0pFxz6YWhtuNrNe
 emjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt8oex/yVYEFPFY7dw2vbjg56bhyCQFR8jqYgjSefcaDqWn50TIfIBzPEPyXrIAfjwYAqO2RvO6N87KZEXZCrEaHFJv9Q8fiNYiSYVAlp0
X-Gm-Message-State: AOJu0YyBkV8AWoEvACOBKlnZ6H6KB1gFpY5YIV1B9+1oD+R3pAXKvoWc
 A0Jvqi0phBcQ8tpA05sjtPpBnPJnPcGGcI7IC8nnBz7B19qZigMxnWVxTDQI5N6TMb/4vm/Wlf2
 6rUMZXNztVOjo5s8mNzQ5YW84joeJJAqLG3JF
X-Google-Smtp-Source: AGHT+IE0p4dMKmBQEWPN97sZRzFoRZYkkR6K2Lqxx/MoMEWGX+2miy2Ao5l4zesUpz9uL42402ZTwWMCpTdHvKmmsvU=
X-Received: by 2002:a17:906:2417:b0:a45:ad5d:98ac with SMTP id
 z23-20020a170906241700b00a45ad5d98acmr1779500eja.44.1709692968869; Tue, 05
 Mar 2024 18:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-10-almasrymina@google.com>
 <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
In-Reply-To: <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 18:42:35 -0800
Message-ID: <CAHS8izP_PzDJVxycwZe_d_x10-SX4=Q-CWpKTjoOQ5dc2NSn3w@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 09/15] memory-provider: dmabuf devmem
 memory provider
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

On Tue, Mar 5, 2024 at 6:28=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-03-04 18:01, Mina Almasry wrote:
> > +     if (pool->p.queue)
> > +             binding =3D READ_ONCE(pool->p.queue->binding);
> > +
> > +     if (binding) {
> > +             pool->mp_ops =3D &dmabuf_devmem_ops;
> > +             pool->mp_priv =3D binding;
> > +     }
>
> This is specific to TCP devmem. For ZC Rx we will need something more
> generic to let us pass our own memory provider backend down to the page
> pool.
>
> What about storing ops and priv void ptr in struct netdev_rx_queue
> instead? Then we can both use it.

Yes, this is dmabuf specific, I was thinking you'd define your own
member of netdev_rx_queue, and then add something like this to
page_pool_init:

+       if (pool->p.queue)
+               io_uring_metadata =3D READ_ONCE(pool->p.queue->io_uring_met=
adata);
+
+       /* We don't support rx-queues that are configured for both
io_uring & dmabuf binding */
+       BUG_ON(io_uring_metadata && binding);
+
+       if (io_uring_metadata) {
+               pool->mp_ops =3D &io_uring_ops;
+               pool->mp_priv =3D io_uring_metadata;
+       }

I.e., we share the pool->mp_ops and the pool->mp_priv but we don't
really need to share the same netdev_rx_queue member. For me it's a
dma-buf specific data structure (netdev_dmabuf_binding) and for you
it's something else.

page_pool_init() probably needs to validate that the queue is
configured for dma-buf or io_uring but not both. If it's configured
for both then the user is doing something funky we shouldn't support.

Perhaps I can make the intention clearer by renaming 'binding' to
something more specific to dma-buf like queue->dmabuf_binding, to make
it clear that this is the dma-buf binding and not some other binding
like io_uring?

--=20
Thanks,
Mina
