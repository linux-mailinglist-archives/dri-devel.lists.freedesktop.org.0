Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDA80B06C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 00:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3910EB5F;
	Fri,  8 Dec 2023 23:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A6410EB5F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 23:13:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c0a074e71so26387375e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702077206; x=1702682006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdvT6mOf5g65CEarA8B1SO8V/fqN2dA07OWm6nPK8JQ=;
 b=bm2Y21fb/FTzyKTDJndlwV1WaVTku0mbHTc6RLIJLmCYMDzaDbBP3yuRcxFH7UlGBC
 a+DhiNbITYlZ+E4J/CRRNBbnys6QUSW6lzOkw4WzKROuuYseuXQz6HJ1WSqXGyed7pF+
 s2ioD9RlJ7JOE5k/YlRu7lpL1jbAMrGKJxxOGTdZJ2Bb+zcgowLKCMUm52yxBxqBuNFJ
 7l5hdN9Dx2GHnOJfqjqI1HYa9IeTqawiDUAyD/0rqt+qwoiMEaSVSYIL9QWpTswW5INV
 XgMVywIaK3c/ZnYmAnSw6lgcz+V/4g4k6hGbncNCRdMQ4meF4Jf/wbdTRY5IQBAzk4Ux
 RKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702077206; x=1702682006;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdvT6mOf5g65CEarA8B1SO8V/fqN2dA07OWm6nPK8JQ=;
 b=OaFGDabt5/1106ZvsGKBzHxG0LY2gEi07BjXmx4JOQOLJDfFpEAMD4a4Thnp8wo0/L
 oeE+P1Vl67xx/5tDp0SrbdLJxfPjfTTrcdOy3dR220tHn8EF7lkvF0oto5lj6dP0aDsx
 jeRbzaRFLYsGximFH5BwNj9TeLrSRFXUUdzYwO5D17n6Ukj3I2g/MBD/eWopONsdxn9r
 9ERiJ2koWgHWuFqOFHcEejnVIes1BUjzOJI4mmKxdjr6osSIwjKJW9+1ccMQ0C6b3z3U
 9n5blvE4fISLB8u3XfWfuh/johWcpPqxuUhGzUHkJ0ga45KL/Aqp8rcZgE5AKT0XqC/7
 f/oQ==
X-Gm-Message-State: AOJu0Yy28vpSQYXRnoQsOWcpa3RoX5Wbw4ymXPFP75lMQOv2A6Ym2Mu6
 dHR8y7R0HIfPDpECtGJ4Nyc=
X-Google-Smtp-Source: AGHT+IEBHi/D2vKjO2h2A/tT7jCBjGoOCfZq8DH8NQxvNJdBherB8vnCQiq7VQs7WHEKIMjIAwZ5UA==
X-Received: by 2002:adf:f74e:0:b0:333:546b:bcda with SMTP id
 z14-20020adff74e000000b00333546bbcdamr358457wrp.137.1702077205923; 
 Fri, 08 Dec 2023 15:13:25 -0800 (PST)
Received: from [192.168.8.100] ([85.255.236.117])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a5d5961000000b0033346fe9b9bsm2923952wri.83.2023.12.08.15.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 15:13:25 -0800 (PST)
Message-ID: <d17e203c-ee9f-44fc-8b03-bb34e80701e7@gmail.com>
Date: Fri, 8 Dec 2023 23:05:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20231208005250.2910004-9-almasrymina@google.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/23 00:52, Mina Almasry wrote:
> Implement a memory provider that allocates dmabuf devmem page_pool_iovs.
> 
> The provider receives a reference to the struct netdev_dmabuf_binding
> via the pool->mp_priv pointer. The driver needs to set this pointer for
> the provider in the page_pool_params.
> 
> The provider obtains a reference on the netdev_dmabuf_binding which
> guarantees the binding and the underlying mapping remains alive until
> the provider is destroyed.
> 
> Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
> the page_pool can provide the driver with the dma-addrs of the devmem.
> 
> Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
[...]
> +void __page_pool_iov_free(struct page_pool_iov *ppiov);
> +
> +static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	if (!refcount_sub_and_test(count, &ppiov->refcount))
> +		return;
> +
> +	__page_pool_iov_free(ppiov);
> +}
> +
> +/* page pool mm helpers */
> +
> +DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
> +static inline bool page_is_page_pool_iov(const struct page *page)
> +{
> +	return static_branch_unlikely(&page_pool_mem_providers) &&
> +	       (unsigned long)page & PP_IOV;

Are there any recommendations of not using static keys in widely
used inline functions? I'm not familiar with static key code
generation, but I think the compiler will bloat users with fat chunks
of code in unlikely paths. And I'd assume it creates an array of all
uses, which it'll be walked on enabling/disabling the branch.

> +}
> +
> +static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
> +{
> +	if (page_is_page_pool_iov(page))
> +		return (struct page_pool_iov *)((unsigned long)page & ~PP_IOV);
> +
> +	DEBUG_NET_WARN_ON_ONCE(true);
> +	return NULL;
> +}
> +
>   /**
>    * page_pool_dev_alloc_pages() - allocate a page.
>    * @pool:	pool from which to allocate
-- 
Pavel Begunkov
