Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B68629C228
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 18:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70D86E1F7;
	Tue, 27 Oct 2020 17:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361056E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 17:32:51 +0000 (UTC)
IronPort-SDR: DztCgXuey2WfCOE1JWNqagjAoZ5KU9ZrHVzAjupfr92jKhWQaO4cvn3Kf8Aj4vNcjxyVkdYyrh
 10njLhpeg+6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="165538512"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="165538512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 10:32:50 -0700
IronPort-SDR: bO6WDdYq4JnUjpQ2L19avZVACSrB9N2phgT2IekZlrf8vAsii0MX7y2pdg1cSm5/0izRZytCOg
 i/XreWTOo7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="535884552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2020 10:32:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 10:32:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 10:32:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Oct 2020 10:32:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 27 Oct 2020 10:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkWMgbKCUlzcsj7KF8Nja+1N/mxWlU5iC12ztKdKVz7T76seqbXbRkbfTEu7UEaLeF72rIyYnnCTi7B/oNegg7BqjobMQ1kM4pav8AHaPCBnD3KOWOz3JNJ5/x7GGz+7VY6z8S5vSivAQ2UhhtZLp819fe5shJgmwIMIXxcf24HG4ZneEkGkCQfduHEjrZkMDSNInJA1S0S788E7qrVNTnmwlAn1dHf17i8d5aXXi71zH9BQeN/WXu5zlKCqXI+77K+7T8Hm6KAICqbnOj3zx2aQQ+s2pffIob4HcpEOTgssu/oqlyvUp46Re4xeAvHNHJq9Xh78Yzqb1ff9cGg9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXcLA2c0uh3zc2KOepJHtv+caDdMb91Rjp0OJx5wV/U=;
 b=KLcT4zDQCaTH0p4O3nkvr9vUB/oXTmL9qN3ncaQ0gHzxbf3oLZviKxTQfLVGoFZ9dwMU9lyDyOiUU+0z8eHTyerjeo0GA8PC5WRIAKm6KayJeTJKEiagNB3dRG7jK0AVPG4yXZbslccEcW/Hw1R4alyXWKhz+ZHasWPFnRxRuewxN/bfEhwNJKbaY0pt1kyzeyLu2EVS9Fi1Yb+h2p1KvCLzb4JZ98DH5enxE5CE9EtVKJquTqPayHUBBYCGAgxHaK7GUEOl7Ld5oBy6va5VhYpYjqopdOQu6wRB5OrSqzGMAC1rIs3aSednxgPol9PQYLD2/nSNIFDp1x77nZSMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXcLA2c0uh3zc2KOepJHtv+caDdMb91Rjp0OJx5wV/U=;
 b=EsCDBUKWeUGo8JBhujg+O6ISia3HhNd6LGkeOh5RpufRn/YTEx7xTceOOHjYSO4Pqv5W9RpX7mq81Z3r+HpnXetGA91NtwqD6LnevAW899ZXAKLJHbP0P+D9QMoL4S4b1LHOPQp506b4VJeaF4TsQKeJUrP3/nJ0mtVCSqWxTFA=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 27 Oct
 2020 17:32:26 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 17:32:26 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWqVlE332Lg1o1rU+Qqd8CQ3VTXKmlZiqAgAAZZoCAAOHDgIADcnmAgAFKJgCAAJZW4A==
Date: Tue, 27 Oct 2020 17:32:26 +0000
Message-ID: <MW3PR11MB4555208D038CEFE6C468DAF5E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca> <20201024074807.GA3112@infradead.org>
 <20201026122637.GQ36674@ziepe.ca> <20201027080816.GA2692@infradead.org>
In-Reply-To: <20201027080816.GA2692@infradead.org>
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
x-ms-office365-filtering-correlation-id: d4e861fc-370f-4592-d78b-08d87a9e459b
x-ms-traffictypediagnostic: CO1PR11MB4961:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB49615E655411B0954103E5BAE5160@CO1PR11MB4961.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lWYhyJFxBlylJn0VrnQMeY1H5qUcBJPTpgfqhT3BGxNmAl+DqTyrToQSqVNkIEFIeP99kvce+AxlqgM6kUnFwWTWhjTTTKRXKFaGevDAs1rz1HsDzPQWDpCO+3+g7J3u5gSpKQhdiTCsY1AZr+9IOTcuCkFXJWFl0PkbkqrbLhnEQF5ODjooyndU1NSRtxrO8dwuHASCSC6JXGYnhJmJZbsB9x7wvgi19KdrCGEJLlmElXpTNRwmFt61Xb65P8XNPLYIJeqZ7ad8MIoAeqyfgQmscCa7e+mPYmaXen+Y5fWb/65fYnUzRWCrhuyxzwK6pUThz3Eo3NIj6j8Dyugbag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(53546011)(33656002)(6506007)(83380400001)(8936002)(186003)(71200400001)(86362001)(2906002)(4326008)(55016002)(52536014)(478600001)(316002)(66476007)(66556008)(54906003)(110136005)(9686003)(66446008)(26005)(8676002)(7696005)(76116006)(5660300002)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bYA/v28wrNsZyek+hL5GNYYtG86ivp0XN/bDwczn62sQyFU/x6JbSFt5IN0g3ND7DJmH/o9hBKyRyN/jKa2i/5bBJvFh4yUKRtqIxtU7d6Fmc4shrdJu48FTZMHQ4iOJeGvdweeqrtdJl6kFElcyEPeVrWZ56stJxqio+2PA5KU/aU9lxFc7riN0k4H0mCEUmEmvRGmVUKx3U3mLT5gSEnNc4IH+C5uFSj63BgWd25qV64IRhrQSCVVVa6LApE9SlUNhFjVAbJ9sESRsQ+BFYVlNX80BA4P4cBYrGmzPsnD5a4M3Axvl4Q9zL5NqdIJwdE9okNKl+9hPpHn31P0F3tgY50l267UodUMM7u6r2LjBHjyvAg5lOq4bD8oJph9hW3/Cqy9rokwzRlwXztLm02x2Rbk3M04ezrEX1JpukSNcKKFzkNdOk7nlJ1nUQsR7e4F0m6pAQQn+O2Oa/xkxb1YoT7jgw3AHIY1zyY4vsZpDhQ94bTs5G1C5ei8+aGP1dJgc5SwyiwTqlYmJeRx92950AWTeHwjQRAdVK7uXo28i33Kyr0mOyJ8TTTaXKbOJxYquCBSMP/7v8Z8Epr8QUhVZYBqL//rDP3793B4z5zCeJIi5xqw75j8CmQoRTwMv3qd/6dLfr5R5rC2RC3z/vA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e861fc-370f-4592-d78b-08d87a9e459b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 17:32:26.3590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vRvY3fKcJIvd2hZNKvm+xVAwdS050sSVj98wV9UBsBpfu4Dqy6zwDXi7Ll6/IXyM9qEJLHgM62K19dLuQp60A==
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
> From: Christoph Hellwig <hch@infradead.org>
> Sent: Tuesday, October 27, 2020 1:08 AM
> To: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Christoph Hellwig <hch@infradead.org>; Daniel Vetter <daniel@ffwll.ch>; Xiong, Jianxin <jianxin.xiong@intel.com>; linux-
> rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Leon Romanovsky <leon@kernel.org>; Doug Ledford <dledford@redhat.com>;
> Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Mon, Oct 26, 2020 at 09:26:37AM -0300, Jason Gunthorpe wrote:
> > On Sat, Oct 24, 2020 at 08:48:07AM +0100, Christoph Hellwig wrote:
> > > On Fri, Oct 23, 2020 at 03:20:05PM -0300, Jason Gunthorpe wrote:
> > > > The problem is we have RDMA drivers that assume SGL's have a valid
> > > > struct page, and these hacky/wrong P2P sgls that DMABUF creates
> > > > cannot be passed into those drivers.
> > >
> > > RDMA drivers do not assume scatterlist have a valid struct page,
> > > scatterlists are defined to have a valid struct page.  Any
> > > scatterlist without a struct page is completely buggy.
> >
> > It is not just having the struct page, it needs to be a CPU accessible
> > one for memcpy/etc. They aren't correct with the
> > MEMORY_DEVICE_PCI_P2PDMA SGLs either.
> 
> Exactly.

In the function ib_umem_dmabuf_sgt_slice() (part of this patch) we could generate
a dma address array instead of filling the scatterlist 'umem->sg_head'. The array
would be handled similar to 'umem_odp->dma_list'. With such change, the RDMA
drivers wouldn't see incorrectly formed scatterlist. The check for dma_virt_ops here
wouldn't be needed either.

Would such proposal address the concern here?

-Jianxin
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
