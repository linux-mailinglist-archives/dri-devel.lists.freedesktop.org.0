Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6297D80ACF7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 20:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B778110EAF9;
	Fri,  8 Dec 2023 19:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78110EAF9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 19:27:59 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4649c501c1fso674299137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702063678; x=1702668478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8NyCuiiYgH2NC+1+G5jDZqmw10slLAD5tJccxA3IOU=;
 b=Ih95cGevZUn/uojIuWWrPOpRlNl8aBYtofZswfqyBtPgasHWKHI5pTLMOWgKsTlEpB
 0ZSeJ9mbsECj/LpMm6tyK2HPpEPzJzi0R0a0TXPln/iWr5wX7CfMVe835KamPwXubGBE
 w6e9G2+Z74gAoRjQ22VoZWh5fP4Ws5naN6K4bYEJqxHi+GpWwvLPRXC0vtZs5+RSv3wM
 Wd0qnT5qGeIGnv15Jta6pSWWNUYPyhq2BwccwMuZUxTFVGqAGFoOFHvh5skmQWsgBQt5
 BA0DSHKTrpFs3EgqK2qMG0y5CwITpqQFBsWszMLHZqVgLNY0jCTP3a08IsBhqRoe+s9f
 +OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702063678; x=1702668478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8NyCuiiYgH2NC+1+G5jDZqmw10slLAD5tJccxA3IOU=;
 b=nTRfGmnsJYqgAbAYUJ4r3lGlmnMbduSYBFqWriS9PU+tvJHRaty3sBKa84JjynYwxC
 FdAo1WkY24Wlda8g/h5H3RzGE1uKEvYevF33pyJtGVuI6/sWcv+6YwadhjrDrb2RUOJC
 lffLYxnq+hmnnkJXsPyujMavaAl6YSWPalwuB881U8uvfQ+bVvRlH+vyy1wIYLMVzVl1
 ARi8BbaeuhYy5Io83a37cNFL5JE/ksQDmaHdX33YKaKPUd3q3ezGJe5usIQRf0UZMXu0
 n3ci/6bfxdieh1+kJL6XPK0Y/JgqfVWCWflsf7Kppf0Ip3XBQWBenuWq4X8wrfuRjZ6j
 oAJg==
X-Gm-Message-State: AOJu0YwxT6K0B0EiZ55Xol2Cbok9DUMnECDhvt7Gm3Jmyd/2P3mP8wer
 jg6jJzgXiPx6XPOfi6DU27CgKHP7YbOahkCCfQ2pUQ==
X-Google-Smtp-Source: AGHT+IEPi2qW+CNAMULh3I0uZLV+ENMhuoXZdBR03G3pdL5QZhSSzAfl9wtnjBaGr4ZrWdh/Qk9uo4kpcH6n9EBcDGQ=
X-Received: by 2002:a05:6102:6ca:b0:464:944d:44de with SMTP id
 m10-20020a05610206ca00b00464944d44demr731655vsg.27.1702063678195; Fri, 08 Dec
 2023 11:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-8-almasrymina@google.com>
 <462da4bf-34f8-40c4-8772-9850b3127baf@kernel.org>
In-Reply-To: <462da4bf-34f8-40c4-8772-9850b3127baf@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 11:27:47 -0800
Message-ID: <CAHS8izMysKCCoAoVK9KzQrfbtFfagaPMRYSUUjKTqJ-ZwJ53oA@mail.gmail.com>
Subject: Re: [net-next v1 07/16] netdev: netdevice devmem allocator
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 12/7/23 5:52 PM, Mina Almasry wrote:
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index b8c8be5a912e..30667e4c3b95 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -2120,6 +2120,41 @@ static int netdev_restart_rx_queue(struct net_de=
vice *dev, int rxq_idx)
> >       return err;
> >  }
> >
> > +struct page_pool_iov *netdev_alloc_dmabuf(struct netdev_dmabuf_binding=
 *binding)
> > +{
> > +     struct dmabuf_genpool_chunk_owner *owner;
> > +     struct page_pool_iov *ppiov;
> > +     unsigned long dma_addr;
> > +     ssize_t offset;
> > +     ssize_t index;
> > +
> > +     dma_addr =3D gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
>
> Any reason not to allow allocation sizes other than PAGE_SIZE? e.g.,
> 2048 for smaller MTUs or 8192 for larger ones. It can be a property of
> page_pool and constant across allocations vs allowing different size for
> each allocation.

Only for simplicity. Supporting non-PAGE_SIZE is certainly possible,
but in my estimation it's a huge can of worms worthy of itss own
series. I find this series complicated to implement and review and
support as-is, and if reasonable I would like to punt that as a future
improvement.

At the minimum, I think the needed changes are:

1. The memory provider needs to report to the page pool the alloc size.
2. The page_pool needs to handle non-PAGE_SIZE memory regions.
3. The drivers need to handle non-PAGE_SIZE memory regions. Drivers
today handle fragged pages, but that is different because it's a
PAGE_SIZE region that is fragged. This is a non-PAGE_SIZE region in
the first place.
4. Any PAGE_SIZE assumptions in the entire net stack need to be removed.

At Google we mostly use page aligned MTUs so we're likely not that
interested in sub PAGE_SIZE allocations, but we are interested in n *
PAGE_SIZE allocations, but, I hope, in a separate followup effort.

--=20
Thanks,
Mina
