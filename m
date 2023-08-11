Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A572E778529
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 03:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FDC10E067;
	Fri, 11 Aug 2023 01:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7F610E067
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 01:56:15 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-56c7f47ec42so1220723eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691718974; x=1692323774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqDMd21x5Nw96iPHGkI0RJ5xZ0W3r4jhzlUa6V573CQ=;
 b=AhQxtYBJrsxK+7NKZqT1FFzg07DV6Zl5qR1axM8dEeSnftLyB5X8SQrgmunzDbsoxB
 pt548p3xvkZ6bcQjKoWZGfPB2ekRQzpLlzBI+M+7r1fVNQYFoyV5sSyYkjAJQ7GaKX5+
 pVD8pOnJHmyww1Ebm4vq5NncPbD1aW8Nrnc3wrGY9HhAyikAOsPICZSManPP7feVArVE
 wZSu/P+nN0mqXH//pE2oHM+WWTs/g/VDm2byxVIBz1BNhrVcdBk+6i1qUHwCFL4uVKf1
 qwqyN5yyxGefaBym1eGcyFLHKLxy3PNZ4A9Pq9V9LtSSRwZ6AZQT/crnbWx3X5ju4ncU
 b/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691718974; x=1692323774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqDMd21x5Nw96iPHGkI0RJ5xZ0W3r4jhzlUa6V573CQ=;
 b=G3vMDQs3eGoVYMDDcy/gfeksUb1GtC/NGnFGy9EaAonmXmbNfYOvGCIar9zL7i+z8O
 302LelNckGdj3KDhJUpXaDwPW5gV7a5Qm7ibjAPy1fvIB8texytebgM1UyesW3ZTbPj3
 am2FwmTj9x3QOOQ6Qop/mrx8rafGjmEgvCN6GGLVDRCJSGdudI7sMkd3V85XWsVQTOxd
 ccj6sqEF7A2/0SNrJODm3eUv8+tvtMxDcwW6m9d3s2feUEP8InJ0aGZCdmWoT9hrQ4Q9
 YORGYRczlSkp5gGIzhxe6sLiS1zT4jXv8B4j8KAOrQWwhGooAADcRnTNwm2OANEZSfqt
 J+5g==
X-Gm-Message-State: AOJu0YwCK1xVGVuO8TXd+ThEgCE2JmeQ7fkr+7ZmFBQlRNGd+XgD2Ojd
 7i9RKu3/sFGbJxn01bS90Hn3JMR6waeFgjhPcaCFbg==
X-Google-Smtp-Source: AGHT+IFuPSnhcOaqYFbMM/zHZKGGPqTcsm1m5KN1goTpSJR/hQoINBSAEckVNTY2vFQlBNO+tdeRz/rEkoJkrYGWj08=
X-Received: by 2002:a05:6358:949d:b0:132:d448:7b78 with SMTP id
 i29-20020a056358949d00b00132d4487b78mr817733rwb.27.1691718974376; Thu, 10 Aug
 2023 18:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
 <CAHS8izPrOcrJpE1ysCM7rwHhBMPvj0vQwzfOyVqdxsVux8oMww@mail.gmail.com>
 <ZNUzW3X3P0JvL4nI@ziepe.ca>
In-Reply-To: <ZNUzW3X3P0JvL4nI@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 10 Aug 2023 18:56:03 -0700
Message-ID: <CAHS8izOVJGJH5WF68OsRWFKJid1_huzzUK+hpKbLcL4pSOD1Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 stephen@networkplumber.org, Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 11:58=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Thu, Aug 10, 2023 at 11:44:53AM -0700, Mina Almasry wrote:
>
> > Someone will correct me if I'm wrong but I'm not sure netlink itself
> > will do (sufficient) access control. However I meant for the netlink
> > API to bind dma-bufs to be a CAP_NET_ADMIN API, and I forgot to add
> > this check in this proof-of-concept, sorry. I'll add a CAP_NET_ADMIN
> > check in netdev_bind_dmabuf_to_queue() in the next iteration.
>
> Can some other process that does not have the netlink fd manage to
> recv packets that were stored into the dmabuf?
>

The process needs to have the dma-buf fd to receive packets, and not
necessarily the netlink fd. It should be possible for:

1. a CAP_NET_ADMIN process to create a dma-buf, bind it using a
netlink fd, then share the dma-buf with another normal process that
receives packets on it.
2. a normal process to create a dma-buf, share it with a privileged
CAP_NET_ADMIN process that creates the binding via the netlink fd,
then the owner of the dma-buf can receive data on the dma-buf fd.
3. a CAP_NET_ADMIN creates the dma-buf and creates the binding itself
and receives data.

We in particular plan to use devmem TCP in the first mode, but this
detail is specific to us so I've largely neglected from describing it
in the cover letter. If our setup is interesting:
the CAP_NET_ADMIN process I describe in #1 is a 'tcpdevmem daemon'
which allocates the GPU memory, creates a dma-buf, creates an RX queue
binding, and shares the dma-buf with the ML application(s) running on
our instance. The ML application receives data on the dma-buf via
recvmsg().

The 'tcpdevmem daemon' takes care of the binding but also configures
RSS & flow steering. The dma-buf fd sharing happens over a unix domain
socket.

--=20
Thanks,
Mina
