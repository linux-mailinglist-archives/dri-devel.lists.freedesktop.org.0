Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229497E8826
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 03:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8890B10E035;
	Sat, 11 Nov 2023 02:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E30510E035
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:19:39 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7ba45fc8619so1099349241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 18:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699669178; x=1700273978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgqBnf0ilIbbmVz4uCSI7pHuUwmF6tF2MbGnmYFmbLE=;
 b=BzjAIImcE7bku+CFN76e5pkX9aaz1uBBVB/G/+/cz4duZPKTLZVH9Cy3kyO3S8o3Io
 QBuMuf6esH6P/DnaWHtYMmM+vBDpi/xzvNE57l7Mn/GU2t8ZOXC9iIboIkbkMFlzT0Sx
 4GoY4tGZxtMhHaRwcX2Rjr2g5vPJDr5EcFlAFQ05UgZ6amYqJj9r03CK0jjejueQBVir
 pWIMBhgB75yUYLdliULnVYXTHLAzgUTODHu07G6nvjtEz3yGkki5tMA2KKXQTbkBOmMM
 vg42FE3eJJFWAuwi0EI4BKfENk8fjoRgF3wN9RUw86/3vWyV8Ht8smAlosYJiF5JH0HU
 TWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699669178; x=1700273978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgqBnf0ilIbbmVz4uCSI7pHuUwmF6tF2MbGnmYFmbLE=;
 b=UIpO5p1S6J3ygaTrj0UwN+d7W+2p1CqhRHgtAafRaAMrER4E9JNN38AA28iNGDxMPr
 q1aBZOw/0AQG7948Xl5lpxQ3CJ9IkgCKaeUls/6Mx21yokvE9aEs1qSsc2cpfSM/yazG
 xvbla1gPeRWK3gcqSnQPpob2GNRUNJXa7Gsw/9HRKa0+QXe+UY0sqGDMli8GmdFmVzrb
 tdEUYoAfYbFrxWRfB909wctcD49x83qrW7pUv1Fr/OvqI/w+bEtSJ1UnbtA6xu90RsZQ
 eL1wNtNzYRX6AgLseFGG+z3Oa0LNwaPhz26l4ZNnaG86rEPUHQx4MV+AWAQrc/OWRfTt
 n8bg==
X-Gm-Message-State: AOJu0YyajYNMYgFuY3VClFbCpyiGbnV0Ret1fI25p0/QTJ/V5xTT7mVG
 n5R2DKtSD+RKouEmqAaO2JyekkqOO2gIhvCRZ9w9SQ==
X-Google-Smtp-Source: AGHT+IF27drF2ibPIv5e35tDpvNbfT/4JCRv/7iIXX2a/YulrAcvekKKHgSNmcTCaUBg7ZoYtol1hSAIqIT6V1YCrfg=
X-Received: by 2002:a05:6102:5f09:b0:460:f40a:95f8 with SMTP id
 ik9-20020a0561025f0900b00460f40a95f8mr1152743vsb.24.1699669177954; Fri, 10
 Nov 2023 18:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <20231110151953.75c03297@kernel.org>
In-Reply-To: <20231110151953.75c03297@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 10 Nov 2023 18:19:24 -0800
Message-ID: <CAHS8izOx99K=0O1fkb93mS54Yw0dqMj31D68gLG6OpH1J9LBhQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Jakub Kicinski <kuba@kernel.org>
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
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 3:20=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  5 Nov 2023 18:44:03 -0800 Mina Almasry wrote:
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -52,6 +52,8 @@
> >  #include <net/net_trackers.h>
> >  #include <net/net_debug.h>
> >  #include <net/dropreason-core.h>
> > +#include <linux/xarray.h>
> > +#include <linux/refcount.h>
> >
> >  struct netpoll_info;
> >  struct device;
> > @@ -808,6 +810,84 @@ bool rps_may_expire_flow(struct net_device *dev, u=
16 rxq_index, u32 flow_id,
> >  #endif
> >  #endif /* CONFIG_RPS */
> >
> > +struct netdev_dmabuf_binding {
>
> Similar nitpick to the skbuff.h comment. Take this somewhere else,
> please, it doesn't need to be included in netdevice.h
>
> > +     struct netdev_dmabuf_binding *rbinding;
>
> the 'r' in rbinding stands for rx? =F0=9F=A4=94=EF=B8=8F
>

reverse binding. As in usually it's netdev->binding, but the reverse
map holds the bindings themselves so we can unbind them from the
netdev.
--=20
Thanks,
Mina
