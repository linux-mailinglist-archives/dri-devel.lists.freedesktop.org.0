Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFC8D2287
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 19:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7D10E427;
	Tue, 28 May 2024 17:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OH7EXH3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D121A10E427
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 17:36:54 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a630ff4ac84so128607166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716917813; x=1717522613;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1nTYMe9Sz2kd146CNINlSxaoddIUqGPBCQrAMYzjnQ=;
 b=OH7EXH3kK1ra7537YYI2m5Wxwy8apwaA9jSiy0ww+RRWqJOetPf8ac0Pl+l/RtcaWq
 LYO5uKEgAgCrDgAJ9oxukrs0lxvvHvCkFP86b4bgZmBm8rLRmvIH/81EkYGadbtsXI6f
 Y+w/zIMuJhbzGorLF2LSwjYsXT3/YVobiNSGARpnJ9iVPh2W5mW5StJm/f0v7b+AHgzf
 T41pSn0GFYjei+PsY0UJLKWEI979MiWyz1zw5pPn2FEOxf/gCGakHbPhGy2o9Pyy2yRx
 SBM5jsDpu5/Ja7NOjjc2maGF/FzHHJ0AaO2jX8MTZUAzzcgOA4jN1fPi4TXg5c/z587e
 AmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917813; x=1717522613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h1nTYMe9Sz2kd146CNINlSxaoddIUqGPBCQrAMYzjnQ=;
 b=KXYFf6DpLt3uZsNiF7v0cWOJ41qSCfvWQpnhjK0qtJmSEI9Ks/fb9azz1bJ+r/zvvc
 PBcEcBYrU6h6mDpav67yZYwo2bXEwkEWQ7sGzOPMDuuB5+GlhdWSZf5T1IHzpJx6iKZs
 O1j7x4CDWDoBhcgD/DhsOYCVvuCI4mRTIqLeUiVadccIExdHgNbdU5WijTrIpuuJ0JSd
 p7fX+3BdgjJ+dGIKRlxLBmsXor1eDNM9E+s6Khv+kMTfh7d6kE+RfrlNd5Pk6TJHE0np
 P1cE2JUz740eq/PhHRDoAPU1E80YTiR57H8qLjNWzj8BqC24QE7/XxLIG0FYoHyJXqos
 v/Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjavSN0TblZcvILtENtDKFrrJMtVaVSFpBQahCfoKi9tL5/Vqu9/lcVIuzgzO7qFUqrkzxfPJMnffbw7h6hcy5Bs3FHXbQ4sQlHuyODxK3
X-Gm-Message-State: AOJu0YwLHxc9Kf21I889SL8ScoX9rIKYOxIlOunNBDlfswohuDZO8k7t
 MW7HGzuDaQznFSXwmWchxHBqnGLc4n5brjwBVt2h8GNnk6K2OKu6c0kkQGKfZG3P5q+9GGTuJF9
 cN/q6rP1pjR3Wzx2VeDFT0ubPvcwWuLH1vBIC
X-Google-Smtp-Source: AGHT+IFf32eXkuapluEvlBEyoJKJxifsmiVKQ0AvF4ow+8ygeGf1col+Xo1abUwIXzRnUJhSc+Yk6CUkl0RPaD3UYic=
X-Received: by 2002:a17:906:3c1a:b0:a63:42b6:1976 with SMTP id
 a640c23a62f3a-a6342b619f5mr156681366b.68.1716917812713; Tue, 28 May 2024
 10:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-12-almasrymina@google.com>
 <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
In-Reply-To: <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 28 May 2024 10:36:40 -0700
Message-ID: <CAHS8izOe-uYjm0ttQgHOFpvp_Tj4_oRHV6d1Y1sWJAZJdCdCBA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 11/14] tcp: RX path for devmem TCP
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
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
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
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

On Wed, May 22, 2024 at 11:02=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-05-10 16:21, Mina Almasry wrote:
> > +/* On error, returns the -errno. On success, returns number of bytes s=
ent to the
> > + * user. May not consume all of @remaining_len.
> > + */
> > +static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *s=
kb,
> > +                           unsigned int offset, struct msghdr *msg,
> > +                           int remaining_len)
> > +{
> > +     struct dmabuf_cmsg dmabuf_cmsg =3D { 0 };
> > +     struct tcp_xa_pool tcp_xa_pool;
> > +     unsigned int start;
> > +     int i, copy, n;
> > +     int sent =3D 0;
> > +     int err =3D 0;
> > +
> > +     tcp_xa_pool.max =3D 0;
> > +     tcp_xa_pool.idx =3D 0;
> > +     do {
> > +             start =3D skb_headlen(skb);
> > +
> > +             if (skb_frags_readable(skb)) {
> > +                     err =3D -ENODEV;
> > +                     goto out;
> > +             }
> > +
> > +             /* Copy header. */
> > +             copy =3D start - offset;
> > +             if (copy > 0) {
> > +                     copy =3D min(copy, remaining_len);
> > +
> > +                     n =3D copy_to_iter(skb->data + offset, copy,
> > +                                      &msg->msg_iter);
> > +                     if (n !=3D copy) {
> > +                             err =3D -EFAULT;
> > +                             goto out;
> > +                     }
> > +
> > +                     offset +=3D copy;
> > +                     remaining_len -=3D copy;
> > +
> > +                     /* First a dmabuf_cmsg for # bytes copied to user
> > +                      * buffer.
> > +                      */
> > +                     memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
> > +                     dmabuf_cmsg.frag_size =3D copy;
> > +                     err =3D put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEA=
R,
> > +                                    sizeof(dmabuf_cmsg), &dmabuf_cmsg)=
;
> > +                     if (err || msg->msg_flags & MSG_CTRUNC) {
> > +                             msg->msg_flags &=3D ~MSG_CTRUNC;
> > +                             if (!err)
> > +                                     err =3D -ETOOSMALL;
> > +                             goto out;
> > +                     }
> > +
> > +                     sent +=3D copy;
> > +
> > +                     if (remaining_len =3D=3D 0)
> > +                             goto out;
> > +             }
> > +
> > +             /* after that, send information of dmabuf pages through a
> > +              * sequence of cmsg
> > +              */
> > +             for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
> > +                     skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> > +                     struct net_iov *niov;
> > +                     u64 frag_offset;
> > +                     int end;
> > +
> > +                     /* !skb_frags_readable() should indicate that ALL=
 the
> > +                      * frags in this skb are dmabuf net_iovs. We're c=
hecking
> > +                      * for that flag above, but also check individual=
 frags
> > +                      * here. If the tcp stack is not setting
> > +                      * skb_frags_readable() correctly, we still don't=
 want
> > +                      * to crash here.
> > +                      */
> > +                     if (!skb_frag_net_iov(frag)) {
> > +                             net_err_ratelimited("Found non-dmabuf skb=
 with net_iov");
> > +                             err =3D -ENODEV;
> > +                             goto out;
> > +                     }
> > +
> > +                     niov =3D skb_frag_net_iov(frag);
>
> Sorry if we've already discussed this.
>
> We have this additional hunk:
>
> + if (niov->pp->mp_ops !=3D &dmabuf_devmem_ops) {
> +       err =3D -ENODEV;
> +       goto out;
> + }
>
> In case one of our skbs end up here, skb_frag_is_net_iov() and
> !skb_frags_readable(). Does this even matter? And if so then is there a
> better way to distinguish between our two types of net_iovs?

Thanks for bringing this up, yes, maybe we do need a way to
distinguish, but it's not 100% critical, no? It's mostly for debug
checking?

I would say add a helper, like net_iov_is_dmabuf() or net_iov_is_io_uring()=
.

Checking for niov->pp->mp_ops seems a bit hacky to me, and may be
outright broken. IIRC niov's can be disconnected from the page_pool
via page_pool_clear_pp_info(), and niov->pp may be null. Abstractly
speaking the niov type maybe should be a property of the niov itself,
and not the pp the niov is attached to.

It is not immediately obvious to me what the best thing to do here is,
maybe it's best to add a flag to niov or to use niov->pp_magic for
this.

I would humbly ask that your follow up patchset takes care of this
bit, if possible. I think mine is doing quite a bit of heavy lifting
as is (and I think may be close to ready?), when it comes to concerns
of devmem + io_uring coexisting if you're able to take care, awesome,
if not, I can look into squashing some fix.

--=20
Thanks,
Mina
