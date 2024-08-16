Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613B954B71
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326CD10E780;
	Fri, 16 Aug 2024 13:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="e/DyGMXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E2B10E780
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 13:56:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-428fb103724so16208065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723816611; x=1724421411;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXX2C3wnh7+8WNV/qSncynwi6/HDTD/vyOk/QMV0TUQ=;
 b=e/DyGMXAp8f5QH/BMz98lLEo4qBnu8+xnPP117fxq+3kSslMioAP60lfXj++wryJHC
 Nh8lbYwIo51dL5Q2iSTDXZBqWE5tZdnVfoV1/mg5M5LLm/JBKMN4hrwcfxSlA0/m3feT
 78Z4bhsx5EGJIFAjXW3ePJvTqBNGiOE4mnRrh5DqJUUFhsQwlmctV1MRctWcsNGCuIAD
 jkTdGa9DWhrq/SJdDptrgrokrReu+k5S3XAgdfbS9jrdaoB7LnPNYHSXmrCdYZU2wYsz
 2yXG9GLxpucgdsST+xjlEC895KWPmae330F4KbDPTlRBOzYgQ8/xE/f2S6qwn63X6toZ
 7azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723816611; x=1724421411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXX2C3wnh7+8WNV/qSncynwi6/HDTD/vyOk/QMV0TUQ=;
 b=taOXdJY7hQIsWSRA99lCKFVXvZpjl3fXtVdrAIVjz47/ZynO2AV3OaEfRIc3sNz99A
 gtYrDgb9GqXuTjpFYoUfpYm32IFP79PWNtRx9o+kPJTCc/c29LRESNwOuHYEe9rlzBvN
 q4wSzI7tE324qeYjaoE5cPZbtgJ7UQZ+jAE9bg47fA79f5LV7VnDhDmLH06xpD4ZrodM
 OjNRQKBXBmkmYdlsfVOduXvJ1y16sPfpteThHWm4cnSY3u36T9a8F2u6L1Vi91qfbBos
 TOKhcXV5naPv/xEPA9/1qqNdX8RILEEkW6L4Ro/4wLWvHBXReD5pKXD1yA6kt60aAeSl
 tw/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQxLzFTDHQVtjWih0Mi7+02RD0QvScHTTRepEVP9SKiONSDg3eo0IgP4hFdsK5zOpvlRD0qZy+7ppabqBdFDCJ8ho1Fjzyw5Z9UkUpjU8+
X-Gm-Message-State: AOJu0Yy/k/pGMllyKfUDJ2xOC+vWCCLm341EmL4RzzBTN9fCYK6H1WTn
 BWevAvg5FDldulITdxsSD226tXPdQ9YS7j907PGp9sY+7oP6x4hH3KxHcs0dTzzYEPQPXzWel4E
 XBi+ZHixypgvgQMbErwSI8qdBsgNz6bH1sG5U
X-Google-Smtp-Source: AGHT+IE0JOrXVLQSixhP01cdcARFbW0ccbM6G+qKTpkPzMcItcOgty9rR4OVVmPUNtu/xY88xZ5p9Oo2vXeH/2ggoXM=
X-Received: by 2002:adf:fecd:0:b0:366:f455:e7c1 with SMTP id
 ffacd0b85a97d-37194c3390amr2137247f8f.27.1723816610994; Fri, 16 Aug 2024
 06:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com>
 <20240815174852.48bbfccf@kernel.org>
In-Reply-To: <20240815174852.48bbfccf@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 Aug 2024 09:56:36 -0400
Message-ID: <CAHS8izN0Wb7isGbhO+cvYNfG+v2bsvvfy7P0cSsMD7USfd+4bQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Thu, Aug 15, 2024 at 8:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 13 Aug 2024 21:13:05 +0000 Mina Almasry wrote:
> > +int dev_get_max_mp_channel(const struct net_device *dev)
> > +{
> > +     int i, max =3D -1;
>
> I presume the bug from yesterday is self evident once reported? :)
>

Yes, my apologies. The int return value from this function was being
implicitly cast to unsigned in the check I think, and that failed the
check.

My test didn't catch that due to a test environment issue. I had 2
ethtools installed by accident on the machine, and the test was
invoking the wrong one. I think I have that ironed out now.

> > +     ASSERT_RTNL();
> > +
> > +     for (i =3D 0; i < dev->real_num_rx_queues; i++)
> > +             if (dev->_rx[i].mp_params.mp_priv)
> > +                     /* The number of queues is the idx plus 1. */
> > +                     max =3D i + 1;
>
> The +1 is odd. The function as it stands reports min channel count.
> Not max_mp_channel, if you ask me. And if you renamed it, you don't
> have to use -1 as "not installed".
>

Will do.

--
Thanks,
Mina
