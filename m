Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD34924184
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CEE10E61A;
	Tue,  2 Jul 2024 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NgJx31FZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2906C10E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:56:42 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-367339bd00aso3376963f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719932200; x=1720537000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1O/aJn8vsv/arvmXTxuQEie1if3A4RdufXewAuUWOyI=;
 b=NgJx31FZJsLnuRfBMQoDuy+56JjmqZ4Sd3183hiRCYZnWaotvGk2MJGACuniKHD+Qn
 K67hbDH/tONcaPHAyYUTiCkIvNcOJyq7RJ9gZIqgI+vsSxfQ6+/7c2PjdyyenOVs1EcN
 MBXt2RSuqsSABnBfsgPKm0deDsp44pohaZPjJrYrMM/P1WaTdamwyzqXlcmFhxQ8Sv8g
 I+P1C0Ti7NXJBNAkdqr3ocltKjAcyi3R7R8XsSIdRi5KdUz9k6Rtvv8ncF++Tgv2s1Bp
 ffsOg8UjrKUvTGJcrwAZrZncdBOkCkJkWEpqBZUC3Tm2mxBSzmDJ5RW8EEk/mRIy1eKA
 RZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719932200; x=1720537000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1O/aJn8vsv/arvmXTxuQEie1if3A4RdufXewAuUWOyI=;
 b=g+bq1zn0Ml/SyDbe5QP3KmDX38HzfW8rC4716113r0afotu+LkOm6ACcsuzlMBxVPO
 5yR8DjBrPa0pcUM0G/UDM7ULDmfEgz+QCA08s61/9r20UP69nW7F97BYMFKdfKapJqS6
 MZD8mJSwY6m0jLfQGAqgMZHQ7acffi/d6WCOtnXoqTtpzCcSY0ZKt4B1/kbyRIolqyDc
 4KL8SmTcelwunPzzwxxHTm8sM9N0CEMTFUXwJOwPgNp6qWPB+2txyXgKREQ3/W9egY0P
 mErC13nG1OZban4lRyZtzDsNFboUYyR2wl8AwfEJmf1DyDB6zR3LffRlb6tImzFD2N2b
 7bpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNgv929Fxx+rSAk3IJrVuWuOzql75gQXFKVYs7L8AEG9peealSSc2OtSQ9UV8+GAGutzLQKDX1rfrJQexIaQrCyll8RKo3Fo6MPnZNZYJl
X-Gm-Message-State: AOJu0YzeW1bsWAcBHsdCcCGLLaBF+1IjOP0cYQZwUpwOpvn63NRQKCQd
 TPpiAeQlbpLnXf7PxygyJGZZzGbrBNDB6aTeVzpytAPf9kQ7JxOW
X-Google-Smtp-Source: AGHT+IEDS9QP4kQhr2RPA2dvCTTRVUMX3IHs1vr7q4LcbCSOZVwNq2UlHJCaLHCwFYt+fP7HWAZGgA==
X-Received: by 2002:adf:f98a:0:b0:35f:b03:bf45 with SMTP id
 ffacd0b85a97d-367756adf42mr6081448f8f.24.1719932200413; 
 Tue, 02 Jul 2024 07:56:40 -0700 (PDT)
Received: from [192.168.42.74] ([148.252.146.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb92fsm13572218f8f.88.2024.07.02.07.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 07:56:40 -0700 (PDT)
Message-ID: <4db52d39-24ad-4034-882f-9336717b4706@gmail.com>
Date: Tue, 2 Jul 2024 15:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 11/14] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-12-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240628003253.1694510-12-almasrymina@google.com>
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

On 6/28/24 01:32, Mina Almasry wrote:
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for reuse.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Same, lost tag from v13

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

And, as a follow up, would be great to clean up the loop.
Helper functions and "continue" should help to bring the
indention down.

-- 
Pavel Begunkov
