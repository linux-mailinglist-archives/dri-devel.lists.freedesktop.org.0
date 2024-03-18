Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C808287E24A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 03:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B006F10EF9C;
	Mon, 18 Mar 2024 02:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="L+gSazME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74810EF9C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:49:47 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e6779ce1fdso1582872a34.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1710730186; x=1711334986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QE0CXFBu76tpBM6gpoJrOe0mC6QUf5XbAI8puJxCLjs=;
 b=L+gSazMEN3FZRY+m4x78R44Vqgd1+5z5/QxQkFHgFhPxMIBqiVQp7BKHYaF9MnN8+D
 pm6+ulKzCAv9t9S9NfHwNzPl6IrNH62v0byU8+On6v60ym4I6MA41vAyQJwPp2cTchPP
 0ExQZ5ssKXQtdcr5I7C4osqGB9sBLZ7NhWjEyiaSt1ZmmUI0iPJVmRzEWbwdHxhxGMjZ
 CKkSy1c4I7TieyaYuM8wtbD9AQE5odFc7LXTHcC1Xu1FHkyrFsPOUx/bKypZtkuIV4p1
 MzdiGxMVKRsVvBvR00vpAJVJtlRfUrBdQfq860og/zhGEd34ijWJQvho+hAAqoKQ5Mrl
 vgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710730186; x=1711334986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QE0CXFBu76tpBM6gpoJrOe0mC6QUf5XbAI8puJxCLjs=;
 b=DZQhQgJQCHd5iCkzJ0nPfSSZjbQSl+NSWOS97MNp6bbTqdXWkiSXknZ/CZkA/56RiI
 fJn0WJE57172JxwEiqT+YO8N9Ux0g4zG2ICDiSqwuJUmb3iPiFAm+kiShkECI1ZeeU4K
 bNgKZMXb4maE5eU80/ypFrqj1fFWyfJ1SwGuYtzY3B2CKesZnWYgsItM0yKQmKAAXr4L
 rdcA3M0BbQMJXSc+qtKH+YDAXD2JNPcNtmxVrnNnmBkh9F030pozeDAO4Tm3Jkyj7tfO
 erlB9I0JQGx4LPLZZy7JV0KFk8LJnmdvLLbFlu8f4xRg5+J51tXStHlo+K2/2nD+hju6
 vpHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg/JMfb+sLFqwI6IgAu+eB+iDlYj5U9R2oOqXSlSE19GDtRIUWpNgN33cUHBAtiAv1e4BDd60ZXTEYayQ4aHjsnRKrX6n7SHYNFvh6j3RL
X-Gm-Message-State: AOJu0Yy1jZlfu16ldfWY8Ce2Ybcs2zBe//atmW9trFjY8cEwMfKmtGaX
 7FMHfGSZSjzd53yUaGSW5hXkmZh2zD4rqA3V02dShEhnwF5/gajPOGg1VlqFAcU=
X-Google-Smtp-Source: AGHT+IENq8waTwhUkJrEOrb8DEHjfl4QDem6FZJYYGTlmjRRGItMoHQ4P2wTQfIoEZJr502KAVnEEA==
X-Received: by 2002:a05:6870:8e05:b0:222:d6a:9ae8 with SMTP id
 lw5-20020a0568708e0500b002220d6a9ae8mr10284561oab.35.1710730185882; 
 Sun, 17 Mar 2024 19:49:45 -0700 (PDT)
Received: from [192.168.1.24] (71-212-18-124.tukw.qwest.net. [71.212.18.124])
 by smtp.gmail.com with ESMTPSA id
 i189-20020a62c1c6000000b006e66a76d877sm7120229pfg.153.2024.03.17.19.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 19:49:45 -0700 (PDT)
Message-ID: <b938514c-61cc-41e6-b592-1003b8deccae@davidwei.uk>
Date: Sun, 17 Mar 2024 19:49:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <ZfegzB341oNc_Ocz@infradead.org>
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

On 2024-03-17 19:02, Christoph Hellwig wrote:
> On Mon, Mar 04, 2024 at 06:01:37PM -0800, Mina Almasry wrote:
>> From: Jakub Kicinski <kuba@kernel.org>
>>
>> The page providers which try to reuse the same pages will
>> need to hold onto the ref, even if page gets released from
>> the pool - as in releasing the page from the pp just transfers
>> the "ownership" reference from pp to the provider, and provider
>> will wait for other references to be gone before feeding this
>> page back into the pool.
> 
> The word hook always rings a giant warning bell for me, and looking into
> this series I am concerned indeed.
> 
> The only provider provided here is the dma-buf one, and that basically
> is the only sensible one for the documented design.  So instead of
> adding hooks that random proprietary crap can hook into, why not hard
> code the dma buf provide and just use a flag?  That'll also avoid
> expensive indirect calls.

I'm working on a similar proposal for zero copy Rx but to host memory
and depend on this memory provider API.

Jakub also designed this API for hugepages too IIRC. Basically there's
going to be at least three fancy ways of providing pages (one of which
isn't actually pages, hence the merged netmem_t series) to drivers.

> 
