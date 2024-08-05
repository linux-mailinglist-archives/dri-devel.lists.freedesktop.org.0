Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA441947F68
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A3510E24E;
	Mon,  5 Aug 2024 16:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="W1cGYE5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C85A10E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 16:34:10 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6b7a3773a95so61207096d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 09:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722875649; x=1723480449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
 b=W1cGYE5ciNoo/PmcaUGvjT74nWWjZtbErxOMFTPMOvSZaoiX/SPFAhijWDgYjeVhX+
 pkT95jtEoQW8A/9q4wyVdRS8kly6IteYHgHj0AxahY+25XFiCOKCXQLSMJvsMCq3OW5X
 yFO+8ejYth2sMVQfTqmasxvRXOrERIaBU856j5xy2mbQKKWDNbZ+oqPozqiSRPpxPozT
 n2DSXSUx4cq3DJJGjIHz3BOvIeTqGlFdINvXFzESyHCSUsI4rmmAs5xPk+iwqmJZlUIh
 bI+WldyWgp7Xbhl0QyJuguBZTJqgFXz0F1wKEkSq8nPdFXV8TRQ8ECAqUeVv0XPS84zY
 GuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722875649; x=1723480449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
 b=N/fseSaI8im1rSSJrySm933fyVQz6gXfhg3+RlIxvKQWKqRrusvaGpV+KEu1JglXZc
 C5bA7lcy501VFdmY3ZjLSZet8NgIk1aN3roakAm9znwGTTaVdT1dwvnUaIZycU9zrRGs
 6eK2r133YgurkDgGN41nnf/4kTKTOmV3C7qeyS75An3W4W2vNjAvzeIfZai/qVids/ed
 iq0ws+OHzjjwkkqa00MymihZKdV+JVozQvRA8/ZLivVRqvsndgH9qprD8gt+M57wsqdv
 kjl1jNQXZuTpyEjU3KXSErnFLA1xvu1JLMOI/xd/8z3m48JTZAbB2YOx2TIGp64xr9t5
 qLUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULhDbQIAgVfXtiWrZNGe5OFDlztKu1p5tcwwNtgFz6fA5LHnpTFzwIZHPf2DiyfslWMRKSdTuY9xk3LopG+8GALQMAi6XC/zwO5rjfagJv
X-Gm-Message-State: AOJu0YzgNLoMGVBpuqUJnoDimmpAXk3NsXdG35zJ5FyikjL65NOaDR8p
 qjm8NeDuU0rJG7m56e5AUetrQE3wBW0LSDoQD06j57P5IDhW+LSe62lP/qRlBasBL5IpjSKr3hN
 s7ff/VALt+beBsT/aWS2Pk1ndyHdlJpZ6Y+WZ
X-Google-Smtp-Source: AGHT+IE3X2dzKDTfvW579W1ONWZvzHmSuPdaFYmL6fjjzD5I45yXHVQPoF1XfHnvXWK/VzgEqMK+gXEJqks0i1Xyhdk=
X-Received: by 2002:a05:6214:4412:b0:6b5:7e97:7151 with SMTP id
 6a1803df08f44-6bb98345fa9mr131458736d6.17.1722875648824; Mon, 05 Aug 2024
 09:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240730022623.98909-4-almasrymina@google.com>
 <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
In-Reply-To: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Aug 2024 12:33:55 -0400
Message-ID: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to
 netdevice
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
 Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Jakub Kicinski <kuba@kernel.org>, 
 "James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Jeroen de Borst <jeroendb@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
 Paolo Abeni <pabeni@redhat.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shailend Chand <shailend@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Steffen Klassert <steffen.klassert@secunet.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>
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

On Tue, Jul 30, 2024 at 4:38=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/include/net/devmem.h
> > @@ -0,0 +1,115 @@
> =E2=80=A6
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> =E2=80=A6
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+=
define+a+reserved+identifier
>

I was gonna apply this change, but I ack'd existing files and I find
that all of them include leading underscores, including some very
recently added files like net/core/page_pool_priv.h.

I would prefer to stick to existing conventions if that's OK, unless
there is widespread agreement to the contrary.

--=20
Thanks,
Mina
