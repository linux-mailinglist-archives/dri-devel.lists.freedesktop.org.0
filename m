Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F8923A2D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BF710E19B;
	Tue,  2 Jul 2024 09:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lUhxLnIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A71610E197
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:34:05 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7021702f3f1so1177178a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719912844; x=1720517644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWXvodTV40xpsQgD046diOP7NF2BEo3aGKT0Hy04vKs=;
 b=lUhxLnIC8Pg3rZwiEaC311zUTWtc0AtD26ds2ZVjaB0wDaIUH11uKxThfpUEym0nyU
 y9v9JoZ8KyAyUgST0zGYNtbMq6CJuHKwpG1ueU/h+qKIWEziiNftvptIPTD3/BnuyqCt
 4VNWZv7apJCi64e+IFValBKL8uimTwsGaDpmtR/dERFwtcYUkUDpizq45wmVQyGIi5lP
 RFji+yY089elTwCISQchOQSKoDTiDiFHZ3NFgETmZgZHsukXzqycI5/JGp6Ym9x/jaFo
 ueQ8wjkC6BVmBGIQRc0FSbwgmZrj/mXah7ibByBmoSxyzGXMSNeeI//ej3v22CP+kn5k
 YagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719912844; x=1720517644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWXvodTV40xpsQgD046diOP7NF2BEo3aGKT0Hy04vKs=;
 b=fEKMcQRLpKbFKNPaJZxjWWWzv0gKDPMpnaUw77J0MENPt06qGhreK0yxqx2H1+uUPO
 PHiA4RE129GH9LMa4t2T87PnwhP1IImXLnFxm69Tw4dWzaP1540vxNAi+crUgjT+s9b/
 KnLUxsKVqkUy5u1dWH3citjSoBUrh3QFx1MakOkyEkJnOqK5qqJxv7+e/HEXzH6Wc2Z8
 pgy/IZ/nxMsZyLpwTR/xNIWc+FToN3ZilTJsIVkszyj9+9sucTX8OMeTgx/RWJwnjJZ9
 7hN8J4J7aEIN1fxzttq7pKBj3LtrvJcH4bZMDwxa2tSaHko3TAbOqiU7rze3L+dlTUTX
 pm+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNqJ0lIe4COUUCwLy1XznC3L2eh7dIkW4GfRFaFI+oVeIpk3tIJV9Qn1mVE2uAXdE5l65W2du+o7ezDzaYMSj3y94PN0kmlCnXHwx/t7O3
X-Gm-Message-State: AOJu0Yyr/iSYLDqSaibdUIpqMD36Pz0we8y6dPQM4Qzr1EFdfpgWmr/G
 rSBKJaDR/bMlO/wTyqb+EjpEh9K+rn6HBVbICpJ87wBGJzcCsuGWeGXOeGlWVpuO4TALS0IPQcF
 EWX9mbc2EY0q3cxw11gzBtD1p/Ts=
X-Google-Smtp-Source: AGHT+IEDzJCkSxic9thzD1A+qXwSy94/OFeuEZqEmxDLENKBg+0OkSwbEdt7g8VxaiGVVFbl4hnPJFDds9/ibJSVDwQ=
X-Received: by 2002:a05:6870:56ab:b0:254:aae8:d822 with SMTP id
 586e51a60fabf-25db3432ec4mr7759858fac.26.1719912844128; Tue, 02 Jul 2024
 02:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-3-almasrymina@google.com> <m27ce9cris.fsf@gmail.com>
 <CAHS8izNM8TjJ1DU+7gzq-0kH=tVeM6j-QsaKk=2FHNDF6RLwnA@mail.gmail.com>
In-Reply-To: <CAHS8izNM8TjJ1DU+7gzq-0kH=tVeM6j-QsaKk=2FHNDF6RLwnA@mail.gmail.com>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Tue, 2 Jul 2024 10:33:52 +0100
Message-ID: <CAD4GDZznS=0xG+ms6bLKSwQFNTqxSqi8fdoNM97ymwcnqX3yhg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 02/14] net: netdev netlink api to bind
 dma-buf to a net device
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Stanislav Fomichev <sdf@google.com>
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

On Mon, 1 Jul 2024 at 20:05, Mina Almasry <almasrymina@google.com> wrote:
>
> On Fri, Jun 28, 2024 at 3:10=E2=80=AFAM Donald Hunter <donald.hunter@gmai=
l.com> wrote:
> >
> > Mina Almasry <almasrymina@google.com> writes:
> > > +  -
> > > +    name: bind-dmabuf
> > > +    attributes:
> > > +      -
> > > +        name: ifindex
> > > +        doc: netdev ifindex to bind the dma-buf to.
> >
> > Minor nit:
> >
> > The series uses a mix of dmabuf and dma-buf but the doc additions
> > (devmem.rst) consistently uses dmabuf. I think it would be helpful to b=
e
> > consistent here and say 'devmem dmabuf' in the docstring to highlight
> > whos dmabuf it is and keep the generated netdev docs in alignment.
>
> To be honest, even the dmabuf docs mixes 'dma-buf' and 'dmabuf', to my ey=
e:
>
> https://docs.kernel.org/driver-api/dma-buf.html
>
> I can edit these docs I'm adding so these are consistent.
>
> But on 'devmem dmabuf', not sure to be honest. Technically all dmabufs
> are supported, even non-devmem ones. I'm not sure non-devmem dmabufs
> are common at all, the only example I can think of is udmabuf whose
> primary user is qemu and testing, so it's somewhat implied that the
> dmabuf is devmem, and even if it isn't, it would be supported. I
> prefer to keep the docs saying just 'dmabuf' as technically all are
> supported. Maybe I should add a note about this somewhere in the
> dedicated docs.

That's a fair point. If you could mention it in the docs, that would be gre=
at.

Thanks,
Donald.
