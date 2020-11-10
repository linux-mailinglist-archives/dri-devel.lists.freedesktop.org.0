Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9F2AD11E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454ED8995F;
	Tue, 10 Nov 2020 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DB4893E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 00:05:06 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 11so9844956qkd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 16:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BgoKi9XRsfN3grIv0Ca8FOaIeUaVDYbYvst06rwFpJk=;
 b=k1aI2n2+UdKmBg6EFNSUNIOvy7XlcXPh+2yPJ3rzhQZZQOmgyjahdSeqFZmtkoB1Ck
 zsejpyEg0yiz+19plN0MqSXM059ZxSDqHj7O5VC4ellAhB/sK0HM3QutbGg6qqyi3owo
 oQZ9Y85bYUCBEJpBPnoC+Tts6wy2MDROzPTbSHglZ6dW8mUC8YhTdtFKwoDpDtcZ1CM4
 IQnFKOGyK5UxGBZXnVmF5CFj3lZASlxJARXtKOzkwrBp+89Wbv4r9v+sH+Wq219YWWWw
 O/tyPZCLyw9Mgm78894RH9DXze2es+Od8XyFSMyxpdfTds95UOemHCxZvR495v9BFMEA
 zcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BgoKi9XRsfN3grIv0Ca8FOaIeUaVDYbYvst06rwFpJk=;
 b=ZvKw/GoqIgUu4AM7OxQaLj/YRmjEsZUwdCgBpv8zolMrnM8vAQQd7X8v2H6nbsBIJz
 1nKcC/EZTeP7m/FM5d/8yJNoWuMyiJJtYLgZih0gqrnQlf30UNePBXzKG7OIKF91MAla
 FpM9/EBVwHQJfKQvejYNn8C9r5mtQQeW9eG+PJMpxeROk/fQugbWLQxyPjhzudx1bAea
 HxwZRUZrR+zces/Ztb1mbjpH0/ay1oB5c0boLoYgYIQZrMX5Aw1klja61xm8S2OJyTg2
 I1Ky/bhJ4t9I6gUvAgl0HYsXvf/nv4Wl8KDmG6WH6J5HnSircNRDpB+U4H0YW32RDCeE
 CQ2Q==
X-Gm-Message-State: AOAM5303HrX+5zcRCCHmF920OxI6M/RU+olfxtpwbiPEg6n6uyrpuQ5C
 RyeBxawBm+fsU6Ty3WXul/BCTA==
X-Google-Smtp-Source: ABdhPJwbVdqWo23j5793JJgs4X31lIy0n2sHCqGYUUSfoZlTYCkeBzArnFC53v71zAk1zy0RHWwerw==
X-Received: by 2002:a37:76c7:: with SMTP id
 r190mr16153410qkc.416.1604966705709; 
 Mon, 09 Nov 2020 16:05:05 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id p12sm5045593qkp.88.2020.11.09.16.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 16:05:04 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kcH9j-002AKx-Jp; Mon, 09 Nov 2020 20:05:03 -0400
Date: Mon, 9 Nov 2020 20:05:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201110000503.GJ244516@ziepe.ca>
References: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
 <1604949781-20735-5-git-send-email-jianxin.xiong@intel.com>
 <20201109205232.GH244516@ziepe.ca>
 <MW3PR11MB4555DC145B4286B512FB5F0CE5EA0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555DC145B4286B512FB5F0CE5EA0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:56 +0000
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

On Mon, Nov 09, 2020 at 09:05:16PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Monday, November 09, 2020 12:53 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> > 
> > On Mon, Nov 09, 2020 at 11:23:00AM -0800, Jianxin Xiong wrote:
> > > @@ -1291,8 +1303,11 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
> > >  	int err;
> > >  	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
> > >
> > > -	page_size =
> > > -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> > > +	if (umem->is_dmabuf)
> > > +		page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
> > > +	else
> > > +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> > > +						     0, iova);
> > 
> > Any place touching the sgl has to also hold the resv lock, and sgl might be NULL since an invalidation could come in at any time, eg before
> > we get here.
> > 
> > You can avoid those problems by ingoring the SGL and hard wiring PAGE_SIZE here
> > 
> > > +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, size_t bcnt,
> > > +			       u32 *bytes_mapped, u32 flags) {
> > > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> > > +	u32 xlt_flags = 0;
> > > +	int err;
> > > +
> > > +	if (flags & MLX5_PF_FLAGS_ENABLE)
> > > +		xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
> > > +
> > > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > > +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> > > +	if (!err)
> > > +		err = mlx5_ib_update_mr_pas(mr, xlt_flags);
> > 
> > This still has to call mlx5_umem_find_best_pgsz() each time the sgl changes to ensure it is still Ok. Just checking that
> > 
> >   mlx5_umem_find_best_pgsz() > PAGE_SIZE
> > 
> > and then throwing away the value is OK
> 
> ib_umem_find_best_pgsz() is already called inside ib_umem_dmabuf_map_pages(). Do we
> still need to call mlx5_umem_find_best_pgsz() here?

ib_umem_find_best_pgsz() should only be called by drivers

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
