Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B2905200
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD2610E834;
	Wed, 12 Jun 2024 12:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="No3XGKhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF5310E834
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:06:08 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4405304d062so28208061cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718193967; x=1718798767; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
 b=No3XGKhMjp5lzd/Cls0LRQzm77pP8Ci2lZ54sN5YjEaf3fwVblK/rYsOyWPG8OQv5o
 HQFyeILM/e0aIGsAS922Zjyx9kD6rA7wzr8E/yMmeJ8gCg7rFZnxrTYs/L9zLNb2OZ5+
 w/sUx6bI2vEdNtB6XZMy5FqLAFEAS92uzH9puItQslPvdDUQdDebnuPKOzdQoRz8JMm1
 AP3n/BZo12W2P1ZMorjzlYV7eReiMl5i0Ru8j6xrSWQaw/N2bzrva8gtkoahygrO1XdN
 d2M9VHeOyNiKB8QgDysRUnQcW/GR4BW2EKxRXEto5kbksnTKgc9fHLFzJQ+3RfEiWUbC
 cCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718193967; x=1718798767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
 b=eJ2spCmfSpIz0pT6n4M9QcrOpZfezQ1JoKBYcfD7Kul+yhmSNCv3ouyQ7nuqXdPl7k
 CojMo80wB/QIUiJ0utM18dhJuiLIOlyUnRmlMlTRUDeHs8BuTi9KMNUOsfvkeLC1/Ufa
 fC0S9KGkkxpcQkH5QRtyps5lZzKXAS7Y4CMgZn/CSKTKHliYFuXDIv8f+cWcozIdorQk
 6FFO4jcQcLFrBYD4XykHDzxYlCqAdKl5yoQCmKx2FE1uysrXgp04naS/N53uc778V0z6
 T5zNgNseMAvpuYJHoDXKdfEX6+vy1eGcXdiWnyCEnCiMJo0tbVHRca5W7uvUpIJcQ3fl
 qrRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfzP4e6C291TI8gG419nI1qBz7kbs9L25U/LbLebgZF09YaBEsFCFOFC2L5uE479FDcswiz/+QgHqeH77AUEwfiipJ3nfaMlOk+jAXXVZR
X-Gm-Message-State: AOJu0YwUNS73r5w/sxD+Ah1o/paLTbP8ezrgQhxKYVbSGYMYaAgLXGpc
 FLDjFtEOwa4RXGCpi+dZRyrok63pZo079Gm9me1iGaV+pROpr3BNjUZIW6SGzZQ=
X-Google-Smtp-Source: AGHT+IElu+dk9DZ7aij8c0y6F8TXy6i5LV0OSLpqQpTgGbv9PZ9NHP5JfFSWjv6MHZMgeDua9fHUGQ==
X-Received: by 2002:a05:622a:30f:b0:440:5de2:2a03 with SMTP id
 d75a77b69052e-4415abae5a3mr13859041cf.1.1718193967008; 
 Wed, 12 Jun 2024 05:06:07 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44152b1585bsm12849751cf.27.2024.06.12.05.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 05:06:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sHMjq-008UjB-Tl;
 Wed, 12 Jun 2024 09:06:02 -0300
Date: Wed, 12 Jun 2024 09:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
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
Message-ID: <20240612120602.GQ791043@ziepe.ca>
References: <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
 <20240610221500.GN791043@ziepe.ca>
 <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
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

On Tue, Jun 11, 2024 at 11:09:15AM -0700, Mina Almasry wrote:

> Just curious: in Pavel's effort, io_uring - which is not a device - is
> trying to share memory with the page_pool, which is also not a device.
> And Pavel is being asked to wrap the memory in a dmabuf. Is dmabuf
> going to be the kernel's standard for any memory sharing between any 2
> components in the future, even when they're not devices?

dmabuf is how we are refcounting non-struct page memory, there is
nothing about it that says it has to be MMIO memory, or even that the
memory doesn't have struct pages.

All it says is that the memory is alive according to dmabuf
refcounting rules. And the importer obviously don't get to touch the
underlying folios, if any.

Jason
