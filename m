Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCB2A4D27
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 18:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9C76E8D2;
	Tue,  3 Nov 2020 17:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7B46E8D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:36:42 +0000 (UTC)
IronPort-SDR: GAVP9yPEVCpBYtozoHuWPtRTOy2av+8vrKnz08AEHfGQP+rPRCnX9Ui7asOPSPAW93sBHPMhvB
 WrqRjWSDXGRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156082609"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="156082609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 09:36:42 -0800
IronPort-SDR: EjuskdZZT0WTgW0y+4dJOijMxhtuIP7SR5/UPQH2/GRb/FksZMzQfReGgPdgcN6sSvq5uVB9Lv
 dV75Y1Vo/J3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="306114418"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2020 09:36:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 09:36:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Nov 2020 09:36:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 3 Nov 2020 09:36:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV6rSipNPtGIu2BY/UQsnpwzI9rXAFkvD9TA1WK5UPxLYLs5bgS9SXNuz5Z0WGOYkuWiBV5UBazJZ1YsyByrZYt+7SSKbe8Lj6lRNyf7cwS9bWnlyVuyHtLQZLrPSlTwDgLTvKHSeNt+5quSc73nkSFO6DiXzciwOo+LM3IKOFEF6JHEYHRA9KexLrsVMSl3kRruSp8QrUw2RvzkQeiPJE1mUvOvJp1XYqcxILIMdMBjsBP+1FX6EoI2q0DYkJVdqH91A0vU0V+V3Uq45kxiGjkvLsDrMj7KQi+x6AxEyPxhXDT2bWlhGWaDY3oWn7qVOzr2hlN+amB+riJOioDM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyKEzF+TDSQCQQkpNUY4uZWd6bCyNvDpTyFy8Q3WXvw=;
 b=gAgsTzWHo2rPVhW4PPe3p2M/1MbP3+d8Jwbt5l0XYHRKalGMIkNrKY++snOcizS34QnOWvS3gNaTtRUJyMlVpAf21K6mvEDJ0wc/DwSgfg33Fbkz+0zL4KK8vvBnrVOXU6PmWsKkqdDz2ibzKUdhkhhBGacK/7azjlhQBziFd1WWh24VJizpE/yNCpPwFvejFQrVYX0KPdpkR9/BIcSBPLTF2HPQ/B/jiP1Tsa9o8S/Bm1sdy4ffOkzfKgXsPmNVbe4MemxhO2j1RuzgroTry06gDGA91H3PpUH2wAoRyRLDxzrQkABtU5l37TPyBZ9KGA9cmapAxw+eTgleDzDvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyKEzF+TDSQCQQkpNUY4uZWd6bCyNvDpTyFy8Q3WXvw=;
 b=xC+Q6uZatAqyV783agHxqUJ4nW4V8JY0bR3suKLNad9jM7pOsVbiQVauaQzT8xFyrlh6D1Bux9saFP1674mGd22ulJOW7vhjL54RGK0jaQi9usiCgF53s289d4rhKTLK9tYayZzQFnRGgh0D4Dw4u0fY19QMBfGhNoHmecYeWLM=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2192.namprd11.prod.outlook.com (2603:10b6:301:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 17:36:36 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 17:36:36 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWqVlE332Lg1o1rU+Qqd8CQ3VTXKmlZiqAgAAZZoCAAHxZgIAQssdg
Date: Tue, 3 Nov 2020 17:36:36 +0000
Message-ID: <MW3PR11MB45553600E8A141CCDE52FABDE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca>
 <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
In-Reply-To: <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 31ef2661-b06e-428c-12ea-08d8801f03c1
x-ms-traffictypediagnostic: MWHPR1101MB2192:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21927F77C9550A02B1AC73BAE5110@MWHPR1101MB2192.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 25FixGrDEcsRXEnHX/7z8cArZBTzAyFGsUotJ5rrBqRZfwLyeAVi66y+/nWK4vFiebd2xq3Or108YklSMOOQCSeWXbo0Pkw6KiqKcRJqj4fkWqCsIZBVZqAej7sNUezUdcK41/+D1saYJwIMW1/J7aJ2mBcywCIrx25/e1xpSq3BhyTotkIEyAhi7SLSVIrd7B7InonXgYSUsRG7RYENC8iOAW+7R96KgsPqCvjNjepgbCCqvNsUrVsDs3duV3VI+ZIB2WyzCAqz8DHka/dq1FKGkTK6GAI6ZyWvhI8oaQ7mjpShl/zndufBfSchp/j0M1TVSmMhSaS97Je13PcfiwHJXKVi1AjOtuZIMdwu3Yn58tIsxVrrWkVDULf+LvE8+MLl9i1J96XW/sDrhSC8SnFgnR6e5J8rgchy4t0xl8tQSRxMGWw5tFrIHcTFQHF4WfEX0/q6PugKJX14RRx3kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(54906003)(71200400001)(53546011)(4326008)(5660300002)(110136005)(966005)(7696005)(478600001)(76116006)(52536014)(66946007)(66446008)(64756008)(66556008)(66476007)(6506007)(316002)(26005)(186003)(55016002)(9686003)(86362001)(83080400002)(2906002)(8676002)(8936002)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dNQ+HMGaX0PGCEHlCSFlMGwdIjL6nBOipmVNsXFi1a9atKHsoyp9jSCM7Yt5lu1gfpLGz4/LYt0huzueWCB/IjD1MK1M/gJrS6/C4OzvvEm3gPBADqnrxqGewVCmq6DcQus9FKfnehJPvkMsVADnD1/lqu988j4MUgx+cI3/dhhuls8ZNp2UqZH9ePKMQM/Y/TNYB5SkcLZxdAH8Tgi2tF1jGqEShsN6AabrPDTjcR/yuU3dh3uJETV9gHYYDfbMILxErDv0VTDvRDgF1oK9dVvFZ1NpTPPCVnJYuWUtOGIlD/C3JqcsQiWYl8bBTZ05PVVBbXPUoy2mbgxfDyvGQ0aSQBJa9O0VK2+GwY14hgZxzAId4TUkfiQ8KY9i3mA8rGUwmooyK6JZmvgNYL3ZFvvEgJr7scPsu5sY4KXYMaAjD4neC1UCzov1mO3XM8cR/5SWxSEmj9SVpVYJnyPwUHmRucg7ZUlJ6jMJMICIdG4Qib25bf4Npx1ImXCON6fbz1vGhNvJ4EUzm6JY4ZMN4uyh2E5kYg30wh4O6vVTL8nLi9/YJOL3DcmHDlpSnAqevayk4fNJ18mXMeCh1GOCm6hSOewL1UEjJC7p5kk9XPNOj21Zkczc8sL+PnFU/wY0YZ9NYHJkrQWuvGtkbCP7GQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ef2661-b06e-428c-12ea-08d8801f03c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 17:36:36.7166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4rc9nDCYVIlqoFUgSqe/whzvTG8Kh7cTdZ4ea/pz48pGMZoZXZvSyxKdoZsPwIgVnt5V1OGMpUNQR+MzYskGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2192
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Friday, October 23, 2020 6:45 PM
> To: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma <linux-rdma@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>; Leon
> Romanovsky <leon@kernel.org>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> <christian.koenig@amd.com>
> Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> > > > +
> > > > +#ifdef CONFIG_DMA_VIRT_OPS
> > > > +   if (device->dma_device->dma_ops == &dma_virt_ops)
> > > > +           return ERR_PTR(-EINVAL); #endif
> > >
> > > Maybe I'm confused, but should we have this check in dma_buf_attach,
> > > or at least in dma_buf_dynamic_attach? The p2pdma functions use that
> > > too, and I can't imagine how zerocopy should work (which is like the
> > > entire point of
> > > dma-buf) when we have dma_virt_ops.
> >
> > The problem is we have RDMA drivers that assume SGL's have a valid
> > struct page, and these hacky/wrong P2P sgls that DMABUF creates cannot
> > be passed into those drivers.
> >
> > But maybe this is just a 'drivers are using it wrong' if they call
> > this function and expect struct pages..
> >
> > The check in the p2p stuff was done to avoid this too, but it was on a
> > different flow.
> 
> Yeah definitely don't call dma_buf_map_attachment and expect a page back. In practice you'll get a page back fairly often, but I don't think
> we want to bake that in, maybe we eventually get to non-hacky dma_addr_t only sgl.
> 
> What I'm wondering is whether dma_buf_attach shouldn't reject such devices directly, instead of each importer having to do that.

Come back here to see if consensus can be reached on who should do the check. My
thinking is that it could be over restrictive for dma_buf_attach to always reject 
dma_virt_ops. According to dma-buf documentation the back storage would be
moved to system area upon mapping unless p2p is requested and can be supported
by the exporter. The sg_list for system memory would have struct page present. 

-Jianxin
  
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
