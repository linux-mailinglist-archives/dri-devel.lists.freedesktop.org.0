Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E84901918
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 03:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7005610E19F;
	Mon, 10 Jun 2024 01:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHpTMUM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8AD10E19F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 01:07:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so8513865e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717981624; x=1718586424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SxexgitnAFK64gEkUcCw6okZUu3p3cJ0rX20mz7M3Zc=;
 b=fHpTMUM7pKZAtZVHcfQFn9nqE2VAl2jbd/P1JU3rC2N9gTdhuRIXhfhHl0Tu7JQVbI
 PDEM61OlmFWM45oUljcnlSfrxMWDLpc2BbGrjkpZbVPKYOClhK3pk/oOtPhKKpx+lETa
 ueu3sYpH9DoH9Z4myeWMxGFglMCf7JLkvQudQmajQiV3mzUPuK8iHTDMGCt7AaJ3bQGK
 5qthqTSoiRU38Jbb/A/HSKZHRyrWhyCYsyo21ky5DHd4yAbTCWAoADuLPevf0lCqfz1N
 B66EJzBOnqfzbuiKKivlWptyaK/IyUg4pIrVIWrh3Yn0t1tsYqMx07OUdlVqHA2Fp6zr
 1AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717981624; x=1718586424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SxexgitnAFK64gEkUcCw6okZUu3p3cJ0rX20mz7M3Zc=;
 b=Q9KgLc7E4VUlww1enHY4BbNLR5dgQvOfvUy70NW3sKWFdixah7xAzE6yk6SVEnzVgx
 u6gxzkqLaiqPjzhiTLq3KmSOrwcOk944UhIlE2dnrAbdx/8bcyJPeZz5p7QdKZEAoLkv
 rxWd+DjjlPjwfZd+rbuJNvw8pXAwUgWaHLbDhI49SPrQGcFUBMUlTa/J773mZ9ilXYIO
 K618KcuFRl2/w85fWx2N0+CvY5fnImcsgT+TOZ28jGZUab6orf+FQxUFl/XvIf7jF4HQ
 8ohBWRUgd0P/KAHqX/yD9SIAFhDw6+giV/wAVSXF4QlZGsAFKgI8Vfcvk0jXHyzYBFM1
 mN1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwS1V2lrOa2WkOe733vWJOUYH7dJOdh2jLwf/bSv0ExTs+3ehwv6lG6NGSxVpA80QS0VXHXsTquTn1zGIxQZ9bDyeiYwOoTb2UJgkKb6Ou
X-Gm-Message-State: AOJu0YygFmaDhjMZc2RwI+UoTl67l9K00vqjGP7it311PNmTzetGBj5i
 d24xUgC1zllDRCwDUdYqfZwU9VYK0Y2xHWrZn2QV/OJqllhxGHk9
X-Google-Smtp-Source: AGHT+IGiwrtnS4zP6MNJtTKdG8jEv39z6ImpNSFgjPDVv0bMAQhFuKOxum4ABgd9WZdj4NwTABxwOQ==
X-Received: by 2002:a05:600c:1d88:b0:421:7e76:b85c with SMTP id
 5b1f17b1804b1-4217e76b8b1mr27476215e9.23.1717981623544; 
 Sun, 09 Jun 2024 18:07:03 -0700 (PDT)
Received: from [192.168.42.136] ([148.252.129.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c7396sm124424005e9.33.2024.06.09.18.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 18:07:02 -0700 (PDT)
Message-ID: <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
Date: Mon, 10 Jun 2024 02:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 David Ahern <dsahern@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/10/24 01:37, David Wei wrote:
> On 2024-06-07 17:52, Jason Gunthorpe wrote:
>> IMHO it seems to compose poorly if you can only use the io_uring
>> lifecycle model with io_uring registered memory, and not with DMABUF
>> memory registered through Mina's mechanism.
> 
> By this, do you mean io_uring must be exclusively used to use this
> feature?
> 
> And you'd rather see the two decoupled, so userspace can register w/ say
> dmabuf then pass it to io_uring?

Personally, I have no clue what Jason means. You can just as
well say that it's poorly composable that write(2) to a disk
cannot post a completion into a XDP ring, or a netlink socket,
or io_uring's main completion queue, or name any other API.

The devmem TCP callback can implement it in a way feasible to
the project, but it cannot directly post events to an unrelated
API like io_uring. And devmem attaches buffers to a socket,
for which a ring for returning buffers might even be a nuisance.

-- 
Pavel Begunkov
