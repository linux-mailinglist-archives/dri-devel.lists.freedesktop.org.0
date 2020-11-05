Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20F2A916D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982096EE11;
	Fri,  6 Nov 2020 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3316E111
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:22:09 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id w5so722238qvn.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xY0gw3/90YPQ1U742g9g0K7TZkNj4Nia2/KRaz9FQ5U=;
 b=bp39PS4upm1bbgrETcatnn3WIC8cYzuzxcn/DP/v7cnEcGv5eSri+CJTroBCPrXkjM
 7kD+vm0KCQlLiYJX92RpLpTlJNQ/54rbRW2XSXo0jnqES0L3qjzNGrlCxAGdb+McaHlh
 X0ypw0r5JLbxcdXKafySPMLGR6pF9n1dIY9adYxgesmqolCfNzSC9byGKfXGxvjw7wVZ
 yWBBLg8BP0YK0Xc4SIiSUdFUq9o7cdDHLUpC2lLMcyYY7ZIJEaqXDGdxeHHkg3AUTAzV
 RJMS/BkomKCCnNTr6V7DCqRmrsFVWDTB51NkvGMUTzX8pirv4rtsYuDzGJ1lf+W9+AU6
 XogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xY0gw3/90YPQ1U742g9g0K7TZkNj4Nia2/KRaz9FQ5U=;
 b=UTh9HUW3m8qfNHtkbX5Ay8Ac3kOZV3VgNdNxH4DDsMYQxexXoXnZM7x8lIAEz3hyYq
 GaIl7S4MdEfyTjnn5GNy9to34GleF2lYYCMsWZj+7ybeHuVtujAo3ScYPCmAmxoCmaoV
 Ni9ewNn+AlCpc2SCsw0R2xwzmwqqRzNjp9+W4mL37R9xZmDIhoAAy6sjSN1wS9SqOiOT
 VWQIdPG2ymLss+4ezDoY/ufFE5MOvIGZOKnB9pJE/j1r2kjVgddM4nNwoh6WQNHyCUmB
 fydvoyOPfPkF5aMyt1Zt6doCAYeyHE321dpInLqY/vuStLqyZnizAGyDB6crv9HaMa+E
 6JNQ==
X-Gm-Message-State: AOAM532v7FKz0VloddyVdv0LZI2z4G9RNL+7iUFpytWbSrNvU8n6ZNvK
 8ygINzhtyTAnoX6EG6u6in0CEw==
X-Google-Smtp-Source: ABdhPJxDiEORmxD5IDVG4orcjN0eGkXKJJeNyo4OH00r2Sf52mVKj/gmqiWyH88OewAQls8s7U3iEQ==
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr2218341qvb.47.1604586128216; 
 Thu, 05 Nov 2020 06:22:08 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id b12sm974336qtj.12.2020.11.05.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:22:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kag9O-00HNUk-MI; Thu, 05 Nov 2020 10:22:06 -0400
Date: Thu, 5 Nov 2020 10:22:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201105142206.GA36674@ziepe.ca>
References: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
 <1604527595-39736-5-git-send-email-jianxin.xiong@intel.com>
 <20201105000721.GY36674@ziepe.ca>
 <MW3PR11MB4555C4C6A58F0D054C69FEADE5EE0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555C4C6A58F0D054C69FEADE5EE0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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

On Thu, Nov 05, 2020 at 12:36:25AM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Wednesday, November 04, 2020 4:07 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> > 
> > On Wed, Nov 04, 2020 at 02:06:34PM -0800, Jianxin Xiong wrote:
> > > +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> > > +				  &mlx5_ib_dmabuf_attach_ops);
> > > +	if (IS_ERR(umem)) {
> > > +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> > > +		return ERR_PTR(PTR_ERR(umem));
> > > +	}
> > > +
> > > +	mr = alloc_mr_from_cache(pd, umem, virt_addr, access_flags);
> > 
> > It is very subtle, but this calls mlx5_umem_find_best_pgsz() which calls ib_umem_find_best_pgsz() which goes over the SGL to determine
> > the page size to use.
> > 
> 
> When this is called here, the umem sglist is still NULL because dma_buf_map_attachment()
> is not called until a page fault occurs. In patch 1/5, the function ib_umem_find_best_pgsz()
> has been modified to always return PAGE_SIZE for dma-buf based MR.

Oh.. That isn't a good idea.

ib_umem_find_best_pgsz() must be run on any SGL list to validate it
against the constraints, making it un-runable for the dmabuf case
means we can never support large page size or even validate that the
SGL is properly formed.

So I think this need to change the alloc_mr_from_cache() to early exit
for dma_buf ones

And it still need to call ib_umem_find_best_pgsz() but
just check the page size.

> > Edit the last SGE to have a reduced length
> 
> Do you still think modifying the SGL in place needed given the above
> explanation? I do see some benefits of doing so -- hiding the
> discrepancy of sgl and addr/length from the device drivers and avoid
> special handling in the code that use the sgl.

Yes, a umem SGL should always be properly formed or I will have a
meltdown trying to keep all the drivers working :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
