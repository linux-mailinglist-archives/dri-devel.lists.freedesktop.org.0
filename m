Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817FB29766E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 20:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B126E3D0;
	Fri, 23 Oct 2020 18:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33A66E3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 18:09:41 +0000 (UTC)
IronPort-SDR: dMusoSINKdKXyjqlMS1GuS8qD6dTtRCjRf0LcBd+PScSkrIdpuB8X2g00nwarVUs+g8eWXd5CG
 qyR94jv5dstw==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="167835354"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="167835354"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 11:09:41 -0700
IronPort-SDR: Y2JifhIOwsMBU/Uto3bC7wawK+LnUoceM+93l0GlQH5OU2VZnrmZwuwwm1SLLscNnEHiH6NDlC
 xg8t9UYzQebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="524757922"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2020 11:09:40 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Oct 2020 11:09:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Oct 2020 11:09:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Oct 2020 11:09:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 23 Oct 2020 11:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBfneUtqOYEufEgW4D0IIn/0m9ftHiT9K5tr68oDt7e+b2XHXwevv2MKUn7jtm4OzbHih4XztOAB+TjSw4FZJkKEhMzhip0cZy2SeBFzAYJIh6UlwFoR7GyM1U0lNETpfzDH7hky2q0/an9G27vmoilyzzM5RplpJZyxooPDBykYaWPRkFoO/lW7yN0RxW3+jxVD8FkfulsVmCkwt50BjCKDZt7kfs04NV9SuumiNUTgz0DCmlkgGjmQI/eWn9SlQpwAtOZ4sDMKtqswb318KiS8oRY+fCLfsAZ3KVrNLVPgiU/w1jT9Xdq8QeMcUnRkDR+xtWb0BZfoeEreUUdH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBKHOT3j/7RWpGgoHr2gZPYXNlAaA7/PkgfInqVCnBg=;
 b=G3qzSAlaZ5Jgda7k2GnCVb8LHOU+hsFAAb2topyjFfB36nRyt3pk9F3MFxOcUqL2loz/y7alumRfMLPcV+rnPVnIm4dK04cfo+Awdym7ousZ76PyKMy25sTG4rVw0zS9sSxY75AD1sZTPxTb2VEjos/msTbpJCr84HmS4sXZ0iL49zemEa1nFe24W8Xpqn6sRrgPOwuIzcpnI5GLvi4EFEZP9dUNprCFzI5UfOB0Oeh4/HBxA0SK9a5jQvkwGEwmmtoqZGgGIYShtF6wJsVoXRiesmcH7YG8BPNn53WQrYrKeHHV/3jIF6ogXHyMDUl0YCIHJggFRtEv2DP/GVQpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBKHOT3j/7RWpGgoHr2gZPYXNlAaA7/PkgfInqVCnBg=;
 b=vgnQiUIQxMvwCfQa7A14QlW7Bsp6CUBkd3tpYn0EfxGhHRyC73BjE4VhEpbILa3NUFu9/Jj766Hszm2Qefz1WeQKsDdWhhj5JVE3m/7NzYzJdZSJQVGXDW+VqHYrAOC2isPMY1IpuP0BpY74VBYJJpKYQ6JZmC/9g6hy2lA/nZo=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 23 Oct
 2020 18:09:37 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.029; Fri, 23 Oct 2020
 18:09:37 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWqVlE332Lg1o1rU+Qqd8CQ3VTXKmlZiqAgAAP3lA=
Date: Fri, 23 Oct 2020 18:09:37 +0000
Message-ID: <MW3PR11MB4555B89D76DD99B86270183AE51A0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
In-Reply-To: <20201023164911.GF401619@phenom.ffwll.local>
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
x-ms-office365-filtering-correlation-id: d47bf08d-511f-4b00-42fb-08d8777ecde5
x-ms-traffictypediagnostic: MWHPR1101MB2190:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21903E20E7AE3B1057ED1DE9E51A0@MWHPR1101MB2190.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cANN8RYkyB6bCULkz3w2ImZ9C1HSr49RbXAasaWSPg4XhJWzkwS+kxt6WJdVvARdSlAW0X17pLkdoPTDF2/uUiCh5uzUEtVTkgv6+adHjyZ4quynSO2h9nU/xjBAKlkBCmR+RXJA5NdpIvk5VDbxduNgTQsBNG0rcuWUpGE+F4m4zdSL/Ybcs8Fxhaaq3wA6fLuqnMrFD22pgjWjpgYJKjIMfRkVtF1Kk/0yaEfODtyVoWbmkT7nCVCInknX1VsxVcy7GHjyQHhu1a2hKRizNRGl71Ogx+JPvTRcesZVpndlnna3SQkWB9bEHQpP2adrK4XThH76P5I4ECsJ9iKq93kybl+WkP5G4fBZdzdrBqxUTd8d09zhBG4jLogAcAWE4KZGUa1gciWEo7JH2ZfEoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(966005)(8676002)(55016002)(6506007)(4326008)(66556008)(478600001)(186003)(53546011)(26005)(64756008)(66476007)(8936002)(76116006)(66446008)(5660300002)(7696005)(30864003)(83380400001)(9686003)(52536014)(86362001)(6916009)(66946007)(2906002)(71200400001)(316002)(54906003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: saynmquE0njxrWwTKwd+uChRT34LXaeCWatBFSvmH1YMQzfZOH/BSvZTPsRjGwI4taZhxMR+eXSNSYfiRtHQbqwjc2G1kghLL8iEF/ARxzamOD6wOf5SLzHTWeT4HHZ/c0vdlQPJfLNKk5O/OpkQ/jNM1IOLOkEDqJjXQgXM2bOGriLUGY6zG7C57OxVlh7yUDa9T7nUYVkcVDJBfi5uJTDXjYCItZtkkQJdrhtDAZjy969qP8/wKoEK4w9450dD68lZZdNETtubvdRVMC1mWIZ5fFQ/otLWtkjDQ9cyvK03uP/geTX5KX3HHEVURrZXCF9bk0Q9lnGaE0JTVQwoNO/K18wXGZxpXvHRSGG42BwWY8mue6RGZr51X58rfpODG08roPS+EM2HKG+H6AlamYRzXDvsFJa2vWYWu5eNMwf4EFtMQRGY22p6D+1f4rHzb82dQCghgp8zTsLs9Jyt9Psv2qgWkZd9T0FN3GXq5vkqXL2k7ESwDfjqc6w2bj0XbBFokjaGaoVcpFK3osqS1ZxFyiX5rvDZghWh0wNViKg+MxcuAsP//u5UaRM/e1NZl94YA627LZJsWd6G6VArF8Jnk34IijOl+9COnu4JWrVvUNSsXAAAIiBqDuAah/I6gSOLMg+mB/TFiY2pCq/P3Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47bf08d-511f-4b00-42fb-08d8777ecde5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 18:09:37.5758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdGj+vsUp0KgLk0XkNOF+tTxQ4r2SENcJ9ljSzdxvce54oZ0roj27ym7jivcOsj21FF2C8bmhyl8mv0eOKkQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
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
> Sent: Friday, October 23, 2020 9:49 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Leon Romanovsky <leon@kernel.org>; Jason Gunthorpe <jgg@ziepe.ca>;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Fri, Oct 23, 2020 at 09:39:58AM -0700, Jianxin Xiong wrote:
> > Dma-buf is a standard cross-driver buffer sharing mechanism that can
> > be used to support peer-to-peer access from RDMA devices.
> >
> > Device memory exported via dma-buf is associated with a file descriptor.
> > This is passed to the user space as a property associated with the
> > buffer allocation. When the buffer is registered as a memory region,
> > the file descriptor is passed to the RDMA driver along with other
> > parameters.
> >
> > Implement the common code for importing dma-buf object and mapping
> > dma-buf pages.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Acked-by: Christian Koenig <christian.koenig@amd.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/infiniband/core/Makefile      |   2 +-
> >  drivers/infiniband/core/umem.c        |   4 +
> >  drivers/infiniband/core/umem_dmabuf.c | 197
> > ++++++++++++++++++++++++++++++++++
> >  drivers/infiniband/core/umem_dmabuf.h |  11 ++
> >  include/rdma/ib_umem.h                |  35 +++++-
> >  5 files changed, 247 insertions(+), 2 deletions(-)  create mode
> > 100644 drivers/infiniband/core/umem_dmabuf.c
> >  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
> >
> > diff --git a/drivers/infiniband/core/Makefile
> > b/drivers/infiniband/core/Makefile
> > index ccf2670..8ab4eea 100644
> > --- a/drivers/infiniband/core/Makefile
> > +++ b/drivers/infiniband/core/Makefile
> > @@ -40,5 +40,5 @@ ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
> >  				uverbs_std_types_srq.o \
> >  				uverbs_std_types_wq.o \
> >  				uverbs_std_types_qp.o
> > -ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o
> > +ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o umem_dmabuf.o
> >  ib_uverbs-$(CONFIG_INFINIBAND_ON_DEMAND_PAGING) += umem_odp.o diff
> > --git a/drivers/infiniband/core/umem.c
> > b/drivers/infiniband/core/umem.c index e9fecbd..2c45525 100644
> > --- a/drivers/infiniband/core/umem.c
> > +++ b/drivers/infiniband/core/umem.c
> > @@ -2,6 +2,7 @@
> >   * Copyright (c) 2005 Topspin Communications.  All rights reserved.
> >   * Copyright (c) 2005 Cisco Systems.  All rights reserved.
> >   * Copyright (c) 2005 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> >   *
> >   * This software is available to you under a choice of one of two
> >   * licenses.  You may choose to be licensed under the terms of the
> > GNU @@ -43,6 +44,7 @@  #include <rdma/ib_umem_odp.h>
> >
> >  #include "uverbs.h"
> > +#include "umem_dmabuf.h"
> >
> >  static void __ib_umem_release(struct ib_device *dev, struct ib_umem
> > *umem, int dirty)  { @@ -269,6 +271,8 @@ void ib_umem_release(struct
> > ib_umem *umem)  {
> >  	if (!umem)
> >  		return;
> > +	if (umem->is_dmabuf)
> > +		return ib_umem_dmabuf_release(to_ib_umem_dmabuf(umem));
> >  	if (umem->is_odp)
> >  		return ib_umem_odp_release(to_ib_umem_odp(umem));
> >
> > diff --git a/drivers/infiniband/core/umem_dmabuf.c
> > b/drivers/infiniband/core/umem_dmabuf.c
> > new file mode 100644
> > index 0000000..66b234d
> > --- /dev/null
> > +++ b/drivers/infiniband/core/umem_dmabuf.c
> > @@ -0,0 +1,197 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +/*
> > + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-resv.h>
> > +#include <linux/dma-mapping.h>
> > +
> > +#include "uverbs.h"
> > +#include "umem_dmabuf.h"
> > +
> > +/*
> > + * Generate a new dma sg list from a sub range of an existing dma sg list.
> > + * Both the input and output have their entries page aligned.
> > + */
> > +static int ib_umem_dmabuf_sgt_slice(struct sg_table *sgt, u64 offset,
> > +				    u64 length, struct sg_table *new_sgt) {
> > +	struct scatterlist *sg, *new_sg;
> > +	u64 start, end, off, addr, len;
> > +	unsigned int new_nents;
> > +	int err;
> > +	int i;
> > +
> > +	start = ALIGN_DOWN(offset, PAGE_SIZE);
> > +	end = ALIGN(offset + length, PAGE_SIZE);
> > +
> > +	offset = start;
> > +	length = end - start;
> > +	new_nents = 0;
> > +	for_each_sgtable_dma_sg(sgt, sg, i) {
> > +		len = sg_dma_len(sg);
> > +		off = min(len, offset);
> > +		len -= off;
> > +		len = min(len, length);
> > +		if (len)
> > +			new_nents++;
> > +		length -= len;
> > +		offset -= off;
> > +	}
> > +
> > +	err = sg_alloc_table(new_sgt, new_nents, GFP_KERNEL);
> > +	if (err)
> > +		return err;
> > +
> > +	offset = start;
> > +	length = end - start;
> > +	new_sg = new_sgt->sgl;
> > +	for_each_sgtable_dma_sg(sgt, sg, i) {
> > +		addr = sg_dma_address(sg);
> > +		len = sg_dma_len(sg);
> > +		off = min(len, offset);
> > +		addr += off;
> > +		len -= off;
> > +		len = min(len, length);
> > +		if (len) {
> > +			sg_dma_address(new_sg) = addr;
> > +			sg_dma_len(new_sg) = len;
> > +			new_sg = sg_next(new_sg);
> > +		}
> > +		length -= len;
> > +		offset -= off;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf) {
> > +	struct sg_table *sgt;
> > +	struct dma_fence *fence;
> > +	int err;
> > +
> > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> > +				     DMA_BIDIRECTIONAL);
> > +
> > +	if (IS_ERR(sgt))
> > +		return PTR_ERR(sgt);
> > +
> > +	err = ib_umem_dmabuf_sgt_slice(sgt, umem_dmabuf->umem.address,
> > +				       umem_dmabuf->umem.length,
> > +				       &umem_dmabuf->umem.sg_head);
> > +	if (err) {
> > +		dma_buf_unmap_attachment(umem_dmabuf->attach, sgt,
> > +					 DMA_BIDIRECTIONAL);
> > +		return err;
> > +	}
> > +
> > +	umem_dmabuf->umem.nmap = umem_dmabuf->umem.sg_head.nents;
> > +	umem_dmabuf->sgt = sgt;
> > +
> > +	/*
> > +	 * Although the sg list is valid now, the content of the pages
> > +	 * may be not up-to-date. Wait for the exporter to finish
> > +	 * the migration.
> > +	 */
> > +	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> > +	if (fence)
> > +		dma_fence_wait(fence, false);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> > +
> > +void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf) {
> > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	if (!umem_dmabuf->sgt)
> > +		return;
> > +
> > +	sg_free_table(&umem_dmabuf->umem.sg_head);
> > +	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> > +				 DMA_BIDIRECTIONAL);
> > +	umem_dmabuf->sgt = NULL;
> > +}
> > +EXPORT_SYMBOL(ib_umem_dmabuf_unmap_pages);
> > +
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
> > +
> > +	if (unlikely(!ops || !ops->move_notify))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +#ifdef CONFIG_DMA_VIRT_OPS
> > +	if (device->dma_device->dma_ops == &dma_virt_ops)
> > +		return ERR_PTR(-EINVAL);
> > +#endif
> 
> Maybe I'm confused, but should we have this check in dma_buf_attach, or at least in dma_buf_dynamic_attach? The p2pdma functions use
> that too, and I can't imagine how zerocopy should work (which is like the entire point of
> dma-buf) when we have dma_virt_ops.
> 
> A similar problem exists for swiotlb bounce buffers, not sure how that's solved.
> -Daniel
> 

This is also checked by dma_buf_dynamic_attach(), not in the common code, but
in the exporter's attach() method. For example, the attach method of 'amdgpu' calls p2pdma_distance_many and would disable p2p if dma_virt_ops is detected.

Here we could instead check the peer2peer flag from the returned 'attach' structure.
 
> > +
> > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > +	if (!umem_dmabuf)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	umem = &umem_dmabuf->umem;
> > +	umem->ibdev = device;
> > +	umem->length = size;
> > +	umem->address = offset;
> > +	umem->iova = offset;
> > +	umem->writable = ib_access_writable(access);
> > +	umem->is_dmabuf = 1;
> > +
> > +	dmabuf = dma_buf_get(fd);
> > +	if (IS_ERR(dmabuf)) {
> > +		ret = PTR_ERR(dmabuf);
> > +		goto out_free_umem;
> > +	}
> > +
> > +	umem_dmabuf->attach = dma_buf_dynamic_attach(
> > +					dmabuf,
> > +					device->dma_device,
> > +					ops,
> > +					umem_dmabuf);
> > +	if (IS_ERR(umem_dmabuf->attach)) {
> > +		ret = PTR_ERR(umem_dmabuf->attach);
> > +		goto out_release_dmabuf;
> > +	}
> > +
> > +	return umem;
> > +
> > +out_release_dmabuf:
> > +	dma_buf_put(dmabuf);
> > +
> > +out_free_umem:
> > +	kfree(umem_dmabuf);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(ib_umem_dmabuf_get);
> > +
> > +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf) {
> > +	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
> > +
> > +	dma_resv_lock(dmabuf->resv, NULL);
> > +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> > +	dma_resv_unlock(dmabuf->resv);
> > +
> > +	dma_buf_detach(dmabuf, umem_dmabuf->attach);
> > +	dma_buf_put(dmabuf);
> > +	kfree(umem_dmabuf);
> > +}
> > diff --git a/drivers/infiniband/core/umem_dmabuf.h
> > b/drivers/infiniband/core/umem_dmabuf.h
> > new file mode 100644
> > index 0000000..13acf55
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
> > diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h index
> > 7059750..73a7b19 100644
> > --- a/include/rdma/ib_umem.h
> > +++ b/include/rdma/ib_umem.h
> > @@ -1,6 +1,7 @@
> >  /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
> >  /*
> >   * Copyright (c) 2007 Cisco Systems.  All rights reserved.
> > + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
> >   */
> >
> >  #ifndef IB_UMEM_H
> > @@ -13,6 +14,7 @@
> >
> >  struct ib_ucontext;
> >  struct ib_umem_odp;
> > +struct dma_buf_attach_ops;
> >
> >  struct ib_umem {
> >  	struct ib_device       *ibdev;
> > @@ -22,12 +24,25 @@ struct ib_umem {
> >  	unsigned long		address;
> >  	u32 writable : 1;
> >  	u32 is_odp : 1;
> > +	u32 is_dmabuf : 1;
> >  	struct work_struct	work;
> >  	struct sg_table sg_head;
> >  	int             nmap;
> >  	unsigned int    sg_nents;
> >  };
> >
> > +struct ib_umem_dmabuf {
> > +	struct ib_umem umem;
> > +	struct dma_buf_attachment *attach;
> > +	struct sg_table *sgt;
> > +	void *device_context;
> > +};
> > +
> > +static inline struct ib_umem_dmabuf *to_ib_umem_dmabuf(struct ib_umem
> > +*umem) {
> > +	return container_of(umem, struct ib_umem_dmabuf, umem); }
> > +
> >  /* Returns the offset of the umem start relative to the first page.
> > */  static inline int ib_umem_offset(struct ib_umem *umem)  { @@ -79,6
> > +94,12 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem,
> > size_t offset,  unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
> >  				     unsigned long pgsz_bitmap,
> >  				     unsigned long virt);
> > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +				   unsigned long offset, size_t size,
> > +				   int fd, int access,
> > +				   const struct dma_buf_attach_ops *ops); int
> > +ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf); void
> > +ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf);
> >
> >  #else /* CONFIG_INFINIBAND_USER_MEM */
> >
> > @@ -101,7 +122,19 @@ static inline unsigned long
> > ib_umem_find_best_pgsz(struct ib_umem *umem,  {
> >  	return 0;
> >  }
> > +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +						 unsigned long offset,
> > +						 size_t size, int fd,
> > +						 int access,
> > +						 struct dma_buf_attach_ops *ops) {
> > +	return ERR_PTR(-EINVAL);
> > +}
> > +static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf
> > +*umem_dmabuf) {
> > +	return -EINVAL;
> > +}
> > +static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf
> > +*umem_dmabuf) { }
> >
> >  #endif /* CONFIG_INFINIBAND_USER_MEM */
> > -
> >  #endif /* IB_UMEM_H */
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
