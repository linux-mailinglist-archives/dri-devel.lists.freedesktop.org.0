Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1012B224D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC446E5CF;
	Fri, 13 Nov 2020 17:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADE96E5CF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 17:28:28 +0000 (UTC)
IronPort-SDR: M4bMW+zpJZcvNwwUNA8QYW33IxKSfiiIfAv5FIJNigqFCMG+njT/TOTzK9vuhCu3IqW4RvgbxB
 auRxyI4jmU7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="157525343"
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="157525343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 09:28:27 -0800
IronPort-SDR: CimYDpozihoFZaxPS8IQJPDcpDi2ElDaZkCGBtlMHSIg6C8KOwR5/8d8fytpFnPp8unJQsha2V
 Y+T69QMwjAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="355603987"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 13 Nov 2020 09:28:27 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 09:28:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Nov 2020 09:28:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Nov 2020 09:28:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 13 Nov 2020 09:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae8e7elUr+WLi8EAfeisM9Ck4m4RPhrp5JzLUH9PmkbNMY2/0ELtifRj5AjlR08+3mmjt0SdCqFiXujkeOGyOkmOEm6cmQ5noyOqFlUg6g7MSj6Pk8xvZaYft9rUsCn9o/E3F+2sY8rhJS5VZom/AAV6k0nEPOlo7x1aviE4l34hO0TX0JmYYFCKTV1LVYCtfVUj/hf1fQF+FCYuQJUpQEHFae6SbA+z5DHQLkfqVHcsXNd0Ag2iix8ZRB+wqj2WZYpUJe3rYGrASW9kM797l+vjdaTw3bGPt/j3gASj/h8DPZxOWnyFdDEEtXB1IsTeRQB0JVmEZYvznvP+xLdLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+saa6RtwNLcZPN810Ry7CNLDvj5Js4FASFZgY2gAoOU=;
 b=JlSFXPE5bFcmrdiQ75I55hiddraKrS7A/Iy7eXdOPWN8QXe8gg22QJB2SZWD8uFlC9Q2dIyLsLfjVWrZi9gtsp5IthJ9SfP9/f630+F5DkLgjexzguFAgGRWKI88gMyhVzmc1Qxi+bviqrzXiA16ODXTBPKpzFVmhVpyjXxEjIbEusuWAnXbuy0pvVaYjNgaRJBfr/a5ISfF2BnxJiPECDUTBppkbnw5h7ee/1TSVMdwyd5usWOBncvu2DXwsZDD6G4bA9yRD8NXNl2VXTdWvt05pNEVT2QQuwOvwP8ixKR3aWScjS0SLdg7mvV9ftL2M8Wcx4O8TMpBhEstpmSGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+saa6RtwNLcZPN810Ry7CNLDvj5Js4FASFZgY2gAoOU=;
 b=CpBuWk11hue2eTIqaf06ADb7QxU/GMoOlutjoDidnKjEk2NN6eTktaLfc8jpGGv4ihcuLhYVKda1XUq64jj8wEIkCT+APUkEz1UB7ObuTVudjn7srA8cH7dB9/JU1f6jLmtIriN49OwcE4kqzjls2fXk1fG1HgvYqXVTWAegC8M=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1789.namprd11.prod.outlook.com (2603:10b6:300:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Fri, 13 Nov
 2020 17:28:22 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3564.025; Fri, 13 Nov 2020
 17:28:22 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace
 memory region
Thread-Index: AQHWt6hWWtXHedGI1Eu5Tn8UtjOrH6nFO6cAgAAyciCAAJ4lAIAAQ48A
Date: Fri, 13 Nov 2020 17:28:22 +0000
Message-ID: <MW3PR11MB455509C28F80BA9CB6CD4B84E5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-5-git-send-email-jianxin.xiong@intel.com>
 <20201113003946.GA244516@ziepe.ca>
 <MW3PR11MB45550E49934ECB53FC42E688E5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201113130620.GD244516@ziepe.ca>
In-Reply-To: <20201113130620.GD244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 89888828-4924-433e-5446-08d887f98568
x-ms-traffictypediagnostic: MWHPR11MB1789:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1789B8A337802C65C5465EA9E5E60@MWHPR11MB1789.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDt8TQSEctX5pv88K5W6pIRrkTvxP4e+5ooawqaHpa/2Pv8OJ0dUNqt7qFxPlxQjeNk4UlISWArnMmGSXJluKVxOFq1o8oO6ye0xhUbSPOd2IYp8bChem206OkHkrwoCRQa6lpsQ0kCLZ2DvPOGm0yUISLWjjGTcLevZFy8a0gCmNizzQDVp7MUvhnz5qVjIsmjsVJgMfZ/MTpwGs6bMt3dX/CeYzlTMzqFQMhNlWw3jRv7BdxD/TXwO5NO28atqKo5Cwzd87WtSUU+rzXxR0Le+s2gPmh6RaaFJ7g5kiyKKi+LsrO6HFk1gWxoPgHGA+rWrC/Lv6GPNg7G+W6GsXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(54906003)(8676002)(83380400001)(478600001)(6506007)(33656002)(26005)(55016002)(2906002)(53546011)(4326008)(8936002)(7696005)(107886003)(316002)(64756008)(6916009)(66446008)(66476007)(71200400001)(76116006)(5660300002)(66946007)(86362001)(9686003)(52536014)(186003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jbrUQZ5Ov9vsQcc+obCcZuiKdiuL85puRuvCt/Uor+WaKNBcsC9R9/rO6pegINvRLFOJQUdBu36+Ri4DSlfJnu5StxcdJRGrhQITKSwHKy8pExjFkM8vIzTA/R/sMhbYoin4GhCZZFSBFEDLX06Lp6VSlxA/KefzWXoB0K+f62iaz/ugUpjX4R+jEJLMRQW3fw5geZ92q48RkSSC8R/Hqy0jD7u6SHdKJS+9xQh3wcIzSBBLdaGDaOkzKvkhJeqZFsKFuzNXAf8p8790cAKlm1daYusQGOFvTX2tsK9/rfmpnklLUDACH+5A58VCVpSN0i9VTwytM9vdxOJn95dC+ivHNRm4KOHvxPek/uCgcdvqr7xlszTSMxrjwXgG9jkv1EtKtwIX3pE8EaWRoOe8fo/e1q9TbmEXkBLZ3V/va7VJj/Ycs/3nI7LfnG2GPCCFyHrscZ9qerORzxnVQP6ew7IIoGV5G1OHZMHQ5B0k07TLOGNcYlT0vlAxffNT/xWsXyijZvfJyhkfV1ry+HiWdozega1+pz3HAZ6QYqd4d+8dIFmiylVO5fptnbu391yU7g2ktSm+96ijrWT/j0FdvBLH0hIvBZCOjrcNTr6dw7mak9SMje4N+2TPY9hZh3O4Dq2xH3QhkWLwCR1unmBNNyc3b6uoBQc/mQpEBbWOr09Rli0AsZnfmjIqv2GHKI0Nis0bpvEJsbX56Q+rHvDRyP7jZSKubKQ/PUoyMdrBwTUZu454nrUPKdVBTUJFPl4Cp6iKQqyJUVazBIIN+i1IX3zP7laeKMAKzTXYZIrmfdDaLxiy+KmVKpDG6+GVWzKyuyO5/d3vQAJiJHvmYdXyNlu0xz6PRhfxkIGHdRAd4GLneadOyhfHhkSNhAssi71bE8uQIJ6A20sKpkIz298/Hg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89888828-4924-433e-5446-08d887f98568
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 17:28:22.6374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJR+ix3u2ydxI7ynDDwNSE7bbyY7EFqAFjxGBSVXbDW0X3izWXW3emEgh1UUGJga98ztPsKZ0eRmvEAL1YCcow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1789
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
> Sent: Friday, November 13, 2020 5:06 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v10 4/6] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Fri, Nov 13, 2020 at 03:51:20AM +0000, Xiong, Jianxin wrote:
> 
> > > > +static void mlx5_ib_dmabuf_invalidate_cb(struct
> > > > +dma_buf_attachment
> > > > +*attach) {
> > > > +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > > > +	struct mlx5_ib_mr *mr = umem_dmabuf->private;
> > > > +
> > > > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > > > +
> > > > +	if (mr)
> > >
> > > I don't think this 'if (mr)' test is needed anymore? I certainly
> > > prefer it gone as it is kind of messy. I expect unmapping the dma to ensure this function is not running, and won't run again.
> >
> > It is still needed. When the dma-buf moves, the callback function of every attached importer is invoked, regardless if the importer has
> mapped the dma or not.
> >
> > >
> > > > +/**
> > > > + * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
> > > > + * @mr: to fence
> > > > + *
> > > > + * On return no parallel threads will be touching this MR and no
> > > > +DMA will be
> > > > + * active.
> > > > + */
> > > > +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr) {
> > > > +	struct ib_umem_dmabuf *umem_dmabuf =
> > > > +to_ib_umem_dmabuf(mr->umem);
> > > > +
> > > > +	/* Prevent new page faults and prefetch requests from succeeding */
> > > > +	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
> > > > +
> > > > +	/* Wait for all running page-fault handlers to finish. */
> > > > +	synchronize_srcu(&mr->dev->odp_srcu);
> > > > +
> > > > +	wait_event(mr->q_deferred_work,
> > > > +!atomic_read(&mr->num_deferred_work));
> > > > +
> > > > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > > > +	mlx5_mr_cache_invalidate(mr);
> > > > +	umem_dmabuf->private = NULL;
> > > > +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > > > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> > > > +
> > > > +	if (!mr->cache_ent) {
> > > > +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> > > > +		WARN_ON(mr->descs);
> > > > +	}
> > >
> > > I didn't check carefully, but are you sure this destroy_mkey should be here??
> >
> > To my understanding, yes. This is similar to what dma_fence_odp_mr()
> > does, just inlined here since it's not called from other places.
> 
> I think you should put the calls to dma_buf_dynamic_attach() and
> dma_buf_detach() into mlx5, it makes the whole thing a little cleaner, then the umem->private isn't needed any more either.

Putting these calls into mlx5 can remove the 'ops' parameter from the umem_get call,
but I don't see how umem->private can be eliminated. In addition, I feel keeping these
two calls in the core provides a better separation between the core and the driver -- 
dma-buf API functions are only called from the core, except for locking/unlocking.

The 'if (mr)' part in the callback can be removed by adding a line
'if (!umem_dmabutf->sgt) return;' before that if that makes a difference. 

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
