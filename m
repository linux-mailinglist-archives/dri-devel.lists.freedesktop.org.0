Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D762C8B25
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 18:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC80E6E5D1;
	Mon, 30 Nov 2020 17:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE2D6E5D1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 17:35:12 +0000 (UTC)
IronPort-SDR: JSXw8rVPH0E9LjJQiim79yfqnLA+5BINbGRWxRxkd8jZoGLavwBfB+cT0RVXMQhOytn5qZrtbv
 VTCa8GnpLNog==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="190863254"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="190863254"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 09:35:11 -0800
IronPort-SDR: 7BaNVBlTf7vi+NwOqDXQJZ5SPFj6+Ktf6ToqZtbD2JWnlfKuLsSQwXsuXGb74n8CQaKwv+ErBo
 G4fhgItY1s8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="334738414"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 30 Nov 2020 09:35:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 09:35:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 09:35:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 09:35:10 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.58) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 09:35:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL463AcvtjlHwoWsl1uMc9/mKetxj3lGWhseL51fdc0Iiq+0vBip+l1HEvvvOKQcr9KJ915ClH9HSOT8UemnAlo73Xpcrsd8E5SGUTKsELs1zRovsXRh9yXmIG/e5o9XHwpO5d2VFjbK7ov0yTZi89vEQOLsD0+GKEmBfU/5Ry1T2GlhpL2AJZRBnIFFGMTWh0F+HeZuhQFbH8F3lunBxC/33rm/3ARZBpvFIWJodSHx31PTFGiC8FS97ldlQEEk2pB5ev1UPLrxmW+nR+t4LRomKU9XAHuq0i8/PHUTPnCVKuB6NvbslnNyMYwCqu+Hgrw3UQxI1iFhU8zys1roOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqIx/8lM6Zp3t3StnBcqC5Bckcekt8AyRsnYFlXokFk=;
 b=aMMI0rRqia4QdgPZaI95QLTCSFdSx6nfJH0BXrcaHSTn4mMIwJ5ZzBvZ/9MxQz4ChIiXVn0k5v4slD7DUPgCRbe4aImVEE6lvbDsPxw4xfnH3kYF7Dr4GisvpbCQBub6zWUC4ofn4zAtM1BcaOfWE2KIn+Fe+ONOWnRrts9i2GM4Eacj6D8xNB/LOVZCytn6ZSBO5sIDxY15MeEq6rdNocoaxSustF2XBx5453GfgKDw6PLc48ISoOjP2kskCW0GQSFsyudKHPOvDShipkg/tnMHQYmzUokva0Ern55Pu+netjcq4s/3Wc5Yvlaopl3GbY9MiXGPN8XAcnIvnm4zJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqIx/8lM6Zp3t3StnBcqC5Bckcekt8AyRsnYFlXokFk=;
 b=CW4SSr2y/E2OCCjzymXqNStuXLA8KypSn2dmYnz6PJH0GBhOyqrvmlDc4wqe4akwRjnY45fGtWZvV7nezOrC41H8NxmQL/nMngpXPt3g7W9c0OQjvKkdDulN2Sq0ZkkTeMFRu8h1GX/sa0s91G6cAsHpPiIpH8lDum23qGKhTVs=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1375.namprd11.prod.outlook.com (2603:10b6:300:23::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 17:35:06 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 17:35:06 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core v3 5/6] tests: Add tests for dma-buf based
 memory regions
Thread-Topic: [PATCH rdma-core v3 5/6] tests: Add tests for dma-buf based
 memory regions
Thread-Index: AQHWxP29pZO5RHISEEuRcIV6nX4ijangyRCAgAAqkJA=
Date: Mon, 30 Nov 2020 17:35:06 +0000
Message-ID: <MW3PR11MB45556E67A2B66579777772FEE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-6-git-send-email-jianxin.xiong@intel.com>
 <20201130150021.GQ401619@phenom.ffwll.local>
In-Reply-To: <20201130150021.GQ401619@phenom.ffwll.local>
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
x-ms-office365-filtering-correlation-id: 140fe1b7-22b7-48a4-ad29-08d895564706
x-ms-traffictypediagnostic: MWHPR11MB1375:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB137515E57E3C0373C2D60216E5F50@MWHPR11MB1375.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WsjJqTzwiYeJni4Otdt1tHcocl16439hMVHTSDz1RANvriWs2cCwVvDZtfUlxR8YQNYenDgTe4H3ogYb8vM1ktDhcl/Ov3W1pVjgo0xQo1WVeVWqcg/FjMmo4MQ/2Iq1qHbwgwnk4ifS28HRZUwHw+Z6CkCQRnYoEFU0KxhS/SwPJAzaLC1+c2RYqI+qiLhJPL6zmv1+uFjdiVrNE/jj1blEKNM+KVF4D/j4O1l2LXW+ElmUEURpmN88PDrElyZsz6T7+T8dCYLc9yg4cE/wA02hYs/Ipc3AVNo6bZAIqmo70M6/ryE/twJIieKSoRGtY7occKysmA0Fh70MSoEN0P5Ktwi9yKdk42gHxxX6SsQyE29Eipn07diXSb9sasPLa81T5pQdB8kIGKfolxdgTekmNo13X2ToyIWMJwMswn8AyRWZNA/SmA1XEpuDOT0LedRsPxge0my6RBRALxqVCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(52536014)(5660300002)(7696005)(6506007)(478600001)(53546011)(966005)(30864003)(83080400002)(83380400001)(86362001)(66446008)(66476007)(66946007)(66556008)(64756008)(4326008)(33656002)(316002)(55016002)(9686003)(186003)(8676002)(26005)(6916009)(2906002)(8936002)(76116006)(54906003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WMc9LvBYUPOehR2FzYoDJ7XJRMDuszgOz8G4Bqfc5C0AI293Cq37s1SHNlJ+?=
 =?us-ascii?Q?PrWKpeubXHfjVeZ9yWEDj/AMzHtE7EPK+Alvu1uNIN3J226GoloMN9eJFCco?=
 =?us-ascii?Q?/S2lW1CeJ9Q2YK61x11650oaJ7ZJzb4MAoHn0/HHOIaey4lke+J0K78hUMsv?=
 =?us-ascii?Q?1CQ4SDZcMwDBrBJt8QNYMZXghVqm+wUtC4d6wql9wpNHMNWuemFnWwOXQ34d?=
 =?us-ascii?Q?UXV2XvY64p+jJ7Vvc+Kz22ce5/wzz9nH9LOE68oeG7PXcB+nyOxZzjFp3J11?=
 =?us-ascii?Q?gPTlSzwA6rn57NHvRpIJ9I6wV2QyA0JLwmU4FZ2icoGY2cofVRtzTPzJiIzm?=
 =?us-ascii?Q?nCMg/4XA3x+VvQjr4bp5MF/qSOuekQUhC0YVlHDF1FU5VTp+Mn0DicVrvtIt?=
 =?us-ascii?Q?NDbulB6opkjapviLWFCXGMrIMoulUlZGwNAzYETlE4EvpVrsesjJVb0CeHBC?=
 =?us-ascii?Q?Jx1T9GQc6L1IEsaCqRRFMdbQD+8S7BwN13KcjPaIxnzDDNhQjVgMhACFcNAz?=
 =?us-ascii?Q?lDU6vOqt36jj0vka9Va5LYOkY2Rzyva4N1AbItDKEKV2CDjN4bUH7QTVx+3E?=
 =?us-ascii?Q?ZXLq1Y+gKnaBmd3grirgIv99AcC+3YC7j6q+wRZvHmCVDBo0j8Snqi7q6+vD?=
 =?us-ascii?Q?ZvfJV+uxVdkUoyTddsx+HQnWdzaIUTRJKUtGUbVcFfTnedxZAHPK7+4eUh5v?=
 =?us-ascii?Q?fPxV5wQ6aBZ8JeYlvGf+iak23xnFQoAhJAeznZpo3pLSE9VT7b2Mku1FskXE?=
 =?us-ascii?Q?Ajuby6Bh7xjGdW+wULTzuF2vn0AzthgW1s4J8etQ7NDpYKjyWRfCdHAz46c4?=
 =?us-ascii?Q?wff+jDMsBoRXQqp7jnuRLK3b5be+1JRASfidBpdiTfyosicruYDGT9EC3sn0?=
 =?us-ascii?Q?ix8ws4zeEIQ/RHqvugwCCDFrEkjExrTncY5Es8k1u7J2WIsNd8wB71YidO4V?=
 =?us-ascii?Q?HSpC/OFjG4+zVa3IaWmAdsNgvep2NMI3G94Z5Hj09Ls=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140fe1b7-22b7-48a4-ad29-08d895564706
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 17:35:06.3046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNhm0mnQvNQzHbA8ZCS4zWmqhBRCEJQJSBgWkbh+g/qXak57iBXJO02RrDHDFEDobDUg8WYjnA90B3Ns1UTbAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1375
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
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian
 Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, November 30, 2020 7:00 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Leon Romanovsky <leon@kernel.org>; Jason Gunthorpe <jgg@ziepe.ca>;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core v3 5/6] tests: Add tests for dma-buf based memory regions
> 
> On Fri, Nov 27, 2020 at 12:55:42PM -0800, Jianxin Xiong wrote:
> > Define a set of unit tests similar to regular MR tests and a set of
> > tests for send/recv and rdma traffic using dma-buf MRs. Add a utility
> > function to generate access flags for dma-buf based MRs because the
> > set of supported flags is smaller.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > ---
> >  tests/test_mr.py | 239 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  tests/utils.py   |  26 ++++++
> >  2 files changed, 264 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/test_mr.py b/tests/test_mr.py index
> > adc649c..52cf20a 100644
> > --- a/tests/test_mr.py
> > +++ b/tests/test_mr.py
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)  # Copyright (c)
> > 2019 Mellanox Technologies, Inc. All rights reserved. See COPYING file
> > +# Copyright (c) 2020 Intel Corporation. All rights reserved. See
> > +COPYING file
> >  """
> >  Test module for pyverbs' mr module.
> >  """
> > @@ -9,9 +10,10 @@ import errno
> >
> >  from tests.base import PyverbsAPITestCase, RCResources, RDMATestCase
> > from pyverbs.pyverbs_error import PyverbsRDMAError, PyverbsError -from
> > pyverbs.mr import MR, MW, DMMR, MWBindInfo, MWBind
> > +from pyverbs.mr import MR, MW, DMMR, DmaBufMR, MWBindInfo, MWBind
> >  from pyverbs.qp import QPCap, QPInitAttr, QPAttr, QP  from pyverbs.wr
> > import SendWR
> > +from pyverbs.dmabuf import DmaBuf
> >  import pyverbs.device as d
> >  from pyverbs.pd import PD
> >  import pyverbs.enums as e
> > @@ -366,3 +368,238 @@ class DMMRTest(PyverbsAPITestCase):
> >                          dm_mr = DMMR(pd, dm_mr_len, e.IBV_ACCESS_ZERO_BASED,
> >                                       dm=dm, offset=dm_mr_offset)
> >                          dm_mr.close()
> > +
> > +
> > +def check_dmabuf_support():
> > +    """
> > +    Check if dma-buf allocation is supported by the system.
> > +    Skip the test on failure.
> > +    """
> > +    try:
> > +        DmaBuf(1)
> 
> Hardcoding gpu unit 1 here (and in other places) is probably not quite what we want. Not sure what you want to do in the test framework
> here instead.

'1' here is the buffer size. Unit is the default value 0. We could probably add a command line argument to the test to set the preferred gpu unit.

> 
> > +    except PyverbsRDMAError as ex:
> > +        if ex.error_code == errno.ENOENT:
> > +            raise unittest.SkipTest('Device /dev/dri/renderD* is not present')
> > +        if ex.error_code == errno.EACCES:
> > +            raise unittest.SkipTest('Lack of permission to access
> > + /dev/dri/renderD*')
> > +
> > +
> > +def check_dmabuf_mr_support(pd):
> > +    """
> > +    Check if dma-buf MR registration is supported by the driver.
> > +    Skip the test on failure
> > +    """
> > +    try:
> > +        DmaBufMR(pd, 1, 0)
> > +    except PyverbsRDMAError as ex:
> > +        if ex.error_code == errno.EOPNOTSUPP:
> > +            raise unittest.SkipTest('Reg dma-buf MR is not
> > +supported')
> > +
> > +
> > +class DmaBufMRTest(PyverbsAPITestCase):
> > +    """
> > +    Test various functionalities of the DmaBufMR class.
> > +    """
> > +    def test_dmabuf_reg_mr(self):
> > +        """
> > +        Test ibv_reg_dmabuf_mr()
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                flags = u.get_dmabuf_access_flags(ctx)
> > +                for f in flags:
> > +                    len = u.get_mr_length()
> > +                    for off in [0, len//2]:
> > +                        with DmaBufMR(pd, len, f, offset=off) as mr:
> > +                            pass
> > +
> > +    def test_dmabuf_dereg_mr(self):
> > +        """
> > +        Test ibv_dereg_mr() with DmaBufMR
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                flags = u.get_dmabuf_access_flags(ctx)
> > +                for f in flags:
> > +                    len = u.get_mr_length()
> > +                    for off in [0, len//2]:
> > +                        with DmaBufMR(pd, len, f, offset=off) as mr:
> > +                            mr.close()
> > +
> > +    def test_dmabuf_dereg_mr_twice(self):
> > +        """
> > +        Verify that explicit call to DmaBufMR's close() doesn't fail
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                flags = u.get_dmabuf_access_flags(ctx)
> > +                for f in flags:
> > +                    len = u.get_mr_length()
> > +                    for off in [0, len//2]:
> > +                        with DmaBufMR(pd, len, f, offset=off) as mr:
> > +                            # Pyverbs supports multiple destruction of objects,
> > +                            # we are not expecting an exception here.
> > +                            mr.close()
> > +                            mr.close()
> > +
> > +    def test_dmabuf_reg_mr_bad_flags(self):
> > +        """
> > +        Verify that illegal flags combination fails as expected
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                for i in range(5):
> > +                    flags = random.sample([e.IBV_ACCESS_REMOTE_WRITE,
> > +                                           e.IBV_ACCESS_REMOTE_ATOMIC],
> > +                                          random.randint(1, 2))
> > +                    mr_flags = 0
> > +                    for i in flags:
> > +                        mr_flags += i.value
> > +                    try:
> > +                        DmaBufMR(pd, u.get_mr_length(), mr_flags)
> > +                    except PyverbsRDMAError as err:
> > +                        assert 'Failed to register a dma-buf MR' in err.args[0]
> > +                    else:
> > +                        raise PyverbsRDMAError('Registered a dma-buf
> > + MR with illegal falgs')
> > +
> > +    def test_dmabuf_write(self):
> > +        """
> > +        Test writing to DmaBufMR's buffer
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                for i in range(10):
> > +                    mr_len = u.get_mr_length()
> > +                    flags = u.get_dmabuf_access_flags(ctx)
> > +                    for f in flags:
> > +                        for mr_off in [0, mr_len//2]:
> > +                            with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
> > +                                write_len = min(random.randint(1, MAX_IO_LEN),
> > +                                                mr_len)
> > +                                mr.write('a' * write_len, write_len)
> > +
> > +    def test_dmabuf_read(self):
> > +        """
> > +        Test reading from DmaBufMR's buffer
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                for i in range(10):
> > +                    mr_len = u.get_mr_length()
> > +                    flags = u.get_dmabuf_access_flags(ctx)
> > +                    for f in flags:
> > +                        for mr_off in [0, mr_len//2]:
> > +                            with DmaBufMR(pd, mr_len, f, offset=mr_off) as mr:
> > +                                write_len = min(random.randint(1, MAX_IO_LEN),
> > +                                                mr_len)
> > +                                write_str = 'a' * write_len
> > +                                mr.write(write_str, write_len)
> > +                                read_len = random.randint(1, write_len)
> > +                                offset = random.randint(0, write_len-read_len)
> > +                                read_str = mr.read(read_len, offset).decode()
> > +                                assert read_str in write_str
> > +
> > +    def test_dmabuf_lkey(self):
> > +        """
> > +        Test reading lkey property
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                length = u.get_mr_length()
> > +                flags = u.get_dmabuf_access_flags(ctx)
> > +                for f in flags:
> > +                    with DmaBufMR(pd, length, f) as mr:
> > +                        mr.lkey
> > +
> > +    def test_dmabuf_rkey(self):
> > +        """
> > +        Test reading rkey property
> > +        """
> > +        check_dmabuf_support()
> > +        for ctx, attr, attr_ex in self.devices:
> > +            with PD(ctx) as pd:
> > +                check_dmabuf_mr_support(pd)
> > +                length = u.get_mr_length()
> > +                flags = u.get_dmabuf_access_flags(ctx)
> > +                for f in flags:
> > +                    with DmaBufMR(pd, length, f) as mr:
> > +                        mr.rkey
> > +
> > +
> > +class DmaBufRC(RCResources):
> > +    def __init__(self, dev_name, ib_port, gid_index):
> > +        """
> > +        Initialize an DmaBufRC object.
> > +        :param dev_name: Device name to be used
> > +        :param ib_port: IB port of the device to use
> > +        :param gid_index: Which GID index to use
> > +        """
> > +        super(DmaBufRC, self).__init__(dev_name=dev_name, ib_port=ib_port,
> > +                                       gid_index=gid_index)
> > +
> > +    def create_mr(self):
> > +        check_dmabuf_support()
> > +        check_dmabuf_mr_support(self.pd)
> > +        access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
> > +        mr = DmaBufMR(self.pd, self.msg_size, access)
> > +        self.mr = mr
> > +
> > +    def create_qp_attr(self):
> > +        qp_attr = QPAttr(port_num=self.ib_port)
> > +        qp_access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
> > +        qp_attr.qp_access_flags = qp_access
> > +        return qp_attr
> > +
> > +
> > +class DmaBufTestCase(RDMATestCase):
> > +    def setUp(self):
> > +        super(DmaBufTestCase, self).setUp()
> > +        self.iters = 100
> > +
> > +    def create_players(self, resource, **resource_arg):
> > +        """
> > +        Init dma-buf tests resources.
> > +        :param resource: The RDMA resources to use. A class of type
> > +                         BaseResources.
> > +        :param resource_arg: Dict of args that specify the resource specific
> > +                             attributes.
> > +        :return: The (client, server) resources.
> > +        """
> > +        client = resource(**self.dev_info, **resource_arg)
> > +        server = resource(**self.dev_info, **resource_arg)
> > +        client.pre_run(server.psns, server.qps_num)
> > +        server.pre_run(client.psns, client.qps_num)
> > +        return client, server
> > +
> > +    def test_dmabuf_rc_traffic(self):
> > +        """
> > +        Test send/recv using dma-buf MR over RC
> > +        """
> > +        client, server = self.create_players(DmaBufRC)
> > +        u.traffic(client, server, self.iters, self.gid_index,
> > + self.ib_port)
> > +
> > +    def test_dmabuf_rdma_traffic(self):
> > +        """
> > +        Test rdma write using dma-buf MR
> > +        """
> > +        client, server = self.create_players(DmaBufRC)
> > +        server.rkey = client.mr.rkey
> > +        server.remote_addr = client.mr.offset
> > +        client.rkey = server.mr.rkey
> > +        client.remote_addr = server.mr.offset
> > +        u.rdma_traffic(client, server, self.iters, self.gid_index, self.ib_port,
> > +                       send_op=e.IBV_WR_RDMA_WRITE)
> > diff --git a/tests/utils.py b/tests/utils.py index 7039f41..d3d5c16
> > 100644
> > --- a/tests/utils.py
> > +++ b/tests/utils.py
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)  # Copyright (c)
> > 2019 Mellanox Technologies, Inc. All rights reserved.  See COPYING
> > file
> > +# Copyright (c) 2020 Intel Corporation. All rights reserved. See
> > +COPYING file
> >  """
> >  Provide some useful helper function for pyverbs' tests.
> >  """
> > @@ -94,6 +95,31 @@ def get_access_flags(ctx):
> >      return arr
> >
> >
> > +def get_dmabuf_access_flags(ctx):
> > +    """
> > +    Similar to get_access_flags, except that dma-buf MR only support
> > +    a subset of the flags.
> > +    :param ctx: Device Context to check capabilities
> > +    :return: A random legal value for MR flags
> > +    """
> > +    attr = ctx.query_device()
> > +    vals = [e.IBV_ACCESS_LOCAL_WRITE, e.IBV_ACCESS_REMOTE_WRITE,
> > +            e.IBV_ACCESS_REMOTE_READ, e.IBV_ACCESS_REMOTE_ATOMIC,
> > +            e.IBV_ACCESS_RELAXED_ORDERING]
> > +    if not attr.atomic_caps & e.IBV_ATOMIC_HCA:
> > +        vals.remove(e.IBV_ACCESS_REMOTE_ATOMIC)
> > +    arr = []
> > +    for i in range(1, len(vals)):
> > +        tmp = list(com(vals, i))
> > +        tmp = filter(filter_illegal_access_flags, tmp)
> > +        for t in tmp:  # Iterate legal combinations and bitwise OR them
> > +            val = 0
> > +            for flag in t:
> > +                val += flag.value
> > +            arr.append(val)
> > +    return arr
> > +
> > +
> >  def get_dm_attrs(dm_len):
> >      """
> >      Initializes an AllocDmAttr member with the given length and
> > random
> > --
> > 1.8.3.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
