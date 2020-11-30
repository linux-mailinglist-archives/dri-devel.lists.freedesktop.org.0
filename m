Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C12C8BFA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6816E5D5;
	Mon, 30 Nov 2020 18:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF5B6E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:04:14 +0000 (UTC)
IronPort-SDR: iSRSxkiMA63WnsoCrSXMWgK6NADsbAHg6Euyqa6Ry9zdbgsCRIB36uvdBauTfFRBQwGjlXZ2mT
 krLivu4P/HWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169183411"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="169183411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 10:04:04 -0800
IronPort-SDR: rf9ppXRD1oFjn/rPWNb863OWtrjMtGuFWGk6bufk9m2D7u+WaoR8LKtSoy5RA7jgXWI9JHTniy
 ZQB2s2J9zl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="364342423"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 10:03:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 10:03:58 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 10:03:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 10:03:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 10:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL/4vqz/betWxf+j7uo0Ry1d3PfPVib0LvvlzNN2nRqDOLSq0XBZeL5YtYzKGFbKMRlNAte+4ot5G6HomSUwqwImGfXhN/t0LpoYzSx54n6tpDjL926fLqFS1uk5eNgqFVEkjtQDoHVMEeei1wgCvPSmeVW2T+HtVOAx/V7DJ9Zn38OXctySF3TrENRUsGCGPAcxNdEC4DSNxdgf7/x/HNLl4bSwFHJj+Mt2q5t2WI9mVLmoDW7CuUkygDvM+LCRX0kq0IbuVDG+lfIZGLljykjVVBsHhwKyqNaQfGcXMa667ea3z3v3hBJDl+OZiUgkLypQQ94h5ppjilXy6KdqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07M3K6ymPrejZjAY0CCJFuqZRBCqxHZdYhuYNbQOo+4=;
 b=IYwETwUYh5U04FuboAtbmcEpJ+KLtQkiz1OdKCdRpH08d4/dGnCpj05bfEFL7MBivp8BVfIpBwvP9MKyhg5BVhEJqBBM5D7MGYksEqPsmRRqEGoT2JSyLdtqivPayi1B8M/efc/CsJGlS+rBzgYFXCsHd2KcH29pXYe2JyPIojV+Jp0Y8iF9lQ8nQ1plJc75Ynkjx3nDraXKpcQwB5yKliE3hb0+YwQpsEXMm5IEzPu1xwgj7IlS7zOzZ1c26SuYXAA0exaJuqMefdyvcz1A14W7BmdddupV4INgg1euJRE4ILjhgSZDuC+6DqGOofjGlLfYt+oE1Iy04TExSLIpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07M3K6ymPrejZjAY0CCJFuqZRBCqxHZdYhuYNbQOo+4=;
 b=cfqgGNAXZ3DvqHIqUndeBl9Rn8V/c4ZxAE5/zW2KPoGTRndOjwfv6tk03AWZhz+8EHvFBnt+t7+WkxQofIhwf9yOXQYzluW+b5r84fKCNg31e1DHdNK0x6IOALJKhClGe8SsmfcP03AiqbtE4/lqfPJlEJaymcz+8o9Rlvi/Eoo=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 18:03:47 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 18:03:47 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWxP3mzzChdz0pgEiMI6YqGjGmSKngyFGAgAAQOACAAAKDgIAACO8AgAAFR4CAABD2wA==
Date: Mon, 30 Nov 2020 18:03:47 +0000
Message-ID: <MW3PR11MB4555FE23BDECC607C5C7A16CE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130145741.GP401619@phenom.ffwll.local> <20201130155544.GA5487@ziepe.ca>
 <20201130160443.GV401619@phenom.ffwll.local> <20201130163642.GC5487@ziepe.ca>
 <20201130165535.GW401619@phenom.ffwll.local>
In-Reply-To: <20201130165535.GW401619@phenom.ffwll.local>
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
x-ms-office365-filtering-correlation-id: 2f220e2b-fd45-4991-bd77-08d8955a48e6
x-ms-traffictypediagnostic: CO1PR11MB4945:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB494568FDE5EE20811F339488E5F50@CO1PR11MB4945.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +hFRfLfKNeDFZzMQHhXcAf7zGF0smF/dxL2Ol4W7vp4bppfPtXYsI5huKrTcy2lqYvwA1pjyamp6/yrrypKRH4FHsTb4pa0r179hvy1T7kbZXITyLtGcXL8wY2bWDO2jFlty/3oak2753520lUiebzLVFajIYdENfD6JWFCpotOdcIxWdS89+r4UBS0p04YLpfhnkz2BtRG0P9HK5DZ2D8e9SXs8uYnT/WHgEe/K2KkO5pNc1M/ft9nGP+eMCLXeyZ49nyhyBR/Tk6hiPuPMMU6KJo4fABP/jehIyMyPqnuZpEvyxRjxPYrVhbnAk17RohoR9s79qAQ0WX3KPuxtUi75KDwtlTC3u7imW32mNkBmRabmvVy8FPT/8oTpYjASjjus3YsgGD5FkRax0senMFi3ak7R74OugI/dCnUKFzaML61sQY/VAHwmn2LpnksvDKsqBMSwr+LDw/E6VCVEPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(9686003)(4326008)(966005)(55016002)(110136005)(52536014)(54906003)(6506007)(7696005)(186003)(5660300002)(26005)(478600001)(83380400001)(8676002)(83080400002)(2906002)(8936002)(66446008)(86362001)(66476007)(53546011)(33656002)(76116006)(64756008)(66556008)(71200400001)(316002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2tRgzn1NTw5WQbm1+Z/w11SYRCRptvdVM9E81oGjIWA2YMpy5frpr3YDQYsufa72+DGUcSFfy4xFMbFL4844Z6qeAmHOFt9G5Sh1cHqNvyoaq8Yr0VhgrCusFrjgf6f2GJcw2cQ6JJS1RGpxuS+9xK6POTNlBhi8KnEEXHqc9CFuCOcGRNcClbD5VrcSAo2kRBY9C+iOzXFIdk3BSM2V3V0Zdc4eiI/nQBkKquunmMTxg+xVPjN4jQLRQgyRQJ9UQE5ps96KObueSls3oPeqBYF0x8dQE6FbXSHi0Mn/tpa/HemiCMNozX6T0iX0uswIdAMToXgOwf7gM+0pQp8HVuPGl/4KVf2bnyD+ftUN/eWIuSUjDeBMB7xUIpRCKnF9RRRseGDYlhgz2H8J4FKG2CEj+N9/AWvq+O78Ch1+FH/L+QFsascexFUn23Eu/8xx2GMaBCGXFM+8Eh73SjH4eUokzcqbCx9/NO3YVHm1TSZZroANk9vh51O5upzmjBtRp6ztM7qJCtpc6EbVjcQM8f4/mTSfSnPTCuHJ+e3t70bYUX8KD5V7vOb4QI7nRbjTaojSOb2H4Jk2l2822awKfRmHd0neQPIt0DKzPpBV0XnyhonSFngMhbpQr87pgCW+FHnNVKsXWKHHunMtm1QBqBhEyVqmf+MEbDTrcsIfLKHM6mDKU2cailTR/jI7xJYA6SlUxE61BVtRNecryq3JEO6gwdrZF/oFuEIpCzHYG/w=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f220e2b-fd45-4991-bd77-08d8955a48e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 18:03:47.5054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIpeyipn27hARKKL1ZzsB5p0AeJI++kDJAVqg/TgNm5lqerL2SA+1/T8CY4T4f2holoaNzexUPdIZrZVxsiLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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
 Doug Ledford <dledford@redhat.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, November 30, 2020 8:56 AM
> To: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma@vger.kernel.org; dri-
> devel@lists.freedesktop.org; Leon Romanovsky <leon@kernel.org>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
> 
> On Mon, Nov 30, 2020 at 12:36:42PM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 30, 2020 at 05:04:43PM +0100, Daniel Vetter wrote:
> > > On Mon, Nov 30, 2020 at 11:55:44AM -0400, Jason Gunthorpe wrote:
> > > > On Mon, Nov 30, 2020 at 03:57:41PM +0100, Daniel Vetter wrote:
> > > > > > +	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem_create);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	*handle = gem_create.out.handle;
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int radeon_alloc(struct dri *dri, size_t size,
> > > > > > +uint32_t *handle)
> > > > >
> > > > > Tbh radeon chips are old enough I wouldn't care. Also doesn't
> > > > > support p2p dma-buf, so always going to be in system memory when
> > > > > you share. Plus you also need some more flags like I suggested above I think.
> > > >
> > > > What about nouveau?
> > >
> > > Reallistically chances that someone wants to use rdma together with
> > > the upstream nouveau driver are roughly nil. Imo also needs someone
> > > with the right hardware to make sure it works (since the flags are
> > > all kinda arcane driver specific stuff testing is really needed).
> >
> > Well, it would be helpful if we can test the mlx5 part of the
> > implementation, and I have a lab stocked with nouveau compatible HW..
> >
> > But you are right someone needs to test/etc, so this does not seem
> > like Jianxin should worry
> 
> Ah yes sounds good. I can help with trying to find how to allocate vram with nouveau if you don't find it. Caveat is that nouveau doesn't do
> dynamic dma-buf exports and hence none of the intersting flows and also not p2p. Not sure how much work it would be to roll that out (iirc
> it wasnt that much amdgpu code really, just endless discussions on the interface semantics and how to roll it out without breaking any of
> the existing dma-buf users).
> 
> Another thing that just crossed my mind: Do we have a testcase for forcing the eviction? Should be fairly easy to provoke with something
> like this:
> 
> - register vram-only buffer with mlx5 and do something that binds it
> - allocate enough vram-only buffers to overfill vram (again figuring out
>   how much vram you have is driver specific)
> - touch each buffer with mmap. that should force the mlx5 buffer out. it
>   might be that eviction isn't lru but preferentially idle buffers (i.e.
>   not used by hw, so anything register to mlx5 won't qualify as first
>   victims). so we might need to instead register a ton of buffers with
>   mlx5 and access them through ibverbs
> - do something with mlx5 again to force the rebinding and test it all
>   keeps working
> 
> That entire invalidate/buffer move flow is the most complex interaction I think.

Right now on my side the evict scenario is tested with the "timeout" feature of the
AMD gpu. The GPU driver would move all VRAM allocations to system buffer after
a certain period of "inactivity" (10s by default). VRAM being accessed by peer DMA
is not counted as activity from GPU's POV. I can observe the invalidation/remapping
sequence by running an RDMA test for long enough time. 

I agree having a more generic mechanism to force this scenario is going to be useful.

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
