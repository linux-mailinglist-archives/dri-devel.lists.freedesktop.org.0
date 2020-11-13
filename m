Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEDC2B14DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 04:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164F56E051;
	Fri, 13 Nov 2020 03:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B16E051
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 03:51:31 +0000 (UTC)
IronPort-SDR: Z/L8uvEK9gzDRmwhYgWyLLcH8MbhIyGdgSZgYRteE9RX6IpsP1gentadP0o7SxL6C1ktEoYlsu
 1mJyLU5JKxEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170591458"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="170591458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 19:51:29 -0800
IronPort-SDR: RldrbvVGJyPKcWoiM52vEHEL+6NNLeAL5HDJy/NZ94t3xUFyXtsBfdj4gdkuPhMzk+ueo44NOB
 nT3dH8kRbB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="474525220"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 12 Nov 2020 19:51:28 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 19:51:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Nov 2020 19:51:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 12 Nov 2020 19:51:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr15xVCE81PX8cRhKNSGAhLR7gdMpuBuTxMDgoNdMspSDon/82j7zwa+Mm/JAFeU/8/aYfktigH/U48LtDwr6SYTN3lkOSAZJ2+r/BGoWLd3mHDcR4sHA2ceQpfBOH9Z34YS/Ql+3j//Iq2dTD/BUO4aeaPD75ZFH82uq82M7/JcKZdDXE/is2LLU7dRpJdYdwvZy8U4n3pUjijfUk6DmytC8cyZ4sDqG8BvC3iDzbV+GOVvRHfMhAY3xcXyP+I1GHnRKTE7sn3dGTI2kCAfxFldBx5qSHcCOoMDGIjVDtUoZqnP3NpWXxYRih+XqRmhDqjZt1dh36jOIQ22ye4mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45DjwU+dC8R/19uwsMBJVOXdcEuc5LFKqI3r8BbHDl8=;
 b=i0zKUJyAU0FChYOL6v7Qos48/qT3NjM1n/xsK+WdRLtZTa+m6K9IliDS87bM4nOpYaFmLTrgABBmAd/YGccaTCyRQpYvADgLlMWDUPuUyte7rlyHZUIuvv1FVwtTNGaLzPBovbykGVxedGD/gWD0pgOnw1MHjhvhi3oUGs6o26PfWaH4u/iZ8JODg3aLiLGcsWbL1+2EeDRhFAcXQKfGFkt1ybzR2laIHwaglEMlVqjgEZk4+C1927/h/S2zqzkzcw7kuAgQC4bF5CPoVA+6iIeO5iAaSb7I4cd4sqNFu4nkkgcPZXo/eTrnf1AhTR9SK2WHgCayRk6wCJ2Esa/93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45DjwU+dC8R/19uwsMBJVOXdcEuc5LFKqI3r8BbHDl8=;
 b=f8Eac2ocLkcQOou/fnTrWo3T8Pinpa2Q/foBzkgl5pHaJE3l2ctPDO61IyeOto7OUkkHA/5zlRJYeQ7al8Dypyy6OnNWzWe4Ngd5Rufu1zLT3p9Qn1A2+PnnJ1qrW/gxTsC3grDH5j7wslVx7CCWHl607h65zJrsTMCogivT9kA=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 03:51:21 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3541.026; Fri, 13 Nov 2020
 03:51:21 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace
 memory region
Thread-Index: AQHWt6hWWtXHedGI1Eu5Tn8UtjOrH6nFO6cAgAAyciA=
Date: Fri, 13 Nov 2020 03:51:20 +0000
Message-ID: <MW3PR11MB45550E49934ECB53FC42E688E5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-5-git-send-email-jianxin.xiong@intel.com>
 <20201113003946.GA244516@ziepe.ca>
In-Reply-To: <20201113003946.GA244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 4e28a154-ae00-4329-6ca6-08d88787622b
x-ms-traffictypediagnostic: CO1PR11MB4995:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4995F801AA44A9CBF9A6F178E5E60@CO1PR11MB4995.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZxegftkuWtV04JOOTGWt5CY2JBU4lhRnhcjmYV/8JYPA0gYtddIe4pcPyTK4ZaYq5FPx2PXKfkCgWXhyK/yQGWiSMGxIxEraposHbQ6ru/UwEGpwgY44h2E0mqxVyil4ixccgXK5+8qiYh5FIbv94AE8qLtm/fkdNJ4AArjPn0E/4hHplm9tpCBTfraZ8BHJh6sJ15dGjx7RLI5DYauHp2ot9pnuq48tGSPUNTBqlQrlFhUCOmW9wILluCMp9jGRsLI1i0k2Mv3S3TcUOwYmufTh6dbT8DFu5s6sh7cBWNCa7Qi8Zk+7mKEZ6VKKDv0TEpOeqOeW+oPjZ8jJtoIBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(71200400001)(8676002)(66946007)(5660300002)(6916009)(186003)(53546011)(478600001)(52536014)(83380400001)(8936002)(66556008)(6506007)(66476007)(2906002)(107886003)(7696005)(9686003)(26005)(66446008)(33656002)(55016002)(64756008)(76116006)(4326008)(316002)(54906003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 98iH8lVph5YcLnNbCbL3WqF10b6709WHJ/9InPecMfiedxhVr5o6Nn6AYT6rcymYZ1r+t3ra9vk8Gr2HJrnIZo8cvWx3PdHktT//U3HeBg7esA478r8jLFyu2OeV4fW8rcKj/iKFzi0NAHW9/IvAbuoHOIOeY55efieLtgNaII7ZUGadalCecq7IIVQLWuYa02tnYEHQx5wkpGfZfyq3uIoZ4a1K3I1lbEn6nBS+Y/VPxCAJgX92wmWKOV19bWV1cvqB8x2S1GRCIixk84Q+Qde8m/91oihjg7YqOHFYLsZcyi45qmSUxD9NCamGr1A929XdkD9TpiBIDmrGvJppwNeEj725JcSa7S8RTRvNNfLS0rTgj9JtHWSNTsRAUIu9HSl4SrmnVhQ+N/ZyW7nV8kb2o20JD093dESRHNpTKmOEHyjb86rdrhuJ0PRGrrJZhuFe4DTLvvRVgQAxov/ERe18Vm07PdhhrgJpdKr2yLkI3PrOLXH9f0eZjYtXWBaTkRUZk4JqN47xmjZyI4kjc0qO/FhOkUDOCto26YmGFKLv3eS0Hm9ud1CSlRLxiAUNqFm3n/a8VNUxM9Y+8uF5nEXsQJnErgYRclIQWb6jLmChPc+PTzuIH+24cLoFAgOiuaFarMGcYN/c3YFfsJaNxGy7+XFYmwgN9+WAG/nzkmstl30pe+LLzuhBfX/RFAle2wG1RVKx+yZiPKkSFcaigtqbvUN0PdNDB3wm3rjZO0ENU5VSN3b6KQlbxUEz4542aOqPK3LHjBvQ+JermuTVox7ug6nEJO3y1VtJY76lTP+++wWNRPauk9itMAFxFOK3f/faGKpFL6sKqvGUCXown2MBqo4GEU49AmX3V/vtTkZ5BYcfxw39TL43mHRk7mz4BPYr335aKMZhJ+Z9KNktnA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e28a154-ae00-4329-6ca6-08d88787622b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 03:51:20.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VkD9WVRiwKV+wVJxkIuui2LpxzU47mH+4SyIG6bxjoNCii3D5++HmYQzFi8HjZOON6bs+eo90D2D1tpuDZccpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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
> Sent: Thursday, November 12, 2020 4:40 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Tue, Nov 10, 2020 at 01:41:15PM -0800, Jianxin Xiong wrote:
> 
> > -static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int
> > flags)
> > +int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
> >  {
> >  	struct mlx5_ib_dev *dev = mr->dev;
> >  	struct device *ddev = dev->ib_dev.dev.parent; @@ -1255,6 +1267,10 @@
> > static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
> >  		cur_mtt->ptag =
> >  			cpu_to_be64(rdma_block_iter_dma_address(&biter) |
> >  				    MLX5_IB_MTT_PRESENT);
> > +
> > +		if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP))
> > +			cur_mtt->ptag = 0;
> > +
> >  		cur_mtt++;
> >  	}
> >
> > @@ -1291,8 +1307,15 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
> >  	int err;
> >  	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
> >
> > -	page_size =
> > -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> > +	if (umem->is_dmabuf) {
> > +		if ((iova ^ umem->address) & (PAGE_SIZE - 1))
> > +			return ERR_PTR(-EINVAL);
> > +		umem->iova = iova;
> > +		page_size = PAGE_SIZE;
> > +	} else {
> > +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> > +						     0, iova);
> > +	}
> 
> Urk, maybe this duplicated sequence should be in a function..
> 
> This will also collide with a rereg_mr bugfixing series that should be posted soon..
> 
> > +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment
> > +*attach) {
> > +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > +	struct mlx5_ib_mr *mr = umem_dmabuf->private;
> > +
> > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	if (mr)
> 
> I don't think this 'if (mr)' test is needed anymore? I certainly prefer it gone as it is kind of messy. I expect unmapping the dma to ensure this
> function is not running, and won't run again.

It is still needed. When the dma-buf moves, the callback function of every attached importer is invoked, regardless if the importer has mapped the dma or not.

> 
> > +/**
> > + * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
> > + * @mr: to fence
> > + *
> > + * On return no parallel threads will be touching this MR and no DMA
> > +will be
> > + * active.
> > + */
> > +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr) {
> > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> > +
> > +	/* Prevent new page faults and prefetch requests from succeeding */
> > +	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
> > +
> > +	/* Wait for all running page-fault handlers to finish. */
> > +	synchronize_srcu(&mr->dev->odp_srcu);
> > +
> > +	wait_event(mr->q_deferred_work,
> > +!atomic_read(&mr->num_deferred_work));
> > +
> > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > +	mlx5_mr_cache_invalidate(mr);
> > +	umem_dmabuf->private = NULL;
> > +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	if (!mr->cache_ent) {
> > +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> > +		WARN_ON(mr->descs);
> > +	}
> 
> I didn't check carefully, but are you sure this destroy_mkey should be here??

To my understanding, yes. This is similar to what dma_fence_odp_mr() does,
just inlined here since it's not called from other places.
 
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
