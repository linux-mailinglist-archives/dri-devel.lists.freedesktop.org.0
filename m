Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A4292229
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 07:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D726E8D2;
	Mon, 19 Oct 2020 05:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1006E8D1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 05:28:51 +0000 (UTC)
IronPort-SDR: nZ2WXQaJEYbVU3XJziY65RAPaJRLPHN7eqJWli5hwUBgUtC6fmFjs0EoMi7nyoGwt1TtYdQ4vF
 wW9cHoVddnaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="166188821"
X-IronPort-AV: E=Sophos;i="5.77,393,1596524400"; d="scan'208";a="166188821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 22:28:45 -0700
IronPort-SDR: B98XMq6sgyjqQZGC/PQXOaatEEvie0BWRy1IUt0rjXLZKapfseMx4R13bKWzu+Hb+nTVFZXI7L
 UI9QIMg9WS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,393,1596524400"; d="scan'208";a="465394476"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 18 Oct 2020 22:28:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Oct 2020 22:28:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 18 Oct 2020 22:28:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 18 Oct 2020 22:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcBNXqwlEHfgqjzQanwZm8Fm+YSrOlJQZnvMuyqcZ7Encu9NK30m7zOpjsgGmUoj7cvQDktKlq/ANjU1z27eX5Fjhr4DUIjN1rwMzUazH6BkKNcngKpmpldpeOREqtj014UMnHmlRjLyXE0FshXmEWfywzDExzON0dAIvzXYlrNqK0VqmIpSoa8gyHqW9juq7Rp82MMpQ1/55bRbyj3NttogL0XOY+2pqqGwGKxs1mJV3dQC9Oli9YjuES+cnOiBQp5hz10u2UtBIZF6ROOn/CMrCgmKpFoGexuk544oCyEycHE6y1OzHeBsw0e06wAwVKFIkRpetMNViz0R8vSymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3qn5U9bA/o2eMPFtdWmu/i3SAUlTEYhqG2GeUniQ44=;
 b=NUAggU4WojYc/82QkZfcYfNplnoqOk3Bx+8pLvuPBcd2fM9MILJDha5LlyrmfNxH9863RFI6MJth/COgKlNCVwA9/J67OBk6Pdcq4Y8x47WbdrVjuUvEgMC3nSlc7wqRTP0kfoBgbwZDbDtWFOeafkT0dJCmDWBO+7PzJW1E4Y2Q8eXSIHPK5LibMEYUod//ud7ZO6DfdqQzSkoZGlTn+p7vEFWYobezUUAiafw5t5cYHUj7sErRRwgeXdzmEH6qNaBmhZ80rf4sO2pJaGUk8swf7qE89VIMeDrj0ul4imDn+V6fKwCT+pi2LzcS6O9jIYG1AeBrUboh18GviW4U4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3qn5U9bA/o2eMPFtdWmu/i3SAUlTEYhqG2GeUniQ44=;
 b=sak6e5HLEClJXSdUiQqDY0UnDY4x3fBgV6Puz+2pUKRZxs+KB4YBicKshVQFVx02WxznXlCxMLR5k4uPacXwlLVJZpEOFTzQPDYKJgsCciHpRlF+oxJqJmh0b5bHSo9k8QltESVCOeAwcnRGA9ofDLCQyTgFPWbM6wL6cjak3Kg=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Mon, 19 Oct
 2020 05:28:40 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 05:28:40 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWozz1hR5fnRv5A0WWquQaJ8S5uKma8lUAgAAErFCAAAV8gIADadNw
Date: Mon, 19 Oct 2020 05:28:40 +0000
Message-ID: <MW3PR11MB45552B6EC3A50E38483547ECE51E0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
 <20201017002816.GA334909@nvidia.com>
 <MW3PR11MB45556014C8D85ABC9EBFA97CE5000@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201017010437.GZ6219@nvidia.com>
In-Reply-To: <20201017010437.GZ6219@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 483e6ebd-11a7-4a6f-6f8d-08d873efd68a
x-ms-traffictypediagnostic: CO1PR11MB4769:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB47695932889E98E8730A0B2AE51E0@CO1PR11MB4769.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XQTwTUe3t7Ea7BVv0Mxqc1GyMeuCXEsNI/PiErc/qcpzfFsEIE1E3wmW4T4H5HD4yO0JCazkcgUgbcApCKcUQ8gLlMY3iPOfBhza/99tBJKxxzsK7yWBb37yIRp4uPTIqIwUKZnlKWqkaQGT3byoIvBEHx2jJ8tOpkAFBrK7teblMeAQQ4ge9g9OnSZEOkv81wsel/xXB/SF3KoXeG5Kvp0FAlhWUoHsxvAHPDjpzrbwYPpWC0PxWo1OrOVkuKlWhPDYKCwfudM6SpDqtAgVqLDjbQGTe5/+DF9vhM2xCASYzca8Hg8hYlg9vgA8N3u52sJTQ73g9J8j4pplmj9+Kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(107886003)(86362001)(9686003)(71200400001)(53546011)(6506007)(186003)(316002)(54906003)(26005)(7696005)(66556008)(478600001)(55016002)(8936002)(52536014)(5660300002)(8676002)(83380400001)(76116006)(6916009)(4326008)(66946007)(33656002)(66476007)(2906002)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HwPsCSbFD67hGqMgb9iPhwN59YmRxCBcnjMBdQJHqdXb00jstZ8pTZytTj7KObJTPasuUT0DwCV2ZRHsRf15ve9GGdlALQY2gj7ChVoSPZouU3atC+ZJ7E6N79GF1CCr3mVl7Lo/4CiOeb/DKraYsk3XOOgYiDciIjKR7ClaTLoH9w3/glp6ICzfHXlwAS5zR0QIVqIgqGG0f3W/h2nldymbdQFRRCRKuhcoDGIR3vGQWlzM479QpH9i9/6r2Q7wdt8B0AlDxtrUkpgF9vWS2e7KnGGjey4O3ivgKhoNXFEUOoFwbBUCqbk5MgiHt2uWi53At4MDh6culLHABkWeaWYFyZzHDCUn11hoZY7OeCZA9JMTg8RaRCld2Dz5ZOH3f5HrtCHym1Jr64WWQJ3oUY80VyeCsMHYhIvGfKS8EMlwYpSWQPJZ0gqgva+nfkPSmch5xCwbSQh7pCYBrlNyUiqx/j73DhgdX/yaZDvSGaCJ1sfNxsjBy3jw65luzU1vrMlPMg5JEN9rfVzMTIkBAgCWF19bK1JPIQjpjCYjK8Xv9F8G1skp17+RYxsRZjEkOD6JK3JXLLDTCFXGN5MEs9TmGEttyHDCuVCE5MocLnSZD08whMu7KyPUdj9WI7VRRTcZFcPMSWfrqt6eEMIqlg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483e6ebd-11a7-4a6f-6f8d-08d873efd68a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 05:28:40.4544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogN699txEg1uqwxkVczMkKskr5YNaGpMQHnAXzB4Ke0dGSBJBwHOUbajKfC6VYf9HvU0eTWlCvAlk1I3vIV2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, October 16, 2020 6:05 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Sat, Oct 17, 2020 at 12:57:21AM +0000, Xiong, Jianxin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Friday, October 16, 2020 5:28 PM
> > > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian
> > > Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > > <daniel.vetter@intel.com>
> > > Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as
> > > user memory region
> > >
> > > On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
> > > > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > > +				   unsigned long addr, size_t size,
> > > > +				   int dmabuf_fd, int access,
> > > > +				   const struct ib_umem_dmabuf_ops *ops) {
> > > > +	struct dma_buf *dmabuf;
> > > > +	struct ib_umem_dmabuf *umem_dmabuf;
> > > > +	struct ib_umem *umem;
> > > > +	unsigned long end;
> > > > +	long ret;
> > > > +
> > > > +	if (check_add_overflow(addr, (unsigned long)size, &end))
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	if (unlikely(!ops || !ops->invalidate || !ops->update))
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > > > +	if (!umem_dmabuf)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	umem_dmabuf->ops = ops;
> > > > +	INIT_WORK(&umem_dmabuf->work, ib_umem_dmabuf_work);
> > > > +
> > > > +	umem = &umem_dmabuf->umem;
> > > > +	umem->ibdev = device;
> > > > +	umem->length = size;
> > > > +	umem->address = addr;
> > >
> > > addr here is offset within the dma buf, but this code does nothing with it.
> > >
> > The current code assumes 0 offset, and 'addr' is the nominal starting
> > address of the buffer. If this is to be changed to offset, then yes,
> > some more handling is needed as you mentioned below.
> 
> There is no such thing as 'nominal starting address'
> 
> If the user is to provide any argument it can only be offset and length.
> 
> > > Also, dma_buf_map_attachment() does not do the correct dma mapping
> > > for RDMA, eg it does not use ib_dma_map(). This is not a problem for
> > > mlx5 but it is troublesome to put in the core code.
> >
> > ib_dma_map() uses dma_map_single(), GPU drivers use dma_map_resource()
> > for dma_buf_map_attachment(). They belong to the same family, but take
> > different address type (kernel address vs MMIO physical address).
> > Could you elaborate what the problem could be for non-mlx5 HCAs?
> 
> They use the virtual dma ops which we intend to remove

We can have a check with the dma device before attaching the dma-buf and thus 
ib_umem_dmabuf_get() call from such drivers would fail. Something like:

#ifdef CONFIG_DMA_VIRT_OPS
	if (device->dma_device->dma_ops == &dma_virt_ops)
		return ERR_PTR(-EINVAL);
#endif
 
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
