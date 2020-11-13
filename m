Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39232B3B04
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC38989D9A;
	Mon, 16 Nov 2020 01:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C6E6E321
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:58:10 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y22so4508872plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RcvJ0ZjeSv/YgPQ0Qoap3goR6x+DGLtXOMsSJfrBjSk=;
 b=oQ2LazpMrvjAQvcBZ9lE0E4g7PuQt+LQvg0yLMauHeuqSBAhJJCcP7ZyvGsFLxjQ64
 IpjAuezncv+uVVvPG57vG5ST+ZLoLQKA2cYObEzfME5bQqWsie/91wjK1jBU2ygh+GNR
 3q6yYFAC2NkspnFZi0/jzc+/HRnOLj1hwIUxpR62OdJJDpOBjRE3AUO3vJdkf6LHtkBQ
 aPWk6DxQhJKLNvbDMOuVC73cpB89RfKQVcT2VIa8POExfzWPctvgGNr8jAQH6ephc2O+
 oLSJmnsP6WSmg39cRR6U8PEN0+8pjnDSAb4qsm93v3T7ysMxhAkqauP0yWCYoWXF3dlb
 8+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RcvJ0ZjeSv/YgPQ0Qoap3goR6x+DGLtXOMsSJfrBjSk=;
 b=Z0TEaivYAtym6lTRot8mIs1BI1Yayo8NNPiK1wE4lH2K1Iv0h9G3lnijCwk9d0YMRj
 L1HlmU+NXkrvgYfLlbQs3PZWP0m6z28P93xxIheSq9A+njc/IaBw9kE8YOhi/1WJTY88
 ueaVwYIuQ9GlJzwIgPU7BHy2WQROi11qulN/co7wvRcZk13QyNPCQ5DwSeJq9R7f1xJk
 EGPAPtUsRrfAFnrFhX2rsaR7g5wi7tC7S2dd6dLTSImxTUBZauoKtabgTaXoULVM9g/V
 j0ZiYK0sbE9gCq2uLeuAY3PSAQzQYHT3zK+KEEnbeW3n851VzFhCiIKZUZuHXPLJrTk2
 212g==
X-Gm-Message-State: AOAM533uwdk+RbPo6k3jlHu60TOpbloEX0vvR5aRPrHPyGdmKHWjw7U3
 4ingeOSCv8EegT9OpQ/G2mF2o3CCgeYEG2S+
X-Google-Smtp-Source: ABdhPJwIF8ycppZSd+rISqHYM9BvW9DZmk6aIDyfXSgiNUIrCa8Gmbax0jo6QmVC6Wi7QqOX+U1DaQ==
X-Received: by 2002:a0c:ecc1:: with SMTP id o1mr2010711qvq.6.1605271748507;
 Fri, 13 Nov 2020 04:49:08 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id s134sm6952212qke.99.2020.11.13.04.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 04:49:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdYVm-004PIv-Vu; Fri, 13 Nov 2020 08:49:07 -0400
Date: Fri, 13 Nov 2020 08:49:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201113124906.GC244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-2-git-send-email-jianxin.xiong@intel.com>
 <20201113003037.GY244516@ziepe.ca>
 <MW3PR11MB45558223F95CCE4ABF57B9BCE5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45558223F95CCE4ABF57B9BCE5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
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

On Fri, Nov 13, 2020 at 03:30:04AM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Thursday, November 12, 2020 4:31 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user memory region
> > 
> > On Tue, Nov 10, 2020 at 01:41:12PM -0800, Jianxin Xiong wrote:
> > > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +				   unsigned long offset, size_t size,
> > > +				   int fd, int access,
> > > +				   const struct dma_buf_attach_ops *ops) {
> > > +	struct dma_buf *dmabuf;
> > > +	struct ib_umem_dmabuf *umem_dmabuf;
> > > +	struct ib_umem *umem;
> > > +	unsigned long end;
> > > +	long ret;
> > > +
> > > +	if (check_add_overflow(offset, (unsigned long)size, &end))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > > +		return ERR_PTR(-EINVAL);
> > 
> > This is weird, what does it do?
> 
> This sequence is modeled after the following code from ib_umem_init_odp():
> 
>                 if (check_add_overflow(umem_odp->umem.address,
>                                        (unsigned long)umem_odp->umem.length,
>                                        &end))
>                         return -EOVERFLOW;
>                 end = ALIGN(end, page_size);
>                 if (unlikely(end < page_size))
>                         return -EOVERFLOW;
> 
> The weird part seems to be checking if 'end' is 0, but that should have been covered
> by check_add_overflow() already.

I think the
 +	if (unlikely(!ib_umem_num_pages(umem))) {

Catches the same condition, no need to do it twice

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
