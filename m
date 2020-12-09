Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A392D48FB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 19:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89426E195;
	Wed,  9 Dec 2020 18:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456A6E195
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 18:29:07 +0000 (UTC)
IronPort-SDR: JbUWMYqSbMvGGcoOQ916mxJetTHCKUCeHfv3VE+1IeUapAk3TK2M4hbs2oamjW3tzZOEPY5amU
 sfUdEWOtjCYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="153365674"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="153365674"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 10:29:07 -0800
IronPort-SDR: TWx5ye2Zq7uR4opl7lhARy1VJb5ifcjuvvJDWA5ak30dH0klUkzOS4W/c5jRa1O8x3GjHsUk4e
 k4/s/Wl60VqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="552733480"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2020 10:29:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Dec 2020 10:29:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 9 Dec 2020 10:29:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 9 Dec 2020 10:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+UNvk1RKVCgPC7bM1C/AXD1n6Dyp4bDGMWcgWGhFIquv4shAJ/pZK/oCFUfMlhJ55doEpO2izEHAliXBeqfeQc2mX2w8RsYbWJUutohlcmJrlKZB1rFRwFBwjmwuN3aQdF9sVxR6eYDRkas5SWHEBIjFkbGNGUoQfhmIGUCXdzhqzFk5EmbyfbbcvtPvb7J24jEG02bT5aogaZSvWO8JB2NGHs8psZ3jZGrvcAGQdS1b9m0JZ/iFtUOjEGMn2uf2PZSlAxkGCzWshOJ6RyCSLxXu1JjRKAfiK3C2l/GXnGaJrOz5YR9J20JKz32kdNNyIbiByXVefb1WYjqO4wxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PP31vQkJI3VWCt9sGjlxqh8tY4Et7Hk2B0ti6qnpSI=;
 b=gOShzbnZGQ/7/7Dxi5Nv4CTLfk5tG9buT/qSKN5pHnP+5LfvY1Zv7FGLA5VqJ+bJegu8iJnODOr4Wng3IoECd2HRbXIRtHiJbpQLHmzvdLH9Xb0XZlPq04dW2viSRFqft0hVuovYKNtcU/6lwIq2YfurPCL6Zfp0x0DGKK8ptKZjdqfDk4rIBeHLwgjKXD5x35d4ThbI2PJ8YlHP5VXufOglRU0k+8sh/ij65WPS3uBqhV9OuWN2Z+BabjCgn1HMqyLqanCSkhCJgz8z70IRmrkdtmAyBFJnTc1HJqDpRBE0YN2Sufgcbai++X55AkONeH+8KuXxFEp5FGVgmJUpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PP31vQkJI3VWCt9sGjlxqh8tY4Et7Hk2B0ti6qnpSI=;
 b=h9bnympf915HCUN0WtYjxneTHDzQIVjuI7xGScqSRDHsrEJAIraHk57YNPNX8g7mVaKqOdqV8IPqI/JglJEaxHvp048PqFQkUFb6Z5jMI6uM07KX8q8FjidAorRVFfwwj2cPDjd9IyhU8x/VclQ1yv1Qt9BciGFUPsFUet8GEtY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 18:29:01 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 18:29:01 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH v14 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v14 4/4] RDMA/mlx5: Support dma-buf based userspace
 memory region
Thread-Index: AQHWzbDRB94R0IkvHkWpdbeAjhQotKnuUhsAgADEZTA=
Date: Wed, 9 Dec 2020 18:29:00 +0000
Message-ID: <MW3PR11MB45558200547E96EC9C84835AE5CC0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1607467155-92725-1-git-send-email-jianxin.xiong@intel.com>
 <1607467155-92725-5-git-send-email-jianxin.xiong@intel.com>
 <20201209064430.GM4430@unreal>
In-Reply-To: <20201209064430.GM4430@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52812a04-366d-425c-ba69-08d89c704cc2
x-ms-traffictypediagnostic: CO1PR11MB4898:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4898AD029C9BB4F278CB7E87E5CC0@CO1PR11MB4898.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZvKCSKbsO4halY3kbIQ4sr/J3PUTjvOs7Nx39nnO7TxUkpxscQKgcLVHvyQll3Y3bBuJQzmKQIOt/VD6dEeOI28Zr6ExrFJIxtK16bqTCNuz2x206K+aA02IsHKtvN61EJvx46Gv4ZtQ1VDDeXMricaXGamlOVLhbXjadxM2DX8j7nnn7TsS63xfZqTIFTGZFt+D0yGSxdQ2Zh/TSsxdgT/6rdRsA1fM18rNHz66820TG05DDrxJoOgYBn05S/Bk0MjVPgxbSKkNl5FGjLcdcGGd61hpjuSoS0xhqdxi8dZ2zcJ4LiLkBo5JSfbnOGQS7MJeFvj959bkW0KeDZRYGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(107886003)(9686003)(66446008)(64756008)(83380400001)(52536014)(86362001)(8676002)(4326008)(6506007)(33656002)(71200400001)(26005)(7696005)(66556008)(2906002)(5660300002)(8936002)(55016002)(186003)(53546011)(508600001)(6916009)(76116006)(66946007)(66476007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2uKR0QMfv5B6z8ddgWyfBmPt5SmemXTP0z1/rc+PJMv6i2yuP1Ayr6xAZ6+9?=
 =?us-ascii?Q?c8sPheXaHrV2ZAxGYP4mqP1qSr5lWgOdW2Q/Q4TgUAEDoFQ5DsfADpksDLFP?=
 =?us-ascii?Q?u6+B9EMx15SjZ5BPvhz2WBbns4v2yLTNOjuqrj8tyv8xoJKH6hsf1N99nMOS?=
 =?us-ascii?Q?Gn0o/RnHjYwlFT5RUb4p6gEUYM9xCh5Io+gdccr+G96ZI624eUNHTMsl6/CX?=
 =?us-ascii?Q?VT4nR/5abigP6V6l+FUoZnaG+lutDALc3BmdpYjqbVHyJLu4xTyxOe/4oSf9?=
 =?us-ascii?Q?V8rk58SUmQKFDaSP2N54gDXQkkayhE7/m/amr8d1zjbbmGeFHpaH3QxZ20Ak?=
 =?us-ascii?Q?Irr1CkGxmUwmyB8kNYkCUMqergH32paAIlJpNzOPoA81bK/hRoSPACOjpMBw?=
 =?us-ascii?Q?jKKojdyaT1/ocQ43YJifKjkH1eqyBfk6GJbryAn7VjrDqUH5qxWhkkzM85Zm?=
 =?us-ascii?Q?5KnvCMODz6EGVxmdUQJU7dGdHSwy537dMWLgtzGR2p0sDSlWFIbYXr+Amjsa?=
 =?us-ascii?Q?gNFlI3rthdS69vtl+j9H5AMLHU+DpCcpqOSG0/7i5tobVJEI+LYA219/D6U3?=
 =?us-ascii?Q?CQ1IRiCG5aFFHC0GgnEtKMDHPU9Ko/Sj/ZJTZ2l7kfJz1tIMvKfGQLq2cVcj?=
 =?us-ascii?Q?xVQ18SuLrTqj2iGtspOBDDdk9B2qkWwTESLKTOyTAqGKNW4yEXYkqNR2benH?=
 =?us-ascii?Q?jMCVh343HbFnlkN33BDqKQQXaHwwbYix2RMeTYOUTK5duQcuQIApTrW08fu8?=
 =?us-ascii?Q?iAK1lukKhuNqtyV7L19/cvn9AgNEbw8EYdh3AcuogdTftsMZ7ipxvr0s7jJ8?=
 =?us-ascii?Q?tksjsy4j4bh2UhtQN2D8wQsRbkCWldFwy+DvGsWwwpw072v0PE0dxu0W6Ng9?=
 =?us-ascii?Q?0+pBeBj/LfEFZOB9W+ih8Nat9ZmjPXyQ1mOAwqbTrRnYXcnrlAkuaqzGoMqW?=
 =?us-ascii?Q?66yCFLjTQrtfM+ctsxnNH9R/dA43XVGCJ5UYz/HEb20=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52812a04-366d-425c-ba69-08d89c704cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 18:29:00.9980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5+Dw9emLboM4NJw/Hs6jn2Dg7hI9JDXUXYDjxtgMoNqH7IGeal76BB50gGMdXDFGKdk5ohoZqlpLB7lBWJiEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Leon Romanovsky <leon@kernel.org>
> Sent: Tuesday, December 08, 2020 10:45 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v14 4/4] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Tue, Dec 08, 2020 at 02:39:15PM -0800, Jianxin Xiong wrote:
> > Implement the new driver method 'reg_user_mr_dmabuf'.  Utilize the
> > core functions to import dma-buf based memory region and update the mappings.
> >
> > Add code to handle dma-buf related page fault.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Acked-by: Christian Koenig <christian.koenig@amd.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/infiniband/hw/mlx5/main.c    |   2 +
> >  drivers/infiniband/hw/mlx5/mlx5_ib.h |  18 +++++
> >  drivers/infiniband/hw/mlx5/mr.c      | 128 +++++++++++++++++++++++++++++++++--
> >  drivers/infiniband/hw/mlx5/odp.c     |  86 +++++++++++++++++++++--
> >  4 files changed, 225 insertions(+), 9 deletions(-)
> 
> <...>
> 
> >
> > +
> > +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> > +				  &mlx5_ib_dmabuf_attach_ops);
> > +	if (IS_ERR(umem)) {
> > +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> > +		return ERR_PTR(PTR_ERR(umem));
> 
> return ERR_CAST(umem);
> 
> > +	}
> 
> <...>
> 
> > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> > +	if (!err) {
> > +		page_size = mlx5_umem_find_best_pgsz(&umem_dmabuf->umem, mkc,
> > +						     log_page_size, 0,
> > +						     umem_dmabuf->umem.iova);
> > +		if (unlikely(page_size < PAGE_SIZE)) {
> > +			ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > +			err = -EINVAL;
> > +		} else {
> > +			err = mlx5_ib_update_mr_pas(mr, xlt_flags);
> > +		}
> > +	}
> > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> 
> Let's write this section in kernel coding style, please
> 
> dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL); err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> if (err) {
>       dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
>       return err;
> }
> .....
> 

Thanks a lot. Will fix these.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
