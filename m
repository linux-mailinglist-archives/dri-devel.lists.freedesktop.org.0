Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47477E4D9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 00:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3458110E2FE;
	Tue,  7 Nov 2023 23:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972EF10E189
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 23:55:46 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-45d9ceeb8b8so1846629137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 15:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699401345; x=1700006145;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNu6xIseaeQdGwpUSRstKqA7TEpi7Fwk8Tof0W7Ynro=;
 b=dCodAfvni3y9u6ubjghgOT9T8rVs0FMwrUinKHAeQnY0Rtq2tA7wVNNZYAsC1thFyb
 Iy02ewER7NCCl0+MwRQc9zEtd9UlZMkHk0DCuuZ9c9f34Nfezsk1PZR8lcyPJnLMW4J2
 ePMo+GDVk1Jc8m1oM3/jZpKnVNDAWBw8LMPB6jyiZ1peT70sn8H2MiB72R/s8vvYtDPv
 pEpXlRawigL5RM3sqHGhe06J8wBtGppu2DmkMzHX3cLd8aoyEpNgOgEqDmpI/TbppkJ9
 k2Dy65JGiy3msPHMG9lwbz22harLzW8hRIDf8FCFCzzFbpUWTO5BbB69orhZcHqrhhie
 NvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699401345; x=1700006145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PNu6xIseaeQdGwpUSRstKqA7TEpi7Fwk8Tof0W7Ynro=;
 b=fRmaHFEOvkWMhcZmAM/Fr3BQs/MmBVGanE0AYsjPoPQOVq1fpvwC/VK5Bv20xTLAoj
 yCB2PYgmNKO8SAwi/TuL9VmsnMOwqe2K6/3eowzYYSxhI/vaGdWzlJ871hMTPjsxxIIA
 J2Xc2cxynB192lemcYczlf2NRL46fKSQtdgMXmkjCOj0r69EO7KLc3OGh4xTBfbPe+xY
 /FAM5u+mOiyzpOcxlyAurSBCiO4SrHUoRnBh3vCGu4miaCjgdP2BlZkjx5PLUFbGTx0x
 zxNVyTBiiK2wH5rNSHyILYtQwD4S9vfFKLRVP5DAuxr+z/eWhPfLogMTzrRDbMaLzDyy
 Decw==
X-Gm-Message-State: AOJu0Yyubu492iC0DWgW3LVSvX8nM2eFYquvcE3p/FBJBxK12wpowEWM
 E9pr1NtfglSTL+s75EZfM/HlQh+cgxk7nlAJEqemww==
X-Google-Smtp-Source: AGHT+IGAhMHfijiOgGFQJswkLry8kjZeu/iVYNuDlNtd8WO059Ha5h/GvIFdFrsJHAgrw88t80FpdwX0AhNrgdX2dVY=
X-Received: by 2002:a67:e782:0:b0:45d:9083:f876 with SMTP id
 hx2-20020a67e782000000b0045d9083f876mr265655vsb.6.1699401345241; Tue, 07 Nov
 2023 15:55:45 -0800 (PST)
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
In-Reply-To: <CAF=yD-Ln4v8orUne8E7D2_eHu39PWPCrMR3Qtuh312pCu=erng@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 15:55:31 -0800
Message-ID: <CAHS8izOU06ceKyc5oVZhdCKJqmeRdcRyJBFpjGe=u2yh=V52dQ@mail.gmail.com>
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
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

On Mon, Nov 6, 2023 at 4:03=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Mon, Nov 6, 2023 at 3:55=E2=80=AFPM David Ahern <dsahern@kernel.org> w=
rote:
> >
> > On 11/6/23 4:32 PM, Stanislav Fomichev wrote:
> > >> The concise notification API returns tokens as a range for
> > >> compression, encoding as two 32-bit unsigned integers start + length=
.
> > >> It allows for even further batching by returning multiple such range=
s
> > >> in a single call.
> > >
> > > Tangential: should tokens be u64? Otherwise we can't have more than
> > > 4gb unacknowledged. Or that's a reasonable constraint?
> > >
> >
> > Was thinking the same and with bits reserved for a dmabuf id to allow
> > multiple dmabufs in a single rx queue (future extension, but build the
> > capability in now). e.g., something like a 37b offset (128GB dmabuf
> > size), 19b length (large GRO), 8b dmabuf id (lots of dmabufs to a queue=
).
>
> Agreed. Converting to 64b now sounds like a good forward looking revision=
.

The concept of IDing a dma-buf came up in a couple of different
contexts. First, in the context of us giving the dma-buf ID to the
user on recvmsg() to tell the user the data is in this specific
dma-buf. The second context is here, to bind dma-bufs with multiple
user-visible IDs to an rx queue.

My issue here is that I don't see anything in the struct dma_buf that
can practically serve as an ID:

https://elixir.bootlin.com/linux/v6.6-rc7/source/include/linux/dma-buf.h#L3=
02

Actually, from the userspace, only the name of the dma-buf seems
queryable. That's only unique if the user sets it as such. The dmabuf
FD can't serve as an ID. For our use case we need to support 1 process
doing the dma-buf bind via netlink, sharing the dma-buf FD to another
process, and that process receives the data.  In this case the FDs
shown by the 2 processes may be different. Converting to 64b is a
trivial change I can make now, but I'm not sure how to ID these
dma-bufs. Suggestions welcome. I'm not sure the dma-buf guys will
allow adding a new ID + APIs to query said dma-buf ID.

--
Thanks,
Mina
