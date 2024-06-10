Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B372902165
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC210E33F;
	Mon, 10 Jun 2024 12:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="n8lSgNbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B437910E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:16:29 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-627ea4e0becso45985687b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718021788; x=1718626588; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sLBhiGTWQPkGSzXF44ZdseZQqm/Ay7CrbOb4xYeFmxw=;
 b=n8lSgNbZTtSL7Uv/u/vSOTmOis+D3S6Zv0d/Ajg5aMarEu8BE85ywLgMVQe+cMmMVL
 E1O4aEsXBQAxFbBOSdlhYppxtEWsUsfKJb06vibCcBrTLr9tbeocs9Bf5Sk2rhO/K5Tu
 jl9MgGZC6LtnfOvF79+/KN3CG7EgzxPlDpBBSUV06Fdbqq4OCWsrlHGi827m8v+aGBJL
 RCNoMDv2WsrE5HG33++psO4CCNBF0WFyRil7+bch1R529PNLKbMk0fJCJQTU0UVQMMGL
 hTd3eqcanK4PIUvAe+6ugSQ1ui1Jo/jaQ4X1c5mBEHfB1mPG0CRDqDWfP8xp4rTNlFuT
 Hr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718021788; x=1718626588;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLBhiGTWQPkGSzXF44ZdseZQqm/Ay7CrbOb4xYeFmxw=;
 b=RuncQfDae2W4ljrDRLmvICV1EIDElXJLLTlpvFX4iluZ2l0rTEsWvc3XtITuyXkvwQ
 1ByLQzXufFXpP8H2mn72S0Bdtns+rrQEJgS8jWISD6f5N+u0cIrOUCfOFsXL+rtgQeIa
 rFletE84DwCn3AEjcXKXpUUaGSHUXE64+H052VB2iQNjYH8Y1Bqijbzvl8qUGu3Er5ed
 iX5jf934rqu4EGHFCsfyJ+o7zfzEEdSNmNUQUtK90a7sPOZTxpb8H2M1FCfWW/HqV8O8
 VXVGsIc+DcRkpTS1M3tmb7JtIeov6l/oPXwmMdO/6Vp8GI9MBUhRP6dwxuNI6DVK2Kmm
 Nniw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4vYNj21HJ8lklSW5cBiV04YU079/ZZK2+HPNPulWxnDRSuFg+e8zTN05VvyniB2zUEV27Jie0GGhH1LIcqiMZglV+GVqFP8hOslfl2sWo
X-Gm-Message-State: AOJu0YySpmQUuJWPyvrwVuc+FrfQM/OMRz6Z6ZIwDOiwR2nOx9z37Lmw
 tCFb9ctrw7I3sXMClVsu6VNnFXRXXxkoasOIo3rS/GHSnIuMV8lzpT1hqyMemA0=
X-Google-Smtp-Source: AGHT+IHKUHpBEHdEL4hUatHn2U1DbF50V0YQ7tp+HSd+jRZUj7MSdsNfIMBQ/mHVI5dhq2ZCcmRiZw==
X-Received: by 2002:a81:6fd5:0:b0:627:dca5:407b with SMTP id
 00721157ae682-62cd55c0a56mr87073917b3.13.1718021786857; 
 Mon, 10 Jun 2024 05:16:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b04f6213dfsm45360126d6.23.2024.06.10.05.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 05:16:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sGdwn-00Di9E-NN;
 Mon, 10 Jun 2024 09:16:25 -0300
Date: Mon, 10 Jun 2024 09:16:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Wei <dw@davidwei.uk>, David Ahern <dsahern@kernel.org>,
 Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240610121625.GI791043@ziepe.ca>
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
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

On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
> On 6/10/24 01:37, David Wei wrote:
> > On 2024-06-07 17:52, Jason Gunthorpe wrote:
> > > IMHO it seems to compose poorly if you can only use the io_uring
> > > lifecycle model with io_uring registered memory, and not with DMABUF
> > > memory registered through Mina's mechanism.
> > 
> > By this, do you mean io_uring must be exclusively used to use this
> > feature?
> > 
> > And you'd rather see the two decoupled, so userspace can register w/ say
> > dmabuf then pass it to io_uring?
> 
> Personally, I have no clue what Jason means. You can just as
> well say that it's poorly composable that write(2) to a disk
> cannot post a completion into a XDP ring, or a netlink socket,
> or io_uring's main completion queue, or name any other API.

There is no reason you shouldn't be able to use your fast io_uring
completion and lifecycle flow with DMABUF backed memory. Those are not
widly different things and there is good reason they should work
together.

Pretending they are totally different just because two different
people wrote them is a very siloed view.

> The devmem TCP callback can implement it in a way feasible to
> the project, but it cannot directly post events to an unrelated
> API like io_uring. And devmem attaches buffers to a socket,
> for which a ring for returning buffers might even be a nuisance.

If you can't compose your io_uring completion mechanism with a DMABUF
provided backing store then I think it needs more work.

Jason
