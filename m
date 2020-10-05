Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96D283C54
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 18:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D30E89B0C;
	Mon,  5 Oct 2020 16:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C893C89C8D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 16:20:34 +0000 (UTC)
IronPort-SDR: LJIjmMzGlgxrOeNBqSqlqz+Hd+cKA5prr5f1BDL0oFq2gfxfktoouMSK6dOBsOSnA4Xs+/Lxsj
 I1Cp62pAqqKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="160763854"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="160763854"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2020 09:20:01 -0700
IronPort-SDR: miZ4LWEPL9PMw3ER/vefQiuU80KuMOqcr5Exp8WdLC7WjHM4p/YzEPIcwvsiQBW84grqzk1pAS
 clQg+MJjuHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="310056323"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 05 Oct 2020 09:19:58 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 09:18:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Oct 2020 09:18:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 5 Oct 2020 09:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6U/m2BUS9IgeHgtgJk72IyH6ke4/5a0AEgGUOn04o+HQcR2X6F6tnEGFJ6/jlnvf2J7P+mvSUq5NnFyvwq6nrHxGfOA07oD6rtm0GewIOyq+bCohUjMph01sLAxNvy3CMjrhAuk3WigMJdrYCnK1YRimznlNZRiUgW1BzH4rB66P5sOuv2Dr6WcL5sspJh1ZTr9cnBHrBBViOBYcRHHajmtN1EQ0E+mRRnj2Yw/84kdz/e6dknP1myaQMDChXpwOQQZrD6SyXgNw4EFq0USFmOfcc8aErOlqbLtWsyYc7x2wP8Vzm9spwfPsOEsVddk3MVQG35nuenCbsmhv6zUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DALDot6kD09Uv0vOPg6qw6Vj2ApJmpAPQl79DRq65M4=;
 b=WMDBGuia2+3uHLwaQ6Md+U7duvylAZGgAp1001oX5KXe1+LKC9GIbk7FAjrOVP/SdzdahOAC6qOTNKgEYmgNoxTzGCyfPG5lg/IAVxw7GRSTmts+RO2t4oms/KOk6ishD4mBSig8na2kgwxkAqLTpvR6pO80QxypAoSB+lk9V4U02w1+PXQczY0NRIEATXqqK3L7fNA5T/zqKCVGgrABLJ6iIwM5oXxHfwFdN33PaVPqscHnmO/ConXFLpcGpsrJXyYOlhIx8XZOgEz+oOCe4uP5Zaq/wcNnSdQ7KpSQ4SEVPhWkFRTrlC58wxhc+7DbX9O05d5oheJfUUjFR2SPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DALDot6kD09Uv0vOPg6qw6Vj2ApJmpAPQl79DRq65M4=;
 b=EUGP9gp4Flclxc1kg9uMYFRY8JhKoqujNZKjTVytJBTnSl9BhbJy+tTgxfu2vFIEgcuN4VvAWRLUjY9JAarCs6+888s2PQnpw4/ZXVx1J/A0xawP93J8w+Qb6iXHbpVQvfX/DpbvRtOL+O2R8Xi8dSS+qOgQ0VTFCtv/B2urCEk=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 16:18:11 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%6]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 16:18:11 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWmoByzOf02BrPAUWXdhZKsQyBsKmI/YAAgAAfg6A=
Date: Mon, 5 Oct 2020 16:18:11 +0000
Message-ID: <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
In-Reply-To: <20201005131302.GQ9916@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: dbc2b402-077c-4de8-417c-08d8694a40ff
x-ms-traffictypediagnostic: CO1PR11MB5058:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB505829C30909A24A8A3117CFE50C0@CO1PR11MB5058.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MKmmoXhRBuhF1poWrlkZLn+eu+9b4JIr4v8PkDNCNJeB2vznZozs1hAgB3q5bfqH+/ERZgFGMNXAjI9dkpgeMX4SbruWX/M5n4z7QqTIZy3TH8H7yhbtjlGdT0BOWNC656WLYAsbet22Du196xF7xb1KHBwyKZ37zI0Jav2sO8wgo7BNyI0Hm/dW0Q2474jZm0FWqr0u8LU5zwy226Smpdqy3jTtzhzMYbefQ/s8puna5f3H7JGd/ZqdR+0k+Ru9gBCr7DRquIlBixHHdmxIG7fAkEBT6GRVXvR6UxniPKimpl6WjtA+Y6wxOJfVS16KAX3O3fu8IgMRcF5wV95sRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(71200400001)(107886003)(76116006)(55016002)(4326008)(54906003)(8936002)(9686003)(316002)(478600001)(86362001)(83380400001)(8676002)(33656002)(2906002)(64756008)(26005)(66446008)(66556008)(53546011)(6506007)(66476007)(7696005)(52536014)(6916009)(186003)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IS4IkxF64Rqwlo1Ad/ln/7lOVC/V43HhCoECH0Jx3aHtcK3PYPHCAzUGNtFlEWCtAk1KAqsS5nN/8ou7x1tLJ1hsECs3QV4eqJbkgOUdPTe0BiGUCWWzRx9vG6LRiS5ZkMG4L/L/Ka8j2lmoNeIXbKhdavLmOKv+ngL7jWldzGULOJNUjOJbUh/LU72lrlzKtRZpQuPf/lkQ1LYh6+XbfbomEh9PFlaD/NIBK3kn+Iw3QYXUb82PogB2VmeFqlDzuyVy0m6BhxvTH9qfzUP7lLIBy+MiKLOXw/mrTBw/aw1q9zMqRzYC9VpOLyk5X5/xiIWJ0wzbQ1gHuPHniwbuEB6BGPEnm1MYc0Khp/uW/EJZabTs6OL7XavIYstMdHIafKYAJZGBrZqR8Wb9Vn5leL75rezcLOkhufitaPReA/YOSHCEVa2a+Jh2fBICF9H8wI+eAicq3le1i2V82F5HDesOJJcSJ7Pes0AaIXiho2uPkTTV8ILyNGnEI59YF2w9e7xrWgt/6Ioqyl0usREStYmpo2vzs2clv75Fj8H8zOP7bUykT+fSapGZPMhxqu1mRXzTFYbjl0ePnO0QuM/GIJUMrhdURrnZddpn6c2HA8dNMNJrryhaW9e/6nprWEe4HSQ3+iQcytWZXL1p9OfKbw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc2b402-077c-4de8-417c-08d8694a40ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 16:18:11.0826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzSm0fSFhLTJ1+vnigtnUGLAyiCqTKzQmMOPGNKETC8cc4IDI+tbAiedusc/QxkEtrAHZ34NtQh2DP7KvUP/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
> Sent: Monday, October 05, 2020 6:13 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Sun, Oct 04, 2020 at 12:12:28PM -0700, Jianxin Xiong wrote:
> > Dma-buf is a standard cross-driver buffer sharing mechanism that can
> > be used to support peer-to-peer access from RDMA devices.
> >
> > Device memory exported via dma-buf is associated with a file descriptor.
> > This is passed to the user space as a property associated with the
> > buffer allocation. When the buffer is registered as a memory region,
> > the file descriptor is passed to the RDMA driver along with other
> > parameters.
> >
> > Implement the common code for importing dma-buf object and mapping
> > dma-buf pages.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> >  drivers/infiniband/core/Makefile      |   2 +-
> >  drivers/infiniband/core/umem.c        |   4 +
> >  drivers/infiniband/core/umem_dmabuf.c | 291
> > ++++++++++++++++++++++++++++++++++
> >  drivers/infiniband/core/umem_dmabuf.h |  14 ++
> >  drivers/infiniband/core/umem_odp.c    |  12 ++
> >  include/rdma/ib_umem.h                |  19 ++-
> >  6 files changed, 340 insertions(+), 2 deletions(-)  create mode
> > 100644 drivers/infiniband/core/umem_dmabuf.c
> >  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> 
> I think this is using ODP too literally, dmabuf isn't going to need fine grained page faults, and I'm not sure this locking scheme is OK - ODP is
> horrifically complicated.
> 

> If this is the approach then I think we should make dmabuf its own stand alone API, reg_user_mr_dmabuf()

That's the original approach in the first version. We can go back there.

> 
> The implementation in mlx5 will be much more understandable, it would just do dma_buf_dynamic_attach() and program the XLT exactly
> the same as a normal umem.
> 
> The move_notify() simply zap's the XLT and triggers a work to reload it after the move. Locking is provided by the dma_resv_lock. Only a
> small disruption to the page fault handler is needed.
> 

We considered such scheme but didn't go that way due to the lack of notification when the move is done and thus the work wouldn't know when it can reload.

Now I think it again, we could probably signal the reload in the page fault handler. 

> > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> > +				     DMA_BIDIRECTIONAL);
> > +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> 
> This doesn't look right, this lock has to be held up until the HW is programmed

The mapping remains valid until being invalidated again. There is a sequence number checking before programming the HW. 

> 
> The use of atomic looks probably wrong as well.

Do you mean umem_dmabuf->notifier_seq? Could you elaborate the concern?

> 
> > +	k = 0;
> > +	total_pages = ib_umem_odp_num_pages(umem_odp);
> > +	for_each_sg(umem->sg_head.sgl, sg, umem->sg_head.nents, j) {
> > +		addr = sg_dma_address(sg);
> > +		pages = sg_dma_len(sg) >> page_shift;
> > +		while (pages > 0 && k < total_pages) {
> > +			umem_odp->dma_list[k++] = addr | access_mask;
> > +			umem_odp->npages++;
> > +			addr += page_size;
> > +			pages--;
> 
> This isn't fragmenting the sg into a page list properly, won't work for unaligned things

I thought the addresses are aligned, but will add explicit alignment here.

> 
> And really we don't need the dma_list for this case, with a fixed whole mapping DMA SGL a normal umem sgl is OK and the normal umem
> XLT programming in mlx5 is fine.

The dma_list is used by both "polulate_mtt()" and "mlx5_ib_invalidate_range", which are used for XLT programming and invalidating (zapping), respectively.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
