Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7755290E67
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 02:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBB46F3ED;
	Sat, 17 Oct 2020 00:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B166F3ED
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 00:57:32 +0000 (UTC)
IronPort-SDR: df6Yh4VRs5faY+o0PbZMD5R3WoJ68I40JQRxW4EijUzG+BbUe/+eT0t6V1sdQlypt+49g22Hpz
 9iULFwysY3/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="146023968"
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="146023968"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 17:57:31 -0700
IronPort-SDR: ZXfXc0Jm4ZWFqZkN3tDWslvtQ9TrkztK/vN5SLCjHqSFlPD4IpWEkzPvjjFbmrj0/+ceQ/Zhgi
 SRjhn8FACc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="464877985"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 16 Oct 2020 17:57:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 17:57:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 16 Oct 2020 17:57:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 16 Oct 2020 17:57:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ1ME4+3pJnz/EGVQ0IjbozzzDia0qYq+0IJ71SbBcRmCKVrUOu4nI33P2UDzKEB+bRWMvJiZsFseIkCyXMNQzJEWV7xwWGunLPcMM3a5A77HEFuSE+xbPczQn5sSPoQf+e4WPbjEpHG1isR7lCh1uwfjJoh7HfMeMJhPOj4d/Cd0voLiG9wZ8nPvmzbs6l+wbcyupU82jXU6sqyIQc/kmi2MJnBdloFs1Vp3KBzM5spYMB83E/fw8iVIXzedDnKgZHcr7spD7oSb+fi4LHdeabklK741ViqHePfgguwibp7o/FdDcUx5SogVjiQbzVY0klGIdfYjL1KtbQ96ELi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMGaF0k8QFI2BMyrVYFjVOFdqpWsw8EnABNczlLZ+FQ=;
 b=CJ8KWvSGdoO+xY8JoicsoyAgp4QspoEgz9gkjdsyfUw+VTD41BEJ3GeSicm13O06jdjutvh4XQiDvcW+4wvJ76bMfXpcQQCH8RNs6g3YLmqUusR/QovVcOvy4dM3uZq48M9P6Xvnw9g581K4WVo9AkAHU+7v3eWlzb7w0tvrMiSuf89ObQSftvFbhlnE/C56RvE1ZxrMUh2OdEXsLMnswARrVl7S9juIb2hOFwxeXeANG0y0OzTL4/HcudaoMeV4RQ8a39M9Bzdx+eXX0jc+JfVrS2blazzBTs2LhimcQIZphPJgOt4rYd7DHUmSE5SFfC37mtj41VTp2wy6jP3KQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMGaF0k8QFI2BMyrVYFjVOFdqpWsw8EnABNczlLZ+FQ=;
 b=C36yrsiJtAj4iBfQh6bcpzQWDi4pYp/4lf+G9/ZW3akX6quiBgBXPxrfh5pWnV8nOLLYrlavaXq3P9ehZ1wCBG3IXrK0pvOE6K1TNpF0Hp0TLBeDTkGP56OW8K5zyzJ6Y5uxJ5ibfztezJTxBJ4MQ/FWdHFRz9JzTZkAJiQmdTw=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Sat, 17 Oct
 2020 00:57:21 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.022; Sat, 17 Oct 2020
 00:57:21 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWozz1hR5fnRv5A0WWquQaJ8S5uKma8lUAgAAErFA=
Date: Sat, 17 Oct 2020 00:57:21 +0000
Message-ID: <MW3PR11MB45556014C8D85ABC9EBFA97CE5000@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
 <20201017002816.GA334909@nvidia.com>
In-Reply-To: <20201017002816.GA334909@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 51d1b021-d6b7-4973-0411-08d872379a98
x-ms-traffictypediagnostic: CO1PR11MB5009:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB5009D468229E638EA665AE60E5000@CO1PR11MB5009.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A2oFLFnXZW8iopcWlzh0mXEx/SQvZpcRNxQJrWLbZzvP7heDMtQ/1vAstDoGwliqqvUvRpzQprGuwaXwFZA7dBVTDX+4n0YE7rjSyqNu+TWnlvb3u7HPCTfzHYL8S4/XcrtXITidfuXC9lAtVLLFSC4CQD7jyVQA8gSO28h8UQGotH6zJK5GQGh4AKt3QbMeLsjzCUXY7ko2DVWwO3Erm2aiF+i0LaWxLFkO5cAT7eWCoYvHXUAJUesliJVYZ5BTyaXDBw3elvKXVOSuHUIthHwuUllL3zJ5AT4vZiV3oB1zigwEEj8XHbeujZVE8oXDeLPRSrWMI80eJGEcvekRBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(53546011)(6506007)(52536014)(66446008)(6916009)(8676002)(54906003)(5660300002)(316002)(83380400001)(7696005)(8936002)(4326008)(71200400001)(76116006)(2906002)(55016002)(86362001)(66556008)(66946007)(64756008)(66476007)(9686003)(26005)(107886003)(33656002)(478600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XDTTeUSXtYF1G33T5l0OP8sYqqcGSn54sjSiGF6zhWmcQJuGxTt8L+iMJoBxxKKonpFF4cppCGOSqdZgol5MKu29Qkhz9k8pE9/8ZXJNs89Qk7w+Mh368tLW7nxS4rzhiL4lFkA6Q/7/ootexCop1VBfuFL2fbCYusoZoFsRAG4iOP8FWzMdE+jATsCp+0yzaMsg9uojAKM78SN24dLK8GXRDu0nNf0dDWuJ5F546lclVME5Q63QugXoI0jL8t6yB2RTOSRSzmZHVqd6AfhcChzqgxzpEPTVwD0uAnxvKEJyJR7ryB3C801902FL+Xs9U6OQiCSYG2Fq8sue5NprHSvNP/SA1sRe62cbXsbGorag5qYjTO8HyQNFVij4Hpzne2OW9zhfyN9SBS/EsA1VATB5labBMh/WDx6wn6syHFPX6YAqmxSwAP1VcjAK+hL1yzSjE8DdxAtzUBY0OhbNdVpuZyUdjPgUIRFib/H8HHtyIsULfMCQwqarWGu8c7iwIqOoKJ6x67clbrgfCUVrMs+ovmq/tzcsTdn6bfzbmspd1eZ7xsARE0Bno0+LDmUt4fAtrdFKYS2IzNu3GkVdV2WFc0uxzRosA/1nFePCJMfUYU6iC0XERLyjA8BoHj+gYeLScTBsguvVSKgbEzepgw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d1b021-d6b7-4973-0411-08d872379a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2020 00:57:21.4470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGdo76Wppn8Ao8d4qDpU7qkL5pxukSFa9U4x2j+grJ0AUgxvAmpvab3YwqcVWSekNT7quZISHnNxPQZRiCBR3Q==
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
> Sent: Friday, October 16, 2020 5:28 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
> > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +				   unsigned long addr, size_t size,
> > +				   int dmabuf_fd, int access,
> > +				   const struct ib_umem_dmabuf_ops *ops) {
> > +	struct dma_buf *dmabuf;
> > +	struct ib_umem_dmabuf *umem_dmabuf;
> > +	struct ib_umem *umem;
> > +	unsigned long end;
> > +	long ret;
> > +
> > +	if (check_add_overflow(addr, (unsigned long)size, &end))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(!ops || !ops->invalidate || !ops->update))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > +	if (!umem_dmabuf)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	umem_dmabuf->ops = ops;
> > +	INIT_WORK(&umem_dmabuf->work, ib_umem_dmabuf_work);
> > +
> > +	umem = &umem_dmabuf->umem;
> > +	umem->ibdev = device;
> > +	umem->length = size;
> > +	umem->address = addr;
> 
> addr here is offset within the dma buf, but this code does nothing with it.
> 
The current code assumes 0 offset, and 'addr' is the nominal starting address of the
buffer. If this is to be changed to offset, then yes, some more handling is needed
as you mentioned below.

> dma_buf_map_attachment gives a complete SGL for the entire DMA buf, but offset/length select a subset.
> 
> You need to edit the sgls to make them properly span the sub-range and follow the peculiar rules for how SGLs in ib_umem's have to be
> constructed.
> 
> Who validates that the total dma length of the SGL is exactly equal to length? That is really important too.
> 
> Also, dma_buf_map_attachment() does not do the correct dma mapping for RDMA, eg it does not use ib_dma_map(). This is not a problem
> for mlx5 but it is troublesome to put in the core code.

ib_dma_map() uses dma_map_single(), GPU drivers use dma_map_resource() for
dma_buf_map_attachment(). They belong to the same family, but take different
address type (kernel address vs MMIO physical address). Could you elaborate what
the problem could be for non-mlx5 HCAs?
 
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
