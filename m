Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F256282B6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15610E2A2;
	Mon, 14 Nov 2022 14:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC6610E0AB;
 Mon, 14 Nov 2022 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668436644; x=1699972644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fqjxd+kn8deGqWn9xGS30cpvBx02MJh2aCQDig4IY9Q=;
 b=VNm825hjm9mpT63mvA5iqhLKy3SZaz6/QAV2asZjG7yXZ4Yo0JSQReEa
 sdGAg/s25kx3NWaW9ndX+rmEZB+1/cRB8vuRX8Z553LnZpo7J+tACNLbT
 XETyv+Pt6UGCFzbkmwyqR1CtT9NvMYzPqgVmr5fbFBkKAlxQGTezej1Ka
 uSVTBH3UlbAZJIOZJpm78Nzz4vQnQU2J/7V/ASbTtPd0K6jXiJBgniMox
 K2rXmm2lIaZ4ReUX6iY9vv+Pv3m/KPkJ8KCP2K2bo6j2nx177zuyjm2Cs
 uKM8RyS4hKZ4a2fn8WyFz4LJdy0jEFvo6pnKRJ5WbEqT3uAcjKLxUImFg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313785054"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313785054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 06:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="780944748"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="780944748"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2022 06:37:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 06:37:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 06:37:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 06:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7+4eAcOQFBxfvjE5y+XpomL/kCuhZw4+kXix8SNXnOq6+HpkEE+rThTTp6n6P+D7mYVpP5h+M/KeUtAhwPwc1/YjWsL1dxGSbMvMCceO70yg2ZhC88WHW07Mcq2p++TOzyNZ/+b1DEe55Cp8hQRqH3Af40lnVc8dq2gq/x9hr8kFuVZ9SqAznxb4tYmty5KpZ1QQGWDw6s5zjuwRkApk+5Zu1OaP2y1HwdALv25VV6TJEjYT3ZytrYCJBN8qjNwiVqxni2sl68pMJDEr09BuVs/jYr6UwjtkB76aT4jhPUFs5+6Ds929GaM9nYA/pbedUcEfG7tmh0AuCQQXs4vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqjxd+kn8deGqWn9xGS30cpvBx02MJh2aCQDig4IY9Q=;
 b=cAcOrWXRAkdO1/4j5cl2b+rpZOZuQ1NGxquQikmPRoISKeyBTsqRg/OAhXdujZ7TvRSeG1dCxaT6lNj7odHitZwzF66qk8dXa26TY6z5XwUDz+XMwOkERDcoJq1MvuI06hGmJkjbKKa8jHcpooPApJLfi3xtQzqpwVhNNTmsnp9TBZ4XYtQ+9IbNUlkDG5F7Hhjhtr9NcJpGEq+4jdz9xKHMrDRi3YJmzckeIabgwGjwmx52D8CXmJIAfNRsuORYN08VObEdoE7ERy1pt/7c3wRlFTppSoLmIxi/sDj3NnfTRUSuQgnLWSC3yxkz5f1q1rrdNE4lkSri0HxZkKII0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR1101MB2230.namprd11.prod.outlook.com
 (2603:10b6:910:1c::20) by PH8PR11MB6877.namprd11.prod.outlook.com
 (2603:10b6:510:22b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 14:37:20 +0000
Received: from CY4PR1101MB2230.namprd11.prod.outlook.com
 ([fe80::1c3b:a2b3:e3a0:c1b7]) by CY4PR1101MB2230.namprd11.prod.outlook.com
 ([fe80::1c3b:a2b3:e3a0:c1b7%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:37:20 +0000
From: "Yang, Lixiao" <lixiao.yang@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Topic: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Index: AQHY+CfUgk92vmsKhkmQbdxwsCTA464+fKLA
Date: Mon, 14 Nov 2022 14:37:20 +0000
Message-ID: <CY4PR1101MB22308F4687554490AF39DA11EA059@CY4PR1101MB2230.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
 <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
 <Y2vb4fuPZdYKR1M1@nvidia.com>
 <127303b5-8753-f866-1811-a67ff4bc021b@intel.com>
In-Reply-To: <127303b5-8753-f866-1811-a67ff4bc021b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR1101MB2230:EE_|PH8PR11MB6877:EE_
x-ms-office365-filtering-correlation-id: fa961fff-ab4d-4115-abe2-08dac64dbc93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMzouJJTdB+1PwakxBre139uzgzIBsIzuZ1jAsDeAFMjYmbSjk5cf4Is7NbxeIT2cCbSUQKsq4kfjIqxGWkZdoHZ7pBbpnOKq0Hc+ZuT7vXXwaKA5+6bDVgKgqAgw3E6WDv3dlghKZR01mEkI3+zYFCE4Lx07egsVBb7epI7cRHgW4yloTfhamIyzfwRvI47g/05bNDuFkC6qIXjir+eBKlG0dbKxYEoBJK+I2sIrsDTPkKWqLpb49mCTg+8qSLYqbfnwkn6WnqUaVJMBucB/laGSnzRVtifQcL0bHQsTY7SFOlDd/vOSO01sp1rvOyNc9CKYIiPhJhQdTR/XvZ9R8GndBb21uttB8MqdIexBg2Rpz5XxW8mAoJNsdQXf5oQZicoyIBVWS9enS9THbXsRK16rsX22JCHUrI49hyc7DRq7Yh2LHk/VwDK9ytLNPj8KWbEUJOXDW7HHnIO+dQN29bqE58q/JOJ6sLTaywUZrIy0lAQ3fDV1VgTUCuSZDhNMPTAjGZ0IJ7fJBs/bCNnHJy+x0xfYRrvvvBTg1vFNKEOu99P017P99qnIiMXgLpZdaShJHe7MitxV8lWDgQpkmrNdDy+5/69bvzx6SCZsoCqly6f8kxLQq6bNGZFqTimDPwP8gchHIMKdIT2S5b2wzWp5tvKLbdkkYUBrO/DtA2N8MxUv9xcWK8FE++UVHeg1SEmbWShIOZdw1kkBvx5o4eUFybekk+5Qgv3m8EO9ygeZlcM7k1k1gHFlQ3dKdq17fjN5+gjavQUChn/B/IC5t/roRdXhCqZlT8h4NZLCZQ4Q112BwWtCSTV/8AmDCSTC0pKq4FmMVwh0sIV0Y7RxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2230.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199015)(83380400001)(38070700005)(186003)(122000001)(82960400001)(2906002)(38100700002)(8936002)(52536014)(7416002)(7406005)(53546011)(478600001)(5660300002)(6506007)(26005)(7696005)(41300700001)(9686003)(71200400001)(966005)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(4326008)(66446008)(55016003)(316002)(110136005)(54906003)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cCtFZ1h1bWlqTXZEOHpvWC80cTJqN0xDMXhOdEN5MVBmdlNqUjlteGFHY1Bm?=
 =?utf-8?B?bXd4S3BNSkJVUHNpSEhNMWlpaFpGY3lEWklNRHFOVkN4RUxTY1JydkM5d0xx?=
 =?utf-8?B?WGFDcTc1b25LVU9MOE1NYm9ReFhrbUFla2NxT2NIdEhzeE15ay9iRWxPcjZK?=
 =?utf-8?B?WnZlOHNVM1FEYTkxbksvOTZ2RC9XdStHV2JHdnYyTDlXa3ladmN2c0tIMEVY?=
 =?utf-8?B?OElKb3BIcXhPTjFRTythYVJ6ZllIQlFydDQ4T1JUcld3S2R3YWpiaFpyLzI2?=
 =?utf-8?B?cGh4NUhkbGxQeWErK3JzZHplUHRlK016ZVR4UWxBaC90N0wzSC9obWxQSXJE?=
 =?utf-8?B?QlovTkhwQjhiZ1VjTGlVTGZGdE85Q2FpakltZ1RKMlQra1ZNb3plMlJoS3BS?=
 =?utf-8?B?NzJJMUt6cStFU3M3dXpHWTlXWlRlelJLWXk2bXB4ZUMxc1lwRUM0bWNRYmlW?=
 =?utf-8?B?alR6SGRPQnA1d1N2aHcvMDNOUDByOW1DV3hxRVdGdHpzb0Z2eXNFQmpDYmVx?=
 =?utf-8?B?YmsxUTNnWFU1Qzd3YTJ2UjhWdC9IdjRyQlZqM0g4NUxEbk1FTWVqNCt4MHk4?=
 =?utf-8?B?U0drOFAvMUNBaW5md0RIMDZkek9UQUhSY0RiWHhqSVM0RE91cW9uWStSU2pB?=
 =?utf-8?B?cFFvOXE2L1BJbkQ5cFM2Wk44NCthSVVMcUJzQk1nb2svTThPTUExdkVEdUNB?=
 =?utf-8?B?SnVaUnd6QVZvbnZMRG5sZjZjeWZLT2xqYlpsNW9YT0MwZEI3UFppTkJuTUtZ?=
 =?utf-8?B?U0FXa2djNzVxcVQrK0tRNjZVOUIrN2ljT3ZTOXp1RGtUb2pxUmJJdnZ1blI1?=
 =?utf-8?B?NHk1Q2NSWTg3YUpkRWFGNG0xVUFzSHMyY3JjSDdTeWJQVXFvQTdIckVUdk94?=
 =?utf-8?B?OS9VVnBmRmcxQytsTmVGZEtBZDBBU2orNFJlWUwxR0pYWE81MHplZFlLbVMv?=
 =?utf-8?B?MDBCQkZTeHpKeDlXRWUxNjdTZHltN0J0dmdrdWRSYnZDclFaS2dvV0xDMG5S?=
 =?utf-8?B?WG8yU1RTNm1zRlQxd3I3TDVnSFRuczBLNzVQUTRLbUtJYXl5NWVFV2xpbmE1?=
 =?utf-8?B?b3Q5WGhqRkJuRjhiZjM3WUs4d0VWclN5STg0SS95RldHaEpKY1RYY0hSdEVV?=
 =?utf-8?B?NWU1YUR2MU5QbXNJUWV4dkZhWGw4ZFY3ekhXbGhrRUpveVZDeElvalprdUYy?=
 =?utf-8?B?VHlzc2UxR1NqWnozL2lnMWp3WTI0WThhdXZJbjNwWVVkTFpLWlhLUFV0bHlQ?=
 =?utf-8?B?ZXdRSWc3d1BySmNFdnpyK2EwUzB0clFqZGgvN1l0RERYOTJEcjhleGdrQktJ?=
 =?utf-8?B?RThQUnFtM0N0WFAzb0VYdnVFOGZUSTI1cDB3UWx0RGMva1ovTHFsWHQrRzVY?=
 =?utf-8?B?KzA4d1NuKzgxUmR5emNjc1ZZckVBUUhndTVYYUM3SThqQkNKb2l1cmRtaTZq?=
 =?utf-8?B?NURlckZiQlpmcjArWU5DZUEwMUNmUFdsTUQ3WEs4SnRRcy8ydXI0WjROU3Br?=
 =?utf-8?B?Wm5KWEs2MjdneVRjK1ByNktoTTlnRVo2bG9saVVaVXJYRXduZXc2cVFjck5P?=
 =?utf-8?B?QnBja1BRampWNnFPUWFJMURrMVBqcjFiRUZlTXVpRlVlTUFrU1h4dG9zcCtw?=
 =?utf-8?B?Z25GNWxsSXM0WFZBWEM3SU9Ea1I5WldrVGFPbVZoZW5FZFRDVC9XTGdLc2NX?=
 =?utf-8?B?ZWhtV3d1KzV3RTZVWWltU1N5SVIvOFNjUmJ0bUQ5Vml4aGNuMWtGd0NxczZw?=
 =?utf-8?B?eU1OcWlYQ2VaTE04dXNQajl3Wm9yMnZwTEJpd1lLdmFORTNUSjZHYURValdG?=
 =?utf-8?B?enpka1NSUE1zMW5tdnB3S2Y1S1BvUnNuc2ZVWXpDWW52UUUvNi8zS3NUZEE1?=
 =?utf-8?B?MDFWWWk3RisvajZuT1Bzamd0bUJQS2FWM3NYYUhXb1VoRGlLMldQTEIyalRv?=
 =?utf-8?B?YVJsUnE2bWhheE5IRzBlYnNLS0JWUHdWL2NUNHN6N1M3Ri9PalMveW9lOXh6?=
 =?utf-8?B?RGxMV1hBeUtTdG1zUWFZZnZNWmFiMCtQU1NPUXRSNE9PRkpRM3l5NUxSSU5x?=
 =?utf-8?B?YWE1LzlRUXA4NlRnTlVyKzBpNldYVUlLM2I3enFxemxRbCtuOU90UE4zOUdO?=
 =?utf-8?Q?SejOHrnKSCzGyVp0BzM+IIBge?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa961fff-ab4d-4115-abe2-08dac64dbc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 14:37:20.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDLZMwiVcsahIqRY4oAOfUN0Kuw8UPZsN3LOHOB/yKZc0dE+3lttMrMLjjB3ni776lgG4BonNXzhI453YwdzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, "He, Yu" <yu.he@intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMi8xMS8xNCAyMDo1MSwgWWkgTGl1IHdyb3RlOg0KPiBPbiAyMDIyLzExLzEwIDAwOjU3
LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+PiBPbiBUdWUsIE5vdiAwOCwgMjAyMiBhdCAxMTox
ODowM1BNICswODAwLCBZaSBMaXUgd3JvdGU6DQo+Pj4gT24gMjAyMi8xMS84IDE3OjE5LCBOaWNv
bGluIENoZW4gd3JvdGU6DQo+Pj4+IE9uIE1vbiwgTm92IDA3LCAyMDIyIGF0IDA4OjUyOjQ0UE0g
LTA0MDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4+Pj4NCj4+Pj4+IFRoaXMgaXMgb24gZ2l0
aHViOg0KPj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2pndW50aG9ycGUvbGludXgvY29tbWl0cy92
ZmlvX2lvbW11ZmQNCj4+Pj4gWy4uLl0NCj4+Pj4+IHYyOg0KPj4+Pj4gICAgLSBSZWJhc2UgdG8g
djYuMS1yYzMsIHY0IGlvbW11ZmQgc2VyaWVzDQo+Pj4+PiAgICAtIEZpeHVwIGNvbW1lbnRzIGFu
ZCBjb21taXQgbWVzc2FnZXMgZnJvbSBsaXN0IHJlbWFya3MNCj4+Pj4+ICAgIC0gRml4IGxlYWtp
bmcgb2YgdGhlIGlvbW11ZmQgZm9yIG1kZXZzDQo+Pj4+PiAgICAtIE5ldyBwYXRjaCB0byBmaXgg
dmZpbyBtb2RhbGlhc2VzIHdoZW4gdmZpbyBjb250YWluZXIgaXMgZGlzYWJsZWQNCj4+Pj4+ICAg
IC0gQWRkIGEgZG1lc2cgb25jZSB3aGVuIHRoZSBpb21tdWZkIHByb3ZpZGVkIC9kZXYvdmZpby92
ZmlvIGlzIG9wZW5lZA0KPj4+Pj4gICAgICB0byBzaWduYWwgdGhhdCBpb21tdWZkIGlzIHByb3Zp
ZGluZyB0aGlzDQo+Pj4+DQo+Pj4+IEkndmUgcmVkb25lIG15IHByZXZpb3VzIHNhbml0eSB0ZXN0
cy4gRXhjZXB0IHRob3NlIHJlcG9ydGVkIGJ1Z3MsIA0KPj4+PiB0aGluZ3MgbG9vayBmaW5lLiBP
bmNlIHdlIGZpeCB0aG9zZSBpc3N1ZXMsIEdWVCBhbmQgb3RoZXIgbW9kdWxlcyANCj4+Pj4gY2Fu
IHJ1biBzb21lIG1vcmUgc3RyZXNzZnVsIHRlc3RzLCBJIHRoaW5rLg0KPj4+DQo+Pj4gb3VyIHNp
ZGUgaXMgYWxzbyBzdGFydGluZyB0ZXN0IChndnQsIG5pYyBwYXNzdGhyb3VnaCkgdGhpcyB2ZXJz
aW9uLiANCj4+PiBuZWVkIHRvIHdhaXQgYSB3aGlsZSBmb3IgdGhlIHJlc3VsdC4NCj4+DQo+PiBJ
J3ZlIHVwZGF0ZWQgdGhlIGJyYW5jaGVzIHdpdGggdGhlIHR3byBmdW5jdGlvbmFsIGZpeGVzIGRp
c2N1c3NlZCBvbiANCj4+IHRoZSBsaXN0IHBsdXMgYWxsIHRoZSBkb2MgdXBkYXRlcy4NCj4+DQo+
DQo+IEkgc2VlLCBkdWUgdG8gdGltem9uZSwgdGhlIGtlcm5lbCB3ZSBncmFiYmVkIGlzIDM3Yzll
NmU0NGQ3N2EsIGl0IGhhcyANCj4gc2xpZ2h0IGRpZmYgaW4gdGhlIHNjcmlwdHMva2VybmVsLWRv
YyBjb21wYXJlZCB3aXRoIHRoZSBsYXRlc3QgY29tbWl0IA0KPiAoNmJiMTZhOWM2Nzc2OSkuIEkg
ZG9uJ3QgdGhpbmsgaXQgaW1wYWN0cyB0aGUgdGVzdC4NCj4NCj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamdnL2lvbW11ZmQuZ2l0L2xvZy8/aD1mb3It
bmV4dA0KPiAgICgzN2M5ZTZlNDRkNzdhKQ0KPg0KPiBPdXIgc2lkZSwgWXUgSGUsIExpeGlhbyBZ
YW5nIGhhcyBkb25lIGJlbG93IHRlc3RzIG9uIEludGVsIHBsYXRmb3JtIA0KPiB3aXRoIHRoZSBh
Ym92ZSBrZXJuZWwsIHJlc3VsdHMgYXJlOg0KPg0KPiAxKSBHVlQtZyB0ZXN0IHN1aXQgcGFzc2Vk
LCBJbnRlbCBpR0Z4IHBhc3N0aHJvdWdoIHBhc3NlZC4NCj4NCj4gMikgTklDIHBhc3N0aHJvdWdo
IHRlc3Qgd2l0aCBkaWZmZXJlbnQgZ3Vlc3QgbWVtb3J5ICgxRy80RyksIHBhc3NlZC4NCj4NCj4g
MykgQm9vdGluZyB0d28gZGlmZmVyZW50IFFFTVVzIGluIHRoZSBzYW1lIHRpbWUgYnV0IG9uZSBR
RU1VIG9wZW5zIA0KPiBsZWdhY3kgL2Rldi92ZmlvL3ZmaW8gYW5kIGFub3RoZXIgb3BlbnMgL2Rl
di9pb21tdS4gVGVzdHMgcGFzc2VkLg0KPg0KPiA0KSBUcmllZCBiZWxvdyBLY29uZmlnIGNvbWJp
bmF0aW9ucywgcmVzdWx0cyBhcmUgZXhwZWN0ZWQuDQo+DQo+IFZGSU9fQ09OVEFJTkVSPXksIElP
TU1VRkQ9eSAgIC0tIHRlc3QgcGFzcw0KPiBWRklPX0NPTlRBSU5FUj15LCBJT01NVUZEPW4gICAt
LSB0ZXN0IHBhc3MNCj4gVkZJT19DT05UQUlORVI9biwgSU9NTVVGRD15ICwgSU9NTVVGRF9WRklP
X0NPTlRBSU5FUj15ICAtLSB0ZXN0IHBhc3MgDQo+IFZGSU9fQ09OVEFJTkVSPW4sIElPTU1VRkQ9
eSAsIElPTU1VRkRfVkZJT19DT05UQUlORVI9biAgLS0gbm8gDQo+IC9kZXYvdmZpby92ZmlvLCBz
byB0ZXN0IGZhaWwsIGV4cGVjdGVkDQo+DQo+IDUpIFRlc3RlZCBkZXZpY2VzIGZyb20gbXVsdGkt
ZGV2aWNlIGdyb3VwLiBBc3NpZ24gc3VjaCBkZXZpY2VzIHRvIHRoZSANCj4gc2FtZSBWTSwgcGFz
czsgYXNzaWduIHRoZW0gdG8gZGlmZmVyZW50IFZNcywgZmFpbDsgYXNzaWduIHRoZW0gdG8gYSBW
TSANCj4gd2l0aCBJbnRlbCB2aXJ0dWFsIFZULWQsIGZhaWw7IFJlc3VsdHMgYXJlIGV4cGVjdGVk
Lg0KPg0KPiBNZWFud2hpbGUsIEkgYWxzbyB0ZXN0ZWQgdGhlIGJyYW5jaCBpbiBkZXZlbG9wbWVu
dCBicmFuY2ggZm9yIG5lc3RpbmcsIA0KPiB0aGUgYmFzaWMgZnVuY3Rpb25hbGl0eSBsb29rcyBn
b29kLg0KPg0KPiBUZXN0ZWQtYnk6IFlpIExpdSA8eWkubC5saXVAaW50ZWwuY29tPg0KPg0KVGVz
dGVkLWJ5OiBMaXhpYW8gWWFuZyA8bGl4aWFvLnlhbmdAaW50ZWwuY29tPg0KDQotLQ0KUmVnYXJk
cywNCkxpeGlhbyBZYW5nDQo=
