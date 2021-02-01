Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7130AD54
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 18:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5F6E845;
	Mon,  1 Feb 2021 17:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0D16E845
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 17:03:48 +0000 (UTC)
IronPort-SDR: cGukbNFfnFIjBchXQIJiSILoUMWy+e9LLYRJKa6FJmmpmPNN2SEGiyC/9macPDRdgSVKNjGMh2
 3zhG89y15eAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="159885344"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="159885344"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 09:03:47 -0800
IronPort-SDR: dCBlwsPbw63I3OvqRadzZ0gjoxk9VaLLbzyyItW0rOEOADx8MbJkln2dWUIbU3T7Dm3FCP0Fb3
 514y4u9pkXrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581643591"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2021 09:03:47 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 09:03:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 1 Feb 2021 09:03:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 1 Feb 2021 09:03:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpzQTvOZV97xv3A4U9JukhMF1lc9awL92kAHUILzz4fVGn9zht7uTD/M3Vyu0z7KFJQ8ET/hDnXeNARYkkMl02h9q6PSEYwkcrR2cF7521ACIFmo5g93fi7o84C6tlacKGup/7oJ5qWgfZyo/CSx0W0eH873xL0K25DkAzCFilkQDo011o3nZ19p0pQoKZC7PjFpWjtlRNMiIpo1GYyWsDaP84ACjBuWtY1MFH9vACKeDzlQmdzMgRv7hxtg3mH645Nm2UJ1oo53xGeYLLmUe7lfQmzjNVv4oeeQG+3R8OYEoxNGX5W43d9AdBZt1gC0ifhSLxRe/zyco+CBK/gF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSoBL9KsPk087VNs29ba6/Z4Vq7dCiKchuuv4JZl/jQ=;
 b=IVIbDFx+5JRkme2lzVah3wqA8bb9/fyxuXewFTi6C9sb0plwG0wlgHCMwFdwATH7+bUfdcnYBtV9aNjFYbifrouCjZW0/lZuTRMVRq9vyPy6md7F71K9FeNI/QjVHNVYpuVSaEW6G+eiPaGcIWFlBGrCzApOU7WCkxnW4A6P68HnbqXEfRQCph/I4U5iQI3bhDRR4D19Z1mUNqexZyZ4s2heHhJDqCQCSn2pHVj7Lvh1ZKhPWYULae7IVnZapDfazrNCkJ87vdwA7F6SpgmzjZ6UPzw6EWrpRkI9U70f3YGXwDINNhYQR2g46xWIlE72iIXd0jsfTs3Y+FKlIT1sSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSoBL9KsPk087VNs29ba6/Z4Vq7dCiKchuuv4JZl/jQ=;
 b=p1Cjau+DicweIr1rzVPOEUPG7StKn+0RZcMn9qjXYV1RgbQ41h/Aniw4VFjKH8/LkMlWx170o989ez1hU/okHuU+hjyQ4ZUiNV56Y9WdI3p4qEFgJJEOwuKoGcFN4spAXTXVMOJbM12Ai+QRUnf7wmEMqXTKR5XOoUeUx50+M6Y=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 17:03:44 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 17:03:44 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHW81IsBXvBf9ch/Ui3XtDALqd1H6pB5ZYAgAD3NICAAIRsAIAAFi0AgAAZeIA=
Date: Mon, 1 Feb 2021 17:03:44 +0000
Message-ID: <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
In-Reply-To: <20210201152922.GC4718@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 61166afb-493d-4f50-3227-08d8c6d35527
x-ms-traffictypediagnostic: MWHPR11MB1680:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB16805F9A2793B55D5B4B1767E5B69@MWHPR11MB1680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2baizOOY8uJIf+frpzP9i7aCZx8MAIXQeZCTRn6FcCamvhsx0y+t18xZFMWO39GNO1zsaqa6FO4gi2/VSGc/Yeg4eenYDkY5B6L9Kpyv6Oei+XsIbihoLpRxiyrEl1XgQmgpP4/HXV0XRYKdIHRdR7m/PMH9UqpfK22Y0x9XpyNCtL/aP45EAaw3tctnIqRQLwE4ZYD2+DX4AW8hp3ww/XAQ+i7Es/o424WIPfw2/3y0RnhY5iZJbc6ShZYIH5ImtaXKdPymmqTM1we49UybLOK4pIPoKur/8FZKHxenQdLq9y7HYnUEFST33uSiCWwioHdgvejk80SYIMQIVXQqhMtpebCwXGrm6Xgma5DAIEioQkq9FJDFNvc7UspqsDsk8aCSOAWVNWlbEQomeUzSertnWVLUE/GmRmbULlDvt0VTUwIXO61QxBK70NrgF4+rUom0kWfaLpaLXYy2Pf3nBA1uC/cdcmWZQc9rTCUd/14wOo9qN1H83yse+BuNyDUOYE/+wG21Ja1V96qW7oUqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(478600001)(55016002)(33656002)(4326008)(107886003)(5660300002)(66556008)(64756008)(2906002)(76116006)(9686003)(66476007)(66446008)(8676002)(8936002)(7416002)(52536014)(7696005)(66946007)(110136005)(316002)(71200400001)(54906003)(83380400001)(86362001)(6506007)(53546011)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zXtYWv+oxaIe0rXJn68aDzkNjwdYqgcAH/D88vnE3lvDjNIki0lha0R6lvq4?=
 =?us-ascii?Q?cjeg1n8afmb8TT7vsgftH/6YNouRqefTA22DeojWRnsRFxlPn9kjEsTtVLgr?=
 =?us-ascii?Q?PI/GoceLb0oCYfiVsJI+aLSXajQ6Ik1v2CHdeWHY5f7kyz2yTGmER2XMzb6b?=
 =?us-ascii?Q?v5Nnnk65wQTjQLuKMW66UBY7ecrjdqOEAjTUaOOAnDXkC9BfNSKraYRGVt4g?=
 =?us-ascii?Q?fkW6WgM3yB7yRSwx+go5Ux9UNoNObzC/R5ccyzh6E31Yuu2szeVX4BNOo29V?=
 =?us-ascii?Q?yTLXlIX0SIf9MfITGbibnfhAJNQoUkT50R03O5znyGJnyYQVqsWc7DHSZniJ?=
 =?us-ascii?Q?2YhKQ03VsqJizwyLY3cV9JQpdnjictyiZhS/Ugoth3ZqosIb/qdPRNPndE5e?=
 =?us-ascii?Q?kJl4WZSJtqQ2S0KynB/VafBWpugb9E7RFRzCjaYCu9Qv58czeDOSKQhO4lpD?=
 =?us-ascii?Q?8Ika0dDuk5EcoHaNXqAkDX72ycJYEObSvCl07nVpnYbcPqeeUmq0tTQXvpkK?=
 =?us-ascii?Q?Ltf8S6W0d4Po1k1VcMB/u5Jg+ZoicOfcZVpS+3L/kt6P9R/PKujpHlW/wN3I?=
 =?us-ascii?Q?ntkCSs8lw/2ax3uhOom3OruNT43S9TRqzqYAzw9qEumY22n1nMLEwaE65Xbs?=
 =?us-ascii?Q?Wv4SLrhnonJGrX8e71AeEXsVbHoxbeUKw9LzTrtGNWDpskcRFda9noY89GNT?=
 =?us-ascii?Q?QWb90/+c4Z29MaSrrP98IlGbCkJgfMNkWuTsEWLR97vvpZLWi0JYEDQ4KPY3?=
 =?us-ascii?Q?pP1MrNyUwJiPGKyWHwP2fqDVI2SQL1Q2gNe4gTTaSKc5FbEkVrwVc4CgjynV?=
 =?us-ascii?Q?tn/lI0yaz28xPx5W3PkRMXOffHnIZydKjyMgmNZcrD/fBfYQtOwg2ZRVjPKs?=
 =?us-ascii?Q?pUyvdCd1PJTe2FXVbW1ZEiClnGexdpgPKFhqwQQSGJCadU108gq5QlS8s4r4?=
 =?us-ascii?Q?5zJ8LVL2T4vvkm6sCmuiuSP+znAszzJ3uN2lFyD4p678Di5WLpNzrKwY8H4m?=
 =?us-ascii?Q?/tAv7JXx6FPEAYsnSCKpA5cm6s3UKyADw4jJEs3ssugY4PU=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61166afb-493d-4f50-3227-08d8c6d35527
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 17:03:44.0751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yzHVQuU+YaNE39/DMPXL0A8BFnsklY08XSQ6wweOrutxPsBzR3oEPOUcQScE7oDta5hmoiLROiE4U2ctiEqsTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Monday, February 01, 2021 7:29 AM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Leon Romanovsky <leon@kernel.org>; Gal Pressman <galpress@amazon.com>; Xiong, Jianxin <jianxin.xiong@intel.com>; Yishai Hadas
> <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> 
> On Mon, Feb 01, 2021 at 03:10:00PM +0100, Daniel Vetter wrote:
> > On Mon, Feb 1, 2021 at 7:16 AM Leon Romanovsky <leon@kernel.org> wrote:
> > >
> > > On Sun, Jan 31, 2021 at 05:31:16PM +0200, Gal Pressman wrote:
> > > > On 25/01/2021 21:57, Jianxin Xiong wrote:
> > > > > Define a new sub-class of 'MR' that uses dma-buf object for the
> > > > > memory region. Define a new class 'DmaBuf' as a wrapper for
> > > > > dma-buf allocation mechanism implemented in C.
> > > > >
> > > > > Update the cmake function for cython modules to allow building
> > > > > modules with mixed cython and c source files.
> > > > >
> > > > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > > > buildlib/pyverbs_functions.cmake |  78 +++++++----
> > > > >  pyverbs/CMakeLists.txt           |  11 +-
> > > > >  pyverbs/dmabuf.pxd               |  15 +++
> > > > >  pyverbs/dmabuf.pyx               |  73 ++++++++++
> > > > >  pyverbs/dmabuf_alloc.c           | 278 +++++++++++++++++++++++++++++++++++++++
> > > > >  pyverbs/dmabuf_alloc.h           |  19 +++
> > > > >  pyverbs/libibverbs.pxd           |   2 +
> > > > >  pyverbs/mr.pxd                   |   6 +
> > > > >  pyverbs/mr.pyx                   | 105 ++++++++++++++-
> > > > >  9 files changed, 557 insertions(+), 30 deletions(-)  create
> > > > > mode 100644 pyverbs/dmabuf.pxd  create mode 100644
> > > > > pyverbs/dmabuf.pyx  create mode 100644 pyverbs/dmabuf_alloc.c
> > > > > create mode 100644 pyverbs/dmabuf_alloc.h
> > >
> > > <...>
> > >
> > > > > index 0000000..05eae75
> > > > > +++ b/pyverbs/dmabuf_alloc.c
> > > > > @@ -0,0 +1,278 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> > > > > +/*
> > > > > + * Copyright 2020 Intel Corporation. All rights reserved. See
> > > > > +COPYING file  */
> > > > > +
> > > > > +#include <stdio.h>
> > > > > +#include <stdlib.h>
> > > > > +#include <stdint.h>
> > > > > +#include <unistd.h>
> > > > > +#include <string.h>
> > > > > +#include <errno.h>
> > > > > +#include <drm/drm.h>
> > > > > +#include <drm/i915_drm.h>
> > > > > +#include <drm/amdgpu_drm.h>
> > > > > +#include <drm/radeon_drm.h>
> > > >
> > > > I assume these should come from the kernel headers package, right?
> > >
> > > This is gross, all kernel headers should be placed in
> > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> >
> > drm kernel headers are in the libdrm package. You need that anyway for
> > doing the ioctls (if you don't hand-roll the restarting yourself).
> >
> > Also our userspace has gone over to just outright copying the driver
> > headers. Not the generic headers, but for the rendering side of gpus,
> > which is the topic here, there's really not much generic stuff.
> >
> > > Jianxin, are you fixing it?
> >
> > So fix is either to depend upon libdrm for building, or have copies of
> > the headers included in the package for the i915/amdgpu/radeon headers
> > (drm/drm.h probably not so good idea).
> 
> We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> 

Yes, I will add a test for that. Also, on SLES, the headers could be under /usr/include/libdrm instead of /usr/include/drm. The make test should check that and use proper path. 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
