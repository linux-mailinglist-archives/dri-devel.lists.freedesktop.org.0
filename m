Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F36D17DB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 08:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0810F107;
	Fri, 31 Mar 2023 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0AB10F105;
 Fri, 31 Mar 2023 06:54:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ek18so85868242edb.6;
 Thu, 30 Mar 2023 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680245695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T350syEDwkn/f0xzRemPbRMMflXvKJZI0903FV+qLWM=;
 b=j/y8vIAseCne2B9rjRsy0XPjVqT7yKosbTclMCPKwD4aWdO04Lc3EKdpsSBouySLwN
 UMEl+/tWOIHPqMiy5IfMIuUlcs1hmmQcVCKN0U+Cu19N9N00AgoMpUiUuYujL0aJ/Y4k
 wr0R4zb8BMGRhwaiGOieeummVA3EmG2U/XxiUscbHECmOCkVxtB+wJ4I8pys3t5FGECY
 vcOp9Ut8+pE8HLiwfB5sm5uNwfAtzosWrPCNho/3q+hwgnbvQNl336+oLW67WI4kKD8t
 sGtrBFjVyxwfvoa+VAgxcdfu7qAgS9G8oZE6NzTJtI73XmYqJTrXTwrrGQAMfemmmyUq
 uN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680245695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T350syEDwkn/f0xzRemPbRMMflXvKJZI0903FV+qLWM=;
 b=SZQt/Tw1ChtoPy5/Rlb0hesylIgafNd8Stwzk3mh90J3yxJoajNFvaotj237UWZQ38
 UfTbBm01cxCdHlkv5fGIwF8t0wndemZam8AVmFKIefYoj1Dx/+bLYqGyGl7aup/jHLLi
 sqZGzt0Z1ZS6j6hKCLDxn0dzLbJYWay4uJ6TPaWVb3TnA0u9SzwIm3dorsFRMuMteHlh
 N4cH1Y5ltYIHzoicbJKMsVquxgKnUZN6Iamn4pyeYv/KgIN8+Ry7wgfnx+maWgcJH1tN
 /233M4IBOpuUqksT5cWVfgAgqgDQeDQSeJsBtbBM8/XO5HONXmiIO+LYquxo0mbkCAZS
 QzGw==
X-Gm-Message-State: AAQBX9eLsvASlVrVJ/gmrxrGcshJfQ8QHH4Ph2qf7fFKddHrFFr8qoyO
 HARXoEi6zEG9BpjgtZOfBbi0dJisTGT8ow==
X-Google-Smtp-Source: AKy350b5twJiGsxQ7dZ6XR/NGuhWFp/oHm3MLi2s+y0w/uv99pR2pMgRvRxBBVAMPa+8PT1M2Qdpmw==
X-Received: by 2002:a17:906:4888:b0:932:da0d:96ac with SMTP id
 v8-20020a170906488800b00932da0d96acmr25776008ejq.10.1680245695277; 
 Thu, 30 Mar 2023 23:54:55 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a1709060a0a00b00933c4a25735sm637336ejf.100.2023.03.30.23.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 23:54:54 -0700 (PDT)
Message-ID: <aeb5c27e-121d-f666-249c-898e98d5ec2f@gmail.com>
Date: Fri, 31 Mar 2023 08:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: add NUMA node id to the pool
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230330195043.1136322-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230330195043.1136322-1-alexander.deucher@amd.com>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Graham Sider <graham.sider@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Should I push this to drm-misc-next or do we take it through 
amd-staging-drm-next?

Christian.

Am 30.03.23 um 21:50 schrieb Alex Deucher:
> From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>
> This allows backing ttm_tt structure with pages from different NUMA
> pools.
>
> Tested-by: Graham Sider <graham.sider@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c |  2 +-
>   drivers/gpu/drm/ttm/ttm_pool.c   | 13 ++++++++-----
>   include/drm/ttm/ttm_pool.h       |  4 +++-
>   3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7147e304637..4a8164a5320f 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -218,7 +218,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	bdev->funcs = funcs;
>   
>   	ttm_sys_man_init(bdev);
> -	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> +	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
>   	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 9f6764bf3b15..1068a41cded1 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -92,7 +92,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   			__GFP_KSWAPD_RECLAIM;
>   
>   	if (!pool->use_dma_alloc) {
> -		p = alloc_pages(gfp_flags, order);
> +		p = alloc_pages_node(pool->nid, gfp_flags, order);
>   		if (p)
>   			p->private = order;
>   		return p;
> @@ -286,7 +286,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   						  enum ttm_caching caching,
>   						  unsigned int order)
>   {
> -	if (pool->use_dma_alloc)
> +	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
>   		return &pool->caching[caching].orders[order];
>   
>   #ifdef CONFIG_X86
> @@ -523,29 +523,32 @@ EXPORT_SYMBOL(ttm_pool_free);
>    *
>    * @pool: the pool to initialize
>    * @dev: device for DMA allocations and mappings
> + * @nid: NUMA node to use for allocations
>    * @use_dma_alloc: true if coherent DMA alloc should be used
>    * @use_dma32: true if GFP_DMA32 should be used
>    *
>    * Initialize the pool and its pool types.
>    */
>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   bool use_dma_alloc, bool use_dma32)
> +		   int nid, bool use_dma_alloc, bool use_dma32)
>   {
>   	unsigned int i, j;
>   
>   	WARN_ON(!dev && use_dma_alloc);
>   
>   	pool->dev = dev;
> +	pool->nid = nid;
>   	pool->use_dma_alloc = use_dma_alloc;
>   	pool->use_dma32 = use_dma32;
>   
> -	if (use_dma_alloc) {
> +	if (use_dma_alloc || nid != NUMA_NO_NODE) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>   			for (j = 0; j < MAX_ORDER; ++j)
>   				ttm_pool_type_init(&pool->caching[i].orders[j],
>   						   pool, i, j);
>   	}
>   }
> +EXPORT_SYMBOL(ttm_pool_init);
>   
>   /**
>    * ttm_pool_fini - Cleanup a pool
> @@ -559,7 +562,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   {
>   	unsigned int i, j;
>   
> -	if (pool->use_dma_alloc) {
> +	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>   			for (j = 0; j < MAX_ORDER; ++j)
>   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index ef09b23d29e3..23bd8be6d4f8 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -61,12 +61,14 @@ struct ttm_pool_type {
>    * struct ttm_pool - Pool for all caching and orders
>    *
>    * @dev: the device we allocate pages for
> + * @nid: which numa node to use
>    * @use_dma_alloc: if coherent DMA allocations should be used
>    * @use_dma32: if GFP_DMA32 should be used
>    * @caching: pools for each caching/order
>    */
>   struct ttm_pool {
>   	struct device *dev;
> +	int nid;
>   
>   	bool use_dma_alloc;
>   	bool use_dma32;
> @@ -81,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>   
>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   bool use_dma_alloc, bool use_dma32);
> +		   int nid, bool use_dma_alloc, bool use_dma32);
>   void ttm_pool_fini(struct ttm_pool *pool);
>   
>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);

