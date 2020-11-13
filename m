Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF412B1754
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF006E45C;
	Fri, 13 Nov 2020 08:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB6D6E303
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 00:39:48 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j31so5604288qtb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h6qBToDAZs6M5ADvF0HkEp/ds1rUaGZSMQv/VFn44Q8=;
 b=m5g0crMfZzWb5UJhVrQqe2+NCXyDggfeAw5sI3nNLCax7HdjWx792Rc/SMNcq5I82b
 pnlaepsazd+OQ7JeJWTicHIR0+JlmtHvjCqE+QION5ssNDtbHjitPvAs101WDoeAtiD6
 hhbrEHmMKFJdAHlMfl544iJHlSjn1PmJ8vBIsRB32JYXhS2IKj4M4LzqLTtGWwtkUsE/
 +u25dwF4PXz/krTgkr9NKReX0Am6ISF8iCKcJLRABg9e00YmKx7DLrCXGI/3YH7bgwFx
 d2Y0dYmUvq+nTN1tnlaV2CkgvW+ay98hZ3tLuLJzwYRWDqzlyb3RSGrwd0/jr8Zbl7SI
 OcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h6qBToDAZs6M5ADvF0HkEp/ds1rUaGZSMQv/VFn44Q8=;
 b=SEzq7/x/dQgaubV9UKLjBAIWkAn/rhVfZk6hnwC71j6/oE4ze7kO0xTGx6m7913Wgr
 NjtPBm0HOQ+O2ccHckHI3aBqfMFsMtDFx4NYSTeNKtGFnFSXtu2Fm8XS6/pz9RvNjVjc
 a0d6vpzdk5LcW8M8guUSPS3+or3hRo/tfVv8uLfCQuqZjFjLHXX423tDQ+kPqmrSorHi
 u8fhXmLkVyiWDEzWhHMAoLAgd4cBF4gd9F2FEN7RktaNwsgnr7nM8+b4MhqvNBAn5IXb
 GZSkD5+Oks+6pNisEm3dEjtm+vIci+JMGrkh2etLOBgo1umKvgAOXPloTJXt4lGRn1vc
 VwrA==
X-Gm-Message-State: AOAM533Mk9ngUxjAKgt9pBPjLk/cY0ozOQ8QT8b1S6t/rge46JnyULz/
 XpMz7NKp07B5LJVzq1BtAaUwZg==
X-Google-Smtp-Source: ABdhPJzMypy5XG3wUJxMiu91C2Tc3la7UW0arNLqhXTsQV7Hpa0T4g89Blb1+ksigKf2Qn6dLFNNSg==
X-Received: by 2002:aed:2ce1:: with SMTP id g88mr1965953qtd.299.1605227988052; 
 Thu, 12 Nov 2020 16:39:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z88sm4335279qtd.46.2020.11.12.16.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:39:47 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdN7y-004Cbm-Tw; Thu, 12 Nov 2020 20:39:46 -0400
Date: Thu, 12 Nov 2020 20:39:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace
 memory region
Message-ID: <20201113003946.GA244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605044477-51833-5-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 01:41:15PM -0800, Jianxin Xiong wrote:

> -static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
> +int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
>  {
>  	struct mlx5_ib_dev *dev = mr->dev;
>  	struct device *ddev = dev->ib_dev.dev.parent;
> @@ -1255,6 +1267,10 @@ static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
>  		cur_mtt->ptag =
>  			cpu_to_be64(rdma_block_iter_dma_address(&biter) |
>  				    MLX5_IB_MTT_PRESENT);
> +
> +		if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP))
> +			cur_mtt->ptag = 0;
> +
>  		cur_mtt++;
>  	}
>  
> @@ -1291,8 +1307,15 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
>  	int err;
>  	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
>  
> -	page_size =
> -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> +	if (umem->is_dmabuf) {
> +		if ((iova ^ umem->address) & (PAGE_SIZE - 1))
> +			return ERR_PTR(-EINVAL);
> +		umem->iova = iova;
> +		page_size = PAGE_SIZE;
> +	} else {
> +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> +						     0, iova);
> +	}

Urk, maybe this duplicated sequence should be in a function..

This will also collide with a rereg_mr bugfixing series that should be
posted soon..

> +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> +	struct mlx5_ib_mr *mr = umem_dmabuf->private;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (mr)

I don't think this 'if (mr)' test is needed anymore? I certainly
prefer it gone as it is kind of messy. I expect unmapping the dma to
ensure this function is not running, and won't run again.

> +/**
> + * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
> + * @mr: to fence
> + *
> + * On return no parallel threads will be touching this MR and no DMA will be
> + * active.
> + */
> +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> +
> +	/* Prevent new page faults and prefetch requests from succeeding */
> +	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
> +
> +	/* Wait for all running page-fault handlers to finish. */
> +	synchronize_srcu(&mr->dev->odp_srcu);
> +
> +	wait_event(mr->q_deferred_work, !atomic_read(&mr->num_deferred_work));
> +
> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	mlx5_mr_cache_invalidate(mr);
> +	umem_dmabuf->private = NULL;
> +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (!mr->cache_ent) {
> +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> +		WARN_ON(mr->descs);
> +	}

I didn't check carefully, but are you sure this destroy_mkey should be
here??

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
