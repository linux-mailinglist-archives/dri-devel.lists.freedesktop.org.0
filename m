Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480849437AA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 23:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E00D10E6CE;
	Wed, 31 Jul 2024 21:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Vw4wZs59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C21410E2DB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 21:19:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so3308088f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722460767; x=1723065567;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEiu0hhQh0Jy26qjQV9Cqq27juU/IGB072cpo+oEEG0=;
 b=Vw4wZs59urv/WMa0K3iNu5CL8A03p6JIg+BsAXGWW03mgE1s2JJr3Y6MZLr0fq863g
 axRYXhagqOHCKGJeRzY2MEL5kAuDXmkcvttv2lgEHs9iQpkc4kkz/aeCmKIaxnHgY9U3
 dH6VtgVi7JUy50jXkB/HfF2cJmqQ2OWidlhiEeJtR8PaX+yF9Qks6RIkA3eYYTqfvqsA
 9Is+dPzFwHpE7a6aZ/rE46oCfrIL2Qjs3k1eBSD1KcygjPetpcFr9AjPjyxAAbnF1CIL
 XU5n6TD8M2TpU0fnxI2TshRvFXzbHsWU6pscWADRKXo8dMggwcjSdHPY7ntc46VgnpHd
 +K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722460767; x=1723065567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEiu0hhQh0Jy26qjQV9Cqq27juU/IGB072cpo+oEEG0=;
 b=HCnXVLU0NFsCQ1jdLcZXrKcKzIVFGpObGfln9xaYEISESSPV/1aVL/s0KRe4+AAdF4
 a4acnsNJdYsKgDFo2FU/Z7wxDaVQK8ElXDEDdqidoC5B8KMBSSKTUkFsiLTLrb4PkK1h
 BmaJ19g6SesEJBnfAYR3R16oJld/7i/irMJJKncoiLE5AU3YPygh3OqJp7HaDGHjFXXt
 kF9WGAj3MhCeMLOL5TJN+XCYSqFfjTYM7q6fNVWdWB46wJNsLQZGrcRKv0drz87v4LiU
 Aw0yYdy+EliXO94Rql9sViUbW9QDvWgFbIuC+CTruZOYG5Ivtkf9oz7EY5bwt+RgqXgR
 jeig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMJ33PrgyNIgapV4dcKmd9aO8FU8/BuzyeGT6Hs7u+iiwJjagqWrfmqpk7V/8UpXIJ2qvo2g0OJ6yyIy4NiFSonlI/Wve4uB5jlDNAMwuF
X-Gm-Message-State: AOJu0YygZhjcMY2lzp1hWMpN3m1EUpjAui033xU6EfbADH+OM3DJFULk
 U1lJls3uDbXor06wyY1zDQ7+nBImdwtNTjiLSfP9XayRHMrHmB8qxQAmdrm9zQktvlrpb/2E2gd
 9OXUu5QDv11WaZ7Kw09qXzyWhRQlaJbmQVU95
X-Google-Smtp-Source: AGHT+IGCGvp/48H8qaH6fLYg7SPbNiiWFxJtKT/J7GEsXh7PoxMKp+lvuqPbXyBiSW9seEuLTTgslLee6nJ92gY4vjU=
X-Received: by 2002:a5d:4483:0:b0:368:6d75:1bde with SMTP id
 ffacd0b85a97d-36baacdd8aamr351815f8f.15.1722460767120; Wed, 31 Jul 2024
 14:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240730022623.98909-1-almasrymina@google.com>
 <20240730022623.98909-2-almasrymina@google.com>
 <1722327259.5659568-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1722327259.5659568-1-xuanzhuo@linux.alibaba.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 31 Jul 2024 17:19:11 -0400
Message-ID: <CAHS8izMZQLsBWPXWiqPwaQHfupKc5VAuxW+6kpWmzi-vw8JEWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v17 01/14] netdev: add netdev_rx_queue_restart()
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
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
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Tue, Jul 30, 2024 at 4:17=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> On Tue, 30 Jul 2024 02:26:05 +0000, Mina Almasry <almasrymina@google.com>=
 wrote:
> > Add netdev_rx_queue_restart() function to netdev_rx_queue.h
>
>
> Can you say more? As far as I understand, we just release the buffer
> submitted to the rx ring and get a new page pool.
>

Yes, I just noticed that this commit message is underwritten. I'll add
more color. Maybe something like;

=3D=3D=3D=3D
Add netdev_rx_queue_restart(), which resets an rx queue using the
queue API recently merged[1].

The queue API was merged to enable the core net stack reset individual
rx queues to actuate changes in the rx queue's configuration. In later
patches in this series, we will use netdev_rx_queue_restart() to reset
rx queues after binding or unbinding dmabuf configuration, which will
cause reallocation of the page_pool to repopulate its memory using the
new configuration.

[1] https://lore.kernel.org/netdev/20240430231420.699177-1-shailend@google.=
com/T/
=3D=3D=3D=3D

> But I personally feel that the interface here is a bit too complicated. I=
n
> particular, we also need to copy the rx struct memory, which means it is =
a
> dangerous operation for many pointers.
>

Understood, but the complication is necessary based on previous
discussions. Jakub requests that we must allocate memory for a new rx
queues before bringing down the existing queue, to guard against the
interface remaining down on ENOMEM error.

Btw, I notice the series was marked as changes requested; the only
feedback I got was this one and the incorrect netmem_priv.h header.
I'll fix and repost. It's just slightly weird because both v16 and v17
are marked as changes requested in patchwork.
