Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70640923E8E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFAD10E219;
	Tue,  2 Jul 2024 13:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tK84neN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7E10E1AE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 13:14:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57d119fddd9so21810a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719926078; x=1720530878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcbSk1txeKGjtUgrI5TEa2OFa9eUbMFBvTxpismD3E0=;
 b=tK84neN2iOI2JUCF5w5XLg+GTyPXm3pbn7pLpDInOkTUpLd7sW2Pi2oVf4NonVffxg
 8evv/KhoH4kLvGFHgH//yb2RaGVjL1LDxwUQN+fm0P/BiuTeGoF1Dr9y4XsCt9wE56eK
 goUxiGDpH1piOT8Yc65MqDCv8/lVGZiU51XfWU6enz0m3T4TCy/0PKepUHkqtWzXOWxI
 r/1wd/Z/YgZzb8OMpyqgJJ9emIH+Q6ptbwbkZut4YgoR1qJebUz0IXnVQmITRIJyZcxt
 dafFg9t7Hbsqm/30ZWvt+nxwea9zUX4HKP4ijCcl+BnQTVCjVfKLXywhYVFdVwb+xvZn
 86XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719926078; x=1720530878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcbSk1txeKGjtUgrI5TEa2OFa9eUbMFBvTxpismD3E0=;
 b=QikQoTZrxQ2SVVajQUgidBEFSqLDtP4nusbzlJndREhN85t7LoxTXZwpgmXv2jvkhJ
 PrfYXYomKMrzoUVUsSZwQh2QjYoHGY0BHuSJW2yrZebVMSxXyRmOpjy174jGC3S2mxqE
 QOc2QXbjstevOklTx4pWICj0r10me+UfjuhP/CzLk7uWrfmPjfIZju4J8ApYJNVG/UFa
 Fyf+cS0UZNFzpnRngLKGaBvzW9fExyjDg3DYpOpZJya9sA4ieThL1ytHQ2Ttk3xHzMAN
 ascr9Zw2zrVV9+TLUqM2QWIZDxuThqV0cVO6MgjBTtu/4pMy6FSHFuir9TNBmb7xfGuG
 7uag==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Zm5r6Ir2a/0FHsPfhHwoJWL/w9fFAWqJFT8ksw2aL2mZrofykpTtuUwbfUWLtr1Id8LgYvJE7SHUj+xTZrJHstaG9gdVKT3wk4T+5M7j
X-Gm-Message-State: AOJu0YwxlSWSabkWWrDGpB+F4kK5T459Gi71cud4XYdGXaQuvoTSrzm/
 O+yWMMqXyRIR2Bgl3z6NK7OKLnIbApXkneqi0Bgks7kq46VyNmwfQ/xksfvgvkv0GVFOhb8pVa6
 2Nue5Cq2Nqipt3SdeoclR0/BAPZDfiffw/CqZ
X-Google-Smtp-Source: AGHT+IERKkCVpVomNRYr8KNFI5e5JCBWRQ7HMLMgDv1aOW++vU+Fu31VZ6RrRqWEtIXBu1Sq7l+LYKSRxYEU9Pq/83U=
X-Received: by 2002:a50:9308:0:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-5872f79a720mr634350a12.6.1719926077342; Tue, 02 Jul 2024
 06:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-9-almasrymina@google.com>
In-Reply-To: <20240628003253.1694510-9-almasrymina@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Jul 2024 15:14:22 +0200
Message-ID: <CANn89iJ1ys-eNyM3BGQ1PuLKsbo+Kcj78wfoAtaFPygQdYawkg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 08/14] net: support non paged skb frags
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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
 Praveen Kaligineedi <pkaligineedi@google.com>
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

On Fri, Jun 28, 2024 at 2:33=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Make skb_frag_page() fail in the case where the frag is not backed
> by a page, and fix its relevant callers to handle this case.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
