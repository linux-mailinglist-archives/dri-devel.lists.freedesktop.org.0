Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F8B2A73E3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 01:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8CA6E853;
	Thu,  5 Nov 2020 00:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2518E6E853
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 00:36:38 +0000 (UTC)
IronPort-SDR: 46zp0YGzdmF6DufNZOPos0L1lmluYyw4VhV7RX79I5GCbGKwwMv7FxbbX7bDtUM6PNt7/DrmJD
 i4W3vf3RcmyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187176353"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="187176353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 16:36:36 -0800
IronPort-SDR: bBLiB8lhjKjdzYONrOWqNn8vCSoaosdGo/CyV58Cli/sGQW2jcohmo9aCQp1wP/LIFShym24vn
 aJY5VstxVh3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="471436250"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 04 Nov 2020 16:36:35 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Nov 2020 16:36:35 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Nov 2020 16:36:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Nov 2020 16:36:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 4 Nov 2020 16:36:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS5LBC/b7W4ztrVApenNNYtH0asRhydO7M8wUXaYDpmqrLQ79Y5y0/zaVQo6CdbUg6a/oiQGLgXu692Cz+4X937DW/PNNXMiZtxTZbDIoYD5P+hPNG+TZjLxMud3YaiLuBlmApF/xOi5MTTLHmc6qsUE7b345zFQjEC94fIAWhWfwp6Vk/61TnK2XavkInDM/WPo+TrMCIr1XlbtkEHZTMeg5/3pqiUMNNwWQBMV3gu1kgAdQeQQoP/6g4aVKFZ6SaFMGW8WLdo4nEB4RfAM6qJSCfqr/RY8S8OeNs+U9GC198yQjPjbQ5uCyn05w+KvQq6jMAHyCI6IjNi2We13lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McW0Y3R+bFlJWryiSNQP5Wk88rXalb9dIYTykZGwKJI=;
 b=EYCTl5Ilcgmu96VLvfr/8mT3Smjeh2zarSgk0nrWnZ5BIOrqZoV+dX17moTdtooC8WxSwdJmZX74G7d9Qwf28tdbpCNxrXbjrFMfmv2LSVM/cPK86Dy8DLqV+eCt9YoX04gXr6WVGDJkn7S5n3K9qiDoAR0Fvt8YI0rO1fYFQUYzzVg4GxuYRQaowTW8QllyKmjJ/08W2YfkKAyZIrdVoaXCnO6Tbp836Y479+h8bkB2kLgJBG8KCKm/4cUQd3304Ifndg5Ey0Ra/zJkwfDou9HrOT27e/zuOdl+wgNYBvhI7zBTY6rRsyDHPlnbHRc7OAP0s0zHdixHIsA+Vy325A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McW0Y3R+bFlJWryiSNQP5Wk88rXalb9dIYTykZGwKJI=;
 b=sAK+IgUVRnT1yNrl3cV+aaD3xwY5JOG5KFXhyofqxxlHUJzSARenqAAUcW/EeewgNEfuBpiwXDrSbphmYXCvxl8QMOzd84KRMr1UMN3uycH6hQkf0B3Mwo4BIQolhMo/DBcavZVtdHjMeBaF8eqSkdnW9IfSgxnU2ZGK/3IjSUI=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2351.namprd11.prod.outlook.com (2603:10b6:300:74::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 00:36:25 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 00:36:25 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWsvTdoAQ94Ud9CEmDtlSFntAEqam4qVmAgAAC3KA=
Date: Thu, 5 Nov 2020 00:36:25 +0000
Message-ID: <MW3PR11MB4555C4C6A58F0D054C69FEADE5EE0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604527595-39736-1-git-send-email-jianxin.xiong@intel.com>
 <1604527595-39736-5-git-send-email-jianxin.xiong@intel.com>
 <20201105000721.GY36674@ziepe.ca>
In-Reply-To: <20201105000721.GY36674@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: a0e15d5f-a7d1-4610-3023-08d88122d406
x-ms-traffictypediagnostic: MWHPR1101MB2351:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2351E37441322A1B2C39F323E5EE0@MWHPR1101MB2351.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GIwYRjZompMDQe55yZAGlLVW/D0zcZY0uOrMiPfPhUNQnZwnKGATxrZOIyTEojgnkKn+6S79v76G5SnSH1Et9ogyL+PchB21TZyiOmmVaZir2u+AuMgHLh5Q9G6RXI2oR6uOi/P4PDDc7ZV230dr1cpskq264vwTuUjSPZAsyBBB23dHG36fUB07SHE9SFC1wtLxuuQu6RB+MS+WSNzPd86YKvXl1MWdWHBCXWN0ApY1vdNjavlo48t02+5ZJrJw7tq1P13WXBBsT/uYdevfKEns3WfSxqfbzJu0VybDrSsYuU48a7Tioe+K3G0jZh6qBOMBBWnzmBGDY61S7rtHiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(8936002)(7696005)(66556008)(66476007)(55016002)(76116006)(2906002)(64756008)(66446008)(26005)(9686003)(66946007)(53546011)(71200400001)(107886003)(316002)(83380400001)(4326008)(8676002)(186003)(5660300002)(54906003)(86362001)(52536014)(478600001)(33656002)(6916009)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aR5MG9Tf7eh8XnIR2bUO37eTx1m6a6v7kd1EPweISN1qAigQETW+HsVeuHaPUErKkch0XuapdPCFQLgN4qMwkqrJsaEDHRAiXpVkaLp+i1Vd8VMaY7ERRXi8Rkzld6hao+yDSK2cA8sEMoHtIN8wfIPBc3xTTXCbXy4wn8nT+mI5X0qOgukqUQBTM/D8yzZNRBqfuzxq4KxKA4fjo2K/5PydI2PHae34BrO9csCqkF5A/bvCwHAxFGCat9HvGcUbf1P5jCiOMRnZ7bnfamu2Vx00yuCpkGK/GkZ0iNK4iu1B087BkJ+ZNV2o2vsWNrUTEGl/Fqnmg6plw/USYBb3cJ7ToZGxjF5vrSGr2l70rch8AMf5JdUR3I+yqoU4m67HLqIebH/kAl2Z9D+vYyiQzNgX5Iq7gsXaCOEhEGoiXv2o3HFotVbsxj00pfNa69KDXiQEATHAbX9/qhvR0TRZR7Rwgnsdi73yr7j0Q4c/EcmkSXa7Lps0OUs3kEjmoPuunIlGewLjUnuLNTXi0njwvrNVFEHRUPlsYXgqvccS2uOpzBd3R5h3C4KMiZircr/c9Qe4LkZ4IYGojikn61eay3Rx6jptW3nYWAINtWnYPh2kGBnPt8vwsohfhszZbN/gKI+shduXM0QPZCvAvbjBLw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e15d5f-a7d1-4610-3023-08d88122d406
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 00:36:25.7557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XpsS/1ZK0hKd4Lpeq6Wp6TGMvAEPNfHbKBNZhbubR1WcIvfLgcpsasI7vdUOPKmYVH3gMGWYbrGUAD6dzDuhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2351
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
> Sent: Wednesday, November 04, 2020 4:07 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v7 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Wed, Nov 04, 2020 at 02:06:34PM -0800, Jianxin Xiong wrote:
> > +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> > +				  &mlx5_ib_dmabuf_attach_ops);
> > +	if (IS_ERR(umem)) {
> > +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> > +		return ERR_PTR(PTR_ERR(umem));
> > +	}
> > +
> > +	mr = alloc_mr_from_cache(pd, umem, virt_addr, access_flags);
> 
> It is very subtle, but this calls mlx5_umem_find_best_pgsz() which calls ib_umem_find_best_pgsz() which goes over the SGL to determine
> the page size to use.
> 

When this is called here, the umem sglist is still NULL because dma_buf_map_attachment()
is not called until a page fault occurs. In patch 1/5, the function ib_umem_find_best_pgsz()
has been modified to always return PAGE_SIZE for dma-buf based MR.

> As part of this it does validation of the IOVA vs first page offset vs first page dma address. These little details come into play if the IOVA and
> offset are not PAGE_SIZE aligned, which is very possible if the dma buf exporter or system PAGE_SIZE is over 4k.
> 
> In other words, the dma_address of the first SGL must be the page aligned starting point of the MR. Since the 'skip' approach is being done
> when breaking the SGL into blocks the ib_umem_find_best_pgsz() sees an invalid page size.
> 
> Slicing it has to be done in a way that gives a properly formed SGL.
> 
> My suggestion is to just change the SGL in place. Iterate to the starting SGE in the SGL and assign it to the sg table, modify it to have a offset
> dma_address and reduced length
> 
> Count the number of SGEs to span the remaning range and use that as the new nmaped
> 
> Edit the last SGE to have a reduced length

Do you still think modifying the SGL in place needed given the above explanation? I do see
some benefits of doing so -- hiding the discrepancy of sgl and addr/length from the device drivers and avoid special handling in the code that use the sgl. 

> 
> Upon unmap undo the edits so the exporter doesn't see the mangled SGL.
> 
> It would be saner if the exporter could do this, but oh well.
> 
> Approximately like this:
> 
> 	struct ib_umem *umem = &umem_p->umem;
> 	struct scatterlist *sg;
> 	int i;
> 
> 	for_each_sg(umem_p->umem.sg_head.sgl, sg, umem_p->umem.nmap, i) {
> 		if (cur + sg_dma_len(sg) > ALIGN_DOWN(umem->address, PAGE_SIZE)) {
> 			unsigned long offset;
> 
> 			umem_p->first_sg = sg;
> 			umem_p->first_dma_address = sg->dma_address;
> 			umem_p->first_dma_length = sg_dma_len(sg);
> 			umem_p->first_length = sg->length;
> 			offset = ALIGN_DOWN(umem->addressm PAGE_SIZE) - cur;
> 			sg->dma_address += offset;
> 			sg_dma_len(sg) -= offset;
> 			sg->length -= offset;
> 		}
> 		if (ALIGN(umem->address + umem->length, PAGE_SIZE) < cur + sg_dma_len(sg)) {
> 			unsigned long trim;
> 
> 			umem_p->last_sg = sg;
> 			umem_p->last_dma_length = sg_dma_len(sg);
> 			umem_p->last_length = sg->length;
> 			trim =  cur + sg_dma_len(sg) - ALIGN(umem->address + umem->length, PAGE_SIZE);
> 			sg_dma_len(sg) -= trim;
> 			sg->length -= trim;
> 			return npages;
> 		}
>                 cur += sg_dma_len(sg);
> 	}
>         /* It is essential that the length of the SGL exactly match
>   	   the adjusted page aligned length of umem->length */
> 	return -EINVAL;
> 
> Further, this really only works if the umem->page_size is locked to 4k because this doesn't have code to resize the MKEY, or change the
> underlying page size when the SGL changes.

Yes, now it's locked to 4K. 

> 
> So, I'd say put something like the above in the core code to validate and properly form the umem->sgl
> 
> Then modify the alloc_mr_from_cache to use only PAGE_SIZE:
> 
>  if (umem->is_dma_buf)
>         page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);  else
>     	page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> 

This should have been addressed in patch 1/5.

Thanks,
Jianxin

> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
