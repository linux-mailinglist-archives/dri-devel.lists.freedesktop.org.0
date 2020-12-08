Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF22D31DA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 19:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A06E998;
	Tue,  8 Dec 2020 18:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A1B6E998
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:13:53 +0000 (UTC)
IronPort-SDR: dhieKbJo/ZazlbFCcUSDSKzCuSPI0bUZ732nKV59wLYhKbQ7TDsRXv51PGt3/3clN28ls6ewTW
 5NRUqH40tzqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="170434087"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="170434087"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 10:13:52 -0800
IronPort-SDR: LPjPxyfDptVueB+PIjRURjp5QOP+9wMiQQ3RHupOqtfPHFRDXvVKwzBMGFy3k/sSRW88hFkvRa
 7XxS0O3tf7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="337693066"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 08 Dec 2020 10:13:52 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 8 Dec 2020 10:13:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 8 Dec 2020 10:13:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 8 Dec 2020 10:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH95WbaJR6RtzsCWQn6mO3Zjv+t4LXtN1fCuokilqgTUjIQM6PxYAFi+QxtMPPCAECtzKf1Leeo3w5qvL7GNSaT4AjyUw52+4lQAba05B8/jBWb8yscMMsLRfLiJEzHqNHZlDKH+bEsiWulLuwIyDDXVsnVYAikjV/4owNSWxwo3g8M0AFshQ8XnYVcgI6KWPe8AV51pnW/wZU0oliz5I1ynotSn4oXUTZsEAB5pN7//aWeBuEM4wsH+F6KqaFcMg51Ay452XF8jAhtVqwl/n7KHsd9CSN2v9lO+/WEi6tFmwY56N0GOE/s5SuRJwx3bBzmlIz1XvA4wvw1SbUMFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4JU0qdV9eugGEmq6d/YIvJ4Ixa6Py48VSCGyB9Eao0=;
 b=mJT5DpnOb4ScDb2AgiVAxX7M3GTcFQ+Crf3igh4VUK7YON4VBnE4I/7dQTb0kkfaC6XF2xMPEgfNrGkaOvTp62KfHGzAWusG8gDzTAOVofHZtJY/D19gwhygEWxyKtpDsmWcE/W/9a8pV/sVEb0cKzdMRnWImZMqV1qUh8gVwbbD86X86EL9DrhNj2OqzgpvkK1NBz8aZDXTuZFZrNkd8x2IeO7lcwgFwVyRpebNPmIgdqWYyI/siOkND65fRqhF0Ejil9DeB8TAA36epxrVScuJA/raP5OLkA7Ase8YFIdT48fOqK8xRUoCipAnixsjipcYiMmf9gJLbJvgJ9SJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4JU0qdV9eugGEmq6d/YIvJ4Ixa6Py48VSCGyB9Eao0=;
 b=QiMXI4D568Kkk99jFI1GNIDYUmuuMOe1XlBYzlY9srLHEpEEZ9d3boWWmGWNnmPIYtvZAbtOPCG2sIeG4v6TJ/4943W0MmcvuRSmJfyyOilD4dLePqX49UxU6xI2JpHEZL4/iqQTMomprWmTN0ehc1JhuzVrn7PPT5y/SO0ed1A=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1440.namprd11.prod.outlook.com (2603:10b6:301:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 18:13:20 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 18:13:20 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWzORzAl0zVkuiI06perwGejvid6nsx0AAgACvZRA=
Date: Tue, 8 Dec 2020 18:13:20 +0000
Message-ID: <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
 <20201208070532.GE4430@unreal>
In-Reply-To: <20201208070532.GE4430@unreal>
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
x-ms-office365-filtering-correlation-id: 0afe62f6-8b95-48c2-1476-08d89ba4f1f4
x-ms-traffictypediagnostic: MWHPR11MB1440:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB144039EB4056F76D2E8A318DE5CD0@MWHPR11MB1440.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSfciRr3/y4tbfOebIbY335QLzCXon6DMmOl7quzHPFa7V0YakPa6ZdGnM9/xQd8f3nGCXJ4VDVpXt58CiG3hBqcGkZCSOCpLaf9Wytta8AFqVs7A2C0KPaawHAcHSzl6qEHuj2E1ff2NNlTXUwoMhNS6b2ciQYZL3c2OLbE5n2AIYe2dGxlDAjDjzDh+fgYWIGbFfT6TTU75s/+f6/lY8e4EHDmQsyaYCRj1YZHHsZHIvxyPELztwomaU2IHOKIJMvNJSBOAe9bfa0S6TnMiPeyC1Z8jU5/hTMXP9ki3yRdJEn4Y4zsR5W7XIEitFByUPtGsGEH0BfnHABbfs0QFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(66446008)(107886003)(66946007)(66556008)(66476007)(52536014)(508600001)(5660300002)(4326008)(71200400001)(64756008)(26005)(186003)(33656002)(83380400001)(2906002)(30864003)(86362001)(6506007)(7696005)(53546011)(8676002)(76116006)(9686003)(55016002)(54906003)(8936002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vkUVLutq6pkY5A8JKZTOwJMIsVeATA61aiERc2gxlrX7ED0bywnN3sbQ7Atl?=
 =?us-ascii?Q?uY04ppvNR/scX3T9lqsDsa/myL/myMCrW0ipUdadodCZ0XY+ZJ5JBz8a0BDa?=
 =?us-ascii?Q?NOjOhLIqADDnahBVa4Zhm3tO+ze04un/DRX38IrIngureuF7KlZxICPYRpNF?=
 =?us-ascii?Q?iBBLTOpSqi+8+kXm4n9nx5ndHW4UjaaVzxncI6NAxYleBLypTs++yzsc98Eh?=
 =?us-ascii?Q?kLTKkisecuY7CAdn7QD2h9TupgLhx2F0YEtYLHYcJMF4sro9dKIxgtrfcVPh?=
 =?us-ascii?Q?dEizIJlWJo+iPqKVuB0M36PHrxu+NyuIC4zyf5qsrWLjUw7QlhE3RxoA7+7V?=
 =?us-ascii?Q?7+XEX5bQFjbNls57jt96j3zC3QIbo8iPSx42eCprt+EQqt1+UZ4lg1OD6J1b?=
 =?us-ascii?Q?SAq0wmCClX35mchebsg5ieBeKmi+/XxTvEC7OBzVEvtTImv/nALBQ+9VoSsG?=
 =?us-ascii?Q?3fm2iZa5/tigvHGeCDCIYklMEHvGVjzta0X3eB8/Ax87OJCEaupdWvZ/ibQo?=
 =?us-ascii?Q?eZFGmbD5n5fs9w4YoU4qmH4hwidnSmzjJNIItMt2sfsIjepIeLOMwHNq8gaj?=
 =?us-ascii?Q?9kMLgu2YHfg4aiVOIvDCJSb9Ww32QsXCbnC+pY9+tC51JuvKhP2R1Od17jdI?=
 =?us-ascii?Q?Y6JfTBDKJcS/eibSCQVT4Jq6d8zj412PHpStg+6L2AnYlCI8gk0JuHL7mhjM?=
 =?us-ascii?Q?uf/mzopAs0frYjXUZAX3UdrmtbMOOy47bjGXjcoke4mevoQehE/owwrHRCIM?=
 =?us-ascii?Q?YGp36EqhKxk3E5mEpEi0rvchB/40tpjuZM6ezVD0KVAXYvlpvcpsoTbf3WhB?=
 =?us-ascii?Q?yODUtYqvXtYrX9wk3QQ0HfRzA30r9zCOIiU0ZHcge0hQmygLoR5iuvQB2dmy?=
 =?us-ascii?Q?TRXwKi0VfA9nno39hxwdJx6RGoAYrld+5tbYM2UayMDe9sgGhWDD8pkzKUwn?=
 =?us-ascii?Q?s7EyYaURB3RMMIF+JCps7bQ/j1JZZ34eCMVDBh2Ra1I=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afe62f6-8b95-48c2-1476-08d89ba4f1f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 18:13:20.7967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzisujAiD2H1G/dOwIAfZpgSIeM9AblgeEMWkljCjAD2s4qMZVEZ3gKC48omszm7jSB74Rbo8zme5ju978eOKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1440
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Leon Romanovsky <leon@kernel.org>
> Sent: Monday, December 07, 2020 11:06 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Mon, Dec 07, 2020 at 02:15:50PM -0800, Jianxin Xiong wrote:
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
> >
> > Conflicts:
> > 	include/rdma/ib_umem.h
> 
> This probably leftover from rebase, am I right?
> 
> > ---
> >  drivers/infiniband/core/Makefile      |   2 +-
> >  drivers/infiniband/core/umem.c        |   3 +
> >  drivers/infiniband/core/umem_dmabuf.c | 173 ++++++++++++++++++++++++++++++++++
> >  include/rdma/ib_umem.h                |  43 ++++++++-
> >  4 files changed, 219 insertions(+), 2 deletions(-)  create mode
> > 100644 drivers/infiniband/core/umem_dmabuf.c
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
> > b/drivers/infiniband/core/umem.c index 7ca4112..cc131f8 100644
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
> > GNU @@ -278,6 +279,8 @@ void ib_umem_release(struct ib_umem *umem)  {
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
> > index 0000000..e50b955
> > --- /dev/null
> > +++ b/drivers/infiniband/core/umem_dmabuf.c
> > @@ -0,0 +1,173 @@
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
> > +
> > +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf) {
> > +	struct sg_table *sgt;
> > +	struct scatterlist *sg;
> > +	struct dma_fence *fence;
> > +	unsigned long start, end, cur;
> > +	unsigned int nmap;
> > +	int i;
> > +
> > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	if (umem_dmabuf->sgt)
> > +		return 0;
> > +
> > +	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
> > +	if (IS_ERR(sgt))
> > +		return PTR_ERR(sgt);
> > +
> > +	/* modify the sg list in-place to match umem address and length */
> > +
> > +	start = ALIGN_DOWN(umem_dmabuf->umem.address, PAGE_SIZE);
> > +	end = ALIGN(umem_dmabuf->umem.address + umem_dmabuf->umem.length,
> > +		    PAGE_SIZE);
> > +	cur = 0;
> > +	nmap = 0;
> 
> Better to put as part of variable initialization.

Sure, can change that way.

> 
> > +	for_each_sgtable_dma_sg(sgt, sg, i) {
> > +		if (start < cur + sg_dma_len(sg) && cur < end)
> > +			nmap++;
> > +		if (cur <= start && start < cur + sg_dma_len(sg)) {
> > +			unsigned long offset = start - cur;
> > +
> > +			umem_dmabuf->first_sg = sg;
> > +			umem_dmabuf->first_sg_offset = offset;
> > +			sg_dma_address(sg) += offset;
> > +			sg_dma_len(sg) -= offset;
> > +			cur += offset;
> > +		}
> > +		if (cur < end && end <= cur + sg_dma_len(sg)) {
> > +			unsigned long trim = cur + sg_dma_len(sg) - end;
> > +
> > +			umem_dmabuf->last_sg = sg;
> > +			umem_dmabuf->last_sg_trim = trim;
> > +			sg_dma_len(sg) -= trim;
> > +			break;
> > +		}
> > +		cur += sg_dma_len(sg);
> > +	}
> > +
> > +	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
> > +	umem_dmabuf->umem.sg_head.nents = nmap;
> > +	umem_dmabuf->umem.nmap = nmap;
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
> 
> Any reason do not check return result from dma_fence_wait()?

This is called with interruptible flag set to false and normally should only return 0.
I do see similar usage cases that check the result and don't check the result. Maybe
we can add a WARN_ON here?   

> 
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
> > +	/* retore the original sg list */
> > +	if (umem_dmabuf->first_sg) {
> > +		sg_dma_address(umem_dmabuf->first_sg) -=
> > +			umem_dmabuf->first_sg_offset;
> > +		sg_dma_len(umem_dmabuf->first_sg) +=
> > +			umem_dmabuf->first_sg_offset;
> > +		umem_dmabuf->first_sg = NULL;
> > +		umem_dmabuf->first_sg_offset = 0;
> > +	}
> > +	if (umem_dmabuf->last_sg) {
> > +		sg_dma_len(umem_dmabuf->last_sg) +=
> > +			umem_dmabuf->last_sg_trim;
> > +		umem_dmabuf->last_sg = NULL;
> > +		umem_dmabuf->last_sg_trim = 0;
> > +	}
> > +
> > +	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> > +				 DMA_BIDIRECTIONAL);
> > +
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
> > +	long ret = -EINVAL;
> 
> It is wrong type for the returned value. One of the possible options is to declare "struct ib_umem *ret;" and set ret = ERR_PTR(-EINVAL) or
> ret = ERR_CAST(dmabuf);

At the actual point the value is returned, ERR_PTR(ret) is used. I think we can change the 
variable name to "err" instead to avoid confusion.

> 
> > +
> > +	if (check_add_overflow(offset, (unsigned long)size, &end))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(!ops || !ops->move_notify))
> 
> Let's not put likely/unlikely in control paths.
> 
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	dmabuf = dma_buf_get(fd);
> > +	if (IS_ERR(dmabuf))
> > +		return (void *)dmabuf;
> 
> return ERR_CAST(dmabuf);

Will fix.

> 
> > +
> > +	if (dmabuf->size < end)
> > +		goto out_release_dmabuf;
> > +
> > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > +	if (!umem_dmabuf)
> > +		return ERR_PTR(-ENOMEM);
> 
> You are leaking dmabuf here, forgot to call to dma_buf_put();

Will fix.

> 
> > +
> > +	umem = &umem_dmabuf->umem;
> > +	umem->ibdev = device;
> > +	umem->length = size;
> > +	umem->address = offset;
> > +	umem->writable = ib_access_writable(access);
> > +	umem->is_dmabuf = 1;
> > +
> > +	if (unlikely(!ib_umem_num_pages(umem)))
> 
> There is no advantage in "unlikely" here.

Ok.

> 
> > +		goto out_free_umem;
> > +
> > +	umem_dmabuf->attach = dma_buf_dynamic_attach(
> > +					dmabuf,
> > +					device->dma_device,
> > +					ops,
> > +					umem_dmabuf);
> > +	if (IS_ERR(umem_dmabuf->attach)) {
> > +		ret = PTR_ERR(umem_dmabuf->attach);
> > +		goto out_free_umem;
> > +	}
> > +	return umem;
> > +
> > +out_free_umem:
> > +	kfree(umem_dmabuf);
> > +
> > +out_release_dmabuf:
> > +	dma_buf_put(dmabuf);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(ib_umem_dmabuf_get);
> > +
> > +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf) {
> > +	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
> > +
> > +	dma_buf_detach(dmabuf, umem_dmabuf->attach);
> > +	dma_buf_put(dmabuf);
> > +	kfree(umem_dmabuf);
> > +}
> > diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h index
> > 7752211..b49a96d 100644
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
> > @@ -22,12 +24,29 @@ struct ib_umem {
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
> > +	struct scatterlist *first_sg;
> > +	struct scatterlist *last_sg;
> > +	unsigned long first_sg_offset;
> > +	unsigned long last_sg_trim;
> > +	void *private;
> > +};
> > +
> > +static inline struct ib_umem_dmabuf *to_ib_umem_dmabuf(struct ib_umem
> > +*umem) {
> > +	return container_of(umem, struct ib_umem_dmabuf, umem); }
> > +
> >  /* Returns the offset of the umem start relative to the first page.
> > */  static inline int ib_umem_offset(struct ib_umem *umem)  { @@ -86,6
> > +105,7 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem,
> > size_t offset,  unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
> >  				     unsigned long pgsz_bitmap,
> >  				     unsigned long virt);
> > +
> >  /**
> >   * ib_umem_find_best_pgoff - Find best HW page size
> >   *
> > @@ -116,6 +136,14 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
> >  				      dma_addr & pgoff_bitmask);
> >  }
> >
> > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +				   unsigned long offset, size_t size,
> > +				   int fd, int access,
> > +				   const struct dma_buf_attach_ops *ops); int
> > +ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf); void
> > +ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf); void
> > +ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
> > +
> >  #else /* CONFIG_INFINIBAND_USER_MEM */
> >
> >  #include <linux/err.h>
> > @@ -143,7 +171,20 @@ static inline unsigned long
> > ib_umem_find_best_pgoff(struct ib_umem *umem,  {
> >  	return 0;
> >  }
> > +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +						 unsigned long offset,
> > +						 size_t size, int fd,
> > +						 int access,
> > +						 struct dma_buf_attach_ops *ops) {
> > +	return ERR_PTR(-EINVAL);
> 
> Probably, It should be EOPNOTSUPP and not EINVAL.

EINVAL is used here to be consistent with existing definitions in the same file.

> 
> > +}
> > +static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf
> > +*umem_dmabuf) {
> > +	return -EINVAL;
> > +}
> > +static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf
> > +*umem_dmabuf) { } static inline void ib_umem_dmabuf_release(struct
> > +ib_umem_dmabuf *umem_dmabuf) { }
> >
> >  #endif /* CONFIG_INFINIBAND_USER_MEM */
> > -
> >  #endif /* IB_UMEM_H */
> > --
> > 1.8.3.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
