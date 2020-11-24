Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888A2C2FE7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 19:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB72A6E29D;
	Tue, 24 Nov 2020 18:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1726E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 18:24:49 +0000 (UTC)
IronPort-SDR: mR7wAUMtXHwY9IBb5JZNiUjWIh/S0+r1dY4wukZ4LNTuPd7K13zwR6WbA3Y6lEVgJtNFBAY73E
 ihWtODt53tyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171213999"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="171213999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 10:24:49 -0800
IronPort-SDR: YFkUZ5fw8cChFZBae31BBN2DXxL0LyBozpbuFXILT+5a2mxUViGiabWaKy+MKQiIMuETx02Q6c
 jd2YAuTNnuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="536559909"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2020 10:24:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 10:24:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Nov 2020 10:24:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 24 Nov 2020 10:24:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVXbnTUhdoXffvAK0X9URz1cqZWfmQ87Zea+11C34GEQq2td+cgDF5rJG8GyhxLu1jTtU2m0dMgWGK93GtPMDor14ynWZrlP3ZkpQuwmm/U/U/4jh7VCo7HIXktyYjnAdfi6OL1j1ZWnIehXS3xnkFFAJgyRO3qndrA0iund++kAqsFUTAxzNMXNbRbc3NC59lRNAktn9UEMxqWZVGi8ZJxxW2J2xid4LzPRliwjbia2UX6O5kpg3mxldUqk/ERvDaiZrHsF9q+PWmed6LyYiJulJyI3UGZDtF8/WtW8AcUOilcHp+21F9NxMcRXx+FUAzLMehVQIdUD3pdyhtpUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0tNsnd6QHBT+h/zAndHZJ48alju/Z7YJIV0ZgyBcvk=;
 b=jx64EsKCvJ6fO0SY1klvqqVyun6n/qQRvdkYTZbswe092YRZtHFZWl3PJNMVUQY+WBp8po3iFlhBEtyZJIdCszU0QuYV03em2eZnzzb65KuqaJrRb8j6MWneJ7A/cQgVvxiW2t1cinPFKPVfyTPKDJAZuu4c5gHzM79JZ1IGXAn6Lpg6etxDWvVjVNZuGrcJ0GWd0oVRhVkqQyhBEA2e9tOpqIig/YgtN6yehpQgO71HnXySU+kjr+vB8SMX84vBgkdo4/x7qlLsC0nXbid5AzvXwb6DUkKyRnkXxXcbj3IIQSza8kIy+G4QEAjxUriC4edkVuHTmdQoVbjr2urJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0tNsnd6QHBT+h/zAndHZJ48alju/Z7YJIV0ZgyBcvk=;
 b=qx7C2rUvZlciv2oLf40V2+231YVYp7BHlfI+uwSNSm0nuBQR6CBPYJSdl0d1AMNz0AeO6etEBHtzSoKpNWWMaeQMvGLH0iYgOZn3VvUz82/XZ416YVXWQP1bFQHZBrw47VKY4YOZSqQCM8pp/7+zdOel3nTBG1zLSe00EZ6c1GM=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 18:24:44 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 18:24:43 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v11 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v11 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWwb94WgcoLsFquUCM/lDOVBeSeanXBlgAgACRfuA=
Date: Tue, 24 Nov 2020 18:24:43 +0000
Message-ID: <MW3PR11MB4555410B8487CA3B6627E463E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153919-104513-1-git-send-email-jianxin.xiong@intel.com>
 <1606153919-104513-2-git-send-email-jianxin.xiong@intel.com>
 <20201124093352.GB29715@infradead.org>
In-Reply-To: <20201124093352.GB29715@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 582f8373-9c49-4b73-cfdc-08d890a6374f
x-ms-traffictypediagnostic: MWHPR1101MB2143:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21437EE8C26462ACCC51B4A6E5FB0@MWHPR1101MB2143.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AggCeLC8TYv8uuFQrdFZiLyP9ySl7P9ZZpdQJ7povUsp1N2UyyodriK2MpYGgah15n0Q+ivAT9gUdFKjm7e61LcQeVZevvkaRIcwz8THFDP4FIvgAbdzNC2iPx/qbVuKLHtnMXwVzWMgcuKGfzRwbXdk/oMaHJW+yNDMNLUEEomNsZyNkMs+bpPU/y2yCV6v2iG4YZkWj2NVEPHqrivI0isgBQLJL7JV2wEPDcAplf8VKv3+b/BPf2a4xsC5BI7+Dm+7Z8bI+rPlp1322q4vagD/VoKvCHKgfY9Q4wa01JRMVxuzGumIze+Q3ayObOSP9n3A9QB/ssrLbq9rd0YC4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(33656002)(53546011)(6916009)(26005)(7696005)(2906002)(86362001)(71200400001)(186003)(66556008)(66476007)(52536014)(66446008)(64756008)(66946007)(76116006)(5660300002)(107886003)(8936002)(8676002)(6506007)(9686003)(83380400001)(55016002)(4326008)(54906003)(478600001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xOXUsbU5O17z3mrYTOwiuNP2zCAZa4cjC2Unx+HIXMW3F0+zP7WJKrlsDQfR?=
 =?us-ascii?Q?Qvdc7sPI2mGZCWUDen/bi4hqappTAPkw+zr9f9HohdBn1AO0roYZEICfizhi?=
 =?us-ascii?Q?q6oITPYM+lE9LshGEsEf0LFyappsSnimaw7qK9uarc/zJp1RQW17vi1nuiHH?=
 =?us-ascii?Q?B6HwjZvYkEe7/M3GkblieKsf//WJskRQjfkZzlNbP10X+8PU7Ivh/Gx+y3vC?=
 =?us-ascii?Q?J6FJFedircqaYO9oNkEJ43pfSrD3qatPqFivxVpkU0OQxqs+7mdRIRp0tXtW?=
 =?us-ascii?Q?Iqqp5ZNREo1wdfxivCP7lQESEqsATABxDq+2vAhP3vuv4fbVtLszK+oCJoiI?=
 =?us-ascii?Q?ZaWw34nUEwMcs0CqRgDRhI4KTuox6cyNQFhcECx9OoOajTcW7ZHqSFafz4wB?=
 =?us-ascii?Q?Y50Z86P7kpNe1/NAPU/6LtoeWxLcNvYZPVnM4gSpBSZ03b24ulbJ1f6BA7UB?=
 =?us-ascii?Q?Cuj05KIrLeKAbFB9/5qKjL63BR42nnZw4madr0IEZKSWCv0xP1Axtc7vGh3/?=
 =?us-ascii?Q?5CslZshtG2LPZI5/AMmf1NUAKntGzvHtBSJpjXUXrNDsmSY1hb6lJfnVMxE3?=
 =?us-ascii?Q?OnayUmjaU0nd7h63ZSlD8PmqAEuGRVNsTycVJBhX0A2zn5Q5rQxe45WmfNVk?=
 =?us-ascii?Q?xMhwSeyy+ljsqiHrISYvYcmPn74Xu5T8mT4FX0Xilh+O/fmUDe6fu7YJHTz3?=
 =?us-ascii?Q?sWoVoRRjlVfwX4j5eLnEk9Qxwix+I1PRLOoB2vK/VGdxkHxHPsi4GA74/i1M?=
 =?us-ascii?Q?oqSdX9qFtOInwhDr2N0+dyUXahVJ0MztqgjEENS+70W3IzzmsmVfvP6SiWq8?=
 =?us-ascii?Q?bqefK6l2sOhTkyiAZ3oi3WIPTuA6McHUPPT324Rknr9T6orYDxLgocSAC9dz?=
 =?us-ascii?Q?Z2CGCqpcIfm7gqZvvYUboQF/nttLux1U36UQHwfN9WTJdF+gNpRIzQZB5KmD?=
 =?us-ascii?Q?bRJL8b540Y6jvin3HElgrjzldxbxZx615ZhZgjrcatg=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582f8373-9c49-4b73-cfdc-08d890a6374f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 18:24:43.9315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+tbUPeJOi8osNluBj3zseEOzlSbAZVWlxkLjl2qqFce3ZXoP6tt8Kj3mj4gicL4kl8xH4p7kC+n2/aE5tBsyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
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
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Christoph Hellwig <hch@infradead.org>
> Sent: Tuesday, November 24, 2020 1:34 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> Leon Romanovsky <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter,
> Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v11 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> As these are mostly trivial wrappers around the EXPORT_SYMBOL_GPL dmabuf exports please stick to that export style.
> 
> > --- /dev/null
> > +++ b/drivers/infiniband/core/umem_dmabuf.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> > +/*
> > + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#ifndef UMEM_DMABUF_H
> > +#define UMEM_DMABUF_H
> > +
> > +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
> > +
> > +#endif /* UMEM_DMABUF_H */
> 
> Does this really need a separate header?

The symbol doesn't need to be exported otherwise it can be put into "ib_umem.h".
Although the prototype could be put into the file where it is called directly, using a
separate header file provides a cleaner interface.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
