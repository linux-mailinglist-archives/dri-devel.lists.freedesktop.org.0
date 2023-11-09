Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FC7E624A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 03:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264B110E1AF;
	Thu,  9 Nov 2023 02:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCD810E0C0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 02:39:23 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7ba0d338367so151425241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 18:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699497563; x=1700102363;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoDAF1C1HAcA+PpMvkLLmDwQmtJn4XmvLM4Nw3eJF8Y=;
 b=BIBFEegjt1JTITykjygwhjZRCOoxk/ofQdX82RlvCSD9KCFRdSWYlo2H75IEaCUU6m
 dvBpnLBMcn5mynuE73/f6E5sOEaCIolzNwV0GGD6sAPlJMqfUSOHA4X/hv56tU75hhmg
 DA4nGRxR+Y+orP3noJbruHqENIGpLx0TvujBED3ouxlaZ0WlvbZeISKzAHNCsv+f9yuS
 8aRTa2oFL9QPgZHQO2GQdF1O1Qb8Rb6r+C1vLiN/nDDMlON3XcE6Cu427vLEJn1A0MLh
 fpiU953ibCvDvUMrlLIJt3WOYIw82e1hygtC/yE1yCRtFklPk6bmsReJR/UXzuEn9+KW
 EviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699497563; x=1700102363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IoDAF1C1HAcA+PpMvkLLmDwQmtJn4XmvLM4Nw3eJF8Y=;
 b=usfwie9bLPYwVqmtm8RugmxHXMeISp/Mhs/ScbWh12o44JACcrnA+PX/WWVHXdcWyk
 h1Wp80xmLj8u9FO1smJD4NS4/g5AbZZcAMTzCgevq+Uw4LVh82eHJX9AIso9BKcWBrTA
 BVqgFXl2mQFY74u3ZlC3y4kQfTNrMD57NogwaDhvd0keESsQdmfnfhL+DYDUztNYA2GP
 zlscUO18RKWYgRpqVzddTAyzc+hiJ4kSbbNvac4gxNyh+Z31EcJYjE/LWWiEOsRPD9Es
 p1EXD6Rj+hIXcKuy8dXkuTdttCAD6ov6BB3nOKF2JbJ8lvbSkFic+Ua0HX5sGF4n+/oE
 cekQ==
X-Gm-Message-State: AOJu0YwjlR7kEAV8hyRruaV5jzqrRY5m2RoShdpkhISNxt2gemIk3RB4
 sYiS46lEL0PzQQXaj5hrzxF1Wn0rNSq5HerftZGAag==
X-Google-Smtp-Source: AGHT+IFFkRJvUoPlQ13R7albFmtMDS+H8AANP9cOujoPlk+sG7EujjfJVZajEWG/Gx1UcPEbXMz+/ayvbG3vg4TKYIA=
X-Received: by 2002:a67:b201:0:b0:45d:873e:c795 with SMTP id
 b1-20020a67b201000000b0045d873ec795mr3756190vsf.10.1699497562743; Wed, 08 Nov
 2023 18:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
 <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
 <CAF=yD-Ln4v8orUne8E7D2_eHu39PWPCrMR3Qtuh312pCu=erng@mail.gmail.com>
 <CAHS8izOU06ceKyc5oVZhdCKJqmeRdcRyJBFpjGe=u2yh=V52dQ@mail.gmail.com>
 <7ce2d027-1e02-4a63-afb7-7304fbfbdf90@kernel.org>
In-Reply-To: <7ce2d027-1e02-4a63-afb7-7304fbfbdf90@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 8 Nov 2023 18:39:11 -0800
Message-ID: <CAHS8izM_qrEs37F=kPzT_kmqCBV_wSiTf72PtHfJYxks9R9--Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: David Ahern <dsahern@kernel.org>
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 4:01=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/7/23 4:55 PM, Mina Almasry wrote:
> > On Mon, Nov 6, 2023 at 4:03=E2=80=AFPM Willem de Bruijn
> > <willemdebruijn.kernel@gmail.com> wrote:
> >>
> >> On Mon, Nov 6, 2023 at 3:55=E2=80=AFPM David Ahern <dsahern@kernel.org=
> wrote:
> >>>
> >>> On 11/6/23 4:32 PM, Stanislav Fomichev wrote:
> >>>>> The concise notification API returns tokens as a range for
> >>>>> compression, encoding as two 32-bit unsigned integers start + lengt=
h.
> >>>>> It allows for even further batching by returning multiple such rang=
es
> >>>>> in a single call.
> >>>>
> >>>> Tangential: should tokens be u64? Otherwise we can't have more than
> >>>> 4gb unacknowledged. Or that's a reasonable constraint?
> >>>>
> >>>
> >>> Was thinking the same and with bits reserved for a dmabuf id to allow
> >>> multiple dmabufs in a single rx queue (future extension, but build th=
e
> >>> capability in now). e.g., something like a 37b offset (128GB dmabuf
> >>> size), 19b length (large GRO), 8b dmabuf id (lots of dmabufs to a que=
ue).
> >>
> >> Agreed. Converting to 64b now sounds like a good forward looking revis=
ion.
> >
> > The concept of IDing a dma-buf came up in a couple of different
> > contexts. First, in the context of us giving the dma-buf ID to the
> > user on recvmsg() to tell the user the data is in this specific
> > dma-buf. The second context is here, to bind dma-bufs with multiple
> > user-visible IDs to an rx queue.
> >
> > My issue here is that I don't see anything in the struct dma_buf that
> > can practically serve as an ID:
> >
> > https://elixir.bootlin.com/linux/v6.6-rc7/source/include/linux/dma-buf.=
h#L302
> >
> > Actually, from the userspace, only the name of the dma-buf seems
> > queryable. That's only unique if the user sets it as such. The dmabuf
> > FD can't serve as an ID. For our use case we need to support 1 process
> > doing the dma-buf bind via netlink, sharing the dma-buf FD to another
> > process, and that process receives the data.  In this case the FDs
> > shown by the 2 processes may be different. Converting to 64b is a
> > trivial change I can make now, but I'm not sure how to ID these
> > dma-bufs. Suggestions welcome. I'm not sure the dma-buf guys will
> > allow adding a new ID + APIs to query said dma-buf ID.
> >
>
> The API can be unique to this usage: e.g., add a dmabuf id to the
> netlink API. Userspace manages the ids (tells the kernel what value to
> use with an instance), the kernel validates no 2 dmabufs have the same
> id and then returns the value here.
>
>

Seems reasonable, will do.

On Wed, Nov 8, 2023 at 7:36=E2=80=AFAM Edward Cree <ecree.xilinx@gmail.com>=
 wrote:
>
> On 06/11/2023 21:17, Stanislav Fomichev wrote:
> > I guess I'm just wondering whether other people have any suggestions
> > here. Not sure Jonathan's way was better, but we fundamentally
> > have two queues between the kernel and the userspace:
> > - userspace receiving tokens (recvmsg + magical flag)
> > - userspace refilling tokens (setsockopt + magical flag)
> >
> > So having some kind of shared memory producer-consumer queue feels natu=
ral.
> > And using 'classic' socket api here feels like a stretch, idk.
>
> Do 'refilled tokens' (returned memory areas) get used for anything other
>  than subsequent RX?

Hi Ed!

Not really, it's only the subsequent RX.

>  If not then surely the way to return a memory area
>  in an io_uring idiom is just to post a new read sqe ('RX descriptor')
>  pointing into it, rather than explicitly returning it with setsockopt.

We're interested in using this with regular TCP sockets, not
necessarily io_uring. The io_uring interface to devmem TCP may very
well use what you suggest and can drop the setsockopt.


> (Being async means you can post lots of these, unlike recvmsg(), so you
>  don't need any kernel management to keep the RX queue filled; it can
>  just be all handled by the userland thus simplifying APIs overall.)
> Or I'm misunderstanding something?
>
> -e


--
Thanks,
Mina
