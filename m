Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8B96C260
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 17:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F3C10E7F4;
	Wed,  4 Sep 2024 15:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uYNB19fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5B10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 15:30:01 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8695cc91c8so697455166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725463800; x=1726068600;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLhhMPuctYpfIPSQyulh9sZF48oPEhyg3gJ/+naRY0c=;
 b=uYNB19fx/BqHlJqPdHAUGkG88JwM6rI62Y9W6QhViorcmWeiHAoHioGIHNTG3mTn2F
 lORBXhKOc0Xf4zWdS5F7NnWhgE+t9YaBeIFq7mIEdQT2ufrYVO4j9k0mPrvi+/XfAMnP
 rW7WwCX4naXvM80FAzw7IVjeA6jVZgFRs9fcV6QLe1Gz7jPHInzSqnv9Aj43ExMefbz3
 CIGXcnDZRr7SO+cEIqxgOV6rCMCcNxTOibJfiNrg3gWemrssb7pGM7w9QfWdaazth9gE
 It0ecIyet36tZUVu3kJCxJ18Rf0av+gMJXcWERA3IE/wBphRekcckB/GZyF4oW5jpqQN
 ZtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725463800; x=1726068600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLhhMPuctYpfIPSQyulh9sZF48oPEhyg3gJ/+naRY0c=;
 b=BH/BBRJde1+f7sw6BdhBAjG3ZVkgDZDDa6HNeWEaKdEgFBHvgslFGpUAdUBbcjvpZu
 /7xVkqMf5SEqeg7RtfNr85++JGjWMNG5msbBxx7AlVEZp5jRjLFUdHypjXVh0/tHC4u2
 GwBhPCtVJPTxkBL9RF3d5PcSd2Em8wQ71LyLt1J4o2cAoV56Cye4+TGAvwbKeg/WZBEJ
 IXG/dtoortFQ1Ppl/TCV3oktQjvJXaTli7TnJM0uBQA9mF42KOhAAisoVTOUtqASbU1W
 S0ulGwWyQTvOWQWgPH3IcP6J2SsWAMZdWAKfnGarANXzGllhyokX0+6Ll635ctM2P7+B
 CF2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJcuJER/2R+0YLgY0CnSA0hK6DiNQ51FncAdwhpsnzX7Bh3WI4w/tdU/ITmVWTOHilS4YaPpug8OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ5FebJgfW8Z91Qh2yzoiqhZbaX7w+uUAQv7fGVAnXdhZOPWMZ
 ogcbL4AtQ1bStjgIw1bWDbUxu1sRuK+G6Jxm6dMLQJ7BQXTcZ1TkiAnFVzsFUjrHBE4gIz17oWO
 PI+UKShuU621dscq+gyI5LZ2xjtljFEzHhMr5
X-Google-Smtp-Source: AGHT+IFg6rOi18H1toa3LkpzEJnnBMcFXZAacqahmY1gZmTK9rv5lw/xaEow9UneXHrr7DZX8isa3vZhOIIu0S2ULN0=
X-Received: by 2002:a17:906:8903:b0:a8a:43bd:a9e8 with SMTP id
 a640c23a62f3a-a8a43bdabe5mr117170866b.65.1725463799009; Wed, 04 Sep 2024
 08:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240831004313.3713467-1-almasrymina@google.com>
 <20240831004313.3713467-9-almasrymina@google.com>
 <20240903144011.3e7135f9@kernel.org>
 <CAHS8izPN8cDVhAzdedr7zb9zmDaiOMqkaDqB07QwVKKEJ62HzQ@mail.gmail.com>
In-Reply-To: <CAHS8izPN8cDVhAzdedr7zb9zmDaiOMqkaDqB07QwVKKEJ62HzQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 4 Sep 2024 17:29:44 +0200
Message-ID: <CANn89i+iXXUjOJCOF1nodjVH4eX8P-B26Kg+Uu-iM2_Hc=5D5g@mail.gmail.com>
Subject: Re: [PATCH net-next v24 08/13] net: add support for skbs with
 unreadable frags
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

On Wed, Sep 4, 2024 at 5:18=E2=80=AFPM Mina Almasry <almasrymina@google.com=
> wrote:
>
> On Tue, Sep 3, 2024 at 2:40=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Sat, 31 Aug 2024 00:43:08 +0000 Mina Almasry wrote:
> > >  static inline bool tcp_skb_can_collapse_to(const struct sk_buff *skb=
)
> > >  {
> > > -     return likely(!TCP_SKB_CB(skb)->eor);
> > > +     return likely(!TCP_SKB_CB(skb)->eor && skb_frags_readable(skb))=
;
> >
> > Do you remember why this is here?
>
> Yeah, to be honest, when I first implemented some of these checks I
> erred on the side of caution, and added checks around anything that
> looked concerning, some of these unnecessary checks got removed, but
> looks like this one didn't.
>
> > Both for Rx and Tx what should matter
> > is whether the "readability" matches, right? We can merge two unreadabl=
e
> > messages.
>
> Yes, you're right, only 'readability matches' should be the criteria
> here. `tcp_skb_can_collapse` already checks readability is matching
> correctly, so no issue there. The `tcp_skb_can_collapse_to` check
> you're commenting on here looks unnecessary. I will remove it and run
> that through some testing.
>
> As an aside, it looks to me like that tcp_skb_can_collapse_to
> callsites don't seem to be doing any collapsing. Unless I misread the
> code. It looks like tcp_skb_can_collapse_to is used as an eor check. I
> can rename the function to tcp_skb_is_eor() or something if that makes
> sense (in a separate patch). I think the name of the function confused
> me slightly and made me think I need to do a readability check.
>

Please do not use tcp_skb_is_eor()

tcp_skb_can_collapse_to() could be renamed to tcp_skb_can_aggregate_to()
or tcp_skb_can_append_to(), but EOR would not help at all.
