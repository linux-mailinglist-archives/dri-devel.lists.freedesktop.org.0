Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6220FD70
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 22:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C18F6E196;
	Tue, 30 Jun 2020 20:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0386E196
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:08:54 +0000 (UTC)
IronPort-SDR: XepKEbXnb7laU/G1SWKFvf21UA+6e+7vWh9+Ml8pCl2Oyi59JrOQkkgJYDzpGaoxuIwNmscsMQ
 o3JoIj7Uo06Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="207888073"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="207888073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 13:08:53 -0700
IronPort-SDR: Z09R2WEjP+pQ+umDTqvA1TFHI6skQzEOQvdgmfQcBpwOksHlrsGgTiMXoM5IxWCtPW0HtxsvXJ
 ZjylQO6gJ2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="355880623"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga001.jf.intel.com with ESMTP; 30 Jun 2020 13:08:53 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 13:08:53 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 30 Jun 2020 13:08:52 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Jun 2020 13:08:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 13:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibeFoc3eERfXirbi+R8XN4WnO2C0nAKlHqYqEga9UOBM/9BqtERcxhctG8y9CCHk0lF7w0ramiPvhKdzkmw52xi94OZfkE8CVkb7I9tvDTsL9kez0ZCrx/+hg+qDPVKkaVKGuRuLt/9TTlmNpTjuQQ/CKH1S8ig9u3pYEb1X0r5TVN3Bbmr8+wqxpFmNZK/OE0XiEBrFvxdSfFOW444NvQJJn1iLxS0YaIREe+N6+MsJFTmxTGL9jqvOTeiuuMZtZYHpapHQS0DYIqigF+brXyIISsGs4sj1zYCoRqsYX6XEK0pwp70/b1kPsrPH2snJGwe5in8K7GRAdVI9EQiWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KG/74OqfhKkJgqJDTxALbGpa9FztQThvmjNIx6EsCU=;
 b=YkWa+q0L31k+509nl5q/TJe1nQnpExRzma2/WQEACE3uz2Y5+WN5uOiUAm3CJMN2keUUgTzx91VDeNZD0eMV7Ax3ApKiMpYWWfITf+JfQgc1Ox63q9nqHLObIqhVhWlqlTDAfiLyM/qWXCYkTxfL354omefNjAsxEepALVoqj+SswqV6/KWN3LOpwDnAgJvYAOcj3hlIe9/IfuMELY2HSV7DZiSRzfsNC8LBkIsdx08v06ePCXeeNwx17hjLf8ERaVlcvn6Gdu1TkXnWVmariCeleTndRDqKU8sP61dULtSugVc5lP9qjtvNNxDxbuHXBP0jy4qxRndM6MEDEzuvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KG/74OqfhKkJgqJDTxALbGpa9FztQThvmjNIx6EsCU=;
 b=dlwhrsfQlSjS9JxRjjqMEaV3Geh8yERNRBPxF1HqDo9GABJKFnTWU0G20xFwiB9iI2ArQ5jTS0DuWy/dZ+ZnIqOYLEPBSOkkUaKoapRCakDTxGS0l+8GleIuZKeJ+irU36vQopsW9RUfy1kKXREEZKsL0O9PFRwQ6GAgtEI+a1c=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1310.namprd11.prod.outlook.com (2603:10b6:300:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 30 Jun
 2020 20:08:46 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf%8]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 20:08:46 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Topic: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Index: AQHWTjmKZPnzyjUH+EiOzVuDukOX/Kjv8EEAgAFgqNCAABwVgIAACtwwgAARwQCAAAePEA==
Date: Tue, 30 Jun 2020 20:08:46 +0000
Message-ID: <MW3PR11MB4555223B6D3C6E4829795798E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630191700.GL25301@ziepe.ca>
In-Reply-To: <20200630191700.GL25301@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4329e27c-c962-4718-a827-08d81d316579
x-ms-traffictypediagnostic: MWHPR11MB1310:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB13103632EFAC27A8C04D70B6E56F0@MWHPR11MB1310.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 58K1WtKMYAmo6EuIv/fhkJaWJA8owqPebHOeaDtZ+SgMkjLb6/UvPE4qAe/rIQWVuIzEdgWF8qH6AdtOsVsjewGwbNG3SqByOikFqqIuVFU4QIna1sWXBrY/e/c6DFJeTsxW76T/4gWqHp9jvUi7vis8YbSNBHZxiSHAY27NEmeJ6ROTCSxgKe/9DEZ3ByiynaYSTPWOqx6ALhDbqbeQgnE7brB7HO0x1E3hXV/HXn1BhOs7LtNKt4DjRXAy4yNDyrSKiYuqpxblnqZAyDw77sPkOsJLZGiK2Wb2ztIVtdDQ2gO3Vr2ZZMvzZNRGgnoCCmN7vlXDkQDKf0eq4WEmug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(55016002)(7696005)(9686003)(53546011)(6506007)(478600001)(71200400001)(86362001)(316002)(54906003)(83380400001)(4326008)(186003)(52536014)(8676002)(5660300002)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(33656002)(2906002)(26005)(8936002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bdTj1G6lFjN2tICCqgdZ9sK4WcTYtqugcom3VxNyY5SdH0hk2BCPfRirDb/GVubTvwEmWHPb++1AojGN3whKHO5AXNoNGQd0Y3e/MAEBLo1moj8z/M8IJDbA+siuEg7M2wurqTdEzSBK93F1NT0MZoZ88CkDGfAvLA5U1ENoQEFRMR0M12Fp8kX6XHMBiqVhoXe2O1FSXmNyf7c6CedkTrZQzr5z6hE9zuDkEsra/ElkETzHSa9x4zF6ih9ML7biEr/5l5L4QlaVLCBE6ae6R5ogFzGXBhXC+9cBtVf7FT8q5pO6swkJ/QuDRbC9p1jLQuVqgox79jB0YEUTRLKWJwpjQqlI7ig4p4hVtJrnLCazYvWZCEOVBoAQnwLHzoJqIDseZaIoHohkhEbmsHPk+Bdqmp6rdZJwjUh7+BoXLq0QCYhuGkTWuS04e9hWVr9aSwNML+oll+U4V3Iw6ZLEtEhfi1oxyUNcLGiZtpVzx7n7/hOEh7CAdSnWp5bErvsr
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4329e27c-c962-4718-a827-08d81d316579
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 20:08:46.4924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyv/Isdl4WXin+pjwEXwBTXkPbFnwkYCcQu8Tv+2PHVGJr3XZkjA31hAyKurv2LUT2ttJyEo0viHSolcWBQPPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1310
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
 Christian Koenig <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, June 30, 2020 12:17 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
> <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>; dri-
> devel@lists.freedesktop.org
> Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> 
> > >
> > > On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
> > > > > > Heterogeneous Memory Management (HMM) utilizes
> > > > > > mmu_interval_notifier and ZONE_DEVICE to support shared
> > > > > > virtual address space and page migration between system memory
> > > > > > and device memory. HMM doesn't support pinning device memory
> > > > > > because pages located on device must be able to migrate to
> > > > > > system memory when accessed by CPU. Peer-to-peer access is
> > > > > > possible if the peer can handle page fault. For RDMA, that means the NIC must support on-demand paging.
> > > > >
> > > > > peer-peer access is currently not possible with hmm_range_fault().
> > > >
> > > > Currently hmm_range_fault() always sets the cpu access flag and
> > > > device private pages are migrated to the system RAM in the fault handler.
> > > > However, it's possible to have a modified code flow to keep the
> > > > device private page info for use with peer to peer access.
> > >
> > > Sort of, but only within the same device, RDMA or anything else generic can't reach inside a DEVICE_PRIVATE and extract anything
> useful.
> >
> > But pfn is supposed to be all that is needed.
> 
> Needed for what? The PFN of the DEVICE_PRIVATE pages is useless for anything.

Hmm. I thought the pfn corresponds to the address in the BAR range. I could be
wrong here. 

> 
> > > Well, what do you want to happen here? The RDMA parts are
> > > reasonable, but I don't want to add new functionality without a
> > > purpose - the other parts need to be settled out first.
> >
> > At the RDMA side, we mainly want to check if the changes are
> > acceptable. For example, the part about adding 'fd' to the device ops
> > and the ioctl interface. All the previous comments are very helpful
> > for us to refine the patch so that we can be ready when GPU side
> > support becomes available.
> 
> Well, I'm not totally happy with the way the umem and the fd is handled so roughly and incompletely..

Yes, this feedback is very helpful. Will work on improving the code.

> 
> > > Hum. This is not actually so hard to do. The whole dma buf proposal
> > > would make a lot more sense if the 'dma buf MR' had to be the
> > > dynamic kind and the driver had to provide the faulting. It would
> > > not be so hard to change mlx5 to be able to work like this, perhaps.
> > > (the locking might be a bit tricky though)
> >
> > The main issue is that not all NICs support ODP.
> 
> Sure, but there is lots of infrastructure work here to be done on dma buf, having a correct consumer in the form of ODP might be helpful to
> advance it.

Good point. Thanks.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
