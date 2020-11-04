Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2B2A5ADB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 01:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5B96E90C;
	Wed,  4 Nov 2020 00:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C796E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 00:01:52 +0000 (UTC)
IronPort-SDR: Ri1noiN2VdqkczId0hEhnGe8elpPqUy6yzBiUQuvam2G1iMI6yAC6a9pPuI+b5fO6Em+KZoYuD
 3jVDbRLzlwkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="166553785"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="166553785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 16:01:51 -0800
IronPort-SDR: rVZVPYMFsqG7iyFlqP3YmCd4hx7ianssPm5lxfnjsIBCDMrQtQoq17Ll/xVv4QVKDZUtzWYmln
 5YboF6dbQQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="470996944"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 03 Nov 2020 16:01:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 16:01:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 16:01:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Nov 2020 16:01:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 3 Nov 2020 16:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEwy55TlFPyIKwA/D9p3m5yU6ndKUrJ1OaC5wLfyeAkGRx0wSs31JjD8tKhYHjliavsnGsUXrMPl1ITW2dfNQBhvK4/6PcgNKF8j+YO8rZtAGemV0eJ5T7gouQelJmefvdJu55fKlaUvvmXtCaKhTn3twWscE51RSMuK/pdoNmeqLPIzQLk3Lw2OlQpSVgf83WVB+525aEFYJ+b/bfnhicdMmXJxNdgYOi0NH+VNG42x0zRPovZt9t7JwWluYrEkMe0cbUOZQWBsnrVIN+35Z2UncvEtcoxGOFDqJ+w9oSMWEnEg6yzIhnDiXA71m+g/7SI52sTX+27YnY0gDsweoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ1/yX3VXEIolS5SOqz0PlS9PcWRqU5IkPYYsAMbP9Q=;
 b=SrnmaRS3ds22orUUrNdm8yvcOKCCkOKMBr/i79OUJVEsM9pW2dXW0bxbi0sEQzsBsFk8xWOy5J81TFWed/VBSlJFobcgitIDcOK4hul99qcpiZ6ni3Yheg//m8LFxULswIaGn/BYFEuE/quXbEff4rnn7LtbVgHHHLl+M29dwea3+Ke+yjScUMBgBk5pMTmiqFTgZKGN13Zw33Uq7NEvisKdEqYdsliay+kqpe1h1AZBz9/9XuYaCt6kBpOczV941elwnB1uWWTHXTt+Amwrb6O4EEMkTMbaeUPXIKT6TKkJQLIwKKXXM4uSXMy0Qjxxb/pYkyt5/LH20qm6bWmPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ1/yX3VXEIolS5SOqz0PlS9PcWRqU5IkPYYsAMbP9Q=;
 b=VcB60U6T+CExuYnLGnoj5GxUJu+rRr5DiX2lMPShj2J25WlrlBs8b4HmYjH95fspSvTj1dy28pPbyVoGOTTyzrfjpjxOHiqQibx+qrusnTfyTo1XDt3DF9i+HgSNNv8Ae3IhuCPv5CVt13t0GHjd8qIS0Fioojg8V4WhG0emteg=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 00:01:45 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 00:01:45 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWqVlE332Lg1o1rU+Qqd8CQ3VTXKmlZiqAgAAZZoCAAHxZgIAQssdggABCh4CAACvkMA==
Date: Wed, 4 Nov 2020 00:01:44 +0000
Message-ID: <MW3PR11MB4555E00C171FF550020ED890E5EF0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca>
 <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
 <MW3PR11MB45553600E8A141CCDE52FABDE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CAKMK7uFMAiv27oRi98nAvx15M6jniUEb+hhe3mrY3mdYtzsmLg@mail.gmail.com>
In-Reply-To: <CAKMK7uFMAiv27oRi98nAvx15M6jniUEb+hhe3mrY3mdYtzsmLg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 226f7a20-f3c6-465a-9d70-08d88054d158
x-ms-traffictypediagnostic: CO1PR11MB4899:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4899E71422C7BEF81B2562C1E5EF0@CO1PR11MB4899.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SFLyj6SkBFaGBALvuQYrjqeCgSiT2FlHc1KAPcslmoItdmgrSGMYHOP8/wtJ2zbJGOQYCRNKAQRN7kjJ1+Snvx5Z4vjiZYbSLuqRQzphWo48H2OB8ODoms6QV09g8ZcaVHRvmBASSiLYSd7ozeVIpip/fXE9CCNlTDPH7bicUaTr2UYVdgysR/cHesfEM4M5yD0Gld7NyJ7xyyRKoL876OIaehRRMQ8kI8WELC4VYEkR9of+WpI/1I/LCIELMoxwk0q5icPYWAewshPbIXT19v/wzIJEYcMqdVKyjWcrKtzPMvYDMQux8lbfAXT5kKrckNQFD8K2o5sFuo/Uh00DNzcG2Gpm+wkebPeUNrb2oDBZSudsnegOGhVz4vQC0XLmoNPeiBlIEaoPUq/T9xvsMuZBbPJZI04CUVp3kHfSxgzSzh7qDGh7vpZPzo2BQviHTnGL3iZicmsWcTQsotlnLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(71200400001)(54906003)(26005)(6506007)(186003)(478600001)(6916009)(53546011)(4326008)(316002)(966005)(7696005)(83080400002)(55016002)(52536014)(66556008)(83380400001)(5660300002)(8676002)(33656002)(66476007)(64756008)(9686003)(66446008)(76116006)(66946007)(2906002)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Avg7SBGPRWjgkHsJDbLpageEh/cyNBO4yyuft1pzFPRI/pS/aWt2ghFXjM4fSKU8P18L6yt0M8FEepqVVco1poyu54Qlohqvb9JwVsi05/wz/4JQnIApVjh+vMyX5+97RupxYiwybATkLCbBg9g0YHEqgUk+s3W/2PZT9Wn3YQmnRBlVSfzN+0c8YFtffEmEYvjB3QcXBxOpHSzCb0fO3NtuNsdq1WMnRnjPXKyp9xyQfWsEhCsNxRUArMp/YP4ORIxdcnxPvIjuKsDR+iGXHoodOuPA4VlXdWrtMMe4tGF5QNHUOo2QuKhYtUJnLaHu7aNq2oUVStnDqUK2AByhsbO9oiqnNZuD1d20wMtdyRHfu6fRmPOboAQOyK6NawDNCMFnvW3wF3iE391N0dqifOz0/yIIM/wd9HzGBie5R2JZKc3/Z/1Nm/+cGvNMVUIi67wVuBpPVFurChcF70Yv5Acj9moOdDIHtQ3+4yfhGtEN/G7Pewr3Pe+XglCidkLDD24PPt4OM1jgjpiOaB1DfeqDQw9aXrnWNOdt5ZsWuiNJx+1Lqb7B7q+wRgR7fQ1Wb6ekYIISzHwADcDoSN95/GhhOUZdPVLZrEO+0a2zu+kvlgVxDPQf+Tycs0lyJzoKlpEmo4/BRLvtGmZCJVFj3w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226f7a20-f3c6-465a-9d70-08d88054d158
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 00:01:44.9275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+LfKBtW1ZkBBOaqYh9nTGUcQkdMhbe4JHcdIDpijFgmPvwGx2MNj+YpPjCr5q1/bGAzeJdvvVVblF9AZiTiAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, November 03, 2020 12:43 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>; linux-rdma <linux-rdma@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>; Leon
> Romanovsky <leon@kernel.org>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> <christian.koenig@amd.com>
> Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Tue, Nov 3, 2020 at 6:36 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
> >
> >
> > > -----Original Message-----
> > > From: Daniel Vetter <daniel@ffwll.ch>
> > > Sent: Friday, October 23, 2020 6:45 PM
> > > To: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma
> > > <linux-rdma@vger.kernel.org>; dri-devel
> > > <dri-devel@lists.freedesktop.org>; Leon Romanovsky
> > > <leon@kernel.org>; Doug Ledford <dledford@redhat.com>; Vetter,
> > > Daniel <daniel.vetter@intel.com>; Christian Koenig
> > > <christian.koenig@amd.com>
> > > Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as
> > > user memory region
> > >
> > > > > > +
> > > > > > +#ifdef CONFIG_DMA_VIRT_OPS
> > > > > > +   if (device->dma_device->dma_ops == &dma_virt_ops)
> > > > > > +           return ERR_PTR(-EINVAL); #endif
> > > > >
> > > > > Maybe I'm confused, but should we have this check in
> > > > > dma_buf_attach, or at least in dma_buf_dynamic_attach? The
> > > > > p2pdma functions use that too, and I can't imagine how zerocopy
> > > > > should work (which is like the entire point of
> > > > > dma-buf) when we have dma_virt_ops.
> > > >
> > > > The problem is we have RDMA drivers that assume SGL's have a valid
> > > > struct page, and these hacky/wrong P2P sgls that DMABUF creates
> > > > cannot be passed into those drivers.
> > > >
> > > > But maybe this is just a 'drivers are using it wrong' if they call
> > > > this function and expect struct pages..
> > > >
> > > > The check in the p2p stuff was done to avoid this too, but it was
> > > > on a different flow.
> > >
> > > Yeah definitely don't call dma_buf_map_attachment and expect a page
> > > back. In practice you'll get a page back fairly often, but I don't think we want to bake that in, maybe we eventually get to non-hacky
> dma_addr_t only sgl.
> > >
> > > What I'm wondering is whether dma_buf_attach shouldn't reject such devices directly, instead of each importer having to do that.
> >
> > Come back here to see if consensus can be reached on who should do the
> > check. My thinking is that it could be over restrictive for
> > dma_buf_attach to always reject dma_virt_ops. According to dma-buf
> > documentation the back storage would be moved to system area upon
> > mapping unless p2p is requested and can be supported by the exporter. The sg_list for system memory would have struct page present.
> 
> So I'm not clear on what this dma_virt_ops stuff is for, but if it's an entirely virtual device with cpu access, then you shouldn't do
> dma_buf_map_attachment, and then peek at the struct page in the sgl.

This is the key, thanks for pointing that out. I was assuming the importer could
use the struct page if it exists. 

> Instead you need to use dma_buf_vmap/vunmap and dma_buf_begin/end_cpu_access. Otherwise the coherency managed is all potentially
> busted. Also note that cpu access from the kernel to dma-buf is a rather niche feature (only some usb device drivers use it), so expect warts.
> 

dma_virt_ops is a set of dma mapping operations that map page/sgl to virtual addresses
instead of dma addresses. Drivers that use dma_virt_ops would use the mapping
result for cpu access (to emulate DMA) instead of real DMA, and thus the dma mapping
returned from dma-buf is not compatible with the expectation of such drivers. If these
drivers are not allowed to peek into the struct page of the sgl, they have no way to
correctly use the sgl. In this sense I agree that drivers that use dma_virt_ops should not
call dma_buf_attach(). They should use dma_buf_vmap() et al to get cpu access. 

> If this is the case, then I think dma_buf_attach should check for this and reject such imports, since that's an importer bug.

So here we go. I will move the check to dma_buf_dynamic_attach (and dma_buf_attach
is a wrapper over that).

> 
> If it's otoh something rdma specific, then I guess rdma checking for this is ok.
> 
> As a third option, if it's something about the connectivity between the importing and exporting device, then this should be checked in the
> ->attach callback the exporter can provide, like the p2p check. The
> idea here is that for device specific remapping units (mostly found ond SoC, and not something like a standard iommu managed by the dma-
> api), some of which can even do funny stuff like rotation of 2d images, can be access by some, but not other. And only the exporter is
> aware of these restrictions.
> 
> Now I dunno which case this one here is.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
