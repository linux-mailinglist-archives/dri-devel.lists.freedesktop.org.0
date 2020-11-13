Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B032B3AE6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE4D89CD7;
	Mon, 16 Nov 2020 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37616E497
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:06:22 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id v143so8678352qkb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tcpJgRuCqNwlBMDURa2IelNPq8Qm1Jyrq6m3EuT6CC8=;
 b=Q1rSprMoNBs6zThQrZVq822uUnV4tgS3fgEG4pvkaE+DR46ZkRtylGKXnT4XLhrSK9
 j/w8jI/Php25JHF2Q1MtsyKVH77lNKNprSdlm0bw0boUB7tDlf/ivECW5LYq/l0zO6mf
 Dz2Q8zGU3Fzl9lErmnXaT3pxKAPMiMYlmL2CI+w9SmHZt7/KmEIYaNkzC2Z6c4alumbL
 tmK9myJ5VnPxmigrgS00T/vwi9/6jx+PebNjXwPpxNaebqQKfme5FM0xvWYOaOdhuPll
 /OiGjb2kBwnXDgSTZ+amu25K8X617nQvjs0XhArTtJsLHzUvY51SCMm7iGfVOmgIDzGX
 C5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tcpJgRuCqNwlBMDURa2IelNPq8Qm1Jyrq6m3EuT6CC8=;
 b=gl3coM1SCAETIwrGPnL4V6wtWvoTYgz5LhybJ3zQzD3UaDOGKZJN19Wp6Y+kOwLbAI
 +lup8RNQ5BwJ3dBPm2c5Nvlhmb/Fm3e0jjqqMMzOZ218runhLo/KzcixWQfuXHsRU9L/
 aZ1jZn4iLoEJkfcXeK2hTvgeJd0VvqA5ThedyKYp6a8Kc9sK19GzV+PGaI4csiRsNklP
 pbsWdAcMEPIGSQNgBY3ccHU/PbiqnRx/Lkg4ntrolsD5yxHUlWRwzCDb6nj5OiW4Ublk
 9JjpBDWR4x/4uzbSvEqjOBr+hDqXDBjV+wC5Rn+CphsLz4dOasO6HsddBwsogYnDs2vf
 Ackw==
X-Gm-Message-State: AOAM530G5Fl0GibsZcsUJI/RGvRFwvj1scbcv1iYFn79hKKnKzTcQQxa
 0P1ckcMHJcXVZZ9Y1PWjiXLE2A==
X-Google-Smtp-Source: ABdhPJzxnoPyuM90JUeDy1wEUo1X2u6BmXGjsnRnYzjFCDRrDsfcTsQYWUgxT3hvgNr198ier5j9Ew==
X-Received: by 2002:a37:9b17:: with SMTP id d23mr1876370qke.254.1605272782033; 
 Fri, 13 Nov 2020 05:06:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a85sm6668549qkg.3.2020.11.13.05.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:06:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdYmS-004PoI-Jg; Fri, 13 Nov 2020 09:06:20 -0400
Date: Fri, 13 Nov 2020 09:06:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace
 memory region
Message-ID: <20201113130620.GD244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-5-git-send-email-jianxin.xiong@intel.com>
 <20201113003946.GA244516@ziepe.ca>
 <MW3PR11MB45550E49934ECB53FC42E688E5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45550E49934ECB53FC42E688E5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

On Fri, Nov 13, 2020 at 03:51:20AM +0000, Xiong, Jianxin wrote:

> > > +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment
> > > +*attach) {
> > > +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > > +	struct mlx5_ib_mr *mr = umem_dmabuf->private;
> > > +
> > > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > > +
> > > +	if (mr)
> > 
> > I don't think this 'if (mr)' test is needed anymore? I certainly prefer it gone as it is kind of messy. I expect unmapping the dma to ensure this
> > function is not running, and won't run again.
> 
> It is still needed. When the dma-buf moves, the callback function of every attached importer is invoked, regardless if the importer has mapped the dma or not.
> 
> > 
> > > +/**
> > > + * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
> > > + * @mr: to fence
> > > + *
> > > + * On return no parallel threads will be touching this MR and no DMA
> > > +will be
> > > + * active.
> > > + */
> > > +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr) {
> > > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> > > +
> > > +	/* Prevent new page faults and prefetch requests from succeeding */
> > > +	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
> > > +
> > > +	/* Wait for all running page-fault handlers to finish. */
> > > +	synchronize_srcu(&mr->dev->odp_srcu);
> > > +
> > > +	wait_event(mr->q_deferred_work,
> > > +!atomic_read(&mr->num_deferred_work));
> > > +
> > > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > > +	mlx5_mr_cache_invalidate(mr);
> > > +	umem_dmabuf->private = NULL;
> > > +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> > > +
> > > +	if (!mr->cache_ent) {
> > > +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> > > +		WARN_ON(mr->descs);
> > > +	}
> > 
> > I didn't check carefully, but are you sure this destroy_mkey should be here??
> 
> To my understanding, yes. This is similar to what dma_fence_odp_mr() does,
> just inlined here since it's not called from other places.

I think you should put the calls to dma_buf_dynamic_attach() and
dma_buf_detach() into mlx5, it makes the whole thing a little cleaner,
then the umem->private isn't needed any more either.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
