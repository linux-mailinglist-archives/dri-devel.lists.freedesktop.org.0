Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77895590A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 18:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732510E0D5;
	Sat, 17 Aug 2024 16:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axuf2cCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB1B10E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 16:51:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc6adso3894071fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 09:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723913482; x=1724518282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPm2ix/rW3SAryvnCUoqiN+L+HYHFUHM3ZhnV4hoge0=;
 b=axuf2cCjdOWAWKSupKAnZso0QRCjKnTc7MRFFab0yJZEOKVp1lGnofsetYWZpsbgSI
 pTlFn40VgSRWgvhLLUvcmJGmuUH9KW1gm/HZ+kS+xltT2tWp3m0nAsqeXfVYgj3Pg/FO
 Ahnelssp+uyviroXS33b4Hh4RyMTw8R/DgVWRc6JA4UAMVEjMNuqUE/MKTlLgXUJIc6Y
 y8kbsd8zvCQJnlHIs5RZMGXDeyTPStxrnnBQr89wZgc4PuYx/xqo+S4XdYudpDgbbOb5
 eBSCfqjDm3AbeF74VeqU3SpkdrhIdJUEICJpdKojk2sVpuPsI6fxHa/QNKeXg7Tigp0H
 Yqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723913482; x=1724518282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPm2ix/rW3SAryvnCUoqiN+L+HYHFUHM3ZhnV4hoge0=;
 b=EVJHYchqEuREiGFf0OaDTzjgLYKcF2ZkVaaVO8UA6bAqgRlbGrLt0W+BVFpSusEZYv
 HhoiHCypNg7WCj31/0v8g8oNnIRcLxY3YW8ZvtXC+ICzM3rIkWfNH7KGcSh0J2QYytRp
 os+mA/P8IwS/46PeqK5bCGzvM/LbqSbH3MU4D2DQdIxg/kIA1uz8hCqfsEKqnbPvJ6eK
 jEuvG5h2PvlQ383DyBpmpsM0fw3IBTMi7LNDio1V+GEESFc+MenIKsV+OMNAgeEp7QcU
 9ndRF1aqJeTgA3gUluDJ/olAOeomPv1rNQwFSZfECBHfcU7S6R/+67FRLnKmZodRDHwt
 Gs+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzbogjLWVvnaDOA37SXT1DKcIhlkBCwOndePBzql3x80Orf1QG2CbQraJ+Zj4gPYF0LYnq2PlkIvgxAmtzwSiSLhou2gSGkTHJnviudUb
X-Gm-Message-State: AOJu0YzeKhv7e1mHChD+/XDmDMoH+n9ljEyJveyMGRq6ETcU5gTSochN
 vu0FHbwIfIvhIrOBmIfFpsANFo/eMduWcP8peZym+ZD3LFscEwm/fowpxpwN8oyOr0KX+9LbVV3
 Sq5QHZF4TtpaEPL2bWiPw/jcW3pA=
X-Google-Smtp-Source: AGHT+IHFnXWswRNTDKm+umQ5ztT6GCIRL4SA0D2oDGwZTni6Tc0rxL80VlX+Lqp+Gco7elLa7e2ftzMi0E7hh8CxhzU=
X-Received: by 2002:a05:651c:222b:b0:2ef:26dc:efb3 with SMTP id
 38308e7fff4ca-2f3be575b36mr58372901fa.2.1723913481489; Sat, 17 Aug 2024
 09:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-10-almasrymina@google.com>
 <CAMArcTW=mg2gF_e6spPWOCuQdDAWSuKTCdCNPWGqcU1ciq30EQ@mail.gmail.com>
 <CAHS8izOqGMiZNkfQ6G-29UuG64GVo7L+fAzWn5A1713cDAgbgg@mail.gmail.com>
In-Reply-To: <CAHS8izOqGMiZNkfQ6G-29UuG64GVo7L+fAzWn5A1713cDAgbgg@mail.gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Sun, 18 Aug 2024 01:51:09 +0900
Message-ID: <CAMArcTUXm13xJO9XqcT=0uQAn_ZQOQ=Y49EPpHqV+jkkhihMcw@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/13] tcp: RX path for devmem TCP
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
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
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
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

On Sun, Aug 18, 2024 at 12:13=E2=80=AFAM Mina Almasry <almasrymina@google.c=
om> wrote:
>
> On Sat, Aug 17, 2024 at 9:58=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> w=
rote:
> >
> > On Wed, Aug 14, 2024 at 6:13=E2=80=AFAM Mina Almasry <almasrymina@googl=
e.com> wrote:
> > >
> >
> > Hi Mina,
> >
> > > In tcp_recvmsg_locked(), detect if the skb being received by the user
> > > is a devmem skb. In this case - if the user provided the MSG_SOCK_DEV=
MEM
> > > flag - pass it to tcp_recvmsg_devmem() for custom handling.
> > >
> > > tcp_recvmsg_devmem() copies any data in the skb header to the linear
> > > buffer, and returns a cmsg to the user indicating the number of bytes
> > > returned in the linear buffer.
> > >
> > > tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frag=
s,
> > > and returns to the user a cmsg_devmem indicating the location of the
> > > data in the dmabuf device memory. cmsg_devmem contains this informati=
on:
> > >
> > > 1. the offset into the dmabuf where the payload starts. 'frag_offset'=
.
> >
> > I have been testing this patch and I found a bug.
>
> Thanks Taehee. It's exciting to see that you have gotten this far in
> your testing!! You seem to have devmem TCP (almost) fully working!!

Yes, Finally!!

> May I ask which driver this is? I assume it's bnxt. Do you have the
> driver support somewhere on github or something? I'm curious what your
> driver implementation looks like.

I'm using a modified bnxt_en driver.
NICs are BCM57412, BCM57508(currently only 57412).
I modified the driver by myself for devmem TCP.
The implementation is too rough, only for testing it.

>
> > While testing it with the ncdevmem cmd, it fails to validate buffers
> > after some period.
> > This is because tcp_recvmsg_dmabuf() can't handle skb properly when
> > the parameter offset !=3D 0.
>
> Sadly I'm unable to reproduce this issue, but I think I know where to
> suspect the bug is. Thanks for taking the time to root cause this and
> provide a fix.

I'm not sure why, but I assume this bug appears when CPU utilization
peeks to almost 100%.

>
> ...
>
> > > + offset =3D 0;
> >
> > If the offset is 5000 and only 4500 bytes are skipped at this point,
> > the offset should be 500, not 0.
> > We need to add a condition to set the offset correctly.
> >
>
> I highly suspect this is a regression that was introduced in v13. In
> v12 Pavel asked if offset can just be set to 0 here, and I didn't see
> any reason why not, so I made the change:
>
> -+ offset =3D offset - start;
> ++ offset =3D 0;
>
> It looks like we missed something. I suspect reverting that may
> resolve the issue, because __skb_copy_datagram() in earlier kernels
> modified offset like this and it's well tested. Can you test with this
> change reverted? Diff like so:

No problem, I will test it.

>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 40e7335dae6e..984e28c5d096 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -2522,7 +2522,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk,
> const struct sk_buff *skb,
> */
> skb =3D skb_shinfo(skb)->frag_list ?: skb->next;
>
> - offset =3D 0;
> + offset =3D offset - start;
> } while (skb);
>
> if (remaining_len) {
>
> I'm running a long test to try to reproduce this issue, but I have ran
> many long tests before and was not able to. For some reason my setup
> is not able to reproduce this edge case. Are you doing anything
> special with ncdevmem? Or simply running commands like these on the
> server client?
>
> server: ./ncdevmem -s SERVER -c CLIENT -l -p 5224 -v 7
> client: yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | tr \\n \\0 |
> nc SERVER 5224 -p 5224
>

Yes, I'm using the vanilla ncdevmem command and option in the
documentation in this series.

server:
./ncdevmem -s 192.168.1.4 -c 192.168.1.2 -f $interface -l -p 5000 -v 7 -t 0=
 -q 4

client:
yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | \
tr \\n \\0 | \
head -c 1000000G | \
nc 192.168.1.4 5000 -p 5000


BTW, this is a ncdevmem failure message of the current implementation.
(offset =3D 0)

received frag_page=3D13205, in_page_offset=3D0, frag_offset=3D54087680,
frag_size=3D2896, token=3D288, total_received=3D1153657976, dmabuf_id=3D2
Validated buffer
received frag_page=3D13204, in_page_offset=3D0, frag_offset=3D54083584,
frag_size=3D1448, token=3D289, total_received=3D1153659424, dmabuf_id=3D2
Validated buffer
[1] received frag_page=3D13203, in_page_offset=3D0, frag_offset=3D54079488,
frag_size=3D2896, token=3D290, total_received=3D1153662320, dmabuf_id=3D2
Validated buffer
received frag_page=3D13202, in_page_offset=3D0, frag_offset=3D54075392,
frag_size=3D200, token=3D291, total_received=3D1153662520, dmabuf_id=3D2
Validated buffer
total_received=3D1153662520


recvmsg ret=3D819200
[2] received frag_page=3D13203, in_page_offset=3D0, frag_offset=3D54079488,
frag_size=3D2896, token=3D1, total_received=3D1153665416, dmabuf_id=3D2
Failed validation: expected=3D4, actual=3D2, index=3D0
Failed validation: expected=3D5, actual=3D3, index=3D1
Failed validation: expected=3D6, actual=3D4, index=3D2
Failed validation: expected=3D0, actual=3D5, index=3D3
Failed validation: expected=3D1, actual=3D6, index=3D4
Failed validation: expected=3D2, actual=3D0, index=3D5
Failed validation: expected=3D3, actual=3D1, index=3D6
Failed validation: expected=3D4, actual=3D2, index=3D7
Failed validation: expected=3D5, actual=3D3, index=3D8
Failed validation: expected=3D6, actual=3D4, index=3D9
Failed validation: expected=3D0, actual=3D5, index=3D10
Failed validation: expected=3D1, actual=3D6, index=3D11
Failed validation: expected=3D2, actual=3D0, index=3D12
Failed validation: expected=3D3, actual=3D1, index=3D13
Failed validation: expected=3D4, actual=3D2, index=3D14
Failed validation: expected=3D5, actual=3D3, index=3D15
Failed validation: expected=3D6, actual=3D4, index=3D16
Failed validation: expected=3D0, actual=3D5, index=3D17
Failed validation: expected=3D1, actual=3D6, index=3D18
Failed validation: expected=3D2, actual=3D0, index=3D19
Failed validation: expected=3D3, actual=3D1, index=3D20
./ncdevmem: validation failed.

Please look at the [1] and [2].
At the [1], The 13203 page is fully passed to userspace.
But 13202 is not, only 200 bytes are passed to userspace.
The 13203 page is passed to userspace fully, but 13202 is not.
Only 200 bytes are passed to userspace.

But at the [2], it receives 2896 bytes from 13203 again.
It should be 13202 and in_page_offset=3D200.

And I just started testing your suggestion, it seems to work correctly.
Here is the ncdevmem message, it's not a failure message.
(offset =3D offset - start)

received frag_page=3D13085, in_page_offset=3D0, frag_offset=3D53596160,
frag_size=3D2896, token=3D288, total_received=3D2233699704, dmabuf_id=3D2
Validated buffer
received frag_page=3D12931, in_page_offset=3D0, frag_offset=3D52965376,
frag_size=3D2896, token=3D289, total_received=3D2233702600, dmabuf_id=3D2
Validated buffer
[1] received frag_page=3D12916, in_page_offset=3D0, frag_offset=3D52903936,
frag_size=3D1392, token=3D290, total_received=3D2233703992, dmabuf_id=3D2
Validated buffer
total_received=3D2233703992


recvmsg ret=3D819200
[2] received frag_page=3D12916, in_page_offset=3D1392,
frag_offset=3D52905328, frag_size=3D1504, token=3D1,
total_received=3D2233705496,
dmabuf_id=3D2
Validated buffer
received frag_page=3D13244, in_page_offset=3D0, frag_offset=3D54247424,
frag_size=3D2896, token=3D2, total_received=3D2233708392, dmabuf_id=3D2
Validated buffer
received frag_page=3D13579, in_page_offset=3D0, frag_offset=3D55619584,
frag_size=3D1448, token=3D3, total_received=3D2233709840, dmabuf_id=3D2
Validated buffer
received frag_page=3D12315, in_page_offset=3D0, frag_offset=3D50442240,
frag_size=3D2896, token=3D4, total_received=3D2233712736, dmabuf_id=3D2
Validated buffer

At the [1], the 12916 page was not passed to userspace fully.
Only 1392 bytes are received.
At the [2], remain 1504 bytes are passed and the offset is 1392.
So, the 12916 page size is 2896, so it makes sense.

So, this is the reason why I think your suggestion is working correctly.
I have been still testing it, so I will report if it fails while testing.
But I think it works well about this corner case so far.

>
> --
> Thanks,
> Mina

Thanks a lot,
Taehee Yoo
