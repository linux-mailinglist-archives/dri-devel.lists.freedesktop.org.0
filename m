Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D008BEA2E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4110FDC6;
	Tue,  7 May 2024 17:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0y7PulYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E5010FDC6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:15:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51fea3031c3so4378158e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715102121; x=1715706921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMvfDOvPFL6UptO1Upug97aOGGLmrRd7m4cshxAtOPQ=;
 b=0y7PulYvLH1JeehM51QYPPK4zqIjZud0HKyZSiqhzEH+F89UosbHTpBDEEJnTpNS8a
 sGpyNjqcy4gTQQNsjBoh4r859hD2oBnVabB5CXAPnVo3Sw5cTX12G+UmG6jT4N3uiSUX
 58GVkM31iXvtvX+fJWHHryvihmS6ogqloobBfiv33+JvicltiKU+3goFBirGFd2/NM0j
 I1dcyzpfmZQatiWVUk0v0w+dzuRo+sMJTIaQNUJ/jrERs4n/dOuNGri4dfaWEeM0oXIl
 Jx3CTNPIz2fldGhv0cTqdUZP0ZLPfX5mgrW9V0LAUMDnSjJeN8iT+S6zBr3xAUKYFDCg
 Ud3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715102121; x=1715706921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMvfDOvPFL6UptO1Upug97aOGGLmrRd7m4cshxAtOPQ=;
 b=MCdZ9KNTw0h3joIceLGGgAMBkHnj/tt0xtHHFea6gnrxv/feSalaYb2ju2uek7mCaj
 506YADf5rY3dghUxd+hOchi6Bq8JL1axWSKpCBrDufmufVDFBkHpv5HIvPIW2wtgjbno
 ZiaHW4EGHGzDwMt+W5YYFDNHBhmn8MjBX5xl/O49ZuVOaSrfk7I0THcoBVrjILqXxx70
 jI3MIVWjXIHeH5gW5xJ1e++0gNUW3c6KJCa5bCwd4OFoJV3ZrrzLP1hwrCLmY2rEIXzF
 cSno9ATaRcY9i42Oc2UrDM1SdTvRsd+2YWPdB/VLlSbEUj2QBBeunl+p+1IgwW3poa7w
 kH3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXctRbJGYap8DHK8WxrCslZOYWJ84cbJ56U3PMqzQTjNiWAypfjRNLo1GXIktd2DB1XDl5XoSlVWx6/wl/9RXZkgdFgo14nAC+3KVeA/pkg
X-Gm-Message-State: AOJu0YwyIozwZqOd/wdLdVX0hktSbMGIC+FqnO65W9r3wg2kZR5wa2cx
 U9eE1HGqkjeqdVpd2BpJ/nGVdlilSy38T6P3Nb+BvzEBy0IDv7CrkQ9CQ1aibVHThAMvavjaqNM
 /CqUDBVpC1K7eaPAAFiM0pmFvtrQrMEVgjqWQ
X-Google-Smtp-Source: AGHT+IH8jTguB4ri/cRuFQ0IHVasVwe3SvRIiHk57+cBoV4oS/mWn0OvKI+w8EfgKRV7I77H/Y54420FE4KlaYtCWMA=
X-Received: by 2002:ac2:5dfb:0:b0:51f:36ed:ee43 with SMTP id
 2adb3069b0e04-5217c760288mr120513e87.31.1715102120263; Tue, 07 May 2024
 10:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <54b1bf11-0f9a-4e9e-9e5c-7d81e066fc7c@gmail.com>
In-Reply-To: <54b1bf11-0f9a-4e9e-9e5c-7d81e066fc7c@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 May 2024 10:15:08 -0700
Message-ID: <CAHS8izNL-phg3y9xiQbx7A2wQE3ZZKXiQA0oFW9mgj4ONk7GSw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, 
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>, 
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
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

On Tue, May 7, 2024 at 9:55=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 5/7/24 17:23, Christoph Hellwig wrote:
> > On Tue, May 07, 2024 at 01:18:57PM -0300, Jason Gunthorpe wrote:
> >> On Tue, May 07, 2024 at 05:05:12PM +0100, Pavel Begunkov wrote:
> >>>> even in tree if you give them enough rope, and they should not have
> >>>> that rope when the only sensible options are page/folio based kernel
> >>>> memory (incuding large/huge folios) and dmabuf.
> >>>
> >>> I believe there is at least one deep confusion here, considering you
> >>> previously mentioned Keith's pre-mapping patches. The "hooks" are not
> >>> that about in what format you pass memory, it's arguably the least
> >>> interesting part for page pool, more or less it'd circulate whatever
> >>> is given. It's more of how to have a better control over buffer lifet=
ime
> >>> and implement a buffer pool passing data to users and empty buffers
> >>> back.
> >>
> >> Isn't that more or less exactly what dmabuf is? Why do you need
> >> another almost dma-buf thing for another project?
> >
> > That's the exact point I've been making since the last round of
> > the series.  We don't need to reinvent dmabuf poorly in every
> > subsystem, but instead fix the odd parts in it and make it suitable
> > for everyone.
>
> Someone would need to elaborate how dma-buf is like that addition
> to page pool infra.

I think I understand what Jason is requesting here, and I'll take a
shot at elaborating. AFAICT what he's saying is technically feasible
and addresses the nack while giving you the uapi you want. It just
requires a bit (a lot?) of work on your end unfortunately.

CONFIG_UDMABUF takes in a memfd, converts it to a dmabuf, and returns
it to userspace. See udmabuf_create().

I think what Jason is saying here, is that you can write similar code
to udmabuf_creat() that takes in a io_uring memory region, and
converts it to a dmabuf inside the kernel.

I haven't looked at your series yet too closely (sorry!), but I assume
you currently have a netlink API that binds an io_uring memory region
to the NIC rx-queue page_pool, right? That netlink API would need to
be changed to:

1. Take in the io_uring memory.
2. Convert it to a dmabuf like udmabuf_create() does.
3. Bind the resulting dmabuf to the rx-queue page_pool.

There would be more changes needed vis-a-vis the clean up path and
lifetime management, but I think this is the general idea.

This would give you the uapi you want, while the page_pool never seen
non-dmabuf memory (addresses the nack, I think).


--=20
Thanks,
Mina
