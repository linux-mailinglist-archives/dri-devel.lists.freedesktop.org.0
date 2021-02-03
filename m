Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D930E046
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 17:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EE66EB43;
	Wed,  3 Feb 2021 16:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B2D6EB43
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 16:57:09 +0000 (UTC)
IronPort-SDR: eX8zgZ1v5gBs1gXV0ahJh5ODQD9ZxHVyKq0VcuGPrBVz73PAnQuKN4osJh0YgNzQtXmalvMc9q
 A5PZ9HI3hEYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="242585451"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="242585451"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 08:57:08 -0800
IronPort-SDR: aIVRhy/2Ik26GDnHvdhSyaXr3xVw2Umx0/LZHwmgWt3zuNO6wNJDfSu/Ipj4ltw2+GypgMl4os
 rk6bWGyOnGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="579509425"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2021 08:57:07 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 3 Feb 2021 08:57:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 3 Feb 2021 08:57:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 3 Feb 2021 08:57:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKiUrvXQWts5dtXOBsp4o7SZrQ0g2a7WyXnxmPdv/dsyDeBTmvay30RVOYXkBZXgSVEezhGxe9hTbSkY47ble8fxIOrzTehDxxuU3koHDuUA8UivqeT5+cMUo40dEp0dYaZLzV25krXIFS1ugAhfjA4zlv4UD97BqFSnVV+pp0ZTRXfWJPB9lY+g2YjZ/S9HtRyIFcpyNGk6DlmIi2q2HB20qZdMAl5p+jRD2bbCDNiQRFqU66gcylISQ3Jda3bFFoQhBfDlU9iKf4K6QKSpAvH1Me70dhX9yAshaznE27+HFkDBloQd7GcFcBZU60uQOrkC43xrF4k9M1KmRB+Sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzBpHX+qpnIU0X8ZBmXG/wroi0tvfxmkmjV/btKviY=;
 b=YIYOO8q96ZFvGqderPxPRelsO1UY9WsI3nCjCTfyDe8K+QWphQyRXSVHtJfRFIqvmPx890k1IiRsuQhwLfh3REFzX/JaTUvoHnvmtFgUL4tqqhMDr7Dss/d4qp8tw4Guil8OQfA6u0A6InSCCPUj0+KlEbZmpu2T2jGuaPXXjM7tB4+giKKeWQb+QoAyl1QkEMLKDXupalysx9qnfU0EytMbIQe/1POZaTANXl62SAyt9LSXlCkLf6Nj4ehsiKnySnlYtHPO4PYxuJOWkpCmINOOTiJJa/qEsl3TEnY+ahLlMOQVgcFpx0PZkY/cJSU85sR1UopB1i45Q12trvUKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzBpHX+qpnIU0X8ZBmXG/wroi0tvfxmkmjV/btKviY=;
 b=gJKvayx+FhWMknz3gYh2t2DM18xu0qCDdLQYaWVHg+6eAnhbEXuepLBfYfDBqNc4EX/zMUBWH0+jkF36K4HSP3Tnx/KITa/jcDU9UryENBtOoUwaRo/b6rkwkU8LRKIsYEr6oaQ866giO+4HAsKZl7+E8P4IEy1Frgx4CDKOtlY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 3 Feb
 2021 16:57:04 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 16:57:04 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHW81IsBXvBf9ch/Ui3XtDALqd1H6pB5ZYAgAD3NICAAIRsAIAAFi0AgAAZeICAAXeSgIAA9XkAgACyvIA=
Date: Wed, 3 Feb 2021 16:57:04 +0000
Message-ID: <MW3PR11MB455563A3F337F789613A9940E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
 <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
 <YBluvZn1orYl7L9/@phenom.ffwll.local> <20210203060320.GK3264866@unreal>
In-Reply-To: <20210203060320.GK3264866@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8738243e-b02c-405d-588a-08d8c864bb9f
x-ms-traffictypediagnostic: CO1PR11MB4961:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4961BB1F4D55B03624B729C6E5B49@CO1PR11MB4961.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vw8WLHLUG+q31ZmVX8CnH+GR9BBV0iqN4nt2toi6wCz+71WcFsoIPMiLbAb2yuSS4zQxJl18eWvDSFA67pnlVQhYuo+gvAv2CCQhzj4Bnz9qEfPlY4EBfKMW4+06Kdoo4m3VhbeefjUdHOLi+uDPtLNwc/0Tad8iA4OBeGsOyAME84Mdcgkf806VKxF0obQx5HkqtieVi7zbvQdOSLKDtfCMpI0sxES/QHMysXHodDlTTYGnQVwLWs7g/RV836su7eMnZfJouadhLDYK9xPGeXJaMgM5ZtQt5Qfm8zl5U4SHyeafqKWrRyCHzrcuUh0NT2mZ7ys9rT+apJN2fFsC9+5cNuEvekGNEfnl89XRoY50CVfnoMpiFfDMWnE4+EWp6CN4cxTDl3tHS4w/Oka0lXOBfsoEHWJlymPVPh/pFnJ3mW9Ti5npYeFqvNYp36jOawRZ4bMmeA7W1+4Rda8KwGJbV+1spmTEJ/V0yIInuEyfzvd1mJ4IUtQeYRPp4xhid+bqLJhPNyHl3tILGjZYsIojqUlisPnBQgmM7Fh7F0ZUobgeibVVv9pj2wXQ5i84630FNEvwLOl3ieRsK7OwRTqoeIsv0MP3Ygm6IXSGsR8MuvF1Zm66+AYDFZQXLC22fQmcHK9sjg1wCOku7OPbQOmR4Afqf6UZ3Ecvdrxi/CQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(396003)(39860400002)(2906002)(7416002)(6506007)(966005)(186003)(52536014)(8676002)(71200400001)(66946007)(53546011)(478600001)(83380400001)(76116006)(66446008)(26005)(86362001)(66476007)(7696005)(4326008)(54906003)(64756008)(8936002)(9686003)(33656002)(55016002)(107886003)(83080400002)(66556008)(110136005)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lAkXxeVVv4nyL5Tl449Q35K00XvE86qGg13mgX36Id/09J1RzmNXM4QyQ0yf?=
 =?us-ascii?Q?j3gSNinPAh0SG9vd+qpB4a9H1mnR0xxzQ7+FqH1S1I3yndijfDcMsGQaoiB8?=
 =?us-ascii?Q?lVCZAbDZIquAbx3zI7RA6To6dEEsihezDct+Pu1vSGXrY1eORPK15bLj3EHY?=
 =?us-ascii?Q?9Fv7kAItmLOBiCnqEK0/CZ2MEqGeZf6dmUrqY12AHv9i+SS73yAu7/hZf1fZ?=
 =?us-ascii?Q?PtZBIhGMFz5Q4jiDVKHB/KOpff/nVu3aylmaEqNVWrUxEsrEsf2J0YsXjqOa?=
 =?us-ascii?Q?THVQmLe3LNa+uDkhRllULJu5Zb7oeHAMdnsKKvvQYq7DkgyXllEw8L0LJ0kN?=
 =?us-ascii?Q?zvgqQjhhHqImtJbpCWIwaoyc9XpqlaGbiD12Dvmz7b2dI3SJXEvnKdKLMtFw?=
 =?us-ascii?Q?ZLaYVIDlXKlmVNAIlctsXCJX1hFp9PG2LV9MG7IQf6UUe7n7m2xSmxP0c/in?=
 =?us-ascii?Q?Mi/23HSouoXcInzj5pk6pfDFG1foG+9D8G94875LBI8rGl5SMZ8Cw4ApiTxj?=
 =?us-ascii?Q?rtKgigeGBmx/KMD75TkEvlnqwHwkYuoF9K6BL0dGqWgy/wri2LtId43cWJba?=
 =?us-ascii?Q?wnhh/qGg8ec6jgFGpwrZH3rb7YChcQW4WcDWq6QbCwlfyD52MbtwtYh8NV73?=
 =?us-ascii?Q?/HDloNn5x5b1pXF/3rgfE9s3jzIRHdNocR421qkPh0WSopSL6ZTjTB7vqcJg?=
 =?us-ascii?Q?fgeuauRJGeQsd+DY/a1jO27/IqxampaAgwSCLD6RT+mUQ7+rxKeuQnaN5b65?=
 =?us-ascii?Q?ufWO46qJlGXf2kSW/AXitH8ZpjKcIYdXC/CblWGef/HDTAEBpcXvI16g/cJt?=
 =?us-ascii?Q?Dd3eFBZESlo8YJUMKdLOZmE/86NQRhF6AR+eBmvxpAFZlU31GMbbqIH6Q2w9?=
 =?us-ascii?Q?4ppZoLVqxkxIxfxHsRp/hdBrZljtfQhap9oq+qSBZORq0ewlMtZkwysf+98j?=
 =?us-ascii?Q?GDMJmwSq9ipkVA48QVscqzn5b7ge0KZrsnysv+2sg1OLImEmnlbQSgVW3mU7?=
 =?us-ascii?Q?0/PzDMU3h4B9ol5ZD2AQKgC61AJOC6ZpHGYRLLjPmlB7/XIHpmAptckiq+ak?=
 =?us-ascii?Q?2aeHJEcOVUu8pgdhmtyC/nGWTjQZkmbhRfykfDb89J78RDquDwJ/b7m16jkX?=
 =?us-ascii?Q?PATGlfN7B2Pe5/zN2jKqACA2XAKlw4pP4b68K4jtW4iAockRRgb8Mehth3uW?=
 =?us-ascii?Q?0p5pBaGYd3trEkJxjhU12uk6Ty+I2u0cNDcaFu5dfvBo0mGBTf9jtadWuwmA?=
 =?us-ascii?Q?jK3kT7NIInFjXjJKOTjl48NAXzi6htxcCRYLI/8H1dKqBJvJ4FwLaRgyqpUy?=
 =?us-ascii?Q?FdQ=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8738243e-b02c-405d-588a-08d8c864bb9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 16:57:04.2325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSiwlgjrlrdJudaMPecJEZBbWDujbyKGBeMJ0y9wM2nMv6vG034/zV+06DR25nN62HRK2qDYKh1K7GS9bWIecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Leon Romanovsky <leon@kernel.org>
> Sent: Tuesday, February 02, 2021 10:03 PM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Jason Gunthorpe <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> 

<...>

> > > > > > > > +#include <drm/drm.h>
> > > > > > > > +#include <drm/i915_drm.h> #include <drm/amdgpu_drm.h>
> > > > > > > > +#include <drm/radeon_drm.h>
> > > > > > >
> > > > > > > I assume these should come from the kernel headers package, right?
> > > > > >
> > > > > > This is gross, all kernel headers should be placed in
> > > > > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> > > > >
> > > > > drm kernel headers are in the libdrm package. You need that
> > > > > anyway for doing the ioctls (if you don't hand-roll the restarting yourself).
> > > > >
> > > > > Also our userspace has gone over to just outright copying the
> > > > > driver headers. Not the generic headers, but for the rendering
> > > > > side of gpus, which is the topic here, there's really not much generic stuff.
> > > > >
> > > > > > Jianxin, are you fixing it?
> > > > >
> > > > > So fix is either to depend upon libdrm for building, or have
> > > > > copies of the headers included in the package for the
> > > > > i915/amdgpu/radeon headers (drm/drm.h probably not so good idea).
> > > >
> > > > We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> > > >
> > >
> > > Yes, I will add a test for that. Also, on SLES, the headers could be under /usr/include/libdrm instead of /usr/include/drm. The make test
> should check that and use proper path.
> >
> > Please use pkgconfig for this, libdrm installs a .pc file to make sure
> > you can find the right headers.
> 
> rdma-core uses cmake build system and in our case cmake find_library() is preferable over pkgconfig.

Only the headers are needed, and they could be installed via either the libdrm-devel package or the kernel-headers package. The cmake find_path() command is more suitable here.
 
> 
> Thanks
> 
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
