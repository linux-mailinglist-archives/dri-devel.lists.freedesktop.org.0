Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A266175A6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 05:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83EC10E22E;
	Thu,  3 Nov 2022 04:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06310E227;
 Thu,  3 Nov 2022 04:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667450302; x=1698986302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I3TirN9EDeLGgrmJL6cYy22CqgViJEMnsNWM2xU2wHg=;
 b=iKY5EQBEwVoOfZNAoTd1sSwa9fkuJPCs4J5f0dZbKmXTmaienARNKDFs
 T8JCwllre9FnBIVQPmnIwgPl36bXZk3yeEnXNBta4Nt3Yvscmp6gmFmhR
 EjVaEWyUSd5DNL2dGb+I4U3Cn/04+usmhMKl3TZK3RHylBq9duYboR6Hx
 gyPzQW94JCvY0yczVmiyVnEuWT0p9V2NqOzIC4dRavzzFez1xeA53xWTL
 I7LCSd9sTit43ynn31U78JYNAjb50CT9zMRL4y/HUIEjOMOcX4uB1I5Js
 u79+Tuw+xNTEhAcx8tITYf7GoLpQ5UtHefuHiVn8culWF6x0SaKe+T6sL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="373814355"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="373814355"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 21:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="634525110"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="634525110"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 02 Nov 2022 21:38:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:38:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:38:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 21:38:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 21:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZoYRh+GPeNjQfRQa/jLFsWH9LY0d+JVOcsOqbxceQFm+U/2gWynL+b/QIw+j50wjXI9sUUY1TcFo6/LF87vROzxHpsKT+M4dYKAyBj+4DRoXypk6nDFcrRh2uN+2wf0I+fQ24yjJokLiwe3aXboTSWzTpg5L4KDR4gz/n0JeBr9iry5oY4B8yEokN+1i6BPuDWdjaOIT1p1E4VOx0jqmSr982Fng4V/EItliKqtpZ8mvyJMVL4mSunx1L1XTeAoF7QvY3kiVc8oGjKdcR0nYBMi0864UmxjXbCCXs6RznQnyZYNFHSy/3OL6SAOzzeEH46pSeCBSe305ztWVyfJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QsD6JVCmLhC7kHAtWxM7I5YJ7dU3Hn/RgmaQcUYnnE=;
 b=XYagpwyEJwJ8j9rSg7GzMBbowO1tF1BqU+VZroZ2wz46UN0F1cF7qbMRj6JOQqAC398J4hlNave7HuF/9eAhH74jZOu680yaHpacIiQtS6EDzedAFDEaY7B1yZiN5k+vJurRAWZxP+yMQ+U5eRiqFAQnMHQTF7nyvl6EV48Vk8bnLEfKMxUG6OLh/Fd7YIVtHYTRC3LvwnetvrQvH0YSnQeruJMk96980H5zGn/z8udf8q1NVDmsrXpFtv3Np/dEIIMQwfgi3ruMy5BEbKNYM3NP97AIacHxhArke4rR1yw1ebTrx4rttYWqTWfdvu3pmCuHK6H00TNkOJeKnOOJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 04:38:17 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 04:38:17 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Topic: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Index: AQHY6J4OIe2WwX1TpkuArkGmC4dhx64pufEQgABPIYCAAqG6kA==
Date: Thu, 3 Nov 2022 04:38:16 +0000
Message-ID: <BN9PR11MB5276BC7EA64C4D4441DE9CB08C389@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB52766FB4EFCFB2197ACDC1F98C369@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2EQb6mSTKOvASlp@nvidia.com>
In-Reply-To: <Y2EQb6mSTKOvASlp@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7539:EE_
x-ms-office365-filtering-correlation-id: cf305eb5-f3cc-4d03-21d8-08dabd5539ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ijjbrMuAWo3bK5PLYIdf08Vl8S7v+2JUYXEcMhbovIs7/p8ktp9IOJRdw885vFnelTIWfOTLWSBZJlUKcELAtZeuxe2wYcRlWaBfrC1C8Ypzsm0CIz5JXFJt5mjLHtBEHjk6ejfs1E4bAs9G0a5wQHrlIX/fxGvV2wrskVlqBiYlYSzfTrWEH7YrmLAtzg3V6pzm43IdX8jusb6Ag+544+1R9+9oWSQMxrPdGmZ/izgAED9R2KbehXfllEytDBhxHT01yVig8heJ7di20yg+FrWTeTuSJeo3cBFG1QVQy2XSty3prsaAv6hl2dPHwiAd57lasg0DOOHdLUSzIs49rEveskX9QVoSdmZfaqydZEP5j9pe6Sz99kqDW9+oaAh7TYlxP8mq2JKXerJJBj2YpvcBWZlFcPlTS5YrEmXY1VQd+LmGoQlPkGhb1OL972KJ7pgiIcHrXBmIX/rq2XgNISvZzC3Sb4sgzwoA0oIDUaBlcV6dudwMoU0gezcTFeo4IslhP42nOi+v690AwiDl/X2F2/Z+blT+ezE3nr/4nMLSWlmPToqrcksVIQ2yBKStin54oeGCa2BcR9hFQtBeWi5uHh1IYDXHGFMcYwr3mN3F/BnTUGL4x+MaGu5bDTHx5hsVgmpYwRrgYaS9dQfpXmxD7SMdQBtZFQYuGM+2v/GFY+wgJhBzGaYpglztC9BPrRDMT4h5eRO5pgm+Y1Jy/IGeM4h3maHloeNG/S4n9CufLwIMHuB/qWA5LvP790PKWKX7Ikfvis7oqp/pNYilLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(33656002)(66946007)(186003)(6916009)(54906003)(4326008)(66476007)(316002)(7696005)(8676002)(66556008)(6506007)(64756008)(66446008)(2906002)(76116006)(5660300002)(38100700002)(7406005)(52536014)(9686003)(7416002)(41300700001)(478600001)(8936002)(86362001)(4744005)(71200400001)(82960400001)(122000001)(55016003)(38070700005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZjkrWMuX3KVPASp2dk90Tu4tnOxh5WV5dI0M2/e9FxGIFZjROqoe0q0Ghyis?=
 =?us-ascii?Q?cII+VH6vbhOHh+EzGIyj4yzLIX+ZAc9ePBouFtf970J8ifXfwQ5LNNN5oIFF?=
 =?us-ascii?Q?wBfbUwgf+8IPWkHfpwUF9GoKY9fu/HpXQjKmlu2SPVRhtwYj7JM8sslzpBQC?=
 =?us-ascii?Q?knyEss6zBlIlk7UKTWdExxW4xBQfRxNIzarFWAQarJgZc5pOG/pjm18Nw4Lj?=
 =?us-ascii?Q?34ICTB81lx/AhQICs+LvFLJg4AgDZ8caGUq07aYDCfvwzaRriTYItSJed3NH?=
 =?us-ascii?Q?qwX/Nr+cN9E+4/YQCHM4uBeG9UjqGV+bUapROS/A6tydAnJsFBHS8SJjoTrQ?=
 =?us-ascii?Q?kqueSfSYlLtLpiAsgot/N/GaZB/0IklSjmRxOAVVeOIZE89gsfXYauI1QBZJ?=
 =?us-ascii?Q?V5AvlNyGWUJJr0I4aaQcobQX1J8ogwQBGy/cztwVTisqQ1WZwBzn2M9WzP3l?=
 =?us-ascii?Q?h/hJx9H7AKbPN5v/FU8uJV7FhZvkYmGCEPTa9AF5Nm1HNLPCbVtP3rDfvQMn?=
 =?us-ascii?Q?bHBAs9mroknfAWxlAuY/NBxaNU3/e4Umo9AKIzB8vzB1nfPBrzYrS+9k8k4x?=
 =?us-ascii?Q?Et+HN0gbesBOXwC2KVmky+cTKYRUq8mniPvyIiOCLDAs1UwaQYKxvPLJjhwy?=
 =?us-ascii?Q?1YXUty5RPGOAAFWMK/bulyw+zhIuW6iWzzA8fAJdoZwzibBdOuEc1G73lSMb?=
 =?us-ascii?Q?UFsd2eW+theodrvL7ipkyfz5nupCH26er1PjF0yfYMcJoYaYa77xoKPzsWEA?=
 =?us-ascii?Q?xG+WnpAUvqWPKc5ZagIZ85BVmNkTUEAMhxUmOCZIR75dQU+EI/icuINHj1E5?=
 =?us-ascii?Q?ELEVMEr6y/Fzf4Zl3cWaQfPJ+HilS6sMVzcanvbmNj98dY+5itkBL74KvH0D?=
 =?us-ascii?Q?8nDLsItmRq/UdeJAL/Ayoqn5qfFMVRwPZB3FTnONXkxc5/PwIP2Kv1/cQ472?=
 =?us-ascii?Q?E8u1CgXA1/lgFt160xg9JLR7ftcfJP+AEKjmfU4k71RQVZbhfOGC74CYjOYW?=
 =?us-ascii?Q?h93b1fF6gBnhYGj80FQ9aqKL4k1rzBvLuy2ZOsT5BlPdxxLaFP66/v+Mx840?=
 =?us-ascii?Q?xch1chyirK8iyuwt7bRUyF0S4prGce7Ct5H1zXQAPaNXdxHl1QK0sSyEKJs2?=
 =?us-ascii?Q?dXmD8plJw3iQveYKXKmjHzmhmy7a74npsEvQ3f5mW6fiUyrO8H6X32opjxYl?=
 =?us-ascii?Q?hXFILiDKwYIBGiRSxaZxQNnD66YE2V3eWw2xjojH3ZeonkfJ0d3jDfZjkY0n?=
 =?us-ascii?Q?YI3xC3xSQOTGaHHqyhQMqEEZahzpqlC8AroQ/zFHyD+AdQ4MhSln3oZQWeqt?=
 =?us-ascii?Q?uTCbMtc4d1UtbHSx7ZwdLA6OqQgpHVvYGUPDQTdAbji6oVdvRj3Yyzd3YHSP?=
 =?us-ascii?Q?B1oQ5fW89yDUQUvN4/YXpaAjieNDCG8yoy6WG1OJNWVerZ8FAoSk7npH0XQ1?=
 =?us-ascii?Q?Tl6hVpD8kk1cnYKPAYQBThVporVcUaB5dN5pb4MX/MWLrK744CKSbfIiynDI?=
 =?us-ascii?Q?ZNU/tKQc5hl9s4zHfoYI8CVxoGpOi7ocu/0COs1tEH6+tMZnPwZquL2qixec?=
 =?us-ascii?Q?I2uO/sdO80Nd/2W3KEK7yygDXoqxDh6Uw3jthO9j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf305eb5-f3cc-4d03-21d8-08dabd5539ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 04:38:16.7367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGY+C3Z09B6Hnxgn2LBhC0VuhTnyzHtDhCSN9+WUnDd3aj4CkUoKzm5xXpvywV/6WM2vfMvrCDA4gIHU9yTA0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, November 1, 2022 8:26 PM
> And this:
>=20
> 	/*
> 	 * If the device does not have
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
> 	 * any domain later attached to it will also not support it. If the cap
> 	 * is set then the iommu_domain eventually attached to the
> device/group
> 	 * must must use a domain with enforce_cache_coherency().
> 	 */

duplicated 'must'
