Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925248531BA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20A10E1ED;
	Tue, 13 Feb 2024 13:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvjZbmGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FA10E414
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:24:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5611e54a92dso5393215a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707830692; x=1708435492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0QyYjoH+AqqQf6ghl+XM6LALnTPi51ZlBkMJjWYJ7D0=;
 b=NvjZbmGjnnYLzUMisAPkhLDhL+jIH6V/qoYIJltLi7tPunGTRfbVntk4ZD4Gj5mHWj
 jIm1gXpWftfycOFJEnBp169NgwGUqPQJ5IeaGSEbYb0dmDc1PsCIytWdNjY5NwoxKK7N
 /3RfSQFJMSKyE0AemWimViOyHlUkxWZyWSb4hF6YWxqV2SAYtt/l/F4WkcvkUybe1EIB
 ZStp0TpQ/aAyPQkmVU7LAL6zCw1FI4Cw8sDeOhgTduutdBp5MrGUqWUE8mvqUxIKC/hU
 yiKJChwhEf9BZWIFyo83bMOAhRW7DXKroKvjsYLUScRRBlrew2CK3L6ZNxSTdZ5Z7ajP
 EUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707830692; x=1708435492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QyYjoH+AqqQf6ghl+XM6LALnTPi51ZlBkMJjWYJ7D0=;
 b=bNzNF5pOElqNjEXhXh9kaI0bpQU5xYiUYhGvna28Ts9NGN8h5SeqjZXh5A3nKHIglU
 vaX3ZZ65iY5EiLG+znrQUD21fTwsQsfEFOTaaIaebleYOuOkzhqfRyx33/cE0gdxRqRe
 4aiO0x1TQi8htwpejlS2iQjWFwYINyk7YiSo2aBHTBM5YiBJwv7mdqCJ4uorVeTGefk7
 POpPQI+RrD8LUqz10ORSorpGxAnCzwvN28v7B9tAkhgQ/eefqjSZ4CBwbHqmqt3x1cVr
 GBCF5eFNS7KUqHAT4oOxJAonWv27L1zRCOk/FuN9nTu53PiStXMQk34UttOwIzWtLEVX
 33zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDF007sdhhtc1RU0U472+Mabr6OfbpexHcJB0FtJoowNBX9ddFmF8Q5+hPvpYkW+t/74isHIfZlGmzxrQIwIx+BgFI272v3aDKcZ3JBySA
X-Gm-Message-State: AOJu0Yxyr+x5/wcxmrEAvzRDMfsJuaWNK4kOTXQLgBt0p9jTdnMpPDMc
 jGhB1Xn3JhJjN1YE05DER7Ks1VZG406o4GArShGM9BbMqcjYEh5S
X-Google-Smtp-Source: AGHT+IEvOYZMro6HR8cOXNPUYT9ZgCc4vRcUyvz622HX4ZCDWHklO0ODmEGlx46UXe5UhrZ820A4mQ==
X-Received: by 2002:a05:6402:3596:b0:55f:95ac:d698 with SMTP id
 y22-20020a056402359600b0055f95acd698mr7503927edc.32.1707830691640; 
 Tue, 13 Feb 2024 05:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVMeArKJi3EifAmOpZcv2Grgg9QOavC+wNyABJk3QLZgkNc7dOXBIDhbgy8vyOBMzsIrAMg6FrTdfqq7fwyR5rS+2iJZSxB/qmQAEIC1C1pB7TfSTnxP+fx13ldXqknLXUyTvQm3D6HdvE0YKiG62Us26JWt3npm8XPaqI9wVM7uGfq0QbE96JFT+LYhAB+W+FwwSi7bTZ4TRkyuc/9DU0cv2LVCr+rvOuhmUBAT4otlLbZm9JYT7Gb/SCjZ5OV5+ll1i1snATirzjnVrJzfPtE0/hYuUaVgoyNXCWtTnLPowekY81P9qkSPcVtd84PjsqjdGrsL2fNGFZEnbHcSvh5CYGQf2B2uGf2BofpqJJhDKcOT01XGpkxqj9v70H0Un4YGKaLxCfh1+5250VMj+waUOL6WvWcMrzfyseTPpoDkRBp4L8ZHuLLQyTJt4FrAuXja+bLhKwDQFwev99ad42GfufGTCKtRi+m6V9Ux+jhKo86FnyUr5R7cBp+NYO0fxy3F6DEGrQc8SH0ZYmIPlXq6OZwQfyJTz9KnKqFdKANS9Uq4VYesafVkDuF5CapSqUVXFTg+p/Pa13rAzk2q/FgOO5yacnYiIWg5S4Eaa4K1Ti+SgzjfQRV622HGf3+lNlZV+7iV3+J/sE+ft6cr/BtFGDVxlmic3zBJmpdlHqRckBqxyWOopqShkKQLpFgAEU5o38mRv70DSn/RNbvUKGe1mElMc/LkPbbHMDk+kjGEn7/Yq5UE7FDt6Zh5dz2rSrl+sKaHFhYVznDZR7n14ZcEylWSFsoa+g43I156d2UhVaNF8wOKD2fu7qIr3PHiNJfehYyF7Wmr84+QGesFaDSpvqEzEt2IIlKOd/KuWr45ctoOeN3EibzRaSdG4gXEubW5gJ0OEIifsXLv/HCy8Bxf0o/J5de6QM3zr4FijUzwJemHVQ/co7tmATUVldvLIICXf
 CIP5qDmyEYTAWaO4M1rQ11q8jNdj7sP3/cdMu8dYlTxUfELhGwSQX7KdjeI1WJpQg9IC5oR+NcK3wbN5vegyuTGdzm7+auiSLWF8HnWsFY68PsWpIWtV/dd2ZclddAz8PGWZsCPlS/zjrJ0Ymurg5TU6+Er2DLD36rt+PwoT3ggtvpTxvStbhZ9qXxFRBlHJmeAWqFbYhvIsniswygmR+AN4MRbypKK/gViMQ6AnHEKWhunUMirCeA+XPlvApszlNpZj2b49UlEA/Fv2gSkf6qmnXSW4D30DtfHIBs8HNpgsABcttGxCFCxZTWjB5QMwq/atg923vuboIb3o4uMzyYRsNviYeiS2DqNkQTWanwr0qsbgu9C20qbo3/ehtFpDSHBPyen61sVJDmtcPjquAi7dLUy9cxtDcKyPLSvQZ4aNLL2wEe2nGMq5kSJDZtqOs7OOqDIgkH0Yd9NTB2oGen6uU/efOYA7h5WwZElwofslyM9YrCfiZcPkjEf6vtrIQOtlGoWwIJRgbpDkdG7opM4YrEmT8U8nBM9A1aEA12kcIyzQLW94+2lb7MJYHOg+PrKRZXZCFbEOD+lgbfQki9jGXan3k2jGZuppHdRIIf9y+suKZH2riCtWMNkvHFbKX+1v7X0xnJcapXJw7qEtF+5Dk67dDlKhHCOjdPG6YGEoRr/1jmt1J11viRTPtzb0mmjgRyRlnOPJchCv2Ysw/TI0r1H8a0ryGeSOkGhgtamEBDuUs86JnW4sT9WCzH4nO9TOErXZo7rBDnpYdVt0pganVoza54ZkelCxQUtzuQmd+hBPHU
Received: from ?IPV6:2620:10d:c096:310::23d8? ([2620:10d:c092:600::1:a107])
 by smtp.gmail.com with ESMTPSA id
 b6-20020aa7c906000000b00560ba66587csm3657441edt.13.2024.02.13.05.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:24:51 -0800 (PST)
Message-ID: <94ff0733-5987-4bf5-a53c-011e03aa6323@gmail.com>
Date: Tue, 13 Feb 2024 13:15:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v5 05/14] netdev: netdevice devmem allocator
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, netdev@vger.kernel.org,
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
 Helge Deller <deller@gmx.de>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20231218024024.3516870-1-almasrymina@google.com>
 <20231218024024.3516870-6-almasrymina@google.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20231218024024.3516870-6-almasrymina@google.com>
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

On 12/18/23 02:40, Mina Almasry wrote:
> Implement netdev devmem allocator. The allocator takes a given struct
> netdev_dmabuf_binding as input and allocates net_iov from that
> binding.
> 
> The allocation simply delegates to the binding's genpool for the
> allocation logic and wraps the returned memory region in a net_iov
> struct.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v1:
> - Rename devmem -> dmabuf (David).
> 
> ---
>   include/net/devmem.h | 12 ++++++++++++
>   include/net/netmem.h | 26 ++++++++++++++++++++++++++
>   net/core/dev.c       | 38 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 76 insertions(+)
> 
...
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 45eb42d9990b..7fce2efc8707 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -14,8 +14,34 @@
>   
>   struct net_iov {
>   	struct dmabuf_genpool_chunk_owner *owner;
> +	unsigned long dma_addr;
>   };
>   
> +static inline struct dmabuf_genpool_chunk_owner *
> +net_iov_owner(const struct net_iov *niov)
> +{
> +	return niov->owner;
> +}
> +
> +static inline unsigned int net_iov_idx(const struct net_iov *niov)
> +{
> +	return niov - net_iov_owner(niov)->niovs;
> +}
> +
> +static inline dma_addr_t net_iov_dma_addr(const struct net_iov *niov)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
> +
> +	return owner->base_dma_addr +
> +	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);

Looks like it should have been niov->dma_addr

> +}
> +
> +static inline struct netdev_dmabuf_binding *
> +net_iov_binding(const struct net_iov *niov)
> +{
> +	return net_iov_owner(niov)->binding;
> +}
> +
>   /* netmem */
>   
>   struct netmem {
...

-- 
Pavel Begunkov
