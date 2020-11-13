Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B0F2B14B9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 04:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052006E332;
	Fri, 13 Nov 2020 03:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40D6E332
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 03:30:25 +0000 (UTC)
IronPort-SDR: 9jKPlY9jIDW/lbCt83DP/cR+bdJclkEyUHnxquzGngBYJ+oLlmlr6ngVTh0T7oOV2a0J8OpfHE
 0vXvUWyXBt8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="167839223"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="167839223"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 19:30:24 -0800
IronPort-SDR: Tf8qzdSsI/6EE292JLfbDWgkRb7yDL3HCfpivnn+Kni1dHUpDDV2mFnCydAbaCc4JvHRkrZpYs
 orHFsAFxhcwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="399624151"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 12 Nov 2020 19:30:24 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 19:30:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Nov 2020 19:30:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 12 Nov 2020 19:30:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWFD1sU16hDyI/S0H6zbEgCXaGNhZaiiyC3aRbPmdPsTHcTL/Lh309N16bmymA63ONWhbmojHHxBpcDHN8qzypp+nTN0qEXTNqFZrAt3wevcKUEzYP2QxT5zMhvUNxcF7WR5jzacl6agwvs083igVhLNrOK0jhxWbHXRrkbswdMHodD6tbNvxPrl82odhJrXNp3PXPXrVPBXAJD1qcBETtj9PZNe+Y1t5C5ID5DWyyQCWGVy+/v/+KVxyS2NxZ4YfLAXz5tyexohLC4KIt0gmfcCNqI4VLRyYKmtlAWhiB/Z+rjAY65PX7/bOO4tAoKwvg6B/8eHux2LvE1LSnJyOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOl7uWDruGMit7dWwj4PDro6o3sTAQrGW0uSgdVZBKA=;
 b=DS78bKj1tz7P4xxUfRRyJrOcnupwUeBHQPPx5WZ1hkovfIBN/f/xlcZCJyoZONTOGTSZBmfukWNXDH+Najm/X0qiz4MhkFJ7T0cis9L6F8YaUQbaZSO1Tc0mWx5+7tND+9aGcaPgQ259bT/Bjl8LA7fe9K5gF6bFfnM0zmfc+7UejiArojZOSsFY7PynlJI7gQIH8MHG2hUSHKUOu5M4bDdn7vvy6pVdNbJJKw0p5rkYG8r/jwSTkEUFUpkRZW9zAacT8VqTs5CosGNcaMzMLlwU44yPVixuvClx5ISZ8PAOuchsuXltglm6ddnRTM5GgM+ipWdMlMbhkbnCB2P5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOl7uWDruGMit7dWwj4PDro6o3sTAQrGW0uSgdVZBKA=;
 b=P2/0mTUBH/zL6Ov4UsqZuT+JEo2i/hd5d1URlCTJIzPePxSj4szmfvjtDSo7VsKYnFta3ZSSFCGT24++iakMTShcWoIBahq8onEPnrNRaL8yxDu95p14iw+qSIXHMYSPL4wm863OwUO3Pg6WryVq24gLU5V1Rc1yWDvH5xwLt3Q=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1536.namprd11.prod.outlook.com (2603:10b6:301:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:30:04 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3541.026; Fri, 13 Nov 2020
 03:30:04 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWt6hVq9qM7nkeJUe9ammfAa6+ganFORmAgAAtBNA=
Date: Fri, 13 Nov 2020 03:30:04 +0000
Message-ID: <MW3PR11MB45558223F95CCE4ABF57B9BCE5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-2-git-send-email-jianxin.xiong@intel.com>
 <20201113003037.GY244516@ziepe.ca>
In-Reply-To: <20201113003037.GY244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 08f23dbb-4559-49f0-5c3e-08d887846943
x-ms-traffictypediagnostic: MWHPR11MB1536:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB15362332FA6C0F0E0C9595AFE5E60@MWHPR11MB1536.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MsuyZ3vQOV2YTkhyGX9Fpncfto7r2qledkXOhCktByoRkpAixvrkjI6Kmzmbiccb3+wVf4LkpIZOiW7hkafyPWSFv8Wg5vRgxUeJpeCRkh5STQN9GevEopQl/jDLsZONTpP7JjuhP448TjyqQpN88ercUr0CU2zoEKYFFZwm7ghOVr+o2EEVQNrz1cDR2ad4USzT2S1Sqi/cwPkRBSEc2Y5mTxfNuNU6AZ9sbvAgZxtnjVhgj/ccqD509oqge8I+0RE+LHF7wvbsdG3s3kZTej1l7XCUeV6LgXXU5qXvAsNRHmeMItYiz9Wm7sDCQqzE+hNUE7PQiYnI9T1q3Hji3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(26005)(33656002)(6916009)(66946007)(53546011)(107886003)(478600001)(7696005)(6506007)(186003)(5660300002)(54906003)(86362001)(52536014)(8676002)(8936002)(64756008)(316002)(55016002)(76116006)(4326008)(66556008)(66446008)(66476007)(9686003)(71200400001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FggY4JhlTuE9f8c7qcYxtGY/gwZ0cBLsxu2LYriq8spnItKNNkS4EmppUl5IFFoWUt/Tf0m4c7mZGAIvjTY9xbOU3j+X2uCuVat0+3e6Q+bwi5VeIZ7nyZHUVPf7jSP+lnyTIMDCgbyD2mgFKYRsGtaVuABodC6tYAfT443Du0vZ7Z3IOdGtpJ8ye9/Fb/P09mNbeG5QOiTOxOWPTCUTIqKKuhEJ0NW0xt3KsXAb53xT43dS7SCSTLb21QodILWwMLmR+0T5nHbfo1ss3eoEBEpeLNa0M7gNSGBznNaO0nmdQt5P6jETuRoKLWCv3g5Rrix/GQV2nqfPOvcZVmpQ2mytSwYSFiuIgmdBoTfGFMOnl4VEimZ18f+4RzbWdj8rxEdqMgy5o1s3/AsDQe5ha4u9NeVf9FfyoZIbLtMr0Bq2ZorNqkcd0otvwRqCIB/Zn/V793ts19kIkiEJSHRTCaBJfmZKfizgn/3AIE4Eev6CUZ/et/5k1P2PSCd2GWMqDLOdtdc4blVUR3o3ZwxjHJXg+s+6T2k+Lm8L0j35h9Ejque4QqXVZkFVWGj079AyW3s5t7mPAP7gOx5DIJEVhZbwLm2X4Zha7nOW/oDAJn85829gX4hNInbAzsSJzVs0PeqHuUKIxb1mFelK2zXzkbxlLmlhYO95GN5BXfnzju+88em/rK9UTbLTxx7ZNxCSahDzdo/lSiJYwYyYhIhGTMrnLc+KG8/Mrh8BFlqQ5c7VC2AnJErGwf7jG7sZXlSq9z/71cpIr2kjjvGbpgSbCDhBJuNohO+TAm+dLVFAGs6OHw9pwX7r8TShXj1nTHBtcCoP+xDC1FlkuDIVvUS64NloO9ABLsy7LKAneGmklOIHlANPRL5vg6+1toda/Z7+iPkURrfk3xh4nujNgBW5lg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f23dbb-4559-49f0-5c3e-08d887846943
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 03:30:04.3623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/rpiweOLpS/iuqQbA1DZiUEm9zTQXDqk8+phPSzEKhzoOh5370VdbOV7JgLYcD+iPJFOT1zdyv0z2Cg+Cmmuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1536
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
> Sent: Thursday, November 12, 2020 4:31 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Tue, Nov 10, 2020 at 01:41:12PM -0800, Jianxin Xiong wrote:
> > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +				   unsigned long offset, size_t size,
> > +				   int fd, int access,
> > +				   const struct dma_buf_attach_ops *ops) {
> > +	struct dma_buf *dmabuf;
> > +	struct ib_umem_dmabuf *umem_dmabuf;
> > +	struct ib_umem *umem;
> > +	unsigned long end;
> > +	long ret;
> > +
> > +	if (check_add_overflow(offset, (unsigned long)size, &end))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > +		return ERR_PTR(-EINVAL);
> 
> This is weird, what does it do?

This sequence is modeled after the following code from ib_umem_init_odp():

                if (check_add_overflow(umem_odp->umem.address,
                                       (unsigned long)umem_odp->umem.length,
                                       &end))
                        return -EOVERFLOW;
                end = ALIGN(end, page_size);
                if (unlikely(end < page_size))
                        return -EOVERFLOW;

The weird part seems to be checking if 'end' is 0, but that should have been covered
by check_add_overflow() already.

> 
> > +
> > +	if (unlikely(!ops || !ops->move_notify))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > +	if (!umem_dmabuf)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	umem = &umem_dmabuf->umem;
> > +	umem->ibdev = device;
> > +	umem->length = size;
> > +	umem->address = offset;
> > +	umem->writable = ib_access_writable(access);
> > +	umem->is_dmabuf = 1;
> > +
> > +	if (unlikely(!ib_umem_num_pages(umem))) {
> > +		ret = -EINVAL;
> > +		goto out_free_umem;
> > +	}
> > +
> > +	dmabuf = dma_buf_get(fd);
> > +	if (IS_ERR(dmabuf)) {
> > +		ret = PTR_ERR(dmabuf);
> > +		goto out_free_umem;
> > +	}
> > +
> > +	if (dmabuf->size < offset + size) {
> > +		ret = -EINVAL;
> > +		goto out_release_dmabuf;
> 
> offset + size == end, already computed, in fact move this above the kzalloc
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
