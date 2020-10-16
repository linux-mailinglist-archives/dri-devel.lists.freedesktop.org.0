Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74512913F6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90F66E221;
	Sat, 17 Oct 2020 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C946EE78
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 18:58:32 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id j8so3879686ilk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PD8XO9XeSIfAUH4+p8E5ji377Y5OQ/ZRdOb9h9Q0AUY=;
 b=YtyCEDh49p27bnAfFJx7DthiAK2A2II8HT9mP8sz6ky0RhZKMz46wlhv7PTXt4CCfT
 x9TsxyGnWiaW/KuMpRVJOz2FmQnKMxcXvyN7FNUPyvc35O3oY4/FS9XN7a3EDAsIIIPC
 lA1WYfa/gDRz4UPQT8IAMjlpvIv9vntPyN6Z+y1YVL4N6gYy4V5TfuVuu6sI1QfgoFAJ
 M5IsACs8IfR+q2viWS8zddkmDBLfiSUbMZty5/j+9TkDwVPkGnr8WxbCwD/kp7tyjpME
 fgHQ/SIV3qdTg0ezy98YNoVbY2icJh/V1K9RVmD1Ti5bI3fcRZ5T9BjZJzeRzN8/s+bv
 tFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PD8XO9XeSIfAUH4+p8E5ji377Y5OQ/ZRdOb9h9Q0AUY=;
 b=HDczvtJXvQvTV1xTD0qDmoxI668PpWPBUuE+oY7O4qSg1k4+UseZT08rU+Oqh705gU
 2BSbtRuaaC0QJT5zuVTXXqLGyWEcUGSHQ+7Nd3oE+qkjFAVD/LAB/Ds8zhH8um3Jm7nO
 U0QEXgzoBQKsGpktVdXvkbrLqtZFuXL2PUXuyYU0oZu2orWF9f20drrRMBI02I2b9iqL
 e2L3thG1eMfGYuxNFsmeb7Zj0AN3p+JobPF2LNVdF5q1TTAJ1RITxHK3++RxNeSq9ONZ
 3kLj3hrDypzyD1b5+yBMb9x3YJjzGmf+qz6onmRxYOxi3+vX/0xRNRcGQsCn0VgVbqOu
 ij2g==
X-Gm-Message-State: AOAM531cJQvpVTK2T1VsGBhGfVMgKm3padAiPFw8m2MIX3ztnQJw8M1Z
 6186E/+qJvfvM6PZJ5F/nxX6lA==
X-Google-Smtp-Source: ABdhPJwiBX4Osl3JVvSb7eq9FwPz+BgohwF2rr/Q2EiwqYCIHAy9f0KFOYs+A197ZIgy6r7hv4TlHg==
X-Received: by 2002:a92:2003:: with SMTP id j3mr3882945ile.28.1602874711401;
 Fri, 16 Oct 2020 11:58:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id t10sm2759362iog.49.2020.10.16.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:58:30 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kTUvt-000yoy-VK; Fri, 16 Oct 2020 15:58:29 -0300
Date: Fri, 16 Oct 2020 15:58:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201016185829.GB37159@ziepe.ca>
References: <1602799378-138316-1-git-send-email-jianxin.xiong@intel.com>
 <20201016005419.GA36674@ziepe.ca>
 <MW3PR11MB4555528000D39F35A47C5F8CE5030@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555528000D39F35A47C5F8CE5030@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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

On Fri, Oct 16, 2020 at 06:40:01AM +0000, Xiong, Jianxin wrote:
> > > +	if (!mr)
> > > +		return -EINVAL;
> > > +
> > > +	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags); }
> > > +
> > > +static struct ib_umem_dmabuf_ops mlx5_ib_umem_dmabuf_ops = {
> > > +	.init = mlx5_ib_umem_dmabuf_xlt_init,
> > > +	.update = mlx5_ib_umem_dmabuf_xlt_update,
> > > +	.invalidate = mlx5_ib_umem_dmabuf_xlt_invalidate,
> > > +};
> > 
> > I'm not really convinced these should be ops, this is usually a bad design pattern.
> > 
> > Why do I need so much code to extract the sgl from the dma_buf? I would prefer the dma_buf layer simplify this, not by adding a wrapper
> > around it in the IB core code...
> > 
> 
> We just need a way to call a device specific function to update the NIC's translation
> table.  I considered three ways: (1) ops registered with ib_umem_get_dmabuf; 
> (2) a single function pointer registered with ib_umem_get_dmabuf; (3) a method 
> in 'struct ib_device'. Option (1) was chosen here with no strong reason. We could
> consolidate the three functions of the ops into one, but then we will need to 
> define commands or flags for different update operations.   

I'd rather the driver directly provide the dma_buf ops.. Inserting
layers that do nothing be call other layers is usually a bad idea. I
didn't look carefully yet at how that would be arranged.

> > > +	ncont = npages;
> > > +	order = ilog2(roundup_pow_of_two(ncont));
> > 
> > We still need to deal with contiguity here, this ncont/npages is just obfuscation.
> 
> Since the pages can move, we can't take advantage of contiguity here. This handling
> is similar to the ODP case. The variables 'ncont' and 'page_shift' here are not necessary.
> They are kept just for the sake of signifying the semantics of the following functions that
> use them.

Well, in this case we can manage it, and the performance boost is high
enough we need to. The work on mlx5 to do it is a bit inovlved though.
 
> > > +	err = ib_umem_dmabuf_init_mapping(umem, mr);
> > > +	if (err) {
> > > +		dereg_mr(dev, mr);
> > > +		return ERR_PTR(err);
> > > +	}
> > 
> > Did you test the page fault path at all? Looks like some xarray code is missing here, and this is also missing the related complex teardown
> > logic.
> > 
> > Does this mean you didn't test the pagefault_dmabuf_mr() at all?
> 
> Thanks for the hint. I was unable to get the test runs reaching the
> pagefault_dmabuf_mr() function. Now I have found the reason. Along
> the path of all the page fault handlers, the array "odp_mkeys" is checked
> against the mr key. Since the dmabuf mr keys are not in the list the
> handler is never called.
>
> On the other hand, it seems that pagefault_dmabuf_mr() is not needed at all.
> The pagefault is gracefully handled by retrying until the work thread finished
> programming the NIC.

This is a bug of some kind, pagefaults that can't find a mkey in the
xarray should cause completion with error.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
