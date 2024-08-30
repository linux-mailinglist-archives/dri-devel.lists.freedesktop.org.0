Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A75965707
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 07:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C6010E1BD;
	Fri, 30 Aug 2024 05:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0DTuw5v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49E10E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 05:41:32 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-45029af1408so99681cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 22:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724996491; x=1725601291;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGeAe2VvLt867O6PJvkuLBlyvjINITixvnm768ff9FY=;
 b=0DTuw5v5gd7fMmlm41xre8r6bKO2Z5hGsnSslBj77v7bUMzS7cuPaaY5tjEzwFOboj
 uUGtV0Z6y82Sj3nnc9yU7csWB+jvxuxayIUJmIy4y+Mp7D9v5COUahSArDZRWk3lXmPd
 gH61LSYVyq9I9eJ6NGebyq6ZIwgjZKZaG/Cf8m0hj4aJ7/Yni+Ep8pnAuB9LbvrgW1r4
 gpnNIPjHtCyoqxdMMHFPJQOkvrIKuDDijw9Qu7Hzmd3OB9EwtjsOQZ27bTiGYkG0Emva
 qJmQyijoQIhtSivIe6esSRQa69gwtlg5tyOTw6mos9UwRIwanAWPfa4bnMyK+eEeUgu1
 k38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724996491; x=1725601291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGeAe2VvLt867O6PJvkuLBlyvjINITixvnm768ff9FY=;
 b=wK0rsnRDTXXtQwzwyOcpuX+E16fCIpnFwLZ229b/TobYB97eVUFp0ewPkgHPTBNFSD
 IQBZxsuk3/Wj2bDKBFD6fvePGcOcoIIQpLlHOiwwtp7OlHztBecWUCYOyCnNABocVvHR
 n1sIodw9qxj1jXkWfFVtFv9+40+RE7xmjSHMMaxbbFSmO89EwgvBb8Wq9/6bbPf+z6xO
 AQtv06ybqRhvf+DRiJgARo/yhCU92KdKbiL311NexLVAp4Dm+X8c4rF6mInfAdCKrSJE
 I6eO5ZV2wynpNMhFEGHF+t738iWoDsP96TRBlQDh0q5QTDBDy1JOxbZWi/6p1xvodRl/
 5vAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUps7QCXVBB8QL3pcCQSvoED32K0FP7F6s2wABFJB9M+McXgfqfqudYOiVpsDCWU4dnw0dFiRGtlVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz82kJpQ/NAMMD86iJbmdiwFP6PG1jl+r/ZNmsQ7Pet1MCvHT+I
 mZtNy3805NYPjZUV/PepacI+geolWAIwf68CF3gd3pjK/43JEPTB3cogZHMlkRZkPeCXRHMgq0X
 Abmz6DBsMz61ogFw5tshihOSOoej44NHCbvPL
X-Google-Smtp-Source: AGHT+IFJ5dSdgHloFb1Pn4hIJolGDXJPa0ot44BqfHuQJyxrQVYkduwL7EuLxMx9wUjPI6We8cpcbnMVMN++0hRnKxw=
X-Received: by 2002:a05:622a:1a9a:b0:453:56e7:c62b with SMTP id
 d75a77b69052e-4568a9fb7edmr1721641cf.12.1724996491072; Thu, 29 Aug 2024
 22:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com>
 <20240829140824.555d016c@kernel.org>
 <e6df00ec-2c52-489e-a510-b69db7e9dbf9@linux.dev>
In-Reply-To: <e6df00ec-2c52-489e-a510-b69db7e9dbf9@linux.dev>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Aug 2024 22:41:17 -0700
Message-ID: <CAHS8izOy26r0uoWdASgmBCENNS6cDjHpkp+AHhOaKVkZR1LZqQ@mail.gmail.com>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to
 netdevice
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
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

On Thu, Aug 29, 2024 at 2:24=E2=80=AFPM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 29/08/2024 22:08, Jakub Kicinski wrote:
> > On Thu, 29 Aug 2024 06:01:16 +0000 Mina Almasry wrote:
> >> +    err =3D genlmsg_reply(rsp, info);
> >> +    if (err)
> >> +            goto err_unbind;
> >> +
> >>      return 0;
> >> +
> >> +err_unbind:
> >
> > rtnl_lock()
>
> There are 2 places with goto err_unbind, and one is under the lock,
> additional label (or rearrange of the last check) is needed..
>

Thank you, I think the right fix here is to reacquire rtnl_lock before
the `goto err_unbind;`, since err_unbind expects rtnl to be locked at
this point.

This could introduce a weird edge case where we drop rtnl_lock, then
find out genlmsg_reply failed, then reacquire rtnl_lock to do the
cleanup. I can't think of anything that would horribly break if we do
that, but I may be missing something. In theory we could race with a
dmabuf unbind call happening in parallel.

If we can't reacquire rtnl_lock to do the cleanup, I think I need to
revert back to doing genlmsg_reply inside of rtnl_lock, and dropping
the lock before we return from the function.

--=20
Thanks,
Mina
