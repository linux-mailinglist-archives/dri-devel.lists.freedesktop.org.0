Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496EF88BC1F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F11910E1C4;
	Tue, 26 Mar 2024 08:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.b="RoW+3/ZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CBD10EC53
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 04:50:53 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42PMIxAe009321; Mon, 25 Mar 2024 21:50:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=pfpt0220; bh=9EyZHpQZPtNoiJ0ASAEMb+
 9ZjiK6Us0t8XuxBxb61RY=; b=RoW+3/ZKAryUcbnF//1Pwcp2mZD0LhFslGpJgq
 DNVQNxquyUWqj0Fcdw5wqxwPk7zv6dgrF7uSnuI5HQ8wC0RAbYZdUVOA2ADajE9v
 quCZEkVPiJQDY/EmKFOqutsjsDIGFxRHycGJ5FkySb+inBrs/9F0SZUFNqfxOvRv
 I/ERMQZPLNgWds1t+XiFj+9eZ2usURlzwV24EerF2lkogF+xv6CdWL+opNBwJNZI
 EPVxsf/KPp4VXiWUArLFEkILZY6s0SGPFhrHAN6eWE5WfruSVc7PN5hbmCHRfbD6
 N9v5lEwK64LSExoNJ2BCtT0dFkV8ZV0CV5DPZmQVwFHG0NgA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3x3hy1s47q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 21:50:12 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 25 Mar 2024 21:50:11 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 25 Mar 2024 21:50:11 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
 by maili.marvell.com (Postfix) with SMTP id A7E6E3F703F;
 Mon, 25 Mar 2024 21:50:05 -0700 (PDT)
Date: Tue, 26 Mar 2024 10:20:04 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Julien Panis <jpanis@baylibre.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH net-next v4 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
Message-ID: <20240326045004.GA1362097@maili.marvell.com>
References: <20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v4-2-2e45e5dec048@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v4-2-2e45e5dec048@baylibre.com>
X-Proofpoint-GUID: IFJZH7V3Fi2mQzI6h7hsUbbGIVLBJOBJ
X-Proofpoint-ORIG-GUID: IFJZH7V3Fi2mQzI6h7hsUbbGIVLBJOBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_02,2024-03-21_02,2023-05-22_02
X-Mailman-Approved-At: Tue, 26 Mar 2024 08:17:56 +0000
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

On 2024-03-25 at 21:30:36, Julien Panis (jpanis@baylibre.com) wrote:
> This patch introduces a member and the related accessors which can be
> used to store descriptor specific additional information. This member
> can store, for instance, an ID to differentiate a skb TX buffer type
> from a xdpf TX buffer type.
>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 24 ++++++++++++++++++++++++
>  drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> index fe8203c05731..d0c68d722ef2 100644
> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
> @@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
>  	size_t			mem_size;
>  	size_t			num_desc;
>  	struct gen_pool		*gen_pool;
> +	void			**desc_infos;
>  };
>
>  void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
> @@ -72,6 +73,15 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
>  		goto gen_pool_create_fail;
>  	}
>
> +	pool->desc_infos = devm_kcalloc(dev, pool->num_desc,
> +					sizeof(*pool->desc_infos), GFP_KERNEL);
This should be freed as well, right ?
.set_channels() in ethtool ops cleans pools; but not this. This wont
result in memory leak ? s/devm_kcalloc/kcalloc if my comment
is correct.

> +	if (!pool->desc_infos) {
> +		ret = -ENOMEM;
> +		dev_err(pool->dev, "pool descriptor infos alloc failed %d\n", ret);
> +		kfree_const(pool_name);
> +		goto gen_pool_desc_infos_alloc_fail;
> +	}
> +
>  	pool->gen_pool->name = pool_name;
>
>  	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
> @@ -94,6 +104,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
>  	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
>  			  pool->dma_addr);
>  dma_alloc_fail:
> +	devm_kfree(pool->dev, pool->desc_infos);
> +gen_pool_desc_infos_alloc_fail:
>  	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
>  gen_pool_create_fail:
>  	devm_kfree(pool->dev, pool);
> @@ -144,5 +156,17 @@ void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool)
>  }
>  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
>
> +void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info)
> +{
> +	pool->desc_infos[desc_idx] = info;
> +}
> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
> +
> +void *k3_cppi_desc_pool_desc_info(struct k3_cppi_desc_pool *pool, int desc_idx)
> +{
> +	return pool->desc_infos[desc_idx];
> +}
> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> index 149d5579a5e2..0076596307e7 100644
> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
> @@ -28,5 +28,7 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
>  size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
>  size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
>  void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
> +void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info);
> +void *k3_cppi_desc_pool_desc_info(struct k3_cppi_desc_pool *pool, int desc_idx);
>
>  #endif /* K3_CPPI_DESC_POOL_H_ */
>
> --
> 2.37.3
>
