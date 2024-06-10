Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54099025CF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 17:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C46B10E250;
	Mon, 10 Jun 2024 15:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3RPvu22G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8FC10E250
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 15:41:41 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57c714a1e24so2486743a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718034100; x=1718638900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NH9qOe8AuGn3R+TevtlS2pqQNAL05iIcoVXpQ7CPaGI=;
 b=3RPvu22GLfGj1f+/e79iXnKVo2U3TeuCklz1s3p4pLJX6n695W4k3Xo0WLHQz8htj5
 rkHnikUSjTPFVmGd8t1HNz7lQ207KXM09ZQEtHhd/oMPe/pu6KWlbWnZB+6tSrQIlWZC
 zqydpE6Vf3yamBJn8HY2Ig9XQfVIJs4Ld9ng3n3h72l6y4N8+k72Lclfrfw8cOE4SJhx
 ee2INfj+zxcD9OzuLzWOO2w9xlT+HyL/fb/Z/FxGG6Z2iQ4a2ot2p7Vh6dka399qwfxm
 OsPMboKdXsf2W8itF4ULidtM1YWH2kMakY7O5MZTWP/Z9GwD6gJ8xWa+v/LuvugNQynV
 U45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718034100; x=1718638900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NH9qOe8AuGn3R+TevtlS2pqQNAL05iIcoVXpQ7CPaGI=;
 b=HdtnfNqHik4Jtb3rzqNbtRcuOnkKbOYnAgwmDUnrBq/z8kkOVuw9UykKSLS1++UqI5
 pWLtRZJmkwABLUKLOMSQHY2aW8LZKGD7kiGq02AHqZlVH3xBvvSY6MpgcMxQw41tmYRh
 QjLJnW3dTHrCmQTDKsbcEvOn0wT5a3PcqndnHs8Zhen07amLXvruR+hURb0Ykua5yqVn
 SBPfaq7bE3R1YLbk/3tiKH9G+MBbz7HgUrXhgCN1nMJbMq1aqIBvJL1Vq3BuyznEsknK
 Wf3h5HXVWoecfFMaiYIs04do3nFeYWpXKVgU4u9xd2dudRUU0JQ9OAaZjqyjRL2XtbCU
 QGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnqXuFxrIfFllsRAdOXix9w7ZvgpyiyGC7D1cEivwyIV1I3gzdlyioikjwARtwwOgXu6eAM1388JfobgCDhBczq/x4g73VIfCOal6cTnpF
X-Gm-Message-State: AOJu0YxBYi/kz8bytoPRKR4JZU1RHrX1gdBMHFiBSd/4nygsmL/5vzKx
 IvgvHaPKeD3vrjR3fgRmhXdUwmbMPXSIC8Nyui30fZnrUlnF8Xe3eBavEMl5Fu1Klun4dsyjxmo
 3J+py7zudEUobSrCd0LHEQ9i5ifeHAsn+qXWg
X-Google-Smtp-Source: AGHT+IGhBtLDJFK2P+RcfVlyA2ZAGso96YWHpocomofOltg8xljfiwSKPnAsDJBDqZd1U8grgl7y/Dr4+a+0D+ppdnU=
X-Received: by 2002:a17:906:8888:b0:a6f:279b:37ca with SMTP id
 a640c23a62f3a-a6f279b38b3mr91530566b.51.1718034099331; Mon, 10 Jun 2024
 08:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <cdbc0d5f-bfbc-4f58-a6dd-c13b0bb5ff1c@amd.com>
In-Reply-To: <cdbc0d5f-bfbc-4f58-a6dd-c13b0bb5ff1c@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 10 Jun 2024 08:41:25 -0700
Message-ID: <CAHS8izNwmXQTLc9VADpushYKyeJ4ZY4G9aV47W2-1St65-tKUg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, 
 David Ahern <dsahern@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
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

On Mon, Jun 10, 2024 at 5:38=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.06.24 um 14:16 schrieb Jason Gunthorpe:
> > On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
> >> On 6/10/24 01:37, David Wei wrote:
> >>> On 2024-06-07 17:52, Jason Gunthorpe wrote:
> >>>> IMHO it seems to compose poorly if you can only use the io_uring
> >>>> lifecycle model with io_uring registered memory, and not with DMABUF
> >>>> memory registered through Mina's mechanism.
> >>> By this, do you mean io_uring must be exclusively used to use this
> >>> feature?
> >>>
> >>> And you'd rather see the two decoupled, so userspace can register w/ =
say
> >>> dmabuf then pass it to io_uring?
> >> Personally, I have no clue what Jason means. You can just as
> >> well say that it's poorly composable that write(2) to a disk
> >> cannot post a completion into a XDP ring, or a netlink socket,
> >> or io_uring's main completion queue, or name any other API.
> > There is no reason you shouldn't be able to use your fast io_uring
> > completion and lifecycle flow with DMABUF backed memory. Those are not
> > widly different things and there is good reason they should work
> > together.
>
> Well there is the fundamental problem that you can't use io_uring to
> implement the semantics necessary for a dma_fence.
>
> That's why we had to reject the io_uring work on DMA-buf sharing from
> Google a few years ago.
>

Any chance someone can link me to this? io_uring, as far as my
primitive understanding goes, is not yet very adopted at Google, and
I'm curious what this effort is.

--=20
Thanks,
Mina
