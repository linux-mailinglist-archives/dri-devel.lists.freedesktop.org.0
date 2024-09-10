Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE6973C53
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF2F10E85D;
	Tue, 10 Sep 2024 15:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aDoVumcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7461510E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:38:57 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4582fa01090so300271cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725982736; x=1726587536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gszVQrHTml2s4rQX/N3KISfWtIKCjIZkEmtrFN+rLM=;
 b=aDoVumcQgePMFZuHgcZruUmG9At8AXSgVb6TzxjbXO2McZB77FprjAgbghOPzryMYS
 OeD9Fw1siXFyJ9xSMHb1+1PyzqQY/SThgeR+jRAXFvHmkV8BnYEfrbg2AHBlg5boSg6w
 Y2o6xIn1x2IWOKqRWFMvAjigLmTvWuiTg8xWLOW1McwbnsEebGn5WdzvqQgTAPwZDacy
 0E/Yot6YJYUhgczhblrSQQUuFSXeHyArs2LGfmU9BQeLdOH/9waedS7diO0AC5sG6yss
 kzVhOkhoPXg9YcgS3Un0Q6q2vNihLkI8zJ/tbNsZ/b08JtQiRJbL3MjaOQZngGSyGBeF
 8e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725982736; x=1726587536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gszVQrHTml2s4rQX/N3KISfWtIKCjIZkEmtrFN+rLM=;
 b=ivUbLSGsO+cCHv2+Sa/MwI8KYf1q5KyqRQhIVoJ6ipv7764z/ZYZ8rTnugHD2UnITF
 iDFuRkiqttqllQS9OybXF6jLqe5IWN4I3CNRfwJ8W+aoBaHm8ex77fywIoh0tyGJd2BQ
 HjiwPKJAiZE6WGZbRxR8tSCi6jTMNhyYb/HWN7WHm+PsyQcq/JRuj9HLL4u7I974djA5
 OuQQco1lxxqQzD1dxrX2rOyDYt0ZHu9Vvmr1GZy7bQ+AoV/Z7XBHTqGeoqxYOLZIB8jX
 1qNzYBny0XOG8IOFFclTptxqjvnx5FF/gL5lQwrHvqas5gd8neyKGG7cS1lA4PCkqCZo
 e97A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdS+r4GKAFxoKTQ9cGOlgiHVJiVsL/+xfBEJL9i31isOAk02xIhQehmXjR52ltLc7Us9HQLq1y6o0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx75bR5bKmqRWOCSp+emuLeuz92trkr5lF+EMWaGWQT9dO7TDkc
 K2HP5R2e4DInybtppDR90IxWM/2h4f/PqMsy9wQTVCxj7BttFPEliHIRC4kfsRmP6sd4dWWcLPT
 l41gTrS2BKADmmz6gzqU7Ee228vQjIMO13z8d
X-Google-Smtp-Source: AGHT+IEK6weRhBb+6I+yqObyHVaZqmcs2wOCh/JwTg5EmvszzOI8s/itZSBxrrNFolb48wNjfmGjViIMiDzaN91ZR8I=
X-Received: by 2002:a05:622a:13ca:b0:447:e0e1:2a7b with SMTP id
 d75a77b69052e-4583f0063b0mr2792721cf.23.1725982736186; Tue, 10 Sep 2024
 08:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com>
 <20240910080237.2372cfa6@kernel.org>
In-Reply-To: <20240910080237.2372cfa6@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 10 Sep 2024 08:38:42 -0700
Message-ID: <CAHS8izP4EO3t=7-n2Ok5pgKe+JjJV+T3EH1PaTW=YU234kEpGw@mail.gmail.com>
Subject: Re: [PATCH net-next v25 00/13] Device Memory TCP
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
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
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
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

On Tue, Sep 10, 2024 at 8:02=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Sep 2024 05:43:05 +0000 Mina Almasry wrote:
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
>
> Mina, if you'd like to see this in v6.12 -- please fix the nits and
> repost ASAP.

Running my presubmits now and will repost in the next 2 hours or so.

--
Thanks,
Mina
