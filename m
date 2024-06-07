Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A235900395
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468610E079;
	Fri,  7 Jun 2024 12:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WsYQkV5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6106C10E079
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:31:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so3079129a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717763466; x=1718368266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0t9qQNDQyMfGhvDGBq4R0rinqRtCXO9/OSll4uI/+M=;
 b=WsYQkV5SAWWXbgFYCda/gBtY/K07wN5/iNoLRjLDLlAT2keGMyIZCaKyNj/rdP0f79
 7/C8CsY5wLcmNrhsGI9JomGFFw5QtbLSRH0CW+QxM7ZMK7rPyMxsyS1BPLViUYWJWXED
 zsXVUCN7LyMR9HDXUlS/a2zO0WW8m48qohjZcyYdEUoMdbfmargN2g7LWfF6e/D+533C
 tDNZ9/6WaI6aZ0eWPWcPq1fzSJoJoFEQ/lujmey3YYEN2gOobkm1IyMAY2sD+R70ibhq
 IO76tK+OlDZxeFF0ETnMs2rPt5e9ZvlXLK8qvC6XGHysVZAchNn4WG/8qA/Q3fsIByof
 58FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717763466; x=1718368266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0t9qQNDQyMfGhvDGBq4R0rinqRtCXO9/OSll4uI/+M=;
 b=LEDnG8yc5YEw69NG2i15eSrJbOtMWwb/GK2H1XIWmlJ8DgHNAucFvyGR6s/uEC0qLU
 zhwLSBDTfLZGkKEIMVmobBBd5/B0u+8uRuUb8KOftvgxtaPUG1XqkZZo6t6OcSs3B+Fk
 i8vk2sPuxMvl5mz3EV24HsGcAlpkAxWJYx+wP9RHhX5pFG+uci4Ou6Ag02bENbiP8N2+
 pSv5w4QW8JgE+CVD4LJHeoM40xru09tGSsOds6qcgNQlpjKQ12bh50GkSDDg3HcPszGk
 RAiYHTYyHBfkyfLe+z2sFuAup7kEc/NQpifJvK7bUCj5uUteJXFTvOwFf5dlTCfmJkzX
 DKDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWRQMv6UIzm+BOjBkW5xK27e8VH+txT7caPGZqF4XYDs+lL+NRLIVqpLXMu40LvDbO2dNiDQWfDMn8VDoNpv+kJqE0GI3tKqMIeF42vFx6
X-Gm-Message-State: AOJu0YyOOSifNrs6HHQFCbBV+/wWs9YE3kE8xu6GG/3NJy/c5o956LcS
 Bpid/yjuUn7LvwJk3ZB84unkYdjlDZtDY75qSviVeKK43THBtepr
X-Google-Smtp-Source: AGHT+IH5SNInb5yZq3Cuj7U8oACNWHmzMuuF2G63X2k2tjaQ/s20PtWq1uTiQglncTLckDH15vmQlg==
X-Received: by 2002:a50:c181:0:b0:57c:5ec9:f5d9 with SMTP id
 4fb4d7f45d1cf-57c5eca001emr1193325a12.31.1717763466203; 
 Fri, 07 Jun 2024 05:31:06 -0700 (PDT)
Received: from [192.168.42.93] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aadf9d8d0sm2682019a12.8.2024.06.07.05.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 05:31:05 -0700 (PDT)
Message-ID: <ff4e0e14-9f3e-4d8b-a2a6-75dfc1f6e96b@gmail.com>
Date: Fri, 7 Jun 2024 13:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 06/14] page_pool: convert to use netmem
To: Steven Rostedt <rostedt@goodmis.org>, Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-7-almasrymina@google.com>
 <20240605214837.44efcc6f@gandalf.local.home>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240605214837.44efcc6f@gandalf.local.home>
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

On 6/6/24 02:48, Steven Rostedt wrote:
> On Thu, 30 May 2024 20:16:05 +0000
> Mina Almasry <almasrymina@google.com> wrote:
> 
>> @@ -42,51 +42,52 @@ TRACE_EVENT(page_pool_release,
>>   TRACE_EVENT(page_pool_state_release,
>>   
>>   	TP_PROTO(const struct page_pool *pool,
>> -		 const struct page *page, u32 release),
>> +		 netmem_ref netmem, u32 release),
>>   
>> -	TP_ARGS(pool, page, release),
>> +	TP_ARGS(pool, netmem, release),
>>   
>>   	TP_STRUCT__entry(
>>   		__field(const struct page_pool *,	pool)
>> -		__field(const struct page *,		page)
>> +		__field(netmem_ref,			netmem)
> 
> Why make this of type "netmem_ref" and not just "unsigned long"?
> 
>>   		__field(u32,				release)
>>   		__field(unsigned long,			pfn)
>>   	),
>>   
>>   	TP_fast_assign(
>>   		__entry->pool		= pool;
>> -		__entry->page		= page;
>> +		__entry->netmem		= netmem;
> 
> You could have this be:
> 
> 		__entry->netmem		= (__force unsigned long)netmem;
> 
>>   		__entry->release	= release;
>> -		__entry->pfn		= page_to_pfn(page);
>> +		__entry->pfn		= netmem_to_pfn(netmem);
>>   	),
>>   
>> -	TP_printk("page_pool=%p page=%p pfn=0x%lx release=%u",
>> -		  __entry->pool, __entry->page, __entry->pfn, __entry->release)
>> +	TP_printk("page_pool=%p netmem=%lu pfn=0x%lx release=%u",
>> +		  __entry->pool, (__force unsigned long)__entry->netmem,
> 
> And not have to expose the above text to user space (look at the format
> file it produces).
> 
> It being of type "netmem_ref" in the ring buffer is useless.

netmem is a pointer with one bit serving as a flag, considering
mangling it might be better to %p it and perhaps also print its
type (page* vs iov) separately.

-- 
Pavel Begunkov
