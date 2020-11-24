Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346862C2CAE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ABB6E440;
	Tue, 24 Nov 2020 16:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E46E440
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 16:21:12 +0000 (UTC)
IronPort-SDR: ZrO2UpLmy3ukB1ndzJiboLD9iPI10gIVHRCSaJKqN36g79rjG1CZ3wzbK2MLSYlQnNxGlaJjjD
 TO59oaIsyE4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="168464479"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="168464479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:21:10 -0800
IronPort-SDR: YNh0VaNg91IOOrsKtNYqh7lo1VdW7fEhSImKjdh8rnlcHGYEApZJKe1xhxdUjivfD4hJSyQiIA
 TBAc3O9NqOsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="365061442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2020 08:21:09 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 08:21:08 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 08:21:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Nov 2020 08:21:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 24 Nov 2020 08:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWikc5wmJFZ35beGI5bZ9pM5j9mp1Go2aqx3x9HroFs+PX/SHqeGnMIngqyJ/WJmuidPiV5F6goM+2KDvW/+Bn0qynkiBLxf4NlNMahw2qEhcQteCkYRahLtJXBZM3y3m+i/dkQLsw+S2COTLplUgGg1NHpoHW1r09AAoBnEwnBPNMhWHKyCgLDM7L2T31tQWlj77fIxHDJwEOcpzSpg1xhLPP1QLFO1GKS0bjIXRODlyYWXIrU+RQdxNESjf3Qick9P8GZDBZe0ZO1QNduIRmvGbY64Os7q6xv0L4ZyeGHij7sNQGspTZV5UgxEMCtQ9e9iO/s8xScWflgdX79zCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbWLXvcsEkRND6xW798ZustdbLZAGot0X4LpEMz2vNI=;
 b=LSzmTnuohq1NKfuQcWJ/teqmAHHZ6l8/0hRYFk3p5SXzQT+9wWTLR9Vnfk0qkKJ3z44aKyiWefnpHE6ahJT7lHKfZhrzH1jIhR73fngQxV96v4Irazai4rilqP3PXmpkSL0Y+FJ4EVNK6Eu2b2qu+B4PLpp2kQarBAFq7e7c8UVgQVkGtLt0v+P0A0KZeA/WbFOqYw1uwDqHh59ZrFOw9DacY0U4g34R79u7FG+ojYtMyoGjTmRJLXu6rcsCZTMua2feVeHaCFgK+r2hkxUI36u6dL8qV44uPW/GokTq/3hkeoWGxypml3Mz6D73ks8gk2IBwHvjoe6X83ZUUzmTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbWLXvcsEkRND6xW798ZustdbLZAGot0X4LpEMz2vNI=;
 b=xY6ijk6zGBaBy8TRwXLyqwVNdu2g3Anz6GohMehwql/bTOjbdTAR7DXTd3YFg35Z7JSAn6OBvuLTNTvBytlEEDYRitlITYl1wt0KhM/snxpYscITyEoY+8Oj+OEPBgWK+m2G3MvX2mJ9DwQkX4+GU1R18R8jFrd2tYLlRKzmEck=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2109.namprd11.prod.outlook.com (2603:10b6:301:53::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 16:21:04 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 16:21:04 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWwb+RTBTJqBZYLEWXdlNPeqTq1qnWAtcAgAFjXQCAAAVwAIAAC2nQ
Date: Tue, 24 Nov 2020 16:21:04 +0000
Message-ID: <MW3PR11MB45557126CBD10A3A8798F94CE5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local> <20201124153626.GG5487@ziepe.ca>
In-Reply-To: <20201124153626.GG5487@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: f04cbdcc-6218-439c-8703-08d89094f101
x-ms-traffictypediagnostic: MWHPR1101MB2109:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2109F94654A374256344F1FAE5FB0@MWHPR1101MB2109.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yuj2BT5lnvFMKcwVRZ4JG6Xb2s7XVvcdMBTvSedmBevEdFEisECT/cDg3lQjdias60YDo62gFngfMmkujv5cuvm43E85B9HIR/3ZFfl281+gcJZ6/snJHDzvVy9qTpy8vtO6E04fiQeMk5pU4VbnNIDQAmiyqB/baYR2/Xo7+FCRV72VMHmC7CaPFYREn/2KTLCgr0kdkVA9BQILq3uwnuklodmRTMJrUjEE3lm8OXeQJW0mKLO/lhtrWknDN1EpX64zZ9it1sI4nb+lnbZW0/dnT/N3u58mN1psNU0SON1Kd/q5mZBuNckzcFdIOhBgmMysRIUVRtHtIg7q6rmoBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(5660300002)(76116006)(66946007)(53546011)(6506007)(83380400001)(7696005)(2906002)(33656002)(54906003)(26005)(186003)(66556008)(66446008)(66476007)(64756008)(71200400001)(110136005)(52536014)(478600001)(4326008)(86362001)(316002)(55016002)(8676002)(8936002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?90URRPZGYiU19y87rE5Lz4vVlJmWOVUzMId3jik8f+8xZklfmCyqsaPv7n0K?=
 =?us-ascii?Q?bVcaev+SdCfxE3LHhIR4XaYfiMRUsHipAZTjO86MqKglQJTS5IAl6DjOWXkm?=
 =?us-ascii?Q?u0eItNmfK+3GsHLaL/GhSN6arP8UJrlaCfjeUKBW6VedR2xyqoiY2h3r4JZC?=
 =?us-ascii?Q?beKADVSvORpUTIhKc15NsZqDWWYn/UNYhNaVXxS7MpjAhhtNIkZYOJNMOen4?=
 =?us-ascii?Q?iTahve3bnZz5yEH9z8keOh4Nidm0O34SCUj2DVZbt3+NqyV6mzcO11qFOphV?=
 =?us-ascii?Q?QxkM9Xj2wmbZS77feFCT62Tghg6UKJbk4XX9z9x6l5CKeiQYqWyUdbiHNzdc?=
 =?us-ascii?Q?C9SuY1Gmyd7ApLi9phZaWSJ8KRMpFb7tr8Y4QzlMircgDBAsOCUUd/M8WmYb?=
 =?us-ascii?Q?4YS9rWIQzTebRBYKgoKsz9ZMVSEc6URLTkB76L4lzMmHWd7klj/nSkka1C8J?=
 =?us-ascii?Q?GL/2nlvITksuW3VgFnDUUWY8R/9VijJ1Ev7lTO+Am3tF5e5RKyuKAnw9iR5y?=
 =?us-ascii?Q?9Mx2B3R3M8PjqMKX0PTzT/WcZuQQRCheBHI7uD+JrtlbUjWIsioND6XedoTO?=
 =?us-ascii?Q?dX7FEtyuAG2LcO/YoKJDn/yfuBfujWE7NC3c+a0euTKYQDz5WeCS/kCorMY/?=
 =?us-ascii?Q?t7YkeXofhdMVTk3gIOyrGHPlMXiWHlicqMhYeLErJQxIoyvOr+Aziw1ZqEbK?=
 =?us-ascii?Q?HcsW823uJthA/PAIhk41Nmt9Cg2on2rJV7WKnueOMfHXW3rVBnOmuuY/Ybob?=
 =?us-ascii?Q?la9C4v9aVTMKFq5PTzvqX/MU20koKNtKlQFNc18/t/k5k0eh1n1Ya3yqAjuD?=
 =?us-ascii?Q?2iPpVzK6Tksj/NlB7QNt5UuHuObQA4OACrES4w5cVsvWD9DWpI7q6ucUE14d?=
 =?us-ascii?Q?0YSiHXSqKjqQ55WZSh0VNoMy1edA4vUEI73i+vEeFqLfGQeOKkGb03tHutUx?=
 =?us-ascii?Q?/muMzsZDEg3l68jaiCwdSpg2ONwysNr+WqOsnF2s3uI=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04cbdcc-6218-439c-8703-08d89094f101
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 16:21:04.4490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dOnY7tovNo796Iieln+qcKljuBu8YCIbLdOZ1UNdoDLrWNB+iCEWlt8PGeNiVhmn2uToP1q6/GyQTInFuGg+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2109
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
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, November 24, 2020 7:36 AM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-
> devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> 
> On Tue, Nov 24, 2020 at 04:16:58PM +0100, Daniel Vetter wrote:
> 
> > Compute is the worst, because opencl is widely considered a mistake
> > (maybe opencl 3 is better, but nvidia is stuck on 1.2). The actually
> > used stuff is cuda (nvidia-only), rocm (amd-only) and now with intel
> > also playing we have xe (intel-only).
> 
> > It's pretty glorious :-/
> 
> I enjoyed how the Intel version of CUDA is called "OneAPI" not "Third API" ;)
> 
> Hopefuly xe compute won't leave a lot of half finished abandoned kernel code like Xeon Phi did :(
> 
> > Also I think we discussed this already, but for actual p2p the intel
> > patches aren't in upstream yet. We have some internally, but with very
> > broken locking (in the process of getting fixed up, but it's taking time).
> 
> Someone needs to say this test works on a real system with an unpatched upstream driver.
> 
> I thought AMD had the needed parts merged?

Yes, I have tested these with AMD GPU.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
