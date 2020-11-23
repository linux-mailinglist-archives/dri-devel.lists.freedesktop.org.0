Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D782F2C1481
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 20:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9129C6E0A1;
	Mon, 23 Nov 2020 19:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E852E6E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 19:40:24 +0000 (UTC)
IronPort-SDR: 3+WPetUU05NCo/5GQHxa0/hsW0UokhqXoStowrZYtJVXcbEie2T5RvcuLv3qDt5Im7Bc66ZOxv
 LPL9gFDCqC6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="158871089"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="158871089"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 11:40:24 -0800
IronPort-SDR: h4tjOtPIBPK+qxrvNsi0ymh1XTHjMc6rLvvLfudgoIDO2BuhHLv2eBnjFjxaYkgjCcw2Dz3sFN
 qW5usob03rrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="312995720"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2020 11:40:23 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 11:40:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Nov 2020 11:40:23 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.59) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 23 Nov 2020 11:40:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehcY5h799KUMXTQUOE8ciYUBysj9f9+BU2XW0KOsV7smx6TCFK9UCakBvwc4kDAsiml+GJAq5btMRmF6qsMwgYbKHRgnlpjtVpw6qjPZA7+9qbn/XCd28D7EXxsnaqyCYWRa1BXKanGOiiFU0ovIhCLgd4yIQE2E7U/T+cRGHpnjVtwvZJtY5A+SkRenzizSE16zrHPYwaO1WHVpLz4Cb4PpBHxmOnqKcdfblqqN2f8Wq1nE5kbO6XN+iWxG+uFDUaEsOh3JK2zZKJvcpBHk7H6Dx5V7OkE1ZKL7y4qLrNTxDcVHSwocl+nnu2EgyZXJ17g6MVrVJJCWn8+cNgSBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz0bDjnI55GrH+QnjN5k2PHG3AjvjSYi+2ZBb6CJmFs=;
 b=B/dIW9kgQamD+bithIdjppZQuOwStVHhbinesVaBYgCMdL5LlP/v3ea9DXAuLQd2mQSq9u6WoAv8lq5dh8ALsxPcc9FCZFgSavyaiXJY44sel2YsEorL87aCyvdey4kVNo08ridqUbu5t4bl9UbwcEeIK/hy3+ZUF2/Bckjr2zR0RwoC4PLaln3WI+RiqVnPHghIi5MWXtqLsad8KerjCwVAxj9VlOpfgtVEW5mj51aIMRQHG2n+rEcNNnNbVUA3rR84FvKK20NdvU2/JKSz5zzXN9icttaxG/GH972rXAXA0Bz6ms6P6a1vcOWhzri2VzcSoh4tJhVYuia9NqSQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz0bDjnI55GrH+QnjN5k2PHG3AjvjSYi+2ZBb6CJmFs=;
 b=MX40urFO/q46ZewHwrjCG2p3t/pf24t3Y9JiHXjx6W63Og6N9NPOneImGBerKNvkMaIhpON4actwKVoMKMF2co5SSqKRjzxO0SVxxjCQBLjLvJPZwJsEwIyU0muJAUFfTpzFN3NYDCkR06uf9Q6xa0RJ354gg0yCvNVaAzGPuu4=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 19:40:19 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 19:40:19 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core 2/5] mlx5: Support dma-buf based memory region
Thread-Topic: [PATCH rdma-core 2/5] mlx5: Support dma-buf based memory region
Thread-Index: AQHWwb+SA/RCVtXmxkmIh6XX7Boo76nWAfkAgAAZFOA=
Date: Mon, 23 Nov 2020 19:40:19 +0000
Message-ID: <MW3PR11MB455503CB188A47B40A142A7EE5FC0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-3-git-send-email-jianxin.xiong@intel.com>
 <20201123180158.GZ244516@ziepe.ca>
In-Reply-To: <20201123180158.GZ244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 862391fe-39b0-43cc-3a1e-08d88fe79c22
x-ms-traffictypediagnostic: MWHPR11MB1534:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB15340A3C4FCE692C86DFD64EE5FC0@MWHPR11MB1534.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bvHWM8hq1nV7B6VSl4yS4lrfuAbkpEwtVsAB4QmpyS3sP1bJdotjC5Qu5Q/Bym64mLw90Y7QkswyLAhSJlkwCggZGPnlIQW1nIwi1J5AzxWng2kUPIp3ZoIHTMbXeg+OPgjKkB9hXtCOwRznn5HnD7d5n7Quuy0LDt6s8go9CcfjyKFhN/FYSC35sDUu89dPZdR4qBhDKxqLLAglFz/+bD8PVCSKRRH+aemAc7mH/s+eAyWDqjOOARe/3eCqVQ2YPVjP7fVEQGWGCiuf7Z4D8HwddwUrv5aXqL0UoJN8r28Kowtepfky8HV4NQhALcKAvyxrTp2WXohNvnafVkLXrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(8676002)(8936002)(55016002)(5660300002)(478600001)(9686003)(52536014)(66476007)(33656002)(64756008)(66446008)(66946007)(66556008)(6916009)(6506007)(76116006)(83380400001)(86362001)(4744005)(2906002)(26005)(71200400001)(107886003)(4326008)(7696005)(186003)(53546011)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/uhX5EVfPfEGXAuHnsgywLE+fQPEP978PwcDBepImf3uFuQ6mkOLL8zCj6Z1?=
 =?us-ascii?Q?TnZ8B8SdEPb8P9g9aBKtnRtatY038FXFLsBCknCVRRLn6kHt+xSRc4pJgPlb?=
 =?us-ascii?Q?HA32INWgGQKV6J+xcx30QWcnAaU87o9OYVrwes2MJwL/9R6/chEi/S8t0bvj?=
 =?us-ascii?Q?keIeT4Fx9o40/w84x8acTJRXjGBiIDE1ifPftBSVf6KLwvw/MapoYbvNFAWD?=
 =?us-ascii?Q?xXdKlhNaSCXQHoOYrc8XcJlMwD0gK/gqfTA4K8NrJfZT/OvD8TprpTZBFTGb?=
 =?us-ascii?Q?97v/L813Nv8pj2gWniQUpYQRcZpOrVS/RfGIA+bxb3RTt01VtB1ZovOlmzHD?=
 =?us-ascii?Q?BenFS7igurRg4A0l4etVBv3O1yRCzp8BNnKMIPbtKv6KPCLW4KP7LmZcv3bs?=
 =?us-ascii?Q?JQvZ42ECfvByVX5qBWcCBI5vzaw5M+UhOhfhfPo+HQNtgwr4teJKIMvabY8L?=
 =?us-ascii?Q?oq/3u7Bw7E06qDljIVoA6CMmXVgJ7ZYB95RS/wWQAv31P6nWOYXnqO68RGRq?=
 =?us-ascii?Q?mgHyvWRrv2hSfcnEyW8YmT0Bh6TGmNDjbPmqJ3VCzYrOJWqg/LGRHUMGZ1Hq?=
 =?us-ascii?Q?03oXt+bq81m3Fg7yIzDig3ZUvM6ozvQZXkdcRjlbmG0e1DkhD8fCuYZ56BWJ?=
 =?us-ascii?Q?qUhVRHIxXDjlLGpPO1fzNl1cIG1LNwQi6Ahbe2QzyccJ9KM5ZkLsqMlXAT+Z?=
 =?us-ascii?Q?2fsPuLu2L0vN429b/ZeUvpxnlwOAI81JeE0kV09PWoVlpx6prYDkF7VRjkfH?=
 =?us-ascii?Q?4wcAZA6LHMnPKvbHqdRLDMJ9oDgmqNJhEMN48fc82/A0plLeTGSIQMNyf/Jt?=
 =?us-ascii?Q?iri4hIyAQc3AWeZc+Gj0A40yRmSj8SoyL/Rf08az/pHb3ygsPzSSAvIGqFP7?=
 =?us-ascii?Q?ihjZGK9k/ujY6Vc+FVH3VRanbMERMXIEv75pZwS01bOMbfw5forbP9N3i3xJ?=
 =?us-ascii?Q?rF6ZIS451nkQWfxyeYjl+O35lp/f5FaPdEOUj/LiOeA=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862391fe-39b0-43cc-3a1e-08d88fe79c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 19:40:19.1247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EC0QQTb0boNko9XOGKxdEpRnvw08eN3qwkhFlqwap1n423zM1PKp7l+XX5QWiBegpZzVG0BKQ/f2RfZQLYUSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
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
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Monday, November 23, 2020 10:02 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core 2/5] mlx5: Support dma-buf based memory region
> 
> On Mon, Nov 23, 2020 at 09:53:01AM -0800, Jianxin Xiong wrote:
> 
> > +struct ibv_mr *mlx5_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> > +				  uint64_t iova, int fd, int acc) {
> > +	struct mlx5_mr *mr;
> > +	int ret;
> > +	enum ibv_access_flags access = (enum ibv_access_flags)acc;
> 
> Why?

It's copied from mlx5_reg_mr(). Didn't pay attention to this but looks unnecessary now.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
