Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143EF92DCC1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 01:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858810E2B6;
	Wed, 10 Jul 2024 23:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YHKtiS2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57D10E2B6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 23:42:17 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6b613921035so2081436d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720654936; x=1721259736;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
 b=YHKtiS2EJao1Lw2XDbX2Dn09aVP1uMT1iX7/GAaOFXga0x1fSCb7z52jMRbTxcMcEF
 Oo/56w7iE64H9JcKfgvNPRelV1/FcYCRqZEQCNtYi1i9T+yjLW8ZY8HilnX1vCrlRJ68
 uGONt6lYRs6GijMB4LzgH18rUq+GydZc/Fr+5uTj6encSTjth9Yf/H3WF9o0RJcw7hOC
 ynxQS/7V7+h0G7fW72ykElCFAVWlmLhjfSbHwPiB5/RZigd9N62bW1LodH29UEZbMV+3
 V/ny0boV3jLoaD+aKuDmvDra0f8gAFjgnzYLlV8vDboRz4kzGdH61It75IA9mE2/cErj
 U+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720654936; x=1721259736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
 b=lQoZGSiHxdOYl0DUOstdMcyQXUVPIZsdArTAO4Cedtuoi0GiAvQSStY5uAYfMxdBWY
 +XetJmM9+HGmbWfnd6Ha5Et6dXw/61H0Uos7wViy8YxJmpeWLipS+K1dJdzLfpNY8p/3
 +T6SjIKfZHFpdk2/4t0Ezzfl2JkbUFQNULDzAYNx79OUd+zj+tl5k/0Y4UmqOV3FN4Tb
 7t1+VYat2Po6IM5iG+MScilT+jsVe4oMxNQEcFOJr9luv9Nu1Jn5SLlo/1+3OXPfOsVo
 Pbz6RqQhmM/V9RqatUtSCxR/uVbN0QcI4yDVWB/aREer2A7DoyUao150R/rPR6gnxHWl
 Ixkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7zIiiuDHSpj6EQnrcZYuWPr52vJoYMs9iWNKjCBGMFUnV1AagFQ4Vdetx3onoRUUKbVEwq6BkrbqOJ3xy4FJh5fYx+eE7GIPvt8OiGg15
X-Gm-Message-State: AOJu0YyoqEBiipWJXBU9e2YRDy5DNrGF3qurG3LX5xHqIUkxGe+BnLBM
 vv9/tQojLAQastgTnyAsRXNH3Youi42ojz+3Q/nSZChr+V3ZBiMgRB2kVuFxra4yFQSsim+98Ot
 ryCNqrducpCPcPR0vT8MpTrygDw5DAFJ43MUX
X-Google-Smtp-Source: AGHT+IGOLOQ6K3/3da49V2eHyCz+KQjRCyIEiAYnB4b8F1iCu2D4bkJxhlzGFfxvSjmRGC6gzv7EI1OWCLflWXtCr4A=
X-Received: by 2002:a05:6214:20e2:b0:6b5:9c9c:7baf with SMTP id
 6a1803df08f44-6b61bca896amr97392016d6.23.1720654936406; Wed, 10 Jul 2024
 16:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com>
 <20240710094900.0f808684@kernel.org>
In-Reply-To: <20240710094900.0f808684@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 10 Jul 2024 16:42:04 -0700
Message-ID: <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
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
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
 Matthew Wilcox <willy@infradead.org>
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

On Wed, Jul 10, 2024 at 9:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 00:17:38 +0000 Mina Almasry wrote:
> > +static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
> > +{
> > +     return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
> > +}
> > +
> > +static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp_magic;
> > +}
> > +
> > +static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long=
 pp_magic)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic |=3D pp_magic;
> > +}
> > +
> > +static inline void netmem_clear_pp_magic(netmem_ref netmem)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic =3D 0;
> > +}
> > +
> > +static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp;
> > +}
> > +
> > +static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *=
pool)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > +}
>
> Why is all this stuff in the main header? It's really low level.
> Please put helpers which are only used by the core in a header
> under net/core/, like net/core/dev.h

Sorry none of those are only used by net/core/*. Pretty much all of
these are used by include/net/page_pool/helpers.h, and some have
callers in net/core/devmem.c or net/core/skbuff.c

Would you like me to move these pp specific looking ones to
include/net/page_pool/netmem.h or something similar?

--=20
Thanks,
Mina
