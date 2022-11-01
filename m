Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8D614541
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 08:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE710E1A9;
	Tue,  1 Nov 2022 07:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E9710E1A9;
 Tue,  1 Nov 2022 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667289159; x=1698825159;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3pdjPM4ceN2QgTsbxhgGpzkXUO2hmI3a0XSQ3A/KZc=;
 b=TaSgx22Z7ZEKl7Gmisx6qkBDAkEAhU/yx2lODw55XrBfXELYlZ7W8KE1
 OEE/qidcp7/lIB2etWsFqKRKnJbsZe/LR3ecGz6NmogJn4vknwXzWnjbR
 Ylb6eoU+nPRQSRte3mx3cw4hFOzwnuW29ezRKBE+iAbgd7om/qsqXYfut
 IgMskvCM7W72SJvAu++TEdgiKLg2ThEEFM6qWpgfvqO1wkCHq8lz6x77J
 saQQPmdvApVUDAwgARY1MRXDQtCAeHX4B2g32jjxOewpyR3ZbyZXSkbTL
 MF2d+PyymU1z9UxCUaQOFm9ndGNJ3pylH7H4aI0lN33JwjYF3C68eo9wR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="309086894"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="309086894"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 00:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="739248245"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="739248245"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2022 00:52:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:52:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 00:52:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 00:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/hj1bMtwPLJPWLXf/qfhID89or3HwRtfDkDW0+Qi6iPPbg00tjxn4xa8SRbmjxbERG6qHKWlQKTeiXN99BDaeUeCw2Ieg8gOrmYzGl62aRHQWWmwG+eIIZgCqN2FgKwX4DFi+Shi3dh3HPI06PuhOXAylJ6iufBUd3uAdTbgnPCteCZQulVxZBah4Y9GdUstnPX/fx+eHh7bOlYog1q0DQEaSnoRcx6dId6H3+OJJFzbrN1q2WRAy3tIj+/T1SLcRXKPkI2W1JTUXvBxEhw8pE01sPWUqx0OROuU45uNYN7AOn1b4P0f0hUYnY+Rxcd3w/cU/E/OMS68iO7HDZqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoA1xBvFbgvsCpe1IErrG0ee4chJaeAbHKiJBmlltgo=;
 b=N3A3ci77skxkE9xK4661hUSIAlVQCX+HEMN82SSmC1rRr8kJQtB2Sg2Nnf3B6A0slNlIumhLTCuD6FnfJOf+ksgHfMkA2eTfAMNWuiPNDKSNdZfxmsQR0C8jrTCdCYQZpQbcVyfaLe+rV4tf2rQrBodcS3RKvU38N7Q88Bea06Q52/odyFSabUpnj5oJA1WP5MiI8fAbTvdMtOtocaK16aBE2FpZh/bOiHHZM41Q20fplvUeck5DLDZc1imbt+hdmtJmcBjdqjg4ApTEpAs3SSljRZ4aqBPP84ignN/Y31TG/NYlS33KwjKgKIene/tncTJH1xGzU+HR2y3JQeY7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 07:52:24 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 07:52:23 +0000
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
Subject: RE: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Topic: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Thread-Index: AQHY6J4OIe2WwX1TpkuArkGmC4dhx64pufEQ
Date: Tue, 1 Nov 2022 07:52:23 +0000
Message-ID: <BN9PR11MB52766FB4EFCFB2197ACDC1F98C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA2PR11MB5018:EE_
x-ms-office365-filtering-correlation-id: c152226c-2feb-463d-23c7-08dabbde034b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Gq9Qc/FAHGzX0EWAPiV4T/T5p8l+2YOHhm0fT2vDlCqHWqQISzcF4qFxeRCxjsHXxt82mzCQDlqev1c4YHMcEObT9jPauksJ3yrOzb2du09yf/quTP/nX4mqYAja3N1QLfaRNUPO1VxrCzxgOemocVAFdRK9AB9SXTf7XK9g2egWcbafnS4TzOQeVEuwe6oQo9tkMXHbxhBwn+trMRRLpAvNen5IQXjYA8SPiqNx3mJfORpw7rqe6SOenItFG28RKlB6H4QpLEuiSUxpeqJuLwddENuac8bSsvthiwLeYVTIJyppy3mtrR1wbMaZ+BE4GF60LTxU/kPWSdLZ93WvdlsPhqZMixt3seH2pvYn13iEM1pxAM2Q4+MGwfV3t7hnG8aLTZ4E4Aa0qPX37gRKb/DUa3/hz4Pc3FSAxBQOkbZ75IgX5FiZoe7EwuBopugbmSXgzdrnbLnu2N2cqsHOwu+QtcYMCNr2+unWyucTAil14iVr1gJ+POChvGSzM2NF1PCszyQQCn+WBOK9CPBuEXwUmmkxN8r7dcMnQ+ngpvca7fVW7skJQtWDZCqFlAo8sEZjs3rSEYeb5YECT5aShHygiCScXZMWSYZjB7z7sVhrk5P+PxVd9HMfRkrAOOCAeYoNoQ3WvRMd+de+XLEJfZZgmzRgyF8e0R47FhDst1O/fFE00nybFunVIsE/9DVN0OedhLDhAiFuDA8w3ksYBsiB137iZspfVHwbMpypgbX7NXceN4LMvlfZTvmU5XGWVY1szhsz5AFB51Qq72iPIvOriUx8INufJqhZ9ylIWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(83380400001)(2906002)(26005)(186003)(7416002)(9686003)(5660300002)(122000001)(33656002)(41300700001)(7406005)(921005)(55016003)(52536014)(8936002)(86362001)(82960400001)(38070700005)(38100700002)(8676002)(110136005)(4326008)(54906003)(6636002)(66476007)(316002)(76116006)(64756008)(66446008)(7696005)(66556008)(66946007)(6506007)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CMzSexoeFTFPZs7Ra2/remjl04u9tOFAzhCr0blQiZ7f3MLAj1NViqVyb7Nz?=
 =?us-ascii?Q?7viQIBskVpHeAX613IS/6l9KUKmwqoVvEQDyr6POWk9l9eZJpeh1gDwkcSxX?=
 =?us-ascii?Q?d1f7G5YaDwt+C0DwvRWtZo7NGgYPc0YP7NCnGePnan+FzNYJ2ePu6mXFAa6m?=
 =?us-ascii?Q?tiIQ6l0nuDYUYxtn5m3l6kscNbM61UnpuSBbb18NzJXd8GirZY5jwj4CKOLK?=
 =?us-ascii?Q?XNuBQv+JGJibTgzTZCRTPQeCMj/EJ59hQWNt1Kr9zkpHqsDJ0+HPyfCm1Uzz?=
 =?us-ascii?Q?MyNmuMpFNqapCTpoJaM7Hqe6RtVFqPSx+rRq3Fvp25px0/5CRRms+/CIKL2t?=
 =?us-ascii?Q?LOpfgQ2dlIBLsXvR9FuCrChjC50eq3eAEnP5letcubCTDRbs3oNlU0+bh24M?=
 =?us-ascii?Q?uW/AGpWnX5DumRbNvMuygbgqNySX3sa5AkUIUQ5K1mpzLGOArc3m8vHYP4kn?=
 =?us-ascii?Q?Xy27gXKTqeTHf2HRx/GayMP/J9a8vwYRICsm5cZyfInIpNoTPZyOzxbmFN4E?=
 =?us-ascii?Q?VGfeNmk81V+e5zZjE1nTugLT7yoUFkhcbTeuFTCr4ESh/BVfc8q0WVVI3nuQ?=
 =?us-ascii?Q?oDo5dGSHiZ9H0pfSHpi5CtElb0U2g274pCUY/dY+pbLXoAOT0mLDsUJkOlLn?=
 =?us-ascii?Q?CvEEuLJa7wP/YxO0LKpMhxJP74oXv+84IJu9gAzC8Kuvr81bL1SHKzncQUwm?=
 =?us-ascii?Q?2Iuc0Xm64sycWHqd4CmEbuVdhQ5wcX7C5F5c8Gc7CqIA3feq57kLesEWraUi?=
 =?us-ascii?Q?9S4BTjM2NVnN8dBSqcORZy2tRsjkB3W+GQx9eb8Rvb6X6LqUObQjE6NRxAO4?=
 =?us-ascii?Q?ZACkIrPHJSlHBwf6H72G9vOFf7u8HjOLiUT3YlKISfMp61K3I0MUDp2mG/ul?=
 =?us-ascii?Q?3VWESRvYneXHb6rrOBNLsed9BJsBYyNseJgEczAof95+JBhQqtqw6n3TVwwg?=
 =?us-ascii?Q?fbPu16OcdJ/YJJF2F7epf4jJGx0B6L82hEN34Al13G6C/KDLd1ZnPFi+uhix?=
 =?us-ascii?Q?hZiPxOVHhlky58qacZCusKlqahfEUhhgQ/MnfZc2+AXcBE/4O//NZ+kHRX8V?=
 =?us-ascii?Q?Fyko5oNWkp36REMhqZh714HNNBj2lZS3jEg4OJU1tL3wYusvyzjM6FhY7gYg?=
 =?us-ascii?Q?RuJWZwzNdJptURcQcaXUZvY63yLphfJTei/ngLnFJrSqN6EV9VMD+ee6ydwj?=
 =?us-ascii?Q?j65Rk/sWtdvzkUsueryhnT+GyjIBrv0oPskaLCY8NDcuNo2sT7BE8/V1sRv6?=
 =?us-ascii?Q?HOCKxNNd3ly1Hk7XTbht/1UTdVM6DsHCt5/W0yVYrswbFCN6VYbD8ZIEDVJe?=
 =?us-ascii?Q?PAGKlY4eqR7PZdnCjDxZHnrnNl8JXpJtu8t2fk8dOXJaIqCqEsBLJNn2BM/l?=
 =?us-ascii?Q?vz3jyC+Fdwyeg4aERoeCIfLr02YjYNLaTgsJjtRfTK7JRm6Q1gJdYSNXMlHi?=
 =?us-ascii?Q?95V4lLrFI/zZIV//47HJj3CnZehFihrmpGOUVeAYTvYtyJXk0DqD2OcN6ygD?=
 =?us-ascii?Q?IkGJlNQEaC/1hXJBkieCFpsigd6KMSybXNfXuEPKslnAWOQf+xTudlYfl0oz?=
 =?us-ascii?Q?6mk8NOhxQ3ehuZjkmS7maMgp15H4CwnSEMcEG4v2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c152226c-2feb-463d-23c7-08dabbde034b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 07:52:23.8423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqJB0UimnOfJkSz3nXSy4iiKDC38e/Wr8/4Bo9iJuPj7iXB2YfO8kjK2SpK6nMxMTg0MFNE34Ye9odrWJ3l/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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
> iommufd doesn't establish the iommu_domains until after the device FD is
> opened, even if the container has been set. This design is part of moving
> away from the group centric iommu APIs.
>=20
> This is fine, except that the normal sequence of establishing the kvm
> wbindv won't work:

wbindv -> wbinvd

>=20
>    group =3D open("/dev/vfio/XX")
>    ioctl(group, VFIO_GROUP_SET_CONTAINER)
>    ioctl(kvm, KVM_DEV_VFIO_GROUP_ADD)
>    ioctl(group, VFIO_GROUP_GET_DEVICE_FD)
>=20
> As the domains don't start existing until GET_DEVICE_FD. Further,
> GET_DEVICE_FD requires that KVM_DEV_VFIO_GROUP_ADD already be
> done as that
> is what sets the group->kvm and thus device->kvm for the driver to use
> during open.
>=20
> Now that we have device centric cap ops and the new
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY we know what the
> iommu_domain will be
> capable of without having to create it. Use this to compute

it's worth noting that the prerequisite is that vfio always enforces
cache coherency on a domain according to the iommu capability
of the devices attached to that domain. There is no mix of attaching
a device supporting the cap to a domain which doesn't enforce
coherency. With that we know what the domain will be w/o having
to create it.

> vfio_file_enforced_coherent() and resolve the ordering problems.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/container.c |  5 +++--
>  drivers/vfio/vfio.h      |  2 --
>  drivers/vfio/vfio_main.c | 27 ++++++++++++++-------------
>  3 files changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index 499777930b08fa..d97747dfb05d02 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -188,8 +188,9 @@ void vfio_device_container_unregister(struct
> vfio_device *device)
>  			device->group->container->iommu_data, device);
>  }
>=20
> -long vfio_container_ioctl_check_extension(struct vfio_container *contain=
er,
> -					  unsigned long arg)
> +static long
> +vfio_container_ioctl_check_extension(struct vfio_container *container,
> +				     unsigned long arg)
>  {
>  	struct vfio_iommu_driver *driver;
>  	long ret =3D 0;
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 54e5a8e0834ccb..247590334e14b0 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -119,8 +119,6 @@ int vfio_container_attach_group(struct
> vfio_container *container,
>  void vfio_group_detach_container(struct vfio_group *group);
>  void vfio_device_container_register(struct vfio_device *device);
>  void vfio_device_container_unregister(struct vfio_device *device);
> -long vfio_container_ioctl_check_extension(struct vfio_container *contain=
er,
> -					  unsigned long arg);
>  int __init vfio_container_init(void);
>  void vfio_container_cleanup(void);
>=20
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 1e414b2c48a511..a8d1fbfcc3ddad 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1625,24 +1625,25 @@ EXPORT_SYMBOL_GPL(vfio_file_is_group);
>  bool vfio_file_enforced_coherent(struct file *file)
>  {
>  	struct vfio_group *group =3D file->private_data;
> -	bool ret;
> +	struct vfio_device *device;
> +	bool ret =3D true;
>=20
>  	if (!vfio_file_is_group(file))
>  		return true;
>=20
> -	mutex_lock(&group->group_lock);
> -	if (group->container) {
> -		ret =3D vfio_container_ioctl_check_extension(group->container,
> -
> VFIO_DMA_CC_IOMMU);
> -	} else {
> -		/*
> -		 * Since the coherency state is determined only once a
> container
> -		 * is attached the user must do so before they can prove they
> -		 * have permission.
> -		 */
> -		ret =3D true;
> +	/*
> +	 * If the device does not have
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
> +	 * any domain later attached to it will also not support it.
> +	 */

also add the other part i.e. if the device does have the cap then any domai=
n
later attached to it will have the cap enabled. Only with both clarified
we can safely use the device cap here.

> +	mutex_lock(&group->device_lock);
> +	list_for_each_entry(device, &group->device_list, group_next) {
> +		if (!device_iommu_capable(device->dev,
> +
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY)) {
> +			ret =3D false;
> +			break;
> +		}
>  	}
> -	mutex_unlock(&group->group_lock);
> +	mutex_unlock(&group->device_lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
> --
> 2.38.0
>=20

