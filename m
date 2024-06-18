Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38AB90C9D8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB2910E63B;
	Tue, 18 Jun 2024 11:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlpUXjW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63710E64A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:40:12 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso2292062a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718710810; x=1719315610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wkL4gZeTFn58PzKiilUj2Jvl065qOPmkOqhQzjfXBnk=;
 b=IlpUXjW4wIiqHvUcaj7MugH4E0Tj+809tZSlena+xrTQ//M1tvhksdPcKTyKbtiU3Z
 /ZP9+mLhiiLEpofb2i6MusMbQ5u6nxRTybzcJdge2x+rCcuD89emVzIeh4OYIgdFwO44
 srQu6BQp0Uv5y8XzKTzyU07kvt3aKnFmu0yseaEwLqalJGMZhrVqdAjAtHj1BVwn86vw
 fH95PXNdAoIC6xvPGIaVIEWMiG2x8fPRpomCNiRGI63SyYK3/zabK1w1+EkwJDgzorTL
 m8ik2QXqxuZE92t5cCQr1i33GNOWLHTemH8VmaSYCiawJoVFBw7bCkEmpbmEkR8BNPgY
 6//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718710810; x=1719315610;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wkL4gZeTFn58PzKiilUj2Jvl065qOPmkOqhQzjfXBnk=;
 b=S6K2Xs6zQRB3h+CnS2fl9s3pZI+MZX5Rn0nZIMEiE1krEQsoskB+D3giQ/ON3X3w7w
 E4g7fx4hxRm480iuPk70Z5hZHYzGlNLEm7latHVTXF60GiidPc5pNwYt0Hox3tBFP7Cc
 l6yGgqIRkYroYLQRr12Gd0jW79LACoXU/Ut+E7tNDB/f+6ux7OSE8vnrwd4XFzcHPtHt
 36m3qGGZansajcCBR4lB7Eilf512vZruNRlUMDEk0PJN8wYQmRB/NDBUrsteVHqpztCv
 R92ZUH86oB8gAQqHTecR8V8qCZ2BBDtATuO90iTRM5+L6WIHsfHeZwYsXyFYnztpNVvK
 4mCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEXp4GSkr3zDaasHqRWQQOAkAwIC9OrIZVOva7Ufiqs1uhcOM8JjD7G75hKyGcNxmh2c8PCeLEEWSUZKvCkxs3r9X0Gkr83OXTRW2tOLCr
X-Gm-Message-State: AOJu0YwB5usIWwgLsw5ekNcmuUH+mVSfJ1Jw/DJVyFvdB6992dgGyzY0
 2NGTHzOnEmoC+UPberA9bDtGbu6cNyVH2lI+qoANbpKXbZUpwgvw
X-Google-Smtp-Source: AGHT+IHTXs6888aBCQaVqx3Ld2cescOW04wu9+DX8hnGCFhgSs6AKtIOVIvQW1zhvtYJcvE1BCkIfg==
X-Received: by 2002:a50:c30b:0:b0:579:d673:4e67 with SMTP id
 4fb4d7f45d1cf-57cbd6c7495mr9752771a12.26.1718710810253; 
 Tue, 18 Jun 2024 04:40:10 -0700 (PDT)
Received: from [192.168.42.11] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72e9515sm7685752a12.41.2024.06.18.04.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:40:09 -0700 (PDT)
Message-ID: <204af618-03f7-4f2e-bbcb-7111011f78bf@gmail.com>
Date: Tue, 18 Jun 2024 12:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
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
 David Ahern <dsahern@kernel.org>,
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
 <ZmAgszZpSrcdHtyl@infradead.org>
 <ee9a55cd-7541-4865-ab2a-9e860b88c9e4@gmail.com>
 <Zmfv6_uWAVavYJNj@infradead.org>
 <8ca3e144-75f3-4e57-9ae0-cc88f245094e@gmail.com>
 <ZnEshp0VICflc6Bg@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZnEshp0VICflc6Bg@infradead.org>
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

On 6/18/24 07:43, Christoph Hellwig wrote:
> On Mon, Jun 17, 2024 at 07:04:43PM +0100, Pavel Begunkov wrote:
>>> There should be no other memory source other than the page allocator
>>> and dmabuf.  If you need different life time control for your
>>> zero copy proposal don't mix that up with the contol of the memory
>>> source.
>>
>> No idea how I'm mixing it up when I was explaining exactly this
>> all along as well as that the callback (and presumably the call
>> site in general) you was so eager to nack is used exactly to
>> implement the life time control.
> 
> And that's exactly my point.  You want to use one callback to mix
> allocation source and life time control.  

No, it only takes the role of life time control and doesn't
care about the source. The allocation source step with
corresponding initialisation happens separately and
priorly, at initialisation time.

> That's the perfect recipe
> to create an un-extensible un-composable mess
-- 
Pavel Begunkov
