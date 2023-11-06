Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C817E3035
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DC210E06C;
	Mon,  6 Nov 2023 22:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336010E06C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:56:02 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7bb44339bf7so413490241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699311362; x=1699916162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wEW+J+MMgAFeh8Mzz47HGE59Py4EtdOuMSKU4I6zWM=;
 b=k7xfsw1b8uIs4OPZMNCID+PNSMjwMhdclF6SGlmCejsE7jCr1LEf82dLg9JSaatldM
 8rHv5fZGTBrwIgEO5ElkLfs5+G0UpNGjYiGp9L2OJKsKtN1Cz/Gmc5GFq8h0BxhKdlCL
 o8dQrshk17nQkf7ryqUWXlIiERZioWpXozZ09nCXOLfG9npyti9SxPaCethfVCtrfUKK
 iANVYbnp45V1C20GlB38Lyy1tVVY4SKGDTA4uominTtOm3ggm8HmPFirZP8CBOnS77Wv
 u/xb+95Dqyt2N2usPPVGB0QDz0xBmXwPyQXurD1nudsIHJIg36OstCDL9/+pYwctiR1T
 zHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699311362; x=1699916162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wEW+J+MMgAFeh8Mzz47HGE59Py4EtdOuMSKU4I6zWM=;
 b=r5a4odi+9fwBfDM+x6kr628noVuWYDh8c+i1p8toJn6QLeVNAd0l4+Bm4tAawS31UJ
 7b1iQ8J4Gditx37JmTaFuNQ/1GXC73kIj5P7305//DDfqvVwWvFnfIVekEyshLghIT3X
 lRP4xOmTXved2xuX/U+FBBIYE0U0cbpAnGz00TaDprKKm6l9U9BzEa/w50tli6dpDi8U
 Sfi0/wN/cdYVPx31oPBwf8MT8qCDY65KiQX6Yj0IlqeK1xDgDsZWPuPzdNWYu3l71D2I
 8FqWw4C1i09u00y87IOrGUerctjYy7UhVmKC5k7X76o6pwcisCOLRV7XygplGmpnvDOm
 wdcw==
X-Gm-Message-State: AOJu0YxCEcL9sEpqunKzGHoIIqqmL3MrsX7UYQibkZoM2MiRApQEbbdC
 jbKSVLHh46k/cteJkL3qbfbfL8t7WK4BqE660DA=
X-Google-Smtp-Source: AGHT+IGJLbY16cPvyvbTXphGTN+7ucINqF5flr9mxxCiuhAJxLJ/TQnck4EFEyL23m987XVAKWsGDAUf4sPH+q33ho4=
X-Received: by 2002:a67:b042:0:b0:452:94a4:9c59 with SMTP id
 q2-20020a67b042000000b0045294a49c59mr19989020vsh.10.1699311361745; Mon, 06
 Nov 2023 14:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
In-Reply-To: <ZUlp8XutSAScKs_0@google.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 6 Nov 2023 14:55:24 -0800
Message-ID: <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Stanislav Fomichev <sdf@google.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 2:34=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:
>
> On 11/06, Willem de Bruijn wrote:
> > > > IMHO, we need a better UAPI to receive the tokens and give them bac=
k to
> > > > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
> > > > but look dated and hacky :-(
> > > >
> > > > We should either do some kind of user/kernel shared memory queue to
> > > > receive/return the tokens (similar to what Jonathan was doing in hi=
s
> > > > proposal?)
> > >
> > > I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> > > familiar but I wanted to respond :-) But is the suggestion here to
> > > build a new kernel-user communication channel primitive for the
> > > purpose of passing the information in the devmem cmsg? IMHO that seem=
s
> > > like an overkill. Why add 100-200 lines of code to the kernel to add
> > > something that can already be done with existing primitives? I don't
> > > see anything concretely wrong with cmsg & setsockopt approach, and if
> > > we switch to something I'd prefer to switch to an existing primitive
> > > for simplicity?
> > >
> > > The only other existing primitive to pass data outside of the linear
> > > buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> > > preferred? Any other suggestions or existing primitives I'm not aware
> > > of?
> > >
> > > > or bite the bullet and switch to io_uring.
> > > >
> > >
> > > IMO io_uring & socket support are orthogonal, and one doesn't preclud=
e
> > > the other. As you know we like to use sockets and I believe there are
> > > issues with io_uring adoption at Google that I'm not familiar with
> > > (and could be wrong). I'm interested in exploring io_uring support as
> > > a follow up but I think David Wei will be interested in io_uring
> > > support as well anyway.
> >
> > I also disagree that we need to replace a standard socket interface
> > with something "faster", in quotes.
> >
> > This interface is not the bottleneck to the target workload.
> >
> > Replacing the synchronous sockets interface with something more
> > performant for workloads where it is, is an orthogonal challenge.
> > However we do that, I think that traditional sockets should continue
> > to be supported.
> >
> > The feature may already even work with io_uring, as both recvmsg with
> > cmsg and setsockopt have io_uring support now.
>
> I'm not really concerned with faster. I would prefer something cleaner :-=
)
>
> Or maybe we should just have it documented. With some kind of path
> towards beautiful world where we can create dynamic queues..

I suppose we just disagree on the elegance of the API.

The concise notification API returns tokens as a range for
compression, encoding as two 32-bit unsigned integers start + length.
It allows for even further batching by returning multiple such ranges
in a single call.

This is analogous to the MSG_ZEROCOPY notification mechanism from
kernel to user.

The synchronous socket syscall interface can be replaced by something
asynchronous like io_uring. This already works today? Whatever
asynchronous ring-based API would be selected, io_uring or otherwise,
I think the concise notification encoding would remain as is.

Since this is an operation on a socket, I find a setsockopt the
fitting interface.
