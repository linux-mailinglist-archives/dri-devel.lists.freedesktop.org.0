Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570F7E2ECF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3176210E42A;
	Mon,  6 Nov 2023 21:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAB210E42A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:18:01 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1cc5ef7e815so33338245ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699305480; x=1699910280;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Q+e/wl/IpkV0o6PDo9Tkqa7B1djQqq2R6AetcJyqBsw=;
 b=czp82iVAqtdd2RT3krmv8/s6rYQKVSd7/bD2QOfXuXEzQ4h2uSSqv54IYFYttzz4ph
 wnf6tYWeUeYy4NgO6WApg+sqdO0wP8aB+SvrCQzjvCwrh/0C6TW9+CAbKjDoEZGpXuiS
 jTLw5tqpW//BIWswQTU4XEAa0VAYTE+6dTL5PL9Id7PbZTd2nl5flYki6+atIjj5meeE
 0TXpeNkEaGDGgcf+MJuY1SoV00TDaFIuF3jutKISgX2skuotsYN9dLKi3ue6AgUyVATX
 2pG2x/E/c4/Ga+7OkEBdyXQ+AfQECLXOXlnHvO9ZNbugWZDKdHKhXuGxkvqASz8h3P/d
 OdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699305480; x=1699910280;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q+e/wl/IpkV0o6PDo9Tkqa7B1djQqq2R6AetcJyqBsw=;
 b=DdtgJEWgwAY13sUYszrLe3gZge+S7nNqcDehJSavnUnStcjJd+JmWUGljBkzOIirDe
 OkkUPBdZc9MIS1Vg7eo042pu6JGcCPPa3qgjiZgr3dTfoJ2a+12ghfc8Ocw+LYXysQig
 0Q/PnoZhejXR6UC+ZUCAUOoT6RLkzJXRXq5vneFCsEgHMzyGXSFbXpgjLiBnCbovz7CG
 3EXflwFJznseShg+Mmrk8oXFrQ+oHwH6vOphcmgDaV1CMy3RgxJx+ktEjxBPXuBG2D5L
 KTCcCWv6CWF6Qd8J2Tc/cwcFfgMZBwD01YA65x9jsma+v1lxFV2HuXWjAx2n+UQ/pTcH
 Hojg==
X-Gm-Message-State: AOJu0Yzzh9ACzLCY5ouWSPSvsySWOP4lzRH+7HA5AVJuKAdlEpZ3bg39
 JUvHWqXmy+oAvRoP/rqaa2v6BLk=
X-Google-Smtp-Source: AGHT+IFyUJONzj4do13pt+qQjhpP+paqIv/cmkYUyDep9IE9Z/JO/7Oa2cHBSiwtEe3VWLUwCJQwRDY=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:f809:b0:1cc:2a6f:ab91 with SMTP id
 ix9-20020a170902f80900b001cc2a6fab91mr467862plb.0.1699305480560; Mon, 06 Nov
 2023 13:18:00 -0800 (PST)
Date: Mon, 6 Nov 2023 13:17:59 -0800
In-Reply-To: <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
Message-ID: <ZUlYB99GK1Q8is-I@google.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Stanislav Fomichev <sdf@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06, Mina Almasry wrote:
> On Mon, Nov 6, 2023 at 10:44=E2=80=AFAM Stanislav Fomichev <sdf@google.co=
m> wrote:
> >
> > On 11/05, Mina Almasry wrote:
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
> > > 2. the size of the frag. 'frag_size'.
> > > 3. an opaque token 'frag_token' to return to the kernel when the buff=
er
> > > is to be released.
> > >
> > > The pages awaiting freeing are stored in the newly added
> > > sk->sk_user_pages, and each page passed to userspace is get_page()'d.
> > > This reference is dropped once the userspace indicates that it is
> > > done reading this page.  All pages are released when the socket is
> > > destroyed.
> > >
> > > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > >
> > > ---
> > >
> > > RFC v3:
> > > - Fixed issue with put_cmsg() failing silently.
> > >
> > > ---
> > >  include/linux/socket.h            |   1 +
> > >  include/net/page_pool/helpers.h   |   9 ++
> > >  include/net/sock.h                |   2 +
> > >  include/uapi/asm-generic/socket.h |   5 +
> > >  include/uapi/linux/uio.h          |   6 +
> > >  net/ipv4/tcp.c                    | 189 ++++++++++++++++++++++++++++=
+-
> > >  net/ipv4/tcp_ipv4.c               |   7 ++
> > >  7 files changed, 214 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/include/linux/socket.h b/include/linux/socket.h
> > > index cfcb7e2c3813..fe2b9e2081bb 100644
> > > --- a/include/linux/socket.h
> > > +++ b/include/linux/socket.h
> > > @@ -326,6 +326,7 @@ struct ucred {
> > >                                         * plain text and require encr=
yption
> > >                                         */
> > >
> > > +#define MSG_SOCK_DEVMEM 0x2000000    /* Receive devmem skbs as cmsg =
*/
> >
> > Sharing the feedback that I've been providing internally on the public =
list:
> >
>=20
> There may have been a miscommunication. I don't recall hearing this
> specific feedback from you, at least in the last few months. Sorry if
> it seemed like I'm ignoring feedback :)

No worries, there was a thread long time ago about this whole token
interface and whether it should support out-of-order refills, etc.

> > IMHO, we need a better UAPI to receive the tokens and give them back to
> > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
> > but look dated and hacky :-(
> >
> > We should either do some kind of user/kernel shared memory queue to
> > receive/return the tokens (similar to what Jonathan was doing in his
> > proposal?)
>=20
> I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> familiar but I wanted to respond :-) But is the suggestion here to
> build a new kernel-user communication channel primitive for the
> purpose of passing the information in the devmem cmsg? IMHO that seems
> like an overkill. Why add 100-200 lines of code to the kernel to add
> something that can already be done with existing primitives? I don't
> see anything concretely wrong with cmsg & setsockopt approach, and if
> we switch to something I'd prefer to switch to an existing primitive
> for simplicity?
>=20
> The only other existing primitive to pass data outside of the linear
> buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> preferred? Any other suggestions or existing primitives I'm not aware
> of?

I guess I'm just wondering whether other people have any suggestions
here. Not sure Jonathan's way was better, but we fundamentally
have two queues between the kernel and the userspace:
- userspace receiving tokens (recvmsg + magical flag)
- userspace refilling tokens (setsockopt + magical flag)

So having some kind of shared memory producer-consumer queue feels natural.
And using 'classic' socket api here feels like a stretch, idk.

But maybe I'm overthinking and overcomplicating :-)

> > or bite the bullet and switch to io_uring.
> >
>=20
> IMO io_uring & socket support are orthogonal, and one doesn't preclude
> the other. As you know we like to use sockets and I believe there are
> issues with io_uring adoption at Google that I'm not familiar with
> (and could be wrong). I'm interested in exploring io_uring support as
> a follow up but I think David Wei will be interested in io_uring
> support as well anyway.

Ack, might be one more reason on our side to adopt iouring :-p

> > I was also suggesting to do it via netlink initially, but it's probably
> > a bit slow for these purpose, idk.
>=20
> Yeah, I hear netlink is reserved for control paths and is
> inappropriate for data path, but I'll let folks correct me if wrong.
>=20
> --=20
> Thanks,
> Mina
