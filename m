Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E912A78F8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C46EA10;
	Thu,  5 Nov 2020 08:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2019A6E0EE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 00:07:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 11so238988qkd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 16:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ngyyrd+7YeTNUGD6RWJvWNxN+aS5ZNXXD5GfmJI2C9s=;
 b=GYL7zB9kVnVbLQLfDQ7CNvcYkF80/hffFnJdGh/buXrdEBiQIoNyV5ftYv4B945PWp
 texok6bTLa0kCiwJq+Cthi41KeaJ5RcS9Z+VTq2aLUtb9D9MRdwtCUaB9fY0dTgyZsIV
 7ISBqrMcwMO4xPZuveqJcG8EXqzfgERI4tSQiOfpwnGdTuehBS3je4ko+nA5bwX5QFkw
 sL1tyX8Ru6jb/558l/WcK7QZ4MSVQCyDEjEI6Zl+7PdmjCd6G26+QRi/Pbd2sdBFkJ+P
 j5gIBIaQNzHPdpgOKgGX8enUFCck1hoJG8Y7yzTGpdkTJZmKg4hjq2HXs+S4D7O2K+qK
 qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ngyyrd+7YeTNUGD6RWJvWNxN+aS5ZNXXD5GfmJI2C9s=;
 b=fS5FcEBEojI0bxRol/WrATZV9GmtH3pj3tEp1GkMCl/568kMpW5nfj/T+//b3mP4Ls
 RUImF1JHkvw5LWU8mdEjXYUDATxbsYd9c0t4bM+jgEwG90I1F1nOm85XOccIzrgzcc+s
 /m27wxFkQP0Yt+ZKyK22sb3s8nCOQrntGjHHiqXPFMeatYRZtFUEEINrtPcstDsmo/E8
 32QxFSnV/RnAA20YRGZGg1hlGe0Zcm/OAn/apZVdIcZWxTMDLC07FBKCpE9xrHz1oFIX
 BA6e86uipRkULgvmyATQ2cvhqKDRdZEEXAaAqltOoBh0xPaeKRkrzRFUekj3ohwaWcNH
 5p2w==
X-Gm-Message-State: AOAM530ct/8lmnsDPM9/EKvEDLqcReCoH5civJMDcOXe6kOPvHRfekIl
 5aKkiVuo2LqXOK14uELFztnxhQ==
X-Google-Smtp-Source: ABdhPJwZ2zq4kbXGpuRR9Mw0TOTWAdjlsCRldJcSUyYR7qPJ2IsfD0KFKtR9c++Nf7n/gtYO2KsuBQ==
X-Received: by 2002:a37:a642:: with SMTP id p63mr749300qke.5.1604534843136;
 Wed, 04 Nov 2020 16:07:23 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y3sm1433098qto.2.2020.11.04.16.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 16:07:22 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaSoD-00Gl4C-NS; Wed, 04 Nov 2020 20:07:21 -0400
Date: Wed, 4 Nov 2020 20:07:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201105000721.GY36674@ziepe.ca>
References: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
 <1604527595-39736-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604527595-39736-5-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

On Wed, Nov 04, 2020 at 02:06:34PM -0800, Jianxin Xiong wrote:
> +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> +				  &mlx5_ib_dmabuf_attach_ops);
> +	if (IS_ERR(umem)) {
> +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> +		return ERR_PTR(PTR_ERR(umem));
> +	}
> +
> +	mr = alloc_mr_from_cache(pd, umem, virt_addr, access_flags);

It is very subtle, but this calls mlx5_umem_find_best_pgsz() which
calls ib_umem_find_best_pgsz() which goes over the SGL to determine
the page size to use.

As part of this it does validation of the IOVA vs first page offset vs
first page dma address. These little details come into play if the
IOVA and offset are not PAGE_SIZE aligned, which is very possible if
the dma buf exporter or system PAGE_SIZE is over 4k.

In other words, the dma_address of the first SGL must be the page
aligned starting point of the MR. Since the 'skip' approach is being
done when breaking the SGL into blocks the ib_umem_find_best_pgsz()
sees an invalid page size.

Slicing it has to be done in a way that gives a properly formed
SGL. 

My suggestion is to just change the SGL in place. Iterate to the
starting SGE in the SGL and assign it to the sg table, modify it to
have a offset dma_address and reduced length

Count the number of SGEs to span the remaning range and use that as
the new nmaped

Edit the last SGE to have a reduced length

Upon unmap undo the edits so the exporter doesn't see the mangled SGL.

It would be saner if the exporter could do this, but oh well.

Approximately like this:

	struct ib_umem *umem = &umem_p->umem;
	struct scatterlist *sg;
	int i;

	for_each_sg(umem_p->umem.sg_head.sgl, sg, umem_p->umem.nmap, i) {
		if (cur + sg_dma_len(sg) > ALIGN_DOWN(umem->address, PAGE_SIZE)) {
			unsigned long offset;

			umem_p->first_sg = sg;
			umem_p->first_dma_address = sg->dma_address;
			umem_p->first_dma_length = sg_dma_len(sg);
			umem_p->first_length = sg->length;
			offset = ALIGN_DOWN(umem->addressm PAGE_SIZE) - cur;
			sg->dma_address += offset;
			sg_dma_len(sg) -= offset;
			sg->length -= offset;
		}
		if (ALIGN(umem->address + umem->length, PAGE_SIZE) < cur + sg_dma_len(sg)) {
			unsigned long trim;

			umem_p->last_sg = sg;
			umem_p->last_dma_length = sg_dma_len(sg);
			umem_p->last_length = sg->length;
			trim =  cur + sg_dma_len(sg) - ALIGN(umem->address + umem->length, PAGE_SIZE);
			sg_dma_len(sg) -= trim;
			sg->length -= trim;
			return npages;
		}
                cur += sg_dma_len(sg);
	}
        /* It is essential that the length of the SGL exactly match
  	   the adjusted page aligned length of umem->length */
	return -EINVAL;

Further, this really only works if the umem->page_size is locked to 4k
because this doesn't have code to resize the MKEY, or change the
underlying page size when the SGL changes.

So, I'd say put something like the above in the core code to validate
and properly form the umem->sgl

Then modify the alloc_mr_from_cache to use only PAGE_SIZE:

 if (umem->is_dma_buf)
        page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
 else
    	page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
