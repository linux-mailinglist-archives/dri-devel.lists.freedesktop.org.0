Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED6294684
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 04:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67876E83A;
	Wed, 21 Oct 2020 02:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648436E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 02:34:31 +0000 (UTC)
IronPort-SDR: Tx8PeO3B52BlnK87vPoq7MGuXCLHXuCuD/c8MGdrRDm0ohvTYz3h5wU59foRSeSyE6wuRoWdkv
 9OY11bbDEX1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167395663"
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; d="scan'208";a="167395663"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 19:34:28 -0700
IronPort-SDR: KEl5C/haZ3cv3IDvjoUanj92fPnTAv+Bkfej6jBdV6FPY+ZZNlSstWmCx4Irh1DG0+tTj7/XUe
 sGRnmwOaj8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,399,1596524400"; d="scan'208";a="301937287"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2020 19:34:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Oct 2020 19:34:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Oct 2020 19:34:26 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.58) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 20 Oct 2020 19:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keWYcXAcemamOOV3ZSGoyFdrnWlfaKYtRE97v3hoqj/6N5zAiPL//3U3LWsOqIfGc9p5xwGc353GG3ILNnRQOpdOUVSRSESdyRX+b5Ydx0ZYRZeV4v9WDobsZEJcoCkh3gTc0c7e/VNlTspkqEB6+3e5qfHKznRVaGTVGWFmM4Wl1NmktMFRJ1GBUTO6AkKL5ZsqywshRYlfY5qTdlTsJ/ct8SbeEi0c/KEhzz/GZWMgRQhATrWkR3f1sa2lhdtzHBphol2w98+jFEsG8jNbV1N+vcpwCDPf8couj4vR/6N/+bCWDYXCQpEdi9QSYEEJH20+yxKegZo39CPvuGWwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U0mOXUKjqThJ06O9zcAlNZZ3NTteivXwC3NWpNyL+U=;
 b=UkOsSRmZV81uvXbeDTOHqbqsvqjHziULKLlWlg8JDGSk/D2t330ohHO512UokaYvf4fzsi1FfsIv/0SEzx8V5dRJFLgTgSDFT7b4xf7gAbeTx7rGSJvaPcMe5NELTiCj5viVhLdOP7RKteOCgdY0yaZGwoQoj1shp/Wf3ZXQOgMwD9+QlGmWpkO76Oi58FPXqYGZHOpG9DcERmKgXDba2ee4MZdoioGqaDap7CntY7e2aux1IY1XF7ET3+RJAFigHCZGJsYU1PqK6J5Ul+GdFkFxG2Pl3QH/5SP4thUsFLxdSvuYfKLSLTwLMCggaXQsoWgQUSHQFYCYhF33YZhB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U0mOXUKjqThJ06O9zcAlNZZ3NTteivXwC3NWpNyL+U=;
 b=hqqes7etFSI6rpIZm4yMrYbz4LwPbP5Sn64N2vMESkPFbDmyyTo15uuHoYS0sk4iTBfIxTfADXLblCKq2V9GMDn/M9kMADJMHJyitsnJ6HduhWgud1fdwNkHlTSyw+3c0jbMT6i+5WrUZZnu5DDb2iWFVdR8PQsy7wfoQj+clOU=
Received: from DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13)
 by DM6PR11MB3386.namprd11.prod.outlook.com (2603:10b6:5:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 02:34:00 +0000
Received: from DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::cdc4:d8fd:445e:bc26]) by DM6PR11MB4548.namprd11.prod.outlook.com
 ([fe80::cdc4:d8fd:445e:bc26%7]) with mapi id 15.20.3499.018; Wed, 21 Oct 2020
 02:34:00 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/5] RDMA: Add dma-buf support
Thread-Topic: [PATCH v5 0/5] RDMA: Add dma-buf support
Thread-Index: AQHWozzzWh6k/IcTJESOtSPwSU87pKmhUB4AgAAMq+A=
Date: Wed, 21 Oct 2020 02:34:00 +0000
Message-ID: <DM6PR11MB4548EF1D630E8899F7517EEDE51C0@DM6PR11MB4548.namprd11.prod.outlook.com>
References: <1602799340-138152-1-git-send-email-jianxin.xiong@intel.com>
 <6233a35f-7035-dc96-5680-c3b5bf0b5962@nvidia.com>
In-Reply-To: <6233a35f-7035-dc96-5680-c3b5bf0b5962@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 4153fb3a-09a3-4600-5cfb-08d87569c4e5
x-ms-traffictypediagnostic: DM6PR11MB3386:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3386D6A6E044840504B925E6E51C0@DM6PR11MB3386.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hnv6rqC8HUAYkSRU/DBiVUB3znJwtzovegxbzQ+rAXbOBCBBYQKo1zHlf0rpIivPB8GxepZAps/CVNQiFNVIXyXyEYxhmBcdSwmjxAxe0ZRftLKuJg7GGAGhFFKbuEy1osWql9WeYGPar1S8FDFrU4LclXufmr4RB9z3jbL1wdQjqPYG1eKjO1wcB+2QTYNq0fBDqG7gpPKClKPN8SHcbmCekCd/oERFzly/c2zsgSG0w4DzAu7aXWZ2bCiYaqcuTdQLmU65PL7MZ8/5/DprD6brKlPWri63KdsbJS8pRT8iiiP/pkF03LHGjnWhq2/rQfc95rf9nYFQltcfxClPLebaxSuvGXyHqD9roBaznnAwLDkMMMRW+KmyMm4CVHSrAFHFNx39I2P8oJ8Rz9FPcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4548.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(26005)(66446008)(66946007)(86362001)(52536014)(5660300002)(64756008)(8936002)(76116006)(7696005)(66476007)(8676002)(66556008)(54906003)(110136005)(2906002)(316002)(71200400001)(6506007)(55016002)(186003)(53546011)(966005)(107886003)(4326008)(478600001)(33656002)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZfurzdvRTbs62JDYtbU16KImr0BXvMen59q1SLB8fazZooeGwtqObhJDfouAqdZLgzTb873aK7WR3hBcuJFPi5e93qtDdELeXJ2YBABYQKK0fMjY3OrDFNjmVUY/9/2whumWQ+STADtoOxrFw1W2tS6JAVadtBrxvNoWFcsbRHItT5/MOhrLRh3/MPk3LU5JkvisfrihcS2VfyhUZvm4Pq+2t3ShKMDEHvgQUkTdbKmaH7f3UsuJykVgUWWRozyXX2o/M7RSa0bq5lU5k2F5EsMleiTCsb+0fktgbNJiUdqtToEKKesi/bBOpGUwSw50o28jrbacNx7mH6ExX29zOzk44yniwFEZSCi99WenCEGKCkI335bcLocW/9n+EOdsUhE2nalTeHta38S8QUcOr7ZOKVDonYFuvgmR1NFZ71B2kUDspuEkF4oROw1MFIfIVjxY4dFGHGaohWf3hAqPhU+6lbBwMvhPJvXSlXgy8gzWkewkI+Y6MbplqBcQa/LDNDV5Fs9lJdmCtAZ6C9mbS1jJxpVT/x2qqkqftUPMLalh2+twVDaydNC9BlCpEma3VxIVnHU/7b4iW71n6FPd/tQtaE3comOOzlMRhWf/EE89iMg/7+soawI7q/YJj/htX0zpD1gVc4NJT6VG9KSOvQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4153fb3a-09a3-4600-5cfb-08d87569c4e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 02:34:00.6723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GchWPbbT9r1lv5KKphPeL1ILaL+tPZVD932y8qvojQ+gKdpKzTpJwEYUlemJ0lirAlIVso5vD9Spgi/8ZSimYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3386
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: John Hubbard <jhubbard@nvidia.com>
> Sent: Tuesday, October 20, 2020 6:42 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky <leon@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 0/5] RDMA: Add dma-buf support
> 
> On 10/15/20 3:02 PM, Jianxin Xiong wrote:
> > This is the fifth version of the patch set. Changelog:
> >
> 
> Hi,
> 
> A minor point, but if you can tweak your email sending setup, it would be nice.
> Specifically, make follow-up patches a reply to the first item. That's a list convention, and git format-patch + git send-email *.patch is
> normally sufficient to make that happen, unless you override it by doing something like sending each patch separately...which is my first
> suspicion as to how this happened.
> 
> These patches are difficult to link to, because they don't follow the convention of patches 1-5 being in-reply-to patch 0. So if we want to
> ask people outside of this list to take a peek (I was about to), we have to go collect 5 or 6 different lore.kernel.org URLs, one for each
> patch...
> 
> Take a look on lore and you can see the problem. Here's patch 0, and there is no way from there to find the remaining patches:
> 
>     https://lore.kernel.org/dri-devel/1602799340-138152-1-git-send-email-jianxin.xiong@intel.com/
> 
> 
Hi John,

Thanks for pointing this out. I didn't realize sending out patches individually would cause
the difference compared to sending with a single command. Only version 4 and 5 have this
issue and I will switch back to my old script for the next version.

Thanks,
Jianxin

> thanks,
> --
> John Hubbard
> NVIDIA
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
