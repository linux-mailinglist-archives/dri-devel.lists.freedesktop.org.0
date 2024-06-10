Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBA902956
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 21:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11C10E36C;
	Mon, 10 Jun 2024 19:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K3AFcWOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA29F10E37B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 19:32:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-35f27eed98aso349193f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718047939; x=1718652739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cH6LVxT06plsrA1ReD8cM9W1acWe7q6EhO7RV1s6Td4=;
 b=K3AFcWOIswxm0kyi+t31Xocv3ROQN2ymKT/3ye/k6hCS/1tkF67BnZtn2/CrUBPyB6
 GuMp5xAjhVTY0ZWRvho6Bv+eryVTB2nitiD8vPvAGe051MbHq2kK3gh0lWVZ6K831bMF
 Y81pJeyzPpjn1J2MN/WA70rjULaHerw4bdJiPN0XGyVRpbKPgKbC52/C/qI7tVrPiFHN
 oHCeF5GxylXl6qSfp4If5Qah0WPG6y8H93dwL0uTeSoEdDZzrGyVJ7+Xn41ClGA1JJ4H
 tVrDJXgBd3SaYohF8ZRU1BJFfpgk2nn7KfRVALzKNFbJO9SIQzxnoUYf4pSHduZUOQHI
 Di6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718047939; x=1718652739;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cH6LVxT06plsrA1ReD8cM9W1acWe7q6EhO7RV1s6Td4=;
 b=c7/6R14iokEK+2ghGAay6g8xQ+H2XRfy0FurG62sZPt0ZYBOTLzUonRX9UDoxqPldK
 8G84BCe0g0zkq1yUBfSNz2v46hEEQxW039NGCEc7S84mfUufGQXgvqLzcpaH0NvGwsCy
 5lX8zEeztkP7AUgbcciDX+B+hwZHQGkUxAlWEYHCo/tY+xmRUoYMpW/S9S8xdRM2UOK1
 bqusoGBmnW1SH/MZeEZFeSugeEdl9KCiPTCpGIXLWmIQtqphsRwS6yIUyWC4u7rtdhtj
 S7hELHprnRVLQvZtkSLTEFslvMQm2aGPWx0Dj4LrKIaw8HEeS6nE6VB3a8ItRVI7KTZg
 1J5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeh99S9BZ4dyNbPNqWLahO/spl/aUjW2c9wrOeBCLcQ1+Gn/RqyCkffO3IOMNQdhXgf+DBKNt2ZeiXvCq2Skaa/ji+8P8vNuv86qodVUet
X-Gm-Message-State: AOJu0YwiZ6yP9+JkaYvLVdzDaYG8bGzX1HrQ7fw/WLmI+CWCRi3HyDRR
 yTMgoLZkamkrDJFAc14EE3y12OIXQkMQrIDV0WMLMBvtwb1dnyGG
X-Google-Smtp-Source: AGHT+IHyebdJqoC8N9cFVipCugkjo2s6jygXE3iaN8ED6lgnlN+5ynOFecePOgT3p/WcNF0ptUpPjg==
X-Received: by 2002:a05:600c:1551:b0:421:4786:eb0c with SMTP id
 5b1f17b1804b1-42164a44b35mr87551775e9.33.1718047938725; 
 Mon, 10 Jun 2024 12:32:18 -0700 (PDT)
Received: from [192.168.42.64] ([148.252.129.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421cd1fdec7sm47319585e9.25.2024.06.10.12.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 12:32:18 -0700 (PDT)
Message-ID: <4c4739df-c2fc-4e9a-a27e-aec00a5667da@gmail.com>
Date: Mon, 10 Jun 2024 20:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, David Wei <dw@davidwei.uk>,
 David Ahern <dsahern@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <cdbc0d5f-bfbc-4f58-a6dd-c13b0bb5ff1c@amd.com>
 <CAHS8izNwmXQTLc9VADpushYKyeJ4ZY4G9aV47W2-1St65-tKUg@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izNwmXQTLc9VADpushYKyeJ4ZY4G9aV47W2-1St65-tKUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/10/24 16:41, Mina Almasry wrote:
> On Mon, Jun 10, 2024 at 5:38 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Am 10.06.24 um 14:16 schrieb Jason Gunthorpe:
>>> On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
>>>> On 6/10/24 01:37, David Wei wrote:
>>>>> On 2024-06-07 17:52, Jason Gunthorpe wrote:
>>>>>> IMHO it seems to compose poorly if you can only use the io_uring
>>>>>> lifecycle model with io_uring registered memory, and not with DMABUF
>>>>>> memory registered through Mina's mechanism.
>>>>> By this, do you mean io_uring must be exclusively used to use this
>>>>> feature?
>>>>>
>>>>> And you'd rather see the two decoupled, so userspace can register w/ say
>>>>> dmabuf then pass it to io_uring?
>>>> Personally, I have no clue what Jason means. You can just as
>>>> well say that it's poorly composable that write(2) to a disk
>>>> cannot post a completion into a XDP ring, or a netlink socket,
>>>> or io_uring's main completion queue, or name any other API.
>>> There is no reason you shouldn't be able to use your fast io_uring
>>> completion and lifecycle flow with DMABUF backed memory. Those are not
>>> widly different things and there is good reason they should work
>>> together.
>>
>> Well there is the fundamental problem that you can't use io_uring to
>> implement the semantics necessary for a dma_fence.
>>
>> That's why we had to reject the io_uring work on DMA-buf sharing from
>> Google a few years ago.
>>
> 
> Any chance someone can link me to this? io_uring, as far as my
> primitive understanding goes, is not yet very adopted at Google, and
> I'm curious what this effort is.
I'm curious as well, I don't remember it floating anywhere in mailing
lists. The only discussion I recall was about
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, but it didn't get through only because
someone pushed for evenfds.

-- 
Pavel Begunkov
