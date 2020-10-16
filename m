Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E174C28FE6C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 08:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE176E9B8;
	Fri, 16 Oct 2020 06:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C8F6E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 06:40:07 +0000 (UTC)
IronPort-SDR: j4nEJ2sgGr2oDHlJuKAcNQV9YJR+aJnUC4cpAFx4nY7awe7PKwUHIM5bid0DVwpg5gbEnpC4W8
 x8rO/+WHHu2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="145847906"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="145847906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 23:40:07 -0700
IronPort-SDR: zHU6MSnzjw6JiTZnFxy0Llc0C3QcKt8GfMS7kRA0gXTgpjogi4xJSB6tC/jwQh221Yk4w2yS2K
 OCk4CKTr9l6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="521071414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2020 23:40:07 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Oct 2020 23:40:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Oct 2020 23:40:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 15 Oct 2020 23:40:06 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.55) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 15 Oct 2020 23:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmtVglbkdyjEVQrdO6OZaawJfVcokYx2kKM2xd9YQY8Tl0n9kV1o3Au5eQ7q+daK5QwiFwI6kUKRO9ipiA29bABocZuF6z+cp7POgHt9i5+wSylPjWQUEdD2uAuQMWx2vetH/aKqY2hf73dLbH+ANomhfhSTZC4rajuxD6dg2JplNIesd59zeUce8CbiK7NAhv1F80+PObnkgQWXBqpld32ZSzPTB+28eKJMqFbARBNp70/KXEOiUnJ/Oq/8I+BH7wygo8lobcBwAgqtNM3CywJhK/T4qe6JE+EVKA71k3fYUQkfn1GbPzRKkDMUPoByLZ+kSiGuMOsz36uuA9rp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNBoG+Mi8FfFQCdYrGgRwfzcqS91a7a0iwH0+B8dfQI=;
 b=bqhqI0Uq3B1MJRcSOg4Ig9tnt+kTwDDGeJ+4kPlLlaavUzMnjE64TrqP/+Zqnp9FKOcFvD7B8liUDkMZW2a6Ojl08KcgKaHkiX3hlGFq7jaywHX3bfPxzFmubsXG4DGH8TueTiVIuclw6eqANNN5NapGABu3hskm7ppI6vkHUAK9vSXBc+C2nTy4qjuJJgmwHrZ96s+8G3qcAilRjwTCF70sS8bky1cCE2zCtFW4vN+VPERsQWn+UIxA2PA7aImh9Z2URPFWOMSsCSvketNtidH9fdaOAXRffB8uAT8It043OBkDTOWbgG21x/mIG6s4mN+oH7itmwTEmcrwoY0C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNBoG+Mi8FfFQCdYrGgRwfzcqS91a7a0iwH0+B8dfQI=;
 b=YQsn6FZ7jXbe4vC1ihHLlhdG01HBG1VHC7VRs24wvNKRC0VDmwqqClal74heodvdE81T5TIbENN8ATofHBRgQZAO7q2Um7oLVKlROqqSH6RcmpG6eKLujVrUshKPM/0fzAMpyxCCBztOFbpZbwxVov3nhoXeP5sSpcvjO3GNwpg=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1902.namprd11.prod.outlook.com (2603:10b6:300:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 06:40:01 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 06:40:01 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWozz6PA4Nzmnoo0+o3Tip+3Bz9amZZ0eAgABQccA=
Date: Fri, 16 Oct 2020 06:40:01 +0000
Message-ID: <MW3PR11MB4555528000D39F35A47C5F8CE5030@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799378-138316-1-git-send-email-jianxin.xiong@intel.com>
 <20201016005419.GA36674@ziepe.ca>
In-Reply-To: <20201016005419.GA36674@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 16ce8d81-c539-4a77-1dfb-08d8719e4ee5
x-ms-traffictypediagnostic: MWHPR11MB1902:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19024F71D50FB5B6A357C975E5030@MWHPR11MB1902.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ELuC82JpriTuSRAD7CXeLtOqpZbfUDNrx0h9GJoknQSvA/1xBUeBDHlfEedLTNQO4LVqpYpc10LI2xFox5nWE1EBuofiDf1O4BFurY8fkZ1buN533A/HhVKNUz9pNYP98lWiSiMNGeqJDHNd7n8h4L5GXk75TDtNP3K/gEAMsjiv3jdHZ9vHemSgN19gTs3SSBGXE7AclPkp6bTvoEOix2xlUonXD/wM7/ax5P/zfDv4Pfz7n6ByZmLdKoq0+LrWBJlCKQ3Rqnf17ylixlNE99ISpif4YVtPFS8yRsHG5VoI41dhTXC2BtkdvEPYxPtLuUaUCYOoavDIdjxy+SZpIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(316002)(6506007)(8936002)(33656002)(86362001)(66446008)(66946007)(4326008)(8676002)(186003)(66476007)(76116006)(64756008)(52536014)(478600001)(66556008)(5660300002)(9686003)(71200400001)(6916009)(83380400001)(7696005)(55016002)(53546011)(2906002)(54906003)(107886003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: INbL1VhS9HzJVFTxLuCK9Kr9/Z8B51j1SN7ceoWzB467N4q5HBx4hs7Rzj6TfAW/ObrgGc2vM2L1MfcDV03jETvUEgCqZCPxasbqlCV8GTCAaPTE7D8jC1BbO18YOA75dadonatmMNz6eiotHFlT1PbSLAg9lk9TMFmsNM1f7O7qyCm2oiSNWLEuhCF1VrZMb5JEGW9G9VG5JGZQ4iShU4fe4U3dx/hhEIRKnr4LAXB/tt7z/PxQ8ryLDLyFhqQvXcvRE80iMq5HnvOOurPc2Ou3uXDuMB36deO91sNBBV49fHTa7V0IZoD+IL7NNPnzRHbHcjjaLAqBxMrlKlwd7jX56J/gzKW0MenycbVfMR4kJVWZZNC7E45jDMuq9klt/8Ka7Lb9eSkpu9VC9brO5yP1rurLLhtNvGcjrCdrAmBxtpIZZWUnNidhaftZcSKRrMpRnLHKDTx/2ZHXMI772S8r/rhn3sbOOHS66BpEkzApM4/8SjaRO/S/UIbkt61aZ9F+wD/n0mha0X9zVHfkaE9HCxQ2Okz3NdNC48Ej3sojvUotiEJ9zvFWhGOMGTT8b0qqmTjS7J5jIxn0B0+CZmwUH5rRcAITHRUG7n4PN4RnAs84s+vHvFG8hkP8771U3lgWswKhWIbjB4TrDZxRIA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ce8d81-c539-4a77-1dfb-08d8719e4ee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 06:40:01.3687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BClcNyUgYh7UlsMAhqpcyXnKpsfgqojNb3GEdKiaWgkMaxCG3YSY/wJXo6571HnqThi7zYsJsQlzAsFLUy2e3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1902
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
> Sent: Thursday, October 15, 2020 5:54 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> 

//snip

> > +static int mlx5_ib_umem_dmabuf_xlt_init(struct ib_umem *umem, void
> > +*context) {
> > +	struct mlx5_ib_mr *mr = context;
> > +	int flags = MLX5_IB_UPD_XLT_ENABLE;
> > +
> > +	if (!mr)
> > +		return -EINVAL;
> > +
> > +	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags); }
> 
> > +static int mlx5_ib_umem_dmabuf_xlt_update(struct ib_umem *umem, void
> > +*context) {
> > +	struct mlx5_ib_mr *mr = context;
> > +	int flags = MLX5_IB_UPD_XLT_ATOMIC;
> 
> Why are these atomic? Why the strange coding style of declaring a variable?

The atomic flag is copied from the odp code. I have verified that it is not necessary.
I can remove the definition of 'flags' here.  

> 
> > +	if (!mr)
> > +		return -EINVAL;
> 
> Why can this happen? Will dma_buf call move_notify prior to dma_buf_map_attachment? There are locking problems if that happens.

I agree this check is unnecessary.

> 
> > +	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags); }
> > +
> > +static int mlx5_ib_umem_dmabuf_xlt_invalidate(struct ib_umem *umem,
> > +void *context) {
> > +	struct mlx5_ib_mr *mr = context;
> > +	int flags = MLX5_IB_UPD_XLT_ZAP | MLX5_IB_UPD_XLT_ATOMIC;
> > +
> > +	if (!mr)
> > +		return -EINVAL;
> > +
> > +	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags); }
> > +
> > +static struct ib_umem_dmabuf_ops mlx5_ib_umem_dmabuf_ops = {
> > +	.init = mlx5_ib_umem_dmabuf_xlt_init,
> > +	.update = mlx5_ib_umem_dmabuf_xlt_update,
> > +	.invalidate = mlx5_ib_umem_dmabuf_xlt_invalidate,
> > +};
> 
> I'm not really convinced these should be ops, this is usually a bad design pattern.
> 
> Why do I need so much code to extract the sgl from the dma_buf? I would prefer the dma_buf layer simplify this, not by adding a wrapper
> around it in the IB core code...
> 

We just need a way to call a device specific function to update the NIC's translation
table.  I considered three ways: (1) ops registered with ib_umem_get_dmabuf; 
(2) a single function pointer registered with ib_umem_get_dmabuf; (3) a method 
in 'struct ib_device'. Option (1) was chosen here with no strong reason. We could
consolidate the three functions of the ops into one, but then we will need to 
define commands or flags for different update operations.   

> > +struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
> > +					 u64 length, u64 virt_addr,
> > +					 int dmabuf_fd, int access_flags,
> > +					 struct ib_udata *udata)
> > +{
> > +	struct mlx5_ib_dev *dev = to_mdev(pd->device);
> > +	struct mlx5_ib_mr *mr = NULL;
> > +	struct ib_umem *umem;
> > +	int page_shift;
> > +	int npages;
> > +	int ncont;
> > +	int order;
> > +	int err;
> > +
> > +	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +
> > +	mlx5_ib_dbg(dev,
> > +		    "start 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
> > +		    start, virt_addr, length, dmabuf_fd, access_flags);
> > +
> > +	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	umem = ib_umem_dmabuf_get(&dev->ib_dev, start, length, dmabuf_fd,
> > +				  access_flags, &mlx5_ib_umem_dmabuf_ops);
> > +	if (IS_ERR(umem)) {
> > +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> > +		return ERR_PTR(PTR_ERR(umem));
> > +	}
> > +
> > +	npages = ib_umem_num_pages(umem);
> > +	if (!npages) {
> > +		mlx5_ib_warn(dev, "avoid zero region\n");
> > +		ib_umem_release(umem);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	page_shift = PAGE_SHIFT;
> > +	ncont = npages;
> > +	order = ilog2(roundup_pow_of_two(ncont));
> 
> We still need to deal with contiguity here, this ncont/npages is just obfuscation.

Since the pages can move, we can't take advantage of contiguity here. This handling
is similar to the ODP case. The variables 'ncont' and 'page_shift' here are not necessary.
They are kept just for the sake of signifying the semantics of the following functions that
use them.

> 
> I have a patch series that should get posted soon rewriting all of this stuff..

Great. This can be updated accordingly.

> 
> > +	mlx5_ib_dbg(dev, "npages %d, ncont %d, order %d, page_shift %d\n",
> > +		    npages, ncont, order, page_shift);
> > +
> > +	mr = alloc_mr_from_cache(pd, umem, virt_addr, length, ncont,
> > +				 page_shift, order, access_flags);
> > +	if (IS_ERR(mr))
> > +		mr = NULL;
> > +
> > +	if (!mr) {
> > +		mutex_lock(&dev->slow_path_mutex);
> > +		mr = reg_create(NULL, pd, virt_addr, length, umem, ncont,
> > +				page_shift, access_flags, false);
> > +		mutex_unlock(&dev->slow_path_mutex);
> > +	}
> > +
> > +	if (IS_ERR(mr)) {
> > +		err = PTR_ERR(mr);
> > +		goto error;
> > +	}
> > +
> > +	mlx5_ib_dbg(dev, "mkey 0x%x\n", mr->mmkey.key);
> > +
> > +	mr->umem = umem;
> > +	set_mr_fields(dev, mr, npages, length, access_flags);
> 
> After another series I have there will be three copies of this sequence :\

Maybe this can be made into a utility function?

> 
> > +	err = ib_umem_dmabuf_init_mapping(umem, mr);
> > +	if (err) {
> > +		dereg_mr(dev, mr);
> > +		return ERR_PTR(err);
> > +	}
> 
> Did you test the page fault path at all? Looks like some xarray code is missing here, and this is also missing the related complex teardown
> logic.
> 
> Does this mean you didn't test the pagefault_dmabuf_mr() at all?

Thanks for the hint. I was unable to get the test runs reaching the
pagefault_dmabuf_mr() function. Now I have found the reason. Along
the path of all the page fault handlers, the array "odp_mkeys" is checked
against the mr key. Since the dmabuf mr keys are not in the list the
handler is never called.

On the other hand, it seems that pagefault_dmabuf_mr() is not needed at all.
The pagefault is gracefully handled by retrying until the work thread finished
programming the NIC.
  
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
