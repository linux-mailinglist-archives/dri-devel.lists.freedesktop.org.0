Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6129CEA2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFB96E4B6;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734416EC3F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:08:18 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 140so2473450qko.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jrAbQmIO9l0gKRhCtebOMWdfiW13JmKcBvfXSkc8Lzo=;
 b=OyI3SNhYDvW6q5MZydasNII4hGtXtW6dwpLstJEBN55gIKylIc4vNfe0elqYpwF/Ts
 AXB1UTBX3tChPHZ5uKGVuq4d6OcCvHgapmqYhbc3XUH0e3RqpF7d9WNR3z+A1pJbLud3
 SQkbFLgt0qL6k3qUpkhwYuFTvEaSIzFh67ohJbJeD7ZU6g7wHQPlpVMq8oE0yJrf7fDZ
 4SzdATUi0DwmyCzI2ClJZz6dwEWHiUr/zXCP7a8sZV22LxxYfd9ZHywzR58z3NDe0KmS
 9D4PX0JuLm/zanRoYE5LaQm3KF15KDfwd6X8vRA1VFrMmx1kU+77/Zg8DHLa7am8nZ7i
 0qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jrAbQmIO9l0gKRhCtebOMWdfiW13JmKcBvfXSkc8Lzo=;
 b=Si45TkjabhQ+ao9BxCaZuiwHTa93DdktmsBILsdzDgkWFQKPifyW1kYqqBu2Yj7PZ3
 2EkQWCiVixkGpV947VwNspru2p/yXyXVKChYqFReQIJ9mFCYPfzdGN5aBcMV63jXbOmw
 MmHAuy5RsaB1gi23W4G736FyJo5YE6FcBF2fLQ3wC5agDV/Cn6d6NDPhgEiUt4SX3dr/
 z+YN0rW6wxoEZu2ulxTxsKbTQrlC49U1cEjSrOZHrxLuiDWDRcFHfMPOF16O13ma8J+G
 FxBLJVSY4PsqF0xn1XV+LVj7efjEulzwaUu+UAFcYku1rkKv6IlDuSsX7nIUQh2utDFg
 O73A==
X-Gm-Message-State: AOAM533u1Qj2Yl6qKpI8prnOY4StUeQ7P0z0z72tBa89cz5jTgVJJ0jb
 F5Xr+9b2rKdEzXcfB+sPYyu8Fw==
X-Google-Smtp-Source: ABdhPJwUL2sZmjopWwOlm9Qm+gVas9mebhyAozpumTzdtQJA0/KPrF4gIh761hU1h+pPbAiwu9gwqw==
X-Received: by 2002:a05:620a:a4c:: with SMTP id
 j12mr3678015qka.263.1603829297591; 
 Tue, 27 Oct 2020 13:08:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h125sm1497410qkc.36.2020.10.27.13.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 13:08:16 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kXVGS-009fOZ-Aj; Tue, 27 Oct 2020 17:08:16 -0300
Date: Tue, 27 Oct 2020 17:08:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201027200816.GX36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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

On Fri, Oct 23, 2020 at 09:40:01AM -0700, Jianxin Xiong wrote:

> diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
> index b261797..3bc412b 100644
> +++ b/drivers/infiniband/hw/mlx5/mr.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2013-2015, Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -36,6 +37,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/export.h>
>  #include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>  #include <rdma/ib_umem.h>
>  #include <rdma/ib_umem_odp.h>
>  #include <rdma/ib_verbs.h>
> @@ -1113,6 +1116,8 @@ int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
>  		dma_sync_single_for_cpu(ddev, dma, size, DMA_TO_DEVICE);
>  		if (mr->umem->is_odp) {
>  			mlx5_odp_populate_xlt(xlt, idx, npages, mr, flags);
> +		} else if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP)) {
> +			memset(xlt, 0, size);
>  		} else {
>  			__mlx5_ib_populate_pas(dev, mr->umem, page_shift, idx,
>  					       npages, xlt,
> @@ -1462,6 +1467,111 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
>  	return ERR_PTR(err);
>  }
>  
> +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> +	struct mlx5_ib_mr *mr = umem_dmabuf->device_context;
> +
> +	mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, MLX5_IB_UPD_XLT_ZAP);
> +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +}
> +
> +static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
> +	.allow_peer2peer = 1,
> +	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
> +};
> +
> +struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
> +					 u64 length, u64 virt_addr,
> +					 int fd, int access_flags,
> +					 struct ib_udata *udata)
> +{
> +	struct mlx5_ib_dev *dev = to_mdev(pd->device);
> +	struct mlx5_ib_mr *mr = NULL;
> +	struct ib_umem *umem;
> +	struct ib_umem_dmabuf *umem_dmabuf;
> +	int npages;
> +	int order;
> +	int err;
> +
> +	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	mlx5_ib_dbg(dev,
> +		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
> +		    offset, virt_addr, length, fd, access_flags);
> +
> +	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
> +		return ERR_PTR(-EINVAL);
> +
> +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> +				  &mlx5_ib_dmabuf_attach_ops);
> +	if (IS_ERR(umem)) {
> +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> +		return ERR_PTR(PTR_ERR(umem));
> +	}
> +
> +	npages = ib_umem_num_pages(umem);
> +	if (!npages) {

ib_umem_get should reject invalid umems like this

> +		mlx5_ib_warn(dev, "avoid zero region\n");
> +		ib_umem_release(umem);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	order = ilog2(roundup_pow_of_two(npages));

Must always call ib_umem_find_best_pgsz(), specify PAGE_SIZE as the
argument for this scenario

> +	mlx5_ib_dbg(dev, "npages %d, ncont %d, order %d, page_shift %d\n",
> +		    npages, npages, order, PAGE_SHIFT);
> +
> +	mr = alloc_mr_from_cache(pd, umem, virt_addr, length, npages,
> +				 PAGE_SHIFT, order, access_flags);
> +	if (IS_ERR(mr))
> +		mr = NULL;
> +
> +	if (!mr) {
> +		mutex_lock(&dev->slow_path_mutex);
> +		mr = reg_create(NULL, pd, virt_addr, length, umem, npages,
> +				PAGE_SHIFT, access_flags, false);
> +		mutex_unlock(&dev->slow_path_mutex);
> +	}

Rebase on the mlx5 series just posted and use their version of this
code sequence, this is just not quite right


> +	err = mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT,
> +				 MLX5_IB_UPD_XLT_ENABLE | MLX5_IB_UPD_XLT_ZAP);
> +
> +	if (err) {
> +		dereg_mr(dev, mr);
> +		return ERR_PTR(err);
> +	}

The current mlx5 code preloads the buffer with the right data, zapping
is fairly expensive, mapping and loading is the same cost

> @@ -1536,7 +1646,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
>  	if (!mr->umem)
>  		return -EINVAL;
>  
> -	if (is_odp_mr(mr))
> +	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
>  		return -EOPNOTSUPP;
>  
>  	if (flags & IB_MR_REREG_TRANS) {
> @@ -1695,7 +1805,7 @@ static void dereg_mr(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr)
>  	struct ib_umem *umem = mr->umem;
>  
>  	/* Stop all DMA */
> -	if (is_odp_mr(mr))
> +	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
>  		mlx5_ib_fence_odp_mr(mr);

Make a dma buf specific function

I have another series touching this area too, but I think 

> @@ -801,6 +816,52 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
>   * Returns:
>   *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
>   *           not accessible, or the MR is no longer valid.
> + *  -EAGAIN: The operation should be retried
> + *
> + *  >0: Number of pages mapped
> + */
> +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, struct ib_umem *umem,
> +			       u64 io_virt, size_t bcnt, u32 *bytes_mapped,
> +			       u32 flags)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
> +	u64 user_va;
> +	u64 end;
> +	int npages;
> +	int err;
> +
> +	if (unlikely(io_virt < mr->mmkey.iova))
> +		return -EFAULT;
> +	if (check_add_overflow(io_virt - mr->mmkey.iova,
> +			       (u64)umem->address, &user_va))
> +		return -EFAULT;
> +	/* Overflow has alreddy been checked at the umem creation time */
> +	end = umem->address + umem->length;
> +	if (unlikely(user_va >= end || end  - user_va < bcnt))
> +		return -EFAULT;

Why duplicate this sequence? Caller does it

> @@ -811,6 +872,10 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
>  {
>  	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
>  
> +	if (is_dmabuf_mr(mr))
> +		return pagefault_dmabuf_mr(mr, mr->umem, io_virt, bcnt,
> +					   bytes_mapped, flags);
> +
>  	lockdep_assert_held(&mr->dev->odp_srcu);
>  	if (unlikely(io_virt < mr->mmkey.iova))
>  		return -EFAULT;
> @@ -1747,7 +1812,6 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
>  {
>  	struct mlx5_ib_dev *dev = to_mdev(pd->device);
>  	struct mlx5_core_mkey *mmkey;
> -	struct ib_umem_odp *odp;
>  	struct mlx5_ib_mr *mr;
>  
>  	lockdep_assert_held(&dev->odp_srcu);
> @@ -1761,11 +1825,9 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
>  	if (mr->ibmr.pd != pd)
>  		return NULL;
>  
> -	odp = to_ib_umem_odp(mr->umem);
> -
>  	/* prefetch with write-access must be supported by the MR */
>  	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> -	    !odp->umem.writable)
> +	    !mr->umem->writable)

??

This does look basically right though. I think a little more polishing
and it can be merged. It does need to go after the mlx5 MR series
though..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
