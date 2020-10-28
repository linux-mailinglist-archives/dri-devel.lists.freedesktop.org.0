Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818329D153
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 18:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49726E25B;
	Wed, 28 Oct 2020 17:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE9C6E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 17:29:45 +0000 (UTC)
IronPort-SDR: 8RHs7dutOYZcJFom2flC57I5LVV+ar7aH2dYU7fClgj1BnSqKjNKZ0KXMqKc5fyZek59xcoiKa
 YaaZwbskz96w==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147585266"
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="147585266"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 10:29:44 -0700
IronPort-SDR: j5q9IatIeKztG9YyzB3dNHRMdzHcv0wPsqth57OqsI+hvc1iG0ELGh26UD3SYzzBh4wIRHRiN7
 el47s9JBoPwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="536317369"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 28 Oct 2020 10:29:44 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 10:29:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 10:29:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 10:29:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 10:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfnelnuoowrD5+fzPQ8ce0ciBhoK+lACla1qebFXOPMqwQ6zZZm4D1j3gZa5Y6bZhR31UQtwROzL2scD+DE4gVx/qvsiwU8Sw4selSSJR5BUhIqaR45eMvIQtDpsmvDDQxX3VjZdqfRsmkrJt9RVu/KqYVN+x6qUJUaxWB2J8rSo7BjZUnm64VGpPDk5ugyipeljnZ+ruEetGc6LmaIoxwblxQ+SjfoAiyu7UUhD4WXlLYnfms5/uDO49LEGcJu9KLD+yvN45/OVcBFEKH/iwIczrVwnCduKWDKRmW+PsGP3rAAasmgW/h+iainW/g0PCJWHIdtODHdzbKAOTTpBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm7Rgepx3eWMDZplMQs9ZBb5mcqJTMM8ZuTcCucv9kk=;
 b=UzziR+8YRN8D75bF++B9xolO6sc1EnqdMQl7ZbhDeBbp0397I9emRpfZJvHaSmhamYk66HwVxIstbriKAfWalEM12Xlva54xqxldUDVfOZptdktWZYMgHu2Vg/yTxRDYGQ8hVsVTDgWyf+0VPjbNLANx7PPJY6kPrbmRV4J8pP9S9usGRt33MaIMYfv1Ym71mlc4UpG6sVZpkc4GY68lxOnIiIOOLtPkjsdBn85NgV7x7eSxgl4FjC8NYhSj18O9/7hs8h2fNhwkZE56Yv/5n4g5xAAVfvj/Bu2BgJoay3Gb1H7o/vXKwaOLQ8pYY35DTxJEnKixhv7WMMb3X6Zvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm7Rgepx3eWMDZplMQs9ZBb5mcqJTMM8ZuTcCucv9kk=;
 b=ryZQK9TOnNB0arKgSSnvai2bohoavdQ0WzdYJjVQUKAfttmKve2GlqquaKd97Y/2lC3OBzKbb2JulezcXX5pEf72EmYZD7MEiNERjNecEXPDq/3aBR0kSulEy529zpDgTD1qoTgEQmdf0VoM/C8yr1QgLHcZHIC+UixCHAVr6kA=
Received: from DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13)
 by DM6PR11MB3385.namprd11.prod.outlook.com (2603:10b6:5:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.24; Wed, 28 Oct 2020 17:29:07 +0000
Received: from DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::cdc4:d8fd:445e:bc26]) by DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::cdc4:d8fd:445e:bc26%7]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 17:29:07 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWqVlO00pepJSOH0mSukfnEwOLTqmr5x0AgAABPICAAVW5AIAADIYw
Date: Wed, 28 Oct 2020 17:29:06 +0000
Message-ID: <DM6PR11MB4548C30C3A399B4DBE479BA0E5170@DM6PR11MB4548.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-5-git-send-email-jianxin.xiong@intel.com>
 <20201027200816.GX36674@ziepe.ca>
 <MW3PR11MB45559D700788EFFE08E9B639E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201028163546.GY36674@ziepe.ca>
In-Reply-To: <20201028163546.GY36674@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: eba3d813-50f2-4f66-3aa9-08d87b66f931
x-ms-traffictypediagnostic: DM6PR11MB3385:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB33851B7477E2FFF8BABB5F61E5170@DM6PR11MB3385.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wCcip8jLJck6yzHw9+Il85mPWPFBmv0A/YRD842BBpyjCvpJtEys0w1YZkeCFXcAiAshEZyS+PmzzaYgkdIeLw51xP2f5wfvInKssMGFB0Fdpxx7Sw8gRidiucBeo2b8+gZnqvL3pQugTDIiXogwMoJzIKWc4eQPFvk6ruTIIIYGGtbtAkamF4DXiwS2LgzWThiCdb5AcKfNPhCjfBjC2YM+92tDxxr1jTS37wonaTnSSNj/RFVO3Dw1zqSWtCRMAx6e67Te5aklTx9cRjZDLIuHDrYBjqH71W7xXOTglaZFmjGTnD+M8Q/nLHiwNfZtyEcl34a5vcBGqFWI5a2yIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4548.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(186003)(7696005)(6916009)(6506007)(55016002)(4326008)(83380400001)(66556008)(64756008)(71200400001)(26005)(53546011)(8676002)(86362001)(54906003)(2906002)(33656002)(8936002)(52536014)(316002)(66446008)(478600001)(76116006)(107886003)(9686003)(66946007)(66476007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WPl/PNEuWwvsXN6aMjSmUk1wlZ8BCjoBqIWjkwn96WqFl3ZvH5JBTHwfFRKtE+wVC6YeLGo0VErXTtGmGzDgifRM4DT+ZP2elPO+X5bv2rEmpFkdzi78ozHFoC6I426zBXt/AEnhXJuudUoa3AanWadmgUcBSlOzh3Lu0EHfMO7a1KRjbpZWCJDSPJzBpS+NK9SaMMcfDUDkIozNPBEWS1hvINgBBt0zdPkKZgfYaUF6op8JgUmchM/i/mC9rDg7WCF3m48dG2bekaunnmpuc6AtVzn8Yldii9fr3fui6W1vMn8miNM2vguoJZX+EatRCVdAaeVGmh/ZA2yvHm4rJPTonZ0U5jUz9J1Im53Uy3JbWmhb24CueGAnwjkPcl+Iq8ykHTxPK5gOEF8LajH1s4kTg65DjCM5Rm8R8zrLyP4nvlEb3hp2N9D38X9RhLf8mMTDZadZh0QzL34BWDc/b8okESMVzhoCIu7P5SyRcWB3vuB9IgMo0ONTqubYk6k3b34GQUiX76mpNw/kY1YTfxrKuRXbSTYz3YqhCfGtwHRrEVQ4vwFAO//2vVNN4pACZiNL5h40alqeu+kNUWnVIiJQeOGtWsSoue8he34tiNm3QJCy1e2Qe2W3eO0gUWvYPc/78fkz6geAFbqo6K5/vg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba3d813-50f2-4f66-3aa9-08d87b66f931
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 17:29:06.9374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOwXcoNVguCNbkoJPMiy+Nd517fUajvzJMk3YsR2jxSmsKv6y1A1x+uUNWfP2Jv25pBeyVDP+lNh3vFO/k1r8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3385
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
> Sent: Wednesday, October 28, 2020 9:36 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v6 4/4] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Tue, Oct 27, 2020 at 08:33:52PM +0000, Xiong, Jianxin wrote:
> > > > @@ -801,6 +816,52 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
> > > >   * Returns:
> > > >   *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
> > > >   *           not accessible, or the MR is no longer valid.
> > > > + *  -EAGAIN: The operation should be retried
> > > > + *
> > > > + *  >0: Number of pages mapped
> > > > + */
> > > > +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, struct ib_umem *umem,
> > > > +			       u64 io_virt, size_t bcnt, u32 *bytes_mapped,
> > > > +			       u32 flags)
> > > > +{
> > > > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(umem);
> > > > +	u64 user_va;
> > > > +	u64 end;
> > > > +	int npages;
> > > > +	int err;
> > > > +
> > > > +	if (unlikely(io_virt < mr->mmkey.iova))
> > > > +		return -EFAULT;
> > > > +	if (check_add_overflow(io_virt - mr->mmkey.iova,
> > > > +			       (u64)umem->address, &user_va))
> > > > +		return -EFAULT;
> > > > +	/* Overflow has alreddy been checked at the umem creation time */
> > > > +	end = umem->address + umem->length;
> > > > +	if (unlikely(user_va >= end || end  - user_va < bcnt))
> > > > +		return -EFAULT;
> > >
> > > Why duplicate this sequence? Caller does it
> >
> > The sequence in the caller is for umem_odp only.
> 
> Nothing about umem_odp in this code though??

The code in the caller uses ib_umem_end(odp) instead of the 'end' here, but we
can consolidate that with some minor changes.
  
> 
> > > >  	/* prefetch with write-access must be supported by the MR */
> > > >  	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> > > > -	    !odp->umem.writable)
> > > > +	    !mr->umem->writable)
> > >
> > > ??
> 
> > There is no need to use umem_odp here, mr->umem is the same as &odp->umem.
> > This change makes the code works for both umem_odp and umem_dmabuf.
> 
> Ok
> 
> Can you please also think about how to test this? I very much prefer to see new pyverbs tests for new APIs.
> 
> Distros are running the rdma-core test suite, if you want this to work widely we need a public test for it.
> 

Will look into that.

> Thanks,
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
