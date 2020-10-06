Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4F284F28
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 17:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F99C6E196;
	Tue,  6 Oct 2020 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228FB6E196
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 15:43:29 +0000 (UTC)
IronPort-SDR: 7qT/09Ie4OAq2FFEx6+T2JOVpiFILdPlIzcZxuHgHyeMnBIOQHckqNyJKLu2pMSu8ZuPuBQcUN
 vBBN3z+BV5lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="151467686"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="151467686"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 08:26:26 -0700
IronPort-SDR: ivS5TWHds81ypmOr2pQD1NN9DwafyvhkWwHRT/Uf06zkZnf3uB4qqYg+j4pqCEmTgqw30HVYhh
 kGUMZGxCjvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="460843879"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 06 Oct 2020 08:26:26 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 08:26:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 6 Oct 2020 08:26:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 6 Oct 2020 08:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8upzV2yxgiXbxgXGDTmgSYFiulL8T0AhJrAqshsnyynqHlerdgclT80QQfxBSSDDxNk/ZWKcls56cipgRe62Sjb1O2GrXOMjz2uGXOlsr2yx2I2nyfQixfwTR47QoCycMEJXuC9CnaWQHrZ+mxNWhJo2oZApWMtmxSh32n1Xuyq96yw36cdRp+1fImIVJABub0pxOIDz69yLG1fNvhwo3LghZ4LB2CMXMnpOfD68OoDWBm3Ci6+Wd0YbRpFI4C/rn+hMAJNcx1yKyCeEa4hi0obt/iN+OXYpP92kwKwFtbfqqok29F4w+jWDrp7XLZup1bDcWKFfAR/mHJs0PtkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHofyitEebw/lpThOJaVg4ioHTbaKTs0Yt92IB54Xno=;
 b=VPwgV/q6fZvgnGl6oRDTuHwsD1bQK1MQK1Ky67x9z4FY3hTX2whUSRPFgCNiWKpfHbX0pcGGr1mgTcKYt/SxXPxYHeK4qHCmOpy1q2adBKfkzEa9gUpcdDjwsYOq424O5GWKTxQHkfvQM6OFxUR260VoG5APuCme3rI/UuyHf3Pl3OOIIsC2Exqq2cRL86+wmWI/wKQUIw7CrvPnBtovR3+H6ujD08kWUQCIFuxrojcDLKzoNtniBifQmX+hsyOGP9YxRP0X4mLdMKvG61NrRGlYeOM4ZJQkf0hd8WhLTUq2HQWYjnw9FMPhaQG3v2LrUFoWdyeeqEuX+YTDDW6K7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHofyitEebw/lpThOJaVg4ioHTbaKTs0Yt92IB54Xno=;
 b=gkxMvzyC1n1txLy1m/fGyAzYaFjMoRfxGO6W+plZPGF/ermEvZk3aoXL1q0f5sfNcwhodUi45cIf0YSH95XGoQTHKv2h05F0FzYd8tv84d47P3B6XeWWe7OZv3nQx3djXmD1Z/msPIArp+6W3B6GdmVS9aEfHOHa1tOExBHUmHY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Tue, 6 Oct
 2020 15:26:21 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 15:26:21 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWmoByzOf02BrPAUWXdhZKsQyBsKmI/YAAgAAfg6CAATJWAIAAYzGg
Date: Tue, 6 Oct 2020 15:26:21 +0000
Message-ID: <MW3PR11MB4555C014C0A6006D9AD1B761E50D0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local>
In-Reply-To: <20201006092214.GX438822@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a4fe046-944c-40ac-a4b2-08d86a0c2e04
x-ms-traffictypediagnostic: CO1PR11MB4993:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB49933FDAB7FA1C489FEBD968E50D0@CO1PR11MB4993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFiGBo8PWY68DGNXP/V6QHkJ486nBrXMiP4fKGY8wh2tDKdLg5LLP1wntr/nodR0mZe5puSesqXFxqqnmqgCM6ajIwLmbsb6+sagNFX7S1vU6/ngS+9CeEFmpP8HTL02cqq0WdPNDfQcISWJvTMVwugF5EdKohkbZYPecVpDQxbxQiaaSa5ruyUrBTh/SZTcdunqoJXWnDGNt9/gW8JNeHQnH/qgQ2eqlZChbuFMJ3T3Z1BrhrzYXeXFfpi9F7v/zMJyChz21RwZE4IfmK/84cZgi8FtAN8kU6W9zXD0yEbuZGTmFYtTxQS+y0NVMp0wcBoDBAK4zH3ELN68WYxzIPaS3L1BlMih13uAUntek3Txc1gF4jBsg+h9QeygOZgWYWsjAJ+Mj9mrZPhJmE1Zeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(83380400001)(83080400001)(33656002)(55016002)(5660300002)(2906002)(4326008)(9686003)(8676002)(478600001)(8936002)(66946007)(316002)(71200400001)(26005)(6916009)(53546011)(6506007)(66556008)(66476007)(66446008)(64756008)(76116006)(52536014)(186003)(966005)(54906003)(86362001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +kBP2TiWwik2HwNRF4YYEImaGMZ8Zny5pPNvSc0nG0pA+Sfwnp7qQWwSOpX8T9nnv0fcuSIFDOyQD17eNF0JDywl8LTqhRR5vcJGp99Lje1m4seeonkxIXmNVoHdB68btdULYSsYadLJYwJpk+T98kOM6Vsb2JjX/oGtKrEOHJOhU7N3yKArbgbCiO2or/5PirJHzpuF/TSt1i5bHYRFMa8RPSJOMl4OpwgaT6tOj1d2YWc3FBbRVjwjIhb5NhBbtzQIz8S7CerZnuGHe+eDaQKylyVrtkJZFs/ltvTLn96nunwGol5SVtlVuDK27pilbw0mm2vu5eyfX2s4EEMJOJsg3D6TokqCGqSvhshY4DRDHGoVlV7rm/0wl3/VE+zM2FO0ghhW8I60VfWJM7I4Z0+2cnzMbKIzO3eGkOcbfWriRc9HswNku8ffaUO+xIZ1qNOylwviaYIJWDxgV+3lXB231PoiAqB7ZbDCUZMrjrUsW6i44qzSlJxHvgZxG5bmuLxG/QMfMN1M5zK+2IFSPS4dnw9sgtdf5YvUFSDtWSoxkzQc7FVoaBFX+jFuXQUlFUWRyDpQL9EuqHspCg/BD0FzUMLF3LUUZ+bar49e/oJ5PzbOiSxauMGLlvnhtmov1+szgwUDtx/9TGBR/hl9VQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4fe046-944c-40ac-a4b2-08d86a0c2e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 15:26:21.5450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+kxPJYp7h5QogXvHZ+cy66+TocF/ji4FCb9/F1zQZxsXipTc25cjk4c0DHxyza/BDM3sytKg9vL3qY8/DRJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, October 06, 2020 2:22 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Mon, Oct 05, 2020 at 04:18:11PM +0000, Xiong, Jianxin wrote:
> > > -----Original Message-----
> > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > Sent: Monday, October 05, 2020 6:13 AM
> > > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian
> > > Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > > <daniel.vetter@intel.com>
> > > Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf
> > > as user memory region
> > >
> > > On Sun, Oct 04, 2020 at 12:12:28PM -0700, Jianxin Xiong wrote:
> > > > Dma-buf is a standard cross-driver buffer sharing mechanism that
> > > > can be used to support peer-to-peer access from RDMA devices.
> > > >
> > > > Device memory exported via dma-buf is associated with a file descriptor.
> > > > This is passed to the user space as a property associated with the
> > > > buffer allocation. When the buffer is registered as a memory
> > > > region, the file descriptor is passed to the RDMA driver along
> > > > with other parameters.
> > > >
> > > > Implement the common code for importing dma-buf object and mapping
> > > > dma-buf pages.
> > > >
> > > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > > > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > > ---
> > > >  drivers/infiniband/core/Makefile      |   2 +-
> > > >  drivers/infiniband/core/umem.c        |   4 +
> > > >  drivers/infiniband/core/umem_dmabuf.c | 291
> > > > ++++++++++++++++++++++++++++++++++
> > > >  drivers/infiniband/core/umem_dmabuf.h |  14 ++
> > > >  drivers/infiniband/core/umem_odp.c    |  12 ++
> > > >  include/rdma/ib_umem.h                |  19 ++-
> > > >  6 files changed, 340 insertions(+), 2 deletions(-)  create mode
> > > > 100644 drivers/infiniband/core/umem_dmabuf.c
> > > >  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> > >
> > > I think this is using ODP too literally, dmabuf isn't going to need
> > > fine grained page faults, and I'm not sure this locking scheme is OK - ODP is horrifically complicated.
> > >
> >
> > > If this is the approach then I think we should make dmabuf its own
> > > stand alone API, reg_user_mr_dmabuf()
> >
> > That's the original approach in the first version. We can go back there.
> >
> > >
> > > The implementation in mlx5 will be much more understandable, it
> > > would just do dma_buf_dynamic_attach() and program the XLT exactly the same as a normal umem.
> > >
> > > The move_notify() simply zap's the XLT and triggers a work to reload
> > > it after the move. Locking is provided by the dma_resv_lock. Only a small disruption to the page fault handler is needed.
> > >
> >
> > We considered such scheme but didn't go that way due to the lack of
> > notification when the move is done and thus the work wouldn't know
> > when it can reload.
> >
> > Now I think it again, we could probably signal the reload in the page fault handler.
> 
> For reinstanting the pages you need:
> 
> - dma_resv_lock, this prevents anyone else from issuing new moves or
>   anything like that
> - dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
>   finish. gpus generally don't wait on the cpu, but block the dependent
>   dma operations from being scheduled until that fence fired. But for rdma
>   odp I think you need the cpu wait in your worker here.
> - get the new sg list, write it into your ptes
> - dma_resv_unlock to make sure you're not racing with a concurrent
>   move_notify
> 
> You can also grab multiple dma_resv_lock in atomically, but I think the odp rdma model doesn't require that (gpus need that).
> 
> Note that you're allowed to allocate memory with GFP_KERNEL while holding dma_resv_lock, so this shouldn't impose any issues. You are
> otoh not allowed to cause userspace faults (so no gup/pup or copy*user with faulting enabled). So all in all this shouldn't be any worse that
> calling pup for normal umem.
> 
> Unlike mmu notifier the caller holds dma_resv_lock already for you around the move_notify callback, so you shouldn't need any additional
> locking in there (aside from what you need to zap the ptes and flush hw tlbs).
> 
> Cheers, Daniel
> 

Hi Daniel, thanks for providing the details. I would have missed the dma_resv_get_excl + dma_fence_wait part otherwise. 

> >
> > > > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > > > +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> > > > +				     DMA_BIDIRECTIONAL);
> > > > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> > >
> > > This doesn't look right, this lock has to be held up until the HW is
> > > programmed
> >
> > The mapping remains valid until being invalidated again. There is a sequence number checking before programming the HW.
> >
> > >
> > > The use of atomic looks probably wrong as well.
> >
> > Do you mean umem_dmabuf->notifier_seq? Could you elaborate the concern?
> >
> > >
> > > > +	k = 0;
> > > > +	total_pages = ib_umem_odp_num_pages(umem_odp);
> > > > +	for_each_sg(umem->sg_head.sgl, sg, umem->sg_head.nents, j) {
> > > > +		addr = sg_dma_address(sg);
> > > > +		pages = sg_dma_len(sg) >> page_shift;
> > > > +		while (pages > 0 && k < total_pages) {
> > > > +			umem_odp->dma_list[k++] = addr | access_mask;
> > > > +			umem_odp->npages++;
> > > > +			addr += page_size;
> > > > +			pages--;
> > >
> > > This isn't fragmenting the sg into a page list properly, won't work
> > > for unaligned things
> >
> > I thought the addresses are aligned, but will add explicit alignment here.
> >
> > >
> > > And really we don't need the dma_list for this case, with a fixed
> > > whole mapping DMA SGL a normal umem sgl is OK and the normal umem XLT programming in mlx5 is fine.
> >
> > The dma_list is used by both "polulate_mtt()" and "mlx5_ib_invalidate_range", which are used for XLT programming and invalidating
> (zapping), respectively.
> >
> > >
> > > Jason
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
