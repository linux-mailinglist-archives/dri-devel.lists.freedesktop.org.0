Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61429CA41
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 21:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0AF6EB81;
	Tue, 27 Oct 2020 20:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661306EB81
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:34:00 +0000 (UTC)
IronPort-SDR: F5s8aaJjaXuJGzbUhRJeAdlxu0hyB+nJc1PIvZHLhOyUNRDKEpOcAY0mdnOIijDiMNbmaJ0yE+
 TdnvYZsRj1vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="167379921"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="167379921"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 13:33:58 -0700
IronPort-SDR: wU1tacfz27K0FO6wvPOidych8Ze3zK5IuBpfPCV2ny/Dsy/6FC4OrP1flabV9sn9wNxiaC4VFl
 AOdokAyeQPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="334518907"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 27 Oct 2020 13:33:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 13:33:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Oct 2020 13:33:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 27 Oct 2020 13:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTqK1rGFvLPX9XbfeYDfi/Mkdrcizfpu3bm0agyQhRB8S4RqAU6//JFRVooTGm+SAWyBcYfD0CYZ2FpIshT5yztgUK7wW7te1IRBaC0VAy40waXfc3xu83WxAAh5YvJfswrwFMVOtGQOZnma2N2IM6ooQXDhzRqe084/5UvECN9wQKky+FysZOZSYCvOn62TU78ejnNtNJtJYeIdRkL4A3OUYSEDxRYMWY5igeBc7xkHGBBDDbhHAL8/Tm7SovUU/TRMc334fQguChQ0z6aktduUuAbEDMig7GDc+BorI5UHm2KNTE9Xp51Lz2M6Hw3BbQxD3QM6u2r4dwUSQTbpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4YWdUPvus7P/zZwe1jiQQG8/ndkmSOBD0dWRW6lRGo=;
 b=SdHlpdiqztOzjV+NXO+yRKg+FQT5wRDM7W0GWe44Ch/L9tsNJvnjiSJeJwsd7tCieHzR8wlWN2kFOiU8S9Hs4fjj4EavVQL4Fb0MZm2H2/4K+pu6X74Qs2oFnBnqz2JMEcrGSyC5df1CGYF5lesi9JLuM0lMD/93bALloQi90JjKf0g1fZOiAKml22mT2BptzCuCxPaKIOQc8OLtM+9FM9RtTp9BJFhatT9sW9WJUtqr6jZBA4FltU5gzR4SHMoWHdn8ttpJ9bOLMY3pSgG1qMDAEG3wggtmO997KzGpXEy02vt5Tn4DI0/69CC8jwcvUAxbL19SwWpdw6lbukCcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4YWdUPvus7P/zZwe1jiQQG8/ndkmSOBD0dWRW6lRGo=;
 b=POdmiEkgbErKFhFrHAKLldzWWFjx7NYoOH5m8l+CCq2iFoFhhrFnZSsTlLLPiNa4rzyN6BBqevkji0W0ko4+gW+H3wbMEPCwjiX60dElNVmUe5Wy4nO7r7rRKkohqSUrMc+ErM/LFMP9tKS6rRJ0+8n/YDXB7dvTy/q19zt5hpk=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 27 Oct
 2020 20:33:52 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 20:33:52 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWqVlO00pepJSOH0mSukfnEwOLTqmr5x0AgAABPIA=
Date: Tue, 27 Oct 2020 20:33:52 +0000
Message-ID: <MW3PR11MB45559D700788EFFE08E9B639E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
 <20201027200816.GX36674@ziepe.ca>
In-Reply-To: <20201027200816.GX36674@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d92f709f-2df8-462a-a28d-08d87ab79e70
x-ms-traffictypediagnostic: CO1PR11MB4818:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB481848388C82296D49A16ED3E5160@CO1PR11MB4818.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tILAil98cUBcb4oFSCYJNwu7X7sXO4OmHXgKo1ELv70lNryIu5QZIjrBYXMdKXbUjwLdK67GfivrrZjeZcDhKJnd2yYwN6s/zAo02vBPZw6Ry3TudA4PWaQN4sr473wCcp80IN5x6KbapezR5HCQtKh1y7KYhIoc9XTWm4j9ESe0l2Py195yjY+mrxMKYUPtRRQ/LgXMSpEQtXRwCDGp2Jo43MqWuEXcCXVPTQ7jz8WqKBIoL3LS+q5N1mHz393/9xtJGD3mdZdBRdINZVHwOiHwujG8Ykjh2l7LfWREIQnLlELdMvuEtqh6NZZqEyB2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(53546011)(66446008)(5660300002)(6506007)(316002)(55016002)(86362001)(76116006)(66476007)(66556008)(71200400001)(52536014)(83380400001)(26005)(8936002)(8676002)(186003)(7696005)(6916009)(4326008)(2906002)(9686003)(64756008)(66946007)(107886003)(54906003)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OIoeMDPdnk1rWeTQ9hASpmE7XmrJeHY7jOnd17exM1+c0uZcZ2zslaGTptb28aViSlXtZGLx6zsWaHAqwpN4ZM6PC6cdTIjcFIM4ip75bulTyyC0p5EUKn1zV1D6qWY3OdrLlOp4OjsHXniWekcI6bA0E4A5dhLB0n5ZCBPZAVy4/hmMAwPCiIpwxvA4OPGP45rjl4JnzkLOff3AC+n4wlU8eCYlP7b3kSet7zATzzFHXCtjYEIE+SK0ZZTNaR9mudTbLNUL31fm8bPPWQrrjds7Lrmzou1IEpUfPDH7Q12och1XoFSPXxbJtnOglp5iZZiyMfeZS/pZ6nI9ca40sgAuB/dn9T/KC3kGWc+G4Nt6N5XHkOteGHuwryU8S4oMf4Fkd7ytAv89LAEt/FQAHE2InW3B1G/r8AH9SsFp4i0RoEewem5C2ZkR6qHH8i0Tbf1EjJxa8h2WQqhKJChdCW0d7Wgv2w4rDhDwv5P6c9+VYSuyvby5jdrTAVNczHMJJesb39mohJ9cy+7CRkK75wQK0YfEg2ekZzP0qoqzu672w8UfioS6M+COvJDm8e9/TLo/Ie2CAKsSJ0L/ALSco0Zr3Gs1gUglNma4+rhtzQIQke6vUgwwXYADTJNTrK49EtAKMGt16qqKqJbbHWCkVg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92f709f-2df8-462a-a28d-08d87ab79e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 20:33:52.8008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVQvw7+dxWmR7xBld2J3pz5vtBMw2aecwaUKI6r/+ZFJUCaVykLW15k6qrFursScvrYqiruR21Vm7VkGxsh9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
X-OriginatorOrg: intel.com
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, October 27, 2020 1:08 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Fri, Oct 23, 2020 at 09:40:01AM -0700, Jianxin Xiong wrote:
> 
> > diff --git a/drivers/infiniband/hw/mlx5/mr.c
> > b/drivers/infiniband/hw/mlx5/mr.c index b261797..3bc412b 100644
> > +++ b/drivers/infiniband/hw/mlx5/mr.c
> > @@ -1,5 +1,6 @@
> >  /*
> >   * Copyright (c) 2013-2015, Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2020, Intel Corporation. All rights reserved.
> >   *
> >   * This software is available to you under a choice of one of two
> >   * licenses.  You may choose to be licensed under the terms of the
> > GNU @@ -36,6 +37,8 @@  #include <linux/debugfs.h>  #include
> > <linux/export.h>  #include <linux/delay.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-resv.h>
> >  #include <rdma/ib_umem.h>
> >  #include <rdma/ib_umem_odp.h>
> >  #include <rdma/ib_verbs.h>
> > @@ -1113,6 +1116,8 @@ int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
> >  		dma_sync_single_for_cpu(ddev, dma, size, DMA_TO_DEVICE);
> >  		if (mr->umem->is_odp) {
> >  			mlx5_odp_populate_xlt(xlt, idx, npages, mr, flags);
> > +		} else if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP)) {
> > +			memset(xlt, 0, size);
> >  		} else {
> >  			__mlx5_ib_populate_pas(dev, mr->umem, page_shift, idx,
> >  					       npages, xlt,
> > @@ -1462,6 +1467,111 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
> >  	return ERR_PTR(err);
> >  }
> >
> > +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment
> > +*attach) {
> > +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > +	struct mlx5_ib_mr *mr = umem_dmabuf->device_context;
> > +
> > +	mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, MLX5_IB_UPD_XLT_ZAP);
> > +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > +}
> > +
> > +static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
> > +	.allow_peer2peer = 1,
> > +	.move_notify = mlx5_ib_dmabuf_invalidate_cb, };
> > +
> > +struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
> > +					 u64 length, u64 virt_addr,
> > +					 int fd, int access_flags,
> > +					 struct ib_udata *udata)
> > +{
> > +	struct mlx5_ib_dev *dev = to_mdev(pd->device);
> > +	struct mlx5_ib_mr *mr = NULL;
> > +	struct ib_umem *umem;
> > +	struct ib_umem_dmabuf *umem_dmabuf;
> > +	int npages;
> > +	int order;
> > +	int err;
> > +
> > +	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +
> > +	mlx5_ib_dbg(dev,
> > +		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
> > +		    offset, virt_addr, length, fd, access_flags);
> > +
> > +	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> > +				  &mlx5_ib_dmabuf_attach_ops);
> > +	if (IS_ERR(umem)) {
> > +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> > +		return ERR_PTR(PTR_ERR(umem));
> > +	}
> > +
> > +	npages = ib_umem_num_pages(umem);
> > +	if (!npages) {
> 
> ib_umem_get should reject invalid umems like this

Will move the check to ib_umem_dmabuf_get().

> 
> > +		mlx5_ib_warn(dev, "avoid zero region\n");
> > +		ib_umem_release(umem);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	order = ilog2(roundup_pow_of_two(npages));
> 
> Must always call ib_umem_find_best_pgsz(), specify PAGE_SIZE as the argument for this scenario

Will fix.

> 
> > +	mlx5_ib_dbg(dev, "npages %d, ncont %d, order %d, page_shift %d\n",
> > +		    npages, npages, order, PAGE_SHIFT);
> > +
> > +	mr = alloc_mr_from_cache(pd, umem, virt_addr, length, npages,
> > +				 PAGE_SHIFT, order, access_flags);
> > +	if (IS_ERR(mr))
> > +		mr = NULL;
> > +
> > +	if (!mr) {
> > +		mutex_lock(&dev->slow_path_mutex);
> > +		mr = reg_create(NULL, pd, virt_addr, length, umem, npages,
> > +				PAGE_SHIFT, access_flags, false);
> > +		mutex_unlock(&dev->slow_path_mutex);
> > +	}
> 
> Rebase on the mlx5 series just posted and use their version of this code sequence, this is just not quite right

Will do.

> 
> 
> > +	err = mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT,
> > +				 MLX5_IB_UPD_XLT_ENABLE | MLX5_IB_UPD_XLT_ZAP);
> > +
> > +	if (err) {
> > +		dereg_mr(dev, mr);
> > +		return ERR_PTR(err);
> > +	}
> 
> The current mlx5 code preloads the buffer with the right data, zapping is fairly expensive, mapping and loading is the same cost

Could probably do the same here. Will double check.

> 
> > @@ -1536,7 +1646,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
> >  	if (!mr->umem)
> >  		return -EINVAL;
> >
> > -	if (is_odp_mr(mr))
> > +	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
> >  		return -EOPNOTSUPP;
> >
> >  	if (flags & IB_MR_REREG_TRANS) {
> > @@ -1695,7 +1805,7 @@ static void dereg_mr(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr)
> >  	struct ib_umem *umem = mr->umem;
> >
> >  	/* Stop all DMA */
> > -	if (is_odp_mr(mr))
> > +	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
> >  		mlx5_ib_fence_odp_mr(mr);
> 
> Make a dma buf specific function

Ok.

> 
> I have another series touching this area too, but I think
> 
> > @@ -801,6 +816,52 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
> >   * Returns:
> >   *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
> >   *           not accessible, or the MR is no longer valid.
> > + *  -EAGAIN: The operation should be retried
> > + *
> > + *  >0: Number of pages mapped
> > + */
> > +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, struct ib_umem *umem,
> > +			       u64 io_virt, size_t bcnt, u32 *bytes_mapped,
> > +			       u32 flags)
> > +{
> > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
> > +	u64 user_va;
> > +	u64 end;
> > +	int npages;
> > +	int err;
> > +
> > +	if (unlikely(io_virt < mr->mmkey.iova))
> > +		return -EFAULT;
> > +	if (check_add_overflow(io_virt - mr->mmkey.iova,
> > +			       (u64)umem->address, &user_va))
> > +		return -EFAULT;
> > +	/* Overflow has alreddy been checked at the umem creation time */
> > +	end = umem->address + umem->length;
> > +	if (unlikely(user_va >= end || end  - user_va < bcnt))
> > +		return -EFAULT;
> 
> Why duplicate this sequence? Caller does it

The sequence in the caller is for umem_odp only.

> 
> > @@ -811,6 +872,10 @@ static int pagefault_mr(struct mlx5_ib_mr *mr,
> > u64 io_virt, size_t bcnt,  {
> >  	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
> >
> > +	if (is_dmabuf_mr(mr))
> > +		return pagefault_dmabuf_mr(mr, mr->umem, io_virt, bcnt,
> > +					   bytes_mapped, flags);
> > +
> >  	lockdep_assert_held(&mr->dev->odp_srcu);
> >  	if (unlikely(io_virt < mr->mmkey.iova))
> >  		return -EFAULT;
> > @@ -1747,7 +1812,6 @@ static void destroy_prefetch_work(struct
> > prefetch_mr_work *work)  {
> >  	struct mlx5_ib_dev *dev = to_mdev(pd->device);
> >  	struct mlx5_core_mkey *mmkey;
> > -	struct ib_umem_odp *odp;
> >  	struct mlx5_ib_mr *mr;
> >
> >  	lockdep_assert_held(&dev->odp_srcu);
> > @@ -1761,11 +1825,9 @@ static void destroy_prefetch_work(struct prefetch_mr_work *work)
> >  	if (mr->ibmr.pd != pd)
> >  		return NULL;
> >
> > -	odp = to_ib_umem_odp(mr->umem);
> > -
> >  	/* prefetch with write-access must be supported by the MR */
> >  	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> > -	    !odp->umem.writable)
> > +	    !mr->umem->writable)
> 
> ??
There is no need to use umem_odp here, mr->umem is the same as &odp->umem. 
This change makes the code works for both umem_odp and umem_dmabuf.

> 
> This does look basically right though. I think a little more polishing and it can be merged. It does need to go after the mlx5 MR series
> though..
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
