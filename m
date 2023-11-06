Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0ED7E2E8B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6C010E41D;
	Mon,  6 Nov 2023 21:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2211410E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:02:41 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1cc29f3afe0so32109935ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699304560; x=1699909360;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3YVT/6GQJuQ7TjvhzDWajYThozSBRZLd2V3VGmhBHao=;
 b=C3NscMGmz7U/Euu5TrgdNDJTthamQxHGkkhHo1w/yFokXa3gvAEWT860b8Q4RiTfXc
 kP1rUNRCzEvJdf1Dcr/lD6Y6zZHtyhMuYZqjqPzzABdNuE19+Ln/ZJb+D/lyV8UBbTV8
 DwLYlgU+Ywrs12f06PRJg6pGrKY8m1I0+rLDMGpnnOG3+Dm2NstaxUD2AFVHLFC+wIZA
 1+gfLtfC1Sysh5tVw+3LgE7GhzY9bIfZdpuTb9Zsc3y7xzFMZbXIPJAfLAesfZVP7Eo1
 L9rr2QAiC5shd6DHb2vhHp+WYPO4HhPFDrH9bqKvDWGGGZZROnX+xWO6rdI1JnbfTvfY
 kTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699304560; x=1699909360;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YVT/6GQJuQ7TjvhzDWajYThozSBRZLd2V3VGmhBHao=;
 b=Gtm6yHpPfWUStLGisXaWhNmJXS/BxZS1JP8mKx9ayeYg1Pogjw56WR9kdcYZpDczFP
 Agfl/80t1kxUNErBpPGP9ufdD7+lKFyUBcnD0AlMPpPItS7s6EWZSUAN0pkDP4bKJlE5
 8WR7DC53dKbVKZXNYyDwCybnvbYN9DdIM01Lhx63KfWv0d1ouWLHL3RsY0eQANRjI0w0
 jxuRvRTBHFVEMkM8+p/ANVHGLCL09L/VHaXSD++qdX/98g/OY/IXwKpuGDG8I7Q3hi2U
 jp378zjnfxiokvk8jpDftbw9XWEAbfxH5z5cKz0NNaRFIAwFz1A/KI95ibcOWKfd9BwG
 lmhA==
X-Gm-Message-State: AOJu0YwF3NunHIsRznq8QPRgaWQ/ms5Q5MnGb2ViUQtisxody2miXzZa
 OM9nInkYJaocy1IrjlbVQ7V6eag=
X-Google-Smtp-Source: AGHT+IFMk9K2QPc1yRl8QNToni4u3wTj7lMIW1WMnLhrEu9KTQ1j0Kkg7CJFxK+wf+6qBsS5/cJoFOo=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:ee14:b0:1ca:b952:f5fa with SMTP id
 z20-20020a170902ee1400b001cab952f5famr509511plb.5.1699304560650; Mon, 06 Nov
 2023 13:02:40 -0800 (PST)
Date: Mon, 6 Nov 2023 13:02:39 -0800
In-Reply-To: <20231106024413.2801438-7-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
Message-ID: <ZUlUb93BFbPBRJFm@google.com>
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
From: Stanislav Fomichev <sdf@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05, Mina Almasry wrote:
> Implement a memory provider that allocates dmabuf devmem page_pool_iovs.
> 
> Support of PP_FLAG_DMA_MAP and PP_FLAG_DMA_SYNC_DEV is omitted for
> simplicity.
> 
> The provider receives a reference to the struct netdev_dmabuf_binding
> via the pool->mp_priv pointer. The driver needs to set this pointer for
> the provider in the page_pool_params.
> 
> The provider obtains a reference on the netdev_dmabuf_binding which
> guarantees the binding and the underlying mapping remains alive until
> the provider is destroyed.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
>  include/net/page_pool/helpers.h | 40 +++++++++++++++++
>  include/net/page_pool/types.h   | 10 +++++
>  net/core/page_pool.c            | 76 +++++++++++++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
> 
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 78cbb040af94..b93243c2a640 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -53,6 +53,7 @@
>  #define _NET_PAGE_POOL_HELPERS_H
>  
>  #include <net/page_pool/types.h>
> +#include <net/net_debug.h>
>  
>  #ifdef CONFIG_PAGE_POOL_STATS
>  int page_pool_ethtool_stats_get_count(void);
> @@ -111,6 +112,45 @@ page_pool_iov_binding(const struct page_pool_iov *ppiov)
>  	return page_pool_iov_owner(ppiov)->binding;
>  }
>  
> +static inline int page_pool_iov_refcount(const struct page_pool_iov *ppiov)
> +{
> +	return refcount_read(&ppiov->refcount);
> +}
> +
> +static inline void page_pool_iov_get_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	refcount_add(count, &ppiov->refcount);
> +}
> +
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
> +static inline bool page_is_page_pool_iov(const struct page *page)
> +{
> +	return (unsigned long)page & PP_DEVMEM;
> +}

Speaking of bpf: one thing that might be problematic with this PP_DEVMEM
bit is that it will make debugging with bpftrace a bit (more)
complicated. If somebody were trying to get to that page_pool_iov from
the frags, they will have to do the equivalent of page_is_page_pool_iov,
but probably not a big deal? (thinking out loud)
