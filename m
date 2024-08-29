Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CED964F0E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 21:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC40110E77E;
	Thu, 29 Aug 2024 19:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mrS2Wr5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2362910E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 19:38:28 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4567fe32141so78771cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724960307; x=1725565107;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
 b=mrS2Wr5Zeg3Jh50T9kCqJy2RJrp/qB/Ltc8+h2gCzRgrQ1IN3UdvrfwWD1EAzZKDD6
 pfU9thZugkI5xuxmTqDJyPpoHKWMnyScid1VIROhOsBRNOHt7KxM3cmiGWCFFuIkkDfx
 H7SIOwkLKip/6igPOSJ5EBqA6tWOD6DYEw7g5ftNtuP4L4b9vDl7aTsjPt3wF5LZBODW
 XHrPpUaOxFDT00iGinfqTokqlFBAl/VmAWzmY0nxFNJcUBoz9H9JNs4OF6WZXzoIadOq
 3AHQcQpsrXJUl/U+KUmLBt6HRWnU4+Zsprc0UBilC7fjzstoClMj8qSNC0hITQhe6kF7
 myyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724960307; x=1725565107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
 b=uBI5HVfx92+EyBRf8G2b7VbOZ28jSJFJ60CUkw35xyUgny29sUZC02BB8a9atuEDrz
 avHt+/RdtZdcNpgaR0fdAypi4j1ygeKAw1wHrm8KDACoSPREaD6yxcNDtVREgSDgTlvR
 GbKoXAASzw466eaKN3W1SRx99bE7XeIcw/+Ol0desm5c1Q7UR7VcbxfsJyyQE/DYKDp+
 Bl2W+RNSubkGQpo6fiG1AK3AXyHw8lS0Mh8dW1mZ8K5UwWu8QCc4KiyM/rwhvA1jyt3N
 bqh6JlJH68His/5duACPBi667uv9PaUlvC/y+u3mSG0QXLaSEWhHEyksUKK9YYZ0zGw4
 ai5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp1MOwXf84HE+TlhmsQ4OroExSaYWUkmFpyq5WcA8b0JyBS3Y3yH4Y5VZ0f7WOvOVZ7ij37Zq+iRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzetZF54x4VfW9zkGk2f3DU4XIqGHPZO4EoHmJ6My+N+H32CJya
 MLSY6xsLaxm4B5TReL8kgyp6g1xj6uc84EwnWpHSE7zeyUyoIuLc/RLd5dY+WjKsx3gzUS75Yah
 qpKXcmC5HVpZpNiL5zDuEHQkPZqCi1PohhsLX
X-Google-Smtp-Source: AGHT+IEckjBQSLEDMwf1jYHRwORJ2ZVKtBH36SKJpIYMP8NrCeogwJVm7Q7nebuPSmPKh9r8A+fJeiK+617lAC3ocsU=
X-Received: by 2002:a05:622a:281:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4568aacd777mr496041cf.26.1724960306474; Thu, 29 Aug 2024
 12:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com>
In-Reply-To: <20240829060126.2792671-4-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Aug 2024 12:38:13 -0700
Message-ID: <CAHS8izMCZbynEQQ3rPs2QaEbD51ew7VK0sMziBTayCi2yEZ_EA@mail.gmail.com>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to
 netdevice
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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

> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>
...

>
> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>

Darn, I went too overboard with sorting of includes. ynl-regen.sh
wants these in the reverse order, which is unsorted. I'll fix it in
the next iteration, and I added this check as well to my presubmits.

BTW I submitted 2 iterations already this week, Sunday and Wednesday.
This is easily fixable and I can resend before the end of the week,
but if I'm stressing NIPA too much with reposts of this large series I
can wait until next week. Sorry about that.

-- 
Thanks,
Mina
