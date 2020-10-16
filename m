Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27153290CDF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 22:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45F6EE90;
	Fri, 16 Oct 2020 20:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4F66EE90
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 20:49:58 +0000 (UTC)
IronPort-SDR: mlE+ngzPPKJmYHPLvBpSYPKf8tmYwBOHx2Jwy4QHU+/b3qtxU2TW483qqP+AK4xrj6i8nzuJTe
 PeEWqd2gwV/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="230875080"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="230875080"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 13:49:51 -0700
IronPort-SDR: H4U9zLPEcj390iH7St5ip/mOZiDF5d9dM+u5oCIdlgt5EuoM+488yUfc/TXAQ9KgglOcvr8YlW
 1nsNB2gw8c1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="522391527"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2020 13:49:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 13:49:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 16 Oct 2020 13:49:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 16 Oct 2020 13:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm26f2gmwBUBr0PD0UcJwy03lZuebrtY7N1j9hJOiFxyWhMp6/607H9AHy0Vw7qFaX4l+AWVUqKgsIK+c/fpZjRQHL2uOYLdoaKd89TRlVyoyEAT8ucIt5bZACelxiMqjkrR70zt/w2THXpePoaRWnWY/zZgpjB9wAqWx5ffoZZUjK6/EKwcNvKvBAu4RPOA5AK8P3+11aYSLSvAtvNx4eGKdAvzqnbLqSEiqGiMVpU4dxmSuXDEUCU/XhpHlgpP4hLmOJAL1gcZW7ZBvdJ/fJTP+NLAkU6j/8rAPpBRXSKCQsqk5G2FS7BAZfy+FmI9RDJzS9FDE9QrXcHu0vr/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3EYZsfyKg7MMnNexYJA1g5MqAHnh6XWUxMb8roAW80=;
 b=moKQJGjvhrH3h2CTrDE67nvG/YUvB+FsiXk3V5pXu2TXZooj5Y3C7GV4KVPLHz+jNnidrdHfjF38he/XWjsO9ngBtTjLb+RdKpGHesyrXi37vgyzktCcBw5C5aKG/oTvpEHJWMU3y22ULiaYr9Efz49VWdju1sxPwNu2+eITRsVcZzInW1mqYRbffWkB2AhJXum8BuPU542hrw6gWlkutTv1+nnU2cTGmKlSGBR4o3HCcXf76GaleT/Cg0SRnbf0SbiSonRCjIXh2jSMZKwFLNWjwDfrPfUbTageuYGR8RDzwmM0fxNRFV9Z9Vs6UB10TMzSLLAoY9KmK5KN+r02dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3EYZsfyKg7MMnNexYJA1g5MqAHnh6XWUxMb8roAW80=;
 b=jvs9HTXstZ0gQy9HMKZXde2mp/zbmUqUpEU6LaBQjo7uOOAIHkbzPbLY0N0+U9gdlzDd/yCuzx9GfzACR8Wal7mKHrihTEN51gI8EwKmBFKL6MC/j7ktEF7aUlqbk3/YmRV+bmQuXrBJeoOKAcWX5oACaOoy1XTe5ByKfTCIoNY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 20:49:45 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 20:49:45 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWozz6PA4Nzmnoo0+o3Tip+3Bz9amZZ0eAgABQccCAAN55gIAAGh5A
Date: Fri, 16 Oct 2020 20:49:45 +0000
Message-ID: <MW3PR11MB45558B3A5B8BFA96A8EF787FE5030@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799378-138316-1-git-send-email-jianxin.xiong@intel.com>
 <20201016005419.GA36674@ziepe.ca>
 <MW3PR11MB4555528000D39F35A47C5F8CE5030@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201016185829.GB37159@ziepe.ca>
In-Reply-To: <20201016185829.GB37159@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 8dae64d5-6235-4aa9-af4a-08d87215038e
x-ms-traffictypediagnostic: MWHPR11MB0046:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB0046B0773CD3474BE5B30E3BE5030@MWHPR11MB0046.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FQDvV7PDRiT4h3rpo3qs7H1bIjZbYcZLo4KS7ECjJkn+R33rVnokIT1CKjeF3JAsPrzKT16V71aVKHjMcKVIhCgGV3EGjcIusvvgh0cQ89cOPZUqrY3LbDAmUpTfrh+m0Um/dDbktigTJLNi0hJ4QsckSuqtgCgAwPCLZn36ZbeLyDZpb1keTuDzksWRt6j8M/flU49imfHY+YY8P0ybnBLW60HlFPRoJMDh5PqZEn1FDzmY1BI1fG8oUndscE6At2Qpb2+jqtJOtgTA1+dQl1y+HAw8g88fyXFIxKD1MYHiOqdGRJygZYtHXqDfw0gP+o8lxiLj9posd6gBpeLAsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(66556008)(7696005)(86362001)(4326008)(83380400001)(71200400001)(8936002)(186003)(107886003)(6916009)(2906002)(55016002)(6506007)(64756008)(9686003)(53546011)(66476007)(66946007)(66446008)(33656002)(26005)(8676002)(52536014)(76116006)(478600001)(316002)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kW6AuqK9kw3LsIyKgpPqcWVDPy5LYyCTsPLTQxXSfgX/pgR5BDrgV2eh17h9dWE15+ySR1/q/c8J7M+R3N+jcEkgpSeHXdWpziWCTcd/ly0pLPo7rwHbTr4ugCbqr9miuDCoTtGIdiJ2su3Gqme+7xPqod6vAgildAZ+yeYHh3QavQAA3rg4JPo7gIGh3gm1GRxbKJdc78sXCdYSQkgqYm5WnEUjFqdZbzHvRzqsVqhFHxAOIpyw2B0qQMa+YynlsO4UdgZdA3VCKJ7QS+esMOmwKIbzbScIZhvc3MRC31jshCt0/s45t28b+hV0GP8SV+Z1KFJDWepzZcCvBqsI2SZ+Gp6iEFek2zzncJzjVnKjUuaWpwr8BiAqs0a+V07mgAD7oolAhabigo9Xko2XeOoypxPRHiU2FaVTxTEJKk5CVUWOekrjhs0F6ZKZGnvjMpm/6mbwTTmdWTfnxK81iuQ5bPERH2uDA3xv+8hw7hNk2WbCsmV9FX7qwOiBqxOJINn1tLof21DOq5EFU4gVWMntmq+PDvPY5xVKuBNQA2jxK7x8LWJipa1aj5PUae1WhLi3lVWivwscRYwoK+9XK1KkTZu5a0GCifQOqc/EzXOfvakIeUfgcCtIwI/rQhCbT7l1b2gHzlUOzm7smOrKhA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dae64d5-6235-4aa9-af4a-08d87215038e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 20:49:45.1984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obmM9p+W5d5cYxhsrB72pBcODFwmS895pwIc/nhYUr+uZnXvtzVstLPqKE7grlvA8BmqqhMO07r+2LkvuLzyVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0046
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
> Sent: Friday, October 16, 2020 11:58 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Fri, Oct 16, 2020 at 06:40:01AM +0000, Xiong, Jianxin wrote:
> > > > +	if (!mr)
> > > > +		return -EINVAL;
> > > > +
> > > > +	return mlx5_ib_update_xlt(mr, 0, mr->npages, PAGE_SHIFT, flags);
> > > > +}
> > > > +
> > > > +static struct ib_umem_dmabuf_ops mlx5_ib_umem_dmabuf_ops = {
> > > > +	.init = mlx5_ib_umem_dmabuf_xlt_init,
> > > > +	.update = mlx5_ib_umem_dmabuf_xlt_update,
> > > > +	.invalidate = mlx5_ib_umem_dmabuf_xlt_invalidate,
> > > > +};
> > >
> > > I'm not really convinced these should be ops, this is usually a bad design pattern.
> > >
> > > Why do I need so much code to extract the sgl from the dma_buf? I
> > > would prefer the dma_buf layer simplify this, not by adding a wrapper around it in the IB core code...
> > >
> >
> > We just need a way to call a device specific function to update the
> > NIC's translation table.  I considered three ways: (1) ops registered
> > with ib_umem_get_dmabuf;
> > (2) a single function pointer registered with ib_umem_get_dmabuf; (3)
> > a method in 'struct ib_device'. Option (1) was chosen here with no
> > strong reason. We could consolidate the three functions of the ops into one, but then we will need to
> > define commands or flags for different update operations.
> 
> I'd rather the driver directly provide the dma_buf ops.. Inserting layers that do nothing be call other layers is usually a bad idea. I didn't look
> carefully yet at how that would be arranged.

I can work along that direction. One change I can see is that the umem_dmabuf structure
will need to be exposed to the device driver (currently it's private to the core).
 
> 
> > > > +	ncont = npages;
> > > > +	order = ilog2(roundup_pow_of_two(ncont));
> > >
> > > We still need to deal with contiguity here, this ncont/npages is just obfuscation.
> >
> > Since the pages can move, we can't take advantage of contiguity here.
> > This handling is similar to the ODP case. The variables 'ncont' and 'page_shift' here are not necessary.
> > They are kept just for the sake of signifying the semantics of the
> > following functions that use them.
> 
> Well, in this case we can manage it, and the performance boost is high enough we need to. The work on mlx5 to do it is a bit inovlved
> though.

Maybe as a future enhancement?

> 
> > > > +	err = ib_umem_dmabuf_init_mapping(umem, mr);
> > > > +	if (err) {
> > > > +		dereg_mr(dev, mr);
> > > > +		return ERR_PTR(err);
> > > > +	}
> > >
> > > Did you test the page fault path at all? Looks like some xarray code
> > > is missing here, and this is also missing the related complex teardown logic.
> > >
> > > Does this mean you didn't test the pagefault_dmabuf_mr() at all?
> >
> > Thanks for the hint. I was unable to get the test runs reaching the
> > pagefault_dmabuf_mr() function. Now I have found the reason. Along the
> > path of all the page fault handlers, the array "odp_mkeys" is checked
> > against the mr key. Since the dmabuf mr keys are not in the list the
> > handler is never called.
> >
> > On the other hand, it seems that pagefault_dmabuf_mr() is not needed at all.
> > The pagefault is gracefully handled by retrying until the work thread
> > finished programming the NIC.
> 
> This is a bug of some kind, pagefaults that can't find a mkey in the xarray should cause completion with error.
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
