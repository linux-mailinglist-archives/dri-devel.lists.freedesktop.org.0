Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F175462262B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44AF10E56D;
	Wed,  9 Nov 2022 09:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBA10E2CB;
 Wed,  9 Nov 2022 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667984636; x=1699520636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AVFfYVA6byJTXeAl+GNfjn/nVijtBFEFbLQ/46vYyUM=;
 b=UQuOLI67utu//pMFMqpgNNytjI+sGpNdpZFrKzS8r4oF7NUgIMkPaQxI
 kwfSH+cySc8Tm81MhXWev0wGMI6qB1ONYUGwp0r+NNbuw9n8/f/ysweAk
 hfHbZsuoJA8+aGGvxwHgwnWzTpwnwZ7PlB+pfg59M3zu1LkAF9u+jSbSF
 8T5m8YO82041s4h4838JKG1zVsxGFQuPswW37AoYlEzDppIduSEroLJ/G
 6NqFYNtMlQKkf9jYvLOPRv5Ga9HYl3zUKSXUUHYv+VwmBxwEnnKLA96/e
 KzILBVIjzgaSqrtVlyccGkPu3LTXbR1aqGD7tQXb5VApEslsGyzSVmqJp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="337660052"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="337660052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 01:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="761813312"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="761813312"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 09 Nov 2022 01:03:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 01:03:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 01:03:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 01:03:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 01:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N57VupDUrS/xt7gpyCNNIa0Etfm7j5IEjcmsLagdisX+IZnzj3SFiYJ+VAvwlBLLhhrSq7XUdNbVyPpGcHXZs2uEBZyFW8UY8a+gYnVbwIg9WJfNuR3C1e3SCikmnm+rxvdQa3qOgCAqB3oxyHGgTKVINsVweoXcSGfdc4QSc6H4uHqIepz/Vocm47b8w5N314sSTENCFl0aa5lE2zZq2Z6NM4OMeJMOPKgFjUImEYHdQQLVVAw4FJwR1YU1QBv+sxB2OQTMMyI5qe46H1z90ZvBMWIew0jCIpLN3g6kLT++UeYw/XVY54KojtZekyU+m8uQ98fJFZROP4sWcnXmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMelgAealvD8AKrqwCJz/aFO6bSruPOLNkhIlgEyzk0=;
 b=mzVRMnI4VBTQ8KXHjDQMZqtH1i0XjbZqm66hJzfLv8Y8BYHKoy1hGtH3TKusqqe+QTg93ZEG2f+KYvjOmPKyNYBlx9gK1fRpb3v33SCcNCqK3OGDgVGY/HZ0LXjHZLGFipcV5cGI0dbn9YF9ohivraAB9//X0vn/scdl7uM04eDIeAxE1I3WMxuAJnfPouagbI72EOG7yCXtWIBSumZRUoXZZ5myJ43bDI3yjf+i4/v0evP/NNcM9tOGy/K+2TBKwkU5uBviWhkzwPAUO+Dh+7waHPN8N1KeoEsL1BwFBZBQXPn1emZfS1rcDAhGLTdO0LqKiCe9YBGPAFh7SKHKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 09:03:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:03:52 +0000
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
Subject: RE: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Topic: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Index: AQHY8wx+1dkxGcCaVUCBYAtF8JMX8q42TMwg
Date: Wed, 9 Nov 2022 09:03:52 +0000
Message-ID: <BN9PR11MB5276F10DA6C223B78CA5F2458C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5038:EE_
x-ms-office365-filtering-correlation-id: 03135147-c789-4814-6707-08dac23152f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIjJxqw/oYAZCspyYo39xoYMwnzGqg51Ri5doz6OPIpSVd3QrpF8dv2e5s+8MSAb37wfft8U0GSBsi9L08XgAoQcIRaQvASI9XIS7IcJUEnYR9n9ypNugM2BptF3EunIhCJhzzBTttF9QzbHS3/HT257smgbvw341hGVQHvdqtlITYEa7I0Es4ZgUzlx5UUvK0PafrqPgSKD6bZsfjxg81CiGswmeQHCsLwUWTEFrU4k/I61M/XW1LYGR90ZHfTDm+rxx1hjLYW086mMoCJIkQy2zbiBJm6Pt2hGmWYVskwBsRQ5HRAN4dIhKk3yHjOkHqs5QtPnExJK12zc2C+kAaVsp4j58mBe93+HmwiqEpFvbCTGApBtzKHEw0NBtBXhK2b5Y/uCe8Egb+m36LpORUWl6PyoL6VTOYZtxYtBe2jplVd5dUxgjm7yeTjWnL4IQq0iamr0wTXybjMcEkbSWH1qe1nwzIKXZNv955tDqzrJqcPs1msnaiXWN3K1g1mxrNeRLMOTIKLFjvUf/H4lOKEKJCnJEK2vDxx8Qr6bzF8mut9EEhW9fgBgKoMgCxHrED/SiUZIA+j/zvHHqNWnQ5T6eQBewlWSnvauwQ7mCMENlufks0wvJXjsomFmaDKHBHW5yrV+6Fb2md6AGFSeTdSZ3klZLiLRkHiIvjDZUoJz5PvKhGKtX/3WQTvCrEbFrmfs998F3Jqw6VrqZkfe06jL5m+lAiwTozMMs9gF4fWGAw5hp++gGj+sOBEhcW3WqoZAukBzfJkkCNh+kvPGK2Wfdi1zydgt4+LCwn5bpUyG1onF7rjI2lrc37YV2VSuqIOcEe7zoYzaCZgeSa/Rz/5zJrwXW37+aEAT5USC484=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(7406005)(5660300002)(966005)(7416002)(83380400001)(66446008)(2906002)(316002)(33656002)(76116006)(8676002)(4326008)(54906003)(55016003)(66476007)(66946007)(64756008)(478600001)(66556008)(52536014)(41300700001)(110136005)(6636002)(186003)(71200400001)(8936002)(38100700002)(6506007)(26005)(7696005)(82960400001)(38070700005)(921005)(122000001)(86362001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AHPV5g3+dH0zgBSVEqW7C7+3XudqEjcUmn/eF0iJlal9vD7Lmbn1ppiYh4mL?=
 =?us-ascii?Q?cNKAY/uUYQ3rmyWVbCI+dZYag+/kFHxe3gRKh4RT1EMTsIjCO6lhUrgeyBxt?=
 =?us-ascii?Q?xlXn0IoWSEKFEBEoIycNgV3LpsoiaoDim1uLkNOrv1+jLrXZybqPUM5QdyZU?=
 =?us-ascii?Q?sROtYv7eOvCAJQVo9AtG1jZRArVyrn4sK9BL+6+iOE6UHLJHw6SvCp5nrGQz?=
 =?us-ascii?Q?DtayLnEx1I+g4T4YAXPCaY88br1tHFHLeGoGf2Hjyc2fdj/rU1zaip7kX6nj?=
 =?us-ascii?Q?8fXxH0sLTD63cxNPiMQ9+fAL6zRXzQASqNVXEVmBqljmZCivckSMQhOuRZME?=
 =?us-ascii?Q?Es6GuApYRKTvKIP8yvJmAUEoGxV+arHjSzbBhe97BOPFjCF6rAqqP2e0GSEa?=
 =?us-ascii?Q?eZGbUiinslgLjY/YnglNdfbI/XrkaXP3JrjbyXQ5OzKJRz22a0fw6Uprja2Q?=
 =?us-ascii?Q?gMJYGvY5/2wRjgDL1vJ6qqKwfinVJ0srORPiLi40usyyqjU6CXCjtgjiaDW4?=
 =?us-ascii?Q?9RqBBoC+goqvt0qOAWWQSDjlvKtwBDuZpa6TTpYNcgdVGgBw2N1uBbbXbDxM?=
 =?us-ascii?Q?HBeWJCtaO3Iv0TdkHoVIbONPGi8mYyXv1OxFOXcnV54V6t63wBYwxaGAtXRq?=
 =?us-ascii?Q?6bQ6+7RrbplieAcdYfrebUjjJBr8F8eeCkucM+RF0p9rQW/koqF0kVdhVP5J?=
 =?us-ascii?Q?GCGDptK6R8GIijyTioZeAGj+CYQtL72vDkaBHB/3XB/xUtEEyziHy9wKYYPa?=
 =?us-ascii?Q?UROgeSqF7RSgEQ2OYOzdNtaBOZVyGCfTdgA4EXiI7CkWBcQcr8Qc4UnOk+Tu?=
 =?us-ascii?Q?9F0gDAt5L1DFRWSkBl+BUXScKgtZ3MG2xDr8EmLNgV0xrqmTJ5xBDR8Nj1aj?=
 =?us-ascii?Q?I34pRNersdzUUAuzCPWMwhYqXrTW/lRBAQF/Y4Zt1mBwrZaaBt2ouUL+LNYE?=
 =?us-ascii?Q?BeDpAi76nKV+OUNTQqv5PyzkEf7R5cw06s0MA45tUZGs5PjECQ8CR+RXQP4c?=
 =?us-ascii?Q?4shmwz0eWv1KhdwmapxUGddb3fliPZhWVxuC2wvYtHJHPbARp7ysYuzT4b/C?=
 =?us-ascii?Q?KefcBzqFvhMtbDEfDt6RqN/Y2wCaKCcg8s5A6vkPuPRnxSKSrdS73gXxd+wx?=
 =?us-ascii?Q?Nw6CvdIxBCH3WKpiQDFbVi43F2TlYv6cXWk0r5uZ/LlXoOibcWkiUk/7xZyz?=
 =?us-ascii?Q?0nSGQXd3NAlw9xQtWGrrBQFuyFcxLAXw0EcgO9cE7gZHDPvjo4TRV8hZiuRV?=
 =?us-ascii?Q?rb6lN1igooQsKrpM1oe3j+t784JbGWTU/G/eOq1mf2eyAUswjQd69lx9hPH6?=
 =?us-ascii?Q?Lf5Y/teCCalTfUFyq+4MQICyUrew/Tz8f+rU8M9vnviazrIthzqFP9GB6mUu?=
 =?us-ascii?Q?ntKEGO52W4vk0oZdxfa3Gq/4QwXLxzxpI1FQfNppJhf3/FLc+bN4h6KPAYBr?=
 =?us-ascii?Q?uVl76rOG+pV5NTJ/IQeMFUVftoD+F+Gok7dGPvKbwZPx5tdcaBPLG/OBUgHF?=
 =?us-ascii?Q?nFUv+uNq/FO8EWI0urOG7gNDBRV0zYYlnIvN1k0lUckr5RzmIeC+4MTkerIf?=
 =?us-ascii?Q?S/0o0qhW/ZEn7fSFFmsLzQ5KZTz9fFztNeEFJ0Jb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03135147-c789-4814-6707-08dac23152f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 09:03:52.6837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tVzqAUO0TyHOGSjTMQapTF9Lunb3jhuDOnMXHvF+wedNDye+pW3/Cw6A+bm3cvgCSFrC1GWySHCTwCR76Q2XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

every mail in this series is shown thrice in lore:

https://lore.kernel.org/all/0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.c=
om/

not sure what caused it but it's annoying to check the conversation there.

the iommufd series doesn't have this problem.

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, November 8, 2022 8:53 AM
>=20
> This series provides an alternative container layer for VFIO implemented
> using iommufd. This is optional, if CONFIG_IOMMUFD is not set then it wil=
l
> not be compiled in.
>=20
> At this point iommufd can be injected by passing in a iommfd FD to
> VFIO_GROUP_SET_CONTAINER which will use the VFIO compat layer in
> iommufd
> to obtain the compat IOAS and then connect up all the VFIO drivers as
> appropriate.
>=20
> This is temporary stopping point, a following series will provide a way t=
o
> directly open a VFIO device FD and directly connect it to IOMMUFD using
> native ioctls that can expose the IOMMUFD features like hwpt, future
> vPASID and dynamic attachment.
>=20
> This series, in compat mode, has passed all the qemu tests we have
> available, including the test suites for the Intel GVT mdev. Aside from
> the temporary limitation with P2P memory this is belived to be fully
> compatible with VFIO.
>=20
> This is on github:
> https://github.com/jgunthorpe/linux/commits/vfio_iommufd
>=20
> It requires the iommufd series:
>=20
> https://lore.kernel.org/r/0-v4-0de2f6c78ed0+9d1-iommufd_jgg@nvidia.com
>=20
> v2:
>  - Rebase to v6.1-rc3, v4 iommufd series
>  - Fixup comments and commit messages from list remarks
>  - Fix leaking of the iommufd for mdevs
>  - New patch to fix vfio modaliases when vfio container is disabled
>  - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
>    to signal that iommufd is providing this
> v1: https://lore.kernel.org/r/0-v1-4991695894d8+211-
> vfio_iommufd_jgg@nvidia.com
>=20
> Jason Gunthorpe (11):
>   vfio: Move vfio_device driver open/close code to a function
>   vfio: Move vfio_device_assign_container() into
>     vfio_device_first_open()
>   vfio: Rename vfio_device_assign/unassign_container()
>   vfio: Move storage of allow_unsafe_interrupts to vfio_main.c
>   vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
>     vfio_file_enforced_coherent()
>   vfio-iommufd: Allow iommufd to be used in place of a container fd
>   vfio-iommufd: Support iommufd for physical VFIO devices
>   vfio-iommufd: Support iommufd for emulated VFIO devices
>   vfio: Move container related MODULE_ALIAS statements into container.c
>   vfio: Make vfio_container optionally compiled
>   iommufd: Allow iommufd to supply /dev/vfio/vfio
>=20
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |   3 +
>  drivers/iommu/iommufd/Kconfig                 |  12 +
>  drivers/iommu/iommufd/main.c                  |  36 ++
>  drivers/s390/cio/vfio_ccw_ops.c               |   3 +
>  drivers/s390/crypto/vfio_ap_ops.c             |   3 +
>  drivers/vfio/Kconfig                          |  36 +-
>  drivers/vfio/Makefile                         |   5 +-
>  drivers/vfio/container.c                      | 141 ++------
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   3 +
>  drivers/vfio/iommufd.c                        | 157 ++++++++
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   6 +
>  drivers/vfio/pci/mlx5/main.c                  |   3 +
>  drivers/vfio/pci/vfio_pci.c                   |   3 +
>  drivers/vfio/platform/vfio_amba.c             |   3 +
>  drivers/vfio/platform/vfio_platform.c         |   3 +
>  drivers/vfio/vfio.h                           | 100 +++++-
>  drivers/vfio/vfio_iommu_type1.c               |   5 +-
>  drivers/vfio/vfio_main.c                      | 338 ++++++++++++++----
>  include/linux/vfio.h                          |  39 ++
>  19 files changed, 700 insertions(+), 199 deletions(-)
>  create mode 100644 drivers/vfio/iommufd.c
>=20
>=20
> base-commit: ca3067007d4f2aa7f3a5375bd256839e08a09453
> --
> 2.38.1

