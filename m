Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A089CD3B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551B48914B;
	Mon,  8 Apr 2024 21:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5SQRql5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54DA10E22D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:34:29 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6ed627829e6so439602b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712590469; x=1713195269; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XzmG06Fco0ZTrSThkuHAMjjsKBRNcTmAqJu1Q2E5r5g=;
 b=l5SQRql5mpIsobGR++WspDiNnWgBTk5z0aBrvvcPlxRTka3UQ4Qyanc4YXZTWGMSFc
 QehymqTtXzFxgbpRgTjh15NSSV8SHHRRA7rOJVzLfckFVrifIjo3vZ1uYoXrabCuXRyx
 N+kTB/Kc4Pi7IdeeqFWuOWa6QpDhDAapfabEgsFV7X0N4qsvxczD5yAoJ4JDvwGaPziM
 D64Gxj5RTO2pvEr9QX17FtGFoYxD8n/0kIcfoy5Izj858PWSsde7oIUdojjS9vnX7ZIx
 G+bk2OjxalKmAWjZ5rMOdg7ER7fCJna6nRTLdZzvSxjaEfgSLe1lMKiUUwN5fSpOHu7V
 CEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712590469; x=1713195269;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XzmG06Fco0ZTrSThkuHAMjjsKBRNcTmAqJu1Q2E5r5g=;
 b=j5iRJCynTGGSflbEet7/lQ0EBAs8j54dud2VNriQoED6w0PckY06+ToAf8ycgeRCT4
 BaKmc9I/xY2Umoj5D9TjFzmHYIo+7G2k49QnbkcQ5CM1BjmB1gfamyC/28I2goNb3VEA
 KHWfP/8ejh/AdXRBH1lXmSj6oDp+hieYRoV0gq73B8kUODOGHj/yr5kQmPdFDniAdHLD
 3OQWOgruTNsq6e2iibn6PJSiUR/lw0cKHhSgzAuYT4+jl5nT5EFnwefdp7tKxKuHGm0W
 5UkzNKJTM3YdYrRRBgwpaMMaIS9/bIy+d+MZTiIt5zv13ajJN7QLk5JgbednBC8bXMl6
 Bc7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWACsx9t1mhh0ifsyeVTDwatE5FIgm0Rdo+sqofp3x4E3fCpx83+evjvknz/7uzUjAcoiE20LFIgkyoWgdCA3Lk1AT7rHhmOB4PI908RTaS
X-Gm-Message-State: AOJu0Yxy0iM/WvpAIcfuNH726D/UX1MoefwjAQ5ApN/bOR4uEOrAzP70
 ZNotAiyMjU1H4SEvMU/sSR0QWXxNJHKWZBioXC+ytW9jgFf+gYrZ
X-Google-Smtp-Source: AGHT+IHBXATYsnCAi18Pnmd94XM8gXF1KK2c5ntBdRmFa9x8kfwO+o1mRSI9SAgTVsohRvBTBjU3lg==
X-Received: by 2002:a05:6a00:8618:b0:6ed:1c7:8c65 with SMTP id
 hg24-20020a056a00861800b006ed01c78c65mr9832006pfb.10.1712590468982; 
 Mon, 08 Apr 2024 08:34:28 -0700 (PDT)
Received: from localhost ([2601:647:6881:9060:13a8:4fe8:4da1:7ea2])
 by smtp.gmail.com with ESMTPSA id
 s7-20020aa78d47000000b006e5808b472esm6878408pfe.95.2024.04.08.08.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:34:27 -0700 (PDT)
Date: Mon, 8 Apr 2024 08:34:26 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, Marc Harvey <marcharvey@google.com>,
 "Cong Wang ." <cong.wang@bytedance.com>, shakeel.butt@linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
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
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
Message-ID: <ZhQOgjkna94y9VBx@pop-os.localdomain>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
 <CAHS8izOUi6qGp=LSQb_o5oph-EnhNOuhLkPSfbQRU3eniZvbdA@mail.gmail.com>
 <ZgC5JoSiWAYf3IgX@infradead.org>
 <CAHS8izO5-giYhM1bVCLLOXRXq-Xd0=pi0kPq5E1-R=3i=XihmQ@mail.gmail.com>
 <ZgUc07Szbx5x-obb@infradead.org>
 <CAHS8izM8iLC9J1xSHScMrMkVyoY5HZ_nFMRO4V7HYarHhZhk6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izM8iLC9J1xSHScMrMkVyoY5HZ_nFMRO4V7HYarHhZhk6Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 08 Apr 2024 21:12:17 +0000
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

On Mon, Apr 01, 2024 at 12:22:24PM -0700, Mina Almasry wrote:
> On Thu, Mar 28, 2024 at 12:31 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Tue, Mar 26, 2024 at 01:19:20PM -0700, Mina Almasry wrote:
> > >
> > > Are you envisioning that dmabuf support would be added to the block
> > > layer
> >
> > Yes.
> >
> > > (which I understand is part of the VFS and not driver specific),
> >
> > The block layer isn't really the VFS, it's just another core stack
> > like the network stack.
> >
> > > or as part of the specific storage driver (like nvme for example)? If
> > > we can add dmabuf support to the block layer itself that sounds
> > > awesome. We may then be able to do devmem TCP on all/most storage
> > > devices without having to modify each individual driver.
> >
> > I suspect we'll still need to touch the drivers to understand it,
> > but hopefully all the main infrastructure can live in the block layer.
> >
> > > In your estimation, is adding dmabuf support to the block layer
> > > something technically feasible & acceptable upstream? I notice you
> > > suggested it so I'm guessing yes to both, but I thought I'd confirm.
> >
> > I think so, and I know there has been quite some interest to at least
> > pre-register userspace memory so that the iommu overhead can be
> > pre-loaded.  It also is a much better interface for Peer to Peer
> > transfers than what we currently have.
> >

Thanks for copying me on this. This sounds really great. 

Also P2PDMA requires PCI root complex to support this kind of direct transfer,
and IIUC dmabuf does not have such hardware dependency.

> 
> I think this is positively thrilling news for me. I was worried that
> adding devmemTCP support to storage devices would involve using a
> non-dmabuf standard of buffer sharing like pci_p2pdma_
> (drivers/pci/p2pdma.c) and that would require messy changes to
> pci_p2pdma_ that would get nacked. Also it would require adding
> pci_p2pdma_ support to devmem TCP, which is a can of worms. If adding
> dma-buf support to storage devices is feasible and desirable, that's a
> much better approach IMO. (a) it will maybe work with devmem TCP
> without any changes needed on the netdev side of things and (b)
> dma-buf support may be generically useful and a good contribution even
> outside of devmem TCP.

I think the major difference is its interface, which exposes an mmap memory
region instead of fd: https://lwn.net/Articles/906092/.

> 
> I don't have a concrete user for devmem TCP for storage devices but
> the use case is very similar to GPU and I imagine the benefits in perf
> can be significant in some setups.

We have storage use cases at ByteDance, we use NVME SSD to cache videos
transferred through network, so moving data directly from SSD to NIC
would help a lot.

Thanks!
