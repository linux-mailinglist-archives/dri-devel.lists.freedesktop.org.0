Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC2614522
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 08:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D2D10E0CA;
	Tue,  1 Nov 2022 07:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2201A10E0CA;
 Tue,  1 Nov 2022 07:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667288332; x=1698824332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Udif8Cn0kYCAj7ntuO75oTkb/Roy9Tfo9oUyKu65ng=;
 b=Bx+w/X33OH9m6J8GT7D/65/IPlyeJG44gLsxa2OliihQvNS7SycqIPEh
 9Q48CzJ/dOwC87ZQZYvdy0QYBXeozEWdIOoaTJbDjvufseJfRdRKw3sYu
 vdjte4I83fxp2/wyCq/sqxjyDb53IakZq4YWP1kLMZm8P2ai33vZMQ/x+
 SijO2RnT1UOADLTbVgl9ljJglyYjBnjghD9TcxKhrSXdNtE4P9dQ28V9C
 c+ltGt/DJVnZvQ/mzu1cpQvBrZYmiok8Axy3fvD9tTvMfYyhbtig6GM5q
 5JKQqQTHvqx1qi+MERr8WQI58XEZ3yKE8BuPk9JMCz4wvu0gLFnYkLiam g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="289477242"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="289477242"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 00:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="633798717"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="633798717"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 01 Nov 2022 00:38:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:38:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:38:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 00:38:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 00:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NywA23WB+CswpI4n7OBZ2qSdHpr309WTciTztr7o+WeLYfCg0AlFoiwUydSRG7TDOMLajne+2XMf4yiDVCqG00BrGbODJ4Xjt/1qg6Y1H6GKs4u1lXEikhzWNNym+eOV8TONc56sCjkvUfjSlN+bkOxvu02ZPIdoGC/ZpqfPl6CVhKQ5IEqK/3Jd2xSFXlGUDlBzNGwftZd+cZiEUaaKe/4at3tUyPHejjhQbPCkbucGCVZAut9VNy2Sg/q/GwXpwDUiGzuKMctlKVnILLJY+5xx0CXxlZ+CL4XeqiftzmAtI1QRmJjBm3GpDX9MF3scLqpB21+PzFgZMbIQV6Xgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb0rCQiQ8YNY/3epOEE1bYVvaqS15+nUuWcs9zO26lA=;
 b=FObNm8Rum1YAjY5J77OzIJf7buV7ZpeaKV9KFqOflZcMB3SzwDc47G1mkKzS6OtuF9/c+D0Xo5gcyd49eTKBVzy2a0nqQ/rPEoMGbU0yr7+LNvrHOdHZPtpyzwYD/QPr89RVv7TWDZKxRCrN4rJrsnAcYBRDNgjv9ICOHqwthbrVM1XFu3KA3q87haNA8lNWI61vtBB7sdbttsMfr95vXAvyeh5DfrtcaFyBbbNcGPZMKZXdIlXG/eTB+9ac96HR5M4V7TLrDS2vwxsMfbqGbX059YEfDZE0Tetmvq3BJm7bTxsgFusztwfb/BL6DTnU19MWkXqFW4l5irYtTVilZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 07:38:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 07:38:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Diana Craciun
 <diana.craciun@oss.nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, "Matthew
 Rosato" <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Robin Murphy
 <robin.murphy@arm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Thread-Topic: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Thread-Index: AQHY6J4OZI6/AUkjGE6GW5b3OnsydK4puA6Q
Date: Tue, 1 Nov 2022 07:38:47 +0000
Message-ID: <BN9PR11MB527665C826A0CBB68EAFC6588C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB6854:EE_
x-ms-office365-filtering-correlation-id: 4200e6c9-3f8b-493f-f645-08dabbdc1c98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w1xZiu+tRsyMXMzVFWV0Uije0xA9bWDIZ23OUykLc0GlhMXmbK6ufRF/r//K7MtWtY1keEvREwBR3Brokfc4CWSXoEXZ/sP/6BXRe8Pt45xyMEdxpeVG/QNo4DjdMp69Xf3rR23p7yPShdlFUjt2QIJqpFjpAI/iPcOy5+cbPAa5h5RHHFWKASZn68yjp8J3/dZTnaxMW1np0sYw3HpgrC7x1fUQ6i7LxWO7RkvcgTyXVhIZV6aRNoDWFTwf16fe1aBYsSKbG0cwrGGe8qkZh8XRvDXQUoU4IKDX1lyyDVVAPUUk0piCXHIKJPbCZcHvpko5+5x+tBdeFX0735QXHfKmugn8XCgNSKC7UM0VJJ8vAHsTWgVGJ3MPWLazDMBZUtVFTEqsc0t/p5aEWW6PhHvP2XMrW63EHgc3H5EWxIz40o0JpMmw2B2KgxGnkz6o88vzcVochoXbesRXbfCgOwvSKBoOf1LV96E7GNc72uxhs38bd6gVeNbcpoGfVh0/Efd/yz6diTHxt0S/XEHccBlCyXTil5BYG+R8+8tyO4brdY2ULJUJ/0RpPjM6lTv8EdCWRriRdkeHfpb0/d9loVnrIBXWUCW4EY+glAOAmHC+tNggjf9zVsUN3rpx/A1VkvrePPT1bg1eH5agnp4qLauGCDoyWSMZ1azRsmB2yBiS4DpjfG4kbcEFmfI7a7i6fPYY/dQQUmga9t9kSAoW2iHFFW5dDEJy/8bMa4zxm73rxLQUtZQ3SzilwAtWnCniJ9aMm0g9fVqvSH/QJclc90H9qoIv0aUzUpjMHhCzrEk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(38100700002)(33656002)(558084003)(55016003)(6506007)(71200400001)(2906002)(7416002)(921005)(122000001)(38070700005)(82960400001)(86362001)(186003)(64756008)(9686003)(26005)(316002)(4326008)(41300700001)(66556008)(478600001)(7696005)(7406005)(66946007)(6636002)(5660300002)(66476007)(110136005)(8936002)(52536014)(66446008)(54906003)(8676002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lw7dxa30hBAjE4KDoBIEizAzcAToiJROPFhZ9aLU4bUicUjzLiL1YxgiOP/f?=
 =?us-ascii?Q?kMD+gEAJAbuab1T4/APAP5FQ3udg+yG54xyZSQRVbE5FI2y3sHKeEh/QFATq?=
 =?us-ascii?Q?tYZGqXfmzZDOxsldfjX//fTSdMdeRLfAGOFl1YiP3rKykI2LHDQ8oy/NVD73?=
 =?us-ascii?Q?cFsF68I4EWtRpX1EYWzXRW0VVf52H3EEphsLaJ1SSl/Y89jTE/MsKYBxzB3r?=
 =?us-ascii?Q?Q544mDPOlBFAjBSgHUgwQD9kzxP4irXejyUHrj9AcBXX6IcYzAR2QRf2TTxW?=
 =?us-ascii?Q?qaNQLgLxb+lyeBOt/PiZC+MheWYNhY0mCqn4yw6fsJQsuzmeL6jH7G7eOtyu?=
 =?us-ascii?Q?ccqE4vIypxmKOkB5ucW8kZQU7SEXbXSlGck3PQKMFonbeK+iMNCB8EfMCzrO?=
 =?us-ascii?Q?QUOO1hgpAR0b7WLGNpNugA27RbRRl97qT3Axek3i9Vr2JA18u9DKNBf3XgjK?=
 =?us-ascii?Q?VFWiJ889jrwDe2lSe2cgW088jwDxGEL/3zuhSRZ8OnItUCigsiwLc35kRnGm?=
 =?us-ascii?Q?7F8Y+s5grLSlr7NJ+VOprI2aZ06a8TfRaB84Z5kdix5ilFa7plEAxlk3Rv6c?=
 =?us-ascii?Q?yTZh/onurJdfr0c1BbFZJF+vxPqjp55NY9C20S22hBFypF7wf63/GCDHQ6EX?=
 =?us-ascii?Q?Px9Bl70pYoJeSQTkcAU3wx5ZqPYxCClLf/2Ue+KpNy4hhQ1UeCLNRHq8MC5V?=
 =?us-ascii?Q?8dqALnBvDzY6Y/a0er0KZdnPuBWRNuNspsJNF8GOA7RCvsDXzxlMZ1YKik7a?=
 =?us-ascii?Q?d6tNpDjf3zNjx8sGRKHGMWLurICi4XZQmSrMmgUcOtrLIK34yzJJlBA/eZ3A?=
 =?us-ascii?Q?DvoA3DFY0n/sd1jI+8Ngzft+/AB61zRayxjnn0/on5nYEheleh0e4q4Wbs0W?=
 =?us-ascii?Q?wJpla6xaMHDKu9ElViCApdhHOtgkgbhPi1Bo5/tP8R9ggPiFUDtLq/AiNjw7?=
 =?us-ascii?Q?fwpzsU5p9PHRrRuLMEdyqko2+oCusoJL7jTNmACaGEhH4CWarksvagcHB34U?=
 =?us-ascii?Q?36fcJPCY33gnipBAp34XTPNtBrG2fBIxFW9x43/BZvqSWgnfuk7ZsA4FR6In?=
 =?us-ascii?Q?qbhNbKlgl4doD9JBuXIRkm/vwkZtMQeNxZjuBjqbu0UVZ0PbI5rTi989SYSf?=
 =?us-ascii?Q?bUXCA3ONdUiyWPRSBJIubT4kUzu/x1zTkAjkrMpUiF2KsdmS0+Nmb0kIeWf2?=
 =?us-ascii?Q?1fzjcRX34bqVch9fzSpEEb9vhtYKbLssxBEFNup1GhFs+KksEt58kfoXcM49?=
 =?us-ascii?Q?fasRbBRz1c0vytu8aGs0BTELvkg3Yo/0UtvFb3kRj6YtK6Yaj6Be7U7MXgjl?=
 =?us-ascii?Q?IdzWlj7OojutDvU4SHBOzqECuf94du6OqgMjuSfoMkaerDERV9qbl5CgZ+pL?=
 =?us-ascii?Q?29lBRbUCPHB9a+kSO6ro2r0ZbeyR9z7mDBhY+4RWk3aMG3xrbdQ0CK6uEAMD?=
 =?us-ascii?Q?ocgijE22ychNJmsHpO+oTyTCGyVPvjJ+L+76Y0lqM99RqgpQuYPzaHPZ9cEo?=
 =?us-ascii?Q?IQ29EaWsiehq7dnUzEhFwE8HhVfFcu8KRSvRcjDKUlqXlvvOtxTI2YgFTKC9?=
 =?us-ascii?Q?p7qXk2HIM3Nd9aErLAFvI/G+/mRFLor7oPg3KD+N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4200e6c9-3f8b-493f-f645-08dabbdc1c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 07:38:47.2707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxOpxA6eKzG/ZtTKICQXQufG8aWwm7yFgv4wNf5uPKsQCJd5DTEOBEGphrUB141Bca0PQx+vGdOHm3vako2v6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, October 26, 2022 2:17 AM
>=20
> +err_container:
> +	vfio_device_unassign_container(device);
>  err_module_put:
>  	device->kvm =3D NULL;

err_module_put should be moved after nullifying device->kvm.

otherwise it looks good to me:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
