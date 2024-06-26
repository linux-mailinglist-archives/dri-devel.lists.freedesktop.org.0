Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6C9182D6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAFE10E6E1;
	Wed, 26 Jun 2024 13:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="njAbpqCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38110E6E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:42:25 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a72517e6225so477662666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719409343; x=1720014143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FdmqDIycq2mg5V0lsvCxzsdDO8aUqmZjoj0FE/lExQ=;
 b=njAbpqCaruESKL1JG70yjhkXCC7kVBkKJHMdz9C1/kiE2bSImz4iP+gZRHnmrAaPox
 3/+1HjTy/8lsGgiHuIrtSglL+H1na+QQDmdf9d2M0aQhvD7Wz9MQztuDNgfTGHkawfUk
 jWJfczP4cDfmm+miOX2fam0NHXDu3h4zZVARr43CApJFKs4a04GHjOhHO3iqDYwIV2bW
 FaSOJkOjN6Id37RgZoRXdg5jD/5tmFSLy7uZCt6cp1KE/AtxcxiymPwkmCTjw924bFJM
 X/PVR44G9kZaivaZX6oHEQw8/aFT4FITzoc6sy17eux+yMGz4n20FpgMq05a5FaF1YQM
 4tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719409343; x=1720014143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FdmqDIycq2mg5V0lsvCxzsdDO8aUqmZjoj0FE/lExQ=;
 b=LWZeTGc6f/MyvNJO9AWgTaYS3ZsgFqSnVDORxK1On9HtyAtqEgOXiLGEC++SnY8Zoy
 uZwcClDOt3mHpv8WiCzaM8k/eb14NZTDhHkIOvvvc2VQbMKXCp12PfSpqrorMUNG8Hf3
 tF+wG7kkwpPqPwkHPOdQhGBKW1ZPW1awUITvy3ZcZUqLxtEETq+UtcEOaQo2fDrbRTTG
 RysMr6RK52ijNSa+otV4m6t2qf3WAPxG9grJyTwdaO7WBoFQiDB126ptAbyQSSj2D+iG
 gM28KzMh2MQuVpqBuVXaNaGoR/LA2NFT7PoDz4qO8sDOfELfi3fWQFlfOb7tDJmK29st
 rv2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkbxKXzZUi4M2zpI9t3IzKOApQsQG5LDsLTJpl/RrFZgD18F4mt13J18/8Sfw38DO0ojNUIPHhAT3m1v+oiHRmGj9zSNN7v9HeZBhzV70I
X-Gm-Message-State: AOJu0YwmdTYz0kWRVkJ6psGUNUbPNaxaTRZFVvE5PzEVJvIW6uPG4MiZ
 aaY0bYr1fOHXzUWrMGFgqVRozbUbt1NYJiV/xeiH50lVExoREMA9
X-Google-Smtp-Source: AGHT+IGSGpl/VlVQhxEFYrK07OrwK0X9sCyxv8xjTYoLcqAK5RzUy2KJrXSwjqhZzrye8okazO8J4A==
X-Received: by 2002:a17:906:c096:b0:a6f:86fd:72b8 with SMTP id
 a640c23a62f3a-a715f97972bmr751303866b.42.1719409343065; 
 Wed, 26 Jun 2024 06:42:23 -0700 (PDT)
Received: from [192.168.42.3] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b24asm619850066b.57.2024.06.26.06.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 06:42:22 -0700 (PDT)
Message-ID: <6524676c-fbc0-4ea0-b320-f605d34da007@gmail.com>
Date: Wed, 26 Jun 2024 14:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 10/13] tcp: RX path for devmem TCP
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
References: <20240625024721.2140656-1-almasrymina@google.com>
 <20240625024721.2140656-11-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240625024721.2140656-11-almasrymina@google.com>
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

On 6/25/24 03:47, Mina Almasry wrote:
> In tcp_recvmsg_locked(), detect if the skb being received by the user
> is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVMEM
> flag - pass it to tcp_recvmsg_devmem() for custom handling.
> 
> tcp_recvmsg_devmem() copies any data in the skb header to the linear
> buffer, and returns a cmsg to the user indicating the number of bytes
> returned in the linear buffer.
> 
> tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> and returns to the user a cmsg_devmem indicating the location of the
> data in the dmabuf device memory. cmsg_devmem contains this information:
> 
> 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
> 2. the size of the frag. 'frag_size'.
> 3. an opaque token 'frag_token' to return to the kernel when the buffer
> is to be released.
> 
> The pages awaiting freeing are stored in the newly added
> sk->sk_user_frags, and each page passed to userspace is get_page()'d.
> This reference is dropped once the userspace indicates that it is
> done reading this page.  All pages are released when the socket is
> destroyed.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov
