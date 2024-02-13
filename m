Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD528531E8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9E510E386;
	Tue, 13 Feb 2024 13:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VzMNFkQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14E910E386
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:29:26 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so754558566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707830965; x=1708435765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zFkfsfcQj3EYz0HghFi199sukal5EHX9cCiPBab+av8=;
 b=VzMNFkQJXzLAW/q1ajEGGJ/fG6llzpRxwRPbNcDOTFWlMM0DhB3FCpXD5zHn2+nsYU
 B0Qz63fy5rumomOenZN/NCSW1jdgwySkQqu0xrPUFK2/SIKpe0jWbfj+pH4LrJe6vOlr
 dymjIzppjrSRZBv2YG/PYVGO8QHQze9ddoj4dG4y+sv7/yfnONRytI2nDdcdGE2R3FJC
 HX4Pz1Xh7TDYSuLS4Y081TN7dsEOZXFBVp16oFpWdSZykVUP2sUZSNBVAoxlA/3IciKQ
 qIG5vSGzjAfcPjFWU6a6hmguFNWP0d40tlcGfRDsWcpWk5GQvwcmPBRiMFp5mgJHGBzS
 k7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707830965; x=1708435765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFkfsfcQj3EYz0HghFi199sukal5EHX9cCiPBab+av8=;
 b=p2I1pLS+1giTTFvC1NtObSWLYDx1Sc0QEZxw2b0tcmSIE4EEcHeQhNNcKVTrlZcPUR
 ES0ZSzZvazX9XA6bL5xGznNORB4BIyYzglT3hmaR1udrRxyJN010WQly8OqMlAg8oZVD
 vLJ5EutLSMurTXumTwuURp8flOwGPvqg8HYr2RoNASYOh8cbFw2fNjLr46uTQA6wjHvE
 272QET4URMuRjYSPQjT3DVdwxXJvfhBAkj0B/roHsh4KE1c0xdBqABfuSyY5neDxn1q0
 qaUv43bALPYWsfHoA2hMgaOum7EZhB13YRC2MXkwJoT75pZvIWXRJYai24sqlNCTEqxr
 PDfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/H+hh5yaOtrmNd0QSVfwI3uCnX5t1LpsLsNdgFt8etTmmvXyK4AiSxBWi+sy9x8NhyDUjaVwxSakKscLCbnWHQ2jMZJAD9VC6vtqLdWj6
X-Gm-Message-State: AOJu0Yz0UJMPXx+YrfFtek7/OtoGeDGm5fPo/zZ2guRD31HKCJa+AAmv
 aAYc34kvb7amRhUcBjBqBReFAXDiLToyivybNNlonKGgdbry7U43
X-Google-Smtp-Source: AGHT+IGAaHK3Sc+4l2nceOylDioj03KTZYisiZzBNDf0QqrfnPjsS5gVAqMxT1CZy/sHMpkrQYQHTA==
X-Received: by 2002:a17:907:9608:b0:a3c:d535:39b4 with SMTP id
 gb8-20020a170907960800b00a3cd53539b4mr2812254ejc.9.1707830964861; 
 Tue, 13 Feb 2024 05:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAx0oFGv8fB8fAq7b4SaoJ1hkmfp3uRl+/+fWTscotDvrWHCHXLoRxfjmKebhxzaOp3oxyPgCcBy0wUW20nGfcHDfKvRtEVCBS5GMpx8HXIHoIIZMS6tP/VX099E08YFCUDuCULizMEnqQPd1i3pKNIDm55WsBNPz+QhIoaSX7ZFh72jKyCoa/amNFGhou++pfV+8YwZ2G+iSP9cnlYVHdylj+4X4J8yWRtWXX86jElRP8t/wE8pBpbYSrQOXQkKZC054KciMa6FURknOG0VlXdC0zp6ZuNvVs9CBiiFkRg+DpmEMQXqYWkhkv4yajMT0pumZHd9eBNJSCmXW+vX7/5Y7C+7qkpJXiJKz8j16QLsdpngzR8AXEYmkEC9mrljQ2qx2Uhf41HTaD45Ry/g8pZuMKJrnmXQ9XLrlDUHGHpVa5vMb/VpXYM0MX3wyEKSkBPn9WaxUHLCzuGEpSs4WQ18r7An+vsFd+e8kSbUhrIET4qj5kolbXe6g24ua4jN6md+Aek5+o8ZKZbFFueWGHcDlwIGrMxBopiiwcsibAijsP5b6ASTAPNQJbwSkKDd7Iv3h3GQ8E11aFoWyv5GC4lOpTFJVkrmvqK+P6SQqmsZhYG3SaaqodTQu0imQwcfkfN7B+ACpJ9uAKlKD3Dw0RgwAksL4zO+wWutuLiqMU4JAtWP153NOjVWQzg1bwYvvy52JSOLKxmdbbth1bOJOxn6FlT5/nbQVz51EHzTC6lw4ox1I2zht1n4/pXvC4xJMyQm5LTy5aX4s9LmAqDUthV9ozliVnKX1wcX2x81SYpQRV+q41d4NethsIuQTU2Ruz5p7bLd0LUUCo1w5qiRkNvVsYH13WxW6rA4YDENQs8F446oIN/ku79kaRptVl0Lva5vqnk3MUnZLnpMV70VqOX4zcmX35IyvdxW67Yf8MDXj8F/OCINzsJpFdiTmZlqjivJ
 m8Z42xDWPt1Ba9H9tb9tPjRDLBd4st4Hcyg2svskzdCdAkPcAa+7wE97qvwfc2NlGS594TjKcJNHcP8uWQHqRcG9MKdFvKUQi5K4Yx7/O+Z84C8r4t2DD596gEUR83otfc9AIEDhgTigpPbmG50ZfjCdk3F8yw6j8etrDcjqrYh4vc5ekJWbAZSIopGyRzXI4aAmCqPWw4sUmqZgbLlSSYbjpe9a32jEJQUWsYgoAPXKb9gebtHfRlySE/0SsQNhCBfZebL28mKl6U/8HhaTcio+qP0Qpf6LeAccr+QpnbqnPAc3XcEaGO0CXVFbb/7fUR/b9AUkPijwDgjwlScg+IVVymbuFOyTfBYxART1X01/ib6XlltUbAskeZwd1nCBIZlS8S3h+4EPpKwdC873ok2ZFaYD9UX9T2pxClQTPGV1cJOKWFYAp8VTG4gM0OMgK3l4ZxjvbO0GtCoZs4FytGj6Efn1+Vi+vml6fpoWKPbu3VcW78o+R8TwxB9cYuHOMWskd+chMBSWkNAEpn6dhBxYV88HAs3p+7Mv1ftWzYOmwrDOzTPf6msY+M+SJNyrsdRC4aujSEetlZVrwLxEq4aFRcEnCQMs5Oh0ocQ1HMGCXwsBeFb8mo/MLE+mDYnVmG1vI6VS58tk5B8xg/IfMMml78r0vQiu751j5ao+tWo75K1Ma4CXeIJy9XDr9mStFHCYpZ8Xk66GhkBASkiUu31WX3xD/AGf4EuM4NM6LTuj6OqdwTUuN2hpbg2hfsdEZeB5cchVr2/dNvrvI/ZWsi77TMoyxmlpZuBW+T4Hu9Yi3c+8dT
Received: from ?IPV6:2620:10d:c096:310::23d8? ([2620:10d:c092:600::1:a107])
 by smtp.gmail.com with ESMTPSA id
 ss3-20020a170907c00300b00a3d1c0a3d5dsm221682ejc.63.2024.02.13.05.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:29:24 -0800 (PST)
Message-ID: <dd4a6633-36d0-4654-a5e1-2824de29c130@gmail.com>
Date: Tue, 13 Feb 2024 13:19:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v5 08/14] memory-provider: dmabuf devmem
 memory provider
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
 <20231218024024.3516870-9-almasrymina@google.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20231218024024.3516870-9-almasrymina@google.com>
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
> Implement a memory provider that allocates dmabuf devmem in the form of
> net_iov.
> 
> The provider receives a reference to the struct netdev_dmabuf_binding
> via the pool->mp_priv pointer. The driver needs to set this pointer for
> the provider in the net_iov.
> 
> The provider obtains a reference on the netdev_dmabuf_binding which
> guarantees the binding and the underlying mapping remains alive until
> the provider is destroyed.
> 
> Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
> the page_pool can provide the driver with the dma-addrs of the devmem.
> 
> Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity & p.order !=
> 0.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
...
> +
> +static bool mp_dmabuf_devmem_release_page(struct page_pool *pool,
> +					  struct netmem *netmem)
> +{
> +	WARN_ON_ONCE(!netmem_is_net_iov(netmem));
> +
> +	page_pool_clear_pp_info(netmem);
> +
> +	netdev_free_dmabuf(netmem_to_net_iov(netmem));
> +
> +	/* We don't want the page pool put_page()ing our net_iovs. */
> +	return false;
> +}
> +
> +const struct memory_provider_ops dmabuf_devmem_ops = {
> +	.init			= mp_dmabuf_devmem_init,
> +	.destroy		= mp_dmabuf_devmem_destroy,
> +	.alloc_pages		= mp_dmabuf_devmem_alloc_pages,
> +	.release_page		= mp_dmabuf_devmem_release_page,
> +};
> +EXPORT_SYMBOL(dmabuf_devmem_ops);

It might make sense to move all these functions together with
new code from core/dev.c into a new file

-- 
Pavel Begunkov
