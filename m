Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF120FC00
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A2189BB0;
	Tue, 30 Jun 2020 18:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2987689BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:46:21 +0000 (UTC)
IronPort-SDR: 1FlaQSUCXejBAr9zbd+x7dj2W3akgvCI6sz4uDRfWOoQc8+pfqYM1cMfn0YiXvLbSp0vtNyc4T
 sFQ5NgCBGk3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231221676"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231221676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 11:46:20 -0700
IronPort-SDR: TDAqqfRoomjQd2s5lRmUMMprSjZaiIqtHBhp4bag9MzQELWBCpY2dQMCJ4BCRHFjmZyH8Ob2cR
 8P9rHb/7RYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="277516248"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga003.jf.intel.com with ESMTP; 30 Jun 2020 11:46:20 -0700
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 11:46:19 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 11:46:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 30 Jun 2020 11:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfKUV9FNdmGrGWNikW7KNZKGPalkkjIRdEGOFDcN/UM1OlsXkR0gfa5TuHGPPt3Bi6uUcjVylWbdZeWj3s8VQakNMem5uDUmUJa3lZMAYuUz5WaCbxv5bp20Km1x5zRY7nC6fJhRW5QTOPpvstBiPdsE35saFj5cZ/Tr02/rpoDyT7FI6JBkKO14tABrQNzVlsdlto8Wl5bZCfrFI5IsoBzn5yg8S3OOHzkL+de09sdSHaSdEvEqnNtR0mg0cDdVfJg/cgS0mtsS+37r4pdOUR3npHIks1GW2iwmwMCrfwTToSOw4n+yGIl8kmnJ+map5v/CNzXlVlUctNJwClB1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA/C6ssbucOrc9/eQJd0REqVpKptppq90DUKc8elUsQ=;
 b=kx7EQ+ASkPsk+o/sTpV4i5HnOSX9Kgx3guax5l81PY2SV4U0t5i96pX4lDWQ09x93yJAmDHBCNlmlsduwqY4uEoF/VwXOpAf2pgPElSGQabnSXticTopYBHbJbOTUimGbsDx0eeDzBIOgeu1XqI1NLdjwh7hlTDdyhifMjm1DLHmqigWI+DCZJQMLStlY2hLq+pSmWsL7GTnGkO8a9icA0HZ+oRQt8kex5ZC4Ipkn5Y0X2nIwFPLWHgDQrntFiJ8PtZShXTFdA/j1jzfQi+x2cFPb7p9BhEG6jYUqW97hwq+MLrRMgzp0xn8JbckonbxbthVpa0SBCI7on/l6wIimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA/C6ssbucOrc9/eQJd0REqVpKptppq90DUKc8elUsQ=;
 b=DLWcRNEUjMlKuJeHiW9+9cw6U/S+hElrF4eqekYt2rKBlnZDyBg1Ohb1zG8QYJKKWoNXSJOecS5QEX9ikTf3RRRKMoHD6KYO3bySuxqBDHRLD3qMqmMlSmSTrKZeXSRJvdAWKZy/X2CdBltVNYjhAGlgaP5q2PqiWYi9uUH07QM=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 18:46:17 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf%8]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 18:46:17 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Topic: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Index: AQHWTjmKZPnzyjUH+EiOzVuDukOX/Kjv8EEAgAFgqNCAABwVgIAACtww
Date: Tue, 30 Jun 2020 18:46:17 +0000
Message-ID: <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
In-Reply-To: <20200630173435.GK25301@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e548edca-3f07-4939-45bb-08d81d25df79
x-ms-traffictypediagnostic: MWHPR11MB1680:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB16805FCEABDBFCE88510D360E56F0@MWHPR11MB1680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+fFrAUPqCOsIdLz5a4Zpn6fJ0gu0dd2ofdXy57NGLA86mLgX7EfGY/LJMyftmfSHh9gQnYA/Gnr6UHvjsmUTqva0d7PZy7yPuSLhEkrl85YjgCs0oZSAC6SUpWk7nbxYiYUC+Q9NKH8AbH1wNixu/5t2xH4Gn+5ZO0labJVcO2fj+tai7jJ/3pnk25JhXbtfvaLnCu13HlTaVlJbjKNZAydxVc/maFEBwCbwova4x2FzajwJXzpUHmg4rU6LiSTD4FVEgZtlcvef4RkLTNILWcY58+NCgVPxmKZPgi9IxKPSMDy6kj0Y3M7V9vulZUY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(5660300002)(478600001)(53546011)(83380400001)(316002)(7696005)(66446008)(2906002)(66556008)(66476007)(64756008)(6506007)(4326008)(55016002)(8676002)(76116006)(8936002)(66946007)(9686003)(71200400001)(54906003)(186003)(86362001)(52536014)(26005)(6916009)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UwF70kfnAkyURhqW00gwL+TvfhSmBl9uOpHSl5Sc612NcOYbLCUdAdqS1yyYxFc9l2zf0yYqq/CUEn4TcCccoSTMUAifxr57THqkMDeDRDGckKrQ4jKMqVSnCIUVqbG9/R3OB2aVsPst1352lTcPD5JWb5AWmbs2ntit+xzRYXb6cwt/+m4WTzZxXfcBNVyNyv9OXcGBRAxSw3v/bPiauL0Bx78cKIgLNy4jSyQpKHZJl/iljytm1xYmXD+dil7o83W8i86YLbbA+aUri09U6BXFyh0XjXVB8wmkzgKO/qLVEub4kBN15JpDAf2hDM/yq/I/XpVQfOmWkHhvMrdF0cCwEYnzQSuleEhqLJrXDaV2xA3WuRLoz6p7Di5zfJr5mQY9inPy03My1pvD8dJPHYwAzNEYx8Hg8QV4Wf5TB50YiBPKN+fEjhjeD2l7a5ZQSc+gK/Xq1DkS71RAaFxS0wBK3NxlbZqNFizhalz798DGE2iD5TUfnvVHSvoirSbO
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e548edca-3f07-4939-45bb-08d81d25df79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 18:46:17.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UOowHg0dGCRMacnE43iyjjB+rR5EG1VGprlqLf5p8vLJ889PGyCp//xg7l9bmU4Ul7ejY7xQLhBcFoRtRYRmsw==
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, June 30, 2020 10:35 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
> <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> 
> On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
> > > > Heterogeneous Memory Management (HMM) utilizes
> > > > mmu_interval_notifier and ZONE_DEVICE to support shared virtual
> > > > address space and page migration between system memory and device
> > > > memory. HMM doesn't support pinning device memory because pages
> > > > located on device must be able to migrate to system memory when
> > > > accessed by CPU. Peer-to-peer access is possible if the peer can
> > > > handle page fault. For RDMA, that means the NIC must support on-demand paging.
> > >
> > > peer-peer access is currently not possible with hmm_range_fault().
> >
> > Currently hmm_range_fault() always sets the cpu access flag and device
> > private pages are migrated to the system RAM in the fault handler.
> > However, it's possible to have a modified code flow to keep the device
> > private page info for use with peer to peer access.
> 
> Sort of, but only within the same device, RDMA or anything else generic can't reach inside a DEVICE_PRIVATE and extract anything useful.

But pfn is supposed to be all that is needed.

> 
> > > So.. this patch doesn't really do anything new? We could just make a MR against the DMA buf mmap and get to the same place?
> >
> > That's right, the patch alone is just half of the story. The
> > functionality depends on availability of dma-buf exporter that can pin
> > the device memory.
> 
> Well, what do you want to happen here? The RDMA parts are reasonable, but I don't want to add new functionality without a purpose - the
> other parts need to be settled out first.

At the RDMA side, we mainly want to check if the changes are acceptable. For example,
the part about adding 'fd' to the device ops and the ioctl interface. All the previous
comments are very helpful for us to refine the patch so that we can be ready when
GPU side support becomes available.

> 
> The need for the dynamic mapping support for even the current DMA Buf hacky P2P users is really too bad. Can you get any GPU driver to
> support non-dynamic mapping?

We are working on direct direction.

> 
> > > > migrate to system RAM. This is due to the lack of knowledge about
> > > > whether the importer can perform peer-to-peer access and the lack
> > > > of resource limit control measure for GPU. For the first part, the
> > > > latest dma-buf driver has a peer-to-peer flag for the importer,
> > > > but the flag is currently tied to dynamic mapping support, which
> > > > requires on-demand paging support from the NIC to work.
> > >
> > > ODP for DMA buf?
> >
> > Right.
> 
> Hum. This is not actually so hard to do. The whole dma buf proposal would make a lot more sense if the 'dma buf MR' had to be the
> dynamic kind and the driver had to provide the faulting. It would not be so hard to change mlx5 to be able to work like this, perhaps. (the
> locking might be a bit tricky though)

The main issue is that not all NICs support ODP.

> 
> > > > There are a few possible ways to address these issues, such as
> > > > decoupling peer-to-peer flag from dynamic mapping, allowing more
> > > > leeway for individual drivers to make the pinning decision and
> > > > adding GPU resource limit control via cgroup. We would like to get
> > > > comments on this patch series with the assumption that device
> > > > memory pinning via dma-buf is supported by some GPU drivers, and
> > > > at the same time welcome open discussions on how to address the
> > > > aforementioned issues as well as GPU-NIC peer-to-peer access solutions in general.
> > >
> > > These seem like DMA buf problems, not RDMA problems, why are you
> > > asking these questions with a RDMA patch set? The usual DMA buf people are not even Cc'd here.
> >
> > The intention is to have people from both RDMA and DMA buffer side to
> > comment. Sumit Semwal is the DMA buffer maintainer according to the
> > MAINTAINERS file. I agree more people could be invited to the discussion.
> > Just added Christian Koenig to the cc-list.
> 
> Would be good to have added the drm lists too

Thanks, cc'd dri-devel here, and will also do the same for the previous part of the thread.

> 
> > If the umem_description you mentioned is for information used to
> > create the umem (e.g. a structure for all the parameters), then this would work better.
> 
> It would make some more sense, and avoid all these weird EOPNOTSUPPS.

Good, thanks for the suggestion.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
