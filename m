Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D429E60D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266E26E88A;
	Thu, 29 Oct 2020 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81D36E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 16:35:48 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id g13so106212qvu.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c5JnGX1FZzDj3iERlJZXW7b5+HdbiYzlb4fBgkfb0xg=;
 b=T/Wp+QgTZbv1wee/sHrDIFOH1/IukfATS3nj85orHSLzJ5Ci9m9D9+5FMe4siiBzKb
 mnYxiZmf+h5ISKzGYL3LfRD5Z/h7CeU9Ic3o8vVi6dtsur5ymMwco2Ic+E0p077eQq7E
 TmLJWTlgAyWXhpZWnOwwSxe4pEu4ZM2JogMMIKQz7TfFL/amHFBGVZ1fsGtEtKkooqzS
 XP1JQGRB9eIb36j10Za/P/QA3GFLBthurwPS9fpKQwou7YDQBnPDd5dMChnQbGA7nb5M
 9j3Oo/ALtArT66luG6iq9Ub9hL58nPVAMiawomI1aPcKjl0lYkr7t0Q5+tEc6jD88Wtx
 53hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5JnGX1FZzDj3iERlJZXW7b5+HdbiYzlb4fBgkfb0xg=;
 b=CGb5RrVeaSsvtp4ZjtYAthydwkWac+MTMe0AXFGy0OD4qa6M6BXTKAm6GbW/d0am4y
 PZN6nevPrKNctzo63yFd/IvNzVBVCkV/Yfr0M4TXkUUkpekLnYMisMLBcozPG6ZKQYDx
 PoyUgR9xr3iFALIcKZsE56mnpamS1be3zqkgf3uU7M0MRoSmbm3sH3xj3w86rW6wS/pN
 lF3sAHSAVgYwNa0ijKKVyvYtINRCSRcWx5uo2WBMh1E4hSVrKAcGb1MG8Tjx/ODkCO2Q
 58EgPNSnTJoYwfoRMcdoRAnf/2jwknYKXwW5+2FaIHxkELNJfE4s3vqxviS5kD3tvUVM
 D01A==
X-Gm-Message-State: AOAM5311uA574xHTw3r2QGLWkc04VHp8/Xjdf3H32Lz/DTFRRc35nRKf
 LW6B6SJsJU1WvCITD6rTe84HQg==
X-Google-Smtp-Source: ABdhPJwochXOFNBSHbc/0ALAjHT9FDE73znluF9TV4zOl+vupz8WA9nPGsuNsYdeDgOjpuKu7jxv0Q==
X-Received: by 2002:a0c:fe49:: with SMTP id u9mr8645159qvs.40.1603902948133;
 Wed, 28 Oct 2020 09:35:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a201sm959571qkc.76.2020.10.28.09.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 09:35:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kXoQM-00AH3D-5P; Wed, 28 Oct 2020 13:35:46 -0300
Date: Wed, 28 Oct 2020 13:35:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201028163546.GY36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
 <20201027200816.GX36674@ziepe.ca>
 <MW3PR11MB45559D700788EFFE08E9B639E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45559D700788EFFE08E9B639E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 08:33:52PM +0000, Xiong, Jianxin wrote:
> > > @@ -801,6 +816,52 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
> > >   * Returns:
> > >   *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
> > >   *           not accessible, or the MR is no longer valid.
> > > + *  -EAGAIN: The operation should be retried
> > > + *
> > > + *  >0: Number of pages mapped
> > > + */
> > > +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, struct ib_umem *umem,
> > > +			       u64 io_virt, size_t bcnt, u32 *bytes_mapped,
> > > +			       u32 flags)
> > > +{
> > > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
> > > +	u64 user_va;
> > > +	u64 end;
> > > +	int npages;
> > > +	int err;
> > > +
> > > +	if (unlikely(io_virt < mr->mmkey.iova))
> > > +		return -EFAULT;
> > > +	if (check_add_overflow(io_virt - mr->mmkey.iova,
> > > +			       (u64)umem->address, &user_va))
> > > +		return -EFAULT;
> > > +	/* Overflow has alreddy been checked at the umem creation time */
> > > +	end = umem->address + umem->length;
> > > +	if (unlikely(user_va >= end || end  - user_va < bcnt))
> > > +		return -EFAULT;
> > 
> > Why duplicate this sequence? Caller does it
> 
> The sequence in the caller is for umem_odp only.

Nothing about umem_odp in this code though??

> > >  	/* prefetch with write-access must be supported by the MR */
> > >  	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> > > -	    !odp->umem.writable)
> > > +	    !mr->umem->writable)
> > 
> > ??

> There is no need to use umem_odp here, mr->umem is the same as &odp->umem. 
> This change makes the code works for both umem_odp and umem_dmabuf.

Ok

Can you please also think about how to test this? I very much prefer
to see new pyverbs tests for new APIs. 

Distros are running the rdma-core test suite, if you want this to work
widely we need a public test for it.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
