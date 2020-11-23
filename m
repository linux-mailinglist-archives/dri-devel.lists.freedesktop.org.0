Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDA2C14A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 20:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C536E0A0;
	Mon, 23 Nov 2020 19:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28F6E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 19:49:04 +0000 (UTC)
IronPort-SDR: xO9888d3FFPqADx+eRIE0tF0E6P4ZWbbVYpl7XChB7d3VBq2/L6isyjoR2c/vH7E9Nv5ZMO3K2
 M5WnrNN6xmtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171928136"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="171928136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 11:49:03 -0800
IronPort-SDR: pCSnYo+Kqq6VYt2Mox3iMfgvUEoaoRvLNt/XBiMz0g08bn9+bXQThXrNy/agH/DWD2yz1LdGCm
 w3RfuJEDZrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="370132220"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 23 Nov 2020 11:49:03 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 11:49:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Nov 2020 11:49:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 23 Nov 2020 11:49:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKJJlu/bqZoIYcLGn4OGk9rw632siy67NOKqmKxGdSerUF/3mv5wvuc90P0flJlsui9ZqJtCbIWOR+45GhCdnQAHsSD2+/f3hYIATNdQlXzhYTzjKmG2UBDkV0g54JAXq5sGfe2OgtAn5XbO7IWAuLdLVES4/LWEO6nSp16d/MYKdNLW2D/DyuZUVBO2R5ibX0LX2Tlg3DS8aIubFT0uBe7Oh6lmmrRkaShw4tH0xiUp2GIvI5fdah98L2YSVAopjH/O+kLaU1s8m/MVv7MdzF9IVORTbZVw3wokoSGqC0MTdVUlKC887slgN9EDLPioVn/ipWy+NSbFOb3yfUOhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYpGuU79Hs++/MIruSg67N3jjlzUYCjrycQTQX7Qc+4=;
 b=l4RTETjTvS2unxb7GMbSXyC4fph/yyrT/rfes/wHCnt22+/jHHmndGX+S7Dh0UVt5Hxn7woPbhuBcHapnBKqZwaclM8k9jXFI39j6gzKfaTt3RlbL84UtR9m4NSX5pW9PnyAJRDfNaMLSzey/FePqLddpTGy/lGXAsBYK2Les7bt1V32e8tmGiNgHXg79Uwhlgap5JNiirvVm+/CrqHj+sE6MpHKb4gb6P+JAHnirn0XjXjq+Zuyo3ys9hwd4y1Bc7+gDrnQulobVx6LXCOw3zg7Dm0Y0RSD8udTPHccobhJQKQJGJABpchDW5KLNDnR6hmQpBwmyXR4WBv9lY+ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYpGuU79Hs++/MIruSg67N3jjlzUYCjrycQTQX7Qc+4=;
 b=fLY2GuvgIPKLdPsb19I+7xoQFqCiD+V9sxE2kftlZbn63KxW/8FPdECingpZAZsCJvoBYVHLZgtieXNKiuySsPnVtFhuzkjdGv7ZGY1QwCBVQpZBX3BP/fdZtNZ47axXGgIBtGROe23bHxBTv3QVfaFt+ey1bqCRjxQpqPM7N+k=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1982.namprd11.prod.outlook.com (2603:10b6:300:10f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 19:48:58 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 19:48:58 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWwb+RTBTJqBZYLEWXdlNPeqTq1qnWAtcAgAAbDuA=
Date: Mon, 23 Nov 2020 19:48:58 +0000
Message-ID: <MW3PR11MB45551AB179916585D911D16DE5FC0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
In-Reply-To: <20201123180504.GA244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 9e21b4bc-5d45-42e3-ad05-08d88fe8d192
x-ms-traffictypediagnostic: MWHPR11MB1982:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB198297F4A71F61AD8CF4634FE5FC0@MWHPR11MB1982.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7iFvqr3+7tVhm6/vJ6hUAa/e7FjkC59I6Qap8Pgb15uFRLXPVI+quCtKj7yw2KuRHZTeUyBptavXDB8cmLz9R3D4FvEgtCY4AdgLbUKZaEuyyZsaD3f4dPFmLxkDjS8i9z1/zxpkXr6GGYVHUe5LQERFpctkSnLtgtshiOQV7E5V8GyT3oL72orDgtijomeVjM+ivMh8EzlsVFUsL3yxNlvo+ZcP4iS9th9cu18fPU3qjkRZZ0RIUGCzgahi1ncHpxSW29yD+IDsMY2VaqlklQeEDvNJUW50jj4/EZtj6Xx8dBzM+wA4jOHimn0j7gTtd145q3cEoNbyqZNnDYkgdy3nnSzC6JD7e8QR5OKjJEDYU1dZXeajLQI9hzup83g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(26005)(107886003)(33656002)(55016002)(66476007)(66946007)(54906003)(9686003)(8936002)(66556008)(2906002)(8676002)(76116006)(5660300002)(64756008)(66446008)(7696005)(83380400001)(6506007)(4326008)(52536014)(53546011)(186003)(316002)(86362001)(71200400001)(6916009)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6Ne7xclgPO9lzlwUpoa1ze0EqXxQLyyLiujoZ2/TadDfY56JKM9Vu5UE7ncI?=
 =?us-ascii?Q?G064vc5DT9m4A+PfpJZZL2xY1FlSV+/vvabHwzxQOt+QexCvR1x1rE985E99?=
 =?us-ascii?Q?99Gf+t+fFpEk2pM88dmYlU9rhiMhpPUl6T/DPo3tv1mTXgDF/8ziM3NoK8tP?=
 =?us-ascii?Q?iV2u1Szy/idlm8WJuP1M97brFc8FbuNEDgu3Y+GsGhW5E33qN8ZUUYpO9uWG?=
 =?us-ascii?Q?EJEI6r8cyEa9iToWchwIfR58zIm0XgRDxPE+2TjWbw6n1+eZ5Ay8JZv3gx6R?=
 =?us-ascii?Q?5fAy18jGXI1Ql21PMPE/L8WF4y0nywmXnOHnRO+8LzfTFDFiSGdNssCJkba5?=
 =?us-ascii?Q?sYhE3SBTyLK1lc0cateBSaI6IRXxTkfXq4QJ3KvyPBnnF38+MyPP7XG6UC22?=
 =?us-ascii?Q?fAn+uQz/NHzJqQ7fnQVAHRA9PB6zaECicY0o+rQ8rbpBr5SGQ46+hG66Ruct?=
 =?us-ascii?Q?rpNQ1e0YHQMI3dAk2BSmFjvX2JOvT9yqDdnzy1lSx87CaaZu04WLv06EDmj3?=
 =?us-ascii?Q?/i2ech09WV2TMGSE1bJj9XWOc7k5cl00fs1S88IgQJUaJ9voJ80X4GaOBG3g?=
 =?us-ascii?Q?CNCDyOec3iWB1bHXgBVGUkvXPsIcCapetDNcN66GdDL5Z3DEe3GLHhTgbA1w?=
 =?us-ascii?Q?drgt/vVw8ZJzwXKoM1DGOMzqOLmY+eRqbZz1q/YQFarkYw2tnajqvcS+eSNB?=
 =?us-ascii?Q?WTdupiXkRAwQi081ZLTRalUYsmlnedncrosiJDwmQDJnSRlQcYlJhhkJ/qjX?=
 =?us-ascii?Q?wm+f4RQZ7N8tztrq8EyuHokI53cxWIrHN8iTyBkYlbAPmvNVJVHtM2LNLvaU?=
 =?us-ascii?Q?upVX/0P5eLN/t2+RgoeofnFrdWgSqN6zNuwokXQSGWB0jO0fKJp+nr4qIiv4?=
 =?us-ascii?Q?6uzJqEZAi9sgEKGZzRT+3lJOIWd4ah3dycsCFFnoxEJpl3l27f2rCfLM4a2i?=
 =?us-ascii?Q?/J+7+z6bATOvNy6ZnZ8Z7TrV9tol84+elYG7OgInZTA=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e21b4bc-5d45-42e3-ad05-08d88fe8d192
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 19:48:58.3125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Xliy4Zu0Hwz0Ul/r6qp/ohoUtuscM/tAPgoajSIIrYVdXHDXsu1YXackX0AZf0VAMCF4+afFg5lZLg5+uCQzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1982
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
> Sent: Monday, November 23, 2020 10:05 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> 
> On Mon, Nov 23, 2020 at 09:53:02AM -0800, Jianxin Xiong wrote:
> 
> > +cdef class DmaBuf:
> > +    def __init__(self, size, unit=0):
> > +        """
> > +        Allocate DmaBuf object from a GPU device. This is done through the
> > +        DRI device interface (/dev/dri/card*). Usually this requires the
> > +        effective user id being root or being a member of the 'video' group.
> > +        :param size: The size (in number of bytes) of the buffer.
> > +        :param unit: The unit number of the GPU to allocate the buffer from.
> > +        :return: The newly created DmaBuf object on success.
> > +        """
> > +        self.dmabuf_mrs = weakref.WeakSet()
> > +        self.dri_fd = open('/dev/dri/card'+str(unit), O_RDWR)
> > +
> > +        args = bytearray(32)
> > +        pack_into('=iiiiiiq', args, 0, 1, size, 8, 0, 0, 0, 0)
> > +        ioctl(self.dri_fd, DRM_IOCTL_MODE_CREATE_DUMB, args)
> > +        a, b, c, d, self.handle, e, self.size = unpack('=iiiiiiq',
> > + args)
> > +
> > +        args = bytearray(12)
> > +        pack_into('=iii', args, 0, self.handle, O_RDWR, 0)
> > +        ioctl(self.dri_fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, args)
> > +        a, b, self.fd = unpack('=iii', args)
> > +
> > +        args = bytearray(16)
> > +        pack_into('=iiq', args, 0, self.handle, 0, 0)
> > +        ioctl(self.dri_fd, DRM_IOCTL_MODE_MAP_DUMB, args);
> > +        a, b, self.map_offset = unpack('=iiq', args);
> 
> Wow, OK
> 
> Is it worth using ctypes here instead? Can you at least add a comment before each pack specifying the 'struct XXX' this is following?
> 

The ioctl call only accept a bytearray, not sure how to use ctypes here. I will add 
comments with the actual layout of the parameter structure.

> Does this work with normal Intel GPUs, like in a Laptop? AMD too?
> 

Yes, the interface is generic and works with most GPUs. Works with AMD, too.

> Christian, I would be very happy to hear from you that this entire work is good for AMD as well
> 
> Edward should look through this, but I'm glad to see something like this
> 
> Thanks,
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
