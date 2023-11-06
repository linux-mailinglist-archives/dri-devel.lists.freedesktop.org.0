Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C1F7E3175
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1110E45C;
	Mon,  6 Nov 2023 23:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014C10E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:32:37 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4a18f724d47so1654794e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 15:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699313557; x=1699918357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whIvC0sNba4bFzFOhrMovdRgssWrwgttcPpuIWiql/s=;
 b=gxSfgoJqemJe5spCZHPI/P29HzWpapqsV38yCEBrDpMIbKxxOvRE2VRdruuNtgsvJv
 K2P3PWqXyDvjV6MMklYmdNAv2+YiUsMt8mUabRHTeUu/7mopebSHSmSPurYDvcDJ2t1C
 FlnNDgCRn7WX5vt0CGR9DyaCYMqA6kdoSYvVRnKCJqjJS13P9oeJrEeg5kGlynRP821q
 o4QiqaVIwoeOSvimeeXXvU3OZvuKXj/LhXAvAC5f6AxgRhqqxkOer6cIEvrv0Os+y9eH
 e1O/XZKOfILGAB+LL48AnTRvoh7pq64Qpnz8QfL0JXKtSgKW0R3ViLNs86w7HvpAFQFU
 lrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699313557; x=1699918357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whIvC0sNba4bFzFOhrMovdRgssWrwgttcPpuIWiql/s=;
 b=t4BEOuNkSS1mvoZBsV7gMeH54uoScZRywgWz7MMulY6tW+AwFdO9AJwJGT/vBos80/
 DN3ZaBPeJxUi35ih8GDFiBTQ1jkQrsw9RPAm2OHIF/BYi4HGpfp/CKAoz0FOW5ZYL6mU
 EOomA/58d0S7GY3fHA+OhQf+RqSrhCpRJ1jrlnEa0rzSpCD3/NILT1NXnOOkKH1ce7O+
 QvIRQ24oL0uTNcxsYy/UWsXiQb8fCr4EFuUXzRBWJgHYyv5g8EIei9K7mQ9BeyjOXQkT
 jss1zOgVHOgwOlB6XtTDhh4fpgoqQm/JprV7WksWbZpI221589lr8IAcmKFnAgMHCQh3
 ubOg==
X-Gm-Message-State: AOJu0YxH54zTKNpifA01xlp31IRvWGSTRnXz1VnTrkZnFVoJxQSHfn22
 oFuaHjhyWqK2lWVz3jGbyhSOOQEqCVRyhLcd7rR6ww==
X-Google-Smtp-Source: AGHT+IGmUk3aoWvy+y4mxwNHeg1dbWxOSmuBU86aI53ERZ2BByHAM1yuczTbLq3vsaQkYp3X4vYpf4DlMVyUBfadW3s=
X-Received: by 2002:a1f:9d04:0:b0:4ac:6a9d:c49b with SMTP id
 g4-20020a1f9d04000000b004ac6a9dc49bmr2214430vke.14.1699313556771; Mon, 06 Nov
 2023 15:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
In-Reply-To: <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Mon, 6 Nov 2023 15:32:22 -0800
Message-ID: <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
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

On Mon, Nov 6, 2023 at 2:56=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Mon, Nov 6, 2023 at 2:34=E2=80=AFPM Stanislav Fomichev <sdf@google.com=
> wrote:
> >
> > On 11/06, Willem de Bruijn wrote:
> > > > > IMHO, we need a better UAPI to receive the tokens and give them b=
ack to
> > > > > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job don=
e,
> > > > > but look dated and hacky :-(
> > > > >
> > > > > We should either do some kind of user/kernel shared memory queue =
to
> > > > > receive/return the tokens (similar to what Jonathan was doing in =
his
> > > > > proposal?)
> > > >
> > > > I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> > > > familiar but I wanted to respond :-) But is the suggestion here to
> > > > build a new kernel-user communication channel primitive for the
> > > > purpose of passing the information in the devmem cmsg? IMHO that se=
ems
> > > > like an overkill. Why add 100-200 lines of code to the kernel to ad=
d
> > > > something that can already be done with existing primitives? I don'=
t
> > > > see anything concretely wrong with cmsg & setsockopt approach, and =
if
> > > > we switch to something I'd prefer to switch to an existing primitiv=
e
> > > > for simplicity?
> > > >
> > > > The only other existing primitive to pass data outside of the linea=
r
> > > > buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> > > > preferred? Any other suggestions or existing primitives I'm not awa=
re
> > > > of?
> > > >
> > > > > or bite the bullet and switch to io_uring.
> > > > >
> > > >
> > > > IMO io_uring & socket support are orthogonal, and one doesn't precl=
ude
> > > > the other. As you know we like to use sockets and I believe there a=
re
> > > > issues with io_uring adoption at Google that I'm not familiar with
> > > > (and could be wrong). I'm interested in exploring io_uring support =
as
> > > > a follow up but I think David Wei will be interested in io_uring
> > > > support as well anyway.
> > >
> > > I also disagree that we need to replace a standard socket interface
> > > with something "faster", in quotes.
> > >
> > > This interface is not the bottleneck to the target workload.
> > >
> > > Replacing the synchronous sockets interface with something more
> > > performant for workloads where it is, is an orthogonal challenge.
> > > However we do that, I think that traditional sockets should continue
> > > to be supported.
> > >
> > > The feature may already even work with io_uring, as both recvmsg with
> > > cmsg and setsockopt have io_uring support now.
> >
> > I'm not really concerned with faster. I would prefer something cleaner =
:-)
> >
> > Or maybe we should just have it documented. With some kind of path
> > towards beautiful world where we can create dynamic queues..
>
> I suppose we just disagree on the elegance of the API.

Yeah, I might be overly sensitive to the apis that use get/setsockopt
for something more involved than setting a flag.
Probably because I know that bpf will (unnecessarily) trigger on these :-D
I had to implement that bpf "bypass" (or fastpath) for
TCP_ZEROCOPY_RECEIVE and it looks like this token recycle might also
benefit from something similar.

> The concise notification API returns tokens as a range for
> compression, encoding as two 32-bit unsigned integers start + length.
> It allows for even further batching by returning multiple such ranges
> in a single call.

Tangential: should tokens be u64? Otherwise we can't have more than
4gb unacknowledged. Or that's a reasonable constraint?


> This is analogous to the MSG_ZEROCOPY notification mechanism from
> kernel to user.
>
> The synchronous socket syscall interface can be replaced by something
> asynchronous like io_uring. This already works today? Whatever
> asynchronous ring-based API would be selected, io_uring or otherwise,
> I think the concise notification encoding would remain as is.
>
> Since this is an operation on a socket, I find a setsockopt the
> fitting interface.
