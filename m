Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B09018ED
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 02:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8A810E19A;
	Mon, 10 Jun 2024 00:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="SaUGGSm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF25110E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 00:27:57 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2c306e87b1fso342016a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717979277; x=1718584077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MhpwXQPEWuldXab2yRt6lwaofFGFqOHBQxOKwwMzkWs=;
 b=SaUGGSm81Mop68KLUfl/5Y3pwlYVRPYCGN35dZzGMUt4qGQUcnYao13IC3w6zvgfvq
 xbdWpE6dtZKCcUKvnnUCUtaahv99Xp4teA6Xgg/NdBinzQihlE6WAzUr3j/yTJ380IJY
 aFUiDa+EcW3n58ykqmQqPqcfep218BSF0wHx+tUjMzD7AXRlDBI7ib8JWorraz8/uvu5
 1IxnzILZpq6df6b12v2JLwDj/arblYXXE6gehCG5zFyWjIjx33b0saARmTF3cbyV7nm9
 Nz27P1Mz/0qtP11Tt5VQlsr5iI+rJazXBpJJO42/inVPtJ+lcsfvQPjC1X7ig5iDRrfW
 Bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717979277; x=1718584077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhpwXQPEWuldXab2yRt6lwaofFGFqOHBQxOKwwMzkWs=;
 b=HcopRYohnngwu/z7TWfrJcP7jFEhOqJ6oA7YozlomAJz2tw0fcAzARYAQ8y1zTXS8G
 wnn88AF5YgspNjYhDoIlK6Y5u5djb3Zusioo3pmB8g+5EZx6kZcQsivH0L436r8vhVMF
 TyAGHBH8AfsUZec1G7oopENLNPx5bIOqNbT9dYaF1bjQs15l84RNbEiQGTDeEhEnpm4W
 XgOtplmDf/IM1rFnF/mwHuPvAM1Lb4EZrz1uhdRXZkOkjKKJ3pVcehSSqjqcaMhPfY34
 RZKkDKoOiToUu4NDDayEAxrBQFXVnalvxjDxzWnU+dFcXpc2PbsCcqcXOC3jmTnkY0Dc
 R4gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBsHnNMJL7c8gSi1wv8Tae16La1jVEHVPYSKjzczcIpwrnRLy5TziSDdKXdVXswtsbB4LVqk2B3asCSN9mOS4LADht7S7Gq/xLJC3/39Ef
X-Gm-Message-State: AOJu0YxGXb/ilbZfCgkcZbFO1YlUZcH6hDkS1pfI+IGwvcBazg6E+Tft
 xYQMv5KQBvnsUYq8IIIB+zpCrD63rSqxCPNBosJKRnJCsTI60blutfn78egEbLg=
X-Google-Smtp-Source: AGHT+IHFUY13EgQWeWpod8cMzpAhYoaErdO5QtBiSVL31xjUWTYCgJQDuWf1poRGpWIptTmVDcqXrA==
X-Received: by 2002:a17:902:d4c3:b0:1f4:a36c:922c with SMTP id
 d9443c01a7336-1f6d02de0d6mr98614085ad.20.1717979276488; 
 Sun, 09 Jun 2024 17:27:56 -0700 (PDT)
Received: from [192.168.1.8] (174-21-189-109.tukw.qwest.net. [174.21.189.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd75f162sm70228185ad.61.2024.06.09.17.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 17:27:56 -0700 (PDT)
Message-ID: <8f7bc361-aa92-4d73-b276-f2d6bb4fbd6a@davidwei.uk>
Date: Sun, 9 Jun 2024 17:27:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Content-Language: en-GB
To: David Ahern <dsahern@kernel.org>, Pavel Begunkov
 <asml.silence@gmail.com>, Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
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
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
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
From: David Wei <dw@davidwei.uk>
In-Reply-To: <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 2024-06-07 17:27, David Ahern wrote:
> I also do not understand why the ifq cache and overloading xdp functions
> have stuck around; I always thought both were added by Jonathan to
> simplify kernel ports during early POC days.

Setting up an Rx queue for ZC w/ a different pp will be done properly
using the new queue API that Mina merged recently. Those custom XDP
hooks will be gone in a non-RFC patchset.
