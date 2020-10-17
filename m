Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F31290E6B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 03:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969666F3F0;
	Sat, 17 Oct 2020 01:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16BD6F3F0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 01:00:03 +0000 (UTC)
IronPort-SDR: ogXHWwjT2I14le6Z4WL+lK5R9v6TR5/EEcxR/+9GPFwZpReAwW4kW+OcLsOYzaMvlRzI2Xrks1
 TozWWvkLJopw==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="228373572"
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="228373572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 18:00:03 -0700
IronPort-SDR: ZkuSJIRFQKIJjJ2YPJEifKlCdV47c4yfxrZTprY5VB5pVLpsAhMYjeX7pLB5hecTO1RlFKnnEq
 dhnP8JmAAkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="464878547"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 16 Oct 2020 18:00:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 18:00:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 16 Oct 2020 18:00:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 16 Oct 2020 18:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um7JQz0j1sOu4pmSzC9r9kH5sTo5tiOIReih86FR9x7o8gaoUMVhKFrYY+aTdIy/7llYWLesEris1HudfgOaX7yRRzRJYdDzGCGxiHmXqnY7kuyzG2VhHCIO+f4HfejcCs1mLzA2sjYZQqeryRbOfZtmgGgLScsC7dU3x05vj3YeVapvebcoCnE8kttqIyUv8jGViw02MbJX3rHlDGQ9NxO4i6/O612xNd27xISyNRulS0mdbXv2okH2nnXrJILW5zcXGHWM7HWelNB7NABTMaW0jMCMOi7LC4Y0SLSSmnexmo8joAKq2euFFkzPugsKA9Sh65cguhq80S6568LTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr7Syi71So4c84woGLImgzMzJFFHSxZ5p9XFBhNam7E=;
 b=BTL1oxks+bZqWvNb8igVdZh96SWZq6wUrqbtZqjCa4BE9jatiliAuqsASVdvrXyhx4AZczHNW8Izj7sHgPY0QlUGixaEWkod4GZHdRRy9OfbYnF8tEErFLrtetcAXTY0IbBTCxItH4mST/RE4PJTDGn7k9nDMJ8Mw3WQ9PCIYCcDlmoK5oXETFs939T+gozsnItXGeWeyAQdxZwx5japxWPZ2ulf4lSPrhV6b4Ap3U6YfNFbfi29bFt12e9uQ43hjt2tVj8E4Qcl7/O1+cZBIfzX7As0zX0WrDPFuuz6CXXrckq7u4H/jp8q/JD9i8oqt8LJPfH3mRFoti9NA51DgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr7Syi71So4c84woGLImgzMzJFFHSxZ5p9XFBhNam7E=;
 b=HKaoqr4NySsR5345fyaiWfELYaK1f0l2rgh2nKBCWgYeMw4wfNiuX7BEio4NH0rI8QXGRYnU+P8CnFnFYcAoJiym5G0Yp1LEr9MIn9BzE3vb7nHPMK4m0RrGUHUVEyf/Xwxe4NoDrOj09PDyLYi/rTm/IbLZKQWlGB+ow6Mxni4=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Sat, 17 Oct
 2020 00:59:59 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.022; Sat, 17 Oct 2020
 00:59:59 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v5 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Thread-Topic: [PATCH v5 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Thread-Index: AQHWozz5vWRMC2t3hkCwfWjutUcfdKma72yAgAALMoA=
Date: Sat, 17 Oct 2020 00:59:59 +0000
Message-ID: <MW3PR11MB4555CCE685E8914E63FC2B12E5000@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799375-138277-1-git-send-email-jianxin.xiong@intel.com>
 <20201017001751.GA334582@nvidia.com>
In-Reply-To: <20201017001751.GA334582@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 9d6ea6e8-0888-4f9d-c22f-08d87237f883
x-ms-traffictypediagnostic: CO1PR11MB5009:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB5009EC123AFC2A3B45705A41E5000@CO1PR11MB5009.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55sbyrAWxbSAyDwckDAYvJ5WQ2jo2qKjxZHMfVfzpis+vwBaLqYtqBeTMYLbG8HR7paQ6uLBbjh/yeclwlkCqe7I6v8xKSe1+OmpS3fJhq3toRPVs9qZ3eHVlvSujjobCOTzYbjaf8OOq4DlXhb+dXQTng5LbyTKxfbvrA2JpuWwwh7jADIxCzpyGJTYhw3EEcY4ue+ar4Ie1lw+AMjggSz2JKJasomnAzYr42dxTDh1uBOBXnnfDIirDP5ibLu7smna1+LNbHJvZks5iGIPKe8m3P3D5hUgztNpNJybtAQSd5pHDd/YWvVzq+TNdIycrIEu+r3UcOlw6UWJNgT2og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(53546011)(6506007)(52536014)(66446008)(6916009)(8676002)(54906003)(5660300002)(316002)(83380400001)(7696005)(8936002)(4326008)(71200400001)(76116006)(2906002)(55016002)(86362001)(66556008)(66946007)(64756008)(66476007)(9686003)(26005)(107886003)(33656002)(478600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XbhbBMeKFudgZBgCd+hCGF/XAYrx/aQ/6WW/jMz2A4OrLepwrJFzcdXihuW2//T6WHISY+Y1CQsToHocbVSVYYRuTiAU0AKR0Nd4xEVaDAiAHEHU29KAW76QGAkdVSSNz1y6XsuHidvXFaVWx6HQCBHcQlX9H+5oVXUFCE3ApIcgWUCh+FmdwZbSZgNyUevtAb8pUSbgADPCRDzbn+vJLv+KCilMBat7THZRNyWEY7kYquiXV1wd23Q83cTLhGjOg3GdUR6Ro5yrwCXkiISdnF4Yf2WerirYtTkLN490duno1LFljpFvP7CECZM5sXE0Ba5dRbvDBSoQCpGbpEZJsvs8f/TD5L/WxbBX5tO0P8jRcaghikXgSfjONjpQn/i5QQ4GqWgDv3T8tE4B4WULILIm5rO82Y22AGKtnxYmW2yVEnWOaDtcz99ZesxXEJoW/kqMMvgJ3bpbgP5Zm7TQO8PVHwyuDOP5/NXuB+Cu88pC1vtI525mOJpGX4KgBolcqdS1+IgPsX6KSmMYI3m7AO1FoDFuqATyDVnH993OOd11vwMLKqVmI5AYmMdmM+lVgzeh3SlKUp71XJdZU8sUdUyzEcvQmA36bslUiDcJ91A8AqbfU80iS1FyIlCXZI7NbP1gyufxzXuTtIb2+ukT0Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6ea6e8-0888-4f9d-c22f-08d87237f883
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2020 00:59:59.0684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oV6t9heR0ZCF8VmPisUNuMdHldekI9PTq0fGfbUdrHPKNmJacez1e3nxqQq6e1Z+7gBOO8C0mXjSiAEBUeQOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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
> Sent: Friday, October 16, 2020 5:18 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 3/5] RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> 
> On Thu, Oct 15, 2020 at 03:02:55PM -0700, Jianxin Xiong wrote:
> > Implement a new uverbs ioctl method for memory registration with file
> > descriptor as an extra parameter.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Acked-by: Christian Koenig <christian.koenig@amd.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++++++++++++++
> >  include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++++
> >  2 files changed, 126 insertions(+)
> >
> > diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c
> > b/drivers/infiniband/core/uverbs_std_types_mr.c
> > index 9b22bb5..e54459f 100644
> > +++ b/drivers/infiniband/core/uverbs_std_types_mr.c
> > @@ -1,5 +1,6 @@
> >  /*
> >   * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
> > + * Copyright (c) 2020, Intel Corporation.  All rights reserved.
> >   *
> >   * This software is available to you under a choice of one of two
> >   * licenses.  You may choose to be licensed under the terms of the
> > GNU @@ -178,6 +179,85 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
> >  	return IS_UVERBS_COPY_ERR(ret) ? ret : 0;  }
> >
> > +static int UVERBS_HANDLER(UVERBS_METHOD_REG_DMABUF_MR)(
> > +	struct uverbs_attr_bundle *attrs)
> > +{
> > +	struct ib_uobject *uobj =
> > +		uverbs_attr_get_uobject(attrs, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> > +	struct ib_pd *pd =
> > +		uverbs_attr_get_obj(attrs, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE);
> > +	struct ib_device *ib_dev = pd->device;
> > +
> > +	u64 start, length, virt_addr;
> > +	u32 fd, access_flags;
> > +	struct ib_mr *mr;
> > +	int ret;
> > +
> > +	if (!ib_dev->ops.reg_user_mr_dmabuf)
> > +		return -EOPNOTSUPP;
> > +
> > +	ret = uverbs_copy_from(&start, attrs,
> > +			       UVERBS_ATTR_REG_DMABUF_MR_ADDR);
> 
> This should be called OFFSET uniformly here and in all the call chain below. Not start and not addr.

Right now it does mean the starting address, but that can be changed.

> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = uverbs_copy_from(&length, attrs,
> > +			       UVERBS_ATTR_REG_DMABUF_MR_LENGTH);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = uverbs_copy_from(&virt_addr, attrs,
> > +			       UVERBS_ATTR_REG_DMABUF_MR_HCA_VA);
> 
> I've been trying to call this IOVA

IOVA sounds good to me.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
