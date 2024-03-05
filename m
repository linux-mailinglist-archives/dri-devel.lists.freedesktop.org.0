Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE48729C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 22:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718210E607;
	Tue,  5 Mar 2024 21:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="OsYe7azL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15710E607
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 21:55:07 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1dccb2edc6dso51626945ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 13:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1709675707; x=1710280507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jL7LWnaopqqB5nwV+btClF0x89yXnbnHF4XK+f8SkuU=;
 b=OsYe7azLTFtocI9E9+UoMlDpFMTnYAAROjjccdIvtjNqgC5zCpn4JhrSnV6Vm+ZLXG
 ilgGtgmcSYMzgzmZRSsomc2uKICJv7ff/WwbPRISWmJGAlVgr3x+1GOQMAbOZ9pKM7Py
 gO4QPxq4LFwQciQA34cLuhuQGEpSZBlkULuCS8Qje48tb8SRCUaBGhDDI8avgVZxA6DG
 z6ccKyEwNAX5by/yXQ/fjn/HaEbMfNaFAN/jCTVCHEcCAFPtVvyxahW478mz/hnNcpWR
 XFDNvW+PlrMnAR+fwMz1SWZmcSJxXoG4+/fMfE684jsuQVuyVogM6C4OIisyJz4zomPp
 I0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709675707; x=1710280507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jL7LWnaopqqB5nwV+btClF0x89yXnbnHF4XK+f8SkuU=;
 b=SG+5kcP1B80Zw+fnor8boVjHpSk+LG2GXB8esq0+CWDRpk6YX7rXeh9pacpsyW4z7V
 pJVyXGxS/7HeZ7lRvrpse/IpYoffSOm3eZwwjIZf9QMEErZ3mSNVdZDvkIcwvfubPg/Y
 gq7s7q0IYWnMtjq2Angwp9I+snltnSfeGMLuWf4gG3ANNpiB+GNpUtRAqejMZM9odCOp
 bbeZp2GQe3vrtnswrBZUSJa+iICsreNtF1CfxPAr40gwv9jQwOJRv0X1ogHQp5Mm+kbX
 JC/ekh0DwSqMPJTWSp4/KiaGTWN/npZ8O/NtwR7ORDgJjKGb6HsdjEaUiApmn1H15Hoa
 1iFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp3DAnp2iFa5+9dPT0eYBL8gTRTwJS/6E7LlTLsC+QdCMBII2jHN1uz7a1bmSE9CqyfaZ4ATbzycs05o+bUuLRnIxSs3i4WoxQam7lX8Vh
X-Gm-Message-State: AOJu0YwiBH3EkniWUaochvtYErtNZZVSp+Rhv+OqC+mGkC/kKDY5cTMK
 YIg+9YcqS167b9YhrHr2frWghfnUdDWUo788cHKBC8CVdHc+T4fIma+PTwbASJCDza0b8cMasVf
 HDu0=
X-Google-Smtp-Source: AGHT+IEzUHguUj9gf1hY/ZH3iwQaSPj6FKRjbFS32/33ns0rokMOZjx9/UvRjY93Qc1WGHn/9lMP2w==
X-Received: by 2002:a17:902:aa86:b0:1dc:cb04:82e8 with SMTP id
 d6-20020a170902aa8600b001dccb0482e8mr2800530plr.22.1709675706778; 
 Tue, 05 Mar 2024 13:55:06 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1256:2:c51:2090:e106:83fa?
 ([2620:10d:c090:500::7:4943]) by smtp.gmail.com with ESMTPSA id
 w7-20020a170902e88700b001dba739d15bsm11097297plg.76.2024.03.05.13.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:55:06 -0800 (PST)
Message-ID: <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
Date: Tue, 5 Mar 2024 13:54:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
Content-Language: en-GB
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240305020153.2787423-3-almasrymina@google.com>
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

On 2024-03-04 18:01, Mina Almasry wrote:
> +struct memory_provider_ops {
> +	int (*init)(struct page_pool *pool);
> +	void (*destroy)(struct page_pool *pool);
> +	struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> +	bool (*release_page)(struct page_pool *pool, struct page *page);

For ZC Rx we added a scrub() function to memory_provider_ops that is
called from page_pool_scrub(). Does TCP devmem not custom behaviour
waiting for all netmem_refs to return before destroying the page pool?
What happens if e.g. application crashes?
