Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F58BE964
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1813112514;
	Tue,  7 May 2024 16:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FZSLbT0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D8112514
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:42:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso665750266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715100138; x=1715704938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dI6bl9uqwH7zmPDcLL9svN5oVbQ7KUvxyIQRaOdtpl4=;
 b=FZSLbT0Iv+//GlXI+fsraDNd2czqk5SLxVYGzyZEZYVv/Es8xjIVJX3cWt3DrnX/PZ
 YNDGmWLMRQA3FLVvbAwQqhWpq9o6JY1NU0/TWztOWvUoke142e6et+akOskrEoo4ixJ7
 6Q7JvTOHqM/CWhvW5z+DRKmMynVSTm66USAUYOxCaaUTfENMpoipGT0ILLl/PaRwIIoY
 09ghMPEq35CIkjl2ySczN2ZNCLumQbcifCnZHAZPuPHRXzy5+t+y5Sk9CgUHF3kXHnPO
 4wum3oDe6Guyh54W0t4698blEUY50nGwqGRFtciLMyycQrz1XwxXPyWApGKgxQAbN1Dt
 DfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715100138; x=1715704938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dI6bl9uqwH7zmPDcLL9svN5oVbQ7KUvxyIQRaOdtpl4=;
 b=Zb0BaQqZK5kFUIoRwNe8xlaHxKznyuI/XQEj3xO4eu+eodpmimEmbjxc4KNJ06ZUWR
 atJ3cXVwzi7eTPzt9a4heu3MR6FN8WPXb2xFIwwnCzanc28PzgtDub8fF/nDB/QsSZWp
 /BI42hJi8xc2fqIJnf+VqjaW844tCtuPIbAoo7qy6rcMu74l8BsYT9i9FZ2LcFwjK9hk
 fDm3aKHjDp/rQPxQOgNmwjtWDa8waCi1r1NV4r+GVNuS8EW3w4sAsL0Mi6HgS7qDbq61
 uEAMWVz1nBquc0OnLoTQ/zv4isXn9IpGyCEfD0A089VUmfEY0QRt/47rjK/DR4f7c60e
 RlYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6w2MENmbb0dXZNCSUtCyzv2QTNgjNjUa2lZAzTJRJ/FfXHbA6PVPPxzgHtjzenknAAF8IYgyDoDDnnQ9svUH6yPprygWYyIaoCbTIw/f+
X-Gm-Message-State: AOJu0YwWImkFEtR1QgNkhS8tGfLNHmhC8D5INbAvLU7TpjNq5rStk1mf
 5k/rmMqU6SF/eW8ii54qo65ItYGPiuxKAkhzaMBJMI68/hQX7WMPZJWzjFQI2PBXZYmEds6DEZQ
 zKCaLLFs9Ooheq07G5NU9AcmOWb7jYx2qDiw4
X-Google-Smtp-Source: AGHT+IGXrfCrbPuBFYGXmT+FZdafT4oz7XFNMT8FfUWaWmudph1z0+uFgT86I0JhwB1+1uK0PlezLiQ7rsxPPg9MW2Q=
X-Received: by 2002:a17:906:1d4b:b0:a59:c833:d275 with SMTP id
 a640c23a62f3a-a59fb94dbe4mr1458266b.30.1715100137853; Tue, 07 May 2024
 09:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
In-Reply-To: <ZjpVfPqGNfE5N4bl@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 May 2024 09:42:05 -0700
Message-ID: <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Pavel Begunkov <asml.silence@gmail.com>,
 netdev@vger.kernel.org, 
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
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>, 
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
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

On Tue, May 7, 2024 at 9:24=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Tue, May 07, 2024 at 01:18:57PM -0300, Jason Gunthorpe wrote:
> > On Tue, May 07, 2024 at 05:05:12PM +0100, Pavel Begunkov wrote:
> > > > even in tree if you give them enough rope, and they should not have
> > > > that rope when the only sensible options are page/folio based kerne=
l
> > > > memory (incuding large/huge folios) and dmabuf.
> > >
> > > I believe there is at least one deep confusion here, considering you
> > > previously mentioned Keith's pre-mapping patches. The "hooks" are not
> > > that about in what format you pass memory, it's arguably the least
> > > interesting part for page pool, more or less it'd circulate whatever
> > > is given. It's more of how to have a better control over buffer lifet=
ime
> > > and implement a buffer pool passing data to users and empty buffers
> > > back.
> >
> > Isn't that more or less exactly what dmabuf is? Why do you need
> > another almost dma-buf thing for another project?
>
> That's the exact point I've been making since the last round of
> the series.  We don't need to reinvent dmabuf poorly in every
> subsystem, but instead fix the odd parts in it and make it suitable
> for everyone.
>


FWIW the change Christoph is requesting is straight forward from my
POV and doesn't really hurt the devmem use case. I'd basically remove
the ops and add an if statement in the slow path where the ops are
being used to alloc/free from dmabuf instead of alloc_pages().
Something like (very rough, doesn't compile):

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 92be1aaf18ccc..2cc986455bce6 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -557,8 +557,8 @@ netmem_ref page_pool_alloc_netmem(struct page_pool
*pool, gfp_t gfp)
                return netmem;

        /* Slow-path: cache empty, do real allocation */
-       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_op=
s)
-               netmem =3D pool->mp_ops->alloc_pages(pool, gfp);
+       if (page_pool_is_dmabuf(pool))
+               netmem =3D mp_dmabuf_devmem_alloc_pages():
        else
                netmem =3D __page_pool_alloc_pages_slow(pool, gfp);
        return netmem;


The folks that will be negatively impacted by this are
Jakub/Pavel/David. I think all were planning to extend the hooks for
io_uring or other memory types.

Pavel/David, AFAICT you have these options here (but maybe you can
think of more):

1. Align with devmem TCP to use udmabuf for your io_uring memory. I
think in the past you said it's a uapi you don't link but in the face
of this pushback you may want to reconsider.

2. Follow the example of devmem TCP and add another if statement to
alloc from io_uring, so something like:

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 92be1aaf18ccc..3545bb82c7d05 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -557,8 +557,10 @@ netmem_ref page_pool_alloc_netmem(struct
page_pool *pool, gfp_t gfp)
                return netmem;

        /* Slow-path: cache empty, do real allocation */
-       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_op=
s)
-               netmem =3D pool->mp_ops->alloc_pages(pool, gfp);
+       if (page_pool_is_dmabuf(pool))
+               netmem =3D mp_dmabuf_devmem_alloc_pages():
+       else if (page_pool_is_io_uring(pool))
+               netmem =3D mp_io_uring_alloc_pages():
        else
                netmem =3D __page_pool_alloc_pages_slow(pool, gfp);
        return netmem;

Note that Christoph/Jason may not like you adding non-dmabuf io_uring
backing memory in the first place, so there may be pushback against
this approach.

3. Pushback on the nack on this thread. It seems you're already
discussing this. I'll see what happens.

To be honest the GVE queue-API has just been merged I think, so I'm
now unblocked on sending non-RFCs of this work and I'm hoping to send
the next version soon. I may apply these changes on the next version
for more discussion or leave as is and carry the nack until the
conversation converges.

--=20
Thanks,
Mina
