Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8285955889
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 17:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3E10E09E;
	Sat, 17 Aug 2024 15:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KtYYPSvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81A10E09E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 15:13:50 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6bf8b41b34dso3206066d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723907629; x=1724512429;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8fuP4rXSYs0IsxsahVa0Q55YFfnXxVc+PpufNcWYNA=;
 b=KtYYPSvfX6HKUQ4UkDokh2XiXE8lbcJmi2BroaciJNU0WGTUAm8BK5ZAwCz4IOzhAj
 j8GuWcAem6ZQxdHB3VxZOJG5SSvSCHwcwvuoFQC5aPMQ+0cbflNictiWS+tcuqq9xF5Z
 WdXq3qCDuWfLkt42MZCR5rVjv4Z4wjTjVem8BLWhaVBuxfEtbVkpoiWxqCOqu6A529X5
 xPkMKYONuge95k49E/hZvMDsDD9KkQX2k8wHCpj+6wUnSzBxq8sOioXKiJ/+GQ2Kqqrp
 WVYwv3jcR1co1O9cBysULEV9ZPg/iAEwWQhOzcXnHq2c9/UAb7at4/2B939OKnwQOBwh
 ZqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723907629; x=1724512429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8fuP4rXSYs0IsxsahVa0Q55YFfnXxVc+PpufNcWYNA=;
 b=B5NyLJ0Vo9g4yQSXfcXuDK6T3k3Bpoen2Q/JkCbz6AeOm2t6REnjaw8vJtB/ejY4Uq
 /GXNEZza6Nu748TH9gGg2nFFzNR6nbmEx4gMOoPhNc9ObxlTAN/Z/338froF6IYxKGfw
 QGfxnAgcPg1pS1ZifYAd20hqxU2JZk9gjm1+6hb20XpdjtVFaIvAf6Sg36b4fe+2e7rT
 Vhy9zix0vf8LeZ3/pRQ7ZfYN1TZ1RdRcpFSwE40AskXaPlSo9FB/4kV1mrlyyEWfPsge
 1U0zI+GALb9Qu+UfuMiZq0U2l49PWJ0RW6LxuKaB++cRgHXnh3WIV5onxZjdQa/lrY/8
 d87g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtvwNfxf+7fmVemKqBTTK5D2CKcYsmOKns8lqqazBPRTwlYLCKzldwn853MwmAyiYUd0gt6NAMX8GQjG8yJofovlf3ivfbHsRpHZt7Osd1
X-Gm-Message-State: AOJu0YwNWHww91WDSJOSaW0pm//w/RHLHUElPloxeO2SMmBkl9VBMf6z
 eoChfTMfmaL3D4VtBi2nCjgVkyTdpG4ACOZg58qFc5b8sMO1/ULPN/YHs9ZneGRLnmHFSrwkAPq
 jQ2uPBWHbW+4Kmf9C45CfbQuGXXUVZCsg79/R
X-Google-Smtp-Source: AGHT+IEVoTrHdVFvEzEpKQmmtV0mdfaBBccZW7R2wrmBmSZjuFbL1LJHUNlqx3hUH+/ws9eu5VXMD1mp4i3r/g0VSRU=
X-Received: by 2002:a0c:f40d:0:b0:6bf:79c1:b9aa with SMTP id
 6a1803df08f44-6bf8950a6c2mr26142936d6.33.1723907629272; Sat, 17 Aug 2024
 08:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-10-almasrymina@google.com>
 <CAMArcTW=mg2gF_e6spPWOCuQdDAWSuKTCdCNPWGqcU1ciq30EQ@mail.gmail.com>
In-Reply-To: <CAMArcTW=mg2gF_e6spPWOCuQdDAWSuKTCdCNPWGqcU1ciq30EQ@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 17 Aug 2024 11:13:34 -0400
Message-ID: <CAHS8izOqGMiZNkfQ6G-29UuG64GVo7L+fAzWn5A1713cDAgbgg@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/13] tcp: RX path for devmem TCP
To: Taehee Yoo <ap420073@gmail.com>
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

On Sat, Aug 17, 2024 at 9:58=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> On Wed, Aug 14, 2024 at 6:13=E2=80=AFAM Mina Almasry <almasrymina@google.=
com> wrote:
> >
>
> Hi Mina,
>
> > In tcp_recvmsg_locked(), detect if the skb being received by the user
> > is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVME=
M
> > flag - pass it to tcp_recvmsg_devmem() for custom handling.
> >
> > tcp_recvmsg_devmem() copies any data in the skb header to the linear
> > buffer, and returns a cmsg to the user indicating the number of bytes
> > returned in the linear buffer.
> >
> > tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> > and returns to the user a cmsg_devmem indicating the location of the
> > data in the dmabuf device memory. cmsg_devmem contains this information=
:
> >
> > 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
>
> I have been testing this patch and I found a bug.

Thanks Taehee. It's exciting to see that you have gotten this far in
your testing!! You seem to have devmem TCP (almost) fully working!!
May I ask which driver this is? I assume it's bnxt. Do you have the
driver support somewhere on github or something? I'm curious what your
driver implementation looks like.

> While testing it with the ncdevmem cmd, it fails to validate buffers
> after some period.
> This is because tcp_recvmsg_dmabuf() can't handle skb properly when
> the parameter offset !=3D 0.

Sadly I'm unable to reproduce this issue, but I think I know where to
suspect the bug is. Thanks for taking the time to root cause this and
provide a fix.

...

> > +               offset =3D 0;
>
> If the offset is 5000 and only 4500 bytes are skipped at this point,
> the offset should be 500, not 0.
> We need to add a condition to set the offset correctly.
>

I highly suspect this is a regression that was introduced in v13. In
v12 Pavel asked if offset can just be set to 0 here, and I didn't see
any reason why not, so I made the change:

    -+          offset =3D offset - start;
    ++          offset =3D 0;

It looks like we missed something. I suspect reverting that may
resolve the issue, because __skb_copy_datagram() in earlier kernels
modified offset like this and it's well tested. Can you test with this
change reverted? Diff like so:

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 40e7335dae6e..984e28c5d096 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2522,7 +2522,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk,
const struct sk_buff *skb,
                 */
                skb =3D skb_shinfo(skb)->frag_list ?: skb->next;

-               offset =3D 0;
+               offset =3D offset - start;
        } while (skb);

        if (remaining_len) {

I'm running a long test to try to reproduce this issue, but I have ran
many long tests before and was not able to. For some reason my setup
is not able to reproduce this edge case. Are you doing anything
special with ncdevmem? Or simply running commands like these on the
server client?

server: ./ncdevmem -s SERVER -c CLIENT -l -p 5224 -v 7
client: yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | tr \\n \\0 |
nc SERVER 5224 -p 5224


--=20
Thanks,
Mina
