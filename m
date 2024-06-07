Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5814E900982
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 17:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3A310ECBD;
	Fri,  7 Jun 2024 15:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTj3l3ij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356810ECBD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 15:46:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso92057666b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717775216; x=1718380016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lbfQPuUVQZ6LzSSvTAQFunm5UA6lBQ6TlzjmJiAR6E0=;
 b=TTj3l3ijXalWaI5eLDnF+4lr3IDxTqxOE4KXpo9N9i9qAui7e6tYG+D/6+svNLBxoI
 grT6N3bO4fKoZMLldNC8XyrnPCm1pJ7XEDSydPi4vCC0sNZNzjYmwiUwUBFG+hdOyhDu
 pxD089sSmPy1pzY2P1XSaTsiLqB/2pNHX3o7tahqgself4Q+Avw1J+FVJxi2O6w+mcWP
 M8fcR/g5D58g8V98R6F+9r0Bc+fUQ4Xt6rgsN6YPuw3npss4PKsQrt5T+JFghcSjGguD
 ksPz/LCu9dqGCISk24koPWOgFhH+xMO9Ijiic/3S1OU6X/117fwx7oF9uWSCPFoBhRly
 GO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717775216; x=1718380016;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lbfQPuUVQZ6LzSSvTAQFunm5UA6lBQ6TlzjmJiAR6E0=;
 b=PlEBLRplQ+fprYCTD3wM6UjgUoy0mwh/GmECfkssIAa8yKzJpFnG6k1AmZtLo+P9l/
 CgoB//FAEUpBEta4Yb0x7ZUZZZzSARwX0dgCqopZVOfOZoSUz0T2cyGC7FSH0idaWne9
 qglU6jFarnnTeucqP3iCxZOVt6fM42J9Mc7w1PiZ5sp/OXKX2tYPcd/cnXtkeSTncD5z
 smSQK7EOmUfWX/b37DwhXlB2l5C75VjZf1bxUJin90TRDwTXirzK4TcPkT32YAam+uk8
 xwZQzm1Uh430HJBbOU/VScwmMLIyG09ueYCy/7oejHlu/lhGme2xwl2hK6I2N2xYELhn
 i1VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPD5YSTZiUJ0miuy6TktGuE+xRDKd1X08D3kIehSo+mECHiobYsCJQ6ydHQ6norDOPF0l1XzeeyTmWW8Hpg8ULuRJE9smskg8fpzDUt4BJ
X-Gm-Message-State: AOJu0YzX5UDHkD6UwYBIH8PsAvULkBh+Fw1OJNkc8+H/4MQ47ckuIwz6
 UulO5Nijwzn2mdGToR2sBQ9fpHJ0V42UDg1fxKz4B3WWV7Jv6m80
X-Google-Smtp-Source: AGHT+IHNLBWp/XVpBOD9TpyXIo6UVwaGICDFe79d2rsv63T1VIQg3s8h/O/cdVr7crD9nPvkteKRtg==
X-Received: by 2002:a17:906:398:b0:a66:414c:2abf with SMTP id
 a640c23a62f3a-a6cd60a189emr204889166b.26.1717775215622; 
 Fri, 07 Jun 2024 08:46:55 -0700 (PDT)
Received: from [192.168.42.206] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c806eb099sm263561666b.102.2024.06.07.08.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 08:46:55 -0700 (PDT)
Message-ID: <a8df4459-30bf-4414-aeca-2f67c461adc4@gmail.com>
Date: Fri, 7 Jun 2024 16:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
From: Pavel Begunkov <asml.silence@gmail.com>
To: David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>
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
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 <8f44ca2a-8910-418f-b4a6-ca1e051484ba@gmail.com>
Content-Language: en-US
In-Reply-To: <8f44ca2a-8910-418f-b4a6-ca1e051484ba@gmail.com>
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

On 6/7/24 16:42, Pavel Begunkov wrote:
> On 6/7/24 15:27, David Ahern wrote:
>> On 6/7/24 7:42 AM, Pavel Begunkov wrote:
>>> I haven't seen any arguments against from the (net) maintainers so
>>> far. Nor I see any objection against callbacks from them (considering
>>> that either option adds an if).
>>
>> I have said before I do not understand why the dmabuf paradigm is not
>> sufficient for both device memory and host memory. A less than ideal
>> control path to put hostmem in a dmabuf wrapper vs extra checks and
>> changes in the datapath. The former should always be preferred.
> 
> If we're talking about types of memory specifically, I'm not strictly
> against wrapping into dmabuf in kernel, but that just doesn't give
> anything.

And the reason I don't have too strong of an opinion on that is
mainly because it's just setup/cleanup path.

> But the main reason for allocations there is the difference in
> approaches to the api. With io_uring the allocation callback is
> responsible for getting buffers back from the user (via a shared
> ring). No locking for the ring, and buffers are already in the
> context (napi) where they would be consumed from. Removes some
> headaches for the user (like batching before returning buffers),
> and should go better with smaller buffers and such.
> 
>> I also do not understand why the ifq cache 
> 
> I'm not sure what you mean by ifq cache. Can you elaborate?
> 
>> and overloading xdp functions
> 
> Assuming it's about setup via xdp, it was marked for remaking in
> RFCs for longer than desired but it's gone now in our tree (but
> maybe not in the latest series).
> 
>> have stuck around; I always thought both were added by Jonathan to
>> simplify kernel ports during early POC days.
> 

-- 
Pavel Begunkov
