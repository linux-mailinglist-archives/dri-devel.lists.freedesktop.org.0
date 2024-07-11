Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C892F07E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 22:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713D10EB9A;
	Thu, 11 Jul 2024 20:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ydYplClx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6751310EB9B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 20:57:17 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e03a8955ae3so1335870276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720731436; x=1721336236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR1w6TGwRPRKUblfK+cvVsJQzW84NzZB6wHL2Wt2c14=;
 b=ydYplClxMpEztE9PXK3E/S+XRAZKjaNVDdLL74DZXAdSxtE78FujBaS0MjvLJatybh
 Ckzd1ui07mj9XgXCaP++fRo6CvjUJXLW6Gh/8TWlh7oJH34LKksd244mfJe/2aeSUUiW
 /FWV1Ekh3FS2kYDwM6x8rlyXUdFwkTRw2jFdrMkSl7gvKJxCkMz3WzfRsTnrNTjXsG6D
 KPRJrpgQg5tt07g0Rnd4XXTIezRfYxazpKPZ3KJgUMBZdf/NzDNjc++jcAGKUV7pbpuc
 jEIWenoF3JNYaIZAQTfIxVEHeVBf6KxVzMteL94KsL+xb6QCoV3MyNUdylAwZcbwGHi+
 ih/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720731436; x=1721336236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR1w6TGwRPRKUblfK+cvVsJQzW84NzZB6wHL2Wt2c14=;
 b=PqHnE0fYSbo3TwJTbzYLdhxaTEaEGQml6LzX6X/+HkIk4t8HoyLlFQdSWAIVoZ56Vj
 pmt5DSpgpXjQ+XredbAuYOYqKzPaYbUKV4ApjBi9FmvwonysKHbJmQIoq2e4OqHl8A7X
 BxtBtjpb+3v09hsxD/IZoLzVvSOkjcTpq7WL8vBzfEFjoeph9y9dWwBi4SoKhq01H277
 deskckDD9KCq3uPDoN6kr549kvnrDByO0B2mk0Lvz/81wLVBgkfuX7h3jqBL+K7tjBuZ
 /uUhfMj9Tke1l0eiOTcm5C3zPXlq61bl4ftwz3u1KtF1oJAZcbzDXcMVEFNfTQcD5b+Y
 1CnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOUZzhcBMiEAsGE7EQaP735wjxXkkmCllZCb232ohEQ2cJqrjbT8X0WC0tv+w7vzIz0IMAPJSgqViztPEbkmVi0wdXqxUMHjHecoxIKIiX
X-Gm-Message-State: AOJu0YwfLRSD78o8xChOozj9xwEP699D6m7VBQEeP59LqbCIjOtkJknS
 RYlF342rRJVpzhZWo+tNxsmKa39ffvYPyXG2pJbptIJIoxfsobRTkh1LcxMYufwJUcxdidttlFI
 qacngLZ8vlwAczItDXqkjOghMT8efEOgaYjmF
X-Google-Smtp-Source: AGHT+IEYLltipW2y2jpNMjV5kpiHBN8xdsLzBdnyK43dhH65oHO3BC27aVEWQpPKMVw7hLbmYOjCnlcdqKg1G5wqhvg=
X-Received: by 2002:a25:d3cf:0:b0:dfb:c6a:643 with SMTP id
 3f1490d57ef6-e041b070a46mr11240607276.7.1720731436062; 
 Thu, 11 Jul 2024 13:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com>
 <20240710094900.0f808684@kernel.org>
 <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com>
 <20240710182322.667f0108@kernel.org>
In-Reply-To: <20240710182322.667f0108@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 11 Jul 2024 13:57:01 -0700
Message-ID: <CAHS8izNMsCHhJM4hf7pf2p98sp9-3gxL6o7sC6JQnqThxiWjYw@mail.gmail.com>
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

On Wed, Jul 10, 2024 at 6:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 16:42:04 -0700 Mina Almasry wrote:
> > > > +static inline void netmem_set_pp(netmem_ref netmem, struct page_po=
ol *pool)
> > > > +{
> > > > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > > > +}
> > >
> > > Why is all this stuff in the main header? It's really low level.
> > > Please put helpers which are only used by the core in a header
> > > under net/core/, like net/core/dev.h
> >
> > Sorry none of those are only used by net/core/*. Pretty much all of
> > these are used by include/net/page_pool/helpers.h, and some have
> > callers in net/core/devmem.c or net/core/skbuff.c
> >
> > Would you like me to move these pp specific looking ones to
> > include/net/page_pool/netmem.h or something similar?
>
> That's because some things already in helpers have no real business
> being there either. Why is page_pool_set_pp_info() in helpers.h?

OK, I looked into this a bit. It looks like I can trivially move
page_pool_set/clear_pp_info() to page_pool_priv.h, and that lets me
move out a few of these netmem helpers to a header under net/core.

However, to move more of these netmem helpers to a private header, I
think I need to move all the page pool dma helpers and reffing helpers
to a private header or the .c file, which I think will uninline them
as they're eventually called from drivers.

I had guessed the previous authors put those dma and ref helpers in
the .h file to inline them as they're used in fast paths. Do you think
the refactor and the uninling is desirable? Or should I just do with
the trivial moving of the page_pool_set/clear_pp_info() to the private
file?

--=20
Thanks,
Mina
