Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5C77DB41
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 09:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A26410E2E4;
	Wed, 16 Aug 2023 07:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8121210E251
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 14:42:13 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-44ac6042933so115857137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692110532; x=1692715332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UZFaVlc1sczHQWHZJ9AjHZsRHt5PWt4JpBGZLlXeg0=;
 b=pPleL2QungwV3N3GV8TI1ahpjqCncp51gnYfpvhhOplW891qdlMshtDs+IgT0IzjBl
 aH8K8BwF5pYG7OngZkQaS0AvH3oE577jAmSSX4MW+Axt0EXU9ozPJySimW1pqaeSi8+M
 11yfvvWj2VSawUbT0Y9PkmaBSuw8n/qBLaxKPTjIBKoLI9fjcfonXPLke4HnTrfXq2Bq
 P4hgAYQOWwMryU68Se7CJVbkDXuFrZT5zXEmYIv5WIj62AZ7XLUbTEychVoKNEHMInpM
 b0hq+dHf4oaWA35i6X3k4p1wE4swSej2PiRoHfDquatLYJPOHmt0P3o+G++ZtaUzPtYN
 JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692110532; x=1692715332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UZFaVlc1sczHQWHZJ9AjHZsRHt5PWt4JpBGZLlXeg0=;
 b=LotU/1Iq2j/WcV65QKRGd9yVKKVQyzcYWMDRvkoZvtZX3yZOi0hXejN/o+nuFNaakj
 2XGaRT0csMWuY2/xOvmw0/1YJDKJWmAKcI06iU5ObUFAcCdGLpipYidFz76ilH6+U7gU
 KVXU5DiF7+xixdMOLXxaSCoZoViEQ8w7ZGKu6bc/Aknck7Lp/tyMIwMBcOInrK5G69ZO
 6+6vYPGj5bVKHSfga7NwtYQi/a5f+SUDP5FDvsWcN4FdKptNeIXZqPs1E8H9VEuKQ0qu
 j9zf3E10QPOtxoEXnjQpMq0T6k2Kcog012uXrCN9IKt3Y5ptcA+bFxjqfYr6DLRuQHNw
 Skmw==
X-Gm-Message-State: AOJu0YwMEZ4WbQJ+Gqno0xOtNpUfDWoal3rgKM5BW0asGXOoZrceT63L
 7oOOdcga55Wb/V35DXmw94uy+q/qM3d6tLgOnd/jwuPv
X-Google-Smtp-Source: AGHT+IHkefxbWaWrxGL9lInv9tYLtV6RKC5Xhye/4zD/nSk4TJeMzlNk1n0Cbb5GRzuoSowhEPnqM6F//jPuzZ4WmLM=
X-Received: by 2002:a05:6102:3014:b0:440:c4fb:f257 with SMTP id
 s20-20020a056102301400b00440c4fbf257mr11215788vsa.0.1692110532489; Tue, 15
 Aug 2023 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
In-Reply-To: <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 15 Aug 2023 10:41:35 -0400
Message-ID: <CAF=yD-KrkHo9QY2-cALosQHnZe=JWiRcmcvpfu3qov2J6kJPMQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Aug 2023 07:39:26 +0000
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
Cc: Mina Almasry <almasrymina@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 "sdf@google.com" <sdf@google.com>, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 9:38=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Mina Almasry
> > Sent: 10 August 2023 02:58
> ...
> > * TL;DR:
> >
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
>
> Doesn't that really require peer-to-peer PCIe transfers?
> IIRC these aren't supported by many root hubs and have
> fundamental flow control and/or TLP credit problems.
>
> I'd guess they are also pretty incompatible with IOMMU?

Yes, this is a form of PCI_P2PDMA and all the limitations of that apply.

> I can see how you might manage to transmit frames from
> some external memory (eg after encryption) but surely
> processing receive data that way needs the packets
> be filtered by both IP addresses and port numbers before
> being redirected to the (presumably limited) external
> memory.

This feature depends on NIC receive header split. The TCP/IP headers
are stored to host memory, the payload to device memory.

Optionally, on devices that do not support explicit header-split, but
do support scatter-gather I/O, if the header size is constant and
known, that can be used as a weak substitute. This has additional
caveats wrt unexpected traffic for which payload must be host visible
(e.g., ICMP).

> OTOH isn't the kernel going to need to run code before
> the packet is actually sent and just after it is received?
> So all you might gain is a bit of latency?
> And a bit less utilisation of host memory??
> But if your system is really limited by cpu-memory bandwidth
> you need more cache :-)
>
>
> So how much benefit is there over efficient use of host
> memory bounce buffers??

Among other things, on a PCIe tree this makes it possible to load up
machines with many NICs + GPUs.
