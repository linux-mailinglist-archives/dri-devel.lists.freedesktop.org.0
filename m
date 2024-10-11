Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE499ACD1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770810E2E0;
	Fri, 11 Oct 2024 19:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jjQGYWZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7CE10E2E0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:38:28 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4603d3e0547so40481cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728675507; x=1729280307;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4/PPqatSk2BAD8kUIT/38Gyd1BY7fTrP7ap/2S9Mqk=;
 b=jjQGYWZvy3WeA+GwYPCF+UIFDGmOj/PVgO2uBqdAznOJXdpq7BeZVEcuHuwDXahHqj
 YjdOYid92t2lIwZoZGQIUF0C4YdNLYwRbK15bgByeuWxm3t3QMnXuG5HqUp87AwauR82
 5O2AcSeP5z+ZJBGd0MGS6IxNt12jshQBCNmu12zXpkAp1BGx/oyy/zlzye/8PnhSkFlo
 9NUnEuz8P40UTusNUVwwu1oERC7az9pVVSYs/JWoZgGOKv2X86Ma+TtxKTAaZ7zLuyDW
 sa89kydCl77QH/+b4Kj8MRHGtrnSvWi9a4yJ8dUcRK+HuC32AJwtTyBmD6uQON/t2eb7
 RtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728675507; x=1729280307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4/PPqatSk2BAD8kUIT/38Gyd1BY7fTrP7ap/2S9Mqk=;
 b=gh95t+iBxsIWJIUpeFRcB+veOIbiVx8+yQf0zZtWCBFugvweua+UB393rSqPBDM+9g
 pU7eMSfAjACp27upYpQgaSTGH11QN3hGbooX0P5dJ9sytNMa4f6KmXGHYYA/TZ5xstIo
 Pq29WMGN7rA2rkjpikMbtNBAbR8v7mp8td2G0aXufyVMH8zBoRMQ/q2vrdarY1xn7h2w
 87OL24WtxX0tv4e7OKai9OqJOqEaeANZKVtnMnT9FBBgOtGABDBR9a5KKsOqpOodI5eb
 S/pEcz2M0XbWMMWLa1RWZJjINKtcTm6Yx8yRpKUlx8qy92essZNq4OGfbQLPfMlnhPlq
 e7RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE0tyo/M2nogPszc7GmKyDY1P+/KnIayqc3XokAdJ+YeBhUHtbUSdQ+UvC1jXc5CGEZ7i9kj91FO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznt75rh0eX54KyyVzgmPbBluPI0u6Ick2LWtWCHYenFd9bBix1
 9uiTjuyI55viXiX9h0iVFJ9DNUaZAGgDsG7J4YC0NWUENlNWVoT31pJjBB4izcNQbi+9F4Pruz1
 rlpiJcXyINh4taSV6kUZBY9kIBVb4Rzk1RubU
X-Google-Smtp-Source: AGHT+IEJvq2uzdDh3W2Sfu5aWaK5xhLaKiCn2xWH/iIRkxgpB4FklAs+UX9kaTQ1TkS7P0dLyhTRAOjn/li4z+5WdqQ=
X-Received: by 2002:a05:622a:468c:b0:45c:9eab:cce0 with SMTP id
 d75a77b69052e-46059046571mr529141cf.15.1728675507274; Fri, 11 Oct 2024
 12:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com>
 <20240909054318.1809580-11-almasrymina@google.com>
 <Zwe3lWTN36IUaIdd@ly-workstation>
 <CAHS8izPuEUA20BDXvwq2vW-24ez36YFJFMQok-oBDbgk6bajSA@mail.gmail.com>
 <20241011082707.5de66f15@kernel.org>
In-Reply-To: <20241011082707.5de66f15@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 11 Oct 2024 12:38:14 -0700
Message-ID: <CAHS8izMVjfrYopPpmg4dN33VL7bF-icS=HFDPOhmW96rgthErg@mail.gmail.com>
Subject: Re: [PATCH net-next v25 10/13] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Lai, Yi" <yi1.lai@linux.intel.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 yi1.lai@intel.com
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

On Fri, Oct 11, 2024 at 8:27=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 10 Oct 2024 12:05:38 -0700 Mina Almasry wrote:
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index 083d438d8b6f..cb3d8b19de14 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
> > @@ -1071,11 +1071,11 @@ sock_devmem_dontneed(struct sock *sk,
> > sockptr_t optval, unsigned int optlen)
> >             optlen > sizeof(*tokens) * MAX_DONTNEED_TOKENS)
> >                 return -EINVAL;
> >
> > -       tokens =3D kvmalloc_array(optlen, sizeof(*tokens), GFP_KERNEL);
> > +       num_tokens =3D optlen / sizeof(struct dmabuf_token);
> > +       tokens =3D kvmalloc_array(num_tokens, sizeof(*tokens), GFP_KERN=
EL);
> >         if (!tokens)
> >                 return -ENOMEM;
> >
> > -       num_tokens =3D optlen / sizeof(struct dmabuf_token);
> >         if (copy_from_sockptr(tokens, optval, optlen)) {
> >                 kvfree(tokens);
> >                 return -EFAULT;
> > @@ -1083,6 +1083,10 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t
> > optval, unsigned int optlen)
> >
> >         xa_lock_bh(&sk->sk_user_frags);
> >         for (i =3D 0; i < num_tokens; i++) {
> > +
> > +               if (tokens[i].token_count > MAX_DONTNEED_TOKENS)
> > +                       continue;
>
> For the real fix let's scan the tokens before we take the xa lock
> and return an error rather than silently skipping?
>
> >                 for (j =3D 0; j < tokens[i].token_count; j++) {
>

Yes, sorry, I called the diff above an 'untested fix' but it was more
of a hack to see if I got the root cause right. For a proper fix, we
should do exactly that. Scan and see how many tokens the user is
asking us to free ahead of time, then exit early if it's too much
before we acquire locks and loop. Will do!

--=20
Thanks,
Mina
