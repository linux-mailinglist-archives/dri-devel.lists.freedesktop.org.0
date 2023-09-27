Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3C7B0735
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482410E544;
	Wed, 27 Sep 2023 14:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977E10E544
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:42:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99de884ad25so1445883466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695825749; x=1696430549; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DQa0uS9ZxVzUEvSIaoDnSyYxM+uNjYjcw68CuBARJN8=;
 b=AJLIdXBe9t45hMTGBE4AG5o95kLbE/53yLDJd8YwG9K574Hk302G+dd+NzCG1x6ko+
 fsSGTLkE+xivbJ6NZkuRFmaE2ixPe9UGZDaS3xjWcJLqJsDWmtuMBkLUJrETPTV9WsQO
 xJV7ubM3mMj0Q5+xoAaPBi5Zl948KS9Ufriks7xVza5o8gwAWoVB2D3H18yxhjkM2ign
 5/GI6Vgg2BGVzV/pc3W84lX0hxB9Sni6MlQ75nhn+r+tsu/INsoWo1DJbkDGHiX96H6B
 2ts2jbAwTXvPDnco+DaluyQHJOzcQNstoRDOiOQkivXtfBdAKWfCVQ+cKd5oVtwL0y49
 NI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695825749; x=1696430549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQa0uS9ZxVzUEvSIaoDnSyYxM+uNjYjcw68CuBARJN8=;
 b=JWMTbqably5yqFVT3+PxlMj0ude+flO/M0OXm8qW8t52MtFaPw+9AfbzQi/mZMdZhB
 Gyk2/URlNHzUxhWkSFqHXEACEBxvC1BSKxgF9xjgiT2JfR6JiqkvENlLhGyc53rngGFh
 2xpWwROaUDP11l4yuTq+dFy0GQrF9T8gAiYLPOmHb6l40FAPS+Dv/k07K98uTHVtl28E
 /1BAw8s7KWOqK7eWVJ7ASLsrsgkGotpE/in1dmR3Z1yXdNICz9XTgGbGojFbSC/rQPT6
 xXz6yiyaEztERZ9xOF6fxzjHV5icORXNH3IErjIn4HM6hLPHP1vjwYqaYLl3jhqp/Y/o
 2XTQ==
X-Gm-Message-State: AOJu0YxOlQGDd9Y7yunoDVbYzskc0uR+z+JF0TEOVdKzjytDBpzMtCfv
 ZaQyZmz0+XYWIGEv+JFw0g47xQ==
X-Google-Smtp-Source: AGHT+IHbkXEUZ2yiICh2bDKC3XoQRoR1GzJCgOavVhuustl4JEpqTa1gx5Cc9UIMgVeGD+zgjr8MaQ==
X-Received: by 2002:a17:906:5142:b0:9b2:ba65:db21 with SMTP id
 jr2-20020a170906514200b009b2ba65db21mr368111ejc.45.1695825749077; 
 Wed, 27 Sep 2023 07:42:29 -0700 (PDT)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com.
 [81.231.61.187]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906944f00b00993928e4d1bsm9374996ejx.24.2023.09.27.07.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 07:42:28 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:42:26 +0200
From: Joakim Bech <joakim.bech@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Message-ID: <20230927144226.pdssel3dwv53g546@pop-os.localdomain>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-5-yong.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, John Stultz <jstultz@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 jianjiao.zeng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, tjmercier@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 10:30:33AM +0800, Yong Wu wrote:
> Initialise a mtk_svp heap. Currently just add a null heap, Prepare for
> the later patches.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig           |  8 ++
>  drivers/dma-buf/heaps/Makefile          |  1 +
>  drivers/dma-buf/heaps/mtk_secure_heap.c | 99 +++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/mtk_secure_heap.c
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c4226..729c0cf3eb7c 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,11 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_MTK_SECURE
> +	bool "DMA-BUF MediaTek Secure Heap"
> +	depends on DMABUF_HEAPS && TEE
> +	help
> +	  Choose this option to enable dma-buf MediaTek secure heap for Secure
> +	  Video Path. This heap is backed by TEE client interfaces. If in
Although this is intended for SVP right now, this is something that very
well could work for other use cases. So, I think I'd not mention "Secure
Video Path" and just mention "secure heap".

> +	  doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 974467791032..df559dbe33fe 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_MTK_SECURE)	+= mtk_secure_heap.o
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> new file mode 100644
> index 000000000000..bbf1c8dce23e
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF mtk_secure_heap exporter
> + *
> + * Copyright (C) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/*
> + * MediaTek secure (chunk) memory type
> + *
> + * @KREE_MEM_SEC_CM_TZ: static chunk memory carved out for trustzone.
nit: s/trustzone/TrustZone/

-- 
// Regards
Joakim

> + */
> +enum kree_mem_type {
> +	KREE_MEM_SEC_CM_TZ = 1,
> +};
> +
> +struct mtk_secure_heap_buffer {
> +	struct dma_heap		*heap;
> +	size_t			size;
> +};
> +
> +struct mtk_secure_heap {
> +	const char		*name;
> +	const enum kree_mem_type mem_type;
> +};
> +
> +static struct dma_buf *
> +mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
> +		      unsigned long fd_flags, unsigned long heap_flags)
> +{
> +	struct mtk_secure_heap_buffer *sec_buf;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct dma_buf *dmabuf;
> +	int ret;
> +
> +	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
> +	if (!sec_buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sec_buf->size = size;
> +	sec_buf->heap = heap;
> +
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.size = sec_buf->size;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = sec_buf;
> +
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto err_free_buf;
> +	}
> +
> +	return dmabuf;
> +
> +err_free_buf:
> +	kfree(sec_buf);
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops mtk_sec_heap_ops = {
> +	.allocate	= mtk_sec_heap_allocate,
> +};
> +
> +static struct mtk_secure_heap mtk_sec_heap[] = {
> +	{
> +		.name		= "mtk_svp",
> +		.mem_type	= KREE_MEM_SEC_CM_TZ,
> +	},
> +};
> +
> +static int mtk_sec_heap_init(void)
> +{
> +	struct mtk_secure_heap *sec_heap = mtk_sec_heap;
> +	struct dma_heap_export_info exp_info;
> +	struct dma_heap *heap;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_sec_heap); i++, sec_heap++) {
> +		exp_info.name = sec_heap->name;
> +		exp_info.ops = &mtk_sec_heap_ops;
> +		exp_info.priv = (void *)sec_heap;
> +
> +		heap = dma_heap_add(&exp_info);
> +		if (IS_ERR(heap))
> +			return PTR_ERR(heap);
> +	}
> +	return 0;
> +}
> +
> +module_init(mtk_sec_heap_init);
> +MODULE_DESCRIPTION("MediaTek Secure Heap Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 
